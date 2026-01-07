;==============================================================================
; Dragon Quest III - Bank $4E
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $E70000-$E77FFF
; Instructions: 8464
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_4E"

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_000
; Address: $E78000
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_000:
	JSR $40DF			; 20 DF 40 | Jump to subroutine
	TXA				  ; 8A | Transfer X register to accumulator
	SBC $7F00,X		  ; FD 00 7F | Subtract with carry (absolute,X)
	BPL $6F			  ; 10 6F | Branch if positive
	BIT $3F			  ; 24 3F | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $A0			  ; 80 A0 | Branch always
	WDM #$BF			 ; 42 BF | Reserved instruction
	ORA $FB			  ; 05 FB | Logical OR with accumulator (zero page)
	BIT $FA			  ; 24 FA | Test bits in accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	TXA				  ; 8A | Transfer X register to accumulator
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_001
; Address: $E7802E
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_001:
	JSR $00FC			; 20 FC 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDA $E7BD,X		  ; BD BD E7 | Read graphics status
	STA ($42,X)		  ; 81 42 | Hardware register operation
	WDM #$66			 ; 42 66 | Reserved instruction
	ROR $185A,X		  ; 7E 5A 18 | Rotate right (absolute,X)
	ROR $FFFF,X		  ; 7E FF FF | Rotate right (absolute,X)
	LDA $E742,X		  ; BD 42 E7 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ROR $99			  ; 66 99 | Rotate right (zero page)
	ROR $99			  ; 66 99 | Rotate right (zero page)
	PHY				  ; 5A | Push Y register to stack
	LDA $7E			  ; A5 7E | Read graphics status
	STA ($B0,X)		  ; 81 B0 | Update graphics data
	LDA ($9F),Y		  ; B1 9F | Read graphics status
	STA $A5B5			; 8D B5 A5 | Update graphics data
	LDA $9F			  ; A5 9F | Read graphics status
	STA $B1B0			; 8D B0 B1 | Update graphics data
	BCS $4F			  ; B0 4F | Branch if carry set
	STA				  ; 9F 60 BD 42 | Update graphics data
	JMP $BD5CA3		  ; 5C A3 5C BD | Jump to address long
	WDM #$9F			 ; 42 9F | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_002
; Address: $E7807E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_002:
	BCS $4F			  ; B0 4F | Branch if carry set
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $19			  ; 05 19 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	ADC ($2C),Y		  ; 71 2C | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_003
; Address: $E7808E
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_003:
	BVS $2E			  ; 70 2E | Branch if overflow set
	BIT $2F00			; 2C 00 2F | Test bits in accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CLI				  ; 58 | Clear interrupt disable flag
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	BCS $A0			  ; B0 A0 | Branch if carry set
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $20			  ; 70 20 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	STA $7D8D			; 8D 8D 7D | Update graphics data
	ADC $5158,X		  ; 7D 58 51 | Add with carry (absolute,X)
	ADC $DDE5,X		  ; 7D E5 DD | Add with carry (absolute,X)
	CMP $01DD,X		  ; DD DD 01 | Compare accumulator (absolute,X)
	ORA ($DF,X)		  ; 01 DF | Logical OR with accumulator ((zero page,X))
	STA $7D62,X		  ; 9D 62 7D | Update graphics data
	CLI				  ; 58 | Clear interrupt disable flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC $1A			  ; E5 1A | Subtract with carry (zero page)
	CMP $0122,X		  ; DD 22 01 | Compare accumulator (absolute,X)
	INC $20DF,X		  ; FE DF 20 | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	ASL $17A0,X		  ; 1E A0 17 | Arithmetic shift left (absolute,X)
	LDX $B91C			; AE 1C B9 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_004
; Address: $E78129
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_004:
	JSL $EF2C87		  ; 22 87 2C EF | Jump to subroutine long
	BIT $449A			; 2C 9A 44 | Test bits in accumulator (absolute)
	CPX $FD00			; EC 00 FD | Compare X register (absolute)
	CMP $0A11			; CD 11 0A | Compare accumulator (absolute)
	DEY				  ; 88 | Decrement Y register
	BVS $46			  ; 70 46 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	DEC $8728			; CE 28 87 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_005
; Address: $E7814B
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_005:
	JMP $A6429F		  ; 5C 9F 42 A6 | Jump to address long
	CLI				  ; 58 | Clear interrupt disable flag
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SBC $F300,X		  ; FD 00 F3 | Subtract with carry (absolute,X)
	ROL $3EE4			; 2E E4 3E | Rotate left (absolute)
	DEX				  ; CA | Decrement X register
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP ($FEB4)		  ; 6C B4 FE | Jump to address (absolute indirect)
	DEC $26FC			; CE FC 26 | Decrement (absolute)
	INY				  ; C8 | Increment Y register
	ROR $FE00,X		  ; 7E 00 FE | Rotate right (absolute,X)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_006
; Address: $E78177
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_006:
	JSR $08F6			; 20 F6 08 | Jump to subroutine
	DEC $EE20,X		  ; DE 20 EE | Decrement (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_008
; Address: $E7818E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_008:
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 01 00 07 | Read graphics status
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_009
; Address: $E78196
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_009:
	JSR $4000			; 20 00 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STY $00			  ; 84 00 | Store Y register to zero page
	REP #$42			 ; C2 42 | Hardware register operation
	CMP $40			  ; C5 40 | Compare accumulator (zero page)
	STA $00			  ; 85 00 | Update graphics data
	STA $00			  ; 85 00 | Update graphics data
	STA $40C50A		  ; 8F 0A C5 40 | Update graphics data
	CMP $40			  ; C5 40 | Compare accumulator (zero page)
	LDA $BF00,X		  ; BD 00 BF | Read graphics status
	LDA				  ; BF 00 BF 00 | Read graphics status
	PHX				  ; DA | Push X register to stack
	EOR ($E3,X)		  ; 41 E3 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_00A
; Address: $E781C3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_00A:
	JSR $043C			; 20 3C 04 | Jump to subroutine
	LDA $8708			; AD 08 87 | Read graphics status
	ORA $8601			; 0D 01 86 | Logical OR with accumulator (absolute)
	STY $FB			  ; 84 FB | Store Y register to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_00B
; Address: $E781D0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_00B:
	LDA				  ; BF 00 DF 00 | Read graphics status
	SBC $FE00,X		  ; FD 00 FE | Subtract with carry (absolute,X)
	STA				  ; 9F 00 B4 44 | Update graphics data
	LDY $5A			  ; A4 5A | Load from zero page into Y register
	LDA ($5D,X)		  ; A1 5D | Read graphics status
	LDY #$54			 ; A0 54 | Load immediate value into Y register
	LDY #$4A			 ; A0 4A | Load immediate value into Y register
	LDA ($25),Y		  ; B1 25 | Read graphics status

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_00C
; Address: $E781ED
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_00C:
	EOR $5924,Y		  ; 59 24 59 | Exclusive OR with accumulator (absolute,Y)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	ORA #$FE			 ; 09 FE | Logical OR with accumulator (immediate)
	ASL $5BE0			; 0E E0 5B | Arithmetic shift left (absolute)
	LDA $5A83,Y		  ; B9 83 5A | Read graphics status
	CMP $81AE			; CD AE 81 | Compare accumulator (absolute)
	STA $0EF1,Y		  ; 99 F1 0E | Update graphics data
	INC $00			  ; E6 00 | Increment (zero page)
	SBC $F500,X		  ; FD 00 F5 | Subtract with carry (absolute,X)
	ROR $E000,X		  ; 7E 00 E0 | Game work RAM access
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_00D
; Address: $E78227
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_00D:
	STA				  ; 9F 60 DF 50 | Update graphics data
	LDA $37A679		  ; AF 79 A6 37 | Read graphics status
	BVC $80			  ; 50 80 | Branch if overflow clear
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ROR $4000			; 6E 00 40 | Rotate right (absolute)
	LDA				  ; BF 40 BF 40 | Read graphics status
	LDA				  ; BF 40 BF 40 | Read graphics status
	LDA				  ; BF 20 DF 60 | Read graphics status
	BVC $AF			  ; 50 AF | Branch if overflow clear
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA $8608			; 8D 08 86 | Update graphics data
	INY				  ; C8 | Increment Y register
	PHA				  ; 48 | Push accumulator to stack
	PHB				  ; 8B | Push data bank register to stack
	XBA				  ; EB | Exchange accumulator bytes
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_00E
; Address: $E7826C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_00E:
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	PEA #$9400		   ; F4 00 94 | Push effective address to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	TSX				  ; BA | Transfer stack pointer to X register
	TSX				  ; BA | Transfer stack pointer to X register
	SBC $FE00,X		  ; FD 00 FE | Subtract with carry (absolute,X)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_00F
; Address: $E782A1
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_00F:
	PLP				  ; 28 | Pull processor status from stack
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	AND $14			  ; 25 14 | Logical AND with accumulator (zero page)
	BIT $15			  ; 24 15 | Test bits in accumulator (zero page)
	BIT $17			  ; 24 17 | Test bits in accumulator (zero page)
	AND $14			  ; 25 14 | Logical AND with accumulator (zero page)
	AND $3F			  ; 25 3F | Logical AND with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	BCC $8E			  ; 90 8E | Branch if carry clear
	CLD				  ; D8 | Clear decimal mode flag
	DEX				  ; CA | Decrement X register
	ADC $448E,X		  ; 7D 8E 44 | Add with carry (absolute,X)
	ADC ($8A),Y		  ; 71 8A | Add with carry ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $D4			  ; 66 D4 | Rotate right (zero page)
	LDA				  ; BF 00 FD 02 | Read graphics status
	STY $F88F			; 8C 8F F8 | Store Y register to absolute address
	SBC $9D00,X		  ; FD 00 9D | Subtract with carry (absolute,X)
	LDA $E007,Y		  ; B9 07 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	BCS $EF			  ; B0 EF | Branch if carry set
	BPL $02			  ; 10 02 | Branch if positive
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	DEC $CE00			; CE 00 CE | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_010
; Address: $E78321
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_010:
	JSL $080808		  ; 22 08 08 08 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BPL $12			  ; 10 12 | Branch if positive
	STA ($AD,X)		  ; 81 AD | Update graphics data
	LDA $00FF			; AD FF 00 | Read graphics status
	SBC $F700,X		  ; FD 00 F7 | Subtract with carry (absolute,X)
	ROR $5200,X		  ; 7E 00 52 | Rotate right (absolute,X)
	AND $2205,Y		  ; 39 05 22 | Logical AND with accumulator (absolute,Y)
	SEP #$C2			 ; E2 C2 | Set processor status bits
	SBC $1100,Y		  ; F9 00 11 | Subtract with carry (absolute,Y)
	EOR $6E48,Y		  ; 59 48 6E | Exclusive OR with accumulator (absolute,Y)
	ROR $00FF			; 6E FF 00 | Rotate right (absolute)
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	AND $FF00,X		  ; 3D 00 FF | Logical AND with accumulator (absolute,X)
	STA ($00),Y		  ; 91 00 | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	BPL $38			  ; 10 38 | Branch if positive
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	BIT $93			  ; 24 93 | Test bits in accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($04FB)		  ; 6C FB 04 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_011
; Address: $E78374
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_011:
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BIT $14			  ; 24 14 | Test bits in accumulator (zero page)
	BIT $53			  ; 24 53 | Test bits in accumulator (zero page)
	LDA $3FAF3F		  ; AF 3F AF 3F | Read graphics status
	LDY #$3F			 ; A0 3F | Load immediate value into Y register
	LDY #$3F			 ; A0 3F | Load immediate value into Y register
	LDY #$3B			 ; A0 3B | Load immediate value into Y register
	ORA ($3B,X)		  ; 01 3B | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	BNE $20			  ; D0 20 | Branch if not equal
	BNE $20			  ; D0 20 | Branch if not equal

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_014
; Address: $E783A3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_014:
	RTI				  ; 40 | Return from interrupt
	LDA $9F42,X		  ; BD 42 9F | Read graphics status
	BVS $00			  ; 70 00 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_015
; Address: $E783B5
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_015:
	JSR $0000			; 20 00 00 | Jump to subroutine
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	BRA $FF			  ; 80 FF | Branch always
	BVS $EF			  ; 70 EF | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	ORA $CC12,X		  ; 1D 12 CC | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	LDA				  ; BF 00 97 00 | Read graphics status
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_016
; Address: $E78407
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_016:
	JSR $300F			; 20 0F 30 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$DF			 ; A0 DF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_017
; Address: $E7840F
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_017:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	LDA				  ; BF 00 A9 00 | Read graphics status
	PLP				  ; 28 | Pull processor status from stack
	BPL $20			  ; 10 20 | Branch if positive
	ORA ($21,X)		  ; 01 21 | PPU graphics register access
	BIT $93			  ; 24 93 | Test bits in accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($04FB)		  ; 6C FB 04 | Jump to address (absolute indirect)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA $3225,Y		  ; 19 25 32 | Logical OR with accumulator (absolute,Y)
	REP #$F3			 ; C2 F3 | Reset processor status bits
	AND ($20,X)		  ; 21 20 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_018
; Address: $E7844A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_018:
	EOR $4E48,Y		  ; 59 48 4E | Exclusive OR with accumulator (absolute,Y)
	LSR $00FF			; 4E FF 00 | Logical shift right (absolute)
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	AND $FF00,X		  ; 3D 00 FF | Logical AND with accumulator (absolute,X)
	LDA ($00),Y		  ; B1 00 | Read graphics status
	LDY #$3F			 ; A0 3F | Load immediate value into Y register
	LDY #$1A			 ; A0 1A | Load immediate value into Y register
	LDA $3F			  ; A5 3F | Read graphics status
	BRA $23			  ; 80 23 | Branch always
	LDY #$F4			 ; A0 F4 | Load immediate value into Y register
	JMP $AB54A3		  ; 5C A3 54 AB | Jump to address long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_019
; Address: $E78471
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_019:
	JSR $20DF			; 20 DF 20 | Jump to subroutine
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	PHB				  ; 8B | Push data bank register to stack
	LDX $00			  ; A6 00 | Load from zero page into X register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	EOR $41A6,Y		  ; 59 A6 41 | Exclusive OR with accumulator (absolute,Y)
	LDX $00FF,Y		  ; BE FF 00 | Load from absolute,Y into X register
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	PHA				  ; 48 | Push accumulator to stack
	BIT #$8F			 ; 89 8F | Test bits in accumulator (immediate)
	SBC ($C3),Y		  ; F1 C3 | Subtract with carry ((zero page),Y)
	ORA $851D,Y		  ; 19 1D 85 | Logical OR with accumulator (absolute,Y)
	ASL $36			  ; 06 36 | Arithmetic shift left (zero page)
	CMP ($18,X)		  ; C1 18 | Compare accumulator ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set
	SEP #$00			 ; E2 00 | Set processor status bits
	CLC				  ; 18 | Clear carry flag
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	INC $00			  ; E6 00 | Increment (zero page)
	ORA ($C1),Y		  ; 11 C1 | Logical OR with accumulator ((zero page),Y)
	SEP #$E2			 ; E2 E2 | Set processor status bits
	ROL $CEC7			; 2E C7 CE | Rotate left (absolute)
	SBC $3CBA,Y		  ; F9 BA 3C | Subtract with carry (absolute,Y)
	ASL $0C00			; 0E 00 0C | Arithmetic shift left (absolute)
	ORA $E900,X		  ; 1D 00 E9 | Logical OR with accumulator (absolute,X)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	ORA ($E9,X)		  ; 01 E9 | Logical OR with accumulator ((zero page,X))
	ASL $E642,X		  ; 1E 42 E6 | Arithmetic shift left (absolute,X)
	PLX				  ; FA | Pull X register from stack
	CMP ($30,X)		  ; C1 30 | Compare accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	INC $DC00,X		  ; FE 00 DC | Increment (absolute,X)
	LDA $BB00,X		  ; BD 00 BB | Read graphics status
	INC $00			  ; E6 00 | Increment (zero page)
	INC $FD00			; EE 00 FD | Increment (absolute)
	SBC $1906			; ED 06 19 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_01A
; Address: $E78509
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_01A:
	CPY $0839			; CC 39 08 | Compare Y register (absolute)
	AND #$8E			 ; 29 8E | Logical AND with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	STA				  ; 9F A7 18 20 | Update graphics data
	ROR $46			  ; 66 46 | Rotate right (zero page)
	BPL $18			  ; 10 18 | Branch if positive
	BPL $28			  ; 10 28 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	LDA $A900,Y		  ; B9 00 A9 | Read graphics status
	SEC				  ; 38 | Set carry flag
	PHB				  ; 8B | Push data bank register to stack
	STZ $1B			  ; 64 1B | Store zero to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_01B
; Address: $E78544
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_01B:
	BMI $40			  ; 30 40 | Branch if negative
	JMP $CBBB			; 4C BB CB | Jump to address
	BRA $04			  ; 80 04 | Branch always
	PEA #$FF00		   ; F4 00 FF | Push effective address to stack
	BEQ $00			  ; F0 00 | Branch if equal
	BNE $16			  ; D0 16 | Branch if not equal
	ORA ($97),Y		  ; 11 97 | Logical OR with accumulator ((zero page),Y)
	ORA #$89			 ; 09 89 | Logical OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_01C
; Address: $E78567
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_01C:
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	INC				  ; 1A | Increment accumulator
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BCC $45			  ; 90 45 | Branch if carry clear
	TXA				  ; 8A | Transfer X register to accumulator
	STA $9D9E,X		  ; 9D 9E 9D | Update graphics data
	BIT $0E			  ; 24 0E | Test bits in accumulator (zero page)
	BCS $08			  ; B0 08 | Branch if carry set
	LDA ($91,X)		  ; A1 91 | Read graphics status
	CPX $000A			; EC 0A 00 | Compare X register (absolute)
	DEX				  ; CA | Decrement X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_01E
; Address: $E78598
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_01E:
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	LSR $1300			; 4E 00 13 | Logical shift right (absolute)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	LDY $FF43			; AC 43 FF | Load from absolute address into Y register
	STY $7B			  ; 84 7B | Store Y register to zero page
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	CPY $08			  ; C4 08 | Compare Y register (zero page)
	BMI $B4			  ; 30 B4 | Branch if negative

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_01F
; Address: $E785E3
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_01F:
	SBC $0777,X		  ; FD 77 07 | Subtract with carry (absolute,X)
	ROL $E602,X		  ; 3E 02 E6 | Rotate left (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	SBC $FE30,Y		  ; F9 30 FE | Subtract with carry (absolute,Y)
	ORA $00CF,Y		  ; 19 CF 00 | Logical OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SBC $FB00,X		  ; FD 00 FB | Subtract with carry (absolute,X)
	STA $CF00,X		  ; 9D 00 CF | Update graphics data
	INC $00			  ; E6 00 | Increment (zero page)
	ROL $3EF8,X		  ; 3E F8 3E | Rotate left (absolute,X)
	ORA $ED00,X		  ; 1D 00 ED | Logical OR with accumulator (absolute,X)
	ASL $1D			  ; 06 1D | Arithmetic shift left (zero page)
	CPY $0938			; CC 38 09 | Compare Y register (absolute)
	BIT $22			  ; 24 22 | Test bits in accumulator (zero page)
	EOR $86			  ; 45 86 | Exclusive OR with accumulator (zero page)
	EOR $FF00			; 4D 00 FF | Exclusive OR with accumulator (absolute)
	SBC $3300,Y		  ; F9 00 33 | Subtract with carry (absolute,Y)
	CMP $7900,X		  ; DD 00 79 | Compare accumulator (absolute,X)
	DEC $EE			  ; C6 EE | Decrement (zero page)
	STX $F6			  ; 86 F6 | Store X register to zero page
	BRA $FF			  ; 80 FF | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA $FFF6,Y		  ; 19 F6 FF | Logical OR with accumulator (absolute,Y)
	SBC $C1			  ; E5 C1 | Subtract with carry (zero page)
	AND $7900,Y		  ; 39 00 79 | Logical AND with accumulator (absolute,Y)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	ROL $FB00,X		  ; 3E 00 FB | Rotate left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $FA			  ; 65 FA | Add with carry (zero page)
	AND ($7D),Y		  ; 31 7D | Logical AND with accumulator ((zero page),Y)
	ADC #$0B			 ; 69 0B | Add with carry (immediate)
	SEC				  ; 38 | Set carry flag
	DEC $BBF0,X		  ; DE F0 BB | Decrement (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	TXS				  ; 9A | Transfer X register to stack pointer
	DEC $E000			; CE 00 E0 | Game work RAM access
	PEA #$FD00		   ; F4 00 FD | Push effective address to stack
	BMI $4B			  ; 30 4B | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	SBC $FD00,Y		  ; F9 00 FD | Subtract with carry (absolute,Y)
	STA $CF00,X		  ; 9D 00 CF | Update graphics data
	ORA ($CF,X)		  ; 01 CF | Logical OR with accumulator ((zero page,X))
	INC $EF00,X		  ; FE 00 EF | Increment (absolute,X)
	CPX #$CD			 ; E0 CD | Compare X register (immediate)
	CPY #$F7			 ; C0 F7 | Compare Y register (immediate)
	ORA ($DF,X)		  ; 01 DF | Logical OR with accumulator ((zero page,X))
	SBC $3F00,X		  ; FD 00 3F | Subtract with carry (absolute,X)
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	ADC $1C00,X		  ; 7D 00 1C | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_020
; Address: $E786A1
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_020:
	BRA $7E			  ; 80 7E | Branch always
	STZ $C220			; 9C 20 C2 | Store zero to absolute
	BVS $92			  ; 70 92 | Branch if overflow set
	STZ $1EFC,X		  ; 9E FC 1E | Store zero to absolute,X
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	SEP #$00			 ; E2 00 | Set processor status bits
	INC $EE00,X		  ; FE 00 EE | Increment (absolute,X)
	SEP #$00			 ; E2 00 | Set processor status bits
	SEP #$00			 ; E2 00 | Set processor status bits
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_021
; Address: $E786C1
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_021:
	JSL $190829		  ; 22 29 08 19 | Jump to subroutine long
	ROL $76			  ; 26 76 | Rotate left (zero page)
	BMI $46			  ; 30 46 | Branch if negative
	ROR $0E1F,X		  ; 7E 1F 0E | Rotate right (absolute,X)
	AND $3700,X		  ; 3D 00 37 | Logical AND with accumulator (absolute,X)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $3100,X		  ; 1D 00 31 | Logical OR with accumulator (absolute,X)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	ADC $1D62,X		  ; 7D 62 1D | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_022
; Address: $E786EC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_022:
	JSL $FF00DD		  ; 22 DD 00 FF | Jump to subroutine long
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	ROR $19			  ; 66 19 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_023
; Address: $E78708
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_023:
	JSL $FF00DD		  ; 22 DD 00 FF | Jump to subroutine long
	SED				  ; F8 | Set decimal mode flag
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	BMI $1F			  ; 30 1F | Branch if negative
	BVS $2F			  ; 70 2F | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_025
; Address: $E7873A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_025:
	JSR $4000			; 20 00 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $7F			  ; 80 7F | Branch always
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	BPL $5F			  ; 10 5F | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_026
; Address: $E7876A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_026:
	BVC $2F			  ; 50 2F | Branch if overflow clear
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_02A
; Address: $E78778
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_02A:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SBC $79C0,Y		  ; F9 C0 79 | Subtract with carry (absolute,Y)
	INC $C4			  ; E6 C4 | Increment (zero page)
	ROL $FB00,X		  ; 3E 00 FB | Rotate left (absolute,X)
	ORA $FF00,Y		  ; 19 00 FF | Logical OR with accumulator (absolute,Y)
	ADC $CF			  ; 65 CF | Add with carry (zero page)
	ORA ($EA,X)		  ; 01 EA | Logical OR with accumulator ((zero page,X))
	INC $F502,X		  ; FE 02 F5 | Increment (absolute,X)
	BMI $EF			  ; 30 EF | Branch if negative

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_02B
; Address: $E787AD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_02B:
	JSR $0057			; 20 57 00 | Jump to subroutine
	TXS				  ; 9A | Transfer X register to stack pointer
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	STA $B608,Y		  ; 99 08 B6 | Update graphics data

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_02C
; Address: $E787C3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_02C:
	JSR $0096			; 20 96 00 | Jump to subroutine
	CMP $9F49,Y		  ; D9 49 9F | Compare accumulator (absolute,Y)
	XBA				  ; EB | Exchange accumulator bytes
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_02D
; Address: $E787CC
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_02D:
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ASL $1841,X		  ; 1E 41 18 | Arithmetic shift left (absolute,X)
	LSR $F3			  ; 46 F3 | Logical shift right (zero page)
	BNE $51			  ; D0 51 | Branch if not equal
	STA $AF00			; 8D 00 AF | Update graphics data
	STA $9D00,X		  ; 9D 00 9D | Update graphics data
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_02E
; Address: $E78807
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_02E:
	STA				  ; 9F 60 DF 50 | Update graphics data
	LDA $3DA778		  ; AF 78 A7 3D | Read graphics status
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_02F
; Address: $E78820
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_02F:
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 20 DF 60 | Read graphics status

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_030
; Address: $E7882E
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_030:
	BVC $AF			  ; 50 AF | Branch if overflow clear
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $029C,X		  ; FE 9C 02 | Increment (absolute,X)
	LSR $80			  ; 46 80 | Logical shift right (zero page)
	STY $42			  ; 84 42 | Hardware register operation
	JMP $3402			; 4C 02 34 | Jump to address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLD				  ; D8 | Clear decimal mode flag
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	SBC $7F80,X		  ; FD 80 7F | Subtract with carry (absolute,X)
	WDM #$BD			 ; 42 BD | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	SBC $F906,X		  ; FD 06 F9 | Subtract with carry (absolute,X)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ASL $15			  ; 06 15 | Arithmetic shift left (zero page)
	ORA #$13			 ; 09 13 | Logical OR with accumulator (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_033
; Address: $E788C8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_033:
	BPL $60			  ; 10 60 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	ORA $6E5F			; 0D 5F 6E | Logical OR with accumulator (absolute)
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_036
; Address: $E788DE
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_036:
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $06			  ; 30 06 | Branch if negative
	REP #$00			 ; C2 00 | Reset processor status bits
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_037
; Address: $E788F1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_037:
	SBC $F906,X		  ; FD 06 F9 | Subtract with carry (absolute,X)
	ADC $7F80,X		  ; 7D 80 7F | Add with carry (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	INX				  ; E8 | Increment X register
	ASL $15			  ; 06 15 | Arithmetic shift left (zero page)
	ASL $211D			; 0E 1D 21 | PPU graphics register access
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_038
; Address: $E78916
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_038:
	JSR $2800			; 20 00 28 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	BMI $6F			  ; 30 6F | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_03B
; Address: $E7895A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_03B:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SBC #$3A			 ; E9 3A | Subtract with carry (immediate)
	ORA #$F9			 ; 09 F9 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$F9			 ; 09 F9 | Logical OR with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ROR $91			  ; 66 91 | Rotate right (zero page)
	EOR #$96			 ; 49 96 | Exclusive OR with accumulator (immediate)
	ADC #$96			 ; 69 96 | Add with carry (immediate)
	ROL $90			  ; 26 90 | Rotate left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_03C
; Address: $E78989
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_03C:
	STA				  ; 9F 14 80 17 | Update graphics data
	BRA $00			  ; 80 00 | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 60 DF 30 | Read graphics status
	STA $80A35C		  ; 8F 5C A3 80 | Update graphics data
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_03D
; Address: $E789BA
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_03D:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $9E60,X		  ; FE 60 9E | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	DEC $28			  ; C6 28 | Decrement (zero page)
	DEC $B2			  ; C6 B2 | Decrement (zero page)
	LSR $3EC2			; 4E C2 3E | Logical shift right (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	LSR $3C			  ; 46 3C | Logical shift right (zero page)
	REP #$02			 ; C2 02 | Reset processor status bits
	SBC $639C,X		  ; FD 9C 63 | Subtract with carry (absolute,X)
	LSR $B9			  ; 46 B9 | Logical shift right (zero page)
	STY $7B			  ; 84 7B | Store Y register to zero page
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $BB44			; CD 44 BB | Compare accumulator (absolute)
	REP #$3D			 ; C2 3D | Reset processor status bits
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	CMP $2A			  ; C5 2A | Compare accumulator (zero page)
	CMP $B0			  ; C5 B0 | Compare accumulator (zero page)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	EOR $3E			  ; 45 3E | Exclusive OR with accumulator (zero page)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	STZ $4561,X		  ; 9E 61 45 | Store zero to absolute,X
	TSX				  ; BA | Transfer stack pointer to X register
	STY $7B			  ; 84 7B | Store Y register to zero page
	BMI $CF			  ; 30 CF | Branch if negative
	EOR $BA			  ; 45 BA | Exclusive OR with accumulator (zero page)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	BVS $17			  ; 70 17 | Branch if overflow set
	BVC $37			  ; 50 37 | Branch if overflow clear
	CLV				  ; B8 | Clear overflow flag
	CLD				  ; D8 | Clear decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BRA $00			  ; 80 00 | Branch always
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	DEY				  ; 88 | Decrement Y register
	STZ $84			  ; 64 84 | Store zero to zero page
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	LDY #$1F			 ; A0 1F | Load immediate value into Y register
	TSX				  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_03E
; Address: $E78A2A
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_03E:
	LDY $401F,X		  ; BC 1F 40 | Load from absolute,X into Y register
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BIT $59CC			; 2C CC 59 | Test bits in accumulator (absolute)
	STA				  ; 9F 18 DF 07 | Update graphics data
	CPX #$19			 ; E0 19 | Compare X register (immediate)
	SBC $FA1A,Y		  ; F9 1A FA | Subtract with carry (absolute,Y)
	CPX $33			  ; E4 33 | Compare X register (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_040
; Address: $E78A56
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_040:
	SEI				  ; 78 | Set interrupt disable flag
	ASL $1707,X		  ; 1E 07 17 | Arithmetic shift left (absolute,X)
	ORA $173B			; 0D 3B 17 | Logical OR with accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	INY				  ; C8 | Increment Y register
	CLV				  ; B8 | Clear overflow flag
	LDA $5F67C0		  ; AF C0 67 5F | Read graphics status
	CPX $42A3			; EC A3 42 | Hardware register operation
	ROL $3913			; 2E 13 39 | Rotate left (absolute)
	ORA $00F0,X		  ; 1D F0 00 | Logical OR with accumulator (absolute,X)
	INC $7F00,X		  ; FE 00 7F | Increment (absolute,X)
	BRA $3F			  ; 80 3F | Branch always
	RTI				  ; 40 | Return from interrupt
	AND $C842,X		  ; 3D 42 C8 | Logical AND with accumulator (absolute,X)
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	DEC $02			  ; C6 02 | Decrement (zero page)
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	BMI $CF			  ; 30 CF | Branch if negative
	PLY				  ; 7A | Pull Y register from stack
	STA $02			  ; 85 02 | Update graphics data
	SBC $49B6,X		  ; FD B6 49 | Subtract with carry (absolute,X)
	EOR #$B6			 ; 49 B6 | Exclusive OR with accumulator (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BMI $CF			  ; 30 CF | Branch if negative
	ADC #$37			 ; 69 37 | Add with carry (immediate)
	INY				  ; C8 | Increment Y register
	EOR $79B2			; 4D B2 79 | Exclusive OR with accumulator (absolute)
	STX $04			  ; 86 04 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_041
; Address: $E78ADB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_041:
	PHA				  ; 48 | Push accumulator to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROR $00			  ; 66 00 | Rotate right (zero page)
	STA $E819,X		  ; 9D 19 E8 | Update graphics data
	STZ $6600,X		  ; 9E 00 66 | Store zero to absolute,X
	BMI $0B			  ; 30 0B | Branch if negative

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_042
; Address: $E78B26
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_042:
	JSL $270013		  ; 22 13 00 27 | Jump to subroutine long
	CLI				  ; 58 | Clear interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $3800			; 2C 00 38 | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	ADC $05			  ; 65 05 | Add with carry (zero page)
	JMP $0013			; 4C 13 00 | Jump to address
	EOR ($0F),Y		  ; 51 0F | Exclusive OR with accumulator ((zero page),Y)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVS $00			  ; 70 00 | Branch if overflow set
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_046
; Address: $E78B80
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_046:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $3D			  ; 85 3D | Update graphics data
	ORA #$6A			 ; 09 6A | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	LDA ($B5),Y		  ; B1 B5 | Read graphics status
	PLX				  ; FA | Pull X register from stack
	AND $F6			  ; 25 F6 | Logical AND with accumulator (zero page)
	EOR #$F5			 ; 49 F5 | Exclusive OR with accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	LDA $5512			; AD 12 55 | Read graphics status

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_047
; Address: $E78B9B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_047:
	JSL $4A44AA		  ; 22 AA 44 4A | Jump to subroutine long
	STY $04			  ; 84 04 | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_048
; Address: $E78BB4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_048:
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	SBC $FD00,Y		  ; F9 00 FD | Subtract with carry (absolute,Y)
	INC $0200,X		  ; FE 00 02 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_04E
; Address: $E78C00
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_04E:
	JSR $02CF			; 20 CF 02 | Jump to subroutine
	LDA				  ; BF 42 FF 42 | Read graphics status
	WDM #$FF			 ; 42 FF | Reserved instruction
	WDM #$FF			 ; 42 FF | Reserved instruction
	WDM #$FF			 ; 42 FF | Reserved instruction
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA #$FE			 ; 09 FE | Logical OR with accumulator (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA ($F7),Y		  ; 11 F7 | Logical OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_04F
; Address: $E78C6A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_04F:
	JSR $103F			; 20 3F 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_051
; Address: $E78C83
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_051:
	PHX				  ; DA | Push X register to stack
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_052
; Address: $E78C8F
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_052:
	JMP $000000		  ; 5C 00 00 00 | Jump to address long
	BRA $00			  ; 80 00 | Branch always
	PLX				  ; FA | Pull X register from stack
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	DEC $18			  ; C6 18 | Decrement (zero page)
	DEC $90			  ; C6 90 | Decrement (zero page)
	LSR $5F98			; 4E 98 5F | Logical shift right (absolute)
	DEY				  ; 88 | Decrement Y register
	STX $F2D1			; 8E D1 F2 | Store X register to absolute address
	ORA $07F8			; 0D F8 07 | Logical OR with accumulator (absolute)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	DEC $39			  ; C6 39 | Decrement (zero page)
	LSR $58B1			; 4E B1 58 | Logical shift right (absolute)
	CLV				  ; B8 | Clear overflow flag
	STA ($6E),Y		  ; 91 6E | Update graphics data

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_053
; Address: $E78CC0
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_053:
	BMI $CD			  ; 30 CD | Branch if negative
	SBC $FD00,Y		  ; F9 00 FD | Subtract with carry (absolute,Y)
	CMP $C3FC			; CD FC C3 | Compare accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	CMP $F932			; CD 32 F9 | Compare accumulator (absolute)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	CPY $3C33			; CC 33 3C | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	ADC $0486,Y		  ; 79 86 04 | Add with carry (absolute,Y)
	SBC $FF02,Y		  ; F9 02 FF | Subtract with carry (absolute,Y)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_057
; Address: $E78D0C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_057:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ROL $DE			  ; 26 DE | Rotate left (zero page)
	CMP #$38			 ; C9 38 | Compare accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_058
; Address: $E78D2E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_058:
	XBA				  ; EB | Exchange accumulator bytes
	STY $00			  ; 84 00 | Store Y register to zero page
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $1F			  ; E6 1F | Increment (zero page)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	INC $EF00			; EE 00 EF | Increment (absolute)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	INC $FF00			; EE 00 FF | Increment (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_059
; Address: $E78D60
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_059:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	WDM #$FF			 ; 42 FF | Reserved instruction
	ASL $D7			  ; 06 D7 | Arithmetic shift left (zero page)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($8F),Y		  ; 91 8F | Update graphics data
	JMP $1B3C			; 4C 3C 1B | Jump to address
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_05A
; Address: $E78DC8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_05A:
	WDM #$73			 ; 42 73 | Reserved instruction
	SBC $BB			  ; E5 BB | Subtract with carry (zero page)
	ORA #$F3			 ; 09 F3 | Logical OR with accumulator (immediate)
	ASL $F6			  ; 06 F6 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_05B
; Address: $E78DD8
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_05B:
	CPY $E000			; CC 00 E0 | Game work RAM access
	STA $FF0000		  ; 8F 00 00 FF | Update graphics data
	BIT $0033			; 2C 33 00 | Test bits in accumulator (absolute)
	CPY #$5F			 ; C0 5F | Compare Y register (immediate)
	SBC ($F1,X)		  ; E1 F1 | Subtract with carry ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	STZ $0C8B			; 9C 8B 0C | Store zero to absolute
	CPY $9F00			; CC 00 9F | Compare Y register (absolute)
	LDA				  ; BF 00 1F 00 | Read graphics status
	STA $104B70		  ; 8F 70 4B 10 | Update graphics data
	EOR $60C4			; 4D C4 60 | Exclusive OR with accumulator (absolute)
	LDA $DBB6			; AD B6 DB | Read graphics status
	ROR $93			  ; 66 93 | Rotate right (zero page)
	CMP ($F5,X)		  ; C1 F5 | Compare accumulator ((zero page,X))
	ROR $D4			  ; 66 D4 | Rotate right (zero page)
	STX $70			  ; 86 70 | Store X register to zero page
	CPX $00			  ; E4 00 | Compare X register (zero page)
	BRA $00			  ; 80 00 | Branch always
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	XBA				  ; EB | Exchange accumulator bytes
	ASL $8EF1			; 0E F1 8E | Arithmetic shift left (absolute)
	SBC ($BE),Y		  ; F1 BE | Subtract with carry ((zero page),Y)
	CMP ($38,X)		  ; C1 38 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CMP ($F8,X)		  ; C1 F8 | Compare accumulator ((zero page,X))
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	ASL $48			  ; 06 48 | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	ASL $78			  ; 06 78 | Arithmetic shift left (zero page)
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	BEQ $E8			  ; F0 E8 | Branch if equal
	BCS $36			  ; B0 36 | Branch if carry set
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	CPY $3B			  ; C4 3B | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_05C
; Address: $E78E5C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_05C:
	BEQ $0F			  ; F0 0F | Branch if equal
	CLC				  ; 18 | Clear carry flag
	LSR $BF			  ; 46 BF | Logical shift right (zero page)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	INC $6F00			; EE 00 6F | Increment (absolute)
	STA ($90),Y		  ; 91 90 | Update graphics data
	INC $FF00			; EE 00 FF | Increment (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_05D
; Address: $E78E80
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_05D:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	ROR $F9			  ; 66 F9 | Rotate right (zero page)
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	BIT #$09			 ; 89 09 | Test bits in accumulator (immediate)
	CMP $A404,Y		  ; D9 04 A4 | Compare accumulator (absolute,Y)
	JMP ($D7C5)		  ; 6C C5 D7 | Jump to address (absolute indirect)
	BMI $E1			  ; 30 E1 | Branch if negative
	CMP $3BCF,X		  ; DD CF 3B | Compare accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INC $1F00			; EE 00 1F | Increment (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	PLX				  ; FA | Pull X register from stack
	ROR $7D13,X		  ; 7E 13 7D | Rotate right (absolute,X)
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	SBC $FE07,Y		  ; F9 07 FE | Subtract with carry (absolute,Y)
	INC $00A9,X		  ; FE A9 00 | Increment (absolute,X)
	LDA ($00),Y		  ; B1 00 | Read graphics status
	BCS $00			  ; B0 00 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	ROR $FF00,X		  ; 7E 00 FF | Rotate right (absolute,X)
	INC $EB01,X		  ; FE 01 EB | Increment (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	INY				  ; C8 | Increment Y register
	LDX $EF81,Y		  ; BE 81 EF | Load from absolute,Y into X register
	BPL $DF			  ; 10 DF | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_05E
; Address: $E78EEC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_05E:
	STA				  ; 9F E0 7F 7F | Update graphics data
	STA $08			  ; 85 08 | Update graphics data
	ORA $0C00			; 0D 00 0C | Logical OR with accumulator (absolute)
	BPL $5E			  ; 10 5E | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_060
; Address: $E78F01
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_060:
	JSR $3625			; 20 25 36 | Jump to subroutine
	BEQ $FF			  ; F0 FF | Branch if equal
	CMP $3C00,Y		  ; D9 00 3C | Compare accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $02FF,X		  ; FE FF 02 | Increment (absolute,X)
	INC $03FF,X		  ; FE FF 03 | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_061
; Address: $E78F41
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_061:
	CPX $894F			; EC 4F 89 | Compare X register (absolute)
	STA $BB19,X		  ; 9D 19 BB | Update graphics data
	ROL $77FF			; 2E FF 77 | Rotate left (absolute)
	LDA $1F7C24		  ; AF 24 7C 1F | Read graphics status
	BPL $5D			  ; 10 5D | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_062
; Address: $E78F55
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_062:
	JSL $7B007F		  ; 22 7F 00 7B | Jump to subroutine long
	ADC $7F00,X		  ; 7D 00 7F | Add with carry (absolute,X)
	LDY $2303,X		  ; BC 03 23 | Load from absolute,X into Y register
	CMP $D9FD			; CD FD D9 | Compare accumulator (absolute)
	SBC #$8C			 ; E9 8C | Subtract with carry (immediate)
	CPX $91			  ; E4 91 | Compare X register (zero page)
	CMP ($06),Y		  ; D1 06 | Compare accumulator ((zero page),Y)
	ROL $08			  ; 26 08 | Rotate left (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	CPY #$FD			 ; C0 FD | Compare Y register (immediate)
	SBC $FD06,Y		  ; F9 06 FD | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_063
; Address: $E78F79
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_063:
	JSR $D926			; 20 26 D9 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ASL $55F1			; 0E F1 55 | Arithmetic shift left (absolute)
	STY $F8			  ; 84 F8 | Store Y register to zero page
	JMP $1C72			; 4C 72 1C | Jump to address
	PLY				  ; 7A | Pull Y register from stack
	STZ $7E			  ; 64 7E | Store zero to zero page
	LDA				  ; BF BE DE B1 | Read graphics status
	PHX				  ; DA | Push X register to stack
	DEX				  ; CA | Decrement X register
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	EOR $6580,Y		  ; 59 80 65 | Exclusive OR with accumulator (absolute,Y)
	BRA $E4			  ; 80 E4 | Branch always
	STA				  ; 9F 00 E9 6F | Update graphics data
	ADC $CF7F,Y		  ; 79 7F CF | Add with carry (absolute,Y)
	LDA				  ; BF 94 F8 21 | Read graphics status
	BEQ $02			  ; F0 02 | Branch if equal
	SBC ($85,X)		  ; E1 85 | Subtract with carry ((zero page,X))
	CMP $C2			  ; C5 C2 | Compare accumulator (zero page)
	STX $0F00			; 8E 00 0F | Store X register to absolute address
	ASL $7C01,X		  ; 1E 01 7C | Arithmetic shift left (absolute,X)
	SBC $F306,Y		  ; F9 06 F3 | Subtract with carry (absolute,Y)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	AND ($D9,X)		  ; 21 D9 | Logical AND with accumulator ((zero page,X))
	STX $044F			; 8E 4F 04 | Store X register to absolute address
	STA $C800FF		  ; 8F FF 00 C8 | Update graphics data
	CLV				  ; B8 | Clear overflow flag
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $37			  ; F0 37 | Branch if equal
	BEQ $77			  ; F0 77 | Branch if equal
	REP #$38			 ; C2 38 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_064
; Address: $E78FE2
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_064:
	SED				  ; F8 | Set decimal mode flag
	ASL $C0			  ; 06 C0 | Arithmetic shift left (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	LSR $4000			; 4E 00 40 | Logical shift right (absolute)
	ORA ($C0),Y		  ; 11 C0 | Logical OR with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CMP $F900			; CD 00 F9 | Compare accumulator (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STZ $F3FE,X		  ; 9E FE F3 | Store zero to absolute,X
	SBC $FF09,X		  ; FD 09 FF | Subtract with carry (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	SBC $FF07,Y		  ; F9 07 FF | Subtract with carry (absolute,Y)
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SBC #$6F			 ; E9 6F | Subtract with carry (immediate)
	ADC #$7F			 ; 69 7F | Add with carry (immediate)
	LDA				  ; BF 90 FF 30 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_065
; Address: $E7904C
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_065:
	STA				  ; 9F E0 FF FF | Update graphics data
	STX $0F00			; 8E 00 0F | Store X register to absolute address
	AND $FCDF,X		  ; 3D DF FC | Logical AND with accumulator (absolute,X)
	AND $3B3E,X		  ; 3D 3E 3B | Logical AND with accumulator (absolute,X)
	SBC $FE83,X		  ; FD 83 FE | Subtract with carry (absolute,X)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	BRA $FC			  ; 80 FC | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	LDA				  ; BF C1 7F 81 | Read graphics status
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	LDY $77DB			; AC DB 77 | Load from absolute address into Y register
	STY $0CF7			; 8C F7 0C | Store Y register to absolute address
	STY $7C			  ; 84 7C | Store Y register to zero page
	PEA #$FF0C		   ; F4 0C FF | Push effective address to stack
	CPY #$EC			 ; C0 EC | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_066
; Address: $E790DB
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_066:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $B3			  ; 10 B3 | Branch if positive
	STA				  ; 9F FF DF FF | Update graphics data
	CPX $FA			  ; E4 FA | Compare X register (zero page)
	PLX				  ; FA | Pull X register from stack
	INC $FCFD,X		  ; FE FD FC | Increment (absolute,X)
	SBC $FDFE,Y		  ; F9 FE FD | Subtract with carry (absolute,Y)
	AND $3BFA,X		  ; 3D FA 3B | Logical AND with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	STY $FE			  ; 84 FE | Store Y register to zero page
	CPX #$F9			 ; E0 F9 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F8			  ; F0 F8 | Branch if equal
	PEA #$FBFC		   ; F4 FC FB | Push effective address to stack
	ORA ($72,X)		  ; 01 72 | Logical OR with accumulator ((zero page,X))
	EOR #$4E			 ; 49 4E | Exclusive OR with accumulator (immediate)
	BCS $86			  ; B0 86 | Branch if carry set

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_067
; Address: $E79146
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_067:
	JSR $A2A2			; 20 A2 A2 | Jump to subroutine
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	BVS $AB			  ; 70 AB | Branch if overflow set
	PLB				  ; AB | Pull data bank register from stack
	EOR $7880			; 4D 80 78 | Exclusive OR with accumulator (absolute)
	BRA $B1			  ; 80 B1 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	BCS $4D			  ; B0 4D | Branch if carry set
	BEQ $0D			  ; F0 0D | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_068
; Address: $E7915B
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_068:
	STA $EB04EB		  ; 8F EB 04 EB | Update graphics data
	CPY $4A			  ; C4 4A | Compare Y register (zero page)
	CMP $0A			  ; C5 0A | Compare accumulator (zero page)
	STA $96			  ; 85 96 | Update graphics data
	BIT #$94			 ; 89 94 | Test bits in accumulator (immediate)
	BIT #$94			 ; 89 94 | Test bits in accumulator (immediate)
	BIT #$94			 ; 89 94 | Test bits in accumulator (immediate)
	BIT #$94			 ; 89 94 | Test bits in accumulator (immediate)
	BIT #$E7			 ; 89 E7 | Test bits in accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	BPL $E7			  ; 10 E7 | Branch if positive
	BPL $CF			  ; 10 CF | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_06B
; Address: $E7917F
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_06B:
	JSR $9B14			; 20 14 9B | Jump to subroutine
	LSR $0D1D,X		  ; 5E 1D 0D | Logical shift right (absolute,X)
	ASL $0F09			; 0E 09 0F | Arithmetic shift left (absolute)
	BRA $80			  ; 80 80 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	CPY #$46			 ; C0 46 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPX #$23			 ; E0 23 | Compare X register (immediate)
	CPX #$0D			 ; E0 0D | Compare X register (immediate)
	BEQ $9C			  ; F0 9C | Branch if equal
	BEQ $D1			  ; F0 D1 | Branch if equal
	CPX $C7			  ; E4 C7 | Compare X register (zero page)
	LDA				  ; BF F0 F1 00 | Read graphics status
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	BRA $78			  ; 80 78 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $38			  ; F0 38 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BVS $8F			  ; 70 8F | Branch if overflow set
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	DEC				  ; 3A | Decrement accumulator
	AND $3C3B,X		  ; 3D 3B 3C | Logical AND with accumulator (absolute,X)
	AND $3A3E,Y		  ; 39 3E 3A | Logical AND with accumulator (absolute,Y)
	AND $3D3A,X		  ; 3D 3A 3D | Logical AND with accumulator (absolute,X)
	SBC $FF3E,Y		  ; F9 3E FF | Subtract with carry (absolute,Y)
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STA $00FF70		  ; 8F 70 FF 00 | Update graphics data
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	PEA #$CC0C		   ; F4 0C CC | Push effective address to stack
	PEA #$340C		   ; F4 0C 34 | Push effective address to stack
	CPY $3CC4			; CC C4 3C | Compare Y register (absolute)
	PEA #$0C0C		   ; F4 0C 0C | Push effective address to stack
	CPY $F8FF			; CC FF F8 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_06C
; Address: $E79293
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_06C:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BCS $FF			  ; B0 FF | Branch if carry set
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $FD0E,X		  ; FE 0E FD | Increment (absolute,X)
	ORA $1E			  ; 05 1E | Logical OR with accumulator (zero page)
	INC $E4			  ; E6 E4 | Increment (zero page)
	ORA $18EE,X		  ; 1D EE 18 | Logical OR with accumulator (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	SBC $FFFC,X		  ; FD FC FF | Subtract with carry (absolute,X)
	SBC $F0FB,Y		  ; F9 FB F0 | Subtract with carry (absolute,Y)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	CPX #$F3			 ; E0 F3 | Compare X register (immediate)
	CPX #$97			 ; E0 97 | Compare X register (immediate)
	STA $9C94,X		  ; 9D 94 9C | Update graphics data
	CMP ($C6,X)		  ; C1 C6 | Compare accumulator ((zero page,X))
	STZ $64			  ; 64 64 | Store zero to zero page
	ORA $9ABD,X		  ; 1D BD 9A | Logical OR with accumulator (absolute,X)
	STZ $FF62,X		  ; 9E 62 FF | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	BPL $E7			  ; 10 E7 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX $72CD			; EC CD 72 | Compare X register (absolute)
	SBC ($7F,X)		  ; E1 7F | Subtract with carry ((zero page,X))
	SBC $9400,Y		  ; F9 00 94 | Subtract with carry (absolute,Y)
	DEY				  ; 88 | Decrement Y register
	PHB				  ; 8B | Push data bank register to stack
	STX $869A			; 8E 9A 86 | Store X register to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	STY $8F			  ; 84 8F | Store Y register to zero page
	STA ($81,X)		  ; 81 81 | Update graphics data
	STX $9D			  ; 86 9D | Store X register to zero page
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $20CF,Y		  ; 99 CF 20 | Update graphics data

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_06E
; Address: $E79337
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_06E:
	JSR $28DA			; 20 DA 28 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	CMP $CA2C			; CD 2C CA | Compare accumulator (absolute)
	ROL $E061			; 2E 61 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_06F
; Address: $E79344
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_06F:
	STX $DF			  ; 86 DF | Store X register to zero page
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	STA $B6			  ; 85 B6 | Update graphics data
	STA				  ; 9F 78 C7 72 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_070
; Address: $E79355
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_070:
	ROL $20			  ; 26 20 | Rotate left (zero page)
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	ADC $565E,X		  ; 7D 5E 56 | Add with carry (absolute,X)
	ADC $3E29,X		  ; 7D 29 3E | Add with carry (absolute,X)
	ORA ($08),Y		  ; 11 08 | Logical OR with accumulator ((zero page),Y)
	ADC $7742			; 6D 42 77 | Add with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	ROR $3700,X		  ; 7E 00 37 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_071
; Address: $E7937D
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_071:
	JSR $106F			; 20 6F 10 | Jump to subroutine
	ASL $9F6E			; 0E 6E 9F | Arithmetic shift left (absolute)
	EOR ($61),Y		  ; 51 61 | Exclusive OR with accumulator ((zero page),Y)
	LDY $E0			  ; A4 E0 | Game work RAM access
	BIT $BC3F			; 2C 3F BC | Test bits in accumulator (absolute)
	BMI $C3			  ; 30 C3 | Branch if negative
	STA ($00),Y		  ; 91 00 | Update graphics data
	BEQ $00			  ; F0 00 | Branch if equal
	INC $1F00,X		  ; FE 00 1F | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	INC $3F0F			; EE 0F 3F | Increment (absolute)
	BMI $CF			  ; 30 CF | Branch if negative
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $FF			  ; 30 FF | Branch if negative
	SEC				  ; 38 | Set carry flag
	STY $17FC			; 8C FC 17 | Store Y register to absolute address
	BEQ $7C			  ; F0 7C | Branch if equal
	CPX $EFF0			; EC F0 EF | Compare X register (absolute)
	BCS $EF			  ; B0 EF | Branch if carry set
	BEQ $FF			  ; F0 FF | Branch if equal
	INX				  ; E8 | Increment X register
	BEQ $FB			  ; F0 FB | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$F3			 ; E0 F3 | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA $FFFFFF		  ; 8F FF FF FF | Update graphics data

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_072
; Address: $E79480
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_072:
	EOR $8EBE,X		  ; 5D BE 8E | Exclusive OR with accumulator (absolute,X)
	INC $FF0F,X		  ; FE 0F FF | Increment (absolute,X)
	INC $C3FE,X		  ; FE FE C3 | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	PEA #$FCFE		   ; F4 FE FC | Push effective address to stack
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	SBC $FEFF,X		  ; FD FF FE | Subtract with carry (absolute,X)
	CMP $864D,Y		  ; D9 4D 86 | Compare accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	LDA $EC			  ; A5 EC | Read graphics status
	LSR $A2A0			; 4E A0 A2 | Logical shift right (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	LSR $FDE4,X		  ; 5E E4 FD | Logical shift right (absolute,X)
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	LDX $FF00,Y		  ; BE 00 FF | Load from absolute,Y into X register
	BPL $FF			  ; 10 FF | Branch if positive
	BCS $4E			  ; B0 4E | Branch if carry set
	SBC $E916,X		  ; FD 16 E9 | Subtract with carry (absolute,X)
	STA $9E9C,X		  ; 9D 9C 9E | Update graphics data
	STA				  ; 9F 93 99 9F | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	STA ($9E),Y		  ; 91 9E | Update graphics data
	STA $9D93,X		  ; 9D 93 9D | Update graphics data
	STZ $2FCD,X		  ; 9E CD 2F | Store zero to absolute,X
	DEC $CF2F			; CE 2F CF | Decrement (absolute)
	CPY $C4			  ; C4 C4 | Compare Y register (zero page)
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	CPY #$B8			 ; C0 B8 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	STZ $4F			  ; 64 4F | Store zero to zero page
	LSR $391D,X		  ; 5E 1D 39 | Logical shift right (absolute,X)
	SEC				  ; 38 | Set carry flag
	ASL $1C0B,X		  ; 1E 0B 1C | Arithmetic shift left (absolute,X)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ROL $77			  ; 26 77 | Rotate left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROL $3F40,X		  ; 3E 40 3F | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_073
; Address: $E7951B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_073:
	JSR $100F			; 20 0F 10 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $9F6E			; 0E 6E 9F | Arithmetic shift left (absolute)
	BMI $41			  ; 30 41 | Branch if negative
	STY $A3E0			; 8C E0 A3 | Store Y register to absolute address
	ADC $64BE,X		  ; 7D BE 64 | Add with carry (absolute,X)
	STA ($00),Y		  ; 91 00 | Update graphics data
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_074
; Address: $E79534
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_074:
	INC $1F00,X		  ; FE 00 1F | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA $0F1E,X		  ; 1D 1E 0F | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	STA $103448		  ; 8F 48 34 10 | Update graphics data
	STZ $E1F3			; 9C F3 E1 | Store zero to absolute
	BRA $FE			  ; 80 FE | Branch always
	PEA #$FF78		   ; F4 78 FF | Push effective address to stack
	BRA $FF			  ; 80 FF | Branch always
	BPL $80			  ; 10 80 | Branch if positive
	EOR $811D,X		  ; 5D 1D 81 | Exclusive OR with accumulator (absolute,X)
	STA ($72,X)		  ; 81 72 | Update graphics data
	SEC				  ; 38 | Set carry flag
	BIT $FB			  ; 24 FB | Test bits in accumulator (zero page)
	CMP ($FD,X)		  ; C1 FD | Compare accumulator ((zero page,X))
	SEP #$00			 ; E2 00 | Set processor status bits
	ROR $7C00,X		  ; 7E 00 7C | Rotate right (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC $0002,X		  ; FD 02 00 | Subtract with carry (absolute,X)
	EOR $DD63,X		  ; 5D 63 DD | Exclusive OR with accumulator (absolute,X)
	CPY $E7			  ; C4 E7 | Compare Y register (zero page)
	STZ $BF			  ; 64 BF | Store zero to zero page
	REP #$DB			 ; C2 DB | Reset processor status bits
	LDY $BC00,X		  ; BC 00 BC | Load from absolute,X into Y register
	ROL $FF00,X		  ; 3E 00 FF | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_075
; Address: $E795BD
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_075:
	JSR $24DB			; 20 DB 24 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BVC $EE			  ; 50 EE | Branch if overflow clear
	BRA $AF			  ; 80 AF | Branch always
	BEQ $D1			  ; F0 D1 | Branch if equal
	BMI $DE			  ; 30 DE | Branch if negative
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA $FB			  ; 05 FB | Logical OR with accumulator (zero page)
	ORA ($EF),Y		  ; 11 EF | Logical OR with accumulator ((zero page),Y)
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ASL $012F,X		  ; 1E 2F 01 | Arithmetic shift left (absolute,X)
	LSR $B9BE,X		  ; 5E BE B9 | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_076
; Address: $E795E6
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_076:
	JMP $FFA5FC		  ; 5C FC A5 FF | Jump to address long
	SED				  ; F8 | Set decimal mode flag
	BRA $DE			  ; 80 DE | Branch always
	INC $F701,X		  ; FE 01 F7 | Increment (absolute,X)
	LDA				  ; BF 00 A3 00 | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	AND ($6E,X)		  ; 21 6E | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_077
; Address: $E79601
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_077:
	ROL $B7DE			; 2E DE B7 | Rotate left (absolute)
	INY				  ; C8 | Increment Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	DEX				  ; CA | Decrement X register
	TXA				  ; 8A | Transfer X register to accumulator
	ADC $FC93,X		  ; 7D 93 FC | Add with carry (absolute,X)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BCC $9F			  ; 90 9F | Branch if carry clear
	STZ $9F9F,X		  ; 9E 9F 9F | Store zero to absolute,X
	STA				  ; 9F 9F 9F 9C | Update graphics data
	STA				  ; 9F 99 9E 9B | Update graphics data
	STY $889F			; 8C 9F 88 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_079
; Address: $E7963D
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_079:
	JSR $20DF			; 20 DF 20 | Jump to subroutine
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $D7			  ; F0 D7 | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	AND #$22			 ; 29 22 | Logical AND with accumulator (immediate)
	AND $22			  ; 25 22 | Logical AND with accumulator (zero page)
	ROL $6B23			; 2E 23 6B | Rotate left (absolute)
	AND #$4A			 ; 29 4A | Logical AND with accumulator (immediate)
	EOR $36			  ; 45 36 | Exclusive OR with accumulator (zero page)
	ROL $3F4B,X		  ; 3E 4B 3F | Rotate left (absolute,X)
	EOR ($7D),Y		  ; 51 7D | Exclusive OR with accumulator ((zero page),Y)
	STY $6F			  ; 84 6F | Store Y register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	BRA $04			  ; 80 04 | Branch always
	JMP $1860			; 4C 60 18 | Jump to address
	STA				  ; 9F 93 63 6F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	SEI				  ; 78 | Set interrupt disable flag
	BCS $FB			  ; B0 FB | Branch if carry set
	BRA $9F			  ; 80 9F | Branch always
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	EOR $811D,X		  ; 5D 1D 81 | Exclusive OR with accumulator (absolute,X)
	STA ($72,X)		  ; 81 72 | Update graphics data
	SEC				  ; 38 | Set carry flag
	BIT $FB			  ; 24 FB | Test bits in accumulator (zero page)
	CMP ($FD,X)		  ; C1 FD | Compare accumulator ((zero page,X))
	SEP #$00			 ; E2 00 | Set processor status bits
	ROR $7C00,X		  ; 7E 00 7C | Rotate right (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC $E302,X		  ; FD 02 E3 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_07A
; Address: $E796C1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_07A:
	PHP				  ; 08 | Push processor status to stack
	INX				  ; E8 | Increment X register
	ORA $961C,X		  ; 1D 1C 96 | Logical OR with accumulator (absolute,X)
	INC $0FCB,X		  ; FE CB 0F | Increment (absolute,X)
	ROR $F6			  ; 66 F6 | Rotate right (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_07B
; Address: $E796CF
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_07B:
	BEQ $FF			  ; F0 FF | Branch if equal
	XBA				  ; EB | Exchange accumulator bytes
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	LDA $E2FD,X		  ; BD FD E2 | Read graphics status
	TXS				  ; 9A | Transfer X register to stack pointer
	STZ $E3			  ; 64 E3 | Store zero to zero page
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ROL $0EFF			; 2E FF 0E | Rotate left (absolute)
	ADC $7D02,X		  ; 7D 02 7D | Add with carry (absolute,X)
	ORA $011C,X		  ; 1D 1C 01 | Logical OR with accumulator (absolute,X)
	SBC $0BE9,X		  ; FD E9 0B | Subtract with carry (absolute,X)
	STA $FFF3FF		  ; 8F FF F3 FF | Update graphics data
	ADC $047F,X		  ; 7D 7F 04 | Add with carry (absolute,X)
	BRA $04			  ; 80 04 | Branch always
	PLX				  ; FA | Pull X register from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $B1F0			; 8C F0 B1 | Store Y register to absolute address
	STX $70EE			; 8E EE 70 | Store X register to absolute address
	WDM #$F3			 ; 42 F3 | Reserved instruction
	SBC ($FB),Y		  ; F1 FB | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	SBC ($F7),Y		  ; F1 F7 | Subtract with carry ((zero page),Y)
	SBC ($15),Y		  ; F1 15 | Subtract with carry ((zero page),Y)
	PHX				  ; DA | Push X register to stack
	DEC $A5B4,X		  ; DE B4 A5 | Decrement (absolute,X)
	TXS				  ; 9A | Transfer X register to stack pointer
	LDX #$1B			 ; A2 1B | Load immediate value into X register
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	INC $DD09,X		  ; FE 09 DD | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_07C
; Address: $E79759
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_07C:
	JSL $BB4AB7		  ; 22 B7 4A BB | Jump to subroutine long
	EOR $3F			  ; 45 3F | Exclusive OR with accumulator (zero page)
	CPY #$14			 ; C0 14 | Compare Y register (immediate)
	STZ $0A			  ; 64 0A | Store zero to zero page
	BIT $8C38			; 2C 38 8C | Test bits in accumulator (absolute)
	EOR ($21),Y		  ; 51 21 | PPU graphics register access
	LDA $9F4828		  ; AF 28 48 9F | Read graphics status
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $FB			  ; F0 FB | Branch if equal

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_07D
; Address: $E79771
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_07D:
	BRA $FC			  ; 80 FC | Branch always
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $3F			  ; F0 3F | Branch if equal
	INC $D70F,X		  ; FE 0F D7 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BPL $E3			  ; 10 E3 | Branch if positive
	INX				  ; E8 | Increment X register
	ASL $961E,X		  ; 1E 1E 96 | Arithmetic shift left (absolute,X)
	BMI $F0			  ; 30 F0 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	LDA #$56			 ; A9 56 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $23			  ; 25 23 | Logical AND with accumulator (zero page)
	ADC ($9F,X)		  ; 61 9F | Add with carry ((zero page,X))
	ASL $2E01,X		  ; 1E 01 2E | Arithmetic shift left (absolute,X)
	ASL $23FF			; 0E FF 23 | Arithmetic shift left (absolute)
	SBC $DF00,X		  ; FD 00 DF | Subtract with carry (absolute,X)
	BRA $33			  ; 80 33 | Branch always
	BIT $0830			; 2C 30 08 | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_07E
; Address: $E797D5
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_07E:
	JSR $100F			; 20 0F 10 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA $3F40C0		  ; AF C0 40 3F | Read graphics status
	AND $F9B1,Y		  ; 39 B1 F9 | Logical AND with accumulator (absolute,Y)
	SBC $F686,Y		  ; F9 86 F6 | Subtract with carry (absolute,Y)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	BVS $4F			  ; 70 4F | Branch if overflow set
	BPL $FF			  ; 10 FF | Branch if positive
	DEC $8600			; CE 00 86 | Decrement (absolute)
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PEA #$0008		   ; F4 08 00 | Push effective address to stack
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC $F600,X		  ; FD 00 F6 | Subtract with carry (absolute,X)
	INC $02			  ; E6 02 | Increment (zero page)
	SBC ($03,X)		  ; E1 03 | Subtract with carry ((zero page,X))
	CMP #$0B			 ; C9 0B | Compare accumulator (immediate)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FC00,X		  ; FD 00 FC | Subtract with carry (absolute,X)
	PEA #$E000		   ; F4 00 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_07F
; Address: $E798A0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_07F:
	ORA $1637,Y		  ; 19 37 16 | Logical OR with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_080
; Address: $E798B5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_080:
	JSR $100F			; 20 0F 10 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PEA #$0738		   ; F4 38 07 | Push effective address to stack
	ORA $F951,Y		  ; 19 51 F9 | Logical OR with accumulator (absolute,Y)
	ADC $F646,Y		  ; 79 46 F6 | Add with carry (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_081
; Address: $E798CC
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_081:
	BMI $2F			  ; 30 2F | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	INC $C600			; EE 00 C6 | Increment (absolute)
	SBC $7F00,Y		  ; F9 00 7F | Subtract with carry (absolute,Y)
	BRA $3F			  ; 80 3F | Branch always
	SBC #$3E			 ; E9 3E | Subtract with carry (immediate)
	SBC $FB06,Y		  ; F9 06 FB | Subtract with carry (absolute,Y)
	ASL $19F3			; 0E F3 19 | Arithmetic shift left (absolute)
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BVC $0F			  ; 50 0F | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 5F 20 | Read graphics status
	ROL $4E7E			; 2E 7E 4E | Rotate left (absolute)
	ASL $0060,X		  ; 1E 60 00 | Arithmetic shift left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_084
; Address: $E7991C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_084:
	EOR ($0F),Y		  ; 51 0F | Exclusive OR with accumulator ((zero page),Y)
	ADC ($0F),Y		  ; 71 0F | Add with carry ((zero page),Y)
	ASL $9F6C			; 0E 6C 9F | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	STZ $70C0			; 9C C0 70 | Store zero to absolute
	LDY $44			  ; A4 44 | Load from zero page into Y register
	LDY $44			  ; A4 44 | Load from zero page into Y register
	LDY $93			  ; A4 93 | Load from zero page into Y register
	PEA #$FC00		   ; F4 00 FC | Push effective address to stack
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	CPY $0B			  ; C4 0B | Compare Y register (zero page)
	CPY #$1B			 ; C0 1B | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_085
; Address: $E79940
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_085:
	LSR $570F			; 4E 0F 57 | Logical shift right (absolute)
	JMP $363F			; 4C 3F 36 | Jump to address
	ORA $1738,Y		  ; 19 38 17 | Logical OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_086
; Address: $E7994C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_086:
	LSR $473F,X		  ; 5E 3F 47 | Logical shift right (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_087
; Address: $E79956
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_087:
	JSR $2000			; 20 00 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SEI				  ; 78 | Set interrupt disable flag
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $7F			  ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_088
; Address: $E79968
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_088:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_089
; Address: $E7996F
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_089:
	JMP $000000		  ; 5C 00 00 00 | Jump to address long
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	ROL $CECF			; 2E CF CE | Rotate left (absolute)
	STZ $9A1F,X		  ; 9E 1F 9A | Store zero to absolute,X
	WDM #$7F			 ; 42 7F | Reserved instruction
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LSR $3EC2			; 4E C2 3E | Logical shift right (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	LSR $3C			  ; 46 3C | Logical shift right (zero page)
	REP #$C8			 ; C2 C8 | Reset processor status bits
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	DEC $A8			  ; C6 A8 | Decrement (zero page)
	LSR $4A			  ; 46 4A | Logical shift right (zero page)
	CMP $BB44			; CD 44 BB | Compare accumulator (absolute)
	REP #$3D			 ; C2 3D | Reset processor status bits

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_08A
; Address: $E799F9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_08A:
	XBA				  ; EB | Exchange accumulator bytes
	BMI $CF			  ; 30 CF | Branch if negative
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	ORA ($7A,X)		  ; 01 7A | Logical OR with accumulator ((zero page,X))
	ASL $D7			  ; 06 D7 | Arithmetic shift left (zero page)
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	INC $BC00,X		  ; FE 00 BC | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $A400,X		  ; FE 00 A4 | Increment (absolute,X)
	STY $FF			  ; 84 FF | Store Y register to zero page
	ROL $DE			  ; 26 DE | Rotate left (zero page)
	CMP #$38			 ; C9 38 | Compare accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_08B
; Address: $E79A2E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_08B:
	XBA				  ; EB | Exchange accumulator bytes
	STY $C0			  ; 84 C0 | Store Y register to zero page
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	LSR $7A23,X		  ; 5E 23 7A | Logical shift right (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP ($ED),Y		  ; D1 ED | Compare accumulator ((zero page),Y)
	BNE $EE			  ; D0 EE | Branch if not equal
	PHA				  ; 48 | Push accumulator to stack
	STA ($68),Y		  ; 91 68 | Update graphics data
	LDA ($58,X)		  ; A1 58 | Read graphics status
	STY $59			  ; 84 59 | Store Y register to zero page
	CPY $19			  ; C4 19 | Compare Y register (zero page)
	LDA $C870D8		  ; AF D8 70 C8 | Read graphics status
	BVS $13			  ; 70 13 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_08C
; Address: $E79A6D
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_08C:
	JSR $6617			; 20 17 66 | Jump to subroutine
	BRA $50			  ; 80 50 | Branch always
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 40 BF 04 | Read graphics status
	SBC $F70A,Y		  ; F9 0A F7 | Subtract with carry (absolute,Y)
	ORA $04E9,Y		  ; 19 E9 04 | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	PLP				  ; 28 | Pull processor status from stack
	CPY $1FD2			; CC D2 1F | Compare Y register (absolute)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	EOR ($90,X)		  ; 41 90 | Exclusive OR with accumulator ((zero page,X))
	CMP ($E2),Y		  ; D1 E2 | Compare accumulator ((zero page),Y)
	LDX $14			  ; A6 14 | Load from zero page into X register
	LDA $9B19			; AD 19 9B | Read graphics status
	JMP $C311F4		  ; 5C F4 11 C3 | Jump to address long
	LDA				  ; BF 0E BE 0D | Read graphics status

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_08D
; Address: $E79AB4
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_08D:
	STA $DB0B,X		  ; 9D 0B DB | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	CPX $AB10			; EC 10 AB | Compare X register (absolute)
	BPL $FC			  ; 10 FC | Branch if positive
	ADC $565E,X		  ; 7D 5E 56 | Add with carry (absolute,X)
	ADC $3E29,X		  ; 7D 29 3E | Add with carry (absolute,X)
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	JMP ($7743)		  ; 6C 43 77 | Jump to address (absolute indirect)
	PHP				  ; 08 | Push processor status to stack
	ROR $3700,X		  ; 7E 00 37 | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_08F
; Address: $E79AE1
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_08F:
	JSR $2AC0			; 20 C0 2A | Jump to subroutine
	ADC ($31),Y		  ; 71 31 | Add with carry ((zero page),Y)
	LDA ($E1,X)		  ; A1 E1 | Read graphics status
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	LDA ($6F,X)		  ; A1 6F | Read graphics status
	DEC $1BC4,X		  ; DE C4 1B | Decrement (absolute,X)
	CPY $11			  ; C4 11 | Compare Y register (zero page)
	DEX				  ; CA | Decrement X register
	BVC $0E			  ; 50 0E | Branch if overflow clear
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	INC $18			  ; E6 18 | Increment (zero page)
	DEC $7F10			; CE 10 7F | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_090
; Address: $E79B00
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_090:
	JSR $6C1F			; 20 1F 6C | Jump to subroutine
	BCC $6F			  ; 90 6F | Branch if carry clear
	LDY #$5F			 ; A0 5F | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_091
; Address: $E79B08
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_091:
	JSL $98B1C1		  ; 22 C1 B1 98 | Jump to subroutine long
	JMP $201C1B		  ; 5C 1B 1C 20 | Jump to address long
	JMP $9F00			; 4C 00 9F | Jump to address
	LDA				  ; BF 00 BF 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_092
; Address: $E79B1F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_092:
	JSR $F00F			; 20 0F F0 | Jump to subroutine
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $1E			  ; E6 1E | Increment (zero page)
	BPL $11			  ; 10 11 | Branch if positive
	INC $EF00			; EE 00 EF | Increment (absolute)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FF00			; EE 00 FF | Increment (absolute)
	SBC $F201,Y		  ; F9 01 F2 | Subtract with carry (absolute,Y)
	CPX $07			  ; E4 07 | Compare X register (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_093
; Address: $E79B54
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_093:
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $D7			  ; 06 D7 | Arithmetic shift left (zero page)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $E800,X		  ; FE 00 E8 | Increment (absolute,X)
	ADC #$6A			 ; 69 6A | Add with carry (immediate)
	DEX				  ; CA | Decrement X register
	LDA				  ; BF 92 FF 33 | Read graphics status
	INC $E39F,X		  ; FE 9F E3 | Increment (absolute,X)
	STA $000E00		  ; 8F 00 0E 00 | Update graphics data
	ASL $7E00,X		  ; 1E 00 7E | Arithmetic shift left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	JMP $4C23			; 4C 23 4C | Jump to address
	CPX $2CC3			; EC C3 2C | Compare X register (absolute)
	CMP ($E2,X)		  ; C1 E2 | Compare accumulator ((zero page,X))
	CMP ($F9,X)		  ; C1 F9 | Compare accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	LDA $80C8,Y		  ; B9 C8 80 | Read graphics status
	BRA $3F			  ; 80 3F | Branch always
	LDA				  ; BF 00 FF 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	TAX				  ; AA | Transfer accumulator to X register
	INY				  ; C8 | Increment Y register
	ASL $0CB2			; 0E B2 0C | Arithmetic shift left (absolute)
	INC $6E97			; EE 97 6E | Increment (absolute)
	JMP $4A7F			; 4C 7F 4A | Jump to address
	ADC $F900,X		  ; 7D 00 F9 | Add with carry (absolute,X)
	LDA				  ; BF 00 BF 00 | Read graphics status
	LSR $EC29,X		  ; 5E 29 EC | Logical shift right (absolute,X)
	BPL $D4			  ; 10 D4 | Branch if positive
	BPL $D4			  ; 10 D4 | Branch if positive
	CPX $10			  ; E4 10 | Compare X register (zero page)
	BEQ $BD			  ; F0 BD | Branch if equal
	SBC $FF1B,X		  ; FD 1B FF | Subtract with carry (absolute,X)
	LDA ($7E,X)		  ; A1 7E | Read graphics status
	ROL $3F6B,X		  ; 3E 6B 3F | Rotate left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_094
; Address: $E79C00
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_094:
	LSR $75			  ; 46 75 | Logical shift right (zero page)
	ADC $575F,X		  ; 7D 5F 57 | Add with carry (absolute,X)
	ADC $3E29,X		  ; 7D 29 3E | Add with carry (absolute,X)
	ORA ($08),Y		  ; 11 08 | Logical OR with accumulator ((zero page),Y)
	ADC $7742			; 6D 42 77 | Add with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	ADC $7E00,X		  ; 7D 00 7E | Add with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_097
; Address: $E79C21
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_097:
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BRA $BF			  ; 80 BF | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	ADC $32E1,Y		  ; 79 E1 32 | Add with carry (absolute,Y)
	ADC $9DDF,X		  ; 7D DF 9D | Add with carry (absolute,X)
	ORA $1F80,X		  ; 1D 80 1F | Logical OR with accumulator (absolute,X)
	SBC $F306,Y		  ; F9 06 F3 | Subtract with carry (absolute,Y)
	SBC $D99D			; ED 9D D9 | Subtract with carry (absolute)
	LDA #$AC			 ; A9 AC | Read graphics status
	CPX $B0			  ; E4 B0 | Compare X register (zero page)
	BEQ $0E			  ; F0 0E | Branch if equal
	ROR $3808			; 6E 08 38 | Rotate right (absolute)
	INC				  ; 1A | Increment accumulator
	SBC $F902,X		  ; FD 02 F9 | Subtract with carry (absolute,X)
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	INC $6E01,X		  ; FE 01 6E | Increment (absolute,X)
	STA ($38),Y		  ; 91 38 | Update graphics data
	ASL $0121,X		  ; 1E 21 01 | Arithmetic shift left (absolute,X)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	ROL $1E27			; 2E 27 1E | Rotate left (absolute)
	AND $902A			; 2D 2A 90 | Logical AND with accumulator (absolute)
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $0600			; 0D 00 06 | Logical OR with accumulator (absolute)
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_098
; Address: $E79C80
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_098:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BCS $20			  ; B0 20 | Branch if carry set

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_099
; Address: $E79C86
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_099:
	JSR $3080			; 20 80 30 | Jump to subroutine
	BNE $98			  ; D0 98 | Branch if not equal
	PHA				  ; 48 | Push accumulator to stack
	JMP $EB24			; 4C 24 EB | Jump to address
	ORA $0000,Y		  ; 19 00 00 | Logical OR with accumulator (absolute,Y)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BNE $00			  ; D0 00 | Branch if not equal
	BVS $80			  ; 70 80 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_09A
; Address: $E79C98
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_09A:
	JSR $34C0			; 20 C0 34 | Jump to subroutine
	CPY #$1A			 ; C0 1A | Compare Y register (immediate)
	CPX #$06			 ; E0 06 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	LDX $BCA4			; AE A4 BC | Load from absolute address into X register
	PLP				  ; 28 | Pull processor status from stack
	INY				  ; C8 | Increment Y register
	INC $FB05			; EE 05 FB | Increment (absolute)
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_09B
; Address: $E79CAB
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_09B:
	AND $1824,X		  ; 3D 24 18 | Logical AND with accumulator (absolute,X)
	BPL $5B			  ; 10 5B | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BCS $4E			  ; B0 4E | Branch if carry set
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	EOR #$F6			 ; 49 F6 | Exclusive OR with accumulator (immediate)
	PHY				  ; 5A | Push Y register to stack
	SBC ($BF),Y		  ; F1 BF | Subtract with carry ((zero page),Y)
	ADC $FE			  ; 65 FE | Add with carry (zero page)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	EOR ($B8),Y		  ; 51 B8 | Exclusive OR with accumulator ((zero page),Y)
	INC $C610			; EE 10 C6 | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	LDA $1A			  ; A5 1A | Read graphics status
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Read graphics status
	RTI				  ; 40 | Return from interrupt
	BVS $60			  ; 70 60 | Branch if overflow set
	BVS $F8			  ; 70 F8 | Branch if overflow set
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	BVC $90			  ; 50 90 | Branch if overflow clear
	BVC $B0			  ; 50 B0 | Branch if overflow clear
	LDY #$E0			 ; A0 E0 | Game work RAM access
	BRA $10			  ; 80 10 | Branch always
	LDY #$10			 ; A0 10 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_09C
; Address: $E79CF4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_09C:
	JSR $8018			; 20 18 80 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_09D
; Address: $E79D02
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_09D:
	LDA				  ; BF C3 7F 83 | Read graphics status
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BVC $E1			  ; 50 E1 | Branch if overflow clear
	ADC ($6B),Y		  ; 71 6B | Add with carry ((zero page),Y)
	ORA ($6D),Y		  ; 11 6D | Logical OR with accumulator ((zero page),Y)
	CMP $3B			  ; C5 3B | Compare accumulator (zero page)
	ORA $FB			  ; 05 FB | Logical OR with accumulator (zero page)
	ORA $FB			  ; 05 FB | Logical OR with accumulator (zero page)
	DEC $39			  ; C6 39 | Decrement (zero page)
	LSR $1DB1			; 4E B1 1D | Logical shift right (absolute)
	SBC ($1D,X)		  ; E1 1D | Subtract with carry ((zero page,X))
	SBC ($90,X)		  ; E1 90 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_09E
; Address: $E79D60
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_09E:
	INC				  ; 1A | Increment accumulator
	ASL $4CE4			; 0E E4 4C | Arithmetic shift left (absolute)
	CPX $0A			  ; E4 0A | Compare X register (zero page)
	INC				  ; 1A | Increment accumulator
	STA $3D			  ; 85 3D | Update graphics data
	ORA #$3D			 ; 09 3D | Logical OR with accumulator (immediate)
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	ORA #$3B			 ; 09 3B | Logical OR with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	AND $F6			  ; 25 F6 | Logical AND with accumulator (zero page)
	EOR #$F6			 ; 49 F6 | Exclusive OR with accumulator (immediate)
	EOR #$60			 ; 49 60 | Exclusive OR with accumulator (immediate)
	BIT $5F			  ; 24 5F | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_09F
; Address: $E79D84
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_09F:
	JSR $015F			; 20 5F 01 | Jump to subroutine
	LSR $4B13,X		  ; 5E 13 4B | Logical shift right (absolute,X)
	BIT $1B5C			; 2C 5C 1B | Test bits in accumulator (absolute)
	LSR $40			  ; 46 40 | Logical shift right (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0A0
; Address: $E79D94
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0A0:
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	JMP ($7303)		  ; 6C 03 73 | Jump to address (absolute indirect)
	JMP ($7910)		  ; 6C 10 79 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0A1
; Address: $E79D9F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0A1:
	JSR $0407			; 20 07 04 | Jump to subroutine
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ORA $020D			; 0D 0D 02 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA ($72,X)		  ; 01 72 | Logical OR with accumulator ((zero page,X))
	EOR #$4E			 ; 49 4E | Exclusive OR with accumulator (immediate)
	BCS $86			  ; B0 86 | Branch if carry set

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0A2
; Address: $E79DC6
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0A2:
	JSR $82A2			; 20 A2 82 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	BVC $8B			  ; 50 8B | Branch if overflow clear
	PLB				  ; AB | Pull data bank register from stack
	EOR $7880			; 4D 80 78 | Exclusive OR with accumulator (absolute)
	BRA $B1			  ; 80 B1 | Branch always
	PHA				  ; 48 | Push accumulator to stack
	BCS $4D			  ; B0 4D | Branch if carry set
	BNE $2D			  ; D0 2D | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	LDA $EB24CB		  ; AF CB 24 EB | Read graphics status
	LDA				  ; BF FF 5E BF | Read graphics status
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF E1 1E F5 | Read graphics status
	SBC #$FF			 ; E9 FF | Subtract with carry (immediate)
	SBC $F3FB,X		  ; FD FB F3 | Subtract with carry (absolute,X)
	SBC $0006,Y		  ; F9 06 00 | Subtract with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0A3
; Address: $E79E1B
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0A3:
	LDA				  ; BF F3 0C FF | Read graphics status
	CMP $B9BD			; CD BD B9 | Compare accumulator (absolute)
	BIT #$4C			 ; 89 4C | Test bits in accumulator (immediate)
	STY $79			  ; 84 79 | Store Y register to zero page
	CMP $B6D6,Y		  ; D9 D6 B6 | Compare accumulator (absolute,Y)
	LDA #$A8			 ; A9 A8 | Read graphics status
	LDA				  ; BF 40 7D 02 | Read graphics status
	ADC $FD06,Y		  ; 79 06 FD | Add with carry (absolute,Y)
	LSR $5901			; 4E 01 59 | Logical shift right (absolute)
	ASL $C7			  ; 06 C7 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	STY $F8			  ; 84 F8 | Store Y register to zero page
	JMP $1C72			; 4C 72 1C | Jump to address
	PLY				  ; 7A | Pull Y register from stack
	STZ $7E			  ; 64 7E | Store zero to zero page
	ROL $31DE,X		  ; 3E DE 31 | Rotate left (absolute,X)
	PHX				  ; DA | Push X register to stack
	DEX				  ; CA | Decrement X register
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	EOR $6580,Y		  ; 59 80 65 | Exclusive OR with accumulator (absolute,Y)
	BRA $E4			  ; 80 E4 | Branch always
	STY $3B			  ; 84 3B | Store Y register to zero page
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	AND #$81			 ; 29 81 | Logical AND with accumulator (immediate)
	BIT $AF80			; 2C 80 AF | Test bits in accumulator (absolute)
	BRA $AF			  ; 80 AF | Branch always
	BRA $7C			  ; 80 7C | Branch always
	PEA #$F448		   ; F4 48 F4 | Push effective address to stack
	PHA				  ; 48 | Push accumulator to stack
	INC $FF50,X		  ; FE 50 FF | Increment (absolute,X)
	BVC $FF			  ; 50 FF | Branch if overflow clear
	BVC $FF			  ; 50 FF | Branch if overflow clear
	BPL $01			  ; 10 01 | Branch if positive
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $180E			; 0D 0E 18 | Logical OR with accumulator (absolute)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	STA $8C84,X		  ; 9D 84 8C | Update graphics data
	CMP ($C6,X)		  ; C1 C6 | Compare accumulator ((zero page,X))
	STZ $64			  ; 64 64 | Store zero to zero page
	ORA $9ABD,X		  ; 1D BD 9A | Logical OR with accumulator (absolute,X)
	STZ $FF62,X		  ; 9E 62 FF | Store zero to absolute,X
	BPL $E8			  ; 10 E8 | Branch if positive
	BPL $E7			  ; 10 E7 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0A4
; Address: $E79EB9
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0A4:
	CPX $72CD			; EC CD 72 | Compare X register (absolute)
	SBC ($7F,X)		  ; E1 7F | Subtract with carry ((zero page,X))
	SBC $E400,Y		  ; F9 00 E4 | Subtract with carry (absolute,Y)
	CMP $E7B3,Y		  ; D9 B3 E7 | Compare accumulator (absolute,Y)
	LDY #$D4			 ; A0 D4 | Load immediate value into Y register
	STZ $85DC			; 9C DC 85 | Store zero to absolute
	LDX $0F			  ; A6 0F | Load from zero page into X register
	CPX $88			  ; E4 88 | Compare X register (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $F7			  ; 80 F7 | Branch always
	CPX $04			  ; E4 04 | Compare X register (zero page)
	LSR $C3			  ; 46 C3 | Logical shift right (zero page)
	PLX				  ; FA | Pull X register from stack
	PHP				  ; 08 | Push processor status to stack
	SBC $F40B,X		  ; FD 0B F4 | Subtract with carry (absolute,X)
	PLX				  ; FA | Pull X register from stack
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STY $04			  ; 84 04 | Store Y register to zero page
	BEQ $04			  ; F0 04 | Branch if equal
	ORA $17E1,X		  ; 1D E1 17 | Logical OR with accumulator (absolute,X)
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	ASL $0F03			; 0E 03 0F | Arithmetic shift left (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INC $9A2C			; EE 2C 9A | Increment (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	ASL $7C5D,X		  ; 1E 5D 7C | Arithmetic shift left (absolute,X)
	LDA				  ; BF F9 3E FD | Read graphics status
	AND $0302,X		  ; 3D 02 03 | Logical AND with accumulator (absolute,X)
	INC $5B11			; EE 11 5B | Increment (absolute)
	BIT $DE			  ; 24 DE | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	SBC $FB18,Y		  ; F9 18 FB | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	ORA ($72,X)		  ; 01 72 | Logical OR with accumulator ((zero page,X))
	EOR #$4E			 ; 49 4E | Exclusive OR with accumulator (immediate)
	BCS $86			  ; B0 86 | Branch if carry set

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0A5
; Address: $E79F46
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0A5:
	JSR $A0A2			; 20 A2 A0 | Jump to subroutine
	LDY $60			  ; A4 60 | Load from zero page into Y register
	LDY $91A2			; AC A2 91 | Load from absolute address into Y register
	ORA $7880			; 0D 80 78 | Logical OR with accumulator (absolute)
	BRA $B1			  ; 80 B1 | Branch always
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0A6
; Address: $E79F56
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0A6:
	BCS $4D			  ; B0 4D | Branch if carry set
	BEQ $0B			  ; F0 0B | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0A8
; Address: $E79F5F
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0A8:
	JSR $88C7			; 20 C7 88 | Jump to subroutine
	EOR #$C6			 ; 49 C6 | Exclusive OR with accumulator (immediate)
	CPX #$47			 ; E0 47 | Compare X register (immediate)
	LDX #$09			 ; A2 09 | Load immediate value into X register
	STA ($26),Y		  ; 91 26 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP #$18			 ; C9 18 | Compare accumulator (immediate)
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $0A1E,X		  ; 1D 1E 0A | Logical OR with accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL $1903			; 0E 03 19 | Arithmetic shift left (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	SBC $FB04,X		  ; FD 04 FB | Subtract with carry (absolute,X)
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	JMP $12FA			; 4C FA 12 | Jump to address
	SBC $FA01			; ED 01 FA | Subtract with carry (absolute)
	ORA $32F7			; 0D F7 32 | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0A9
; Address: $E7A000
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0A9:
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $1109			; 0D 09 11 | Logical OR with accumulator (absolute)
	ORA ($0B),Y		  ; 11 0B | Logical OR with accumulator ((zero page),Y)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $1E03			; 0E 03 1E | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0AF
; Address: $E7A064
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0AF:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	BNE $6F			  ; D0 6F | Branch if not equal
	AND #$37			 ; 29 37 | Logical AND with accumulator (immediate)
	BNE $1F			  ; D0 1F | Branch if not equal
	BCC $1F			  ; 90 1F | Branch if carry clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX $FB			  ; E4 FB | Compare X register (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0409,Y		  ; 19 09 04 | Logical OR with accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	PLP				  ; 28 | Pull processor status from stack
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	LSR $6C29,X		  ; 5E 29 6C | Logical shift right (absolute,X)
	BPL $54			  ; 10 54 | Branch if positive
	BPL $54			  ; 10 54 | Branch if positive
	LDY $D0			  ; A4 D0 | Load from zero page into Y register
	BVS $DD			  ; 70 DD | Branch if overflow set
	EOR $4F8B,X		  ; 5D 8B 4F | Exclusive OR with accumulator (absolute,X)
	LDA ($7E,X)		  ; A1 7E | Read graphics status
	ROL $3F6B,X		  ; 3E 6B 3F | Rotate left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0B0
; Address: $E7A0DA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0B0:
	LDA $0FB21F		  ; AF 1F B2 0F | Read graphics status
	LDY $4C03,X		  ; BC 03 4C | Load from absolute,X into Y register
	AND $4BC7,X		  ; 3D C7 4B | Logical AND with accumulator (absolute,X)
	CMP ($72),Y		  ; D1 72 | Compare accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0B1
; Address: $E7A0E9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0B1:
	JMP $946615		  ; 5C 15 66 94 | Jump to address long
	CLV				  ; B8 | Clear overflow flag
	ADC $EE			  ; 65 EE | Add with carry (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0B2
; Address: $E7A0F2
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0B2:
	BCS $00			  ; B0 00 | Branch if carry set
	STY $C000			; 8C 00 C0 | Store Y register to absolute address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 00 06 FD | Update graphics data
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	ADC ($57,X)		  ; 61 57 | Add with carry ((zero page,X))
	ADC ($55,X)		  ; 61 55 | Add with carry ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	LSR $4574			; 4E 74 45 | Logical shift right (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0B3
; Address: $E7A12D
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0B3:
	JSL $1E2F1B		  ; 22 1B 2F 1E | Jump to subroutine long
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ORA $7F			  ; 05 7F | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROR $7D09,X		  ; 7E 09 7D | Rotate right (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $3F			  ; 45 3F | Exclusive OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	LSR $6C29,X		  ; 5E 29 6C | Logical shift right (absolute,X)
	BPL $54			  ; 10 54 | Branch if positive
	BPL $54			  ; 10 54 | Branch if positive
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	BMI $1D			  ; 30 1D | Branch if negative
	ORA $1F1B,X		  ; 1D 1B 1F | Logical OR with accumulator (absolute,X)
	LDA ($7E,X)		  ; A1 7E | Read graphics status
	ROL $3F6B,X		  ; 3E 6B 3F | Rotate left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0B4
; Address: $E7A160
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0B4:
	JMP $C7BD			; 4C BD C7 | Jump to address
	CMP ($72),Y		  ; D1 72 | Compare accumulator ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0B5
; Address: $E7A16B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0B5:
	INC $F4			  ; E6 F4 | Increment (zero page)
	CLV				  ; B8 | Clear overflow flag
	EOR $C28E,X		  ; 5D 8E C2 | Exclusive OR with accumulator (absolute,X)
	BCS $00			  ; B0 00 | Branch if carry set
	STY $C000			; 8C 00 C0 | Store Y register to absolute address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0B6
; Address: $E7A181
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0B6:
	AND $5D26,X		  ; 3D 26 5D | Logical AND with accumulator (absolute,X)
	ROL $3943			; 2E 43 39 | Rotate left (absolute)
	EOR #$68			 ; 49 68 | Exclusive OR with accumulator (immediate)
	ROR $4203			; 6E 03 42 | Hardware register operation
	ORA ($62,X)		  ; 01 62 | Logical OR with accumulator ((zero page,X))
	ORA ($64,X)		  ; 01 64 | Logical OR with accumulator ((zero page,X))
	ORA ($62,X)		  ; 01 62 | Logical OR with accumulator ((zero page,X))
	ORA ($74,X)		  ; 01 74 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $80			  ; 80 80 | Branch always
	CPY $44			  ; C4 44 | Compare Y register (zero page)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0B7
; Address: $E7A1B2
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0B7:
	JSR $2040			; 20 40 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BEQ $00			  ; F0 00 | Branch if equal
	LDA #$57			 ; A9 57 | Read graphics status
	SBC ($25),Y		  ; F1 25 | Subtract with carry ((zero page),Y)
	STA $021E,X		  ; 9D 1E 02 | Update graphics data
	ROL $0AFE			; 2E FE 0A | Rotate left (absolute)
	INC $5E26,X		  ; FE 26 5E | Increment (absolute,X)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	STA ($03,X)		  ; 81 03 | Update graphics data
	INC $FA07,X		  ; FE 07 FA | Increment (absolute,X)
	CPX $1CED			; EC ED 1C | Compare X register (absolute)
	ORA ($EC),Y		  ; 11 EC | Logical OR with accumulator ((zero page),Y)
	CPX $1001			; EC 01 10 | Compare X register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1637,Y		  ; 19 37 16 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0B8
; Address: $E7A213
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0B8:
	JSR $201F			; 20 1F 20 | Jump to subroutine
	BPL $07			  ; 10 07 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	BIT $44			  ; 24 44 | Test bits in accumulator (zero page)
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0B9
; Address: $E7A23C
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0B9:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $C7			  ; 30 C7 | Branch if negative
	PHA				  ; 48 | Push accumulator to stack
	BVS $69			  ; 70 69 | Branch if overflow set
	BCS $36			  ; B0 36 | Branch if carry set
	ADC $EB			  ; 65 EB | Add with carry (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	STY $C600			; 8C 00 C6 | Store Y register to absolute address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	ASL $0E1E			; 0E 1E 0E | Arithmetic shift left (absolute)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	ASL $0C24			; 0E 24 0C | Arithmetic shift left (absolute)
	BIT $0A			  ; 24 0A | Test bits in accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	STA $3D			  ; 85 3D | Update graphics data
	ORA #$3D			 ; 09 3D | Logical OR with accumulator (immediate)
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	ORA #$3B			 ; 09 3B | Logical OR with accumulator (immediate)
	PLX				  ; FA | Pull X register from stack
	AND $F6			  ; 25 F6 | Logical AND with accumulator (zero page)
	EOR #$F6			 ; 49 F6 | Exclusive OR with accumulator (immediate)
	EOR #$24			 ; 49 24 | Exclusive OR with accumulator (immediate)
	EOR $6713,Y		  ; 59 13 67 | Exclusive OR with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $3449,Y		  ; 19 49 34 | Logical OR with accumulator (absolute,Y)
	JMP $0ABC44		  ; 5C 44 BC 0A | Jump to address long
	DEC				  ; 3A | Decrement accumulator
	PLP				  ; 28 | Pull processor status from stack
	JMP $1FD2			; 4C D2 1F | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0BA
; Address: $E7A2D8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0BA:
	JMP ($5C07)		  ; 6C 07 5C | Jump to address (absolute indirect)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	BNE $C0			  ; D0 C0 | Branch if not equal
	BNE $80			  ; D0 80 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	ROL				  ; 2A | Rotate left (accumulator)
	TSX				  ; BA | Transfer stack pointer to X register
	STZ $E4			  ; 64 E4 | Store zero to zero page
	CPX #$E8			 ; E0 E8 | Compare X register (immediate)
	DEX				  ; CA | Decrement X register
	INC $4030,X		  ; FE 30 40 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0BB
; Address: $E7A2F2
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0BB:
	BVS $00			  ; 70 00 | Branch if overflow set
	BVC $20			  ; 50 20 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	BCS $1A			  ; B0 1A | Branch if carry set
	CPX #$14			 ; E0 14 | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BEQ $01			  ; F0 01 | Branch if equal
	PEA #$0102		   ; F4 02 01 | Push effective address to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$19			 ; 09 19 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$19			 ; 09 19 | Logical OR with accumulator (immediate)
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA $9732			; 0D 32 97 | Logical OR with accumulator (absolute)
	ROR $8E			  ; 66 8E | Rotate right (zero page)
	STA ($D0,X)		  ; 81 D0 | Update graphics data
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	BVC $00			  ; 50 00 | Branch if overflow clear
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	CPY $02BC			; CC BC 02 | Compare Y register (absolute)
	BVS $01			  ; 70 01 | Branch if overflow set
	STA ($91),Y		  ; 91 91 | Update graphics data
	ROL $20			  ; 26 20 | Rotate left (zero page)
	SEC				  ; 38 | Set carry flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ROL $DF40			; 2E 40 DF | Rotate left (absolute)
	ADC ($48),Y		  ; 71 48 | Add with carry ((zero page),Y)
	INC $90			  ; E6 90 | Increment (zero page)
	CMP $A9A8,Y		  ; D9 A8 A9 | Compare accumulator (absolute,Y)
	CPX #$B5			 ; E0 B5 | Compare X register (immediate)
	PEA #$6E0F		   ; F4 0F 6E | Push effective address to stack
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	BCC $3B			  ; 90 3B | Branch if carry clear

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0BC
; Address: $E7A37F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0BC:
	JSR $E929			; 20 29 E9 | Jump to subroutine
	BNE $79			  ; D0 79 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0BD
; Address: $E7A386
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0BD:
	ORA $56			  ; 05 56 | Logical OR with accumulator (zero page)
	LDA #$EA			 ; A9 EA | Read graphics status
	STX $00			  ; 86 00 | Store X register to zero page
	STY $00			  ; 84 00 | Store Y register to zero page
	TAY				  ; A8 | Transfer accumulator to Y register
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0BE
; Address: $E7A3A1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0BE:
	JSR $2A40			; 20 40 2A | Jump to subroutine
	ADC ($31),Y		  ; 71 31 | Add with carry ((zero page),Y)
	AND ($61,X)		  ; 21 61 | Logical AND with accumulator ((zero page,X))
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	LDA ($6F,X)		  ; A1 6F | Read graphics status
	DEC $1B44,X		  ; DE 44 1B | Decrement (absolute,X)
	ORA ($4A),Y		  ; 11 4A | Logical OR with accumulator ((zero page),Y)
	BVC $0E			  ; 50 0E | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0BF
; Address: $E7A3B9
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0BF:
	ASL $18E6,X		  ; 1E E6 18 | Arithmetic shift left (absolute,X)
	DEC $7F10			; CE 10 7F | Decrement (absolute)
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	ORA $1B19			; 0D 19 1B | Logical OR with accumulator (absolute)
	ORA ($43),Y		  ; 11 43 | Logical OR with accumulator ((zero page),Y)
	ASL $0D1E			; 0E 1E 0D | Arithmetic shift left (absolute)
	ORA $1B0B,X		  ; 1D 0B 1B | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BIT $2B10			; 2C 10 2B | Test bits in accumulator (absolute)
	BPL $7C			  ; 10 7C | Branch if positive
	ROR				  ; 6A | Rotate right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	LDA $B5			  ; A5 B5 | Read graphics status
	EOR ($74,X)		  ; 41 74 | Exclusive OR with accumulator ((zero page,X))
	TXA				  ; 8A | Transfer X register to accumulator
	SBC $AD92			; ED 92 AD | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0C0
; Address: $E7A3F7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0C0:
	JSL $AA2255		  ; 22 55 22 AA | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	STY $8B			  ; 84 8B | Store Y register to zero page
	CMP $DDCC,X		  ; DD CC DD | Compare accumulator (absolute,X)
	CPY #$5D			 ; C0 5D | Compare Y register (immediate)
	LDA $4800			; AD 00 48 | Read graphics status
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0C2
; Address: $E7A414
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0C2:
	JSL $00FE00		  ; 22 00 FE 00 | Jump to subroutine long
	LDA				  ; BF 00 BB 00 | Read graphics status
	TXA				  ; 8A | Transfer X register to accumulator
	DEY				  ; 88 | Decrement Y register
	CMP ($E1,X)		  ; C1 E1 | Compare accumulator ((zero page,X))
	CMP ($0D,X)		  ; C1 0D | Compare accumulator ((zero page,X))
	CPY $9C5C			; CC 5C 9C | Compare Y register (absolute)
	RTI				  ; 40 | Return from interrupt
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0C3
; Address: $E7A43A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0C3:
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STA $FCCE00		  ; 8F 00 CE FC | Update graphics data
	SBC $FDB5,X		  ; FD B5 FD | Subtract with carry (absolute,X)
	SBC $ED			  ; E5 ED | Subtract with carry (zero page)
	CPY #$E6			 ; C0 E6 | Compare Y register (immediate)
	PEA #$FC02		   ; F4 02 FC | Push effective address to stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	EOR $4E5F,Y		  ; 59 5F 4E | Exclusive OR with accumulator (absolute,Y)
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	BVC $70			  ; 50 70 | Branch if overflow clear
	CLD				  ; D8 | Clear decimal mode flag
	LDY $A3D4			; AC D4 A3 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0C4
; Address: $E7A46C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0C4:
	JSR $6C10			; 20 10 6C | Jump to subroutine
	BVS $60			  ; 70 60 | Branch if overflow set
	ORA ($70),Y		  ; 11 70 | Logical OR with accumulator ((zero page),Y)
	ROL $7F13,X		  ; 3E 13 7F | Rotate left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BIT $590C			; 2C 0C 59 | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0C5
; Address: $E7A489
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0C5:
	JSR $1919			; 20 19 19 | Jump to subroutine
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	BIT $33			  ; 24 33 | Test bits in accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0C7
; Address: $E7A496
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0C7:
	SEI				  ; 78 | Set interrupt disable flag
	ASL $1707,X		  ; 1E 07 17 | Arithmetic shift left (absolute,X)
	ORA $173B			; 0D 3B 17 | Logical OR with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	BCC $C4			  ; 90 C4 | Branch if carry clear
	ROR $C085			; 6E 85 C0 | Rotate right (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $C9			  ; 05 C9 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0C8
; Address: $E7A4CF
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0C8:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CPY $F807			; CC 07 F8 | Compare Y register (absolute)
	LSR $02			  ; 46 02 | Logical shift right (zero page)
	LSR $6D05			; 4E 05 6D | Logical shift right (absolute)
	ROL $2D6B			; 2E 6B 2D | Rotate left (absolute)
	ROR $7F34,X		  ; 7E 34 7F | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	PHP				  ; 08 | Push processor status to stack
	ROR $5900,X		  ; 7E 00 59 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	EOR $40			  ; 45 40 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0C9
; Address: $E7A4FE
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0C9:
	JSR $9320			; 20 20 93 | Jump to subroutine
	SEP #$EE			 ; E2 EE | Set processor status bits
	LDX $3D33,Y		  ; BE 33 3D | Load from absolute,Y into X register
	CPX $79			  ; E4 79 | Compare X register (zero page)
	CMP $F738			; CD 38 F7 | Compare accumulator (absolute)
	DEC $00DC			; CE DC 00 | Decrement (absolute)
	INC $EF01			; EE 01 EF | Increment (absolute)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STY $06			  ; 84 06 | Store Y register to zero page
	BEQ $06			  ; F0 06 | Branch if equal
	BEQ $1E			  ; F0 1E | Branch if equal
	CPX #$17			 ; E0 17 | Compare X register (immediate)
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LSR $39			  ; 46 39 | Logical shift right (zero page)
	BIT #$3B			 ; 89 3B | Test bits in accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	AND #$81			 ; 29 81 | Logical AND with accumulator (immediate)
	BIT $AE80			; 2C 80 AE | Test bits in accumulator (absolute)
	BRA $AF			  ; 80 AF | Branch always
	BRA $79			  ; 80 79 | Branch always
	ROL $F6			  ; 26 F6 | Rotate left (zero page)
	JMP $48F4			; 4C F4 48 | Jump to address
	CPX $FE58			; EC 58 FE | Compare X register (absolute)
	BVC $FF			  ; 50 FF | Branch if overflow clear
	BVC $FF			  ; 50 FF | Branch if overflow clear
	BVC $FF			  ; 50 FF | Branch if overflow clear
	BPL $02			  ; 10 02 | Branch if positive
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	PEA #$F48C		   ; F4 8C F4 | Push effective address to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	BEQ $8B			  ; F0 8B | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA $40BB44		  ; AF 44 BB 40 | Read graphics status
	PHX				  ; DA | Push X register to stack
	BNE $CD			  ; D0 CD | Branch if not equal
	CMP $DD41,X		  ; DD 41 DD | Compare accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	AND $2170,Y		  ; 39 70 21 | PPU graphics register access
	ADC ($07),Y		  ; 71 07 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0CA
; Address: $E7A592
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0CA:
	JSL $002200		  ; 22 00 22 00 | Jump to subroutine long
	SEP #$00			 ; E2 00 | Set processor status bits
	STX $8E00			; 8E 00 8E | Store X register to absolute address
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0CB
; Address: $E7A59E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0CB:
	DEY				  ; 88 | Decrement Y register
	CMP ($DD,X)		  ; C1 DD | Compare accumulator ((zero page,X))
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	PEA #$7777		   ; F4 77 77 | Push effective address to stack
	EOR $37			  ; 45 37 | Exclusive OR with accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0CC
; Address: $E7A5B4
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0CC:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STA $DEAC00		  ; 8F 00 AC DE | Update graphics data
	SBC $C4DE			; ED DE C4 | Subtract with carry (absolute)
	CPX #$F7			 ; E0 F7 | Compare X register (immediate)
	SEP #$E5			 ; E2 E5 | Set processor status bits
	SEP #$E5			 ; E2 E5 | Set processor status bits
	SBC ($EC),Y		  ; F1 EC | Subtract with carry ((zero page),Y)
	CMP ($EC),Y		  ; D1 EC | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0CE
; Address: $E7A5E6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0CE:
	JSR $384F			; 20 4F 38 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	ORA $685F			; 0D 5F 68 | Logical OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0D0
; Address: $E7A5F6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0D0:
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0D1
; Address: $E7A5FE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0D1:
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT $7910			; 2C 10 79 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0D2
; Address: $E7A61F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0D2:
	JSR $430A			; 20 0A 43 | Jump to subroutine
	STA $3D			  ; 85 3D | Update graphics data
	ORA #$6A			 ; 09 6A | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	LDA ($B5),Y		  ; B1 B5 | Read graphics status
	PLX				  ; FA | Pull X register from stack
	AND $F6			  ; 25 F6 | Logical AND with accumulator (zero page)
	EOR #$F5			 ; 49 F5 | Exclusive OR with accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	LDA $5512			; AD 12 55 | Read graphics status

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0D3
; Address: $E7A63B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0D3:
	JSL $4A44AA		  ; 22 AA 44 4A | Jump to subroutine long
	STY $3B			  ; 84 3B | Store Y register to zero page
	AND $3E3F,X		  ; 3D 3F 3E | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0D5
; Address: $E7A65A
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0D5:
	INC $6200,X		  ; FE 00 62 | Increment (absolute,X)
	PEA #$CC0C		   ; F4 0C CC | Push effective address to stack
	PEA #$FC8C		   ; F4 8C FC | Push effective address to stack
	STY $7C			  ; 84 7C | Store Y register to zero page
	STA				  ; 9F E4 D1 91 | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ROR $FF00			; 6E 00 FF | Rotate right (absolute)
	SBC ($2A,X)		  ; E1 2A | Subtract with carry ((zero page,X))
	ORA #$F9			 ; 09 F9 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$F9			 ; 09 F9 | Logical OR with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BPL $E0			  ; 10 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0D6
; Address: $E7A6C2
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0D6:
	JSR $08E8			; 20 E8 08 | Jump to subroutine
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1806			; 0D 06 18 | Logical OR with accumulator (absolute)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $1000			; 0E 00 10 | Arithmetic shift left (absolute)
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	EOR #$46			 ; 49 46 | Exclusive OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0D7
; Address: $E7A708
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0D7:
	WDM #$E9			 ; 42 E9 | Reserved instruction
	AND ($46),Y		  ; 31 46 | Logical AND with accumulator ((zero page),Y)
	DEX				  ; CA | Decrement X register
	LDA #$D8			 ; A9 D8 | Read graphics status
	STZ $10FF			; 9C FF 10 | Store zero to absolute
	BPL $FF			  ; 10 FF | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF 08 2F 14 | Read graphics status
	DEY				  ; 88 | Decrement Y register
	CPX #$40			 ; E0 40 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0D8
; Address: $E7A722
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0D8:
	LDA				  ; BF 00 1F A0 | Read graphics status
	LDA				  ; BF 07 9F C3 | Read graphics status
	LDY $D8C3			; AC C3 D8 | Load from absolute address into Y register
	SEC				  ; 38 | Set carry flag
	LDA				  ; BF 40 FF 40 | Read graphics status
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0D9
; Address: $E7A73B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0D9:
	JSR $10FF			; 20 FF 10 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	EOR #$46			 ; 49 46 | Exclusive OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0DA
; Address: $E7A749
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0DA:
	ORA #$11			 ; 09 11 | Logical OR with accumulator (immediate)
	ROL $0A			  ; 26 0A | Rotate left (zero page)
	EOR #$18			 ; 49 18 | Exclusive OR with accumulator (immediate)
	JMP $7F10FF		  ; 5C FF 10 7F | Jump to address long
	BPL $7F			  ; 10 7F | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BNE $E1			  ; D0 E1 | Branch if not equal
	REP #$F1			 ; C2 F1 | Reset processor status bits
	SBC ($ED),Y		  ; F1 ED | Subtract with carry ((zero page),Y)
	STA $D9FB			; 8D FB D9 | Update graphics data
	BRA $7F			  ; 80 7F | Branch always
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	CMP ($A3,X)		  ; C1 A3 | Compare accumulator ((zero page,X))
	CPY #$8C			 ; C0 8C | Compare Y register (immediate)
	CPY $BF44			; CC 44 BF | Compare Y register (absolute)
	STA $00FF70		  ; 8F 70 FF 00 | Update graphics data
	ROL $3F00,X		  ; 3E 00 3F | Rotate left (absolute,X)
	DEY				  ; 88 | Decrement Y register
	STA $6B6200		  ; 8F 00 62 6B | Update graphics data
	LDX $F7			  ; A6 F7 | Load from zero page into X register
	STY $C8DF			; 8C DF C8 | Store Y register to absolute address
	BIT #$AE			 ; 89 AE | Test bits in accumulator (immediate)
	ASL $034F			; 0E 4F 03 | Arithmetic shift left (absolute)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $20			  ; 10 20 | Branch if positive
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0DB
; Address: $E7A7B7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0DB:
	JSR $2050			; 20 50 20 | Jump to subroutine
	BCS $40			  ; B0 40 | Branch if carry set
	LDY $BF40,X		  ; BC 40 BF | Load from absolute,X into Y register
	RTI				  ; 40 | Return from interrupt
	CMP $31DD			; CD DD 31 | Compare accumulator (absolute)
	ORA ($3E),Y		  ; 11 3E | Logical OR with accumulator ((zero page),Y)
	CPY #$88			 ; C0 88 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0DC
; Address: $E7A7CC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0DC:
	TSX				  ; BA | Transfer stack pointer to X register
	STA $002270		  ; 8F 70 22 00 | Update graphics data
	INC $E300			; EE 00 E3 | Increment (absolute)
	STA $8F00			; 8D 00 8F | Update graphics data
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	BRA $E0			  ; 80 E0 | Game work RAM access
	BPL $60			  ; 10 60 | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	ORA $6EDF			; 0D DF 6E | Logical OR with accumulator (absolute)
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0DD
; Address: $E7A7FA
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0DD:
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	BIT $59CC			; 2C CC 59 | Test bits in accumulator (absolute)
	STA				  ; 9F 18 DF 07 | Update graphics data
	CPX #$19			 ; E0 19 | Compare X register (immediate)
	SBC $FA1A,Y		  ; F9 1A FA | Subtract with carry (absolute,Y)
	CPY $33E4			; CC E4 33 | Compare Y register (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0DF
; Address: $E7A816
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0DF:
	SEI				  ; 78 | Set interrupt disable flag
	ASL $1707,X		  ; 1E 07 17 | Arithmetic shift left (absolute,X)
	ORA $173B			; 0D 3B 17 | Logical OR with accumulator (absolute)
	BRA $7F			  ; 80 7F | Branch always
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FDF6,X		  ; FD F6 FD | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CPY #$6B			 ; C0 6B | Compare Y register (immediate)
	STA $1DE1,Y		  ; 99 E1 1D | Update graphics data
	ORA $1471			; 0D 71 14 | Logical OR with accumulator (absolute)
	STZ $38			  ; 64 38 | Store zero to zero page
	PLP				  ; 28 | Pull processor status from stack
	NOP				  ; EA | No operation
	STY $00			  ; 84 00 | Store Y register to zero page
	STZ $5C00,X		  ; 9E 00 5C | Store zero to absolute,X
	BVC $0B			  ; 50 0B | Branch if overflow clear
	PLP				  ; 28 | Pull processor status from stack
	ORA ($59,X)		  ; 01 59 | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F 0E 4F 11 | Update graphics data
	AND ($E0,X)		  ; 21 E0 | Game work RAM access
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0E0
; Address: $E7A88A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0E0:
	DEC $F0			  ; C6 F0 | Decrement (zero page)
	BRA $D9			  ; 80 D9 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0E1
; Address: $E7A891
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0E1:
	ORA ($F0),Y		  ; 11 F0 | Logical OR with accumulator ((zero page),Y)
	INC $E303,X		  ; FE 03 E3 | Increment (absolute,X)
	STZ $7F00			; 9C 00 7F | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	BIT $1F			  ; 24 1F | Test bits in accumulator (zero page)
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	LDA				  ; BF 97 F8 39 | Read graphics status
	AND $C323,X		  ; 3D 23 C3 | Logical AND with accumulator (absolute,X)
	CPY $FF1D			; CC 1D FF | Compare Y register (absolute)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	REP #$18			 ; C2 18 | Reset processor status bits
	CLC				  ; 18 | Clear carry flag
	EOR $4E5F,Y		  ; 59 5F 4E | Exclusive OR with accumulator (absolute,Y)
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0E2
; Address: $E7A8C8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0E2:
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR $70			  ; 46 70 | Logical shift right (zero page)
	BRA $D9			  ; 80 D9 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0E3
; Address: $E7A8D1
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0E3:
	ORA ($70),Y		  ; 11 70 | Logical OR with accumulator ((zero page),Y)
	ROL $6303,X		  ; 3E 03 63 | Rotate left (absolute,X)
	STZ $7F00			; 9C 00 7F | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	BIT $7B			  ; 24 7B | Test bits in accumulator (zero page)
	LDA				  ; BF 7F 3F 7F | Read graphics status
	AND $0D			  ; 25 0D | Logical AND with accumulator (zero page)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BVS $0F			  ; 70 0F | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	BPL $3E			  ; 10 3E | Branch if positive
	CPY #$88			 ; C0 88 | Compare Y register (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	STA $00FF70		  ; 8F 70 FF 00 | Update graphics data
	STA $8F00			; 8D 00 8F | Update graphics data
	ADC ($EF),Y		  ; 71 EF | Add with carry ((zero page),Y)
	JMP $9BBC			; 4C BC 9B | Jump to address
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0E4
; Address: $E7A928
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0E4:
	WDM #$F3			 ; 42 F3 | Reserved instruction
	ORA $FB			  ; 05 FB | Logical OR with accumulator (zero page)
	EOR #$F3			 ; 49 F3 | Exclusive OR with accumulator (immediate)
	STX $F6			  ; 86 F6 | Store X register to zero page
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0F04,X		  ; 1D 04 0F | Logical OR with accumulator (absolute,X)
	ORA $0B22			; 0D 22 0B | Logical OR with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BPL $03			  ; 10 03 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	BVC $B8			  ; 50 B8 | Branch if overflow clear
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STZ $98			  ; 64 98 | Store zero to zero page
	STY $30			  ; 84 30 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	BMI $10			  ; 30 10 | Branch if negative
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $7C16,X		  ; 7E 16 7C | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	LDA $3865,X		  ; BD 65 38 | Read graphics status
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($36,X)		  ; 01 36 | Logical OR with accumulator ((zero page,X))
	EOR $5A00,X		  ; 5D 00 5A | Exclusive OR with accumulator (absolute,X)
	ORA ($81,X)		  ; 01 81 | Logical OR with accumulator ((zero page,X))
	JMP $2601			; 4C 01 26 | Jump to address
	LSR $6E10,X		  ; 5E 10 6E | Logical shift right (absolute,X)
	CMP $D17A			; CD 7A D1 | Compare accumulator (absolute)
	STA $4561,X		  ; 9D 61 45 | Update graphics data
	AND $9E24,X		  ; 3D 24 9E | Logical AND with accumulator (absolute,X)
	LDA				  ; BF 00 9F 00 | Read graphics status
	ROR $00			  ; 66 00 | Rotate right (zero page)
	INC $3F00,X		  ; FE 00 3F | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	DEC $0632,X		  ; DE 32 06 | Decrement (absolute,X)
	EOR $7EC8,Y		  ; 59 C8 7E | Exclusive OR with accumulator (absolute,Y)
	ROL $DD			  ; 26 DD | Rotate left (zero page)
	BEQ $17			  ; F0 17 | Branch if equal

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0E5
; Address: $E7A9CB
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0E5:
	BEQ $D0			  ; F0 D0 | Branch if equal
	STZ $13			  ; 64 13 | Store zero to zero page
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC $B600,Y		  ; F9 00 B6 | Subtract with carry (absolute,Y)
	ORA #$73			 ; 09 73 | Logical OR with accumulator (immediate)
	ORA $E800			; 0D 00 E8 | Logical OR with accumulator (absolute)
	SBC $6600,Y		  ; F9 00 66 | Subtract with carry (absolute,Y)
	LSR $8E90,X		  ; 5E 90 8E | Logical shift right (absolute,X)
	STA $C1A2			; 8D A2 C1 | Update graphics data
	STA $4561,X		  ; 9D 61 45 | Update graphics data
	ADC $5E64,X		  ; 7D 64 5E | Add with carry (absolute,X)
	INC $00			  ; E6 00 | Increment (zero page)
	ROR $7F00,X		  ; 7E 00 7F | Rotate right (absolute,X)
	EOR $4E5F,Y		  ; 59 5F 4E | Exclusive OR with accumulator (absolute,Y)
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	BVC $70			  ; 50 70 | Branch if overflow clear
	CLD				  ; D8 | Clear decimal mode flag
	LDY $BBC4			; AC C4 BB | Load from absolute address into Y register
	ROL $38			  ; 26 38 | Rotate left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0E6
; Address: $E7AA11
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0E6:
	ORA ($70),Y		  ; 11 70 | Logical OR with accumulator ((zero page),Y)
	ROL $7F13,X		  ; 3E 13 7F | Rotate left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	LDA				  ; BF 97 F8 38 | Read graphics status
	BCC $E0			  ; 90 E0 | Game work RAM access
	BIT $E0FF			; 2C FF E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator
	SBC ($1C,X)		  ; E1 1C | Subtract with carry ((zero page,X))
	DEC $AF15,X		  ; DE 15 AF | Decrement (absolute,X)
	DEC $FE8C,X		  ; DE 8C FE | Decrement (absolute,X)
	STZ $6C			  ; 64 6C | Store zero to zero page
	BRA $4F			  ; 80 4F | Branch always
	STA				  ; 9F 00 A3 00 | Update graphics data
	REP #$00			 ; C2 00 | Reset processor status bits
	STA $BD00,X		  ; 9D 00 BD | Update graphics data
	BPL $30			  ; 10 30 | Branch if positive
	BMI $F9			  ; 30 F9 | Branch if negative
	BNE $32			  ; D0 32 | Branch if not equal
	BVS $10			  ; 70 10 | Branch if overflow set
	LDA				  ; BF 3F 6B 79 | Read graphics status

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0E7
; Address: $E7AA8D
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0E7:
	ADC $34D4,Y		  ; 79 D4 34 | Add with carry (absolute,Y)
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	ORA $F8			  ; 05 F8 | Logical OR with accumulator (zero page)
	STA ($04),Y		  ; 91 04 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	SBC ($1C,X)		  ; E1 1C | Subtract with carry ((zero page,X))
	DEC $AF15,X		  ; DE 15 AF | Decrement (absolute,X)
	DEC $FE8C,X		  ; DE 8C FE | Decrement (absolute,X)
	STZ $4C			  ; 64 4C | Store zero to zero page
	BRA $4F			  ; 80 4F | Branch always
	STA				  ; 9F 00 A3 00 | Update graphics data
	REP #$00			 ; C2 00 | Reset processor status bits
	STA $BD00,X		  ; 9D 00 BD | Update graphics data
	BPL $30			  ; 10 30 | Branch if positive
	BMI $F9			  ; 30 F9 | Branch if negative
	BNE $32			  ; D0 32 | Branch if not equal
	BVS $10			  ; 70 10 | Branch if overflow set
	LDA				  ; BF 3F 6B 79 | Read graphics status
	ADC $3CDC,Y		  ; 79 DC 3C | Add with carry (absolute,Y)
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	ORA $F8			  ; 05 F8 | Logical OR with accumulator (zero page)
	STA ($04),Y		  ; 91 04 | Update graphics data
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($5D),Y		  ; 11 5D | Logical OR with accumulator ((zero page),Y)
	CMP $01AC,X		  ; DD AC 01 | Compare accumulator (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	RTI				  ; 40 | Return from interrupt
	INC $2200			; EE 00 22 | Increment (absolute)
	INC $BF00,X		  ; FE 00 BF | Increment (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator
	DEY				  ; 88 | Decrement Y register
	ROL $2D00,X		  ; 3E 00 2D | Rotate left (absolute,X)
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	EOR ($CA,X)		  ; 41 CA | Exclusive OR with accumulator ((zero page,X))
	REP #$77			 ; C2 77 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0E8
; Address: $E7AB0C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0E8:
	JSR $4277			; 20 77 42 | Hardware register operation
	BMI $FF			  ; 30 FF | Branch if negative
	INC $BE00,X		  ; FE 00 BE | Increment (absolute,X)
	AND $8800,X		  ; 3D 00 88 | Logical AND with accumulator (absolute,X)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STA $07E700		  ; 8F 00 E7 07 | Update graphics data
	ROL $3C3F,X		  ; 3E 3F 3C | Rotate left (absolute,X)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	BRA $FF			  ; 80 FF | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	BVC $75			  ; 50 75 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0E9
; Address: $E7AB62
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0E9:
	ADC $215D			; 6D 5D 21 | PPU graphics register access
	AND $725D,X		  ; 3D 5D 72 | Logical AND with accumulator (absolute,X)
	ADC $5C6B,X		  ; 7D 6B 5C | Add with carry (absolute,X)
	EOR $6D68,Y		  ; 59 68 6D | Exclusive OR with accumulator (absolute,Y)
	ROR $7E08,X		  ; 7E 08 7E | Rotate right (absolute,X)
	ROR $7700,X		  ; 7E 00 77 | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	DEC				  ; 3A | Decrement accumulator
	STY $7103			; 8C 03 71 | Store Y register to absolute address
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	BCS $04			  ; B0 04 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BVS $FE			  ; 70 FE | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	AND $31			  ; 25 31 | Logical AND with accumulator (zero page)
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	AND $6B23			; 2D 23 6B | Logical AND with accumulator (absolute)
	AND #$4A			 ; 29 4A | Logical AND with accumulator (immediate)
	EOR $36			  ; 45 36 | Exclusive OR with accumulator (zero page)
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	JMP $503F			; 4C 3F 50 | Jump to address
	ADC $7B92,X		  ; 7D 92 7B | Add with carry (absolute,X)
	STY $6F			  ; 84 6F | Store Y register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	BRA $70			  ; 80 70 | Branch always
	ROL				  ; 2A | Rotate left (accumulator)
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F 93 63 6F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	SEI				  ; 78 | Set interrupt disable flag
	BCS $18			  ; B0 18 | Branch if carry set
	SBC $C700,X		  ; FD 00 C7 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	CLC				  ; 18 | Clear carry flag
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BMI $D9			  ; 30 D9 | Branch if negative
	LSR $214F			; 4E 4F 21 | PPU graphics register access
	AND ($90,X)		  ; 21 90 | Logical AND with accumulator ((zero page,X))
	BCS $D8			  ; B0 D8 | Branch if carry set
	CPY $EB64			; CC 64 EB | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	CPX #$11			 ; E0 11 | Compare X register (immediate)
	BEQ $13			  ; F0 13 | Branch if equal

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0EA
; Address: $E7ABF4
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0EA:
	INC $7F13,X		  ; FE 13 7F | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$48			 ; E0 48 | Compare X register (immediate)
	LDA				  ; BF 97 F8 38 | Read graphics status
	BCC $E0			  ; 90 E0 | Game work RAM access
	BIT $E0FF			; 2C FF E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	AND $3C3F,X		  ; 3D 3F 3C | Logical AND with accumulator (absolute,X)
	ROL $3D3F,X		  ; 3E 3F 3D | Rotate left (absolute,X)
	AND $FE3F,X		  ; 3D 3F FE | Logical AND with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX $04			  ; E4 04 | Compare X register (zero page)
	LSR $C3			  ; 46 C3 | Logical shift right (zero page)
	PLX				  ; FA | Pull X register from stack
	ORA #$FA			 ; 09 FA | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLX				  ; FA | Pull X register from stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $9F8D			; 9C 8D 9F | Store zero to absolute
	STA				  ; 9F 61 6F 0F | Update graphics data
	PEA #$77FF		   ; F4 FF 77 | Push effective address to stack
	PHP				  ; 08 | Push processor status to stack
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	STA				  ; 9F 00 F8 00 | Update graphics data
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	JMP $7C44			; 4C 44 7C | Jump to address
	SED				  ; F8 | Set decimal mode flag
	STA $F8			  ; 85 F8 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PHB				  ; 8B | Push data bank register to stack
	ASL $8E			  ; 06 8E | Arithmetic shift left (zero page)
	ORA ($BA,X)		  ; 01 BA | Logical OR with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	ASL $8E			  ; 06 8E | Arithmetic shift left (zero page)
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	ASL $CF			  ; 06 CF | Arithmetic shift left (zero page)
	EOR #$FE			 ; 49 FE | Exclusive OR with accumulator (immediate)
	PHY				  ; 5A | Push Y register to stack
	LDA				  ; BF FE FF FE | Read graphics status
	LDX $11F9,Y		  ; BE F9 11 | Load from absolute,Y into X register
	INC $FE39,X		  ; FE 39 FE | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	LDA $1A			  ; A5 1A | Read graphics status
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0EB
; Address: $E7ACF5
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0EB:
	LDA				  ; BF 00 FF 00 | Read graphics status
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	SBC $8C02,X		  ; FD 02 8C | Subtract with carry (absolute,X)
	WDM #$CE			 ; 42 CE | Reserved instruction
	ORA $F7F0			; 0D F0 F7 | Logical OR with accumulator (absolute)
	SBC $6C12			; ED 12 6C | Subtract with carry (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0EC
; Address: $E7AD82
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0EC:
	AND ($37),Y		  ; 31 37 | Logical AND with accumulator ((zero page),Y)
	STY $571C			; 8C 1C 57 | Store Y register to absolute address
	STY $94			  ; 84 94 | Store Y register to zero page
	INC $7F			  ; E6 7F | Increment (zero page)
	ADC #$DB			 ; 69 DB | Add with carry (immediate)
	INY				  ; C8 | Increment Y register
	ADC $7900,Y		  ; 79 00 79 | Add with carry (absolute,Y)
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $29			  ; 05 29 | Logical OR with accumulator (zero page)
	SBC $4002,X		  ; FD 02 40 | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $D8			  ; F0 D8 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $08			  ; F0 08 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	CPY $0CE3			; CC E3 0C | Compare Y register (absolute)
	BRA $BF			  ; 80 BF | Branch always

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0ED
; Address: $E7AE01
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0ED:
	BRA $BF			  ; 80 BF | Branch always
	LDA #$00			 ; A9 00 | Read graphics status
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	AND ($AE),Y		  ; 31 AE | Logical AND with accumulator ((zero page),Y)
	AND ($B7,X)		  ; 21 B7 | Logical AND with accumulator ((zero page,X))
	DEC $0F02			; CE 02 0F | Decrement (absolute)
	ADC $6D00,Y		  ; 79 00 6D | Add with carry (absolute,Y)
	ROR $0100,X		  ; 7E 00 01 | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	PHX				  ; DA | Push X register to stack
	ROL $1EA2,X		  ; 3E A2 1E | Rotate left (absolute,X)
	BVS $44			  ; 70 44 | Branch if overflow set
	BIT $FC44			; 2C 44 FC | Test bits in accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	ROR $00			  ; 66 00 | Rotate right (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	SEP #$00			 ; E2 00 | Set processor status bits
	CLV				  ; B8 | Clear overflow flag
	LDY $3C00,X		  ; BC 00 3C | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $0080			; 0E 80 00 | Arithmetic shift left (absolute)
	CMP ($38,X)		  ; C1 38 | Compare accumulator ((zero page,X))
	ASL $00F1			; 0E F1 00 | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	BVS $8F			  ; 70 8F | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	BVS $8F			  ; 70 8F | Branch if overflow set
	STA $9304,X		  ; 9D 04 93 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	CPY $BC04			; CC 04 BC | Compare Y register (absolute)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	LDY $B704,X		  ; BC 04 B7 | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0EE
; Address: $E7AECF
; Size: 126 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0EE:
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 00 E9 66 | Read graphics status
	ORA ($8E,X)		  ; 01 8E | Logical OR with accumulator ((zero page,X))
	INC $68			  ; E6 68 | Increment (zero page)
	INC $7A70,X		  ; FE 70 7A | Increment (absolute,X)
	STX $7D			  ; 86 7D | Store X register to zero page
	ASL $99F0			; 0E F0 99 | Arithmetic shift left (absolute)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	ASL $99			  ; 06 99 | Arithmetic shift left (zero page)
	BIT #$07			 ; 89 07 | Test bits in accumulator (immediate)
	BIT #$06			 ; 89 06 | Test bits in accumulator (immediate)
	SBC $FB06,Y		  ; F9 06 FB | Subtract with carry (absolute,Y)
	SBC $0007,Y		  ; F9 07 00 | Subtract with carry (absolute,Y)
	ASL $0D06			; 0E 06 0D | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	LDA				  ; BF 00 04 03 | Read graphics status
	DEC $CA57,X		  ; DE 57 CA | Decrement (absolute,X)
	TXS				  ; 9A | Transfer X register to stack pointer
	DEC $EC42			; CE 42 EC | Decrement (absolute)
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STX $08			  ; 86 08 | Store X register to zero page
	PHP				  ; 08 | Push processor status to stack
	LDA #$06			 ; A9 06 | Read graphics status
	LDA $F906,Y		  ; B9 06 F9 | Read graphics status
	ASL $B9			  ; 06 B9 | Arithmetic shift left (zero page)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	CPY $6D35			; CC 35 6D | Compare Y register (absolute)
	STY $008C			; 8C 8C 00 | Store Y register to absolute address
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	LDA $E11D,Y		  ; B9 1D E1 | Read graphics status
	SBC $73FB			; ED FB 73 | Subtract with carry (absolute)
	ASL $1C1C,X		  ; 1E 1C 1C | Arithmetic shift left (absolute,X)
	ASL $1C00,X		  ; 1E 00 1C | Arithmetic shift left (absolute,X)
	STY $C803			; 8C 03 C8 | Store Y register to absolute address
	SED				  ; F8 | Set decimal mode flag
	BIT $7887			; 2C 87 78 | Test bits in accumulator (absolute)
	STA $078800		  ; 8F 00 88 07 | Update graphics data
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	LDA				  ; BF 00 FF 00 | Read graphics status
	ASL $6280			; 0E 80 62 | Arithmetic shift left (absolute)
	INC $0FF2			; EE F2 0F | Increment (absolute)
	DEC $3D			  ; C6 3D | Decrement (zero page)
	ASL $0EF0			; 0E F0 0E | Arithmetic shift left (absolute)
	BRA $72			  ; 80 72 | Branch always
	STA $F98F76		  ; 8F 76 8F F9 | Update graphics data
	STA $F907,Y		  ; 99 07 F9 | Update graphics data
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	SBC $F907,Y		  ; F9 07 F9 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0EF
; Address: $E7AFBC
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0EF:
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	ASL $B5			  ; 06 B5 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	CMP $BD04			; CD 04 BD | Compare accumulator (absolute)
	LDA				  ; BF 00 FF 00 | Read graphics status
	STZ $EA07,X		  ; 9E 07 EA | Store zero to absolute,X
	ROR $68E7			; 6E E7 68 | Rotate right (absolute)
	INC $9C			  ; E6 9C | Increment (zero page)
	JMP $CAC5			; 4C C5 CA | Jump to address
	LSR $CC			  ; 46 CC | Logical shift right (zero page)
	WDM #$F9			 ; 42 F9 | Reserved instruction
	ASL $99			  ; 06 99 | Arithmetic shift left (zero page)
	ASL $99			  ; 06 99 | Arithmetic shift left (zero page)
	ASL $99			  ; 06 99 | Arithmetic shift left (zero page)
	SBC $BB07,Y		  ; F9 07 BB | Subtract with carry (absolute,Y)
	ASL $B9			  ; 06 B9 | Arithmetic shift left (zero page)
	LDA $2207,Y		  ; B9 07 22 | Read graphics status
	CPY $CCCC			; CC CC CC | Compare Y register (absolute)
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	LDA ($DD,X)		  ; A1 DD | Read graphics status
	CMP $FF00,X		  ; DD 00 FF | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0F0
; Address: $E7B016
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0F0:
	JSR $FF00			; 20 00 FF | Jump to subroutine
	LSR $2200,X		  ; 5E 00 22 | Logical shift right (absolute,X)
	SBC #$66			 ; E9 66 | Subtract with carry (immediate)
	STX $6EE6			; 8E E6 6E | Store X register to absolute address
	ADC $FFBD,X		  ; 7D BD FF | Add with carry (absolute,X)
	STA $800070		  ; 8F 70 00 80 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0F1
; Address: $E7B030
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0F1:
	STA $F906,Y		  ; 99 06 F9 | Update graphics data
	ASL $99			  ; 06 99 | Arithmetic shift left (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	CPY $DDCC			; CC CC DD | Compare Y register (absolute)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	CPY $FF22			; CC 22 FF | Compare Y register (absolute)
	LDA ($00),Y		  ; B1 00 | Read graphics status
	BRA $00			  ; 80 00 | Branch always
	BRA $78			  ; 80 78 | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	SEI				  ; 78 | Set interrupt disable flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0F2
; Address: $E7B09B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0F2:
	SED				  ; F8 | Set decimal mode flag
	BVS $8F			  ; 70 8F | Branch if overflow set
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $FF2D			; 2D 2D FF | Logical AND with accumulator (absolute)
	STA ($7E,X)		  ; 81 7E | Update graphics data
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	LDA $00FF2F		  ; AF 2F FF 00 | Read graphics status
	PHB				  ; 8B | Push data bank register to stack
	BNE $00			  ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0F4
; Address: $E7B0F2
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0F4:
	JSL $FF33EE		  ; 22 EE 33 FF | Jump to subroutine long
	INC $8258,X		  ; FE 58 82 | Increment (absolute,X)
	INC				  ; 1A | Increment accumulator
	SEP #$08			 ; E2 08 | Set processor status bits
	WDM #$3A			 ; 42 3A | Reserved instruction
	LSR $9A			  ; 46 9A | Logical shift right (zero page)
	DEX				  ; CA | Decrement X register
	INC $02			  ; E6 02 | Increment (zero page)
	SBC $7F80,X		  ; FD 80 7F | Subtract with carry (absolute,X)
	STA $CF30,X		  ; 9D 30 CF | Update graphics data
	INC				  ; 1A | Increment accumulator
	SBC $8A			  ; E5 8A | Subtract with carry (zero page)
	INY				  ; C8 | Increment Y register
	STZ $9B			  ; 64 9B | Store zero to zero page
	DEX				  ; CA | Decrement X register
	TXS				  ; 9A | Transfer X register to stack pointer
	WDM #$3A			 ; 42 3A | Reserved instruction
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	SEP #$42			 ; E2 42 | Hardware register operation
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	INC				  ; 1A | Increment accumulator
	SBC $32			  ; E5 32 | Subtract with carry (zero page)
	CMP $9F60			; CD 60 9F | Compare accumulator (absolute)
	ADC $ED12,X		  ; 7D 12 ED | Add with carry (absolute,X)
	INC $02C0,X		  ; FE C0 02 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0F6
; Address: $E7B149
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0F6:
	JSL $C01288		  ; 22 88 12 C0 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STZ $82			  ; 64 82 | Store zero to zero page
	SBC $7F80,X		  ; FD 80 7F | Subtract with carry (absolute,X)
	WDM #$BD			 ; 42 BD | Reserved instruction

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0F7
; Address: $E7B158
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0F7:
	JSR $10DF			; 20 DF 10 | Jump to subroutine
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $0AC0,X		  ; 7D C0 0A | Add with carry (absolute,X)
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0F8
; Address: $E7B165
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0F8:
	JSL $604230		  ; 22 30 42 60 | Jump to subroutine long
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC $DF20			; ED 20 DF | Subtract with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 82 7D 00 | Read graphics status
	CPX $0013			; EC 13 00 | Compare X register (absolute)
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ORA $85			  ; 05 85 | Logical OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	ORA $2F			  ; 05 2F | Logical OR with accumulator (zero page)
	BNE $0F			  ; D0 0F | Branch if not equal
	BEQ $FE			  ; F0 FE | Branch if equal
	PLX				  ; FA | Pull X register from stack
	SBC $FA00,X		  ; FD 00 FA | Subtract with carry (absolute,X)
	INY				  ; C8 | Increment Y register
	LDA ($06),Y		  ; B1 06 | Read graphics status
	WDM #$42			 ; 42 42 | Hardware register operation
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	STA ($01,X)		  ; 81 01 | Update graphics data
	LDA $BF00,X		  ; BD 00 BF | Read graphics status
	BRA $00			  ; 80 00 | Branch always
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
	BEQ $0C			  ; F0 0C | Branch if equal
	STZ $60			  ; 64 60 | Store zero to zero page
	ROR $00			  ; 66 00 | Rotate right (zero page)
	STA $84848F		  ; 8F 8F 84 84 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F 00 FF 00 | Update graphics data
	BVS $00			  ; 70 00 | Branch if overflow set
	LDA				  ; BF 40 BF 3F | Read graphics status
	BRA $3E			  ; 80 3E | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BEQ $8F			  ; F0 8F | Branch if equal
	BVC $2F			  ; 50 2F | Branch if overflow clear
	BVC $0F			  ; 50 0F | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$FF			 ; A0 FF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0FA
; Address: $E7B205
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0FA:
	ORA ($AC,X)		  ; 01 AC | Logical OR with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	SBC $F40E,Y		  ; F9 0E F4 | Subtract with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC ($02,X)		  ; E1 02 | Subtract with carry ((zero page,X))
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $FF18			; EE 18 FF | Increment (absolute)
	INC $0000			; EE 00 00 | Increment (absolute)
	ORA $00FF,Y		  ; 19 FF 00 | Logical OR with accumulator (absolute,Y)
	LDA $C276			; AD 76 C2 | Read graphics status
	BPL $A6			  ; 10 A6 | Branch if positive
	LDA ($10),Y		  ; B1 10 | Read graphics status
	BNE $10			  ; D0 10 | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $0F			  ; 80 0F | Branch always
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	AND ($EF),Y		  ; 31 EF | Logical AND with accumulator ((zero page),Y)
	BVS $EF			  ; 70 EF | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDY $CC00			; AC 00 CC | Load from absolute address into Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INC $3DFF,X		  ; FE FF 3D | Increment (absolute,X)
	LDA $FFCFFF		  ; AF FF CF FF | Read graphics status
	ORA $FBFF			; 0D FF FB | Logical OR with accumulator (absolute)
	SBC $0041,X		  ; FD 41 00 | Subtract with carry (absolute,X)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	CMP ($10),Y		  ; D1 10 | Compare accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	PHA				  ; 48 | Push accumulator to stack
	JMP $101910		  ; 5C 10 19 10 | Jump to address long
	ROL $037F,X		  ; 3E 7F 03 | Rotate left (absolute,X)
	CMP $99EF,X		  ; DD EF 99 | Compare accumulator (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	WDM #$00			 ; 42 00 | Reserved instruction
	LSR $00			  ; 46 00 | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0FB
; Address: $E7B2CF
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0FB:
	JSR $0F0F			; 20 0F 0F | Jump to subroutine
	BVS $FF			  ; 70 FF | Branch if overflow set
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	BVS $FF			  ; 70 FF | Branch if overflow set
	SEP #$FF			 ; E2 FF | Set processor status bits
	DEC $FF			  ; C6 FF | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0FC
; Address: $E7B2E2
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0FC:
	JSR $F220			; 20 20 F2 | Jump to subroutine
	AND $8001,Y		  ; 39 01 80 | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC $FE39,X		  ; FD 39 FE | Subtract with carry (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	AND $4908			; 2D 08 49 | Logical AND with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	LDX $FF8A,Y		  ; BE 8A FF | Load from absolute,Y into X register
	XBA				  ; EB | Exchange accumulator bytes
	ROR $76F7			; 6E F7 76 | Rotate right (absolute)
	ROR $4AF7			; 6E F7 4A | Rotate right (absolute)
	STA				  ; 9F 40 1F 40 | Update graphics data
	BVC $6F			  ; 50 6F | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0FD
; Address: $E7B327
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0FD:
	JSR $30CB			; 20 CB 30 | Jump to subroutine
	XBA				  ; EB | Exchange accumulator bytes
	BPL $2C			  ; 10 2C | Branch if positive
	LSR $201E			; 4E 1E 20 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0FE
; Address: $E7B332
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0FE:
	JSR $40FF			; 20 FF 40 | Jump to subroutine
	LDA				  ; BF DF FF 04 | Read graphics status
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	INC $FAF1			; EE F1 FA | Increment (absolute)
	PLX				  ; FA | Pull X register from stack
	ORA $0DF6			; 0D F6 0D | Logical OR with accumulator (absolute)
	ASL $DE			  ; 06 DE | Arithmetic shift left (zero page)
	DEC $1008,X		  ; DE 08 10 | Decrement (absolute,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_0FF
; Address: $E7B358
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_0FF:
	JSR $21FF			; 20 FF 21 | PPU graphics register access
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BPL $FF			  ; 10 FF | Branch if positive
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $8F			  ; F0 8F | Branch if equal
	BEQ $8F			  ; F0 8F | Branch if equal
	BCC $10			  ; 90 10 | Branch if carry clear
	BNE $10			  ; D0 10 | Branch if not equal
	CMP $A619,Y		  ; D9 19 A6 | Compare accumulator (absolute,Y)
	ROL $81			  ; 26 81 | Rotate left (zero page)
	STZ $7F01,X		  ; 9E 01 7F | Store zero to absolute,X
	BRA $3F			  ; 80 3F | Branch always
	BRA $50			  ; 80 50 | Branch always
	BVC $EF			  ; 50 EF | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_101
; Address: $E7B3BA
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_101:
	JSR $40FF			; 20 FF 40 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	ORA $C60C			; 0D 0C C6 | Logical OR with accumulator (absolute)
	DEC $C0			  ; C6 C0 | Decrement (zero page)
	LDX $9F00,Y		  ; BE 00 9F | Load from absolute,Y into X register
	ORA $C6F3			; 0D F3 C6 | Logical OR with accumulator (absolute)
	AND $FF3E,Y		  ; 39 3E FF | Logical AND with accumulator (absolute,Y)
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	BVC $10			  ; 50 10 | Branch if overflow clear
	ADC ($31),Y		  ; 71 31 | Add with carry ((zero page),Y)
	AND $20			  ; 25 20 | Logical AND with accumulator (zero page)
	STZ $BF00,X		  ; 9E 00 BF | Store zero to absolute,X
	BRA $3F			  ; 80 3F | Branch always
	BRA $90			  ; 80 90 | Branch always
	BNE $EF			  ; D0 EF | Branch if not equal
	SBC ($CE),Y		  ; F1 CE | Subtract with carry ((zero page),Y)
	LDA				  ; BF DF 21 FF | Read graphics status
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	STA ($10),Y		  ; 91 10 | Update graphics data
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_102
; Address: $E7B405
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_102:
	JSR $5858			; 20 58 58 | Jump to subroutine
	INC $3C00,X		  ; FE 00 3C | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	STA ($EF),Y		  ; 91 EF | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	CLD				  ; D8 | Clear decimal mode flag
	ROL $41FF,X		  ; 3E FF 41 | Rotate left (absolute,X)
	CPX $BD04			; EC 04 BD | Compare X register (absolute)
	ADC $8101,Y		  ; 79 01 81 | Add with carry (absolute,Y)
	ORA ($33,X)		  ; 01 33 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	INC $FC01,X		  ; FE 01 FC | Increment (absolute,X)
	LDA $79FF,X		  ; BD FF 79 | Read graphics status
	INC $FE81,X		  ; FE 81 FE | Increment (absolute,X)
	CPY $FFBB			; CC BB FF | Compare Y register (absolute)
	CLC				  ; 18 | Clear carry flag
	BPL $3A			  ; 10 3A | Branch if positive
	BPL $28			  ; 10 28 | Branch if positive
	ROR				  ; 6A | Rotate right (accumulator)
	SEP #$02			 ; E2 02 | Set processor status bits
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	ORA $3A00,X		  ; 1D 00 3A | Logical OR with accumulator (absolute,X)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	SBC $FD33,X		  ; FD 33 FD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_103
; Address: $E7B45C
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_103:
	JMP ($C2FF)		  ; 6C FF C2 | Jump to address (absolute indirect)
	ROR $22			  ; 66 22 | Rotate right (zero page)
	BMI $43			  ; 30 43 | Branch if negative
	STY $3F			  ; 84 3F | Store Y register to zero page
	CPY #$41			 ; C0 41 | Compare Y register (immediate)
	BRA $41			  ; 80 41 | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $DD			  ; 80 DD | Branch always
	CLC				  ; 18 | Clear carry flag
	STZ $B390			; 9C 90 B3 | Store zero to absolute
	STY $808C			; 8C 8C 80 | Store Y register to absolute address
	BRA $D2			  ; 80 D2 | Branch always
	AND $FF00			; 2D 00 FF | Logical AND with accumulator (absolute)
	NOP				  ; EA | No operation
	BPL $AD			  ; 10 AD | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BPL $A4			  ; 10 A4 | Branch if positive
	BPL $46			  ; 10 46 | Branch if positive
	BMI $88			  ; 30 88 | Branch if negative
	BVC $08			  ; 50 08 | Branch if overflow clear
	BVC $0B			  ; 50 0B | Branch if overflow clear
	LDA $AF5B			; AD 5B AF | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	DEY				  ; 88 | Decrement Y register
	STA $2FFBFF		  ; 8F FF FB 2F | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	BPL $0B			  ; 10 0B | Branch if positive
	BEQ $DF			  ; F0 DF | Branch if equal
	BVC $FF			  ; 50 FF | Branch if overflow clear
	BNE $FF			  ; D0 FF | Branch if not equal
	BNE $FF			  ; D0 FF | Branch if not equal
	BNE $FF			  ; D0 FF | Branch if not equal
	BNE $FF			  ; D0 FF | Branch if not equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CPX #$BB			 ; E0 BB | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag
	CLC				  ; 18 | Clear carry flag
	CPX $E0			  ; E4 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	LDA $C0BF80		  ; AF 80 BF C0 | Read graphics status
	SBC $C0FE,X		  ; FD FE C0 | Subtract with carry (absolute,X)
	LDA				  ; BF 47 80 70 | Read graphics status
	ASL $E0			  ; 06 E0 | Game work RAM access
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_104
; Address: $E7B530
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_104:
	BVC $FF			  ; 50 FF | Branch if overflow clear
	SEI				  ; 78 | Set interrupt disable flag
	ORA $00FF,Y		  ; 19 FF 00 | Logical OR with accumulator (absolute,Y)
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E17F,Y		  ; B9 7F E1 | Read graphics status
	INC $00DC,X		  ; FE DC 00 | Increment (absolute,X)
	ORA $59FF			; 0D FF 59 | Logical OR with accumulator (absolute)
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	BPL $FF			  ; 10 FF | Branch if positive
	INC $FF			  ; E6 FF | Increment (zero page)
	STZ $F080,X		  ; 9E 80 F0 | Store zero to absolute,X
	LDA				  ; BF FF C5 BA | Read graphics status
	LSR $E180			; 4E 80 E1 | Logical shift right (absolute)
	CPX $24C1			; EC C1 24 | Compare X register (absolute)
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	BRA $8D			  ; 80 8D | Branch always
	SEP #$E3			 ; E2 E3 | Set processor status bits
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	BRA $D0			  ; 80 D0 | Branch always
	STA $60E2			; 8D E2 60 | Update graphics data
	RTI				  ; 40 | Return from interrupt
	BPL $FF			  ; 10 FF | Branch if positive
	ROR				  ; 6A | Rotate right (accumulator)
	BPL $FF			  ; 10 FF | Branch if positive
	INC $1F			  ; E6 1F | Increment (zero page)
	SBC $3AFF,X		  ; FD FF 3A | Subtract with carry (absolute,X)
	SBC $04F0,X		  ; FD F0 04 | Subtract with carry (absolute,X)
	AND ($30),Y		  ; 31 30 | Logical AND with accumulator ((zero page),Y)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	BPL $F7			  ; 10 F7 | Branch if positive
	ORA $FF9F,Y		  ; 19 9F FF | Logical OR with accumulator (absolute,Y)
	CPY $A361			; CC 61 A3 | Compare Y register (absolute)
	CMP ($C7),Y		  ; D1 C7 | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_105
; Address: $E7B5D0
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_105:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	ASL $1C0E,X		  ; 1E 0E 1C | Arithmetic shift left (absolute,X)
	DEC $01			  ; C6 01 | Decrement (zero page)
	BRA $81			  ; 80 81 | Branch always
	LDA ($B0),Y		  ; B1 B0 | Read graphics status
	DEX				  ; CA | Decrement X register
	INC $F101,X		  ; FE 01 F1 | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	BMI $D7			  ; 30 D7 | Branch if negative
	STY $80			  ; 84 80 | Store Y register to zero page
	BRA $00			  ; 80 00 | Branch always
	CMP $7F00,X		  ; DD 00 7F | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_106
; Address: $E7B621
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_106:
	LDA				  ; BF 40 BF 3F | Read graphics status
	BRA $3E			  ; 80 3E | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BEQ $0F			  ; F0 0F | Branch if equal
	BVC $2F			  ; 50 2F | Branch if overflow clear
	BVC $0F			  ; 50 0F | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_107
; Address: $E7B63A
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_107:
	JSR $207F			; 20 7F 20 | Jump to subroutine
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	ORA ($AC,X)		  ; 01 AC | Logical OR with accumulator ((zero page,X))
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ASL $0AF4			; 0E F4 0A | Arithmetic shift left (absolute)
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	INC $5B00,X		  ; FE 00 5B | Increment (absolute,X)
	LDY #$1C			 ; A0 1C | Load immediate value into Y register
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	DEC $00			  ; C6 00 | Decrement (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BIT $80			  ; 24 80 | Test bits in accumulator (zero page)
	INC $20			  ; E6 20 | Increment (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	DEC $00			  ; C6 00 | Decrement (zero page)
	INC $DF			  ; E6 DF | Increment (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	LDA				  ; BF 40 BF 3F | Read graphics status
	BRA $3E			  ; 80 3E | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BEQ $8F			  ; F0 8F | Branch if equal
	BVC $2F			  ; 50 2F | Branch if overflow clear
	BNE $0F			  ; D0 0F | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDY #$7F			 ; A0 7F | Load immediate value into Y register
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	STA $FDFFFF		  ; 8F FF FF FD | Update graphics data
	SBC $01FC,X		  ; FD FC 01 | Subtract with carry (absolute,X)
	LDY $FC01			; AC 01 FC | Load from absolute address into Y register
	SBC $F50F,Y		  ; F9 0F F5 | Subtract with carry (absolute,Y)
	SBC ($03,X)		  ; E1 03 | Subtract with carry ((zero page,X))
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_108
; Address: $E7B6DC
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_108:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	INC $E3FE,X		  ; FE FE E3 | Increment (absolute,X)
	CPX #$EA			 ; E0 EA | Compare X register (immediate)
	SEP #$FC			 ; E2 FC | Set processor status bits
	SEP #$FD			 ; E2 FD | Set processor status bits
	LDY $B5BD,X		  ; BC BD B5 | Load from absolute,X into Y register
	LDA $A4			  ; A5 A4 | Read graphics status
	NOP				  ; EA | No operation
	ADC $FFFF,X		  ; 7D FF FF | Add with carry (absolute,X)
	AND ($E1,X)		  ; 21 E1 | Logical AND with accumulator ((zero page,X))
	LDA ($B1),Y		  ; B1 B1 | Read graphics status
	LDA $BC2D			; AD 2D BC | Read graphics status
	BRA $FE			  ; 80 FE | Branch always
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $EFE5,X		  ; FD E5 EF | Subtract with carry (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $7C82,X		  ; FE 82 7C | Increment (absolute,X)
	INC $0009,X		  ; FE 09 00 | Increment (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register
	BVC $50			  ; 50 50 | Branch if overflow clear
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	DEC $4766,X		  ; DE 66 47 | Decrement (absolute,X)
	ROR $5F			  ; 66 5F | Rotate right (zero page)
	CLV				  ; B8 | Clear overflow flag
	LDA				  ; BF F8 F8 B9 | Read graphics status
	STA ($B9,X)		  ; 81 B9 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	SBC $F941,Y		  ; F9 41 F9 | Subtract with carry (absolute,Y)
	EOR $52FB,Y		  ; 59 FB 52 | Exclusive OR with accumulator (absolute,Y)
	DEY				  ; 88 | Decrement Y register
	BRA $7F			  ; 80 7F | Branch always
	LDA ($00),Y		  ; B1 00 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $00			  ; 90 00 | Branch if carry clear
	BCS $FE			  ; B0 FE | Branch if carry set
	ORA ($91,X)		  ; 01 91 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $2F			  ; 10 2F | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_109
; Address: $E7B787
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_109:
	JSR $300B			; 20 0B 30 | Jump to subroutine
	BPL $0C			  ; 10 0C | Branch if positive
	ASL $201E			; 0E 1E 20 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_10A
; Address: $E7B792
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_10A:
	JSR $007F			; 20 7F 00 | Jump to subroutine
	ASL $F811			; 0E 11 F8 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_10B
; Address: $E7B7A5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_10B:
	PEA #$0408		   ; F4 08 04 | Push effective address to stack
	BNE $0C			  ; D0 0C | Branch if not equal
	BNE $08			  ; D0 08 | Branch if not equal
	BPL $08			  ; 10 08 | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	INC $FE04,X		  ; FE 04 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_10C
; Address: $E7B7B8
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_10C:
	JSR $20FC			; 20 FC 20 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	BPL $F8			  ; 10 F8 | Branch if positive
	BPL $E0			  ; 10 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	STX $FA0E			; 8E 0E FA | Store X register to absolute address
	ASL $8FE0,X		  ; 1E E0 8F | Arithmetic shift left (absolute,X)
	EOR ($A1),Y		  ; 51 A1 | Exclusive OR with accumulator ((zero page),Y)
	ORA #$F7			 ; 09 F7 | Logical OR with accumulator (immediate)
	ROR $0FF1,X		  ; 7E F1 0F | Rotate right (absolute,X)
	ORA $00FE			; 0D FE 00 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	LSR $315E,X		  ; 5E 5E 31 | Logical shift right (absolute,X)
	DEX				  ; CA | Decrement X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	LSR $FFA1,X		  ; 5E A1 FF | Logical shift right (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	DEX				  ; CA | Decrement X register
	ASL $9FFF,X		  ; 1E FF 9F | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BPL $EF			  ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_10E
; Address: $E7B80B
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_10E:
	BEQ $EC			  ; F0 EC | Branch if equal
	ROR $A0FE			; 6E FE A0 | Rotate right (absolute)
	LDY #$7F			 ; A0 7F | Load immediate value into Y register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STY $9F			  ; 84 9F | Store Y register to zero page
	STY $9F			  ; 84 9F | Store Y register to zero page
	LDX $F9B1			; AE B1 F9 | Load from absolute address into X register
	SBC $0B02,Y		  ; F9 02 0B | Subtract with carry (absolute,Y)
	ORA $0F16			; 0D 16 0F | Logical OR with accumulator (absolute)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	AND ($FD,X)		  ; 21 FD | Logical AND with accumulator ((zero page,X))
	SBC $FF17,X		  ; FD 17 FF | Subtract with carry (absolute,X)
	SBC $E0E2,X		  ; FD E2 E0 | Game work RAM access
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_10F
; Address: $E7B848
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_10F:
	PLX				  ; FA | Pull X register from stack
	CMP $C7			  ; C5 C7 | Compare accumulator (zero page)
	STA $42BD43		  ; 8F 43 BD 42 | Hardware register operation
	LDA $821F,X		  ; BD 1F 82 | Read graphics status
	SEC				  ; 38 | Set carry flag
	ORA $FC			  ; 05 FC | Logical OR with accumulator (zero page)
	STY $BDFF			; 8C FF BD | Store Y register to absolute address
	LDA $12FF,X		  ; BD FF 12 | Read graphics status
	BVC $20			  ; 50 20 | Branch if overflow clear
	BVC $62			  ; 50 62 | Branch if overflow clear
	BEQ $48			  ; F0 48 | Branch if equal
	ADC $E4F6,X		  ; 7D F6 E4 | Add with carry (absolute,X)
	SBC $F8E4,Y		  ; F9 E4 F8 | Subtract with carry (absolute,Y)
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	SBC $FF10,X		  ; FD 10 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_110
; Address: $E7B873
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_110:
	JSR $62FF			; 20 FF 62 | Jump to subroutine
	LDA				  ; BF 08 9F 96 | Read graphics status
	ORA $F8FF,Y		  ; 19 FF F8 | Logical OR with accumulator (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA #$B2			 ; 09 B2 | Logical OR with accumulator (immediate)
	STZ $E100			; 9C 00 E1 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_111
; Address: $E7B88C
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_111:
	JSR $E00C			; 20 0C E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	STZ $E1FF			; 9C FF E1 | Store zero to absolute
	STZ $F0			  ; 64 F0 | Store zero to zero page
	CMP $10			  ; C5 10 | Compare accumulator (zero page)
	BVC $BF			  ; 50 BF | Branch if overflow clear
	TSX				  ; BA | Transfer stack pointer to X register
	SBC $24BF,X		  ; FD BF 24 | Subtract with carry (absolute,X)
	LDA				  ; BF 85 FF EF | Read graphics status
	LDA				  ; BF EF AA FF | Read graphics status
	SBC $100A,X		  ; FD 0A 10 | Subtract with carry (absolute,X)
	ORA $0014			; 0D 14 00 | Logical OR with accumulator (absolute)
	BPL $04			  ; 10 04 | Branch if positive
	BPL $06			  ; 10 06 | Branch if positive
	BMI $08			  ; 30 08 | Branch if negative
	BVC $08			  ; 50 08 | Branch if overflow clear
	BVC $0B			  ; 50 0B | Branch if overflow clear
	ORA $0F1B			; 0D 1B 0F | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	BEQ $28			  ; F0 28 | Branch if equal
	BVC $08			  ; 50 08 | Branch if overflow clear
	BRA $08			  ; 80 08 | Branch always
	BNE $08			  ; D0 08 | Branch if not equal
	BPL $08			  ; 10 08 | Branch if positive
	BPL $0C			  ; 10 0C | Branch if positive
	CPY $0A			  ; C4 0A | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_112
; Address: $E7B8EE
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_112:
	BPL $0A			  ; 10 0A | Branch if positive
	BEQ $D8			  ; F0 D8 | Branch if equal
	BVC $F8			  ; 50 F8 | Branch if overflow clear
	BNE $F8			  ; D0 F8 | Branch if not equal
	BNE $F8			  ; D0 F8 | Branch if not equal
	BNE $F8			  ; D0 F8 | Branch if not equal
	BNE $FC			  ; D0 FC | Branch if not equal
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	INC $F00C,X		  ; FE 0C F0 | Increment (absolute,X)
	CPX $F008			; EC 08 F0 | Compare X register (absolute)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	SBC $FA			  ; E5 FA | Subtract with carry (zero page)
	SED				  ; F8 | Set decimal mode flag
	ORA $F8			  ; 05 F8 | Logical OR with accumulator (zero page)
	BRA $FC			  ; 80 FC | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BRA $48			  ; 80 48 | Branch always
	BRA $40			  ; 80 40 | Branch always
	AND $7B00,Y		  ; 39 00 7B | Logical AND with accumulator (absolute,Y)
	PHB				  ; 8B | Push data bank register to stack
	BMI $C0			  ; 30 C0 | Branch if negative
	TAY				  ; A8 | Transfer accumulator to Y register
	BRA $FF			  ; 80 FF | Branch always
	SBC $64FF,Y		  ; F9 FF 64 | Subtract with carry (absolute,Y)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	NOP				  ; EA | No operation
	BEQ $0D			  ; F0 0D | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_113
; Address: $E7B945
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_113:
	BCC $24			  ; 90 24 | Branch if carry clear
	SEP #$70			 ; E2 70 | Set processor status bits
	LSR $B0			  ; 46 B0 | Logical shift right (zero page)
	DEY				  ; 88 | Decrement Y register
	BVC $88			  ; 50 88 | Branch if overflow clear
	BVC $EB			  ; 50 EB | Branch if overflow clear
	SBC $EF7B			; ED 7B EF | Subtract with carry (absolute)
	STA				  ; 9F E4 DB EB | Update graphics data
	LDA				  ; BF 88 7F 8F | Read graphics status
	ROL $0F56			; 2E 56 0F | Rotate left (absolute)
	STX $0F			  ; 86 0F | Store X register to zero page
	ASL $0F13			; 0E 13 0F | Arithmetic shift left (absolute)
	CMP $0B			  ; C5 0B | Compare accumulator (zero page)
	BPL $0B			  ; 10 0B | Branch if positive
	SBC ($DC),Y		  ; F1 DC | Subtract with carry ((zero page),Y)
	CMP ($F8),Y		  ; D1 F8 | Compare accumulator ((zero page),Y)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_116
; Address: $E7B997
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_116:
	STY $80			  ; 84 80 | Store Y register to zero page
	BCS $CB			  ; B0 CB | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	SBC $810E,X		  ; FD 0E 81 | Subtract with carry (absolute,X)
	STA ($1D,X)		  ; 81 1D | Update graphics data
	LDA				  ; BF C1 BF C1 | Read graphics status
	ASL $3FFF			; 0E FF 3F | Arithmetic shift left (absolute)
	INC $FE1C,X		  ; FE 1C FE | Increment (absolute,X)
	CPY #$7E			 ; C0 7E | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_117
; Address: $E7B9BA
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_117:
	JSR $FB20			; 20 20 FB | Jump to subroutine
	XBA				  ; EB | Exchange accumulator bytes
	PLB				  ; AB | Pull data bank register from stack
	TSX				  ; BA | Transfer stack pointer to X register
	BNE $BF			  ; D0 BF | Branch if not equal
	INX				  ; E8 | Increment X register
	ROR $DC91,X		  ; 7E 91 DC | Rotate right (absolute,X)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF FF E8 FF | Read graphics status
	STA ($FF),Y		  ; 91 FF | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	BEQ $F7			  ; F0 F7 | Branch if equal
	BRA $77			  ; 80 77 | Branch always
	BEQ $0F			  ; F0 0F | Branch if equal
	TXA				  ; 8A | Transfer X register to accumulator
	JMP $080F			; 4C 0F 08 | Jump to address
	TXA				  ; 8A | Transfer X register to accumulator
	JMP $7F80			; 4C 80 7F | Jump to address
	STA ($7E,X)		  ; 81 7E | Update graphics data
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BEQ $5D			  ; F0 5D | Branch if equal
	BRA $5D			  ; 80 5D | Branch always
	BRA $40			  ; 80 40 | Branch always
	BRA $FF			  ; 80 FF | Branch always
	PLP				  ; 28 | Pull processor status from stack
	JMP $33A0			; 4C A0 33 | Jump to address
	CPY $0078			; CC 78 00 | Compare Y register (absolute)
	BMI $90			  ; 30 90 | Branch if negative
	BCC $F7			  ; 90 F7 | Branch if carry clear
	BPL $FE			  ; 10 FE | Branch if positive
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	AND ($FB),Y		  ; 31 FB | Logical AND with accumulator ((zero page),Y)
	AND ($F3),Y		  ; 31 F3 | Logical AND with accumulator ((zero page),Y)
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_118
; Address: $E7BA54
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_118:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $3500,X		  ; FD 00 35 | Subtract with carry (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STZ $1E12			; 9C 12 1E | Store zero to absolute
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STZ $1E9C			; 9C 9C 1E | Store zero to absolute
	ASL $0001,X		  ; 1E 01 00 | Arithmetic shift left (absolute,X)
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
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_119
; Address: $E7BAD3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_119:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_11A
; Address: $E7BAE6
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_11A:
	JSR $3E40			; 20 40 3E | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	EOR ($81,X)		  ; 41 81 | Exclusive OR with accumulator ((zero page,X))
	AND ($DF),Y		  ; 31 DF | Logical AND with accumulator ((zero page),Y)
	LDY $BCC3,X		  ; BC C3 BC | Load from absolute,X into Y register
	LDA				  ; BF 77 8B 3D | Read graphics status
	INC $0302,X		  ; FE 02 03 | Increment (absolute,X)
	ASL $661F,X		  ; 1E 1F 66 | Arithmetic shift left (absolute,X)
	ORA $DC22,X		  ; 1D 22 DC | Logical OR with accumulator (absolute,X)
	ORA ($C6,X)		  ; 01 C6 | Logical OR with accumulator ((zero page,X))
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STY $1CFB			; 8C FB 1C | Store Y register to absolute address
	JMP $FFC0BF		  ; 5C BF C0 FF | Jump to address long
	DEC $F9			  ; C6 F9 | Decrement (zero page)
	ASL $F3FF,X		  ; 1E FF F3 | Arithmetic shift left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	CPY #$48			 ; C0 48 | Compare Y register (immediate)
	BRA $84			  ; 80 84 | Branch always
	ASL $A116,X		  ; 1E 16 A1 | Arithmetic shift left (absolute,X)
	BRA $44			  ; 80 44 | Branch always
	STA				  ; 9F 04 FF 37 | Update graphics data
	INC $1EFF,X		  ; FE FF 1E | Increment (absolute,X)
	SBC #$7F			 ; E9 7F | Subtract with carry (immediate)
	SBC ($0A),Y		  ; F1 0A | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STZ $2196,X		  ; 9E 96 21 | PPU graphics register access
	INC $FF04,X		  ; FE 04 FF | Increment (absolute,X)
	INC $9EFF,X		  ; FE FF 9E | Increment (absolute,X)
	ADC #$FF			 ; 69 FF | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_11B
; Address: $E7BB5E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_11B:
	JSR $01FF			; 20 FF 01 | Jump to subroutine
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_11C
; Address: $E7BB80
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_11C:
	JSR $9400			; 20 00 94 | Jump to subroutine
	BPL $A6			  ; 10 A6 | Branch if positive
	LDA ($10),Y		  ; B1 10 | Read graphics status

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_11D
; Address: $E7BB8A
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_11D:
	BNE $10			  ; D0 10 | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $1F			  ; 80 1F | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	AND ($EF),Y		  ; 31 EF | Logical AND with accumulator ((zero page),Y)
	BVS $EF			  ; 70 EF | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	LDY $CC00			; AC 00 CC | Load from absolute address into Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND $43FB,X		  ; 3D FB 43 | Logical AND with accumulator (absolute,X)
	LDA $FFCFFF		  ; AF FF CF FF | Read graphics status
	ORA $FBFF			; 0D FF FB | Logical OR with accumulator (absolute)
	SBC $004F,X		  ; FD 4F 00 | Subtract with carry (absolute,X)
	BPL $A6			  ; 10 A6 | Branch if positive
	LDA ($10),Y		  ; B1 10 | Read graphics status
	BNE $10			  ; D0 10 | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	XBA				  ; EB | Exchange accumulator bytes
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	AND ($EF),Y		  ; 31 EF | Logical AND with accumulator ((zero page),Y)
	BVS $EF			  ; 70 EF | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	AND $4100,Y		  ; 39 00 41 | Logical AND with accumulator (absolute,Y)
	LDA $CD00			; AD 00 CD | Read graphics status
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	ROL $42FF,X		  ; 3E FF 42 | Hardware register operation
	LDX $CEFF			; AE FF CE | Load from absolute address into X register
	ORA $FBFF			; 0D FF FB | Logical OR with accumulator (absolute)
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	STZ $B23F,X		  ; 9E 3F B2 | Store zero to absolute,X
	INY				  ; C8 | Increment Y register
	STA ($21,X)		  ; 81 21 | PPU graphics register access
	ROR $9591			; 6E 91 95 | Rotate right (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY $8000			; CC 00 80 | Compare Y register (absolute)
	DEC $FF00,X		  ; DE 00 FF | Decrement (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PHX				  ; DA | Push X register to stack
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_11E
; Address: $E7BC2C
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_11E:
	AND ($E1,X)		  ; 21 E1 | Logical AND with accumulator ((zero page,X))
	ROL $00C1,X		  ; 3E C1 00 | Rotate left (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF 00 BF 00 | Read graphics status
	STZ $FF00,X		  ; 9E 00 FF | Store zero to absolute,X
	ASL $0A19,X		  ; 1E 19 0A | Arithmetic shift left (absolute,X)
	ORA $3B17,Y		  ; 19 17 3B | Logical OR with accumulator (absolute,Y)
	LDX $1F31			; AE 31 1F | Load from absolute address into X register
	PHX				  ; DA | Push X register to stack
	STX $AC86			; 8E 86 AC | Store X register to absolute address
	LDY $BCBC			; AC BC BC | Load from absolute address into Y register
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	AND $DC			  ; 25 DC | Logical AND with accumulator (zero page)
	ADC ($9C,X)		  ; 61 9C | Add with carry ((zero page,X))
	DEC $8EDE,X		  ; DE DE 8E | Decrement (absolute,X)
	STX $ACAC			; 8E AC AC | Store X register to absolute address
	LDY $FCBC,X		  ; BC BC FC | Load from absolute,X into Y register
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ROR $37C0,X		  ; 7E C0 37 | Rotate right (absolute,X)
	BCS $4E			  ; B0 4E | Branch if carry set
	BRA $32			  ; 80 32 | Branch always
	JMP $0201			; 4C 01 02 | Jump to address
	BCS $80			  ; B0 80 | Branch if carry set
	EOR ($BF,X)		  ; 41 BF | Exclusive OR with accumulator ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	BRA $FF			  ; 80 FF | Branch always
	LSR $C821,X		  ; 5E 21 C8 | Logical shift right (absolute,X)
	ORA #$96			 ; 09 96 | Logical OR with accumulator (immediate)
	LDA ($4C,X)		  ; A1 4C | Read graphics status
	LDY #$40			 ; A0 40 | Load immediate value into Y register
	LSR $0A20,X		  ; 5E 20 0A | Logical shift right (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	PLP				  ; 28 | Pull processor status from stack
	DEY				  ; 88 | Decrement Y register
	STA ($FF,X)		  ; 81 FF | Update graphics data
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	LDA $7709			; AD 09 77 | Read graphics status
	BRA $AC			  ; 80 AC | Branch always
	BRA $80			  ; 80 80 | Branch always
	BCS $C0			  ; B0 C0 | Branch if carry set

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_11F
; Address: $E7BD0A
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_11F:
	CMP $E6E2,X		  ; DD E2 E6 | Compare accumulator (absolute,X)
	SBC $FFFD,Y		  ; F9 FD FF | Subtract with carry (absolute,Y)
	AND $08F6			; 2D F6 08 | Logical AND with accumulator (absolute)
	AND $F700			; 2D 00 F7 | Logical AND with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BVC $00			  ; 50 00 | Branch if overflow clear
	STA $3662,X		  ; 9D 62 36 | Update graphics data
	CMP #$75			 ; C9 75 | Compare accumulator (immediate)
	AND $08FF,X		  ; 3D FF 08 | Logical AND with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA $1314,Y		  ; 19 14 13 | Logical OR with accumulator (absolute,Y)
	BPL $1F			  ; 10 1F | Branch if positive
	BPL $2F			  ; 10 2F | Branch if positive
	BMI $2F			  ; 30 2F | Branch if negative
	BMI $20			  ; 30 20 | Branch if negative
	LSR $988E			; 4E 8E 98 | Logical shift right (absolute)
	CLC				  ; 18 | Clear carry flag
	LDA ($20,X)		  ; A1 20 | Read graphics status
	LSR $86			  ; 46 86 | Logical shift right (zero page)
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	CPX $E857			; EC 57 E8 | Compare X register (absolute)
	ROL $18F1			; 2E F1 18 | Rotate left (absolute)
	ROR $78F9,X		  ; 7E F9 78 | Rotate right (absolute,X)
	CMP $8ECC			; CD CC 8E | Compare accumulator (absolute)
	ASL $81			  ; 06 81 | Arithmetic shift left (zero page)
	BRA $F3			  ; 80 F3 | Branch always
	ROR $61			  ; 66 61 | Rotate right (zero page)
	ORA ($CA,X)		  ; 01 CA | Logical OR with accumulator ((zero page,X))
	ORA ($75,X)		  ; 01 75 | Logical OR with accumulator ((zero page,X))
	CMP $FF33			; CD 33 FF | Compare accumulator (absolute)
	SBC $7F86,Y		  ; F9 86 7F | Subtract with carry (absolute,Y)
	INC $66FF,X		  ; FE FF 66 | Increment (absolute,X)
	STA				  ; 9F 0E FF CC | Update graphics data
	LDX $D90E			; AE 0E D9 | Load from absolute address into X register
	CLC				  ; 18 | Clear carry flag
	LDX $5620			; AE 20 56 | Load from absolute address into X register
	STX $B8			  ; 86 B8 | Store X register to zero page
	SEC				  ; 38 | Set carry flag
	CPX $E857			; EC 57 E8 | Compare X register (absolute)
	ROR $59F1			; 6E F1 59 | Rotate right (absolute)
	ROL $76DF			; 2E DF 76 | Rotate left (absolute)
	SBC $C778,Y		  ; F9 78 C7 | Subtract with carry (absolute,Y)
	CPY $EFCC			; CC CC EF | Compare Y register (absolute)
	ASL $81			  ; 06 81 | Arithmetic shift left (zero page)
	BRA $F3			  ; 80 F3 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_121
; Address: $E7BDD2
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_121:
	CMP $FE33			; CD 33 FE | Compare accumulator (absolute)
	SBC $7F86,Y		  ; F9 86 7F | Subtract with carry (absolute,Y)
	INC $66FF,X		  ; FE FF 66 | Increment (absolute,X)
	STA				  ; 9F 0E FF CC | Update graphics data
	CPY $5B			  ; C4 5B | Compare Y register (zero page)
	LDY $3F			  ; A4 3F | Load from zero page into Y register
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ROL $0628			; 2E 28 06 | Rotate left (absolute)
	BIT $FB02			; 2C 02 FB | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_123
; Address: $E7BE0F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_123:
	JSR $007F			; 20 7F 00 | Jump to subroutine
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	ROL $DD00,X		  ; 3E 00 DD | Rotate left (absolute,X)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BVS $FF			  ; 70 FF | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_124
; Address: $E7BE24
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_124:
	LDA $185730		  ; AF 30 57 18 | Read graphics status
	PLP				  ; 28 | Pull processor status from stack
	DEC				  ; 3A | Decrement accumulator
	SEC				  ; 38 | Set carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA				  ; BF 3F BF 3F | Read graphics status
	ADC ($0F),Y		  ; 71 0F | Add with carry ((zero page),Y)
	EOR $2722,X		  ; 5D 22 27 | Exclusive OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ASL $0EF7			; 0E F7 0E | Arithmetic shift left (absolute)
	REP #$38			 ; C2 38 | Reset processor status bits
	DEC $E8			  ; C6 E8 | Decrement (zero page)
	CPY #$D8			 ; C0 D8 | Compare Y register (immediate)
	SBC $FDFC,X		  ; FD FC FD | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $F8			  ; E6 F8 | Increment (zero page)
	STX $3AF0			; 8E F0 3A | Store X register to absolute address
	CPY $F4			  ; C4 F4 | Compare Y register (zero page)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	ASL $7731			; 0E 31 77 | Arithmetic shift left (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $3731			; 0E 31 37 | Arithmetic shift left (absolute)
	PHA				  ; 48 | Push accumulator to stack
	BPL $4E			  ; 10 4E | Branch if positive
	BMI $83			  ; 30 83 | Branch if negative

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_125
; Address: $E7BE8A
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_125:
	CPY $67			  ; C4 67 | Compare Y register (zero page)
	STX $C43E			; 8E 3E C4 | Store X register to absolute address
	SED				  ; F8 | Set decimal mode flag
	CLV				  ; B8 | Clear overflow flag
	ASL $02F1			; 0E F1 02 | Arithmetic shift left (absolute)
	SBC $3F64,X		  ; FD 64 3F | Subtract with carry (absolute,X)
	PEA #$007F		   ; F4 7F 00 | Push effective address to stack
	BRA $FF			  ; 80 FF | Branch always
	SEC				  ; 38 | Set carry flag
	AND $20FE,X		  ; 3D FE 20 | Logical AND with accumulator (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $80			  ; 80 80 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $10			  ; 30 10 | Branch if negative
	BPL $07			  ; 10 07 | Branch if positive
	BPL $3A			  ; 10 3A | Branch if positive
	ASL $0321,X		  ; 1E 21 03 | Arithmetic shift left (absolute,X)
	BPL $10			  ; 10 10 | Branch if positive
	BMI $2F			  ; 30 2F | Branch if negative
	BMI $20			  ; 30 20 | Branch if negative
	BMI $21			  ; 30 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_126
; Address: $E7BF23
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_126:
	JSR $0272			; 20 72 02 | Jump to subroutine
	AND $8001,Y		  ; 39 01 80 | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	SBC $FE39,X		  ; FD 39 FE | Subtract with carry (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	TSX				  ; BA | Transfer stack pointer to X register
	ORA ($EA,X)		  ; 01 EA | Logical OR with accumulator ((zero page,X))
	ORA ($C8,X)		  ; 01 C8 | Logical OR with accumulator ((zero page,X))
	ORA ($50,X)		  ; 01 50 | Logical OR with accumulator ((zero page,X))
	ORA ($04),Y		  ; 11 04 | Logical OR with accumulator ((zero page),Y)
	ORA ($E2,X)		  ; 01 E2 | Logical OR with accumulator ((zero page,X))
	STA ($AE,X)		  ; 81 AE | Update graphics data
	LDA #$E8			 ; A9 E8 | Read graphics status
	LDA #$BC			 ; A9 BC | Read graphics status
	CPX $CEFF			; EC FF CE | Compare X register (absolute)
	PLY				  ; 7A | Pull Y register from stack
	CPX $7F			  ; E4 7F | Compare X register (zero page)
	CPX $EA57			; EC 57 EA | Compare X register (absolute)
	BMI $21			  ; 30 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_127
; Address: $E7BF63
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_127:
	JSR $00F0			; 20 F0 00 | Jump to subroutine
	CLV				  ; B8 | Clear overflow flag
	BRA $00			  ; 80 00 | Branch always
	BCS $10			  ; B0 10 | Branch if carry set
	BCS $10			  ; B0 10 | Branch if carry set
	LDY $731C,X		  ; BC 1C 73 | Load from absolute,X into Y register
	LDA ($DF,X)		  ; A1 DF | Read graphics status
	BVS $FF			  ; 70 FF | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	BVS $EF			  ; 70 EF | Branch if overflow set
	BVS $EF			  ; 70 EF | Branch if overflow set
	TSX				  ; BA | Transfer stack pointer to X register
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	EOR ($10),Y		  ; 51 10 | Exclusive OR with accumulator ((zero page),Y)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	LDY $ECFF,X		  ; BC FF EC | Load from absolute,X into Y register
	DEC $56FF			; CE FF 56 | Decrement (absolute)
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $0B6E			; 2D 6E 0B | Logical AND with accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND $017E,X		  ; 3D 7E 01 | Logical AND with accumulator (absolute,X)
	ROR $43C2,X		  ; 7E C2 43 | Rotate right (absolute,X)
	PEA #$8649		   ; F4 49 86 | Push effective address to stack
	AND $A9			  ; 25 A9 | Logical AND with accumulator (zero page)
	STA ($00),Y		  ; 91 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	LDA $BF00,X		  ; BD 00 BF | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	ORA ($23),Y		  ; 11 23 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_128
; Address: $E7BFC8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_128:
	JSL $031305		  ; 22 05 13 03 | Jump to subroutine long
	BPL $2E			  ; 10 2E | Branch if positive
	ORA ($37),Y		  ; 11 37 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BMI $C0			  ; 30 C0 | Branch if negative
	INX				  ; E8 | Increment X register
	STZ $34D8			; 9C D8 34 | Store zero to absolute
	SEI				  ; 78 | Set interrupt disable flag
	CPX $30			  ; E4 30 | Compare X register (zero page)
	PHP				  ; 08 | Push processor status to stack
	CPY #$30			 ; C0 30 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_129
; Address: $E7BFEF
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_129:
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	CPX $1C10			; EC 10 1C | Compare X register (absolute)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROL $6E			  ; 26 6E | Rotate left (zero page)
	AND $3F8D			; 2D 8D 3F | Logical AND with accumulator (absolute)
	ADC $3E			  ; 65 3E | Add with carry (zero page)
	STA ($7B,X)		  ; 81 7B | Update graphics data
	TSX				  ; BA | Transfer stack pointer to X register
	ASL $16C3,X		  ; 1E C3 16 | Arithmetic shift left (absolute,X)
	ROL $0D51			; 2E 51 0D | Rotate left (absolute)
	SBC $433C,X		  ; FD 3C 43 | Subtract with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	BPL $EF			  ; 10 EF | Branch if positive
	EOR $AE37,Y		  ; 59 37 AE | Exclusive OR with accumulator (absolute,Y)
	ADC ($98,X)		  ; 61 98 | Add with carry ((zero page,X))
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 61 9E 30 | Read graphics status
	BRA $40			  ; 80 40 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_12A
; Address: $E7C043
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_12A:
	BPL $C0			  ; 10 C0 | Branch if positive
	SEC				  ; 38 | Set carry flag
	EOR ($FC,X)		  ; 41 FC | Exclusive OR with accumulator ((zero page,X))
	EOR $CF			  ; 45 CF | Exclusive OR with accumulator (zero page)
	SBC ($FA,X)		  ; E1 FA | Subtract with carry ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $3FC0,X		  ; FE C0 3F | Increment (absolute,X)
	CMP $3A			  ; C5 3A | Compare accumulator (zero page)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $80			  ; F0 80 | Branch if equal
	BEQ $78			  ; F0 78 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	BVS $70			  ; 70 70 | Branch if overflow set
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	PEA #$231C		   ; F4 1C 23 | Push effective address to stack
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_12B
; Address: $E7C08A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_12B:
	BPL $2F			  ; 10 2F | Branch if positive
	AND $200D			; 2D 0D 20 | Logical AND with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_12D
; Address: $E7C096
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_12D:
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	STA $1150,Y		  ; 99 50 11 | Update graphics data
	BMI $11			  ; 30 11 | Branch if negative
	ORA $0160,X		  ; 1D 60 01 | Logical OR with accumulator (absolute,X)
	SEP #$01			 ; E2 01 | Set processor status bits
	STA ($9E,X)		  ; 81 9E | Update graphics data
	ORA ($BA,X)		  ; 01 BA | Logical OR with accumulator ((zero page,X))
	LSR $1EE3,X		  ; 5E E3 1E | Logical shift right (absolute,X)
	JMP ($40FF)		  ; 6C FF 40 | Jump to address (absolute indirect)
	STZ $DB00			; 9C 00 DB | Store zero to absolute
	CLV				  ; B8 | Clear overflow flag
	BMI $8C			  ; 30 8C | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $5A6C			; 6E 6C 5A | Rotate right (absolute)
	RTI				  ; 40 | Return from interrupt
	BIT #$80			 ; 89 80 | Test bits in accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_12E
; Address: $E7C0EC
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_12E:
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	ORA ($35,X)		  ; 01 35 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 8E 7F FE | Read graphics status
	ROR $FE9F			; 6E 9F FE | Rotate right (absolute)
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	AND ($14,X)		  ; 21 14 | Logical AND with accumulator ((zero page,X))
	STZ $02			  ; 64 02 | Store zero to zero page
	JMP $22403E		  ; 5C 3E 40 22 | Jump to address long
	ROL $09			  ; 26 09 | Rotate left (zero page)
	ROR $7637,X		  ; 7E 37 76 | Rotate right (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	ROR $4200,X		  ; 7E 00 42 | Hardware register operation
	LSR $5A00,X		  ; 5E 00 5A | Logical shift right (absolute,X)
	STA ($00,X)		  ; 81 00 | Update graphics data
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	ADC $22DF			; 6D DF 22 | Add with carry (absolute)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CMP $00C8			; CD C8 00 | Compare accumulator (absolute)
	DEX				  ; CA | Decrement X register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CMP $FF7F,X		  ; DD 7F FF | Compare accumulator (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	LDX $871B,Y		  ; BE 1B 87 | Load from absolute,Y into X register
	ROL $2E0E,X		  ; 3E 0E 2E | Rotate left (absolute,X)
	BIT $11			  ; 24 11 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_130
; Address: $E7C150
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_130:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	ASL $39			  ; 06 39 | Arithmetic shift left (zero page)
	ASL $0431			; 0E 31 04 | Arithmetic shift left (absolute)
	CPX #$39			 ; E0 39 | Compare X register (immediate)
	CMP $07			  ; C5 07 | Compare accumulator (zero page)
	TSX				  ; BA | Transfer stack pointer to X register
	ORA $21D7,Y		  ; 19 D7 21 | PPU graphics register access
	PHP				  ; 08 | Push processor status to stack
	BCC $74			  ; 90 74 | Branch if carry clear
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP $62E9,Y		  ; D9 E9 62 | Compare accumulator (absolute,Y)
	STY $9D			  ; 84 9D | Store Y register to zero page
	DEC $5B6C			; CE 6C 5B | Decrement (absolute)
	STA $5B75,Y		  ; 99 75 5B | Update graphics data
	INX				  ; E8 | Increment X register
	CLD				  ; D8 | Clear decimal mode flag
	BPL $EF			  ; 10 EF | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_131
; Address: $E7C193
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_131:
	STA				  ; 9F 04 FB 0C | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	CPY $F6			  ; C4 F6 | Compare Y register (zero page)
	CLV				  ; B8 | Clear overflow flag
	DEC				  ; 3A | Decrement accumulator
	CLD				  ; D8 | Clear decimal mode flag
	INC				  ; 1A | Increment accumulator
	BPL $14			  ; 10 14 | Branch if positive
	INY				  ; C8 | Increment Y register
	CLI				  ; 58 | Clear interrupt disable flag
	BNE $C4			  ; D0 C4 | Branch if not equal
	BPL $14			  ; 10 14 | Branch if positive
	PEA #$380A		   ; F4 0A 38 | Push effective address to stack
	DEC $18			  ; C6 18 | Decrement (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	CPX $BC40			; EC 40 BC | Compare X register (absolute)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	BPL $EC			  ; 10 EC | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_132
; Address: $E7C1C1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_132:
	JSR $2E11			; 20 11 2E | Jump to subroutine
	BPL $2F			  ; 10 2F | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_133
; Address: $E7C1C8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_133:
	WDM #$7D			 ; 42 7D | Reserved instruction
	WDM #$7D			 ; 42 7D | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	ASL $3F7F,X		  ; 1E 7F 3F | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_134
; Address: $E7C1D6
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_134:
	LDA				  ; BF C0 BF C0 | Read graphics status
	LDA				  ; BF C0 BF E0 | Read graphics status
	BRA $FF			  ; 80 FF | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	STY $8C73			; 8C 73 8C | Store Y register to absolute address
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	INC $0000			; EE 00 00 | Increment (absolute)
	DEC $04			  ; C6 04 | Decrement (zero page)
	ADC $D080,X		  ; 7D 80 D0 | Add with carry (absolute,X)
	BNE $00			  ; D0 00 | Branch if not equal
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY #$C1			 ; C0 C1 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $051D			; 0D 1D 05 | Logical OR with accumulator (absolute)
	ORA $0112			; 0D 12 01 | Logical OR with accumulator (absolute)
	ASL $3FCB			; 0E CB 3F | Arithmetic shift left (absolute)
	CPY $683C			; CC 3C 68 | Compare Y register (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_136
; Address: $E7C28E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_136:
	JSR $0060			; 20 60 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BRA $7C			  ; 80 7C | Branch always
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	LDX $6FEA,Y		  ; BE EA 6F | Load from absolute,Y into X register
	SEI				  ; 78 | Set interrupt disable flag
	STY $50			  ; 84 50 | Store Y register to zero page
	STA ($3D),Y		  ; 91 3D | Update graphics data
	ORA ($75),Y		  ; 11 75 | Logical OR with accumulator ((zero page),Y)
	AND $B5			  ; 25 B5 | Logical AND with accumulator (zero page)
	ADC $BE			  ; 65 BE | Add with carry (zero page)
	EOR ($6E,X)		  ; 41 6E | Exclusive OR with accumulator ((zero page,X))
	STA ($28),Y		  ; 91 28 | Update graphics data
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_137
; Address: $E7C2BA
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_137:
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	PLA				  ; 68 | Pull accumulator from stack
	BIT $142C			; 2C 2C 14 | Test bits in accumulator (absolute)
	LDY $94			  ; A4 94 | Load from zero page into Y register
	STY $94			  ; 84 94 | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $7C			  ; 80 7C | Branch always
	BRA $7C			  ; 80 7C | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $C0			  ; 80 C0 | Branch always

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_138
; Address: $E7C30A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_138:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BPL $30			  ; 10 30 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_139
; Address: $E7C319
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_139:
	JSR $E000			; 20 00 E0 | Game work RAM access
	BRA $F0			  ; 80 F0 | Branch always
	BNE $E8			  ; D0 E8 | Branch if not equal
	SEP #$1D			 ; E2 1D | Set processor status bits
	EOR ($B6,X)		  ; 41 B6 | Exclusive OR with accumulator ((zero page,X))
	EOR ($AA,X)		  ; 41 AA | Exclusive OR with accumulator ((zero page,X))
	EOR #$D5			 ; 49 D5 | Exclusive OR with accumulator (immediate)
	ROL $1C94,X		  ; 3E 94 1C | Rotate left (absolute,X)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BRA $7F			  ; 80 7F | Branch always
	CMP $EBA2,X		  ; DD A2 EB | Compare accumulator (absolute,X)
	CMP $BE22,X		  ; DD 22 BE | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_13A
; Address: $E7C339
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_13A:
	EOR ($EB,X)		  ; 41 EB | Exclusive OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	JMP $00B3			; 4C B3 00 | Jump to address
	STZ $6C07			; 9C 07 6C | Store zero to absolute
	BCC $F0			  ; 90 F0 | Branch if carry clear
	STA				  ; 9F 00 FF F3 | Update graphics data
	BCC $F3			  ; 90 F3 | Branch if carry clear
	STA				  ; 9F 6C FF 60 | Update graphics data
	LDA $5E			  ; A5 5E | Read graphics status
	LDX $CF			  ; A6 CF | Load from zero page into X register
	CLI				  ; 58 | Clear interrupt disable flag
	TAX				  ; AA | Transfer accumulator to X register
	PEA #$F81E		   ; F4 1E F8 | Push effective address to stack
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	JMP $68D4			; 4C D4 68 | Jump to address
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_13C
; Address: $E7C3CB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_13C:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_13D
; Address: $E7C3DB
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_13D:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	ASL $100E,X		  ; 1E 0E 10 | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	BPL $0F			  ; 10 0F | Branch if positive
	ROL $4731			; 2E 31 47 | Rotate left (absolute)
	JMP $B07F			; 4C 7F B0 | Jump to address
	CLV				  ; B8 | Clear overflow flag
	PHP				  ; 08 | Push processor status to stack
	BEQ $E0			  ; F0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_13E
; Address: $E7C408
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_13E:
	BEQ $08			  ; F0 08 | Branch if equal
	BNE $DC			  ; D0 DC | Branch if not equal
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BCS $48			  ; B0 48 | Branch if carry set
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $10			  ; F0 10 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BPL $F8			  ; 10 F8 | Branch if positive
	BNE $2C			  ; D0 2C | Branch if not equal
	BEQ $FE			  ; F0 FE | Branch if equal
	BMI $FE			  ; 30 FE | Branch if negative
	PLP				  ; 28 | Pull processor status from stack
	LSR $FE			  ; 46 FE | Logical shift right (zero page)
	STA $CBBB,Y		  ; 99 BB CB | Update graphics data
	LDY $84BB,X		  ; BC BB 84 | Load from absolute,X into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDX $BE3E,Y		  ; BE 3E BE | Load from absolute,Y into X register
	ROL $3FBF,X		  ; 3E BF 3F | Rotate left (absolute,X)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	JMP $734C			; 4C 4C 73 | Jump to address
	AND $08FF			; 2D FF 08 | Logical AND with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA ($F2,X)		  ; 01 F2 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_13F
; Address: $E7C483
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_13F:
	JSR $3C4C			; 20 4C 3C | Jump to subroutine
	ROR $3742,X		  ; 7E 42 37 | Rotate right (absolute,X)
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	ORA #$7E			 ; 09 7E | Logical OR with accumulator (immediate)
	LDA $BEC3,X		  ; BD C3 BE | Read graphics status
	SBC $FDFF,X		  ; FD FF FD | Subtract with carry (absolute,X)
	LDA $8BF7,X		  ; BD F7 8B | Read graphics status
	AND $A8FE,X		  ; 3D FE A8 | Logical AND with accumulator (absolute,X)
	REP #$6D			 ; C2 6D | Reset processor status bits
	ASL $5C			  ; 06 5C | Arithmetic shift left (zero page)
	STZ $43			  ; 64 43 | Store zero to zero page
	ORA ($22),Y		  ; 11 22 | Logical OR with accumulator ((zero page),Y)
	ORA ($C6,X)		  ; 01 C6 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_140
; Address: $E7C4AE
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_140:
	JSR $9400			; 20 00 94 | Jump to subroutine
	ROR $FB8C,X		  ; 7E 8C FB | Rotate right (absolute,X)
	STZ $5CE3			; 9C E3 5C | Store zero to absolute
	LDA				  ; BF CC FF FC | Read graphics status
	DEC $F9			  ; C6 F9 | Decrement (zero page)
	SBC ($EF,X)		  ; E1 EF | Subtract with carry ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	AND $7F38,Y		  ; 39 38 7F | Logical AND with accumulator (absolute,Y)
	INC $FE4E,X		  ; FE 4E FE | Increment (absolute,X)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_141
; Address: $E7C4D0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_141:
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	STY $00			  ; 84 00 | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_142
; Address: $E7C4EE
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_142:
	JSL $000822		  ; 22 22 08 00 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CMP $8400,X		  ; DD 00 84 | Compare accumulator (absolute,X)
	BRA $F7			  ; 80 F7 | Branch always
	BEQ $06			  ; F0 06 | Branch if equal
	ROR $B000,X		  ; 7E 00 B0 | Rotate right (absolute,X)
	BRA $87			  ; 80 87 | Branch always
	PEA #$FA0F		   ; F4 0F FA | Push effective address to stack
	ADC $B3FF,X		  ; 7D FF B3 | Add with carry (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_143
; Address: $E7C521
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_143:
	JSR $0ACA			; 20 CA 0A | Jump to subroutine
	STA ($A0),Y		  ; 91 A0 | Update graphics data
	LSR $7F30			; 4E 30 7F | Logical shift right (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_144
; Address: $E7C52E
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_144:
	ASL $C620,X		  ; 1E 20 C6 | Arithmetic shift left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	STX $817F			; 8E 7F 81 | Store X register to absolute address
	STA				  ; 9F FF F3 FF | Update graphics data
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	STA $C3E2			; 8D E2 C3 | Update graphics data
	BPL $FF			  ; 10 FF | Branch if positive
	BVC $1F			  ; 50 1F | Branch if overflow clear
	STA $504020		  ; 8F 20 40 50 | Update graphics data
	BMI $40			  ; 30 40 | Branch if negative
	BVC $67			  ; 50 67 | Branch if overflow clear
	EOR ($66),Y		  ; 51 66 | Exclusive OR with accumulator ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	LDA				  ; BF 00 BF 00 | Read graphics status
	LDA				  ; BF 00 BF 00 | Read graphics status
	LDA				  ; BF 00 FE 01 | Read graphics status
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ASL $1A			  ; 06 1A | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	INC $0A			  ; E6 0A | Increment (zero page)
	INC $89			  ; E6 89 | Increment (zero page)
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_145
; Address: $E7C5B4
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_145:
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	EOR $535E,X		  ; 5D 5E 53 | Exclusive OR with accumulator (absolute,X)
	ORA ($08),Y		  ; 11 08 | Logical OR with accumulator ((zero page),Y)
	AND $A839,Y		  ; 39 39 A8 | Logical AND with accumulator (absolute,Y)
	INX				  ; E8 | Increment X register
	LDY $EC37			; AC 37 EC | Load from absolute address into Y register
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	EOR $1166,Y		  ; 59 66 11 | Exclusive OR with accumulator (absolute,Y)
	JMP ($116C)		  ; 6C 6C 11 | Jump to address (absolute indirect)
	ROL $59			  ; 26 59 | Rotate left (zero page)
	ROR $91			  ; 66 91 | Rotate right (zero page)
	ROR $D1			  ; 66 D1 | Rotate right (zero page)
	INC $B9			  ; E6 B9 | Increment (zero page)
	ROR $D1			  ; 66 D1 | Rotate right (zero page)
	ROL $99			  ; 26 99 | Rotate left (zero page)
	ROL $5A			  ; 26 5A | Rotate left (zero page)
	STZ $FF			  ; 64 FF | Store zero to zero page
	LDA				  ; BF 00 9F 00 | Read graphics status
	LDA				  ; BF 00 8B 66 | Read graphics status
	PHB				  ; 8B | Push data bank register to stack
	ROR $9B			  ; 66 9B | Rotate right (zero page)
	ROR $8A			  ; 66 8A | Rotate right (zero page)
	BIT #$64			 ; 89 64 | Test bits in accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	ADC $8B			  ; 65 8B | Add with carry (zero page)
	ROR $5A			  ; 66 5A | Rotate right (zero page)
	ROL $FD			  ; 26 FD | Rotate left (zero page)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	BPL $20			  ; 10 20 | Branch if positive
	BIT $58			  ; 24 58 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_146
; Address: $E7C625
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_146:
	JSR $308F			; 20 8F 30 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	XBA				  ; EB | Exchange accumulator bytes
	CLD				  ; D8 | Clear decimal mode flag
	AND ($3B,X)		  ; 21 3B | Logical AND with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	SBC $EC11			; ED 11 EC | Subtract with carry (absolute)
	AND $2DD0			; 2D D0 2D | Logical AND with accumulator (absolute)
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	EOR #$B6			 ; 49 B6 | Exclusive OR with accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	STY $4030			; 8C 30 40 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_147
; Address: $E7C66B
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_147:
	LDA				  ; BF 93 00 00 | Read graphics status
	LDA				  ; BF 00 FF 00 | Read graphics status
	BPL $ED			  ; 10 ED | Branch if positive
	BCC $6D			  ; 90 6D | Branch if carry clear
	BNE $2D			  ; D0 2D | Branch if not equal
	BMI $0D			  ; 30 0D | Branch if negative
	SBC $0196,X		  ; FD 96 01 | Subtract with carry (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	AND $7923,X		  ; 3D 23 79 | Logical AND with accumulator (absolute,X)
	ROR $7C45,X		  ; 7E 45 7C | Rotate right (absolute,X)
	DEC $C6A3,X		  ; DE A3 C6 | Decrement (absolute,X)
	LDA $8EF3,Y		  ; B9 F3 8E | Read graphics status
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	BMI $FF			  ; 30 FF | Branch if negative
	STA ($81,X)		  ; 81 81 | Update graphics data
	BIT $8CBB			; 2C BB 8C | Test bits in accumulator (absolute)
	CPY $CE71			; CC 71 CE | Compare Y register (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	BIT $DB			  ; 24 DB | Test bits in accumulator (zero page)
	STA ($01,X)		  ; 81 01 | Update graphics data
	ORA ($BF),Y		  ; 11 BF | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_148
; Address: $E7C6DE
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_148:
	JSR $7CFF			; 20 FF 7C | Jump to subroutine
	SBC $DDAA,Y		  ; F9 AA DD | Subtract with carry (absolute,Y)
	ADC $9AE5,X		  ; 7D E5 9A | Add with carry (absolute,X)
	INC				  ; 1A | Increment accumulator
	ADC $6B77,X		  ; 7D 77 6B | Add with carry (absolute,X)
	BIT $3E			  ; 24 3E | Test bits in accumulator (zero page)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	JMP $73CE			; 4C CE 73 | Jump to address
	LDA $F26F,X		  ; BD 6F F2 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_149
; Address: $E7C70A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_149:
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BPL $FF			  ; 10 FF | Branch if positive
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	STA $823FC0		  ; 8F C0 3F 82 | Update graphics data
	ADC $162A,X		  ; 7D 2A 16 | Add with carry (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	JMP $FEBE7E		  ; 5C 7E BE FE | Jump to address long
	LDX $BFFE,Y		  ; BE FE BF | Load from absolute,Y into X register
	INC $BEFF,X		  ; FE FF BE | Increment (absolute,X)
	CMP ($A2,X)		  ; C1 A2 | Compare accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_14A
; Address: $E7C738
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_14A:
	ORA $1CE3,X		  ; 1D E3 1C | Logical OR with accumulator (absolute,X)
	CPX $14			  ; E4 14 | Compare X register (zero page)
	CPX $53			  ; E4 53 | Compare X register (zero page)
	LDA $3FAF3F		  ; AF 3F AF 3F | Read graphics status
	LDY #$3F			 ; A0 3F | Load immediate value into Y register
	LDY #$3F			 ; A0 3F | Load immediate value into Y register
	LDY #$FB			 ; A0 FB | Load immediate value into Y register
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BNE $20			  ; D0 20 | Branch if not equal
	BNE $20			  ; D0 20 | Branch if not equal

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_14C
; Address: $E7C75F
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_14C:
	JSR $C9B6			; 20 B6 C9 | Jump to subroutine
	ROL $161C,X		  ; 3E 1C 16 | Rotate left (absolute,X)
	ASL $BCE6,X		  ; 1E E6 BC | Arithmetic shift left (absolute,X)
	LDA $3C			  ; A5 3C | Read graphics status
	ROR $3C18,X		  ; 7E 18 3C | Rotate right (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	ADC ($7F,X)		  ; 61 7F | Add with carry ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Update graphics data
	LDA $7F7FAF		  ; AF AF 7F 7F | Read graphics status
	RTI				  ; 40 | Return from interrupt
	CPY #$9D			 ; C0 9D | Compare Y register (immediate)
	INC $3F36			; EE 36 3F | Increment (absolute)
	LDA $80FF50		  ; AF 50 FF 80 | Read graphics status
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ROR $FD7F,X		  ; 7E 7F FD | Rotate right (absolute,X)
	ROR $BF7F,X		  ; 7E 7F BF | Rotate right (absolute,X)
	INC $72F1			; EE F1 72 | Increment (absolute)
	LDA				  ; BF 3F 8A F5 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	LDX $D9			  ; A6 D9 | Load from zero page into X register
	CMP $9172			; CD 72 91 | Compare accumulator (absolute)
	INC $DF20			; EE 20 DF | Increment (absolute)
	SBC $72CD			; ED CD 72 | Subtract with carry (absolute)
	AND $98C2,X		  ; 3D C2 98 | Logical AND with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag
	STA $8877F0		  ; 8F F0 77 88 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	NOP				  ; EA | No operation
	ORA $00F2			; 0D F2 00 | Logical OR with accumulator (absolute)
	BPL $EF			  ; 10 EF | Branch if positive
	BRA $7F			  ; 80 7F | Branch always
	LDA $7646,Y		  ; B9 46 76 | Read graphics status
	BIT #$91			 ; 89 91 | Test bits in accumulator (immediate)
	BMI $96			  ; 30 96 | Branch if negative
	ADC $8F73,Y		  ; 79 73 8F | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_14D
; Address: $E7C7EC
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_14D:
	SEI				  ; 78 | Set interrupt disable flag
	JMP $FF00			; 4C 00 FF | Jump to address
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BPL $EF			  ; 10 EF | Branch if positive
	ROR $7FFE,X		  ; 7E FE 7F | Rotate right (absolute,X)
	ASL $7CFE,X		  ; 1E FE 7C | Arithmetic shift left (absolute,X)
	LDY $FA7A,X		  ; BC 7A FA | Load from absolute,X into Y register
	CPY $6EFC			; CC FC 6E | Compare Y register (absolute)
	INC $9F61,X		  ; FE 61 9F | Increment (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	STY $7B			  ; 84 7B | Store Y register to zero page
	ORA ($EF),Y		  ; 11 EF | Logical OR with accumulator ((zero page),Y)
	EOR $BF			  ; 45 BF | Exclusive OR with accumulator (zero page)
	PHB				  ; 8B | Push data bank register to stack
	EOR #$B7			 ; 49 B7 | Exclusive OR with accumulator (immediate)
	STA				  ; 9F C1 1C 81 | Update graphics data
	ASL $81			  ; 06 81 | Arithmetic shift left (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	STA ($54,X)		  ; 81 54 | Update graphics data
	LDA				  ; BF E9 BF 00 | Read graphics status
	ROR $0889,X		  ; 7E 89 08 | Rotate right (absolute,X)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	ROR $9079,X		  ; 7E 79 90 | Rotate right (absolute,X)
	BPL $12			  ; 10 12 | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	BPL $50			  ; 10 50 | Branch if positive
	LDA				  ; BF 30 FF 61 | Read graphics status
	CLV				  ; B8 | Clear overflow flag
	BRA $00			  ; 80 00 | Branch always
	BPL $FF			  ; 10 FF | Branch if positive
	CLD				  ; D8 | Clear decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($C8),Y		  ; 11 C8 | Logical OR with accumulator ((zero page),Y)
	ORA $48FA			; 0D FA 48 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F C1 1C 81 | Update graphics data
	ASL $81			  ; 06 81 | Arithmetic shift left (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	STA ($54,X)		  ; 81 54 | Update graphics data
	LDA				  ; BF E9 BF 00 | Read graphics status
	ROR $2CBF,X		  ; 7E BF 2C | Rotate right (absolute,X)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	JMP ($0000)		  ; 6C 00 00 | Jump to address (absolute indirect)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $3309,Y		  ; 19 09 33 | Logical OR with accumulator (absolute,Y)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_14E
; Address: $E7C8B6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_14E:
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	BIT $583F			; 2C 3F 58 | Test bits in accumulator (absolute)
	BRA $00			  ; 80 00 | Branch always
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_14F
; Address: $E7C8C7
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_14F:
	RTI				  ; 40 | Return from interrupt
	BCS $20			  ; B0 20 | Branch if carry set
	CLD				  ; D8 | Clear decimal mode flag
	BPL $EC			  ; 10 EC | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPX #$D0			 ; E0 D0 | Compare X register (immediate)
	BEQ $E8			  ; F0 E8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PEA #$FAFC		   ; F4 FC FA | Push effective address to stack
	INC $3C89,X		  ; FE 89 3C | Increment (absolute,X)
	STA ($3C,X)		  ; 81 3C | Update graphics data
	LDA $383C,X		  ; BD 3C 38 | Read graphics status
	ROR $587E,X		  ; 7E 7E 58 | Rotate right (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	WDM #$FF			 ; 42 FF | Reserved instruction
	WDM #$FF			 ; 42 FF | Reserved instruction
	WDM #$FF			 ; 42 FF | Reserved instruction
	STA ($FF,X)		  ; 81 FF | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	ROR $645C			; 6E 5C 64 | Rotate right (absolute)
	JMP $714D71		  ; 5C 71 4D 71 | Jump to address long
	JMP $4C74			; 4C 74 4C | Jump to address
	JMP $7BC1			; 4C C1 7B | Jump to address
	SBC $FF83,X		  ; FD 83 FF | Subtract with carry (absolute,X)
	INC $FF83,X		  ; FE 83 FF | Increment (absolute,X)
	SBC $7E85,X		  ; FD 85 7E | Subtract with carry (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	INC $D5FE			; EE FE D5 | Increment (absolute)
	CMP $8197,X		  ; DD 97 81 | Compare accumulator (absolute,X)
	DEC $BD1E,X		  ; DE 1E BD | Decrement (absolute,X)
	LDA				  ; BF FE F3 FF | Read graphics status
	PHB				  ; 8B | Push data bank register to stack
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_150
; Address: $E7C936
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_150:
	JSL $E97EFF		  ; 22 FF 7E E9 | Jump to subroutine long
	SBC ($3F,X)		  ; E1 3F | Subtract with carry ((zero page,X))
	JMP $4DB2E3		  ; 5C E3 B2 4D | Jump to address long
	BVS $60			  ; 70 60 | Branch if overflow set
	ROR				  ; 6A | Rotate right (accumulator)
	INC $EFE9			; EE E9 EF | Increment (absolute)
	DEC $FAC8			; CE C8 FA | Decrement (absolute)
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_151
; Address: $E7C94F
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_151:
	STZ $F0FF,X		  ; 9E FF F0 | Store zero to absolute,X
	STA				  ; 9F EF 11 FF | Update graphics data
	BPL $FF			  ; 10 FF | Branch if positive
	CPX $37BF			; EC BF 37 | Compare X register (absolute)
	SBC $1FE5,Y		  ; F9 E5 1F | Subtract with carry (absolute,Y)
	STA $DD67,Y		  ; 99 67 DD | Update graphics data
	CPX $645C			; EC 5C 64 | Compare X register (absolute)
	JMP $714C73		  ; 5C 73 4C 71 | Jump to address long
	JMP $0E33			; 4C 33 0E | Jump to address
	ROL $4226,X		  ; 3E 26 42 | Hardware register operation
	DEC $7E83			; CE 83 7E | Decrement (absolute)
	INC $FEC1,X		  ; FE C1 FE | Increment (absolute,X)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	ORA #$19			 ; 09 19 | Logical OR with accumulator (immediate)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	BIT $163F			; 2C 3F 16 | Test bits in accumulator (absolute)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	PEA #$E806		   ; F4 06 E8 | Push effective address to stack
	BNE $18			  ; D0 18 | Branch if not equal
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_152
; Address: $E7C9AA
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_152:
	BRA $C0			  ; 80 C0 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PLX				  ; FA | Pull X register from stack
	INC $FCF4,X		  ; FE F4 FC | Increment (absolute,X)
	INX				  ; E8 | Increment X register
	SED				  ; F8 | Set decimal mode flag
	BNE $F0			  ; D0 F0 | Branch if not equal
	LDY #$E0			 ; A0 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ROL $112E,X		  ; 3E 2E 11 | Rotate left (absolute,X)
	INY				  ; C8 | Increment Y register
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_153
; Address: $E7C9CA
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_153:
	JSR $103F			; 20 3F 10 | Jump to subroutine
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA $3EB73F		  ; 8F 3F B7 3E | Update graphics data
	ADC $6C47,X		  ; 7D 47 6C | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_154
; Address: $E7C9F1
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_154:
	SEI				  ; 78 | Set interrupt disable flag
	DEC $79			  ; C6 79 | Decrement (zero page)
	SBC $5A			  ; E5 5A | Subtract with carry (zero page)
	SBC $F28D,X		  ; FD 8D F2 | Subtract with carry (absolute,X)
	STY $7B			  ; 84 7B | Store Y register to zero page
	INC $FF63,X		  ; FE 63 FF | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	INC $FFF1,X		  ; FE F1 FF | Increment (absolute,X)
	PHX				  ; DA | Push X register to stack
	DEC $FFFF,X		  ; DE FF FF | Decrement (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_155
; Address: $E7CA11
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_155:
	STA				  ; 9F 15 EA 40 | Update graphics data
	LDA				  ; BF 90 6F C0 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA #$23			 ; A9 23 | Read graphics status
	SBC $7E0F,X		  ; FD 0F 7E | Subtract with carry (absolute,X)
	ROR $47FF			; 6E FF 47 | Rotate right (absolute)
	ROR $FECC,X		  ; 7E CC FE | Rotate right (absolute,X)
	ORA $54F2			; 0D F2 54 | Logical OR with accumulator (absolute)
	PLB				  ; AB | Pull data bank register from stack
	BIT $42D3			; 2C D3 42 | Hardware register operation
	LDA $F30D,X		  ; BD 0D F3 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $0F			  ; F0 0F | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	NOP				  ; EA | No operation
	TYA				  ; 98 | Transfer Y register to accumulator
	TAX				  ; AA | Transfer accumulator to X register
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	DEC $FDC5,X		  ; DE C5 FD | Decrement (absolute,X)
	STA $7F			  ; 85 7F | Update graphics data
	LSR $EF13			; 4E 13 EF | Logical shift right (absolute)
	ORA ($EF),Y		  ; 11 EF | Logical OR with accumulator ((zero page),Y)
	WDM #$BF			 ; 42 BF | Reserved instruction
	STA				  ; 9F 9F 41 1C | Update graphics data
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	STA ($6A,X)		  ; 81 6A | Update graphics data
	STA ($54,X)		  ; 81 54 | Update graphics data
	LDA				  ; BF E9 BF 00 | Read graphics status
	ROR $2C2F,X		  ; 7E 2F 2C | Rotate right (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	STA ($FF,X)		  ; 81 FF | Update graphics data
	DEX				  ; CA | Decrement X register
	ORA ($82),Y		  ; 11 82 | Logical OR with accumulator ((zero page),Y)
	EOR #$82			 ; 49 82 | Exclusive OR with accumulator (immediate)
	LSR $BAB3			; 4E B3 BA | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_156
; Address: $E7CA8E
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_156:
	ADC $007D,X		  ; 7D 7D 00 | Add with carry (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	STY $48			  ; 84 48 | Store Y register to zero page
	CLD				  ; D8 | Clear decimal mode flag
	SBC $E6FF,Y		  ; F9 FF E6 | Subtract with carry (absolute,Y)
	INC $00			  ; E6 00 | Increment (zero page)
	ORA $9FFF,Y		  ; 19 FF 9F | Logical OR with accumulator (absolute,Y)
	CPY #$1D			 ; C0 1D | Compare Y register (immediate)
	BRA $06			  ; 80 06 | Branch always
	STA ($6A,X)		  ; 81 6A | Update graphics data
	STA ($54,X)		  ; 81 54 | Update graphics data
	LDA				  ; BF E9 BF 00 | Read graphics status
	ROR $2C2C,X		  ; 7E 2C 2C | Rotate right (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Update graphics data
	JMP $5C6C7C		  ; 5C 7C 6C 5C | Jump to address long
	STZ $5C			  ; 64 5C | Store zero to zero page
	SEI				  ; 78 | Set interrupt disable flag
	JMP $0D31			; 4C 31 0D | Jump to address
	AND $104D,Y		  ; 39 4D 10 | Logical AND with accumulator (absolute,Y)
	JMP ($3C45)		  ; 6C 45 3C | Jump to address (absolute indirect)
	REP #$FF			 ; C2 FF | Reset processor status bits
	INC $8185,X		  ; FE 85 81 | Increment (absolute,X)
	PHX				  ; DA | Push X register to stack
	CLD				  ; D8 | Clear decimal mode flag
	AND $3D			  ; 25 3D | Logical AND with accumulator (zero page)
	STZ $B4BD			; 9C BD B4 | Store zero to absolute
	BCS $F3			  ; B0 F3 | Branch if carry set
	BRA $80			  ; 80 80 | Branch always
	ROR $27FB,X		  ; 7E FB 27 | Rotate right (absolute,X)
	SBC $FFC2,X		  ; FD C2 FF | Subtract with carry (absolute,X)
	WDM #$FF			 ; 42 FF | Reserved instruction
	BRA $80			  ; 80 80 | Branch always
	STA $4489,Y		  ; 99 89 44 | Update graphics data
	JMP $FEB6			; 4C B6 FE | Jump to address
	SBC $A7			  ; E5 A7 | Subtract with carry (zero page)
	REP #$00			 ; C2 00 | Reset processor status bits
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	STZ $C3			  ; 64 C3 | Store zero to zero page
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	JMP ($645C)		  ; 6C 5C 64 | Jump to address (absolute indirect)
	JMP $B84C70		  ; 5C 70 4C B8 | Jump to address long
	LSR $6E1A			; 4E 1A 6E | Logical shift right (absolute)
	STA ($FF,X)		  ; 81 FF | Update graphics data
	STA ($FF,X)		  ; 81 FF | Update graphics data
	AND #$22			 ; 29 22 | Logical AND with accumulator (immediate)
	ADC $62			  ; 65 62 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_157
; Address: $E7CB65
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_157:
	ROR $EBA3			; 6E A3 EB | Rotate right (absolute)
	STZ $8A29			; 9C 29 8A | Store zero to absolute
	STA $76			  ; 85 76 | Update graphics data
	STA				  ; 9F 3F 04 7E | Update graphics data
	ORA ($FD),Y		  ; 11 FD | Logical OR with accumulator ((zero page),Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_158
; Address: $E7CB86
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_158:
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F 93 63 6F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	SEI				  ; 78 | Set interrupt disable flag
	BCS $FC			  ; B0 FC | Branch if carry set
	BRA $9F			  ; 80 9F | Branch always
	BEQ $E0			  ; F0 E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	ORA $0411			; 0D 11 04 | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0800,X		  ; 1E 00 08 | Arithmetic shift left (absolute,X)
	ADC #$1E			 ; 69 1E | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_159
; Address: $E7CBC6
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_159:
	JSR $B03F			; 20 3F B0 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BIT $0033			; 2C 33 00 | Test bits in accumulator (absolute)
	CPY #$5F			 ; C0 5F | Compare Y register (immediate)
	SBC ($51,X)		  ; E1 51 | Subtract with carry ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	PHB				  ; 8B | Push data bank register to stack
	CPY $9F00			; CC 00 9F | Compare Y register (absolute)
	LDA				  ; BF 00 1F 00 | Read graphics status
	STA $4F1370		  ; 8F 70 13 4F | Update graphics data
	BVS $28			  ; 70 28 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	BPL $1F			  ; 10 1F | Branch if positive
	ASL $000F			; 0E 0F 00 | Arithmetic shift left (absolute)
	LDA $3F80C0		  ; AF C0 80 3F | Read graphics status
	LDA $69F1,Y		  ; B9 F1 69 | Read graphics status
	SBC $9774,Y		  ; F9 74 97 | Subtract with carry (absolute,Y)
	INY				  ; C8 | Increment Y register
	LDA				  ; BF 80 FF C8 | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	BPL $FF			  ; 10 FF | Branch if positive
	LSR $8600			; 4E 00 86 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_15A
; Address: $E7CC38
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_15A:
	INX				  ; E8 | Increment X register
	PHP				  ; 08 | Push processor status to stack
	BPL $27			  ; 10 27 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BPL $3F			  ; 10 3F | Branch if positive
	INC				  ; 1A | Increment accumulator
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_15C
; Address: $E7CC5E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_15C:
	JSR $0000			; 20 00 00 | Jump to subroutine
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPX #$03			 ; E0 03 | Compare X register (immediate)
	ORA #$FE			 ; 09 FE | Logical OR with accumulator (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $87			  ; 30 87 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_15F
; Address: $E7CD48
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_15F:
	JSR $EDFF			; 20 FF ED | Jump to subroutine
	BMI $3F			  ; 30 3F | Branch if negative
	EOR $001D,X		  ; 5D 1D 00 | Exclusive OR with accumulator (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	ROR $CF81,X		  ; 7E 81 CF | Rotate right (absolute,X)
	BEQ $7F			  ; F0 7F | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $9D			  ; 80 9D | Branch always
	STA $00FF,X		  ; 9D FF 00 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $0103			; 0E 03 01 | Arithmetic shift left (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_160
; Address: $E7CDB5
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_160:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $0C09,Y		  ; 19 09 0C | Logical OR with accumulator (absolute,Y)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $0509,Y		  ; 19 09 05 | Logical OR with accumulator (absolute,Y)
	ORA $0800			; 0D 00 08 | Logical OR with accumulator (absolute)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	SBC $FD82,X		  ; FD 82 FD | Subtract with carry (absolute,X)
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	SBC $F9CA,Y		  ; F9 CA F9 | Subtract with carry (absolute,Y)
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	ORA ($F9,X)		  ; 01 F9 | Logical OR with accumulator ((zero page,X))
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 79 86 C8 | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	SBC $4806,Y		  ; F9 06 48 | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	LSR $18			  ; 46 18 | Logical shift right (zero page)
	ASL $F0			  ; 06 F0 | Arithmetic shift left (zero page)
	ASL $F7			  ; 06 F7 | Arithmetic shift left (zero page)
	BCS $76			  ; B0 76 | Branch if carry set
	BIT #$46			 ; 89 46 | Test bits in accumulator (immediate)
	LDA $F906,Y		  ; B9 06 F9 | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	ASL $0F6A			; 0E 6A 0F | Arithmetic shift left (absolute)
	ASL $0E07			; 0E 07 0E | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_161
; Address: $E7CE5E
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_161:
	BVS $1F			  ; 70 1F | Branch if overflow set
	PLY				  ; 7A | Pull Y register from stack
	STX $78			  ; 86 78 | Store X register to zero page
	SEC				  ; 38 | Set carry flag
	LSR $18			  ; 46 18 | Logical shift right (zero page)
	LSR $10			  ; 46 10 | Logical shift right (zero page)
	LSR $5F18			; 4E 18 5F | Logical shift right (absolute)
	PHP				  ; 08 | Push processor status to stack
	DEC $7201,X		  ; DE 01 72 | Decrement (absolute,X)
	STA $8778			; 8D 78 87 | Update graphics data
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	LSR $B9			  ; 46 B9 | Logical shift right (zero page)
	LSR $58B1			; 4E B1 58 | Logical shift right (absolute)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BMI $CC			  ; 30 CC | Branch if negative
	CPY $C2FC			; CC FC C2 | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROR $37C8,X		  ; 7E C8 37 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY $3C33			; CC 33 3C | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	LDA $8D5E,X		  ; BD 5E 8D | Read graphics status
	LSR $66C5			; 4E C5 66 | Logical shift right (absolute)
	AND ($64,X)		  ; 21 64 | Logical AND with accumulator ((zero page,X))
	AND ($64,X)		  ; 21 64 | Logical AND with accumulator ((zero page,X))
	BPL $54			  ; 10 54 | Branch if positive
	BPL $54			  ; 10 54 | Branch if positive
	BPL $54			  ; 10 54 | Branch if positive
	LDA ($5E,X)		  ; A1 5E | Read graphics status
	LDA ($7E),Y		  ; B1 7E | Read graphics status
	STA $5B7E,Y		  ; 99 7E 5B | Update graphics data
	ROL $3E5B,X		  ; 3E 5B 3E | Rotate left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_164
; Address: $E7CEC0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_164:
	STX $8E71			; 8E 71 8E | Store X register to absolute address
	ADC ($BE),Y		  ; 71 BE | Add with carry ((zero page),Y)
	EOR ($B8,X)		  ; 41 B8 | Exclusive OR with accumulator ((zero page,X))
	BRA $78			  ; 80 78 | Branch always
	CMP ($78,X)		  ; C1 78 | Compare accumulator ((zero page,X))
	ADC $7906,Y		  ; 79 06 79 | Add with carry (absolute,Y)
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	ADC ($8E),Y		  ; 71 8E | Add with carry ((zero page),Y)
	EOR ($BE,X)		  ; 41 BE | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_165
; Address: $E7CED7
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_165:
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 79 86 79 | Read graphics status
	STX $49			  ; 86 49 | Store X register to zero page
	ROR $3649,X		  ; 7E 49 36 | Rotate right (absolute,X)
	ADC $7906,Y		  ; 79 06 79 | Add with carry (absolute,Y)
	ASL $71			  ; 06 71 | Arithmetic shift left (zero page)
	ASL $35			  ; 06 35 | Arithmetic shift left (zero page)
	DEC $0E			  ; C6 0E | Decrement (zero page)
	BEQ $E8			  ; F0 E8 | Branch if equal
	LSR $36B1			; 4E B1 36 | Logical shift right (absolute)
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $19			  ; E6 19 | Increment (zero page)
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	AND $04			  ; 25 04 | Logical AND with accumulator (zero page)
	AND $10			  ; 25 10 | Logical AND with accumulator (zero page)
	AND ($11),Y		  ; 31 11 | Logical AND with accumulator ((zero page),Y)
	AND ($1D),Y		  ; 31 1D | Logical AND with accumulator ((zero page),Y)
	ORA $1D1D,X		  ; 1D 1D 1D | Logical OR with accumulator (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ROL $2E1F			; 2E 1F 2E | Rotate left (absolute)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_166
; Address: $E7CF27
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_166:
	JSL $0D260C		  ; 22 0C 26 0D | Jump to subroutine long
	AND $0D			  ; 25 0D | Logical AND with accumulator (zero page)
	AND $0A			  ; 25 0A | Logical AND with accumulator (zero page)
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ASL $0F1E			; 0E 1E 0F | Arithmetic shift left (absolute)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	BPL $0F			  ; 10 0F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	EOR ($1A,X)		  ; 41 1A | Exclusive OR with accumulator ((zero page,X))
	EOR ($1F,X)		  ; 41 1F | Exclusive OR with accumulator ((zero page,X))
	EOR $1F			  ; 45 1F | Exclusive OR with accumulator (zero page)
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	STA $3D			  ; 85 3D | Update graphics data
	ORA #$3D			 ; 09 3D | Logical OR with accumulator (immediate)
	ORA #$3D			 ; 09 3D | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_167
; Address: $E7CF6F
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_167:
	ORA #$7E			 ; 09 7E | Logical OR with accumulator (immediate)
	AND $7E			  ; 25 7E | Logical AND with accumulator (zero page)
	AND $7A			  ; 25 7A | Logical AND with accumulator (zero page)
	AND $7A			  ; 25 7A | Logical AND with accumulator (zero page)
	AND $FA			  ; 25 FA | Logical AND with accumulator (zero page)
	AND $F6			  ; 25 F6 | Logical AND with accumulator (zero page)
	EOR #$F6			 ; 49 F6 | Exclusive OR with accumulator (immediate)
	EOR #$F6			 ; 49 F6 | Exclusive OR with accumulator (immediate)
	EOR #$03			 ; 49 03 | Exclusive OR with accumulator (immediate)
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	ORA $0B19			; 0D 19 0B | Logical OR with accumulator (absolute)
	ORA $1F0E,X		  ; 1D 0E 1F | Logical OR with accumulator (absolute,X)
	ASL $0D1E			; 0E 1E 0D | Arithmetic shift left (absolute)
	ORA $1B0B,X		  ; 1D 0B 1B | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ROR				  ; 6A | Rotate right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	NOP				  ; EA | No operation
	TXA				  ; 8A | Transfer X register to accumulator
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	SBC $AD92			; ED 92 AD | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_169
; Address: $E7CFBD
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_169:
	JSL $0644AA		  ; 22 AA 44 06 | Jump to subroutine long
	SEP #$06			 ; E2 06 | Set processor status bits
	SEP #$2C			 ; E2 2C | Set processor status bits
	CMP $49			  ; C5 49 | Compare accumulator (zero page)
	STA				  ; 9F 94 7A AC | Update graphics data
	AND $10FE,Y		  ; 39 FE 10 | Logical AND with accumulator (absolute,Y)
	INC $FD10,X		  ; FE 10 FD | Increment (absolute,X)
	BPL $FE			  ; 10 FE | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_16A
; Address: $E7CFD7
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_16A:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	BPL $EF			  ; 10 EF | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	LSR $6C29,X		  ; 5E 29 6C | Logical shift right (absolute,X)
	BCC $D4			  ; 90 D4 | Branch if carry clear
	BCC $D4			  ; 90 D4 | Branch if carry clear
	CPX $50			  ; E4 50 | Compare X register (zero page)
	BEQ $7D			  ; F0 7D | Branch if equal
	SBC $BF3B,X		  ; FD 3B BF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_16B
; Address: $E7CFF0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_16B:
	LDA ($7E,X)		  ; A1 7E | Read graphics status
	ROL $3FEB,X		  ; 3E EB 3F | Rotate left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_16C
; Address: $E7CFFE
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_16C:
	LDY $1E43,X		  ; BC 43 1E | Load from absolute,X into Y register
	EOR $12			  ; 45 12 | Exclusive OR with accumulator (zero page)
	WDM #$13			 ; 42 13 | Reserved instruction
	AND $85			  ; 25 85 | Logical AND with accumulator (zero page)
	AND $85			  ; 25 85 | Logical AND with accumulator (zero page)
	PHB				  ; 8B | Push data bank register to stack
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BPL $7A			  ; 10 7A | Branch if positive
	AND ($7D,X)		  ; 21 7D | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_16D
; Address: $E7D017
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_16D:
	JSL $FA227C		  ; 22 7C 22 FA | Jump to subroutine long
	LSR $FA			  ; 46 FA | Logical shift right (zero page)
	PEA #$A14C		   ; F4 4C A1 | Push effective address to stack
	LDA ($B4,X)		  ; A1 B4 | Read graphics status
	WDM #$78			 ; 42 78 | Reserved instruction
	INX				  ; E8 | Increment X register
	ORA $F1			  ; 05 F1 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	STY $4AF4			; 8C F4 4A | Store Y register to absolute address
	STY $4B			  ; 84 4B | Store Y register to zero page
	STY $87			  ; 84 87 | Store Y register to zero page
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	ASL $0C13			; 0E 13 0C | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	CPY $CCB3			; CC B3 CC | Compare Y register (absolute)
	ADC $B172			; 6D 72 B1 | Add with carry (absolute)
	INC $EF9C,X		  ; FE 9C EF | Increment (absolute,X)
	ASL $79			  ; 06 79 | Arithmetic shift left (zero page)
	DEC $F9			  ; C6 F9 | Decrement (zero page)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BMI $30			  ; 30 30 | Branch if negative
	BCC $1E			  ; 90 1E | Branch if carry clear
	ROL $D9			  ; 26 D9 | Rotate left (zero page)
	ORA $3CF2,Y		  ; 19 F2 3C | Logical OR with accumulator (absolute,Y)
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	CLV				  ; B8 | Clear overflow flag
	SBC $E600,Y		  ; F9 00 E6 | Subtract with carry (absolute,Y)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	BIT $27			  ; 24 27 | Test bits in accumulator (zero page)
	CPY $07			  ; C4 07 | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_16E
; Address: $E7D08C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_16E:
	JSR $03C3			; 20 C3 03 | Jump to subroutine
	STA ($00,X)		  ; 81 00 | Update graphics data
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF FF 60 9F | Read graphics status
	CPX #$40			 ; E0 40 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_16F
; Address: $E7D0A7
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_16F:
	CPY #$50			 ; C0 50 | Compare Y register (immediate)
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	BRA $C7			  ; 80 C7 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF 00 BF 00 | Read graphics status
	LDY $FF00,X		  ; BC 00 FF | Load from absolute,X into Y register
	PHB				  ; 8B | Push data bank register to stack
	AND ($81),Y		  ; 31 81 | Logical AND with accumulator ((zero page),Y)
	BRA $BE			  ; 80 BE | Branch always
	BCC $AF			  ; 90 AF | Branch if carry clear
	BRA $AF			  ; 80 AF | Branch always
	BRA $C7			  ; 80 C7 | Branch always
	DEY				  ; 88 | Decrement Y register
	EOR #$46			 ; 49 46 | Exclusive OR with accumulator (immediate)
	PEA #$FE48		   ; F4 48 FE | Push effective address to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BVC $FF			  ; 50 FF | Branch if overflow clear
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $7F			  ; 10 7F | Branch if positive
	BPL $AC			  ; 10 AC | Branch if positive
	PEA #$D088		   ; F4 88 D0 | Push effective address to stack
	INY				  ; C8 | Increment Y register
	BNE $DB			  ; D0 DB | Branch if not equal
	INY				  ; C8 | Increment Y register
	STY $70			  ; 84 70 | Store Y register to zero page
	PHP				  ; 08 | Push processor status to stack
	BIT $2C47			; 2C 47 2C | Test bits in accumulator (absolute)
	STY $7F			  ; 84 7F | Store Y register to zero page
	STY $7F			  ; 84 7F | Store Y register to zero page
	STY $7B			  ; 84 7B | Store Y register to zero page
	BRA $FF			  ; 80 FF | Branch always
	BRA $B3			  ; 80 B3 | Branch always
	LDA				  ; BF F1 B0 FF | Read graphics status
	BRA $FF			  ; 80 FF | Branch always
	LDA				  ; BF CF B3 CF | Read graphics status
	LSR $79			  ; 46 79 | Logical shift right (zero page)
	ROR $79			  ; 66 79 | Rotate right (zero page)
	BRA $7F			  ; 80 7F | Branch always
	BRA $32			  ; 80 32 | Branch always
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	CPX #$F1			 ; E0 F1 | Compare X register (immediate)
	ROL $3EC1,X		  ; 3E C1 3E | Rotate left (absolute,X)
	DEC $CEF0			; CE F0 CE | Decrement (absolute)
	BEQ $F8			  ; F0 F8 | Branch if equal
	SEC				  ; 38 | Set carry flag
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_170
; Address: $E7D144
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_170:
	STZ $821C,X		  ; 9E 1C 82 | Store zero to absolute,X
	BRA $00			  ; 80 00 | Branch always
	STA $FF88FF		  ; 8F FF 88 FF | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_172
; Address: $E7D187
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_172:
	AND $5E29,Y		  ; 39 29 5E | Logical AND with accumulator (absolute,Y)
	LSR $CA			  ; 46 CA | Logical shift right (zero page)
	LDA #$D8			 ; A9 D8 | Read graphics status
	STZ $087F			; 9C 7F 08 | Store zero to absolute
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_173
; Address: $E7D1A7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_173:
	LDA				  ; BF 83 1F C3 | Read graphics status
	LDY $D8C3			; AC C3 D8 | Load from absolute address into Y register
	SEC				  ; 38 | Set carry flag
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_174
; Address: $E7D1BB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_174:
	JSR $10FF			; 20 FF 10 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	ORA ($F7,X)		  ; 01 F7 | Logical OR with accumulator ((zero page,X))
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BEQ $0F			  ; F0 0F | Branch if equal
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_175
; Address: $E7D1E4
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_175:
	STY $7C			  ; 84 7C | Store Y register to zero page
	CPX #$E0			 ; E0 E0 | Game work RAM access
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	BRA $7F			  ; 80 7F | Branch always
	CLC				  ; 18 | Clear carry flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	AND ($7E),Y		  ; 31 7E | Logical AND with accumulator ((zero page),Y)
	STY $B1FF			; 8C FF B1 | Store Y register to absolute address
	CMP $CDB1			; CD B1 CD | Compare accumulator (absolute)
	CPY $F1F2			; CC F2 F1 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_176
; Address: $E7D20B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_176:
	LDX $CCAF,Y		  ; BE AF CC | Load from absolute,Y into X register
	STA				  ; 9F EC 7F 80 | Update graphics data
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	CPY #$06			 ; C0 06 | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	DEC $C030,X		  ; DE 30 C0 | Decrement (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_177
; Address: $E7D22B
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_177:
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	ROL $00F9,X		  ; 3E F9 00 | Rotate left (absolute,X)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	STA				  ; 9F 00 9E 00 | Update graphics data
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	STA				  ; 9F 01 E1 E4 | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $0300,X		  ; 1E 00 03 | Arithmetic shift left (absolute,X)
	STA $C0BFF0		  ; 8F F0 BF C0 | Update graphics data
	LDA				  ; BF C0 8F F0 | Read graphics status
	BEQ $FF			  ; F0 FF | Branch if equal
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	STA $00000F		  ; 8F 0F 00 00 | Update graphics data
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BIT $994D			; 2C 4D 99 | Test bits in accumulator (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	DEC				  ; 3A | Decrement accumulator
	ASL $67			  ; 06 67 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_178
; Address: $E7D2AB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_178:
	JSR $00E2			; 20 E2 00 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_179
; Address: $E7D2C1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_179:
	BRA $20			  ; 80 20 | Branch always
	BMI $C0			  ; 30 C0 | Branch if negative
	DEC $1116			; CE 16 11 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_17A
; Address: $E7D2C8
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_17A:
	CMP ($40),Y		  ; D1 40 | Compare accumulator ((zero page),Y)
	AND $B65F,Y		  ; 39 5F B6 | Logical AND with accumulator (absolute,Y)
	BMI $72			  ; 30 72 | Branch if negative
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	ROL $EF00,X		  ; 3E 00 EF | Rotate left (absolute,X)
	LDA				  ; BF 00 E0 00 | Read graphics status
	STZ $0000			; 9C 00 00 | Store zero to absolute
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_17B
; Address: $E7D31C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_17B:
	STA ($00,X)		  ; 81 00 | Update graphics data
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_17C
; Address: $E7D323
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_17C:
	PHA				  ; 48 | Push accumulator to stack
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	CLV				  ; B8 | Clear overflow flag
	BPL $E0			  ; 10 E0 | Game work RAM access
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	STZ $70			  ; 64 70 | Store zero to zero page
	STY $50			  ; 84 50 | Store Y register to zero page
	BEQ $00			  ; F0 00 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	INX				  ; E8 | Increment X register
	SEI				  ; 78 | Set interrupt disable flag
	LDX $0000			; AE 00 00 | Load from absolute address into X register
	ORA ($A0,X)		  ; 01 A0 | Logical OR with accumulator ((zero page,X))
	SBC ($18,X)		  ; E1 18 | Subtract with carry ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	BCC $00			  ; 90 00 | Branch if carry clear
	STA $00F30C		  ; 8F 0C F3 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF FF FE FF | Read graphics status
	LDA				  ; BF FF FD BF | Read graphics status
	INC $DBBC,X		  ; FE BC DB | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_17D
; Address: $E7D394
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_17D:
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	INC $8300,X		  ; FE 00 83 | Increment (absolute,X)
	STY $80F3			; 8C F3 80 | Store Y register to absolute address
	CPY #$8C			 ; C0 8C | Compare Y register (immediate)
	CPX $FCF0			; EC F0 FC | Compare X register (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $00			  ; B0 00 | Branch if carry set
	ROR $787E,X		  ; 7E 7E 78 | Rotate right (absolute,X)
	ROR $1E9F,X		  ; 7E 9F 1E | Rotate right (absolute,X)
	ASL $FF51,X		  ; 1E 51 FF | Arithmetic shift left (absolute,X)
	BPL $BE			  ; 10 BE | Branch if positive
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BNE $00			  ; D0 00 | Branch if not equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $FE			  ; F0 FE | Branch if equal
	BEQ $CD			  ; F0 CD | Branch if equal
	STA $0003BF		  ; 8F BF 03 00 | Update graphics data
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BPL $5E			  ; 10 5E | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $7706			; 0E 06 77 | Arithmetic shift left (absolute)
	BRA $80			  ; 80 80 | Branch always
	PEA #$E7F3		   ; F4 F3 E7 | Push effective address to stack
	LDA				  ; BF 0E 00 79 | Read graphics status
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $3F			  ; 30 3F | Branch if negative
	STZ $D1FE,X		  ; 9E FE D1 | Store zero to absolute,X
	BVS $EF			  ; 70 EF | Branch if overflow set
	BVS $EF			  ; 70 EF | Branch if overflow set
	BVS $EF			  ; 70 EF | Branch if overflow set

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_17E
; Address: $E7D46E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_17E:
	JSR $3FBF			; 20 BF 3F | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_180
; Address: $E7D4A3
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_180:
	JSR $4714			; 20 14 47 | Jump to subroutine
	BIT $104C			; 2C 4C 10 | Test bits in accumulator (absolute)
	BIT $C317			; 2C 17 C3 | Test bits in accumulator (absolute)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BPL $A0			  ; 10 A0 | Branch if positive
	DEY				  ; 88 | Decrement Y register
	BMI $08			  ; 30 08 | Branch if negative
	CMP #$2E			 ; C9 2E | Compare accumulator (immediate)
	LDA ($0C,X)		  ; A1 0C | Read graphics status
	SBC $9094,X		  ; FD 94 90 | Subtract with carry (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FB00,Y		  ; F9 00 FB | Subtract with carry (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_181
; Address: $E7D4E0
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_181:
	CLI				  ; 58 | Clear interrupt disable flag
	CMP $69E8,Y		  ; D9 E8 69 | Compare accumulator (absolute,Y)
	BCS $21			  ; B0 21 | PPU graphics register access
	BPL $D1			  ; 10 D1 | Branch if positive
	LDY $02			  ; A4 02 | Load from zero page into Y register
	BVC $4E			  ; 50 4E | Branch if overflow clear
	INC $BE00,X		  ; FE 00 BE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	SED				  ; F8 | Set decimal mode flag
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	BRA $82			  ; 80 82 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BRA $7F			  ; 80 7F | Branch always
	ADC $1FE0,X		  ; 7D E0 1F | Add with carry (absolute,X)
	STY $7F00			; 8C 00 7F | Store Y register to absolute address
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	LDA $E8EFDF		  ; AF DF EF E8 | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_182
; Address: $E7D549
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_182:
	BVS $35			  ; 70 35 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	JMP $00F8			; 4C F8 00 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	ROR $7780,X		  ; 7E 80 77 | Rotate right (absolute,X)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BRA $7F			  ; 80 7F | Branch always
	BRA $10			  ; 80 10 | Branch always
	ASL $3F36,X		  ; 1E 36 3F | Arithmetic shift left (absolute,X)
	CPY $51FF			; CC FF 51 | Compare Y register (absolute)
	STA ($FD,X)		  ; 81 FD | Update graphics data

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_183
; Address: $E7D56A
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_183:
	STX $BB7E			; 8E 7E BB | Store X register to absolute address
	LDA $E373,X		  ; BD 73 E3 | Read graphics status
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ROL $F900,X		  ; 3E 00 F9 | Rotate left (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	STA ($7F,X)		  ; 81 7F | Update graphics data
	BCS $6F			  ; B0 6F | Branch if carry set
	BVS $D3			  ; 70 D3 | Branch if overflow set
	DEC $4744,X		  ; DE 44 47 | Decrement (absolute,X)
	STX $808F			; 8E 8F 80 | Store X register to absolute address
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	STA $002100		  ; 8F 00 21 00 | Update graphics data
	CLV				  ; B8 | Clear overflow flag
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$C3			 ; E0 C3 | Compare X register (immediate)
	BVS $C3			  ; 70 C3 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	DEC $38			  ; C6 38 | Decrement (zero page)
	BMI $CF			  ; 30 CF | Branch if negative
	ASL $3CFE			; 0E FE 3C | Arithmetic shift left (absolute)
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_185
; Address: $E7D5CC
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_185:
	SEP #$E3			 ; E2 E3 | Set processor status bits
	LDA $07FE,X		  ; BD FE 07 | Read graphics status
	CLI				  ; 58 | Clear interrupt disable flag
	STZ $8100			; 9C 00 81 | Store zero to absolute
	CMP $A9F5,Y		  ; D9 F5 A9 | Compare accumulator (absolute,Y)
	CMP $BC70,X		  ; DD 70 BC | Compare accumulator (absolute,X)
	LDA				  ; BF C9 BC 97 | Read graphics status
	STA				  ; 9F F7 83 00 | Update graphics data
	ORA $3D02			; 0D 02 3D | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF C3 BF D1 | Read graphics status
	LDA				  ; BF BA D8 FF | Read graphics status
	ADC $39AF,Y		  ; 79 AF 39 | Add with carry (absolute,Y)
	DEC $07			  ; C6 07 | Decrement (zero page)
	DEC $FF3E,X		  ; DE 3E FF | Decrement (absolute,X)
	INC $E700,X		  ; FE 00 E7 | Increment (absolute,X)
	STX $00			  ; 86 00 | Store X register to zero page
	DEC $00			  ; C6 00 | Decrement (zero page)
	SED				  ; F8 | Set decimal mode flag
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_186
; Address: $E7D620
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_186:
	JSR $63BF			; 20 BF 63 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	LDY $E4			  ; A4 E4 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_187
; Address: $E7D62D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_187:
	BEQ $13			  ; F0 13 | Branch if equal
	LDA				  ; BF 40 FC 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	INC				  ; 1A | Increment accumulator
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	BVC $1E			  ; 50 1E | Branch if overflow clear
	BVC $0E			  ; 50 0E | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_188
; Address: $E7D64B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_188:
	JSR $4630			; 20 30 46 | Jump to subroutine
	ROL $1D61			; 2E 61 1D | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $20			  ; 64 20 | Store zero to zero page
	JMP $C03B30		  ; 5C 30 3B C0 | Jump to address long
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_189
; Address: $E7D676
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_189:
	LDA				  ; BF 00 C7 00 | Read graphics status
	STA				  ; 9F 00 6B 60 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	EOR ($1A),Y		  ; 51 1A | Exclusive OR with accumulator ((zero page),Y)
	ORA ($59),Y		  ; 11 59 | Logical OR with accumulator ((zero page),Y)
	LDY $9F13,X		  ; BC 13 9F | Load from absolute,X into Y register
	LDA $00EF00		  ; AF 00 EF 00 | Read graphics status
	LDA $00EF00		  ; AF 00 EF 00 | Read graphics status
	SEC				  ; 38 | Set carry flag
	BVS $88			  ; 70 88 | Branch if overflow set
	BRA $70			  ; 80 70 | Branch always
	RTI				  ; 40 | Return from interrupt
	LDY #$C0			 ; A0 C0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_18A
; Address: $E7D6A9
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_18A:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $FC			  ; 80 FC | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ORA $E619,Y		  ; 19 19 E6 | Logical OR with accumulator (absolute,Y)
	INC $8F			  ; E6 8F | Increment (zero page)
	STA $1C7171		  ; 8F 71 71 1C | Update graphics data
	INC $FF			  ; E6 FF | Increment (zero page)
	ORA $70FF,Y		  ; 19 FF 70 | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_18C
; Address: $E7D6E0
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_18C:
	JSL $9625AD		  ; 22 AD 25 96 | Jump to subroutine long
	ADC #$32			 ; 69 32 | Add with carry (immediate)
	SBC ($5E,X)		  ; E1 5E | Subtract with carry ((zero page,X))
	STA $4225,Y		  ; 99 25 42 | Hardware register operation
	INC				  ; 1A | Increment accumulator
	BIT $06			  ; 24 06 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F 00 E7 00 | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $87			  ; 80 87 | Branch always
	LSR $FF81			; 4E 81 FF | Logical shift right (absolute)
	STA ($7C,X)		  ; 81 7C | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ROR $BB00,X		  ; 7E 00 BB | Rotate right (absolute,X)
	LDX #$65			 ; A2 65 | Load immediate value into X register
	ROR				  ; 6A | Rotate right (accumulator)
	AND $5E			  ; 25 5E | Logical AND with accumulator (zero page)
	CMP ($99,X)		  ; C1 99 | Compare accumulator ((zero page,X))
	BRA $39			  ; 80 39 | Branch always
	BMI $72			  ; 30 72 | Branch if negative
	INC $DF00			; EE 00 DF | Increment (absolute)
	LDA				  ; BF 00 7F 00 | Read graphics status
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STZ $0000			; 9C 00 00 | Store zero to absolute
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_18D
; Address: $E7D74E
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_18D:
	RTI				  ; 40 | Return from interrupt
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BMI $00			  ; 30 00 | Branch if negative
	ADC $FF7D,X		  ; 7D 7D FF | Add with carry (absolute,X)
	SBC $FFF9,Y		  ; F9 F9 FF | Subtract with carry (absolute,Y)
	BMI $FF			  ; 30 FF | Branch if negative
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA $1507			; 0D 07 15 | Logical OR with accumulator (absolute)
	ASL $17			  ; 06 17 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	ORA $1800,Y		  ; 19 00 18 | Logical OR with accumulator (absolute,Y)
	INC $FE60			; EE 60 FE | Increment (absolute)
	CMP $63FD			; CD FD 63 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_18E
; Address: $E7D7A8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_18E:
	ASL $9C8E			; 0E 8E 9C | Arithmetic shift left (absolute)
	SBC $E7E8,X		  ; FD E8 E7 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 00 7C 00 | Update graphics data
	STZ $7100			; 9C 00 71 | Store zero to absolute
	ROR $C7			  ; 66 C7 | Rotate right (zero page)
	AND $234C			; 2D 4C 23 | Logical AND with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CPX #$27			 ; E0 27 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_18F
; Address: $E7D7CF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_18F:
	JSR $0038			; 20 38 00 | Jump to subroutine
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_190
; Address: $E7D7E1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_190:
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $C0			  ; 10 C0 | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_191
; Address: $E7D7E7
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_191:
	JSR $20C0			; 20 C0 20 | Jump to subroutine
	BRA $40			  ; 80 40 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $10			  ; 80 10 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF F1 B0 FF | Read graphics status
	BRA $FF			  ; 80 FF | Branch always
	LDA				  ; BF CF B3 CF | Read graphics status
	DEC $F9			  ; C6 F9 | Decrement (zero page)
	INC $F9			  ; E6 F9 | Increment (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $1E82			; 8C 82 1E | Store Y register to absolute address
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($7C,X)		  ; 01 7C | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ADC ($34),Y		  ; 71 34 | Add with carry ((zero page),Y)
	BEQ $BC			  ; F0 BC | Branch if equal
	INC $7E00,X		  ; FE 00 7E | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	DEC $4C00			; CE 00 4C | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_192
; Address: $E7D861
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_192:
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	AND ($06,X)		  ; 21 06 | Logical AND with accumulator ((zero page,X))
	ASL $0502,X		  ; 1E 02 05 | Arithmetic shift left (absolute,X)
	ROL $1900,X		  ; 3E 00 19 | Rotate left (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	LDA				  ; BF C3 CF CF | Read graphics status
	SBC #$B8			 ; E9 B8 | Subtract with carry (immediate)
	BCS $D7			  ; B0 D7 | Branch if carry set
	BEQ $7F			  ; F0 7F | Branch if equal
	BRA $7F			  ; 80 7F | Branch always
	BRA $BC			  ; 80 BC | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY $DF30			; CC 30 DF | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_193
; Address: $E7D8B9
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_193:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	LDA				  ; BF 47 FF 08 | Read graphics status
	BMI $21			  ; 30 21 | PPU graphics register access
	BMI $20			  ; 30 20 | Branch if negative
	BMI $33			  ; 30 33 | Branch if negative
	BPL $13			  ; 10 13 | Branch if positive
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	JMP $4C33			; 4C 33 4C | Jump to address
	JMP $0C33			; 4C 33 0C | Jump to address
	BIT $1C03			; 2C 03 1C | Test bits in accumulator (absolute)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF A8 58 E8 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	BNE $F3			  ; D0 F3 | Branch if not equal
	CPX $EECF			; EC CF EE | Compare X register (absolute)
	LDA ($9E,X)		  ; A1 9E | Read graphics status
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPY $F000			; CC 00 F0 | Compare Y register (absolute)
	SBC $BF00,Y		  ; F9 00 BF | Subtract with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BPL $0F			  ; 10 0F | Branch if positive
	BNE $E8			  ; D0 E8 | Branch if not equal
	LDA $0FDF			; AD DF 0F | Read graphics status
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	STA				  ; 9F 00 3F C0 | Update graphics data
	CPY $47CF			; CC CF 47 | Compare Y register (absolute)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_194
; Address: $E7D93C
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_194:
	BMI $00			  ; 30 00 | Branch if negative
	SEC				  ; 38 | Set carry flag
	CPX #$83			 ; E0 83 | Compare X register (immediate)
	CPX #$3C			 ; E0 3C | Compare X register (immediate)
	BVC $78			  ; 50 78 | Branch if overflow clear
	BIT $AA			  ; 24 AA | Test bits in accumulator (zero page)
	BCS $6B			  ; B0 6B | Branch if carry set
	BMI $91			  ; 30 91 | Branch if negative
	PLX				  ; FA | Pull X register from stack
	CMP ($BE),Y		  ; D1 BE | Compare accumulator ((zero page),Y)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	BPL $7F			  ; 10 7F | Branch if positive
	LDA				  ; BF 44 7F 84 | Read graphics status
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	LDY $EE			  ; A4 EE | Load from zero page into Y register
	INC $7999			; EE 99 79 | Increment (absolute)
	STA $0FCB0F		  ; 8F 0F CB 0F | Update graphics data
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	JMP $FE1FF1		  ; 5C F1 1F FE | Jump to address long
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_195
; Address: $E7D98B
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_195:
	ROR $9616,X		  ; 7E 16 96 | Rotate right (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $9F			  ; 80 9F | Branch always
	BEQ $81			  ; F0 81 | Branch if equal
	ROR $7FE9,X		  ; 7E E9 7F | Rotate right (absolute,X)
	ORA $3030			; 0D 30 30 | Logical OR with accumulator (absolute)
	BMI $30			  ; 30 30 | Branch if negative
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX $C0E0			; EC E0 C0 | Compare X register (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA ($9E,X)		  ; A1 9E | Read graphics status
	AND ($3E,X)		  ; 21 3E | Logical AND with accumulator ((zero page,X))
	ORA $071E,Y		  ; 19 1E 07 | Logical OR with accumulator (absolute,Y)
	LDA				  ; BF 40 3F 00 | Read graphics status
	DEC $F8			  ; C6 F8 | Decrement (zero page)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $CF			  ; F0 CF | Branch if equal
	BCS $8F			  ; B0 8F | Branch if carry set
	BMI $0C			  ; 30 0C | Branch if negative
	LDA				  ; BF 40 3F 00 | Read graphics status
	AND $3D			  ; 25 3D | Logical AND with accumulator (zero page)
	BRA $7F			  ; 80 7F | Branch always
	STY $D873			; 8C 73 D8 | Store Y register to absolute address
	CLC				  ; 18 | Clear carry flag
	REP #$00			 ; C2 00 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_196
; Address: $E7DA40
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_196:
	NOP				  ; EA | No operation
	ADC $7C3D,X		  ; 7D 3D 7C | Add with carry (absolute,X)
	STZ $BE			  ; 64 BE | Store zero to zero page
	EOR ($53,X)		  ; 41 53 | Exclusive OR with accumulator ((zero page,X))
	LDX $7F41,Y		  ; BE 41 7F | Load from absolute,Y into X register
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $3F			  ; 80 3F | Branch always
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BCS $36			  ; B0 36 | Branch if carry set
	BNE $C7			  ; D0 C7 | Branch if not equal
	INY				  ; C8 | Increment Y register
	AND ($22,X)		  ; 21 22 | Logical AND with accumulator ((zero page,X))
	BMI $33			  ; 30 33 | Branch if negative
	BMI $C9			  ; 30 C9 | Branch if negative
	BMI $EF			  ; 30 EF | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $3F			  ; 30 3F | Branch if negative
	CPY $00FF			; CC FF 00 | Compare Y register (absolute)
	AND $C43D,X		  ; 3D 3D C4 | Logical AND with accumulator (absolute,X)
	CPY $07			  ; C4 07 | Compare Y register (zero page)
	AND $37CF,X		  ; 3D CF 37 | Logical AND with accumulator (absolute,X)
	REP #$07			 ; C2 07 | Reset processor status bits
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $E0			  ; 80 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	STY $C00F			; 8C 0F C0 | Store Y register to absolute address
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC $3FFF,X		  ; FD FF 3F | Subtract with carry (absolute,X)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($84,X)		  ; 01 84 | Logical OR with accumulator ((zero page,X))
	BCC $01			  ; 90 01 | Branch if carry clear
	BIT $01			  ; 24 01 | Test bits in accumulator (zero page)
	BPL $01			  ; 10 01 | Branch if positive
	ORA ($B8,X)		  ; 01 B8 | Logical OR with accumulator ((zero page,X))
	ORA ($5A,X)		  ; 01 5A | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	JMP ($DAFF)		  ; 6C FF DA | Jump to address (absolute indirect)
	INC $E2FF			; EE FF E2 | Increment (absolute)
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	INX				  ; E8 | Increment X register
	LDY $FF			  ; A4 FF | Load from zero page into Y register
	BMI $30			  ; 30 30 | Branch if negative
	BCC $84			  ; 90 84 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_197
; Address: $E7DAE4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_197:
	RTI				  ; 40 | Return from interrupt
	ADC ($00,X)		  ; 61 00 | Add with carry ((zero page,X))
	STX $A0			  ; 86 A0 | Store X register to zero page
	LDA $000900		  ; AF 00 09 00 | Read graphics status
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_198
; Address: $E7DAF4
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_198:
	STZ $79FF,X		  ; 9E FF 79 | Store zero to absolute,X
	BVC $FF			  ; 50 FF | Branch if overflow clear
	TSX				  ; BA | Transfer stack pointer to X register
	STA ($00,X)		  ; 81 00 | Update graphics data
	INC $6C00,X		  ; FE 00 6C | Increment (absolute,X)
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	BIT $1704			; 2C 04 17 | Test bits in accumulator (absolute)
	ROR $F3FF,X		  ; 7E FF F3 | Rotate right (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	BRA $03			  ; 80 03 | Branch always
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	BRA $17			  ; 80 17 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	ORA $7C12			; 0D 12 7C | Logical OR with accumulator (absolute)
	BEQ $FF			  ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_199
; Address: $E7DB36
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_199:
	JSR $B0FF			; 20 FF B0 | Jump to subroutine
	BVS $FF			  ; 70 FF | Branch if overflow set
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($05,X)		  ; 01 05 | Logical OR with accumulator ((zero page,X))
	NOP				  ; EA | No operation
	BIT $C647			; 2C 47 C6 | Test bits in accumulator (absolute)
	SBC #$29			 ; E9 29 | Subtract with carry (immediate)
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	BEQ $58			  ; F0 58 | Branch if equal
	BNE $00			  ; D0 00 | Branch if not equal
	AND $1400,Y		  ; 39 00 14 | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_19A
; Address: $E7DB7E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_19A:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($93,X)		  ; 01 93 | Logical OR with accumulator ((zero page,X))
	ORA ($39,X)		  ; 01 39 | Logical OR with accumulator ((zero page,X))
	BPL $29			  ; 10 29 | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_19B
; Address: $E7DB8F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_19B:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BCC $00			  ; 90 00 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_19C
; Address: $E7DB9A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_19C:
	PLP				  ; 28 | Pull processor status from stack
	BMI $00			  ; 30 00 | Branch if negative
	EOR $E900,Y		  ; 59 00 E9 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_19D
; Address: $E7DBA1
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_19D:
	JSR $E92E			; 20 2E E9 | Jump to subroutine
	CPY $C2FC			; CC FC C2 | Compare Y register (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ASL $8A			  ; 06 8A | Arithmetic shift left (zero page)
	EOR $BEE3,X		  ; 5D E3 BE | Exclusive OR with accumulator (absolute,X)
	ADC ($D9,X)		  ; 61 D9 | Add with carry ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	SBC $0900,Y		  ; F9 00 09 | Subtract with carry (absolute,Y)
	STZ $0000,X		  ; 9E 00 00 | Store zero to absolute,X
	BIT $01			  ; 24 01 | Test bits in accumulator (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ORA ($60,X)		  ; 01 60 | Logical OR with accumulator ((zero page,X))
	ORA $12			  ; 05 12 | Logical OR with accumulator (zero page)
	BCC $01			  ; 90 01 | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	AND $FFDB,Y		  ; 39 DB FF | Logical AND with accumulator (absolute,Y)
	STZ $E8FF,X		  ; 9E FF E8 | Store zero to absolute,X
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_19E
; Address: $E7DBDA
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_19E:
	DEC $FF			  ; C6 FF | Decrement (zero page)
	PHB				  ; 8B | Push data bank register to stack
	REP #$FF			 ; C2 FF | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	JMP $9301			; 4C 01 93 | Jump to address
	ORA $27			  ; 05 27 | Logical OR with accumulator (zero page)
	ORA #$59			 ; 09 59 | Logical OR with accumulator (immediate)
	ORA $C369			; 0D 69 C3 | Logical OR with accumulator (absolute)
	STA $97FF,X		  ; 9D FF 97 | Update graphics data
	JMP ($D8FF)		  ; 6C FF D8 | Jump to address (absolute indirect)
	LDX $FF			  ; A6 FF | Load from zero page into X register
	AND #$6D			 ; 29 6D | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	SBC $D6C7,Y		  ; F9 C7 D6 | Subtract with carry (absolute,Y)
	STX $09			  ; 86 09 | Store X register to zero page
	STY $A284			; 8C 84 A2 | Store Y register to absolute address
	STZ $53			  ; 64 53 | Store zero to zero page
	PHY				  ; 5A | Push Y register to stack
	PLP				  ; 28 | Pull processor status from stack
	BVS $FF			  ; 70 FF | Branch if overflow set
	EOR $8AFF,Y		  ; 59 FF 8A | Exclusive OR with accumulator (absolute,Y)
	LDY $FF			  ; A4 FF | Load from zero page into Y register
	SBC $0E			  ; E5 0E | Subtract with carry (zero page)
	BIT $2F			  ; 24 2F | Test bits in accumulator (zero page)
	LDY $2C2D,X		  ; BC 2D 2C | Load from absolute,X into Y register
	SEI				  ; 78 | Set interrupt disable flag
	BRA $4B			  ; 80 4B | Branch always
	BRA $18			  ; 80 18 | Branch always
	CMP ($FF),Y		  ; D1 FF | Compare accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_19F
; Address: $E7DC34
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_19F:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1A0
; Address: $E7DC3C
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1A0:
	JSR $34FF			; 20 FF 34 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	CMP $FC			  ; C5 FC | Compare accumulator (zero page)
	REP #$3D			 ; C2 3D | Reset processor status bits
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	ADC $0786,Y		  ; 79 86 07 | Add with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $17			  ; 06 17 | Arithmetic shift left (zero page)
	ASL $0719			; 0E 19 07 | Arithmetic shift left (absolute)
	ASL $0E12			; 0E 12 0E | Arithmetic shift left (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	BEQ $BC			  ; F0 BC | Branch if equal
	LDY #$7A			 ; A0 7A | Load immediate value into Y register
	SBC $E682,X		  ; FD 82 E6 | Subtract with carry (absolute,X)
	ORA $B946,Y		  ; 19 46 B9 | Logical OR with accumulator (absolute,Y)
	JMP $00BF83		  ; 5C 83 BF 00 | Jump to address long
	CLI				  ; 58 | Clear interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	INC $00			  ; E6 00 | Increment (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	RTI				  ; 40 | Return from interrupt
	JMP ($7933)		  ; 6C 33 79 | Jump to address (absolute indirect)
	AND $D2			  ; 25 D2 | Logical AND with accumulator (zero page)
	ROR $FE43			; 6E 43 FE | Rotate right (absolute)
	LDX $DB5D,Y		  ; BE 5D DB | Load from absolute,Y into X register
	ASL $38D6			; 0E D6 38 | Arithmetic shift left (absolute)
	JMP $1A00			; 4C 00 1A | Jump to address
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	DEC $01			  ; C6 01 | Decrement (zero page)
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1A1
; Address: $E7DCC3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1A1:
	LDY $E79C			; AC 9C E7 | Load from absolute address into Y register
	SEC				  ; 38 | Set carry flag
	CMP #$41			 ; C9 41 | Compare accumulator (immediate)
	BRA $0F			  ; 80 0F | Branch always
	CLC				  ; 18 | Clear carry flag
	DEY				  ; 88 | Decrement Y register
	EOR ($3E,X)		  ; 41 3E | Exclusive OR with accumulator ((zero page,X))
	BEQ $08			  ; F0 08 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1A2
; Address: $E7DCE4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1A2:
	JSR $2830			; 20 30 28 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	BVC $68			  ; 50 68 | Branch if overflow clear
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1A3
; Address: $E7DCEE
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1A3:
	JSR $0830			; 20 30 08 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	BMI $30			  ; 30 30 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	BMI $30			  ; 30 30 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1A4
; Address: $E7DD10
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1A4:
	BPL $10			  ; 10 10 | Branch if positive
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1A6
; Address: $E7DD20
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1A6:
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	BIT $441B			; 2C 1B 44 | Test bits in accumulator (absolute)
	AND $0405,Y		  ; 39 05 04 | Logical AND with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1A7
; Address: $E7DD3A
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1A7:
	BIT $3000			; 2C 00 30 | Test bits in accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	PLX				  ; FA | Pull X register from stack
	AND $2BC5,X		  ; 3D C5 2B | Logical AND with accumulator (absolute,X)
	LDA $E43A52		  ; AF 52 3A E4 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	PEA #$E9D5		   ; F4 D5 E9 | Push effective address to stack
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	WDM #$00			 ; 42 00 | Reserved instruction
	BIT $1800			; 2C 00 18 | Test bits in accumulator (absolute)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($11,X)		  ; 01 11 | Logical OR with accumulator ((zero page,X))
	AND ($02),Y		  ; 31 02 | Logical AND with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$C7			 ; E0 C7 | Compare X register (immediate)
	STZ $601C			; 9C 1C 60 | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1A8
; Address: $E7DD68
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1A8:
	BRA $99			  ; 80 99 | Branch always
	STA ($B5,X)		  ; 81 B5 | Update graphics data
	JMP $183404		  ; 5C 04 34 18 | Jump to address long
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1A9
; Address: $E7DD77
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1A9:
	STA				  ; 9F 99 66 BD | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STX $EE08			; 8E 08 EE | Store X register to absolute address
	ASL $C6			  ; 06 C6 | Arithmetic shift left (zero page)
	BRA $80			  ; 80 80 | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STX $EE71			; 8E 71 EE | Store X register to absolute address
	ORA ($C6),Y		  ; 11 C6 | Logical OR with accumulator ((zero page),Y)
	AND $7F80,Y		  ; 39 80 7F | Logical AND with accumulator (absolute,Y)
	BRA $10			  ; 80 10 | Branch always
	BPL $01			  ; 10 01 | Branch if positive
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($12),Y		  ; 11 12 | Logical OR with accumulator ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1AA
; Address: $E7DDC0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1AA:
	JSR $4440			; 20 40 44 | Jump to subroutine
	STZ $24			  ; 64 24 | Store zero to zero page
	BIT $96			  ; 24 96 | Test bits in accumulator (zero page)
	INC				  ; 1A | Increment accumulator
	STZ $F66A,X		  ; 9E 6A F6 | Store zero to absolute,X
	STA				  ; 9F 63 55 23 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1AD
; Address: $E7DDD8
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1AD:
	STZ $FE9E,X		  ; 9E 9E FE | Store zero to absolute,X
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $100D			; 0E 0D 10 | Arithmetic shift left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BMI $2F			  ; 30 2F | Branch if negative
	BIT #$F5			 ; 89 F5 | Test bits in accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ADC ($02,X)		  ; 61 02 | Add with carry ((zero page,X))
	DEX				  ; CA | Decrement X register
	PHX				  ; DA | Push X register to stack
	LDX $DE3F,Y		  ; BE 3F DE | Load from absolute,Y into X register
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $9400,X		  ; 1D 00 94 | Logical OR with accumulator (absolute,X)
	ASL $86			  ; 06 86 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $D740			; 0E 40 D7 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	EOR $C07F,X		  ; 5D 7F C0 | Exclusive OR with accumulator (absolute,X)
	SEP #$FC			 ; E2 FC | Set processor status bits
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1AE
; Address: $E7DE39
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1AE:
	ADC $F16E,Y		  ; 79 6E F1 | Add with carry (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	LDA $00E2,X		  ; BD E2 00 | Read graphics status
	CPY $F3			  ; C4 F3 | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	CPX $D200			; EC 00 D2 | Compare X register (absolute)
	SBC $00FF,X		  ; FD FF 00 | Subtract with carry (absolute,X)
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	INX				  ; E8 | Increment X register
	CPX $D213			; EC 13 D2 | Compare X register (absolute)
	AND $C43B			; 2D 3B C4 | Logical AND with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	LDY #$29			 ; A0 29 | Load immediate value into Y register
	LDY $00			  ; A4 00 | Load from zero page into Y register
	BPL $05			  ; 10 05 | Branch if positive
	CMP $4305,Y		  ; D9 05 43 | Compare accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1B1
; Address: $E7DE85
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1B1:
	RTI				  ; 40 | Return from interrupt
	SBC ($C0,X)		  ; E1 C0 | Subtract with carry ((zero page,X))
	BVC $60			  ; 50 60 | Branch if overflow clear
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1B2
; Address: $E7DE8B
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1B2:
	JSR $3826			; 20 26 38 | Jump to subroutine
	ASL $3F0F			; 0E 0F 3F | Arithmetic shift left (absolute)
	LDA ($43),Y		  ; B1 43 | Read graphics status
	STA ($63),Y		  ; 91 63 | Update graphics data
	ADC #$17			 ; 69 17 | Add with carry (immediate)
	ROL $1E			  ; 26 1E | Rotate left (zero page)
	JMP ($301C)		  ; 6C 1C 30 | Jump to address (absolute indirect)
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	BEQ $F0			  ; F0 F0 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1B3
; Address: $E7DEC8
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1B3:
	JSR $301C			; 20 1C 30 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ASL $7801			; 0E 01 78 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	BVS $2F			  ; 70 2F | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $1FFE,X		  ; FE FE 1F | Increment (absolute,X)
	JMP $2A08			; 4C 08 2A | Jump to address
	BRA $90			  ; 80 90 | Branch always
	PHX				  ; DA | Push X register to stack
	SED				  ; F8 | Set decimal mode flag
	INC $1F01,X		  ; FE 01 1F | Increment (absolute,X)
	CPX #$CC			 ; E0 CC | Compare X register (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	ROL $20			  ; 26 20 | Rotate left (zero page)
	BIT $0000			; 2C 00 00 | Test bits in accumulator (absolute)
	BVC $51			  ; 50 51 | Branch if overflow clear
	BRA $A4			  ; 80 A4 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1B4
; Address: $E7DF0C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1B4:
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	CLI				  ; 58 | Clear interrupt disable flag
	INX				  ; E8 | Increment X register
	LDX $5BBC,Y		  ; BE BC 5B | Load from absolute,Y into X register
	BVS $9F			  ; 70 9F | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEX				  ; CA | Decrement X register
	CPX #$C3			 ; E0 C3 | Compare X register (immediate)
	BMI $30			  ; 30 30 | Branch if negative
	CPY $FFCC			; CC CC FF | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1B5
; Address: $E7DF3A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1B5:
	BMI $CF			  ; 30 CF | Branch if negative
	CPY $0133			; CC 33 01 | Compare Y register (absolute)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	LDX #$14			 ; A2 14 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1B6
; Address: $E7DF67
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1B6:
	JSR $31EE			; 20 EE 31 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	PHA				  ; 48 | Push accumulator to stack
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	STX $FF00			; 8E 00 FF | Store X register to absolute address
	SBC ($05,X)		  ; E1 05 | Subtract with carry ((zero page,X))
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	BVS $81			  ; 70 81 | Branch if overflow set
	CLI				  ; 58 | Clear interrupt disable flag
	LDY #$CF			 ; A0 CF | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	ORA $5F1A,X		  ; 1D 1A 5F | Logical OR with accumulator (absolute,X)
	ASL $0E5F,X		  ; 1E 5F 0E | Arithmetic shift left (absolute,X)
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	PHP				  ; 08 | Push processor status to stack
	BRA $80			  ; 80 80 | Branch always
	CPY #$FB			 ; C0 FB | Compare Y register (immediate)
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	SBC $F201,Y		  ; F9 01 F2 | Subtract with carry (absolute,Y)
	CPY $300F			; CC 0F 30 | Compare Y register (absolute)
	BNE $6F			  ; D0 6F | Branch if not equal
	AND #$37			 ; 29 37 | Logical AND with accumulator (immediate)
	BNE $1F			  ; D0 1F | Branch if not equal
	BCC $1F			  ; 90 1F | Branch if carry clear
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $8EF1			; 0E F1 8E | Arithmetic shift left (absolute)
	SBC ($BE),Y		  ; F1 BE | Subtract with carry ((zero page),Y)
	CMP ($38,X)		  ; C1 38 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1B7
; Address: $E7DFF8
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1B7:
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	SEI				  ; 78 | Set interrupt disable flag
	ASL $78			  ; 06 78 | Arithmetic shift left (zero page)
	ASL $70			  ; 06 70 | Arithmetic shift left (zero page)
	BCS $36			  ; B0 36 | Branch if carry set
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1B8
; Address: $E7E04E
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1B8:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1B9
; Address: $E7E05E
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1B9:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STZ $07			  ; 64 07 | Store zero to zero page
	BVS $00			  ; 70 00 | Branch if overflow set
	BCS $36			  ; B0 36 | Branch if carry set
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	BPL $0E			  ; 10 0E | Branch if positive
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	ASL $F000,X		  ; 1E 00 F0 | Arithmetic shift left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $0E			  ; 10 0E | Branch if positive
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	ASL $4000,X		  ; 1E 00 40 | Arithmetic shift left (absolute,X)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1BA
; Address: $E7E0A4
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1BA:
	EOR ($0F,X)		  ; 41 0F | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	EOR ($0E,X)		  ; 41 0E | Exclusive OR with accumulator ((zero page,X))
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $6A00			; 0E 00 6A | Arithmetic shift left (absolute)
	SEP #$0F			 ; E2 0F | Set processor status bits
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	STA $9976,Y		  ; 99 76 99 | Update graphics data
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $6A00			; 0E 00 6A | Arithmetic shift left (absolute)
	SEP #$0F			 ; E2 0F | Set processor status bits
	LDX $7D			  ; A6 7D | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1BB
; Address: $E7E0EA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1BB:
	JSR $60FF			; 20 FF 60 | Jump to subroutine
	BNE $00			  ; D0 00 | Branch if not equal
	BEQ $09			  ; F0 09 | Branch if equal
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	STA $9976,Y		  ; 99 76 99 | Update graphics data
	STZ $9F			  ; 64 9F | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1BC
; Address: $E7E0FC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1BC:
	BCS $40			  ; B0 40 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	LDX $7D			  ; A6 7D | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1BD
; Address: $E7E102
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1BD:
	JSR $60FF			; 20 FF 60 | Jump to subroutine
	BNE $00			  ; D0 00 | Branch if not equal
	BEQ $00			  ; F0 00 | Branch if equal
	STZ $9F			  ; 64 9F | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1BE
; Address: $E7E114
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1BE:
	BCS $40			  ; B0 40 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	ADC $22DF			; 6D DF 22 | Add with carry (absolute)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CMP $0008			; CD 08 00 | Compare accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CMP $FF7F,X		  ; DD 7F FF | Compare accumulator (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	LSR $04			  ; 46 04 | Logical shift right (zero page)
	ADC $1080,X		  ; 7D 80 10 | Add with carry (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY #$81			 ; C0 81 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCS $95			  ; B0 95 | Branch if carry set
	INC $8C77			; EE 77 8C | Increment (absolute)
	LDX $7D			  ; A6 7D | Load from zero page into X register
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1BF
; Address: $E7E16C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1BF:
	LDA $F266,X		  ; BD 66 F2 | Read graphics status
	EOR $FFFF			; 4D FF FF | Exclusive OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	PEA #$F80B		   ; F4 0B F8 | Push effective address to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1C0
; Address: $E7E1A4
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1C0:
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SBC $C0FF,X		  ; FD FF C0 | Subtract with carry (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	SEC				  ; 38 | Set carry flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	BPL $00			  ; 10 00 | Branch if positive
	ROL $85FF,X		  ; 3E FF 85 | Rotate left (absolute,X)
	INC $FF0A,X		  ; FE 0A FF | Increment (absolute,X)
	BMI $CF			  ; 30 CF | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BEQ $0C			  ; F0 0C | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PEA #$98F4		   ; F4 F4 98 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $853E,X		  ; 3E 3E 85 | Rotate left (absolute,X)
	STA $0A			  ; 85 0A | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BMI $30			  ; 30 30 | Branch if negative
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	STA $78E3,X		  ; 9D E3 78 | Update graphics data
	STA $B7FE,X		  ; 9D FE B7 | Update graphics data
	INC $CEFF,X		  ; FE FF CE | Increment (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	REP #$3E			 ; C2 3E | Reset processor status bits
	STY $007F			; 8C 7F 00 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1C2
; Address: $E7E2B8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1C2:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BRA $BF			  ; 80 BF | Branch always
	BRA $C3			  ; 80 C3 | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1C3
; Address: $E7E2D8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1C3:
	JSR $0000			; 20 00 00 | Jump to subroutine
	NOP				  ; EA | No operation
	INC $E301,X		  ; FE 01 E3 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1C4
; Address: $E7E301
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1C4:
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	CPY $F8C7			; CC C7 F8 | Compare Y register (absolute)
	BNE $FF			  ; D0 FF | Branch if not equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	CPX #$11			 ; E0 11 | Compare X register (immediate)
	INC $3FC0			; EE C0 3F | Increment (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY $24			  ; C4 24 | Compare Y register (zero page)
	RTI				  ; 40 | Return from interrupt
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC $77FD,X		  ; FD FD 77 | Subtract with carry (absolute,X)
	INC $8000,X		  ; FE 00 80 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	STZ $E3FE,X		  ; 9E FE E3 | Store zero to absolute,X
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC $C7			  ; C6 C7 | Decrement (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	PLB				  ; AB | Pull data bank register from stack
	BPL $10			  ; 10 10 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	ASL $C011,X		  ; 1E 11 C0 | Arithmetic shift left (absolute,X)
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BEQ $5F			  ; F0 5F | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	DEC				  ; 3A | Decrement accumulator
	INC $1D08,X		  ; FE 08 1D | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1C5
; Address: $E7E3C5
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1C5:
	CMP ($0D,X)		  ; C1 0D | Compare accumulator ((zero page,X))
	ORA ($2D,X)		  ; 01 2D | Logical OR with accumulator ((zero page,X))
	STA $E1C1,X		  ; 9D C1 E1 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $7D			  ; E5 7D | Subtract with carry (zero page)
	BEQ $1E			  ; F0 1E | Branch if equal
	BEQ $F4			  ; F0 F4 | Branch if equal
	SBC ($F5),Y		  ; F1 F5 | Subtract with carry ((zero page),Y)
	ASL $021E,X		  ; 1E 1E 02 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	ASL $E800,X		  ; 1E 00 E8 | Arithmetic shift left (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	ORA $00FF,Y		  ; 19 FF 00 | Logical OR with accumulator (absolute,Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	CPX #$45			 ; E0 45 | Compare X register (immediate)
	WDM #$A0			 ; 42 A0 | Reserved instruction
	LDA ($F0,X)		  ; A1 F0 | Read graphics status
	BEQ $00			  ; F0 00 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 5E 00 | Read graphics status
	SBC $FF03,X		  ; FD 03 FF | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	INC $FD01,X		  ; FE 01 FD | Increment (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	INC $5000,X		  ; FE 00 50 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX $D013			; EC 13 D0 | Compare X register (absolute)
	LDA				  ; BF 43 1F E3 | Read graphics status
	BIT $1AFF			; 2C FF 1A | Test bits in accumulator (absolute)
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CMP $C7			  ; C5 C7 | Compare accumulator (zero page)
	INX				  ; E8 | Increment X register
	LDA $00FFAF		  ; AF AF FF 00 | Read graphics status
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SBC $C3FD,X		  ; FD FD C3 | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1C6
; Address: $E7E4C6
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1C6:
	ORA $AEE7,Y		  ; 19 E7 AE | Logical OR with accumulator (absolute,Y)
	INC $FD7D,X		  ; FE 7D FD | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX $D0EC			; EC EC D0 | Compare X register (absolute)
	BNE $BB			  ; D0 BB | Branch if not equal
	LDA				  ; BF 13 1F 2C | Read graphics status
	BIT $1A1A			; 2C 1A 1A | Test bits in accumulator (absolute)
	SBC $EB00,X		  ; FD 00 EB | Subtract with carry (absolute,X)
	INC $F50E,X		  ; FE 0E F5 | Increment (absolute,X)
	ORA $0D75			; 0D 75 0D | Logical OR with accumulator (absolute)
	ADC $F11D,X		  ; 7D 1D F1 | Add with carry (absolute,X)
	ORA $25C1,X		  ; 1D C1 25 | Logical OR with accumulator (absolute,X)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ADC $7D			  ; 65 7D | Add with carry (zero page)
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	BPL $3E			  ; 10 3E | Branch if positive
	DEC $5FFF,X		  ; DE FF 5F | Decrement (absolute,X)
	CMP $3C			  ; C5 3C | Compare accumulator (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STA				  ; 9F 98 EB A8 | Update graphics data
	BMI $E6			  ; 30 E6 | Branch if negative
	SBC $5909,Y		  ; F9 09 59 | Subtract with carry (absolute,Y)
	AND #$F7			 ; 29 F7 | Logical AND with accumulator (immediate)
	STA $B800,X		  ; 9D 00 B8 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	DEC $8200			; CE 00 82 | Decrement (absolute)
	ASL $FE80,X		  ; 1E 80 FE | Arithmetic shift left (absolute,X)
	ORA $0BCB,X		  ; 1D CB 0B | Logical OR with accumulator (absolute,X)
	AND ($21,X)		  ; 21 21 | PPU graphics register access
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1C8
; Address: $E7E574
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1C8:
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)
	PEA #$DE00		   ; F4 00 DE | Push effective address to stack
	STA				  ; 9F 00 F0 0F | Update graphics data
	CLV				  ; B8 | Clear overflow flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	DEC $3F			  ; C6 3F | Decrement (zero page)
	CLC				  ; 18 | Clear carry flag
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $8CFE			; 0E FE 8C | Arithmetic shift left (absolute)
	BEQ $FF			  ; F0 FF | Branch if equal
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1C9
; Address: $E7E5C0
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1C9:
	BRA $BF			  ; 80 BF | Branch always
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $E3			  ; F0 E3 | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	BEQ $0F			  ; F0 0F | Branch if equal
	SBC ($3A),Y		  ; F1 3A | Subtract with carry ((zero page),Y)
	STZ $01FF,X		  ; 9E FF 01 | Store zero to absolute,X
	INC $FCFB,X		  ; FE FB FC | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $F0			  ; F0 F0 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	CPY #$C6			 ; C0 C6 | Compare Y register (immediate)
	DEC $18			  ; C6 18 | Decrement (zero page)
	CLC				  ; 18 | Clear carry flag
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX $00EC			; EC EC 00 | Compare X register (absolute)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEP #$E2			 ; E2 E2 | Set processor status bits
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	STZ $009E,X		  ; 9E 9E 00 | Store zero to absolute,X
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	CMP $F777,Y		  ; D9 77 F7 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1CA
; Address: $E7E685
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1CA:
	JSL $DC95F5		  ; 22 F5 95 DC | Jump to subroutine long
	LDY $FB			  ; A4 FB | Load from zero page into Y register
	XBA				  ; EB | Exchange accumulator bytes
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	INC $099E,X		  ; FE 9E 09 | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ROL $EA06			; 2E 06 EA | Rotate left (absolute)
	PLX				  ; FA | Pull X register from stack
	ADC $E0F9,Y		  ; 79 F9 E0 | Game work RAM access
	CPX #$9C			 ; E0 9C | Compare X register (immediate)
	STZ $4040			; 9C 40 40 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1CB
; Address: $E7E6B0
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1CB:
	NOP				  ; EA | No operation
	ADC $E001,Y		  ; 79 01 E0 | Game work RAM access
	STZ $409C			; 9C 9C 40 | Store zero to absolute
	RTI				  ; 40 | Return from interrupt
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	BPL $EF			  ; 10 EF | Branch if positive
	SBC ($5F),Y		  ; F1 5F | Subtract with carry ((zero page),Y)
	LDY #$FE			 ; A0 FE | Load immediate value into Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	INC $FF0D,X		  ; FE 0D FF | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1CC
; Address: $E7E70F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1CC:
	STA				  ; 9F 00 00 00 | Update graphics data
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1CD
; Address: $E7E726
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1CD:
	BRA $80			  ; 80 80 | Branch always
	BEQ $70			  ; F0 70 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	LDX $394E,Y		  ; BE 4E 39 | Load from absolute,Y into X register
	BEQ $00			  ; F0 00 | Branch if equal
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	BEQ $D0			  ; F0 D0 | Branch if equal
	BPL $50			  ; 10 50 | Branch if positive
	BCS $B0			  ; B0 B0 | Branch if carry set
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	DEY				  ; 88 | Decrement Y register
	BVC $00			  ; 50 00 | Branch if overflow clear
	BCS $00			  ; B0 00 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $F53E,X		  ; 3E 3E F5 | Rotate left (absolute,X)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1CF
; Address: $E7E793
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1CF:
	JSL $0CF5F5		  ; 22 F5 F5 0C | Jump to subroutine long
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	CMP #$BF			 ; C9 BF | Compare accumulator (immediate)
	ROR $FF5E,X		  ; 7E 5E FF | Rotate right (absolute,X)
	DEC $8EFF,X		  ; DE FF 8E | Decrement (absolute,X)
	LDA				  ; BF A0 FF F8 | Read graphics status
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $80			  ; 84 80 | Store Y register to zero page
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	INY				  ; C8 | Increment Y register
	STZ $BF			  ; 64 BF | Store zero to zero page
	RTI				  ; 40 | Return from interrupt
	LSR $B9			  ; 46 B9 | Logical shift right (zero page)
	BMI $CF			  ; 30 CF | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF 00 EF 00 | Read graphics status
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	LDY $C763,X		  ; BC 63 C7 | Load from absolute,X into Y register
	SEC				  ; 38 | Set carry flag
	BPL $FF			  ; 10 FF | Branch if positive
	STY $D02F			; 8C 2F D0 | Store Y register to absolute address
	BNE $3C			  ; D0 3C | Branch if not equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1D2
; Address: $E7E807
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1D2:
	JSR $3FFF			; 20 FF 3F | Jump to subroutine
	XBA				  ; EB | Exchange accumulator bytes
	INY				  ; C8 | Increment Y register
	STZ $0000			; 9C 00 00 | Store zero to absolute
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	PEA #$FE0C		   ; F4 0C FE | Push effective address to stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1D3
; Address: $E7E84D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1D3:
	STA $E51B,Y		  ; 99 1B E5 | Update graphics data
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1D4
; Address: $E7E867
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1D4:
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	BVS $7F			  ; 70 7F | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	ROR $FD81,X		  ; 7E 81 FD | Rotate right (absolute,X)
	SBC $FFE2,X		  ; FD E2 FF | Subtract with carry (absolute,X)
	INC $3B			  ; E6 3B | Increment (zero page)
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	ROR $FC00,X		  ; 7E 00 FC | Rotate right (absolute,X)
	SBC $F300,X		  ; FD 00 F3 | Subtract with carry (absolute,X)
	LDX $7C71,Y		  ; BE 71 7C | Load from absolute,Y into X register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	DEC $1AFD			; CE FD 1A | Decrement (absolute)
	DEC $00F1			; CE F1 00 | Decrement (absolute)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	DEC $8000			; CE 00 80 | Decrement (absolute)
	BRA $FC			  ; 80 FC | Branch always
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1D5
; Address: $E7E8C6
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1D5:
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF FF 08 F8 | Read graphics status
	PEA #$FFE6		   ; F4 E6 FF | Push effective address to stack
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BEQ $EF			  ; F0 EF | Branch if equal
	DEC $7F21,X		  ; DE 21 7F | Decrement (absolute,X)
	BRA $3C			  ; 80 3C | Branch always
	EOR #$0F			 ; 49 0F | Exclusive OR with accumulator (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $7F00,X		  ; 1E 00 7F | Arithmetic shift left (absolute,X)
	BCS $00			  ; B0 00 | Branch if carry set
	ASL $0E01			; 0E 01 0E | Arithmetic shift left (absolute)
	ORA $021D			; 0D 1D 02 | Logical OR with accumulator (absolute)
	ASL $3319			; 0E 19 33 | Arithmetic shift left (absolute)
	BIT $2F23			; 2C 23 2F | Test bits in accumulator (absolute)
	LSR $7015,X		  ; 5E 15 70 | Logical shift right (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	BIT $2E00			; 2C 00 2E | Test bits in accumulator (absolute)
	ROL $4300			; 2E 00 43 | Rotate left (absolute)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BRA $7F			  ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1D6
; Address: $E7E923
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1D6:
	CPY #$BE			 ; C0 BE | Compare Y register (immediate)
	ADC ($FD,X)		  ; 61 FD | Add with carry ((zero page,X))
	BIT #$77			 ; 89 77 | Test bits in accumulator (immediate)
	BIT #$27			 ; 89 27 | Test bits in accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	LDX $007E			; AE 7E 00 | Load from absolute address into X register
	ROL $3C00,X		  ; 3E 00 3C | Rotate left (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1D7
; Address: $E7E93C
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1D7:
	JSR $1000			; 20 00 10 | Jump to subroutine
	SBC $EC05,X		  ; FD 05 EC | Subtract with carry (absolute,X)
	ORA ($F6),Y		  ; 11 F6 | Logical OR with accumulator ((zero page),Y)
	ORA #$F3			 ; 09 F3 | Logical OR with accumulator (immediate)
	STY $CCF3			; 8C F3 CC | Store Y register to absolute address
	SBC $04			  ; E5 04 | Subtract with carry (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$C8			 ; C0 C8 | Compare Y register (immediate)
	BRA $90			  ; 80 90 | Branch always
	BPL $10			  ; 10 10 | Branch if positive
	BMI $B0			  ; 30 B0 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $38			  ; 90 38 | Branch if carry clear
	BVS $00			  ; 70 00 | Branch if overflow set
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	STA				  ; 9F E9 88 F3 | Update graphics data
	STY $7F			  ; 84 7F | Store Y register to zero page
	PHA				  ; 48 | Push accumulator to stack
	ADC ($27,X)		  ; 61 27 | Add with carry ((zero page,X))
	LDA $204C07		  ; AF 07 4C 20 | Read graphics status
	BRA $00			  ; 80 00 | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	LDA				  ; BF DC FF 1C | Read graphics status
	LDX $9D41,Y		  ; BE 41 9D | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1D8
; Address: $E7E9A9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1D8:
	JSR $90EF			; 20 EF 90 | Jump to subroutine
	LDA $FB46,Y		  ; B9 46 FB | Read graphics status
	ROR $3E			  ; 66 3E | Rotate right (zero page)
	ROR $3E00,X		  ; 7E 00 3E | Rotate right (absolute,X)
	ORA $1F00,X		  ; 1D 00 1F | Logical OR with accumulator (absolute,X)
	AND $7B00,Y		  ; 39 00 7B | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1D9
; Address: $E7E9C0
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1D9:
	INC $7662,X		  ; FE 62 76 | Increment (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	ROR $FEC2,X		  ; 7E C2 FE | Rotate right (absolute,X)
	ASL $B6			  ; 06 B6 | Arithmetic shift left (zero page)
	LSR $1FE7			; 4E E7 1F | Logical shift right (absolute)
	AND ($DC),Y		  ; 31 DC | Logical AND with accumulator ((zero page),Y)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1DB
; Address: $E7E9E6
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1DB:
	JSR $00F8			; 20 F8 00 | Jump to subroutine
	CPY $EE80			; CC 80 EE | Compare Y register (absolute)
	PLY				  ; 7A | Pull Y register from stack
	BMI $C7			  ; 30 C7 | Branch if negative
	ORA $1C0A			; 0D 0A 1C | Logical OR with accumulator (absolute)
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	BMI $04			  ; 30 04 | Branch if negative
	BIT $06			  ; 24 06 | Test bits in accumulator (zero page)
	ROL $3F00			; 2E 00 3F | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	AND $3F00,Y		  ; 39 00 3F | Logical AND with accumulator (absolute,Y)
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	CPX $C8F7			; EC F7 C8 | Compare X register (absolute)
	CPX $75			  ; E4 75 | Compare X register (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDX $7B47			; AE 47 7B | Load from absolute address into X register
	STA $00			  ; 85 00 | Update graphics data
	RTI				  ; 40 | Return from interrupt
	JMP $FF2FDF		  ; 5C DF 2F FF | Jump to address long
	LDA $E06DED		  ; AF ED 6D E0 | Game work RAM access
	BRA $F0			  ; 80 F0 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STZ $D040			; 9C 40 D0 | Store zero to absolute
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1DC
; Address: $E7EA6B
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1DC:
	BEQ $48			  ; F0 48 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	AND ($43,X)		  ; 21 43 | Logical AND with accumulator ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	STZ $0600,X		  ; 9E 00 06 | Store zero to absolute,X
	ASL $0E11			; 0E 11 0E | Arithmetic shift left (absolute)
	BIT $19			  ; 24 19 | Test bits in accumulator (zero page)
	PHY				  ; 5A | Push Y register to stack
	ORA ($52),Y		  ; 11 52 | Logical OR with accumulator ((zero page),Y)
	ROL $65			  ; 26 65 | Rotate left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ADC $5800			; 6D 00 58 | Add with carry (absolute)
	ADC ($1F,X)		  ; 61 1F | Add with carry ((zero page,X))
	LDA $FF4E,Y		  ; B9 4E FF | Read graphics status
	BCS $EE			  ; B0 EE | Branch if carry set
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	BIT $81			  ; 24 81 | Test bits in accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	INC $FE00			; EE 00 FE | Increment (absolute)
	INC $DC00,X		  ; FE 00 DC | Increment (absolute,X)
	LDA $FCCD,X		  ; BD CD FC | Read graphics status
	AND $7D7C			; 2D 7C 7D | Logical AND with accumulator (absolute)
	STZ $9801,X		  ; 9E 01 98 | Store zero to absolute,X
	SBC $FD3E,Y		  ; F9 3E FD | Subtract with carry (absolute,Y)
	TXA				  ; 8A | Transfer X register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1DE
; Address: $E7EADA
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1DE:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($73),Y		  ; 91 73 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	PLP				  ; 28 | Pull processor status from stack
	CLD				  ; D8 | Clear decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	BVC $B0			  ; 50 B0 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1DF
; Address: $E7EAED
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1DF:
	BRA $00			  ; 80 00 | Branch always
	BNE $0E			  ; D0 0E | Branch if not equal
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	JMP $7E00			; 4C 00 7E | Jump to address
	ROL $CF00,X		  ; 3E 00 CF | Rotate left (absolute,X)
	PEA #$C8F7		   ; F4 F7 C8 | Push effective address to stack
	CPX $75			  ; E4 75 | Compare X register (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDX $734F			; AE 4F 73 | Load from absolute address into X register
	STA $00			  ; 85 00 | Update graphics data
	LDA				  ; BF 40 9F 7C | Read graphics status
	LDA $E06DED		  ; AF ED 6D E0 | Game work RAM access
	BRA $D0			  ; 80 D0 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1E0
; Address: $E7EB30
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1E0:
	BMI $00			  ; 30 00 | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STZ $D040			; 9C 40 D0 | Store zero to absolute
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $48			  ; F0 48 | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	ADC ($13),Y		  ; 71 13 | Add with carry ((zero page),Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	STX $7000			; 8E 00 70 | Store X register to absolute address
	BVS $60			  ; 70 60 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1E1
; Address: $E7EB70
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1E1:
	STA $009F00		  ; 8F 00 9F 00 | Update graphics data
	STA				  ; 9F 00 FF 00 | Update graphics data
	RTI				  ; 40 | Return from interrupt
	BEQ $00			  ; F0 00 | Branch if equal
	BPL $53			  ; 10 53 | Branch if positive
	BPL $57			  ; 10 57 | Branch if positive
	BVS $F7			  ; 70 F7 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 00 B8 00 | Update graphics data
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA $00BF00		  ; 8F 00 BF 00 | Update graphics data
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1E2
; Address: $E7EBA2
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1E2:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	BRA $FF			  ; 80 FF | Branch always
	BEQ $38			  ; F0 38 | Branch if equal
	BIT $5343			; 2C 43 53 | Test bits in accumulator (absolute)
	ASL $26			  ; 06 26 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	LDY $BC00,X		  ; BC 00 BC | Load from absolute,X into Y register
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	ASL $40			  ; 06 40 | Arithmetic shift left (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	LDA				  ; BF 00 FD 02 | Read graphics status
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	SBC $B701,X		  ; FD 01 B7 | Subtract with carry (absolute,X)
	BPL $53			  ; 10 53 | Branch if positive
	BVS $73			  ; 70 73 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	BRA $BC			  ; 80 BC | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1E3
; Address: $E7EC0E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1E3:
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STA $00FF00		  ; 8F 00 FF 00 | Update graphics data
	STA				  ; 9F 80 FE FE | Update graphics data
	ADC ($65,X)		  ; 61 65 | Add with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1E4
; Address: $E7EC2A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1E4:
	JSR $002F			; 20 2F 00 | Jump to subroutine
	ASL $C3C3			; 0E C3 C3 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	BRA $98			  ; 80 98 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1E5
; Address: $E7EC43
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1E5:
	JMP ($C3C3)		  ; 6C C3 C3 | Jump to address (absolute indirect)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BMI $26			  ; 30 26 | Branch if negative
	ROL $7F			  ; 26 7F | Rotate left (zero page)
	STA				  ; 9F 00 3C 00 | Update graphics data
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	CMP $06C0,Y		  ; D9 C0 06 | Compare accumulator (absolute,Y)
	ASL $0F1B			; 0E 1B 0F | Arithmetic shift left (absolute)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	BIT $1B			  ; 24 1B | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1E6
; Address: $E7EC6F
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1E6:
	STZ $09			  ; 64 09 | Store zero to zero page
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	STZ $00			  ; 64 00 | Store zero to zero page
	JMP ($5800)		  ; 6C 00 58 | Jump to address (absolute indirect)
	AND $3F			  ; 25 3F | Logical AND with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	STZ $2DDE			; 9C DE 2D | Store zero to absolute
	ADC ($AE),Y		  ; 71 AE | Add with carry ((zero page),Y)
	ADC #$B8			 ; 69 B8 | Add with carry (immediate)
	SBC $9B74			; ED 74 9B | Subtract with carry (absolute)
	LDA				  ; BF 00 3F 00 | Read graphics status
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	SBC $FD8D,X		  ; FD 8D FD | Subtract with carry (absolute,X)
	EOR $BDD8			; 4D D8 BD | Exclusive OR with accumulator (absolute)
	PLB				  ; AB | Pull data bank register from stack
	CLD				  ; D8 | Clear decimal mode flag
	SBC ($F2),Y		  ; F1 F2 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	PHB				  ; 8B | Push data bank register to stack
	SEP #$00			 ; E2 00 | Set processor status bits
	SEP #$00			 ; E2 00 | Set processor status bits
	DEC $00			  ; C6 00 | Decrement (zero page)
	STA ($03,X)		  ; 81 03 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1E7
; Address: $E7ECC3
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1E7:
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	BPL $F0			  ; 10 F0 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $7E			  ; D0 7E | Branch if not equal
	ASL $0600,X		  ; 1E 00 06 | Arithmetic shift left (absolute,X)
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	LDX $07FF			; AE FF 07 | Load from absolute address into X register
	STX $CFFF			; 8E FF CF | Store X register to absolute address
	RTI				  ; 40 | Return from interrupt
	SBC $8702,X		  ; FD 02 87 | Subtract with carry (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	INC $90			  ; E6 90 | Increment (zero page)
	STA ($C0),Y		  ; 91 C0 | Update graphics data
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1E8
; Address: $E7ED16
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1E8:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $1E1F8F		  ; 8F 8F 1F 1E | Update graphics data
	CPX $EC0C			; EC 0C EC | Compare X register (absolute)
	PHP				  ; 08 | Push processor status to stack
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	STX $8E0F			; 8E 0F 8E | Store X register to absolute address
	STY $07			  ; 84 07 | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY $5433			; CC 33 54 | Compare Y register (absolute)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $C1			  ; 06 C1 | Arithmetic shift left (zero page)
	STA ($81,X)		  ; 81 81 | Update graphics data
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	STA ($01,X)		  ; 81 01 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	BIT $B000			; 2C 00 B0 | Test bits in accumulator (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($F2,X)		  ; 01 F2 | Logical OR with accumulator ((zero page,X))
	ASL $B848			; 0E 48 B8 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1E9
; Address: $E7EDD6
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1E9:
	JSR $C0E0			; 20 E0 C0 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ADC $7D			  ; 65 7D | Add with carry (zero page)
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)
	BPL $3E			  ; 10 3E | Branch if positive
	SBC $FFFE,Y		  ; F9 FE FF | Subtract with carry (absolute,Y)
	PLX				  ; FA | Pull X register from stack
	SBC $820C,X		  ; FD 0C 82 | Subtract with carry (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $7079,Y		  ; 79 79 70 | Add with carry (absolute,Y)
	BVS $70			  ; 70 70 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1EA
; Address: $E7EE07
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1EA:
	BVS $73			  ; 70 73 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	STX $00			  ; 86 00 | Store X register to zero page
	STA $008F00		  ; 8F 00 8F 00 | Update graphics data
	STY $8D00			; 8C 00 8D | Store Y register to absolute address
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $B7			  ; F0 B7 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ROR $1F46,X		  ; 7E 46 1F | Rotate right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	STA ($00,X)		  ; 81 00 | Update graphics data
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($C6,X)		  ; 01 C6 | Logical OR with accumulator ((zero page,X))
	ORA $9819,Y		  ; 19 19 98 | Logical OR with accumulator (absolute,Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $90			  ; 90 90 | Branch if carry clear
	STA $8E860F		  ; 8F 0F 86 8E | Update graphics data
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $00			  ; E6 00 | Increment (zero page)
	BVS $00			  ; 70 00 | Branch if overflow set
	ADC ($08),Y		  ; 71 08 | Add with carry ((zero page),Y)
	INC $FCFA,X		  ; FE FA FC | Increment (absolute,X)
	BIT $1CCC			; 2C CC 1C | Test bits in accumulator (absolute)
	CPY #$78			 ; C0 78 | Compare Y register (immediate)
	STA ($BD,X)		  ; 81 BD | Update graphics data
	STX $F6			  ; 86 F6 | Store X register to zero page
	JMP $013C3C		  ; 5C 3C 3C 01 | Jump to address long
	ROR $7900,X		  ; 7E 00 79 | Rotate right (absolute,X)
	BVS $70			  ; 70 70 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1EB
; Address: $E7EE90
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1EB:
	STA $000300		  ; 8F 00 03 00 | Update graphics data
	STA				  ; 9F 00 FF 00 | Update graphics data
	BRA $1E			  ; 80 1E | Branch always
	PHY				  ; 5A | Push Y register to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1EC
; Address: $E7EECB
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1EC:
	XBA				  ; EB | Exchange accumulator bytes
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	BIT $5343			; 2C 43 53 | Test bits in accumulator (absolute)
	ASL $26			  ; 06 26 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	BEQ $C7			  ; F0 C7 | Branch if equal
	LDY $BC00,X		  ; BC 00 BC | Load from absolute,X into Y register
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $8000,X		  ; FE 00 80 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BIT $E7			  ; 24 E7 | Test bits in accumulator (zero page)
	CPX $F8			  ; E4 F8 | Compare X register (zero page)
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC #$18			 ; 69 18 | Add with carry (immediate)
	SBC $FB09,Y		  ; F9 09 FB | Subtract with carry (absolute,Y)
	DEX				  ; CA | Decrement X register
	BPL $13			  ; 10 13 | Branch if positive
	BPL $17			  ; 10 17 | Branch if positive
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INC $7F01,X		  ; FE 01 7F | Increment (absolute,X)
	INC $13F3			; EE F3 13 | Increment (absolute)
	SBC ($E5,X)		  ; E1 E5 | Subtract with carry ((zero page,X))
	STA ($87,X)		  ; 81 87 | Update graphics data
	STX $00			  ; 86 00 | Store X register to zero page
	STX $8E00			; 8E 00 8E | Store X register to absolute address
	ASL $7E00,X		  ; 1E 00 7E | Arithmetic shift left (absolute,X)
	STZ $FE63			; 9C 63 FE | Store zero to absolute
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	BMI $30			  ; 30 30 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1EE
; Address: $E7EFEE
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1EE:
	RTI				  ; 40 | Return from interrupt
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA				  ; 9F 00 BF 00 | Update graphics data
	LDA				  ; BF 00 CC 33 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1EF
; Address: $E7F003
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1EF:
	LDA				  ; BF F7 E8 3B | Read graphics status
	SEC				  ; 38 | Set carry flag
	DEC $CE4F			; CE 4F CE | Decrement (absolute)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCS $40			  ; B0 40 | Branch if carry set
	BCS $40			  ; B0 40 | Branch if carry set
	ROR $FF81,X		  ; 7E 81 FF | Rotate right (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC $3D75,X		  ; FD 75 3D | Subtract with carry (absolute,X)
	CMP $0FFF			; CD FF 0F | Compare accumulator (absolute)
	INC $FE36,X		  ; FE 36 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	STY $FC			  ; 84 FC | Store Y register to zero page
	BCS $FD			  ; B0 FD | Branch if carry set
	AND $FF7D,X		  ; 3D 7D FF | Logical AND with accumulator (absolute,X)
	ADC ($73),Y		  ; 71 73 | Add with carry ((zero page),Y)
	CPX #$E6			 ; E0 E6 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STX $1F00			; 8E 00 1F | Store X register to absolute address
	SBC $F946,Y		  ; F9 46 F9 | Subtract with carry (absolute,Y)
	STX $FF			  ; 86 FF | Store X register to zero page
	BRA $FF			  ; 80 FF | Branch always
	STY $3970			; 8C 70 39 | Store Y register to absolute address
	INY				  ; C8 | Increment Y register
	DEC $0001			; CE 01 00 | Decrement (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	SBC $D1C6,Y		  ; F9 C6 D1 | Subtract with carry (absolute,Y)
	LDX $00C0			; AE C0 00 | Load from absolute address into X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	STZ $DF			  ; 64 DF | Store zero to zero page
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1F0
; Address: $E7F0AF
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1F0:
	ORA $8000,Y		  ; 19 00 80 | Logical OR with accumulator (absolute,Y)
	CPX #$7E			 ; E0 7E | Compare X register (immediate)
	STA ($FD,X)		  ; 81 FD | Update graphics data
	SBC $FFE2,X		  ; FD E2 FF | Subtract with carry (absolute,X)
	ROL $DB			  ; 26 DB | Rotate left (zero page)
	BIT $B0			  ; 24 B0 | Test bits in accumulator (zero page)
	ROR $FC00,X		  ; 7E 00 FC | Rotate right (absolute,X)
	SBC $F300,X		  ; FD 00 F3 | Subtract with carry (absolute,X)
	LDX $65			  ; A6 65 | Load from zero page into X register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	DEC $1AFD			; CE FD 1A | Decrement (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	STA ($80,X)		  ; 81 80 | Update graphics data
	LDA $FB00,Y		  ; B9 00 FB | Read graphics status
	ORA ($EF,X)		  ; 01 EF | Logical OR with accumulator ((zero page,X))
	INC $FC01,X		  ; FE 01 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BRA $9F			  ; 80 9F | Branch always
	BRA $0C			  ; 80 0C | Branch always
	SBC $E8ED			; ED ED E8 | Subtract with carry (absolute)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	SBC ($F0,X)		  ; E1 F0 | Subtract with carry ((zero page,X))
	SBC ($F0,X)		  ; E1 F0 | Subtract with carry ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$17			 ; E0 17 | Compare X register (immediate)
	CPX #$17			 ; E0 17 | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $EC			  ; F0 EC | Branch if equal
	CPX #$E4			 ; E0 E4 | Compare X register (immediate)
	CPX $40			  ; E4 40 | Compare X register (zero page)
	LSR $70			  ; 46 70 | Logical shift right (zero page)
	LSR $3FED,X		  ; 5E ED 3F | Logical shift right (absolute,X)
	LDA				  ; BF 00 8F 00 | Read graphics status
	ORA $1F20			; 0D 20 1F | Logical OR with accumulator (absolute)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1F1
; Address: $E7F1A5
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1F1:
	LSR $613F			; 4E 3F 61 | Logical shift right (absolute)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	BEQ $1E			  ; F0 1E | Branch if equal
	CPX #$2E			 ; E0 2E | Compare X register (immediate)
	CPX #$2F			 ; E0 2F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	STA ($98,X)		  ; 81 98 | Update graphics data
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ORA ($9F,X)		  ; 01 9F | Logical OR with accumulator ((zero page,X))
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	ROR $FE00,X		  ; 7E 00 FE | Rotate right (absolute,X)
	INC $8300,X		  ; FE 00 83 | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $C13D,X		  ; FE 3D C1 | Increment (absolute,X)
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	INC				  ; 1A | Increment accumulator
	ROL $FF00,X		  ; 3E 00 FF | Rotate left (absolute,X)
	SBC $1A			  ; E5 1A | Subtract with carry (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	LDA $B946,Y		  ; B9 46 B9 | Read graphics status
	LDA				  ; BF 70 3F F0 | Read graphics status
	BCS $8F			  ; B0 8F | Branch if carry set
	BVS $3F			  ; 70 3F | Branch if overflow set
	CPY $CE3F			; CC 3F CE | Compare Y register (absolute)
	STA ($00,X)		  ; 81 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	BRA $00			  ; 80 00 | Branch always
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	CPY $0F			  ; C4 0F | Compare Y register (zero page)
	BEQ $F7			  ; F0 F7 | Branch if equal
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1F2
; Address: $E7F28B
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1F2:
	CLV				  ; B8 | Clear overflow flag
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	BVS $3B			  ; 70 3B | Branch if overflow set
	SBC $EC05,X		  ; FD 05 EC | Subtract with carry (absolute,X)
	ORA ($F6),Y		  ; 11 F6 | Logical OR with accumulator ((zero page),Y)
	ORA #$F3			 ; 09 F3 | Logical OR with accumulator (immediate)
	STY $DCF3			; 8C F3 DC | Store Y register to absolute address
	SBC $0004,X		  ; FD 04 00 | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($15,X)		  ; 01 15 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $19			  ; 05 19 | Logical OR with accumulator (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	STA				  ; 9F 00 1F 00 | Update graphics data
	ROL $FC00,X		  ; 3E 00 FC | Rotate left (absolute,X)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	BMI $FF			  ; 30 FF | Branch if negative
	BRA $FF			  ; 80 FF | Branch always
	BRA $D8			  ; 80 D8 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY $C343			; CC 43 C3 | Compare Y register (absolute)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ROR $7F00,X		  ; 7E 00 7F | Rotate right (absolute,X)
	LDA				  ; BF 00 BC 00 | Read graphics status
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	EOR #$EF			 ; 49 EF | Exclusive OR with accumulator (immediate)
	SBC $FB86,Y		  ; F9 86 FB | Subtract with carry (absolute,Y)
	STY $FF			  ; 84 FF | Store Y register to zero page
	ORA ($F7),Y		  ; 11 F7 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1F3
; Address: $E7F349
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1F3:
	BRA $E0			  ; 80 E0 | Game work RAM access
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1F4
; Address: $E7F354
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1F4:
	JSR $2000			; 20 00 20 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BNE $00			  ; D0 00 | Branch if not equal

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1F5
; Address: $E7F35C
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1F5:
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	PLX				  ; FA | Pull X register from stack
	INC $BE33,X		  ; FE 33 BE | Increment (absolute,X)
	LDX $FE46,Y		  ; BE 46 FE | Load from absolute,Y into X register
	ASL $E7			  ; 06 E7 | Arithmetic shift left (zero page)
	LDA				  ; BF CF F1 FC | Read graphics status
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	PLP				  ; 28 | Pull processor status from stack
	BVS $20			  ; 70 20 | Branch if overflow set
	BCS $20			  ; B0 20 | Branch if carry set
	SED				  ; F8 | Set decimal mode flag
	CPY $EE80			; CC 80 EE | Compare Y register (absolute)
	PLY				  ; 7A | Pull Y register from stack
	BMI $C7			  ; 30 C7 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $1900,X		  ; 1D 00 19 | Logical OR with accumulator (absolute,X)
	ADC ($AF),Y		  ; 71 AF | Add with carry ((zero page),Y)
	BNE $7E			  ; D0 7E | Branch if not equal
	STA ($F1,X)		  ; 81 F1 | Update graphics data
	ASL $1FFC			; 0E FC 1F | Arithmetic shift left (absolute)
	STY $2100			; 8C 00 21 | PPU graphics register access
	ROR $F100,X		  ; 7E 00 F1 | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1F6
; Address: $E7F3E2
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1F6:
	ADC $FF02,X		  ; 7D 02 FF | Add with carry (absolute,X)
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	STA $009F77		  ; 8F 77 9F 00 | Update graphics data
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	BNE $00			  ; D0 00 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BRA $FC			  ; 80 FC | Branch always
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FCF8,X		  ; FE F8 FC | Increment (absolute,X)
	BVS $74			  ; 70 74 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1F7
; Address: $E7F42F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1F7:
	BPL $1E			  ; 10 1E | Branch if positive
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	STY $F800			; 8C 00 F8 | Store Y register to absolute address
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1F9
; Address: $E7F446
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1F9:
	JSR $0040			; 20 40 00 | Jump to subroutine
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	STY $42			  ; 84 42 | Hardware register operation
	RTI				  ; 40 | Return from interrupt
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $00			  ; 90 00 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1FA
; Address: $E7F45A
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1FA:
	ASL $8D00			; 0E 00 8D | Arithmetic shift left (absolute)
	STX $00			  ; 86 00 | Store X register to zero page
	PLP				  ; 28 | Pull processor status from stack
	BPL $AE			  ; 10 AE | Branch if positive
	EOR ($7E),Y		  ; 51 7E | Exclusive OR with accumulator ((zero page),Y)
	PLB				  ; AB | Pull data bank register from stack
	INC $776F,X		  ; FE 6F 77 | Increment (absolute,X)
	SBC #$FF			 ; E9 FF | Subtract with carry (immediate)
	LDA				  ; BF 7F C7 00 | Read graphics status
	STX $0E00			; 8E 00 0E | Store X register to absolute address
	STX $0000			; 8E 00 00 | Store X register to absolute address
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CLD				  ; D8 | Clear decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack
	DEY				  ; 88 | Decrement Y register
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	CPX $20			  ; E4 20 | Compare X register (zero page)
	INC $E2			  ; E6 E2 | Increment (zero page)
	INC $E2			  ; E6 E2 | Increment (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	JMP $C384C7		  ; 5C C7 84 C3 | Jump to address long
	LDA ($92,X)		  ; A1 92 | Read graphics status
	SEP #$F8			 ; E2 F8 | Set processor status bits
	DEY				  ; 88 | Decrement Y register
	SBC $FBC9,Y		  ; F9 C9 FB | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1FB
; Address: $E7F4B2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1FB:
	JSR $3800			; 20 00 38 | Jump to subroutine
	ORA $0700			; 0D 00 07 | Logical OR with accumulator (absolute)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STZ $D040			; 9C 40 D0 | Store zero to absolute
	CPY #$40			 ; C0 40 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1FC
; Address: $E7F4C6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1FC:
	BRA $80			  ; 80 80 | Branch always
	BMI $30			  ; 30 30 | Branch if negative
	BPL $10			  ; 10 10 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1FD
; Address: $E7F4D0
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1FD:
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	STZ $1CE3			; 9C E3 1C | Store zero to absolute
	XBA				  ; EB | Exchange accumulator bytes
	DEC $639D			; CE 9D 63 | Decrement (absolute)
	CMP $FF23,X		  ; DD 23 FF | Compare accumulator (absolute,X)
	STY $1CEF			; 8C EF 1C | Store Y register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	STZ $FEED,X		  ; 9E ED FE | Store zero to absolute,X
	STA ($F9,X)		  ; 81 F9 | Update graphics data
	ASL $EF			  ; 06 EF | Arithmetic shift left (zero page)
	ORA ($FE),Y		  ; 11 FE | Logical OR with accumulator ((zero page),Y)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	STZ $FE00,X		  ; 9E 00 FE | Store zero to absolute,X
	SED				  ; F8 | Set decimal mode flag
	INC $FF00			; EE 00 FF | Increment (absolute)
	LDA				  ; BF 61 9F 60 | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	BCC $90			  ; 90 90 | Branch if carry clear
	BCC $90			  ; 90 90 | Branch if carry clear
	STA ($1D,X)		  ; 81 1D | Update graphics data
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	ROR $1E00,X		  ; 7E 00 1E | Rotate right (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1FE
; Address: $E7F58B
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1FE:
	RTI				  ; 40 | Return from interrupt
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $00			  ; B0 00 | Branch if carry set
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	ASL $3E38			; 0E 38 3E | Arithmetic shift left (absolute)
	ORA $2A1C,X		  ; 1D 1C 2A | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ASL $3E00			; 0E 00 3E | Arithmetic shift left (absolute)
	ORA $2300,X		  ; 1D 00 23 | Logical OR with accumulator (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_1FF
; Address: $E7F5C5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_1FF:
	BRA $80			  ; 80 80 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BNE $E0			  ; D0 E0 | Game work RAM access
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_201
; Address: $E7F5DA
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_201:
	JSR $F000			; 20 00 F0 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	BRA $80			  ; 80 80 | Branch always
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_202
; Address: $E7F5ED
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_202:
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BMI $00			  ; 30 00 | Branch if negative
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	ORA $E1E6,Y		  ; 19 E6 E1 | Logical OR with accumulator (absolute,Y)
	STZ $81FE,X		  ; 9E FE 81 | Store zero to absolute,X
	INC $FE83,X		  ; FE 83 FE | Increment (absolute,X)
	STA $FC			  ; 85 FC | Update graphics data
	STA				  ; 9F F8 BB 60 | Update graphics data
	SBC $BF23,X		  ; FD 23 BF | Subtract with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDA ($EF,X)		  ; A1 EF | Read graphics status
	STA $2F8F7F		  ; 8F 7F 8F 2F | Update graphics data
	JMP $00E000		  ; 5C 00 E0 00 | Jump to address long
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_203
; Address: $E7F642
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_203:
	INC $7EF6,X		  ; FE F6 7E | Increment (absolute,X)
	ROR $9C9C,X		  ; 7E 9C 9C | Rotate right (absolute,X)
	STY $EC8C			; 8C 8C EC | Store Y register to absolute address
	CPX $9584			; EC 84 95 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_204
; Address: $E7F652
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_204:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_205
; Address: $E7F662
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_205:
	BRA $F0			  ; 80 F0 | Branch always
	BRA $B0			  ; 80 B0 | Branch always
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BCS $00			  ; B0 00 | Branch if carry set
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	ORA ($12),Y		  ; 11 12 | Logical OR with accumulator ((zero page),Y)
	ORA ($12),Y		  ; 11 12 | Logical OR with accumulator ((zero page),Y)
	ORA ($27),Y		  ; 11 27 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_206
; Address: $E7F692
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_206:
	JSR $2800			; 20 00 28 | Jump to subroutine
	JMP ($6C00)		  ; 6C 00 6C | Jump to address (absolute indirect)
	CLD				  ; D8 | Clear decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $DF70			; 8D 70 DF | Update graphics data
	ADC ($FE),Y		  ; 71 FE | Add with carry ((zero page),Y)
	SEP #$9D			 ; E2 9D | Set processor status bits
	SBC $FDFE,X		  ; FD FE FD | Subtract with carry (absolute,X)
	INC $00E1,X		  ; FE E1 00 | Increment (absolute,X)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($DF),Y		  ; 11 DF | Logical OR with accumulator ((zero page),Y)
	AND #$8F			 ; 29 8F | Logical AND with accumulator (immediate)
	STA $BE4774		  ; 8F 74 47 BE | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	DEC $C000			; CE 00 C0 | Decrement (absolute)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_207
; Address: $E7F6E8
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_207:
	INC $EFF1,X		  ; FE F1 EF | Increment (absolute,X)
	INX				  ; E8 | Increment X register
	SBC ($30),Y		  ; F1 30 | Subtract with carry ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	ASL $E100			; 0E 00 E1 | Arithmetic shift left (absolute)
	BVC $A4			  ; 50 A4 | Branch if overflow clear
	SEI				  ; 78 | Set interrupt disable flag
	STX $8C7C			; 8E 7C 8C | Store X register to absolute address
	CPY $DC3C			; CC 3C DC | Compare Y register (absolute)
	SBC ($61,X)		  ; E1 61 | Subtract with carry ((zero page,X))
	SBC ($61,X)		  ; E1 61 | Subtract with carry ((zero page,X))
	ASL $4F00,X		  ; 1E 00 4F | Arithmetic shift left (absolute,X)
	STZ $9E00,X		  ; 9E 00 9E | Store zero to absolute,X
	BCS $B0			  ; B0 B0 | Branch if carry set
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	BMI $30			  ; 30 30 | Branch if negative
	BVS $60			  ; 70 60 | Branch if overflow set
	BEQ $B8			  ; F0 B8 | Branch if equal
	BEQ $BC			  ; F0 BC | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $CE00			; CC 00 CE | Compare Y register (absolute)
	STX $0F00			; 8E 00 0F | Store X register to absolute address
	BRA $80			  ; 80 80 | Branch always
	BRA $B0			  ; 80 B0 | Branch always
	BVC $B8			  ; 50 B8 | Branch if overflow clear
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	BCS $98			  ; B0 98 | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $C0			  ; F0 C0 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_208
; Address: $E7F752
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_208:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_209
; Address: $E7F760
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_209:
	SBC $F37A,Y		  ; F9 7A F3 | Subtract with carry (absolute,Y)
	BMI $E3			  ; 30 E3 | Branch if negative
	SBC ($71),Y		  ; F1 71 | Subtract with carry ((zero page),Y)
	ORA $7D83,Y		  ; 19 83 7D | Logical OR with accumulator (absolute,Y)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	INC $E101,X		  ; FE 01 E1 | Increment (absolute,X)
	LDA ($CF,X)		  ; A1 CF | Read graphics status
	LDA $BFFF,Y		  ; B9 FF BF | Read graphics status
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	SBC $FCC1,Y		  ; F9 C1 FC | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_20A
; Address: $E7F7A5
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_20A:
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CLD				  ; D8 | Clear decimal mode flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ADC $7DC6,Y		  ; 79 C6 7D | Add with carry (absolute,Y)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FE),Y		  ; 11 FE | Logical OR with accumulator ((zero page),Y)
	AND $7DFE,Y		  ; 39 FE 7D | Logical AND with accumulator (absolute,Y)
	STA ($00,X)		  ; 81 00 | Update graphics data
	STA ($00,X)		  ; 81 00 | Update graphics data
	JMP $FE07FE		  ; 5C FE 07 FE | Jump to address long
	ORA ($79,X)		  ; 01 79 | Logical OR with accumulator ((zero page,X))
	STX $7F			  ; 86 7F | Store X register to zero page
	BRA $7F			  ; 80 7F | Branch always
	BRA $BF			  ; 80 BF | Branch always
	RTI				  ; 40 | Return from interrupt
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	ADC $7F00,Y		  ; 79 00 7F | Add with carry (absolute,Y)
	LDA				  ; BF 00 3C FF | Read graphics status
	PEA #$61BF		   ; F4 BF 61 | Push effective address to stack
	CMP $DD22,X		  ; DD 22 DD | Compare accumulator (absolute,X)
	SBC $001E,Y		  ; F9 1E 00 | Subtract with carry (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$71			 ; E0 71 | Compare X register (immediate)
	CPX #$71			 ; E0 71 | Compare X register (immediate)
	SBC ($6D,X)		  ; E1 6D | Subtract with carry ((zero page,X))
	SBC ($ED,X)		  ; E1 ED | Subtract with carry ((zero page,X))
	CPX #$EE			 ; E0 EE | Compare X register (immediate)
	CPX #$EE			 ; E0 EE | Compare X register (immediate)
	CPX #$EE			 ; E0 EE | Compare X register (immediate)
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	BPL $94			  ; 10 94 | Branch if positive
	STY $80			  ; 84 80 | Store Y register to zero page
	CPX $E080			; EC 80 E0 | Game work RAM access
	BRA $F0			  ; 80 F0 | Branch always
	SEC				  ; 38 | Set carry flag
	LDX $00EF,Y		  ; BE EF 00 | Load from absolute,Y into X register
	INC $9800,X		  ; FE 00 98 | Increment (absolute,X)
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	CPX #$DC			 ; E0 DC | Compare X register (immediate)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_20B
; Address: $E7F86C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_20B:
	STY $007F			; 8C 7F 00 | Store Y register to absolute address
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_20C
; Address: $E7F889
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_20C:
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP $9BD4			; 4C D4 9B | Jump to address
	DEY				  ; 88 | Decrement Y register
	STY $0000			; 8C 00 00 | Store Y register to absolute address
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_20D
; Address: $E7F898
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_20D:
	JSR $6200			; 20 00 62 | Jump to subroutine
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	INC $16F7			; EE F7 16 | Increment (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BMI $EF			  ; 30 EF | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $C601,X		  ; FE 01 C6 | Increment (absolute,X)
	AND $E39C,Y		  ; 39 9C E3 | Logical AND with accumulator (absolute,Y)
	STA $4FBFF3		  ; 8F F3 BF 4F | Update graphics data
	LDA				  ; BF 5F FF 3F | Read graphics status
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	ROL $0600,X		  ; 3E 00 06 | Rotate left (absolute,X)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	STZ $1E			  ; 64 1E | Store zero to zero page
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ASL $1800,X		  ; 1E 00 18 | Arithmetic shift left (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	SBC $FDFA,X		  ; FD FA FD | Subtract with carry (absolute,X)
	STA ($DF,X)		  ; 81 DF | Update graphics data
	BIT $6E9D			; 2C 9D 6E | Test bits in accumulator (absolute)
	STX $8E7F			; 8E 7F 8E | Store X register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 40 F9 06 | Read graphics status
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	STX $C1FE			; 8E FE C1 | Store X register to absolute address
	SBC $7F82,X		  ; FD 82 7F | Subtract with carry (absolute,X)
	LDY #$7F			 ; A0 7F | Load immediate value into Y register
	CLV				  ; B8 | Clear overflow flag
	LDA				  ; BF 00 F9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_20E
; Address: $E7F974
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_20E:
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	STA $EE1770		  ; 8F 70 17 EE | Update graphics data
	LDX $FB			  ; A6 FB | Load from zero page into X register
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $13			  ; F0 13 | Branch if equal
	BEQ $13			  ; F0 13 | Branch if equal
	BPL $E1			  ; 10 E1 | Branch if positive
	STY $78			  ; 84 78 | Store Y register to zero page
	CPY #$7C			 ; C0 7C | Compare Y register (immediate)
	ASL $0EF2			; 0E F2 0E | Arithmetic shift left (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDX $F602,Y		  ; BE 02 F6 | Load from absolute,Y into X register
	ASL $F6			  ; 06 F6 | Arithmetic shift left (zero page)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BPL $D0			  ; 10 D0 | Branch if positive
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_20F
; Address: $E7F9CE
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_20F:
	JSR $FE60			; 20 60 FE | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BVS $90			  ; 70 90 | Branch if overflow set
	BVS $90			  ; 70 90 | Branch if overflow set
	BNE $30			  ; D0 30 | Branch if not equal
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_210
; Address: $E7F9FA
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_210:
	JSR $6000			; 20 00 60 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_211
; Address: $E7FA0D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_211:
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	LDY $5B			  ; A4 5B | Load from zero page into Y register
	SBC $F906,X		  ; FD 06 F9 | Subtract with carry (absolute,X)
	BCS $4F			  ; B0 4F | Branch if carry set
	LDA ($4E),Y		  ; B1 4E | Read graphics status

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_213
; Address: $E7FA32
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_213:
	JSR $0200			; 20 00 02 | Jump to subroutine
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $7E			  ; 80 7E | Branch always
	SBC #$2F			 ; E9 2F | Subtract with carry (immediate)
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	CMP ($40,X)		  ; C1 40 | Compare accumulator ((zero page,X))
	CMP ($40,X)		  ; C1 40 | Compare accumulator ((zero page,X))
	STA ($30,X)		  ; 81 30 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_214
; Address: $E7FA54
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_214:
	JSR $3700			; 20 00 37 | Jump to subroutine
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	ROR $F000,X		  ; 7E 00 F0 | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BMI $F0			  ; 30 F0 | Branch if negative
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	RTI				  ; 40 | Return from interrupt
	CPY $E1			  ; C4 E1 | Compare Y register (zero page)
	SBC $FE80,X		  ; FD 80 FE | Subtract with carry (absolute,X)
	ROR $0E0E,X		  ; 7E 0E 0E | Rotate right (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Update graphics data
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0EEF,X		  ; 1E EF 0E | Arithmetic shift left (absolute,X)
	SBC ($ED,X)		  ; E1 ED | Subtract with carry ((zero page,X))
	SBC ($EC,X)		  ; E1 EC | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_215
; Address: $E7FACE
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_215:
	JSR $00FD			; 20 FD 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_216
; Address: $E7FADA
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_216:
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	DEC $CF00,X		  ; DE 00 CF | Decrement (absolute,X)
	BMI $EF			  ; 30 EF | Branch if negative
	BPL $E7			  ; 10 E7 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	BIT $BF			  ; 24 BF | Test bits in accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	PHA				  ; 48 | Push accumulator to stack
	CLV				  ; B8 | Clear overflow flag
	LDA				  ; BF FF DB FB | Read graphics status
	SBC $F879,Y		  ; F9 79 F8 | Subtract with carry (absolute,Y)
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	INC $00			  ; E6 00 | Increment (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	INC $F7E2,X		  ; FE E2 F7 | Increment (absolute,X)
	STA $87878F		  ; 8F 8F 87 87 | Update graphics data
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BVS $00			  ; 70 00 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $C0			  ; F0 C0 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	BMI $30			  ; 30 30 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	DEC $F000			; CE 00 F0 | Decrement (absolute)
	BMI $E0			  ; 30 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_217
; Address: $E7FB63
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_217:
	JSR $10F0			; 20 F0 10 | Jump to subroutine
	BEQ $80			  ; F0 80 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BRA $38			  ; 80 38 | Branch always
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_218
; Address: $E7FB6F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_218:
	CLV				  ; B8 | Clear overflow flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_21A
; Address: $E7FB7A
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_21A:
	JSR $2000			; 20 00 20 | Jump to subroutine
	ORA $070D			; 0D 0D 07 | Logical OR with accumulator (absolute)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	INC $E0DF			; EE DF E0 | Game work RAM access
	LDA				  ; BF C0 F1 6F | Read graphics status
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $00			  ; 80 00 | Branch always
	BIT $27			  ; 24 27 | Test bits in accumulator (zero page)
	AND $48FD,X		  ; 3D FD 48 | Logical AND with accumulator (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_21B
; Address: $E7FBE5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_21B:
	CPX $201F			; EC 1F 20 | Compare X register (absolute)
	CPY $FB			  ; C4 FB | Compare Y register (zero page)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_21C
; Address: $E7FC07
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_21C:
	JSR $639D			; 20 9D 63 | Jump to subroutine
	STA $A7			  ; 85 A7 | Update graphics data
	PHY				  ; 5A | Push Y register to stack
	LSR $C0			  ; 46 C0 | Logical shift right (zero page)
	ORA $7900,X		  ; 1D 00 79 | Logical OR with accumulator (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ROR $FF81,X		  ; 7E 81 FF | Rotate right (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	SBC $F94D,Y		  ; F9 4D F9 | Subtract with carry (absolute,Y)
	ORA $37FB			; 0D FB 37 | Logical OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_21D
; Address: $E7FC32
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_21D:
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_21E
; Address: $E7FC3A
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_21E:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC $F302,X		  ; FD 02 F3 | Subtract with carry (absolute,X)
	BNE $E3			  ; D0 E3 | Branch if not equal
	CPX #$FD			 ; E0 FD | Compare X register (immediate)
	PLX				  ; FA | Pull X register from stack
	SBC $EF72,X		  ; FD 72 EF | Subtract with carry (absolute,X)
	BCC $EF			  ; 90 EF | Branch if carry clear
	BPL $FE			  ; 10 FE | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STX $C73F			; 8E 3F C7 | Store X register to absolute address
	STA				  ; 9F 61 81 7F | Update graphics data
	SBC ($3E),Y		  ; F1 3E | Subtract with carry ((zero page),Y)
	SBC $FF16,Y		  ; F9 16 FF | Subtract with carry (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	STA ($00,X)		  ; 81 00 | Update graphics data
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$FC			 ; E0 FC | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_21F
; Address: $E7FCA3
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_21F:
	JSR $E3DF			; 20 DF E3 | Jump to subroutine
	SBC $7F39,Y		  ; F9 39 7F | Subtract with carry (absolute,Y)
	ADC $3F3F,X		  ; 7D 3F 3F | Add with carry (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	BCC $9F			  ; 90 9F | Branch if carry clear
	BRA $9F			  ; 80 9F | Branch always
	LDY $A8B3			; AC B3 A8 | Load from absolute address into Y register
	SBC $FC00,X		  ; FD 00 FC | Subtract with carry (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_221
; Address: $E7FCDC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_221:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BMI $30			  ; 30 30 | Branch if negative
	STA ($03,X)		  ; 81 03 | Update graphics data
	EOR ($C3,X)		  ; 41 C3 | Exclusive OR with accumulator ((zero page,X))
	EOR ($C3,X)		  ; 41 C3 | Exclusive OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_222
; Address: $E7FCE9
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_222:
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BMI $F4			  ; 30 F4 | Branch if negative
	BMI $F0			  ; 30 F0 | Branch if negative
	DEC $7E00			; CE 00 7E | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_223
; Address: $E7FCF4
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_223:
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	ASL $0C00			; 0E 00 0C | Arithmetic shift left (absolute)
	CPY $3C			  ; C4 3C | Compare Y register (zero page)
	CPY $163C			; CC 3C 16 | Compare Y register (absolute)
	INC $7ABE,X		  ; FE BE 7A | Increment (absolute,X)
	ASL $7FE3,X		  ; 1E E3 7F | Arithmetic shift left (absolute,X)
	STA ($8D,X)		  ; 81 8D | Update graphics data
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $10			  ; F0 10 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	CPY $A75F			; CC 5F A7 | Compare Y register (absolute)
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_224
; Address: $E7FD38
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_224:
	BMI $00			  ; 30 00 | Branch if negative
	BVC $00			  ; 50 00 | Branch if overflow clear
	BMI $00			  ; 30 00 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_225
; Address: $E7FD40
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_225:
	DEC $FCA6,X		  ; DE A6 FC | Decrement (absolute,X)
	STY $B8F8			; 8C F8 B8 | Store Y register to absolute address
	CLC				  ; 18 | Clear carry flag
	STA ($7E,X)		  ; 81 7E | Update graphics data
	INX				  ; E8 | Increment X register
	STX $0001			; 8E 01 00 | Store X register to absolute address
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_226
; Address: $E7FD5C
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_226:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	ASL $2707,X		  ; 1E 07 27 | Arithmetic shift left (absolute,X)
	BIT $2C0C			; 2C 0C 2C | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PLP				  ; 28 | Pull processor status from stack
	BPL $30			  ; 10 30 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $FF			  ; 80 FF | Branch always
	ASL $2C5F			; 0E 5F 2C | Arithmetic shift left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	RTI				  ; 40 | Return from interrupt
	BNE $07			  ; D0 07 | Branch if not equal
	LDA				  ; BF 00 9F 00 | Read graphics status
	STA				  ; 9F 00 9F 00 | Update graphics data
	ASL $3F00			; 0E 00 3F | Arithmetic shift left (absolute)
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	CMP ($BE,X)		  ; C1 BE | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_227
; Address: $E7FDA5
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_227:
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BMI $FD			  ; 30 FD | Branch if negative
	INY				  ; C8 | Increment Y register
	ROL $BE00,X		  ; 3E 00 BE | Rotate left (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F FF C7 FF | Update graphics data
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	BPL $EF			  ; 10 EF | Branch if positive
	ADC $6D93			; 6D 93 6D | Add with carry (absolute)
	STA ($7F,X)		  ; 81 7F | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BPL $00			  ; 10 00 | Branch if positive
	BCS $70			  ; B0 70 | Branch if carry set
	BCS $70			  ; B0 70 | Branch if carry set
	BCS $70			  ; B0 70 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_228
; Address: $E7FE07
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_228:
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_229
; Address: $E7FE10
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_229:
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	INC $F000,X		  ; FE 00 F0 | Increment (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ROL $D0C1,X		  ; 3E C1 D0 | Rotate left (absolute,X)
	BIT #$8E			 ; 89 8E | Test bits in accumulator (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_22B
; Address: $E7FE3C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_22B:
	JSR $7000			; 20 00 70 | Jump to subroutine
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_22E
; Address: $E7FE63
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_22E:
	JSR $20E3			; 20 E3 20 | Jump to subroutine
	INX				  ; E8 | Increment X register
	INC $FCEE,X		  ; FE EE FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $FF42,X		  ; FD 42 FF | Subtract with carry (absolute,X)
	BCC $FF			  ; 90 FF | Branch if carry clear
	BCC $FF			  ; 90 FF | Branch if carry clear
	LDA				  ; BF 4C FE 13 | Read graphics status
	AND $7F00,X		  ; 3D 00 7F | Logical AND with accumulator (absolute,X)
	ASL $E700,X		  ; 1E 00 E7 | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	EOR ($FE,X)		  ; 41 FE | Exclusive OR with accumulator ((zero page,X))
	BVS $FA			  ; 70 FA | Branch if overflow set
	PLX				  ; FA | Pull X register from stack
	INC $F702,X		  ; FE 02 F7 | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC $F900,X		  ; FD 00 F9 | Subtract with carry (absolute,X)
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	DEC $C46E			; CE 6E C4 | Decrement (absolute)
	CPX $7E			  ; E4 7E | Compare X register (zero page)
	CPX #$E6			 ; E0 E6 | Compare X register (immediate)
	BMI $36			  ; 30 36 | Branch if negative
	BMI $34			  ; 30 34 | Branch if negative
	BPL $14			  ; 10 14 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	ASL $CE00,X		  ; 1E 00 CE | Arithmetic shift left (absolute,X)
	CPY $EC00			; CC 00 EC | Compare Y register (absolute)
	PEA #$0000		   ; F4 00 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_22F
; Address: $E7FEE1
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_22F:
	JSR $3505			; 20 05 35 | Jump to subroutine
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	ASL $0700,X		  ; 1E 00 07 | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC $FFE6,Y		  ; F9 E6 FF | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	EOR ($41,X)		  ; 41 41 | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_230
; Address: $E7FF0C
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_230:
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	LDX $BF00,Y		  ; BE 00 BF | Load from absolute,Y into X register
	LDA				  ; BF 00 FE 69 | Read graphics status
	STZ $E36D,X		  ; 9E 6D E3 | Store zero to absolute,X
	CLD				  ; D8 | Clear decimal mode flag
	BCC $EF			  ; 90 EF | Branch if carry clear
	BNE $77			  ; D0 77 | Branch if not equal
	PHA				  ; 48 | Push accumulator to stack
	CPX $70			  ; E4 70 | Compare X register (zero page)
	LDA				  ; BF 47 FB 05 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	BPL $F8			  ; 10 F8 | Branch if positive
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPX $F800			; EC 00 F8 | Compare X register (absolute)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ROL $023D,X		  ; 3E 3D 02 | Rotate left (absolute,X)
	STA ($E2,X)		  ; 81 E2 | Update graphics data
	AND ($B3,X)		  ; 21 B3 | Logical AND with accumulator ((zero page,X))
	LDA				  ; BF 4F 00 00 | Read graphics status
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $22			  ; 80 22 | Branch always
	STZ $D040			; 9C 40 D0 | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_232
; Address: $E7FF8B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_232:
	JSR $70F0			; 20 F0 70 | Jump to subroutine
	BEQ $F0			  ; F0 F0 | Branch if equal
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_234
; Address: $E7FFA2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_234:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_235
; Address: $E7FFAF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_235:
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_236
; Address: $E7FFBE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_236:
	JSR $0300			; 20 00 03 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank4E_GraphicsFunction_237
; Address: $E7FFCF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank4E_GraphicsFunction_237:
	JSR $0000			; 20 00 00 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0E00			; 0D 00 0E | Logical OR with accumulator (absolute)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BPL $FF			  ; 10 FF | Branch if positive
	CPY #$F7			 ; C0 F7 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
