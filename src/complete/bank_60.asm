;==============================================================================
; Dragon Quest III - Bank $60
; Type: Dma
; Purpose: DMA operations and data transfer
; Address Range: $F00000-$F07FFF
; Instructions: 7378
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_60"

;------------------------------------------------------------------------------
; Bank60_DmaFunction_000
; Address: $F08002
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_000:
	ADC #$86			 ; 69 86 | Add with carry (immediate)
	STA ($0C),Y		  ; 91 0C | Store accumulator to (zero page),Y
	LDY $1B			  ; A4 1B | Load from zero page into Y register
	LSR $38			  ; 46 38 | Logical shift right (zero page)
	STZ $37			  ; 64 37 | Store zero to zero page
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	LDA $CA3F,Y		  ; B9 3F CA | Load from absolute,Y into accumulator
	LDX $DECB,Y		  ; BE CB DE | Load from absolute,Y into X register
	LDA $E5			  ; A5 E5 | Load from zero page into accumulator
	LSR $C27D,X		  ; 5E 7D C2 | Logical shift right (absolute,X)
	CPX $3B			  ; E4 3B | Compare X register (zero page)
	CPX $18			  ; E4 18 | Compare X register (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	STY $4A			  ; 84 4A | Store Y register to zero page
	CPY $21			  ; C4 21 | PPU graphics register access
	CPY #$3D			 ; C0 3D | Compare Y register (immediate)
	CPY #$1B			 ; C0 1B | Compare Y register (immediate)
	CPY #$1B			 ; C0 1B | Compare Y register (immediate)
	BCS $05			  ; B0 05 | Branch if carry set
	ADC $6D9A			; 6D 9A 6D | Add with carry (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	ADC $699A			; 6D 9A 69 | Add with carry (absolute)
	TXS				  ; 9A | Transfer X register to stack pointer
	PHP				  ; 08 | Push processor status to stack
	ASL $FFB9			; 0E B9 FF | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_003
; Address: $F08081
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_003:
	STY $EB			  ; 84 EB | Store Y register to zero page
	STY $AB			  ; 84 AB | Store Y register to zero page
	CPY $A1			  ; C4 A1 | Compare Y register (zero page)
	CPY $A3			  ; C4 A3 | Compare Y register (zero page)
	CPY $BB			  ; C4 BB | Compare Y register (zero page)
	CPY $93			  ; C4 93 | Compare Y register (zero page)
	CPY $82			  ; C4 82 | Compare Y register (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	STA ($03,X)		  ; 81 03 | Store accumulator to (zero page,X)
	ORA ($56,X)		  ; 01 56 | Logical OR with accumulator ((zero page,X))
	ORA ($5E,X)		  ; 01 5E | Logical OR with accumulator ((zero page,X))
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register
	STA $0F4F,Y		  ; 99 4F 0F | Store accumulator to absolute,Y
	ROR $5C3F,X		  ; 7E 3F 5C | Rotate right (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator
	BIT $1C			  ; 24 1C | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_004
; Address: $F080D0
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_004:
	ADC $EF06,Y		  ; 79 06 EF | Add with carry (absolute,Y)
	BPL $FF			  ; 10 FF | Branch if positive
	ROL $0FC0,X		  ; 3E C0 0F | Rotate left (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	ROR $1F03,X		  ; 7E 03 1F | Rotate right (absolute,X)
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	STA ($5E,X)		  ; 81 5E | Store accumulator to (zero page,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	INC $F201,X		  ; FE 01 F2 | Increment (absolute,X)
	STY $7E			  ; 84 7E | Store Y register to zero page
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	REP #$20			 ; C2 20 | Reset processor status bits
	SBC $F9E6,X		  ; FD E6 F9 | Subtract with carry (absolute,X)
	LSR $F1			  ; 46 F1 | Logical shift right (zero page)
	DEC $9DA1,X		  ; DE A1 9D | Decrement (absolute,X)
	REP #$3D			 ; C2 3D | Reset processor status bits
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC $EEED,X		  ; FD ED EE | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CMP $37C6,Y		  ; D9 C6 37 | Compare accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ROR $C411			; 6E 11 C4 | Rotate right (absolute)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $EF			  ; F0 EF | Branch if equal
	BEQ $DF			  ; F0 DF | Branch if equal
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $98			  ; 80 98 | Branch always
	ADC ($8E,X)		  ; 61 8E | Add with carry ((zero page,X))
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	LDY $5EA1			; AC A1 5E | Load from absolute address into Y register
	ROR $DB91			; 6E 91 DB | Rotate right (absolute)
	LDA $FF46,Y		  ; B9 46 FF | Load from absolute,Y into accumulator
	BPL $DF			  ; 10 DF | Branch if positive

;------------------------------------------------------------------------------
; Bank60_DmaFunction_005
; Address: $F08159
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_005:
	JSR $40BF			; 20 BF 40 | Jump to subroutine
	BRA $46			  ; 80 46 | Branch always
	LDA $F937,Y		  ; B9 37 F9 | Load from absolute,Y into accumulator
	SBC $F12E,Y		  ; F9 2E F1 | Subtract with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDY $DB			  ; A4 DB | Load from zero page into Y register
	LDA				  ; BF 48 B7 C8 | Load from absolute long,X into accumulator
	CPX #$06			 ; E0 06 | Compare X register (immediate)
	CPX #$06			 ; E0 06 | Compare X register (immediate)
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_006
; Address: $F0817C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_006:
	STX $08			  ; 86 08 | Store X register to zero page
	ASL $80			  ; 06 80 | Arithmetic shift left (zero page)
	LDA $388718		  ; AF 18 87 38 | Load from absolute long address into accumulator
	AND $1DDA			; 2D DA 1D | Logical AND with accumulator (absolute)
	NOP				  ; EA | No operation
	TYA				  ; 98 | Transfer Y register to accumulator
	ADC $3DC0			; 6D C0 3D | Add with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	LDA $A354,X		  ; BD 54 A3 | Load from absolute,X into accumulator
	AND $E2			  ; 25 E2 | Logical AND with accumulator (zero page)
	BPL $FF			  ; 10 FF | Branch if positive
	PHA				  ; 48 | Push accumulator to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank60_DmaFunction_007
; Address: $F081A8
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_007:
	ADC #$95			 ; 69 95 | Add with carry (immediate)
	STA $80B840		  ; 8F 40 B8 80 | Store accumulator to absolute long address
	CLI				  ; 58 | Clear interrupt disable flag
	STA				  ; 9F 40 94 40 | Store accumulator to absolute long,X
	RTI				  ; 40 | Return from interrupt
	LDY $9640,X		  ; BC 40 96 | Load from absolute,X into Y register
	PLA				  ; 68 | Pull accumulator from stack
	DEY				  ; 88 | Decrement Y register
	BVS $BF			  ; 70 BF | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	CLD				  ; D8 | Clear decimal mode flag
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ASL $FC00,X		  ; 1E 00 FC | Arithmetic shift left (absolute,X)
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	ROR $DD03,X		  ; 7E 03 DD | Rotate right (absolute,X)
	ASL $04E7,X		  ; 1E E7 04 | Arithmetic shift left (absolute,X)
	STA $001F00		  ; 8F 00 1F 00 | Store accumulator to absolute long address
	INC $FC00			; EE 00 FC | Increment (absolute)
	LDA $E2BB,X		  ; BD BB E2 | Load from absolute,X into accumulator
	SBC ($E3,X)		  ; E1 E3 | Subtract with carry ((zero page,X))
	LSR $07			  ; 46 07 | Logical shift right (zero page)
	STY $C700			; 8C 00 C7 | Store Y register to absolute address
	ADC $E700,X		  ; 7D 00 E7 | Add with carry (absolute,X)
	LDX $FE00,Y		  ; BE 00 FE | Load from absolute,Y into X register
	SED				  ; F8 | Set decimal mode flag
	SBC ($A1,X)		  ; E1 A1 | Subtract with carry ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	DEC $FC00,X		  ; DE 00 FC | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_008
; Address: $F08240
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_008:
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	STA $1082			; 8D 82 10 | Store accumulator to absolute address
	ORA #$70			 ; 09 70 | Logical OR with accumulator (immediate)
	ADC $FFFE,X		  ; 7D FE FF | Add with carry (absolute,X)
	SBC $FBFE,X		  ; FD FE FB | Subtract with carry (absolute,X)
	SBC $F0EF,Y		  ; F9 EF F0 | Subtract with carry (absolute,Y)
	CPX #$BF			 ; E0 BF | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $89			  ; 80 89 | Branch always
	SBC $EB14			; ED 14 EB | Subtract with carry (absolute)
	AND $D8D2			; 2D D2 D8 | Logical AND with accumulator (absolute)
	EOR #$60			 ; 49 60 | Exclusive OR with accumulator (immediate)
	STA				  ; 9F FB 04 FE | Store accumulator to absolute long,X
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ORA $18E7			; 0D E7 18 | Logical OR with accumulator (absolute)
	BMI $9F			  ; 30 9F | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_009
; Address: $F0827F
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_009:
	CPY #$E3			 ; C0 E3 | Compare Y register (immediate)
	INC $FEC7,X		  ; FE C7 FE | Increment (absolute,X)
	ASL $FEFD,X		  ; 1E FD FE | Arithmetic shift left (absolute,X)
	SBC $F9FE,X		  ; FD FE F9 | Subtract with carry (absolute,X)
	SBC $FA			  ; E5 FA | Subtract with carry (zero page)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $08			  ; F0 08 | Branch if equal
	LDA				  ; BF 4F 1F FF | Load from absolute long,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	STA				  ; 9F 3F FF FC | Store accumulator to absolute long,X
	BPL $0F			  ; 10 0F | Branch if positive

;------------------------------------------------------------------------------
; Bank60_DmaFunction_00A
; Address: $F082B5
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_00A:
	JSR $001F			; 20 1F 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BRA $7F			  ; 80 7F | Branch always
	ORA ($31,X)		  ; 01 31 | Logical OR with accumulator ((zero page,X))
	DEC $FE01			; CE 01 FE | Decrement (absolute)
	ORA ($6C,X)		  ; 01 6C | Logical OR with accumulator ((zero page,X))
	ORA ($AE,X)		  ; 01 AE | Logical OR with accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	SBC $FE02,X		  ; FD 02 FE | Subtract with carry (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC ($D0,X)		  ; E1 D0 | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_00C
; Address: $F082F5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_00C:
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $14			  ; 80 14 | Branch always
	ORA $1002			; 0D 02 10 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_00D
; Address: $F0830A
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_00D:
	JSL $1B641D		  ; 22 1D 64 1B | Jump to subroutine long
	CMP ($2E),Y		  ; D1 2E | Compare accumulator ((zero page),Y)
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	INC $FCFB,X		  ; FE FB FC | Increment (absolute,X)
	SBC $F0EF,Y		  ; F9 EF F0 | Subtract with carry (absolute,Y)
	CMP $BBE2,X		  ; DD E2 BB | Compare accumulator (absolute,X)
	CPY $6F			  ; C4 6F | Compare Y register (zero page)
	BCC $85			  ; 90 85 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	PEA #$7986		   ; F4 86 79 | Push effective address to stack
	BNE $5C			  ; D0 5C | Branch if not equal
	JMP $837C			; 4C 7C 83 | Jump to address
	INC $FC01,X		  ; FE 01 FC | Increment (absolute,X)
	ADC $F086,Y		  ; 79 86 F0 | Add with carry (absolute,Y)
	CPY $8333			; CC 33 83 | Compare Y register (absolute)
	PEA #$EBF5		   ; F4 F5 EB | Push effective address to stack
	BEQ $01			  ; F0 01 | Branch if equal
	CPX #$14			 ; E0 14 | Compare X register (immediate)
	CMP ($0A,X)		  ; C1 0A | Compare accumulator ((zero page,X))
	BRA $2C			  ; 80 2C | Branch always
	BRA $1C			  ; 80 1C | Branch always
	BPL $68			  ; 10 68 | Branch if positive
	BMI $48			  ; 30 48 | Branch if negative
	BVS $00			  ; 70 00 | Branch if overflow set
	INC $E000,X		  ; FE 00 E0 | Game work RAM access
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	SEP #$1D			 ; E2 1D | Set processor status bits
	BMI $FE			  ; 30 FE | Branch if negative
	SBC $FBFE,X		  ; FD FE FB | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX $DEF3			; EC F3 DE | Compare X register (absolute)
	SBC ($BD,X)		  ; E1 BD | Subtract with carry ((zero page,X))
	REP #$70			 ; C2 70 | Reset processor status bits
	STA $27748B		  ; 8F 8B 74 27 | Store accumulator to absolute long address
	CLD				  ; D8 | Clear decimal mode flag
	BMI $88			  ; 30 88 | Branch if negative
	ROL $D9			  ; 26 D9 | Rotate left (zero page)
	STA $7262,X		  ; 9D 62 72 | Store accumulator to absolute,X
	STA $30CF			; 8D CF 30 | Store accumulator to absolute address
	ORA #$DC			 ; 09 DC | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	BVS $8F			  ; 70 8F | Branch if overflow set
	CMP $6226,Y		  ; D9 26 62 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_00E
; Address: $F083BB
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_00E:
	STA $728D,X		  ; 9D 8D 72 | Store accumulator to absolute,X
	BMI $CF			  ; 30 CF | Branch if negative
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	INC $FEFD,X		  ; FE FD FE | Increment (absolute,X)
	PEA #$E0FF		   ; F4 FF E0 | Game work RAM access
	BEQ $C0			  ; F0 C0 | Branch if equal
	CPY $00			  ; C4 00 | Compare Y register (zero page)
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	STY $9800			; 8C 00 98 | Store Y register to absolute address
	SBC $9CFF,Y		  ; F9 FF 9C | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BNE $FF			  ; D0 FF | Branch if not equal
	PHX				  ; DA | Push X register to stack
	INC $03FF,X		  ; FE FF 03 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	STZ $BA01			; 9C 01 BA | Store zero to absolute
	ORA ($B6,X)		  ; 01 B6 | Logical OR with accumulator ((zero page,X))
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FB00,X		  ; FE 00 FB | Increment (absolute,X)
	STZ $FD			  ; 64 FD | Store zero to zero page
	LSR $FD			  ; 46 FD | Logical shift right (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	SBC $00DA,X		  ; FD DA 00 | Subtract with carry (absolute,X)
	BMI $B0			  ; 30 B0 | Branch if negative
	BPL $BF			  ; 10 BF | Branch if positive
	BCC $BC			  ; 90 BC | Branch if carry clear
	LDA				  ; BF 88 DC 0B | Load from absolute long,X into accumulator
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_00F
; Address: $F084BC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_00F:
	BVS $07			  ; 70 07 | Branch if overflow set
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_010
; Address: $F0851A
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_010:
	INC $07FF,X		  ; FE FF 07 | Increment (absolute,X)
	SBC ($FB),Y		  ; F1 FB | Subtract with carry ((zero page),Y)
	ORA #$3B			 ; 09 3B | Logical OR with accumulator (immediate)
	ORA #$FD			 ; 09 FD | Logical OR with accumulator (immediate)
	LDA $FE44,X		  ; BD 44 FE | Load from absolute,X into accumulator
	ASL $FFE2,X		  ; 1E E2 FF | Arithmetic shift left (absolute,X)
	ASL $F600			; 0E 00 F6 | Arithmetic shift left (absolute)
	CPX #$4B			 ; E0 4B | Compare X register (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal
	BEQ $E5			  ; F0 E5 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	BRA $99			  ; 80 99 | Branch always
	CPY #$41			 ; C0 41 | Compare Y register (immediate)
	CPY #$4F			 ; C0 4F | Compare Y register (immediate)
	ROR $80			  ; 66 80 | Rotate right (zero page)
	ROL $3080,X		  ; 3E 80 30 | Rotate left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	STA				  ; 9F FF 00 00 | Store accumulator to absolute long,X
	ORA $C700			; 0D 00 C7 | Logical OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_011
; Address: $F085C1
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_011:
	BCC $00			  ; 90 00 | Branch if carry clear
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	LDA $C700			; AD 00 C7 | Load from absolute address into accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CLD				  ; D8 | Clear decimal mode flag
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	SEC				  ; 38 | Set carry flag
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	LDY $C300			; AC 00 C3 | Load from absolute address into Y register
	BMI $00			  ; 30 00 | Branch if negative
	DEC $7100			; CE 00 71 | Decrement (absolute)
	CPX $EE00			; EC 00 EE | Compare X register (absolute)
	STX $53FF			; 8E FF 53 | Store X register to absolute address
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	STX $13FF			; 8E FF 13 | Store X register to absolute address
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	LDA $E900			; AD 00 E9 | Load from absolute address into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank60_DmaFunction_012
; Address: $F08610
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_012:
	INC $FEFB,X		  ; FE FB FE | Increment (absolute,X)
	INC $FE53,X		  ; FE 53 FE | Increment (absolute,X)
	INC $FE95,X		  ; FE 95 FE | Increment (absolute,X)
	STA $FF			  ; 85 FF | Store accumulator to zero page
	SEC				  ; 38 | Set carry flag
	STY $49DE			; 8C DE 49 | Store Y register to absolute address
	DEC $DE49,X		  ; DE 49 DE | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_013
; Address: $F08625
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_013:
	EOR $EE			  ; 45 EE | Exclusive OR with accumulator (zero page)
	ORA $6F			  ; 05 6F | Logical OR with accumulator (zero page)
	BIT $6F			  ; 24 6F | Test bits in accumulator (zero page)
	LDY $6F			  ; A4 6F | Load from zero page into Y register
	LDX #$6F			 ; A2 6F | Load immediate value into X register
	LDX #$B1			 ; A2 B1 | Load immediate value into X register
	LDA ($07),Y		  ; B1 07 | Load from (zero page),Y into accumulator
	LDA $F903,Y		  ; B9 03 F9 | Load from absolute,Y into accumulator
	CLD				  ; D8 | Clear decimal mode flag
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $815C81		  ; 5C 81 5C 81 | Jump to address long

;------------------------------------------------------------------------------
; Bank60_DmaFunction_014
; Address: $F08642
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_014:
	JSR $37DF			; 20 DF 37 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $EC13			; CC 13 EC | Compare Y register (absolute)
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	CPX $83			  ; E4 83 | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY $ECFF			; CC FF EC | Compare Y register (absolute)
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$FF			 ; E2 FF | Set processor status bits
	BRA $7F			  ; 80 7F | Branch always
	BRA $C7			  ; 80 C7 | Branch always
	SEC				  ; 38 | Set carry flag
	XBA				  ; EB | Exchange accumulator bytes
	PHP				  ; 08 | Push processor status to stack
	SEP #$1C			 ; E2 1C | Set processor status bits
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF FF 98 F8 | Load from absolute long,X into accumulator
	LDY $6CFC			; AC FC 6C | Load from absolute address into Y register
	BVS $F8			  ; 70 F8 | Branch if overflow set
	BVS $F8			  ; 70 F8 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	BCS $0F			  ; B0 0F | Branch if carry set
	BCC $0F			  ; 90 0F | Branch if carry clear
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	RTI				  ; 40 | Return from interrupt
	JMP $587F			; 4C 7F 58 | Jump to address
	EOR ($7F,X)		  ; 41 7F | Exclusive OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STZ $807F			; 9C 7F 80 | Store zero to absolute
	CPX #$C7			 ; E0 C7 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_016
; Address: $F086C9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_016:
	INC $FFC3,X		  ; FE C3 FF | Increment (absolute,X)
	SBC $01FF,Y		  ; F9 FF 01 | Subtract with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_017
; Address: $F086D2
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_017:
	JSR $BEDF			; 20 DF BE | Jump to subroutine
	EOR ($8A,X)		  ; 41 8A | Exclusive OR with accumulator ((zero page,X))
	CMP $3CC3			; CD C3 3C | Compare accumulator (absolute)
	SBC $0106,Y		  ; F9 06 01 | Subtract with carry (absolute,Y)
	STA				  ; 9F 61 8F 71 | Store accumulator to absolute long,X
	BMI $C7			  ; 30 C7 | Branch if negative
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP $F866			; 4C 66 F8 | Jump to address
	SED				  ; F8 | Set decimal mode flag
	LDA $99FE,Y		  ; B9 FE 99 | Load from absolute,Y into accumulator
	INC $FFDC,X		  ; FE DC FF | Increment (absolute,X)
	JMP $60FF			; 4C FF 60 | Jump to address
	ROL $60			  ; 26 60 | Rotate left (zero page)
	ROL $B0			  ; 26 B0 | Rotate left (zero page)
	BCS $93			  ; B0 93 | Branch if carry set
	CLD				  ; D8 | Clear decimal mode flag
	EOR #$D8			 ; 49 D8 | Exclusive OR with accumulator (immediate)
	EOR #$EC			 ; 49 EC | Exclusive OR with accumulator (immediate)
	BIT $EC			  ; 24 EC | Test bits in accumulator (zero page)
	BIT $C0			  ; 24 C0 | Test bits in accumulator (zero page)
	ORA $19C0,Y		  ; 19 C0 19 | Logical OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_019
; Address: $F08718
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_019:
	BCS $06			  ; B0 06 | Branch if carry set
	BCS $06			  ; B0 06 | Branch if carry set
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_01A
; Address: $F08727
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_01A:
	BMI $00			  ; 30 00 | Branch if negative
	BCC $00			  ; 90 00 | Branch if carry clear
	TYA				  ; 98 | Transfer Y register to accumulator
	INY				  ; C8 | Increment Y register
	CPY $F300			; CC 00 F3 | Compare Y register (absolute)
	STA				  ; 9F 00 CF 00 | Store accumulator to absolute long,X
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	BPL $1F			  ; 10 1F | Branch if positive

;------------------------------------------------------------------------------
; Bank60_DmaFunction_01B
; Address: $F0874B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_01B:
	JSR $003F			; 20 3F 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	BEQ $1F			  ; F0 1F | Branch if equal
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STZ $CEE3			; 9C E3 CE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank60_DmaFunction_01C
; Address: $F0876B
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_01C:
	SBC ($E0),Y		  ; F1 E0 | Game work RAM access
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BVS $8C			  ; 70 8C | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	DEC $00			  ; C6 00 | Decrement (zero page)
	STA $C7C78F		  ; 8F 8F C7 C7 | Store accumulator to absolute long address
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	ADC $0C00,X		  ; 7D 00 0C | Add with carry (absolute,X)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ROL $8200,X		  ; 3E 00 82 | Rotate left (absolute,X)
	SBC $FC00,Y		  ; F9 00 FC | Subtract with carry (absolute,Y)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	ROR $7300			; 6E 00 73 | Rotate right (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	JMP $00FF00		  ; 5C 00 FF 00 | Jump to address long
	STA ($FF),Y		  ; 91 FF | Store accumulator to (zero page),Y
	STY $36FF			; 8C FF 36 | Store Y register to absolute address
	BCC $FF			  ; 90 FF | Branch if carry clear

;------------------------------------------------------------------------------
; Bank60_DmaFunction_01D
; Address: $F087DF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_01D:
	JSR $3800			; 20 00 38 | Jump to subroutine
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	STA				  ; 9F FF C7 FF | Store accumulator to absolute long,X
	DEC $6DFF			; CE FF 6D | Decrement (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank60_DmaFunction_01E
; Address: $F087F9
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_01E:
	PHY				  ; 5A | Push Y register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_01F
; Address: $F08803
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_01F:
	SBC $1800,X		  ; FD 00 18 | Subtract with carry (absolute,X)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	DEC $4DFF,X		  ; DE FF 4D | Decrement (absolute,X)
	STZ $08FF			; 9C FF 08 | Store zero to absolute
	AND ($77,X)		  ; 21 77 | Logical AND with accumulator ((zero page,X))
	CMP ($3B),Y		  ; D1 3B | Compare accumulator ((zero page),Y)
	CMP #$3B			 ; C9 3B | Compare accumulator (immediate)
	CMP #$1B			 ; C9 1B | Compare accumulator (immediate)
	SBC #$1B			 ; E9 1B | Subtract with carry (immediate)
	INX				  ; E8 | Increment X register
	CPX $6C01			; EC 01 6C | Compare X register (absolute)
	STA ($2C,X)		  ; 81 2C | Store accumulator to (zero page,X)
	CMP ($2E,X)		  ; C1 2E | Compare accumulator ((zero page,X))
	CPY #$B6			 ; C0 B6 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank60_DmaFunction_022
; Address: $F08840
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_022:
	STA $8966,Y		  ; 99 66 89 | Store accumulator to absolute,Y
	STA $8D72			; 8D 72 8D | Store accumulator to absolute address
	BMI $CF			  ; 30 CF | Branch if negative
	BMI $CF			  ; 30 CF | Branch if negative
	BMI $C7			  ; 30 C7 | Branch if negative
	CLV				  ; B8 | Clear overflow flag
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	BMI $FC			  ; 30 FC | Branch if negative
	BMI $F0			  ; 30 F0 | Branch if negative
	BMI $F0			  ; 30 F0 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SBC $F1CE,Y		  ; F9 CE F1 | Subtract with carry (absolute,Y)
	ASL $0FF1			; 0E F1 0F | Arithmetic shift left (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $FC			  ; F0 FC | Branch if equal
	BEQ $06			  ; F0 06 | Branch if equal
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	ASL $0F00			; 0E 00 0F | Arithmetic shift left (absolute)
	AND ($E7,X)		  ; 21 E7 | Logical AND with accumulator ((zero page,X))
	AND ($E3,X)		  ; 21 E3 | Logical AND with accumulator ((zero page,X))
	ORA ($F3),Y		  ; 11 F3 | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	SBC $3C00,Y		  ; F9 00 3C | Subtract with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	ORA $1F00,X		  ; 1D 00 1F | Logical OR with accumulator (absolute,X)
	ASL $0E00,X		  ; 1E 00 0E | Arithmetic shift left (absolute,X)
	STA ($CF,X)		  ; 81 CF | Store accumulator to (zero page,X)
	BRA $C9			  ; 80 C9 | Branch always
	ORA ($1D,X)		  ; 01 1D | Logical OR with accumulator ((zero page,X))
	SBC ($F1,X)		  ; E1 F1 | Subtract with carry ((zero page,X))
	PEA #$3100		   ; F4 00 31 | Push effective address to stack
	RTI				  ; 40 | Return from interrupt
	STA $E88381		  ; 8F 81 83 E8 | Store accumulator to absolute long address
	SBC $E848,Y		  ; F9 48 E8 | Subtract with carry (absolute,Y)
	PEA #$24FC		   ; F4 FC 24 | Push effective address to stack
	PLY				  ; 7A | Pull Y register from stack
	INC $3A12,X		  ; FE 12 3A | Increment (absolute,X)
	LDY $01FE,X		  ; BC FE 01 | Load from absolute,X into Y register
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	STA $000300		  ; 8F 00 03 00 | Store accumulator to absolute long address
	STA ($91,X)		  ; 81 91 | Store accumulator to (zero page,X)
	STA ($D9),Y		  ; 91 D9 | Store accumulator to (zero page),Y
	CMP $D959,Y		  ; D9 59 D9 | Compare accumulator (absolute,Y)
	JMP $2CCC			; 4C CC 2C | Jump to address
	JMP ($6424)		  ; 6C 24 64 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_023
; Address: $F088EC
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_023:
	ASL $26			  ; 06 26 | Arithmetic shift left (zero page)
	STA ($6E),Y		  ; 91 6E | Store accumulator to (zero page),Y
	CMP $5926,Y		  ; D9 26 59 | Compare accumulator (absolute,Y)
	ROL $4C			  ; 26 4C | Rotate left (zero page)
	BIT $2493			; 2C 93 24 | Test bits in accumulator (absolute)
	ASL $D9			  ; 06 D9 | Arithmetic shift left (zero page)
	CMP $12F6			; CD F6 12 | Compare accumulator (absolute)
	ORA ($FB),Y		  ; 11 FB | Logical OR with accumulator ((zero page),Y)
	ORA #$FB			 ; 09 FB | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ADC $7D84,X		  ; 7D 84 7D | Add with carry (absolute,X)
	STY $3E			  ; 84 3E | Store Y register to zero page
	REP #$6C			 ; C2 6C | Reset processor status bits
	STA ($6C,X)		  ; 81 6C | Store accumulator to (zero page,X)
	STA ($2E,X)		  ; 81 2E | Store accumulator to (zero page,X)
	CPY #$36			 ; C0 36 | Compare Y register (immediate)
	CPY #$17			 ; C0 17 | Compare Y register (immediate)
	CPX #$9B			 ; E0 9B | Compare X register (immediate)
	CPX #$9B			 ; E0 9B | Compare X register (immediate)
	CPX #$CD			 ; E0 CD | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	STZ $00			  ; 64 00 | Store zero to zero page
	AND $9881,Y		  ; 39 81 98 | Logical AND with accumulator (absolute,Y)
	BRA $9C			  ; 80 9C | Branch always
	CPY #$4E			 ; C0 4E | Compare Y register (immediate)
	CPY #$46			 ; C0 46 | Compare Y register (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	CPY $C600			; CC 00 C6 | Compare Y register (absolute)
	ORA ($66,X)		  ; 01 66 | Logical OR with accumulator ((zero page,X))
	BRA $31			  ; 80 31 | Branch always
	BRA $39			  ; 80 39 | Branch always
	BRA $FC			  ; 80 FC | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $7F82,X		  ; FE 82 7F | Increment (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BRA $FC			  ; 80 FC | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $7F83,X		  ; FE 83 7F | Increment (absolute,X)
	CPY #$F9			 ; C0 F9 | Compare Y register (immediate)
	INC $FFFC,X		  ; FE FC FF | Increment (absolute,X)
	INC $7F7F,X		  ; FE 7F 7F | Increment (absolute,X)
	ROR $FE3F,X		  ; 7E 3F FE | Rotate right (absolute,X)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_024
; Address: $F08991
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_024:
	SEC				  ; 38 | Set carry flag
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $C000,X		  ; FE 00 C0 | Increment (absolute,X)
	BRA $60			  ; 80 60 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	CMP $FC00,X		  ; DD 00 FC | Compare accumulator (absolute,X)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	CMP $90FF,Y		  ; D9 FF 90 | Compare accumulator (absolute,Y)
	BIT $22FF			; 2C FF 22 | Test bits in accumulator (absolute)
	EOR #$77			 ; 49 77 | Exclusive OR with accumulator (immediate)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	EOR $DF00			; 4D 00 DF | Exclusive OR with accumulator (absolute)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ADC $20FF,Y		  ; 79 FF 20 | Add with carry (absolute,Y)
	SBC $BF02,X		  ; FD 02 BF | Subtract with carry (absolute,X)
	CPY $B2FF			; CC FF B2 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_025
; Address: $F089F9
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_025:
	JSR $41BF			; 20 BF 41 | Jump to subroutine
	STZ $BE00,X		  ; 9E 00 BE | Store zero to absolute,X
	ADC $FE00,X		  ; 7D 00 FE | Add with carry (absolute,X)
	INC $3F00,X		  ; FE 00 3F | Increment (absolute,X)
	STA				  ; 9F 00 FF FF | Store accumulator to absolute long,X
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	CPY $EF			  ; C4 EF | Compare Y register (zero page)
	AND ($DD,X)		  ; 21 DD | Logical AND with accumulator ((zero page,X))
	CPY #$F7			 ; C0 F7 | Compare Y register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	SBC $3B06,Y		  ; F9 06 3B | Subtract with carry (absolute,Y)
	INX				  ; E8 | Increment X register
	ORA $1DE4,X		  ; 1D E4 1D | Logical OR with accumulator (absolute,X)
	CPX $0D			  ; E4 0D | Compare X register (zero page)
	PEA #$F41D		   ; F4 1D F4 | Push effective address to stack
	AND $0EF4,X		  ; 3D F4 0E | Logical AND with accumulator (absolute,X)
	ASL $97F2			; 0E F2 97 | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_026
; Address: $F08A33
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_026:
	JSR $20DB			; 20 DB 20 | Jump to subroutine
	BMI $CB			  ; 30 CB | Branch if negative
	BMI $8B			  ; 30 8B | Branch if negative
	BVS $0D			  ; 70 0D | Branch if overflow set
	BEQ $6D			  ; F0 6D | Branch if equal
	BCC $C6			  ; 90 C6 | Branch if carry clear
	LDA $9CE3,Y		  ; B9 E3 9C | Load from absolute,Y into accumulator
	STZ $DCE3			; 9C E3 DC | Store zero to absolute
	JMP $F14EF1		  ; 5C F1 4E F1 | Jump to address long
	LSR $4EF1			; 4E F1 4E | Logical shift right (absolute)
	AND $1C7F,Y		  ; 39 7F 1C | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_027
; Address: $F08A58
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_027:
	STZ $8E3F			; 9C 3F 8E | Store zero to absolute
	STX $8E3F			; 8E 3F 8E | Store X register to absolute address
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	LDA $9FBF,X		  ; BD BF 9F | Load from absolute,X into accumulator
	STA				  ; 9F 9F 9F 00 | Store accumulator to absolute long,X
	RTI				  ; 40 | Return from interrupt
	SEC				  ; 38 | Set carry flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	LDA $9F42,X		  ; BD 42 9F | Load from absolute,X into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_028
; Address: $F08A7E
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_028:
	STA				  ; 9F 60 08 F9 | Store accumulator to absolute long,X
	STA $847D			; 8D 7D 84 | Store accumulator to absolute address
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	ASL $8F00			; 0E 00 8F | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	STY $60			  ; 84 60 | Store Y register to zero page
	BPL $E2			  ; 10 E2 | Branch if positive
	BVC $A1			  ; 50 A1 | Branch if overflow clear
	SEP #$E3			 ; E2 E3 | Set processor status bits
	ADC ($63,X)		  ; 61 63 | Add with carry ((zero page,X))
	CPY #$05			 ; C0 05 | Compare Y register (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INC $FC01,X		  ; FE 01 FC | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	BVS $F8			  ; 70 F8 | Branch if overflow set
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ASL $FFFF,X		  ; 1E FF FF | Arithmetic shift left (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	REP #$FF			 ; C2 FF | Reset processor status bits
	ASL $00FF,X		  ; 1E FF 00 | Arithmetic shift left (absolute,X)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($C2,X)		  ; 01 C2 | Logical OR with accumulator ((zero page,X))
	AND $7333,X		  ; 3D 33 73 | Logical AND with accumulator (absolute,X)
	SBC #$F9			 ; E9 F9 | Subtract with carry (immediate)
	STA ($F9,X)		  ; 81 F9 | Store accumulator to (zero page,X)
	BIT $ACFC			; 2C FC AC | Test bits in accumulator (absolute)
	ROR $33FE			; 6E FE 33 | Rotate right (absolute)
	STY $245B			; 8C 5B 24 | Store Y register to absolute address
	SBC #$16			 ; E9 16 | Subtract with carry (immediate)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	BIT $ACD3			; 2C D3 AC | Test bits in accumulator (absolute)
	ROR $3E91			; 6E 91 3E | Rotate right (absolute)
	REP #$1F			 ; C2 1F | Reset processor status bits
	SBC ($9F,X)		  ; E1 9F | Subtract with carry ((zero page,X))
	ADC ($9F,X)		  ; 61 9F | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_02A
; Address: $F08B08
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_02A:
	STA $30CF70		  ; 8F 70 CF 30 | Store accumulator to absolute long address
	SEC				  ; 38 | Set carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CMP $E6F0			; CD F0 E6 | Compare accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	ROR $F8			  ; 66 F8 | Rotate right (zero page)
	AND $99FE,Y		  ; 39 FE 99 | Logical AND with accumulator (absolute,Y)
	INC $27E0,X		  ; FE E0 27 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_02B
; Address: $F08B24
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_02B:
	BVS $13			  ; 70 13 | Branch if overflow set
	BCS $91			  ; B0 91 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	BIT #$D8			 ; 89 D8 | Test bits in accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	CPX $C024			; EC 24 C0 | Compare X register (absolute)
	CLC				  ; 18 | Clear carry flag
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_02C
; Address: $F08B37
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_02C:
	ASL $0670			; 0E 70 06 | Arithmetic shift left (absolute)
	BCS $07			  ; B0 07 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_02D
; Address: $F08B41
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_02D:
	JSR $300F			; 20 0F 30 | Jump to subroutine
	STZ $CE03			; 9C 03 CE | Store zero to absolute
	ORA ($CD,X)		  ; 01 CD | Logical OR with accumulator ((zero page,X))
	INC $00			  ; E6 00 | Increment (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	STZ $03			  ; 64 03 | Store zero to zero page
	ORA ($33,X)		  ; 01 33 | Logical OR with accumulator ((zero page,X))
	ORA $9900,Y		  ; 19 00 99 | Logical OR with accumulator (absolute,Y)
	STY $FFFC			; 8C FC FF | Store Y register to absolute address
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SBC ($7E),Y		  ; F1 7E | Subtract with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_02E
; Address: $F08B78
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_02E:
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_02F
; Address: $F08BBA
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_02F:
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	LDA $BD00,X		  ; BD 00 BD | Load from absolute,X into accumulator
	BPL $F7			  ; 10 F7 | Branch if positive
	BPL $F7			  ; 10 F7 | Branch if positive
	EOR $4EA6,X		  ; 5D A6 4E | Exclusive OR with accumulator (absolute,X)
	LSR $CEF3			; 4E F3 CE | Logical shift right (absolute)
	AND $1CEB,Y		  ; 39 EB 1C | Logical AND with accumulator (absolute,Y)
	PLB				  ; AB | Pull data bank register from stack
	LDA $B146,Y		  ; B9 46 B1 | Load from absolute,Y into accumulator
	LSR $7300			; 4E 00 73 | Logical shift right (absolute)
	LDA				  ; BF 00 FD 00 | Load from absolute long,X into accumulator
	SBC $FF08,X		  ; FD 08 FF | Subtract with carry (absolute,X)
	STZ $6ADD			; 9C DD 6A | Store zero to absolute
	LDY $6A			  ; A4 6A | Load from zero page into Y register
	ROR				  ; 6A | Rotate right (accumulator)
	STA $A71BE6		  ; 8F E6 1B A7 | Store accumulator to absolute long address
	CLI				  ; 58 | Clear interrupt disable flag
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	LDY $DE53,X		  ; BC 53 DE | Load from absolute,X into Y register
	LDA ($DD,X)		  ; A1 DD | Load from (zero page,X) into accumulator
	PLX				  ; FA | Pull X register from stack
	EOR $EA			  ; 45 EA | Exclusive OR with accumulator (zero page)
	JMP $954CB3		  ; 5C B3 4C 95 | Jump to address long
	ROR				  ; 6A | Rotate right (accumulator)
	ASL $16FA			; 0E FA 16 | Arithmetic shift left (absolute)
	PLX				  ; FA | Pull X register from stack
	ADC $790F,Y		  ; 79 0F 79 | Add with carry (absolute,Y)
	SBC $FD03,Y		  ; F9 03 FD | Subtract with carry (absolute,Y)
	SBC $FC07,X		  ; FD 07 FC | Subtract with carry (absolute,X)
	CMP $38			  ; C5 38 | Compare accumulator (zero page)
	STA $78			  ; 85 78 | Store accumulator to zero page
	LDX $D8			  ; A6 D8 | Load from zero page into X register
	LDX $D8			  ; A6 D8 | Load from zero page into X register
	INC $18			  ; E6 18 | Increment (zero page)
	BIT $CC32			; 2C 32 CC | Test bits in accumulator (absolute)
	SBC ($2E),Y		  ; F1 2E | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	LDY $CE93,X		  ; BC 93 CE | Load from absolute,X into Y register
	STZ $CF9F			; 9C 9F CF | Store zero to absolute
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	STZ $CF63			; 9C 63 CF | Store zero to absolute

;------------------------------------------------------------------------------
; Bank60_DmaFunction_030
; Address: $F08C73
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_030:
	BMI $CF			  ; 30 CF | Branch if negative
	BMI $C0			  ; 30 C0 | Branch if negative
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	CMP ($E1,X)		  ; C1 E1 | Compare accumulator ((zero page,X))
	EOR ($F1),Y		  ; 51 F1 | Exclusive OR with accumulator ((zero page),Y)
	AND ($F1),Y		  ; 31 F1 | Logical AND with accumulator ((zero page),Y)
	LDA ($E1,X)		  ; A1 E1 | Load from (zero page,X) into accumulator
	STA				  ; 9F 00 1F 00 | Store accumulator to absolute long,X
	BRA $3F			  ; 80 3F | Branch always
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	LDY $1EFF,X		  ; BC FF 1E | Load from absolute,X into Y register
	BVS $FF			  ; 70 FF | Branch if overflow set
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	LDY $1E43,X		  ; BC 43 1E | Load from absolute,X into Y register
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BVS $8F			  ; 70 8F | Branch if overflow set
	ASL $3EFE,X		  ; 1E FE 3E | Arithmetic shift left (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BVS $F0			  ; 70 F0 | Branch if overflow set
	BVS $F0			  ; 70 F0 | Branch if overflow set
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $3EE1,X		  ; 1E E1 3E | Arithmetic shift left (absolute,X)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BVS $8F			  ; 70 8F | Branch if overflow set
	BVS $8F			  ; 70 8F | Branch if overflow set
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY $CE31			; CC 31 CE | Compare Y register (absolute)
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	SBC $8006,Y		  ; F9 06 80 | Subtract with carry (absolute,Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	CPY $CEFF			; CC FF CE | Compare Y register (absolute)
	DEC $06FF			; CE FF 06 | Decrement (absolute)
	INC $EE22			; EE 22 EE | Increment (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_031
; Address: $F08D23
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_031:
	JSL $F711F7		  ; 22 F7 11 F7 | Jump to subroutine long
	ORA ($FB),Y		  ; 11 FB | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	SBC $FD04,X		  ; FD 04 FD | Subtract with carry (absolute,X)
	ORA ($DC,X)		  ; 01 DC | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_032
; Address: $F08D33
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_032:
	ORA ($EE,X)		  ; 01 EE | Logical OR with accumulator ((zero page,X))
	ROR $7780			; 6E 80 77 | Rotate right (absolute)
	BRA $37			  ; 80 37 | Branch always
	CPY #$3B			 ; C0 3B | Compare Y register (immediate)
	CPY #$1B			 ; C0 1B | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	AND $3900,Y		  ; 39 00 39 | Logical AND with accumulator (absolute,Y)
	ASL $8E80,X		  ; 1E 80 8E | Arithmetic shift left (absolute,X)
	BRA $87			  ; 80 87 | Branch always
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC $00			  ; C6 00 | Decrement (zero page)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BRA $3C			  ; 80 3C | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROR $7F00,X		  ; 7E 00 7F | Rotate right (absolute,X)
	SBC $FC00,Y		  ; F9 00 FC | Subtract with carry (absolute,Y)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BRA $00			  ; 80 00 | Branch always
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	LDA ($FF,X)		  ; A1 FF | Load from (zero page,X) into accumulator
	LDA $5A			  ; A5 5A | Load from zero page into accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	JMP $42B3			; 4C B3 42 | Hardware register operation
	LDA $FF00,X		  ; BD 00 FF | Load from absolute,X into accumulator

;------------------------------------------------------------------------------
; Bank60_DmaFunction_033
; Address: $F08E04
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_033:
	JSL $FF62FF		  ; 22 FF 62 FF | Jump to subroutine long
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	TYA				  ; 98 | Transfer Y register to accumulator
	BPL $EF			  ; 10 EF | Branch if positive
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	LDA ($FE,X)		  ; A1 FE | Load from (zero page,X) into accumulator
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	STZ $6C93			; 9C 93 6C | Store zero to absolute
	STA $0966,Y		  ; 99 66 09 | Store accumulator to absolute,Y
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_034
; Address: $F08E40
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_034:
	LDY $BF8B,X		  ; BC 8B BF | Load from absolute,X into Y register
	DEY				  ; 88 | Decrement Y register
	STZ $DE89,X		  ; 9E 89 DE | Store zero to absolute,X
	EOR #$DF			 ; 49 DF | Exclusive OR with accumulator (immediate)
	BVS $07			  ; 70 07 | Branch if overflow set
	ADC ($07),Y		  ; 71 07 | Add with carry ((zero page),Y)
	LDA ($07),Y		  ; B1 07 | Load from (zero page),Y into accumulator
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	BEQ $0F			  ; F0 0F | Branch if equal
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F 60 1E E1 | Store accumulator to absolute long,X
	ASL $FFF1			; 0E F1 FF | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_035
; Address: $F08EB2
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_035:
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $1DE0,X		  ; 1D E0 1D | Logical OR with accumulator (absolute,X)
	CPX #$8C			 ; E0 8C | Compare X register (immediate)
	BEQ $8E			  ; F0 8E | Branch if equal
	BEQ $06			  ; F0 06 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$63			 ; E0 63 | Compare X register (immediate)
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BVS $31			  ; 70 31 | Branch if overflow set
	BVS $10			  ; 70 10 | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	TYA				  ; 98 | Transfer Y register to accumulator
	CLV				  ; B8 | Clear overflow flag
	DEY				  ; 88 | Decrement Y register
	STA $8000DF		  ; 8F DF 00 80 | Store accumulator to absolute long address
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_036
; Address: $F08EFA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_036:
	BVS $07			  ; 70 07 | Branch if overflow set
	BVS $00			  ; 70 00 | Branch if overflow set
	INC $0F00,X		  ; FE 00 0F | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	SEC				  ; 38 | Set carry flag
	SBC $1CFF,X		  ; FD FF 1C | Subtract with carry (absolute,X)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_038
; Address: $F08F8D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_038:
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_03A
; Address: $F08FB7
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_03A:
	BMI $F8			  ; 30 F8 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	ORA $1904,Y		  ; 19 04 19 | Logical OR with accumulator (absolute,Y)
	ORA $7B04,Y		  ; 19 04 7B | Logical OR with accumulator (absolute,Y)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FCFC,X		  ; FE FC FC | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA ($D6,X)		  ; 01 D6 | Logical OR with accumulator ((zero page,X))
	ORA ($9C,X)		  ; 01 9C | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STX $86			  ; 86 86 | Store X register to zero page
	STX $86			  ; 86 86 | Store X register to zero page
	ASL $010E			; 0E 0E 01 | Arithmetic shift left (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ADC $90			  ; 65 90 | Add with carry (zero page)
	ADC $90			  ; 65 90 | Add with carry (zero page)
	ASL $76F1			; 0E F1 76 | Arithmetic shift left (absolute)
	SBC $0CF9,Y		  ; F9 F9 0C | Subtract with carry (absolute,Y)
	SBC $3306,Y		  ; F9 06 33 | Subtract with carry (absolute,Y)
	ORA $1919,Y		  ; 19 19 19 | Logical OR with accumulator (absolute,Y)
	ORA $7F7F,Y		  ; 19 7F 7F | Logical OR with accumulator (absolute,Y)
	INC $F3EE			; EE EE F3 | Increment (absolute)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ADC $EE00,Y		  ; 79 00 EE | Add with carry (absolute,Y)
	ORA ($BF),Y		  ; 11 BF | Logical OR with accumulator ((zero page),Y)
	ROL $797F,X		  ; 3E 7F 79 | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 00 BC 00 | Store accumulator to absolute long,X
	EOR ($C1,X)		  ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
	ROL $86			  ; 26 86 | Rotate left (zero page)
	BRA $33			  ; 80 33 | Branch always
	BRA $1C			  ; 80 1C | Branch always
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $F2F2,X		  ; FE F2 F2 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_03C
; Address: $F09091
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_03C:
	SED				  ; F8 | Set decimal mode flag
	ADC $053A,X		  ; 7D 3A 05 | Add with carry (absolute,X)
	DEC $01			  ; C6 01 | Decrement (zero page)
	STZ $B201,X		  ; 9E 01 B2 | Store zero to absolute,X
	ORA $9F60			; 0D 60 9F | Logical OR with accumulator (absolute)
	ROR $FEFE,X		  ; 7E FE FE | Rotate right (absolute,X)
	INC $FC7C,X		  ; FE 7C FC | Increment (absolute,X)
	LDX $3E81,Y		  ; BE 81 3E | Load from absolute,Y into X register
	ORA ($F4,X)		  ; 01 F4 | Logical OR with accumulator ((zero page,X))
	BRA $C0			  ; 80 C0 | Branch always
	BRA $72			  ; 80 72 | Branch always
	BRA $09			  ; 80 09 | Branch always
	INC $00			  ; E6 00 | Increment (zero page)
	BRA $00			  ; 80 00 | Branch always
	ORA $76FF			; 0D FF 76 | Logical OR with accumulator (absolute)
	ORA $4DFF,Y		  ; 19 FF 4D | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_03D
; Address: $F090E9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_03D:
	JSR $4900			; 20 00 49 | Jump to subroutine
	BMI $00			  ; 30 00 | Branch if negative
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_03E
; Address: $F0910B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_03E:
	DEC $00			  ; C6 00 | Decrement (zero page)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	ORA $00FF,Y		  ; 19 FF 00 | Logical OR with accumulator (absolute,Y)
	STA				  ; 9F FF 39 FF | Store accumulator to absolute long,X
	DEC $E6FF			; CE FF E6 | Decrement (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	LDY $00			  ; A4 00 | Load from zero page into Y register
	CLC				  ; 18 | Clear carry flag
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_03F
; Address: $F0914B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_03F:
	DEC $00			  ; C6 00 | Decrement (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	ORA $00FF,Y		  ; 19 FF 00 | Logical OR with accumulator (absolute,Y)
	STA				  ; 9F FF 39 FF | Store accumulator to absolute long,X
	INC $00			  ; E6 00 | Increment (zero page)
	ORA ($73,X)		  ; 01 73 | Logical OR with accumulator ((zero page,X))
	ORA ($9F,X)		  ; 01 9F | Logical OR with accumulator ((zero page,X))
	LSR $EE03			; 4E 03 EE | Logical shift right (absolute)
	INC $FE8C,X		  ; FE 8C FE | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_040
; Address: $F0917C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_040:
	SBC $FDB0,X		  ; FD B0 FD | Subtract with carry (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	STA $DC90DF		  ; 8F DF 90 DC | Store accumulator to absolute long address
	BCC $BF			  ; 90 BF | Branch if carry clear
	LDA				  ; BF 2D 7F 4F | Load from absolute long,X into accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	BVS $00			  ; 70 00 | Branch if overflow set
	LDA				  ; BF 00 BF 07 | Load from absolute long,X into accumulator
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_041
; Address: $F091AF
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_041:
	BMI $FF			  ; 30 FF | Branch if negative
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $09FF,X		  ; FE FF 09 | Increment (absolute,X)
	INC $FF			  ; E6 FF | Increment (zero page)
	STZ $00FF,X		  ; 9E FF 00 | Store zero to absolute,X
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $61FF,Y		  ; 19 FF 61 | Logical OR with accumulator (absolute,Y)
	BNE $FF			  ; D0 FF | Branch if not equal
	INC				  ; 1A | Increment accumulator
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_042
; Address: $F0922F
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_042:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	INC $0D0C,X		  ; FE 0C 0D | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	SBC $FDF9,X		  ; FD F9 FD | Subtract with carry (absolute,X)
	AND $F1FD,Y		  ; 39 FD F1 | Logical AND with accumulator (absolute,Y)
	BMI $FF			  ; 30 FF | Branch if negative
	CPY #$EE			 ; C0 EE | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	AND $5D80,Y		  ; 39 80 5D | Logical AND with accumulator (absolute,Y)
	BRA $6D			  ; 80 6D | Branch always
	STZ $FF			  ; 64 FF | Store zero to zero page
	BRA $00			  ; 80 00 | Branch always
	ROL $BF			  ; 26 BF | Rotate left (zero page)
	LDA				  ; BF 52 BF 5B | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank60_DmaFunction_043
; Address: $F09281
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_043:
	JSR $4F00			; 20 00 4F | Jump to subroutine
	LDY $2400			; AC 00 24 | Load from absolute address into Y register
	LDA $C700			; AD 00 C7 | Load from absolute address into accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	BCS $FF			  ; B0 FF | Branch if carry set
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_044
; Address: $F092A9
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_044:
	DEC $7100			; CE 00 71 | Decrement (absolute)
	CPX $EE00			; EC 00 EE | Compare X register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STA				  ; 9F FF 31 FF | Store accumulator to absolute long,X
	STX $13FF			; 8E FF 13 | Store X register to absolute address
	ORA ($06),Y		  ; 11 06 | Logical OR with accumulator ((zero page),Y)
	ASL $BC			  ; 06 BC | Arithmetic shift left (zero page)
	ORA $0DF9			; 0D F9 0D | Logical OR with accumulator (absolute)
	AND $B21B,Y		  ; 39 1B B2 | Logical AND with accumulator (absolute,Y)
	CPX $37			  ; E4 37 | Compare X register (zero page)
	CPX $FB			  ; E4 FB | Compare X register (zero page)
	BRA $FB			  ; 80 FB | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_045
; Address: $F092D3
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_045:
	RTI				  ; 40 | Return from interrupt
	CPY #$ED			 ; C0 ED | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	SBC $DB00			; ED 00 DB | Subtract with carry (absolute)
	STA $91FF,Y		  ; 99 FF 91 | Store accumulator to absolute,Y
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	CPY $067F			; CC 7F 06 | Compare Y register (absolute)
	ASL $0CFF			; 0E FF 0C | Arithmetic shift left (absolute)
	ORA $19FF,X		  ; 1D FF 19 | Logical OR with accumulator (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ADC $7AFF,X		  ; 7D FF 7A | Add with carry (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SBC $82FF,Y		  ; F9 FF 82 | Subtract with carry (absolute,Y)
	STA $FF			  ; 85 FF | Store accumulator to zero page
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	INY				  ; C8 | Increment Y register
	CPX $76FF			; EC FF 76 | Compare X register (absolute)
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	STA $37FF,X		  ; 9D FF 37 | Store accumulator to absolute,X
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	SBC #$FF			 ; E9 FF | Subtract with carry (immediate)
	STZ $4CFF,X		  ; 9E FF 4C | Store zero to absolute,X
	EOR $66FF			; 4D FF 66 | Exclusive OR with accumulator (absolute)
	BVS $FF			  ; 70 FF | Branch if overflow set
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	STA $8FFF,Y		  ; 99 FF 8F | Store accumulator to absolute,Y
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_046
; Address: $F0935F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_046:
	BRA $FF			  ; 80 FF | Branch always
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_047
; Address: $F0936D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_047:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_048
; Address: $F0937F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_048:
	JSR $3EFF			; 20 FF 3E | Jump to subroutine
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	CPY $CCFF			; CC FF CC | Compare Y register (absolute)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_049
; Address: $F093A9
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_049:
	CPX $F6			  ; E4 F6 | Compare X register (zero page)
	SBC $F6			  ; E5 F6 | Subtract with carry (zero page)
	CMP $F6			  ; C5 F6 | Compare accumulator (zero page)
	CMP $ED			  ; C5 ED | Compare accumulator (zero page)
	BRA $ED			  ; 80 ED | Branch always
	BRA $DD			  ; 80 DD | Branch always
	BRA $DF			  ; 80 DF | Branch always
	BRA $DB			  ; 80 DB | Branch always
	PHX				  ; DA | Push X register to stack
	ORA ($BA,X)		  ; 01 BA | Logical OR with accumulator ((zero page,X))
	ORA ($BA,X)		  ; 01 BA | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BNE $00			  ; D0 00 | Branch if not equal
	DEC $E300,X		  ; DE 00 E3 | Decrement (absolute,X)
	DEC $DF7F			; CE 7F DF | Decrement (absolute)
	LDA $7FCA7F		  ; AF 7F CA 7F | Load from absolute long address into accumulator
	INX				  ; E8 | Increment X register
	LDA #$7F			 ; A9 7F | Load immediate value into accumulator
	LDA ($FF,X)		  ; A1 FF | Load from (zero page,X) into accumulator
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	STX $3500			; 8E 00 35 | Store X register to absolute address
	STX $3700			; 8E 00 37 | Store X register to absolute address
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	DEX				  ; CA | Decrement X register
	STY $71FF			; 8C FF 71 | Store Y register to absolute address
	INY				  ; C8 | Increment Y register
	DEY				  ; 88 | Decrement Y register
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	ORA $F6FF,Y		  ; 19 FF F6 | Logical OR with accumulator (absolute,Y)
	BIT $95FF			; 2C FF 95 | Test bits in accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	INC $00			  ; E6 00 | Increment (zero page)
	CPY $6900			; CC 00 69 | Compare Y register (absolute)
	SBC $F500,Y		  ; F9 00 F5 | Subtract with carry (absolute,Y)
	LDX $FD00,Y		  ; BE 00 FD | Load from absolute,Y into X register
	STA				  ; 9F 66 FF 0A | Store accumulator to absolute long,X
	CMP ($37,X)		  ; C1 37 | Compare accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	DEC $9300			; CE 00 93 | Decrement (absolute)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	BIT #$FD			 ; 89 FD | Test bits in accumulator (immediate)
	JMP ($DBFF)		  ; 6C FF DB | Jump to address (absolute indirect)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	CMP $DF			  ; C5 DF | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_04A
; Address: $F0945D
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_04A:
	JSR $946F			; 20 6F 94 | Jump to subroutine
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	LDY $C300			; AC 00 C3 | Load from absolute address into Y register
	BMI $00			  ; 30 00 | Branch if negative
	DEC $7100			; CE 00 71 | Decrement (absolute)
	CPX $EE00			; EC 00 EE | Compare X register (absolute)
	STX $53FF			; 8E FF 53 | Store X register to absolute address
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	STX $D33F			; 8E 3F D3 | Store X register to absolute address
	LDA				  ; BF 51 00 05 | Load from absolute long,X into accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA $E900			; AD 00 E9 | Load from absolute address into accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank60_DmaFunction_04B
; Address: $F0948B
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_04B:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	STA $FF			  ; 85 FF | Store accumulator to zero page
	SEC				  ; 38 | Set carry flag
	STY $E700			; 8C 00 E7 | Store Y register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	ORA ($77,X)		  ; 01 77 | Logical OR with accumulator ((zero page,X))
	ROL $BE03			; 2E 03 BE | Rotate left (absolute)
	CLC				  ; 18 | Clear carry flag
	SBC $FE9A,X		  ; FD 9A FE | Subtract with carry (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator
	SBC $F1D0,X		  ; FD D0 F1 | Subtract with carry (absolute,X)
	JMP $C96F			; 4C 6F C9 | Jump to address
	CMP #$EF			 ; C9 EF | Compare accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	LDA				  ; BF 26 BF 26 | Load from absolute long,X into accumulator
	JMP $00B7			; 4C B7 00 | Jump to address
	ORA ($DF,X)		  ; 01 DF | Logical OR with accumulator ((zero page,X))
	ORA ($BF,X)		  ; 01 BF | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	BCC $FF			  ; 90 FF | Branch if carry clear

;------------------------------------------------------------------------------
; Bank60_DmaFunction_04C
; Address: $F094E7
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_04C:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $FF			  ; F0 FF | Branch if equal
	BNE $FF			  ; D0 FF | Branch if not equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC $00FF,Y		  ; F9 FF 00 | Subtract with carry (absolute,Y)
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	ASL $0CFF			; 0E FF 0C | Arithmetic shift left (absolute)
	ASL $D9FF			; 0E FF D9 | Arithmetic shift left (absolute)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_04E
; Address: $F0953B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_04E:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $31FF			; 0D FF 31 | Logical OR with accumulator (absolute)
	ASL $3FFF			; 0E FF 3F | Arithmetic shift left (absolute)
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $31FF			; 0E FF 31 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	JMP $13FF			; 4C FF 13 | Jump to address

;------------------------------------------------------------------------------
; Bank60_DmaFunction_04F
; Address: $F0957D
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_04F:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ASL $8EFF			; 0E FF 8E | Arithmetic shift left (absolute)
	LSR $4EFF			; 4E FF 4E | Logical shift right (absolute)
	JMP $9CFF			; 4C FF 9C | Jump to address
	INC $EE3C,X		  ; FE 3C EE | Increment (absolute,X)
	CMP #$EC			 ; C9 EC | Compare accumulator (immediate)
	CMP #$EC			 ; C9 EC | Compare accumulator (immediate)
	CPX $DC8B			; EC 8B DC | Compare X register (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	ORA ($B4,X)		  ; 01 B4 | Logical OR with accumulator ((zero page,X))
	ADC $6D02			; 6D 02 6D | Add with carry (absolute)
	ADC #$06			 ; 69 06 | Add with carry (immediate)
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	EOR $BF00			; 4D 00 BF | Exclusive OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	DEC $00			  ; C6 00 | Decrement (zero page)
	STA ($00),Y		  ; 91 00 | Store accumulator to (zero page),Y
	ROL $7B00,X		  ; 3E 00 7B | Rotate left (absolute,X)
	RTI				  ; 40 | Return from interrupt
	AND $10FF,Y		  ; 39 FF 10 | Logical AND with accumulator (absolute,Y)
	ROR $C1FF			; 6E FF C1 | Rotate right (absolute)
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $4900			; 8C 00 49 | Store Y register to absolute address
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	LDX $FC00			; AE 00 FC | Load from absolute address into X register
	SBC $E3FF,Y		  ; F9 FF E3 | Subtract with carry (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	EOR ($FF),Y		  ; 51 FF | Exclusive OR with accumulator ((zero page),Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_050
; Address: $F09603
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_050:
	DEC $9300			; CE 00 93 | Decrement (absolute)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	JMP ($DBFF)		  ; 6C FF DB | Jump to address (absolute indirect)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	CMP $FF			  ; C5 FF | Compare accumulator (zero page)
	DEC $B200			; CE 00 B2 | Decrement (absolute)
	BPL $FF			  ; 10 FF | Branch if positive
	STZ $956E,X		  ; 9E 6E 95 | Store zero to absolute,X
	LDA $FD46,Y		  ; B9 46 FD | Load from absolute,Y into accumulator
	EOR $04FF			; 4D FF 04 | Exclusive OR with accumulator (absolute)
	STA $C5F2			; 8D F2 C5 | Store accumulator to absolute address
	DEC				  ; 3A | Decrement accumulator
	ADC $DF00,Y		  ; 79 00 DF | Add with carry (absolute,Y)
	STZ $00			  ; 64 00 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank60_DmaFunction_051
; Address: $F09651
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_051:
	JSR $9BFF			; 20 FF 9B | Jump to subroutine
	ORA #$ED			 ; 09 ED | Logical OR with accumulator (immediate)
	SBC $DF46,X		  ; FD 46 DF | Subtract with carry (absolute,X)
	CPX #$ED			 ; E0 ED | Compare X register (immediate)
	INC $0091			; EE 91 00 | Increment (absolute)
	SEC				  ; 38 | Set carry flag
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	LDA $00			  ; A5 00 | Load from zero page into accumulator
	STA				  ; 9F FF C7 EF | Store accumulator to absolute long,X
	DEC $6DFF,X		  ; DE FF 6D | Decrement (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank60_DmaFunction_052
; Address: $F09679
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_052:
	PHY				  ; 5A | Push Y register to stack
	STX $C4FB			; 8E FB C4 | Store X register to absolute address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_053
; Address: $F09683
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_053:
	SBC $1900,X		  ; FD 00 19 | Subtract with carry (absolute,X)
	STA $7E00,X		  ; 9D 00 7E | Store accumulator to absolute,X
	ADC $12EF,X		  ; 7D EF 12 | Add with carry (absolute,X)
	INC $FEE7,X		  ; FE E7 FE | Increment (absolute,X)
	ORA #$BF			 ; 09 BF | Logical OR with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	ROR				  ; 6A | Rotate right (accumulator)
	STA $EB			  ; 85 EB | Store accumulator to zero page
	ASL $DC			  ; 06 DC | Arithmetic shift left (zero page)
	ASL $0DF8			; 0E F8 0D | Arithmetic shift left (absolute)
	LDA $F11D,Y		  ; B9 1D F1 | Load from absolute,Y into accumulator
	SEP #$37			 ; E2 37 | Set processor status bits
	CPX $FB			  ; E4 FB | Compare X register (zero page)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_054
; Address: $F096B1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_054:
	JSR $A873			; 20 73 A8 | Jump to subroutine
	BRA $F6			  ; 80 F6 | Branch always
	RTI				  ; 40 | Return from interrupt
	INC $CD00			; EE 00 CD | Increment (absolute)
	LDY #$9D			 ; A0 9D | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank60_DmaFunction_055
; Address: $F096BF
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_055:
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	JMP $98FF			; 4C FF 98 | Jump to address
	STA $39FF,Y		  ; 99 FF 39 | Store accumulator to absolute,Y
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	ROR $BF			  ; 66 BF | Rotate right (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $0CFF			; 0E FF 0C | Arithmetic shift left (absolute)
	ORA $00FF,Y		  ; 19 FF 00 | Logical OR with accumulator (absolute,Y)
	STZ $3CFF			; 9C FF 3C | Store zero to absolute
	AND $3DFF,X		  ; 3D FF 3D | Logical AND with accumulator (absolute,X)
	ADC $80FF,X		  ; 7D FF 80 | Add with carry (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	REP #$FF			 ; C2 FF | Reset processor status bits
	REP #$FF			 ; C2 FF | Reset processor status bits
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA $78FF,X		  ; 1D FF 78 | Logical OR with accumulator (absolute,X)
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	STX $FF			  ; 86 FF | Store X register to zero page
	INC				  ; 1A | Increment accumulator
	DEC $7CFF,X		  ; DE FF 7C | Decrement (absolute,X)
	LDA				  ; BF FF 9F FF | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_056
; Address: $F0973F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_056:
	BMI $FF			  ; 30 FF | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BMI $FF			  ; 30 FF | Branch if negative
	SEI				  ; 78 | Set interrupt disable flag
	ADC $F9FF,Y		  ; 79 FF F9 | Add with carry (absolute,Y)
	BPL $FF			  ; 10 FF | Branch if positive
	STX $FF			  ; 86 FF | Store X register to zero page
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_057
; Address: $F0978B
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_057:
	STX $8EFF			; 8E FF 8E | Store X register to absolute address
	STX $DCFE			; 8E FE DC | Store X register to absolute address
	INC $FE98,X		  ; FE 98 FE | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	SBC $FD38,X		  ; FD 38 FD | Subtract with carry (absolute,X)
	BVS $FD			  ; 70 FD | Branch if overflow set
	BVS $FD			  ; 70 FD | Branch if overflow set
	BVS $DC			  ; 70 DC | Branch if overflow set
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	BCS $2F			  ; B0 2F | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	LDY $702F,X		  ; BC 2F 70 | Load from absolute,X into Y register
	BVS $4F			  ; 70 4F | Branch if overflow set
	SBC #$06			 ; E9 06 | Subtract with carry (immediate)
	CMP ($0E),Y		  ; D1 0E | Compare accumulator ((zero page),Y)
	BCS $0F			  ; B0 0F | Branch if carry set
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ADC $DC00,X		  ; 7D 00 DC | Add with carry (absolute,X)
	LDX $7F00,Y		  ; BE 00 7F | Load from absolute,Y into X register
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	EOR #$FB			 ; 49 FB | Exclusive OR with accumulator (immediate)
	STY $BB			  ; 84 BB | Store Y register to zero page
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	STA				  ; 9F 60 00 FB | Store accumulator to absolute long,X
	DEC $B200			; CE 00 B2 | Decrement (absolute)
	STZ $04FF,X		  ; 9E FF 04 | Store zero to absolute,X
	LDA				  ; BF 40 FD 33 | Load from absolute long,X into accumulator
	EOR $04FF			; 4D FF 04 | Exclusive OR with accumulator (absolute)
	SBC $DD82,X		  ; FD 82 DD | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_059
; Address: $F09811
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_059:
	JSR $9BFF			; 20 FF 9B | Jump to subroutine
	ORA #$EF			 ; 09 EF | Logical OR with accumulator (immediate)
	CPX #$ED			 ; E0 ED | Compare X register (immediate)
	INC $0091			; EE 91 00 | Increment (absolute)
	DEC $ED00			; CE 00 ED | Decrement (absolute)
	SBC $FF20,X		  ; FD 20 FF | Subtract with carry (absolute,X)
	BNE $FF			  ; D0 FF | Branch if not equal
	BVC $FF			  ; 50 FF | Branch if overflow clear
	AND $56BB,Y		  ; 39 BB 56 | Logical AND with accumulator (absolute,Y)
	PHX				  ; DA | Push X register to stack
	AND $56			  ; 25 56 | Logical AND with accumulator (zero page)
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	PLB				  ; AB | Pull data bank register from stack
	SBC $FC03,X		  ; FD 03 FC | Subtract with carry (absolute,X)
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	LDA $BD00,X		  ; BD 00 BD | Load from absolute,X into accumulator
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank60_DmaFunction_05B
; Address: $F0984E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_05B:
	JSL $65BAFF		  ; 22 FF BA 65 | Jump to subroutine long
	STZ $3AD5			; 9C D5 3A | Store zero to absolute
	ROL				  ; 2A | Rotate left (accumulator)
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_05C
; Address: $F0986A
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_05C:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	AND $6BCA,X		  ; 3D CA 6B | Logical AND with accumulator (absolute,X)
	LSR $5F			  ; 46 5F | Logical shift right (zero page)
	LDX #$56			 ; A2 56 | Load immediate value into X register
	LDA #$C5			 ; A9 C5 | Load immediate value into accumulator
	DEC				  ; 3A | Decrement accumulator
	CMP $A932			; CD 32 A9 | Compare accumulator (absolute)
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	WDM #$FF			 ; 42 FF | Reserved instruction
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $19E6,X		  ; FE E6 19 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	STA $9066,Y		  ; 99 66 90 | Store accumulator to absolute,Y
	ROR $9C62			; 6E 62 9C | Rotate right (absolute)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	EOR ($BC,X)		  ; 41 BC | Exclusive OR with accumulator ((zero page,X))
	CPY $77			  ; C4 77 | Compare Y register (zero page)
	CPY $EF			  ; C4 EF | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	BIT #$DF			 ; 89 DF | Test bits in accumulator (immediate)
	ORA ($DF),Y		  ; 11 DF | Logical OR with accumulator ((zero page),Y)
	LDA				  ; BF 23 BF 27 | Load from absolute long,X into accumulator
	BRA $BB			  ; 80 BB | Branch always
	INC $FF			  ; E6 FF | Increment (zero page)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	CPY $8CFF			; CC FF 8C | Compare Y register (absolute)
	STY $9FFF			; 8C FF 9F | Store Y register to absolute address
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $3BFF,Y		  ; 19 FF 3B | Logical OR with accumulator (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_05D
; Address: $F098DD
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_05D:
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ADC $7EFF,X		  ; 7D FF 7E | Add with carry (absolute,X)
	INC $0FFF,X		  ; FE FF 0F | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BMI $FF			  ; 30 FF | Branch if negative
	CPY $F8FF			; CC FF F8 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_05E
; Address: $F09905
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_05E:
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	BIT $33FF			; 2C FF 33 | Test bits in accumulator (absolute)
	ASL $8CFF			; 0E FF 8C | Arithmetic shift left (absolute)
	DEY				  ; 88 | Decrement Y register
	EOR $A7FF			; 4D FF A7 | Exclusive OR with accumulator (absolute)
	INY				  ; C8 | Increment Y register
	STX $FF			  ; 86 FF | Store X register to zero page
	PLY				  ; 7A | Pull Y register from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX $37FF			; EC FF 37 | Compare X register (absolute)
	ADC $EAFF,Y		  ; 79 FF EA | Add with carry (absolute,Y)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	STA $FF			  ; 85 FF | Store accumulator to zero page
	PHB				  ; 8B | Push data bank register to stack
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	ASL $00FF,X		  ; 1E FF 00 | Arithmetic shift left (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $F3FF,Y		  ; F9 FF F3 | Subtract with carry (absolute,Y)
	ROL $60FF,X		  ; 3E FF 60 | Rotate left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_05F
; Address: $F09971
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_05F:
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	STA				  ; 9F FF 9F FF | Store accumulator to absolute long,X
	STY $1CFF			; 8C FF 1C | Store Y register to absolute address
	INC $FE1C,X		  ; FE 1C FE | Increment (absolute,X)
	INC $FE18,X		  ; FE 18 FE | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SBC $FB39,X		  ; FD 39 FB | Subtract with carry (absolute,X)
	BVS $FB			  ; 70 FB | Branch if overflow set
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	CPX #$F7			 ; E0 F7 | Compare X register (immediate)
	CPX #$F7			 ; E0 F7 | Compare X register (immediate)
	CPY #$F7			 ; C0 F7 | Compare Y register (immediate)
	CPY #$F6			 ; C0 F6 | Compare Y register (immediate)
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $9E			  ; F0 9E | Branch if equal
	BEQ $9E			  ; F0 9E | Branch if equal
	BEQ $9F			  ; F0 9F | Branch if equal
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	BNE $BF			  ; D0 BF | Branch if not equal
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	LDA ($1E,X)		  ; A1 1E | Load from (zero page,X) into accumulator
	ADC $1B			  ; 65 1B | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_060
; Address: $F099B6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_060:
	ADC $1B			  ; 65 1B | Add with carry (zero page)
	CLC				  ; 18 | Clear carry flag
	JMP $C433			; 4C 33 C4 | Jump to address
	INC $FD00,X		  ; FE 00 FD | Increment (absolute,X)
	SBC $FF00,X		  ; FD 00 FF | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_061
; Address: $F099CA
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_061:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	AND $7BCA,X		  ; 3D CA 7B | Logical AND with accumulator (absolute,X)
	STA $BB			  ; 85 BB | Store accumulator to zero page
	LSR $5F			  ; 46 5F | Logical shift right (zero page)
	LDX #$57			 ; A2 57 | Load immediate value into X register
	TAY				  ; A8 | Transfer accumulator to Y register
	CMP $3A			  ; C5 3A | Compare accumulator (zero page)
	CMP $A932			; CD 32 A9 | Compare accumulator (absolute)
	DEC $ED00			; CE 00 ED | Decrement (absolute)
	SBC $BF00,X		  ; FD 00 BF | Subtract with carry (absolute,X)
	LDA				  ; BF 10 FF F7 | Load from absolute long,X into accumulator
	AND $56BB,Y		  ; 39 BB 56 | Logical AND with accumulator (absolute,Y)
	PHX				  ; DA | Push X register to stack
	AND $56			  ; 25 56 | Logical AND with accumulator (zero page)
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	PLB				  ; AB | Pull data bank register from stack
	LSR $67F1			; 4E F1 67 | Logical shift right (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	SBC $1A			  ; E5 1A | Subtract with carry (zero page)
	LDA $BD00,X		  ; BD 00 BD | Load from absolute,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank60_DmaFunction_062
; Address: $F09A0E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_062:
	JSR $BAFF			; 20 FF BA | Jump to subroutine
	ADC $72			  ; 65 72 | Add with carry (zero page)
	STZ $38D7			; 9C D7 38 | Store zero to absolute
	ROL				  ; 2A | Rotate left (accumulator)
	STA $8D62,X		  ; 9D 62 8D | Store accumulator to absolute,X
	STY $FF			  ; 84 FF | Store Y register to zero page
	STA $FF			  ; 85 FF | Store accumulator to zero page
	LDA $FFFF			; AD FF FF | Load from absolute address into accumulator
	LDA $5A			  ; A5 5A | Load from zero page into accumulator
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	CMP $BD42			; CD 42 BD | Compare accumulator (absolute)
	STX $FF			  ; 86 FF | Store X register to zero page
	LSR $7BFF,X		  ; 5E FF 7B | Logical shift right (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	AND #$D6			 ; 29 D6 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_063
; Address: $F09A54
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_063:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	ROR $FF			  ; 66 FF | Rotate right (zero page)
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	CPY $19			  ; C4 19 | Compare Y register (zero page)
	INC $08			  ; E6 08 | Increment (zero page)
	INC $FC17,X		  ; FE 17 FC | Increment (absolute,X)
	LSR $CEFC			; 4E FC CE | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_064
; Address: $F09A87
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_064:
	SED				  ; F8 | Set decimal mode flag
	CMP $DDF9,X		  ; DD F9 DD | Compare accumulator (absolute,X)
	SBC ($FB),Y		  ; F1 FB | Subtract with carry ((zero page),Y)
	SBC ($FB),Y		  ; F1 FB | Subtract with carry ((zero page),Y)
	EOR ($B8,X)		  ; 41 B8 | Exclusive OR with accumulator ((zero page,X))
	BNE $03			  ; D0 03 | Branch if not equal
	BEQ $17			  ; F0 17 | Branch if equal
	CPX #$06			 ; E0 06 | Compare X register (immediate)
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	DEC $8EFF			; CE FF 8E | Decrement (absolute)
	STA				  ; 9F FF 1F FF | Store accumulator to absolute long,X
	LDA				  ; BF 00 BF 00 | Load from absolute long,X into accumulator
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	SBC $78FF,Y		  ; F9 FF 78 | Subtract with carry (absolute,Y)
	BMI $FF			  ; 30 FF | Branch if negative
	BVS $FF			  ; 70 FF | Branch if overflow set
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	STA $FF00FF		  ; 8F FF 00 FF | Store accumulator to absolute long address
	BNE $FF			  ; D0 FF | Branch if not equal

;------------------------------------------------------------------------------
; Bank60_DmaFunction_065
; Address: $F09B25
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_065:
	JSR $C0FF			; 20 FF C0 | Jump to subroutine
	BCC $FF			  ; 90 FF | Branch if carry clear
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC $FD31,X		  ; FD 31 FD | Subtract with carry (absolute,X)
	SBC ($F9),Y		  ; F1 F9 | Subtract with carry ((zero page),Y)
	ADC ($FB),Y		  ; 71 FB | Add with carry ((zero page),Y)
	SEP #$F7			 ; E2 F7 | Set processor status bits
	SEP #$F7			 ; E2 F7 | Set processor status bits
	INC $EEC0			; EE C0 EE | Increment (absolute)
	INC $ED80			; EE 80 ED | Increment (absolute)
	BRA $DD			  ; 80 DD | Branch always
	CMP $3C00,X		  ; DD 00 3C | Compare accumulator (absolute,X)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	LDY #$7F			 ; A0 7F | Load immediate value into Y register
	STA $7F			  ; 85 7F | Store accumulator to zero page
	SBC $7F			  ; E5 7F | Subtract with carry (zero page)
	DEC $39			  ; C6 39 | Decrement (zero page)
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	STA $9066,Y		  ; 99 66 90 | Store accumulator to absolute,Y
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	STY $FF			  ; 84 FF | Store Y register to zero page

;------------------------------------------------------------------------------
; Bank60_DmaFunction_066
; Address: $F09BB4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_066:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	LDY $1D01			; AC 01 1D | Load from absolute address into Y register
	BRA $38			  ; 80 38 | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_067
; Address: $F09BC5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_067:
	LDY #$B8			 ; A0 B8 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	LDA ($B0),Y		  ; B1 B0 | Load from (zero page),Y into accumulator
	BCS $3D			  ; B0 3D | Branch if carry set
	STY $8C3C			; 8C 3C 8C | Store Y register to absolute address
	DEC $CF30			; CE 30 CF | Decrement (absolute)
	LDA $12			  ; A5 12 | Load from zero page into accumulator

;------------------------------------------------------------------------------
; Bank60_DmaFunction_068
; Address: $F09BE3
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_068:
	JSL $CEC224		  ; 22 24 C2 CE | Jump to subroutine long
	NOP				  ; EA | No operation
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	INC $37C0,X		  ; FE C0 37 | Increment (absolute,X)
	LDA				  ; BF FF 3F FF | Load from absolute long,X into accumulator
	LDA				  ; BF C1 3F 20 | Load from absolute long,X into accumulator
	SEC				  ; 38 | Set carry flag
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	INY				  ; C8 | Increment Y register
	CMP ($8B,X)		  ; C1 8B | Compare accumulator ((zero page,X))
	ADC ($89),Y		  ; 71 89 | Add with carry ((zero page),Y)
	ADC ($88),Y		  ; 71 88 | Add with carry ((zero page),Y)
	BVS $F8			  ; 70 F8 | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BEQ $01			  ; F0 01 | Branch if equal
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 07 00 F3 | Load from absolute long,X into accumulator
	BEQ $F7			  ; F0 F7 | Branch if equal
	DEC $FE			  ; C6 FE | Decrement (zero page)
	INC $DFDF,X		  ; FE DF DF | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	BEQ $0F			  ; F0 0F | Branch if equal
	DEC $09			  ; C6 09 | Decrement (zero page)
	INC $DF01,X		  ; FE 01 DF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_069
; Address: $F09C39
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_069:
	JSR $0936			; 20 36 09 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	LDA				  ; BF 00 3F 08 | Load from absolute long,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	STZ $BF40			; 9C 40 BF | Store zero to absolute
	CPY $9933			; CC 33 99 | Compare Y register (absolute)
	CPX #$2B			 ; E0 2B | Compare X register (immediate)
	BNE $2F			  ; D0 2F | Branch if not equal
	BNE $BF			  ; D0 BF | Branch if not equal
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank60_DmaFunction_06B
; Address: $F09C68
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_06B:
	LDA $FB24,X		  ; BD 24 FB | Load from absolute,X into accumulator
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	BMI $00			  ; 30 00 | Branch if negative
	CPX $0B			  ; E4 0B | Compare X register (zero page)
	CLV				  ; B8 | Clear overflow flag
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY $43			  ; A4 43 | Load from zero page into Y register
	DEX				  ; CA | Decrement X register
	ORA $CA			  ; 05 CA | Logical OR with accumulator (zero page)
	ORA $B2			  ; 05 B2 | Logical OR with accumulator (zero page)
	EOR $3F			  ; 45 3F | Exclusive OR with accumulator (zero page)
	BCC $AF			  ; 90 AF | Branch if carry clear
	STY $0CAE			; 8C AE 0C | Store Y register to absolute address
	LDA				  ; BF 18 B7 10 | Load from absolute long,X into accumulator
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	PHP				  ; 08 | Push processor status to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_06D
; Address: $F09C99
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_06D:
	INX				  ; E8 | Increment X register
	BMI $AB			  ; 30 AB | Branch if negative
	CPY $34BD			; CC BD 34 | Compare Y register (absolute)
	LDA $0118,Y		  ; B9 18 01 | Load from absolute,Y into accumulator
	CLC				  ; 18 | Clear carry flag
	BMI $FB			  ; 30 FB | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	BPL $B4			  ; 10 B4 | Branch if positive
	TYA				  ; 98 | Transfer Y register to accumulator
	INC				  ; 1A | Increment accumulator
	STA $B2			  ; 85 B2 | Store accumulator to zero page
	EOR $05EA			; 4D EA 05 | Exclusive OR with accumulator (absolute)
	DEC $9321			; CE 21 93 | Decrement (absolute)
	JMP ($0024)		  ; 6C 24 00 | Jump to address (absolute indirect)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	INX				  ; E8 | Increment X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $EFC9			; 2E C9 EF | Rotate left (absolute)
	AND ($DC,X)		  ; 21 DC | Logical AND with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC ($02),Y		  ; F1 02 | Subtract with carry ((zero page),Y)
	SBC ($C2),Y		  ; F1 C2 | Subtract with carry ((zero page),Y)
	AND ($B0),Y		  ; 31 B0 | Logical AND with accumulator ((zero page),Y)
	BMI $58			  ; 30 58 | Branch if negative

;------------------------------------------------------------------------------
; Bank60_DmaFunction_06F
; Address: $F09CE6
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_06F:
	SED				  ; F8 | Set decimal mode flag
	ASL $30			  ; 06 30 | Arithmetic shift left (zero page)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ORA ($B3,X)		  ; 01 B3 | Logical OR with accumulator ((zero page,X))
	BPL $B3			  ; 10 B3 | Branch if positive
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $00FD,X		  ; FE FD 00 | Increment (absolute,X)
	BCC $4F			  ; 90 4F | Branch if carry clear
	ASL $E9			  ; 06 E9 | Arithmetic shift left (zero page)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	CPX #$C9			 ; E0 C9 | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $1B			  ; F0 1B | Branch if equal
	CPX #$1B			 ; E0 1B | Compare X register (immediate)
	CPX #$1B			 ; E0 1B | Compare X register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $BB			  ; F0 BB | Branch if equal
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank60_DmaFunction_070
; Address: $F09D25
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_070:
	JSR $20A3			; 20 A3 20 | Jump to subroutine
	LDA				  ; BF 24 FF 04 | Load from absolute long,X into accumulator
	TSX				  ; BA | Transfer stack pointer to X register
	EOR $8A			  ; 45 8A | Exclusive OR with accumulator (zero page)
	EOR $A2			  ; 45 A2 | Exclusive OR with accumulator (zero page)
	EOR $5DA2,Y		  ; 59 A2 5D | Exclusive OR with accumulator (absolute,Y)
	LDX $41			  ; A6 41 | Load from zero page into X register
	INC $01			  ; E6 01 | Increment (zero page)
	INC $CE01,X		  ; FE 01 CE | Increment (absolute,X)
	AND ($27),Y		  ; 31 27 | Logical AND with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	INC $04			  ; E6 04 | Increment (zero page)
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	BMI $0B			  ; 30 0B | Branch if negative
	BEQ $06			  ; F0 06 | Branch if equal
	SBC $E01B,Y		  ; F9 1B E0 | Game work RAM access
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $C7			  ; F0 C7 | Branch if equal
	SEC				  ; 38 | Set carry flag
	BMI $A3			  ; 30 A3 | Branch if negative

;------------------------------------------------------------------------------
; Bank60_DmaFunction_071
; Address: $F09D63
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_071:
	JSR $20A3			; 20 A3 20 | Jump to subroutine
	BMI $BF			  ; 30 BF | Branch if negative
	STA				  ; 9F 1C A7 20 | Store accumulator to absolute long,X
	STA $00			  ; 85 00 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank60_DmaFunction_072
; Address: $F09D71
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_072:
	EOR $5DA2			; 4D A2 5D | Exclusive OR with accumulator (absolute)
	LDX #$5D			 ; A2 5D | Load immediate value into X register
	EOR #$8E			 ; 49 8E | Exclusive OR with accumulator (immediate)
	EOR ($9E,X)		  ; 41 9E | Exclusive OR with accumulator ((zero page,X))
	ADC ($A2,X)		  ; 61 A2 | Add with carry ((zero page,X))
	EOR $7B84,X		  ; 5D 84 7B | Exclusive OR with accumulator (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	SBC $CBE7,X		  ; FD E7 CB | Subtract with carry (absolute,X)
	SBC $00FF			; ED FF 00 | Subtract with carry (absolute)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	SEC				  ; 38 | Set carry flag
	CPY $CC2F			; CC 2F CC | Compare Y register (absolute)
	CPY $F3			  ; C4 F3 | Compare Y register (zero page)
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank60_DmaFunction_073
; Address: $F09DAF
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_073:
	JSR $F10E			; 20 0E F1 | Jump to subroutine
	ASL $0EF1			; 0E F1 0E | Arithmetic shift left (absolute)
	SBC ($C6),Y		  ; F1 C6 | Subtract with carry ((zero page),Y)
	AND $29D6,Y		  ; 39 D6 29 | Logical AND with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	AND $649B			; 2D 9B 64 | Logical AND with accumulator (absolute)
	BPL $B3			  ; 10 B3 | Branch if positive
	BPL $93			  ; 10 93 | Branch if positive
	BPL $93			  ; 10 93 | Branch if positive
	BPL $D7			  ; 10 D7 | Branch if positive
	BPL $46			  ; 10 46 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $F6			  ; 10 F6 | Branch if positive
	ORA #$B2			 ; 09 B2 | Logical OR with accumulator (immediate)
	EOR $6D92			; 4D 92 6D | Exclusive OR with accumulator (absolute)
	ADC $29D6			; 6D D6 29 | Add with carry (absolute)
	LDA $7EFF,Y		  ; B9 FF 7E | Load from absolute,Y into accumulator
	BNE $2F			  ; D0 2F | Branch if not equal
	STZ $7FD8			; 9C D8 7F | Store zero to absolute
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	BRA $7F			  ; 80 7F | Branch always
	STZ $7F00			; 9C 00 7F | Store zero to absolute
	SEC				  ; 38 | Set carry flag
	STY $E3			  ; 84 E3 | Store Y register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP $508F			; 4C 8F 50 | Jump to address
	BRA $4B			  ; 80 4B | Branch always
	BRA $69			  ; 80 69 | Branch always
	BRA $9F			  ; 80 9F | Branch always
	ADC $3FFB,X		  ; 7D FB 3F | Add with carry (absolute,X)
	SBC $1014,Y		  ; F9 14 10 | Subtract with carry (absolute,Y)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_074
; Address: $F09E25
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_074:
	BRA $F3			  ; 80 F3 | Branch always
	BPL $A0			  ; 10 A0 | Branch if positive
	ROR $B9FE			; 6E FE B9 | Rotate right (absolute)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	AND $EFF7			; 2D F7 EF | Logical AND with accumulator (absolute)
	LDA				  ; BF F9 9E F7 | Load from absolute long,X into accumulator
	LDA				  ; BF 00 80 00 | Load from absolute long,X into accumulator
	BMI $EE			  ; 30 EE | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	BMI $80			  ; 30 80 | Branch if negative
	BRA $47			  ; 80 47 | Branch always
	CLV				  ; B8 | Clear overflow flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	DEC $6E00,X		  ; DE 00 6E | Decrement (absolute,X)
	STX $86			  ; 86 86 | Store X register to zero page
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHX				  ; DA | Push X register to stack
	STA $28D7,X		  ; 9D D7 28 | Store accumulator to absolute,X
	ROR $A691			; 6E 91 A6 | Rotate right (absolute)
	ADC $763F,Y		  ; 79 3F 76 | Add with carry (absolute,Y)
	LDA #$76			 ; A9 76 | Load immediate value into accumulator
	LDA ($5E,X)		  ; A1 5E | Load from (zero page,X) into accumulator
	STA $7B62,X		  ; 9D 62 7B | Store accumulator to absolute,X
	CLC				  ; 18 | Clear carry flag
	DEC $01			  ; C6 01 | Decrement (zero page)
	BVS $00			  ; 70 00 | Branch if overflow set
	INY				  ; C8 | Increment Y register
	BRA $FE			  ; 80 FE | Branch always
	BRA $7F			  ; 80 7F | Branch always
	LDA				  ; BF FF DC FD | Load from absolute long,X into accumulator
	PLY				  ; 7A | Pull Y register from stack
	SED				  ; F8 | Set decimal mode flag
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	BRA $7F			  ; 80 7F | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BPL $FE			  ; 10 FE | Branch if positive
	ORA ($78,X)		  ; 01 78 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_075
; Address: $F09EB2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_075:
	JSR $80DF			; 20 DF 80 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	SBC $FF04,Y		  ; F9 04 FF | Subtract with carry (absolute,Y)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ASL $00E1,X		  ; 1E E1 00 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_076
; Address: $F09EE7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_076:
	JSR $817E			; 20 7E 81 | Jump to subroutine
	JMP $F708A3		  ; 5C A3 08 F7 | Jump to address long
	BRA $7F			  ; 80 7F | Branch always
	BEQ $07			  ; F0 07 | Branch if equal

;------------------------------------------------------------------------------
; Bank60_DmaFunction_077
; Address: $F09EF5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_077:
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	INC $7C00,X		  ; FE 00 7C | Increment (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	BRA $F7			  ; 80 F7 | Branch always
	PHP				  ; 08 | Push processor status to stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank60_DmaFunction_078
; Address: $F09F0A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_078:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	STA $837C,X		  ; 9D 7C 83 | Store accumulator to absolute,X
	BRA $61			  ; 80 61 | Branch always
	STZ $DF20,X		  ; 9E 20 DF | Store zero to absolute,X

;------------------------------------------------------------------------------
; Bank60_DmaFunction_079
; Address: $F09F1A
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_079:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	BRA $DE			  ; 80 DE | Branch always
	DEC $DE00,X		  ; DE 00 DE | Decrement (absolute,X)
	ROR $0280,X		  ; 7E 80 02 | Rotate right (absolute,X)
	PLX				  ; FA | Pull X register from stack
	ORA $1DE3,X		  ; 1D E3 1D | Logical OR with accumulator (absolute,X)
	STA $1D63,X		  ; 9D 63 1D | Store accumulator to absolute,X
	SEP #$1C			 ; E2 1C | Set processor status bits
	AND $00C2,X		  ; 3D C2 00 | Logical AND with accumulator (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	BVC $00			  ; 50 00 | Branch if overflow clear
	STZ $ED00			; 9C 00 ED | Store zero to absolute
	DEC $C23D,X		  ; DE 3D C2 | Decrement (absolute,X)
	WDM #$BD			 ; 42 BD | Reserved instruction
	LDY $ED43,X		  ; BC 43 ED | Load from absolute,X into Y register
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	STY $57			  ; 84 57 | Store Y register to zero page
	INC $FEBB,X		  ; FE BB FE | Increment (absolute,X)
	LDA				  ; BF FE 80 FF | Load from absolute long,X into accumulator
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	ASL $EDFE			; 0E FE ED | Arithmetic shift left (absolute)
	ORA $10EF			; 0D EF 10 | Logical OR with accumulator (absolute)
	AND $7058,Y		  ; 39 58 70 | Logical AND with accumulator (absolute,Y)
	AND ($74),Y		  ; 31 74 | Logical AND with accumulator ((zero page),Y)
	RTI				  ; 40 | Return from interrupt
	STA $CDB507		  ; 8F 07 B5 CD | Store accumulator to absolute long address
	SBC $9012			; ED 12 90 | Subtract with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	EOR $3186,Y		  ; 59 86 31 | Exclusive OR with accumulator (absolute,Y)
	STX $8837			; 8E 37 88 | Store X register to absolute address
	INY				  ; C8 | Increment Y register
	BMI $07			  ; 30 07 | Branch if negative
	BEQ $DD			  ; F0 DD | Branch if equal
	LDA $CF96,Y		  ; B9 96 CF | Load from absolute,Y into accumulator
	JMP $9333			; 4C 33 93 | Jump to address
	BPL $F4			  ; 10 F4 | Branch if positive
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank60_DmaFunction_07A
; Address: $F09FB4
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_07A:
	CPY $9303			; CC 03 93 | Compare Y register (absolute)
	JMP $0E31			; 4C 31 0E | Jump to address
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	SBC ($03,X)		  ; E1 03 | Subtract with carry ((zero page,X))
	CMP ($E9,X)		  ; C1 E9 | Compare accumulator ((zero page,X))
	ORA #$E0			 ; 09 E0 | Game work RAM access
	STZ $83EC			; 9C EC 83 | Store zero to absolute
	INC $FBC7			; EE C7 FB | Increment (absolute)
	PHA				  ; 48 | Push accumulator to stack
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	ADC $3609,X		  ; 7D 09 36 | Add with carry (absolute,X)
	LDY $8303,X		  ; BC 03 83 | Load from absolute,X into Y register
	BMI $C7			  ; 30 C7 | Branch if negative
	BMI $03			  ; 30 03 | Branch if negative
	CPX $88			  ; E4 88 | Compare X register (zero page)
	STA ($0C,X)		  ; 81 0C | Store accumulator to (zero page,X)
	STA ($02,X)		  ; 81 02 | Store accumulator to (zero page,X)
	PLB				  ; AB | Pull data bank register from stack
	STX $06			  ; 86 06 | Store X register to zero page
	STA $05			  ; 85 05 | Store accumulator to zero page
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	ADC $D781,Y		  ; 79 81 D7 | Add with carry (absolute,Y)
	CMP $0480,Y		  ; D9 80 04 | Compare accumulator (absolute,Y)
	BMI $4B			  ; 30 4B | Branch if negative
	ASL $79			  ; 06 79 | Arithmetic shift left (zero page)
	STA $7A			  ; 85 7A | Store accumulator to zero page
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $B706,Y		  ; B9 06 B7 | Load from absolute,Y into accumulator
	PHP				  ; 08 | Push processor status to stack
	STA $3426,Y		  ; 99 26 34 | Store accumulator to absolute,Y
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ROL $3F8D,X		  ; 3E 8D 3F | Rotate left (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	BNE $BF			  ; D0 BF | Branch if not equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	LDY $8F7F,X		  ; BC 7F 8F | Load from absolute,X into Y register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	BEQ $26			  ; F0 26 | Branch if equal

;------------------------------------------------------------------------------
; Bank60_DmaFunction_07B
; Address: $F0A035
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_07B:
	INC $3D			  ; E6 3D | Increment (zero page)
	SBC $8F0F,X		  ; FD 0F 8F | Subtract with carry (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPX $7FEC			; EC EC 7F | Compare X register (absolute)
	STX $FF			  ; 86 FF | Store X register to zero page

;------------------------------------------------------------------------------
; Bank60_DmaFunction_07C
; Address: $F0A043
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_07C:
	JSL $C360E3		  ; 22 E3 60 C3 | Jump to subroutine long
	REP #$9C			 ; C2 9C | Reset processor status bits
	ORA ($86,X)		  ; 01 86 | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	LDA ($96),Y		  ; B1 96 | Load from (zero page),Y into accumulator
	ORA $21DC,X		  ; 1D DC 21 | PPU graphics register access
	STZ $0021			; 9C 21 00 | Store zero to absolute
	SEP #$04			 ; E2 04 | Set processor status bits
	PLY				  ; 7A | Pull Y register from stack
	LDA ($43),Y		  ; B1 43 | Load from (zero page),Y into accumulator
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BPL $39			  ; 10 39 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	AND $D0F8,Y		  ; 39 F8 D0 | Logical AND with accumulator (absolute,Y)
	CPY #$63			 ; C0 63 | Compare Y register (immediate)
	SBC ($17,X)		  ; E1 17 | Subtract with carry ((zero page,X))
	STA ($3F),Y		  ; 91 3F | Store accumulator to (zero page),Y
	INC $0761,X		  ; FE 61 07 | Increment (absolute,X)
	INX				  ; E8 | Increment X register
	BIT $23			  ; 24 23 | Test bits in accumulator (zero page)
	LDA				  ; BF 9C E1 60 | Load from absolute long,X into accumulator
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	STZ $FE07,X		  ; 9E 07 FE | Store zero to absolute,X
	ADC ($E0),Y		  ; 71 E0 | Game work RAM access
	TYA				  ; 98 | Transfer Y register to accumulator
	PLP				  ; 28 | Pull processor status from stack
	INX				  ; E8 | Increment X register
	BCS $B0			  ; B0 B0 | Branch if carry set
	CPY $F3FC			; CC FC F3 | Compare Y register (absolute)
	SEP #$1E			 ; E2 1E | Set processor status bits
	LDY #$F5			 ; A0 F5 | Load immediate value into Y register
	AND #$BE			 ; 29 BE | Logical AND with accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	DEY				  ; 88 | Decrement Y register
	PHP				  ; 08 | Push processor status to stack
	LDY $03			  ; A4 03 | Load from zero page into Y register
	AND $4682			; 2D 82 46 | Logical AND with accumulator (absolute)
	STA ($47,X)		  ; 81 47 | Store accumulator to (zero page,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	ORA $3DE0,X		  ; 1D E0 3D | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_07D
; Address: $F0A0BD
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_07D:
	CPY #$09			 ; C0 09 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ROR $5C81,X		  ; 7E 81 5C | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BCC $27			  ; 90 27 | Branch if carry clear
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_07E
; Address: $F0A0F0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_07E:
	JSL $C33CDD		  ; 22 DD 3C C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	STA $DD22,X		  ; 9D 22 DD | Store accumulator to absolute,X

;------------------------------------------------------------------------------
; Bank60_DmaFunction_07F
; Address: $F0A0FA
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_07F:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	STA $3F9B3D		  ; 8F 3D 9B 3F | Store accumulator to absolute long address
	STA				  ; 9F 38 97 38 | Store accumulator to absolute long,X
	STA				  ; 9F 30 8F 38 | Store accumulator to absolute long,X
	LDA				  ; BF 3C FF FF | Load from absolute long,X into accumulator
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	EOR #$F9			 ; 49 F9 | Exclusive OR with accumulator (immediate)
	JMP $FFFFFC		  ; 5C FC FF FF | Jump to address long
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	DEC $FBA8,X		  ; DE A8 FB | Decrement (absolute,X)
	STA $A7			  ; 85 A7 | Store accumulator to zero page
	STA ($8B,X)		  ; 81 8B | Store accumulator to (zero page,X)
	STX $FF			  ; 86 FF | Store X register to zero page
	XBA				  ; EB | Exchange accumulator bytes
	INX				  ; E8 | Increment X register
	CPY $02			  ; C4 02 | Compare Y register (zero page)
	LDY #$5E			 ; A0 5E | Load immediate value into Y register
	LDY $5B			  ; A4 5B | Load from zero page into Y register
	BCC $43			  ; 90 43 | Branch if carry clear
	ASL $780C,X		  ; 1E 0C 78 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STY $00			  ; 84 00 | Store Y register to zero page
	INC $FBFE,X		  ; FE FE FB | Increment (absolute,X)
	CPY $D6			  ; C4 D6 | Compare Y register (zero page)
	AND $09			  ; 25 09 | Logical AND with accumulator (zero page)
	PHB				  ; 8B | Push data bank register to stack
	AND #$2B			 ; 29 2B | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_080
; Address: $F0A159
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_080:
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $7F			  ; F0 7F | Branch if equal
	BCC $7F			  ; 90 7F | Branch if carry clear
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BMI $7F			  ; 30 7F | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $70			  ; F0 70 | Branch if equal
	BCC $10			  ; 90 10 | Branch if carry clear
	STA ($01,X)		  ; 81 01 | Store accumulator to (zero page,X)
	BRA $7F			  ; 80 7F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	LSR $80			  ; 46 80 | Logical shift right (zero page)
	BCS $5F			  ; B0 5F | Branch if carry set
	LDY #$7B			 ; A0 7B | Load immediate value into Y register
	BCC $ED			  ; 90 ED | Branch if carry clear
	LDX $76F5			; AE F5 76 | Load from absolute address into X register
	SBC $FF4E,X		  ; FD 4E FF | Subtract with carry (absolute,X)
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	ADC $C0B3,X		  ; 7D B3 C0 | Add with carry (absolute,X)
	AND ($42,X)		  ; 21 42 | Hardware register operation
	ORA ($46),Y		  ; 11 46 | Logical OR with accumulator ((zero page),Y)
	LDY $34D3			; AC D3 34 | Load from absolute address into Y register
	SEC				  ; 38 | Set carry flag
	BRA $E2			  ; 80 E2 | Branch always
	STY $2E70			; 8C 70 2E | Store Y register to absolute address
	SBC ($80),Y		  ; F1 80 | Subtract with carry ((zero page),Y)
	STZ $3E			  ; 64 3E | Store zero to zero page
	SBC ($F6),Y		  ; F1 F6 | Subtract with carry ((zero page),Y)
	CMP $8B74			; CD 74 8B | Compare accumulator (absolute)
	CMP ($10,X)		  ; C1 10 | Compare accumulator ((zero page,X))
	CPY $6E11			; CC 11 6E | Compare Y register (absolute)
	STA ($F1,X)		  ; 81 F1 | Store accumulator to (zero page,X)
	ASL $8B74			; 0E 74 8B | Arithmetic shift left (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	DEC $EF01			; CE 01 EF | Decrement (absolute)
	CPX $EC93			; EC 93 EC | Compare X register (absolute)
	BRA $13			  ; 80 13 | Branch always
	BPL $0F			  ; 10 0F | Branch if positive
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $F7			  ; F0 F7 | Branch if equal
	STY $1313			; 8C 13 13 | Store Y register to absolute address
	CPX $EF10			; EC 10 EF | Compare X register (absolute)
	BEQ $A0			  ; F0 A0 | Branch if equal
	CMP $CF06,Y		  ; D9 06 CF | Compare accumulator (absolute,Y)
	BPL $37			  ; 10 37 | Branch if positive
	BPL $3E			  ; 10 3E | Branch if positive

;------------------------------------------------------------------------------
; Bank60_DmaFunction_081
; Address: $F0A1EB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_081:
	BPL $00			  ; 10 00 | Branch if positive
	BRA $7F			  ; 80 7F | Branch always
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_082
; Address: $F0A1F5
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_082:
	JSR $2010			; 20 10 20 | Jump to subroutine
	DEX				  ; CA | Decrement X register
	ROL $00C1,X		  ; 3E C1 00 | Rotate left (absolute,X)
	CMP $F37C			; CD 7C F3 | Compare accumulator (absolute)
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	DEC $E532			; CE 32 E5 | Decrement (absolute)
	ORA #$C3			 ; 09 C3 | Logical OR with accumulator (immediate)
	CPY $FC03			; CC 03 FC | Compare Y register (absolute)
	LDA $E042,X		  ; BD 42 E0 | Game work RAM access
	ORA #$E1			 ; 09 E1 | Logical OR with accumulator (immediate)
	ASL $3EC1,X		  ; 1E C1 3E | Arithmetic shift left (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_083
; Address: $F0A222
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_083:
	JSR $F0DF			; 20 DF F0 | Jump to subroutine
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BMI $20			  ; 30 20 | Branch if negative
	LDA $F70850		  ; AF 50 08 F7 | Load from absolute long address into accumulator
	BRA $09			  ; 80 09 | Branch always
	PHP				  ; 08 | Push processor status to stack
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	WDM #$BD			 ; 42 BD | Reserved instruction
	PHP				  ; 08 | Push processor status to stack
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	ASL $FFE1,X		  ; 1E E1 FF | Arithmetic shift left (absolute,X)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	ORA $18F9,Y		  ; 19 F9 18 | Logical OR with accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	PEA #$F234		   ; F4 34 F2 | Push effective address to stack
	CPX #$E6			 ; E0 E6 | Compare X register (immediate)
	INC $F8			  ; E6 F8 | Increment (zero page)
	ORA #$78			 ; 09 78 | Logical OR with accumulator (immediate)
	EOR ($F8,X)		  ; 41 F8 | Exclusive OR with accumulator ((zero page,X))
	CMP ($E8,X)		  ; C1 E8 | Compare accumulator ((zero page,X))
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_084
; Address: $F0A2E6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_084:
	INC $F8FE,X		  ; FE FE F8 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_086
; Address: $F0A2F3
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_086:
	SED				  ; F8 | Set decimal mode flag
	BVS $FF			  ; 70 FF | Branch if overflow set
	ADC ($FE),Y		  ; 71 FE | Add with carry ((zero page),Y)
	INC $FC27,X		  ; FE 27 FC | Increment (absolute,X)
	STA				  ; 9F DF D7 8F | Store accumulator to absolute long,X
	STA $034707		  ; 8F 07 47 03 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank60_DmaFunction_087
; Address: $F0A311
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_087:
	JSR $50AF			; 20 AF 50 | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FE3E,X		  ; FE 3E FE | Increment (absolute,X)
	ROL $7FFF,X		  ; 3E FF 7F | Rotate left (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SBC $FE01,X		  ; FD 01 FE | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank60_DmaFunction_088
; Address: $F0A3C5
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_088:
	BVS $FF			  ; 70 FF | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	JMP $28EF			; 4C EF 28 | Jump to address
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	JMP $2830			; 4C 30 28 | Jump to address
	BPL $1A			  ; 10 1A | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $0606			; 0E 06 06 | Arithmetic shift left (absolute)
	NOP				  ; EA | No operation
	INC $CB			  ; E6 CB | Increment (zero page)
	DEC $DB			  ; C6 DB | Decrement (zero page)
	STA $918F91		  ; 8F 91 8F 91 | Store accumulator to absolute long address
	STA $D0DFD0		  ; 8F D0 DF D0 | Store accumulator to absolute long address
	SBC $D9C0,Y		  ; F9 C0 D9 | Subtract with carry (absolute,Y)
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BRA $90			  ; 80 90 | Branch always
	CPX #$90			 ; E0 90 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_089
; Address: $F0A41A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_089:
	BCC $60			  ; 90 60 | Branch if carry clear
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$20			 ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_08A
; Address: $F0A420
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_08A:
	JSR $0020			; 20 20 00 | Jump to subroutine
	BRA $02			  ; 80 02 | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	BRA $8A			  ; 80 8A | Branch always
	BRA $84			  ; 80 84 | Branch always
	RTI				  ; 40 | Return from interrupt
	CPX #$7C			 ; E0 7C | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	ADC $7F00,X		  ; 7D 00 7F | Add with carry (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_08C
; Address: $F0A44C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_08C:
	BVS $62			  ; 70 62 | Branch if overflow set
	SBC #$2F			 ; E9 2F | Subtract with carry (immediate)
	BNE $2F			  ; D0 2F | Branch if not equal
	BNE $7F			  ; D0 7F | Branch if not equal
	BRA $7F			  ; 80 7F | Branch always
	BRA $18			  ; 80 18 | Branch always
	CLC				  ; 18 | Clear carry flag
	STZ $9C03			; 9C 03 9C | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_08D
; Address: $F0A46E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_08D:
	BVS $88			  ; 70 88 | Branch if overflow set
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_08E
; Address: $F0A49D
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_08E:
	LDA				  ; BF FF 93 00 | Load from absolute long,X into accumulator
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	EOR ($7E,X)		  ; 41 7E | Exclusive OR with accumulator ((zero page,X))
	EOR ($7E,X)		  ; 41 7E | Exclusive OR with accumulator ((zero page,X))
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ROR $FEBE,X		  ; 7E BE FE | Rotate right (absolute,X)
	ROL $FE7E,X		  ; 3E 7E FE | Rotate left (absolute,X)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $80			  ; 80 80 | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BVS $FF			  ; 70 FF | Branch if overflow set
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BVS $00			  ; 70 00 | Branch if overflow set
	BNE $DF			  ; D0 DF | Branch if not equal
	BNE $DF			  ; D0 DF | Branch if not equal
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$E0			 ; C0 E0 | Game work RAM access
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BNE $00			  ; D0 00 | Branch if not equal
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BNE $08			  ; D0 08 | Branch if not equal
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CMP ($3D,X)		  ; C1 3D | Compare accumulator ((zero page,X))
	SBC ($3D,X)		  ; E1 3D | Subtract with carry ((zero page,X))
	SBC ($2E,X)		  ; E1 2E | Subtract with carry ((zero page,X))
	ORA ($2E),Y		  ; 11 2E | Logical OR with accumulator ((zero page),Y)
	ORA ($2F),Y		  ; 11 2F | Logical OR with accumulator ((zero page),Y)
	BPL $3F			  ; 10 3F | Branch if positive
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_08F
; Address: $F0A581
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_08F:
	CPX #$FB			 ; E0 FB | Compare X register (immediate)
	CPX #$F9			 ; E0 F9 | Compare X register (immediate)
	CPX #$F9			 ; E0 F9 | Compare X register (immediate)
	CPX #$F9			 ; E0 F9 | Compare X register (immediate)
	CPX #$D9			 ; E0 D9 | Compare X register (immediate)
	CPX $DE			  ; E4 DE | Compare X register (zero page)
	CPX #$DE			 ; E0 DE | Compare X register (immediate)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	ASL $1E01,X		  ; 1E 01 1E | Arithmetic shift left (absolute,X)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	INC $7F01,X		  ; FE 01 7F | Increment (absolute,X)
	STA ($35,X)		  ; 81 35 | Store accumulator to (zero page,X)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	BRA $7F			  ; 80 7F | Branch always
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	CMP #$36			 ; C9 36 | Compare accumulator (immediate)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CMP $D9FF,Y		  ; D9 FF D9 | Compare accumulator (absolute,Y)
	STA $3FFF,Y		  ; 99 FF 3F | Store accumulator to absolute,Y
	SED				  ; F8 | Set decimal mode flag
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	AND $FFC6,Y		  ; 39 C6 FF | Logical AND with accumulator (absolute,Y)
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	SBC ($1F,X)		  ; E1 1F | Subtract with carry ((zero page,X))
	SBC ($E0,X)		  ; E1 E0 | Game work RAM access
	CPX #$C3			 ; E0 C3 | Compare X register (immediate)
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	ADC $F5EB,X		  ; 7D EB F5 | Add with carry (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA $19FF,Y		  ; 19 FF 19 | Logical OR with accumulator (absolute,Y)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	SBC $F5F9,Y		  ; F9 F9 F5 | Subtract with carry (absolute,Y)
	SBC ($E5),Y		  ; F1 E5 | Subtract with carry ((zero page),Y)
	CPX $E3			  ; E4 E3 | Compare X register (zero page)
	BEQ $FD			  ; F0 FD | Branch if equal

;------------------------------------------------------------------------------
; Bank60_DmaFunction_090
; Address: $F0A699
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_090:
	INX				  ; E8 | Increment X register
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	LDY #$A2			 ; A0 A2 | Load immediate value into Y register
	LDA				  ; BF A2 BF E0 | Load from absolute long,X into accumulator
	LDA				  ; BF E0 BF 60 | Load from absolute long,X into accumulator
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $C0			  ; 80 C0 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA $1FE1,X		  ; 1D E1 1F | Logical OR with accumulator (absolute,X)
	ASL $0C00,X		  ; 1E 00 0C | Arithmetic shift left (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F E2 1F E2 | Store accumulator to absolute long,X
	ORA $1D00,X		  ; 1D 00 1D | Logical OR with accumulator (absolute,X)
	ORA $0D00			; 0D 00 0D | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	CPX $EC60			; EC 60 EC | Compare X register (absolute)
	ADC ($EE,X)		  ; 61 EE | Add with carry ((zero page,X))
	ADC ($EF),Y		  ; 71 EF | Add with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_091
; Address: $F0A70D
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_091:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BMI $AE			  ; 30 AE | Branch if negative
	ORA ($9E),Y		  ; 11 9E | Logical OR with accumulator ((zero page),Y)
	ORA ($9E,X)		  ; 01 9E | Logical OR with accumulator ((zero page,X))
	ORA ($9E,X)		  ; 01 9E | Logical OR with accumulator ((zero page,X))
	ORA ($9E,X)		  ; 01 9E | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BMI $60			  ; 30 60 | Branch if negative
	TYA				  ; 98 | Transfer Y register to accumulator
	BEQ $08			  ; F0 08 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($7F,X)		  ; 01 7F | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $FF07,X		  ; FE 07 FF | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_092
; Address: $F0A74D
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_092:
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_093
; Address: $F0A787
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_093:
	BVS $FF			  ; 70 FF | Branch if overflow set
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_095
; Address: $F0A796
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_095:
	BVS $70			  ; 70 70 | Branch if overflow set
	SBC $FF1D,X		  ; FD 1D FF | Subtract with carry (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	INC $E3FE,X		  ; FE FE E3 | Increment (absolute,X)
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $DEFF,X		  ; FE FF DE | Increment (absolute,X)
	ASL $4E01			; 0E 01 4E | Arithmetic shift left (absolute)
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_097
; Address: $F0A80D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_097:
	LSR				  ; 4A | Logical shift right (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	LDY #$DF			 ; A0 DF | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank60_DmaFunction_098
; Address: $F0A817
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_098:
	JSR $00BF			; 20 BF 00 | Jump to subroutine
	LDA				  ; BF 00 BD 00 | Load from absolute long,X into accumulator
	STZ $8000			; 9C 00 80 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank60_DmaFunction_099
; Address: $F0A822
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_099:
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	INX				  ; E8 | Increment X register
	SBC $EA			  ; E5 EA | Subtract with carry (zero page)
	SBC ($EE,X)		  ; E1 EE | Subtract with carry ((zero page,X))
	SBC ($E6,X)		  ; E1 E6 | Subtract with carry ((zero page,X))
	CPX #$F2			 ; E0 F2 | Compare X register (immediate)
	CPX #$F2			 ; E0 F2 | Compare X register (immediate)
	BEQ $E6			  ; F0 E6 | Branch if equal
	PEA #$1EF6		   ; F4 F6 1E | Push effective address to stack
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BEQ $0C			  ; F0 0C | Branch if equal
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	ASL $0C0E			; 0E 0E 0C | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_09A
; Address: $F0A902
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_09A:
	JSR $73DF			; 20 DF 73 | Jump to subroutine
	STY $00FF			; 8C FF 00 | Store Y register to absolute address
	STY $008C			; 8C 8C 00 | Store Y register to absolute address
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ASL $3FFF,X		  ; 1E FF 3F | Arithmetic shift left (absolute,X)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $3F1E,X		  ; 1E 1E 3F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_09B
; Address: $F0A945
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_09B:
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ORA $6DFF			; 0D FF 6D | Logical OR with accumulator (absolute)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $6D08			; 0D 08 6D | Logical OR with accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX $FCFF			; EC FF FC | Compare X register (absolute)
	INC $EEEF,X		  ; FE EF EE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	BVC $AC			  ; 50 AC | Branch if overflow clear
	BVC $84			  ; 50 84 | Branch if overflow clear
	SEI				  ; 78 | Set interrupt disable flag
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	LDA				  ; BF 1F FF 6B | Load from absolute long,X into accumulator
	JMP $0B086B		  ; 5C 6B 08 0B | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	INC $7FFE,X		  ; FE FE 7F | Increment (absolute,X)
	ORA ($DE,X)		  ; 01 DE | Logical OR with accumulator ((zero page,X))
	DEC $8C8C,X		  ; DE 8C 8C | Decrement (absolute,X)
	DEY				  ; 88 | Decrement Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BNE $C0			  ; D0 C0 | Branch if not equal
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BCS $DF			  ; B0 DF | Branch if carry set
	LDA $D8D6			; AD D6 D8 | Load from absolute address into accumulator
	SBC $FD76,X		  ; FD 76 FD | Subtract with carry (absolute,X)
	SBC $ED3E			; ED 3E ED | Subtract with carry (absolute)
	LDX $F75E,Y		  ; BE 5E F7 | Load from absolute,Y into X register
	LSR $5EF7,X		  ; 5E F7 5E | Logical shift right (absolute,X)
	DEC $C67F,X		  ; DE 7F C6 | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_09C
; Address: $F0A9EA
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_09C:
	DEC $7F			  ; C6 7F | Decrement (zero page)
	DEC $7F			  ; C6 7F | Decrement (zero page)
	DEC $7F			  ; C6 7F | Decrement (zero page)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	STY $8CFF			; 8C FF 8C | Store Y register to absolute address
	CLD				  ; D8 | Clear decimal mode flag
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	BMI $FF			  ; 30 FF | Branch if negative
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	INC $FE3F,X		  ; FE 3F FE | Increment (absolute,X)
	INC $FE3F,X		  ; FE 3F FE | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $CF			  ; 80 CF | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_09D
; Address: $F0AA45
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_09D:
	JSR $00EF			; 20 EF 00 | Jump to subroutine
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $E0			  ; 10 E0 | Game work RAM access
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 60 FF 00 | Store accumulator to absolute long,X
	PHP				  ; 08 | Push processor status to stack
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_09F
; Address: $F0AA78
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_09F:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0A0
; Address: $F0AAA5
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0A0:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $C0FF,X		  ; FE FF C0 | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $C0FE,X		  ; FE FE C0 | Increment (absolute,X)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ORA ($E7,X)		  ; 01 E7 | Logical OR with accumulator ((zero page,X))
	ASL $E7			  ; 06 E7 | Arithmetic shift left (zero page)
	STY $F8FF			; 8C FF F8 | Store Y register to absolute address
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ASL $941E,X		  ; 1E 1E 94 | Arithmetic shift left (absolute,X)
	STZ $F8F8			; 9C F8 F8 | Store zero to absolute
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC $FFF2,X		  ; FD F2 FF | Subtract with carry (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FB			  ; F0 FB | Branch if equal
	CPX $FB			  ; E4 FB | Compare X register (zero page)
	CPX $79			  ; E4 79 | Compare X register (zero page)
	ROR $59			  ; 66 59 | Rotate right (zero page)
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	STA				  ; 9F FF FF EF | Store accumulator to absolute long,X
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	STA				  ; 9F 00 FF 00 | Store accumulator to absolute long,X
	BCC $7F			  ; 90 7F | Branch if carry clear
	BCC $F8			  ; 90 F8 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	STY $86			  ; 84 86 | Store Y register to zero page
	BRA $8D			  ; 80 8D | Branch always
	STA $FE82			; 8D 82 FE | Store accumulator to absolute address
	SED				  ; F8 | Set decimal mode flag
	PEA #$F47B		   ; F4 7B F4 | Push effective address to stack
	ADC $79F6,Y		  ; 79 F6 79 | Add with carry (absolute,Y)
	BMI $30			  ; 30 30 | Branch if negative

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0A1
; Address: $F0AB89
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0A1:
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))
	ORA ($75,X)		  ; 01 75 | Logical OR with accumulator ((zero page,X))
	DEC $FE1B			; CE 1B FE | Decrement (absolute)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $87			  ; F0 87 | Branch if equal
	STA $FF9FFF		  ; 8F FF 9F FF | Store accumulator to absolute long address
	STA				  ; 9F FF FF FB | Store accumulator to absolute long,X
	INC $FCE7,X		  ; FE E7 FC | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BEQ $1F			  ; F0 1F | Branch if equal
	BEQ $9F			  ; F0 9F | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0A2
; Address: $F0ABE1
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0A2:
	INC $FF3F,X		  ; FE 3F FF | Increment (absolute,X)
	ADC $38E7,Y		  ; 79 E7 38 | Add with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $E1			  ; 10 E1 | Branch if positive
	BPL $E1			  ; 10 E1 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	BEQ $68			  ; F0 68 | Branch if equal
	BCC $F8			  ; 90 F8 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	BEQ $18			  ; F0 18 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($9F,X)		  ; 01 9F | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0A4
; Address: $F0AC2F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0A4:
	ADC ($07),Y		  ; 71 07 | Add with carry ((zero page),Y)
	LDA				  ; BF BF FF FF | Load from absolute long,X into accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0A6
; Address: $F0AC3C
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0A6:
	ADC ($70),Y		  ; 71 70 | Add with carry ((zero page),Y)
	ADC ($70),Y		  ; 71 70 | Add with carry ((zero page),Y)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	BMI $FF			  ; 30 FF | Branch if negative
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BMI $30			  ; 30 30 | Branch if negative
	BRA $FF			  ; 80 FF | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	BIT $00FF			; 2C FF 00 | Test bits in accumulator (absolute)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	SBC $FD1F,X		  ; FD 1F FD | Subtract with carry (absolute,X)
	SBC $F9FF,Y		  ; F9 FF F9 | Subtract with carry (absolute,Y)
	SBC $F9FF,Y		  ; F9 FF F9 | Subtract with carry (absolute,Y)
	SBC $50FF,Y		  ; F9 FF 50 | Subtract with carry (absolute,Y)
	BPL $0F			  ; 10 0F | Branch if positive
	BEQ $EF			  ; F0 EF | Branch if equal
	BEQ $EF			  ; F0 EF | Branch if equal
	BEQ $EF			  ; F0 EF | Branch if equal
	BEQ $EF			  ; F0 EF | Branch if equal
	BEQ $CF			  ; F0 CF | Branch if equal
	BEQ $8F			  ; F0 8F | Branch if equal
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF BF FF FF | Load from absolute long,X into accumulator
	BEQ $3B			  ; F0 3B | Branch if equal
	SBC $FB1B,Y		  ; F9 1B FB | Subtract with carry (absolute,Y)
	BNE $0F			  ; D0 0F | Branch if not equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ASL $0CF8			; 0E F8 0C | Arithmetic shift left (absolute)
	ORA $FC			  ; 05 FC | Logical OR with accumulator (zero page)
	DEC $C0			  ; C6 C0 | Decrement (zero page)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0A7
; Address: $F0AD2A
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0A7:
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BEQ $7F			  ; F0 7F | Branch if equal
	BEQ $1F			  ; F0 1F | Branch if equal
	ORA $F7			  ; 05 F7 | Logical OR with accumulator (zero page)
	ORA $F7			  ; 05 F7 | Logical OR with accumulator (zero page)
	ORA $F7			  ; 05 F7 | Logical OR with accumulator (zero page)
	ORA $F7			  ; 05 F7 | Logical OR with accumulator (zero page)
	ORA $37			  ; 05 37 | Logical OR with accumulator (zero page)
	ORA $0E37			; 0D 37 0E | Logical OR with accumulator (absolute)
	BEQ $0A			  ; F0 0A | Branch if equal
	BEQ $0A			  ; F0 0A | Branch if equal
	BEQ $0A			  ; F0 0A | Branch if equal
	BEQ $0A			  ; F0 0A | Branch if equal
	BEQ $0A			  ; F0 0A | Branch if equal
	BEQ $0A			  ; F0 0A | Branch if equal
	BEQ $09			  ; F0 09 | Branch if equal
	BEQ $F4			  ; F0 F4 | Branch if equal
	INC $DF			  ; E6 DF | Increment (zero page)
	INC $D7			  ; E6 D7 | Increment (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	AND $7C00,Y		  ; 39 00 7C | Logical AND with accumulator (absolute,Y)
	BRA $FF			  ; 80 FF | Branch always
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	BCS $FF			  ; B0 FF | Branch if carry set
	BCS $FF			  ; B0 FF | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	SBC $FB0C,Y		  ; F9 0C FB | Subtract with carry (absolute,Y)
	INC $FF0F,X		  ; FE 0F FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0A8
; Address: $F0ADF0
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0A8:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $487F			; 8C 7F 48 | Store Y register to absolute address
	LDX $3EFF,Y		  ; BE FF 3E | Load from absolute,Y into X register
	WDM #$FF			 ; 42 FF | Reserved instruction
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$8C			 ; E0 8C | Compare X register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	LDX $3E3E,Y		  ; BE 3E 3E | Load from absolute,Y into X register
	ROL $0242,X		  ; 3E 42 02 | Rotate left (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $FE1E,X		  ; FE 1E FE | Increment (absolute,X)
	INC $FF0F,X		  ; FE 0F FF | Increment (absolute,X)
	ASL $0E1F,X		  ; 1E 1F 0E | Arithmetic shift left (absolute,X)
	STA ($B9,X)		  ; 81 B9 | Store accumulator to (zero page,X)
	STA ($91,X)		  ; 81 91 | Store accumulator to (zero page,X)
	STA ($85,X)		  ; 81 85 | Store accumulator to (zero page,X)
	BRA $80			  ; 80 80 | Branch always
	ROR $4EB1			; 6E B1 4E | Rotate right (absolute)
	JMP ($7FC1)		  ; 6C C1 7F | Jump to address (absolute indirect)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BRA $3F			  ; 80 3F | Branch always
	CPX #$9F			 ; E0 9F | Compare X register (immediate)
	BEQ $DF			  ; F0 DF | Branch if equal
	AND ($F8,X)		  ; 21 F8 | Logical AND with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $F0FE,X		  ; FE FE F0 | Increment (absolute,X)
	BEQ $CF			  ; F0 CF | Branch if equal
	BEQ $8F			  ; F0 8F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	SBC ($DE,X)		  ; E1 DE | Subtract with carry ((zero page,X))
	SBC ($9E,X)		  ; E1 9E | Subtract with carry ((zero page,X))
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	CPY #$EF			 ; C0 EF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	PHP				  ; 08 | Push processor status to stack
	ROR $7E0C,X		  ; 7E 0C 7E | Rotate right (absolute,X)
	LSR $3F1F,X		  ; 5E 1F 3F | Logical shift right (absolute,X)
	BPL $EF			  ; 10 EF | Branch if positive

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0A9
; Address: $F0AEB2
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0A9:
	BPL $EF			  ; 10 EF | Branch if positive
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	LDA ($5E,X)		  ; A1 5E | Load from (zero page,X) into accumulator
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	PLX				  ; FA | Pull X register from stack
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag
	STA $8DDD			; 8D DD 8D | Store accumulator to absolute address
	CMP $FC04,X		  ; DD 04 FC | Compare accumulator (absolute,X)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	DEC $DE23,X		  ; DE 23 DE | Decrement (absolute,X)
	SEP #$60			 ; E2 60 | Set processor status bits
	BVS $E5			  ; 70 E5 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0AA
; Address: $F0AEE6
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0AA:
	CMP #$C2			 ; C9 C2 | Compare accumulator (immediate)
	CMP #$C2			 ; C9 C2 | Compare accumulator (immediate)
	CMP $50C6,Y		  ; D9 C6 50 | Compare accumulator (absolute,Y)
	LSR $50			  ; 46 50 | Logical shift right (zero page)
	LSR $78			  ; 46 78 | Logical shift right (zero page)
	BVS $0F			  ; 70 0F | Branch if overflow set
	ORA $39C6,X		  ; 1D C6 39 | Logical OR with accumulator (absolute,X)
	DEC $39			  ; C6 39 | Decrement (zero page)
	DEC $39			  ; C6 39 | Decrement (zero page)
	BCS $4F			  ; B0 4F | Branch if carry set
	BCS $57			  ; B0 57 | Branch if carry set
	ROL $2E57			; 2E 57 2E | Rotate left (absolute)
	ASL $EF			  ; 06 EF | Arithmetic shift left (zero page)
	STA $148F14		  ; 8F 14 8F 14 | Store accumulator to absolute long address
	AND #$D0			 ; 29 D0 | Logical AND with accumulator (immediate)
	AND #$D0			 ; 29 D0 | Logical AND with accumulator (immediate)
	ORA $1BE0,Y		  ; 19 E0 1B | Logical OR with accumulator (absolute,Y)
	CPX #$7B			 ; E0 7B | Compare X register (immediate)
	BRA $7B			  ; 80 7B | Branch always
	BRA $FB			  ; 80 FB | Branch always
	JMP $E15CA3		  ; 5C A3 5C E1 | Jump to address long
	ASL $1EE1,X		  ; 1E E1 1E | Arithmetic shift left (absolute,X)
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0AB
; Address: $F0AF4A
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0AB:
	BRA $FF			  ; 80 FF | Branch always
	SBC $0000,X		  ; FD 00 00 | Subtract with carry (absolute,X)
	LDA				  ; BF 71 BF 71 | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	INC $FDFE,X		  ; FE FE FD | Increment (absolute,X)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	INC $FD01,X		  ; FE 01 FD | Increment (absolute,X)
	INC $FC01,X		  ; FE 01 FC | Increment (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	PEA #$00F0		   ; F4 F0 00 | Push effective address to stack
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $FF86,X		  ; FE 86 FF | Increment (absolute,X)
	ORA $1D1D,X		  ; 1D 1D 1D | Logical OR with accumulator (absolute,X)
	ORA $0003,X		  ; 1D 03 00 | Logical OR with accumulator (absolute,X)
	STX $01			  ; 86 01 | Store X register to zero page
	BRA $3F			  ; 80 3F | Branch always
	CPY #$1D			 ; C0 1D | Compare Y register (immediate)
	SEP #$1D			 ; E2 1D | Set processor status bits
	SEP #$E7			 ; E2 E7 | Set processor status bits
	LDY #$98			 ; A0 98 | Load immediate value into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BCS $28			  ; B0 28 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $08FF,Y		  ; B9 FF 08 | Load from absolute,Y into accumulator
	BIT $0CE7			; 2C E7 0C | Test bits in accumulator (absolute)
	ORA $47EE			; 0D EE 47 | Logical OR with accumulator (absolute)
	STY $C447			; 8C 47 C4 | Store Y register to absolute address
	CPY $07			  ; C4 07 | Compare Y register (zero page)
	ADC $7179,Y		  ; 79 79 71 | Add with carry (absolute,Y)
	ADC ($61),Y		  ; 71 61 | Add with carry ((zero page),Y)
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	ORA ($A1,X)		  ; 01 A1 | Logical OR with accumulator ((zero page,X))
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	ASL $9E71			; 0E 71 9E | Arithmetic shift left (absolute)
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	INC $FCF8,X		  ; FE F8 FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC $F9FD,Y		  ; F9 FD F9 | Subtract with carry (absolute,Y)
	SBC $1EE1,X		  ; FD E1 1E | Subtract with carry (absolute,X)
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	REP #$3D			 ; C2 3D | Reset processor status bits
	REP #$3D			 ; C2 3D | Reset processor status bits

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0AC
; Address: $F0B090
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0AC:
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	STA $81FD			; 8D FD 81 | Store accumulator to absolute address
	SBC ($E7,X)		  ; E1 E7 | Subtract with carry ((zero page,X))
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))
	INC $FE1F,X		  ; FE 1F FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $3F			  ; F0 3F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $CEF1,X		  ; FE F1 CE | Increment (absolute,X)
	SBC $509E,Y		  ; F9 9E 50 | Subtract with carry (absolute,Y)
	LSR $10			  ; 46 10 | Logical shift right (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BMI $3F			  ; 30 3F | Branch if negative
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SBC ($FE,X)		  ; E1 FE | Subtract with carry ((zero page,X))
	BCS $0F			  ; B0 0F | Branch if carry set
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$EF			 ; C0 EF | Compare Y register (immediate)
	BPL $8F			  ; 10 8F | Branch if positive
	BVS $8F			  ; 70 8F | Branch if overflow set
	BVS $0F			  ; 70 0F | Branch if overflow set
	TYA				  ; 98 | Transfer Y register to accumulator
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SBC $7D06,Y		  ; F9 06 7D | Subtract with carry (absolute,Y)
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	BRA $3F			  ; 80 3F | Branch always
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BCC $00			  ; 90 00 | Branch if carry clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0AD
; Address: $F0B13E
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0AD:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC $FC07,X		  ; FE 07 FC | Increment (absolute,X)
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	BEQ $7F			  ; F0 7F | Branch if equal
	BEQ $3F			  ; F0 3F | Branch if equal
	BEQ $3F			  ; F0 3F | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	AND ($DF),Y		  ; 31 DF | Logical AND with accumulator ((zero page),Y)
	ROL $FF			  ; 26 FF | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0AF
; Address: $F0B1B0
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0AF:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BCC $00			  ; 90 00 | Branch if carry clear
	CMP $DF00,Y		  ; D9 00 DF | Compare accumulator (absolute,Y)
	INC $E8FE,X		  ; FE FE E8 | Increment (absolute,X)
	INX				  ; E8 | Increment X register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $FE			  ; 80 FE | Branch always
	ORA ($E8,X)		  ; 01 E8 | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	LDX $3E00,Y		  ; BE 00 3E | Load from absolute,Y into X register
	BRA $BE			  ; 80 BE | Branch always
	LDA				  ; BF 00 BF 40 | Load from absolute long,X into accumulator
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF C0 3F 40 | Load from absolute long,X into accumulator
	LDA				  ; BF 40 BF 40 | Load from absolute long,X into accumulator
	LDA				  ; BF 06 F9 15 | Load from absolute long,X into accumulator
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA $F2			  ; 05 F2 | Logical OR with accumulator (zero page)
	ORA $EE11			; 0D 11 EE | Logical OR with accumulator (absolute)
	ORA $0FF2			; 0D F2 0F | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0B0
; Address: $F0B21F
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0B0:
	BEQ $08			  ; F0 08 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	AND $3D48,X		  ; 3D 48 3D | Logical AND with accumulator (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($86,X)		  ; 41 86 | Exclusive OR with accumulator ((zero page,X))
	CMP ($06,X)		  ; C1 06 | Compare accumulator ((zero page,X))
	CMP $02			  ; C5 02 | Compare accumulator (zero page)
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	STX $06			  ; 86 06 | Store X register to zero page
	STX $06			  ; 86 06 | Store X register to zero page
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	AND $19FF,Y		  ; 39 FF 19 | Logical AND with accumulator (absolute,Y)
	SBC $FDFF,Y		  ; F9 FF FD | Subtract with carry (absolute,Y)
	SBC $F9F9,Y		  ; F9 F9 F9 | Subtract with carry (absolute,Y)
	SBC $F9F9,Y		  ; F9 F9 F9 | Subtract with carry (absolute,Y)
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	INC $1F			  ; E6 1F | Increment (zero page)
	INC $FE07,X		  ; FE 07 FE | Increment (absolute,X)
	INC $EFD7,X		  ; FE D7 EF | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BIT #$8F			 ; 89 8F | Test bits in accumulator (immediate)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	CPX $E1			  ; E4 E1 | Compare X register (zero page)
	BVS $FF			  ; 70 FF | Branch if overflow set
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CPX $6CE3			; EC E3 6C | Compare X register (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$FE			 ; E0 FE | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0B1
; Address: $F0B2E1
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0B1:
	ADC $79FE,Y		  ; 79 FE 79 | Add with carry (absolute,Y)
	INC $FEF1,X		  ; FE F1 FE | Increment (absolute,X)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SBC ($F8),Y		  ; F1 F8 | Subtract with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $FE0F,X		  ; FE 0F FE | Increment (absolute,X)
	INC $FE0F,X		  ; FE 0F FE | Increment (absolute,X)
	INC $FE03,X		  ; FE 03 FE | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	PHP				  ; 08 | Push processor status to stack
	ORA $08FF			; 0D FF 08 | Logical OR with accumulator (absolute)
	ORA $8FFA			; 0D FA 8F | Logical OR with accumulator (absolute)
	SED				  ; F8 | Set decimal mode flag
	STA $F88FF8		  ; 8F F8 8F F8 | Store accumulator to absolute long address
	STA $F80FF8		  ; 8F F8 0F F8 | Store accumulator to absolute long address
	STA				  ; 9F F0 07 00 | Store accumulator to absolute long,X
	BEQ $3F			  ; F0 3F | Branch if equal
	PEA #$FE0F		   ; F4 0F FE | Push effective address to stack
	INC $FE0F,X		  ; FE 0F FE | Increment (absolute,X)
	INC $FF0F,X		  ; FE 0F FF | Increment (absolute,X)
	STA $C027FF		  ; 8F FF 27 C0 | Store accumulator to absolute long address
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	CLD				  ; D8 | Clear decimal mode flag
	INC $E37F,X		  ; FE 7F E3 | Increment (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	CPY #$E0			 ; C0 E0 | Game work RAM access
	STA ($01),Y		  ; 91 01 | Store accumulator to (zero page),Y

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0B2
; Address: $F0B3C0
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0B2:
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	BIT $1A			  ; 24 1A | Test bits in accumulator (zero page)
	BIT $2ED3			; 2C D3 2E | Test bits in accumulator (absolute)
	INC $F837,X		  ; FE 37 F8 | Increment (absolute,X)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	BNE $FD			  ; D0 FD | Branch if not equal
	INY				  ; C8 | Increment Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC $FD00,X		  ; FD 00 FD | Subtract with carry (absolute,X)
	STA $C000,Y		  ; 99 00 C0 | Store accumulator to absolute,Y

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0B3
; Address: $F0B3E7
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0B3:
	JSR $00E0			; 20 E0 00 | Jump to subroutine
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SEP #$90			 ; E2 90 | Set processor status bits
	PLX				  ; FA | Pull X register from stack
	SBC $06			  ; E5 06 | Subtract with carry (zero page)
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	ROR $99			  ; 66 99 | Rotate right (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ADC $7907,Y		  ; 79 07 79 | Add with carry (absolute,Y)
	CMP $03FF,Y		  ; D9 FF 03 | Compare accumulator (absolute,Y)
	ORA $0DF0			; 0D F0 0D | Logical OR with accumulator (absolute)
	BEQ $2C			  ; F0 2C | Branch if equal
	BNE $FE			  ; D0 FE | Branch if not equal
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	DEC $9CF5,X		  ; DE F5 9C | Decrement (absolute,X)
	SBC $FB20,Y		  ; F9 20 FB | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0B4
; Address: $F0B42A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0B4:
	JSR $08FB			; 20 FB 08 | Jump to subroutine
	BVC $FB			  ; 50 FB | Branch if overflow clear
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	BRA $40			  ; 80 40 | Branch always
	BRA $40			  ; 80 40 | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0B5
; Address: $F0B446
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0B5:
	JSR $1890			; 20 90 18 | Jump to subroutine
	BNE $18			  ; D0 18 | Branch if not equal
	BNE $04			  ; D0 04 | Branch if not equal
	DEY				  ; 88 | Decrement Y register
	ORA #$EE			 ; 09 EE | Logical OR with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	SBC $0002,X		  ; FD 02 00 | Subtract with carry (absolute,X)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($31,X)		  ; 01 31 | Logical OR with accumulator ((zero page,X))
	ASL $26			  ; 06 26 | Arithmetic shift left (zero page)
	CMP ($7F,X)		  ; C1 7F | Compare accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ASL $DFF1			; 0E F1 DF | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0B6
; Address: $F0B47F
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0B6:
	JSR $7F7F			; 20 7F 7F | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	SBC #$E6			 ; E9 E6 | Subtract with carry (immediate)
	CPX #$78			 ; E0 78 | Compare X register (immediate)
	BEQ $88			  ; F0 88 | Branch if equal
	BEQ $04			  ; F0 04 | Branch if equal
	BEQ $04			  ; F0 04 | Branch if equal
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BPL $10			  ; 10 10 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $7E			  ; F0 7E | Branch if equal
	STA ($FC,X)		  ; 81 FC | Store accumulator to (zero page,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	DEC				  ; 3A | Decrement accumulator
	LDA				  ; BF 43 7F 37 | Load from absolute long,X into accumulator
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$FD			 ; C0 FD | Compare Y register (immediate)
	SBC $FC00,X		  ; FD 00 FC | Subtract with carry (absolute,X)
	BRA $C8			  ; 80 C8 | Branch always
	INC $F605,X		  ; FE 05 F6 | Increment (absolute,X)
	ASL $1EE7,X		  ; 1E E7 1E | Arithmetic shift left (absolute,X)
	DEC $DF31			; CE 31 DF | Decrement (absolute)
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	SBC $FB00,Y		  ; F9 00 FB | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	WDM #$BD			 ; 42 BD | Reserved instruction
	WDM #$BD			 ; 42 BD | Reserved instruction
	PEA #$F708		   ; F4 08 F7 | Push effective address to stack
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	INC $FE03,X		  ; FE 03 FE | Increment (absolute,X)
	SEP #$1F			 ; E2 1F | Set processor status bits
	SEP #$17			 ; E2 17 | Set processor status bits
	REP #$27			 ; C2 27 | Reset processor status bits
	REP #$27			 ; C2 27 | Reset processor status bits
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $04			  ; F0 04 | Branch if equal
	STA				  ; 9F F0 9F F0 | Store accumulator to absolute long,X
	CPX #$FF			 ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0B7
; Address: $F0B567
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0B7:
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	BEQ $FB			  ; F0 FB | Branch if equal
	PEA #$B5FA		   ; F4 FA B5 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	ASL $0F00,X		  ; 1E 00 0F | Arithmetic shift left (absolute,X)
	ADC $FBFD,X		  ; 7D FD FB | Add with carry (absolute,X)
	SBC $FDFB,X		  ; FD FB FD | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PEA #$00C8		   ; F4 C8 00 | Push effective address to stack
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $6C			  ; 80 6C | Branch always
	BRA $2E			  ; 80 2E | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $30			  ; 80 30 | Branch always
	BVS $FF			  ; 70 FF | Branch if overflow set
	BIT $00FF			; 2C FF 00 | Test bits in accumulator (absolute)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	ROL $00FF,X		  ; 3E FF 00 | Rotate left (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	ROL $01FF,X		  ; 3E FF 01 | Rotate left (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	BMI $00			  ; 30 00 | Branch if negative
	BMI $E0			  ; 30 E0 | Game work RAM access
	CLD				  ; D8 | Clear decimal mode flag
	ROL $FF			  ; 26 FF | Rotate left (zero page)
	BEQ $71			  ; F0 71 | Branch if equal
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($42,X)		  ; 01 42 | Hardware register operation
	BEQ $08			  ; F0 08 | Branch if equal
	CPX #$D3			 ; E0 D3 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0B8
; Address: $F0B648
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0B8:
	JSR $FCFF			; 20 FF FC | Jump to subroutine
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	SBC $FE01,X		  ; FD 01 FE | Subtract with carry (absolute,X)
	ADC $FF82,X		  ; 7D 82 FF | Add with carry (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0B9
; Address: $F0B67C
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0B9:
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	SEP #$FF			 ; E2 FF | Set processor status bits
	STA ($FF),Y		  ; 91 FF | Store accumulator to (zero page),Y
	BIT $E3			  ; 24 E3 | Test bits in accumulator (zero page)
	CMP $F7			  ; C5 F7 | Compare accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ROL $7FFE,X		  ; 3E FE 7F | Rotate left (absolute,X)
	DEC $F8E1,X		  ; DE E1 F8 | Decrement (absolute,X)
	STA $7F83FC		  ; 8F FC 83 7F | Store accumulator to absolute long address
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	CPY #$FB			 ; C0 FB | Compare Y register (immediate)
	ORA $87			  ; 05 87 | Logical OR with accumulator (zero page)
	ADC $738F,Y		  ; 79 8F 73 | Add with carry (absolute,Y)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	DEY				  ; 88 | Decrement Y register
	BRA $7B			  ; 80 7B | Branch always
	BRA $FB			  ; 80 FB | Branch always
	EOR ($FE,X)		  ; 41 FE | Exclusive OR with accumulator ((zero page,X))
	EOR $9DFE,Y		  ; 59 FE 9D | Exclusive OR with accumulator (absolute,Y)
	INC $FF3E,X		  ; FE 3E FF | Increment (absolute,X)
	STA $008700		  ; 8F 00 87 00 | Store accumulator to absolute long address
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($F3,X)		  ; 01 F3 | Logical OR with accumulator ((zero page,X))
	ORA ($F3,X)		  ; 01 F3 | Logical OR with accumulator ((zero page,X))
	STA ($7B,X)		  ; 81 7B | Store accumulator to (zero page,X)
	STA ($7A,X)		  ; 81 7A | Store accumulator to (zero page,X)
	BRA $79			  ; 80 79 | Branch always
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $FE			  ; D0 FE | Branch if not equal
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	AND $38F6,Y		  ; 39 F6 38 | Logical AND with accumulator (absolute,Y)
	BMI $EF			  ; 30 EF | Branch if negative
	BMI $CF			  ; 30 CF | Branch if negative
	CPX #$5F			 ; E0 5F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0BB
; Address: $F0B758
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0BB:
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BPL $EB			  ; 10 EB | Branch if positive
	SBC $F800,Y		  ; F9 00 F8 | Subtract with carry (absolute,Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BVS $EA			  ; 70 EA | Branch if overflow set
	BVS $EA			  ; 70 EA | Branch if overflow set
	BVS $C8			  ; 70 C8 | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0BD
; Address: $F0B78B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0BD:
	RTI				  ; 40 | Return from interrupt
	STA $9D02,X		  ; 9D 02 9D | Store accumulator to absolute,X
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $1800,Y		  ; 19 00 18 | Logical OR with accumulator (absolute,Y)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0BE
; Address: $F0B7BD
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0BE:
	JSR $30CF			; 20 CF 30 | Jump to subroutine
	BEQ $7F			  ; F0 7F | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	INY				  ; C8 | Increment Y register
	BEQ $FF			  ; F0 FF | Branch if equal
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $F3			  ; F0 F3 | Branch if equal
	JMP $0000			; 4C 00 00 | Jump to address
	LDA				  ; BF 00 FF FF | Load from absolute long,X into accumulator
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	BRA $FF			  ; 80 FF | Branch always
	ROL $C1C1,X		  ; 3E C1 C1 | Rotate left (absolute,X)
	LDX $07F8,Y		  ; BE F8 07 | Load from absolute,Y into X register
	SED				  ; F8 | Set decimal mode flag
	STA $1F0FFC		  ; 8F FC 0F 1F | Store accumulator to absolute long address
	CPX #$83			 ; E0 83 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	SBC $F50E,Y		  ; F9 0E F5 | Subtract with carry (absolute,Y)
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0BF
; Address: $F0B887
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0BF:
	BEQ $FE			  ; F0 FE | Branch if equal
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $0671,X		  ; FE 71 06 | Increment (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $C54200		  ; 8F 00 42 C5 | Store accumulator to absolute long address
	RTI				  ; 40 | Return from interrupt
	STA $80C780		  ; 8F 80 C7 80 | Store accumulator to absolute long address
	ASL $7FF1			; 0E F1 7F | Arithmetic shift left (absolute)
	STX $3F			  ; 86 3F | Store X register to zero page
	SBC $F000,Y		  ; F9 00 F0 | Subtract with carry (absolute,Y)
	BPL $EF			  ; 10 EF | Branch if positive
	ORA $2037			; 0D 37 20 | Logical OR with accumulator (absolute)
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	INC $1FFF,X		  ; FE FF 1F | Increment (absolute,X)
	INC $7001,X		  ; FE 01 70 | Increment (absolute,X)
	STA $003C00		  ; 8F 00 3C 00 | Store accumulator to absolute long address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ROR $FFEF,X		  ; 7E EF FF | Rotate right (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CMP ($A6,X)		  ; C1 A6 | Compare accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$1D			 ; E0 1D | Compare X register (immediate)
	REP #$FF			 ; C2 FF | Reset processor status bits
	STA $F30E71		  ; 8F 71 0E F3 | Store accumulator to absolute long address
	AND ($07),Y		  ; 31 07 | Logical AND with accumulator ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	AND $FF00,X		  ; 3D 00 FF | Logical AND with accumulator (absolute,X)
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	INC $D8FF,X		  ; FE FF D8 | Increment (absolute,X)
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC ($F3),Y		  ; F1 F3 | Subtract with carry ((zero page),Y)
	CPY $EEF0			; CC F0 EE | Compare Y register (absolute)
	INC $C011			; EE 11 C0 | Increment (absolute)
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	REP #$60			 ; C2 60 | Reset processor status bits
	STX $86			  ; 86 86 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0C0
; Address: $F0B985
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0C0:
	ORA $0003,Y		  ; 19 03 00 | Logical OR with accumulator (absolute,Y)
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	LDY $F807,X		  ; BC 07 F8 | Load from absolute,X into Y register
	BPL $06			  ; 10 06 | Branch if positive
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0C1
; Address: $F0B9A5
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0C1:
	JSR $A00F			; 20 0F A0 | Jump to subroutine
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $DF07,X		  ; FE 07 DF | Increment (absolute,X)
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	BRA $E7			  ; 80 E7 | Branch always
	CLC				  ; 18 | Clear carry flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BEQ $1E			  ; F0 1E | Branch if equal
	SBC ($01,X)		  ; E1 01 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0C2
; Address: $F0B9E2
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0C2:
	JSR $06C0			; 20 C0 06 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($C6,X)		  ; 01 C6 | Logical OR with accumulator ((zero page,X))
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	SEC				  ; 38 | Set carry flag
	SBC $3F01,X		  ; FD 01 3F | Subtract with carry (absolute,X)
	ADC ($1E,X)		  ; 61 1E | Add with carry ((zero page,X))
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA #$FA			 ; 09 FA | Logical OR with accumulator (immediate)
	ASL $19F0			; 0E F0 19 | Arithmetic shift left (absolute)
	INC $FE			  ; E6 FE | Increment (zero page)
	LDA ($31),Y		  ; B1 31 | Load from (zero page),Y into accumulator
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	JMP $602FC0		  ; 5C C0 2F 60 | Jump to address long
	DEC $FF00			; CE 00 FF | Decrement (absolute)
	STA				  ; 9F 00 F9 FF | Store accumulator to absolute long,X
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ROL $E33F,X		  ; 3E 3F E3 | Rotate left (absolute,X)
	PEA #$D907		   ; F4 07 D9 | Push effective address to stack
	AND ($1E,X)		  ; 21 1E | Logical AND with accumulator ((zero page,X))
	STA				  ; 9F 60 00 00 | Store accumulator to absolute long,X
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BPL $9F			  ; 10 9F | Branch if positive
	SBC ($11),Y		  ; F1 11 | Subtract with carry ((zero page),Y)
	INC $3F40			; EE 40 3F | Increment (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0C3
; Address: $F0BA74
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0C3:
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 9F 00 FF | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0C4
; Address: $F0BA8C
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0C4:
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 20 CF 60 | Load from absolute long,X into accumulator
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	LDA				  ; BF FF 3D FC | Load from absolute long,X into accumulator
	BEQ $F0			  ; F0 F0 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	REP #$21			 ; C2 21 | PPU graphics register access
	DEC $0000,X		  ; DE 00 00 | Decrement (absolute,X)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	CMP ($C0,X)		  ; C1 C0 | Compare accumulator ((zero page,X))
	ROR $F0FE,X		  ; 7E FE F0 | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	BPL $EF			  ; 10 EF | Branch if positive
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	STX $06			  ; 86 06 | Store X register to zero page
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	STZ $0080			; 9C 80 00 | Store zero to absolute
	SBC $C700,Y		  ; F9 00 C7 | Subtract with carry (absolute,Y)
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BEQ $1E			  ; F0 1E | Branch if equal
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	LSR $C6			  ; 46 C6 | Logical shift right (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	AND $1F00,Y		  ; 39 00 1F | Logical AND with accumulator (absolute,Y)
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	ADC $0C0D,Y		  ; 79 0D 0C | Add with carry (absolute,Y)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
	ROL $9FBF,X		  ; 3E BF 9F | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0C5
; Address: $F0BB75
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0C5:
	JSR $807F			; 20 7F 80 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BMI $BF			  ; 30 BF | Branch if negative
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0C6
; Address: $F0BB7F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0C6:
	JSR $39C6			; 20 C6 39 | Jump to subroutine
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0C7
; Address: $F0BB92
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0C7:
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	BMI $35			  ; 30 35 | Branch if negative
	DEX				  ; CA | Decrement X register
	BEQ $FF			  ; F0 FF | Branch if equal
	LDA				  ; BF CF CF FF | Load from absolute long,X into accumulator
	INC $EDE1,X		  ; FE E1 ED | Increment (absolute,X)
	DEC $FFCE			; CE CE FF | Decrement (absolute)
	LDA				  ; BF 40 CF 30 | Load from absolute long,X into accumulator
	INC $ED01,X		  ; FE 01 ED | Increment (absolute,X)
	DEC $0231			; CE 31 02 | Decrement (absolute)
	CLC				  ; 18 | Clear carry flag
	ORA $C4C2,Y		  ; 19 C2 C4 | Logical OR with accumulator (absolute,Y)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($F1),Y		  ; F1 F1 | Subtract with carry ((zero page),Y)
	BEQ $03			  ; F0 03 | Branch if equal
	ORA $C7E6,Y		  ; 19 E6 C7 | Logical OR with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0C8
; Address: $F0BBE1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0C8:
	JSR $8070			; 20 70 80 | Jump to subroutine
	BCC $61			  ; 90 61 | Branch if carry clear
	DEC $FFCE			; CE CE FF | Decrement (absolute)
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	DEY				  ; 88 | Decrement Y register
	DEC $FE31			; CE 31 FE | Decrement (absolute)
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0CA
; Address: $F0BC0C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0CA:
	JSR $10CF			; 20 CF 10 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BRA $5D			  ; 80 5D | Branch always
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $7F00,Y		  ; F9 00 7F | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0CB
; Address: $F0BC63
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0CB:
	JSR $C0C0			; 20 C0 C0 | Jump to subroutine
	JMP $0300			; 4C 00 03 | Jump to address
	CLV				  ; B8 | Clear overflow flag
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	DEY				  ; 88 | Decrement Y register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0CC
; Address: $F0BC8F
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0CC:
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	PEA #$F847		   ; F4 47 F8 | Push effective address to stack
	RTI				  ; 40 | Return from interrupt
	STX $E020			; 8E 20 E0 | Game work RAM access
	LDA #$29			 ; A9 29 | Load immediate value into accumulator
	PHP				  ; 08 | Push processor status to stack
	LSR $6031			; 4E 31 60 | Logical shift right (absolute)
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	STA				  ; 9F 00 1F E0 | Store accumulator to absolute long,X
	CPX #$EB			 ; E0 EB | Compare X register (immediate)
	SEP #$E4			 ; E2 E4 | Set processor status bits
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BCC $60			  ; 90 60 | Branch if carry clear
	BPL $E0			  ; 10 E0 | Game work RAM access
	INX				  ; E8 | Increment X register
	BPL $EC			  ; 10 EC | Branch if positive
	BPL $E7			  ; 10 E7 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	CPX #$E0			 ; E0 E0 | Game work RAM access
	STA $F8088F		  ; 8F 8F 08 F8 | Store accumulator to absolute long address
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $7F00,X		  ; 3D 00 7F | Logical AND with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ORA $F1FD			; 0D FD F1 | Logical OR with accumulator (absolute)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	ASL $1F00			; 0E 00 1F | Arithmetic shift left (absolute)
	BMI $30			  ; 30 30 | Branch if negative
	CPX #$E0			 ; E0 E0 | Game work RAM access
	INC $83FE,X		  ; FE FE 83 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BMI $CE			  ; 30 CE | Branch if negative

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0CD
; Address: $F0BD49
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0CD:
	JSR $0000			; 20 00 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	BNE $E8			  ; D0 E8 | Branch if not equal
	BRA $11			  ; 80 11 | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0CE
; Address: $F0BD65
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0CE:
	JSL $D19F60		  ; 22 60 9F D1 | Jump to subroutine long
	ASL $070F			; 0E 0F 07 | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0CF
; Address: $F0BD70
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0CF:
	SED				  ; F8 | Set decimal mode flag
	STA $CC3370		  ; 8F 70 33 CC | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	LDY $FF3F,X		  ; BC 3F FF | Load from absolute,X into Y register
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF 40 FF 00 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0D0
; Address: $F0BD95
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0D0:
	JSR $07F8			; 20 F8 07 | Jump to subroutine
	ROR $F801,X		  ; 7E 01 F8 | Rotate right (absolute,X)
	STA $00004F		  ; 8F 4F 00 00 | Store accumulator to absolute long address

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0D1
; Address: $F0BDAB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0D1:
	JSL $004100		  ; 22 00 41 00 | Jump to subroutine long
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	BMI $00			  ; 30 00 | Branch if negative

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0D2
; Address: $F0BDBA
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0D2:
	JSL $BE41DD		  ; 22 DD 41 BE | Jump to subroutine long
	SBC $FEFF,X		  ; FD FF FE | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	STZ $1CFF			; 9C FF 1C | Store zero to absolute
	SBC $FEFB,Y		  ; F9 FB FE | Subtract with carry (absolute,Y)
	LDX $E0FF,Y		  ; BE FF E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	BEQ $C0			  ; F0 C0 | Branch if equal
	CMP ($80,X)		  ; C1 80 | Compare accumulator ((zero page,X))
	STA				  ; 9F 18 23 F0 | Store accumulator to absolute long,X
	CMP ($9F),Y		  ; D1 9F | Compare accumulator ((zero page),Y)
	STA				  ; 9F BF BF FC | Store accumulator to absolute long,X
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	STA				  ; 9F 60 3F C0 | Store accumulator to absolute long,X
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	STA				  ; 9F 62 BF 4F | Store accumulator to absolute long,X
	CMP $3B			  ; C5 3B | Compare accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0D3
; Address: $F0BE2A
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0D3:
	STX $FF			  ; 86 FF | Store X register to zero page
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	PLX				  ; FA | Pull X register from stack
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	STA $67FF19		  ; 8F 19 FF 67 | Store accumulator to absolute long address
	CMP $00FF,X		  ; DD FF 00 | Compare accumulator (absolute,X)
	BRA $0F			  ; 80 0F | Branch always
	BPL $E7			  ; 10 E7 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF FF C3 C3 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0D4
; Address: $F0BE64
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0D4:
	BRA $80			  ; 80 80 | Branch always
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	INC $FF0F			; EE 0F FF | Increment (absolute)
	ROL $0800,X		  ; 3E 00 08 | Rotate left (absolute,X)
	ASL $1F00,X		  ; 1E 00 1F | Arithmetic shift left (absolute,X)
	ADC ($E2),Y		  ; 71 E2 | Add with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0D5
; Address: $F0BE8A
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0D5:
	RTI				  ; 40 | Return from interrupt
	LDY #$1C			 ; A0 1C | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	DEY				  ; 88 | Decrement Y register
	STZ $7B03			; 9C 03 7B | Store zero to absolute
	ORA $1F60			; 0D 60 1F | Logical OR with accumulator (absolute)
	DEY				  ; 88 | Decrement Y register
	INC $FDFE,X		  ; FE FE FD | Increment (absolute,X)
	SBC $7F7D,X		  ; FD 7D 7F | Subtract with carry (absolute,X)
	ADC $017B,Y		  ; 79 7B 01 | Add with carry (absolute,Y)
	STX $00			  ; 86 00 | Store X register to zero page
	INC $FD01,X		  ; FE 01 FD | Increment (absolute,X)
	BRA $7B			  ; 80 7B | Branch always
	STY $87			  ; 84 87 | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SBC ($F2),Y		  ; F1 F2 | Subtract with carry ((zero page),Y)
	SBC $FFEE,X		  ; FD EE FF | Subtract with carry (absolute,X)
	SEP #$F3			 ; E2 F3 | Set processor status bits
	LDX #$C3			 ; A2 C3 | Load immediate value into X register
	CPY #$21			 ; C0 21 | PPU graphics register access
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	LDA $0CF3,Y		  ; B9 F3 0C | Load from absolute,Y into accumulator
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	LDA $1F46,Y		  ; B9 46 1F | Load from absolute,Y into accumulator
	ADC ($01,X)		  ; 61 01 | Add with carry ((zero page,X))
	BVS $7F			  ; 70 7F | Branch if overflow set
	ROR $038E,X		  ; 7E 8E 03 | Rotate right (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $E0			  ; F0 E0 | Game work RAM access
	INC $F000,X		  ; FE 00 F0 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$E0			 ; E0 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	SBC $83F8,Y		  ; F9 F8 83 | Subtract with carry (absolute,Y)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0D6
; Address: $F0BF24
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0D6:
	INC $3CEE			; EE EE 3C | Increment (absolute)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	LDY $8440,X		  ; BC 40 84 | Load from absolute,X into Y register
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	DEC $C6			  ; C6 C6 | Decrement (zero page)
	BPL $F0			  ; 10 F0 | Branch if positive
	AND $DCE1			; 2D E1 DC | Logical AND with accumulator (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	AND $FF00,Y		  ; 39 00 FF | Logical AND with accumulator (absolute,Y)
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	STZ $8480			; 9C 80 84 | Store zero to absolute
	BRA $F0			  ; 80 F0 | Branch always
	BEQ $E3			  ; F0 E3 | Branch if equal
	INC $F800,X		  ; FE 00 F8 | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC $7F00,X		  ; FD 00 7F | Subtract with carry (absolute,X)
	BMI $C3			  ; 30 C3 | Branch if negative
	CPY #$C7			 ; C0 C7 | Compare Y register (immediate)
	CMP ($9E,X)		  ; C1 9E | Compare accumulator ((zero page,X))
	BRA $FD			  ; 80 FD | Branch always
	BEQ $E1			  ; F0 E1 | Branch if equal
	ROL $7F00,X		  ; 3E 00 7F | Rotate left (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	INC $EF01,X		  ; FE 01 EF | Increment (absolute,X)
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	CPX $1B			  ; E4 1B | Compare X register (zero page)
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FFFD,X		  ; FE FD FF | Increment (absolute,X)
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	INC $C0FF,X		  ; FE FF C0 | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BVC $9F			  ; 50 9F | Branch if overflow clear
	STY $E00F			; 8C 0F E0 | Game work RAM access
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	SBC $13FE,Y		  ; F9 FE 13 | Subtract with carry (absolute,Y)
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	STA				  ; 9F 30 F0 31 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0D7
; Address: $F0C046
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0D7:
	STA $035A,Y		  ; 99 5A 03 | Store accumulator to absolute,Y
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0D8
; Address: $F0C051
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0D8:
	JSR $0F70			; 20 70 0F | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	BIT $FF			  ; 24 FF | Test bits in accumulator (zero page)
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	STA $00CF40		  ; 8F 40 CF 00 | Store accumulator to absolute long address
	STA				  ; 9F 83 6C 50 | Store accumulator to absolute long,X
	BVS $0F			  ; 70 0F | Branch if overflow set
	BVS $7F			  ; 70 7F | Branch if overflow set
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STA $30CF70		  ; 8F 70 CF 30 | Store accumulator to absolute long address
	STA				  ; 9F 60 FF 00 | Store accumulator to absolute long,X
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	SBC $D926			; ED 26 D9 | Subtract with carry (absolute)
	ASL $E1			  ; 06 E1 | Arithmetic shift left (zero page)
	LDX $0E4C			; AE 4C 0E | Load from absolute address into X register
	LSR $9E4E,X		  ; 5E 4E 9E | Logical shift right (absolute,X)
	ASL $96			  ; 06 96 | Arithmetic shift left (zero page)
	BPL $FF			  ; 10 FF | Branch if positive
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($7E,X)		  ; 01 7E | Logical OR with accumulator ((zero page,X))
	ORA ($76,X)		  ; 01 76 | Logical OR with accumulator ((zero page,X))
	ORA #$77			 ; 09 77 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	STA ($1F),Y		  ; 91 1F | Store accumulator to (zero page),Y
	BMI $7B			  ; 30 7B | Branch if negative
	STY $7F			  ; 84 7F | Store Y register to zero page
	BRA $BF			  ; 80 BF | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SEC				  ; 38 | Set carry flag
	ASL $FFE0,X		  ; 1E E0 FF | Arithmetic shift left (absolute,X)
	ADC $0101,Y		  ; 79 01 01 | Add with carry (absolute,Y)
	PEA #$F083		   ; F4 83 F0 | Push effective address to stack
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL $0FFF			; 0E FF 0F | Arithmetic shift left (absolute)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0D9
; Address: $F0C0EF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0D9:
	SED				  ; F8 | Set decimal mode flag
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	INC $EFAC,X		  ; FE AC EF | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0DA
; Address: $F0C106
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0DA:
	JSR $C0FF			; 20 FF C0 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	ROR $FFFF,X		  ; 7E FF FF | Rotate right (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FE04,X		  ; FE 04 FE | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $FFFF,X		  ; 1E FF FF | Arithmetic shift left (absolute,X)
	INC $20FE,X		  ; FE FE 20 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CPY $28CC			; CC CC 28 | Compare Y register (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0DB
; Address: $F0C15A
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0DB:
	JSR $3300			; 20 00 33 | Jump to subroutine
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	STA $FCFCFF		  ; 8F FF FC FC | Store accumulator to absolute long address
	LDX $E781,Y		  ; BE 81 E7 | Load from absolute,Y into X register
	CPY #$ED			 ; C0 ED | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPY $F0C3			; CC C3 F0 | Compare Y register (absolute)
	BEQ $0F			  ; F0 0F | Branch if equal
	STA $00077F		  ; 8F 7F 07 00 | Store accumulator to absolute long address
	DEY				  ; 88 | Decrement Y register
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	STA				  ; 9F FF 03 FF | Store accumulator to absolute long,X
	AND $FFFF,Y		  ; 39 FF FF | Logical AND with accumulator (absolute,Y)
	PEA #$FEFF		   ; F4 FF FE | Push effective address to stack
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	LDA				  ; BF FF FF FE | Load from absolute long,X into accumulator
	CLD				  ; D8 | Clear decimal mode flag
	CPX #$CF			 ; E0 CF | Compare X register (immediate)
	BEQ $FE			  ; F0 FE | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	BRA $1F			  ; 80 1F | Branch always
	STA				  ; 9F 7F FF FF | Store accumulator to absolute long,X
	SED				  ; F8 | Set decimal mode flag
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	SBC $FAE5,X		  ; FD E5 FA | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0DC
; Address: $F0C268
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0DC:
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	PLX				  ; FA | Pull X register from stack
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC $A141,Y		  ; F9 41 A1 | Subtract with carry (absolute,Y)
	BVS $0F			  ; 70 0F | Branch if overflow set
	LDA				  ; BF 7F FF FF | Load from absolute long,X into accumulator
	ADC ($1E,X)		  ; 61 1E | Add with carry ((zero page,X))
	STA $3FFFFF		  ; 8F FF FF 3F | Store accumulator to absolute long address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0DD
; Address: $F0C2A4
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0DD:
	SBC $FFFE,X		  ; FD FE FF | Subtract with carry (absolute,X)
	CPY #$67			 ; C0 67 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	RTI				  ; 40 | Return from interrupt
	LDA ($0E),Y		  ; B1 0E | Load from (zero page),Y into accumulator
	LDA $F8FC20		  ; AF 20 FC F8 | Load from absolute long address into accumulator
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BPL $FF			  ; 10 FF | Branch if positive
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	INC $7DE0			; EE E0 7D | Increment (absolute)
	REP #$3D			 ; C2 3D | Reset processor status bits
	AND $F2DF,X		  ; 3D DF F2 | Logical AND with accumulator (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA $1FFF			; 0D FF 1F | Logical OR with accumulator (absolute)
	ASL $DF			  ; 06 DF | Arithmetic shift left (zero page)
	BCC $3F			  ; 90 3F | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0DE
; Address: $F0C308
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0DE:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0DF
; Address: $F0C333
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0DF:
	STA				  ; 9F FF FF FF | Store accumulator to absolute long,X
	BEQ $87			  ; F0 87 | Branch if equal
	DEC $E152,X		  ; DE 52 E1 | Decrement (absolute,X)
	AND $F8E7,Y		  ; 39 E7 F8 | Logical AND with accumulator (absolute,Y)
	SBC ($80,X)		  ; E1 80 | Subtract with carry ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0E0
; Address: $F0C3AC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0E0:
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BCC $FF			  ; 90 FF | Branch if carry clear

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0E1
; Address: $F0C3C4
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0E1:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	DEC $FFFF			; CE FF FF | Decrement (absolute)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	BMI $FF			  ; 30 FF | Branch if negative
	BRA $FF			  ; 80 FF | Branch always
	ROL $00FF,X		  ; 3E FF 00 | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 31 FF FE | Load from absolute long,X into accumulator
	STA				  ; 9F FF 0C FF | Store accumulator to absolute long,X
	JMP ($FFFF)		  ; 6C FF FF | Jump to address (absolute indirect)
	STY $77F7			; 8C F7 77 | Store Y register to absolute address
	LDA				  ; BF 38 FF B1 | Load from absolute long,X into accumulator
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	STY $9EFF			; 8C FF 9E | Store Y register to absolute address
	ROL $3FFF,X		  ; 3E FF 3F | Rotate left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	SEC				  ; 38 | Set carry flag
	PLX				  ; FA | Pull X register from stack
	INY				  ; C8 | Increment Y register
	STA $FF01FF		  ; 8F FF 01 FF | Store accumulator to absolute long address
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC $F9FF,Y		  ; F9 FF F9 | Subtract with carry (absolute,Y)
	SBC ($1F),Y		  ; F1 1F | Subtract with carry ((zero page),Y)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SBC $F7FF,X		  ; FD FF F7 | Subtract with carry (absolute,X)
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BCS $FF			  ; B0 FF | Branch if carry set

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0E2
; Address: $F0C5A8
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0E2:
	ROL $FFFF,X		  ; 3E FF FF | Rotate left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	ASL $00FF			; 0E FF 00 | Arithmetic shift left (absolute)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	PHB				  ; 8B | Push data bank register to stack
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	STA				  ; 9F FF F1 1F | Store accumulator to absolute long,X
	SED				  ; F8 | Set decimal mode flag
	ASL $E0FF			; 0E FF E0 | Game work RAM access
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	DEY				  ; 88 | Decrement Y register
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	STA ($FD,X)		  ; 81 FD | Store accumulator to (zero page,X)
	PLP				  ; 28 | Pull processor status from stack
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC ($1F),Y		  ; F1 1F | Subtract with carry ((zero page),Y)
	SBC $FBFE,X		  ; FD FE FB | Subtract with carry (absolute,X)
	SBC $D7FF,X		  ; FD FF D7 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ASL $E0FF			; 0E FF E0 | Game work RAM access
	BRA $FF			  ; 80 FF | Branch always
	ROL $FFFF,X		  ; 3E FF FF | Rotate left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	SEC				  ; 38 | Set carry flag
	INC $FF7F,X		  ; FE 7F FF | Increment (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BVS $FF			  ; 70 FF | Branch if overflow set
	BPL $FF			  ; 10 FF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA $7FF3,X		  ; 1D F3 7F | Logical OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	STA $FF07FF		  ; 8F FF 07 FF | Store accumulator to absolute long address
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0E3
; Address: $F0C73C
; Size: 120 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0E3:
	SED				  ; F8 | Set decimal mode flag
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	SBC $F0F0,Y		  ; F9 F0 F0 | Subtract with carry (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF FF F8 FF | Load from absolute long,X into accumulator
	INC $F03F,X		  ; FE 3F F0 | Increment (absolute,X)
	INC $071F,X		  ; FE 1F 07 | Increment (absolute,X)
	BEQ $A7			  ; F0 A7 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA $7FF3,X		  ; 1D F3 7F | Logical OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	AND $FFE3,Y		  ; 39 E3 FF | Logical AND with accumulator (absolute,Y)
	STA $FF07FF		  ; 8F FF 07 FF | Store accumulator to absolute long address
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX $1FFC			; EC FC 1F | Compare X register (absolute)
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $EEF7			; EE F7 EE | Increment (absolute)
	LDA				  ; BF 3F FF 7F | Load from absolute long,X into accumulator
	LDA				  ; BF F8 FF 23 | Load from absolute long,X into accumulator
	LDA				  ; BF BF EF FE | Load from absolute long,X into accumulator
	CPY $FB			  ; C4 FB | Compare Y register (zero page)
	SED				  ; F8 | Set decimal mode flag
	INC $06FF,X		  ; FE FF 06 | Increment (absolute,X)
	LDA				  ; BF BF 7F FF | Load from absolute long,X into accumulator
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	BEQ $A7			  ; F0 A7 | Branch if equal
	RTI				  ; 40 | Return from interrupt
	BEQ $FF			  ; F0 FF | Branch if equal
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	BRA $0F			  ; 80 0F | Branch always
	BVS $FF			  ; 70 FF | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	XBA				  ; EB | Exchange accumulator bytes
	STA				  ; 9F FF 7C FF | Store accumulator to absolute long,X
	BRA $FF			  ; 80 FF | Branch always
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	STA $FFBEFF		  ; 8F FF BE FF | Store accumulator to absolute long address
	SED				  ; F8 | Set decimal mode flag
	STA				  ; 9F 7C 60 FF | Store accumulator to absolute long,X
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	STX $B1F1			; 8E F1 B1 | Store X register to absolute address
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F FF FE FF | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0E4
; Address: $F0C87E
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0E4:
	DEY				  ; 88 | Decrement Y register
	PLX				  ; FA | Pull X register from stack
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	INC $FE1E,X		  ; FE 1E FE | Increment (absolute,X)
	ASL $1EFE,X		  ; 1E FE 1E | Arithmetic shift left (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	ORA $00EF,X		  ; 1D EF 00 | Logical OR with accumulator (absolute,X)
	BVS $FF			  ; 70 FF | Branch if overflow set
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	XBA				  ; EB | Exchange accumulator bytes
	STA				  ; 9F FF 7C FF | Store accumulator to absolute long,X
	LDA				  ; BF FF 1F E7 | Load from absolute long,X into accumulator
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	STA $FFBEFF		  ; 8F FF BE FF | Store accumulator to absolute long address
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0E5
; Address: $F0C904
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0E5:
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	STX $B1F1			; 8E F1 B1 | Store X register to absolute address
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	STA				  ; 9F FF FE FF | Store accumulator to absolute long,X
	DEY				  ; 88 | Decrement Y register
	INC $FE1E,X		  ; FE 1E FE | Increment (absolute,X)
	ASL $74FC			; 0E FC 74 | Arithmetic shift left (absolute)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($77,X)		  ; 01 77 | Logical OR with accumulator ((zero page,X))
	INC $FF81,X		  ; FE 81 FF | Increment (absolute,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BCC $6F			  ; 90 6F | Branch if carry clear
	STY $07			  ; 84 07 | Store Y register to zero page
	ORA ($59,X)		  ; 01 59 | Logical OR with accumulator ((zero page,X))
	CPY #$CF			 ; C0 CF | Compare Y register (immediate)
	BRA $91			  ; 80 91 | Branch always
	EOR $CFA6,Y		  ; 59 A6 CF | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0E6
; Address: $F0C979
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0E6:
	BMI $91			  ; 30 91 | Branch if negative
	ROR $867D			; 6E 7D 86 | Rotate right (absolute)
	LDA				  ; BF 83 7C FF | Load from absolute long,X into accumulator
	CPY #$03			 ; C0 03 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0E7
; Address: $F0C98A
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0E7:
	JSR $203F			; 20 3F 20 | Jump to subroutine
	CMP ($43,X)		  ; C1 43 | Compare accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	LDY $0EFF,X		  ; BC FF 0E | Load from absolute,X into Y register
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	BMI $CF			  ; 30 CF | Branch if negative
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ASL $01F1			; 0E F1 01 | Arithmetic shift left (absolute)
	INC $FF03,X		  ; FE 03 FF | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FE02,X		  ; FE 02 FE | Increment (absolute,X)
	INC $FC02,X		  ; FE 02 FC | Increment (absolute,X)
	INC $FE3C,X		  ; FE 3C FE | Increment (absolute,X)
	AND $3D02,X		  ; 3D 02 3D | Logical AND with accumulator (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	INC $F60A			; EE 0A F6 | Increment (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC $CCF8,X		  ; FE F8 CC | Increment (absolute,X)
	INC $CEFF,X		  ; FE FF CE | Increment (absolute,X)
	SBC $FDFF,X		  ; FD FF FD | Subtract with carry (absolute,X)
	SBC $FF35,X		  ; FD 35 FF | Subtract with carry (absolute,X)
	ORA $FB			  ; 05 FB | Logical OR with accumulator (zero page)
	SBC $3FFB,X		  ; FD FB 3F | Subtract with carry (absolute,X)
	ROL $766F,X		  ; 3E 6F 76 | Rotate left (absolute,X)
	LDA				  ; BF 4F BF 42 | Load from absolute long,X into accumulator
	REP #$FF			 ; C2 FF | Reset processor status bits
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	STA $79FF,Y		  ; 99 FF 79 | Store accumulator to absolute,Y
	BVS $FF			  ; 70 FF | Branch if overflow set
	BEQ $FF			  ; F0 FF | Branch if equal
	LDA $3DFF,X		  ; BD FF 3D | Load from absolute,X into accumulator
	CPX #$60			 ; E0 60 | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	RTI				  ; 40 | Return from interrupt
	LDA $E19F,Y		  ; B9 9F E1 | Load from absolute,Y into accumulator
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	INC $9FFC,X		  ; FE FC 9F | Increment (absolute,X)
	INC $7CBF,X		  ; FE BF 7C | Increment (absolute,X)
	LDA				  ; BF 66 FF 1E | Load from absolute long,X into accumulator
	ROL $3CFF,X		  ; 3E FF 3C | Rotate left (absolute,X)
	AND $80FF,Y		  ; 39 FF 80 | Logical AND with accumulator (absolute,Y)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CMP #$EF			 ; C9 EF | Compare accumulator (immediate)
	LDA				  ; BF BF FF F8 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0E8
; Address: $F0CA57
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0E8:
	LDA				  ; BF FF BF 7C | Load from absolute long,X into accumulator
	LDA				  ; BF 7E BF 60 | Load from absolute long,X into accumulator
	STA				  ; 9F FC FD FC | Store accumulator to absolute long,X
	SBC $E5E4,X		  ; FD E4 E5 | Subtract with carry (absolute,X)
	CPX $E5			  ; E4 E5 | Compare X register (zero page)
	ADC $3DFC,X		  ; 7D FC 3D | Add with carry (absolute,X)
	SBC $FDFC,X		  ; FD FC FD | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	AND $00FB,Y		  ; 39 FB 00 | Logical AND with accumulator (absolute,Y)
	DEC $00			  ; C6 00 | Decrement (zero page)
	ORA #$FD			 ; 09 FD | Logical OR with accumulator (immediate)
	CPY #$F0			 ; C0 F0 | Compare Y register (immediate)
	INC $17			  ; E6 17 | Increment (zero page)
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	CPX #$1E			 ; E0 1E | Compare X register (immediate)
	INC $38			  ; E6 38 | Increment (zero page)
	CPY $F2FD			; CC FD F2 | Compare Y register (absolute)
	BMI $FF			  ; 30 FF | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	STZ $3FE7,X		  ; 9E E7 3F | Store zero to absolute,X
	INC $FFFF			; EE FF FF | Increment (absolute)
	SBC $F7FF,Y		  ; F9 FF F7 | Subtract with carry (absolute,Y)
	WDM #$7F			 ; 42 7F | Reserved instruction
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0EA
; Address: $F0CACC
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0EA:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	LDA $8DFF,X		  ; BD FF 8D | Load from absolute,X into accumulator
	STA				  ; 9F F1 7F EE | Store accumulator to absolute long,X
	INC $FFCF,X		  ; FE CF FF | Increment (absolute,X)
	LDA $EFFF3F		  ; AF 3F FF EF | Load from absolute long address into accumulator
	AND $30FF,Y		  ; 39 FF 30 | Logical AND with accumulator (absolute,Y)
	BMI $FF			  ; 30 FF | Branch if negative
	BCS $FF			  ; B0 FF | Branch if carry set
	BNE $FF			  ; D0 FF | Branch if not equal
	BVS $9F			  ; 70 9F | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	CPX $A06F			; EC 6F A0 | Compare X register (absolute)
	CPX #$EF			 ; E0 EF | Compare X register (immediate)
	INX				  ; E8 | Increment X register
	XBA				  ; EB | Exchange accumulator bytes
	CPX $3FFB			; EC FB 3F | Compare X register (absolute)
	STZ $949F			; 9C 9F 94 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0EB
; Address: $F0CB10
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0EB:
	STA $FF47FF		  ; 8F FF 47 FF | Store accumulator to absolute long address
	CPY $6FF7			; CC F7 6F | Compare Y register (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	SED				  ; F8 | Set decimal mode flag
	SBC $F8F9,Y		  ; F9 F9 F8 | Subtract with carry (absolute,Y)
	SBC $E1F8,Y		  ; F9 F8 E1 | Subtract with carry (absolute,Y)
	SBC ($02,X)		  ; E1 02 | Subtract with carry ((zero page,X))
	SBC $02			  ; E5 02 | Subtract with carry (zero page)
	SBC $02			  ; E5 02 | Subtract with carry (zero page)
	SBC $22			  ; E5 22 | Subtract with carry (zero page)
	ADC $79FF,Y		  ; 79 FF 79 | Add with carry (absolute,Y)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($FB),Y		  ; F1 FB | Subtract with carry ((zero page),Y)
	STX $00			  ; 86 00 | Store X register to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	JMP $4C00			; 4C 00 4C | Jump to address

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0EC
; Address: $F0CB64
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0EC:
	JSL $FF70FF		  ; 22 FF 70 FF | Jump to subroutine long
	SBC $7FFF,X		  ; FD FF 7F | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	LDY $2DFF			; AC FF 2D | Load from absolute address into Y register
	CMP $FFFF,X		  ; DD FF FF | Compare accumulator (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF FF DE FF | Load from absolute long,X into accumulator
	SBC #$FF			 ; E9 FF | Subtract with carry (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0ED
; Address: $F0CBA3
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0ED:
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	BRA $FC			  ; 80 FC | Branch always
	LDA				  ; BF FF E7 FF | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	SBC $E63D,X		  ; FD 3D E6 | Subtract with carry (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	PEA #$FBF7		   ; F4 F7 FB | Push effective address to stack
	CPX $C7			  ; E4 C7 | Compare X register (zero page)
	INX				  ; E8 | Increment X register
	STA				  ; 9F FF F7 7F | Store accumulator to absolute long,X
	RTI				  ; 40 | Return from interrupt
	AND ($A3,X)		  ; 21 A3 | Logical AND with accumulator ((zero page,X))
	STA ($83,X)		  ; 81 83 | Store accumulator to (zero page,X)
	STA ($83,X)		  ; 81 83 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0EE
; Address: $F0CBEB
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0EE:
	STA ($D3,X)		  ; 81 D3 | Store accumulator to (zero page,X)
	CMP ($53,X)		  ; C1 53 | Compare accumulator ((zero page,X))
	EOR ($57,X)		  ; 41 57 | Exclusive OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	ROL $58			  ; 26 58 | Rotate left (zero page)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	INC $38			  ; E6 38 | Increment (zero page)
	INC $B8			  ; E6 B8 | Increment (zero page)
	INC $FE23,X		  ; FE 23 FE | Increment (absolute,X)
	INC $EE07,X		  ; FE 07 EE | Increment (absolute,X)
	INC $EE17			; EE 17 EE | Increment (absolute)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PLX				  ; FA | Pull X register from stack
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	LSR $F8			  ; 46 F8 | Logical shift right (zero page)
	INY				  ; C8 | Increment Y register
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	SBC ($17),Y		  ; F1 17 | Subtract with carry ((zero page),Y)
	SBC #$07			 ; E9 07 | Subtract with carry (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$FA			 ; C0 FA | Compare Y register (immediate)
	ORA $86			  ; 05 86 | Logical OR with accumulator (zero page)
	ADC $738C,Y		  ; 79 8C 73 | Add with carry (absolute,Y)
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	LSR $47FD			; 4E FD 47 | Logical shift right (absolute)
	INC $1FFF,X		  ; FE FF 1F | Increment (absolute,X)
	INC $7001,X		  ; FE 01 70 | Increment (absolute,X)
	STA $073C00		  ; 8F 00 3C 07 | Store accumulator to absolute long address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ADC $FB7D,X		  ; 7D 7D FB | Add with carry (absolute,X)
	CMP $E6			  ; C5 E6 | Compare accumulator (zero page)
	STA $FF70			; 8D 70 FF | Store accumulator to absolute address
	BMI $3E			  ; 30 3E | Branch if negative
	AND ($38),Y		  ; 31 38 | Logical AND with accumulator ((zero page),Y)
	ASL $24FD,X		  ; 1E FD 24 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0EF
; Address: $F0CCB0
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0EF:
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BIT $FE0F			; 2C 0F FE | Test bits in accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ROR $EF10			; 6E 10 EF | Rotate right (absolute)
	BPL $F0			  ; 10 F0 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BRA $06			  ; 80 06 | Branch always
	PLX				  ; FA | Pull X register from stack
	CPY $39			  ; C4 39 | Compare Y register (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FD01,X		  ; FE 01 FD | Increment (absolute,X)
	CPY #$03			 ; C0 03 | Compare Y register (immediate)
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BEQ $CF			  ; F0 CF | Branch if equal
	BEQ $CF			  ; F0 CF | Branch if equal
	BEQ $3F			  ; F0 3F | Branch if equal
	LDA				  ; BF F3 73 FF | Load from absolute long,X into accumulator
	INC $FCFB,X		  ; FE FB FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ROL $F8			  ; 26 F8 | Rotate left (zero page)
	BEQ $F9			  ; F0 F9 | Branch if equal
	INC $00F9,X		  ; FE F9 00 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $00			  ; F0 00 | Branch if equal
	STA $2C65,Y		  ; 99 65 2C | Store accumulator to absolute,Y
	BPL $FE			  ; 10 FE | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	PLX				  ; FA | Pull X register from stack
	LDA ($7E),Y		  ; B1 7E | Load from (zero page),Y into accumulator
	SED				  ; F8 | Set decimal mode flag
	ASL $33D0,X		  ; 1E D0 33 | Arithmetic shift left (absolute,X)
	STA $BA7D,X		  ; 9D 7D BA | Store accumulator to absolute,X
	WDM #$BC			 ; 42 BC | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	AND $3F00,X		  ; 3D 00 3F | Logical AND with accumulator (absolute,X)
	BMI $08			  ; 30 08 | Branch if negative
	SBC $CB34			; ED 34 CB | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0F0
; Address: $F0CD8D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0F0:
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SED				  ; F8 | Set decimal mode flag
	BRA $7F			  ; 80 7F | Branch always
	SBC $01EA,Y		  ; F9 EA 01 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0F1
; Address: $F0CDAF
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0F1:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	ADC $8BF7,Y		  ; 79 F7 8B | Add with carry (absolute,Y)
	LDA				  ; BF 83 4B C7 | Load from absolute long,X into accumulator
	LDX $84E7			; AE E7 84 | Load from absolute address into X register
	CMP $EE			  ; C5 EE | Compare accumulator (zero page)
	NOP				  ; EA | No operation
	INC $7C00,X		  ; FE 00 7C | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BNE $00			  ; D0 00 | Branch if not equal
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	CPY #$74			 ; C0 74 | Compare Y register (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	LDA				  ; BF 5F BB 3F | Load from absolute long,X into accumulator
	LDA				  ; BF 07 00 0F | Load from absolute long,X into accumulator
	DEC $3C20,X		  ; DE 20 3C | Decrement (absolute,X)
	CPY #$FC			 ; C0 FC | Compare Y register (immediate)
	CMP ($FA,X)		  ; C1 FA | Compare accumulator ((zero page,X))
	PEA #$CC87		   ; F4 87 CC | Push effective address to stack
	STZ $BF1F			; 9C 1F BF | Store zero to absolute
	ORA $42			  ; 05 42 | Hardware register operation
	CPY $12			  ; C4 12 | Compare Y register (zero page)
	CPX $18			  ; E4 18 | Compare X register (zero page)
	SBC ($08,X)		  ; E1 08 | Subtract with carry ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	CPY #$C4			 ; C0 C4 | Compare Y register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	SBC $C406,Y		  ; F9 06 C4 | Subtract with carry (absolute,Y)
	CMP ($C3,X)		  ; C1 C3 | Compare accumulator ((zero page,X))
	REP #$F0			 ; C2 F0 | Reset processor status bits
	BVS $70			  ; 70 70 | Branch if overflow set
	BCS $11			  ; B0 11 | Branch if carry set
	EOR ($03),Y		  ; 51 03 | Exclusive OR with accumulator ((zero page),Y)
	BIT $F7			  ; 24 F7 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	STA $03CC00		  ; 8F 00 CC 03 | Store accumulator to absolute long address
	CMP #$FB			 ; C9 FB | Compare accumulator (immediate)
	AND ($3E),Y		  ; 31 3E | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0F3
; Address: $F0CE6B
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0F3:
	JSL $323107		  ; 22 07 31 32 | Jump to subroutine long
	LSR $00FE			; 4E FE 00 | Logical shift right (absolute)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	CPY #$41			 ; C0 41 | Compare Y register (immediate)
	BRA $70			  ; 80 70 | Branch always
	JMP $AFB2			; 4C B2 AF | Jump to address
	AND $8C37			; 2D 37 8C | Logical AND with accumulator (absolute)
	STA $F81BFC		  ; 8F FC 1B F8 | Store accumulator to absolute long address
	BMI $B3			  ; 30 B3 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	CLV				  ; B8 | Clear overflow flag
	SEI				  ; 78 | Set interrupt disable flag
	PLX				  ; FA | Pull X register from stack
	BCC $00			  ; 90 00 | Branch if carry clear
	REP #$3E			 ; C2 3E | Reset processor status bits
	CLC				  ; 18 | Clear carry flag
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	JMP ($FC03)		  ; 6C 03 FC | Jump to address (absolute indirect)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ADC $89F7,Y		  ; 79 F7 89 | Add with carry (absolute,Y)
	LDA				  ; BF 81 4D C1 | Load from absolute long,X into accumulator
	STY $CCFF			; 8C FF CC | Store Y register to absolute address
	SBC #$96			 ; E9 96 | Subtract with carry (immediate)
	INC $7E00,X		  ; FE 00 7E | Increment (absolute,X)
	ROR $3E00,X		  ; 7E 00 3E | Rotate right (absolute,X)
	STY $C100			; 8C 00 C1 | Store Y register to absolute address
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	LSR $59			  ; 46 59 | Logical shift right (zero page)
	SEP #$25			 ; E2 25 | Set processor status bits
	STA ($68,X)		  ; 81 68 | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $6F			  ; F0 6F | Branch if equal
	LDA $8140C0		  ; AF C0 40 81 | Load from absolute long address into accumulator
	STA ($B8,X)		  ; 81 B8 | Store accumulator to (zero page,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $1300,X		  ; FE 00 13 | Increment (absolute,X)
	INC $DB3C,X		  ; FE 3C DB | Increment (absolute,X)
	CPX $3E4D			; EC 4D 3E | Compare X register (absolute)
	LDA $AFF316		  ; AF 16 F3 AF | Load from absolute long address into accumulator
	STA $00CF00		  ; 8F 00 CF 00 | Store accumulator to absolute long address
	ORA ($5F,X)		  ; 01 5F | Logical OR with accumulator ((zero page,X))
	SBC ($01,X)		  ; E1 01 | Subtract with carry ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BCC $20			  ; 90 20 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0F4
; Address: $F0CF2C
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0F4:
	CMP ($11),Y		  ; D1 11 | Compare accumulator ((zero page),Y)
	EOR #$01			 ; 49 01 | Exclusive OR with accumulator (immediate)
	SBC $FE00,X		  ; FD 00 FE | Subtract with carry (absolute,X)
	INC $6E00,X		  ; FE 00 6E | Increment (absolute,X)
	BCC $F0			  ; 90 F0 | Branch if carry clear
	SEP #$FB			 ; E2 FB | Set processor status bits
	CPY $70CC			; CC CC 70 | Compare Y register (absolute)
	BMI $90			  ; 30 90 | Branch if negative
	LDY $FA			  ; A4 FA | Load from zero page into Y register
	INC $0CF3,X		  ; FE F3 0C | Increment (absolute,X)
	SBC $C004,Y		  ; F9 04 C0 | Subtract with carry (absolute,Y)
	INY				  ; C8 | Increment Y register
	ASL $3F01,X		  ; 1E 01 3F | Arithmetic shift left (absolute,X)
	ROR $D0C0,X		  ; 7E C0 D0 | Rotate right (absolute,X)
	CPY #$40			 ; C0 40 | Compare Y register (immediate)
	STY $C01C			; 8C 1C C0 | Store Y register to absolute address
	BVS $0D			  ; 70 0D | Branch if overflow set
	LDY $E004,X		  ; BC 04 E0 | Game work RAM access
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $3B			  ; 80 3B | Branch always
	CPY #$9C			 ; C0 9C | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0F5
; Address: $F0CF80
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0F5:
	INC				  ; 1A | Increment accumulator
	LSR $49			  ; 46 49 | Logical shift right (zero page)
	STZ $07			  ; 64 07 | Store zero to zero page
	BMI $3E			  ; 30 3E | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	STZ $5C0C,X		  ; 9E 0C 5C | Store zero to absolute,X
	CLV				  ; B8 | Clear overflow flag
	ADC ($80,X)		  ; 61 80 | Add with carry ((zero page,X))
	BRA $3B			  ; 80 3B | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$9F			 ; C0 9F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0F6
; Address: $F0CF9D
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0F6:
	JSR $007F			; 20 7F 00 | Jump to subroutine
	BNE $2C			  ; D0 2C | Branch if not equal
	CLD				  ; D8 | Clear decimal mode flag
	PHB				  ; 8B | Push data bank register to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($1E),Y		  ; 11 1E | Logical OR with accumulator ((zero page),Y)
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STZ $07			  ; 64 07 | Store zero to zero page
	LDY #$07			 ; A0 07 | Load immediate value into Y register
	BCS $0F			  ; B0 0F | Branch if carry set
	BNE $1F			  ; D0 1F | Branch if not equal
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $E1			  ; F0 E1 | Branch if equal
	CPX #$F7			 ; E0 F7 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0F7
; Address: $F0CFC6
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0F7:
	ASL $CCF9			; 0E F9 CC | Arithmetic shift left (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	CMP $A236,X		  ; DD 36 A2 | Compare accumulator (absolute,X)
	ROR $1F			  ; 66 1F | Rotate right (zero page)
	CPX #$24			 ; E0 24 | Compare X register (immediate)
	BRA $68			  ; 80 68 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BEQ $6F			  ; F0 6F | Branch if equal
	LDA $8140C0		  ; AF C0 40 81 | Load from absolute long address into accumulator
	STA ($BB,X)		  ; 81 BB | Store accumulator to (zero page,X)
	BEQ $00			  ; F0 00 | Branch if equal
	INC $F900,X		  ; FE 00 F9 | Increment (absolute,X)
	SBC $FBFF,X		  ; FD FF FB | Subtract with carry (absolute,X)
	AND $FDFF,X		  ; 3D FF FD | Logical AND with accumulator (absolute,X)
	SBC $E1FF,X		  ; FD FF E1 | Subtract with carry (absolute,X)
	CMP ($F3,X)		  ; C1 F3 | Compare accumulator ((zero page,X))
	SBC ($F7,X)		  ; E1 F7 | Subtract with carry ((zero page,X))
	LDX $DF8B			; AE 8B DF | Load from absolute address into X register
	BEQ $FF			  ; F0 FF | Branch if equal
	BNE $FF			  ; D0 FF | Branch if not equal
	CPX #$DF			 ; E0 DF | Compare X register (immediate)
	INC $ACC1,X		  ; FE C1 AC | Increment (absolute,X)
	BNE $DF			  ; D0 DF | Branch if not equal
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	INY				  ; C8 | Increment Y register
	ORA $F7F4,Y		  ; 19 F4 F7 | Logical OR with accumulator (absolute,Y)
	CLD				  ; D8 | Clear decimal mode flag
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	CLV				  ; B8 | Clear overflow flag
	SBC ($F3),Y		  ; F1 F3 | Subtract with carry ((zero page),Y)
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX #$C1			 ; E0 C1 | Compare X register (immediate)
	CPX #$83			 ; E0 83 | Compare X register (immediate)
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	BRA $DB			  ; 80 DB | Branch always
	BRA $CD			  ; 80 CD | Branch always
	CPY #$E3			 ; C0 E3 | Compare Y register (immediate)
	CPX #$FC			 ; E0 FC | Compare X register (immediate)
	EOR ($DC,X)		  ; 41 DC | Exclusive OR with accumulator ((zero page,X))
	CMP $24			  ; C5 24 | Compare accumulator (zero page)
	BIT $E7			  ; 24 E7 | Test bits in accumulator (zero page)
	CPY $C7			  ; C4 C7 | Compare Y register (zero page)
	ORA $7F			  ; 05 7F | Logical OR with accumulator (zero page)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	CPX $18			  ; E4 18 | Compare X register (zero page)
	CPY $38			  ; C4 38 | Compare Y register (zero page)
	ROR $FF80,X		  ; 7E 80 FF | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0F8
; Address: $F0D0A2
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0F8:
	BMI $30			  ; 30 30 | Branch if negative
	DEY				  ; 88 | Decrement Y register
	STY $4543			; 8C 43 45 | Store Y register to absolute address
	ORA $89			  ; 05 89 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	BCC $1F			  ; 90 1F | Branch if carry clear
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	DEY				  ; 88 | Decrement Y register
	BMI $43			  ; 30 43 | Branch if negative
	BMI $57			  ; 30 57 | Branch if negative

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0F9
; Address: $F0D0BF
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0F9:
	JSR $0339			; 20 39 03 | Jump to subroutine
	SEP #$81			 ; E2 81 | Set processor status bits
	STA $FF3F,Y		  ; 99 3F FF | Store accumulator to absolute,Y
	ASL $7DF9,X		  ; 1E F9 7D | Arithmetic shift left (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ASL $00F1			; 0E F1 00 | Arithmetic shift left (absolute)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0FA
; Address: $F0D10C
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0FA:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $B0			  ; F0 B0 | Branch if equal
	BCS $7F			  ; B0 7F | Branch if carry set
	SBC $FFFF,Y		  ; F9 FF FF | Subtract with carry (absolute,Y)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	ORA $0DFE			; 0D FE 0D | Logical OR with accumulator (absolute)
	INC $EF1C,X		  ; FE 1C EF | Increment (absolute,X)
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	XBA				  ; EB | Exchange accumulator bytes
	ORA $FFFF,X		  ; 1D FF FF | Logical OR with accumulator (absolute,X)
	SBC $FDF8,X		  ; FD F8 FD | Subtract with carry (absolute,X)
	INC $FC1D,X		  ; FE 1D FC | Increment (absolute,X)
	ASL $FAFE,X		  ; 1E FE FA | Arithmetic shift left (absolute,X)
	INC $FFFB,X		  ; FE FB FF | Increment (absolute,X)
	SBC $F0F7,X		  ; FD F7 F0 | Subtract with carry (absolute,X)
	SBC $FFF8,X		  ; FD F8 FF | Subtract with carry (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	SBC $C1FE,X		  ; FD FE C1 | Subtract with carry (absolute,X)
	ROL $7E99,X		  ; 3E 99 7E | Rotate left (absolute,X)
	STZ $DB			  ; 64 DB | Store zero to zero page
	LDA $4F7C,X		  ; BD 7C 4F | Load from absolute,X into accumulator
	ORA $19FC			; 0D FC 19 | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0FB
; Address: $F0D198
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0FB:
	AND $7F02,X		  ; 3D 02 7F | Logical AND with accumulator (absolute,X)
	CPX #$24			 ; E0 24 | Compare X register (immediate)
	BPL $7F			  ; 10 7F | Branch if positive
	STA $CF87EF		  ; 8F EF 87 CF | Store accumulator to absolute long address
	CPY #$07			 ; C0 07 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0FD
; Address: $F0D1B6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0FD:
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$EF			 ; C0 EF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_0FF
; Address: $F0D1CE
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_0FF:
	JSL $07FFFD		  ; 22 FD FF 07 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	CLC				  ; 18 | Clear carry flag
	JMP $FE4EFC		  ; 5C FC 4E FE | Jump to address long
	PHA				  ; 48 | Push accumulator to stack
	ROL $3BF3			; 2E F3 3B | Rotate left (absolute)
	SBC ($E6,X)		  ; E1 E6 | Subtract with carry ((zero page,X))
	ORA ($C2,X)		  ; 01 C2 | Logical OR with accumulator ((zero page,X))
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($45,X)		  ; 01 45 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	STA ($C0,X)		  ; 81 C0 | Store accumulator to (zero page,X)
	ADC ($A0,X)		  ; 61 A0 | Add with carry ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY #$D4			 ; A0 D4 | Load immediate value into Y register
	SED				  ; F8 | Set decimal mode flag
	ADC #$BF			 ; 69 BF | Add with carry (immediate)
	CPX $17			  ; E4 17 | Compare X register (zero page)
	AND $3182,X		  ; 3D 82 31 | Logical AND with accumulator (absolute,X)
	ASL $0E15			; 0E 15 0E | Arithmetic shift left (absolute)
	BIT #$0E			 ; 89 0E | Test bits in accumulator (immediate)
	LSR $07			  ; 46 07 | Logical shift right (zero page)
	RTI				  ; 40 | Return from interrupt
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	NOP				  ; EA | No operation
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	STX $05			  ; 86 05 | Store X register to zero page
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $EB4D,Y		  ; 79 4D EB | Add with carry (absolute,Y)
	LDA				  ; BF 96 7D 27 | Load from absolute long,X into accumulator

;------------------------------------------------------------------------------
; Bank60_DmaFunction_100
; Address: $F0D22F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_100:
	PLA				  ; 68 | Pull accumulator from stack
	SBC $FC00,X		  ; FD 00 FC | Subtract with carry (absolute,X)
	INX				  ; E8 | Increment X register
	BPL $10			  ; 10 10 | Branch if positive
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank60_DmaFunction_101
; Address: $F0D23B
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_101:
	JSR $0002			; 20 02 00 | Jump to subroutine
	STA $189B90		  ; 8F 90 9B 18 | Store accumulator to absolute long address
	DEC				  ; 3A | Decrement accumulator
	DEX				  ; CA | Decrement X register
	XBA				  ; EB | Exchange accumulator bytes
	STA				  ; 9F DC EF FC | Store accumulator to absolute long,X
	BRA $03			  ; 80 03 | Branch always
	BPL $1F			  ; 10 1F | Branch if positive
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CLD				  ; D8 | Clear decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	STA $FFFBFF		  ; 8F FF FB FF | Store accumulator to absolute long address
	ORA ($EF),Y		  ; 11 EF | Logical OR with accumulator ((zero page),Y)
	SEP #$F0			 ; E2 F0 | Set processor status bits
	INC $7E01,X		  ; FE 01 7E | Increment (absolute,X)
	STA ($EE,X)		  ; 81 EE | Store accumulator to (zero page,X)
	ORA ($FF),Y		  ; 11 FF | Logical OR with accumulator ((zero page),Y)
	SBC $FDFD,X		  ; FD FD FD | Subtract with carry (absolute,X)
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	DEC $9CC0			; CE C0 9C | Decrement (absolute)
	STA ($85,X)		  ; 81 85 | Store accumulator to (zero page,X)
	ASL $4A			  ; 06 4A | Arithmetic shift left (zero page)
	STY $CD35			; 8C 35 CD | Store Y register to absolute address
	SBC $FFFE,X		  ; FD FE FF | Subtract with carry (absolute,X)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	BRA $7E			  ; 80 7E | Branch always
	ADC $3300,Y		  ; 79 00 33 | Add with carry (absolute,Y)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	INC $FF			  ; E6 FF | Increment (zero page)
	LDY #$E0			 ; A0 E0 | Game work RAM access
	ASL $6100,X		  ; 1E 00 61 | Arithmetic shift left (absolute,X)
	STA ($8B),Y		  ; 91 8B | Store accumulator to (zero page),Y
	ASL $707E			; 0E 7E 70 | Arithmetic shift left (absolute)
	LDA ($80),Y		  ; B1 80 | Load from (zero page),Y into accumulator
	CPY $F004			; CC 04 F0 | Compare Y register (absolute)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BEQ $7F			  ; F0 7F | Branch if equal

;------------------------------------------------------------------------------
; Bank60_DmaFunction_102
; Address: $F0D2FA
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_102:
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	LSR $34FF			; 4E FF 34 | Logical shift right (absolute)
	BCS $01			  ; B0 01 | Branch if carry set
	BEQ $11			  ; F0 11 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack
	CPX $F4			  ; E4 F4 | Compare X register (zero page)
	SEC				  ; 38 | Set carry flag
	STA ($6C,X)		  ; 81 6C | Store accumulator to (zero page,X)
	ROL $FE00,X		  ; 3E 00 FE | Rotate left (absolute,X)
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $E7			  ; F0 E7 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA $1F1F,X		  ; 1D 1F 1F | Logical OR with accumulator (absolute,X)
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BRA $EF			  ; 80 EF | Branch always
	BPL $FF			  ; 10 FF | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	CPX #$87			 ; E0 87 | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $C8			  ; 80 C8 | Branch always
	BRA $81			  ; 80 81 | Branch always
	SBC #$39			 ; E9 39 | Subtract with carry (immediate)
	ADC $00FE,Y		  ; 79 FE 00 | Add with carry (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	BRA $06			  ; 80 06 | Branch always
	BEQ $FB			  ; F0 FB | Branch if equal
	RTI				  ; 40 | Return from interrupt
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ADC ($01,X)		  ; 61 01 | Add with carry ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BVS $71			  ; 70 71 | Branch if overflow set
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	PEA #$E90A		   ; F4 0A E9 | Push effective address to stack
	ASL $3ED9,X		  ; 1E D9 3E | Arithmetic shift left (absolute,X)
	STY $9EFE			; 8C FE 9E | Store Y register to absolute address
	STA $0F3F			; 8D 3F 0F | Store accumulator to absolute address
	LDA $008000		  ; AF 00 80 00 | Load from absolute long address into accumulator
	STA ($10),Y		  ; 91 10 | Store accumulator to (zero page),Y
	AND ($B0,X)		  ; 21 B0 | Logical AND with accumulator ((zero page,X))
	AND #$39			 ; 29 39 | Logical AND with accumulator (immediate)
	LDY $6FBC,X		  ; BC BC 6F | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank60_DmaFunction_103
; Address: $F0D3B1
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_103:
	BVC $5D			  ; 50 5D | Branch if overflow clear
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	LDA #$7E			 ; A9 7E | Load immediate value into accumulator
	ROR $FFC6,X		  ; 7E C6 FF | Rotate right (absolute,X)
	WDM #$FF			 ; 42 FF | Reserved instruction
	SED				  ; F8 | Set decimal mode flag
	PEA #$E107		   ; F4 07 E1 | Push effective address to stack
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($09,X)		  ; 01 09 | Logical OR with accumulator ((zero page,X))
	ORA $1E1C,X		  ; 1D 1C 1E | Logical OR with accumulator (absolute,X)
	INC $E200,X		  ; FE 00 E2 | Increment (absolute,X)
	SEP #$01			 ; E2 01 | Set processor status bits
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$F8			 ; C0 F8 | Compare Y register (immediate)
	LDA				  ; BF 40 FF 00 | Load from absolute long,X into accumulator
	INC $DBFF,X		  ; FE FF DB | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BMI $FF			  ; 30 FF | Branch if negative
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $FF			  ; 10 FF | Branch if positive
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BPL $0F			  ; 10 0F | Branch if positive
	BEQ $FE			  ; F0 FE | Branch if equal
	SBC ($F0),Y		  ; F1 F0 | Subtract with carry ((zero page),Y)
	LDA				  ; BF 40 FF 00 | Load from absolute long,X into accumulator
	BRA $7F			  ; 80 7F | Branch always
	BRA $33			  ; 80 33 | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	INC $FEC0			; EE C0 FE | Increment (absolute)
	STA $FE01F1		  ; 8F F1 01 FE | Store accumulator to absolute long address
	INC $C43A,X		  ; FE 3A C4 | Increment (absolute,X)
	SBC $E005,Y		  ; F9 05 E0 | Game work RAM access
	ORA $0E0D,X		  ; 1D 0D 0E | Logical OR with accumulator (absolute,X)
	ROL $FEFF,X		  ; 3E FF FE | Rotate left (absolute,X)
	INC $FEFC,X		  ; FE FC FE | Increment (absolute,X)
	ROL $E101,X		  ; 3E 01 E1 | Rotate left (absolute,X)
	STA				  ; 9F 80 7E 89 | Store accumulator to absolute long,X

;------------------------------------------------------------------------------
; Bank60_DmaFunction_104
; Address: $F0D468
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_104:
	JSR $87DF			; 20 DF 87 | Jump to subroutine
	INC $D828,X		  ; FE 28 D8 | Increment (absolute,X)
	BCS $70			  ; B0 70 | Branch if carry set
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	SBC $F800,X		  ; FD 00 F8 | Subtract with carry (absolute,X)
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_105
; Address: $F0D47F
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_105:
	PHP				  ; 08 | Push processor status to stack
	STY $03			  ; 84 03 | Store Y register to zero page
	ROL $4701,X		  ; 3E 01 47 | Rotate left (absolute,X)
	CPY #$BC			 ; C0 BC | Compare Y register (immediate)
	CMP $7530			; CD 30 75 | Compare accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	BEQ $1F			  ; F0 1F | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ASL $1F1F,X		  ; 1E 1F 1F | Arithmetic shift left (absolute,X)
	BPL $2F			  ; 10 2F | Branch if positive
	BNE $DF			  ; D0 DF | Branch if not equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	LDA				  ; BF 40 FF 00 | Load from absolute long,X into accumulator
	BRA $3F			  ; 80 3F | Branch always
	CPY #$32			 ; C0 32 | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F2			  ; F0 F2 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$95			 ; E0 95 | Compare X register (immediate)
	STX $FFF6			; 8E F6 FF | Store X register to absolute address
	PLX				  ; FA | Pull X register from stack
	BEQ $FF			  ; F0 FF | Branch if equal
	STA $E0FF,Y		  ; 99 FF E0 | Game work RAM access
	STY $84			  ; 84 84 | Store Y register to zero page
	STA $0B8D			; 8D 8D 0B | Store accumulator to absolute address
	STA $1C0F0D		  ; 8F 0D 0F 1C | Store accumulator to absolute long address
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	BCS $FF			  ; B0 FF | Branch if carry set
	BMI $FF			  ; 30 FF | Branch if negative
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	LDY #$FF			 ; A0 FF | Load immediate value into Y register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BNE $FF			  ; D0 FF | Branch if not equal
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	CPY #$F9			 ; C0 F9 | Compare Y register (immediate)
	STY $FC			  ; 84 FC | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	SED				  ; F8 | Set decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_106
; Address: $F0D52C
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_106:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA $FF			  ; 05 FF | Logical OR with accumulator (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ORA $07FF,X		  ; 1D FF 07 | Logical OR with accumulator (absolute,X)
	CPY #$DF			 ; C0 DF | Compare Y register (immediate)
	STA $A78707		  ; 8F 07 87 A7 | Store accumulator to absolute long address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_108
; Address: $F0D550
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_108:
	ADC $DF81,Y		  ; 79 81 DF | Add with carry (absolute,Y)
	LDA $FFE7FF		  ; AF FF E7 FF | Load from absolute long address into accumulator
	CLC				  ; 18 | Clear carry flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	SBC $FF03,X		  ; FD 03 FF | Subtract with carry (absolute,X)
	SBC $FE03,X		  ; FD 03 FE | Subtract with carry (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPY $FCFC			; CC FC FC | Compare Y register (absolute)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	ROR $01FF,X		  ; 7E FF 01 | Rotate right (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDY $3110			; AC 10 31 | Load from absolute address into Y register
	ORA ($4F,X)		  ; 01 4F | Logical OR with accumulator ((zero page,X))
	LDA $ADBF			; AD BF AD | Load from absolute address into accumulator
	STA $EFEF			; 8D EF EF | Store accumulator to absolute address
	INY				  ; C8 | Increment Y register
	DEC $B2FF			; CE FF B2 | Decrement (absolute)
	SBC $F847,X		  ; FD 47 F8 | Subtract with carry (absolute,X)
	BEQ $2F			  ; F0 2F | Branch if equal
	BNE $FB			  ; D0 FB | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	STZ $91EE			; 9C EE 91 | Store zero to absolute
	LDA				  ; BF 00 66 01 | Load from absolute long,X into accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	AND ($C7,X)		  ; 21 C7 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_109
; Address: $F0D60F
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_109:
	BEQ $38			  ; F0 38 | Branch if equal
	CPY #$5C			 ; C0 5C | Compare Y register (immediate)
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	CPX #$12			 ; E0 12 | Compare X register (immediate)
	CPX $FE41			; EC 41 FE | Compare X register (absolute)
	STA $D5FE,Y		  ; 99 FE D5 | Store accumulator to absolute,Y
	INC $CF38,X		  ; FE 38 CF | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	ASL $FD			  ; 06 FD | Arithmetic shift left (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	DEC $C5			  ; C6 C5 | Decrement (zero page)
	ROR $CE7D,X		  ; 7E 7D CE | Rotate right (absolute,X)
	SBC $F906,X		  ; FD 06 F9 | Subtract with carry (absolute,X)
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SEP #$FF			 ; E2 FF | Set processor status bits
	PLX				  ; FA | Pull X register from stack
	BEQ $F8			  ; F0 F8 | Branch if equal
	BEQ $FC			  ; F0 FC | Branch if equal
	BRA $80			  ; 80 80 | Branch always
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	ROR $67A0,X		  ; 7E A0 67 | Rotate right (absolute,X)
	PLX				  ; FA | Pull X register from stack
	SED				  ; F8 | Set decimal mode flag
	SBC $9BFF,X		  ; FD FF 9B | Subtract with carry (absolute,X)
	CPX $EBFF			; EC FF EB | Compare X register (absolute)
	INC $E7FF,X		  ; FE FF E7 | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_10B
; Address: $F0D68A
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_10B:
	JSR $303F			; 20 3F 30 | Jump to subroutine
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	RTI				  ; 40 | Return from interrupt
	BPL $FF			  ; 10 FF | Branch if positive
	ADC ($E1,X)		  ; 61 E1 | Add with carry ((zero page,X))
	PEA #$FE1A		   ; F4 1A FE | Push effective address to stack
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	ORA $0BFF,Y		  ; 19 FF 0B | Logical OR with accumulator (absolute,Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ROR $C605,X		  ; 7E 05 C6 | Rotate right (absolute,X)
	STY $FFFF			; 8C FF FF | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank60_DmaFunction_10C
; Address: $F0D6DA
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_10C:
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC ($DF,X)		  ; E1 DF | Subtract with carry ((zero page,X))
	ADC $FFFF,X		  ; 7D FF FF | Add with carry (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	EOR $8D6F			; 4D 6F 8D | Exclusive OR with accumulator (absolute)
	INC $DFBC			; EE BC DF | Increment (absolute)
	LDA				  ; BF DE 98 FF | Load from absolute long,X into accumulator
	DEY				  ; 88 | Decrement Y register
	STZ $9C7D,X		  ; 9E 7D 9C | Store zero to absolute,X
	BNE $EF			  ; D0 EF | Branch if not equal
	BPL $FF			  ; 10 FF | Branch if positive
	CPY #$77			 ; C0 77 | Compare Y register (immediate)
	BCC $BB			  ; 90 BB | Branch if carry clear
	CLI				  ; 58 | Clear interrupt disable flag
	SBC $5C1C,Y		  ; F9 1C 5C | Subtract with carry (absolute,Y)
	STX $A766			; 8E 66 A7 | Store X register to absolute address
	JMP ($5EAF)		  ; 6C AF 5E | Jump to address (absolute indirect)
	STA				  ; 9F 78 8F E8 | Store accumulator to absolute long,X
	CPX $1F			  ; E4 1F | Compare X register (zero page)
	SEP #$1F			 ; E2 1F | Set processor status bits
	SBC ($0F),Y		  ; F1 0F | Subtract with carry ((zero page),Y)
	CLD				  ; D8 | Clear decimal mode flag
	BNE $03			  ; D0 03 | Branch if not equal
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	SBC $F906,X		  ; FD 06 F9 | Subtract with carry (absolute,X)
	CMP $FF01,X		  ; DD 01 FF | Compare accumulator (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	INC $7F00,X		  ; FE 00 7F | Increment (absolute,X)
	STA $3E993F		  ; 8F 3F 99 3E | Store accumulator to absolute long address
	LDA				  ; BF 1F FF 0F | Load from absolute long,X into accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BEQ $00			  ; F0 00 | Branch if equal
	SBC $0F08,Y		  ; F9 08 0F | Subtract with carry (absolute,Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	SED				  ; F8 | Set decimal mode flag
	STA $FF			  ; 85 FF | Store accumulator to zero page
	BEQ $00			  ; F0 00 | Branch if equal
	SEP #$03			 ; E2 03 | Set processor status bits
	DEC $1900			; CE 00 19 | Decrement (absolute)
	SBC ($DC,X)		  ; E1 DC | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_10E
; Address: $F0D7F4
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_10E:
	CPX $DDFF			; EC FF DD | Compare X register (absolute)
	INC $FF			  ; E6 FF | Increment (zero page)
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPY #$73			 ; C0 73 | Compare Y register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL $3DED,X		  ; 1E ED 3D | Arithmetic shift left (absolute,X)
	DEC $FF10,X		  ; DE 10 FF | Decrement (absolute,X)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	BEQ $0F			  ; F0 0F | Branch if equal
	LDA #$FF			 ; A9 FF | Load immediate value into accumulator
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	STA $F0EF,Y		  ; 99 EF F0 | Store accumulator to absolute,Y
	BPL $1F			  ; 10 1F | Branch if positive
	DEC $07			  ; C6 07 | Decrement (zero page)
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	SBC ($01),Y		  ; F1 01 | Subtract with carry ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FE00,X		  ; FE 00 FE | Increment (absolute,X)
	BVS $FF			  ; 70 FF | Branch if overflow set
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $CF			  ; F0 CF | Branch if equal
	DEC $2CFF,X		  ; DE FF 2C | Decrement (absolute,X)
	ROL $C32E			; 2E 2E C3 | Rotate left (absolute)
	BNE $00			  ; D0 00 | Branch if not equal
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	ROL $BB			  ; 26 BB | Rotate left (zero page)
	LDY $44FF,X		  ; BC FF 44 | Load from absolute,X into Y register
	BVS $03			  ; 70 03 | Branch if overflow set
	ADC ($01),Y		  ; 71 01 | Add with carry ((zero page),Y)
	STA $81			  ; 85 81 | Store accumulator to zero page
	STY $80			  ; 84 80 | Store Y register to zero page
	LDY $0300,X		  ; BC 00 03 | Load from absolute,X into Y register
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	SED				  ; F8 | Set decimal mode flag
	INC $7E00,X		  ; FE 00 7E | Increment (absolute,X)
	JMP $B958A4		  ; 5C A4 58 B9 | Jump to address long
	LSR $5EB9,X		  ; 5E B9 5E | Logical shift right (absolute,X)
	LDA #$56			 ; A9 56 | Load immediate value into accumulator
	BIT $A1D0			; 2C D0 A1 | Test bits in accumulator (absolute)
	LSR $7E81,X		  ; 5E 81 7E | Logical shift right (absolute,X)
	CMP $0E1F,X		  ; DD 1F 0E | Compare accumulator (absolute,X)
	STX $CF0F			; 8E 0F CF | Store X register to absolute address
	JMP $C64F			; 4C 4F C6 | Jump to address
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank60_DmaFunction_10F
; Address: $F0D8D6
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_10F:
	BEQ $00			  ; F0 00 | Branch if equal
	BCS $00			  ; B0 00 | Branch if carry set
	BRA $00			  ; 80 00 | Branch always
	BCS $00			  ; B0 00 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP ($3E64)		  ; 6C 64 3E | Jump to address (absolute indirect)
	BRA $87			  ; 80 87 | Branch always
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDY $F79B,X		  ; BC 9B F7 | Load from absolute,X into Y register
	CPY #$7E			 ; C0 7E | Compare Y register (immediate)
	BRA $FE			  ; 80 FE | Branch always
	AND $B391,X		  ; 3D 91 B3 | Logical AND with accumulator (absolute,X)
	ORA $8DBD			; 0D BD 8D | Logical OR with accumulator (absolute)
	ADC $70F1,X		  ; 7D F1 70 | Add with carry (absolute,X)
	ROR $F3C0,X		  ; 7E C0 F3 | Rotate right (absolute,X)
	ASL $393F,X		  ; 1E 3F 39 | Arithmetic shift left (absolute,X)
	DEC $FF18,X		  ; DE 18 FF | Decrement (absolute,X)
	LDA $FF7E,X		  ; BD 7E FF | Load from absolute,X into accumulator
	LDA				  ; BF FF FF FF | Load from absolute long,X into accumulator
	STA				  ; 9F E0 9D E2 | Store accumulator to absolute long,X
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ORA ($F1,X)		  ; 01 F1 | Logical OR with accumulator ((zero page,X))
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	BEQ $7F			  ; F0 7F | Branch if equal
	BEQ $7F			  ; F0 7F | Branch if equal
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $7F			  ; 80 7F | Branch always
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BNE $20			  ; D0 20 | Branch if not equal
	INC $EADF			; EE DF EA | Increment (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_110
; Address: $F0D989
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_110:
	JSR $002F			; 20 2F 00 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	DEC $CCFD			; CE FD CC | Decrement (absolute)
	CPY #$F3			 ; C0 F3 | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY $CC00			; CC 00 CC | Compare Y register (absolute)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC ($45,X)		  ; 61 45 | Add with carry ((zero page,X))
	ORA $FE			  ; 05 FE | Logical OR with accumulator (zero page)
	SEC				  ; 38 | Set carry flag
	STA				  ; 9F 26 98 23 | Store accumulator to absolute long,X
	STZ $9C23			; 9C 23 9C | Store zero to absolute
	STZ $1C23			; 9C 23 1C | Store zero to absolute
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_112
; Address: $F0DA04
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_112:
	JSR $983F			; 20 3F 98 | Jump to subroutine
	STA $991E,Y		  ; 99 1E 99 | Store accumulator to absolute,Y
	ASL $1C93,X		  ; 1E 93 1C | Arithmetic shift left (absolute,X)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$C3			 ; C0 C3 | Compare Y register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	PEA #$1B03		   ; F4 03 1B | Push effective address to stack
	SEP #$F8			 ; E2 F8 | Set processor status bits
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	AND ($C4),Y		  ; 31 C4 | Logical AND with accumulator ((zero page),Y)
	ROR $72F1,X		  ; 7E F1 72 | Rotate right (absolute,X)
	SBC $1F71,X		  ; FD 71 1F | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	TYA				  ; 98 | Transfer Y register to accumulator
	DEY				  ; 88 | Decrement Y register
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BCS $00			  ; B0 00 | Branch if carry set
	ORA ($F1,X)		  ; 01 F1 | Logical OR with accumulator ((zero page,X))
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $7F			  ; F0 7F | Branch if equal
	BCS $3F			  ; B0 3F | Branch if carry set
	CLC				  ; 18 | Clear carry flag
	TYA				  ; 98 | Transfer Y register to accumulator
	BRA $7F			  ; 80 7F | Branch always
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	LDA				  ; BF 40 FF 00 | Load from absolute long,X into accumulator
	BNE $2E			  ; D0 2E | Branch if not equal
	BIT $ECDF			; 2C DF EC | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_113
; Address: $F0DA89
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_113:
	JSR $002F			; 20 2F 00 | Jump to subroutine
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CLD				  ; D8 | Clear decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PEA #$E4FF		   ; F4 FF E4 | Push effective address to stack
	CPX #$C7			 ; E0 C7 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_114
; Address: $F0DAE3
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_114:
	SED				  ; F8 | Set decimal mode flag
	CPY #$38			 ; C0 38 | Compare Y register (immediate)
	BRA $1F			  ; 80 1F | Branch always
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	ORA ($71,X)		  ; 01 71 | Logical OR with accumulator ((zero page,X))
	LDA $BDFF,X		  ; BD FF BD | Load from absolute,X into accumulator
	AND $3EFF,X		  ; 3D FF 3E | Logical AND with accumulator (absolute,X)
	INC $C202,X		  ; FE 02 C2 | Increment (absolute,X)
	INC $C201,X		  ; FE 01 C2 | Increment (absolute,X)
	AND $FF20,X		  ; 3D 20 FF | Logical AND with accumulator (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FEFA,X		  ; FE FA FE | Increment (absolute,X)
	PLX				  ; FA | Pull X register from stack
	INC $0E0A,X		  ; FE 0A 0E | Increment (absolute,X)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	SBC ($DC),Y		  ; F1 DC | Subtract with carry ((zero page),Y)
	BCS $00			  ; B0 00 | Branch if carry set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_115
; Address: $F0DB67
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_115:
	ROR $09			  ; 66 09 | Rotate right (zero page)
	ROR $5F2C,X		  ; 7E 2C 5F | Rotate right (absolute,X)
	STZ $36			  ; 64 36 | Store zero to zero page
	AND ($FF,X)		  ; 21 FF | Logical AND with accumulator ((zero page,X))
	SBC $F38E,Y		  ; F9 8E F3 | Subtract with carry (absolute,Y)
	STY $8CF3			; 8C F3 8C | Store Y register to absolute address
	STY $CC7B			; 8C 7B CC | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank60_DmaFunction_116
; Address: $F0DB80
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_116:
	JSR $1C20			; 20 20 1C | Jump to subroutine
	AND $0601,Y		  ; 39 01 06 | Logical AND with accumulator (absolute,Y)
	CPX $FD0C			; EC 0C FD | Compare X register (absolute)
	ORA $C5			  ; 05 C5 | Logical OR with accumulator (zero page)
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $FF07,X		  ; FE 07 FF | Increment (absolute,X)
	ORA ($F3,X)		  ; 01 F3 | Logical OR with accumulator ((zero page,X))
	PLX				  ; FA | Pull X register from stack
	SEC				  ; 38 | Set carry flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	BCS $80			  ; B0 80 | Branch if carry set
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BMI $C0			  ; 30 C0 | Branch if negative
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_117
; Address: $F0DBBA
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_117:
	LDA				  ; BF C0 7F 80 | Load from absolute long,X into accumulator
	CPY $F1FF			; CC FF F1 | Compare Y register (absolute)
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SBC $02FE,X		  ; FD FE 02 | Subtract with carry (absolute,X)
	ASL $06FF			; 0E FF 06 | Arithmetic shift left (absolute)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	CPY #$71			 ; C0 71 | Compare Y register (immediate)
	ADC ($6F),Y		  ; 71 6F | Add with carry ((zero page),Y)
	STZ $7F			  ; 64 7F | Store zero to zero page
	JMP $0B5F			; 4C 5F 0B | Jump to address
	BPL $FF			  ; 10 FF | Branch if positive
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $5F			  ; 80 5F | Branch always
	LDY #$1B			 ; A0 1B | Load immediate value into Y register
	CPX $80			  ; E4 80 | Compare X register (zero page)
	ORA ($71,X)		  ; 01 71 | Logical OR with accumulator ((zero page,X))
	LDA $BDFF,X		  ; BD FF BD | Load from absolute,X into accumulator
	AND $02EF			; 2D EF 02 | Logical AND with accumulator (absolute)
	REP #$C2			 ; C2 C2 | Reset processor status bits
	REP #$FF			 ; C2 FF | Reset processor status bits
	BPL $C2			  ; 10 C2 | Branch if positive
	AND $3DC2,X		  ; 3D C2 3D | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_119
; Address: $F0DC3B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_119:
	JSR $7C83			; 20 83 7C | Jump to subroutine
	ASL $00F1			; 0E F1 00 | Arithmetic shift left (absolute)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_11A
; Address: $F0DC4C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_11A:
	JSR $00DE			; 20 DE 00 | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	INC $F8FF,X		  ; FE FF F8 | Increment (absolute,X)
	BPL $F0			  ; 10 F0 | Branch if positive
	INC $FF30,X		  ; FE 30 FF | Increment (absolute,X)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPX $FEF7			; EC F7 FE | Compare X register (absolute)
	STY $FF			  ; 84 FF | Store Y register to zero page
	BIT $3F			  ; 24 3F | Test bits in accumulator (zero page)
	INC $FF80,X		  ; FE 80 FF | Increment (absolute,X)
	BRA $6F			  ; 80 6F | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_11B
; Address: $F0DC92
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_11B:
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF C0 CF F0 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	LDA				  ; BF FF 83 FF | Load from absolute long,X into accumulator
	BRA $EF			  ; 80 EF | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	ASL $01FF			; 0E FF 01 | Arithmetic shift left (absolute)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $1F			  ; 10 1F | Branch if positive
	CPX #$17			 ; E0 17 | Compare X register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BRA $EF			  ; 80 EF | Branch always
	BPL $FF			  ; 10 FF | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	INC $000F,X		  ; FE 0F 00 | Increment (absolute,X)
	BEQ $26			  ; F0 26 | Branch if equal
	SBC ($62),Y		  ; F1 62 | Subtract with carry ((zero page),Y)
	STA ($C0),Y		  ; 91 C0 | Store accumulator to (zero page),Y
	AND ($C1),Y		  ; 31 C1 | Logical AND with accumulator ((zero page),Y)
	BMI $08			  ; 30 08 | Branch if negative
	ASL $6FF1			; 0E F1 6F | Arithmetic shift left (absolute)
	BCC $C0			  ; 90 C0 | Branch if carry clear
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	STA ($6E),Y		  ; 91 6E | Store accumulator to (zero page),Y
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	BMI $CF			  ; 30 CF | Branch if negative
	CMP #$34			 ; C9 34 | Compare accumulator (immediate)
	CMP #$38			 ; C9 38 | Compare accumulator (immediate)
	CMP ($C4,X)		  ; C1 C4 | Compare accumulator ((zero page,X))
	AND $21DE,Y		  ; 39 DE 21 | PPU graphics register access
	AND ($33),Y		  ; 31 33 | Logical AND with accumulator ((zero page),Y)
	CPY $FE01			; CC 01 FE | Compare Y register (absolute)
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	AND $20C6,Y		  ; 39 C6 20 | Logical AND with accumulator (absolute,Y)
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	CPY $FE33			; CC 33 FE | Compare Y register (absolute)
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BRA $3E			  ; 80 3E | Branch always
	CMP ($07,X)		  ; C1 07 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_11C
; Address: $F0DD4A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_11C:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BCS $C0			  ; B0 C0 | Branch if carry set
	DEY				  ; 88 | Decrement Y register
	BNE $27			  ; D0 27 | Branch if not equal
	ORA ($F7,X)		  ; 01 F7 | Logical OR with accumulator ((zero page,X))
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $07			  ; F0 07 | Branch if equal
	BEQ $74			  ; F0 74 | Branch if equal
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank60_DmaFunction_11D
; Address: $F0DD72
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_11D:
	JSL $3BC4DD		  ; 22 DD C4 3B | Jump to subroutine long
	PEA #$C10B		   ; F4 0B C1 | Push effective address to stack
	ROL $CF30,X		  ; 3E 30 CF | Rotate left (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	SBC $FB56,X		  ; FD 56 FB | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STA $906F70		  ; 8F 70 6F 90 | Store accumulator to absolute long address
	CPY $3D33			; CC 33 3D | Compare Y register (absolute)
	REP #$DE			 ; C2 DE | Reset processor status bits
	AND ($F7,X)		  ; 21 F7 | Logical AND with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BMI $CF			  ; 30 CF | Branch if negative
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	DEC $C121,X		  ; DE 21 C1 | Decrement (absolute,X)
	LDA ($00),Y		  ; B1 00 | Load from (zero page),Y into accumulator
	SBC $CE06,Y		  ; F9 06 CE | Subtract with carry (absolute,Y)
	AND ($3B),Y		  ; 31 3B | Logical AND with accumulator ((zero page),Y)
	CPY $20			  ; C4 20 | Compare Y register (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $24FB			; 0E FB 24 | Arithmetic shift left (absolute)
	SBC $FD06,X		  ; FD 06 FD | Subtract with carry (absolute,X)
	SBC $02FF,X		  ; FD FF 02 | Subtract with carry (absolute,X)
	SBC $00FF,X		  ; FD FF 00 | Subtract with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CMP $FF22,X		  ; DD 22 FF | Compare accumulator (absolute,X)
	SBC $FB02,X		  ; FD 02 FB | Subtract with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	INC $08F7,X		  ; FE F7 08 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_11F
; Address: $F0DDF9
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_11F:
	JSL $F7C03F		  ; 22 3F C0 F7 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	CPY #$31			 ; C0 31 | Compare Y register (immediate)
	SBC ($10,X)		  ; E1 10 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_120
; Address: $F0DE04
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_120:
	JSR $C010			; 20 10 C0 | Jump to subroutine
	BRA $FF			  ; 80 FF | Branch always
	STA $CE31F0		  ; 8F F0 31 CE | Store accumulator to absolute long address
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	PLA				  ; 68 | Pull accumulator from stack
	BEQ $0F			  ; F0 0F | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	LSR $CC81,X		  ; 5E 81 CC | Logical shift right (absolute,X)
	BIT #$76			 ; 89 76 | Test bits in accumulator (immediate)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_121
; Address: $F0DE4D
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_121:
	JMP ($403F)		  ; 6C 3F 40 | Jump to address (absolute indirect)
	CPY $C03F			; CC 3F C0 | Compare Y register (absolute)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	JMP ($4093)		  ; 6C 93 40 | Jump to address (absolute indirect)
	LDA				  ; BF 33 C0 C0 | Load from absolute long,X into accumulator
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ROR $C1C1,X		  ; 7E C1 C1 | Rotate right (absolute,X)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	AND $C03F,X		  ; 3D 3F C0 | Logical AND with accumulator (absolute,X)
	EOR ($BE,X)		  ; 41 BE | Exclusive OR with accumulator ((zero page,X))
	STA $F00FF0		  ; 8F F0 0F F0 | Store accumulator to absolute long address
	BRA $FF			  ; 80 FF | Branch always
	BEQ $FF			  ; F0 FF | Branch if equal
	ASL $F0F1			; 0E F1 F0 | Arithmetic shift left (absolute)
	BVS $8F			  ; 70 8F | Branch if overflow set
	BRA $89			  ; 80 89 | Branch always
	BEQ $0F			  ; F0 0F | Branch if equal
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	CPY $E003			; CC 03 E0 | Game work RAM access
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_122
; Address: $F0DEA9
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_122:
	CMP ($0C,X)		  ; C1 0C | Compare accumulator ((zero page,X))
	AND $03C3,X		  ; 3D C3 03 | Logical AND with accumulator (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	REP #$3D			 ; C2 3D | Reset processor status bits
	REP #$3D			 ; C2 3D | Reset processor status bits
	BMI $CF			  ; 30 CF | Branch if negative
	CPY $00FF			; CC FF 00 | Compare Y register (absolute)
	BMI $FE			  ; 30 FE | Branch if negative
	ORA ($CC,X)		  ; 01 CC | Logical OR with accumulator ((zero page,X))
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	AND $3D32,X		  ; 3D 32 3D | Logical AND with accumulator (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	AND $DA			  ; 25 DA | Logical AND with accumulator (zero page)
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BCC $C0			  ; 90 C0 | Branch if carry clear
	BMI $01			  ; 30 01 | Branch if negative
	BEQ $91			  ; F0 91 | Branch if equal
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BMI $00			  ; 30 00 | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BCC $6F			  ; 90 6F | Branch if carry clear
	BMI $CF			  ; 30 CF | Branch if negative
	BNE $2F			  ; D0 2F | Branch if not equal
	ORA #$C0			 ; 09 C0 | Logical OR with accumulator (immediate)
	ORA #$C0			 ; 09 C0 | Logical OR with accumulator (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	AND $2000,Y		  ; 39 00 20 | Logical AND with accumulator (absolute,Y)
	ORA ($30,X)		  ; 01 30 | Logical OR with accumulator ((zero page,X))
	ORA ($CC,X)		  ; 01 CC | Logical OR with accumulator ((zero page,X))
	INC $C000,X		  ; FE 00 C0 | Increment (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BCS $00			  ; B0 00 | Branch if carry set
	BCS $4F			  ; B0 4F | Branch if carry set
	CPY #$00			 ; C0 00 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_123
; Address: $F0DF62
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_123:
	JSL $07C005		  ; 22 05 C0 07 | Jump to subroutine long
	BEQ $07			  ; F0 07 | Branch if equal
	CPY #$37			 ; C0 37 | Compare Y register (immediate)
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal

;------------------------------------------------------------------------------
; Bank60_DmaFunction_124
; Address: $F0DF72
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_124:
	ORA $FA			  ; 05 FA | Logical OR with accumulator (zero page)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $FF			  ; F0 FF | Branch if equal
	INX				  ; E8 | Increment X register
	BVS $80			  ; 70 80 | Branch if overflow set
	BMI $CF			  ; 30 CF | Branch if negative
	PLA				  ; 68 | Pull accumulator from stack
	ORA #$F6			 ; 09 F6 | Logical OR with accumulator (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	BIT #$00			 ; 89 00 | Test bits in accumulator (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	JMP $403F			; 4C 3F 40 | Jump to address
	BRA $7F			  ; 80 7F | Branch always
	JMP ($4000)		  ; 6C 00 40 | Jump to address (absolute indirect)
	JMP $40B3			; 4C B3 40 | Jump to address
	LDA				  ; BF 1F E0 00 | Load from absolute long,X into accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_125
; Address: $F0DFED
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_125:
	JSR $003C			; 20 3C 00 | Jump to subroutine
	AND $C0C2,X		  ; 3D C2 C0 | Logical AND with accumulator (absolute,X)
	BRA $7F			  ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_126
; Address: $F0DFFC
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_126:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	BRA $FC			  ; 80 FC | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $F0FE,X		  ; FE FE F0 | Increment (absolute,X)
	BEQ $E6			  ; F0 E6 | Branch if equal
	INC $C8			  ; E6 C8 | Increment (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_127
; Address: $F0E07D
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_127:
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $FE0E			; 0E 0E FE | Arithmetic shift left (absolute)
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CPY #$B3			 ; C0 B3 | Compare Y register (immediate)
	BRA $A2			  ; 80 A2 | Branch always
	LDY #$B3			 ; A0 B3 | Load immediate value into Y register
	AND ($30),Y		  ; 31 30 | Logical AND with accumulator ((zero page),Y)
	AND $01			  ; 25 01 | Logical AND with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND $3E7F,X		  ; 3D 7F 3E | Logical AND with accumulator (absolute,X)
	ROL $1FFF,X		  ; 3E FF 1F | Rotate left (absolute,X)
	LDA				  ; BF 3F 5F 1F | Load from absolute long,X into accumulator
	STA $A7CFEF		  ; 8F EF CF A7 | Store accumulator to absolute long address
	STA ($81),Y		  ; 91 81 | Store accumulator to (zero page),Y
	STA $5F91,X		  ; 9D 91 5F | Store accumulator to absolute,X
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BEQ $80			  ; F0 80 | Branch if equal
	BEQ $C0			  ; F0 C0 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$F8			 ; E0 F8 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC ($E1,X)		  ; E1 E1 | Subtract with carry ((zero page,X))
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	REP #$C2			 ; C2 C2 | Reset processor status bits
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	ASL $3E00,X		  ; 1E 00 3E | Arithmetic shift left (absolute,X)
	AND $0700,X		  ; 3D 00 07 | Logical AND with accumulator (absolute,X)
	ORA ($CE,X)		  ; 01 CE | Logical OR with accumulator ((zero page,X))
	BEQ $00			  ; F0 00 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_128
; Address: $F0E10A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_128:
	BCS $37			  ; B0 37 | Branch if carry set
	BEQ $73			  ; F0 73 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SBC $0000,Y		  ; F9 00 00 | Subtract with carry (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_129
; Address: $F0E11B
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_129:
	BEQ $8C			  ; F0 8C | Branch if equal
	BRA $06			  ; 80 06 | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	ORA $FEFC,X		  ; 1D FC FE | Logical OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	CPY $96C0			; CC C0 96 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_12A
; Address: $F0E1A8
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_12A:
	JSL $38F802		  ; 22 02 F8 38 | Jump to subroutine long
	LDA				  ; BF 3F EF 0F | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	ASL $3FFF,X		  ; 1E FF 3F | Arithmetic shift left (absolute,X)
	INC $FCFE,X		  ; FE FE FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	LDA $00018F		  ; AF 8F 01 00 | Load from absolute long address into accumulator
	ASL $8C00			; 0E 00 8C | Arithmetic shift left (absolute)
	CMP $B942,X		  ; DD 42 B9 | Compare accumulator (absolute,X)
	ASL $3B			  ; 06 3B | Arithmetic shift left (zero page)
	AND $6802,X		  ; 3D 02 68 | Logical AND with accumulator (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	PLB				  ; AB | Pull data bank register from stack
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	PEA #$ED00		   ; F4 00 ED | Push effective address to stack
	ORA $9F5F,X		  ; 1D 5F 9F | Logical OR with accumulator (absolute,X)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	SBC $FDC1,Y		  ; F9 C1 FD | Subtract with carry (absolute,Y)
	STA ($F0,X)		  ; 81 F0 | Store accumulator to (zero page,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_12B
; Address: $F0E234
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_12B:
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INC $FEC0,X		  ; FE C0 FE | Increment (absolute,X)
	BRA $FD			  ; 80 FD | Branch always
	SBC $FEFE,X		  ; FD FE FE | Subtract with carry (absolute,X)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FE			  ; 80 FE | Branch always
	LDY #$FC			 ; A0 FC | Load immediate value into Y register
	BRA $FC			  ; 80 FC | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BRA $FF			  ; 80 FF | Branch always
	STY $80FC			; 8C FC 80 | Store Y register to absolute address
	BRA $FF			  ; 80 FF | Branch always
	SEC				  ; 38 | Set carry flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $7F			  ; 70 7F | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_12C
; Address: $F0E2CE
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_12C:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	BRA $00			  ; 80 00 | Branch always
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	AND $73FC,X		  ; 3D FC 73 | Logical AND with accumulator (absolute,X)
	BEQ $F7			  ; F0 F7 | Branch if equal
	BEQ $CB			  ; F0 CB | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LDX $34			  ; A6 34 | Load from zero page into X register
	BEQ $61			  ; F0 61 | Branch if equal
	INX				  ; E8 | Increment X register
	STY $00			  ; 84 00 | Store Y register to zero page
	INC $F060,X		  ; FE 60 F0 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal

;------------------------------------------------------------------------------
; Bank60_DmaFunction_12D
; Address: $F0E356
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_12D:
	ORA $0000			; 0D 00 00 | Logical OR with accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $B01E,X		  ; 1E 1E B0 | Arithmetic shift left (absolute,X)
	BCS $FC			  ; B0 FC | Branch if carry set
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $E784			; 8C 84 E7 | Store Y register to absolute address
	ADC $E7			  ; 65 E7 | Add with carry (zero page)
	AND ($7C,X)		  ; 21 7C | Logical AND with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ROL $3C08,X		  ; 3E 08 3C | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ROL $0F0E,X		  ; 3E 0E 0F | Rotate left (absolute,X)
	ADC $39FF,X		  ; 7D FF 39 | Add with carry (absolute,X)
	SEC				  ; 38 | Set carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ASL $00FF			; 0E FF 00 | Arithmetic shift left (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	LDY #$9F			 ; A0 9F | Load immediate value into Y register
	CLD				  ; D8 | Clear decimal mode flag
	BPL $1F			  ; 10 1F | Branch if positive
	STZ $63			  ; 64 63 | Store zero to zero page
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	STA				  ; 9F 0F BF 18 | Store accumulator to absolute long,X
	REP #$26			 ; C2 26 | Reset processor status bits
	CPY $6E			  ; C4 6E | Compare Y register (zero page)
	DEY				  ; 88 | Decrement Y register
	STZ $F818			; 9C 18 F8 | Store zero to absolute
	BEQ $B8			  ; F0 B8 | Branch if equal

;------------------------------------------------------------------------------
; Bank60_DmaFunction_12E
; Address: $F0E3CD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_12E:
	JSR $0000			; 20 00 00 | Jump to subroutine
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_12F
; Address: $F0E3E4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_12F:
	BRA $00			  ; 80 00 | Branch always
	ROR $7F7F,X		  ; 7E 7F 7F | Rotate right (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX $FE74			; EC 74 FE | Compare X register (absolute)
	ROR $83			  ; 66 83 | Rotate right (zero page)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_130
; Address: $F0E43B
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_130:
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BRA $FC			  ; 80 FC | Branch always
	BRA $FC			  ; 80 FC | Branch always
	INC $FC00,X		  ; FE 00 FC | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $40			  ; F0 40 | Branch if equal
	SBC ($73),Y		  ; F1 73 | Subtract with carry ((zero page),Y)
	LSR $9A4F			; 4E 4F 9A | Logical shift right (absolute)
	INX				  ; E8 | Increment X register
	LDA $FDC5,Y		  ; B9 C5 FD | Load from absolute,Y into accumulator
	BRA $00			  ; 80 00 | Branch always
	STY $B000			; 8C 00 B0 | Store Y register to absolute address
	CPX $00			  ; E4 00 | Compare X register (zero page)
	LSR $00			  ; 46 00 | Logical shift right (zero page)
	LDA $80FF,Y		  ; B9 FF 80 | Load from absolute,Y into accumulator
	BRA $BF			  ; 80 BF | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_131
; Address: $F0E4B6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_131:
	JSR $4000			; 20 00 40 | Jump to subroutine
	DEC $FE			  ; C6 FE | Decrement (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_132
; Address: $F0E4CC
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_132:
	JSR $20FF			; 20 FF 20 | Jump to subroutine
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BPL $1F			  ; 10 1F | Branch if positive
	BVS $FF			  ; 70 FF | Branch if overflow set
	ASL $03FE			; 0E FE 03 | Arithmetic shift left (absolute)
	BPL $F7			  ; 10 F7 | Branch if positive
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	LSR $47			  ; 46 47 | Logical shift right (zero page)
	ROR $67			  ; 66 67 | Rotate right (zero page)
	SEC				  ; 38 | Set carry flag
	CLV				  ; B8 | Clear overflow flag
	BPL $98			  ; 10 98 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BIT $20			  ; 24 20 | Test bits in accumulator (zero page)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	INC $F3FE,X		  ; FE FE F3 | Increment (absolute,X)
	SBC ($E1),Y		  ; F1 E1 | Subtract with carry ((zero page),Y)
	CPX #$BD			 ; E0 BD | Compare X register (immediate)
	LDA $FEFE,X		  ; BD FE FE | Load from absolute,X into accumulator
	STX $0000			; 8E 00 00 | Store X register to absolute address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_133
; Address: $F0E540
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_133:
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	SBC $FCFC,X		  ; FD FC FC | Subtract with carry (absolute,X)
	LDY $A73C,X		  ; BC 3C A7 | Load from absolute,X into Y register
	BRA $C3			  ; 80 C3 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BMI $30			  ; 30 30 | Branch if negative
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SBC ($01,X)		  ; E1 01 | Subtract with carry ((zero page,X))
	STA $0F0F8F		  ; 8F 8F 0F 0F | Store accumulator to absolute long address
	SBC ($01),Y		  ; F1 01 | Subtract with carry ((zero page),Y)
	BEQ $E0			  ; F0 E0 | Game work RAM access
	ROL $FF30,X		  ; 3E 30 FF | Rotate left (absolute,X)
	BVS $00			  ; 70 00 | Branch if overflow set
	BEQ $00			  ; F0 00 | Branch if equal
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC $3F3F,X		  ; FD 3F 3F | Subtract with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_134
; Address: $F0E5B6
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_134:
	JSR $0200			; 20 00 02 | Jump to subroutine
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	ROL $C2FF,X		  ; 3E FF C2 | Rotate left (absolute,X)
	STY $9C80			; 8C 80 9C | Store Y register to absolute address
	BRA $7C			  ; 80 7C | Branch always
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $E3			  ; F0 E3 | Branch if equal
	CPX $E333			; EC 33 E3 | Compare X register (absolute)
	CMP $877F,Y		  ; D9 7F 87 | Compare accumulator (absolute,Y)
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	ORA $BF			  ; 05 BF | Logical OR with accumulator (zero page)
	LDX $FE80,Y		  ; BE 80 FE | Load from absolute,Y into X register
	CPY #$DC			 ; C0 DC | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank60_DmaFunction_135
; Address: $F0E62B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_135:
	JSR $A07C			; 20 7C A0 | Jump to subroutine
	BRA $FF			  ; 80 FF | Branch always
	BRA $3F			  ; 80 3F | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_136
; Address: $F0E63D
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_136:
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$B8			 ; E0 B8 | Compare X register (immediate)
	BRA $78			  ; 80 78 | Branch always
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	CMP $FD			  ; C5 FD | Compare accumulator (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	SBC $FFC1,X		  ; FD C1 FF | Subtract with carry (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_13A
; Address: $F0E68E
; Size: 72 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_13A:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	ORA #$FF			 ; 09 FF | Logical OR with accumulator (immediate)
	INC $FF07,X		  ; FE 07 FF | Increment (absolute,X)
	BIT $FC			  ; 24 FC | Test bits in accumulator (zero page)
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	ORA ($C1,X)		  ; 01 C1 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	BCC $DC			  ; 90 DC | Branch if carry clear
	CLD				  ; D8 | Clear decimal mode flag
	SBC $F9E8,Y		  ; F9 E8 F9 | Subtract with carry (absolute,Y)
	ADC #$FF			 ; 69 FF | Add with carry (immediate)
	ADC $0DFF			; 6D FF 0D | Add with carry (absolute)
	SBC $D0FD,X		  ; FD FD D0 | Subtract with carry (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	CPX $6DFF			; EC FF 6D | Compare X register (absolute)
	ADC $0DFF			; 6D FF 0D | Add with carry (absolute)
	SBC $FFFF,X		  ; FD FF FF | Subtract with carry (absolute,X)
	LDA				  ; BF FE 3E 3E | Load from absolute long,X into accumulator
	ROL $1EDE,X		  ; 3E DE 1E | Rotate left (absolute,X)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BVS $00			  ; 70 00 | Branch if overflow set
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	CMP ($00,X)		  ; C1 00 | Compare accumulator ((zero page,X))
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $CF			  ; 80 CF | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_13B
; Address: $F0E702
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_13B:
	DEC $0FCA			; CE CA 0F | Decrement (absolute)
	ROL $391C,X		  ; 3E 1C 39 | Rotate left (absolute,X)
	AND ($38),Y		  ; 31 38 | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_13C
; Address: $F0E70F
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_13C:
	JSR $0030			; 20 30 00 | Jump to subroutine
	AND ($FF),Y		  ; 31 FF | Logical AND with accumulator ((zero page),Y)
	AND ($0F,X)		  ; 21 0F | Logical AND with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	DEC $F0FF,X		  ; DE FF F0 | Decrement (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FC			  ; 80 FC | Branch always
	BRA $44			  ; 80 44 | Branch always
	SBC $1F04,X		  ; FD 04 1F | Subtract with carry (absolute,X)
	BPL $37			  ; 10 37 | Branch if positive
	STA $04			  ; 85 04 | Store accumulator to zero page
	STA $FF8F8F		  ; 8F 8F 8F FF | Store accumulator to absolute long address
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	INC $7CF0,X		  ; FE F0 7C | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_13D
; Address: $F0E765
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_13D:
	BEQ $FF			  ; F0 FF | Branch if equal
	BMI $FF			  ; 30 FF | Branch if negative
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_13E
; Address: $F0E777
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_13E:
	JSR $D3FF			; 20 FF D3 | Jump to subroutine
	BEQ $F0			  ; F0 F0 | Branch if equal
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BRA $39			  ; 80 39 | Branch always
	STA $00E700		  ; 8F 00 E7 00 | Store accumulator to absolute long address
	ORA ($C7,X)		  ; 01 C7 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	INC $FFC0,X		  ; FE C0 FF | Increment (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	STA $CE87FE		  ; 8F FE 87 CE | Store accumulator to absolute long address
	ORA ($70,X)		  ; 01 70 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CLV				  ; B8 | Clear overflow flag
	INC $7CFF,X		  ; FE FF 7C | Increment (absolute,X)
	BRA $BC			  ; 80 BC | Branch always
	RTI				  ; 40 | Return from interrupt
	BRA $3C			  ; 80 3C | Branch always
	INX				  ; E8 | Increment X register
	TAY				  ; A8 | Transfer accumulator to Y register
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank60_DmaFunction_13F
; Address: $F0E80D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_13F:
	CLD				  ; D8 | Clear decimal mode flag
	BPL $1F			  ; 10 1F | Branch if positive
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $78			  ; 80 78 | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_140
; Address: $F0E821
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_140:
	JSR $0070			; 20 70 00 | Jump to subroutine
	BVS $00			  ; 70 00 | Branch if overflow set
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	BMI $00			  ; 30 00 | Branch if negative
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ORA #$F8			 ; 09 F8 | Logical OR with accumulator (immediate)
	ASL $79E8			; 0E E8 79 | Arithmetic shift left (absolute)
	BNE $6D			  ; D0 6D | Branch if not equal
	CPX #$78			 ; E0 78 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	INC $B0			  ; E6 B0 | Increment (zero page)
	BCS $00			  ; B0 00 | Branch if carry set
	PHP				  ; 08 | Push processor status to stack
	BPL $1F			  ; 10 1F | Branch if positive
	CLC				  ; 18 | Clear carry flag
	AND $4F20,Y		  ; 39 20 4F | Logical AND with accumulator (absolute,Y)
	ORA ($F1,X)		  ; 01 F1 | Logical OR with accumulator ((zero page,X))
	BEQ $CE			  ; F0 CE | Branch if equal
	BRA $61			  ; 80 61 | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_141
; Address: $F0E885
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_141:
	JSR $F8F8			; 20 F8 F8 | Jump to subroutine
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	LSR $F0FF,X		  ; 5E FF F0 | Logical shift right (absolute,X)
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $FC			  ; 80 FC | Branch always
	BRA $45			  ; 80 45 | Branch always
	ORA $FC			  ; 05 FC | Logical OR with accumulator (zero page)
	BPL $37			  ; 10 37 | Branch if positive
	STA $04			  ; 85 04 | Store accumulator to zero page

;------------------------------------------------------------------------------
; Bank60_DmaFunction_142
; Address: $F0E8AD
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_142:
	STA $FF8F8C		  ; 8F 8C 8F FF | Store accumulator to absolute long address
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BVS $00			  ; 70 00 | Branch if overflow set
	DEC $DCD0,X		  ; DE D0 DC | Decrement (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $FE			  ; F0 FE | Branch if equal
	BMI $FE			  ; 30 FE | Branch if negative
	BNE $E7			  ; D0 E7 | Branch if not equal
	CPX #$E3			 ; E0 E3 | Compare X register (immediate)
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	BNE $FF			  ; D0 FF | Branch if not equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_144
; Address: $F0E8DD
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_144:
	JSR $103F			; 20 3F 10 | Jump to subroutine
	EOR ($50),Y		  ; 51 50 | Exclusive OR with accumulator ((zero page),Y)
	LDA				  ; BF 18 FD 10 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	LDA				  ; BF 3F FF 7F | Load from absolute long,X into accumulator
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	STA $FFFF8F		  ; 8F 8F FF FF | Store accumulator to absolute long address
	SBC $FEF9,Y		  ; F9 F9 FE | Subtract with carry (absolute,Y)
	INC $003C,X		  ; FE 3C 00 | Increment (absolute,X)
	BMI $00			  ; 30 00 | Branch if negative
	BVS $00			  ; 70 00 | Branch if overflow set
	BPL $00			  ; 10 00 | Branch if positive
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $818F83		  ; 8F 83 8F 81 | Store accumulator to absolute long address
	BRA $C1			  ; 80 C1 | Branch always
	CPY #$E1			 ; C0 E1 | Compare Y register (immediate)
	CPX #$F0			 ; E0 F0 | Compare X register (immediate)
	BEQ $78			  ; F0 78 | Branch if equal
	SEI				  ; 78 | Set interrupt disable flag
	STA $030F03		  ; 8F 03 0F 03 | Store accumulator to absolute long address
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	LDA				  ; BF 00 3F 00 | Load from absolute long,X into accumulator
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	BCC $90			  ; 90 90 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank60_DmaFunction_145
; Address: $F0E98E
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_145:
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	BCC $6F			  ; 90 6F | Branch if carry clear
	BRA $7F			  ; 80 7F | Branch always
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	BRA $3F			  ; 80 3F | Branch always
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	CPY #$0F			 ; C0 0F | Compare Y register (immediate)
	ORA ($1E,X)		  ; 01 1E | Logical OR with accumulator ((zero page,X))
	ORA $F4			  ; 05 F4 | Logical OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	SEP #$7C			 ; E2 7C | Set processor status bits
	ADC $31ED,Y		  ; 79 ED 31 | Add with carry (absolute,Y)
	INC $FCFF,X		  ; FE FF FC | Increment (absolute,X)
	SBC $E0FE,Y		  ; F9 FE E0 | Game work RAM access
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))
	BCS $DC			  ; B0 DC | Branch if carry set
	BNE $9C			  ; D0 9C | Branch if not equal
	BCC $3E			  ; 90 3E | Branch if carry clear

;------------------------------------------------------------------------------
; Bank60_DmaFunction_146
; Address: $F0E9E7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_146:
	JSR $407E			; 20 7E 40 | Jump to subroutine
	BRA $FC			  ; 80 FC | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_147
; Address: $F0E9F3
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_147:
	JSR $609F			; 20 9F 60 | Jump to subroutine
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA ($F0),Y		  ; 91 F0 | Store accumulator to (zero page),Y
	DEC $9F5F,X		  ; DE 5F 9F | Decrement (absolute,X)
	LDA				  ; BF FF BF FF | Load from absolute long,X into accumulator
	CLC				  ; 18 | Clear carry flag
	AND ($10),Y		  ; 31 10 | Logical AND with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_14A
; Address: $F0EA5A
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_14A:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BCS $3F			  ; B0 3F | Branch if carry set
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	INC $E3FF,X		  ; FE FF E3 | Increment (absolute,X)
	LDX $F1BF,Y		  ; BE BF F1 | Load from absolute,Y into X register
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	BEQ $FF			  ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank60_DmaFunction_14B
; Address: $F0EA82
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_14B:
	JSR $00FF			; 20 FF 00 | Jump to subroutine
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_14D
; Address: $F0EAA1
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_14D:
	CPX #$73			 ; E0 73 | Compare X register (immediate)
	EOR ($FF,X)		  ; 41 FF | Exclusive OR with accumulator ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	LDA				  ; BF BF FF FF | Load from absolute long,X into accumulator
	DEC $00FF,X		  ; DE FF 00 | Decrement (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF BF FF FF | Load from absolute long,X into accumulator
	RTI				  ; 40 | Return from interrupt
	BEQ $F1			  ; F0 F1 | Branch if equal
	BEQ $F8			  ; F0 F8 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	SBC $FEFC,X		  ; FD FC FE | Subtract with carry (absolute,X)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	CPX $FEEC			; EC EC FE | Compare X register (absolute)
	INC $000F,X		  ; FE 0F 00 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STY $FF0C			; 8C 0C FF | Store Y register to absolute address
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ROL $3EFF,X		  ; 3E FF 3E | Rotate left (absolute,X)
	STY $FF73			; 8C 73 FF | Store Y register to absolute address
	STA				  ; 9F FF C0 FF | Store accumulator to absolute long,X
	SBC $EE71			; ED 71 EE | Subtract with carry (absolute)
	BVS $EE			  ; 70 EE | Branch if overflow set
	BVS $EE			  ; 70 EE | Branch if overflow set
	BVS $EF			  ; 70 EF | Branch if overflow set

;------------------------------------------------------------------------------
; Bank60_DmaFunction_14E
; Address: $F0EBA9
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_14E:
	BVS $EF			  ; 70 EF | Branch if overflow set
	BVS $EF			  ; 70 EF | Branch if overflow set
	BVS $EC			  ; 70 EC | Branch if overflow set
	BVS $81			  ; 70 81 | Branch if overflow set
	INC $FF80,X		  ; FE 80 FF | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	BVS $FF			  ; 70 FF | Branch if overflow set
	BRA $3F			  ; 80 3F | Branch always
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	STA $008F00		  ; 8F 00 8F 00 | Store accumulator to absolute long address
	SBC $1FFF,Y		  ; F9 FF 1F | Subtract with carry (absolute,Y)
	DEC $CD1E,X		  ; DE 1E CD | Decrement (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SEC				  ; 38 | Set carry flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $07			  ; E6 07 | Increment (zero page)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $3FFF,X		  ; 1E FF 3F | Arithmetic shift left (absolute,X)
	INC $00FE,X		  ; FE FE 00 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND $1CFF,Y		  ; 39 FF 1C | Logical AND with accumulator (absolute,Y)
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	INC $E7			  ; E6 E7 | Increment (zero page)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_14F
; Address: $F0ECCC
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_14F:
	REP #$C3			 ; C2 C3 | Reset processor status bits
	CLC				  ; 18 | Clear carry flag
	ASL $0DFF,X		  ; 1E FF 0D | Arithmetic shift left (absolute,X)
	STA $F9FF,Y		  ; 99 FF F9 | Store accumulator to absolute,Y
	SBC $FEFF,Y		  ; F9 FF FE | Subtract with carry (absolute,Y)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $FCFC,X		  ; FE FC FC | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SBC $F3F8,Y		  ; F9 F8 F3 | Subtract with carry (absolute,Y)
	BEQ $EF			  ; F0 EF | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $E30C			; 0D 0C E3 | Logical OR with accumulator (absolute)
	BVS $EF			  ; 70 EF | Branch if overflow set
	PLA				  ; 68 | Pull accumulator from stack
	EOR $47C7			; 4D C7 47 | Exclusive OR with accumulator (absolute)
	BPL $CF			  ; 10 CF | Branch if positive
	BMI $C7			  ; 30 C7 | Branch if negative
	SEC				  ; 38 | Set carry flag
	SBC $FE19,Y		  ; F9 19 FE | Subtract with carry (absolute,Y)
	ASL $04FC,X		  ; 1E FC 04 | Arithmetic shift left (absolute,X)
	SBC $F318,Y		  ; F9 18 F3 | Subtract with carry (absolute,Y)
	BVS $C3			  ; 70 C3 | Branch if overflow set
	CPY #$9F			 ; C0 9F | Compare Y register (immediate)
	BRA $E3			  ; 80 E3 | Branch always
	SBC $FE06,Y		  ; F9 06 FE | Subtract with carry (absolute,Y)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	JMP $08B740		  ; 5C 40 B7 08 | Jump to address long
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 40 BF 00 | Load from absolute long,X into accumulator
	SBC $EC71			; ED 71 EC | Subtract with carry (absolute)
	BVS $EC			  ; 70 EC | Branch if overflow set
	ADC ($ED),Y		  ; 71 ED | Add with carry ((zero page),Y)
	ADC ($EE),Y		  ; 71 EE | Add with carry ((zero page),Y)
	BVS $EC			  ; 70 EC | Branch if overflow set
	ADC ($EC),Y		  ; 71 EC | Add with carry ((zero page),Y)
	BVS $81			  ; 70 81 | Branch if overflow set
	INC $FF80,X		  ; FE 80 FF | Increment (absolute,X)
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_150
; Address: $F0EDB6
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_150:
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	BRA $FF			  ; 80 FF | Branch always
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	SED				  ; F8 | Set decimal mode flag
	INC $E302,X		  ; FE 02 E3 | Increment (absolute,X)
	CPY $C1CF			; CC CF C1 | Compare Y register (absolute)
	INC $F806,X		  ; FE 06 F8 | Increment (absolute,X)
	BEQ $F1			  ; F0 F1 | Branch if equal
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BMI $FF			  ; 30 FF | Branch if negative
	INC $9000,X		  ; FE 00 90 | Increment (absolute,X)
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	STA				  ; 9F 1F BF 3F | Store accumulator to absolute long,X
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_151
; Address: $F0EE04
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_151:
	STA ($81,X)		  ; 81 81 | Store accumulator to (zero page,X)
	ROR $0C00,X		  ; 7E 00 0C | Rotate right (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $8300,X		  ; FE 00 83 | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_152
; Address: $F0EE42
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_152:
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC				  ; 1A | Increment accumulator
	SBC $F8FD,X		  ; FD FD F8 | Subtract with carry (absolute,X)
	SBC $EFE3,Y		  ; F9 E3 EF | Subtract with carry (absolute,Y)
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	TXS				  ; 9A | Transfer X register to stack pointer
	LDA $FFCE,X		  ; BD CE FF | Load from absolute,X into accumulator
	XBA				  ; EB | Exchange accumulator bytes
	ADC $7FFD,X		  ; 7D FD 7F | Add with carry (absolute,X)
	LDA				  ; BF 3F FF BF | Load from absolute long,X into accumulator
	BPL $00			  ; 10 00 | Branch if positive
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	BRA $FF			  ; 80 FF | Branch always
	CMP $FFD9,Y		  ; D9 D9 FF | Compare accumulator (absolute,Y)
	INC $E0FF,X		  ; FE FF E0 | Game work RAM access
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	BCC $FF			  ; 90 FF | Branch if carry clear
	ROL $00			  ; 26 00 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_153
; Address: $F0EEE0
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_153:
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTI				  ; 40 | Return from interrupt
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	ASL $10FE			; 0E FE 10 | Arithmetic shift left (absolute)
	BEQ $20			  ; F0 20 | Branch if equal
	CPX #$2E			 ; E0 2E | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BRA $00			  ; 80 00 | Branch always
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $C700,X		  ; FE 00 C7 | Increment (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	INC $F5E1			; EE E1 F5 | Increment (absolute)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	ROR $8EFA,X		  ; 7E FA 8E | Rotate right (absolute,X)
	PLX				  ; FA | Pull X register from stack
	ASL $7B			  ; 06 7B | Arithmetic shift left (zero page)
	BMI $0C			  ; 30 0C | Branch if negative

;------------------------------------------------------------------------------
; Bank60_DmaFunction_154
; Address: $F0EF51
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_154:
	JSR $01FE			; 20 FE 01 | Jump to subroutine
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CMP $00C0,Y		  ; D9 C0 00 | Compare accumulator (absolute,Y)
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	CPY #$6C			 ; C0 6C | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	STA ($7F,X)		  ; 81 7F | Store accumulator to (zero page,X)
	BRA $7F			  ; 80 7F | Branch always
	CPX $FF13			; EC 13 FF | Compare X register (absolute)
	INC $6000,X		  ; FE 00 60 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC $ED72			; ED 72 ED | Subtract with carry (absolute)
	SBC $EF70			; ED 70 EF | Subtract with carry (absolute)
	INC $8372			; EE 72 83 | Increment (absolute)
	BRA $FC			  ; 80 FC | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BRA $FC			  ; 80 FC | Branch always
	BRA $FC			  ; 80 FC | Branch always
	STA ($FC,X)		  ; 81 FC | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_155
; Address: $F0EFC2
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_155:
	STA $0F0F0F		  ; 8F 0F 0F 0F | Store accumulator to absolute long address
	LDA				  ; BF BF FF FF | Load from absolute long,X into accumulator
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	ROR $00F8,X		  ; 7E F8 00 | Rotate right (absolute,X)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $01			  ; 80 01 | Branch always
	LDX $FFEF,Y		  ; BE EF FF | Load from absolute,Y into X register
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	BVC $3F			  ; 50 3F | Branch if overflow clear
	BEQ $BC			  ; F0 BC | Branch if equal
	SBC $2C			  ; E5 2C | Subtract with carry (zero page)
	EOR ($BE,X)		  ; 41 BE | Exclusive OR with accumulator ((zero page,X))
	INC $00FF,X		  ; FE FF 00 | Increment (absolute,X)
	CPY $3C03			; CC 03 3C | Compare Y register (absolute)
	ROR $F87E,X		  ; 7E 7E F8 | Rotate right (absolute,X)
	ADC $E063,Y		  ; 79 63 E0 | Game work RAM access
	ORA $DFA3			; 0D A3 DF | Logical OR with accumulator (absolute)
	STA ($00,X)		  ; 81 00 | Store accumulator to (zero page,X)
	STZ $E001,X		  ; 9E 01 E0 | Game work RAM access
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF A7 9F AF | Load from absolute long,X into accumulator
	STA $6E2F1F		  ; 8F 1F 2F 6E | Store accumulator to absolute long address
	INC $7CDF,X		  ; FE DF 7C | Increment (absolute,X)
	SBC $F99E,Y		  ; F9 9E F9 | Subtract with carry (absolute,Y)
	ASL $0F70			; 0E 70 0F | Arithmetic shift left (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_156
; Address: $F0F054
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_156:
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_157
; Address: $F0F05E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_157:
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC $98FF,Y		  ; F9 FF 98 | Subtract with carry (absolute,Y)
	EOR ($BE,X)		  ; 41 BE | Exclusive OR with accumulator ((zero page,X))
	INC $BE01,X		  ; FE 01 BE | Increment (absolute,X)
	ORA ($53,X)		  ; 01 53 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 97 37 5B | Load from absolute long,X into accumulator
	PHB				  ; 8B | Push data bank register to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank60_DmaFunction_158
; Address: $F0F088
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_158:
	CMP $FC3B			; CD 3B FC | Compare accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	SBC $C038,X		  ; FD 38 C0 | Subtract with carry (absolute,X)
	BEQ $04			  ; F0 04 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_159
; Address: $F0F09E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_159:
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_15A
; Address: $F0F0AE
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_15A:
	SEC				  ; 38 | Set carry flag
	LDA				  ; BF 00 00 00 | Load from absolute long,X into accumulator
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	PHP				  ; 08 | Push processor status to stack
	PLX				  ; FA | Pull X register from stack
	PLY				  ; 7A | Pull Y register from stack
	CPX #$C2			 ; E0 C2 | Compare X register (immediate)
	STZ $0000			; 9C 00 00 | Store zero to absolute
	SEC				  ; 38 | Set carry flag
	BEQ $36			  ; F0 36 | Branch if equal
	BEQ $E4			  ; F0 E4 | Branch if equal
	CPX #$8D			 ; E0 8D | Compare X register (immediate)
	BRA $F4			  ; 80 F4 | Branch always
	RTI				  ; 40 | Return from interrupt
	ASL $6306			; 0E 06 63 | Arithmetic shift left (absolute)
	PHA				  ; 48 | Push accumulator to stack
	SED				  ; F8 | Set decimal mode flag
	INC $B801,X		  ; FE 01 B8 | Increment (absolute,X)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $E400,X		  ; FE 00 E4 | Increment (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BMI $C0			  ; 30 C0 | Branch if negative
	BPL $E0			  ; 10 E0 | Game work RAM access
	BPL $E0			  ; 10 E0 | Game work RAM access
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $E6			  ; 80 E6 | Branch always
	SBC ($F3,X)		  ; E1 F3 | Subtract with carry ((zero page,X))
	BEQ $F9			  ; F0 F9 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	JMP $803CC0		  ; 5C C0 3C 80 | Jump to address long
	STX $EF80			; 8E 80 EF | Store X register to absolute address
	CPX #$CE			 ; E0 CE | Compare X register (immediate)
	RTI				  ; 40 | Return from interrupt
	AND $CFE1			; 2D E1 CF | Logical AND with accumulator (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always

;------------------------------------------------------------------------------
; Bank60_DmaFunction_15B
; Address: $F0F176
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_15B:
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ADC $C27E,Y		  ; 79 7E C2 | Add with carry (absolute,Y)
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	ADC $3F81,X		  ; 7D 81 3F | Add with carry (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	INC $ED00,X		  ; FE 00 ED | Increment (absolute,X)
	BVS $ED			  ; 70 ED | Branch if overflow set
	CPX $EE70			; EC 70 EE | Compare X register (absolute)
	BVS $EF			  ; 70 EF | Branch if overflow set
	BVS $E9			  ; 70 E9 | Branch if overflow set
	ROL $337E,X		  ; 3E 7E 33 | Rotate left (absolute,X)
	ADC $8300,Y		  ; 79 00 83 | Add with carry (absolute,Y)
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPY $FFFF			; CC FF FF | Compare Y register (absolute)
	DEC $249E,X		  ; DE 9E 24 | Decrement (absolute,X)
	SBC #$43			 ; E9 43 | Subtract with carry (immediate)
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	ROR $FC81,X		  ; 7E 81 FC | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BMI $CF			  ; 30 CF | Branch if negative
	PHX				  ; DA | Push X register to stack
	SBC ($81,X)		  ; E1 81 | Subtract with carry ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ORA #$F0			 ; 09 F0 | Logical OR with accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $FF			  ; 80 FF | Branch always
	LDA $20D3			; AD D3 20 | Load from absolute address into accumulator
	CPY #$7F			 ; C0 7F | Compare Y register (immediate)
	CMP ($BF,X)		  ; C1 BF | Compare accumulator ((zero page,X))
	ADC ($3F),Y		  ; 71 3F | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ROL $0EFF,X		  ; 3E FF 0E | Rotate left (absolute,X)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	CPY $FB			  ; C4 FB | Compare Y register (zero page)
	ASL $00E1,X		  ; 1E E1 00 | Arithmetic shift left (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	SBC ($FE),Y		  ; F1 FE | Subtract with carry ((zero page),Y)
	SBC $F9F5,Y		  ; F9 F5 F9 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_15C
; Address: $F0F248
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_15C:
	PEA #$94F8		   ; F4 F8 94 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	ASL $0CF0			; 0E F0 0C | Arithmetic shift left (absolute)
	BEQ $00			  ; F0 00 | Branch if equal
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	PEA #$FF81		   ; F4 81 FF | Push effective address to stack
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_15D
; Address: $F0F271
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_15D:
	STA				  ; 9F F4 0B FF | Store accumulator to absolute long,X
	SBC $F9FC			; ED FC F9 | Subtract with carry (absolute)
	SBC $F9F9,Y		  ; F9 F9 F9 | Subtract with carry (absolute,Y)
	CMP $CDFC,X		  ; DD FC CD | Compare accumulator (absolute,X)
	BMI $CF			  ; 30 CF | Branch if negative
	SBC $F906,Y		  ; F9 06 F9 | Subtract with carry (absolute,Y)
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	STA				  ; 9F 1F DF 5F | Store accumulator to absolute long,X
	DEC $8C5E,X		  ; DE 5E 8C | Decrement (absolute,X)
	AND $E0D0			; 2D D0 E0 | Game work RAM access
	BEQ $84			  ; F0 84 | Branch if equal
	ORA #$C2			 ; 09 C2 | Logical OR with accumulator (immediate)
	AND ($20),Y		  ; 31 20 | Logical AND with accumulator ((zero page),Y)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BRA $61			  ; 80 61 | Branch always
	BRA $33			  ; 80 33 | Branch always
	CPY #$FE			 ; C0 FE | Compare Y register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ADC ($3E,X)		  ; 61 3E | Add with carry ((zero page,X))
	ADC ($FF,X)		  ; 61 FF | Add with carry ((zero page,X))
	ADC ($FF),Y		  ; 71 FF | Add with carry ((zero page),Y)
	SBC $F0FF,Y		  ; F9 FF F0 | Subtract with carry (absolute,Y)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	CLV				  ; B8 | Clear overflow flag
	INY				  ; C8 | Increment Y register
	LDA				  ; BF BF FF FF | Load from absolute long,X into accumulator
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF 00 FF 00 | Load from absolute long,X into accumulator
	LDY $1162,X		  ; BC 62 11 | Load from absolute,X into Y register
	LDA $CCFF0C		  ; AF 0C FF CC | Load from absolute long address into accumulator
	INC				  ; 1A | Increment accumulator
	STZ $FE01			; 9C 01 FE | Store zero to absolute
	BIT #$11			 ; 89 11 | Test bits in accumulator (immediate)
	STY $12D0			; 8C D0 12 | Store Y register to absolute address
	AND $12CE			; 2D CE 12 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_15E
; Address: $F0F32E
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_15E:
	SBC $0001,Y		  ; F9 01 00 | Subtract with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $1FE0,X		  ; 1E E0 1F | Arithmetic shift left (absolute,X)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	STA				  ; 9F 1F 4F 8F | Store accumulator to absolute long,X
	BCC $E0			  ; 90 E0 | Game work RAM access
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BRA $80			  ; 80 80 | Branch always
	BRA $80			  ; 80 80 | Branch always
	BRA $98			  ; 80 98 | Branch always
	SEC				  ; 38 | Set carry flag
	ORA $0700			; 0D 00 07 | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	BEQ $7F			  ; F0 7F | Branch if equal
	INX				  ; E8 | Increment X register
	BEQ $80			  ; F0 80 | Branch if equal
	BRA $FF			  ; 80 FF | Branch always
	BRA $FF			  ; 80 FF | Branch always
	ADC $11EF,Y		  ; 79 EF 11 | Add with carry (absolute,Y)
	DEC $1FEF,X		  ; DE EF 1F | Decrement (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	SBC ($18),Y		  ; F1 18 | Subtract with carry ((zero page),Y)
	PLX				  ; FA | Pull X register from stack
	CPY $FF86			; CC 86 FF | Compare Y register (absolute)
	INC $ECFF			; EE FF EC | Increment (absolute)
	BPL $FF			  ; 10 FF | Branch if positive
	SBC $30CF,X		  ; FD CF 30 | Subtract with carry (absolute,X)
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_15F
; Address: $F0F3E2
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_15F:
	JSR $5BDE			; 20 DE 5B | Jump to subroutine
	STA ($46,X)		  ; 81 46 | Store accumulator to (zero page,X)
	JMP $6F8F			; 4C 8F 6F | Jump to address
	STA $4001E1		  ; 8F E1 01 40 | Store accumulator to absolute long address
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $01			  ; F0 01 | Branch if equal
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	ADC $F011,Y		  ; 79 11 F0 | Add with carry (absolute,Y)
	ROL $00FE			; 2E FE 00 | Rotate left (absolute)
	INC $FFF3,X		  ; FE F3 FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_160
; Address: $F0F40A
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_160:
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	STA ($FF,X)		  ; 81 FF | Store accumulator to (zero page,X)
	SEI				  ; 78 | Set interrupt disable flag
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CLC				  ; 18 | Clear carry flag
	BEQ $F0			  ; F0 F0 | Branch if equal
	BEQ $F0			  ; F0 F0 | Branch if equal
	ORA $0018,Y		  ; 19 18 00 | Logical OR with accumulator (absolute,Y)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CLC				  ; 18 | Clear carry flag
	BEQ $1C			  ; F0 1C | Branch if equal
	CPX #$F9			 ; E0 F9 | Compare X register (immediate)
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	BRA $00			  ; 80 00 | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STA				  ; 9F FF CE FE | Store accumulator to absolute long,X
	DEC $C6FE			; CE FE C6 | Decrement (absolute)
	INC $FEFE,X		  ; FE FE FE | Increment (absolute,X)
	INC $DDFE,X		  ; FE FE DD | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($DC,X)		  ; 01 DC | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	STZ $64			  ; 64 64 | Store zero to zero page
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	STZ $9B			  ; 64 9B | Store zero to zero page
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	AND $BE03,X		  ; 3D 03 BE | Logical AND with accumulator (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($E6,X)		  ; 01 E6 | Logical OR with accumulator ((zero page,X))
	ORA ($76,X)		  ; 01 76 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	STX $4201			; 8E 01 42 | Hardware register operation
	STA ($52,X)		  ; 81 52 | Store accumulator to (zero page,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_161
; Address: $F0F4E5
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_161:
	STA ($DD),Y		  ; 91 DD | Store accumulator to (zero page),Y
	LDA				  ; BF 3E BF 3E | Load from absolute long,X into accumulator
	STA				  ; 9F 1C 9B 18 | Store accumulator to absolute long,X
	BPL $EF			  ; 10 EF | Branch if positive
	ROL $3EC1,X		  ; 3E C1 3E | Rotate left (absolute,X)
	CMP ($1C,X)		  ; C1 1C | Compare accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	AND $7BFE,Y		  ; 39 FE 7B | Logical AND with accumulator (absolute,Y)
	EOR $F8			  ; 45 F8 | Exclusive OR with accumulator (zero page)
	CPX #$83			 ; E0 83 | Compare X register (immediate)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $73			  ; 80 73 | Branch always
	LDA ($0F),Y		  ; B1 0F | Load from (zero page),Y into accumulator
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	INY				  ; C8 | Increment Y register
	BEQ $EF			  ; F0 EF | Branch if equal
	BEQ $6E			  ; F0 6E | Branch if equal
	SBC ($80),Y		  ; F1 80 | Subtract with carry ((zero page),Y)
	CPX $F8EC			; EC EC F8 | Compare X register (absolute)
	LDA $FFC1,Y		  ; B9 C1 FF | Load from absolute,Y into accumulator
	CPX $0013			; EC 13 00 | Compare X register (absolute)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ROR $941E			; 6E 1E 94 | Rotate right (absolute)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	ADC $307F,X		  ; 7D 7F 30 | Add with carry (absolute,X)
	INC $F401,X		  ; FE 01 F4 | Increment (absolute,X)
	ORA #$FE			 ; 09 FE | Logical OR with accumulator (immediate)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BRA $3F			  ; 80 3F | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ASL $1818,X		  ; 1E 18 18 | Arithmetic shift left (absolute,X)
	STZ $67			  ; 64 67 | Store zero to zero page
	CPX #$E3			 ; E0 E3 | Compare X register (immediate)
	ASL $18E1,X		  ; 1E E1 18 | Arithmetic shift left (absolute,X)
	STY $9867			; 8C 67 98 | Store Y register to absolute address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_163
; Address: $F0F5A8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_163:
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	STA				  ; 9F 00 01 00 | Store accumulator to absolute long,X
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	WDM #$01			 ; 42 01 | Reserved instruction
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	SBC ($F1,X)		  ; E1 F1 | Subtract with carry ((zero page,X))
	BEQ $FF			  ; F0 FF | Branch if equal
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_164
; Address: $F0F5DB
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_164:
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	SBC ($81,X)		  ; E1 81 | Subtract with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_165
; Address: $F0F5E4
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_165:
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	ASL $701F,X		  ; 1E 1F 70 | Arithmetic shift left (absolute,X)
	BVS $7F			  ; 70 7F | Branch if overflow set
	BRA $FF			  ; 80 FF | Branch always
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STA ($7E,X)		  ; 81 7E | Store accumulator to (zero page,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	BRA $FF			  ; 80 FF | Branch always
	PHB				  ; 8B | Push data bank register to stack
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ASL $1001			; 0E 01 10 | Arithmetic shift left (absolute)
	ASL $C601,X		  ; 1E 01 C6 | Arithmetic shift left (absolute,X)
	CMP ($C6,X)		  ; C1 C6 | Compare accumulator ((zero page,X))
	CMP ($F5,X)		  ; C1 F5 | Compare accumulator ((zero page,X))
	SBC #$E6			 ; E9 E6 | Subtract with carry (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	PEA #$1F00		   ; F4 00 1F | Push effective address to stack
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	LDA				  ; BF 03 FF 03 | Load from absolute long,X into accumulator
	SEI				  ; 78 | Set interrupt disable flag
	BRA $40			  ; 80 40 | Branch always
	BRA $20			  ; 80 20 | Branch always
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	CPY #$70			 ; C0 70 | Compare Y register (immediate)
	BRA $70			  ; 80 70 | Branch always
	BRA $70			  ; 80 70 | Branch always
	BRA $98			  ; 80 98 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_166
; Address: $F0F6A0
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_166:
	ASL $1C01,X		  ; 1E 01 1C | Arithmetic shift left (absolute,X)
	STY $FF			  ; 84 FF | Store Y register to zero page
	STZ $9C7F			; 9C 7F 9C | Store zero to absolute
	CMP #$3E			 ; C9 3E | Compare accumulator (immediate)
	SBC ($1E,X)		  ; E1 1E | Subtract with carry ((zero page,X))
	PHX				  ; DA | Push X register to stack
	CLC				  ; 18 | Clear carry flag
	CLD				  ; D8 | Clear decimal mode flag
	BCC $1F			  ; 90 1F | Branch if carry clear
	BCC $1F			  ; 90 1F | Branch if carry clear
	LDA ($3E),Y		  ; B1 3E | Load from (zero page),Y into accumulator
	CLC				  ; 18 | Clear carry flag
	CPX #$0F			 ; E0 0F | Compare X register (immediate)
	BEQ $1F			  ; F0 1F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPX #$3F			 ; E0 3F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$67			 ; C0 67 | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_167
; Address: $F0F702
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_167:
	BRA $80			  ; 80 80 | Branch always
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_168
; Address: $F0F711
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_168:
	STA				  ; 9F 80 7F FF | Store accumulator to absolute long,X
	BPL $0F			  ; 10 0F | Branch if positive
	PEA #$0BF3		   ; F4 F3 0B | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	INC $07F8,X		  ; FE F8 07 | Increment (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	AND ($C1,X)		  ; 21 C1 | Logical AND with accumulator ((zero page,X))
	DEC $300F			; CE 0F 30 | Decrement (absolute)
	SED				  ; F8 | Set decimal mode flag
	BEQ $01			  ; F0 01 | Branch if equal
	INC $FC03,X		  ; FE 03 FC | Increment (absolute,X)
	BEQ $3F			  ; F0 3F | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	PEA #$FCF8		   ; F4 F8 FC | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	TXA				  ; 8A | Transfer X register to accumulator
	STY $CF4C			; 8C 4C CF | Store Y register to absolute address
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	STA $30CF70		  ; 8F 70 CF 30 | Store accumulator to absolute long address
	STA				  ; 9F 1F DF 1F | Store accumulator to absolute long,X
	LDA $CFAFCF		  ; AF CF AF CF | Load from absolute long address into accumulator
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_169
; Address: $F0F794
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_169:
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	BEQ $00			  ; F0 00 | Branch if equal
	PHX				  ; DA | Push X register to stack
	SEP #$18			 ; E2 18 | Set processor status bits

;------------------------------------------------------------------------------
; Bank60_DmaFunction_16A
; Address: $F0F7A7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_16A:
	JSR $FFFF			; 20 FF FF | Jump to subroutine
	SED				  ; F8 | Set decimal mode flag
	BEQ $20			  ; F0 20 | Branch if equal

;------------------------------------------------------------------------------
; Bank60_DmaFunction_16B
; Address: $F0F7B2
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_16B:
	JSR $3D00			; 20 00 3D | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	INY				  ; C8 | Increment Y register
	CPX #$E0			 ; E0 E0 | Game work RAM access
	CPX #$E0			 ; E0 E0 | Game work RAM access
	BPL $10			  ; 10 10 | Branch if positive
	ORA ($71),Y		  ; 11 71 | Logical OR with accumulator ((zero page),Y)
	BEQ $BD			  ; F0 BD | Branch if equal
	LDA $3070,X		  ; BD 70 30 | Load from absolute,X into accumulator
	INC $0000			; EE 00 00 | Increment (absolute)
	WDM #$00			 ; 42 00 | Reserved instruction
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	ASL $9D			  ; 06 9D | Arithmetic shift left (zero page)
	CPY #$73			 ; C0 73 | Compare Y register (immediate)
	STY $84BB			; 8C BB 84 | Store Y register to absolute address
	ORA $00FF			; 0D FF 00 | Logical OR with accumulator (absolute)
	LDA				  ; BF 40 7F 00 | Load from absolute long,X into accumulator
	SBC $8102,X		  ; FD 02 81 | Subtract with carry (absolute,X)
	CMP ($79,X)		  ; C1 79 | Compare accumulator ((zero page,X))
	SBC $1903,X		  ; FD 03 19 | Subtract with carry (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $98			  ; 06 98 | Arithmetic shift left (zero page)
	BEQ $0F			  ; F0 0F | Branch if equal
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	ORA $1B06,Y		  ; 19 06 1B | Logical OR with accumulator (absolute,Y)
	STX $0880			; 8E 80 08 | Store X register to absolute address
	ROR $6660			; 6E 60 66 | Rotate right (absolute)
	CPX #$78			 ; E0 78 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BRA $7F			  ; 80 7F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_16C
; Address: $F0F83B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_16C:
	STA				  ; 9F E0 1F F8 | Store accumulator to absolute long,X
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ROR $0000,X		  ; 7E 00 00 | Rotate right (absolute,X)
	BRA $FC			  ; 80 FC | Branch always
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_16D
; Address: $F0F866
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_16D:
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	PHP				  ; 08 | Push processor status to stack
	BEQ $3D			  ; F0 3D | Branch if equal
	CPY #$F9			 ; C0 F9 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BRA $00			  ; 80 00 | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC $7F02,X		  ; FD 02 7F | Subtract with carry (absolute,X)
	CMP ($C1,X)		  ; C1 C1 | Compare accumulator ((zero page,X))
	SBC $FD04,X		  ; FD 04 FD | Subtract with carry (absolute,X)
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	SBC $FD02,X		  ; FD 02 FD | Subtract with carry (absolute,X)
	ROL $FC00,X		  ; 3E 00 FC | Rotate left (absolute,X)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CMP ($01,X)		  ; C1 01 | Compare accumulator ((zero page,X))
	INC $FEC1,X		  ; FE C1 FE | Increment (absolute,X)
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPX #$FE			 ; E0 FE | Compare X register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	SEI				  ; 78 | Set interrupt disable flag
	SED				  ; F8 | Set decimal mode flag
	XBA				  ; EB | Exchange accumulator bytes
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SEC				  ; 38 | Set carry flag
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	ROR $7E80,X		  ; 7E 80 7E | Rotate right (absolute,X)
	BRA $7E			  ; 80 7E | Branch always
	BRA $0E			  ; 80 0E | Branch always
	BVS $FF			  ; 70 FF | Branch if overflow set
	BRA $0F			  ; 80 0F | Branch always
	BMI $FF			  ; 30 FF | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	INC $F000,X		  ; FE 00 F0 | Increment (absolute,X)
	BRA $00			  ; 80 00 | Branch always
	BPL $00			  ; 10 00 | Branch if positive
	LDA ($A0,X)		  ; A1 A0 | Load from (zero page,X) into accumulator
	INC $07BE,X		  ; FE BE 07 | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_16E
; Address: $F0F96F
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_16E:
	LSR $FF			  ; 46 FF | Logical shift right (zero page)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	EOR ($00,X)		  ; 41 00 | Exclusive OR with accumulator ((zero page,X))
	SBC $FF00,Y		  ; F9 00 FF | Subtract with carry (absolute,Y)
	CMP $FFD8,Y		  ; D9 D8 FF | Compare accumulator (absolute,Y)
	SBC #$E8			 ; E9 E8 | Subtract with carry (immediate)
	LDX $E09E			; AE 9E E0 | Game work RAM access
	BPL $00			  ; 10 00 | Branch if positive
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	SED				  ; F8 | Set decimal mode flag
	INC $000F,X		  ; FE 0F 00 | Increment (absolute,X)
	BEQ $26			  ; F0 26 | Branch if equal
	SBC ($62),Y		  ; F1 62 | Subtract with carry ((zero page),Y)
	STA ($C0),Y		  ; 91 C0 | Store accumulator to (zero page),Y
	AND ($C1),Y		  ; 31 C1 | Logical AND with accumulator ((zero page),Y)
	BMI $08			  ; 30 08 | Branch if negative
	ASL $6FF1			; 0E F1 6F | Arithmetic shift left (absolute)
	BCC $C0			  ; 90 C0 | Branch if carry clear
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	STA ($6E),Y		  ; 91 6E | Store accumulator to (zero page),Y
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	BMI $CF			  ; 30 CF | Branch if negative
	SEC				  ; 38 | Set carry flag
	CPY $39			  ; C4 39 | Compare Y register (zero page)
	DEC $CF21,X		  ; DE 21 CF | Decrement (absolute,X)
	AND ($33),Y		  ; 31 33 | Logical AND with accumulator ((zero page),Y)
	CPY $FE01			; CC 01 FE | Compare Y register (absolute)
	PEA #$F50A		   ; F4 0A F5 | Push effective address to stack
	REP #$3D			 ; C2 3D | Reset processor status bits
	AND $20C6,Y		  ; 39 C6 20 | Logical AND with accumulator (absolute,Y)
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	CPY $FE33			; CC 33 FE | Compare Y register (absolute)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BMI $CF			  ; 30 CF | Branch if negative
	CPY #$8F			 ; C0 8F | Compare Y register (immediate)
	BVS $4F			  ; 70 4F | Branch if overflow set
	BCS $C0			  ; B0 C0 | Branch if carry set
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	BEQ $07			  ; F0 07 | Branch if equal
	BEQ $30			  ; F0 30 | Branch if equal
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($CF,X)		  ; 01 CF | Logical OR with accumulator ((zero page,X))
	BMI $01			  ; 30 01 | Branch if negative
	INC $CF30,X		  ; FE 30 CF | Increment (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	CMP ($30,X)		  ; C1 30 | Compare accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_16F
; Address: $F0FA3A
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_16F:
	SBC $1A			  ; E5 1A | Subtract with carry (zero page)
	CPX $CF30			; EC 30 CF | Compare X register (absolute)
	STA $00FF,X		  ; 9D FF 00 | Store accumulator to absolute,X
	CPY $FE01			; CC 01 FE | Compare Y register (absolute)
	SBC $00FF,X		  ; FD FF 00 | Subtract with carry (absolute,X)
	STA $0062,X		  ; 9D 62 00 | Store accumulator to absolute,X
	ROR $99			  ; 66 99 | Rotate right (zero page)
	CPY $FE33			; CC 33 FE | Compare Y register (absolute)
	ORA ($F1,X)		  ; 01 F1 | Logical OR with accumulator ((zero page,X))
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	SBC ($0E),Y		  ; F1 0E | Subtract with carry ((zero page),Y)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BCS $C0			  ; B0 C0 | Branch if carry set
	ORA ($F7,X)		  ; 01 F7 | Logical OR with accumulator ((zero page,X))
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $07			  ; F0 07 | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	PEA #$C10B		   ; F4 0B C1 | Push effective address to stack
	ROL $CF30,X		  ; 3E 30 CF | Rotate left (absolute,X)
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	BIT $F3			  ; 24 F3 | Test bits in accumulator (zero page)
	STA ($C0),Y		  ; 91 C0 | Store accumulator to (zero page),Y
	AND ($C1),Y		  ; 31 C1 | Logical AND with accumulator ((zero page),Y)
	BMI $FF			  ; 30 FF | Branch if negative
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_170
; Address: $F0FAB8
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_170:
	JSR $91DF			; 20 DF 91 | Jump to subroutine
	ROR $CE31			; 6E 31 CE | Rotate right (absolute)
	BMI $CF			  ; 30 CF | Branch if negative
	SED				  ; F8 | Set decimal mode flag
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	CPY #$FD			 ; C0 FD | Compare Y register (immediate)
	SBC $21DE,Y		  ; F9 DE 21 | PPU graphics register access
	AND ($33),Y		  ; 31 33 | Logical AND with accumulator ((zero page),Y)
	CPY $FE01			; CC 01 FE | Compare Y register (absolute)
	SED				  ; F8 | Set decimal mode flag
	INC $19			  ; E6 19 | Increment (zero page)
	CMP $3932			; CD 32 39 | Compare accumulator (absolute)
	DEC $20			  ; C6 20 | Decrement (zero page)
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	CPY $FE33			; CC 33 FE | Compare Y register (absolute)
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank60_DmaFunction_171
; Address: $F0FAF9
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_171:
	BCS $C0			  ; B0 C0 | Branch if carry set
	STZ $00FF			; 9C FF 00 | Store zero to absolute
	ORA ($F7,X)		  ; 01 F7 | Logical OR with accumulator ((zero page,X))
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $07			  ; F0 07 | Branch if equal
	BEQ $9C			  ; F0 9C | Branch if equal
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	PHP				  ; 08 | Push processor status to stack
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	BMI $CF			  ; 30 CF | Branch if negative
	BEQ $0F			  ; F0 0F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	ADC ($E1,X)		  ; 61 E1 | Add with carry ((zero page,X))
	EOR ($F1),Y		  ; 51 F1 | Exclusive OR with accumulator ((zero page),Y)
	ROL $F0			  ; 26 F0 | Rotate left (zero page)
	STA ($C0),Y		  ; 91 C0 | Store accumulator to (zero page),Y
	AND ($C1),Y		  ; 31 C1 | Logical AND with accumulator ((zero page),Y)
	BMI $1E			  ; 30 1E | Branch if negative
	BRA $0F			  ; 80 0F | Branch always
	LDY #$66			 ; A0 66 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	DEC $2130			; CE 30 21 | PPU graphics register access
	DEC $6E91,X		  ; DE 91 6E | Decrement (absolute,X)
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	BMI $CF			  ; 30 CF | Branch if negative
	BIT #$09			 ; 89 09 | Test bits in accumulator (immediate)
	CMP $FE01			; CD 01 FE | Compare accumulator (absolute)
	STA $008700		  ; 8F 00 87 00 | Store accumulator to absolute long address
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	INY				  ; C8 | Increment Y register
	ROR $CC80,X		  ; 7E 80 CC | Rotate right (absolute,X)
	INC $FF01,X		  ; FE 01 FF | Increment (absolute,X)
	INC $FFFE,X		  ; FE FE FF | Increment (absolute,X)
	INC $C3FE,X		  ; FE FE C3 | Increment (absolute,X)
	STY $FC			  ; 84 FC | Store Y register to zero page
	SED				  ; F8 | Set decimal mode flag
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $80			  ; 80 80 | Branch always
	ORA ($80,X)		  ; 01 80 | Logical OR with accumulator ((zero page,X))
	ORA ($E0,X)		  ; 01 E0 | Game work RAM access
	CMP $7F00			; CD 00 7F | Compare accumulator (absolute)
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	ORA ($FB,X)		  ; 01 FB | Logical OR with accumulator ((zero page,X))
	SBC $3CC3,X		  ; FD C3 3C | Subtract with carry (absolute,X)
	ROL $FDC3,X		  ; 3E C3 FD | Rotate left (absolute,X)
	SBC $0006,Y		  ; F9 06 00 | Subtract with carry (absolute,Y)
	SEP #$1D			 ; E2 1D | Set processor status bits

;------------------------------------------------------------------------------
; Bank60_DmaFunction_172
; Address: $F0FBC5
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_172:
	BEQ $1F			  ; F0 1F | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	DEY				  ; 88 | Decrement Y register
	BMI $CF			  ; 30 CF | Branch if negative
	STX $00			  ; 86 00 | Store X register to zero page
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SBC $FF02,X		  ; FD 02 FF | Subtract with carry (absolute,X)
	BCC $00			  ; 90 00 | Branch if carry clear
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	INC $000E,X		  ; FE 0E 00 | Increment (absolute,X)
	BEQ $26			  ; F0 26 | Branch if equal
	SBC ($62),Y		  ; F1 62 | Subtract with carry ((zero page),Y)
	STA ($C0),Y		  ; 91 C0 | Store accumulator to (zero page),Y
	AND ($C1),Y		  ; 31 C1 | Logical AND with accumulator ((zero page),Y)
	BMI $0F			  ; 30 0F | Branch if negative
	SBC ($6F),Y		  ; F1 6F | Subtract with carry ((zero page),Y)
	BCC $C0			  ; 90 C0 | Branch if carry clear
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	STA ($6E),Y		  ; 91 6E | Store accumulator to (zero page),Y
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	BMI $CF			  ; 30 CF | Branch if negative
	PEA #$3408		   ; F4 08 34 | Push effective address to stack
	BIT #$38			 ; 89 38 | Test bits in accumulator (immediate)
	CMP ($C5,X)		  ; C1 C5 | Compare accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	INC $C300,X		  ; FE 00 C3 | Increment (absolute,X)
	AND $C43B,X		  ; 3D 3B C4 | Logical AND with accumulator (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	SBC #$F7			 ; E9 F7 | Subtract with carry (immediate)
	SBC $D0F6,Y		  ; F9 F6 D0 | Subtract with carry (absolute,Y)
	LDA $7FC7,Y		  ; B9 C7 7F | Load from absolute,Y into accumulator
	REP #$C6			 ; C2 C6 | Reset processor status bits
	INC $7F01,X		  ; FE 01 7F | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	BEQ $C0			  ; F0 C0 | Branch if equal
	ADC $C000,X		  ; 7D 00 C0 | Add with carry (absolute,X)
	REP #$FF			 ; C2 FF | Reset processor status bits
	INC $C7FF,X		  ; FE FF C7 | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	DEY				  ; 88 | Decrement Y register
	BVC $A7			  ; 50 A7 | Branch if overflow clear
	CPY $67			  ; C4 67 | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register
	AND ($CF,X)		  ; 21 CF | Logical AND with accumulator ((zero page,X))
	BPL $8F			  ; 10 8F | Branch if positive
	BVS $07			  ; 70 07 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank60_DmaFunction_173
; Address: $F0FC8F
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_173:
	BEQ $74			  ; F0 74 | Branch if equal
	PHB				  ; 8B | Push data bank register to stack
	LDX #$5D			 ; A2 5D | Load immediate value into X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank60_DmaFunction_174
; Address: $F0FC9A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_174:
	SED				  ; F8 | Set decimal mode flag
	BEQ $8F			  ; F0 8F | Branch if equal
	BEQ $0F			  ; F0 0F | Branch if equal
	CPY #$31			 ; C0 31 | Compare Y register (immediate)
	SBC ($10,X)		  ; E1 10 | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_175
; Address: $F0FCA4
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_175:
	JSR $C310			; 20 10 C3 | Jump to subroutine
	BEQ $00			  ; F0 00 | Branch if equal
	STA $CE31F0		  ; 8F F0 31 CE | Store accumulator to absolute long address
	BPL $EF			  ; 10 EF | Branch if positive
	BPL $EF			  ; 10 EF | Branch if positive
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank60_DmaFunction_176
; Address: $F0FCBE
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_176:
	BEQ $0F			  ; F0 0F | Branch if equal
	BRA $E3			  ; 80 E3 | Branch always
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	ROR $9801,X		  ; 7E 01 98 | Rotate right (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	DEC $CC01,X		  ; DE 01 CC | Decrement (absolute,X)
	STA $1F7E,X		  ; 9D 7E 1F | Store accumulator to absolute,X
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	INC $F8FF,X		  ; FE FF F8 | Increment (absolute,X)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	STA ($FE,X)		  ; 81 FE | Store accumulator to (zero page,X)
	BRA $7F			  ; 80 7F | Branch always
	STZ $6061,X		  ; 9E 61 60 | Store zero to absolute,X
	SBC ($17),Y		  ; F1 17 | Subtract with carry ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	LDA				  ; BF 40 00 FF | Load from absolute long,X into accumulator
	CPY $DE3F			; CC 3F DE | Compare Y register (absolute)
	INC $6E1F			; EE 1F 6E | Increment (absolute)
	CPY #$BF			 ; C0 BF | Compare Y register (immediate)
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	INC $0101,X		  ; FE 01 01 | Increment (absolute,X)
	INY				  ; C8 | Increment Y register
	ROL $7EC1,X		  ; 3E C1 7E | Rotate left (absolute,X)
	EOR ($C1,X)		  ; 41 C1 | Exclusive OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	INC $3FFF,X		  ; FE FF 3F | Increment (absolute,X)
	INC $BEF9,X		  ; FE F9 BE | Increment (absolute,X)
	BRA $7F			  ; 80 7F | Branch always
	BVS $0F			  ; 70 0F | Branch if overflow set
	CPY #$13			 ; C0 13 | Compare Y register (immediate)
	JMP ($403F)		  ; 6C 3F 40 | Jump to address (absolute indirect)
	CPY $F0FF			; CC FF F0 | Compare Y register (absolute)
	JMP ($4093)		  ; 6C 93 40 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_177
; Address: $F0FD3F
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_177:
	LDA				  ; BF 33 C0 C0 | Load from absolute long,X into accumulator
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	LDX $C101,Y		  ; BE 01 C1 | Load from absolute,Y into X register
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CPY #$C2			 ; C0 C2 | Compare Y register (immediate)
	AND $C0FF,X		  ; 3D FF C0 | Logical AND with accumulator (absolute,X)
	CMP ($FE,X)		  ; C1 FE | Compare accumulator ((zero page,X))
	CPY $EF03			; CC 03 EF | Compare Y register (absolute)
	BPL $01			  ; 10 01 | Branch if positive
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	CPY #$02			 ; C0 02 | Compare Y register (immediate)
	CMP ($0C,X)		  ; C1 0C | Compare accumulator ((zero page,X))
	AND $03C3,X		  ; 3D C3 03 | Logical AND with accumulator (absolute,X)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	REP #$3D			 ; C2 3D | Reset processor status bits
	REP #$3D			 ; C2 3D | Reset processor status bits
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	CPY $80FF			; CC FF 80 | Compare Y register (absolute)
	STA $FF00FF		  ; 8F FF 00 FF | Store accumulator to absolute long address
	BMI $FE			  ; 30 FE | Branch if negative
	ORA ($CC,X)		  ; 01 CC | Logical OR with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	CLD				  ; D8 | Clear decimal mode flag
	ORA $3D32			; 0D 32 3D | Logical OR with accumulator (absolute)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	PLX				  ; FA | Pull X register from stack
	AND ($CE),Y		  ; 31 CE | Logical AND with accumulator ((zero page),Y)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CLC				  ; 18 | Clear carry flag
	BMI $CF			  ; 30 CF | Branch if negative
	CPY $38FF			; CC FF 38 | Compare Y register (absolute)
	BMI $FE			  ; 30 FE | Branch if negative
	ORA ($CC,X)		  ; 01 CC | Logical OR with accumulator ((zero page,X))
	ORA $FDE6,Y		  ; 19 E6 FD | Logical OR with accumulator (absolute,Y)
	LDA $FF00,X		  ; BD 00 FF | Load from absolute,X into accumulator
	STA $8060,X		  ; 9D 60 80 | Store accumulator to absolute,X
	LDA				  ; BF 00 BE 00 | Load from absolute long,X into accumulator
	STZ $9A			  ; 64 9A | Store zero to zero page
	WDM #$00			 ; 42 00 | Reserved instruction
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_178
; Address: $F0FDFD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_178:
	RTI				  ; 40 | Return from interrupt
	EOR ($80,X)		  ; 41 80 | Exclusive OR with accumulator ((zero page,X))
	ADC $8338,X		  ; 7D 38 83 | Add with carry (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_17A
; Address: $F0FE0E
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_17A:
	ORA $41E7,Y		  ; 19 E7 41 | Logical OR with accumulator (absolute,Y)
	LDX $4582,Y		  ; BE 82 45 | Load from absolute,Y into X register
	TYA				  ; 98 | Transfer Y register to accumulator
	STA				  ; 9F 19 E6 32 | Store accumulator to absolute long,X
	CMP $8D72			; CD 72 8D | Compare accumulator (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	SED				  ; F8 | Set decimal mode flag
	ASL $E0			  ; 06 E0 | Game work RAM access
	SED				  ; F8 | Set decimal mode flag
	BRA $70			  ; 80 70 | Branch always
	STA ($60,X)		  ; 81 60 | Store accumulator to (zero page,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $02			  ; 80 02 | Branch always
	SBC $F906,X		  ; FD 06 F9 | Subtract with carry (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	BVS $8F			  ; 70 8F | Branch if overflow set
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank60_DmaFunction_17B
; Address: $F0FE3B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_17B:
	STA				  ; 9F 40 BF 00 | Store accumulator to absolute long,X
	LDY $5801,X		  ; BC 01 58 | Load from absolute,X into Y register
	PHP				  ; 08 | Push processor status to stack
	BPL $8D			  ; 10 8D | Branch if positive
	BMI $0D			  ; 30 0D | Branch if negative
	ORA ($A6,X)		  ; 01 A6 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	BPL $2F			  ; 10 2F | Branch if positive
	BMI $4F			  ; 30 4F | Branch if negative
	STA $0CF3			; 8D F3 0C | Store accumulator to absolute address
	BMI $CE			  ; 30 CE | Branch if negative

;------------------------------------------------------------------------------
; Bank60_DmaFunction_17C
; Address: $F0FE62
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_17C:
	JSR $E0DC			; 20 DC E0 | Game work RAM access
	CLC				  ; 18 | Clear carry flag
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	BRA $61			  ; 80 61 | Branch always
	SBC ($04,X)		  ; E1 04 | Subtract with carry ((zero page,X))
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	BRA $CE			  ; 80 CE | Branch always
	AND ($DC),Y		  ; 31 DC | Logical AND with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	BMI $CF			  ; 30 CF | Branch if negative
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	BRA $7F			  ; 80 7F | Branch always
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	ORA ($FC,X)		  ; 01 FC | Logical OR with accumulator ((zero page,X))
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	PEA #$E003		   ; F4 03 E0 | Game work RAM access
	STA $611E30		  ; 8F 30 1E 61 | Store accumulator to absolute long address
	PHA				  ; 48 | Push accumulator to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	BPL $1C			  ; 10 1C | Branch if positive

;------------------------------------------------------------------------------
; Bank60_DmaFunction_17D
; Address: $F0FEBA
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_17D:
	BMI $4F			  ; 30 4F | Branch if negative
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	BVS $80			  ; 70 80 | Branch if overflow set
	BVS $80			  ; 70 80 | Branch if overflow set
	BRA $09			  ; 80 09 | Branch always
	SBC ($00),Y		  ; F1 00 | Subtract with carry ((zero page),Y)
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BIT #$0F			 ; 89 0F | Test bits in accumulator (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BRA $40			  ; 80 40 | Branch always
	ORA ($C0,X)		  ; 01 C0 | Logical OR with accumulator ((zero page,X))
	REP #$01			 ; C2 01 | Reset processor status bits
	REP #$01			 ; C2 01 | Reset processor status bits
	REP #$01			 ; C2 01 | Reset processor status bits
	RTI				  ; 40 | Return from interrupt
	LDA				  ; BF C0 3F 01 | Load from absolute long,X into accumulator
	INC $FE01,X		  ; FE 01 FE | Increment (absolute,X)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CPY $201C			; CC 1C 20 | Compare Y register (absolute)
	AND $18			  ; 25 18 | Logical AND with accumulator (zero page)
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank60_DmaFunction_17E
; Address: $F0FF30
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_17E:
	JSR $00DF			; 20 DF 00 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ORA ($F8,X)		  ; 01 F8 | Logical OR with accumulator ((zero page,X))
	SBC ($06),Y		  ; F1 06 | Subtract with carry ((zero page),Y)
	SBC ($0E,X)		  ; E1 0E | Subtract with carry ((zero page,X))
	CPY #$1F			 ; C0 1F | Compare Y register (immediate)
	BRA $3F			  ; 80 3F | Branch always
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $1F11			; 0E 11 1F | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_17F
; Address: $F0FF59
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_17F:
	JSR $403F			; 20 3F 40 | Jump to subroutine
	BRA $3F			  ; 80 3F | Branch always
	CPY #$1E			 ; C0 1E | Compare Y register (immediate)
	SBC ($78,X)		  ; E1 78 | Subtract with carry ((zero page,X))
	BEQ $0E			  ; F0 0E | Branch if equal
	BEQ $0C			  ; F0 0C | Branch if equal
	CPY #$3C			 ; C0 3C | Compare Y register (immediate)
	SED				  ; F8 | Set decimal mode flag
	BEQ $01			  ; F0 01 | Branch if equal
	CPX #$E1			 ; E0 E1 | Compare X register (immediate)
	ASL $7887,X		  ; 1E 87 78 | Arithmetic shift left (absolute,X)
	ASL $0CF1			; 0E F1 0C | Arithmetic shift left (absolute)
	SED				  ; F8 | Set decimal mode flag
	BEQ $0F			  ; F0 0F | Branch if equal
	CPX #$1F			 ; E0 1F | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank60_DmaFunction_180
; Address: $F0FF80
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank60_DmaFunction_180:
	PLX				  ; FA | Pull X register from stack
	ORA $CF			  ; 05 CF | Logical OR with accumulator (zero page)
	BMI $FF			  ; 30 FF | Branch if negative
	BIT $01FE			; 2C FE 01 | Test bits in accumulator (absolute)
	BIT $91			  ; 24 91 | Test bits in accumulator (zero page)
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	BMI $00			  ; 30 00 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CMP ($3E,X)		  ; C1 3E | Compare accumulator ((zero page,X))
	LDA				  ; BF 40 3F C0 | Load from absolute long,X into accumulator
	STA				  ; 9F 60 82 81 | Store accumulator to absolute long,X
	CLC				  ; 18 | Clear carry flag
	ROL $F800,X		  ; 3E 00 F8 | Rotate left (absolute,X)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	SED				  ; F8 | Set decimal mode flag
	SBC $F100,Y		  ; F9 00 F1 | Subtract with carry (absolute,Y)
	ASL $00FF			; 0E FF 00 | Arithmetic shift left (absolute)
	BMI $F3			  ; 30 F3 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))
	BPL $F0			  ; 10 F0 | Branch if positive
	STA $FF62,X		  ; 9D 62 FF | Store accumulator to absolute,X
	BRA $00			  ; 80 00 | Branch always
	SED				  ; F8 | Set decimal mode flag
	SEP #$00			 ; E2 00 | Set processor status bits
