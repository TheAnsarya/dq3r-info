;==============================================================================
; Dragon Quest III - Bank $26
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $D30000-$D37FFF
; Instructions: 9711
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_26"

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_001
; Address: $D38009
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_001:
	JSR $0000			; 20 00 00 | Jump to subroutine
	SEI				  ; 78 | Set interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0200			; 0E 00 02 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_004
; Address: $D38080
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_004:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $0D			  ; 90 0D | Branch if carry clear
	LDA				  ; BF F9 7F C9 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	ORA $7F84			; 0D 84 7F | Logical OR with accumulator (absolute)
	STA $7F84			; 8D 84 7F | Update graphics data
	LDA #$20			 ; A9 20 | Read graphics status
	LDX $A97F,Y		  ; BE 7F A9 | Load from absolute,Y into X register
	TSX				  ; BA | Transfer stack pointer to X register
	STZ $7FC0			; 9C C0 7F | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_005
; Address: $D380A3
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_005:
	PHP				  ; 08 | Push processor status to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_007
; Address: $D380AA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_007:
	JSL $C934C2		  ; 22 C2 34 C9 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_008
; Address: $D380B2
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_008:
	LDA $7FBA			; AD BA 7F | Read graphics status
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	STA $7FBA			; 8D BA 7F | Update graphics data
	LDA $7FBC			; AD BC 7F | Read graphics status
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	STA $7FBC			; 8D BC 7F | Update graphics data
	LDA $7FBE			; AD BE 7F | Read graphics status
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	STA $7FBE			; 8D BE 7F | Update graphics data
	LDA $7FD0			; AD D0 7F | Read graphics status
	LDA #$12			 ; A9 12 | Read graphics status
	STA $7FD0			; 8D D0 7F | Update graphics data
	LDA $7FD2			; AD D2 7F | Read graphics status
	LDA #$13			 ; A9 13 | Read graphics status
	STA $7FD2			; 8D D2 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_009
; Address: $D380E3
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_009:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_00A
; Address: $D380E8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_00A:
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$C9			 ; A9 C9 | Read graphics status
	LDX #$15			 ; A2 15 | Load immediate value into X register
	STA ($22,X)		  ; 81 22 | Update graphics data
	CMP #$A9			 ; C9 A9 | Compare accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	LDX #$E1			 ; A2 E1 | Load immediate value into X register
	STA ($22,X)		  ; 81 22 | Update graphics data
	STZ $C983,X		  ; 9E 83 C9 | Store zero to absolute,X
	LDA #$C9			 ; A9 C9 | Read graphics status
	LDX #$11			 ; A2 11 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_00B
; Address: $D38109
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_00B:
	JSL $C983D6		  ; 22 D6 83 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_00C
; Address: $D3811C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_00C:
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_00D
; Address: $D38135
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_00D:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $FF			  ; F0 FF | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $FF			  ; F0 FF | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_00E
; Address: $D38197
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_00E:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	BNE $FF			  ; D0 FF | Branch if not equal
	CPX #$FF			 ; E0 FF | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_00F
; Address: $D381AB
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_00F:
	JSR $0000			; 20 00 00 | Jump to subroutine
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BPL $00			  ; 10 00 | Branch if positive
	BMI $00			  ; 30 00 | Branch if negative
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	BEQ $FF			  ; F0 FF | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $FF			  ; F0 FF | Branch if equal

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_014
; Address: $D3820D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_014:
	JSR $E000			; 20 00 E0 | Game work RAM access
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$C9			 ; A9 C9 | Read graphics status
	LDX #$5B			 ; A2 5B | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_015
; Address: $D3823B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_015:
	JSL $C98315		  ; 22 15 83 C9 | Jump to subroutine long
	LDA #$C9			 ; A9 C9 | Read graphics status
	LDX #$79			 ; A2 79 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_016
; Address: $D38245
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_016:
	JSL $C9839E		  ; 22 9E 83 C9 | Jump to subroutine long
	LDA #$C9			 ; A9 C9 | Read graphics status
	LDX #$E5			 ; A2 E5 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_018
; Address: $D38253
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_018:
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_019
; Address: $D38262
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_019:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	INC $FF			  ; E6 FF | Increment (zero page)
	SEP #$FF			 ; E2 FF | Set processor status bits
	SEP #$FF			 ; E2 FF | Set processor status bits
	INC $FF			  ; E6 FF | Increment (zero page)
	BEQ $FF			  ; F0 FF | Branch if equal
	BEQ $FF			  ; F0 FF | Branch if equal
	CLC				  ; 18 | Clear carry flag
	SEP #$FF			 ; E2 FF | Set processor status bits
	ASL $E300,X		  ; 1E 00 E3 | Arithmetic shift left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $FF			  ; F0 FF | Branch if equal
	INX				  ; E8 | Increment X register
	ASL $FC00,X		  ; 1E 00 FC | Arithmetic shift left (absolute,X)
	INC $FF			  ; E6 FF | Increment (zero page)
	INC				  ; 1A | Increment accumulator
	BEQ $FF			  ; F0 FF | Branch if equal
	BPL $00			  ; 10 00 | Branch if positive
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	ASL $1A00,X		  ; 1E 00 1A | Arithmetic shift left (absolute,X)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	SED				  ; F8 | Set decimal mode flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1000			; 0E 00 10 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_01A
; Address: $D3831C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_01A:
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_01B
; Address: $D38321
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_01B:
	JSL $C97F71		  ; 22 71 7F C9 | Jump to subroutine long
	STA $7A			  ; 85 7A | Update graphics data
	STX $78			  ; 86 78 | Store X register to zero page
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6456			; 8D 56 64 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $645C			; 8D 5C 64 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $645E			; 8D 5E 64 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6458			; 8D 58 64 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6460			; 8D 60 64 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6462			; 8D 62 64 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6464			; 8D 64 64 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6466			; 8D 66 64 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6468			; 8D 68 64 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $646A			; 8D 6A 64 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $646C			; 8D 6C 64 | Update graphics data
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_01C
; Address: $D38378
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_01C:
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $646E			; 8D 6E 64 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6470			; 8D 70 64 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6230			; 8D 30 62 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $63B2			; 8D B2 63 | Update graphics data
	STZ $645A			; 9C 5A 64 | Store zero to absolute
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_01D
; Address: $D3839E
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_01D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7A			  ; 85 7A | Update graphics data
	STX $78			  ; 86 78 | Store X register to zero page
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6252,X		  ; 9D 52 62 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6272,X		  ; 9D 72 62 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6292,X		  ; 9D 92 62 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $6230			; EC 30 62 | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_01E
; Address: $D383CC
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_01E:
	BCC $E4			  ; 90 E4 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_01F
; Address: $D383D6
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_01F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7A			  ; 85 7A | Update graphics data
	STX $78			  ; 86 78 | Store X register to zero page
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $63D6,X		  ; 9D D6 63 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $63F6,X		  ; 9D F6 63 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6416,X		  ; 9D 16 64 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $63B2			; EC B2 63 | Compare X register (absolute)
	BCC $E4			  ; 90 E4 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_020
; Address: $D3840E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_020:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_021
; Address: $D38418
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_021:
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7A			  ; 85 7A | Update graphics data
	STX $78			  ; 86 78 | Store X register to zero page
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6352,X		  ; 9D 52 63 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6372,X		  ; 9D 72 63 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	STA $6392,X		  ; 9D 92 63 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $6230			; EC 30 62 | Compare X register (absolute)
	BCC $E4			  ; 90 E4 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_022
; Address: $D38446
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_022:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $6460			; AE 60 64 | Load from absolute address into X register
	LDA				  ; BF 1E 00 C9 | Read graphics status
	STA $6472			; 8D 72 64 | Update graphics data
	LDA				  ; BF 9E 00 C9 | Read graphics status
	STA $6478			; 8D 78 64 | Update graphics data
	LDX $6466			; AE 66 64 | Load from absolute address into X register
	LDA				  ; BF 1E 00 C9 | Read graphics status
	STA $6474			; 8D 74 64 | Update graphics data
	LDA				  ; BF 9E 00 C9 | Read graphics status
	STA $647A			; 8D 7A 64 | Update graphics data
	LDX $646C			; AE 6C 64 | Load from absolute address into X register
	LDA				  ; BF 1E 00 C9 | Read graphics status
	STA $6476			; 8D 76 64 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_023
; Address: $D3847E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_023:
	LDA				  ; BF 9E 00 C9 | Read graphics status
	STA $647C			; 8D 7C 64 | Update graphics data
	LDY $63B4			; AC B4 63 | Load from absolute address into Y register
	LDX $63D6,Y		  ; BE D6 63 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_024
; Address: $D3848B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_024:
	JSR $84AB			; 20 AB 84 | Jump to subroutine
	LDY $63B4			; AC B4 63 | Load from absolute address into Y register
	LDX $63F6,Y		  ; BE F6 63 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_025
; Address: $D38494
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_025:
	JSR $84AB			; 20 AB 84 | Jump to subroutine
	LDY $63B4			; AC B4 63 | Load from absolute address into Y register
	LDX $6416,Y		  ; BE 16 64 | Load from absolute,Y into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_027
; Address: $D384A0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_027:
	JSR $868D			; 20 8D 86 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_028
; Address: $D384AB
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_028:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	PHX				  ; DA | Push X register to stack
	PHB				  ; 8B | Push data bank register to stack
	LDA $6456			; AD 56 64 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	SEP #$20			 ; E2 20 | Set processor status bits
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	LDA				  ; BF 52 62 7E | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDA $2135			; AD 35 21 | PPU graphics register access
	STA				  ; 9F B2 62 7E | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	LDA				  ; BF 72 62 7E | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDA $2135			; AD 35 21 | PPU graphics register access
	STA				  ; 9F D2 62 7E | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_029
; Address: $D384ED
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_029:
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	LDA				  ; BF 92 62 7E | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDA $2135			; AD 35 21 | PPU graphics register access
	STA				  ; 9F F2 62 7E | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLB				  ; AB | Pull data bank register from stack
	PLY				  ; 7A | Pull Y register from stack
	LDA $62B2,Y		  ; B9 B2 62 | Read graphics status
	STA $70			  ; 85 70 | Update graphics data
	LDA $62F2,Y		  ; B9 F2 62 | Read graphics status
	STA $74			  ; 85 74 | Update graphics data
	PHY				  ; 5A | Push Y register to stack
	LDA $647A			; AD 7A 64 | Read graphics status
	STA $7A			  ; 85 7A | Update graphics data
	LDA $6474			; AD 74 64 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PHB				  ; 8B | Push data bank register to stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $74			  ; A5 74 | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDY $2135			; AC 35 21 | PPU graphics register access
	STY $76			  ; 84 76 | Store Y register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	STA $211B			; 8D 1B 21 | PPU graphics register access
	LDA $70			  ; A5 70 | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDY $2135			; AC 35 21 | PPU graphics register access
	STY $78			  ; 84 78 | Store Y register to zero page
	LDX $7A			  ; A6 7A | Load from zero page into X register
	TXA				  ; 8A | Transfer X register to accumulator
	STA $211B			; 8D 1B 21 | PPU graphics register access
	LDA $7B			  ; A5 7B | Read graphics status
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $70			  ; A5 70 | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDY $2135			; AC 35 21 | PPU graphics register access
	STY $7A			  ; 84 7A | Store Y register to zero page
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_02A
; Address: $D3855A
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_02A:
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	STA $211B			; 8D 1B 21 | PPU graphics register access
	LDA $74			  ; A5 74 | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDY $2135			; AC 35 21 | PPU graphics register access
	STY $7C			  ; 84 7C | Store Y register to zero page
	PLB				  ; AB | Pull data bank register from stack
	PLY				  ; 7A | Pull Y register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $7A			  ; A5 7A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $76			  ; E5 76 | Subtract with carry (zero page)
	STA $62B2,Y		  ; 99 B2 62 | Update graphics data
	LDA $7C			  ; A5 7C | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $78			  ; 65 78 | Add with carry (zero page)
	STA $62F2,Y		  ; 99 F2 62 | Update graphics data
	LDA $62D2,Y		  ; B9 D2 62 | Read graphics status
	STA $72			  ; 85 72 | Update graphics data
	LDA $62F2,Y		  ; B9 F2 62 | Read graphics status
	STA $74			  ; 85 74 | Update graphics data
	PHY				  ; 5A | Push Y register to stack
	LDA $6478			; AD 78 64 | Read graphics status
	STA $7A			  ; 85 7A | Update graphics data
	LDA $6472			; AD 72 64 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PHB				  ; 8B | Push data bank register to stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $74			  ; A5 74 | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDY $2135			; AC 35 21 | PPU graphics register access
	STY $76			  ; 84 76 | Store Y register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	STA $211B			; 8D 1B 21 | PPU graphics register access
	LDA $72			  ; A5 72 | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDY $2135			; AC 35 21 | PPU graphics register access
	STY $78			  ; 84 78 | Store Y register to zero page
	LDX $7A			  ; A6 7A | Load from zero page into X register
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_02B
; Address: $D385C2
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_02B:
	STA $211B			; 8D 1B 21 | PPU graphics register access
	LDA $7B			  ; A5 7B | Read graphics status
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $72			  ; A5 72 | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDY $2135			; AC 35 21 | PPU graphics register access
	STY $7A			  ; 84 7A | Store Y register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	STA $211B			; 8D 1B 21 | PPU graphics register access
	LDA $74			  ; A5 74 | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDY $2135			; AC 35 21 | PPU graphics register access
	STY $7C			  ; 84 7C | Store Y register to zero page
	PLB				  ; AB | Pull data bank register from stack
	PLY				  ; 7A | Pull Y register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $7A			  ; A5 7A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $76			  ; 65 76 | Add with carry (zero page)
	STA $62D2,Y		  ; 99 D2 62 | Update graphics data
	LDA $78			  ; A5 78 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $7C			  ; E5 7C | Subtract with carry (zero page)
	STA $62F2,Y		  ; 99 F2 62 | Update graphics data
	LDA $62B2,Y		  ; B9 B2 62 | Read graphics status
	STA $70			  ; 85 70 | Update graphics data
	LDA $62D2,Y		  ; B9 D2 62 | Read graphics status
	STA $72			  ; 85 72 | Update graphics data
	PHY				  ; 5A | Push Y register to stack
	LDA $647C			; AD 7C 64 | Read graphics status
	STA $7A			  ; 85 7A | Update graphics data
	LDA $6476			; AD 76 64 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PHB				  ; 8B | Push data bank register to stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $72			  ; A5 72 | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDY $2135			; AC 35 21 | PPU graphics register access
	STY $76			  ; 84 76 | Store Y register to zero page
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_02C
; Address: $D3862A
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_02C:
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	STA $211B			; 8D 1B 21 | PPU graphics register access
	LDA $70			  ; A5 70 | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDY $2135			; AC 35 21 | PPU graphics register access
	STY $78			  ; 84 78 | Store Y register to zero page
	LDX $7A			  ; A6 7A | Load from zero page into X register
	TXA				  ; 8A | Transfer X register to accumulator
	STA $211B			; 8D 1B 21 | PPU graphics register access
	LDA $7B			  ; A5 7B | Read graphics status
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	LDA $70			  ; A5 70 | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDY $2135			; AC 35 21 | PPU graphics register access
	STY $7A			  ; 84 7A | Store Y register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	STA $211B			; 8D 1B 21 | PPU graphics register access
	LDA $72			  ; A5 72 | Read graphics status
	STA $211C			; 8D 1C 21 | PPU graphics register access
	LDY $2135			; AC 35 21 | PPU graphics register access
	STY $7C			  ; 84 7C | Store Y register to zero page
	PLB				  ; AB | Pull data bank register from stack
	PLY				  ; 7A | Pull Y register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $7A			  ; A5 7A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $76			  ; 65 76 | Add with carry (zero page)
	STA $62B2,Y		  ; 99 B2 62 | Update graphics data
	LDA $78			  ; A5 78 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $7C			  ; E5 7C | Subtract with carry (zero page)
	STA $62D2,Y		  ; 99 D2 62 | Update graphics data
	LDA $62B2,Y		  ; B9 B2 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $33DA			; 6D DA 33 | Add with carry (absolute)
	STA $6312,Y		  ; 99 12 63 | Update graphics data
	LDA $62D2,Y		  ; B9 D2 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $33DC			; 6D DC 33 | Add with carry (absolute)
	STA $6332,Y		  ; 99 32 63 | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_02D
; Address: $D3868D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_02D:
	LDY $63B4			; AC B4 63 | Load from absolute address into Y register
	LDX $63D6,Y		  ; BE D6 63 | Load from absolute,Y into X register
	LDA $6312,X		  ; BD 12 63 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_02E
; Address: $D38697
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_02E:
	STA $33E2			; 8D E2 33 | Update graphics data
	LDA $6332,X		  ; BD 32 63 | Read graphics status
	STA $33E4			; 8D E4 33 | Update graphics data
	PHA				  ; 48 | Push accumulator to stack
	LDX $63F6,Y		  ; BE F6 63 | Load from absolute,Y into X register
	LDA $6312,X		  ; BD 12 63 | Read graphics status
	STA $33E6			; 8D E6 33 | Update graphics data
	LDA $6332,X		  ; BD 32 63 | Read graphics status
	STA $33E8			; 8D E8 33 | Update graphics data
	LDX $6416,Y		  ; BE 16 64 | Load from absolute,Y into X register
	LDA $6312,X		  ; BD 12 63 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $6332,X		  ; BD 32 63 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_02F
; Address: $D386BB
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_02F:
	JSL $C986F0		  ; 22 F0 86 C9 | Jump to subroutine long
	LDA $33E6			; AD E6 33 | Read graphics status
	STA $33E2			; 8D E2 33 | Update graphics data
	LDA $33E8			; AD E8 33 | Read graphics status
	STA $33E4			; 8D E4 33 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $33E8			; 8D E8 33 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $33E6			; 8D E6 33 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_030
; Address: $D386D3
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_030:
	JSL $C986F0		  ; 22 F0 86 C9 | Jump to subroutine long
	LDA $33E6			; AD E6 33 | Read graphics status
	STA $33E2			; 8D E2 33 | Update graphics data
	LDA $33E8			; AD E8 33 | Read graphics status
	STA $33E4			; 8D E4 33 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $33E8			; 8D E8 33 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $33E6			; 8D E6 33 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_032
; Address: $D386F0
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_032:
	STZ $74			  ; 64 74 | Store zero to zero page
	STZ $76			  ; 64 76 | Store zero to zero page
	LDA $33E6			; AD E6 33 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $33E2			; ED E2 33 | Subtract with carry (absolute)
	BPL $06			  ; 10 06 | Branch if positive
	DEC $74			  ; C6 74 | Decrement (zero page)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $70			  ; 85 70 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $78			  ; 85 78 | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $7C			  ; 85 7C | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_033
; Address: $D3870F
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_033:
	LDA $33E8			; AD E8 33 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $33E4			; ED E4 33 | Subtract with carry (absolute)
	BPL $06			  ; 10 06 | Branch if positive
	DEC $76			  ; C6 76 | Decrement (zero page)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $72			  ; 85 72 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $7A			  ; 85 7A | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $7E			  ; 85 7E | Update graphics data
	LDX $33E2			; AE E2 33 | Load from absolute address into X register
	LDA $33E4			; AD E4 33 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	INC $70			  ; E6 70 | Increment (zero page)
	INC $72			  ; E6 72 | Increment (zero page)
	LDA $70			  ; A5 70 | Read graphics status
	CMP $72			  ; C5 72 | Compare accumulator (zero page)
	BCS $69			  ; B0 69 | Branch if carry set
	LDA $76			  ; A5 76 | Read graphics status
	BMI $32			  ; 30 32 | Branch if negative
	LDA $74			  ; A5 74 | Read graphics status
	BMI $17			  ; 30 17 | Branch if negative
	LDA $7E			  ; A5 7E | Read graphics status
	DEC $72			  ; C6 72 | Decrement (zero page)
	BMI $5A			  ; 30 5A | Branch if negative

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_034
; Address: $D3874A
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_034:
	JSR $880E			; 20 0E 88 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	ADC $78			  ; 65 78 | Add with carry (zero page)
	BMI $F2			  ; 30 F2 | Branch if negative
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	SBC $7A			  ; E5 7A | Subtract with carry (zero page)
	JMP $8746			; 4C 46 87 | Jump to address
	LDA $7E			  ; A5 7E | Read graphics status
	DEC $72			  ; C6 72 | Decrement (zero page)
	BMI $43			  ; 30 43 | Branch if negative

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_035
; Address: $D38761
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_035:
	JSR $880E			; 20 0E 88 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	ADC $78			  ; 65 78 | Add with carry (zero page)
	BMI $F2			  ; 30 F2 | Branch if negative
	DEX				  ; CA | Decrement X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_036
; Address: $D3876C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_036:
	SEC				  ; 38 | Set carry flag
	SBC $7A			  ; E5 7A | Subtract with carry (zero page)
	JMP $875D			; 4C 5D 87 | Jump to address
	LDA $74			  ; A5 74 | Read graphics status
	BMI $17			  ; 30 17 | Branch if negative
	LDA $7E			  ; A5 7E | Read graphics status
	DEC $72			  ; C6 72 | Decrement (zero page)
	BMI $28			  ; 30 28 | Branch if negative

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_037
; Address: $D3877C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_037:
	JSR $880E			; 20 0E 88 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag
	ADC $78			  ; 65 78 | Add with carry (zero page)
	BMI $F2			  ; 30 F2 | Branch if negative
	INX				  ; E8 | Increment X register
	SEC				  ; 38 | Set carry flag
	SBC $7A			  ; E5 7A | Subtract with carry (zero page)
	JMP $8778			; 4C 78 87 | Jump to address
	LDA $7E			  ; A5 7E | Read graphics status
	DEC $72			  ; C6 72 | Decrement (zero page)
	BMI $11			  ; 30 11 | Branch if negative

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_038
; Address: $D38793
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_038:
	JSR $880E			; 20 0E 88 | Jump to subroutine
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	CLC				  ; 18 | Clear carry flag
	ADC $78			  ; 65 78 | Add with carry (zero page)
	BMI $F2			  ; 30 F2 | Branch if negative
	DEX				  ; CA | Decrement X register
	SEC				  ; 38 | Set carry flag
	SBC $7A			  ; E5 7A | Subtract with carry (zero page)
	JMP $878F			; 4C 8F 87 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_039
; Address: $D387A5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_039:
	LDA $74			  ; A5 74 | Read graphics status
	BMI $32			  ; 30 32 | Branch if negative
	LDA $76			  ; A5 76 | Read graphics status
	BMI $17			  ; 30 17 | Branch if negative
	LDA $7C			  ; A5 7C | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_03A
; Address: $D387AF
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_03A:
	JSR $880E			; 20 0E 88 | Jump to subroutine
	DEC $70			  ; C6 70 | Decrement (zero page)
	BMI $57			  ; 30 57 | Branch if negative
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	ADC $7A			  ; 65 7A | Add with carry (zero page)
	BMI $F6			  ; 30 F6 | Branch if negative
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	SBC $78			  ; E5 78 | Subtract with carry (zero page)
	JMP $87AF			; 4C AF 87 | Jump to address
	LDA $7C			  ; A5 7C | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_03B
; Address: $D387C6
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_03B:
	JSR $880E			; 20 0E 88 | Jump to subroutine
	DEC $70			  ; C6 70 | Decrement (zero page)
	BMI $40			  ; 30 40 | Branch if negative
	INX				  ; E8 | Increment X register
	CLC				  ; 18 | Clear carry flag
	ADC $7A			  ; 65 7A | Add with carry (zero page)
	BMI $F6			  ; 30 F6 | Branch if negative
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	SEC				  ; 38 | Set carry flag
	SBC $78			  ; E5 78 | Subtract with carry (zero page)
	JMP $87C6			; 4C C6 87 | Jump to address
	LDA $76			  ; A5 76 | Read graphics status
	BMI $17			  ; 30 17 | Branch if negative
	LDA $7C			  ; A5 7C | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_03C
; Address: $D387E1
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_03C:
	JSR $880E			; 20 0E 88 | Jump to subroutine
	DEC $70			  ; C6 70 | Decrement (zero page)
	BMI $25			  ; 30 25 | Branch if negative
	DEX				  ; CA | Decrement X register
	CLC				  ; 18 | Clear carry flag
	ADC $7A			  ; 65 7A | Add with carry (zero page)
	BMI $F6			  ; 30 F6 | Branch if negative
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	SBC $78			  ; E5 78 | Subtract with carry (zero page)
	JMP $87E1			; 4C E1 87 | Jump to address
	LDA $7C			  ; A5 7C | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_03D
; Address: $D387F8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_03D:
	JSR $880E			; 20 0E 88 | Jump to subroutine
	DEC $70			  ; C6 70 | Decrement (zero page)
	BMI $0E			  ; 30 0E | Branch if negative
	DEX				  ; CA | Decrement X register
	CLC				  ; 18 | Clear carry flag
	ADC $7A			  ; 65 7A | Add with carry (zero page)
	BMI $F6			  ; 30 F6 | Branch if negative
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	SEC				  ; 38 | Set carry flag
	SBC $78			  ; E5 78 | Subtract with carry (zero page)
	JMP $87F8			; 4C F8 87 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_03E
; Address: $D3880E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_03E:
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	TXA				  ; 8A | Transfer X register to accumulator
	BPL $06			  ; 10 06 | Branch if positive
	LDA #$00			 ; A9 00 | Read graphics status
	JMP $8825			; 4C 25 88 | Jump to address
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_03F
; Address: $D38822
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_03F:
	LDA #$FF			 ; A9 FF | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	CMP $F5D6,Y		  ; D9 D6 F5 | Compare accumulator (absolute,Y)
	BCC $03			  ; 90 03 | Branch if carry clear
	STA $F5D6,Y		  ; 99 D6 F5 | Update graphics data
	CMP $F5D5,Y		  ; D9 D5 F5 | Compare accumulator (absolute,Y)
	BCS $03			  ; B0 03 | Branch if carry set
	STA $F5D5,Y		  ; 99 D5 F5 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_040
; Address: $D3883B
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_040:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $63B4			; AD B4 63 | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $63B4			; 8D B4 63 | Update graphics data
	CMP $63B2			; CD B2 63 | Compare accumulator (absolute)
	BCC $03			  ; 90 03 | Branch if carry clear
	STZ $63B4			; 9C B4 63 | Store zero to absolute
	LDA $6456			; AD 56 64 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $645C			; 6D 5C 64 | Add with carry (absolute)
	CMP $6458			; CD 58 64 | Compare accumulator (absolute)
	BCS $06			  ; B0 06 | Branch if carry set
	STA $6456			; 8D 56 64 | Update graphics data
	JMP $886F			; 4C 6F 88 | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	STA $645A			; 8D 5A 64 | Update graphics data
	LDA $645C			; AD 5C 64 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $645E			; 6D 5E 64 | Add with carry (absolute)
	STA $645C			; 8D 5C 64 | Update graphics data
	LDA $6460			; AD 60 64 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6462			; 6D 62 64 | Add with carry (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_041
; Address: $D38885
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_041:
	STZ $AD			  ; 64 AD | Store zero to zero page
	STZ $18			  ; 64 18 | Store zero to zero page
	ADC $6464			; 6D 64 64 | Add with carry (absolute)
	STA $6462			; 8D 62 64 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_042
; Address: $D38890
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_042:
	LDA $6466			; AD 66 64 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6468			; 6D 68 64 | Add with carry (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	ROR $64			  ; 66 64 | Rotate right (zero page)
	LDA $6468			; AD 68 64 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $646A			; 6D 6A 64 | Add with carry (absolute)
	STA $6468			; 8D 68 64 | Update graphics data
	LDA $646C			; AD 6C 64 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $646E			; 6D 6E 64 | Add with carry (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	JMP ($AD64)		  ; 6C 64 AD | Jump to address (absolute indirect)
	ROR $1864			; 6E 64 18 | Rotate right (absolute)
	ADC $6470			; 6D 70 64 | Add with carry (absolute)
	STA $646E			; 8D 6E 64 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_043
; Address: $D388BE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_043:
	JSR $88C9			; 20 C9 88 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_044
; Address: $D388C9
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_044:
	LDX $6230			; AE 30 62 | Load from absolute address into X register
	DEY				  ; 88 | Decrement Y register
	CMP ($8C),Y		  ; D1 8C | Compare accumulator ((zero page),Y)
	STY $8C95			; 8C 95 8C | Store Y register to absolute address
	STY $8C59			; 8C 59 8C | Store Y register to absolute address
	STY $8C1D			; 8C 1D 8C | Store Y register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	SBC ($8B,X)		  ; E1 8B | Subtract with carry ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack
	LDA $8B			  ; A5 8B | Read graphics status
	PHB				  ; 8B | Push data bank register to stack
	ADC #$8B			 ; 69 8B | Add with carry (immediate)
	PHB				  ; 8B | Push data bank register to stack
	AND $0F8B			; 2D 8B 0F | Logical AND with accumulator (absolute)
	PHB				  ; 8B | Push data bank register to stack
	SBC ($8A),Y		  ; F1 8A | Subtract with carry ((zero page),Y)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	ADC $5B8A,Y		  ; 79 8A 5B | Add with carry (absolute,Y)
	TXA				  ; 8A | Transfer X register to accumulator
	AND $1F8A,X		  ; 3D 8A 1F | Logical AND with accumulator (absolute,X)
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_045
; Address: $D388FF
; Size: 120 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_045:
	ORA ($8A,X)		  ; 01 8A | Logical OR with accumulator ((zero page,X))
	BIT #$C5			 ; 89 C5 | Test bits in accumulator (immediate)
	BIT #$A7			 ; 89 A7 | Test bits in accumulator (immediate)
	BIT #$89			 ; 89 89 | Test bits in accumulator (immediate)
	BIT #$6B			 ; 89 6B | Test bits in accumulator (immediate)
	BIT #$4D			 ; 89 4D | Test bits in accumulator (immediate)
	BIT #$2F			 ; 89 2F | Test bits in accumulator (immediate)
	BIT #$11			 ; 89 11 | Test bits in accumulator (immediate)
	BIT #$AD			 ; 89 AD | Test bits in accumulator (immediate)
	BCC $62			  ; 90 62 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	ADC $6390			; 6D 90 63 | Add with carry (absolute)
	STA $6290			; 8D 90 62 | Update graphics data
	LDA $62B0			; AD B0 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63B0			; 6D B0 63 | Add with carry (absolute)
	STA $62B0			; 8D B0 62 | Update graphics data
	LDA $62D0			; AD D0 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63D0			; 6D D0 63 | Add with carry (absolute)
	STA $62D0			; 8D D0 62 | Update graphics data
	LDA $628E			; AD 8E 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $638E			; 6D 8E 63 | Add with carry (absolute)
	STA $628E			; 8D 8E 62 | Update graphics data
	LDA $62AE			; AD AE 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63AE			; 6D AE 63 | Add with carry (absolute)
	STA $62AE			; 8D AE 62 | Update graphics data
	LDA $62CE			; AD CE 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63CE			; 6D CE 63 | Add with carry (absolute)
	STA $62CE			; 8D CE 62 | Update graphics data
	LDA $628C			; AD 8C 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $638C			; 6D 8C 63 | Add with carry (absolute)
	STA $628C			; 8D 8C 62 | Update graphics data
	LDA $62AC			; AD AC 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63AC			; 6D AC 63 | Add with carry (absolute)
	STA $62AC			; 8D AC 62 | Update graphics data
	LDA $62CC			; AD CC 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63CC			; 6D CC 63 | Add with carry (absolute)
	STA $62CC			; 8D CC 62 | Update graphics data
	LDA $628A			; AD 8A 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $638A			; 6D 8A 63 | Add with carry (absolute)
	STA $628A			; 8D 8A 62 | Update graphics data
	LDA $62AA			; AD AA 62 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_046
; Address: $D38978
; Size: 124 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_046:
	CLC				  ; 18 | Clear carry flag
	ADC $63AA			; 6D AA 63 | Add with carry (absolute)
	STA $62AA			; 8D AA 62 | Update graphics data
	LDA $62CA			; AD CA 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63CA			; 6D CA 63 | Add with carry (absolute)
	STA $62CA			; 8D CA 62 | Update graphics data
	LDA $6288			; AD 88 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6388			; 6D 88 63 | Add with carry (absolute)
	STA $6288			; 8D 88 62 | Update graphics data
	LDA $62A8			; AD A8 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63A8			; 6D A8 63 | Add with carry (absolute)
	STA $62A8			; 8D A8 62 | Update graphics data
	LDA $62C8			; AD C8 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63C8			; 6D C8 63 | Add with carry (absolute)
	STA $62C8			; 8D C8 62 | Update graphics data
	LDA $6286			; AD 86 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6386			; 6D 86 63 | Add with carry (absolute)
	STA $6286			; 8D 86 62 | Update graphics data
	LDA $62A6			; AD A6 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63A6			; 6D A6 63 | Add with carry (absolute)
	STA $62A6			; 8D A6 62 | Update graphics data
	LDA $62C6			; AD C6 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63C6			; 6D C6 63 | Add with carry (absolute)
	STA $62C6			; 8D C6 62 | Update graphics data
	LDA $6284			; AD 84 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6384			; 6D 84 63 | Add with carry (absolute)
	STA $6284			; 8D 84 62 | Update graphics data
	LDA $62A4			; AD A4 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63A4			; 6D A4 63 | Add with carry (absolute)
	STA $62A4			; 8D A4 62 | Update graphics data
	LDA $62C4			; AD C4 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63C4			; 6D C4 63 | Add with carry (absolute)
	STA $62C4			; 8D C4 62 | Update graphics data
	LDA $6282			; AD 82 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6382			; 6D 82 63 | Add with carry (absolute)
	STA $6282			; 8D 82 62 | Update graphics data
	LDA $62A2			; AD A2 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63A2			; 6D A2 63 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_047
; Address: $D389F4
; Size: 126 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_047:
	STA $62A2			; 8D A2 62 | Update graphics data
	LDA $62C2			; AD C2 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63C2			; 6D C2 63 | Add with carry (absolute)
	STA $62C2			; 8D C2 62 | Update graphics data
	LDA $6280			; AD 80 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6380			; 6D 80 63 | Add with carry (absolute)
	STA $6280			; 8D 80 62 | Update graphics data
	LDA $62A0			; AD A0 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63A0			; 6D A0 63 | Add with carry (absolute)
	STA $62A0			; 8D A0 62 | Update graphics data
	LDA $62C0			; AD C0 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63C0			; 6D C0 63 | Add with carry (absolute)
	STA $62C0			; 8D C0 62 | Update graphics data
	LDA $627E			; AD 7E 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $637E			; 6D 7E 63 | Add with carry (absolute)
	STA $627E			; 8D 7E 62 | Update graphics data
	LDA $629E			; AD 9E 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $639E			; 6D 9E 63 | Add with carry (absolute)
	STA $629E			; 8D 9E 62 | Update graphics data
	LDA $62BE			; AD BE 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63BE			; 6D BE 63 | Add with carry (absolute)
	STA $62BE			; 8D BE 62 | Update graphics data
	LDA $627C			; AD 7C 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $637C			; 6D 7C 63 | Add with carry (absolute)
	STA $627C			; 8D 7C 62 | Update graphics data
	LDA $629C			; AD 9C 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $639C			; 6D 9C 63 | Add with carry (absolute)
	STA $629C			; 8D 9C 62 | Update graphics data
	LDA $62BC			; AD BC 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63BC			; 6D BC 63 | Add with carry (absolute)
	STA $62BC			; 8D BC 62 | Update graphics data
	LDA $627A			; AD 7A 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $637A			; 6D 7A 63 | Add with carry (absolute)
	STA $627A			; 8D 7A 62 | Update graphics data
	LDA $629A			; AD 9A 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $639A			; 6D 9A 63 | Add with carry (absolute)
	STA $629A			; 8D 9A 62 | Update graphics data
	LDA $62BA			; AD BA 62 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_048
; Address: $D38A72
; Size: 124 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_048:
	CLC				  ; 18 | Clear carry flag
	ADC $63BA			; 6D BA 63 | Add with carry (absolute)
	STA $62BA			; 8D BA 62 | Update graphics data
	LDA $6278			; AD 78 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6378			; 6D 78 63 | Add with carry (absolute)
	STA $6278			; 8D 78 62 | Update graphics data
	LDA $6298			; AD 98 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6398			; 6D 98 63 | Add with carry (absolute)
	STA $6298			; 8D 98 62 | Update graphics data
	LDA $62B8			; AD B8 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63B8			; 6D B8 63 | Add with carry (absolute)
	STA $62B8			; 8D B8 62 | Update graphics data
	LDA $6276			; AD 76 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6376			; 6D 76 63 | Add with carry (absolute)
	STA $6276			; 8D 76 62 | Update graphics data
	LDA $6296			; AD 96 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6396			; 6D 96 63 | Add with carry (absolute)
	STA $6296			; 8D 96 62 | Update graphics data
	LDA $62B6			; AD B6 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63B6			; 6D B6 63 | Add with carry (absolute)
	STA $62B6			; 8D B6 62 | Update graphics data
	LDA $6274			; AD 74 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6374			; 6D 74 63 | Add with carry (absolute)
	STA $6274			; 8D 74 62 | Update graphics data
	LDA $6294			; AD 94 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6394			; 6D 94 63 | Add with carry (absolute)
	STA $6294			; 8D 94 62 | Update graphics data
	LDA $62B4			; AD B4 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63B4			; 6D B4 63 | Add with carry (absolute)
	STA $62B4			; 8D B4 62 | Update graphics data
	LDA $6272			; AD 72 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6372			; 6D 72 63 | Add with carry (absolute)
	STA $6272			; 8D 72 62 | Update graphics data
	LDA $6292			; AD 92 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6392			; 6D 92 63 | Add with carry (absolute)
	STA $6292			; 8D 92 62 | Update graphics data
	LDA $62B2			; AD B2 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63B2			; 6D B2 63 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_049
; Address: $D38AEE
; Size: 126 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_049:
	STA $62B2			; 8D B2 62 | Update graphics data
	LDA $6270			; AD 70 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6370			; 6D 70 63 | Add with carry (absolute)
	STA $6270			; 8D 70 62 | Update graphics data
	LDA $6290			; AD 90 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6390			; 6D 90 63 | Add with carry (absolute)
	STA $6290			; 8D 90 62 | Update graphics data
	LDA $62B0			; AD B0 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63B0			; 6D B0 63 | Add with carry (absolute)
	STA $62B0			; 8D B0 62 | Update graphics data
	LDA $626E			; AD 6E 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $636E			; 6D 6E 63 | Add with carry (absolute)
	STA $626E			; 8D 6E 62 | Update graphics data
	LDA $628E			; AD 8E 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $638E			; 6D 8E 63 | Add with carry (absolute)
	STA $628E			; 8D 8E 62 | Update graphics data
	LDA $62AE			; AD AE 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63AE			; 6D AE 63 | Add with carry (absolute)
	STA $62AE			; 8D AE 62 | Update graphics data
	LDA $626C			; AD 6C 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $636C			; 6D 6C 63 | Add with carry (absolute)
	STA $626C			; 8D 6C 62 | Update graphics data
	LDA $628C			; AD 8C 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $638C			; 6D 8C 63 | Add with carry (absolute)
	STA $628C			; 8D 8C 62 | Update graphics data
	LDA $62AC			; AD AC 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63AC			; 6D AC 63 | Add with carry (absolute)
	STA $62AC			; 8D AC 62 | Update graphics data
	LDA $626A			; AD 6A 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $636A			; 6D 6A 63 | Add with carry (absolute)
	STA $626A			; 8D 6A 62 | Update graphics data
	LDA $628A			; AD 8A 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $638A			; 6D 8A 63 | Add with carry (absolute)
	STA $628A			; 8D 8A 62 | Update graphics data
	LDA $62AA			; AD AA 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63AA			; 6D AA 63 | Add with carry (absolute)
	STA $62AA			; 8D AA 62 | Update graphics data
	LDA $6268			; AD 68 62 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_04A
; Address: $D38B6C
; Size: 124 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_04A:
	CLC				  ; 18 | Clear carry flag
	ADC $6368			; 6D 68 63 | Add with carry (absolute)
	STA $6268			; 8D 68 62 | Update graphics data
	LDA $6288			; AD 88 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6388			; 6D 88 63 | Add with carry (absolute)
	STA $6288			; 8D 88 62 | Update graphics data
	LDA $62A8			; AD A8 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63A8			; 6D A8 63 | Add with carry (absolute)
	STA $62A8			; 8D A8 62 | Update graphics data
	LDA $6266			; AD 66 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6366			; 6D 66 63 | Add with carry (absolute)
	STA $6266			; 8D 66 62 | Update graphics data
	LDA $6286			; AD 86 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6386			; 6D 86 63 | Add with carry (absolute)
	STA $6286			; 8D 86 62 | Update graphics data
	LDA $62A6			; AD A6 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63A6			; 6D A6 63 | Add with carry (absolute)
	STA $62A6			; 8D A6 62 | Update graphics data
	LDA $6264			; AD 64 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6364			; 6D 64 63 | Add with carry (absolute)
	STA $6264			; 8D 64 62 | Update graphics data
	LDA $6284			; AD 84 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6384			; 6D 84 63 | Add with carry (absolute)
	STA $6284			; 8D 84 62 | Update graphics data
	LDA $62A4			; AD A4 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63A4			; 6D A4 63 | Add with carry (absolute)
	STA $62A4			; 8D A4 62 | Update graphics data
	LDA $6262			; AD 62 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6362			; 6D 62 63 | Add with carry (absolute)
	STA $6262			; 8D 62 62 | Update graphics data
	LDA $6282			; AD 82 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6382			; 6D 82 63 | Add with carry (absolute)
	STA $6282			; 8D 82 62 | Update graphics data
	LDA $62A2			; AD A2 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63A2			; 6D A2 63 | Add with carry (absolute)
	STA $62A2			; 8D A2 62 | Update graphics data
	LDA $6260			; AD 60 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6360			; 6D 60 63 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_04B
; Address: $D38BE8
; Size: 126 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_04B:
	STA $6260			; 8D 60 62 | Update graphics data
	LDA $6280			; AD 80 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6380			; 6D 80 63 | Add with carry (absolute)
	STA $6280			; 8D 80 62 | Update graphics data
	LDA $62A0			; AD A0 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $63A0			; 6D A0 63 | Add with carry (absolute)
	STA $62A0			; 8D A0 62 | Update graphics data
	LDA $625E			; AD 5E 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $635E			; 6D 5E 63 | Add with carry (absolute)
	STA $625E			; 8D 5E 62 | Update graphics data
	LDA $627E			; AD 7E 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $637E			; 6D 7E 63 | Add with carry (absolute)
	STA $627E			; 8D 7E 62 | Update graphics data
	LDA $629E			; AD 9E 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $639E			; 6D 9E 63 | Add with carry (absolute)
	STA $629E			; 8D 9E 62 | Update graphics data
	LDA $625C			; AD 5C 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $635C			; 6D 5C 63 | Add with carry (absolute)
	STA $625C			; 8D 5C 62 | Update graphics data
	LDA $627C			; AD 7C 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $637C			; 6D 7C 63 | Add with carry (absolute)
	STA $627C			; 8D 7C 62 | Update graphics data
	LDA $629C			; AD 9C 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $639C			; 6D 9C 63 | Add with carry (absolute)
	STA $629C			; 8D 9C 62 | Update graphics data
	LDA $625A			; AD 5A 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $635A			; 6D 5A 63 | Add with carry (absolute)
	STA $625A			; 8D 5A 62 | Update graphics data
	LDA $627A			; AD 7A 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $637A			; 6D 7A 63 | Add with carry (absolute)
	STA $627A			; 8D 7A 62 | Update graphics data
	LDA $629A			; AD 9A 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $639A			; 6D 9A 63 | Add with carry (absolute)
	STA $629A			; 8D 9A 62 | Update graphics data
	LDA $6258			; AD 58 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6358			; 6D 58 63 | Add with carry (absolute)
	STA $6258			; 8D 58 62 | Update graphics data
	LDA $6278			; AD 78 62 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_04C
; Address: $D38C66
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_04C:
	CLC				  ; 18 | Clear carry flag
	ADC $6378			; 6D 78 63 | Add with carry (absolute)
	STA $6278			; 8D 78 62 | Update graphics data
	LDA $6298			; AD 98 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6398			; 6D 98 63 | Add with carry (absolute)
	STA $6298			; 8D 98 62 | Update graphics data
	LDA $6256			; AD 56 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6356			; 6D 56 63 | Add with carry (absolute)
	STA $6256			; 8D 56 62 | Update graphics data
	LDA $6276			; AD 76 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6376			; 6D 76 63 | Add with carry (absolute)
	STA $6276			; 8D 76 62 | Update graphics data
	LDA $6296			; AD 96 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6396			; 6D 96 63 | Add with carry (absolute)
	STA $6296			; 8D 96 62 | Update graphics data
	LDA $6254			; AD 54 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6354			; 6D 54 63 | Add with carry (absolute)
	STA $6254			; 8D 54 62 | Update graphics data
	LDA $6274			; AD 74 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6374			; 6D 74 63 | Add with carry (absolute)
	STA $6274			; 8D 74 62 | Update graphics data
	LDA $6294			; AD 94 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6394			; 6D 94 63 | Add with carry (absolute)
	STA $6294			; 8D 94 62 | Update graphics data
	LDA $6252			; AD 52 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6352			; 6D 52 63 | Add with carry (absolute)
	STA $6252			; 8D 52 62 | Update graphics data
	LDA $6272			; AD 72 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6372			; 6D 72 63 | Add with carry (absolute)
	STA $6272			; 8D 72 62 | Update graphics data
	LDA $6292			; AD 92 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6392			; 6D 92 63 | Add with carry (absolute)
	STA $6292			; 8D 92 62 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_04E
; Address: $D38CD5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_04E:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_052
; Address: $D38CE7
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_052:
	JSL $C9724B		  ; 22 4B 72 C9 | Jump to subroutine long
	LDA $7FBA			; AD BA 7F | Read graphics status
	STA $33C2			; 8D C2 33 | Update graphics data
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	STA $7FBA			; 8D BA 7F | Update graphics data
	LDA $7FBC			; AD BC 7F | Read graphics status
	STA $33C4			; 8D C4 33 | Update graphics data
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	STA $7FBC			; 8D BC 7F | Update graphics data
	LDA $7FBE			; AD BE 7F | Read graphics status
	STA $33C6			; 8D C6 33 | Update graphics data
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	STA $7FBE			; 8D BE 7F | Update graphics data
	LDA $7FD0			; AD D0 7F | Read graphics status
	STA $33C8			; 8D C8 33 | Update graphics data
	LDA #$10			 ; A9 10 | Read graphics status
	STA $7FD0			; 8D D0 7F | Update graphics data
	LDA $7FD2			; AD D2 7F | Read graphics status
	STA $33CA			; 8D CA 33 | Update graphics data
	LDA #$17			 ; A9 17 | Read graphics status
	STA $7FD2			; 8D D2 7F | Update graphics data
	LDA $7FD4			; AD D4 7F | Read graphics status
	STA $33CC			; 8D CC 33 | Update graphics data
	LDA $33D8			; AD D8 33 | Read graphics status
	STA $7FD4			; 8D D4 7F | Update graphics data
	LDY #$C9			 ; A0 C9 | Load immediate value into Y register
	SBC $65A9			; ED A9 65 | Subtract with carry (absolute)
	INC $7322			; EE 22 73 | Increment (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_053
; Address: $D38D42
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_053:
	LDA $33C2			; AD C2 33 | Read graphics status
	STA $7FBA			; 8D BA 7F | Update graphics data
	LDA $33C4			; AD C4 33 | Read graphics status
	STA $7FBC			; 8D BC 7F | Update graphics data
	LDA $33C6			; AD C6 33 | Read graphics status
	STA $7FBE			; 8D BE 7F | Update graphics data
	LDA $33C8			; AD C8 33 | Read graphics status
	STA $7FD0			; 8D D0 7F | Update graphics data
	LDA $33CA			; AD CA 33 | Read graphics status
	STA $7FD2			; 8D D2 7F | Update graphics data
	LDA $33CC			; AD CC 33 | Read graphics status
	STA $7FD4			; 8D D4 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_056
; Address: $D38D70
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_056:
	LDA $645A			; AD 5A 64 | Read graphics status
	BEQ $01			  ; F0 01 | Branch if equal
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_058
; Address: $D38D7C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_058:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_059
; Address: $D38D88
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_059:
	JSL $C97F71		  ; 22 71 7F C9 | Jump to subroutine long
	STX $6290			; 8E 90 62 | Store X register to absolute address
	STX $70			  ; 86 70 | Store X register to zero page
	STA $6292			; 8D 92 62 | Update graphics data
	STA $72			  ; 85 72 | Update graphics data
	STZ $6294			; 9C 94 62 | Store zero to absolute
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	BVS $8D			  ; 70 8D | Branch if overflow set
	STA $6298			; 8D 98 62 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BVS $8D			  ; 70 8D | Branch if overflow set
	TXS				  ; 9A | Transfer X register to stack pointer
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	STY $629C			; 8C 9C 62 | Store Y register to absolute address

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_05B
; Address: $D38DB7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_05B:
	JSL $C9778B		  ; 22 8B 77 C9 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_05C
; Address: $D38DC3
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_05C:
	DEC $6298			; CE 98 62 | Decrement (absolute)
	BPL $10			  ; 10 10 | Branch if positive
	DEC $6294			; CE 94 62 | Decrement (absolute)
	LDA $6296			; AD 96 62 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $6298			; 8D 98 62 | Update graphics data
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	JMP $8DDB			; 4C DB 8D | Jump to address
	LDY $629C			; AC 9C 62 | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_05D
; Address: $D38DDB
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_05D:
	LDA $6290			; AD 90 62 | Read graphics status
	STA $70			  ; 85 70 | Update graphics data
	LDA $6292			; AD 92 62 | Read graphics status
	STA $72			  ; 85 72 | Update graphics data
	BVS $29			  ; 70 29 | Branch if overflow set
	STA $629E			; 8D 9E 62 | Update graphics data
	INY				  ; C8 | Increment Y register
	BVS $8D			  ; 70 8D | Branch if overflow set
	LDY #$62			 ; A0 62 | Load immediate value into Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BVS $29			  ; 70 29 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	ADC $629A			; 6D 9A 62 | Add with carry (absolute)
	STA $62A2			; 8D A2 62 | Update graphics data
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF A9 B5 C9 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $62A6			; 8D A6 62 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $62A8			; 8D A8 62 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $62A6			; 6D A6 62 | Add with carry (absolute)
	STA $62AA			; 8D AA 62 | Update graphics data
	INY				  ; C8 | Increment Y register
	BVS $29			  ; 70 29 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	ADC $629A			; 6D 9A 62 | Add with carry (absolute)
	STA $62A4			; 8D A4 62 | Update graphics data
	INY				  ; C8 | Increment Y register
	STY $629C			; 8C 9C 62 | Store Y register to absolute address
	LDX $62A2			; AE A2 62 | Load from absolute address into X register
	LDA				  ; BF 4F B5 C9 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $62A6			; AD A6 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$AC			 ; 69 AC | Add with carry (immediate)
	ADC #$A8			 ; 69 A8 | Add with carry (immediate)
	LDA $62A8			; AD A8 62 | Read graphics status
	PHB				  ; 8B | Push data bank register to stack
	ROR $ABC9,X		  ; 7E C9 AB | Rotate right (absolute,X)
	LDX $62A4			; AE A4 62 | Load from absolute address into X register
	LDA				  ; BF 4F B5 C9 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA				  ; BF A9 B5 C9 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_05E
; Address: $D38E53
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_05E:
	PHA				  ; 48 | Push accumulator to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_05F
; Address: $D38E5B
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_05F:
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLX				  ; FA | Pull X register from stack
	PHB				  ; 8B | Push data bank register to stack
	ROR $ABC9,X		  ; 7E C9 AB | Rotate right (absolute,X)
	LDA $62A0			; AD A0 62 | Read graphics status
	STA $7C			  ; 85 7C | Update graphics data
	LDA #$AC			 ; A9 AC | Read graphics status
	ADC #$85			 ; 69 85 | Add with carry (immediate)
	LDA #$7E			 ; A9 7E | Read graphics status
	STA $76			  ; 85 76 | Update graphics data
	LDA #$6C			 ; A9 6C | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_060
; Address: $D38E7A
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_060:
	STA $78			  ; 85 78 | Update graphics data
	LDA #$7E			 ; A9 7E | Read graphics status
	STA $7A			  ; 85 7A | Update graphics data
	LDA $62AA			; AD AA 62 | Read graphics status
	STA $7E			  ; 85 7E | Update graphics data
	LDX $62A6			; AE A6 62 | Load from absolute address into X register
	PHB				  ; 8B | Push data bank register to stack
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $7C			  ; A5 7C | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $211B			; 8D 1B 21 | PPU graphics register access
	XBA				  ; EB | Exchange accumulator bytes
	STA $211B			; 8D 1B 21 | PPU graphics register access
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	STA $211C			; 8D 1C 21 | PPU graphics register access
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $2135			; AD 35 21 | PPU graphics register access
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA				  ; 9F 2C 66 7E | Update graphics data
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	STA				  ; 9F AC 62 7E | Update graphics data
	INY				  ; C8 | Increment Y register
	LDA $7C			  ; A5 7C | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $211B			; 8D 1B 21 | PPU graphics register access

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_061
; Address: $D38EBF
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_061:
	XBA				  ; EB | Exchange accumulator bytes
	STA $211B			; 8D 1B 21 | PPU graphics register access
	SEI				  ; 78 | Set interrupt disable flag
	SEC				  ; 38 | Set carry flag
	STA $211C			; 8D 1C 21 | PPU graphics register access
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $2135			; AD 35 21 | PPU graphics register access
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA				  ; 9F EC 67 7E | Update graphics data
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	STA				  ; 9F 6C 64 7E | Update graphics data
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $7E			  ; E4 7E | Compare X register (zero page)
	BCC $AA			  ; 90 AA | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_062
; Address: $D38EE8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_062:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	DEC $629E			; CE 9E 62 | Decrement (absolute)
	LDA $629E			; AD 9E 62 | Read graphics status
	BPL $04			  ; 10 04 | Branch if positive

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_063
; Address: $D38EFC
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_063:
	JSL $C98DC3		  ; 22 C3 8D C9 | Jump to subroutine long
	LDA $33DA			; AD DA 33 | Read graphics status
	STA $74			  ; 85 74 | Update graphics data
	LDA $62A6			; AD A6 62 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	CLC				  ; 18 | Clear carry flag
	ADC $33DC			; 6D DC 33 | Add with carry (absolute)
	ADC $33DC			; 6D DC 33 | Add with carry (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA $62AC,X		  ; BD AC 62 | Read graphics status
	ADC $662C,X		  ; 7D 2C 66 | Add with carry (absolute,X)
	STA $62AC,X		  ; 9D AC 62 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $74			  ; 65 74 | Add with carry (zero page)
	BMI $3A			  ; 30 3A | Branch if negative

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_064
; Address: $D38F28
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_064:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	ROL $D599			; 2E 99 D5 | Rotate left (absolute)
	LDA $646C,X		  ; BD 6C 64 | Read graphics status
	ADC $67EC,X		  ; 7D EC 67 | Add with carry (absolute,X)
	STA $646C,X		  ; 9D 6C 64 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $74			  ; 65 74 | Add with carry (zero page)
	BMI $2D			  ; 30 2D | Branch if negative
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_065
; Address: $D38F46
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_065:
	JSL $F5D699		  ; 22 99 D6 F5 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX $62AA			; EC AA 62 | Compare X register (absolute)
	BCC $BE			  ; 90 BE | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_066
; Address: $D38F5B
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_066:
	LDA #$FF			 ; A9 FF | Read graphics status
	CLC				  ; 18 | Clear carry flag
	JMP $8F2D			; 4C 2D 8F | Jump to address
	LDA #$00			 ; A9 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	JMP $8F2D			; 4C 2D 8F | Jump to address
	LDA #$FF			 ; A9 FF | Read graphics status
	JMP $8F47			; 4C 47 8F | Jump to address
	LDA #$00			 ; A9 00 | Read graphics status
	JMP $8F47			; 4C 47 8F | Jump to address
	LDA $62AC,X		  ; BD AC 62 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $662C,X		  ; 7D 2C 66 | Add with carry (absolute,X)
	STA $62AC,X		  ; 9D AC 62 | Update graphics data
	LDA $646C,X		  ; BD 6C 64 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $67EC,X		  ; 7D EC 67 | Add with carry (absolute,X)
	STA $646C,X		  ; 9D 6C 64 | Update graphics data
	JMP $8F4A			; 4C 4A 8F | Jump to address
	LDA #$0D			 ; A9 0D | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_067
; Address: $D38F8F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_067:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_069
; Address: $D38F97
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_069:
	LDA $7FBA			; AD BA 7F | Read graphics status
	STA $33C2			; 8D C2 33 | Update graphics data
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	STA $7FBA			; 8D BA 7F | Update graphics data
	LDA $7FBC			; AD BC 7F | Read graphics status
	STA $33C4			; 8D C4 33 | Update graphics data
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	STA $7FBC			; 8D BC 7F | Update graphics data
	LDA $7FBE			; AD BE 7F | Read graphics status
	STA $33C6			; 8D C6 33 | Update graphics data
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	STA $7FBE			; 8D BE 7F | Update graphics data
	LDA $7FD0			; AD D0 7F | Read graphics status
	STA $33C8			; 8D C8 33 | Update graphics data
	LDA #$10			 ; A9 10 | Read graphics status
	STA $7FD0			; 8D D0 7F | Update graphics data
	LDA $7FD2			; AD D2 7F | Read graphics status
	STA $33CA			; 8D CA 33 | Update graphics data
	LDA #$17			 ; A9 17 | Read graphics status
	STA $7FD2			; 8D D2 7F | Update graphics data
	LDA $7FD4			; AD D4 7F | Read graphics status
	STA $33CC			; 8D CC 33 | Update graphics data
	LDA $33D8			; AD D8 33 | Read graphics status
	STA $7FD4			; 8D D4 7F | Update graphics data
	LDY #$C9			 ; A0 C9 | Load immediate value into Y register
	SBC $D5A9			; ED A9 D5 | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_06A
; Address: $D38FE8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_06A:
	JSL $C0C973		  ; 22 73 C9 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_06B
; Address: $D38FEE
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_06B:
	LDA $33C2			; AD C2 33 | Read graphics status
	STA $7FBA			; 8D BA 7F | Update graphics data
	LDA $33C4			; AD C4 33 | Read graphics status
	STA $7FBC			; 8D BC 7F | Update graphics data
	LDA $33C6			; AD C6 33 | Read graphics status
	STA $7FBE			; 8D BE 7F | Update graphics data
	LDA $33C8			; AD C8 33 | Read graphics status
	STA $7FD0			; 8D D0 7F | Update graphics data
	LDA $33CA			; AD CA 33 | Read graphics status
	STA $7FD2			; 8D D2 7F | Update graphics data
	LDA $33CC			; AD CC 33 | Read graphics status
	STA $7FD4			; 8D D4 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_06C
; Address: $D39013
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_06C:
	JMP $C98EE8		  ; 5C E8 8E C9 | Jump to address long
	LDA #$C9			 ; A9 C9 | Read graphics status
	LDX #$E4			 ; A2 E4 | Load immediate value into X register
	SBC ($22,X)		  ; E1 22 | Subtract with carry ((zero page,X))
	STA $A0C9			; 8D C9 A0 | Update graphics data
	BMI $62			  ; 30 62 | Branch if negative

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_070
; Address: $D39030
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_070:
	LDA #$C9			 ; A9 C9 | Read graphics status
	LDX #$95			 ; A2 95 | Load immediate value into X register
	SBC ($22,X)		  ; E1 22 | Subtract with carry ((zero page,X))
	STA $4CC9			; 8D C9 4C | Update graphics data
	AND ($90,X)		  ; 21 90 | Logical AND with accumulator ((zero page,X))
	LDA #$C9			 ; A9 C9 | Read graphics status
	LDX #$15			 ; A2 15 | Load immediate value into X register
	SEP #$22			 ; E2 22 | Set processor status bits
	STA $4CC9			; 8D C9 4C | Update graphics data
	AND ($90,X)		  ; 21 90 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_073
; Address: $D39053
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_073:
	JMP $C98EE8		  ; 5C E8 8E C9 | Jump to address long
	LDY #$E0			 ; A0 E0 | Game work RAM access
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	BNE $F8			  ; D0 F8 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_075
; Address: $D39066
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_075:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_077
; Address: $D39074
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_077:
	JSL $C99057		  ; 22 57 90 C9 | Jump to subroutine long
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	JMP ($30A9)		  ; 6C A9 30 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_078
; Address: $D3907E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_078:
	JSL $C0C973		  ; 22 73 C9 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_07A
; Address: $D39087
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_07A:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_07C
; Address: $D39095
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_07C:
	JSL $C99057		  ; 22 57 90 C9 | Jump to subroutine long
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	ADC $F0A9			; 6D A9 F0 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_080
; Address: $D390A8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_080:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_081
; Address: $D390B0
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_081:
	LDA $7FA8			; AD A8 7F | Read graphics status
	LDX #$B0			 ; A2 B0 | Load immediate value into X register
	ADC $22			  ; 65 22 | Add with carry (zero page)
	BCC $C9			  ; 90 C9 | Branch if carry clear
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	ADC $B0A9			; 6D A9 B0 | Add with carry (absolute)
	ADC $22			  ; 65 22 | Add with carry (zero page)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_083
; Address: $D390C9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_083:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_085
; Address: $D390D7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_085:
	JSL $C99057		  ; 22 57 90 C9 | Jump to subroutine long
	LDY #$D0			 ; A0 D0 | Load immediate value into Y register
	ADC $70A9			; 6D A9 70 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_086
; Address: $D390E1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_086:
	JSL $C0C973		  ; 22 73 C9 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_088
; Address: $D390EA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_088:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_089
; Address: $D390F2
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_089:
	LDA $7F9E			; AD 9E 7F | Read graphics status
	LDX #$30			 ; A2 30 | Load immediate value into X register
	ADC #$22			 ; 69 22 | Add with carry (immediate)
	BCC $C9			  ; 90 C9 | Branch if carry clear
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	ROR $30A9			; 6E A9 30 | Rotate right (absolute)
	ADC #$22			 ; 69 22 | Add with carry (immediate)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_08B
; Address: $D3910B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_08B:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_08E
; Address: $D39119
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_08E:
	JSL $C99057		  ; 22 57 90 C9 | Jump to subroutine long
	LDY #$90			 ; A0 90 | Load immediate value into Y register
	ROR $F0A9			; 6E A9 F0 | Rotate right (absolute)
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_08F
; Address: $D39123
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_08F:
	JSL $C0C973		  ; 22 73 C9 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_091
; Address: $D3912C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_091:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_093
; Address: $D3913A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_093:
	JSL $C0C973		  ; 22 73 C9 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_095
; Address: $D39143
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_095:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_097
; Address: $D39151
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_097:
	JSL $C0C973		  ; 22 73 C9 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_099
; Address: $D3915A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_099:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_09A
; Address: $D39162
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_09A:
	LDA $7FBA			; AD BA 7F | Read graphics status
	STA $33C2			; 8D C2 33 | Update graphics data
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	STA $7FBA			; 8D BA 7F | Update graphics data
	LDA $7FBC			; AD BC 7F | Read graphics status
	STA $33C4			; 8D C4 33 | Update graphics data
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	STA $7FBC			; 8D BC 7F | Update graphics data
	LDA $7FBE			; AD BE 7F | Read graphics status
	STA $33C6			; 8D C6 33 | Update graphics data
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	STA $7FBE			; 8D BE 7F | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_09B
; Address: $D39192
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_09B:
	LDX #$65			 ; A2 65 | Load immediate value into X register
	INC $5722			; EE 22 57 | Increment (absolute)
	BCC $C9			  ; 90 C9 | Branch if carry clear
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	LDA #$65			 ; A9 65 | Read graphics status
	INC $7322			; EE 22 73 | Increment (absolute)
	CMP #$C0			 ; C9 C0 | Compare accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_09D
; Address: $D391A8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_09D:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_09E
; Address: $D391B0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_09E:
	LDA $7FD4			; AD D4 7F | Read graphics status
	STA $33CC			; 8D CC 33 | Update graphics data
	STZ $7FD4			; 9C D4 7F | Store zero to absolute
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$D5			 ; A2 D5 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_09F
; Address: $D391BF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_09F:
	JSL $C99057		  ; 22 57 90 C9 | Jump to subroutine long
	LDY #$F0			 ; A0 F0 | Load immediate value into Y register
	ROR $D5A9			; 6E A9 D5 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0A0
; Address: $D391C9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0A0:
	JSL $C0C973		  ; 22 73 C9 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0A1
; Address: $D391CF
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0A1:
	STA $7A			  ; 85 7A | Update graphics data
	LDA #$1C			 ; A9 1C | Read graphics status
	STA $78			  ; 85 78 | Update graphics data
	LDA #$88			 ; A9 88 | Read graphics status
	STA $0000,Y		  ; 99 00 00 | Update graphics data
	LDA $7A			  ; A5 7A | Read graphics status
	STA $0001,Y		  ; 99 01 00 | Update graphics data
	LDA $7A			  ; A5 7A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$20			 ; 69 20 | Add with carry (immediate)
	STA $7A			  ; 85 7A | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEC $78			  ; C6 78 | Decrement (zero page)
	BNE $E6			  ; D0 E6 | Branch if not equal
	LDA #$00			 ; A9 00 | Read graphics status
	STA $0000,Y		  ; 99 00 00 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0A4
; Address: $D39200
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0A4:
	JSR $966F			; 20 6F 96 | Jump to subroutine
	LDA #$01			 ; A9 01 | Read graphics status
	STA $6FB0			; 8D B0 6F | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0A5
; Address: $D39209
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0A5:
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	STA $6FB4			; 8D B4 6F | Update graphics data
	LDA #$FE			 ; A9 FE | Read graphics status
	STA $6FB6			; 8D B6 6F | Update graphics data
	STA $6FB8			; 8D B8 6F | Update graphics data
	STZ $33C0			; 9C C0 33 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0A6
; Address: $D3921F
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0A6:
	JSR $966F			; 20 6F 96 | Jump to subroutine
	STZ $6FB0			; 9C B0 6F | Store zero to absolute
	STZ $6FB2			; 9C B2 6F | Store zero to absolute
	STZ $6FB4			; 9C B4 6F | Store zero to absolute
	LDA #$02			 ; A9 02 | Read graphics status
	STA $6FB6			; 8D B6 6F | Update graphics data
	STA $6FB8			; 8D B8 6F | Update graphics data
	STZ $33C0			; 9C C0 33 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0A7
; Address: $D39238
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0A7:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	LDA $6FB0			; AD B0 6F | Read graphics status
	EOR #$01			 ; 49 01 | Exclusive OR with accumulator (immediate)
	STA $6FB0			; 8D B0 6F | Update graphics data
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $6FB4			; AD B4 6F | Read graphics status
	STA $04			  ; 85 04 | Update graphics data
	STA $06			  ; 85 06 | Update graphics data
	STA $08			  ; 85 08 | Update graphics data
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$E0			 ; A9 E0 | Game work RAM access

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0A8
; Address: $D39261
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0A8:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $02			  ; 85 02 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $00			  ; 85 00 | Update graphics data
	LDA $08			  ; A5 08 | Read graphics status
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $7FA4			; AD A4 7F | Read graphics status
	STA $0C			  ; 85 0C | Update graphics data
	LDA $7FA8			; AD A8 7F | Read graphics status
	STA $0E			  ; 85 0E | Update graphics data
	LDA $7F9C			; AD 9C 7F | Read graphics status
	STA $10			  ; 85 10 | Update graphics data
	LDA $7FA0			; AD A0 7F | Read graphics status
	STA $12			  ; 85 12 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0A9
; Address: $D39289
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0A9:
	SEP #$10			 ; E2 10 | Set processor status bits
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	LDA $0C			  ; A5 0C | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $6230,Y		  ; 99 30 62 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $65B0,Y		  ; 99 B0 65 | Update graphics data
	LDX $06			  ; A6 06 | Load from zero page into X register
	LDA				  ; BF 27 94 C9 | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $04			  ; E5 04 | Subtract with carry (zero page)
	STA $02			  ; 85 02 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $00			  ; 85 00 | Update graphics data
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $0A			  ; 85 0A | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $10			  ; 65 10 | Add with carry (zero page)
	STA $6770,Y		  ; 99 70 67 | Update graphics data
	LDA $12			  ; A5 12 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $0A			  ; 65 0A | Add with carry (zero page)
	STA $6AF0,Y		  ; 99 F0 6A | Update graphics data
	INC $06			  ; E6 06 | Increment (zero page)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BCC $BA			  ; 90 BA | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $0C			  ; A5 0C | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $6310,Y		  ; 99 10 63 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $6690,Y		  ; 99 90 66 | Update graphics data
	LDX $06			  ; A6 06 | Load from zero page into X register
	LDA				  ; BF 27 94 C9 | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $04			  ; E5 04 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0AA
; Address: $D392F4
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0AA:
	STA $02			  ; 85 02 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $00			  ; 85 00 | Update graphics data
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $0A			  ; 85 0A | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $10			  ; 65 10 | Add with carry (zero page)
	STA $6850,Y		  ; 99 50 68 | Update graphics data
	LDA $12			  ; A5 12 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $0A			  ; 65 0A | Add with carry (zero page)
	STA $6BD0,Y		  ; 99 D0 6B | Update graphics data
	INC $06			  ; E6 06 | Increment (zero page)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	BCC $BA			  ; 90 BA | Branch if carry clear
	REP #$10			 ; C2 10 | Reset processor status bits
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0AB
; Address: $D3931F
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0AB:
	LDA $6FB2			; AD B2 6F | Read graphics status
	STA $04			  ; 85 04 | Update graphics data
	STA $06			  ; 85 06 | Update graphics data
	STA $08			  ; 85 08 | Update graphics data
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	STZ $00			  ; 64 00 | Store zero to zero page
	STZ $02			  ; 64 02 | Store zero to zero page
	LDA $08			  ; A5 08 | Read graphics status
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $7FA4			; AD A4 7F | Read graphics status
	STA $0C			  ; 85 0C | Update graphics data
	LDA $7FA8			; AD A8 7F | Read graphics status
	STA $0E			  ; 85 0E | Update graphics data
	LDA $7F9C			; AD 9C 7F | Read graphics status
	STA $10			  ; 85 10 | Update graphics data
	LDA $7FA0			; AD A0 7F | Read graphics status
	STA $12			  ; 85 12 | Update graphics data
	SEP #$10			 ; E2 10 | Set processor status bits
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	LDA $0C			  ; A5 0C | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	STA $6230,Y		  ; 99 30 62 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	STA $65B0,Y		  ; 99 B0 65 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0AC
; Address: $D3935E
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0AC:
	LDX $06			  ; A6 06 | Load from zero page into X register
	LDA				  ; BF 27 94 C9 | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $04			  ; 65 04 | Add with carry (zero page)
	STA $02			  ; 85 02 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $00			  ; 85 00 | Update graphics data
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $0A			  ; 85 0A | Update graphics data
	LDA $10			  ; A5 10 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $0A			  ; E5 0A | Subtract with carry (zero page)
	STA $6770,Y		  ; 99 70 67 | Update graphics data
	LDA $12			  ; A5 12 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $0A			  ; E5 0A | Subtract with carry (zero page)
	STA $6AF0,Y		  ; 99 F0 6A | Update graphics data
	INC $06			  ; E6 06 | Increment (zero page)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BCC $B8			  ; 90 B8 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $0C			  ; A5 0C | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	STA $6310,Y		  ; 99 10 63 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	STA $6690,Y		  ; 99 90 66 | Update graphics data
	LDX $06			  ; A6 06 | Load from zero page into X register
	LDA				  ; BF 27 94 C9 | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $04			  ; 65 04 | Add with carry (zero page)
	STA $02			  ; 85 02 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $00			  ; 85 00 | Update graphics data
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $0A			  ; 85 0A | Update graphics data
	LDA $10			  ; A5 10 | Read graphics status
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0AD
; Address: $D393CB
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0AD:
	SBC $0A			  ; E5 0A | Subtract with carry (zero page)
	STA $6850,Y		  ; 99 50 68 | Update graphics data
	LDA $12			  ; A5 12 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $0A			  ; E5 0A | Subtract with carry (zero page)
	STA $6BD0,Y		  ; 99 D0 6B | Update graphics data
	INC $06			  ; E6 06 | Increment (zero page)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	BCC $B8			  ; 90 B8 | Branch if carry clear
	REP #$10			 ; C2 10 | Reset processor status bits
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0AE
; Address: $D393E4
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0AE:
	LDA $6FB0			; AD B0 6F | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $24			  ; F0 24 | Branch if equal
	LDA $6FB4			; AD B4 6F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6FB8			; 6D B8 6F | Add with carry (absolute)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BCS $11			  ; B0 11 | Branch if carry set
	STA $6FB4			; 8D B4 6F | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	EOR #$0F			 ; 49 0F | Exclusive OR with accumulator (immediate)
	STA $7F88			; 8D 88 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0AF
; Address: $D39409
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0AF:
	LDA #$01			 ; A9 01 | Read graphics status
	CPY #$33			 ; C0 33 | Compare Y register (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0B0
; Address: $D39410
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0B0:
	LDA $6FB2			; AD B2 6F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6FB6			; 6D B6 6F | Add with carry (absolute)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BCS $04			  ; B0 04 | Branch if carry set
	STA $6FB2			; 8D B2 6F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0B1
; Address: $D39420
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0B1:
	LDA #$02			 ; A9 02 | Read graphics status
	CPY #$33			 ; C0 33 | Compare Y register (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0B2
; Address: $D39428
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0B2:
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ORA $251F,Y		  ; 19 1F 25 | Logical OR with accumulator (absolute,Y)
	AND ($38),Y		  ; 31 38 | Logical AND with accumulator ((zero page),Y)
	ROL $4A44,X		  ; 3E 44 4A | Rotate left (absolute,X)
	BVC $56			  ; 50 56 | Branch if overflow clear
	JMP $6D6761		  ; 5C 61 67 6D | Jump to address long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0B3
; Address: $D3943B
; Size: 123 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0B3:
	SEI				  ; 78 | Set interrupt disable flag
	ROR $8883,X		  ; 7E 83 88 | Rotate right (absolute,X)
	STX $9893			; 8E 93 98 | Store X register to absolute address
	STA $A7A2,X		  ; 9D A2 A7 | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	BCS $B5			  ; B0 B5 | Branch if carry set
	LDA $C1BD,Y		  ; B9 BD C1 | Read graphics status
	CMP $C9			  ; C5 C9 | Compare accumulator (zero page)
	CMP $D4D1			; CD D1 D4 | Compare accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	DEC $E4E1,X		  ; DE E1 E4 | Decrement (absolute,X)
	NOP				  ; EA | No operation
	CPX $F1EE			; EC EE F1 | Compare X register (absolute)
	PEA #$F8F6		   ; F4 F6 F8 | Push effective address to stack
	SBC $FCFB,Y		  ; F9 FB FC | Subtract with carry (absolute,Y)
	SBC $FEFE,X		  ; FD FE FE | Subtract with carry (absolute,X)
	INC $FDFE,X		  ; FE FE FD | Increment (absolute,X)
	SBC $F6F8,Y		  ; F9 F8 F6 | Subtract with carry (absolute,Y)
	PEA #$F1F3		   ; F4 F3 F1 | Push effective address to stack
	INC $EAEC			; EE EC EA | Increment (absolute)
	CPX $E1			  ; E4 E1 | Compare X register (zero page)
	DEC $D8DB,X		  ; DE DB D8 | Decrement (absolute,X)
	CMP ($CD),Y		  ; D1 CD | Compare accumulator ((zero page),Y)
	CMP #$C5			 ; C9 C5 | Compare accumulator (immediate)
	CMP ($BD,X)		  ; C1 BD | Compare accumulator ((zero page,X))
	LDA $B0B5,Y		  ; B9 B5 B0 | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	LDX #$9D			 ; A2 9D | Load immediate value into X register
	TYA				  ; 98 | Transfer Y register to accumulator
	STX $8388			; 8E 88 83 | Store X register to absolute address
	ROR $7378,X		  ; 7E 78 73 | Rotate right (absolute,X)
	ADC $6167			; 6D 67 61 | Add with carry (absolute)
	JMP $4A5056		  ; 5C 56 50 4A | Jump to address long
	ROL $3138,X		  ; 3E 38 31 | Rotate left (absolute,X)
	AND $1F			  ; 25 1F | Logical AND with accumulator (zero page)
	ORA $0C12,Y		  ; 19 12 0C | Logical OR with accumulator (absolute,Y)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ORA $251F,Y		  ; 19 1F 25 | Logical OR with accumulator (absolute,Y)
	AND ($38),Y		  ; 31 38 | Logical AND with accumulator ((zero page),Y)
	ROL $4A44,X		  ; 3E 44 4A | Rotate left (absolute,X)
	BVC $56			  ; 50 56 | Branch if overflow clear
	JMP $6D6761		  ; 5C 61 67 6D | Jump to address long
	SEI				  ; 78 | Set interrupt disable flag
	ROR $8883,X		  ; 7E 83 88 | Rotate right (absolute,X)
	STX $9893			; 8E 93 98 | Store X register to absolute address
	STA $A7A2,X		  ; 9D A2 A7 | Update graphics data
	PLB				  ; AB | Pull data bank register from stack
	BCS $B5			  ; B0 B5 | Branch if carry set
	LDA $C1BD,Y		  ; B9 BD C1 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0B4
; Address: $D394CB
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0B4:
	CMP $C9			  ; C5 C9 | Compare accumulator (zero page)
	CMP $D4D1			; CD D1 D4 | Compare accumulator (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	DEC $E4E1,X		  ; DE E1 E4 | Decrement (absolute,X)
	NOP				  ; EA | No operation
	CPX $F1EE			; EC EE F1 | Compare X register (absolute)
	PEA #$F8F6		   ; F4 F6 F8 | Push effective address to stack
	SBC $FCFB,Y		  ; F9 FB FC | Subtract with carry (absolute,Y)
	SBC $FEFE,X		  ; FD FE FE | Subtract with carry (absolute,X)
	INC $FDFE,X		  ; FE FE FD | Increment (absolute,X)
	SBC $F6F8,Y		  ; F9 F8 F6 | Subtract with carry (absolute,Y)
	PEA #$F1F3		   ; F4 F3 F1 | Push effective address to stack
	INC $EAEC			; EE EC EA | Increment (absolute)
	CPX $E1			  ; E4 E1 | Compare X register (zero page)
	DEC $D8DB,X		  ; DE DB D8 | Decrement (absolute,X)
	CMP ($CD),Y		  ; D1 CD | Compare accumulator ((zero page),Y)
	CMP #$C5			 ; C9 C5 | Compare accumulator (immediate)
	CMP ($BD,X)		  ; C1 BD | Compare accumulator ((zero page,X))
	LDA $B0B5,Y		  ; B9 B5 B0 | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	LDX #$9D			 ; A2 9D | Load immediate value into X register
	TYA				  ; 98 | Transfer Y register to accumulator
	STX $8388			; 8E 88 83 | Store X register to absolute address
	ROR $7378,X		  ; 7E 78 73 | Rotate right (absolute,X)
	ADC $6167			; 6D 67 61 | Add with carry (absolute)
	JMP $4A5056		  ; 5C 56 50 4A | Jump to address long
	ROL $3138,X		  ; 3E 38 31 | Rotate left (absolute,X)
	AND $1F			  ; 25 1F | Logical AND with accumulator (zero page)
	ORA $0C12,Y		  ; 19 12 0C | Logical OR with accumulator (absolute,Y)
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)
	STZ $6FBC			; 9C BC 6F | Store zero to absolute
	STZ $6FBE			; 9C BE 6F | Store zero to absolute
	LDA #$01			 ; A9 01 | Read graphics status
	STA $6FC0			; 8D C0 6F | Update graphics data
	STA $6FC2			; 8D C2 6F | Update graphics data
	STZ $33C0			; 9C C0 33 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0B5
; Address: $D3953D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0B5:
	JSR $966F			; 20 6F 96 | Jump to subroutine
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $6FBC			; 8D BC 6F | Update graphics data
	STA $6FBE			; 8D BE 6F | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $6FC0			; 8D C0 6F | Update graphics data
	STA $6FC2			; 8D C2 6F | Update graphics data
	STZ $33C0			; 9C C0 33 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0B9
; Address: $D39560
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0B9:
	SEI				  ; 78 | Set interrupt disable flag
	LDA $6FBC			; AD BC 6F | Read graphics status
	STA $04			  ; 85 04 | Update graphics data
	STA $00			  ; 85 00 | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$69			 ; A9 69 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0BA
; Address: $D3956E
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0BA:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	LDA $00			  ; A5 00 | Read graphics status
	STA $02			  ; 85 02 | Update graphics data
	LDA $6FBE			; AD BE 6F | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $7FA4			; AD A4 7F | Read graphics status
	STA $0C			  ; 85 0C | Update graphics data
	LDA $7FA8			; AD A8 7F | Read graphics status
	STA $0E			  ; 85 0E | Update graphics data
	LDA $7F9C			; AD 9C 7F | Read graphics status
	STA $10			  ; 85 10 | Update graphics data
	LDA $7F9E			; AD 9E 7F | Read graphics status
	STA $12			  ; 85 12 | Update graphics data
	LDA #$20			 ; A9 20 | Read graphics status
	STA $06			  ; 85 06 | Update graphics data
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	LDA $06			  ; A5 06 | Read graphics status
	AND #$7F			 ; 29 7F | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 27 94 C9 | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $04			  ; E5 04 | Subtract with carry (zero page)
	STA $02			  ; 85 02 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0C			  ; A5 0C | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ASL $C900,X		  ; 1E 00 C9 | Arithmetic shift left (absolute,X)
	STA $6230,Y		  ; 99 30 62 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ASL $C900,X		  ; 1E 00 C9 | Arithmetic shift left (absolute,X)
	STA $65B0,Y		  ; 99 B0 65 | Update graphics data
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $00			  ; 85 00 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $10			  ; 65 10 | Add with carry (zero page)
	STA $6770,Y		  ; 99 70 67 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0BB
; Address: $D395D8
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0BB:
	LDA $12			  ; A5 12 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	STA $6930,Y		  ; 99 30 69 | Update graphics data
	INC $06			  ; E6 06 | Increment (zero page)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	BCC $B1			  ; 90 B1 | Branch if carry clear
	LDA $06			  ; A5 06 | Read graphics status
	AND #$7F			 ; 29 7F | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 27 94 C9 | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $04			  ; 65 04 | Add with carry (zero page)
	STA $02			  ; 85 02 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $0C			  ; A5 0C | Read graphics status
	SEC				  ; 38 | Set carry flag
	ASL $C900,X		  ; 1E 00 C9 | Arithmetic shift left (absolute,X)
	STA $6230,Y		  ; 99 30 62 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	SEC				  ; 38 | Set carry flag
	ASL $C900,X		  ; 1E 00 C9 | Arithmetic shift left (absolute,X)
	STA $65B0,Y		  ; 99 B0 65 | Update graphics data
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $00			  ; 85 00 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $12			  ; 65 12 | Add with carry (zero page)
	STA $6930,Y		  ; 99 30 69 | Update graphics data
	LDA $10			  ; A5 10 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	STA $6770,Y		  ; 99 70 67 | Update graphics data
	INC $06			  ; E6 06 | Increment (zero page)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDA ($28),Y		  ; B1 28 | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0BC
; Address: $D3963A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0BC:
	LDA $6FBC			; AD BC 6F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6FC0			; 6D C0 6F | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0BD
; Address: $D39641
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0BD:
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BCS $13			  ; B0 13 | Branch if carry set
	STA $6FBC			; 8D BC 6F | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	EOR #$0F			 ; 49 0F | Exclusive OR with accumulator (immediate)
	STA $7F88			; 8D 88 7F | Update graphics data
	JMP $965F			; 4C 5F 96 | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	STA $33C0			; 8D C0 33 | Update graphics data
	LDA $6FBE			; AD BE 6F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6FC2			; 6D C2 6F | Add with carry (absolute)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BCS $03			  ; B0 03 | Branch if carry set
	STA $6FBE			; 8D BE 6F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0C4
; Address: $D3968B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0C4:
	LDA $33C6			; AD C6 33 | Read graphics status
	STA $7FBE			; 8D BE 7F | Update graphics data
	LDA $33C4			; AD C4 33 | Read graphics status
	STA $7FBC			; 8D BC 7F | Update graphics data
	LDA $33C2			; AD C2 33 | Read graphics status
	STA $7FBA			; 8D BA 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0C5
; Address: $D3969E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0C5:
	LDA $33CC			; AD CC 33 | Read graphics status
	STA $7FD4			; 8D D4 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0C6
; Address: $D396A5
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0C6:
	JSR $966F			; 20 6F 96 | Jump to subroutine
	STZ $6FC4			; 9C C4 6F | Store zero to absolute
	LDA #$01			 ; A9 01 | Read graphics status
	STA $6FC6			; 8D C6 6F | Update graphics data
	STZ $33C0			; 9C C0 33 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0C7
; Address: $D396B5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0C7:
	JSR $966F			; 20 6F 96 | Jump to subroutine
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $6FC4			; 8D C4 6F | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $6FC6			; 8D C6 6F | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0CB
; Address: $D396D1
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0CB:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	LDA $6FC4			; AD C4 6F | Read graphics status
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $7FA4			; AD A4 7F | Read graphics status
	STA $02			  ; 85 02 | Update graphics data
	LDA $7FA8			; AD A8 7F | Read graphics status
	STA $04			  ; 85 04 | Update graphics data
	LDA $7FA6			; AD A6 7F | Read graphics status
	STA $06			  ; 85 06 | Update graphics data
	SEP #$10			 ; E2 10 | Set processor status bits
	LDX #$20			 ; A2 20 | Load immediate value into X register
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	LDA				  ; BF 27 94 C9 | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $00			  ; 85 00 | Update graphics data
	ADC $02			  ; 65 02 | Add with carry (zero page)
	STA $622E,Y		  ; 99 2E 62 | Update graphics data
	LDA $06			  ; A5 06 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $63EE,Y		  ; 99 EE 63 | Update graphics data
	LDA $04			  ; A5 04 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $65AE,Y		  ; 99 AE 65 | Update graphics data
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	BCC $D2			  ; 90 D2 | Branch if carry clear
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA				  ; BF 27 94 C9 | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $00			  ; 85 00 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0CC
; Address: $D39736
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0CC:
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	STA $62FE,Y		  ; 99 FE 62 | Update graphics data
	LDA $06			  ; A5 06 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	STA $64BE,Y		  ; 99 BE 64 | Update graphics data
	LDA $04			  ; A5 04 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	STA $667E,Y		  ; 99 7E 66 | Update graphics data
	CPY #$E0			 ; C0 E0 | Game work RAM access
	BCC $D0			  ; 90 D0 | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0CD
; Address: $D39751
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0CD:
	LDA $6FC4			; AD C4 6F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6FC6			; 6D C6 6F | Add with carry (absolute)
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BCS $13			  ; B0 13 | Branch if carry set
	STA $6FC4			; 8D C4 6F | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	EOR #$0F			 ; 49 0F | Exclusive OR with accumulator (immediate)
	STA $7F88			; 8D 88 7F | Update graphics data
	JMP $9776			; 4C 76 97 | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	STA $33C0			; 8D C0 33 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0CE
; Address: $D39777
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0CE:
	JSR $966F			; 20 6F 96 | Jump to subroutine
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	STZ $6FCE			; 9C CE 6F | Store zero to absolute
	LDA #$00			 ; A9 00 | Read graphics status
	STA $6FD0			; 8D D0 6F | Update graphics data
	LDA #$10			 ; A9 10 | Read graphics status
	STA $6FD2			; 8D D2 6F | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	LDA #$01			 ; A9 01 | Read graphics status
	STA $6FCC			; 8D CC 6F | Update graphics data
	LDA $7FD0			; AD D0 7F | Read graphics status
	STA $33C8			; 8D C8 33 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FD0			; 8D D0 7F | Update graphics data
	LDA $7FD2			; AD D2 7F | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0CF
; Address: $D397AA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0CF:
	STA $33CA			; 8D CA 33 | Update graphics data
	LDA #$07			 ; A9 07 | Read graphics status
	STA $7FD2			; 8D D2 7F | Update graphics data
	LDA $7FD4			; AD D4 7F | Read graphics status
	STA $33CC			; 8D CC 33 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FD4			; 8D D4 7F | Update graphics data
	STZ $33C0			; 9C C0 33 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0D0
; Address: $D397C3
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0D0:
	JSR $966F			; 20 6F 96 | Jump to subroutine
	LDA $33CE			; AD CE 33 | Read graphics status
	STA $6FC8			; 8D C8 6F | Update graphics data
	LDA $33D0			; AD D0 33 | Read graphics status
	STA $6FCE			; 8D CE 6F | Update graphics data
	LDA $33D2			; AD D2 33 | Read graphics status
	STA $6FD0			; 8D D0 6F | Update graphics data
	LDA #$F0			 ; A9 F0 | Read graphics status
	STA $6FD2			; 8D D2 6F | Update graphics data
	LDA $33D4			; AD D4 33 | Read graphics status
	STA $6FCA			; 8D CA 6F | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $6FCC			; 8D CC 6F | Update graphics data
	LDA $7FD0			; AD D0 7F | Read graphics status
	STA $33C8			; 8D C8 33 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FD0			; 8D D0 7F | Update graphics data
	LDA $7FD2			; AD D2 7F | Read graphics status
	STA $33CA			; 8D CA 33 | Update graphics data
	LDA #$07			 ; A9 07 | Read graphics status
	STA $7FD2			; 8D D2 7F | Update graphics data
	LDA $7FD4			; AD D4 7F | Read graphics status
	STA $33CC			; 8D CC 33 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FD4			; 8D D4 7F | Update graphics data
	STZ $33C0			; 9C C0 33 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0D1
; Address: $D39812
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0D1:
	LDA $33C8			; AD C8 33 | Read graphics status
	STA $7FD0			; 8D D0 7F | Update graphics data
	LDA $33CA			; AD CA 33 | Read graphics status
	STA $7FD2			; 8D D2 7F | Update graphics data
	LDA $33CC			; AD CC 33 | Read graphics status
	STA $7FD4			; 8D D4 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0D4
; Address: $D3982E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0D4:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	LDA $6FC8			; AD C8 6F | Read graphics status
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0D6
; Address: $D3983B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0D6:
	JSL $C011E1		  ; 22 E1 11 C0 | Jump to subroutine long
	LDX $01			  ; A6 01 | Load from zero page into X register
	BMI $12			  ; 30 12 | Branch if negative
	STZ $01			  ; 64 01 | Store zero to zero page
	LDA #$00			 ; A9 00 | Read graphics status
	BNE $85			  ; D0 85 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0D7
; Address: $D3984E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0D7:
	JSL $C01295		  ; 22 95 12 C0 | Jump to subroutine long
	JMP $9870			; 4C 70 98 | Jump to address
	STZ $01			  ; 64 01 | Store zero to zero page
	LDA #$00			 ; A9 00 | Read graphics status
	BNE $85			  ; D0 85 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0D8
; Address: $D39864
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0D8:
	JSL $C01295		  ; 22 95 12 C0 | Jump to subroutine long
	LDA $00			  ; A5 00 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $00			  ; 85 00 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $00			  ; 85 00 | Update graphics data
	STA $02			  ; 85 02 | Update graphics data
	LDX #$02			 ; A2 02 | Load immediate value into X register
	LDA #$97			 ; A9 97 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0D9
; Address: $D39884
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0D9:
	JSL $C011E1		  ; 22 E1 11 C0 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Read graphics status
	STA $04			  ; 85 04 | Update graphics data
	LDA #$B0			 ; A9 B0 | Read graphics status
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	ASL $AD			  ; 06 AD | Arithmetic shift left (zero page)
	INY				  ; C8 | Increment Y register
	BMI $08			  ; 30 08 | Branch if negative
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	JMP $98A4			; 4C A4 98 | Jump to address
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $2A			  ; 90 2A | Branch if carry clear
	STA $04			  ; 85 04 | Update graphics data
	LDX #$04			 ; A2 04 | Load immediate value into X register
	LDA #$68			 ; A9 68 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0DB
; Address: $D398B0
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0DB:
	LDA $05			  ; A5 05 | Read graphics status
	BPL $04			  ; 10 04 | Branch if positive
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $04			  ; 85 04 | Update graphics data
	LDA #$71			 ; A9 71 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $04			  ; E5 04 | Subtract with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $04			  ; 85 04 | Update graphics data
	LDA #$C0			 ; A9 C0 | Read graphics status
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	SBC $04			  ; E5 04 | Subtract with carry (zero page)
	STA $06			  ; 85 06 | Update graphics data
	LDA $7FD4			; AD D4 7F | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	XBA				  ; EB | Exchange accumulator bytes
	STA $08			  ; 85 08 | Update graphics data
	LDA #$E0			 ; A9 E0 | Game work RAM access
	SEC				  ; 38 | Set carry flag
	SBC $04			  ; E5 04 | Subtract with carry (zero page)
	STA $0A			  ; 85 0A | Update graphics data
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0DC
; Address: $D398E3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0DC:
	JSL $C0121C		  ; 22 1C 12 C0 | Jump to subroutine long
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BNE $2B			  ; D0 2B | Branch if not equal
	LDA #$20			 ; A9 20 | Read graphics status
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0DD
; Address: $D398F4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0DD:
	JSL $C0121C		  ; 22 1C 12 C0 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	XBA				  ; EB | Exchange accumulator bytes
	AND #$3F			 ; 29 3F | Logical AND with accumulator (immediate)
	LDX $0A			  ; A6 0A | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0DE
; Address: $D398FF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0DE:
	JSL $C010B4		  ; 22 B4 10 C0 | Jump to subroutine long
	LDX $08			  ; A6 08 | Load from zero page into X register
	STX $0A			  ; 86 0A | Store X register to zero page
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0DF
; Address: $D3990A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0DF:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	LDA $0A			  ; A5 0A | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $0A			  ; 85 0A | Update graphics data
	JMP $992B			; 4C 2B 99 | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	LDA $7FD4			; AD D4 7F | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0E0
; Address: $D39921
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0E0:
	STA $0A			  ; 85 0A | Update graphics data
	LDA $08			  ; A5 08 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $08			  ; 85 08 | Update graphics data
	LDX #$10			 ; A2 10 | Load immediate value into X register
	CPX $04			  ; E4 04 | Compare X register (zero page)
	BCC $04			  ; 90 04 | Branch if carry clear
	CPX $06			  ; E4 06 | Compare X register (zero page)
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$00			 ; A9 00 | Read graphics status
	JMP $995C			; 4C 5C 99 | Jump to address
	LDA $0A			  ; A5 0A | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPX #$9D			 ; E0 9D | Compare X register (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	ADC $08			  ; 65 08 | Add with carry (zero page)
	STA $0A			  ; 85 0A | Update graphics data
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $08			  ; A5 08 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $08			  ; 85 08 | Update graphics data
	STY $0A			  ; 84 0A | Store Y register to zero page
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $EE65,X		  ; 9D 65 EE | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $02			  ; 85 02 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	ADC $7FA4			; 6D A4 7F | Add with carry (absolute)
	STA $6230,X		  ; 9D 30 62 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $7FA8			; 6D A8 7F | Add with carry (absolute)
	STA $65B0,X		  ; 9D B0 65 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$B0			 ; E0 B0 | Compare X register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDA $6B28			; AD 28 6B | Read graphics status
	LDA $6FCA			; AD CA 6F | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $6FCC			; ED CC 6F | Subtract with carry (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0E1
; Address: $D3998A
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0E1:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	ASL $8D			  ; 06 8D | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	JMP $99B7			; 4C B7 99 | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	STA $33C0			; 8D C0 33 | Update graphics data
	LDA $6FC8			; AD C8 6F | Read graphics status
	STA $33CE			; 8D CE 33 | Update graphics data
	LDA $6FCE			; AD CE 6F | Read graphics status
	STA $33D0			; 8D D0 33 | Update graphics data
	LDA $6FD0			; AD D0 6F | Read graphics status
	STA $33D2			; 8D D2 33 | Update graphics data
	LDA $6FCA			; AD CA 6F | Read graphics status
	STA $33D4			; 8D D4 33 | Update graphics data
	STZ $7FD4			; 9C D4 7F | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0E2
; Address: $D399B7
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0E2:
	LDX $6FCE			; AE CE 6F | Load from absolute address into X register
	LDA				  ; BF 09 9A C9 | Read graphics status
	BMI $0F			  ; 30 0F | Branch if negative
	STA $7FD4			; 8D D4 7F | Update graphics data
	LDA $7FD2			; AD D2 7F | Read graphics status
	AND #$7F			 ; 29 7F | Logical AND with accumulator (immediate)
	STA $7FD2			; 8D D2 7F | Update graphics data
	JMP $99DB			; 4C DB 99 | Jump to address
	STA $7FD4			; 8D D4 7F | Update graphics data
	LDA $7FD2			; AD D2 7F | Read graphics status
	ORA #$80			 ; 09 80 | Logical OR with accumulator (immediate)
	STA $7FD2			; 8D D2 7F | Update graphics data
	LDA				  ; BF 9E 00 C9 | Read graphics status
	STA $00			  ; 85 00 | Update graphics data
	LDA $6FCA			; AD CA 6F | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0E3
; Address: $D399E7
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0E3:
	JSL $C011E1		  ; 22 E1 11 C0 | Jump to subroutine long
	LDA $01			  ; A5 01 | Read graphics status
	STA $6FC8			; 8D C8 6F | Update graphics data
	LDA $6FD0			; AD D0 6F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6FD2			; 6D D2 6F | Add with carry (absolute)
	STA $6FD0			; 8D D0 6F | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $6FCE			; 6D CE 6F | Add with carry (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	DEC $6B6F			; CE 6F 6B | Decrement (absolute)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0E4
; Address: $D39A0F
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0E4:
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA $40			  ; 05 40 | Logical OR with accumulator (zero page)
	ORA $40			  ; 05 40 | Logical OR with accumulator (zero page)
	ASL $40			  ; 06 40 | Arithmetic shift left (zero page)
	ASL $40			  ; 06 40 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0E0F			; 0D 0F 0E | Logical OR with accumulator (absolute)
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA $1A0F,Y		  ; 19 0F 1A | Logical OR with accumulator (absolute,Y)
	ORA $1E0F,X		  ; 1D 0F 1E | Logical OR with accumulator (absolute,X)
	ASL $0D00			; 0E 00 0D | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0E			  ; 80 0E | Branch always

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0E5
; Address: $D39AAC
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0E5:
	BRA $0D			  ; 80 0D | Branch always
	BRA $0C			  ; 80 0C | Branch always
	BRA $0B			  ; 80 0B | Branch always
	BRA $0A			  ; 80 0A | Branch always
	BRA $09			  ; 80 09 | Branch always
	BRA $08			  ; 80 08 | Branch always
	BRA $07			  ; 80 07 | Branch always
	BRA $06			  ; 80 06 | Branch always
	BRA $05			  ; 80 05 | Branch always
	BRA $04			  ; 80 04 | Branch always
	BRA $03			  ; 80 03 | Branch always
	BRA $02			  ; 80 02 | Branch always
	BRA $01			  ; 80 01 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA $40			  ; 05 40 | Logical OR with accumulator (zero page)
	ORA $40			  ; 05 40 | Logical OR with accumulator (zero page)
	ASL $40			  ; 06 40 | Arithmetic shift left (zero page)
	ASL $40			  ; 06 40 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0E0F			; 0D 0F 0E | Logical OR with accumulator (absolute)
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA $1A0F,Y		  ; 19 0F 1A | Logical OR with accumulator (absolute,Y)
	ORA $1E0F,X		  ; 1D 0F 1E | Logical OR with accumulator (absolute,X)
	ASL $0D00			; 0E 00 0D | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0E6
; Address: $D39B85
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0E6:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0F			  ; 80 0F | Branch always
	BRA $0E			  ; 80 0E | Branch always
	BRA $0D			  ; 80 0D | Branch always
	BRA $0C			  ; 80 0C | Branch always
	BRA $0B			  ; 80 0B | Branch always
	BRA $0A			  ; 80 0A | Branch always
	BRA $09			  ; 80 09 | Branch always
	BRA $08			  ; 80 08 | Branch always
	BRA $07			  ; 80 07 | Branch always
	BRA $06			  ; 80 06 | Branch always
	BRA $05			  ; 80 05 | Branch always
	BRA $04			  ; 80 04 | Branch always
	BRA $03			  ; 80 03 | Branch always
	BRA $02			  ; 80 02 | Branch always
	BRA $01			  ; 80 01 | Branch always
	BRA $00			  ; 80 00 | Branch always
	BRA $00			  ; 80 00 | Branch always
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0F1
; Address: $D39C4F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0F1:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	LDA $33C0			; AD C0 33 | Read graphics status
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $F0			  ; D0 F0 | Branch if not equal
	LDA #$0E			 ; A9 0E | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0FA
; Address: $D39C8D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0FA:
	JSL $C0F206		  ; 22 06 F2 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0FB
; Address: $D39C99
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0FB:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0FE
; Address: $D39CAD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0FE:
	JSL $C99200		  ; 22 00 92 C9 | Jump to subroutine long
	JMP $C99C21		  ; 5C 21 9C C9 | Jump to address long
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_0FF
; Address: $D39CB9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_0FF:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_108
; Address: $D39CEA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_108:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	LDA $33C0			; AD C0 33 | Read graphics status
	BEQ $F3			  ; F0 F3 | Branch if equal
	LDA #$0E			 ; A9 0E | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_10E
; Address: $D39D10
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_10E:
	JSL $C0F206		  ; 22 06 F2 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_10F
; Address: $D39D1C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_10F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_112
; Address: $D39D30
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_112:
	JSL $C996B5		  ; 22 B5 96 C9 | Jump to subroutine long
	JMP $C99CCD		  ; 5C CD 9C C9 | Jump to address long
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_113
; Address: $D39D39
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_113:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_119
; Address: $D39D57
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_119:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	LDA $33C0			; AD C0 33 | Read graphics status
	BEQ $F3			  ; F0 F3 | Branch if equal

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_11E
; Address: $D39D6F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_11E:
	JSL $C0F206		  ; 22 06 F2 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_12D
; Address: $D39DD1
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_12D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_134
; Address: $D39DF4
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_134:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	LDA $33C0			; AD C0 33 | Read graphics status
	BEQ $F3			  ; F0 F3 | Branch if equal
	JMP $C99D64		  ; 5C 64 9D C9 | Jump to address long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_137
; Address: $D39E0A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_137:
	JSR $966F			; 20 6F 96 | Jump to subroutine
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDA #$10			 ; A9 10 | Read graphics status
	STA $6FD6			; 8D D6 6F | Update graphics data
	LDA #$10			 ; A9 10 | Read graphics status
	STA $6FD8			; 8D D8 6F | Update graphics data
	LDA #$02			 ; A9 02 | Read graphics status
	STA $6FDA			; 8D DA 6F | Update graphics data
	STZ $6FDC			; 9C DC 6F | Store zero to absolute
	STZ $33C0			; 9C C0 33 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_138
; Address: $D39E2C
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_138:
	JSR $966F			; 20 6F 96 | Jump to subroutine
	LDA $33CE			; AD CE 33 | Read graphics status
	STA $6FD4			; 8D D4 6F | Update graphics data
	LDA #$F0			 ; A9 F0 | Read graphics status
	STA $6FD6			; 8D D6 6F | Update graphics data
	LDA #$E0			 ; A9 E0 | Game work RAM access
	STA $6FD8			; 8D D8 6F | Update graphics data
	LDA #$FE			 ; A9 FE | Read graphics status
	STA $6FDA			; 8D DA 6F | Update graphics data
	STZ $6FDC			; 9C DC 6F | Store zero to absolute
	STZ $33C0			; 9C C0 33 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_139
; Address: $D39E4E
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_139:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	LDA $6FD4			; AD D4 6F | Read graphics status
	STA $00			  ; 85 00 | Update graphics data
	LDA #$D0			 ; A9 D0 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_13A
; Address: $D39E5B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_13A:
	JSL $C011E1		  ; 22 E1 11 C0 | Jump to subroutine long
	LDX $01			  ; A6 01 | Load from zero page into X register
	BMI $12			  ; 30 12 | Branch if negative
	STZ $01			  ; 64 01 | Store zero to zero page
	LDA #$00			 ; A9 00 | Read graphics status
	BNE $85			  ; D0 85 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_13B
; Address: $D39E6E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_13B:
	JSL $C01295		  ; 22 95 12 C0 | Jump to subroutine long
	JMP $9E90			; 4C 90 9E | Jump to address
	STZ $01			  ; 64 01 | Store zero to zero page
	LDA #$00			 ; A9 00 | Read graphics status
	BNE $85			  ; D0 85 | Branch if not equal
	TXA				  ; 8A | Transfer X register to accumulator
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_13C
; Address: $D39E84
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_13C:
	JSL $C01295		  ; 22 95 12 C0 | Jump to subroutine long
	LDA $00			  ; A5 00 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $00			  ; 85 00 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $00			  ; 85 00 | Update graphics data
	STA $02			  ; 85 02 | Update graphics data
	LDX #$02			 ; A2 02 | Load immediate value into X register
	LDA $6FD8			; AD D8 6F | Read graphics status
	STA $06			  ; 85 06 | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	SEC				  ; 38 | Set carry flag
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_13D
; Address: $D39EAE
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_13D:
	JSL $C011E1		  ; 22 E1 11 C0 | Jump to subroutine long
	LDA #$C0			 ; A9 C0 | Read graphics status
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	SBC $06			  ; E5 06 | Subtract with carry (zero page)
	STA $08			  ; 85 08 | Update graphics data
	STZ $04			  ; 64 04 | Store zero to zero page
	LDA $6FDC			; AD DC 6F | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_13E
; Address: $D39EC1
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_13E:
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA #$04			 ; A9 04 | Read graphics status
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	CPY $06			  ; C4 06 | Compare Y register (zero page)
	BCC $04			  ; 90 04 | Branch if carry clear
	CPY $08			  ; C4 08 | Compare Y register (zero page)
	BCC $18			  ; 90 18 | Branch if carry clear
	LDA $02			  ; A5 02 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $02			  ; 85 02 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	CPX $04			  ; E4 04 | Compare X register (zero page)
	STX $04			  ; 86 04 | Store X register to zero page
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA #$FF			 ; A9 FF | Read graphics status
	JMP $9F3C			; 4C 3C 9F | Jump to address
	LDA $7FA4			; AD A4 7F | Read graphics status
	STA $6230,Y		  ; 99 30 62 | Update graphics data
	LDA $7FA8			; AD A8 7F | Read graphics status
	STA $65B0,Y		  ; 99 B0 65 | Update graphics data
	LDA $7F9C			; AD 9C 7F | Read graphics status
	STA $6770,Y		  ; 99 70 67 | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	JMP $9F3C			; 4C 3C 9F | Jump to address
	CLC				  ; 18 | Clear carry flag
	ADC $7FA4			; 6D A4 7F | Add with carry (absolute)
	STA $6230,Y		  ; 99 30 62 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $7FA8			; 6D A8 7F | Add with carry (absolute)
	STA $65B0,Y		  ; 99 B0 65 | Update graphics data
	LDX $0A			  ; A6 0A | Load from zero page into X register
	LDA				  ; BF 1E 00 C9 | Read graphics status
	BMI $2B			  ; 30 2B | Branch if negative
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $7F9C			; 6D 9C 7F | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_13F
; Address: $D39F36
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_13F:
	STA $6770,Y		  ; 99 70 67 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $EE65,Y		  ; 99 65 EE | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	DEY				  ; 88 | Decrement Y register
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_140
; Address: $D39F48
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_140:
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	JMP $9F32			; 4C 32 9F | Jump to address
	LDA $6FD8			; AD D8 6F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6FDA			; 6D DA 6F | Add with carry (absolute)
	CMP #$E0			 ; C9 E0 | Game work RAM access
	BCS $2C			  ; B0 2C | Branch if carry set
	STA $6FD8			; 8D D8 6F | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	EOR #$0F			 ; 49 0F | Exclusive OR with accumulator (immediate)
	STA $7F88			; 8D 88 7F | Update graphics data
	LDA $6FD4			; AD D4 6F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6FD6			; 6D D6 6F | Add with carry (absolute)
	STA $6FD4			; 8D D4 6F | Update graphics data
	STA $33CE			; 8D CE 33 | Update graphics data
	LDA #$10			 ; A9 10 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_141
; Address: $D39F94
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_141:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	ADC $6FDC			; 6D DC 6F | Add with carry (absolute)
	STA $6FDC			; 8D DC 6F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_146
; Address: $D39FAF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_146:
	JSR $966F			; 20 6F 96 | Jump to subroutine
	LDA #$80			 ; A9 80 | Read graphics status
	STA $6FC4			; 8D C4 6F | Update graphics data
	LDA #$FE			 ; A9 FE | Read graphics status
	STA $6FC6			; 8D C6 6F | Update graphics data
	STZ $33C0			; 9C C0 33 | Store zero to absolute
	LDA #$10			 ; A9 10 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_14A
; Address: $D39FD1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_14A:
	JSR $966F			; 20 6F 96 | Jump to subroutine
	STZ $6FC4			; 9C C4 6F | Store zero to absolute
	LDA #$02			 ; A9 02 | Read graphics status
	STA $6FC6			; 8D C6 6F | Update graphics data
	STZ $33C0			; 9C C0 33 | Store zero to absolute
	LDA #$10			 ; A9 10 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_151
; Address: $D39FFC
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_151:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	LDA $6FC4			; AD C4 6F | Read graphics status
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $7FA8			; AD A8 7F | Read graphics status
	STA $02			  ; 85 02 | Update graphics data
	LDX #$28			 ; A2 28 | Load immediate value into X register
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	LDA				  ; BF 27 94 C9 | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ADC $02			  ; 65 02 | Add with carry (zero page)
	STA $65AE,Y		  ; 99 AE 65 | Update graphics data
	CPY #$68			 ; C0 68 | Compare Y register (immediate)
	BCC $E2			  ; 90 E2 | Branch if carry clear
	LDA				  ; BF 27 94 C9 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_152
; Address: $D3A032
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_152:
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $00			  ; 85 00 | Update graphics data
	LDA $02			  ; A5 02 | Read graphics status
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	STA $65AE,Y		  ; 99 AE 65 | Update graphics data
	CPY #$D0			 ; C0 D0 | Compare Y register (immediate)
	BCC $DE			  ; 90 DE | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack
	LDA $6FC4			; AD C4 6F | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6FC6			; 6D C6 6F | Add with carry (absolute)
	CMP #$7F			 ; C9 7F | Compare accumulator (immediate)
	BCS $04			  ; B0 04 | Branch if carry set
	STA $6FC4			; 8D C4 6F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_153
; Address: $D3A061
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_153:
	LDA #$01			 ; A9 01 | Read graphics status
	STA $33C0			; 8D C0 33 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_155
; Address: $D3A06B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_155:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_156
; Address: $D3A073
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_156:
	LDA $7FD0			; AD D0 7F | Read graphics status
	STA $33C8			; 8D C8 33 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7FD0			; 8D D0 7F | Update graphics data
	LDA $7FD2			; AD D2 7F | Read graphics status
	STA $33CA			; 8D CA 33 | Update graphics data
	LDA #$17			 ; A9 17 | Read graphics status
	STA $7FD2			; 8D D2 7F | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$30			 ; A2 30 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_157
; Address: $D3A091
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_157:
	JSL $C99057		  ; 22 57 90 C9 | Jump to subroutine long
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	ADC $A9			  ; 65 A9 | Add with carry (zero page)
	BMI $62			  ; 30 62 | Branch if negative

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_158
; Address: $D3A09B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_158:
	JSL $C0C973		  ; 22 73 C9 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_15D
; Address: $D3A0B2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_15D:
	JSL $C99057		  ; 22 57 90 C9 | Jump to subroutine long
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	ROR $A9			  ; 66 A9 | Rotate right (zero page)
	BEQ $63			  ; F0 63 | Branch if equal

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_15E
; Address: $D3A0BC
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_15E:
	JSL $C0C973		  ; 22 73 C9 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_15F
; Address: $D3A0C2
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_15F:
	LDA $33C8			; AD C8 33 | Read graphics status
	STA $7FD0			; 8D D0 7F | Update graphics data
	LDA $33CA			; AD CA 33 | Read graphics status
	STA $7FD2			; 8D D2 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_165
; Address: $D3A0E9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_165:
	JSL $C0C814		  ; 22 14 C8 C0 | Jump to subroutine long
	STZ $33D8			; 9C D8 33 | Store zero to absolute
	STZ $33DA			; 9C DA 33 | Store zero to absolute
	STZ $33DC			; 9C DC 33 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_16B
; Address: $D3A111
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_16B:
	JSL $C0C814		  ; 22 14 C8 C0 | Jump to subroutine long
	STZ $33D8			; 9C D8 33 | Store zero to absolute
	STZ $33DA			; 9C DA 33 | Store zero to absolute
	STZ $33DC			; 9C DC 33 | Store zero to absolute
	LDA #$10			 ; A9 10 | Read graphics status
	STA $7FD2			; 8D D2 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_177
; Address: $D3A159
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_177:
	JSL $C0C814		  ; 22 14 C8 C0 | Jump to subroutine long
	STZ $33D8			; 9C D8 33 | Store zero to absolute
	STZ $33DA			; 9C DA 33 | Store zero to absolute
	STZ $33DC			; 9C DC 33 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_178
; Address: $D3A167
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_178:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $EAC9,X		  ; BD C9 EA | Read graphics status
	STA $EAD9,X		  ; 9D D9 EA | Update graphics data
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $1D			  ; F0 1D | Branch if equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $18			  ; F0 18 | Branch if equal
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BEQ $13			  ; F0 13 | Branch if equal
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	BEQ $0E			  ; F0 0E | Branch if equal
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_179
; Address: $D3A18E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_179:
	JSL $C0C8B7		  ; 22 B7 C8 C0 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $D1			  ; 90 D1 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_17E
; Address: $D3A1AF
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_17E:
	JSL $C0C814		  ; 22 14 C8 C0 | Jump to subroutine long
	LDA #$13			 ; A9 13 | Read graphics status
	STA $7FD2			; 8D D2 7F | Update graphics data
	STZ $33D8			; 9C D8 33 | Store zero to absolute
	STZ $33DA			; 9C DA 33 | Store zero to absolute
	STZ $33DC			; 9C DC 33 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_185
; Address: $D3A1DE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_185:
	LDA $33D6			; AD D6 33 | Read graphics status
	STA $33D8			; 8D D8 33 | Update graphics data
	STA $33DA			; 8D DA 33 | Update graphics data
	STA $33DC			; 8D DC 33 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_187
; Address: $D3A1EF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_187:
	LDA $33D6			; AD D6 33 | Read graphics status
	STA $33D8			; 8D D8 33 | Update graphics data
	STA $33DA			; 8D DA 33 | Update graphics data
	STA $33DC			; 8D DC 33 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_189
; Address: $D3A200
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_189:
	LDA $33D6			; AD D6 33 | Read graphics status
	STA $33D8			; 8D D8 33 | Update graphics data
	STA $33DA			; 8D DA 33 | Update graphics data
	STA $33DC			; 8D DC 33 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_18A
; Address: $D3A20C
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_18A:
	JSL $C9A3E8		  ; 22 E8 A3 C9 | Jump to subroutine long
	LDA $6694			; AD 94 66 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $66AC			; 6D AC 66 | Add with carry (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $6694			; 8D 94 66 | Update graphics data
	LDA $6696			; AD 96 66 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $66AE			; 6D AE 66 | Add with carry (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $6696			; 8D 96 66 | Update graphics data
	LDA $6698			; AD 98 66 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $66B0			; 6D B0 66 | Add with carry (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $6698			; 8D 98 66 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_18B
; Address: $D3A238
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_18B:
	LDA $33D6			; AD D6 33 | Read graphics status
	STA $33D8			; 8D D8 33 | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $33DC			; 8D DC 33 | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $33DA			; 8D DA 33 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_18C
; Address: $D3A246
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_18C:
	JSL $C9A3E8		  ; 22 E8 A3 C9 | Jump to subroutine long
	LDA $6694			; AD 94 66 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $66AC			; 6D AC 66 | Add with carry (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $6694			; 8D 94 66 | Update graphics data
	LDA $6696			; AD 96 66 | Read graphics status
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_18D
; Address: $D3A25B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_18D:
	ADC $66AE			; 6D AE 66 | Add with carry (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $6696			; 8D 96 66 | Update graphics data
	LDA $6698			; AD 98 66 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $66B0			; 6D B0 66 | Add with carry (absolute)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $6698			; 8D 98 66 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_191
; Address: $D3A287
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_191:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	STA $66A0			; 8D A0 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_192
; Address: $D3A294
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_192:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	STA $66A2			; 8D A2 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_193
; Address: $D3A2A1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_193:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	STA $66A4			; 8D A4 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_197
; Address: $D3A2C3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_197:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	STA $66AC			; 8D AC 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_198
; Address: $D3A2D0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_198:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	STA $66AE			; 8D AE 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_199
; Address: $D3A2DD
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_199:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	STA $66B0			; 8D B0 66 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_19A
; Address: $D3A2EB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_19A:
	LDA $669A			; AD 9A 66 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $66A0			; 6D A0 66 | Add with carry (absolute)
	STA $669A			; 8D 9A 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_19B
; Address: $D3A2F5
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_19B:
	LDA $669C			; AD 9C 66 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $66A2			; 6D A2 66 | Add with carry (absolute)
	STA $669C			; 8D 9C 66 | Update graphics data
	LDA $669E			; AD 9E 66 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $66A4			; 6D A4 66 | Add with carry (absolute)
	STA $669E			; 8D 9E 66 | Update graphics data
	LDA $66A6			; AD A6 66 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $66AC			; 6D AC 66 | Add with carry (absolute)
	STA $66A6			; 8D A6 66 | Update graphics data
	LDA $66A8			; AD A8 66 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $66AE			; 6D AE 66 | Add with carry (absolute)
	STA $66A8			; 8D A8 66 | Update graphics data
	LDA $66AA			; AD AA 66 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $66B0			; 6D B0 66 | Add with carry (absolute)
	STA $66AA			; 8D AA 66 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_19E
; Address: $D3A331
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_19E:
	LDA $66A6			; AD A6 66 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 1E 00 C9 | Read graphics status
	STA $6694			; 8D 94 66 | Update graphics data
	LDA $66A8			; AD A8 66 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 1E 00 C9 | Read graphics status
	STA $6696			; 8D 96 66 | Update graphics data
	LDA $66AA			; AD AA 66 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA				  ; BF 1E 00 C9 | Read graphics status
	STA $6698			; 8D 98 66 | Update graphics data
	LDA $33D8			; AD D8 33 | Read graphics status
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 1F A8 C5 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_19F
; Address: $D3A36D
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_19F:
	STA $72			  ; 85 72 | Update graphics data
	LDA $33DA			; AD DA 33 | Read graphics status
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 1F A8 C5 | Read graphics status
	STA $74			  ; 85 74 | Update graphics data
	LDA $33DC			; AD DC 33 | Read graphics status
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 1F A8 C5 | Read graphics status
	STA $76			  ; 85 76 | Update graphics data
	LDA $669A			; AD 9A 66 | Read graphics status
	STA $78			  ; 85 78 | Update graphics data
	LDA $669C			; AD 9C 66 | Read graphics status
	STA $7A			  ; 85 7A | Update graphics data
	LDA $669E			; AD 9E 66 | Read graphics status
	STA $7C			  ; 85 7C | Update graphics data
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	LDA $78			  ; A5 78 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6694			; 6D 94 66 | Add with carry (absolute)
	STA $78			  ; 85 78 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$7E			 ; 29 7E | Logical AND with accumulator (immediate)
	ORA $72			  ; 05 72 | Logical OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 5F A8 C5 | Read graphics status
	STA $70			  ; 85 70 | Update graphics data
	LDA $7A			  ; A5 7A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6696			; 6D 96 66 | Add with carry (absolute)
	STA $7A			  ; 85 7A | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$7E			 ; 29 7E | Logical AND with accumulator (immediate)
	ORA $74			  ; 05 74 | Logical OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 5F B8 C5 | Read graphics status
	ORA $70			  ; 05 70 | Logical OR with accumulator (zero page)
	STA $6230,Y		  ; 99 30 62 | Update graphics data
	LDA $7C			  ; A5 7C | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6698			; 6D 98 66 | Add with carry (absolute)
	STA $7C			  ; 85 7C | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	AND #$7E			 ; 29 7E | Logical AND with accumulator (immediate)
	ORA $76			  ; 05 76 | Logical OR with accumulator (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 5F C8 C5 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1A0
; Address: $D3A3DD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1A0:
	STA $63F0,Y		  ; 99 F0 63 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$B0			 ; C0 B0 | Compare Y register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1A3
; Address: $D3A3F1
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1A3:
	JMP $A361			; 4C 61 A3 | Jump to address
	LDA #$00			 ; A9 00 | Read graphics status
	STA $669A			; 8D 9A 66 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	ROL				  ; 2A | Rotate left (accumulator)
	STA $669C			; 8D 9C 66 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $669E			; 8D 9E 66 | Update graphics data
	STZ $66A0			; 9C A0 66 | Store zero to absolute
	STZ $66A2			; 9C A2 66 | Store zero to absolute
	STZ $66A4			; 9C A4 66 | Store zero to absolute
	STZ $66A6			; 9C A6 66 | Store zero to absolute
	STZ $66A8			; 9C A8 66 | Store zero to absolute
	STZ $66AA			; 9C AA 66 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1A4
; Address: $D3A418
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1A4:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA $66AC			; 8D AC 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1A5
; Address: $D3A425
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1A5:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA $66AE			; 8D AE 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1A6
; Address: $D3A432
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1A6:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA $66B0			; 8D B0 66 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	ASL $8D			  ; 06 8D | Arithmetic shift left (zero page)
	ROR $8D			  ; 66 8D | Rotate right (zero page)
	ROR $8D			  ; 66 8D | Rotate right (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $6B			  ; 66 6B | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1A7
; Address: $D3A44C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1A7:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA $66AC			; 8D AC 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1A8
; Address: $D3A459
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1A8:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA $66AE			; 8D AE 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1AA
; Address: $D3A46A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1AA:
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	STA $66B0			; 8D B0 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1AB
; Address: $D3A473
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1AB:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	STA $66A0			; 8D A0 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1AC
; Address: $D3A480
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1AC:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	STA $66A2			; 8D A2 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1AD
; Address: $D3A48D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1AD:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	STA $66A4			; 8D A4 66 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1AE
; Address: $D3A49B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1AE:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDY #$66			 ; A0 66 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1AF
; Address: $D3A4A8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1AF:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDX #$66			 ; A2 66 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1B0
; Address: $D3A4B5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1B0:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDY $66			  ; A4 66 | Load from zero page into Y register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1B1
; Address: $D3A4C2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1B1:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$0C			 ; 29 0C | Logical AND with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	STA $66AC			; 8D AC 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1B2
; Address: $D3A4CF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1B2:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$0C			 ; 29 0C | Logical AND with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	STA $66AE			; 8D AE 66 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1B3
; Address: $D3A4DC
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1B3:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$0C			 ; 29 0C | Logical AND with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	STA $66B0			; 8D B0 66 | Update graphics data
	STZ $6694			; 9C 94 66 | Store zero to absolute
	STZ $6696			; 9C 96 66 | Store zero to absolute
	STZ $6698			; 9C 98 66 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1B4
; Address: $D3A4F3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1B4:
	LDA #$00			 ; A9 00 | Read graphics status
	STA $669A			; 8D 9A 66 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1B5
; Address: $D3A4FC
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1B5:
	STA $669C			; 8D 9C 66 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	ASL $9E8D			; 0E 8D 9E | Arithmetic shift left (absolute)
	ROR $A9			  ; 66 A9 | Rotate right (zero page)
	STA $66A0			; 8D A0 66 | Update graphics data
	STA $66A2			; 8D A2 66 | Update graphics data
	STA $66A4			; 8D A4 66 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	BPL $8D			  ; 10 8D | Branch if positive
	LDX $66			  ; A6 66 | Load from zero page into X register
	STA $66A8			; 8D A8 66 | Update graphics data
	STA $66AA			; 8D AA 66 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $66AC			; 8D AC 66 | Update graphics data
	STA $66AE			; 8D AE 66 | Update graphics data
	STA $66B0			; 8D B0 66 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1B6
; Address: $D3A52A
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1B6:
	JSL $C9A4F3		  ; 22 F3 A4 C9 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	SED				  ; F8 | Set decimal mode flag
	STA $66A0			; 8D A0 66 | Update graphics data
	STA $66A2			; 8D A2 66 | Update graphics data
	STA $66A4			; 8D A4 66 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDY $8D66			; AC 66 8D | Load from absolute address into Y register
	LDX $8D66			; AE 66 8D | Load from absolute address into X register
	BCS $66			  ; B0 66 | Branch if carry set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1B8
; Address: $D3A54B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1B8:
	JSL $C9A52A		  ; 22 2A A5 C9 | Jump to subroutine long
	LDA $7FD0			; AD D0 7F | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $7FD2			; AD D2 7F | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA #$18			 ; A9 18 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1BA
; Address: $D3A561
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1BA:
	JSL $C0C814		  ; 22 14 C8 C0 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	STA $7FD2			; 8D D2 7F | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $7FD0			; 8D D0 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1BB
; Address: $D3A56E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1BB:
	LDA $7FD0			; AD D0 7F | Read graphics status
	STA $33C8			; 8D C8 33 | Update graphics data
	LDA $7FD2			; AD D2 7F | Read graphics status
	STA $33CA			; 8D CA 33 | Update graphics data
	LDA #$18			 ; A9 18 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1C1
; Address: $D3A593
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1C1:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1C4
; Address: $D3A5A5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1C4:
	JSL $C9A5B0		  ; 22 B0 A5 C9 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1C5
; Address: $D3A5AB
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1C5:
	INC $C1AF			; EE AF C1 | Increment (absolute)
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1C6
; Address: $D3A5B0
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1C6:
	LDA $C1AF			; AD AF C1 | Read graphics status
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY $7FA8			; AC A8 7F | Load from absolute address into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	LDA $F3			  ; A5 F3 | Read graphics status
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BIT $C9A7			; 2C A7 C9 | Test bits in accumulator (absolute)
	STA $F3A9			; 8D A9 F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ROL $C9A7			; 2E A7 C9 | Rotate left (absolute)
	STA $F3AB			; 8D AB F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BMI $A7			  ; 30 A7 | Branch if negative
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	LDA $98F3			; AD F3 98 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	LDA $1898F3		  ; AF F3 98 18 | Read graphics status
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1C7
; Address: $D3A5F8
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1C7:
	LDA ($F3),Y		  ; B1 F3 | Read graphics status
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	LDA $98F3,Y		  ; B9 F3 98 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ROL $C9A7,X		  ; 3E A7 C9 | Rotate left (absolute,X)
	STA $F3BB			; 8D BB F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	LDA $98F3,X		  ; BD F3 98 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	WDM #$A7			 ; 42 A7 | Reserved instruction
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	LDA				  ; BF F3 98 18 | Read graphics status
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	CMP ($F3,X)		  ; C1 F3 | Compare accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	LSR $A7			  ; 46 A7 | Logical shift right (zero page)
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	CMP $F3			  ; C5 F3 | Compare accumulator (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	JMP $C9A7			; 4C A7 C9 | Jump to address
	STA $F3C9			; 8D C9 F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	LSR $C9A7			; 4E A7 C9 | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1C8
; Address: $D3A66C
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1C8:
	STA $F3CB			; 8D CB F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BVC $A7			  ; 50 A7 | Branch if overflow clear
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	CMP $98F3			; CD F3 98 | Compare accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	CMP ($F3),Y		  ; D1 F3 | Compare accumulator ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	PHY				  ; 5A | Push Y register to stack
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	JMP $8DC9A7		  ; 5C A7 C9 8D | Jump to address long
	CMP $98F3,Y		  ; D9 F3 98 | Compare accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	LSR $C9A7,X		  ; 5E A7 C9 | Logical shift right (absolute,X)
	STA $F3DB			; 8D DB F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1C9
; Address: $D3A6BC
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1C9:
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	CMP $98F3,X		  ; DD F3 98 | Compare accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	STZ $A7			  ; 64 A7 | Store zero to zero page
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	SBC ($F3,X)		  ; E1 F3 | Subtract with carry ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ROR $A7			  ; 66 A7 | Rotate right (zero page)
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1CA
; Address: $D3A6E2
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1CA:
	SBC $F3			  ; E5 F3 | Subtract with carry (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ROR				  ; 6A | Rotate right (accumulator)
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	JMP ($C9A7)		  ; 6C A7 C9 | Jump to address (absolute indirect)
	STA $F3E9			; 8D E9 F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ROR $C9A7			; 6E A7 C9 | Rotate right (absolute)
	STA $F3EB			; 8D EB F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BVS $A7			  ; 70 A7 | Branch if overflow set
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	SBC $98F3			; ED F3 98 | Subtract with carry (absolute)
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	SBC ($F3),Y		  ; F1 F3 | Subtract with carry ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1CC
; Address: $D3A72C
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1CC:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	SBC $00FF,X		  ; FD FF 00 | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FEFF,X		  ; FE FF FE | Increment (absolute,X)
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)
	INC $FDFF,X		  ; FE FF FD | Increment (absolute,X)
	SBC $00FF,X		  ; FD FF 00 | Subtract with carry (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1CD
; Address: $D3A7AE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1CD:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$1B			 ; A9 1B | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1CE
; Address: $D3A7BD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1CE:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1D1
; Address: $D3A7CF
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1D1:
	JSL $C9A7DA		  ; 22 DA A7 C9 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1D2
; Address: $D3A7D5
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1D2:
	INC $C1AF			; EE AF C1 | Increment (absolute)
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1D3
; Address: $D3A7DA
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1D3:
	LDA $C1AF			; AD AF C1 | Read graphics status
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY $7FA0			; AC A0 7F | Load from absolute address into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	PLP				  ; 28 | Pull processor status from stack
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	LDA $F3			  ; A5 F3 | Read graphics status
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BIT $C9A7			; 2C A7 C9 | Test bits in accumulator (absolute)
	STA $F3A9			; 8D A9 F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ROL $C9A7			; 2E A7 C9 | Rotate left (absolute)
	STA $F3AB			; 8D AB F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BMI $A7			  ; 30 A7 | Branch if negative
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	LDA $98F3			; AD F3 98 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	LDA $1898F3		  ; AF F3 98 18 | Read graphics status
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	LDA ($F3),Y		  ; B1 F3 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1D4
; Address: $D3A824
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1D4:
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	SEC				  ; 38 | Set carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	LDA $98F3,Y		  ; B9 F3 98 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ROL $C9A7,X		  ; 3E A7 C9 | Rotate left (absolute,X)
	STA $F3BB			; 8D BB F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	RTI				  ; 40 | Return from interrupt
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	LDA $98F3,X		  ; BD F3 98 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	WDM #$A7			 ; 42 A7 | Reserved instruction
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	LDA				  ; BF F3 98 18 | Read graphics status
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	CMP ($F3,X)		  ; C1 F3 | Compare accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	LSR $A7			  ; 46 A7 | Logical shift right (zero page)
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	PHA				  ; 48 | Push accumulator to stack
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	CMP $F3			  ; C5 F3 | Compare accumulator (zero page)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	JMP $C9A7			; 4C A7 C9 | Jump to address
	STA $F3C9			; 8D C9 F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	LSR $C9A7			; 4E A7 C9 | Logical shift right (absolute)
	STA $F3CB			; 8D CB F3 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1D5
; Address: $D3A899
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1D5:
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BVC $A7			  ; 50 A7 | Branch if overflow clear
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	CMP $98F3			; CD F3 98 | Compare accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	CMP ($F3),Y		  ; D1 F3 | Compare accumulator ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	PHY				  ; 5A | Push Y register to stack
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	JMP $8DC9A7		  ; 5C A7 C9 8D | Jump to address long
	CMP $98F3,Y		  ; D9 F3 98 | Compare accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	LSR $C9A7,X		  ; 5E A7 C9 | Logical shift right (absolute,X)
	STA $F3DB			; 8D DB F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1D6
; Address: $D3A8E6
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1D6:
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	CMP $98F3,X		  ; DD F3 98 | Compare accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	STZ $A7			  ; 64 A7 | Store zero to zero page
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	SBC ($F3,X)		  ; E1 F3 | Subtract with carry ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ROR $A7			  ; 66 A7 | Rotate right (zero page)
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	PLA				  ; 68 | Pull accumulator from stack
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	SBC $F3			  ; E5 F3 | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1D7
; Address: $D3A90E
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1D7:
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ROR				  ; 6A | Rotate right (accumulator)
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	JMP ($C9A7)		  ; 6C A7 C9 | Jump to address (absolute indirect)
	STA $F3E9			; 8D E9 F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ROR $C9A7			; 6E A7 C9 | Rotate right (absolute)
	STA $F3EB			; 8D EB F3 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	BVS $A7			  ; 70 A7 | Branch if overflow set
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	SBC $98F3			; ED F3 98 | Subtract with carry (absolute)
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)
	SBC ($F3),Y		  ; F1 F3 | Subtract with carry ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	CMP #$8D			 ; C9 8D | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1D9
; Address: $D3A952
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1D9:
	LDA $7FE37A		  ; AF 7A E3 7F | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX #$88			 ; A2 88 | Load immediate value into X register
	LDA $C039			; AD 39 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECA9			; 8E A9 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECAA			; 8D AA EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C03B			; AD 3B C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECAC			; 8E AC EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1DA
; Address: $D3A983
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1DA:
	STA $ECAD			; 8D AD EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C03D			; AD 3D C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECAF			; 8E AF EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECB0			; 8D B0 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C03F			; AD 3F C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECB2			; 8E B2 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECB3			; 8D B3 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C041			; AD 41 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECB5			; 8E B5 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECB6			; 8D B6 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C043			; AD 43 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECB8			; 8E B8 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECB9			; 8D B9 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1DB
; Address: $D3A9EB
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1DB:
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C045			; AD 45 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECBB			; 8E BB EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECBC			; 8D BC EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C047			; AD 47 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECBE			; 8E BE EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECBF			; 8D BF EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C049			; AD 49 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECC1			; 8E C1 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECC2			; 8D C2 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C04B			; AD 4B C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECC4			; 8E C4 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECC5			; 8D C5 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1DC
; Address: $D3AA53
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1DC:
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C04D			; AD 4D C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECC7			; 8E C7 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECC8			; 8D C8 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C04F			; AD 4F C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECCA			; 8E CA EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECCB			; 8D CB EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C051			; AD 51 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECCD			; 8E CD EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECCE			; 8D CE EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C053			; AD 53 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECD0			; 8E D0 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECD1			; 8D D1 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C055			; AD 55 C0 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1DD
; Address: $D3AABB
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1DD:
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECD3			; 8E D3 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECD4			; 8D D4 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C057			; AD 57 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECD6			; 8E D6 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECD7			; 8D D7 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C059			; AD 59 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECD9			; 8E D9 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECDA			; 8D DA EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C05B			; AD 5B C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECDC			; 8E DC EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECDD			; 8D DD EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C05D			; AD 5D C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECDF			; 8E DF EC | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1DE
; Address: $D3AB24
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1DE:
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECE0			; 8D E0 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C05F			; AD 5F C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECE2			; 8E E2 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECE3			; 8D E3 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C061			; AD 61 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECE5			; 8E E5 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECE6			; 8D E6 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C063			; AD 63 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECE8			; 8E E8 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECE9			; 8D E9 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C065			; AD 65 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECEB			; 8E EB EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1DF
; Address: $D3AB8C
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1DF:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECEC			; 8D EC EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C067			; AD 67 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECEE			; 8E EE EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECEF			; 8D EF EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C069			; AD 69 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECF1			; 8E F1 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECF2			; 8D F2 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C06B			; AD 6B C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECF4			; 8E F4 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECF5			; 8D F5 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C06D			; AD 6D C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECF7			; 8E F7 EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1E0
; Address: $D3ABF4
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1E0:
	STA $ECF8			; 8D F8 EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C06F			; AD 6F C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECFA			; 8E FA EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECFB			; 8D FB EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C071			; AD 71 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ECFD			; 8E FD EC | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ECFE			; 8D FE EC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C073			; AD 73 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED00			; 8E 00 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED01			; 8D 01 ED | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C075			; AD 75 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED03			; 8E 03 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED04			; 8D 04 ED | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1E1
; Address: $D3AC5C
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1E1:
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C077			; AD 77 C0 | Read graphics status
	BNE $0E			  ; D0 0E | Branch if not equal
	STX $ED06			; 8E 06 ED | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$A5			 ; 69 A5 | Add with carry (immediate)
	STA $ED07			; 8D 07 ED | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$08			 ; 69 08 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1E3
; Address: $D3AC7E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1E3:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1E5
; Address: $D3AC8C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1E5:
	JSL $C99057		  ; 22 57 90 C9 | Jump to subroutine long
	LDY #$B0			 ; A0 B0 | Load immediate value into Y register
	ADC $A9			  ; 65 A9 | Add with carry (zero page)
	BMI $62			  ; 30 62 | Branch if negative

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1E6
; Address: $D3AC96
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1E6:
	JSL $C0C973		  ; 22 73 C9 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1E8
; Address: $D3AC9F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1E8:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1EA
; Address: $D3ACAD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1EA:
	JSL $C99057		  ; 22 57 90 C9 | Jump to subroutine long
	LDY #$10			 ; A0 10 | Load immediate value into Y register
	ROR $A9			  ; 66 A9 | Rotate right (zero page)
	BEQ $63			  ; F0 63 | Branch if equal

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1EB
; Address: $D3ACB7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1EB:
	JSL $C0C973		  ; 22 73 C9 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1ED
; Address: $D3ACC0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1ED:
	JSL $C0C913		  ; 22 13 C9 C0 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1F0
; Address: $D3ACCE
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1F0:
	JSL $C99057		  ; 22 57 90 C9 | Jump to subroutine long
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	ROR $A9			  ; 66 A9 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1F1
; Address: $D3ACD8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1F1:
	JSL $C0C973		  ; 22 73 C9 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1F4
; Address: $D3ACE6
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1F4:
	JSL $C97F71		  ; 22 71 7F C9 | Jump to subroutine long
	LDA #$3C			 ; A9 3C | Read graphics status
	STA $33DC			; 8D DC 33 | Update graphics data
	STZ $33D6			; 9C D6 33 | Store zero to absolute
	STZ $66D0			; 9C D0 66 | Store zero to absolute
	LDA #$C0			 ; A9 C0 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $00			  ; 85 00 | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$BC			 ; A0 BC | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1F5
; Address: $D3AD02
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1F5:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $6A			  ; D0 6A | Branch if not equal

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1F6
; Address: $D3AD0B
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1F6:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $6AA4,Y		  ; 99 A4 6A | Update graphics data
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	STA $6AA4,X		  ; 9D A4 6A | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $6AA6,X		  ; 9D A6 6A | Update graphics data
	LDA $6AA4,X		  ; BD A4 6A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $6AA4,X		  ; 9D A4 6A | Update graphics data
	LDA $6AA6,X		  ; BD A6 6A | Read graphics status
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	STA $6AA6,X		  ; 9D A6 6A | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $6AA6,Y		  ; 99 A6 6A | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $6924,X		  ; 9D 24 69 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $6922,X		  ; 9D 22 69 | Update graphics data
	STA $6922,Y		  ; 99 22 69 | Update graphics data
	STA $6924,Y		  ; 99 24 69 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1F7
; Address: $D3AD4F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1F7:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $6923,Y		  ; 99 23 69 | Update graphics data
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1F8
; Address: $D3AD5C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1F8:
	STA $6923,X		  ; 9D 23 69 | Update graphics data
	LDA $6923,X		  ; BD 23 69 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $6923,X		  ; 9D 23 69 | Update graphics data
	LDA $6925,X		  ; BD 25 69 | Read graphics status
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	STA $6925,X		  ; 9D 25 69 | Update graphics data
	JMP $ADDC			; 4C DC AD | Jump to address

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1F9
; Address: $D3AD75
; Size: 60 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1F9:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $6AA4,X		  ; 9D A4 6A | Update graphics data
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	STA $6AA4,Y		  ; 99 A4 6A | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $6AA6,Y		  ; 99 A6 6A | Update graphics data
	LDA $6AA4,Y		  ; B9 A4 6A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $6AA4,Y		  ; 99 A4 6A | Update graphics data
	LDA $6AA6,Y		  ; B9 A6 6A | Read graphics status
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	STA $6AA6,Y		  ; 99 A6 6A | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $6AA6,X		  ; 9D A6 6A | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $6922,X		  ; 9D 22 69 | Update graphics data
	STA $6924,X		  ; 9D 24 69 | Update graphics data
	STA $6922,Y		  ; 99 22 69 | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $6924,Y		  ; 99 24 69 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1FA
; Address: $D3ADB9
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1FA:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $6923,X		  ; 9D 23 69 | Update graphics data
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	STA $6923,Y		  ; 99 23 69 | Update graphics data
	LDA $6923,Y		  ; B9 23 69 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $6923,Y		  ; 99 23 69 | Update graphics data
	LDA $6925,Y		  ; B9 25 69 | Read graphics status
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	STA $6925,Y		  ; 99 25 69 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1FC
; Address: $D3ADE2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1FC:
	JSR $FF29			; 20 29 FF | Jump to subroutine
	STA $6B64,Y		  ; 99 64 6B | Update graphics data
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1FD
; Address: $D3ADEC
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1FD:
	STA $6B64,X		  ; 9D 64 6B | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $6B66,X		  ; 9D 66 6B | Update graphics data
	LDA $6B64,X		  ; BD 64 6B | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $6B64,X		  ; 9D 64 6B | Update graphics data
	LDA $6B66,X		  ; BD 66 6B | Read graphics status
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	STA $6B66,X		  ; 9D 66 6B | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $6B66,Y		  ; 99 66 6B | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1FE
; Address: $D3AE0E
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1FE:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $A9			  ; 80 A9 | Branch always
	STA $69E4,Y		  ; 99 E4 69 | Update graphics data
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	STA $69E4,X		  ; 9D E4 69 | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $69E6,X		  ; 9D E6 69 | Update graphics data
	LDA $69E4,X		  ; BD E4 69 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $69E4,X		  ; 9D E4 69 | Update graphics data
	LDA $69E6,X		  ; BD E6 69 | Read graphics status
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	STA $69E6,X		  ; 9D E6 69 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $69E6,Y		  ; 99 E6 69 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $67A2,X		  ; 9D A2 67 | Update graphics data
	STA $67A4,X		  ; 9D A4 67 | Update graphics data
	STA $67A2,Y		  ; 99 A2 67 | Update graphics data
	STA $67A4,Y		  ; 99 A4 67 | Update graphics data
	STA $6862,X		  ; 9D 62 68 | Update graphics data
	STA $6864,X		  ; 9D 64 68 | Update graphics data
	STA $6862,Y		  ; 99 62 68 | Update graphics data
	STA $6864,Y		  ; 99 64 68 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $66E2,X		  ; 9D E2 66 | Update graphics data
	STA $66E4,X		  ; 9D E4 66 | Update graphics data
	STA $66E2,Y		  ; 99 E2 66 | Update graphics data
	STA $66E4,Y		  ; 99 E4 66 | Update graphics data
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_1FF
; Address: $D3AE71
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_1FF:
	INX				  ; E8 | Increment X register
	CPX $00			  ; E4 00 | Compare X register (zero page)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $AD02			; 4C 02 AD | Jump to address
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $66DA			; 8D DA 66 | Update graphics data
	STA $66DC			; 8D DC 66 | Update graphics data
	STA $66DE			; 8D DE 66 | Update graphics data
	STZ $66E0			; 9C E0 66 | Store zero to absolute
	STA $66D2			; 8D D2 66 | Update graphics data
	STA $66D4			; 8D D4 66 | Update graphics data
	STA $66D6			; 8D D6 66 | Update graphics data
	STZ $66D8			; 9C D8 66 | Store zero to absolute
	LDA #$1C			 ; A9 1C | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_202
; Address: $D3AEA5
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_202:
	JSL $C0C814		  ; 22 14 C8 C0 | Jump to subroutine long
	LDA $7FBA			; AD BA 7F | Read graphics status
	STA $33C2			; 8D C2 33 | Update graphics data
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	STA $7FBA			; 8D BA 7F | Update graphics data
	LDA $7FBC			; AD BC 7F | Read graphics status
	STA $33C4			; 8D C4 33 | Update graphics data
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	STA $7FBC			; 8D BC 7F | Update graphics data
	LDA $7FBE			; AD BE 7F | Read graphics status
	STA $33C6			; 8D C6 33 | Update graphics data
	AND #$CC			 ; 29 CC | Logical AND with accumulator (immediate)
	STA $7FBE			; 8D BE 7F | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_20B
; Address: $D3AEF7
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_20B:
	JSL $C9778B		  ; 22 8B 77 C9 | Jump to subroutine long
	LDA $33DC			; AD DC 33 | Read graphics status
	STA $02			  ; 85 02 | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $6864,Y		  ; B9 64 68 | Read graphics status
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_20C
; Address: $D3AF08
; Size: 120 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_20C:
	CLC				  ; 18 | Clear carry flag
	ADC $02			  ; 65 02 | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA $F5D5,X		  ; BD D5 F5 | Read graphics status
	BNE $2A			  ; D0 2A | Branch if not equal
	LDA $67A4,Y		  ; B9 A4 67 | Read graphics status
	STA $04			  ; 85 04 | Update graphics data
	ADC #$A0			 ; 69 A0 | Add with carry (immediate)
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	ORA $DA0A,X		  ; 1D 0A DA | Logical OR with accumulator (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 29 B0 C9 | Read graphics status
	PLX				  ; FA | Pull X register from stack
	STA $F5D5,X		  ; 9D D5 F5 | Update graphics data
	LDA $7FA0			; AD A0 7F | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $04			  ; E5 04 | Subtract with carry (zero page)
	STA $63F0,X		  ; 9D F0 63 | Update graphics data
	LDA $7FA8			; AD A8 7F | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	STA $6230,X		  ; 9D 30 62 | Update graphics data
	LDA $66E2,Y		  ; B9 E2 66 | Read graphics status
	BEQ $4F			  ; F0 4F | Branch if equal
	LDA $67A2,Y		  ; B9 A2 67 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6922,Y		  ; 79 22 69 | Add with carry (absolute,Y)
	STA $67A2,Y		  ; 99 A2 67 | Update graphics data
	LDA $67A4,Y		  ; B9 A4 67 | Read graphics status
	ADC $6924,Y		  ; 79 24 69 | Add with carry (absolute,Y)
	STA $67A4,Y		  ; 99 A4 67 | Update graphics data
	LDA $6922,Y		  ; B9 22 69 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $6AA4,Y		  ; 79 A4 6A | Add with carry (absolute,Y)
	STA $6922,Y		  ; 99 22 69 | Update graphics data
	LDA $6924,Y		  ; B9 24 69 | Read graphics status
	ADC $6AA6,Y		  ; 79 A6 6A | Add with carry (absolute,Y)
	STA $6924,Y		  ; 99 24 69 | Update graphics data
	LDA $6862,Y		  ; B9 62 68 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $69E4,Y		  ; 79 E4 69 | Add with carry (absolute,Y)
	STA $6862,Y		  ; 99 62 68 | Update graphics data
	LDA $6864,Y		  ; B9 64 68 | Read graphics status
	ADC $69E6,Y		  ; 79 E6 69 | Add with carry (absolute,Y)
	STA $6864,Y		  ; 99 64 68 | Update graphics data
	LDA $69E4,Y		  ; B9 E4 69 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_20D
; Address: $D3AF82
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_20D:
	CLC				  ; 18 | Clear carry flag
	ADC $6B64,Y		  ; 79 64 6B | Add with carry (absolute,Y)
	STA $69E4,Y		  ; 99 E4 69 | Update graphics data
	LDA $69E6,Y		  ; B9 E6 69 | Read graphics status
	ADC $6B66,Y		  ; 79 66 6B | Add with carry (absolute,Y)
	STA $69E6,Y		  ; 99 E6 69 | Update graphics data
	JMP $AFCA			; 4C CA AF | Jump to address

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_20E
; Address: $D3AF95
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_20E:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	STA $6864,Y		  ; 99 64 68 | Update graphics data
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $0A			  ; F0 0A | Branch if equal
	LDA $6864,Y		  ; B9 64 68 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $6864,Y		  ; 99 64 68 | Update graphics data
	ORA ($EB,X)		  ; 01 EB | Logical OR with accumulator ((zero page,X))
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	STA $67A4,Y		  ; 99 A4 67 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BPL $F0			  ; 10 F0 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA $67A4,Y		  ; B9 A4 67 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $67A4,Y		  ; 99 A4 67 | Update graphics data
	INC $02			  ; E6 02 | Increment (zero page)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $AF03			; 4C 03 AF | Jump to address
	LDA $66DA			; AD DA 66 | Read graphics status
	STA $00			  ; 85 00 | Update graphics data
	LDA $66DC			; AD DC 66 | Read graphics status
	STA $02			  ; 85 02 | Update graphics data
	LDA $66DE			; AD DE 66 | Read graphics status
	STA $04			  ; 85 04 | Update graphics data
	LDA $66E0			; AD E0 66 | Read graphics status
	STA $06			  ; 85 06 | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_20F
; Address: $D3AFEF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_20F:
	JSL $C01396		  ; 22 96 13 C0 | Jump to subroutine long
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_210
; Address: $D3AFF8
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_210:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$01			 ; A9 01 | Read graphics status
	STA $66E2,X		  ; 9D E2 66 | Update graphics data
	STZ $00			  ; 64 00 | Store zero to zero page
	STZ $02			  ; 64 02 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $06			  ; 64 06 | Store zero to zero page
	SEC				  ; 38 | Set carry flag
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $02			  ; 26 02 | Rotate left (zero page)
	ROL $04			  ; 26 04 | Rotate left (zero page)
	ROL $06			  ; 26 06 | Rotate left (zero page)
	DEY				  ; 88 | Decrement Y register
	BPL $F5			  ; 10 F5 | Branch if positive
	LDA $00			  ; A5 00 | Read graphics status
	PHX				  ; DA | Push X register to stack
	ROR $A5			  ; 66 A5 | Rotate right (zero page)
	ROR $A5			  ; 66 A5 | Rotate right (zero page)
	DEC $A566,X		  ; DE 66 A5 | Decrement (absolute,X)
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	CPX #$66			 ; E0 66 | Compare X register (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_211
; Address: $D3B02A
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_211:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0E00			; 0D 00 0E | Logical OR with accumulator (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA $1A00,Y		  ; 19 00 1A | Logical OR with accumulator (absolute,Y)
	ORA $1E00,X		  ; 1D 00 1E | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_213
; Address: $D3B06C
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_213:
	JSL $002300		  ; 22 00 23 00 | Jump to subroutine long
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2D00			; 2C 00 2D | Test bits in accumulator (absolute)
	ROL $2F00			; 2E 00 2F | Rotate left (absolute)
	BMI $00			  ; 30 00 | Branch if negative
	AND ($00),Y		  ; 31 00 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	AND $3A00,Y		  ; 39 00 3A | Logical AND with accumulator (absolute,Y)
	AND $3E00,X		  ; 3D 00 3E | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_214
; Address: $D3B0A8
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_214:
	RTI				  ; 40 | Return from interrupt
	ORA ($41,X)		  ; 01 41 | Logical OR with accumulator ((zero page,X))
	WDM #$03			 ; 42 03 | Reserved instruction
	ORA $45			  ; 05 45 | Logical OR with accumulator (zero page)
	ASL $46			  ; 06 46 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA #$49			 ; 09 49 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4D0D			; 4C 0D 4D | Jump to address
	ASL $0F4E			; 0E 4E 0F | Arithmetic shift left (absolute)
	BPL $50			  ; 10 50 | Branch if positive
	ORA ($51),Y		  ; 11 51 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	ORA $1A59,Y		  ; 19 59 1A | Logical OR with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	JMP $1E5D1D		  ; 5C 1D 5D 1E | Jump to address long
	LSR $5F1F,X		  ; 5E 1F 5F | Logical shift right (absolute,X)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_215
; Address: $D3B0E7
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_215:
	JSR $2160			; 20 60 21 | PPU graphics register access
	ADC ($22,X)		  ; 61 22 | Add with carry ((zero page,X))
	BIT $64			  ; 24 64 | Test bits in accumulator (zero page)
	AND $65			  ; 25 65 | Logical AND with accumulator (zero page)
	ROL $66			  ; 26 66 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	AND #$69			 ; 29 69 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_216
; Address: $D3B0FF
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_216:
	BIT $2D6C			; 2C 6C 2D | Test bits in accumulator (absolute)
	ADC $6E2E			; 6D 2E 6E | Add with carry (absolute)
	BMI $70			  ; 30 70 | Branch if negative
	AND ($71),Y		  ; 31 71 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	SEI				  ; 78 | Set interrupt disable flag
	AND $3A79,Y		  ; 39 79 3A | Logical AND with accumulator (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	AND $3E7D,X		  ; 3D 7D 3E | Logical AND with accumulator (absolute,X)
	ROR $7F3F,X		  ; 7E 3F 7F | Rotate right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	BRA $41			  ; 80 41 | Branch always
	STA ($42,X)		  ; 81 42 | Hardware register operation
	STY $45			  ; 84 45 | Store Y register to zero page
	STA $46			  ; 85 46 | Update graphics data
	STX $47			  ; 86 47 | Store X register to zero page
	PHA				  ; 48 | Push accumulator to stack
	DEY				  ; 88 | Decrement Y register
	EOR #$89			 ; 49 89 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_217
; Address: $D3B13B
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_217:
	LSR				  ; 4A | Logical shift right (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	JMP $4D8C			; 4C 8C 4D | Jump to address
	STA $8E4E			; 8D 4E 8E | Update graphics data
	STA $519050		  ; 8F 50 90 51 | Update graphics data
	STA ($52),Y		  ; 91 52 | Update graphics data
	CLI				  ; 58 | Clear interrupt disable flag
	TYA				  ; 98 | Transfer Y register to accumulator
	EOR $5A99,Y		  ; 59 99 5A | Exclusive OR with accumulator (absolute,Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	JMP $9D5D9C		  ; 5C 9C 5D 9D | Jump to address long
	LSR $5F9E,X		  ; 5E 9E 5F | Logical shift right (absolute,X)
	STA				  ; 9F 60 A0 61 | Update graphics data
	LDA ($62,X)		  ; A1 62 | Read graphics status
	LDX #$63			 ; A2 63 | Load immediate value into X register
	STZ $A4			  ; 64 A4 | Store zero to zero page
	ADC $A5			  ; 65 A5 | Add with carry (zero page)
	ROR $A6			  ; 66 A6 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC #$A9			 ; 69 A9 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_218
; Address: $D3B17E
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_218:
	PLB				  ; AB | Pull data bank register from stack
	JMP ($6DAC)		  ; 6C AC 6D | Jump to address (absolute indirect)
	LDA $AE6E			; AD 6E AE | Read graphics status
	LDA $71B070		  ; AF 70 B0 71 | Read graphics status
	LDA ($72),Y		  ; B1 72 | Read graphics status
	SEI				  ; 78 | Set interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	ADC $7AB9,Y		  ; 79 B9 7A | Add with carry (absolute,Y)
	TSX				  ; BA | Transfer stack pointer to X register
	LDY $BD7D,X		  ; BC 7D BD | Load from absolute,X into Y register
	ROR $7FBE,X		  ; 7E BE 7F | Rotate right (absolute,X)
	LDA				  ; BF 80 C0 81 | Read graphics status
	CMP ($82,X)		  ; C1 82 | Compare accumulator ((zero page,X))
	REP #$83			 ; C2 83 | Reset processor status bits
	STY $C4			  ; 84 C4 | Store Y register to zero page
	STA $C5			  ; 85 C5 | Update graphics data
	STX $C6			  ; 86 C6 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	INY				  ; C8 | Increment Y register
	BIT #$C9			 ; 89 C9 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	DEX				  ; CA | Decrement X register
	PHB				  ; 8B | Push data bank register to stack
	STY $8DCC			; 8C CC 8D | Store Y register to absolute address
	CMP $CE8E			; CD 8E CE | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_219
; Address: $D3B1C5
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_219:
	STA $D090CF		  ; 8F CF 90 D0 | Update graphics data
	STA ($D1),Y		  ; 91 D1 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	CLD				  ; D8 | Clear decimal mode flag
	STA $9AD9,Y		  ; 99 D9 9A | Update graphics data
	PHX				  ; DA | Push X register to stack
	STZ $9DDC			; 9C DC 9D | Store zero to absolute
	CMP $DE9E,X		  ; DD 9E DE | Compare accumulator (absolute,X)
	STA				  ; 9F DF A0 E0 | Update graphics data
	LDA ($E1,X)		  ; A1 E1 | Read graphics status
	LDX #$E2			 ; A2 E2 | Load immediate value into X register
	LDY $E4			  ; A4 E4 | Load from zero page into Y register
	LDA $E5			  ; A5 E5 | Read graphics status
	LDX $E6			  ; A6 E6 | Load from zero page into X register
	TAY				  ; A8 | Transfer accumulator to Y register
	INX				  ; E8 | Increment X register
	LDA #$E9			 ; A9 E9 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	NOP				  ; EA | No operation
	PLB				  ; AB | Pull data bank register from stack
	XBA				  ; EB | Exchange accumulator bytes
	LDY $ADEC			; AC EC AD | Load from absolute address into Y register
	SBC $EEAE			; ED AE EE | Subtract with carry (absolute)
	LDA $F0B0EF		  ; AF EF B0 F0 | Read graphics status
	LDA ($F1),Y		  ; B1 F1 | Read graphics status
	PEA #$F5B5		   ; F4 B5 F5 | Push effective address to stack
	CLV				  ; B8 | Clear overflow flag
	SED				  ; F8 | Set decimal mode flag
	LDA $BAF9,Y		  ; B9 F9 BA | Read graphics status
	PLX				  ; FA | Pull X register from stack
	LDY $BDFC,X		  ; BC FC BD | Load from absolute,X into Y register
	SBC $FEBE,X		  ; FD BE FE | Subtract with carry (absolute,X)
	LDA				  ; BF FF C0 FF | Read graphics status
	CMP ($FF,X)		  ; C1 FF | Compare accumulator ((zero page,X))
	REP #$FF			 ; C2 FF | Reset processor status bits
	CPY $FF			  ; C4 FF | Compare Y register (zero page)
	CMP $FF			  ; C5 FF | Compare accumulator (zero page)
	DEC $FF			  ; C6 FF | Decrement (zero page)
	INY				  ; C8 | Increment Y register
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	DEX				  ; CA | Decrement X register
	CPY $CDFF			; CC FF CD | Compare Y register (absolute)
	DEC $CFFF			; CE FF CF | Decrement (absolute)
	BNE $FF			  ; D0 FF | Branch if not equal
	CMP ($FF),Y		  ; D1 FF | Compare accumulator ((zero page),Y)
	CLD				  ; D8 | Clear decimal mode flag
	CMP $DAFF,Y		  ; D9 FF DA | Compare accumulator (absolute,Y)
	CMP $DEFF,X		  ; DD FF DE | Compare accumulator (absolute,X)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	SBC ($FF,X)		  ; E1 FF | Subtract with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_21A
; Address: $D3B26B
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_21A:
	SEP #$FF			 ; E2 FF | Set processor status bits
	CPX $FF			  ; E4 FF | Compare X register (zero page)
	SBC $FF			  ; E5 FF | Subtract with carry (zero page)
	INC $FF			  ; E6 FF | Increment (zero page)
	INX				  ; E8 | Increment X register
	SBC #$FF			 ; E9 FF | Subtract with carry (immediate)
	NOP				  ; EA | No operation
	XBA				  ; EB | Exchange accumulator bytes
	CPX $EDFF			; EC FF ED | Compare X register (absolute)
	INC $EFFF			; EE FF EF | Increment (absolute)
	BEQ $FF			  ; F0 FF | Branch if equal
	SBC ($FF),Y		  ; F1 FF | Subtract with carry ((zero page),Y)
	PEA #$F5FF		   ; F4 FF F5 | Push effective address to stack
	SED				  ; F8 | Set decimal mode flag
	SBC $FAFF,Y		  ; F9 FF FA | Subtract with carry (absolute,Y)
	SBC $FEFF,X		  ; FD FF FE | Subtract with carry (absolute,X)
	LDA $66D0			; AD D0 66 | Read graphics status
	BNE $06			  ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_21C
; Address: $D3B2B2
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_21C:
	JSL $C9778B		  ; 22 8B 77 C9 | Jump to subroutine long
	LDA $33DC			; AD DC 33 | Read graphics status
	STA $02			  ; 85 02 | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $6864,Y		  ; B9 64 68 | Read graphics status
	STA $00			  ; 85 00 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $02			  ; 65 02 | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	CPX #$C0			 ; E0 C0 | Compare X register (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA $F5D5,X		  ; BD D5 F5 | Read graphics status
	BNE $2A			  ; D0 2A | Branch if not equal
	LDA $67A4,Y		  ; B9 A4 67 | Read graphics status
	STA $04			  ; 85 04 | Update graphics data
	ADC #$A0			 ; 69 A0 | Add with carry (immediate)
	CMP #$40			 ; C9 40 | Compare accumulator (immediate)
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	ORA $DA0A,X		  ; 1D 0A DA | Logical OR with accumulator (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 29 B0 C9 | Read graphics status
	PLX				  ; FA | Pull X register from stack
	STA $F5D5,X		  ; 9D D5 F5 | Update graphics data
	LDA $7FA0			; AD A0 7F | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $04			  ; E5 04 | Subtract with carry (zero page)
	STA $63F0,X		  ; 9D F0 63 | Update graphics data
	LDA $7FA8			; AD A8 7F | Read graphics status
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_21D
; Address: $D3B2F7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_21D:
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	STA $6230,X		  ; 9D 30 62 | Update graphics data
	LDA $66E4,Y		  ; B9 E4 66 | Read graphics status
	BEQ $34			  ; F0 34 | Branch if equal

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_21E
; Address: $D3B301
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_21E:
	JSL $C01383		  ; 22 83 13 C0 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	STA $67A4,Y		  ; 99 A4 67 | Update graphics data
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	BPL $00			  ; 10 00 | Branch if positive
	BEQ $0A			  ; F0 0A | Branch if equal
	LDA $67A4,Y		  ; B9 A4 67 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $67A4,Y		  ; 99 A4 67 | Update graphics data
	ORA ($29,X)		  ; 01 29 | Logical OR with accumulator ((zero page,X))
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	STZ $68			  ; 64 68 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BPL $F0			  ; 10 F0 | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA $6864,Y		  ; B9 64 68 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $6864,Y		  ; 99 64 68 | Update graphics data
	INC $02			  ; E6 02 | Increment (zero page)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$C0			 ; C0 C0 | Compare Y register (immediate)
	BCS $03			  ; B0 03 | Branch if carry set
	JMP $B2BE			; 4C BE B2 | Jump to address
	INC $66D0			; EE D0 66 | Increment (absolute)
	LDA $66D0			; AD D0 66 | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $50			  ; D0 50 | Branch if not equal
	LDA $66D2			; AD D2 66 | Read graphics status
	STA $00			  ; 85 00 | Update graphics data
	LDA $66D4			; AD D4 66 | Read graphics status
	STA $02			  ; 85 02 | Update graphics data
	LDA $66D6			; AD D6 66 | Read graphics status
	STA $04			  ; 85 04 | Update graphics data
	LDA $66D8			; AD D8 66 | Read graphics status
	STA $06			  ; 85 06 | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_21F
; Address: $D3B365
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_21F:
	JSL $C01396		  ; 22 96 13 C0 | Jump to subroutine long
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_220
; Address: $D3B36D
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_220:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$01			 ; A9 01 | Read graphics status
	STA $66E4,X		  ; 9D E4 66 | Update graphics data
	STZ $00			  ; 64 00 | Store zero to zero page
	STZ $02			  ; 64 02 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $06			  ; 64 06 | Store zero to zero page
	SEC				  ; 38 | Set carry flag
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $02			  ; 26 02 | Rotate left (zero page)
	ROL $04			  ; 26 04 | Rotate left (zero page)
	ROL $06			  ; 26 06 | Rotate left (zero page)
	DEY				  ; 88 | Decrement Y register
	BPL $F5			  ; 10 F5 | Branch if positive
	LDA $00			  ; A5 00 | Read graphics status
	ROR $A5			  ; 66 A5 | Rotate right (zero page)
	ROR $A5			  ; 66 A5 | Rotate right (zero page)
	ROR $A5			  ; 66 A5 | Rotate right (zero page)
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	CLD				  ; D8 | Clear decimal mode flag
	ROR $6B			  ; 66 6B | Rotate right (zero page)
	ROR $7D80,X		  ; 7E 80 7D | Rotate right (absolute,X)
	STA ($7C,X)		  ; 81 7C | Update graphics data
	ROR $7F81,X		  ; 7E 81 7F | Rotate right (absolute,X)
	ADC $7B7F,X		  ; 7D 7F 7B | Add with carry (absolute,X)
	STA ($79,X)		  ; 81 79 | Update graphics data
	STA $76			  ; 85 76 | Update graphics data
	SEI				  ; 78 | Set interrupt disable flag
	STA $7B			  ; 85 7B | Update graphics data
	ADC $7C80,X		  ; 7D 80 7C | Add with carry (absolute,X)
	STA ($79,X)		  ; 81 79 | Update graphics data
	STY $75			  ; 84 75 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	PHB				  ; 8B | Push data bank register to stack
	BVS $8D			  ; 70 8D | Branch if overflow set
	TXA				  ; 8A | Transfer X register to accumulator
	STX $7B			  ; 86 7B | Store X register to zero page
	PLY				  ; 7A | Pull Y register from stack
	ADC ($8C),Y		  ; 71 8C | Add with carry ((zero page),Y)
	ADC $6A90			; 6D 90 6A | Add with carry (absolute)
	ROR $7490			; 6E 90 74 | Rotate right (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	STY $79			  ; 84 79 | Store Y register to zero page
	STA $73			  ; 85 73 | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	ADC $6791			; 6D 91 67 | Add with carry (absolute)
	STZ $9A			  ; 64 9A | Store zero to zero page

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_221
; Address: $D3B419
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_221:
	PLA				  ; 68 | Pull accumulator from stack
	BVS $8E			  ; 70 8E | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	STX $76			  ; 86 76 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	STA $609667		  ; 8F 67 96 60 | Update graphics data
	STA $A15C,X		  ; 9D 5C A1 | Update graphics data
	ADC ($9C,X)		  ; 61 9C | Add with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_222
; Address: $D3B42E
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_222:
	BIT #$72			 ; 89 72 | Test bits in accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	ROR				  ; 6A | Rotate right (accumulator)
	ADC ($9C,X)		  ; 61 9C | Add with carry ((zero page,X))
	EOR $54A4,Y		  ; 59 A4 54 | Exclusive OR with accumulator (absolute,Y)
	LDA #$5A			 ; A9 5A | Read graphics status
	ROR $98			  ; 66 98 | Rotate right (zero page)
	ADC ($8C),Y		  ; 71 8C | Add with carry ((zero page),Y)
	ROR $648E			; 6E 8E 64 | Rotate right (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	PHY				  ; 5A | Push Y register to stack
	LDX #$50			 ; A2 50 | Load immediate value into X register
	LDY $B24B			; AC 4B B2 | Load from absolute address into Y register
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_224
; Address: $D3B452
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_224:
	STZ $AA53,X		  ; 9E 53 AA | Store zero to absolute,X
	EOR ($BC,X)		  ; 41 BC | Exclusive OR with accumulator ((zero page,X))
	EOR #$B4			 ; 49 B4 | Exclusive OR with accumulator (immediate)
	EOR $69A4,Y		  ; 59 A4 69 | Exclusive OR with accumulator (absolute,Y)
	EOR $4CA4,Y		  ; 59 A4 4C | Exclusive OR with accumulator (absolute,Y)
	ROL $37BF,X		  ; 3E BF 37 | Rotate left (absolute,X)
	DEC $41			  ; C6 41 | Decrement (zero page)
	LDA $AB53,X		  ; BD 53 AB | Read graphics status
	ADC $99			  ; 65 99 | Add with carry (zero page)
	STZ $AB53			; 9C 53 AB | Store zero to absolute
	TSX				  ; BA | Transfer stack pointer to X register
	CMP #$2C			 ; C9 2C | Compare accumulator (immediate)
	CMP ($37),Y		  ; D1 37 | Compare accumulator ((zero page),Y)
	STA				  ; 9F 5C A1 4B | Update graphics data
	DEC				  ; 3A | Decrement accumulator
	AND #$D4			 ; 29 D4 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_225
; Address: $D3B487
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_225:
	JSR $2CDD			; 20 DD 2C | Jump to subroutine
	CMP ($43),Y		  ; D1 43 | Compare accumulator ((zero page),Y)
	EOR $56A4,Y		  ; 59 A4 56 | Exclusive OR with accumulator (absolute,Y)
	TSX				  ; BA | Transfer stack pointer to X register
	AND ($CC),Y		  ; 31 CC | Logical AND with accumulator ((zero page),Y)
	ASL $14DF,X		  ; 1E DF 14 | Arithmetic shift left (absolute,X)
	SBC #$21			 ; E9 21 | PPU graphics register access
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_226
; Address: $D3B49E
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_226:
	TAX				  ; AA | Transfer accumulator to X register
	BVC $AD			  ; 50 AD | Branch if overflow clear
	REP #$27			 ; C2 27 | Reset processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	INX				  ; E8 | Increment X register
	AND ($CC),Y		  ; 31 CC | Logical AND with accumulator ((zero page),Y)
	EOR $4AB0			; 4D B0 4A | Exclusive OR with accumulator (absolute)
	ORA $06E1,X		  ; 1D E1 06 | Logical OR with accumulator (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PEA #$D628		   ; F4 28 D6 | Push effective address to stack
	LSR $B8			  ; 46 B8 | Logical shift right (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	SBC $FF00			; ED 00 FF | Subtract with carry (absolute)
	ASL $3FE1,X		  ; 1E E1 3F | Arithmetic shift left (absolute,X)
	LDA				  ; BF 3B C2 20 | Read graphics status
	CMP $F905,X		  ; DD 05 F9 | Compare accumulator (absolute,X)
	XBA				  ; EB | Exchange accumulator bytes
	DEX				  ; CA | Decrement X register
	INX				  ; E8 | Increment X register
	ROL $2BCF			; 2E CF 2B | Rotate left (absolute)
	ROL $D8			  ; 26 D8 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_227
; Address: $D3B4FF
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_227:
	JSL $FD00DB		  ; 22 DB 00 FD | Jump to subroutine long
	SBC ($18,X)		  ; E1 18 | Subtract with carry ((zero page,X))
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	INC $FF00			; EE 00 FF | Increment (absolute)
	ORA #$F5			 ; 09 F5 | Logical OR with accumulator (immediate)
	ORA $F8			  ; 05 F8 | Logical OR with accumulator (zero page)
	STA ($B6,X)		  ; 81 B6 | Update graphics data
	ADC $7DB7,X		  ; 7D B7 7D | Add with carry (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	ADC $7DB9,X		  ; 7D B9 7D | Add with carry (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	ADC $7DBB,X		  ; 7D BB 7D | Add with carry (absolute,X)
	LDY $BD7D,X		  ; BC 7D BD | Load from absolute,X into Y register
	ADC $7DBE,X		  ; 7D BE 7D | Add with carry (absolute,X)
	LDA				  ; BF 7D C0 7D | Read graphics status
	CMP ($7D,X)		  ; C1 7D | Compare accumulator ((zero page,X))
	REP #$7D			 ; C2 7D | Reset processor status bits
	ADC $7DC4,X		  ; 7D C4 7D | Add with carry (absolute,X)
	CMP $7D			  ; C5 7D | Compare accumulator (zero page)
	DEC $7D			  ; C6 7D | Decrement (zero page)
	ADC $7DC8,X		  ; 7D C8 7D | Add with carry (absolute,X)
	CMP #$7D			 ; C9 7D | Compare accumulator (immediate)
	DEX				  ; CA | Decrement X register
	ADC $7DCB,X		  ; 7D CB 7D | Add with carry (absolute,X)
	CPY $CD7D			; CC 7D CD | Compare Y register (absolute)
	ADC $7DCE,X		  ; 7D CE 7D | Add with carry (absolute,X)
	ADC $7DD0,X		  ; 7D D0 7D | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_228
; Address: $D3B58A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_228:
	CMP ($7D),Y		  ; D1 7D | Compare accumulator ((zero page),Y)
	ADC $7DD3,X		  ; 7D D3 7D | Add with carry (absolute,X)
	ADC $7DD5,X		  ; 7D D5 7D | Add with carry (absolute,X)
	ADC $7DD7,X		  ; 7D D7 7D | Add with carry (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	ADC $7DD9,X		  ; 7D D9 7D | Add with carry (absolute,X)
	PHX				  ; DA | Push X register to stack
	ADC $7DDB,X		  ; 7D DB 7D | Add with carry (absolute,X)
	ADC $7DDD,X		  ; 7D DD 7D | Add with carry (absolute,X)
	DEC $DF7D,X		  ; DE 7D DF | Decrement (absolute,X)
	ADC $60E0,X		  ; 7D E0 60 | Add with carry (absolute,X)
	ROL $3E60,X		  ; 3E 60 3E | Rotate left (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_229
; Address: $D3B5AE
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_229:
	ROL $7F00,X		  ; 3E 00 7F | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	ADC $7D75,X		  ; 7D 75 7D | Add with carry (absolute,X)
	ROR $7E74,X		  ; 7E 74 7E | Rotate right (absolute,X)
	BRA $72			  ; 80 72 | Branch always
	BRA $72			  ; 80 72 | Branch always
	BRA $72			  ; 80 72 | Branch always
	BRA $72			  ; 80 72 | Branch always
	BRA $71			  ; 80 71 | Branch always
	STA ($71,X)		  ; 81 71 | Update graphics data
	STA ($71,X)		  ; 81 71 | Update graphics data
	STA ($71,X)		  ; 81 71 | Update graphics data
	STA ($71,X)		  ; 81 71 | Update graphics data
	STA ($71,X)		  ; 81 71 | Update graphics data
	STA ($71,X)		  ; 81 71 | Update graphics data
	STA ($71,X)		  ; 81 71 | Update graphics data
	STA ($71,X)		  ; 81 71 | Update graphics data
	STA ($70,X)		  ; 81 70 | Update graphics data
	BVS $82			  ; 70 82 | Branch if overflow set
	BVS $82			  ; 70 82 | Branch if overflow set
	BVS $82			  ; 70 82 | Branch if overflow set
	BVS $82			  ; 70 82 | Branch if overflow set
	BVS $82			  ; 70 82 | Branch if overflow set
	BVS $82			  ; 70 82 | Branch if overflow set
	BVS $82			  ; 70 82 | Branch if overflow set
	BVS $82			  ; 70 82 | Branch if overflow set
	BVS $82			  ; 70 82 | Branch if overflow set
	BVS $82			  ; 70 82 | Branch if overflow set
	BVS $82			  ; 70 82 | Branch if overflow set
	BVS $82			  ; 70 82 | Branch if overflow set
	ADC ($81),Y		  ; 71 81 | Add with carry ((zero page),Y)
	ADC ($81),Y		  ; 71 81 | Add with carry ((zero page),Y)
	ADC ($81),Y		  ; 71 81 | Add with carry ((zero page),Y)
	ADC ($81),Y		  ; 71 81 | Add with carry ((zero page),Y)
	ADC ($81),Y		  ; 71 81 | Add with carry ((zero page),Y)
	ADC ($81),Y		  ; 71 81 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_22A
; Address: $D3B65B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_22A:
	ADC ($81),Y		  ; 71 81 | Add with carry ((zero page),Y)
	ADC ($81),Y		  ; 71 81 | Add with carry ((zero page),Y)
	ADC ($81),Y		  ; 71 81 | Add with carry ((zero page),Y)
	BRA $72			  ; 80 72 | Branch always
	BRA $72			  ; 80 72 | Branch always
	BRA $72			  ; 80 72 | Branch always
	BRA $72			  ; 80 72 | Branch always
	BRA $73			  ; 80 73 | Branch always
	ROR $7E74,X		  ; 7E 74 7E | Rotate right (absolute,X)
	ADC $7D75,X		  ; 7D 75 7D | Add with carry (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	ROR $826E,X		  ; 7E 6E 82 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_22B
; Address: $D3B686
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_22B:
	STA $69			  ; 85 69 | Update graphics data
	BIT #$66			 ; 89 66 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	STZ $8C			  ; 64 8C | Store zero to zero page
	STA $8E62			; 8D 62 8E | Update graphics data
	ADC ($8F,X)		  ; 61 8F | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_22C
; Address: $D3B696
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_22C:
	BCC $5F			  ; 90 5F | Branch if carry clear
	STA ($5F),Y		  ; 91 5F | Update graphics data
	STA ($5E),Y		  ; 91 5E | Update graphics data
	EOR $5D93,X		  ; 5D 93 5D | Exclusive OR with accumulator (absolute,X)
	JMP $945C94		  ; 5C 94 5C 94 | Jump to address long
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	EOR $5997,Y		  ; 59 97 59 | Exclusive OR with accumulator (absolute,Y)
	EOR $5997,Y		  ; 59 97 59 | Exclusive OR with accumulator (absolute,Y)
	EOR $5997,Y		  ; 59 97 59 | Exclusive OR with accumulator (absolute,Y)
	EOR $5997,Y		  ; 59 97 59 | Exclusive OR with accumulator (absolute,Y)
	EOR $5997,Y		  ; 59 97 59 | Exclusive OR with accumulator (absolute,Y)
	EOR $5997,Y		  ; 59 97 59 | Exclusive OR with accumulator (absolute,Y)
	EOR $5A97,Y		  ; 59 97 5A | Exclusive OR with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	JMP $945C94		  ; 5C 94 5C 94 | Jump to address long
	EOR $5D93,X		  ; 5D 93 5D | Exclusive OR with accumulator (absolute,X)
	LSR $5F92,X		  ; 5E 92 5F | Logical shift right (absolute,X)
	STA ($5F),Y		  ; 91 5F | Update graphics data
	STA ($60),Y		  ; 91 60 | Update graphics data
	BCC $61			  ; 90 61 | Branch if carry clear
	STA $638E62		  ; 8F 62 8E 63 | Update graphics data
	STA $8C64			; 8D 64 8C | Update graphics data
	ROR $8A			  ; 66 8A | Rotate right (zero page)
	BIT #$69			 ; 89 69 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_22E
; Address: $D3B6FA
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_22E:
	STA $6E			  ; 85 6E | Update graphics data
	ROR $A849,X		  ; 7E 49 A8 | Rotate right (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $4DA6			; 4C A6 4D | Jump to address
	LDA $4E			  ; A5 4E | Read graphics status
	LDY $4F			  ; A4 4F | Load from zero page into Y register
	BVC $A2			  ; 50 A2 | Branch if overflow clear
	EOR ($A1),Y		  ; 51 A1 | Exclusive OR with accumulator ((zero page),Y)
	LDY #$53			 ; A0 53 | Load immediate value into Y register
	STA				  ; 9F 54 9E 55 | Update graphics data
	STA $9C56,X		  ; 9D 56 9C | Update graphics data
	CLI				  ; 58 | Clear interrupt disable flag
	TXS				  ; 9A | Transfer X register to stack pointer
	EOR $5A99,Y		  ; 59 99 5A | Exclusive OR with accumulator (absolute,Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP $955D96		  ; 5C 96 5D 95 | Jump to address long
	LSR $5F94,X		  ; 5E 94 5F | Logical shift right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_22F
; Address: $D3B72F
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_22F:
	ADC ($91,X)		  ; 61 91 | Add with carry ((zero page,X))
	STA $648E63		  ; 8F 63 8E 64 | Update graphics data
	STA $8C65			; 8D 65 8C | Update graphics data
	ROR $8B			  ; 66 8B | Rotate right (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	PLA				  ; 68 | Pull accumulator from stack
	BIT #$69			 ; 89 69 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	ROR				  ; 6A | Rotate right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_230
; Address: $D3B744
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_230:
	STX $6C			  ; 86 6C | Store X register to zero page
	STA $6D			  ; 85 6D | Update graphics data
	STY $6E			  ; 84 6E | Store Y register to zero page
	BVS $81			  ; 70 81 | Branch if overflow set
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	BVS $81			  ; 70 81 | Branch if overflow set
	BVS $81			  ; 70 81 | Branch if overflow set
	BVS $81			  ; 70 81 | Branch if overflow set
	ROR $6E83			; 6E 83 6E | Rotate right (absolute)
	ROR $6D83			; 6E 83 6D | Rotate right (absolute)
	STY $6D			  ; 84 6D | Store Y register to zero page
	STY $6C			  ; 84 6C | Store Y register to zero page
	STA $6C			  ; 85 6C | Update graphics data
	STA $6C			  ; 85 6C | Update graphics data
	STA $6B			  ; 85 6B | Update graphics data
	STX $6B			  ; 86 6B | Store X register to zero page
	STX $6B			  ; 86 6B | Store X register to zero page
	STX $6A			  ; 86 6A | Store X register to zero page
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_231
; Address: $D3B779
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_231:
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$88			 ; 69 88 | Add with carry (immediate)
	ROR $65			  ; 66 65 | Rotate right (zero page)
	ROR $63			  ; 66 63 | Rotate right (zero page)
	ROR $64			  ; 66 64 | Rotate right (zero page)
	ADC $69			  ; 65 69 | Add with carry (zero page)
	ROR $6B			  ; 66 6B | Rotate right (zero page)
	ADC #$68			 ; 69 68 | Add with carry (immediate)
	JMP ($6E67)		  ; 6C 67 6E | Jump to address (absolute indirect)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_232
; Address: $D3B791
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_232:
	ROR $69			  ; 66 69 | Rotate right (zero page)
	ADC $68			  ; 65 68 | Add with carry (zero page)
	STZ $66			  ; 64 66 | Store zero to zero page
	ADC ($65,X)		  ; 61 65 | Add with carry ((zero page,X))
	ADC ($63,X)		  ; 61 63 | Add with carry ((zero page,X))
	ADC ($66,X)		  ; 61 66 | Add with carry ((zero page,X))
	ROR $64			  ; 66 64 | Rotate right (zero page)
	ADC $68			  ; 65 68 | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$69			 ; 69 69 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_234
; Address: $D3B7AF
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_234:
	JMP ($6B6C)		  ; 6C 6C 6B | Jump to address (absolute indirect)
	ADC $6E6E			; 6D 6E 6E | Add with carry (absolute)
	BVS $6E			  ; 70 6E | Branch if overflow set
	ROR $6B6F			; 6E 6F 6B | Rotate right (absolute)
	ROR $6A6A			; 6E 6A 6A | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6B6B)		  ; 6C 6B 6B | Jump to address (absolute indirect)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$69			 ; 69 69 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$66			 ; 69 66 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $67			  ; 65 67 | Add with carry (zero page)
	STZ $67			  ; 64 67 | Store zero to zero page
	STZ $61			  ; 64 61 | Store zero to zero page
	STZ $61			  ; 64 61 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	STZ $65			  ; 64 65 | Store zero to zero page
	ROR $6B			  ; 66 6B | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $61			  ; 66 61 | Rotate right (zero page)
	ADC $63			  ; 65 63 | Add with carry (zero page)
	ADC #$66			 ; 69 66 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_235
; Address: $D3B7E2
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_235:
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6E6A)		  ; 6C 6A 6E | Jump to address (absolute indirect)
	BVS $6F			  ; 70 6F | Branch if overflow set
	JMP ($6A6E)		  ; 6C 6E 6A | Jump to address (absolute indirect)
	JMP ($6B69)		  ; 6C 69 6B | Jump to address (absolute indirect)
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$68			 ; 69 68 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ADC $65			  ; 65 65 | Add with carry (zero page)
	STZ $64			  ; 64 64 | Store zero to zero page
	STZ $61			  ; 64 61 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	STZ $64			  ; 64 64 | Store zero to zero page
	ADC $65			  ; 65 65 | Add with carry (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ADC #$68			 ; 69 68 | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_236
; Address: $D3B811
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_236:
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6E6A			; 6D 6A 6E | Add with carry (absolute)
	ADC $6B6F			; 6D 6F 6B | Add with carry (absolute)
	BVS $6C			  ; 70 6C | Branch if overflow set
	BVS $6B			  ; 70 6B | Branch if overflow set
	ROR $6C			  ; 66 6C | Rotate right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_237
; Address: $D3B822
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_237:
	ROR $6D6A			; 6E 6A 6D | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6B68)		  ; 6C 68 6B | Jump to address (absolute indirect)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6A			  ; 65 6A | Add with carry (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$6B			 ; 69 6B | Add with carry (immediate)
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6E6B			; 6D 6B 6E | Add with carry (absolute)
	JMP ($6C70)		  ; 6C 70 6C | Jump to address (absolute indirect)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_238
; Address: $D3B83E
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_238:
	ROR $6E6B			; 6E 6B 6E | Rotate right (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6F67			; 6D 67 6F | Add with carry (absolute)
	STZ $67			  ; 64 67 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6868)		  ; 6C 68 68 | Jump to address (absolute indirect)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ADC $65			  ; 65 65 | Add with carry (zero page)
	STZ $64			  ; 64 64 | Store zero to zero page
	STZ $64			  ; 64 64 | Store zero to zero page

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_239
; Address: $D3B85E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_239:
	STZ $65			  ; 64 65 | Store zero to zero page
	ADC $66			  ; 65 66 | Add with carry (zero page)
	ROR $67			  ; 66 67 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$69			 ; 69 69 | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_23A
; Address: $D3B86B
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_23A:
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($6E6A)		  ; 6C 6A 6E | Jump to address (absolute indirect)
	PLA				  ; 68 | Pull accumulator from stack
	BVS $64			  ; 70 64 | Branch if overflow set
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6C69			; 6D 69 6C | Add with carry (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC ($7F),Y		  ; 71 7F | Add with carry ((zero page),Y)
	ADC ($7E),Y		  ; 71 7E | Add with carry ((zero page),Y)
	BVS $7E			  ; 70 7E | Branch if overflow set
	ROR $6D7A			; 6E 7A 6D | Rotate right (absolute)
	JMP ($697B)		  ; 6C 7B 69 | Jump to address (absolute indirect)
	ROR $74			  ; 66 74 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($65),Y		  ; 71 65 | Add with carry ((zero page),Y)
	BVS $63			  ; 70 63 | Branch if overflow set
	ROR $6D61			; 6E 61 6D | Rotate right (absolute)
	JMP ($6B5E)		  ; 6C 5E 6B | Jump to address (absolute indirect)
	ROR				  ; 6A | Rotate right (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_23B
; Address: $D3B8A0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_23B:
	ADC #$62			 ; 69 62 | Add with carry (immediate)
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	ADC #$66			 ; 69 66 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_23C
; Address: $D3B8A9
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_23C:
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6E6A			; 6D 6A 6E | Add with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_23D
; Address: $D3B8AE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_23D:
	BVS $6C			  ; 70 6C | Branch if overflow set
	JMP ($7174)		  ; 6C 74 71 | Jump to address (absolute indirect)
	ADC $6E76			; 6D 76 6E | Add with carry (absolute)
	ROR $6E76			; 6E 76 6E | Rotate right (absolute)
	ROR $6D73			; 6E 73 6D | Rotate right (absolute)
	ADC $6B71			; 6D 71 6B | Add with carry (absolute)
	BVS $6B			  ; 70 6B | Branch if overflow set
	BVS $69			  ; 70 69 | Branch if overflow set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_23E
; Address: $D3B8CB
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_23E:
	JMP ($6C70)		  ; 6C 70 6C | Jump to address (absolute indirect)
	ADC $6E73			; 6D 73 6E | Add with carry (absolute)
	ADC $7A70,Y		  ; 79 70 7A | Add with carry (absolute,Y)
	BVS $7A			  ; 70 7A | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	JMP ($6C75)		  ; 6C 75 6C | Jump to address (absolute indirect)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_23F
; Address: $D3B8E2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_23F:
	ADC ($6A),Y		  ; 71 6A | Add with carry ((zero page),Y)
	ADC ($69),Y		  ; 71 69 | Add with carry ((zero page),Y)
	ROR $6C68			; 6E 68 6C | Rotate right (absolute)
	STZ $6B			  ; 64 6B | Store zero to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_240
; Address: $D3B8ED
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_240:
	ADC #$6B			 ; 69 6B | Add with carry (immediate)
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $6B6B			; 6E 6B 6B | Rotate right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_241
; Address: $D3B8F7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_241:
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($6A67)		  ; 6C 67 6A | Jump to address (absolute indirect)
	ADC $69			  ; 65 69 | Add with carry (zero page)
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	JMP ($6866)		  ; 6C 66 68 | Jump to address (absolute indirect)
	ADC $6E69			; 6D 69 6E | Add with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_242
; Address: $D3B908
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_242:
	BVS $6C			  ; 70 6C | Branch if overflow set
	ADC ($6B),Y		  ; 71 6B | Add with carry ((zero page),Y)
	ADC ($68),Y		  ; 71 68 | Add with carry ((zero page),Y)
	ADC #$6E			 ; 69 6E | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_243
; Address: $D3B913
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_243:
	ADC $6E71			; 6D 71 6E | Add with carry (absolute)
	BVS $73			  ; 70 73 | Branch if overflow set
	ADC ($6F),Y		  ; 71 6F | Add with carry ((zero page),Y)
	ADC ($6F),Y		  ; 71 6F | Add with carry ((zero page),Y)
	BVS $73			  ; 70 73 | Branch if overflow set
	ROR $6D72			; 6E 72 6D | Rotate right (absolute)
	ADC ($6B),Y		  ; 71 6B | Add with carry ((zero page),Y)
	ADC #$6E			 ; 69 6E | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_244
; Address: $D3B92E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_244:
	ADC ($6C),Y		  ; 71 6C | Add with carry ((zero page),Y)
	ADC ($6B),Y		  ; 71 6B | Add with carry ((zero page),Y)
	BVS $69			  ; 70 69 | Branch if overflow set
	ROR $6D67			; 6E 67 6D | Rotate right (absolute)
	ROR $68			  ; 66 68 | Rotate right (zero page)
	STZ $6C			  ; 64 6C | Store zero to zero page
	ADC #$65			 ; 69 65 | Add with carry (immediate)
	ADC #$67			 ; 69 67 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($726B)		  ; 6C 6B 72 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_247
; Address: $D3B947
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_247:
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $6C69			; 6E 69 6C | Rotate right (absolute)
	ADC #$6B			 ; 69 6B | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_248
; Address: $D3B94F
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_248:
	STZ $6B			  ; 64 6B | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6E69)		  ; 6C 69 6E | Jump to address (absolute indirect)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC ($6B),Y		  ; 71 6B | Add with carry ((zero page),Y)
	ADC ($6C),Y		  ; 71 6C | Add with carry ((zero page),Y)
	JMP ($6F75)		  ; 6C 75 6F | Jump to address (absolute indirect)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $7A			  ; 70 7A | Branch if overflow set
	BVS $7A			  ; 70 7A | Branch if overflow set
	ADC $776F,Y		  ; 79 6F 77 | Add with carry (absolute,Y)
	ROR $6D75			; 6E 75 6D | Rotate right (absolute)
	JMP ($6C72)		  ; 6C 72 6C | Jump to address (absolute indirect)
	BVS $6B			  ; 70 6B | Branch if overflow set
	ADC #$6F			 ; 69 6F | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_249
; Address: $D3B974
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_249:
	BVS $6B			  ; 70 6B | Branch if overflow set
	BVS $6D			  ; 70 6D | Branch if overflow set
	ADC ($6D),Y		  ; 71 6D | Add with carry ((zero page),Y)
	ROR $6373			; 6E 73 63 | Rotate right (absolute)
	ADC ($7D,X)		  ; 61 7D | Add with carry ((zero page,X))
	STZ $7F			  ; 64 7F | Store zero to zero page
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	ADC $6F80			; 6D 80 6F | Add with carry (absolute)
	BRA $69			  ; 80 69 | Branch always
	EOR $5F7E,X		  ; 5D 7E 5F | Exclusive OR with accumulator (absolute,X)
	STZ $7A			  ; 64 7A | Store zero to zero page
	ADC ($74,X)		  ; 61 74 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_24A
; Address: $D3B996
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_24A:
	ADC ($5E),Y		  ; 71 5E | Add with carry ((zero page),Y)
	JMP $725B75		  ; 5C 75 5B 72 | Jump to address long
	PHY				  ; 5A | Push Y register to stack
	BVS $5A			  ; 70 5A | Branch if overflow set
	EOR $596D,Y		  ; 59 6D 59 | Exclusive OR with accumulator (absolute,Y)
	ROR				  ; 6A | Rotate right (accumulator)
	PHY				  ; 5A | Push Y register to stack
	PLA				  ; 68 | Pull accumulator from stack
	PHY				  ; 5A | Push Y register to stack
	ADC #$5B			 ; 69 5B | Add with carry (immediate)
	ROR $5B			  ; 66 5B | Rotate right (zero page)
	ADC $5C			  ; 65 5C | Add with carry (zero page)
	ROR $5D			  ; 66 5D | Rotate right (zero page)
	LSR $5F68,X		  ; 5E 68 5F | Logical shift right (absolute,X)
	ADC #$5C			 ; 69 5C | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_24C
; Address: $D3B9B8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_24C:
	ADC #$61			 ; 69 61 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($6D65)		  ; 6C 65 6D | Jump to address (absolute indirect)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $706A			; 6E 6A 70 | Rotate right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_24D
; Address: $D3B9C4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_24D:
	ADC ($66),Y		  ; 71 66 | Add with carry ((zero page),Y)
	ADC ($68),Y		  ; 71 68 | Add with carry ((zero page),Y)
	ADC ($69),Y		  ; 71 69 | Add with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_24E
; Address: $D3B9CD
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_24E:
	ADC $6E7A			; 6D 7A 6E | Add with carry (absolute)
	PLY				  ; 7A | Pull Y register from stack
	BVS $7D			  ; 70 7D | Branch if overflow set
	ADC ($7E),Y		  ; 71 7E | Add with carry ((zero page),Y)
	ADC ($7F),Y		  ; 71 7F | Add with carry ((zero page),Y)
	BRA $72			  ; 80 72 | Branch always
	BRA $71			  ; 80 71 | Branch always
	ADC ($7E),Y		  ; 71 7E | Add with carry ((zero page),Y)
	BVS $7E			  ; 70 7E | Branch if overflow set
	ROR $6D7A			; 6E 7A 6D | Rotate right (absolute)
	JMP ($697B)		  ; 6C 7B 69 | Jump to address (absolute indirect)
	ROR $74			  ; 66 74 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($65),Y		  ; 71 65 | Add with carry ((zero page),Y)
	BVS $63			  ; 70 63 | Branch if overflow set
	ROR $6D61			; 6E 61 6D | Rotate right (absolute)
	JMP ($6B5E)		  ; 6C 5E 6B | Jump to address (absolute indirect)
	ROR				  ; 6A | Rotate right (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_24F
; Address: $D3BA00
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_24F:
	ADC #$62			 ; 69 62 | Add with carry (immediate)
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	ADC #$66			 ; 69 66 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_250
; Address: $D3BA09
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_250:
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6E6A			; 6D 6A 6E | Add with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_251
; Address: $D3BA0E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_251:
	BVS $6C			  ; 70 6C | Branch if overflow set
	JMP ($7174)		  ; 6C 74 71 | Jump to address (absolute indirect)
	ADC $6E76			; 6D 76 6E | Add with carry (absolute)
	ROR $6E76			; 6E 76 6E | Rotate right (absolute)
	ROR $6D73			; 6E 73 6D | Rotate right (absolute)
	ADC $6B71			; 6D 71 6B | Add with carry (absolute)
	BVS $6B			  ; 70 6B | Branch if overflow set
	BVS $69			  ; 70 69 | Branch if overflow set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_253
; Address: $D3BA36
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_253:
	ADC $7A70,Y		  ; 79 70 7A | Add with carry (absolute,Y)
	BVS $7A			  ; 70 7A | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	JMP ($6C75)		  ; 6C 75 6C | Jump to address (absolute indirect)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_254
; Address: $D3BA42
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_254:
	ADC ($6A),Y		  ; 71 6A | Add with carry ((zero page),Y)
	ADC ($69),Y		  ; 71 69 | Add with carry ((zero page),Y)
	ROR $6C68			; 6E 68 6C | Rotate right (absolute)
	STZ $6B			  ; 64 6B | Store zero to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_255
; Address: $D3BA4D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_255:
	ADC #$6B			 ; 69 6B | Add with carry (immediate)
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $6B6B			; 6E 6B 6B | Rotate right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_256
; Address: $D3BA57
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_256:
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($6A67)		  ; 6C 67 6A | Jump to address (absolute indirect)
	ADC $69			  ; 65 69 | Add with carry (zero page)
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	JMP ($6866)		  ; 6C 66 68 | Jump to address (absolute indirect)
	ADC $6E69			; 6D 69 6E | Add with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_257
; Address: $D3BA68
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_257:
	BVS $6C			  ; 70 6C | Branch if overflow set
	ADC ($6B),Y		  ; 71 6B | Add with carry ((zero page),Y)
	ADC ($68),Y		  ; 71 68 | Add with carry ((zero page),Y)
	ADC #$6E			 ; 69 6E | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_258
; Address: $D3BA73
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_258:
	ADC $6E71			; 6D 71 6E | Add with carry (absolute)
	BVS $73			  ; 70 73 | Branch if overflow set
	ADC ($4D),Y		  ; 71 4D | Add with carry ((zero page),Y)
	ADC ($4E,X)		  ; 61 4E | Add with carry ((zero page,X))
	ADC ($4F,X)		  ; 61 4F | Add with carry ((zero page,X))
	EOR ($64),Y		  ; 51 64 | Exclusive OR with accumulator ((zero page),Y)
	ROR $55			  ; 66 55 | Rotate right (zero page)
	ROR $4E			  ; 66 4E | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $57			  ; 66 57 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6D5E)		  ; 6C 5E 6D | Jump to address (absolute indirect)
	STZ $6F			  ; 64 6F | Store zero to zero page
	STZ $6F			  ; 64 6F | Store zero to zero page
	ADC #$75			 ; 69 75 | Add with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_25A
; Address: $D3BAA1
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_25A:
	STZ $73			  ; 64 73 | Store zero to zero page
	ADC $79			  ; 65 79 | Add with carry (zero page)
	ADC #$7D			 ; 69 7D | Add with carry (immediate)
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	ADC $6E85			; 6D 85 6E | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_25B
; Address: $D3BAAD
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_25B:
	BVS $85			  ; 70 85 | Branch if overflow set
	BVS $88			  ; 70 88 | Branch if overflow set
	TXA				  ; 8A | Transfer X register to accumulator
	STY $8E74			; 8C 74 8E | Store Y register to absolute address
	STX $9076			; 8E 76 90 | Store X register to absolute address
	BCC $74			  ; 90 74 | Branch if carry clear
	STX $8E74			; 8E 74 8E | Store X register to absolute address
	STY $8C72			; 8C 72 8C | Store Y register to absolute address
	BVS $88			  ; 70 88 | Branch if overflow set
	BVS $88			  ; 70 88 | Branch if overflow set
	ROR $6D85			; 6E 85 6D | Rotate right (absolute)
	ROR $876B,X		  ; 7E 6B 87 | Rotate right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_25D
; Address: $D3BAD4
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_25D:
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	SEI				  ; 78 | Set interrupt disable flag
	EOR $6478,X		  ; 5D 78 64 | Exclusive OR with accumulator (absolute,X)
	LSR $5B73,X		  ; 5E 73 5B | Logical shift right (absolute,X)
	ADC $6C53			; 6D 53 6C | Add with carry (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$53			 ; 69 53 | Add with carry (immediate)
	ROR $59			  ; 66 59 | Rotate right (zero page)
	ADC $59			  ; 65 59 | Add with carry (zero page)
	ADC $5C			  ; 65 5C | Add with carry (zero page)
	ROR $60			  ; 66 60 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	STZ $6A			  ; 64 6A | Store zero to zero page
	STZ $6A			  ; 64 6A | Store zero to zero page
	ADC $6F67			; 6D 67 6F | Add with carry (absolute)
	ADC #$73			 ; 69 73 | Add with carry (immediate)
	ADC #$73			 ; 69 73 | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_25E
; Address: $D3BB02
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_25E:
	ROR $7A6B,X		  ; 7E 6B 7A | Rotate right (absolute,X)
	ADC $6E7E			; 6D 7E 6E | Add with carry (absolute)
	BRA $6E			  ; 80 6E | Branch always
	BRA $6E			  ; 80 6E | Branch always
	ROR $7C6E,X		  ; 7E 6E 7C | Rotate right (absolute,X)
	ROR $6D78			; 6E 78 6D | Rotate right (absolute)
	ADC $6C76			; 6D 76 6C | Add with carry (absolute)
	ADC #$73			 ; 69 73 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $73			  ; 65 73 | Add with carry (zero page)
	ROR $71			  ; 66 71 | Rotate right (zero page)
	ADC #$71			 ; 69 71 | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_262
; Address: $D3BB2F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_262:
	ROR $707C			; 6E 7C 70 | Rotate right (absolute)
	BVS $83			  ; 70 83 | Branch if overflow set
	STA $72			  ; 85 72 | Update graphics data
	STA $72			  ; 85 72 | Update graphics data
	STA $70			  ; 85 70 | Update graphics data
	STA ($6B,X)		  ; 81 6B | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_264
; Address: $D3BB43
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_264:
	ADC #$75			 ; 69 75 | Add with carry (immediate)
	ADC $6F			  ; 65 6F | Add with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_265
; Address: $D3BB4C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_265:
	JMP ($6A59)		  ; 6C 59 6A | Jump to address (absolute indirect)
	JMP $6A626A		  ; 5C 6A 62 6A | Jump to address long
	ADC $6A			  ; 65 6A | Add with carry (zero page)
	JMP ($6C65)		  ; 6C 65 6C | Jump to address (absolute indirect)
	ADC #$6A			 ; 69 6A | Add with carry (immediate)
	ADC #$76			 ; 69 76 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	BVS $64			  ; 70 64 | Branch if overflow set
	JMP ($6861)		  ; 6C 61 68 | Jump to address (absolute indirect)
	LSR $5E66,X		  ; 5E 66 5E | Logical shift right (absolute,X)
	ADC $5B			  ; 65 5B | Add with carry (zero page)
	ROR $5C			  ; 66 5C | Rotate right (zero page)
	JMP ($6460)		  ; 6C 60 64 | Jump to address (absolute indirect)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_266
; Address: $D3BB70
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_266:
	STZ $62			  ; 64 62 | Store zero to zero page
	ADC $6F65			; 6D 65 6F | Add with carry (absolute)
	ADC #$73			 ; 69 73 | Add with carry (immediate)
	ADC #$73			 ; 69 73 | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_267
; Address: $D3BB7B
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_267:
	ADC #$75			 ; 69 75 | Add with carry (immediate)
	EOR $4E6E			; 4D 6E 4E | Exclusive OR with accumulator (absolute)
	BVS $4F			  ; 70 4F | Branch if overflow set
	ADC $6851			; 6D 51 68 | Add with carry (absolute)
	EOR ($64),Y		  ; 51 64 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($62),Y		  ; 51 62 | Exclusive OR with accumulator ((zero page),Y)
	LSR $5368			; 4E 68 53 | Logical shift right (absolute)
	ADC $6F5A			; 6D 5A 6F | Add with carry (absolute)
	EOR $6070,X		  ; 5D 70 60 | Exclusive OR with accumulator (absolute,X)
	ADC ($5B),Y		  ; 71 5B | Add with carry ((zero page),Y)
	JMP $765F75		  ; 5C 75 5F 76 | Jump to address long
	ADC ($77,X)		  ; 61 77 | Add with carry ((zero page,X))
	STZ $78			  ; 64 78 | Store zero to zero page
	SEI				  ; 78 | Set interrupt disable flag
	ADC #$77			 ; 69 77 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_268
; Address: $D3BBAB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_268:
	JMP ($6B76)		  ; 6C 76 6B | Jump to address (absolute indirect)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$73			 ; 69 73 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_269
; Address: $D3BBB3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_269:
	PLA				  ; 68 | Pull accumulator from stack
	ROR $75			  ; 66 75 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	BVS $65			  ; 70 65 | Branch if overflow set
	ROR $6C64			; 6E 64 6C | Rotate right (absolute)
	ADC #$61			 ; 69 61 | Add with carry (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_26C
; Address: $D3BBC8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_26C:
	ADC #$5D			 ; 69 5D | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $57			  ; 66 57 | Rotate right (zero page)
	STZ $57			  ; 64 57 | Store zero to zero page
	ADC ($53,X)		  ; 61 53 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_26E
; Address: $D3BBD9
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_26E:
	EOR ($5F),Y		  ; 51 5F | Exclusive OR with accumulator ((zero page),Y)
	EOR ($5F),Y		  ; 51 5F | Exclusive OR with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_270
; Address: $D3BBE2
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_270:
	ADC ($55,X)		  ; 61 55 | Add with carry ((zero page,X))
	STZ $56			  ; 64 56 | Store zero to zero page
	ADC $5A			  ; 65 5A | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	EOR $5E6B,X		  ; 5D 6B 5E | Exclusive OR with accumulator (absolute,X)
	ROR $6960			; 6E 60 69 | Rotate right (absolute)
	ADC ($6C,X)		  ; 61 6C | Add with carry ((zero page,X))
	ROR $7064			; 6E 64 70 | Rotate right (absolute)
	ADC $72			  ; 65 72 | Add with carry (zero page)
	ROR $73			  ; 66 73 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($68),Y		  ; 71 68 | Add with carry ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $6B67			; 6D 67 6B | Add with carry (absolute)
	ROR $69			  ; 66 69 | Rotate right (zero page)
	STZ $67			  ; 64 67 | Store zero to zero page
	ADC ($66,X)		  ; 61 66 | Add with carry ((zero page,X))
	ADC $5D			  ; 65 5D | Add with carry (zero page)
	ADC $5C			  ; 65 5C | Add with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_271
; Address: $D3BC16
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_271:
	STZ $5B			  ; 64 5B | Store zero to zero page
	JMP $635E63		  ; 5C 63 5E 63 | Jump to address long
	STZ $60			  ; 64 60 | Store zero to zero page
	STZ $61			  ; 64 61 | Store zero to zero page
	ROR $61			  ; 66 61 | Rotate right (zero page)
	ROR $62			  ; 66 62 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $61			  ; 66 61 | Rotate right (zero page)
	ADC $5F			  ; 65 5F | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_272
; Address: $D3BC2E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_272:
	ADC $5E			  ; 65 5E | Add with carry (zero page)
	STZ $5C			  ; 64 5C | Store zero to zero page
	PHY				  ; 5A | Push Y register to stack
	CLI				  ; 58 | Clear interrupt disable flag
	ADC ($57,X)		  ; 61 57 | Add with carry ((zero page,X))
	ADC ($59,X)		  ; 61 59 | Add with carry ((zero page,X))
	JMP $655F65		  ; 5C 65 5F 65 | Jump to address long
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_273
; Address: $D3BC42
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_273:
	ROR $60			  ; 66 60 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $69			  ; 65 69 | Add with carry (zero page)
	ROR $6D			  ; 66 6D | Rotate right (zero page)
	ROR $6A			  ; 66 6A | Rotate right (zero page)
	ROR $68			  ; 66 68 | Rotate right (zero page)
	ADC $68			  ; 65 68 | Add with carry (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ROR $65			  ; 66 65 | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6E68)		  ; 6C 68 6E | Jump to address (absolute indirect)
	ADC $6D			  ; 65 6D | Add with carry (zero page)
	ADC #$6B			 ; 69 6B | Add with carry (immediate)
	STZ $6A			  ; 64 6A | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($66,X)		  ; 61 66 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_274
; Address: $D3BC6A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_274:
	ADC $60			  ; 65 60 | Add with carry (zero page)
	ROR $62			  ; 66 62 | Rotate right (zero page)
	ADC #$63			 ; 69 63 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $60			  ; 66 60 | Rotate right (zero page)
	STZ $5F			  ; 64 5F | Store zero to zero page
	LSR $5F61,X		  ; 5E 61 5F | Logical shift right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_275
; Address: $D3BC7D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_275:
	BVC $90			  ; 50 90 | Branch if overflow clear
	STA $568E54		  ; 8F 54 8E 56 | Update graphics data
	STY $8A57			; 8C 57 8A | Store Y register to absolute address
	CLI				  ; 58 | Clear interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	EOR $5985,Y		  ; 59 85 59 | Exclusive OR with accumulator (absolute,Y)
	EOR $597F,Y		  ; 59 7F 59 | Exclusive OR with accumulator (absolute,Y)
	EOR $5879,Y		  ; 59 79 58 | Exclusive OR with accumulator (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	ADC $7157,X		  ; 7D 57 71 | Add with carry (absolute,X)
	ADC $6B55			; 6D 55 6B | Add with carry (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_277
; Address: $D3BCA9
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_277:
	EOR $4C72			; 4D 72 4C | Exclusive OR with accumulator (absolute)
	LSR $4A73			; 4E 73 4A | Logical shift right (absolute)
	PHA				  ; 48 | Push accumulator to stack
	ADC ($43),Y		  ; 71 43 | Add with carry ((zero page),Y)
	WDM #$6D			 ; 42 6D | Reserved instruction
	EOR #$6B			 ; 49 6B | Exclusive OR with accumulator (immediate)
	WDM #$68			 ; 42 68 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	ADC $3F			  ; 65 3F | Add with carry (zero page)
	AND $405F,X		  ; 3D 5F 40 | Logical AND with accumulator (absolute,X)
	JMP $3A593B		  ; 5C 3B 59 3A | Jump to address long
	AND $3954,Y		  ; 39 54 39 | Logical AND with accumulator (absolute,Y)
	AND $3952,Y		  ; 39 52 39 | Logical AND with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	STZ $3D			  ; 64 3D | Store zero to zero page
	JMP $425140		  ; 5C 40 51 42 | Hardware register operation
	EOR $65			  ; 45 65 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	JMP $4E68			; 4C 68 4E | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	EOR $4A68			; 4D 68 4A | Exclusive OR with accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	ROR $48			  ; 66 48 | Rotate right (zero page)
	STZ $42			  ; 64 42 | Hardware register operation
	EOR $61			  ; 45 61 | Exclusive OR with accumulator (zero page)
	EOR #$5F			 ; 49 5F | Exclusive OR with accumulator (immediate)
	LSR $515E			; 4E 5E 51 | Logical shift right (absolute)
	EOR $5C4B,X		  ; 5D 4B 5C | Exclusive OR with accumulator (absolute,X)
	JMP $425C50		  ; 5C 50 5C 42 | Hardware register operation
	EOR $5E46,X		  ; 5D 46 5E | Exclusive OR with accumulator (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_278
; Address: $D3BCFF
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_278:
	WDM #$62			 ; 42 62 | Reserved instruction
	EOR ($6B,X)		  ; 41 6B | Exclusive OR with accumulator ((zero page,X))
	EOR ($6E,X)		  ; 41 6E | Exclusive OR with accumulator ((zero page,X))
	EOR ($62,X)		  ; 41 62 | Exclusive OR with accumulator ((zero page,X))
	WDM #$65			 ; 42 65 | Reserved instruction
	EOR $70			  ; 45 70 | Exclusive OR with accumulator (zero page)
	EOR #$73			 ; 49 73 | Exclusive OR with accumulator (immediate)
	EOR $5070			; 4D 70 50 | Exclusive OR with accumulator (absolute)
	ADC $7B53,Y		  ; 79 53 7B | Add with carry (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	ADC $7D59,X		  ; 7D 59 7D | Add with carry (absolute,X)
	EOR $587C,Y		  ; 59 7C 58 | Exclusive OR with accumulator (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($50),Y		  ; 71 50 | Add with carry ((zero page),Y)
	LSR $4C6A			; 4E 6A 4C | Logical shift right (absolute)
	ADC $4A			  ; 65 4A | Add with carry (zero page)
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_279
; Address: $D3BD2F
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_279:
	LSR $5A			  ; 46 5A | Logical shift right (zero page)
	PHY				  ; 5A | Push Y register to stack
	WDM #$60			 ; 42 60 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	ROR $3E			  ; 66 3E | Rotate right (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	DEC				  ; 3A | Decrement accumulator
	SEC				  ; 38 | Set carry flag
	BVC $34			  ; 50 34 | Branch if overflow clear
	AND ($54),Y		  ; 31 54 | Logical AND with accumulator ((zero page),Y)
	ROL $2C56			; 2E 56 2C | Rotate left (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	BIT $2A5A			; 2C 5A 2A | Test bits in accumulator (absolute)
	JMP $265828		  ; 5C 28 58 26 | Jump to address long
	CLI				  ; 58 | Clear interrupt disable flag
	BIT $60			  ; 24 60 | Test bits in accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $66			  ; 25 66 | Logical AND with accumulator (zero page)
	AND #$68			 ; 29 68 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	AND $2F6B			; 2D 6B 2F | Logical AND with accumulator (absolute)
	ADC $7333,Y		  ; 79 33 73 | Add with carry (absolute,Y)
	AND ($77),Y		  ; 31 77 | Logical AND with accumulator ((zero page),Y)
	AND $407B,X		  ; 3D 7B 40 | Logical AND with accumulator (absolute,X)
	STA ($47,X)		  ; 81 47 | Update graphics data
	STY $47			  ; 84 47 | Store Y register to zero page
	STA $4D			  ; 85 4D | Update graphics data
	STA $52			  ; 85 52 | Update graphics data
	STY $56			  ; 84 56 | Store Y register to zero page
	SEC				  ; 38 | Set carry flag
	STA $3A			  ; 85 3A | Update graphics data
	BIT #$3E			 ; 89 3E | Test bits in accumulator (immediate)
	STY $9842			; 8C 42 98 | Store Y register to absolute address
	LSR $96			  ; 46 96 | Logical shift right (zero page)
	RTI				  ; 40 | Return from interrupt
	LSR				  ; 4A | Logical shift right (accumulator)
	TXS				  ; 9A | Transfer X register to stack pointer
	LSR $4F9C			; 4E 9C 4F | Logical shift right (absolute)
	STA				  ; 9F 51 A0 53 | Update graphics data
	LDY $56			  ; A4 56 | Load from zero page into Y register
	STA				  ; 9F 59 A5 61 | Update graphics data
	ADC ($A1,X)		  ; 61 A1 | Add with carry ((zero page,X))
	EOR $5F9F,X		  ; 5D 9F 5F | Exclusive OR with accumulator (absolute,X)
	STA $9D61,X		  ; 9D 61 9D | Update graphics data
	STZ $9A			  ; 64 9A | Store zero to zero page
	ADC $98			  ; 65 98 | Add with carry (zero page)
	ROR $97			  ; 66 97 | Rotate right (zero page)
	ROR $95			  ; 66 95 | Rotate right (zero page)
	ADC #$93			 ; 69 93 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_27A
; Address: $D3BDBB
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_27A:
	ADC $91			  ; 65 91 | Add with carry (zero page)
	STZ $8F			  ; 64 8F | Store zero to zero page
	STA $8B61			; 8D 61 8B | Update graphics data
	BIT #$59			 ; 89 59 | Test bits in accumulator (immediate)
	STA $5F			  ; 85 5F | Update graphics data
	EOR $5781,Y		  ; 59 81 57 | Exclusive OR with accumulator (absolute,Y)
	ADC $7B4F,X		  ; 7D 4F 7B | Add with carry (absolute,X)
	ADC $7E48,Y		  ; 79 48 7E | Add with carry (absolute,Y)
	EOR $75			  ; 45 75 | Exclusive OR with accumulator (zero page)
	EOR ($72,X)		  ; 41 72 | Exclusive OR with accumulator ((zero page,X))
	ADC ($3D),Y		  ; 71 3D | Add with carry ((zero page),Y)
	BVS $3C			  ; 70 3C | Branch if overflow set
	BVS $3C			  ; 70 3C | Branch if overflow set
	ADC ($3D),Y		  ; 71 3D | Add with carry ((zero page),Y)
	ROL $4076,X		  ; 3E 76 40 | Rotate left (absolute,X)
	ADC $7C49,Y		  ; 79 49 7C | Add with carry (absolute,Y)
	LSR $80			  ; 46 80 | Logical shift right (zero page)
	EOR #$84			 ; 49 84 | Exclusive OR with accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	LSR $5788			; 4E 88 57 | Logical shift right (absolute)
	EOR $5B85,Y		  ; 59 85 5B | Exclusive OR with accumulator (absolute,Y)
	JMP $795D87		  ; 5C 87 5D 79 | Jump to address long
	EOR $5D82,X		  ; 5D 82 5D | Exclusive OR with accumulator (absolute,X)
	ROR $785C,X		  ; 7E 5C 78 | Rotate right (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	BRA $58			  ; 80 58 | Branch always
	STY $57			  ; 84 57 | Store Y register to zero page
	STA ($53,X)		  ; 81 53 | Update graphics data
	STA ($52,X)		  ; 81 52 | Update graphics data
	EOR ($7C),Y		  ; 51 7C | Exclusive OR with accumulator ((zero page),Y)
	EOR ($7B),Y		  ; 51 7B | Exclusive OR with accumulator ((zero page),Y)
	EOR ($7D),Y		  ; 51 7D | Exclusive OR with accumulator ((zero page),Y)
	STA ($54,X)		  ; 81 54 | Update graphics data
	STY $56			  ; 84 56 | Store Y register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	BIT #$5D			 ; 89 5D | Test bits in accumulator (immediate)
	STY $8E55			; 8C 55 8E | Store Y register to absolute address
	STZ $8F			  ; 64 8F | Store zero to zero page
	BCC $67			  ; 90 67 | Branch if carry clear
	BCC $66			  ; 90 66 | Branch if carry clear
	BCC $65			  ; 90 65 | Branch if carry clear
	BCC $63			  ; 90 63 | Branch if carry clear
	STA $5D8E60		  ; 8F 60 8E 5D | Update graphics data
	BIT #$5A			 ; 89 5A | Test bits in accumulator (immediate)
	STY $8A52			; 8C 52 8A | Store Y register to absolute address
	BIT #$51			 ; 89 51 | Test bits in accumulator (immediate)
	LSR $4C80			; 4E 80 4C | Logical shift right (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	STX $48			  ; 86 48 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_27B
; Address: $D3BE48
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_27B:
	STA ($47,X)		  ; 81 47 | Update graphics data
	LSR $7B			  ; 46 7B | Logical shift right (zero page)
	LSR $7D			  ; 46 7D | Logical shift right (zero page)
	EOR #$79			 ; 49 79 | Exclusive OR with accumulator (immediate)
	JMP $4E78			; 4C 78 4E | Jump to address
	LSR $4C74			; 4E 74 4C | Logical shift right (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	ADC ($43),Y		  ; 71 43 | Add with carry ((zero page),Y)
	ADC ($40),Y		  ; 71 40 | Add with carry ((zero page),Y)
	BVS $3D			  ; 70 3D | Branch if overflow set
	BVS $3A			  ; 70 3A | Branch if overflow set
	BVS $37			  ; 70 37 | Branch if overflow set
	BVS $34			  ; 70 34 | Branch if overflow set
	BVS $31			  ; 70 31 | Branch if overflow set
	ADC ($2F),Y		  ; 71 2F | Add with carry ((zero page),Y)
	AND $2B73			; 2D 73 2B | Logical AND with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$79			 ; 29 79 | Logical AND with accumulator (immediate)
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	STA				  ; 9F 54 9E 56 | Update graphics data
	STZ $9A57			; 9C 57 9A | Store zero to absolute
	CLI				  ; 58 | Clear interrupt disable flag
	TYA				  ; 98 | Transfer Y register to accumulator
	EOR $5995,Y		  ; 59 95 59 | Exclusive OR with accumulator (absolute,Y)
	EOR $598F,Y		  ; 59 8F 59 | Exclusive OR with accumulator (absolute,Y)
	STY $8959			; 8C 59 89 | Store Y register to absolute address
	CLI				  ; 58 | Clear interrupt disable flag
	STX $58			  ; 86 58 | Store X register to zero page
	STA $8157			; 8D 57 81 | Update graphics data
	ADC $7B55,X		  ; 7D 55 7B | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	EOR ($7D),Y		  ; 51 7D | Exclusive OR with accumulator ((zero page),Y)
	BVC $80			  ; 50 80 | Branch if overflow clear
	EOR $4C82			; 4D 82 4C | Exclusive OR with accumulator (absolute)
	LSR $4A83			; 4E 83 4A | Logical shift right (absolute)
	PHA				  ; 48 | Push accumulator to stack
	STA ($43,X)		  ; 81 43 | Update graphics data
	WDM #$7D			 ; 42 7D | Reserved instruction
	EOR #$7B			 ; 49 7B | Exclusive OR with accumulator (immediate)
	WDM #$78			 ; 42 78 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	AND $406F,X		  ; 3D 6F 40 | Logical AND with accumulator (absolute,X)
	JMP ($693B)		  ; 6C 3B 69 | Jump to address (absolute indirect)
	DEC				  ; 3A | Decrement accumulator
	ROR $39			  ; 66 39 | Rotate right (zero page)
	STZ $39			  ; 64 39 | Store zero to zero page
	AND $3962,Y		  ; 39 62 39 | Logical AND with accumulator (absolute,Y)
	ROR $3A			  ; 66 3A | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_27C
; Address: $D3BED0
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_27C:
	ADC $3B			  ; 65 3B | Add with carry (zero page)
	AND $406C,X		  ; 3D 6C 40 | Logical AND with accumulator (absolute,X)
	ADC ($42,X)		  ; 61 42 | Hardware register operation
	EOR $75			  ; 45 75 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	JMP $4E78			; 4C 78 4E | Jump to address
	SEI				  ; 78 | Set interrupt disable flag
	EOR $4A78			; 4D 78 4A | Exclusive OR with accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	WDM #$72			 ; 42 72 | Reserved instruction
	EOR $71			  ; 45 71 | Exclusive OR with accumulator (zero page)
	EOR #$6F			 ; 49 6F | Exclusive OR with accumulator (immediate)
	LSR $516E			; 4E 6E 51 | Logical shift right (absolute)
	ADC $6C4B			; 6D 4B 6C | Add with carry (absolute)
	JMP ($6C50)		  ; 6C 50 6C | Jump to address (absolute indirect)
	WDM #$6D			 ; 42 6D | Reserved instruction
	LSR $6E			  ; 46 6E | Logical shift right (zero page)
	BVS $42			  ; 70 42 | Hardware register operation
	EOR ($7B,X)		  ; 41 7B | Exclusive OR with accumulator ((zero page,X))
	EOR ($7E,X)		  ; 41 7E | Exclusive OR with accumulator ((zero page,X))
	EOR ($72,X)		  ; 41 72 | Exclusive OR with accumulator ((zero page,X))
	WDM #$75			 ; 42 75 | Reserved instruction
	EOR $80			  ; 45 80 | Exclusive OR with accumulator (zero page)
	EOR #$83			 ; 49 83 | Exclusive OR with accumulator (immediate)
	EOR $5080			; 4D 80 50 | Exclusive OR with accumulator (absolute)
	BIT #$53			 ; 89 53 | Test bits in accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	STY $8D58			; 8C 58 8D | Store Y register to absolute address
	EOR $598D,Y		  ; 59 8D 59 | Exclusive OR with accumulator (absolute,Y)
	STY $8A58			; 8C 58 8A | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	STX $54			  ; 86 54 | Store X register to zero page
	STY $4B			  ; 84 4B | Store Y register to zero page
	STA ($50,X)		  ; 81 50 | Update graphics data
	LSR $4C7A			; 4E 7A 4C | Logical shift right (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	BVS $46			  ; 70 46 | Branch if overflow set
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	WDM #$70			 ; 42 70 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	ROL $3C68,X		  ; 3E 68 3C | Rotate left (absolute,X)
	ROR $3A			  ; 66 3A | Rotate right (zero page)
	ADC $38			  ; 65 38 | Add with carry (zero page)
	STZ $36			  ; 64 36 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_27E
; Address: $D3BF4A
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_27E:
	ROR $2C			  ; 66 2C | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	BIT $2A6A			; 2C 6A 2A | Test bits in accumulator (absolute)
	JMP ($6828)		  ; 6C 28 68 | Jump to address (absolute indirect)
	ROL $68			  ; 26 68 | Rotate left (zero page)
	BIT $70			  ; 24 70 | Test bits in accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $76			  ; 25 76 | Logical AND with accumulator (zero page)
	AND #$78			 ; 29 78 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	PLY				  ; 7A | Pull Y register from stack
	AND $2F7B			; 2D 7B 2F | Logical AND with accumulator (absolute)
	STA $37			  ; 85 37 | Update graphics data
	BIT #$33			 ; 89 33 | Test bits in accumulator (immediate)
	AND ($87),Y		  ; 31 87 | Logical AND with accumulator ((zero page),Y)
	AND $408B,X		  ; 3D 8B 40 | Logical AND with accumulator (absolute,X)
	STA $479144		  ; 8F 44 91 47 | Update graphics data
	EOR $5295			; 4D 95 52 | Exclusive OR with accumulator (absolute)
	AND ($71),Y		  ; 31 71 | Logical AND with accumulator ((zero page),Y)
	ADC $6B35			; 6D 35 6B | Add with carry (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	AND $3C69,Y		  ; 39 69 3C | Logical AND with accumulator (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	WDM #$68			 ; 42 68 | Reserved instruction
	EOR $68			  ; 45 68 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$44			 ; 69 44 | Add with carry (immediate)
	ADC #$50			 ; 69 50 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_27F
; Address: $D3BF9E
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_27F:
	JMP ($6D57)		  ; 6C 57 6D | Jump to address (absolute indirect)
	ROR $6F56			; 6E 56 6F | Rotate right (absolute)
	BVS $51			  ; 70 51 | Branch if overflow set
	ADC ($4F),Y		  ; 71 4F | Add with carry ((zero page),Y)
	LSR $4E75			; 4E 75 4E | Logical shift right (absolute)
	BVC $79			  ; 50 79 | Branch if overflow clear
	ROR $7F54,X		  ; 7E 54 7F | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	EOR $5C7F,Y		  ; 59 7F 5C | Exclusive OR with accumulator (absolute,Y)
	STA ($5A,X)		  ; 81 5A | Update graphics data
	STY $65			  ; 84 65 | Store Y register to zero page
	STA ($68,X)		  ; 81 68 | Update graphics data
	STX $6B			  ; 86 6B | Store X register to zero page
	ADC $6E88			; 6D 88 6E | Add with carry (absolute)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_280
; Address: $D3BFCE
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_280:
	DEY				  ; 88 | Decrement Y register
	JMP ($5D87)		  ; 6C 87 5D | Jump to address (absolute indirect)
	STX $65			  ; 86 65 | Store X register to zero page
	STY $70			  ; 84 70 | Store Y register to zero page
	STA ($5E,X)		  ; 81 5E | Update graphics data
	JMP $795A7C		  ; 5C 7C 5A 79 | Jump to address long
	EOR $5975,Y		  ; 59 75 59 | Exclusive OR with accumulator (absolute,Y)
	EOR $5A74,Y		  ; 59 74 5A | Exclusive OR with accumulator (absolute,Y)
	ADC $795D,Y		  ; 79 5D 79 | Add with carry (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_281
; Address: $D3BFEE
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_281:
	SEI				  ; 78 | Set interrupt disable flag
	STZ $70			  ; 64 70 | Store zero to zero page
	ADC $76			  ; 65 76 | Add with carry (zero page)
	ADC $7A			  ; 65 7A | Add with carry (zero page)
	ADC $71			  ; 65 71 | Add with carry (zero page)
	STZ $7F			  ; 64 7F | Store zero to zero page
	ADC ($7D,X)		  ; 61 7D | Add with carry ((zero page,X))
	BRA $53			  ; 80 53 | Branch always
	BRA $5F			  ; 80 5F | Branch always
	BRA $5C			  ; 80 5C | Branch always
	EOR ($7C),Y		  ; 51 7C | Exclusive OR with accumulator ((zero page),Y)
	LSR $5178			; 4E 78 51 | Logical shift right (absolute)
	PHA				  ; 48 | Push accumulator to stack
	ADC ($46),Y		  ; 71 46 | Add with carry ((zero page),Y)
	ROR $6B45			; 6E 45 6B | Rotate right (absolute)
	ADC #$44			 ; 69 44 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	EOR $68			  ; 45 68 | Exclusive OR with accumulator (zero page)
	ADC #$49			 ; 69 49 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_282
; Address: $D3C021
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_282:
	EOR $506D			; 4D 6D 50 | Exclusive OR with accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	ADC ($57),Y		  ; 71 57 | Add with carry ((zero page),Y)
	JMP $775F75		  ; 5C 75 5F 77 | Jump to address long
	ADC ($79,X)		  ; 61 79 | Add with carry ((zero page,X))
	ADC $7F61,X		  ; 7D 61 7F | Add with carry (absolute,X)
	STA ($69,X)		  ; 81 69 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_283
; Address: $D3C03A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_283:
	STA $6C			  ; 85 6C | Update graphics data
	ADC $7189			; 6D 89 71 | Add with carry (absolute)
	PHB				  ; 8B | Push data bank register to stack
	ROR $6E8D			; 6E 8D 6E | Rotate right (absolute)
	STA $6C906D		  ; 8F 6D 90 6C | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_284
; Address: $D3C04B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_284:
	ADC #$95			 ; 69 95 | Add with carry (immediate)
	ADC $97			  ; 65 97 | Add with carry (zero page)
	ADC #$99			 ; 69 99 | Add with carry (immediate)
	ADC #$9B			 ; 69 9B | Add with carry (immediate)
	ADC ($9D,X)		  ; 61 9D | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_285
; Address: $D3C057
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_285:
	LSR $5B97,X		  ; 5E 97 5B | Logical shift right (absolute,X)
	STZ $9859			; 9C 59 98 | Store zero to absolute
	JMP $488E			; 4C 8E 48 | Jump to address
	TXA				  ; 8A | Transfer X register to accumulator
	LSR $4A8E			; 4E 8E 4A | Logical shift right (absolute)
	BCC $46			  ; 90 46 | Branch if carry clear
	STY $42			  ; 84 42 | Hardware register operation
	STA ($40,X)		  ; 81 40 | Update graphics data
	ADC $7A3E,X		  ; 7D 3E 7A | Add with carry (absolute,X)
	AND $3C6E,X		  ; 3D 6E 3C | Logical AND with accumulator (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	AND $3F6F,X		  ; 3D 6F 3F | Logical AND with accumulator (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_286
; Address: $D3C07D
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_286:
	LSR $5A8A,X		  ; 5E 8A 5A | Logical shift right (absolute,X)
	STY $8D55			; 8C 55 8D | Store Y register to absolute address
	STA $8C5B			; 8D 5B 8C | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	JMP $4889			; 4C 89 48 | Jump to address
	EOR $83			  ; 45 83 | Exclusive OR with accumulator (zero page)
	AND $3B7F,Y		  ; 39 7F 3B | Logical AND with accumulator (absolute,Y)
	STA ($3B,X)		  ; 81 3B | Update graphics data
	ADC $7737,X		  ; 7D 37 77 | Add with carry (absolute,X)
	AND ($70),Y		  ; 31 70 | Logical AND with accumulator ((zero page),Y)
	AND $326E			; 2D 6E 32 | Logical AND with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_288
; Address: $D3C0A7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_288:
	BMI $60			  ; 30 60 | Branch if negative
	STZ $34			  ; 64 34 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_289
; Address: $D3C0B0
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_289:
	LSR $5D37,X		  ; 5E 37 5D | Logical shift right (absolute,X)
	AND $3A5C,Y		  ; 39 5C 3A | Logical AND with accumulator (absolute,Y)
	ROL $4058,X		  ; 3E 58 40 | Rotate left (absolute,X)
	JMP $445D42		  ; 5C 42 5D 44 | Jump to address long
	LSR $6046,X		  ; 5E 46 60 | Logical shift right (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	ROR $684A			; 6E 4A 68 | Rotate right (absolute)
	JMP $4E62			; 4C 62 4E | Jump to address
	BVC $68			  ; 50 68 | Branch if overflow clear
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $7256			; 6D 56 72 | Add with carry (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	ADC $7C5C,Y		  ; 79 5C 7C | Add with carry (absolute,Y)
	LSR $5F7E,X		  ; 5E 7E 5F | Logical shift right (absolute,X)
	BRA $60			  ; 80 60 | Branch always
	ADC ($84,X)		  ; 61 84 | Add with carry ((zero page,X))
	ADC ($85,X)		  ; 61 85 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_28B
; Address: $D3C0E9
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_28B:
	CLI				  ; 58 | Clear interrupt disable flag
	STA ($55,X)		  ; 81 55 | Update graphics data
	SEI				  ; 78 | Set interrupt disable flag
	EOR ($7B),Y		  ; 51 7B | Exclusive OR with accumulator ((zero page),Y)
	EOR $4A78			; 4D 78 4A | Exclusive OR with accumulator (absolute)
	ADC $6A49			; 6D 49 6A | Add with carry (absolute)
	EOR #$76			 ; 49 76 | Exclusive OR with accumulator (immediate)
	EOR #$73			 ; 49 73 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	JMP $4E68			; 4C 68 4E | Jump to address
	ROR $4A			  ; 66 4A | Rotate right (zero page)
	ADC $58			  ; 65 58 | Add with carry (zero page)
	STZ $4F			  ; 64 4F | Store zero to zero page
	STZ $53			  ; 64 53 | Store zero to zero page
	STZ $59			  ; 64 59 | Store zero to zero page
	ADC $56			  ; 65 56 | Add with carry (zero page)
	ROR $51			  ; 66 51 | Rotate right (zero page)
	EOR $4A69			; 4D 69 4A | Exclusive OR with accumulator (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	BVC $6C			  ; 50 6C | Branch if overflow clear
	BVC $6E			  ; 50 6E | Branch if overflow clear
	BVS $56			  ; 70 56 | Branch if overflow set
	BVS $54			  ; 70 54 | Branch if overflow set
	BVS $50			  ; 70 50 | Branch if overflow set
	EOR $4A6D			; 4D 6D 4A | Exclusive OR with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_28C
; Address: $D3C123
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_28C:
	PHA				  ; 48 | Push accumulator to stack
	EOR $6445,Y		  ; 59 45 64 | Exclusive OR with accumulator (absolute,Y)
	JMP ($5D42)		  ; 6C 42 5D | Jump to address (absolute indirect)
	EOR ($5E,X)		  ; 41 5E | Exclusive OR with accumulator ((zero page,X))
	EOR ($5A,X)		  ; 41 5A | Exclusive OR with accumulator ((zero page,X))
	EOR ($5B,X)		  ; 41 5B | Exclusive OR with accumulator ((zero page,X))
	EOR ($5C,X)		  ; 41 5C | Exclusive OR with accumulator ((zero page,X))
	WDM #$5E			 ; 42 5E | Reserved instruction
	ADC ($48,X)		  ; 61 48 | Add with carry ((zero page,X))
	STZ $45			  ; 64 45 | Store zero to zero page
	PHA				  ; 48 | Push accumulator to stack
	ADC $704A			; 6D 4A 70 | Add with carry (absolute)
	EOR ($73),Y		  ; 51 73 | Exclusive OR with accumulator ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	BVC $79			  ; 50 79 | Branch if overflow clear
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	CLI				  ; 58 | Clear interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	EOR $5A75,Y		  ; 59 75 5A | Exclusive OR with accumulator (absolute,Y)
	JMP $735D72		  ; 5C 72 5D 73 | Jump to address long
	LSR $5F75,X		  ; 5E 75 5F | Logical shift right (absolute,X)
	ADC $8560,Y		  ; 79 60 85 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_28E
; Address: $D3C166
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_28E:
	ROR $8161,X		  ; 7E 61 81 | Rotate right (absolute,X)
	ADC ($84,X)		  ; 61 84 | Add with carry ((zero page,X))
	ADC ($87,X)		  ; 61 87 | Add with carry ((zero page,X))
	ADC ($8A,X)		  ; 61 8A | Add with carry ((zero page,X))
	ADC ($8D,X)		  ; 61 8D | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_28F
; Address: $D3C172
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_28F:
	BCC $5F			  ; 90 5F | Branch if carry clear
	LSR $5C94,X		  ; 5E 94 5C | Logical shift right (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	CLI				  ; 58 | Clear interrupt disable flag
	TYA				  ; 98 | Transfer Y register to accumulator
	EOR $59			  ; 45 59 | Exclusive OR with accumulator (zero page)
	LSR $59			  ; 46 59 | Logical shift right (zero page)
	EOR #$5C			 ; 49 5C | Exclusive OR with accumulator (immediate)
	LSR $5E4D,X		  ; 5E 4D 5E | Logical shift right (absolute,X)
	LSR $62			  ; 46 62 | Logical shift right (zero page)
	LSR $604F,X		  ; 5E 4F 60 | Logical shift right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_290
; Address: $D3C192
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_290:
	STZ $56			  ; 64 56 | Store zero to zero page
	ADC $5C			  ; 65 5C | Add with carry (zero page)
	JMP $6B5F67		  ; 5C 67 5F 6B | Jump to address long
	ADC ($6D,X)		  ; 61 6D | Add with carry ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	ROR $6D58			; 6E 58 6D | Rotate right (absolute)
	JMP $715D6B		  ; 5C 6B 5D 71 | Jump to address long
	ADC ($75,X)		  ; 61 75 | Add with carry ((zero page,X))
	ADC ($78,X)		  ; 61 78 | Add with carry ((zero page,X))
	ADC $7D			  ; 65 7D | Add with carry (zero page)
	ROR $7A			  ; 66 7A | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $8068,X		  ; 7D 68 80 | Add with carry (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($6C84)		  ; 6C 84 6C | Jump to address (absolute indirect)
	STX $6C			  ; 86 6C | Store X register to zero page
	STX $6E			  ; 86 6E | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	ROR $6C88			; 6E 88 6C | Rotate right (absolute)
	STX $6C			  ; 86 6C | Store X register to zero page
	STX $6C			  ; 86 6C | Store X register to zero page
	STY $6A			  ; 84 6A | Store Y register to zero page
	STY $68			  ; 84 68 | Store Y register to zero page
	BRA $68			  ; 80 68 | Branch always
	BRA $66			  ; 80 66 | Branch always
	ADC $7665,X		  ; 7D 65 76 | Add with carry (absolute,X)
	EOR $5877,X		  ; 5D 77 58 | Exclusive OR with accumulator (absolute,X)
	BVS $55			  ; 70 55 | Branch if overflow set
	BVS $5C			  ; 70 5C | Branch if overflow set
	ADC $6B56			; 6D 56 6B | Add with carry (absolute)
	JMP ($6753)		  ; 6C 53 67 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_291
; Address: $D3C1E2
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_291:
	ADC $4B			  ; 65 4B | Add with carry (zero page)
	STZ $4A			  ; 64 4A | Store zero to zero page
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC ($4B,X)		  ; 61 4B | Add with carry ((zero page,X))
	EOR $515E			; 4D 5E 51 | Exclusive OR with accumulator (absolute)
	EOR $5D51,X		  ; 5D 51 5D | Exclusive OR with accumulator (absolute,X)
	LSR $6058,X		  ; 5E 58 60 | Logical shift right (absolute,X)
	JMP $625C62		  ; 5C 62 5C 62 | Jump to address long
	ADC $5F			  ; 65 5F | Add with carry (zero page)
	ADC ($6B,X)		  ; 61 6B | Add with carry ((zero page,X))
	ADC ($6B,X)		  ; 61 6B | Add with carry ((zero page,X))
	JMP ($6E74)		  ; 6C 74 6E | Jump to address (absolute indirect)
	ADC $76			  ; 65 76 | Add with carry (zero page)
	ROR $78			  ; 66 78 | Rotate right (zero page)
	ROR $78			  ; 66 78 | Rotate right (zero page)
	ROR $76			  ; 66 76 | Rotate right (zero page)
	ROR $74			  ; 66 74 | Rotate right (zero page)
	ROR $70			  ; 66 70 | Rotate right (zero page)
	ADC $6E			  ; 65 6E | Add with carry (zero page)
	ADC $6E			  ; 65 6E | Add with carry (zero page)
	STZ $6D			  ; 64 6D | Store zero to zero page
	ADC ($6B,X)		  ; 61 6B | Add with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_292
; Address: $D3C21F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_292:
	EOR $5E6B,X		  ; 5D 6B 5E | Exclusive OR with accumulator (absolute,X)
	ADC #$61			 ; 69 61 | Add with carry (immediate)
	ADC #$63			 ; 69 63 | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_294
; Address: $D3C22A
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_294:
	ROR $7065			; 6E 65 70 | Rotate right (absolute)
	ROR $74			  ; 66 74 | Rotate right (zero page)
	ROR $74			  ; 66 74 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $7D6A,X		  ; 7D 6A 7D | Add with carry (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $7968,X		  ; 7D 68 79 | Add with carry (absolute,X)
	ROR $6D61			; 6E 61 6D | Rotate right (absolute)
	ADC $6D5F			; 6D 5F 6D | Add with carry (absolute)
	EOR $5867,X		  ; 5D 67 58 | Exclusive OR with accumulator (absolute,X)
	STZ $51			  ; 64 51 | Store zero to zero page
	PHY				  ; 5A | Push Y register to stack
	EOR $5B62,X		  ; 5D 62 5B | Exclusive OR with accumulator (absolute,X)
	STZ $5D			  ; 64 5D | Store zero to zero page
	STZ $5F			  ; 64 5F | Store zero to zero page
	ADC ($62,X)		  ; 61 62 | Add with carry ((zero page,X))
	ADC ($6E,X)		  ; 61 6E | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_296
; Address: $D3C266
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_296:
	LSR $5D56,X		  ; 5E 56 5D | Logical shift right (absolute,X)
	LSR $6454,X		  ; 5E 54 64 | Logical shift right (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $5A5C58		  ; 5C 58 5C 5A | Jump to address long
	ADC $5D			  ; 65 5D | Add with carry (zero page)
	ADC ($6B,X)		  ; 61 6B | Add with carry ((zero page,X))
	ADC ($6B,X)		  ; 61 6B | Add with carry ((zero page,X))
	ADC $6D61			; 6D 61 6D | Add with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_297
; Address: $D3C27F
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_297:
	AND $2C6F			; 2D 6F 2C | Logical AND with accumulator (absolute)
	BIT $2D7A			; 2C 7A 2D | Test bits in accumulator (absolute)
	ROR $7A2E			; 6E 2E 7A | Rotate right (absolute)
	BMI $7D			  ; 30 7D | Branch if negative
	STA ($36,X)		  ; 81 36 | Update graphics data
	STY $3A			  ; 84 3A | Store Y register to zero page
	BCC $3E			  ; 90 3E | Branch if carry clear
	STX $8A38			; 8E 38 8A | Store X register to absolute address
	STX $9242			; 8E 42 92 | Store X register to absolute address
	LSR $94			  ; 46 94 | Logical shift right (zero page)
	EOR #$98			 ; 49 98 | Exclusive OR with accumulator (immediate)
	STZ $974E			; 9C 4E 97 | Store zero to absolute
	EOR ($9D),Y		  ; 51 9D | Exclusive OR with accumulator ((zero page),Y)
	EOR $599B,Y		  ; 59 9B 59 | Exclusive OR with accumulator (absolute,Y)
	STA $9755,Y		  ; 99 55 97 | Update graphics data
	EOR $5B95,Y		  ; 59 95 5B | Exclusive OR with accumulator (absolute,Y)
	JMP $905D92		  ; 5C 92 5D 90 | Jump to address long
	LSR $5E8F,X		  ; 5E 8F 5E | Logical shift right (absolute,X)
	STA $8B61			; 8D 61 8B | Update graphics data
	EOR $5C89,X		  ; 5D 89 5C | Exclusive OR with accumulator (absolute,X)
	STA $59			  ; 85 59 | Update graphics data
	STA ($51,X)		  ; 81 51 | Update graphics data
	ADC $7B57,X		  ; 7D 57 7B | Add with carry (absolute,X)
	EOR ($79),Y		  ; 51 79 | Exclusive OR with accumulator ((zero page),Y)
	JMP $4775			; 4C 75 47 | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC ($40),Y		  ; 71 40 | Add with carry ((zero page),Y)
	AND $3B6D,X		  ; 3D 6D 3B | Logical AND with accumulator (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_298
; Address: $D3C2DB
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_298:
	AND $376A,Y		  ; 39 6A 37 | Logical AND with accumulator (absolute,Y)
	ADC #$35			 ; 69 35 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$35			 ; 69 35 | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_299
; Address: $D3C2E8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_299:
	ROR $7138			; 6E 38 71 | Rotate right (absolute)
	EOR ($74,X)		  ; 41 74 | Exclusive OR with accumulator ((zero page,X))
	ROL $4178,X		  ; 3E 78 41 | Rotate left (absolute,X)
	JMP $4F7F			; 4C 7F 4F | Jump to address
	BRA $43			  ; 80 43 | Branch always
	BRA $46			  ; 80 46 | Branch always

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_29A
; Address: $D3C2F8
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_29A:
	BRA $4F			  ; 80 4F | Branch always
	EOR ($7D),Y		  ; 51 7D | Exclusive OR with accumulator ((zero page),Y)
	ADC ($55),Y		  ; 71 55 | Add with carry ((zero page),Y)
	PLY				  ; 7A | Pull Y register from stack
	BVS $53			  ; 70 53 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	BVC $7C			  ; 50 7C | Branch if overflow clear
	EOR $4B79			; 4D 79 4B | Exclusive OR with accumulator (absolute)
	ADC $774A,Y		  ; 79 4A 77 | Add with carry (absolute,Y)
	EOR #$74			 ; 49 74 | Exclusive OR with accumulator (immediate)
	EOR #$73			 ; 49 73 | Exclusive OR with accumulator (immediate)
	EOR #$75			 ; 49 75 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $7C4C,Y		  ; 79 4C 7C | Add with carry (absolute,Y)
	LSR $607F			; 4E 7F 60 | Logical shift right (absolute)
	STA ($55,X)		  ; 81 55 | Update graphics data
	STY $4D			  ; 84 4D | Store Y register to zero page
	STX $5C			  ; 86 5C | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	LSR $5D88,X		  ; 5E 88 5D | Logical shift right (absolute,X)
	DEY				  ; 88 | Decrement Y register
	CLI				  ; 58 | Clear interrupt disable flag
	STX $55			  ; 86 55 | Store X register to zero page
	STA ($52,X)		  ; 81 52 | Update graphics data
	STY $4A			  ; 84 4A | Store Y register to zero page
	JMP $4981			; 4C 81 49 | Jump to address
	LSR $78			  ; 46 78 | Logical shift right (zero page)
	WDM #$7E			 ; 42 7E | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	ADC $773F,Y		  ; 79 3F 77 | Add with carry (absolute,Y)
	ROL $3E73,X		  ; 3E 73 3E | Rotate left (absolute,X)
	EOR ($71,X)		  ; 41 71 | Exclusive OR with accumulator ((zero page,X))
	BVS $46			  ; 70 46 | Branch if overflow set
	ROR $6D47			; 6E 47 6D | Rotate right (absolute)
	LSR $6C			  ; 46 6C | Logical shift right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_29B
; Address: $D3C35F
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_29B:
	WDM #$6A			 ; 42 6A | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$3B			 ; 69 3B | Add with carry (immediate)
	ADC #$38			 ; 69 38 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	BIT $2968			; 2C 68 29 | Test bits in accumulator (absolute)
	ADC #$27			 ; 69 27 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	AND $6B			  ; 25 6B | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_29C
; Address: $D3C378
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_29C:
	ADC $6F22			; 6D 22 6F | Add with carry (absolute)
	AND ($71,X)		  ; 21 71 | Logical AND with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	TYA				  ; 98 | Transfer Y register to accumulator
	PHY				  ; 5A | Push Y register to stack
	JMP $945E96		  ; 5C 96 5E 94 | Jump to address long
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_29D
; Address: $D3C388
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_29D:
	BCC $61			  ; 90 61 | Branch if carry clear
	STA $8A61			; 8D 61 8A | Update graphics data
	ADC ($87,X)		  ; 61 87 | Add with carry ((zero page,X))
	ADC ($84,X)		  ; 61 84 | Add with carry ((zero page,X))
	ADC ($81,X)		  ; 61 81 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_29E
; Address: $D3C394
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_29E:
	ROR $8560,X		  ; 7E 60 85 | Rotate right (absolute,X)
	ADC $775F,Y		  ; 79 5F 77 | Add with carry (absolute,Y)
	LSR $5D75,X		  ; 5E 75 5D | Logical shift right (absolute,X)
	JMP $725B72		  ; 5C 72 5B 72 | Jump to address long
	PHY				  ; 5A | Push Y register to stack
	EOR $5875,Y		  ; 59 75 58 | Exclusive OR with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	BVC $79			  ; 50 79 | Branch if overflow clear
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR ($73),Y		  ; 51 73 | Exclusive OR with accumulator ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	BVS $48			  ; 70 48 | Branch if overflow set
	ADC $6F47			; 6D 47 6F | Add with carry (absolute)
	EOR $67			  ; 45 67 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	STZ $43			  ; 64 43 | Store zero to zero page
	ADC ($42,X)		  ; 61 42 | Hardware register operation
	LSR $5C41,X		  ; 5E 41 5C | Logical shift right (absolute,X)
	EOR ($5B,X)		  ; 41 5B | Exclusive OR with accumulator ((zero page,X))
	EOR ($5A,X)		  ; 41 5A | Exclusive OR with accumulator ((zero page,X))
	EOR ($5E,X)		  ; 41 5E | Exclusive OR with accumulator ((zero page,X))
	WDM #$5D			 ; 42 5D | Reserved instruction
	JMP ($6445)		  ; 6C 45 64 | Jump to address (absolute indirect)
	PHA				  ; 48 | Push accumulator to stack
	EOR $6B4A,Y		  ; 59 4A 6B | Exclusive OR with accumulator (absolute,Y)
	EOR $506D			; 4D 6D 50 | Exclusive OR with accumulator (absolute)
	BVS $56			  ; 70 56 | Branch if overflow set
	BVS $55			  ; 70 55 | Branch if overflow set
	BVS $52			  ; 70 52 | Branch if overflow set
	BVC $6E			  ; 50 6E | Branch if overflow clear
	BVC $6C			  ; 50 6C | Branch if overflow clear
	LSR				  ; 4A | Logical shift right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	EOR $5169			; 4D 69 51 | Exclusive OR with accumulator (absolute)
	ROR $59			  ; 66 59 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_29F
; Address: $D3C3F2
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_29F:
	ADC $53			  ; 65 53 | Add with carry (zero page)
	STZ $4F			  ; 64 4F | Store zero to zero page
	STZ $58			  ; 64 58 | Store zero to zero page
	STZ $4A			  ; 64 4A | Store zero to zero page
	ADC $4E			  ; 65 4E | Add with carry (zero page)
	ROR $4C			  ; 66 4C | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	EOR #$73			 ; 49 73 | Exclusive OR with accumulator (immediate)
	EOR #$76			 ; 49 76 | Exclusive OR with accumulator (immediate)
	EOR #$6A			 ; 49 6A | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $784D			; 6D 4D 78 | Add with carry (absolute)
	EOR ($7B),Y		  ; 51 7B | Exclusive OR with accumulator ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	STA ($5B,X)		  ; 81 5B | Update graphics data
	LSR $6084,X		  ; 5E 84 60 | Logical shift right (absolute,X)
	STA $61			  ; 85 61 | Update graphics data
	STA $61			  ; 85 61 | Update graphics data
	STY $60			  ; 84 60 | Store Y register to zero page
	BRA $5E			  ; 80 5E | Branch always
	ROR $7C5C,X		  ; 7E 5C 7C | Rotate right (absolute,X)
	ADC $6F58,Y		  ; 79 58 6F | Add with carry (absolute,Y)
	ADC $6A52			; 6D 52 6A | Add with carry (absolute)
	BVC $68			  ; 50 68 | Branch if overflow clear
	LSR $4C62			; 4E 62 4C | Logical shift right (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	PHA				  ; 48 | Push accumulator to stack
	ROR $6046			; 6E 46 60 | Rotate right (absolute)
	LSR $5D42,X		  ; 5E 42 5D | Logical shift right (absolute,X)
	RTI				  ; 40 | Return from interrupt
	JMP $3C583E		  ; 5C 3E 58 3C | Jump to address long
	DEC				  ; 3A | Decrement accumulator
	AND $375C,Y		  ; 39 5C 37 | Logical AND with accumulator (absolute,Y)
	EOR $5E36,X		  ; 5D 36 5E | Exclusive OR with accumulator (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2A1
; Address: $D3C453
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2A1:
	ROL $2C60			; 2E 60 2C | Rotate left (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2A2
; Address: $D3C459
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2A2:
	AND $316E			; 2D 6E 31 | Logical AND with accumulator (absolute)
	BVS $32			  ; 70 32 | Branch if overflow set
	ADC $813F,X		  ; 7D 3F 81 | Add with carry (absolute,X)
	AND $457F,Y		  ; 39 7F 45 | Logical AND with accumulator (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	JMP $4F89			; 4C 89 4F | Jump to address

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2A3
; Address: $D3C472
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2A3:
	PHB				  ; 8B | Push data bank register to stack
	STY $8D4F			; 8C 4F 8D | Store Y register to absolute address
	STA $8C5A			; 8D 5A 8C | Update graphics data
	LSR $458A,X		  ; 5E 8A 45 | Logical shift right (absolute,X)
	EOR $5946,Y		  ; 59 46 59 | Exclusive OR with accumulator (absolute,Y)
	EOR #$5C			 ; 49 5C | Exclusive OR with accumulator (immediate)
	LSR $5E4D,X		  ; 5E 4D 5E | Logical shift right (absolute,X)
	LSR $62			  ; 46 62 | Logical shift right (zero page)
	LSR $604F,X		  ; 5E 4F 60 | Logical shift right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2A4
; Address: $D3C492
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2A4:
	STZ $56			  ; 64 56 | Store zero to zero page
	ADC $5C			  ; 65 5C | Add with carry (zero page)
	JMP $6B5F67		  ; 5C 67 5F 6B | Jump to address long
	ADC ($6D,X)		  ; 61 6D | Add with carry ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	ROR $6D58			; 6E 58 6D | Rotate right (absolute)
	JMP $715D6B		  ; 5C 6B 5D 71 | Jump to address long
	ADC ($75,X)		  ; 61 75 | Add with carry ((zero page,X))
	ADC ($78,X)		  ; 61 78 | Add with carry ((zero page,X))
	ADC $7D			  ; 65 7D | Add with carry (zero page)
	ROR $7A			  ; 66 7A | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $8068,X		  ; 7D 68 80 | Add with carry (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($6C84)		  ; 6C 84 6C | Jump to address (absolute indirect)
	STX $6C			  ; 86 6C | Store X register to zero page
	STX $6E			  ; 86 6E | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	ROR $6C88			; 6E 88 6C | Rotate right (absolute)
	STX $6C			  ; 86 6C | Store X register to zero page
	STX $6C			  ; 86 6C | Store X register to zero page
	STY $6A			  ; 84 6A | Store Y register to zero page
	STY $68			  ; 84 68 | Store Y register to zero page
	BRA $68			  ; 80 68 | Branch always
	BRA $66			  ; 80 66 | Branch always
	ADC $7665,X		  ; 7D 65 76 | Add with carry (absolute,X)
	EOR $5877,X		  ; 5D 77 58 | Exclusive OR with accumulator (absolute,X)
	BVS $55			  ; 70 55 | Branch if overflow set
	BVS $5C			  ; 70 5C | Branch if overflow set
	ADC $6B56			; 6D 56 6B | Add with carry (absolute)
	JMP ($6753)		  ; 6C 53 67 | Jump to address (absolute indirect)
	ADC $4B			  ; 65 4B | Add with carry (zero page)
	STZ $4A			  ; 64 4A | Store zero to zero page
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC ($4B,X)		  ; 61 4B | Add with carry ((zero page,X))
	EOR $515E			; 4D 5E 51 | Exclusive OR with accumulator (absolute)
	EOR $5D51,X		  ; 5D 51 5D | Exclusive OR with accumulator (absolute,X)
	LSR $6058,X		  ; 5E 58 60 | Logical shift right (absolute,X)
	JMP $625C62		  ; 5C 62 5C 62 | Jump to address long
	ADC $5F			  ; 65 5F | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2A5
; Address: $D3C4FD
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2A5:
	ADC ($6B,X)		  ; 61 6B | Add with carry ((zero page,X))
	ADC ($6B,X)		  ; 61 6B | Add with carry ((zero page,X))
	JMP ($6E74)		  ; 6C 74 6E | Jump to address (absolute indirect)
	ADC $76			  ; 65 76 | Add with carry (zero page)
	ROR $78			  ; 66 78 | Rotate right (zero page)
	ROR $78			  ; 66 78 | Rotate right (zero page)
	ROR $76			  ; 66 76 | Rotate right (zero page)
	ROR $74			  ; 66 74 | Rotate right (zero page)
	ROR $70			  ; 66 70 | Rotate right (zero page)
	ADC $6E			  ; 65 6E | Add with carry (zero page)
	ADC $6E			  ; 65 6E | Add with carry (zero page)
	STZ $6D			  ; 64 6D | Store zero to zero page
	ADC ($6B,X)		  ; 61 6B | Add with carry ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2A6
; Address: $D3C51F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2A6:
	EOR $5E6B,X		  ; 5D 6B 5E | Exclusive OR with accumulator (absolute,X)
	ADC #$61			 ; 69 61 | Add with carry (immediate)
	ADC #$63			 ; 69 63 | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2A8
; Address: $D3C52A
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2A8:
	ROR $7065			; 6E 65 70 | Rotate right (absolute)
	ROR $74			  ; 66 74 | Rotate right (zero page)
	ROR $74			  ; 66 74 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $7D6A,X		  ; 7D 6A 7D | Add with carry (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $7968,X		  ; 7D 68 79 | Add with carry (absolute,X)
	ROR $6D61			; 6E 61 6D | Rotate right (absolute)
	ADC $6D5F			; 6D 5F 6D | Add with carry (absolute)
	EOR $5867,X		  ; 5D 67 58 | Exclusive OR with accumulator (absolute,X)
	STZ $51			  ; 64 51 | Store zero to zero page
	PHY				  ; 5A | Push Y register to stack
	EOR $5B62,X		  ; 5D 62 5B | Exclusive OR with accumulator (absolute,X)
	STZ $5D			  ; 64 5D | Store zero to zero page
	STZ $5F			  ; 64 5F | Store zero to zero page
	ADC ($62,X)		  ; 61 62 | Add with carry ((zero page,X))
	ADC ($6E,X)		  ; 61 6E | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2A9
; Address: $D3C560
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2A9:
	PLA				  ; 68 | Pull accumulator from stack
	JMP $605964		  ; 5C 64 59 60 | Jump to address long
	LSR $5D56,X		  ; 5E 56 5D | Logical shift right (absolute,X)
	LSR $6454,X		  ; 5E 54 64 | Logical shift right (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $5A5C58		  ; 5C 58 5C 5A | Jump to address long
	ADC $5D			  ; 65 5D | Add with carry (zero page)
	ADC ($6B,X)		  ; 61 6B | Add with carry ((zero page,X))
	ADC ($6B,X)		  ; 61 6B | Add with carry ((zero page,X))
	ADC $6D61			; 6D 61 6D | Add with carry (absolute)
	JMP $755A78		  ; 5C 78 5A 75 | Jump to address long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2AA
; Address: $D3C583
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2AA:
	EOR $5970,Y		  ; 59 70 59 | Exclusive OR with accumulator (absolute,Y)
	JMP ($6A59)		  ; 6C 59 6A | Jump to address (absolute indirect)
	PHY				  ; 5A | Push Y register to stack
	BVS $5B			  ; 70 5B | Branch if overflow set
	EOR $5F7A,X		  ; 5D 7A 5F | Exclusive OR with accumulator (absolute,X)
	ADC $78			  ; 65 78 | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $7B63,Y		  ; 79 63 7B | Add with carry (absolute,Y)
	STZ $7D			  ; 64 7D | Store zero to zero page
	ROR $7F69,X		  ; 7E 69 7F | Rotate right (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($6F80)		  ; 6C 80 6F | Jump to address (absolute indirect)
	BRA $71			  ; 80 71 | Branch always
	BVS $7F			  ; 70 7F | Branch if overflow set
	ROR $7E74,X		  ; 7E 74 7E | Rotate right (absolute,X)
	ADC $7C72,X		  ; 7D 72 7C | Add with carry (absolute,X)
	ADC ($7B),Y		  ; 71 7B | Add with carry ((zero page),Y)
	BVS $7A			  ; 70 7A | Branch if overflow set
	ROR $707D			; 6E 7D 70 | Rotate right (absolute)
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	ADC $6C76			; 6D 76 6C | Add with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2AB
; Address: $D3C5C0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2AB:
	ADC ($69),Y		  ; 71 69 | Add with carry ((zero page),Y)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $7368			; 6E 68 73 | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($65),Y		  ; 71 65 | Add with carry ((zero page),Y)
	BVS $63			  ; 70 63 | Branch if overflow set
	ROR $6C5F			; 6E 5F 6C | Rotate right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2AC
; Address: $D3C5D1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2AC:
	EOR $5C6A,X		  ; 5D 6A 5C | Exclusive OR with accumulator (absolute,X)
	ADC #$5B			 ; 69 5B | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PHY				  ; 5A | Push Y register to stack
	PLA				  ; 68 | Pull accumulator from stack
	EOR $5967,Y		  ; 59 67 59 | Exclusive OR with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$5D			 ; 69 5D | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2AD
; Address: $D3C5E8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2AD:
	JMP ($6D5E)		  ; 6C 5E 6D | Jump to address (absolute indirect)
	BVS $65			  ; 70 65 | Branch if overflow set
	ROR $76			  ; 66 76 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($69),Y		  ; 71 69 | Add with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2AF
; Address: $D3C5FA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2AF:
	PLY				  ; 7A | Pull Y register from stack
	ROR $6F7B			; 6E 7B 6F | Rotate right (absolute)
	PLY				  ; 7A | Pull Y register from stack
	BVS $79			  ; 70 79 | Branch if overflow set
	BVS $77			  ; 70 77 | Branch if overflow set
	BVS $75			  ; 70 75 | Branch if overflow set
	ROR $6C71			; 6E 71 6C | Rotate right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2B0
; Address: $D3C60D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2B0:
	ADC #$6E			 ; 69 6E | Add with carry (immediate)
	ADC $6D65			; 6D 65 6D | Add with carry (absolute)
	STZ $68			  ; 64 68 | Store zero to zero page
	JMP ($6B63)		  ; 6C 63 6B | Jump to address (absolute indirect)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2B1
; Address: $D3C61B
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2B1:
	STZ $6B			  ; 64 6B | Store zero to zero page
	ROR $6B			  ; 66 6B | Rotate right (zero page)
	JMP ($6C68)		  ; 6C 68 6C | Jump to address (absolute indirect)
	ADC #$6E			 ; 69 6E | Add with carry (immediate)
	ADC #$6E			 ; 69 6E | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	BVS $6A			  ; 70 6A | Branch if overflow set
	ROR $6D69			; 6E 69 6D | Rotate right (absolute)
	ADC $6C66			; 6D 66 6C | Add with carry (absolute)
	STZ $6B			  ; 64 6B | Store zero to zero page
	ROR				  ; 6A | Rotate right (accumulator)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2B2
; Address: $D3C636
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2B2:
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$5F			 ; 69 5F | Add with carry (immediate)
	ADC #$61			 ; 69 61 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	STZ $6D			  ; 64 6D | Store zero to zero page
	ADC $6E68			; 6D 68 6E | Add with carry (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2B3
; Address: $D3C646
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2B3:
	BVS $6D			  ; 70 6D | Branch if overflow set
	ADC ($6E),Y		  ; 71 6E | Add with carry ((zero page),Y)
	ROR $6E72			; 6E 72 6E | Rotate right (absolute)
	BVS $6D			  ; 70 6D | Branch if overflow set
	BVS $6B			  ; 70 6B | Branch if overflow set
	ROR $676E			; 6E 6E 67 | Rotate right (absolute)
	ROR $6F6D			; 6E 6D 6F | Rotate right (absolute)
	BVS $74			  ; 70 74 | Branch if overflow set
	BVS $76			  ; 70 76 | Branch if overflow set
	ADC $7175			; 6D 75 71 | Add with carry (absolute)
	JMP ($6B72)		  ; 6C 72 6B | Jump to address (absolute indirect)
	BVS $69			  ; 70 69 | Branch if overflow set
	ROR $6D68			; 6E 68 6D | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $716A			; 6E 6A 71 | Rotate right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2B6
; Address: $D3C677
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2B6:
	ROR $69			  ; 66 69 | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $65			  ; 66 65 | Rotate right (zero page)
	ROR $63			  ; 66 63 | Rotate right (zero page)
	ROR $64			  ; 66 64 | Rotate right (zero page)
	ADC $69			  ; 65 69 | Add with carry (zero page)
	ROR $6B			  ; 66 6B | Rotate right (zero page)
	ADC #$68			 ; 69 68 | Add with carry (immediate)
	JMP ($6E67)		  ; 6C 67 6E | Jump to address (absolute indirect)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2B7
; Address: $D3C691
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2B7:
	ROR $69			  ; 66 69 | Rotate right (zero page)
	ADC $68			  ; 65 68 | Add with carry (zero page)
	STZ $66			  ; 64 66 | Store zero to zero page
	ADC ($65,X)		  ; 61 65 | Add with carry ((zero page,X))
	ADC ($63,X)		  ; 61 63 | Add with carry ((zero page,X))
	ADC ($66,X)		  ; 61 66 | Add with carry ((zero page,X))
	ROR $64			  ; 66 64 | Rotate right (zero page)
	ADC $68			  ; 65 68 | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$69			 ; 69 69 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2B9
; Address: $D3C6AF
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2B9:
	JMP ($6B6C)		  ; 6C 6C 6B | Jump to address (absolute indirect)
	ADC $6E6E			; 6D 6E 6E | Add with carry (absolute)
	BVS $6E			  ; 70 6E | Branch if overflow set
	ROR $6B6F			; 6E 6F 6B | Rotate right (absolute)
	ROR $6A6A			; 6E 6A 6A | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6B6B)		  ; 6C 6B 6B | Jump to address (absolute indirect)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$69			 ; 69 69 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$66			 ; 69 66 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $67			  ; 65 67 | Add with carry (zero page)
	STZ $67			  ; 64 67 | Store zero to zero page
	STZ $61			  ; 64 61 | Store zero to zero page
	STZ $61			  ; 64 61 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	STZ $65			  ; 64 65 | Store zero to zero page
	ROR $6B			  ; 66 6B | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2BA
; Address: $D3C6DA
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2BA:
	PLA				  ; 68 | Pull accumulator from stack
	ROR $61			  ; 66 61 | Rotate right (zero page)
	ADC $63			  ; 65 63 | Add with carry (zero page)
	ADC #$66			 ; 69 66 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6E6A)		  ; 6C 6A 6E | Jump to address (absolute indirect)
	BVS $6F			  ; 70 6F | Branch if overflow set
	JMP ($6A6E)		  ; 6C 6E 6A | Jump to address (absolute indirect)
	JMP ($6B69)		  ; 6C 69 6B | Jump to address (absolute indirect)
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$68			 ; 69 68 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ADC $65			  ; 65 65 | Add with carry (zero page)
	STZ $64			  ; 64 64 | Store zero to zero page
	STZ $61			  ; 64 61 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	STZ $64			  ; 64 64 | Store zero to zero page
	ADC $65			  ; 65 65 | Add with carry (zero page)
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ADC #$68			 ; 69 68 | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2BB
; Address: $D3C711
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2BB:
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6E6A			; 6D 6A 6E | Add with carry (absolute)
	ADC $6B6F			; 6D 6F 6B | Add with carry (absolute)
	BVS $6C			  ; 70 6C | Branch if overflow set
	BVS $6B			  ; 70 6B | Branch if overflow set
	ROR $6C			  ; 66 6C | Rotate right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2BC
; Address: $D3C722
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2BC:
	ROR $6D6A			; 6E 6A 6D | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6B68)		  ; 6C 68 6B | Jump to address (absolute indirect)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6A			  ; 65 6A | Add with carry (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$6B			 ; 69 6B | Add with carry (immediate)
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6E6B			; 6D 6B 6E | Add with carry (absolute)
	JMP ($6C70)		  ; 6C 70 6C | Jump to address (absolute indirect)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2BD
; Address: $D3C73E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2BD:
	ROR $6E6B			; 6E 6B 6E | Rotate right (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6F67			; 6D 67 6F | Add with carry (absolute)
	STZ $67			  ; 64 67 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6868)		  ; 6C 68 68 | Jump to address (absolute indirect)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2BE
; Address: $D3C74D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2BE:
	ROR $66			  ; 66 66 | Rotate right (zero page)
	ADC $65			  ; 65 65 | Add with carry (zero page)
	STZ $64			  ; 64 64 | Store zero to zero page
	STZ $64			  ; 64 64 | Store zero to zero page
	STZ $65			  ; 64 65 | Store zero to zero page
	ADC $66			  ; 65 66 | Add with carry (zero page)
	ROR $67			  ; 66 67 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$69			 ; 69 69 | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2BF
; Address: $D3C76B
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2BF:
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($6E6A)		  ; 6C 6A 6E | Jump to address (absolute indirect)
	PLA				  ; 68 | Pull accumulator from stack
	BVS $64			  ; 70 64 | Branch if overflow set
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6C69			; 6D 69 6C | Add with carry (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC ($7A),Y		  ; 71 7A | Add with carry ((zero page),Y)
	ADC $7670,Y		  ; 79 70 76 | Add with carry (absolute,Y)
	ROR $6B72			; 6E 72 6B | Rotate right (absolute)
	ADC ($69),Y		  ; 71 69 | Add with carry ((zero page),Y)
	JMP ($6B69)		  ; 6C 69 6B | Jump to address (absolute indirect)
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $6F6B			; 6E 6B 6F | Rotate right (absolute)
	ADC $6F71			; 6D 71 6F | Add with carry (absolute)
	ADC ($6D),Y		  ; 71 6D | Add with carry ((zero page),Y)
	JMP ($7376)		  ; 6C 76 73 | Jump to address (absolute indirect)
	SEI				  ; 78 | Set interrupt disable flag
	JMP ($6F73)		  ; 6C 73 6F | Jump to address (absolute indirect)
	ROR $6C70			; 6E 70 6C | Rotate right (absolute)
	BVS $6E			  ; 70 6E | Branch if overflow set
	ADC ($6F),Y		  ; 71 6F | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7574,Y		  ; 79 74 75 | Add with carry (absolute,Y)
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	ROR $7073			; 6E 73 70 | Rotate right (absolute)
	ADC ($73),Y		  ; 71 73 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	BVS $76			  ; 70 76 | Branch if overflow set
	ADC ($72),Y		  ; 71 72 | Add with carry ((zero page),Y)
	BVS $71			  ; 70 71 | Branch if overflow set
	BVS $6E			  ; 70 6E | Branch if overflow set

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2C0
; Address: $D3C7E9
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2C0:
	ADC $6B6F			; 6D 6F 6B | Add with carry (absolute)
	ROR $6D6A			; 6E 6A 6D | Rotate right (absolute)
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	ADC #$6D			 ; 69 6D | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6F6D			; 6D 6D 6F | Add with carry (absolute)
	ROR $6D70			; 6E 70 6D | Rotate right (absolute)
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7975,Y		  ; 79 75 79 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	BVS $71			  ; 70 71 | Branch if overflow set
	BVS $71			  ; 70 71 | Branch if overflow set
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	BVS $6E			  ; 70 6E | Branch if overflow set
	ROR $6F6F			; 6E 6F 6F | Rotate right (absolute)
	BVS $70			  ; 70 70 | Branch if overflow set
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	ADC ($72),Y		  ; 71 72 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	BVS $71			  ; 70 71 | Branch if overflow set
	BVS $6F			  ; 70 6F | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $6A			  ; 70 6A | Branch if overflow set
	ROR $717C			; 6E 7C 71 | Rotate right (absolute)
	ADC ($81),Y		  ; 71 81 | Add with carry ((zero page),Y)
	STY $75			  ; 84 75 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	STY $79			  ; 84 79 | Store Y register to zero page
	STY $75			  ; 84 75 | Store Y register to zero page
	ADC ($7F),Y		  ; 71 7F | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$71			 ; 69 71 | Add with carry (immediate)
	ADC #$6F			 ; 69 6F | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2C1
; Address: $D3C8A3
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2C1:
	ADC #$70			 ; 69 70 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2C2
; Address: $D3C8A9
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2C2:
	ADC $6D78			; 6D 78 6D | Add with carry (absolute)
	ADC ($7C),Y		  ; 71 7C | Add with carry ((zero page),Y)
	ADC $6F73			; 6D 73 6F | Add with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	ADC ($7C),Y		  ; 71 7C | Add with carry ((zero page),Y)
	ROR $8172,X		  ; 7E 72 81 | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	STY $7A			  ; 84 7A | Store Y register to zero page
	STY $7D			  ; 84 7D | Store Y register to zero page
	STX $77			  ; 86 77 | Store X register to zero page
	STX $72			  ; 86 72 | Store X register to zero page
	STY $75			  ; 84 75 | Store Y register to zero page
	STY $70			  ; 84 70 | Store Y register to zero page
	STA ($71,X)		  ; 81 71 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2C3
; Address: $D3C8CE
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2C3:
	ADC $7869,X		  ; 7D 69 78 | Add with carry (absolute,X)
	ADC #$73			 ; 69 73 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $70			  ; 66 70 | Rotate right (zero page)
	ROR $7069			; 6E 69 70 | Rotate right (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	BVS $6A			  ; 70 6A | Branch if overflow set
	JMP ($6C75)		  ; 6C 75 6C | Jump to address (absolute indirect)
	ADC $746D,Y		  ; 79 6D 74 | Add with carry (absolute,Y)
	ADC $6F76			; 6D 76 6F | Add with carry (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ADC ($7C),Y		  ; 71 7C | Add with carry ((zero page),Y)
	ADC $6A7E			; 6D 7E 6A | Add with carry (absolute)
	ROR $7D6A,X		  ; 7E 6A 7D | Rotate right (absolute,X)
	ADC $7176			; 6D 76 71 | Add with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($78),Y		  ; 71 78 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7A75,Y		  ; 79 75 7A | Add with carry (absolute,Y)
	ADC $7875,Y		  ; 79 75 78 | Add with carry (absolute,Y)
	ADC $7C77,Y		  ; 79 77 7C | Add with carry (absolute,Y)
	ADC $7D7A,X		  ; 7D 7A 7D | Add with carry (absolute,X)
	ADC $7980,Y		  ; 79 80 79 | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	BRA $7A			  ; 80 7A | Branch always
	BRA $7B			  ; 80 7B | Branch always
	PLY				  ; 7A | Pull Y register from stack
	ROR $7E79,X		  ; 7E 79 7E | Rotate right (absolute,X)
	ADC $797C,Y		  ; 79 7C 79 | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2C4
; Address: $D3C926
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2C4:
	ADC $7B79,X		  ; 7D 79 7B | Add with carry (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $8075,X		  ; 7D 75 80 | Add with carry (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($78),Y		  ; 71 78 | Add with carry ((zero page),Y)
	ADC ($78),Y		  ; 71 78 | Add with carry ((zero page),Y)
	ADC ($76),Y		  ; 71 76 | Add with carry ((zero page),Y)
	BVS $73			  ; 70 73 | Branch if overflow set
	BVS $73			  ; 70 73 | Branch if overflow set
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	BVS $74			  ; 70 74 | Branch if overflow set
	BVS $74			  ; 70 74 | Branch if overflow set
	ADC ($76),Y		  ; 71 76 | Add with carry ((zero page),Y)
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	ADC ($75),Y		  ; 71 75 | Add with carry ((zero page),Y)
	ADC ($76),Y		  ; 71 76 | Add with carry ((zero page),Y)
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	ADC $7673,Y		  ; 79 73 76 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	JMP ($6874)		  ; 6C 74 68 | Jump to address (absolute indirect)
	ADC $75			  ; 65 75 | Add with carry (zero page)
	STZ $7A			  ; 64 7A | Store zero to zero page
	ADC $7569,Y		  ; 79 69 75 | Add with carry (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2C5
; Address: $D3C98A
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2C5:
	ROR $836E,X		  ; 7E 6E 83 | Rotate right (absolute,X)
	ADC ($7F),Y		  ; 71 7F | Add with carry ((zero page),Y)
	ADC ($85),Y		  ; 71 85 | Add with carry ((zero page),Y)
	STX $7C			  ; 86 7C | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BRA $88			  ; 80 88 | Branch always
	ADC $7485,Y		  ; 79 85 74 | Add with carry (absolute,Y)
	ROR $727E			; 6E 7E 72 | Rotate right (absolute)
	BRA $6E			  ; 80 6E | Branch always
	ADC $7D70,Y		  ; 79 70 7D | Add with carry (absolute,Y)
	JMP ($6677)		  ; 6C 77 66 | Jump to address (absolute indirect)
	JMP ($7E65)		  ; 6C 65 7E | Jump to address (absolute indirect)
	EOR $5B74,X		  ; 5D 74 5B | Exclusive OR with accumulator (absolute,X)
	ADC $7159			; 6D 59 71 | Add with carry (absolute)
	PHY				  ; 5A | Push Y register to stack
	ADC #$5C			 ; 69 5C | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2C6
; Address: $D3C9BC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2C6:
	JMP ($7062)		  ; 6C 62 70 | Jump to address (absolute indirect)
	ROR $6E			  ; 66 6E | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $7167			; 6E 67 71 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2C7
; Address: $D3C9C7
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2C7:
	ROR $77			  ; 66 77 | Rotate right (zero page)
	ADC #$7B			 ; 69 7B | Add with carry (immediate)
	JMP ($6A7D)		  ; 6C 7D 6A | Jump to address (absolute indirect)
	ADC $7C6A,X		  ; 7D 6A 7C | Add with carry (absolute,X)
	BVS $7B			  ; 70 7B | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($77),Y		  ; 71 77 | Add with carry ((zero page),Y)
	JMP ($737E)		  ; 6C 7E 73 | Jump to address (absolute indirect)
	STA $78			  ; 85 78 | Update graphics data
	DEY				  ; 88 | Decrement Y register
	PLY				  ; 7A | Pull Y register from stack
	STA $78			  ; 85 78 | Update graphics data
	ROR $7A70,X		  ; 7E 70 7A | Rotate right (absolute,X)
	ROR $7077			; 6E 77 70 | Rotate right (absolute)
	JMP ($6A74)		  ; 6C 74 6A | Jump to address (absolute indirect)
	BVS $68			  ; 70 68 | Branch if overflow set
	BVS $67			  ; 70 67 | Branch if overflow set
	ROR $6F68			; 6E 68 6F | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ADC #$73			 ; 69 73 | Add with carry (immediate)
	ADC #$7B			 ; 69 7B | Add with carry (immediate)
	ROR $6D77			; 6E 77 6D | Rotate right (absolute)
	ADC ($7B),Y		  ; 71 7B | Add with carry ((zero page),Y)
	ADC ($7D),Y		  ; 71 7D | Add with carry ((zero page),Y)
	STA ($75,X)		  ; 81 75 | Update graphics data
	ADC ($77),Y		  ; 71 77 | Add with carry ((zero page),Y)
	ADC $6F74			; 6D 74 6F | Add with carry (absolute)
	ADC ($77),Y		  ; 71 77 | Add with carry ((zero page),Y)
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	ADC ($75),Y		  ; 71 75 | Add with carry ((zero page),Y)
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	ADC ($75),Y		  ; 71 75 | Add with carry ((zero page),Y)
	BVS $75			  ; 70 75 | Branch if overflow set
	ADC ($77),Y		  ; 71 77 | Add with carry ((zero page),Y)
	ROR $6F78			; 6E 78 6F | Rotate right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2C8
; Address: $D3CA39
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2C8:
	ROR $6E74			; 6E 74 6E | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2C9
; Address: $D3CA40
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2C9:
	BVS $67			  ; 70 67 | Branch if overflow set
	JMP ($6A67)		  ; 6C 67 6A | Jump to address (absolute indirect)
	BVS $68			  ; 70 68 | Branch if overflow set
	ADC $6D6A			; 6D 6A 6D | Add with carry (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $6E6A			; 6E 6A 6E | Rotate right (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC ($6E),Y		  ; 71 6E | Add with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2CB
; Address: $D3CA5D
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2CB:
	BVS $77			  ; 70 77 | Branch if overflow set
	BVS $79			  ; 70 79 | Branch if overflow set
	ROR $7173			; 6E 73 71 | Rotate right (absolute)
	ADC $7C75,Y		  ; 79 75 7C | Add with carry (absolute,Y)
	ADC $7C78,Y		  ; 79 78 7C | Add with carry (absolute,Y)
	ADC $797E,Y		  ; 79 7E 79 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	STA ($79,X)		  ; 81 79 | Update graphics data
	BRA $77			  ; 80 77 | Branch always
	LSR $5B7A,X		  ; 5E 7A 5B | Logical shift right (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	JMP $7A5E78		  ; 5C 78 5E 7A | Jump to address long
	BVS $62			  ; 70 62 | Branch if overflow set
	LSR $627A,X		  ; 5E 7A 62 | Logical shift right (absolute,X)
	ADC $8161,X		  ; 7D 61 81 | Add with carry (absolute,X)
	ADC $7968,X		  ; 7D 68 79 | Add with carry (absolute,X)
	BRA $6C			  ; 80 6C | Branch always
	STY $69			  ; 84 69 | Store Y register to zero page
	BIT #$63			 ; 89 63 | Test bits in accumulator (immediate)
	STX $62			  ; 86 62 | Store X register to zero page
	ADC $82			  ; 65 82 | Add with carry (zero page)
	ADC #$86			 ; 69 86 | Add with carry (immediate)
	JMP ($7584)		  ; 6C 84 75 | Jump to address (absolute indirect)
	ROR $7B74,X		  ; 7E 74 7B | Rotate right (absolute,X)
	STY $72			  ; 84 72 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	STX $7B			  ; 86 7B | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	ADC $7F8B,X		  ; 7D 8B 7F | Add with carry (absolute,X)
	STA $8F81			; 8D 81 8F | Update graphics data
	STA ($90,X)		  ; 81 90 | Update graphics data
	ADC $7E8F,X		  ; 7D 8F 7E | Add with carry (absolute,X)
	STX $8A74			; 8E 74 8A | Store X register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	STY $826E			; 8C 6E 82 | Store Y register to absolute address
	ROR $82			  ; 66 82 | Rotate right (zero page)
	ADC $81			  ; 65 81 | Add with carry (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2CC
; Address: $D3CADA
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2CC:
	BRA $6E			  ; 80 6E | Branch always
	STA ($71,X)		  ; 81 71 | Update graphics data
	ADC ($7D),Y		  ; 71 7D | Add with carry ((zero page),Y)
	ADC ($7B),Y		  ; 71 7B | Add with carry ((zero page),Y)
	ROR $6D78			; 6E 78 6D | Rotate right (absolute)
	JMP $7A5977		  ; 5C 77 59 7A | Jump to address long
	ADC $73			  ; 65 73 | Add with carry (zero page)
	LSR $6273,X		  ; 5E 73 62 | Logical shift right (absolute,X)
	JMP ($6B63)		  ; 6C 63 6B | Jump to address (absolute indirect)
	ROR $6F			  ; 66 6F | Rotate right (zero page)
	ADC $74			  ; 65 74 | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2CD
; Address: $D3CAFD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2CD:
	PLA				  ; 68 | Pull accumulator from stack
	BVS $69			  ; 70 69 | Branch if overflow set
	ADC ($66),Y		  ; 71 66 | Add with carry ((zero page),Y)
	ADC $7068			; 6D 68 70 | Add with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2CF
; Address: $D3CB0A
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2CF:
	ADC $7968,Y		  ; 79 68 79 | Add with carry (absolute,Y)
	ADC ($7C),Y		  ; 71 7C | Add with carry ((zero page),Y)
	ADC ($79),Y		  ; 71 79 | Add with carry ((zero page),Y)
	ADC $7E73,X		  ; 7D 73 7E | Add with carry (absolute,X)
	ADC ($79),Y		  ; 71 79 | Add with carry ((zero page),Y)
	BVS $7B			  ; 70 7B | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7F76,X		  ; 7D 76 7F | Add with carry (absolute,X)
	BRA $6F			  ; 80 6F | Branch always
	BRA $70			  ; 80 70 | Branch always
	JMP ($6B7C)		  ; 6C 7C 6B | Jump to address (absolute indirect)
	ADC $716D,Y		  ; 79 6D 71 | Add with carry (absolute,Y)
	JMP ($6E73)		  ; 6C 73 6E | Jump to address (absolute indirect)
	ROR $6C76			; 6E 76 6C | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ROR $6D63			; 6E 63 6D | Rotate right (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2D0
; Address: $D3CB3A
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2D0:
	ADC $6865			; 6D 65 68 | Add with carry (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	EOR $5C68,X		  ; 5D 68 5C | Exclusive OR with accumulator (absolute,X)
	ADC $5E			  ; 65 5E | Add with carry (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	EOR $5D6A,X		  ; 5D 6A 5D | Exclusive OR with accumulator (absolute,X)
	STZ $6E			  ; 64 6E | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7278			; 6D 78 72 | Add with carry (absolute)
	ROR $6C76			; 6E 76 6C | Rotate right (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	BVS $6B			  ; 70 6B | Branch if overflow set
	ROR $7169			; 6E 69 71 | Rotate right (absolute)
	ROR $6E73			; 6E 73 6E | Rotate right (absolute)
	ADC ($76),Y		  ; 71 76 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	ADC $7B73,Y		  ; 79 73 7B | Add with carry (absolute,Y)
	ADC ($7D),Y		  ; 71 7D | Add with carry ((zero page),Y)
	ADC ($7D),Y		  ; 71 7D | Add with carry ((zero page),Y)
	ADC $6D75			; 6D 75 6D | Add with carry (absolute)
	ADC $7C6C,Y		  ; 79 6C 7C | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2D1
; Address: $D3CB84
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2D1:
	ADC $7A68,X		  ; 7D 68 7A | Add with carry (absolute,X)
	JMP ($6378)		  ; 6C 78 63 | Jump to address (absolute indirect)
	LSR $6273,X		  ; 5E 73 62 | Logical shift right (absolute,X)
	BVS $5F			  ; 70 5F | Branch if overflow set
	JMP ($705C)		  ; 6C 5C 70 | Jump to address (absolute indirect)
	ADC $6559			; 6D 59 65 | Add with carry (absolute)
	EOR $5A61,Y		  ; 59 61 5A | Exclusive OR with accumulator (absolute,Y)
	ADC $5C			  ; 65 5C | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	LSR $636D,X		  ; 5E 6D 63 | Logical shift right (absolute,X)
	ADC ($6F,X)		  ; 61 6F | Add with carry ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	STZ $71			  ; 64 71 | Store zero to zero page
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $757B			; 6D 7B 75 | Add with carry (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $7484			; 6D 84 74 | Add with carry (absolute)
	STX $70			  ; 86 70 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7585,Y		  ; 79 85 75 | Add with carry (absolute,Y)
	STA ($71,X)		  ; 81 71 | Update graphics data
	BVS $7A			  ; 70 7A | Branch if overflow set
	JMP ($6A7A)		  ; 6C 7A 6A | Jump to address (absolute indirect)
	ROR $7A			  ; 66 7A | Rotate right (zero page)
	ROR $78			  ; 66 78 | Rotate right (zero page)
	STZ $75			  ; 64 75 | Store zero to zero page
	STZ $77			  ; 64 77 | Store zero to zero page
	ADC $77			  ; 65 77 | Add with carry (zero page)
	ROR $71			  ; 66 71 | Rotate right (zero page)
	ADC #$6E			 ; 69 6E | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	BVS $66			  ; 70 66 | Branch if overflow set
	JMP $695A6E		  ; 5C 6E 5A 69 | Jump to address long
	LSR $596A,X		  ; 5E 6A 59 | Logical shift right (absolute,X)
	ADC $5C			  ; 65 5C | Add with carry (zero page)
	ADC #$63			 ; 69 63 | Add with carry (immediate)
	ADC ($6A),Y		  ; 71 6A | Add with carry ((zero page),Y)
	ROR $71			  ; 66 71 | Rotate right (zero page)
	ADC $7175			; 6D 75 71 | Add with carry (absolute)
	ADC ($79),Y		  ; 71 79 | Add with carry ((zero page),Y)
	ADC $6E7A			; 6D 7A 6E | Add with carry (absolute)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	ADC $796C,Y		  ; 79 6C 79 | Add with carry (absolute,Y)
	ROR $6678			; 6E 78 66 | Rotate right (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2D2
; Address: $D3CC09
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2D2:
	ROR $70			  ; 66 70 | Rotate right (zero page)
	STZ $70			  ; 64 70 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2D3
; Address: $D3CC10
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2D3:
	JMP ($6F66)		  ; 6C 66 6F | Jump to address (absolute indirect)
	ROR				  ; 6A | Rotate right (accumulator)
	BVS $6C			  ; 70 6C | Branch if overflow set
	ADC $6C74			; 6D 74 6C | Add with carry (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	BVS $6D			  ; 70 6D | Branch if overflow set
	BVS $6C			  ; 70 6C | Branch if overflow set
	BVS $6B			  ; 70 6B | Branch if overflow set
	ADC $6D6F			; 6D 6F 6D | Add with carry (absolute)
	ADC $6C70			; 6D 70 6C | Add with carry (absolute)
	BVS $6C			  ; 70 6C | Branch if overflow set
	ADC ($6B),Y		  ; 71 6B | Add with carry ((zero page),Y)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $706A			; 6E 6A 70 | Rotate right (absolute)
	ADC #$73			 ; 69 73 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6D76			; 6D 76 6D | Add with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2D4
; Address: $D3CC3E
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2D4:
	ADC $7671,Y		  ; 79 71 76 | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	ADC ($7A),Y		  ; 71 7A | Add with carry ((zero page),Y)
	ADC $7774,Y		  ; 79 74 77 | Add with carry (absolute,Y)
	ADC $7773,Y		  ; 79 73 77 | Add with carry (absolute,Y)
	BVS $77			  ; 70 77 | Branch if overflow set
	ADC $6D73			; 6D 73 6D | Add with carry (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	STZ $73			  ; 64 73 | Store zero to zero page
	ADC $6A73			; 6D 73 6A | Add with carry (absolute)
	ADC ($68),Y		  ; 71 68 | Add with carry ((zero page),Y)
	ADC ($6C),Y		  ; 71 6C | Add with carry ((zero page),Y)
	ROR $6C73			; 6E 73 6C | Rotate right (absolute)
	BVS $68			  ; 70 68 | Branch if overflow set
	ROR $6C65			; 6E 65 6C | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2D5
; Address: $D3CC6D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2D5:
	ADC $69			  ; 65 69 | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2D6
; Address: $D3CC74
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2D6:
	ADC #$5F			 ; 69 5F | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($6C,X)		  ; 61 6C | Add with carry ((zero page,X))
	ADC $6A			  ; 65 6A | Add with carry (zero page)
	ROR $7462			; 6E 62 74 | Rotate right (absolute)
	ROR $74			  ; 66 74 | Rotate right (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2D7
; Address: $D3CC81
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2D7:
	ADC #$77			 ; 69 77 | Add with carry (immediate)
	ADC #$79			 ; 69 79 | Add with carry (immediate)
	ROR $6B74			; 6E 74 6B | Rotate right (absolute)
	ADC $6F7B			; 6D 7B 6F | Add with carry (absolute)
	BRA $6D			  ; 80 6D | Branch always
	ADC ($7C),Y		  ; 71 7C | Add with carry ((zero page),Y)
	ADC $697B			; 6D 7B 69 | Add with carry (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2D8
; Address: $D3CC9A
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2D8:
	BVS $67			  ; 70 67 | Branch if overflow set
	ROR $6C62			; 6E 62 6C | Rotate right (absolute)
	ADC ($69,X)		  ; 61 69 | Add with carry ((zero page,X))
	ADC ($67,X)		  ; 61 67 | Add with carry ((zero page,X))
	ADC ($68,X)		  ; 61 68 | Add with carry ((zero page,X))
	JMP ($6C63)		  ; 6C 63 6C | Jump to address (absolute indirect)
	ADC $70			  ; 65 70 | Add with carry (zero page)
	ADC $73			  ; 65 73 | Add with carry (zero page)
	ADC #$74			 ; 69 74 | Add with carry (immediate)
	ADC $6B			  ; 65 6B | Add with carry (zero page)
	BVS $69			  ; 70 69 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	ADC #$74			 ; 69 74 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $7A6A,Y		  ; 79 6A 7A | Add with carry (absolute,Y)
	BVS $7C			  ; 70 7C | Branch if overflow set
	ROR $7E6F,X		  ; 7E 6F 7E | Rotate right (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $687C			; 6D 7C 68 | Add with carry (absolute)
	ADC $7369,Y		  ; 79 69 73 | Add with carry (absolute,Y)
	ADC ($70,X)		  ; 61 70 | Add with carry ((zero page,X))
	ADC ($6B,X)		  ; 61 6B | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2DA
; Address: $D3CCD5
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2DA:
	LSR $5F68,X		  ; 5E 68 5F | Logical shift right (absolute,X)
	ROR $61			  ; 66 61 | Rotate right (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6D64)		  ; 6C 64 6D | Jump to address (absolute indirect)
	STZ $71			  ; 64 71 | Store zero to zero page
	ADC $6C			  ; 65 6C | Add with carry (zero page)
	ADC $6E			  ; 65 6E | Add with carry (zero page)
	ADC #$74			 ; 69 74 | Add with carry (immediate)
	ADC $76			  ; 65 76 | Add with carry (zero page)
	ADC $6E			  ; 65 6E | Add with carry (zero page)
	ADC #$70			 ; 69 70 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	BVS $69			  ; 70 69 | Branch if overflow set
	BVS $6B			  ; 70 6B | Branch if overflow set
	BVS $6D			  ; 70 6D | Branch if overflow set
	ADC ($6D),Y		  ; 71 6D | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2DB
; Address: $D3CD03
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2DB:
	ADC $6D71			; 6D 71 6D | Add with carry (absolute)
	BVS $6F			  ; 70 6F | Branch if overflow set
	ADC ($6F),Y		  ; 71 6F | Add with carry ((zero page),Y)
	ADC $6F74			; 6D 74 6F | Add with carry (absolute)
	ADC ($78),Y		  ; 71 78 | Add with carry ((zero page),Y)
	ADC ($77),Y		  ; 71 77 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($76),Y		  ; 71 76 | Add with carry ((zero page),Y)
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	ADC ($75),Y		  ; 71 75 | Add with carry ((zero page),Y)
	ADC ($73),Y		  ; 71 73 | Add with carry ((zero page),Y)
	BVS $75			  ; 70 75 | Branch if overflow set
	ADC $7078			; 6D 78 70 | Add with carry (absolute)
	ADC $6D74			; 6D 74 6D | Add with carry (absolute)
	ADC #$70			 ; 69 70 | Add with carry (immediate)
	ADC #$70			 ; 69 70 | Add with carry (immediate)
	ADC #$6E			 ; 69 6E | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2DD
; Address: $D3CD3D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2DD:
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6C68)		  ; 6C 68 6C | Jump to address (absolute indirect)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2DE
; Address: $D3CD46
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2DE:
	ADC $6E69			; 6D 69 6E | Add with carry (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $6D6D			; 6E 6D 6D | Rotate right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2E0
; Address: $D3CD52
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2E0:
	JMP ($6C6A)		  ; 6C 6A 6C | Jump to address (absolute indirect)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6B6A			; 6D 6A 6B | Add with carry (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($6C69)		  ; 6C 69 6C | Jump to address (absolute indirect)
	ADC #$6D			 ; 69 6D | Add with carry (immediate)
	ADC #$6E			 ; 69 6E | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2E1
; Address: $D3CD62
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2E1:
	ROR $6C69			; 6E 69 6C | Rotate right (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC ($6B),Y		  ; 71 6B | Add with carry ((zero page),Y)
	ROR $6F6D			; 6E 6D 6F | Rotate right (absolute)
	ADC $6D6F			; 6D 6F 6D | Add with carry (absolute)
	ROR $6F70			; 6E 70 6F | Rotate right (absolute)
	BVS $6F			  ; 70 6F | Branch if overflow set
	BVS $6B			  ; 70 6B | Branch if overflow set
	ADC $6D6F			; 6D 6F 6D | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2E2
; Address: $D3CD7A
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2E2:
	BVS $6F			  ; 70 6F | Branch if overflow set
	ADC $6D7F			; 6D 7F 6D | Add with carry (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	PLA				  ; 68 | Pull accumulator from stack
	SEI				  ; 78 | Set interrupt disable flag
	ADC $6573			; 6D 73 65 | Add with carry (absolute)
	ROR $74			  ; 66 74 | Rotate right (zero page)
	ADC ($6E,X)		  ; 61 6E | Add with carry ((zero page,X))
	ADC $74			  ; 65 74 | Add with carry (zero page)
	ADC $70			  ; 65 70 | Add with carry (zero page)
	ROR $74			  ; 66 74 | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7177			; 6D 77 71 | Add with carry (absolute)
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	BRA $7A			  ; 80 7A | Branch always
	BRA $79			  ; 80 79 | Branch always
	BRA $75			  ; 80 75 | Branch always
	ROR $7C71,X		  ; 7E 71 7C | Rotate right (absolute,X)
	ROR $6D7C			; 6E 7C 6D | Rotate right (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($7A),Y		  ; 71 7A | Add with carry ((zero page),Y)
	ADC #$78			 ; 69 78 | Add with carry (immediate)
	ADC $6B78			; 6D 78 6B | Add with carry (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $71			  ; 65 71 | Add with carry (zero page)
	ADC $6F			  ; 65 6F | Add with carry (zero page)
	JMP ($7263)		  ; 6C 63 72 | Jump to address (absolute indirect)
	ADC $77			  ; 65 77 | Add with carry (zero page)
	ADC $74			  ; 65 74 | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $786E,Y		  ; 79 6E 78 | Add with carry (absolute,Y)
	JMP ($717E)		  ; 6C 7E 71 | Jump to address (absolute indirect)
	BRA $76			  ; 80 76 | Branch always
	BRA $76			  ; 80 76 | Branch always
	STA ($79,X)		  ; 81 79 | Update graphics data
	ADC $7980,Y		  ; 79 80 79 | Add with carry (absolute,Y)
	ADC $7D70,X		  ; 7D 70 7D | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ADC $6B78			; 6D 78 6B | Add with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2E3
; Address: $D3CDEF
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2E3:
	JMP ($737F)		  ; 6C 7F 73 | Jump to address (absolute indirect)
	ADC ($78),Y		  ; 71 78 | Add with carry ((zero page),Y)
	PLY				  ; 7A | Pull Y register from stack
	ADC ($77),Y		  ; 71 77 | Add with carry ((zero page),Y)
	ADC ($78),Y		  ; 71 78 | Add with carry ((zero page),Y)
	ADC ($76),Y		  ; 71 76 | Add with carry ((zero page),Y)
	BVS $74			  ; 70 74 | Branch if overflow set

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2E4
; Address: $D3CE01
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2E4:
	ROR $7072			; 6E 72 70 | Rotate right (absolute)
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	BVS $72			  ; 70 72 | Branch if overflow set
	ADC $6D72			; 6D 72 6D | Add with carry (absolute)
	ADC $6C74			; 6D 74 6C | Add with carry (absolute)
	JMP ($696F)		  ; 6C 6F 69 | Jump to address (absolute indirect)
	BVS $6A			  ; 70 6A | Branch if overflow set
	BVS $69			  ; 70 69 | Branch if overflow set
	ADC #$6F			 ; 69 6F | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $6F6B			; 6E 6B 6F | Rotate right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2E5
; Address: $D3CE20
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2E5:
	BVS $6D			  ; 70 6D | Branch if overflow set
	ROR $706D			; 6E 6D 70 | Rotate right (absolute)
	JMP ($6E70)		  ; 6C 70 6E | Jump to address (absolute indirect)
	BVS $6C			  ; 70 6C | Branch if overflow set
	ADC ($69),Y		  ; 71 69 | Add with carry ((zero page),Y)
	ADC $6D71			; 6D 71 6D | Add with carry (absolute)
	ROR $7174			; 6E 74 71 | Rotate right (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($78),Y		  ; 71 78 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7976,Y		  ; 79 76 79 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7975,Y		  ; 79 75 79 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	BVS $77			  ; 70 77 | Branch if overflow set
	ADC ($73),Y		  ; 71 73 | Add with carry ((zero page),Y)
	ADC ($72),Y		  ; 71 72 | Add with carry ((zero page),Y)
	ADC ($72),Y		  ; 71 72 | Add with carry ((zero page),Y)
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	ADC $6F72			; 6D 72 6F | Add with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	BVS $77			  ; 70 77 | Branch if overflow set
	ADC $7B77,Y		  ; 79 77 7B | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $807D,X		  ; 7E 7D 80 | Rotate right (absolute,X)
	ROR $7D80,X		  ; 7E 80 7D | Rotate right (absolute,X)
	BRA $7B			  ; 80 7B | Branch always
	PLY				  ; 7A | Pull Y register from stack
	ROR $7C78,X		  ; 7E 78 7C | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	ADC $7671,X		  ; 7D 71 76 | Add with carry (absolute,X)
	ROR $7276			; 6E 76 72 | Rotate right (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2E6
; Address: $D3CEA4
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2E6:
	ADC $7A77,X		  ; 7D 77 7A | Add with carry (absolute,X)
	ADC $797B,Y		  ; 79 7B 79 | Add with carry (absolute,Y)
	ADC $7B76,X		  ; 7D 76 7B | Add with carry (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	ADC ($77),Y		  ; 71 77 | Add with carry ((zero page),Y)
	BVS $75			  ; 70 75 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7876,Y		  ; 79 76 78 | Add with carry (absolute,Y)
	ADC ($73),Y		  ; 71 73 | Add with carry ((zero page),Y)
	ADC $7775,Y		  ; 79 75 77 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7A79,Y		  ; 79 79 7A | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	ROR $7F7C,X		  ; 7E 7C 7F | Rotate right (absolute,X)
	ADC $7D80,X		  ; 7D 80 7D | Add with carry (absolute,X)
	BRA $7C			  ; 80 7C | Branch always
	BRA $7C			  ; 80 7C | Branch always
	PLY				  ; 7A | Pull Y register from stack
	ADC $7A7B,Y		  ; 79 7B 7A | Add with carry (absolute,Y)
	ADC $797A,Y		  ; 79 7A 79 | Add with carry (absolute,Y)
	ADC $7977,Y		  ; 79 77 79 | Add with carry (absolute,Y)
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	BVS $73			  ; 70 73 | Branch if overflow set
	BVS $74			  ; 70 74 | Branch if overflow set
	ADC ($76),Y		  ; 71 76 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7978,Y		  ; 79 78 79 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7A7A,Y		  ; 79 7A 7A | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	ADC $787A,Y		  ; 79 7A 78 | Add with carry (absolute,Y)
	ADC $7878,Y		  ; 79 78 78 | Add with carry (absolute,Y)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	ADC ($72),Y		  ; 71 72 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2E7
; Address: $D3CF75
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2E7:
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7A79,Y		  ; 79 79 7A | Add with carry (absolute,Y)
	ADC $797A,Y		  ; 79 7A 79 | Add with carry (absolute,Y)
	ADC $746C,Y		  ; 79 6C 74 | Add with carry (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $75			  ; 65 75 | Add with carry (zero page)
	STZ $7A			  ; 64 7A | Store zero to zero page
	ADC $7569,Y		  ; 79 69 75 | Add with carry (absolute,Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2E8
; Address: $D3CF8A
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2E8:
	ROR $836E,X		  ; 7E 6E 83 | Rotate right (absolute,X)
	ADC ($7F),Y		  ; 71 7F | Add with carry ((zero page),Y)
	ADC ($85),Y		  ; 71 85 | Add with carry ((zero page),Y)
	STX $7C			  ; 86 7C | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	BRA $88			  ; 80 88 | Branch always
	ADC $7485,Y		  ; 79 85 74 | Add with carry (absolute,Y)
	ROR $727E			; 6E 7E 72 | Rotate right (absolute)
	BRA $6E			  ; 80 6E | Branch always
	ADC $7D70,Y		  ; 79 70 7D | Add with carry (absolute,Y)
	JMP ($6677)		  ; 6C 77 66 | Jump to address (absolute indirect)
	JMP ($7E65)		  ; 6C 65 7E | Jump to address (absolute indirect)
	EOR $5B74,X		  ; 5D 74 5B | Exclusive OR with accumulator (absolute,X)
	ADC $7159			; 6D 59 71 | Add with carry (absolute)
	PHY				  ; 5A | Push Y register to stack
	ADC #$5C			 ; 69 5C | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2E9
; Address: $D3CFBC
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2E9:
	JMP ($7062)		  ; 6C 62 70 | Jump to address (absolute indirect)
	ROR $6E			  ; 66 6E | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $7167			; 6E 67 71 | Rotate right (absolute)
	ROR $77			  ; 66 77 | Rotate right (zero page)
	ADC #$7B			 ; 69 7B | Add with carry (immediate)
	JMP ($6A7D)		  ; 6C 7D 6A | Jump to address (absolute indirect)
	ADC $7C6A,X		  ; 7D 6A 7C | Add with carry (absolute,X)
	BVS $7B			  ; 70 7B | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($77),Y		  ; 71 77 | Add with carry ((zero page),Y)
	JMP ($737E)		  ; 6C 7E 73 | Jump to address (absolute indirect)
	STA $78			  ; 85 78 | Update graphics data
	DEY				  ; 88 | Decrement Y register
	PLY				  ; 7A | Pull Y register from stack
	STA $78			  ; 85 78 | Update graphics data
	ROR $7A70,X		  ; 7E 70 7A | Rotate right (absolute,X)
	ROR $7077			; 6E 77 70 | Rotate right (absolute)
	JMP ($6A74)		  ; 6C 74 6A | Jump to address (absolute indirect)
	BVS $68			  ; 70 68 | Branch if overflow set
	BVS $67			  ; 70 67 | Branch if overflow set
	ROR $6F68			; 6E 68 6F | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2EA
; Address: $D3D001
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2EA:
	ADC #$73			 ; 69 73 | Add with carry (immediate)
	ADC #$7B			 ; 69 7B | Add with carry (immediate)
	ROR $6D77			; 6E 77 6D | Rotate right (absolute)
	ADC ($7B),Y		  ; 71 7B | Add with carry ((zero page),Y)
	ADC ($7D),Y		  ; 71 7D | Add with carry ((zero page),Y)
	STA ($75,X)		  ; 81 75 | Update graphics data
	ADC ($77),Y		  ; 71 77 | Add with carry ((zero page),Y)
	ADC $6F74			; 6D 74 6F | Add with carry (absolute)
	ADC ($77),Y		  ; 71 77 | Add with carry ((zero page),Y)
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	ADC ($75),Y		  ; 71 75 | Add with carry ((zero page),Y)
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	ADC ($75),Y		  ; 71 75 | Add with carry ((zero page),Y)
	BVS $75			  ; 70 75 | Branch if overflow set
	ADC ($77),Y		  ; 71 77 | Add with carry ((zero page),Y)
	ROR $6F78			; 6E 78 6F | Rotate right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2EB
; Address: $D3D039
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2EB:
	ROR $6E74			; 6E 74 6E | Rotate right (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2EC
; Address: $D3D040
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2EC:
	BVS $67			  ; 70 67 | Branch if overflow set
	JMP ($6A67)		  ; 6C 67 6A | Jump to address (absolute indirect)
	BVS $68			  ; 70 68 | Branch if overflow set
	ADC $6D6A			; 6D 6A 6D | Add with carry (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $6E6A			; 6E 6A 6E | Rotate right (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC ($6E),Y		  ; 71 6E | Add with carry ((zero page),Y)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2ED
; Address: $D3D057
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2ED:
	JMP ($6E77)		  ; 6C 77 6E | Jump to address (absolute indirect)
	ADC $746E,X		  ; 7D 6E 74 | Add with carry (absolute,X)
	BVS $77			  ; 70 77 | Branch if overflow set
	BVS $79			  ; 70 79 | Branch if overflow set
	ROR $7173			; 6E 73 71 | Rotate right (absolute)
	ADC $7C75,Y		  ; 79 75 7C | Add with carry (absolute,Y)
	ADC $7C78,Y		  ; 79 78 7C | Add with carry (absolute,Y)
	ADC $797E,Y		  ; 79 7E 79 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	STA ($79,X)		  ; 81 79 | Update graphics data
	BRA $77			  ; 80 77 | Branch always
	ADC ($7A),Y		  ; 71 7A | Add with carry ((zero page),Y)
	ADC $7670,Y		  ; 79 70 76 | Add with carry (absolute,Y)
	ROR $6B72			; 6E 72 6B | Rotate right (absolute)
	ADC ($69),Y		  ; 71 69 | Add with carry ((zero page),Y)
	JMP ($6B69)		  ; 6C 69 6B | Jump to address (absolute indirect)
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $6F6B			; 6E 6B 6F | Rotate right (absolute)
	ADC $6F71			; 6D 71 6F | Add with carry (absolute)
	ADC ($6D),Y		  ; 71 6D | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2EE
; Address: $D3D097
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2EE:
	JMP ($7376)		  ; 6C 76 73 | Jump to address (absolute indirect)
	SEI				  ; 78 | Set interrupt disable flag
	JMP ($6F73)		  ; 6C 73 6F | Jump to address (absolute indirect)
	ROR $6C70			; 6E 70 6C | Rotate right (absolute)
	BVS $6E			  ; 70 6E | Branch if overflow set
	ADC ($6F),Y		  ; 71 6F | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7574,Y		  ; 79 74 75 | Add with carry (absolute,Y)
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	ROR $7073			; 6E 73 70 | Rotate right (absolute)
	ADC ($73),Y		  ; 71 73 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	BVS $76			  ; 70 76 | Branch if overflow set
	ADC ($72),Y		  ; 71 72 | Add with carry ((zero page),Y)
	BVS $71			  ; 70 71 | Branch if overflow set
	BVS $6E			  ; 70 6E | Branch if overflow set
	ADC $6B6F			; 6D 6F 6B | Add with carry (absolute)
	ROR $6D6A			; 6E 6A 6D | Rotate right (absolute)
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	ADC #$6C			 ; 69 6C | Add with carry (immediate)
	ADC #$6D			 ; 69 6D | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $6F6D			; 6D 6D 6F | Add with carry (absolute)
	ROR $6D70			; 6E 70 6D | Rotate right (absolute)
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7975,Y		  ; 79 75 79 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($74),Y		  ; 71 74 | Add with carry ((zero page),Y)
	BVS $71			  ; 70 71 | Branch if overflow set
	BVS $71			  ; 70 71 | Branch if overflow set
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	BVS $6E			  ; 70 6E | Branch if overflow set
	ROR $6F6F			; 6E 6F 6F | Rotate right (absolute)
	BVS $70			  ; 70 70 | Branch if overflow set
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	ADC ($72),Y		  ; 71 72 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2EF
; Address: $D3D16A
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2EF:
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($71),Y		  ; 71 71 | Add with carry ((zero page),Y)
	BVS $71			  ; 70 71 | Branch if overflow set
	BVS $6F			  ; 70 6F | Branch if overflow set
	BVS $70			  ; 70 70 | Branch if overflow set
	BVS $7C			  ; 70 7C | Branch if overflow set
	ROR $7E7B,X		  ; 7E 7B 7E | Rotate right (absolute,X)
	ROR $7E7B,X		  ; 7E 7B 7E | Rotate right (absolute,X)
	BRA $7C			  ; 80 7C | Branch always
	ROR $7E7C,X		  ; 7E 7C 7E | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7D79,X		  ; 7D 79 7D | Add with carry (absolute,X)
	ADC $797D,Y		  ; 79 7D 79 | Add with carry (absolute,Y)
	ROR $7D79,X		  ; 7E 79 7D | Rotate right (absolute,X)
	ADC $7E7B,X		  ; 7D 7B 7E | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ROR $7F7C,X		  ; 7E 7C 7F | Rotate right (absolute,X)
	STA ($7C,X)		  ; 81 7C | Update graphics data
	BRA $7B			  ; 80 7B | Branch always
	BRA $7B			  ; 80 7B | Branch always
	ROR $7E7B,X		  ; 7E 7B 7E | Rotate right (absolute,X)
	ROR $7F81,X		  ; 7E 81 7F | Rotate right (absolute,X)
	STA ($7F,X)		  ; 81 7F | Update graphics data
	STA ($7E,X)		  ; 81 7E | Update graphics data
	STA ($7E,X)		  ; 81 7E | Update graphics data
	STA ($7E,X)		  ; 81 7E | Update graphics data
	STA ($7F,X)		  ; 81 7F | Update graphics data
	STA ($7F,X)		  ; 81 7F | Update graphics data
	STA ($7D,X)		  ; 81 7D | Update graphics data
	ADC $7E82,X		  ; 7D 82 7E | Add with carry (absolute,X)
	STA ($79,X)		  ; 81 79 | Update graphics data
	STA ($79,X)		  ; 81 79 | Update graphics data
	STA ($7A,X)		  ; 81 7A | Update graphics data
	STA ($7A,X)		  ; 81 7A | Update graphics data
	BRA $79			  ; 80 79 | Branch always
	STA ($79,X)		  ; 81 79 | Update graphics data
	ADC $7A7F,Y		  ; 79 7F 7A | Add with carry (absolute,Y)
	BRA $7A			  ; 80 7A | Branch always
	BRA $7B			  ; 80 7B | Branch always
	STA ($7B,X)		  ; 81 7B | Update graphics data
	ROR $7E7A,X		  ; 7E 7A 7E | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7D7B,X		  ; 7D 7B 7D | Add with carry (absolute,X)
	ADC $7F7B,X		  ; 7D 7B 7F | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ROR $7D7C,X		  ; 7E 7C 7D | Rotate right (absolute,X)
	ADC $7F7D,X		  ; 7D 7D 7F | Add with carry (absolute,X)
	ADC $7D80,X		  ; 7D 80 7D | Add with carry (absolute,X)
	ROR $7E7B,X		  ; 7E 7B 7E | Rotate right (absolute,X)
	ADC $7D7F,X		  ; 7D 7F 7D | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2F0
; Address: $D3D1FE
; Size: 129 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2F0:
	BRA $7F			  ; 80 7F | Branch always
	BRA $7E			  ; 80 7E | Branch always
	BRA $80			  ; 80 80 | Branch always
	STA ($7F,X)		  ; 81 7F | Update graphics data
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7D			  ; 80 7D | Branch always
	ROR $7E7C,X		  ; 7E 7C 7E | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7D7B,X		  ; 7D 7B 7D | Add with carry (absolute,X)
	ADC $7E7B,X		  ; 7D 7B 7E | Add with carry (absolute,X)
	ADC $7D7F,X		  ; 7D 7F 7D | Add with carry (absolute,X)
	ROR $7E7D,X		  ; 7E 7D 7E | Rotate right (absolute,X)
	ADC $7D7D,X		  ; 7D 7D 7D | Add with carry (absolute,X)
	ADC $7E7D,X		  ; 7D 7D 7E | Add with carry (absolute,X)
	ROR $7E7D,X		  ; 7E 7D 7E | Rotate right (absolute,X)
	ROR $7D7C,X		  ; 7E 7C 7D | Rotate right (absolute,X)
	ADC $7D7C,X		  ; 7D 7C 7D | Add with carry (absolute,X)
	ROR $7E7C,X		  ; 7E 7C 7E | Rotate right (absolute,X)
	ROR $7E7F,X		  ; 7E 7F 7E | Rotate right (absolute,X)
	ROR $7E7F,X		  ; 7E 7F 7E | Rotate right (absolute,X)
	ROR $7D80,X		  ; 7E 80 7D | Rotate right (absolute,X)
	ADC $7D7E,X		  ; 7D 7E 7D | Add with carry (absolute,X)
	ROR $7E7E,X		  ; 7E 7E 7E | Rotate right (absolute,X)
	ADC $7D7E,X		  ; 7D 7E 7D | Add with carry (absolute,X)
	ROR $7F7E,X		  ; 7E 7E 7F | Rotate right (absolute,X)
	ROR $7E7E,X		  ; 7E 7E 7E | Rotate right (absolute,X)
	ROR $7E7E,X		  ; 7E 7E 7E | Rotate right (absolute,X)
	ADC $7D7E,X		  ; 7D 7E 7D | Add with carry (absolute,X)
	ROR $7E7D,X		  ; 7E 7D 7E | Rotate right (absolute,X)
	ADC $7E7F,X		  ; 7D 7F 7E | Add with carry (absolute,X)
	STA ($7E,X)		  ; 81 7E | Update graphics data
	ROR $7E7F,X		  ; 7E 7F 7E | Rotate right (absolute,X)
	ROR $7C7F,X		  ; 7E 7F 7C | Rotate right (absolute,X)
	ROR $7E7C,X		  ; 7E 7C 7E | Rotate right (absolute,X)
	ADC $7D7B,X		  ; 7D 7B 7D | Add with carry (absolute,X)
	ADC $7E7C,X		  ; 7D 7C 7E | Add with carry (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $8078,X		  ; 7E 78 80 | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $78			  ; 80 78 | Branch always
	ROR $7E79,X		  ; 7E 79 7E | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $7A			  ; 80 7A | Branch always
	BRA $7A			  ; 80 7A | Branch always
	BRA $79			  ; 80 79 | Branch always
	ADC $787F,Y		  ; 79 7F 78 | Add with carry (absolute,Y)
	ROR $7E7B,X		  ; 7E 7B 7E | Rotate right (absolute,X)
	ROR $7E7C,X		  ; 7E 7C 7E | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2F1
; Address: $D3D2A7
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2F1:
	PLY				  ; 7A | Pull Y register from stack
	ROR $7F7B,X		  ; 7E 7B 7F | Rotate right (absolute,X)
	ADC $7D7C,X		  ; 7D 7C 7D | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7A7C,Y		  ; 79 7C 7A | Add with carry (absolute,Y)
	ADC $7E7B,X		  ; 7D 7B 7E | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	ADC $797A,Y		  ; 79 7A 79 | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	ADC $787B,Y		  ; 79 7B 78 | Add with carry (absolute,Y)
	ADC $7A79,Y		  ; 79 79 7A | Add with carry (absolute,Y)
	ADC $797A,Y		  ; 79 7A 79 | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7A7A,Y		  ; 79 7A 7A | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7D7B,X		  ; 7D 7B 7D | Add with carry (absolute,X)
	ADC $7F7C,X		  ; 7D 7C 7F | Add with carry (absolute,X)
	ROR $7E7C,X		  ; 7E 7C 7E | Rotate right (absolute,X)
	ROR $7C7A,X		  ; 7E 7A 7C | Rotate right (absolute,X)
	ADC $7C7B,X		  ; 7D 7B 7C | Add with carry (absolute,X)
	ADC $7D7C,X		  ; 7D 7C 7D | Add with carry (absolute,X)
	ADC $7D7D,X		  ; 7D 7D 7D | Add with carry (absolute,X)
	ADC $7E7C,X		  ; 7D 7C 7E | Add with carry (absolute,X)
	ADC $7D7B,X		  ; 7D 7B 7D | Add with carry (absolute,X)
	ADC $807B,X		  ; 7D 7B 80 | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	BRA $7A			  ; 80 7A | Branch always
	ROR $7F79,X		  ; 7E 79 7F | Rotate right (absolute,X)
	STA ($7D,X)		  ; 81 7D | Update graphics data
	STY $7E			  ; 84 7E | Store Y register to zero page
	ADC $7D83,X		  ; 7D 83 7D | Add with carry (absolute,X)
	ADC $7F84,X		  ; 7D 84 7F | Add with carry (absolute,X)
	STA $7F			  ; 85 7F | Update graphics data
	STX $7F			  ; 86 7F | Store X register to zero page
	STA $7F			  ; 85 7F | Update graphics data
	STA $7F			  ; 85 7F | Update graphics data
	ADC $7A88,X		  ; 7D 88 7A | Add with carry (absolute,X)
	DEY				  ; 88 | Decrement Y register
	PLY				  ; 7A | Pull Y register from stack
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	ROR $7D85,X		  ; 7E 85 7D | Rotate right (absolute,X)
	STX $7F			  ; 86 7F | Store X register to zero page
	STX $7F			  ; 86 7F | Store X register to zero page
	STX $7F			  ; 86 7F | Store X register to zero page
	STX $7F			  ; 86 7F | Store X register to zero page
	STA $81			  ; 85 81 | Update graphics data
	STA ($87,X)		  ; 81 87 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2F2
; Address: $D3D337
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2F2:
	STA ($86,X)		  ; 81 86 | Update graphics data
	STA ($86,X)		  ; 81 86 | Update graphics data
	STA ($86,X)		  ; 81 86 | Update graphics data
	ROR $7F85,X		  ; 7E 85 7F | Rotate right (absolute,X)
	ROR $7E82,X		  ; 7E 82 7E | Rotate right (absolute,X)
	BRA $83			  ; 80 83 | Branch always
	ADC $7A83,X		  ; 7D 83 7A | Add with carry (absolute,X)
	STY $7A			  ; 84 7A | Store Y register to zero page
	STY $7B			  ; 84 7B | Store Y register to zero page
	STX $7E			  ; 86 7E | Store X register to zero page
	ADC $7A84,X		  ; 7D 84 7A | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	STA $7A			  ; 85 7A | Update graphics data
	STY $7B			  ; 84 7B | Store Y register to zero page
	STX $7B			  ; 86 7B | Store X register to zero page
	STX $7C			  ; 86 7C | Store X register to zero page
	STA ($7D,X)		  ; 81 7D | Update graphics data
	ADC $7D84,X		  ; 7D 84 7D | Add with carry (absolute,X)
	ADC $7D7F,X		  ; 7D 7F 7D | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7F80,X		  ; 7D 80 7F | Add with carry (absolute,X)
	STA ($80,X)		  ; 81 80 | Update graphics data
	STA ($7F,X)		  ; 81 7F | Update graphics data
	STA ($7F,X)		  ; 81 7F | Update graphics data
	STA ($7F,X)		  ; 81 7F | Update graphics data
	STA $80			  ; 85 80 | Update graphics data
	STA $7F			  ; 85 7F | Update graphics data
	STY $7D			  ; 84 7D | Store Y register to zero page
	STY $7E			  ; 84 7E | Store Y register to zero page
	STY $7F			  ; 84 7F | Store Y register to zero page
	STA $82			  ; 85 82 | Update graphics data
	STY $82			  ; 84 82 | Store Y register to zero page
	STY $82			  ; 84 82 | Store Y register to zero page
	STX $82			  ; 86 82 | Store X register to zero page
	STA ($84,X)		  ; 81 84 | Update graphics data
	BRA $82			  ; 80 82 | Branch always
	ROR $8081,X		  ; 7E 81 80 | Rotate right (absolute,X)
	BRA $82			  ; 80 82 | Branch always
	BRA $82			  ; 80 82 | Branch always
	STY $7F			  ; 84 7F | Store Y register to zero page
	ROR $7F82,X		  ; 7E 82 7F | Rotate right (absolute,X)
	ADC $7D80,X		  ; 7D 80 7D | Add with carry (absolute,X)
	BRA $7D			  ; 80 7D | Branch always
	BRA $7D			  ; 80 7D | Branch always
	BRA $7D			  ; 80 7D | Branch always
	BRA $7E			  ; 80 7E | Branch always
	ADC $7E82,X		  ; 7D 82 7E | Add with carry (absolute,X)
	ROR $7D83,X		  ; 7E 83 7D | Rotate right (absolute,X)
	STA ($7F,X)		  ; 81 7F | Update graphics data
	BRA $82			  ; 80 82 | Branch always

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2F3
; Address: $D3D3C3
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2F3:
	BRA $82			  ; 80 82 | Branch always
	STA ($7F,X)		  ; 81 7F | Update graphics data
	STA ($7D,X)		  ; 81 7D | Update graphics data
	BRA $7D			  ; 80 7D | Branch always
	BRA $7F			  ; 80 7F | Branch always
	STA ($7F,X)		  ; 81 7F | Update graphics data
	BRA $82			  ; 80 82 | Branch always
	BRA $82			  ; 80 82 | Branch always
	STA ($7F,X)		  ; 81 7F | Update graphics data
	STA ($7D,X)		  ; 81 7D | Update graphics data
	BRA $7D			  ; 80 7D | Branch always
	BRA $7B			  ; 80 7B | Branch always
	ROR $7F7C,X		  ; 7E 7C 7F | Rotate right (absolute,X)
	ADC $7C7F,X		  ; 7D 7F 7C | Add with carry (absolute,X)
	ROR $7E7C,X		  ; 7E 7C 7E | Rotate right (absolute,X)
	ROR $7E7C,X		  ; 7E 7C 7E | Rotate right (absolute,X)
	ROR $7F7D,X		  ; 7E 7D 7F | Rotate right (absolute,X)
	ADC $7D7F,X		  ; 7D 7F 7D | Add with carry (absolute,X)
	ROR $7D80,X		  ; 7E 80 7D | Rotate right (absolute,X)
	ADC $7D7F,X		  ; 7D 7F 7D | Add with carry (absolute,X)
	BRA $7E			  ; 80 7E | Branch always
	BRA $7C			  ; 80 7C | Branch always
	BRA $7D			  ; 80 7D | Branch always
	BRA $7E			  ; 80 7E | Branch always
	BRA $83			  ; 80 83 | Branch always
	BRA $83			  ; 80 83 | Branch always
	BRA $81			  ; 80 81 | Branch always
	BRA $81			  ; 80 81 | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7E			  ; 80 7E | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7F			  ; 80 7F | Branch always
	BRA $7E			  ; 80 7E | Branch always
	ROR $7F7F,X		  ; 7E 7F 7F | Rotate right (absolute,X)
	ROR $7E7F,X		  ; 7E 7F 7E | Rotate right (absolute,X)
	BRA $80			  ; 80 80 | Branch always
	STA ($7F,X)		  ; 81 7F | Update graphics data
	BRA $7F			  ; 80 7F | Branch always
	BRA $7C			  ; 80 7C | Branch always
	BRA $7B			  ; 80 7B | Branch always
	BRA $7C			  ; 80 7C | Branch always
	BRA $7C			  ; 80 7C | Branch always
	ROR $7E7B,X		  ; 7E 7B 7E | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7D78,X		  ; 7D 78 7D | Add with carry (absolute,X)
	ADC $797D,Y		  ; 79 7D 79 | Add with carry (absolute,Y)
	ROR $7E7B,X		  ; 7E 7B 7E | Rotate right (absolute,X)
	ROR $7D7A,X		  ; 7E 7A 7D | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7B78,X		  ; 7D 78 7B | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2F4
; Address: $D3D44F
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2F4:
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	ROR $8078,X		  ; 7E 78 80 | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $78			  ; 80 78 | Branch always
	ROR $7E79,X		  ; 7E 79 7E | Rotate right (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	BRA $7A			  ; 80 7A | Branch always
	BRA $7A			  ; 80 7A | Branch always
	BRA $79			  ; 80 79 | Branch always
	ADC $787F,Y		  ; 79 7F 78 | Add with carry (absolute,Y)
	ROR $8482,X		  ; 7E 82 84 | Rotate right (absolute,X)
	STY $82			  ; 84 82 | Store Y register to zero page
	STY $81			  ; 84 81 | Store Y register to zero page
	STY $82			  ; 84 82 | Store Y register to zero page
	STY $81			  ; 84 81 | Store Y register to zero page
	STY $81			  ; 84 81 | Store Y register to zero page
	ROR $7E84,X		  ; 7E 84 7E | Rotate right (absolute,X)
	STY $7D			  ; 84 7D | Store Y register to zero page
	STY $7C			  ; 84 7C | Store Y register to zero page
	PLY				  ; 7A | Pull Y register from stack
	ADC $7984,Y		  ; 79 84 79 | Add with carry (absolute,Y)
	ADC $7987,Y		  ; 79 87 79 | Add with carry (absolute,Y)
	STA $7C			  ; 85 7C | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	STY $7B			  ; 84 7B | Store Y register to zero page
	STA ($86,X)		  ; 81 86 | Update graphics data
	STA ($87,X)		  ; 81 87 | Update graphics data
	DEY				  ; 88 | Decrement Y register
	BRA $86			  ; 80 86 | Branch always
	ADC $7E84,X		  ; 7D 84 7E | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	BRA $7A			  ; 80 7A | Branch always
	BRA $7B			  ; 80 7B | Branch always
	BRA $7B			  ; 80 7B | Branch always
	BRA $7B			  ; 80 7B | Branch always
	BRA $7E			  ; 80 7E | Branch always
	STA $7F			  ; 85 7F | Update graphics data
	ROR $7E82,X		  ; 7E 82 7E | Rotate right (absolute,X)
	BRA $83			  ; 80 83 | Branch always

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2F5
; Address: $D3D4D7
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2F5:
	ADC $7A83,X		  ; 7D 83 7A | Add with carry (absolute,X)
	STY $7A			  ; 84 7A | Store Y register to zero page
	STY $81			  ; 84 81 | Store Y register to zero page
	STY $81			  ; 84 81 | Store Y register to zero page
	STY $7F			  ; 84 7F | Store Y register to zero page
	ROR $7D82,X		  ; 7E 82 7D | Rotate right (absolute,X)
	ROR $7F82,X		  ; 7E 82 7F | Rotate right (absolute,X)
	STA ($7F,X)		  ; 81 7F | Update graphics data
	STA ($7F,X)		  ; 81 7F | Update graphics data
	STA ($80,X)		  ; 81 80 | Update graphics data
	STA ($7D,X)		  ; 81 7D | Update graphics data
	BRA $7A			  ; 80 7A | Branch always
	ADC $7D7F,X		  ; 7D 7F 7D | Add with carry (absolute,X)
	ADC $7D83,X		  ; 7D 83 7D | Add with carry (absolute,X)
	STY $7D			  ; 84 7D | Store Y register to zero page
	STA ($7C,X)		  ; 81 7C | Update graphics data
	STX $7B			  ; 86 7B | Store X register to zero page
	STX $7A			  ; 86 7A | Store X register to zero page
	STY $7A			  ; 84 7A | Store Y register to zero page
	STA $7A			  ; 85 7A | Update graphics data
	ADC $7E84,X		  ; 7D 84 7E | Add with carry (absolute,X)
	STX $7B			  ; 86 7B | Store X register to zero page
	BRA $7A			  ; 80 7A | Branch always
	PLY				  ; 7A | Pull Y register from stack
	BRA $7A			  ; 80 7A | Branch always
	ROR $7F79,X		  ; 7E 79 7F | Rotate right (absolute,X)
	STA ($7D,X)		  ; 81 7D | Update graphics data
	STY $7E			  ; 84 7E | Store Y register to zero page
	ADC $7D83,X		  ; 7D 83 7D | Add with carry (absolute,X)
	ADC $7F84,X		  ; 7D 84 7F | Add with carry (absolute,X)
	STA $7F			  ; 85 7F | Update graphics data
	STX $7F			  ; 86 7F | Store X register to zero page
	STA $7F			  ; 85 7F | Update graphics data
	STA $7F			  ; 85 7F | Update graphics data
	ADC $7A88,X		  ; 7D 88 7A | Add with carry (absolute,X)
	DEY				  ; 88 | Decrement Y register
	PLY				  ; 7A | Pull Y register from stack
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	ROR $7D85,X		  ; 7E 85 7D | Rotate right (absolute,X)
	STX $7F			  ; 86 7F | Store X register to zero page
	STX $7F			  ; 86 7F | Store X register to zero page
	STX $7F			  ; 86 7F | Store X register to zero page
	STX $7F			  ; 86 7F | Store X register to zero page
	STA $81			  ; 85 81 | Update graphics data
	STA ($87,X)		  ; 81 87 | Update graphics data
	STA ($86,X)		  ; 81 86 | Update graphics data
	STA ($86,X)		  ; 81 86 | Update graphics data
	STA ($86,X)		  ; 81 86 | Update graphics data
	ROR $7F85,X		  ; 7E 85 7F | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2F6
; Address: $D3D561
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2F6:
	ROR $7E82,X		  ; 7E 82 7E | Rotate right (absolute,X)
	BRA $83			  ; 80 83 | Branch always
	ADC $7A83,X		  ; 7D 83 7A | Add with carry (absolute,X)
	STY $7A			  ; 84 7A | Store Y register to zero page
	STY $7B			  ; 84 7B | Store Y register to zero page
	STX $7E			  ; 86 7E | Store X register to zero page
	ADC $7A84,X		  ; 7D 84 7A | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	STA $7A			  ; 85 7A | Update graphics data
	STY $7B			  ; 84 7B | Store Y register to zero page
	STX $7B			  ; 86 7B | Store X register to zero page
	STX $69			  ; 86 69 | Store X register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	ADC #$8A			 ; 69 8A | Add with carry (immediate)
	BVS $8B			  ; 70 8B | Branch if overflow set
	JMP ($6B8B)		  ; 6C 8B 6B | Jump to address (absolute indirect)
	STY $8A6C			; 8C 6C 8A | Store Y register to absolute address
	ADC ($84),Y		  ; 71 84 | Add with carry ((zero page),Y)
	ROR $7083			; 6E 83 70 | Rotate right (absolute)
	ROR $7F6D,X		  ; 7E 6D 7F | Rotate right (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $6E81			; 6E 81 6E | Rotate right (absolute)
	STA ($76,X)		  ; 81 76 | Update graphics data
	BIT #$76			 ; 89 76 | Test bits in accumulator (immediate)
	BIT #$7A			 ; 89 7A | Test bits in accumulator (immediate)
	STY $72			  ; 84 72 | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	STX $76			  ; 86 76 | Store X register to zero page
	PHB				  ; 8B | Push data bank register to stack
	STA $8D7B			; 8D 7B 8D | Update graphics data
	ADC $788E,Y		  ; 79 8E 78 | Add with carry (absolute,Y)
	STX $8E7B			; 8E 7B 8E | Store X register to absolute address
	ADC $7C8A,X		  ; 7D 8A 7C | Add with carry (absolute,X)
	STA $8D7E			; 8D 7E 8D | Update graphics data
	STA ($90,X)		  ; 81 90 | Update graphics data
	BCC $82			  ; 90 82 | Branch if carry clear
	BCC $83			  ; 90 83 | Branch if carry clear
	STA ($83),Y		  ; 91 83 | Update graphics data
	BRA $8C			  ; 80 8C | Branch always
	STA ($80),Y		  ; 91 80 | Update graphics data
	BCC $7A			  ; 90 7A | Branch if carry clear
	ADC $7998,Y		  ; 79 98 79 | Add with carry (absolute,Y)
	ADC $7E94,Y		  ; 79 94 7E | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7E96,X		  ; 7D 96 7E | Add with carry (absolute,X)
	STA $91			  ; 85 91 | Update graphics data
	STY $93			  ; 84 93 | Store Y register to zero page
	ROR $8090,X		  ; 7E 90 80 | Rotate right (absolute,X)
	STA $9280			; 8D 80 92 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2F7
; Address: $D3D5ED
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2F7:
	STY $90			  ; 84 90 | Store Y register to zero page
	STX $93			  ; 86 93 | Store X register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	DEY				  ; 88 | Decrement Y register
	STY $8D			  ; 84 8D | Store Y register to zero page
	STA $7D927F		  ; 8F 7F 92 7D | Update graphics data
	STX $8B7E			; 8E 7E 8B | Store X register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	ROR $7A89,X		  ; 7E 89 7A | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ADC $798A,Y		  ; 79 8A 79 | Add with carry (absolute,Y)
	DEY				  ; 88 | Decrement Y register
	STA $75			  ; 85 75 | Update graphics data
	STA $8B7D			; 8D 7D 8B | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	STA $8D75			; 8D 75 8D | Update graphics data
	ADC ($92),Y		  ; 71 92 | Add with carry ((zero page),Y)
	ADC ($92),Y		  ; 71 92 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7C8C,Y		  ; 79 8C 7C | Add with carry (absolute,Y)
	STA $7E877D		  ; 8F 7D 87 7E | Update graphics data
	STY $897E			; 8C 7E 89 | Store Y register to absolute address
	BIT #$78			 ; 89 78 | Test bits in accumulator (immediate)
	BIT #$79			 ; 89 79 | Test bits in accumulator (immediate)
	BIT #$7A			 ; 89 7A | Test bits in accumulator (immediate)
	STA ($7A,X)		  ; 81 7A | Update graphics data
	STA ($7A,X)		  ; 81 7A | Update graphics data
	STA ($7E,X)		  ; 81 7E | Update graphics data
	STA ($7D,X)		  ; 81 7D | Update graphics data
	ADC $8089,X		  ; 7D 89 80 | Add with carry (absolute,X)
	DEY				  ; 88 | Decrement Y register
	STY $86			  ; 84 86 | Store Y register to zero page
	STA ($86,X)		  ; 81 86 | Update graphics data
	STA ($85,X)		  ; 81 85 | Update graphics data
	STA $80			  ; 85 80 | Update graphics data
	STA $80			  ; 85 80 | Update graphics data
	STY $80			  ; 84 80 | Store Y register to zero page
	STX $7F			  ; 86 7F | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	STX $80			  ; 86 80 | Store X register to zero page
	BIT #$7D			 ; 89 7D | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	STA ($89,X)		  ; 81 89 | Update graphics data
	STA ($89,X)		  ; 81 89 | Update graphics data
	STY $8C			  ; 84 8C | Store Y register to zero page
	STY $8E			  ; 84 8E | Store Y register to zero page
	STX $8C88			; 8E 88 8C | Store X register to absolute address
	STX $8E85			; 8E 85 8E | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2F8
; Address: $D3D679
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2F8:
	STY $8C			  ; 84 8C | Store Y register to zero page
	STY $89			  ; 84 89 | Store Y register to zero page
	STX $8C7E			; 8E 7E 8C | Store X register to absolute address
	STY $94			  ; 84 94 | Store Y register to zero page
	STA ($90,X)		  ; 81 90 | Update graphics data
	BCC $82			  ; 90 82 | Branch if carry clear
	STA $808F82		  ; 8F 82 8F 80 | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	ROR $7E87,X		  ; 7E 87 7E | Rotate right (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	STY $8A77			; 8C 77 8A | Store Y register to absolute address
	PLY				  ; 7A | Pull Y register from stack
	STX $7C			  ; 86 7C | Store X register to zero page
	STA $76			  ; 85 76 | Update graphics data
	STA ($77,X)		  ; 81 77 | Update graphics data
	ROR $7F74,X		  ; 7E 74 7F | Rotate right (absolute,X)
	ADC $7685,Y		  ; 79 85 76 | Add with carry (absolute,Y)
	STX $76			  ; 86 76 | Store X register to zero page
	STX $77			  ; 86 77 | Store X register to zero page
	BIT #$7C			 ; 89 7C | Test bits in accumulator (immediate)
	BIT #$79			 ; 89 79 | Test bits in accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	STA $78			  ; 85 78 | Update graphics data
	STY $80			  ; 84 80 | Store Y register to zero page
	BCC $80			  ; 90 80 | Branch if carry clear
	STX $8E87			; 8E 87 8E | Store X register to absolute address
	STX $91			  ; 86 91 | Store X register to zero page
	BRA $8E			  ; 80 8E | Branch always
	BRA $8B			  ; 80 8B | Branch always
	ADC $828B,X		  ; 7D 8B 82 | Add with carry (absolute,X)
	STY $8D7A			; 8C 7A 8D | Store Y register to absolute address
	ADC $7790,X		  ; 7D 90 77 | Add with carry (absolute,X)
	STA ($77),Y		  ; 91 77 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	STX $8C7E			; 8E 7E 8C | Store X register to absolute address
	STY $94			  ; 84 94 | Store Y register to zero page
	STA ($90,X)		  ; 81 90 | Update graphics data
	BCC $82			  ; 90 82 | Branch if carry clear
	STA $808F82		  ; 8F 82 8F 80 | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	ROR $7E87,X		  ; 7E 87 7E | Rotate right (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	STY $8A77			; 8C 77 8A | Store Y register to absolute address
	PLY				  ; 7A | Pull Y register from stack
	STX $7C			  ; 86 7C | Store X register to zero page
	STA $76			  ; 85 76 | Update graphics data
	STA ($77,X)		  ; 81 77 | Update graphics data
	ROR $7F74,X		  ; 7E 74 7F | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2F9
; Address: $D3D70B
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2F9:
	ADC $7685,Y		  ; 79 85 76 | Add with carry (absolute,Y)
	STX $76			  ; 86 76 | Store X register to zero page
	STX $77			  ; 86 77 | Store X register to zero page
	BIT #$7C			 ; 89 7C | Test bits in accumulator (immediate)
	BIT #$79			 ; 89 79 | Test bits in accumulator (immediate)
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	STA $78			  ; 85 78 | Update graphics data
	STY $70			  ; 84 70 | Store Y register to zero page
	ROR $6F7D			; 6E 7D 6F | Rotate right (absolute)
	ADC ($83),Y		  ; 71 83 | Add with carry ((zero page),Y)
	STA ($6F,X)		  ; 81 6F | Update graphics data
	STA ($6E,X)		  ; 81 6E | Update graphics data
	ROR $7E6E,X		  ; 7E 6E 7E | Rotate right (absolute,X)
	ADC ($7D),Y		  ; 71 7D | Add with carry ((zero page),Y)
	ROR $6C7B			; 6E 7B 6C | Rotate right (absolute)
	ROR $7479			; 6E 79 74 | Rotate right (absolute)
	ADC $7E72,X		  ; 7D 72 7E | Add with carry (absolute,X)
	STY $76			  ; 84 76 | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	DEY				  ; 88 | Decrement Y register
	ADC $7C88,Y		  ; 79 88 7C | Add with carry (absolute,Y)
	STY $8C74			; 8C 74 8C | Store Y register to absolute address
	STY $7A			  ; 84 7A | Store Y register to zero page
	STX $7A			  ; 86 7A | Store X register to zero page
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	STY $906F			; 8C 6F 90 | Store Y register to absolute address
	BCC $6E			  ; 90 6E | Branch if carry clear
	BIT #$6E			 ; 89 6E | Test bits in accumulator (immediate)
	STA $8E6D			; 8D 6D 8E | Update graphics data
	STA $8875			; 8D 75 88 | Update graphics data
	STA $7A			  ; 85 7A | Update graphics data
	STY $75			  ; 84 75 | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	STX $7E			  ; 86 7E | Store X register to zero page
	BIT #$7F			 ; 89 7F | Test bits in accumulator (immediate)
	STX $78			  ; 86 78 | Store X register to zero page
	STX $78			  ; 86 78 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	EOR $667E,X		  ; 5D 7E 66 | Exclusive OR with accumulator (absolute,X)
	BRA $60			  ; 80 60 | Branch always
	STX $5A			  ; 86 5A | Store X register to zero page
	STA $578B56		  ; 8F 56 8B 57 | Update graphics data
	STA $519451		  ; 8F 51 94 51 | Update graphics data
	EOR $4E98,Y		  ; 59 98 4E | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2FA
; Address: $D3D790
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2FA:
	STA ($50),Y		  ; 91 50 | Update graphics data
	STY $8C51			; 8C 51 8C | Store Y register to absolute address
	BVC $8E			  ; 50 8E | Branch if overflow clear
	STX $9342			; 8E 42 93 | Store X register to absolute address
	WDM #$98			 ; 42 98 | Reserved instruction
	EOR #$93			 ; 49 93 | Exclusive OR with accumulator (immediate)
	STA $5A8B56		  ; 8F 56 8B 5A | Update graphics data
	STA $668660		  ; 8F 60 86 66 | Update graphics data
	BRA $5D			  ; 80 5D | Branch always
	ROR $7E5C,X		  ; 7E 5C 7E | Rotate right (absolute,X)
	ADC ($82,X)		  ; 61 82 | Add with carry ((zero page,X))
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	STX $6E			  ; 86 6E | Store X register to zero page
	BIT #$71			 ; 89 71 | Test bits in accumulator (immediate)
	BIT #$76			 ; 89 76 | Test bits in accumulator (immediate)
	STX $70			  ; 86 70 | Store X register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	JMP ($678E)		  ; 6C 8E 67 | Jump to address (absolute indirect)
	BCC $67			  ; 90 67 | Branch if carry clear
	JMP ($6A96)		  ; 6C 96 6A | Jump to address (absolute indirect)
	STA				  ; 9F 80 A0 7C | Update graphics data
	LDY #$7A			 ; A0 7A | Load immediate value into Y register
	STA				  ; 9F 7C 9C 6C | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	ROR $9A			  ; 66 9A | Rotate right (zero page)
	ROR $95			  ; 66 95 | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	STX $8B72			; 8E 72 8B | Store X register to absolute address
	ADC ($89),Y		  ; 71 89 | Add with carry ((zero page),Y)
	ADC ($8D),Y		  ; 71 8D | Add with carry ((zero page),Y)
	STY $8A78			; 8C 78 8A | Store Y register to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PHB				  ; 8B | Push data bank register to stack
	STA ($94,X)		  ; 81 94 | Update graphics data
	STA ($9B,X)		  ; 81 9B | Update graphics data
	ROR $8097,X		  ; 7E 97 80 | Rotate right (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	ADC $7F96,X		  ; 7D 96 7F | Add with carry (absolute,X)
	STA ($7E),Y		  ; 91 7E | Update graphics data
	STA $6E8875		  ; 8F 75 88 6E | Update graphics data
	DEY				  ; 88 | Decrement Y register
	ADC $6D7D			; 6D 7D 6D | Add with carry (absolute)
	STA $75			  ; 85 75 | Update graphics data
	ROR $6E7F			; 6E 7F 6E | Rotate right (absolute)
	STA $6D			  ; 85 6D | Update graphics data
	STA $69			  ; 85 69 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ADC #$8A			 ; 69 8A | Add with carry (immediate)
	BVS $8B			  ; 70 8B | Branch if overflow set

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2FB
; Address: $D3D813
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2FB:
	JMP ($6B8B)		  ; 6C 8B 6B | Jump to address (absolute indirect)
	STY $8A6C			; 8C 6C 8A | Store Y register to absolute address
	ADC ($84),Y		  ; 71 84 | Add with carry ((zero page),Y)
	STY $76			  ; 84 76 | Store Y register to zero page
	STA ($73,X)		  ; 81 73 | Update graphics data
	STA ($70,X)		  ; 81 70 | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	STA ($71,X)		  ; 81 71 | Update graphics data
	STA ($6D,X)		  ; 81 6D | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	ADC $6D88			; 6D 88 6D | Add with carry (absolute)
	ROR $6F83			; 6E 83 6F | Rotate right (absolute)
	STX $6B			  ; 86 6B | Store X register to zero page
	STX $68			  ; 86 68 | Store X register to zero page
	ADC $83			  ; 65 83 | Add with carry (zero page)
	STA ($5E,X)		  ; 81 5E | Update graphics data
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	EOR $596E,Y		  ; 59 6E 59 | Exclusive OR with accumulator (absolute,Y)
	ROR $6E5C			; 6E 5C 6E | Rotate right (absolute)
	ADC ($65),Y		  ; 71 65 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $78			  ; 65 78 | Add with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2FC
; Address: $D3D852
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2FC:
	ADC $7961,Y		  ; 79 61 79 | Add with carry (absolute,Y)
	STZ $76			  ; 64 76 | Store zero to zero page
	ROR				  ; 6A | Rotate right (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $6E7E			; 6E 7E 6E | Rotate right (absolute)
	BRA $6C			  ; 80 6C | Branch always
	ROR $7D6D,X		  ; 7E 6D 7D | Rotate right (absolute,X)
	BVS $78			  ; 70 78 | Branch if overflow set
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7A74,Y		  ; 79 74 7A | Add with carry (absolute,Y)
	ROR $6E81			; 6E 81 6E | Rotate right (absolute)
	STA ($72,X)		  ; 81 72 | Update graphics data
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $707F			; 6D 7F 70 | Add with carry (absolute)
	ROR $836E,X		  ; 7E 6E 83 | Rotate right (absolute,X)
	BCC $B0			  ; 90 B0 | Branch if carry clear
	PHB				  ; 8B | Push data bank register to stack
	LDA $7AAB84		  ; AF 84 AB 7A | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	LDX $77			  ; A6 77 | Load from zero page into X register
	LDX $77			  ; A6 77 | Load from zero page into X register
	LDY #$7C			 ; A0 7C | Load immediate value into Y register
	STZ $9A80,X		  ; 9E 80 9A | Store zero to absolute,X
	STX $96			  ; 86 96 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2FD
; Address: $D3D891
; Size: 118 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2FD:
	STA ($99,X)		  ; 81 99 | Update graphics data
	ROR $7F99,X		  ; 7E 99 7F | Rotate right (absolute,X)
	ADC $7190,Y		  ; 79 90 71 | Add with carry (absolute,Y)
	JMP ($6D8E)		  ; 6C 8E 6D | Jump to address (absolute indirect)
	STX $9076			; 8E 76 90 | Store X register to absolute address
	BVS $96			  ; 70 96 | Branch if overflow set
	ROR				  ; 6A | Rotate right (accumulator)
	STA				  ; 9F 66 9B 67 | Update graphics data
	STA				  ; 9F 61 A4 61 | Update graphics data
	LDA $AB71			; AD 71 AB | Read graphics status
	ADC ($B0),Y		  ; 71 B0 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $61B0			; 6E B0 61 | Rotate right (absolute)
	LDY #$56			 ; A0 56 | Load immediate value into Y register
	STA $9458,Y		  ; 99 58 94 | Update graphics data
	EOR $5894,Y		  ; 59 94 58 | Exclusive OR with accumulator (absolute,Y)
	JMP $9B4A96		  ; 5C 96 4A 9B | Jump to address long
	LSR				  ; 4A | Logical shift right (accumulator)
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	LDA ($4D,X)		  ; A1 4D | Read graphics status
	STA $9E4C,X		  ; 9D 4C 9E | Update graphics data
	TAY				  ; A8 | Transfer accumulator to Y register
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDX $AB4B			; AE 4B AB | Load from absolute address into X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LDY $49			  ; A4 49 | Load from zero page into Y register
	STA $5A8B56		  ; 8F 56 8B 5A | Update graphics data
	STA $668660		  ; 8F 60 86 66 | Update graphics data
	BRA $5D			  ; 80 5D | Branch always
	ROR $7E5C,X		  ; 7E 5C 7E | Rotate right (absolute,X)
	ADC ($82,X)		  ; 61 82 | Add with carry ((zero page,X))
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	STX $6E			  ; 86 6E | Store X register to zero page
	BIT #$71			 ; 89 71 | Test bits in accumulator (immediate)
	BIT #$76			 ; 89 76 | Test bits in accumulator (immediate)
	STX $70			  ; 86 70 | Store X register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	JMP ($678E)		  ; 6C 8E 67 | Jump to address (absolute indirect)
	BCC $67			  ; 90 67 | Branch if carry clear
	JMP ($6A96)		  ; 6C 96 6A | Jump to address (absolute indirect)
	STA				  ; 9F 80 A0 7C | Update graphics data
	LDY #$7A			 ; A0 7A | Load immediate value into Y register
	STA				  ; 9F 7C 9C 6C | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	ROR $9A			  ; 66 9A | Rotate right (zero page)
	ROR $95			  ; 66 95 | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	STX $8B72			; 8E 72 8B | Store X register to absolute address
	ADC ($89),Y		  ; 71 89 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2FE
; Address: $D3D921
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2FE:
	ADC ($8D),Y		  ; 71 8D | Add with carry ((zero page),Y)
	STY $8A78			; 8C 78 8A | Store Y register to absolute address
	PLY				  ; 7A | Pull Y register from stack
	PHB				  ; 8B | Push data bank register to stack
	STA ($94,X)		  ; 81 94 | Update graphics data
	STA ($9B,X)		  ; 81 9B | Update graphics data
	ROR $7FA0,X		  ; 7E A0 7F | Rotate right (absolute,X)
	STA				  ; 9F 81 9A 8B | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	BIT #$A4			 ; 89 A4 | Test bits in accumulator (immediate)
	STY $8BA6			; 8C A6 8B | Store Y register to absolute address
	LDX $85			  ; A6 85 | Load from zero page into X register
	STA $A0			  ; 85 A0 | Update graphics data
	STA $9B			  ; 85 9B | Update graphics data
	STX $9B			  ; 86 9B | Store X register to zero page
	STZ $9E83,X		  ; 9E 83 9E | Store zero to absolute,X
	BRA $9A			  ; 80 9A | Branch always
	ADC $7A9B,X		  ; 7D 9B 7A | Add with carry (absolute,X)
	STA $8D76,Y		  ; 99 76 8D | Update graphics data
	STX $8A72			; 8E 72 8A | Store X register to absolute address
	ADC ($86),Y		  ; 71 86 | Add with carry ((zero page),Y)
	ADC ($86),Y		  ; 71 86 | Add with carry ((zero page),Y)
	STX $7A			  ; 86 7A | Store X register to zero page
	BIT #$7D			 ; 89 7D | Test bits in accumulator (immediate)
	BCC $7D			  ; 90 7D | Branch if carry clear
	BCC $78			  ; 90 78 | Branch if carry clear
	STA ($79),Y		  ; 91 79 | Update graphics data
	STA ($7C),Y		  ; 91 7C | Update graphics data
	STX $9082			; 8E 82 90 | Store X register to absolute address
	STX $96			  ; 86 96 | Store X register to zero page
	STX $98			  ; 86 98 | Store X register to zero page
	STY $96			  ; 84 96 | Store Y register to zero page
	STA $95			  ; 85 95 | Update graphics data
	DEY				  ; 88 | Decrement Y register
	BCC $8C			  ; 90 8C | Branch if carry clear
	PHB				  ; 8B | Push data bank register to stack
	BCC $8B			  ; 90 8B | Branch if carry clear
	STA ($8C),Y		  ; 91 8C | Update graphics data
	LDA $AB51			; AD 51 AB | Read graphics status
	EOR ($B0),Y		  ; 51 B0 | Exclusive OR with accumulator ((zero page),Y)
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $B65BB5		  ; 5C B5 5B B6 | Jump to address long
	LSR $41B0			; 4E B0 41 | Logical shift right (absolute)
	LDY #$36			 ; A0 36 | Load immediate value into Y register
	STA $9438,Y		  ; 99 38 94 | Update graphics data
	AND $3894,Y		  ; 39 94 38 | Logical AND with accumulator (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	LDY #$28			 ; A0 28 | Load immediate value into Y register
	LDA ($2D,X)		  ; A1 2D | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_2FF
; Address: $D3D9A0
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_2FF:
	STA $9E2C,X		  ; 9D 2C 9E | Update graphics data
	BIT $A8			  ; 24 A8 | Test bits in accumulator (zero page)
	BIT $AB			  ; 24 AB | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	LDX $AB2B			; AE 2B AB | Load from absolute address into X register
	ROL				  ; 2A | Rotate left (accumulator)
	LDY $29			  ; A4 29 | Load from zero page into Y register
	STA $3A8B36		  ; 8F 36 8B 3A | Update graphics data
	STA $468640		  ; 8F 40 86 46 | Update graphics data
	BRA $3D			  ; 80 3D | Branch always
	ROR $A563,X		  ; 7E 63 A5 | Rotate right (absolute,X)
	LDY #$61			 ; A0 61 | Load immediate value into Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	BCC $5B			  ; 90 5B | Branch if carry clear
	BCC $57			  ; 90 57 | Branch if carry clear
	STA ($53),Y		  ; 91 53 | Update graphics data
	EOR ($9A),Y		  ; 51 9A | Exclusive OR with accumulator ((zero page),Y)
	TXS				  ; 9A | Transfer X register to stack pointer
	LSR $97			  ; 46 97 | Logical shift right (zero page)
	LSR $8D			  ; 46 8D | Logical shift right (zero page)
	WDM #$86			 ; 42 86 | Reserved instruction
	EOR ($81,X)		  ; 41 81 | Exclusive OR with accumulator ((zero page,X))
	LSR $80			  ; 46 80 | Logical shift right (zero page)
	EOR $5680			; 4D 80 56 | Exclusive OR with accumulator (absolute)
	BIT #$55			 ; 89 55 | Test bits in accumulator (immediate)
	STX $9054			; 8E 54 90 | Store X register to absolute address
	CLI				  ; 58 | Clear interrupt disable flag
	BCC $56			  ; 90 56 | Branch if carry clear
	STA $519155		  ; 8F 55 91 51 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	CLI				  ; 58 | Clear interrupt disable flag
	STA $9459			; 8D 59 94 | Update graphics data
	JMP $9B6294		  ; 5C 94 62 9B | Jump to address long
	ADC ($9E,X)		  ; 61 9E | Add with carry ((zero page,X))
	ADC ($9F,X)		  ; 61 9F | Add with carry ((zero page,X))
	ADC #$9B			 ; 69 9B | Add with carry (immediate)
	ADC ($9E),Y		  ; 71 9E | Add with carry ((zero page),Y)
	ADC ($A6),Y		  ; 71 A6 | Add with carry ((zero page),Y)
	LDX $73			  ; A6 73 | Load from zero page into X register
	TAX				  ; AA | Transfer accumulator to X register
	ADC ($A6),Y		  ; 71 A6 | Add with carry ((zero page),Y)
	ADC #$B4			 ; 69 B4 | Add with carry (immediate)
	TSX				  ; BA | Transfer stack pointer to X register
	ADC $BB			  ; 65 BB | Add with carry (zero page)
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	JMP $B066B9		  ; 5C B9 66 B0 | Jump to address long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_300
; Address: $D3DA1B
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_300:
	ADC $73B0			; 6D B0 73 | Add with carry (absolute)
	LDA $AB71			; AD 71 AB | Read graphics status
	ADC ($B0),Y		  ; 71 B0 | Add with carry ((zero page),Y)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $51B0			; 6E B0 51 | Rotate right (absolute)
	BCC $58			  ; 90 58 | Branch if carry clear
	EOR $5D99,X		  ; 5D 99 5D | Exclusive OR with accumulator (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $955B,Y		  ; 99 5B 95 | Update graphics data
	EOR ($A7),Y		  ; 51 A7 | Exclusive OR with accumulator ((zero page),Y)
	BVC $A9			  ; 50 A9 | Branch if overflow clear
	LDY $53			  ; A4 53 | Load from zero page into Y register
	LDA $49			  ; A5 49 | Read graphics status
	LDA $AD46			; AD 46 AD | Read graphics status
	LDA #$46			 ; A9 46 | Read graphics status
	LDX $4D			  ; A6 4D | Load from zero page into X register
	LSR $5DA8,X		  ; 5E A8 5D | Logical shift right (absolute,X)
	LDX #$62			 ; A2 62 | Load immediate value into X register
	TXS				  ; 9A | Transfer X register to stack pointer
	ROR $9B			  ; 66 9B | Rotate right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_301
; Address: $D3DA58
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_301:
	STA ($71),Y		  ; 91 71 | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	JMP $82617E		  ; 5C 7E 61 82 | Jump to address long
	ADC #$80			 ; 69 80 | Add with carry (immediate)
	STX $6E			  ; 86 6E | Store X register to zero page
	BIT #$71			 ; 89 71 | Test bits in accumulator (immediate)
	BIT #$76			 ; 89 76 | Test bits in accumulator (immediate)
	STX $70			  ; 86 70 | Store X register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	JMP ($678E)		  ; 6C 8E 67 | Jump to address (absolute indirect)
	BCC $67			  ; 90 67 | Branch if carry clear
	JMP ($6A96)		  ; 6C 96 6A | Jump to address (absolute indirect)
	STA				  ; 9F 80 A0 58 | Update graphics data
	REP #$59			 ; C2 59 | Reset processor status bits
	LDX $C159,Y		  ; BE 59 C1 | Load from absolute,Y into X register
	CMP ($57,X)		  ; C1 57 | Compare accumulator ((zero page,X))
	LDX $B851,Y		  ; BE 51 B8 | Load from absolute,Y into X register
	EOR #$BA			 ; 49 BA | Exclusive OR with accumulator (immediate)
	EOR $B6			  ; 45 B6 | Exclusive OR with accumulator (zero page)
	LSR $48B8			; 4E B8 48 | Logical shift right (absolute)
	LDX $C742,Y		  ; BE 42 C7 | Load from absolute,Y into X register
	ROL $3FC3,X		  ; 3E C3 3F | Rotate left (absolute,X)
	CPY $CB31			; CC 31 CB | Compare Y register (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	DEC $DB24,X		  ; DE 24 DB | Decrement (absolute,X)
	BIT $D8			  ; 24 D8 | Test bits in accumulator (zero page)
	BIT $2DCE			; 2C CE 2D | Test bits in accumulator (absolute)
	CMP $D128			; CD 28 D1 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_302
; Address: $D3DAAD
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_302:
	AND ($D4,X)		  ; 21 D4 | Logical AND with accumulator ((zero page,X))
	CLD				  ; D8 | Clear decimal mode flag
	ROL $32D1			; 2E D1 32 | Rotate left (absolute)
	BNE $38			  ; D0 38 | Branch if not equal
	CMP $C73E			; CD 3E C7 | Compare accumulator (absolute)
	INY				  ; C8 | Increment Y register
	DEC				  ; 3A | Decrement accumulator
	INY				  ; C8 | Increment Y register
	ROL $3BC0,X		  ; 3E C0 3B | Rotate left (absolute,X)
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	AND ($9B),Y		  ; 31 9B | Logical AND with accumulator ((zero page),Y)
	STX $8D2C			; 8E 2C 8D | Store X register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	STX $912B			; 8E 2B 91 | Store X register to absolute address
	AND ($98),Y		  ; 31 98 | Logical AND with accumulator ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	AND ($9C),Y		  ; 31 9C | Logical AND with accumulator ((zero page),Y)
	AND ($A3),Y		  ; 31 A3 | Logical AND with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	LDA $AF2E			; AD 2E AF | Read graphics status
	ROL $AF			  ; 26 AF | Rotate left (zero page)
	ROL $A4			  ; 26 A4 | Rotate left (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	AND $3BA0			; 2D A0 3B | Logical AND with accumulator (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR $A0			  ; 46 A0 | Logical shift right (zero page)
	WDM #$A8			 ; 42 A8 | Reserved instruction
	TAY				  ; A8 | Transfer accumulator to Y register
	LSR $A7			  ; 46 A7 | Logical shift right (zero page)
	LSR $A7			  ; 46 A7 | Logical shift right (zero page)
	EOR $4DAD			; 4D AD 4D | Exclusive OR with accumulator (absolute)
	BCS $54			  ; B0 54 | Branch if carry set
	LDA ($56),Y		  ; B1 56 | Read graphics status
	CLV				  ; B8 | Clear overflow flag
	BVC $B4			  ; 50 B4 | Branch if overflow clear
	STZ $A03E,X		  ; 9E 3E A0 | Store zero to absolute,X
	AND $33A0,Y		  ; 39 A0 33 | Logical AND with accumulator (absolute,Y)
	STA $9632,Y		  ; 99 32 96 | Update graphics data
	AND $49A3,Y		  ; 39 A3 49 | Logical AND with accumulator (absolute,Y)
	BCS $50			  ; B0 50 | Branch if carry set
	LDA $B855,Y		  ; B9 55 B8 | Read graphics status
	LDA $B553,Y		  ; B9 53 B5 | Read graphics status
	LSR $49C7			; 4E C7 49 | Logical shift right (absolute)
	PHA				  ; 48 | Push accumulator to stack
	CMP #$4C			 ; C9 4C | Compare accumulator (immediate)
	CPY $4B			  ; C4 4B | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_303
; Address: $D3DB32
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_303:
	CMP $41			  ; C5 41 | Compare accumulator (zero page)
	CMP $CD3E			; CD 3E CD | Compare accumulator (absolute)
	CMP #$3E			 ; C9 3E | Compare accumulator (immediate)
	DEC $45			  ; C6 45 | Decrement (zero page)
	INY				  ; C8 | Increment Y register
	REP #$5A			 ; C2 5A | Reset processor status bits
	TSX				  ; BA | Transfer stack pointer to X register
	LSR $5ABB,X		  ; 5E BB 5A | Logical shift right (absolute,X)
	LDA ($69),Y		  ; B1 69 | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_305
; Address: $D3DB50
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_305:
	BCS $69			  ; B0 69 | Branch if carry set
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX #$60			 ; A2 60 | Load immediate value into X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_306
; Address: $D3DB58
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_306:
	LDY #$63			 ; A0 63 | Load immediate value into Y register
	LDY #$5F			 ; A0 5F | Load immediate value into Y register
	LDA ($5B,X)		  ; A1 5B | Read graphics status
	LDA $59			  ; A5 59 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	LDA $4E			  ; A5 4E | Read graphics status
	LSR $4A9D			; 4E 9D 4A | Logical shift right (absolute)
	EOR #$91			 ; 49 91 | Exclusive OR with accumulator (immediate)
	EOR #$95			 ; 49 95 | Exclusive OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR $4F95			; 4D 95 4F | Exclusive OR with accumulator (absolute)
	LDA $4F			  ; A5 4F | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$25			 ; A2 25 | Load immediate value into X register
	LDA ($21),Y		  ; B1 21 | PPU graphics register access
	TAX				  ; AA | Transfer accumulator to X register
	BIT $AB			  ; 24 AB | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	LDA $B429			; AD 29 B4 | Read graphics status
	BIT $32B4			; 2C B4 32 | Test bits in accumulator (absolute)
	AND ($BE),Y		  ; 31 BE | Logical AND with accumulator ((zero page),Y)
	AND ($BF),Y		  ; 31 BF | Logical AND with accumulator ((zero page),Y)
	AND $41BB,Y		  ; 39 BB 41 | Logical AND with accumulator (absolute,Y)
	LDX $C641,Y		  ; BE 41 C6 | Load from absolute,Y into X register
	DEC $43			  ; C6 43 | Decrement (zero page)
	DEX				  ; CA | Decrement X register
	EOR ($C6,X)		  ; 41 C6 | Exclusive OR with accumulator ((zero page,X))
	AND $2FD4,Y		  ; 39 D4 2F | Logical AND with accumulator (absolute,Y)
	PHX				  ; DA | Push X register to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $36D9			; 2C D9 36 | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_307
; Address: $D3DBAA
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_307:
	BNE $3D			  ; D0 3D | Branch if not equal
	BNE $43			  ; D0 43 | Branch if not equal
	CMP $CB41			; CD 41 CB | Compare accumulator (absolute)
	EOR ($D0,X)		  ; 41 D0 | Exclusive OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	JMP $4BD5			; 4C D5 4B | Jump to address
	ROL $31D0,X		  ; 3E D0 31 | Rotate left (absolute,X)
	CPY #$26			 ; C0 26 | Compare Y register (immediate)
	LDA $B428,Y		  ; B9 28 B4 | Read graphics status
	AND #$B4			 ; 29 B4 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	BIT $1AB6			; 2C B6 1A | Test bits in accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	CMP ($1D,X)		  ; C1 1D | Compare accumulator ((zero page,X))
	LDA $BE1C,X		  ; BD 1C BE | Read graphics status
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	DEC $CB1B			; CE 1B CB | Decrement (absolute)
	INC				  ; 1A | Increment accumulator
	CPY $19			  ; C4 19 | Compare Y register (zero page)
	LDA $2AAB26		  ; AF 26 AB 2A | Read graphics status
	LDA $36A630		  ; AF 30 A6 36 | Read graphics status
	LDY #$2D			 ; A0 2D | Load immediate value into Y register
	STZ $9E2C,X		  ; 9E 2C 9E | Store zero to absolute,X
	AND ($A2),Y		  ; 31 A2 | Logical AND with accumulator ((zero page),Y)
	AND $3FA0,Y		  ; 39 A0 3F | Logical AND with accumulator (absolute,Y)
	LDX $3E			  ; A6 3E | Load from zero page into X register
	LDA #$41			 ; A9 41 | Read graphics status
	LDA #$41			 ; A9 41 | Read graphics status
	LDX $40			  ; A6 40 | Load from zero page into X register
	TAX				  ; AA | Transfer accumulator to X register
	LDX $B037			; AE 37 B0 | Load from absolute address into X register
	DEC				  ; 3A | Decrement accumulator
	LDA				  ; BF 50 C0 4C | Read graphics status
	CPY #$4A			 ; C0 4A | Compare Y register (immediate)
	LDA				  ; BF 4C BC 3C | Read graphics status
	TSX				  ; BA | Transfer stack pointer to X register
	TSX				  ; BA | Transfer stack pointer to X register
	DEC				  ; 3A | Decrement accumulator
	LDX $AB42			; AE 42 AB | Load from absolute address into X register
	EOR ($A9,X)		  ; 41 A9 | Exclusive OR with accumulator ((zero page,X))
	EOR ($AD,X)		  ; 41 AD | Exclusive OR with accumulator ((zero page,X))
	LDY $AA48			; AC 48 AA | Load from absolute address into Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	PLB				  ; AB | Pull data bank register from stack
	EOR ($B4),Y		  ; 51 B4 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($BB),Y		  ; 51 BB | Exclusive OR with accumulator ((zero page),Y)
	LSR $4FC0			; 4E C0 4F | Logical shift right (absolute)
	LDA				  ; BF 51 BA 5B | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_308
; Address: $D3DC34
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_308:
	TSX				  ; BA | Transfer stack pointer to X register
	EOR $5CC4,Y		  ; 59 C4 5C | Exclusive OR with accumulator (absolute,Y)
	DEC $5B			  ; C6 5B | Decrement (zero page)
	DEC $55			  ; C6 55 | Decrement (zero page)
	CPY #$55			 ; C0 55 | Compare Y register (immediate)
	CPY #$55			 ; C0 55 | Compare Y register (immediate)
	LDX $BE53,Y		  ; BE 53 BE | Load from absolute,Y into X register
	BVC $BA			  ; 50 BA | Branch if overflow clear
	EOR $4ABB			; 4D BB 4A | Exclusive OR with accumulator (absolute)
	LDA $AD46,Y		  ; B9 46 AD | Read graphics status
	WDM #$AE			 ; 42 AE | Reserved instruction
	WDM #$AA			 ; 42 AA | Reserved instruction
	EOR ($A6,X)		  ; 41 A6 | Exclusive OR with accumulator ((zero page,X))
	EOR ($A6,X)		  ; 41 A6 | Exclusive OR with accumulator ((zero page,X))
	LDX $4A			  ; A6 4A | Load from zero page into X register
	LDA #$4D			 ; A9 4D | Read graphics status
	BCS $4D			  ; B0 4D | Branch if carry set
	BCS $48			  ; B0 48 | Branch if carry set
	LDA ($49),Y		  ; B1 49 | Read graphics status
	LDA ($4C),Y		  ; B1 4C | Read graphics status
	BCS $52			  ; B0 52 | Branch if carry set
	BCS $57			  ; B0 57 | Branch if carry set
	CLV				  ; B8 | Clear overflow flag
	CLI				  ; 58 | Clear interrupt disable flag
	BCS $5C			  ; B0 5C | Branch if carry set
	BCS $5B			  ; B0 5B | Branch if carry set
	LDA ($5C),Y		  ; B1 5C | Read graphics status
	ORA $19C1,X		  ; 1D C1 19 | Logical OR with accumulator (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_309
; Address: $D3DC83
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_309:
	JSR $21BD			; 20 BD 21 | PPU graphics register access
	CPY $24			  ; C4 24 | Compare Y register (zero page)
	CPY $2A			  ; C4 2A | Compare Y register (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$CE			 ; 29 CE | Logical AND with accumulator (immediate)
	AND #$CF			 ; 29 CF | Logical AND with accumulator (immediate)
	AND ($CB),Y		  ; 31 CB | Logical AND with accumulator ((zero page),Y)
	AND $39CE,Y		  ; 39 CE 39 | Logical AND with accumulator (absolute,Y)
	PHX				  ; DA | Push X register to stack
	AND $15D6,Y		  ; 39 D6 15 | Logical AND with accumulator (absolute,Y)
	INY				  ; C8 | Increment Y register
	ASL $0ECC			; 0E CC 0E | Arithmetic shift left (absolute)
	BPL $D5			  ; 10 D5 | Branch if positive
	ORA $19CB,Y		  ; 19 CB 19 | Logical OR with accumulator (absolute,Y)
	CPY $1C			  ; C4 1C | Compare Y register (zero page)
	LDX $C01E,Y		  ; BE 1E C0 | Load from absolute,Y into X register
	ORA $13C0,Y		  ; 19 C0 13 | Logical OR with accumulator (absolute,Y)
	LDA $B612,Y		  ; B9 12 B6 | Read graphics status
	ORA $29C3,Y		  ; 19 C3 29 | Logical OR with accumulator (absolute,Y)
	BNE $30			  ; D0 30 | Branch if not equal
	CMP $D835,Y		  ; D9 35 D8 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_30A
; Address: $D3DCC6
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_30A:
	CMP $D533,Y		  ; D9 33 D5 | Compare accumulator (absolute,Y)
	ROL $29E7			; 2E E7 29 | Rotate left (absolute)
	PLP				  ; 28 | Pull processor status from stack
	SBC #$2C			 ; E9 2C | Subtract with carry (immediate)
	CPX $2B			  ; E4 2B | Compare X register (zero page)
	SBC $21			  ; E5 21 | PPU graphics register access
	SBC $ED1E			; ED 1E ED | Subtract with carry (absolute)
	SBC #$1E			 ; E9 1E | Subtract with carry (immediate)
	INC $25			  ; E6 25 | Increment (zero page)
	INX				  ; E8 | Increment X register
	SEP #$3A			 ; E2 3A | Set processor status bits
	PHX				  ; DA | Push X register to stack
	ROL $3ADB,X		  ; 3E DB 3A | Rotate left (absolute,X)
	CMP ($49),Y		  ; D1 49 | Compare accumulator ((zero page),Y)
	BNE $49			  ; D0 49 | Branch if not equal
	INY				  ; C8 | Increment Y register
	REP #$40			 ; C2 40 | Reset processor status bits
	RTI				  ; 40 | Return from interrupt
	CPY #$43			 ; C0 43 | Compare Y register (immediate)
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CMP ($34,X)		  ; C1 34 | Compare accumulator ((zero page,X))
	LDX $C02F,Y		  ; BE 2F C0 | Load from absolute,Y into X register
	DEC $34			  ; C6 34 | Decrement (zero page)
	DEC $32			  ; C6 32 | Decrement (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BNE $39			  ; D0 39 | Branch if not equal
	CMP $3A			  ; C5 3A | Compare accumulator (zero page)
	AND $3FC5,X		  ; 3D C5 3F | Logical AND with accumulator (absolute,X)
	LSR $50CF			; 4E CF 50 | Logical shift right (absolute)
	BNE $4C			  ; D0 4C | Branch if not equal
	BNE $4D			  ; D0 4D | Branch if not equal
	DEC $C94F			; CE 4F C9 | Decrement (absolute)
	LSR $45C7			; 4E C7 45 | Logical shift right (absolute)
	CPY #$3E			 ; C0 3E | Compare Y register (immediate)
	CPY #$39			 ; C0 39 | Compare Y register (immediate)
	DEC				  ; 3A | Decrement accumulator
	REP #$3F			 ; C2 3F | Reset processor status bits
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CLV				  ; B8 | Clear overflow flag
	TSX				  ; BA | Transfer stack pointer to X register
	AND $39BC,Y		  ; 39 BC 39 | Logical AND with accumulator (absolute,Y)
	LDY $BC3E,X		  ; BC 3E BC | Load from absolute,X into Y register
	ROL $3BBB,X		  ; 3E BB 3B | Rotate left (absolute,X)
	TSX				  ; BA | Transfer stack pointer to X register
	LDX $C13F,Y		  ; BE 3F C1 | Load from absolute,Y into X register
	ROL $40C4,X		  ; 3E C4 40 | Rotate left (absolute,X)
	JMP $4BCB			; 4C CB 4B | Jump to address
	BNE $53			  ; D0 53 | Branch if not equal
	BNE $53			  ; D0 53 | Branch if not equal
	CMP $C750			; CD 50 C7 | Compare accumulator (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_30B
; Address: $D3DD5D
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_30B:
	EOR #$C4			 ; 49 C4 | Exclusive OR with accumulator (immediate)
	EOR #$C4			 ; 49 C4 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	CMP #$48			 ; C9 48 | Compare accumulator (immediate)
	INY				  ; C8 | Increment Y register
	EOR #$C5			 ; 49 C5 | Exclusive OR with accumulator (immediate)
	EOR #$BF			 ; 49 BF | Exclusive OR with accumulator (immediate)
	LSR $BA			  ; 46 BA | Logical shift right (zero page)
	EOR ($BB,X)		  ; 41 BB | Exclusive OR with accumulator ((zero page,X))
	LDA $BC44,X		  ; BD 44 BC | Read graphics status
	EOR #$B9			 ; 49 B9 | Exclusive OR with accumulator (immediate)
	EOR #$B6			 ; 49 B6 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	WDM #$9C			 ; 42 9C | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	LDX $3C			  ; A6 3C | Load from zero page into X register
	LDY #$44			 ; A0 44 | Load immediate value into Y register
	EOR $95			  ; 45 95 | Exclusive OR with accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	STA $9842,Y		  ; 99 42 98 | Update graphics data
	WDM #$93			 ; 42 93 | Reserved instruction
	STX $8E50			; 8E 50 8E | Store X register to absolute address
	EOR ($8C),Y		  ; 51 8C | Exclusive OR with accumulator ((zero page),Y)
	BVC $8C			  ; 50 8C | Branch if overflow clear
	LSR $5991			; 4E 91 59 | Logical shift right (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $A8			  ; 66 A8 | Rotate right (zero page)
	LDX $AD74			; AE 74 AD | Load from absolute address into X register
	LDA $69AE70		  ; AF 70 AE 69 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC #$A3			 ; 69 A3 | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_30C
; Address: $D3DDAC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_30C:
	LDA $65			  ; A5 65 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LSR $54A8,X		  ; 5E A8 54 | Logical shift right (absolute,X)
	LDA ($52),Y		  ; B1 52 | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	EOR $57B3,X		  ; 5D B3 57 | Exclusive OR with accumulator (absolute,X)
	ADC ($AC,X)		  ; 61 AC | Add with carry ((zero page,X))
	ADC #$9E			 ; 69 9E | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_30D
; Address: $D3DDC0
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_30D:
	LDX #$6B			 ; A2 6B | Load immediate value into X register
	STZ $9E69,X		  ; 9E 69 9E | Store zero to absolute,X
	ADC #$96			 ; 69 96 | Add with carry (immediate)
	ADC ($93,X)		  ; 61 93 | Add with carry ((zero page,X))
	EOR $5997,Y		  ; 59 97 59 | Exclusive OR with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	STY $8C51			; 8C 51 8C | Store Y register to absolute address
	BVC $85			  ; 50 85 | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_30E
; Address: $D3DDD7
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_30E:
	JMP $4983			; 4C 83 49 | Jump to address
	EOR $6089			; 4D 89 60 | Exclusive OR with accumulator (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ROR $76			  ; 66 76 | Rotate right (zero page)
	ADC ($79,X)		  ; 61 79 | Add with carry ((zero page,X))
	LSR $5F79,X		  ; 5E 79 5F | Logical shift right (absolute,X)
	EOR $5170,Y		  ; 59 70 51 | Exclusive OR with accumulator (absolute,Y)
	JMP $4D6E			; 4C 6E 4D | Jump to address
	ROR $7056			; 6E 56 70 | Rotate right (absolute)
	BVC $76			  ; 50 76 | Branch if overflow clear
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $7B			  ; 46 7B | Logical shift right (zero page)
	STY $39			  ; 84 39 | Store Y register to zero page
	EOR $4989			; 4D 89 49 | Exclusive OR with accumulator (absolute)
	JMP $5083			; 4C 83 50 | Jump to address
	STA $51			  ; 85 51 | Update graphics data
	STY $8C54			; 8C 54 8C | Store Y register to absolute address
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	EOR $5996,Y		  ; 59 96 59 | Exclusive OR with accumulator (absolute,Y)
	ADC ($93,X)		  ; 61 93 | Add with carry ((zero page,X))
	ADC #$96			 ; 69 96 | Add with carry (immediate)
	ADC #$9E			 ; 69 9E | Add with carry (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_30F
; Address: $D3DE18
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_30F:
	STZ $A26B,X		  ; 9E 6B A2 | Store zero to absolute,X
	ADC #$9E			 ; 69 9E | Add with carry (immediate)
	ADC ($AC,X)		  ; 61 AC | Add with carry ((zero page,X))
	EOR $52B3,X		  ; 5D B3 52 | Exclusive OR with accumulator (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	LDA ($5E),Y		  ; B1 5E | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC $A8			  ; 65 A8 | Add with carry (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_310
; Address: $D3DE2E
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_310:
	LDA $69			  ; A5 69 | Read graphics status
	ADC #$A8			 ; 69 A8 | Add with carry (immediate)
	BVS $AE			  ; 70 AE | Branch if overflow set
	LDA $73AD74		  ; AF 74 AD 73 | Read graphics status
	LDX $A866			; AE 66 A8 | Load from absolute address into X register
	EOR $4E98,Y		  ; 59 98 4E | Exclusive OR with accumulator (absolute,Y)
	STA ($50),Y		  ; 91 50 | Update graphics data
	STY $8C51			; 8C 51 8C | Store Y register to absolute address
	BVC $8E			  ; 50 8E | Branch if overflow clear
	STX $9342			; 8E 42 93 | Store X register to absolute address
	WDM #$98			 ; 42 98 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	STA $9545,Y		  ; 99 45 95 | Update graphics data
	LDY #$3C			 ; A0 3C | Load immediate value into Y register
	RTI				  ; 40 | Return from interrupt
	LDX $43			  ; A6 43 | Load from zero page into X register
	WDM #$9C			 ; 42 9C | Reserved instruction

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_311
; Address: $D3DE5D
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_311:
	EOR ($8B,X)		  ; 41 8B | Exclusive OR with accumulator ((zero page,X))
	STY $874F			; 8C 4F 87 | Store Y register to absolute address
	LSR $5283			; 4E 83 52 | Logical shift right (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	ROR $785E,X		  ; 7E 5E 78 | Rotate right (absolute,X)
	EOR $617A,Y		  ; 59 7A 61 | Exclusive OR with accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ROR $8166,X		  ; 7E 66 81 | Rotate right (absolute,X)
	ADC #$81			 ; 69 81 | Add with carry (immediate)
	ROR $687E			; 6E 7E 68 | Rotate right (absolute)
	EOR $81			  ; 45 81 | Exclusive OR with accumulator (zero page)
	EOR ($7A,X)		  ; 41 7A | Exclusive OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	ADC $8449,X		  ; 7D 49 84 | Add with carry (absolute,X)
	JMP $5284			; 4C 84 52 | Jump to address
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	EOR ($8E),Y		  ; 51 8E | Exclusive OR with accumulator ((zero page),Y)
	EOR ($8F),Y		  ; 51 8F | Exclusive OR with accumulator ((zero page),Y)
	EOR $618B,Y		  ; 59 8B 61 | Exclusive OR with accumulator (absolute,Y)
	STX $9661			; 8E 61 96 | Store X register to absolute address
	TXS				  ; 9A | Transfer X register to stack pointer
	ADC ($96,X)		  ; 61 96 | Add with carry ((zero page,X))
	EOR $4FA4,Y		  ; 59 A4 4F | Exclusive OR with accumulator (absolute,Y)
	TAX				  ; AA | Transfer accumulator to X register
	PLB				  ; AB | Pull data bank register from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	PLB				  ; AB | Pull data bank register from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $56A9			; 4C A9 56 | Jump to address
	LDY #$5D			 ; A0 5D | Load immediate value into Y register
	LDY #$63			 ; A0 63 | Load immediate value into Y register
	STA $9B61,X		  ; 9D 61 9B | Update graphics data
	ADC ($A0,X)		  ; 61 A0 | Add with carry ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LDX $6B			  ; A6 6B | Load from zero page into X register
	JMP ($6BA5)		  ; 6C A5 6B | Jump to address (absolute indirect)
	LDX $5E			  ; A6 5E | Load from zero page into X register
	LDY #$51			 ; A0 51 | Load immediate value into Y register
	BCC $46			  ; 90 46 | Branch if carry clear
	BIT #$48			 ; 89 48 | Test bits in accumulator (immediate)
	STY $49			  ; 84 49 | Store Y register to zero page
	STY $48			  ; 84 48 | Store Y register to zero page
	STX $4C			  ; 86 4C | Store X register to zero page
	STX $3A			  ; 86 3A | Store X register to zero page
	PHB				  ; 8B | Push data bank register to stack
	DEC				  ; 3A | Decrement accumulator
	BCC $38			  ; 90 38 | Branch if carry clear
	STA ($3D),Y		  ; 91 3D | Update graphics data
	STA $8E3C			; 8D 3C 8E | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_312
; Address: $D3DED4
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_312:
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	STZ $9B3B,X		  ; 9E 3B 9B | Store zero to absolute,X
	DEC				  ; 3A | Decrement accumulator
	AND $3F83,Y		  ; 39 83 3F | Logical AND with accumulator (absolute,Y)
	STY $47			  ; 84 47 | Store Y register to zero page
	LSR $7B			  ; 46 7B | Logical shift right (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	BVC $76			  ; 50 76 | Branch if overflow clear
	BVS $4D			  ; 70 4D | Branch if overflow set
	ROR $6E4C			; 6E 4C 6E | Rotate right (absolute)
	EOR ($72),Y		  ; 51 72 | Exclusive OR with accumulator ((zero page),Y)
	EOR $5F70,Y		  ; 59 70 5F | Exclusive OR with accumulator (absolute,Y)
	LSR $6179,X		  ; 5E 79 61 | Logical shift right (absolute,X)
	ADC $7666,Y		  ; 79 66 76 | Add with carry (absolute,Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_313
; Address: $D3DEFC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_313:
	PLY				  ; 7A | Pull Y register from stack
	JMP $80577E		  ; 5C 7E 57 80 | Jump to address long
	STX $5C			  ; 86 5C | Store X register to zero page
	STX $5A			  ; 86 5A | Store X register to zero page
	PHB				  ; 8B | Push data bank register to stack
	STZ $8B			  ; 64 8B | Store zero to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_314
; Address: $D3DF0A
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_314:
	STA $6C9070		  ; 8F 70 90 6C | Update graphics data
	BCC $6A			  ; 90 6A | Branch if carry clear
	STA $5C8C6C		  ; 8F 6C 8C 5C | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	STA $5A			  ; 85 5A | Update graphics data
	STX $5F			  ; 86 5F | Store X register to zero page
	ROR $7B62,X		  ; 7E 62 7B | Rotate right (absolute,X)
	ADC ($79,X)		  ; 61 79 | Add with carry ((zero page,X))
	ADC ($7D,X)		  ; 61 7D | Add with carry ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	ROR				  ; 6A | Rotate right (accumulator)
	ADC ($84),Y		  ; 71 84 | Add with carry ((zero page),Y)
	ADC ($8B),Y		  ; 71 8B | Add with carry ((zero page),Y)
	ROR $6F90			; 6E 90 6F | Rotate right (absolute)
	STA $7B8A71		  ; 8F 71 8A 7B | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ADC $7C94,Y		  ; 79 94 7C | Add with carry (absolute,Y)
	BCC $75			  ; 90 75 | Branch if carry clear
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	STX $8E73			; 8E 73 8E | Store X register to absolute address
	BVS $8A			  ; 70 8A | Branch if overflow set
	ADC $6A8B			; 6D 8B 6A | Add with carry (absolute)
	BIT #$66			 ; 89 66 | Test bits in accumulator (immediate)
	ADC $7E62,X		  ; 7D 62 7E | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_315
; Address: $D3DF54
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_315:
	PLY				  ; 7A | Pull Y register from stack
	ADC ($76,X)		  ; 61 76 | Add with carry ((zero page,X))
	ADC ($76,X)		  ; 61 76 | Add with carry ((zero page,X))
	STZ $76			  ; 64 76 | Store zero to zero page
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $806D,Y		  ; 79 6D 80 | Add with carry (absolute,Y)
	ADC $6880			; 6D 80 68 | Add with carry (absolute)
	STA ($69,X)		  ; 81 69 | Update graphics data
	STA ($6C,X)		  ; 81 6C | Update graphics data
	ROR $8072,X		  ; 7E 72 80 | Rotate right (absolute,X)
	STX $76			  ; 86 76 | Store X register to zero page
	DEY				  ; 88 | Decrement Y register
	STX $75			  ; 86 75 | Store X register to zero page
	STA $78			  ; 85 78 | Update graphics data
	BRA $7C			  ; 80 7C | Branch always
	BRA $7B			  ; 80 7B | Branch always
	STA ($7C,X)		  ; 81 7C | Update graphics data
	JMP ($697F)		  ; 6C 7F 69 | Jump to address (absolute indirect)
	STZ $82			  ; 64 82 | Store zero to zero page
	STY $64			  ; 84 64 | Store Y register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	ADC ($82,X)		  ; 61 82 | Add with carry ((zero page,X))
	ADC ($82,X)		  ; 61 82 | Add with carry ((zero page,X))
	ADC $7D			  ; 65 7D | Add with carry (zero page)
	ADC $7A66,X		  ; 7D 66 7A | Add with carry (absolute,X)
	ROR $77			  ; 66 77 | Rotate right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_316
; Address: $D3DF97
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_316:
	ADC $657B			; 6D 7B 65 | Add with carry (absolute)
	ADC $7565,X		  ; 7D 65 75 | Add with carry (absolute,X)
	ADC #$78			 ; 69 78 | Add with carry (immediate)
	ADC #$7A			 ; 69 7A | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $7279			; 6E 79 72 | Rotate right (absolute)
	ROR $6D7B			; 6E 7B 6D | Rotate right (absolute)
	ROR $826F,X		  ; 7E 6F 82 | Rotate right (absolute,X)
	ADC $8378,X		  ; 7D 78 83 | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	STA $76			  ; 85 76 | Update graphics data
	BRA $73			  ; 80 73 | Branch always
	BVS $82			  ; 70 82 | Branch if overflow set
	BVS $7D			  ; 70 7D | Branch if overflow set
	ROR $6F80			; 6E 80 6F | Rotate right (absolute)
	STA ($6E,X)		  ; 81 6E | Update graphics data
	STA $6D			  ; 85 6D | Update graphics data
	STX $6A			  ; 86 6A | Store X register to zero page
	ROR $6986			; 6E 86 69 | Rotate right (absolute)
	STY $69			  ; 84 69 | Store Y register to zero page
	ADC #$88			 ; 69 88 | Add with carry (immediate)
	ROR				  ; 6A | Rotate right (accumulator)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_317
; Address: $D3DFDD
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_317:
	BVS $80			  ; 70 80 | Branch if overflow set
	STA ($70,X)		  ; 81 70 | Update graphics data
	STA ($72,X)		  ; 81 72 | Update graphics data
	BRA $72			  ; 80 72 | Branch always
	BRA $71			  ; 80 71 | Branch always
	BRA $65			  ; 80 65 | Branch always
	ADC $80			  ; 65 80 | Add with carry (zero page)
	ADC $7B			  ; 65 7B | Add with carry (zero page)
	ROR $7B			  ; 66 7B | Rotate right (zero page)
	ROR $7E63,X		  ; 7E 63 7E | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_318
; Address: $D3DFFA
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_318:
	PLY				  ; 7A | Pull Y register from stack
	EOR $5A7B,X		  ; 5D 7B 5A | Exclusive OR with accumulator (absolute,X)
	ADC $6D56,Y		  ; 79 56 6D | Add with carry (absolute,Y)
	ROR $6A52			; 6E 52 6A | Rotate right (absolute)
	EOR ($66),Y		  ; 51 66 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($66),Y		  ; 51 66 | Exclusive OR with accumulator ((zero page),Y)
	ROR $5A			  ; 66 5A | Rotate right (zero page)
	ADC #$5D			 ; 69 5D | Add with carry (immediate)
	BVS $5D			  ; 70 5D | Branch if overflow set
	BVS $58			  ; 70 58 | Branch if overflow set
	ADC ($59),Y		  ; 71 59 | Add with carry ((zero page),Y)
	ADC ($5C),Y		  ; 71 5C | Add with carry ((zero page),Y)
	ROR $7062			; 6E 62 70 | Rotate right (absolute)
	ROR $76			  ; 66 76 | Rotate right (zero page)
	ROR $78			  ; 66 78 | Rotate right (zero page)
	STZ $76			  ; 64 76 | Store zero to zero page
	ADC $75			  ; 65 75 | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	BVS $6C			  ; 70 6C | Branch if overflow set
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_319
; Address: $D3E028
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_319:
	BVS $6B			  ; 70 6B | Branch if overflow set
	ADC ($6C),Y		  ; 71 6C | Add with carry ((zero page),Y)
	ROR $79			  ; 66 79 | Rotate right (zero page)
	ROR $79			  ; 66 79 | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $77			  ; 65 77 | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $7B			  ; 66 7B | Rotate right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_31A
; Address: $D3E03E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_31A:
	ADC $7D6B,X		  ; 7D 6B 7D | Add with carry (absolute,X)
	ADC #$7E			 ; 69 7E | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $7E6B,X		  ; 7E 6B 7E | Rotate right (absolute,X)
	ADC $6C7A			; 6D 7A 6C | Add with carry (absolute)
	ADC $7D6E,X		  ; 7D 6E 7D | Add with carry (absolute,X)
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	BRA $72			  ; 80 72 | Branch always
	BRA $73			  ; 80 73 | Branch always
	STA ($73,X)		  ; 81 73 | Update graphics data

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_31B
; Address: $D3E057
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_31B:
	BVS $7C			  ; 70 7C | Branch if overflow set
	STA ($70,X)		  ; 81 70 | Update graphics data
	BRA $73			  ; 80 73 | Branch always
	STY $76			  ; 84 76 | Store Y register to zero page
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	DEY				  ; 88 | Decrement Y register
	ADC $7C88,Y		  ; 79 88 7C | Add with carry (absolute,Y)
	STY $8C74			; 8C 74 8C | Store Y register to absolute address
	STY $7A			  ; 84 7A | Store Y register to zero page
	STX $7A			  ; 86 7A | Store X register to zero page
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	STY $7873			; 8C 73 78 | Store Y register to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	ADC ($77),Y		  ; 71 77 | Add with carry ((zero page),Y)
	ADC $7C75,Y		  ; 79 75 7C | Add with carry (absolute,Y)
	ADC $7E77,X		  ; 7D 77 7E | Add with carry (absolute,X)
	ADC $7D77,X		  ; 7D 77 7D | Add with carry (absolute,X)
	BRA $72			  ; 80 72 | Branch always
	BRA $72			  ; 80 72 | Branch always
	BRA $74			  ; 80 74 | Branch always
	BRA $76			  ; 80 76 | Branch always
	ADC $7F75,X		  ; 7D 75 7F | Add with carry (absolute,X)
	ROR $7E77,X		  ; 7E 77 7E | Rotate right (absolute,X)
	ROR $7E77,X		  ; 7E 77 7E | Rotate right (absolute,X)
	ADC $7F79,X		  ; 7D 79 7F | Add with carry (absolute,X)
	ADC $797F,Y		  ; 79 7F 79 | Add with carry (absolute,Y)
	ROR $7E79,X		  ; 7E 79 7E | Rotate right (absolute,X)
	ADC $767E,Y		  ; 79 7E 76 | Add with carry (absolute,Y)
	ADC $7B77,X		  ; 7D 77 7B | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	ROR $7F76,X		  ; 7E 76 7F | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7C72,X		  ; 7D 72 7C | Add with carry (absolute,X)
	ROR $7E73,X		  ; 7E 73 7E | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7A75,Y		  ; 79 75 7A | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7B78,Y		  ; 79 78 7B | Add with carry (absolute,Y)
	ADC $7977,Y		  ; 79 77 79 | Add with carry (absolute,Y)
	ADC $7A76,Y		  ; 79 76 7A | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_31C
; Address: $D3E109
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_31C:
	ADC $797C,Y		  ; 79 7C 79 | Add with carry (absolute,Y)
	ADC $797C,Y		  ; 79 7C 79 | Add with carry (absolute,Y)
	ADC $777C,Y		  ; 79 7C 77 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	ADC $7977,Y		  ; 79 77 79 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	PLY				  ; 7A | Pull Y register from stack
	ADC $797C,Y		  ; 79 7C 79 | Add with carry (absolute,Y)
	ROR $7D7A,X		  ; 7E 7A 7D | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7D7B,X		  ; 7D 7B 7D | Add with carry (absolute,X)
	ADC $7D7B,X		  ; 7D 7B 7D | Add with carry (absolute,X)
	ADC $7C7A,X		  ; 7D 7A 7C | Add with carry (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	ADC $7A7B,Y		  ; 79 7B 7A | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	ADC $797C,Y		  ; 79 7C 79 | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7D79,X		  ; 7D 79 7D | Add with carry (absolute,X)
	ADC $777C,Y		  ; 79 7C 77 | Add with carry (absolute,Y)
	ADC $7976,Y		  ; 79 76 79 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7978,Y		  ; 79 78 79 | Add with carry (absolute,Y)
	ADC $797A,Y		  ; 79 7A 79 | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	ADC $797A,Y		  ; 79 7A 79 | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7A7A,Y		  ; 79 7A 7A | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	ADC $787A,Y		  ; 79 7A 78 | Add with carry (absolute,Y)
	ADC $7A79,Y		  ; 79 79 7A | Add with carry (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_31D
; Address: $D3E18D
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_31D:
	PHP				  ; 08 | Push processor status to stack
	BPL $00			  ; 10 00 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $000C			; CC 0C 00 | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $020C			; CC 0C 02 | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $040C			; CC 0C 04 | Compare Y register (absolute)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	CPY $060C			; CC 0C 06 | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $080C			; CC 0C 08 | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $0A0C			; CC 0C 0A | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $0C0C			; CC 0C 0C | Compare Y register (absolute)
	ASL $CC0A			; 0E 0A CC | Arithmetic shift left (absolute)
	ASL $0A10			; 0E 10 0A | Arithmetic shift left (absolute)
	CPY $100C			; CC 0C 10 | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $120C			; CC 0C 12 | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $140C			; CC 0C 14 | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $160C			; CC 0C 16 | Compare Y register (absolute)
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $180C			; CC 0C 18 | Compare Y register (absolute)
	INC				  ; 1A | Increment accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $1A0C			; CC 0C 1A | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $1C0C			; CC 0C 1C | Compare Y register (absolute)
	ASL $0009,X		  ; 1E 09 00 | Arithmetic shift left (absolute,X)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $000C			; CC 0C 00 | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $020C			; CC 0C 02 | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $040C			; CC 0C 04 | Compare Y register (absolute)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	CPY $060C			; CC 0C 06 | Compare Y register (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $080C			; CC 0C 08 | Compare Y register (absolute)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_31E
; Address: $D3E200
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_31E:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $0A0C			; CC 0C 0A | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $0C0C			; CC 0C 0C | Compare Y register (absolute)
	ASL $CC0A			; 0E 0A CC | Arithmetic shift left (absolute)
	ASL $0A10			; 0E 10 0A | Arithmetic shift left (absolute)
	CPY $100C			; CC 0C 10 | Compare Y register (absolute)
	BPL $00			  ; 10 00 | Branch if positive
	DEC				  ; 3A | Decrement accumulator
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	ASL $A20B			; 0E 0B A2 | Arithmetic shift left (absolute)
	ASL $0B10			; 0E 10 0B | Arithmetic shift left (absolute)
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	BPL $12			  ; 10 12 | Branch if positive
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	CLC				  ; 18 | Clear carry flag
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	INC				  ; 1A | Increment accumulator
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	ASL $A20B,X		  ; 1E 0B A2 | Arithmetic shift left (absolute,X)
	ASL $F400,X		  ; 1E 00 F4 | Arithmetic shift left (absolute,X)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	STA $33F0			; 8D F0 33 | Update graphics data
	STX $33F2			; 8E F2 33 | Store X register to absolute address
	STY $33F4			; 8C F4 33 | Store Y register to absolute address
	LDA #$42			 ; A9 42 | Hardware register operation
	STA $33EA			; 8D EA 33 | Update graphics data
	STA $33EC			; 8D EC 33 | Update graphics data
	LDA $B489			; AD 89 B4 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_322
; Address: $D3E292
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_322:
	LDA $33EA			; AD EA 33 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $33EA			; 8D EA 33 | Update graphics data
	STA $33EC			; 8D EC 33 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_32A
; Address: $D3E2C6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_32A:
	JSL $C08B6B		  ; 22 6B 8B C0 | Jump to subroutine long
	BRA $FE			  ; 80 FE | Branch always
	SEC				  ; 38 | Set carry flag
	SBC #$58			 ; E9 58 | Subtract with carry (immediate)
	SBC $A9AA			; ED AA A9 | Subtract with carry (absolute)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_32B
; Address: $D3E2D4
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_32B:
	JSL $C9E347		  ; 22 47 E3 C9 | Jump to subroutine long
	LDA				  ; BF 58 ED C4 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_32C
; Address: $D3E2E1
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_32C:
	JSL $C9E347		  ; 22 47 E3 C9 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	JMP $E2D8			; 4C D8 E2 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_342
; Address: $D3E347
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_342:
	PHY				  ; 5A | Push Y register to stack
	CLC				  ; 18 | Clear carry flag
	ADC $33EE			; 6D EE 33 | Add with carry (absolute)
	LDY $33EC			; AC EC 33 | Load from absolute address into Y register
	STA $2BF2,Y		  ; 99 F2 2B | Update graphics data
	INC $33EC			; EE EC 33 | Increment (absolute)
	INC $33EC			; EE EC 33 | Increment (absolute)
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_343
; Address: $D3E35A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_343:
	PHY				  ; 5A | Push Y register to stack
	CLC				  ; 18 | Clear carry flag
	ADC $33EE			; 6D EE 33 | Add with carry (absolute)
	LDY $33EC			; AC EC 33 | Load from absolute address into Y register
	STA $2BF0,Y		  ; 99 F0 2B | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_345
; Address: $D3E36A
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_345:
	JSL $C9E347		  ; 22 47 E3 C9 | Jump to subroutine long
	LDX #$00			 ; A2 00 | Load immediate value into X register
	BVS $29			  ; 70 29 | Branch if overflow set
	BNE $13			  ; D0 13 | Branch if not equal
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	LDA #$87			 ; A9 87 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_347
; Address: $D3E387
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_347:
	BVS $29			  ; 70 29 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	ADC #$87			 ; 69 87 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_348
; Address: $D3E38F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_348:
	JSL $C9E347		  ; 22 47 E3 C9 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $ED			  ; 90 ED | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_349
; Address: $D3E39A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_349:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$08			 ; A9 08 | Read graphics status
	SEC				  ; 38 | Set carry flag
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_34A
; Address: $D3E3A6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_34A:
	JSL $C9E347		  ; 22 47 E3 C9 | Jump to subroutine long
	BVS $29			  ; 70 29 | Branch if overflow set
	BNE $1A			  ; D0 1A | Branch if not equal
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_34B
; Address: $D3E3B4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_34B:
	JSL $C9E347		  ; 22 47 E3 C9 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	LDA #$87			 ; A9 87 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_34D
; Address: $D3E3C7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_34D:
	BVS $29			  ; 70 29 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	ADC #$87			 ; 69 87 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_34E
; Address: $D3E3CF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_34E:
	JSL $C9E347		  ; 22 47 E3 C9 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $ED			  ; 90 ED | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_34F
; Address: $D3E3DA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_34F:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$08			 ; A9 08 | Read graphics status
	SEC				  ; 38 | Set carry flag
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_350
; Address: $D3E3E6
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_350:
	JSL $C9E347		  ; 22 47 E3 C9 | Jump to subroutine long
	BVS $29			  ; 70 29 | Branch if overflow set
	BNE $1A			  ; D0 1A | Branch if not equal
	LDA #$87			 ; A9 87 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_351
; Address: $D3E3F4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_351:
	JSL $C9E347		  ; 22 47 E3 C9 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $EC			  ; 90 EC | Branch if carry clear
	LDA #$87			 ; A9 87 | Read graphics status

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_353
; Address: $D3E407
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_353:
	BVS $29			  ; 70 29 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	ADC #$87			 ; 69 87 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_354
; Address: $D3E40F
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_354:
	JSL $C9E347		  ; 22 47 E3 C9 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $ED			  ; 90 ED | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank26_GraphicsFunction_356
; Address: $D3E41E
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank26_GraphicsFunction_356:
	JSL $C0240A		  ; 22 0A 24 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	LDA $7F70			; AD 70 7F | Read graphics status
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BEQ $01			  ; F0 01 | Branch if equal
	SEC				  ; 38 | Set carry flag
	PLA				  ; 68 | Pull accumulator from stack
	STA $7F70			; 8D 70 7F | Update graphics data
	RTL				  ; 6B | Return from subroutine long
