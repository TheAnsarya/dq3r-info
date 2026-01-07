;==============================================================================
; Dragon Quest III - Bank $1A
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $CD0000-$CD7FFF
; Instructions: 9153
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_1A"

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_001
; Address: $CD8003
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_001:
	JSR $E222			; 20 22 E2 | Jump to subroutine
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $2004			; 8D 04 20 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_002
; Address: $CD8016
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_002:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_003
; Address: $CD8025
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_003:
	JSR $802C			; 20 2C 80 | Jump to subroutine
	STA $200C			; 8D 0C 20 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_005
; Address: $CD802D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_005:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	SBC $B7			  ; E5 B7 | Subtract with carry (zero page)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $1C			  ; 85 1C | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_006
; Address: $CD803E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_006:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	SBC $B7			  ; E5 B7 | Subtract with carry (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	SBC $1C			  ; E5 1C | Subtract with carry (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_007
; Address: $CD8050
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_007:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $1C			  ; 65 1C | Add with carry (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_009
; Address: $CD8059
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_009:
	STA $1C			  ; 85 1C | Update graphics data
	STZ $1E			  ; 64 1E | Store zero to zero page
	STZ $20			  ; 64 20 | Store zero to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LSR $1C			  ; 46 1C | Logical shift right (zero page)
	BCC $0B			  ; 90 0B | Branch if carry clear
	LDA $F798,X		  ; BD 98 F7 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	BEQ $05			  ; F0 05 | Branch if equal
	ADC $20			  ; 65 20 | Add with carry (zero page)
	STA $20			  ; 85 20 | Update graphics data
	SEC				  ; 38 | Set carry flag
	ROR $1E			  ; 66 1E | Rotate right (zero page)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $E8			  ; 90 E8 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_00A
; Address: $CD807A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_00A:
	LDA $20			  ; A5 20 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	BMI $24			  ; 30 24 | Branch if negative

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_00B
; Address: $CD807F
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_00B:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	STZ $20			  ; 64 20 | Store zero to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LSR $1E			  ; 46 1E | Logical shift right (zero page)
	BCC $0E			  ; 90 0E | Branch if carry clear
	LDA $F798,X		  ; BD 98 F7 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $20			  ; 65 20 | Add with carry (zero page)
	STA $20			  ; 85 20 | Update graphics data
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_00C
; Address: $CD8098
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_00C:
	JSR $0F90			; 20 90 0F | Jump to subroutine
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $E7			  ; 90 E7 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	LDX #$1C			 ; A2 1C | Load immediate value into X register
	LDA #$00			 ; A9 00 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_00D
; Address: $CD80AA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_00D:
	PLA				  ; 68 | Pull accumulator from stack
	LDA $F7B8,X		  ; BD B8 F7 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_00E
; Address: $CD80AF
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_00E:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $2000,Y		  ; B9 00 20 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $1E			  ; F0 1E | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $F7B8,X		  ; BD B8 F7 | Read graphics status
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	LDA $F7D4,X		  ; BD D4 F7 | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	STZ $F798,X		  ; 9E 98 F7 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BCC $E7			  ; 90 E7 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$08			 ; C0 08 | Compare Y register (immediate)
	BCC $D3			  ; 90 D3 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_00F
; Address: $CD80E2
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_00F:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_010
; Address: $CD80E6
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_010:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $F798,X		  ; BD 98 F7 | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	LDA #$28			 ; A9 28 | Read graphics status
	STA $F798,X		  ; 9D 98 F7 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	BCC $EE			  ; 90 EE | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_011
; Address: $CD80FC
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_011:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $2000,X		  ; BD 00 20 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	INC $2008,X		  ; FE 08 20 | Increment (absolute,X)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $EE			  ; 90 EE | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_013
; Address: $CD8115
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_013:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 75 81 C6 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA				  ; BF 85 81 C6 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $7E353B		  ; AF 3B 35 7E | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_014
; Address: $CD813E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_014:
	JSL $C259CB		  ; 22 CB 59 C2 | Jump to subroutine long
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_016
; Address: $CD814F
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_016:
	PLA				  ; 68 | Pull accumulator from stack
	STA $18			  ; 85 18 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_017
; Address: $CD8153
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_017:
	LDA $18			  ; A5 18 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $C68175		  ; AF 75 81 C6 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA $C68185		  ; AF 85 81 C6 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_018
; Address: $CD8160
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_018:
	JSL $C259CB		  ; 22 CB 59 C2 | Jump to subroutine long
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_019
; Address: $CD816D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_019:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	STA $18			  ; 85 18 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_01B
; Address: $CD8177
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_01B:
	JSR $0800			; 20 00 08 | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_01C
; Address: $CD8189
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_01C:
	JSR $0000			; 20 00 00 | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $F7B8,X		  ; 9E B8 F7 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $F798,X		  ; 9E 98 F7 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDA #$01			 ; A9 01 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STA $F7D4,X		  ; 9D D4 F7 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$1C			 ; E0 1C | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	LDX $18			  ; A6 18 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_01D
; Address: $CD81C1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_01D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_01E
; Address: $CD81D1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_01E:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_020
; Address: $CD81E3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_020:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F7B6			; 8D B6 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_021
; Address: $CD81F5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_021:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $27			  ; F0 27 | Branch if equal
	STA $F7B8			; 8D B8 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_022
; Address: $CD820C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_022:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F798			; 8D 98 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_023
; Address: $CD821E
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_023:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	RTI				  ; 40 | Return from interrupt
	STA $F7D4			; 8D D4 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_024
; Address: $CD8230
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_024:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $27			  ; F0 27 | Branch if equal
	STA $F7BA			; 8D BA F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_025
; Address: $CD8247
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_025:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F79A			; 8D 9A F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_026
; Address: $CD8259
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_026:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	BRA $00			  ; 80 00 | Branch always
	STA $F7D6			; 8D D6 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_027
; Address: $CD826B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_027:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_028
; Address: $CD8274
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_028:
	INY				  ; C8 | Increment Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $27			  ; F0 27 | Branch if equal
	STA $F7BC			; 8D BC F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_029
; Address: $CD8282
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_029:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F79C			; 8D 9C F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_02A
; Address: $CD8294
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_02A:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $F7D8			; 8D D8 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_02B
; Address: $CD82A6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_02B:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $27			  ; F0 27 | Branch if equal
	STA $F7BE			; 8D BE F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_02C
; Address: $CD82BD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_02C:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F79E			; 8D 9E F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_02D
; Address: $CD82CF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_02D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	STA $F7DA			; 8D DA F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_02E
; Address: $CD82E1
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_02E:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $27			  ; F0 27 | Branch if equal
	STA $F7C0			; 8D C0 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_02F
; Address: $CD82F8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_02F:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F7A0			; 8D A0 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_031
; Address: $CD830E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_031:
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	STA $F7DC			; 8D DC F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_032
; Address: $CD831C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_032:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $15			  ; F0 15 | Branch if equal
	STA $F7C2			; 8D C2 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_033
; Address: $CD8333
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_033:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F7A2			; 8D A2 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_034
; Address: $CD8345
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_034:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2C			  ; F0 2C | Branch if equal
	STA $F7C4			; 8D C4 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_035
; Address: $CD835C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_035:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	ASL $2900			; 0E 00 29 | Arithmetic shift left (absolute)
	STA $F7F0			; 8D F0 F7 | Update graphics data
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_036
; Address: $CD8373
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_036:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F7A4			; 8D A4 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_037
; Address: $CD8385
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_037:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2C			  ; F0 2C | Branch if equal
	STA $F7C6			; 8D C6 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_039
; Address: $CD83A3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_039:
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F7F2			; 8D F2 F7 | Update graphics data
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_03A
; Address: $CD83B3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_03A:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F7A6			; 8D A6 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_03B
; Address: $CD83C5
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_03B:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2C			  ; F0 2C | Branch if equal
	STA $F7C8			; 8D C8 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_03C
; Address: $CD83DC
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_03C:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	BPL $00			  ; 10 00 | Branch if positive
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F7F4			; 8D F4 F7 | Update graphics data
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_03D
; Address: $CD83F3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_03D:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F7A8			; 8D A8 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_03E
; Address: $CD8405
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_03E:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA $2900			; 0D 00 29 | Logical OR with accumulator (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2C			  ; F0 2C | Branch if equal
	STA $F7CA			; 8D CA F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_03F
; Address: $CD841C
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_03F:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F7F6			; 8D F6 F7 | Update graphics data
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_041
; Address: $CD843A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_041:
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F7AA			; 8D AA F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_042
; Address: $CD8445
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_042:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ASL $2900			; 0E 00 29 | Arithmetic shift left (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $3E			  ; F0 3E | Branch if equal
	STA $F7CC			; 8D CC F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_043
; Address: $CD845C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_043:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F7F8			; 8D F8 F7 | Update graphics data
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $24			  ; F0 24 | Branch if equal

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_044
; Address: $CD8473
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_044:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F7AC			; 8D AC F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_045
; Address: $CD8485
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_045:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	STA $F7E8			; 8D E8 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_046
; Address: $CD8497
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_046:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $15			  ; F0 15 | Branch if equal
	STA $F7CE			; 8D CE F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_047
; Address: $CD84AE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_047:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F7AE			; 8D AE F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_048
; Address: $CD84C0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_048:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_049
; Address: $CD84CC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_049:
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $15			  ; F0 15 | Branch if equal
	STA $F7D0			; 8D D0 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_04A
; Address: $CD84D7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_04A:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $F7B0			; 8D B0 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_04B
; Address: $CD84E9
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_04B:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $15			  ; F0 15 | Branch if equal
	STA $F7D2			; 8D D2 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_04C
; Address: $CD8500
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_04C:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CLD				  ; D8 | Clear decimal mode flag
	INY				  ; C8 | Increment Y register
	ORA $2900			; 0D 00 29 | Logical OR with accumulator (absolute)
	STA $F7B2			; 8D B2 F7 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_04D
; Address: $CD8512
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_04D:
	JSL $C79190		  ; 22 90 91 C7 | Jump to subroutine long
	BCS $07			  ; B0 07 | Branch if carry set
	STZ $F7AC			; 9C AC F7 | Store zero to absolute
	STZ $F7B2			; 9C B2 F7 | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_04F
; Address: $CD8520
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_04F:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STA $FBBF			; 8D BF FB | Update graphics data
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_051
; Address: $CD852B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_051:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	INY				  ; C8 | Increment Y register
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	STA $2000			; 8D 00 20 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_052
; Address: $CD853D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_052:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	INY				  ; C8 | Increment Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	STA $2002			; 8D 02 20 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_053
; Address: $CD854F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_053:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_055
; Address: $CD8561
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_055:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	BRA $7F			  ; 80 7F | Branch always
	STA $2006			; 8D 06 20 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_056
; Address: $CD8573
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_056:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	INY				  ; C8 | Increment Y register
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	STA $2008			; 8D 08 20 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_057
; Address: $CD8585
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_057:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	INY				  ; C8 | Increment Y register
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	STA $200A			; 8D 0A 20 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_058
; Address: $CD8597
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_058:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	BVS $00			  ; 70 00 | Branch if overflow set
	STA $200C			; 8D 0C 20 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_059
; Address: $CD85A9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_059:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	INY				  ; C8 | Increment Y register
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $03			  ; 80 03 | Branch always
	STA $200E			; 8D 0E 20 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_05A
; Address: $CD85BB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_05A:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_05C
; Address: $CD85CE
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_05C:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	INY				  ; C8 | Increment Y register
	BRA $FF			  ; 80 FF | Branch always
	STA $FBC1			; 8D C1 FB | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_05D
; Address: $CD85E0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_05D:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	INY				  ; C8 | Increment Y register
	STA $FBC3			; 8D C3 FB | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_05E
; Address: $CD85F2
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_05E:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0010		   ; F4 10 00 | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_060
; Address: $CD860A
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_060:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0080		   ; F4 80 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_062
; Address: $CD861B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_062:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ROR $AC			  ; 66 AC | Rotate right (zero page)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_063
; Address: $CD8627
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_063:
	JSR $0000			; 20 00 00 | Jump to subroutine
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0020		   ; F4 20 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_064
; Address: $CD8633
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_064:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Read graphics status
	PEA #$2010		   ; F4 10 20 | Push effective address to stack
	PEA #$00FF		   ; F4 FF 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_065
; Address: $CD8643
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_065:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_066
; Address: $CD8653
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_066:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_067
; Address: $CD865B
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_067:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_069
; Address: $CD8664
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_069:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	LDX $16B0			; AE B0 16 | Load from absolute address into X register
	STA $2000,X		  ; 9D 00 20 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_06A
; Address: $CD866E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_06A:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	LDX #$B0			 ; A2 B0 | Load immediate value into X register
	STA $2008,X		  ; 9D 08 20 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $E5			  ; 90 E5 | Branch if carry clear
	BRA $06			  ; 80 06 | Branch always
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $DF			  ; 10 DF | Branch if positive
	BRA $2B			  ; 80 2B | Branch always

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_06C
; Address: $CD868D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_06C:
	BIT $C9			  ; 24 C9 | Test bits in accumulator (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	CMP #$4A			 ; C9 4A | Compare accumulator (immediate)
	BCC $12			  ; 90 12 | Branch if carry clear
	BRA $0D			  ; 80 0D | Branch always
	LDA #$48			 ; A9 48 | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_06D
; Address: $CD869D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_06D:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	INC				  ; 1A | Increment accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	LDA #$49			 ; A9 49 | Read graphics status
	STA $FBC5			; 8D C5 FB | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_06E
; Address: $CD86B2
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_06E:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_06F
; Address: $CD86B7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_06F:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$00			 ; A9 00 | Read graphics status
	PEA #$2010		   ; F4 10 20 | Push effective address to stack
	PEA #$00FF		   ; F4 FF 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_070
; Address: $CD86C6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_070:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_071
; Address: $CD86D3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_071:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0010		   ; F4 10 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_072
; Address: $CD86E0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_072:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0020		   ; F4 20 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_073
; Address: $CD86ED
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_073:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Read graphics status
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0040		   ; F4 40 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_075
; Address: $CD8701
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_075:
	JSL $C690A1		  ; 22 A1 90 C6 | Jump to subroutine long
	LDA #$1A			 ; A9 1A | Read graphics status
	STA $FBC1			; 8D C1 FB | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_076
; Address: $CD870B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_076:
	LDA #$01			 ; A9 01 | Read graphics status
	STA $FBC3			; 8D C3 FB | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_077
; Address: $CD8715
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_077:
	LDA #$00			 ; A9 00 | Read graphics status
	STA $2000			; 8D 00 20 | Update graphics data
	STA $2002			; 8D 02 20 | Update graphics data
	STA $2004			; 8D 04 20 | Update graphics data
	STA $2006			; 8D 06 20 | Update graphics data
	STZ $2008			; 9C 08 20 | Store zero to absolute
	STZ $200A			; 9C 0A 20 | Store zero to absolute
	STZ $200C			; 9C 0C 20 | Store zero to absolute
	STZ $200E			; 9C 0E 20 | Store zero to absolute
	LDA #$00			 ; A9 00 | Read graphics status
	PEA #$2010		   ; F4 10 20 | Push effective address to stack
	PEA #$00FF		   ; F4 FF 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_078
; Address: $CD873C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_078:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_079
; Address: $CD8749
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_079:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0010		   ; F4 10 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_07A
; Address: $CD8756
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_07A:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0080		   ; F4 80 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_07B
; Address: $CD8763
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_07B:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0020		   ; F4 20 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_07C
; Address: $CD8770
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_07C:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0040		   ; F4 40 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_07D
; Address: $CD877D
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_07D:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	STA $FBC5			; 8D C5 FB | Update graphics data
	LDA #$1A			 ; A9 1A | Read graphics status
	STA $FBC1			; 8D C1 FB | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $FBC3			; 8D C3 FB | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_086
; Address: $CD87B0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_086:
	JSL $C67DF5		  ; 22 F5 7D C6 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0010		   ; F4 10 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_087
; Address: $CD87C0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_087:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Read graphics status
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0080		   ; F4 80 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_088
; Address: $CD87D0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_088:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0020		   ; F4 20 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_08D
; Address: $CD87ED
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_08D:
	JSL $C67EA7		  ; 22 A7 7E C6 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0010		   ; F4 10 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_08E
; Address: $CD87FD
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_08E:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Read graphics status
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0080		   ; F4 80 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_08F
; Address: $CD880D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_08F:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	PEA #$2011		   ; F4 11 20 | Push effective address to stack
	PEA #$0020		   ; F4 20 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_09F
; Address: $CD8858
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_09F:
	LDA #$47			 ; A9 47 | Read graphics status
	STA $FBC5			; 8D C5 FB | Update graphics data
	LDA #$22			 ; A9 22 | Read graphics status
	STA $FBC1			; 8D C1 FB | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $FBC3			; 8D C3 FB | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0A3
; Address: $CD8876
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0A3:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$FF			 ; A2 FF | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0A6
; Address: $CD8887
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0A6:
	JSL $C79AE3		  ; 22 E3 9A C7 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$80			 ; A2 80 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ROL $C0			  ; 26 C0 | Rotate left (zero page)
	LDX #$80			 ; A2 80 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0A7
; Address: $CD889B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0A7:
	JSL $C02656		  ; 22 56 26 C0 | Jump to subroutine long
	LDX #$80			 ; A2 80 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROL $C0			  ; 26 C0 | Rotate left (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0A8
; Address: $CD88AD
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0A8:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$80			 ; A2 80 | Load immediate value into X register
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	ORA #$22			 ; 09 22 | Logical OR with accumulator (immediate)
	ROL $C0			  ; 26 C0 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0A9
; Address: $CD88BD
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0A9:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0AA
; Address: $CD88C1
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0AA:
	JSL $C688E4		  ; 22 E4 88 C6 | Jump to subroutine long
	LDA $C149			; AD 49 C1 | Read graphics status
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E7F6E		  ; 8F 6E 7F 7E | Update graphics data
	JMP $C67A85		  ; 5C 85 7A C6 | Jump to address long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0AD
; Address: $CD88E4
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0AD:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	CMP #$D9			 ; C9 D9 | Compare accumulator (immediate)
	ASL $B0			  ; 06 B0 | Arithmetic shift left (zero page)
	ORA $C9			  ; 05 C9 | Logical OR with accumulator (zero page)
	ORA $B0			  ; 05 B0 | Logical OR with accumulator (zero page)
	BRA $FE			  ; 80 FE | Branch always
	LDA $FBC1			; AD C1 FB | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0B1
; Address: $CD8907
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0B1:
	JSR $8B3A			; 20 3A 8B | Jump to subroutine
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7E7F6E		  ; 8F 6E 7F 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0B7
; Address: $CD8925
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0B7:
	JSL $C790B5		  ; 22 B5 90 C7 | Jump to subroutine long
	LDA #$DA			 ; A9 DA | Read graphics status
	CLC				  ; 18 | Clear carry flag
	LDA #$01			 ; A9 01 | Read graphics status
	PEA #$F802		   ; F4 02 F8 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0B9
; Address: $CD893E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0B9:
	JSL $C259F5		  ; 22 F5 59 C2 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	PEA #$F802		   ; F4 02 F8 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0BB
; Address: $CD8953
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0BB:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0BD
; Address: $CD8960
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0BD:
	JSL $C01056		  ; 22 56 10 C0 | Jump to subroutine long
	STZ $7FF6			; 9C F6 7F | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0BE
; Address: $CD8968
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0BE:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	CMP #$D9			 ; C9 D9 | Compare accumulator (immediate)
	ASL $B0			  ; 06 B0 | Arithmetic shift left (zero page)
	ORA $C9			  ; 05 C9 | Logical OR with accumulator (zero page)
	ORA $B0			  ; 05 B0 | Logical OR with accumulator (zero page)
	BRA $FE			  ; 80 FE | Branch always
	LDA $FBC1			; AD C1 FB | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0C2
; Address: $CD898B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0C2:
	JSR $8B3A			; 20 3A 8B | Jump to subroutine
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7E7F6E		  ; 8F 6E 7F 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0C6
; Address: $CD89A1
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0C6:
	JSL $C790B5		  ; 22 B5 90 C7 | Jump to subroutine long
	LDA #$DA			 ; A9 DA | Read graphics status
	CLC				  ; 18 | Clear carry flag
	LDA #$01			 ; A9 01 | Read graphics status
	PEA #$F802		   ; F4 02 F8 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0C8
; Address: $CD89BA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0C8:
	JSL $C4AC13		  ; 22 13 AC C4 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	PEA #$F802		   ; F4 02 F8 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0C9
; Address: $CD89CA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0C9:
	JSL $C902E9		  ; 22 E9 02 C9 | Jump to subroutine long
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C149			; 8D 49 C1 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0CC
; Address: $CD89E7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0CC:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	PEA #$23AB		   ; F4 AB 23 | Push effective address to stack
	PEA #$000F		   ; F4 0F 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0CD
; Address: $CD89F3
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0CD:
	JSL $C9029E		  ; 22 9E 02 C9 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	LDA				  ; BF 1B 8A C6 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $E0			  ; 90 E0 | Game work RAM access
	LDA #$01			 ; A9 01 | Read graphics status
	BRA $05			  ; 80 05 | Branch always
	PLA				  ; 68 | Pull accumulator from stack
	LDA				  ; BF 23 8A C6 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C149			; 8D 49 C1 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0CE
; Address: $CD8A1B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0CE:
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0EA
; Address: $CD8A85
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0EA:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PEA #$23AB		   ; F4 AB 23 | Push effective address to stack
	PEA #$000F		   ; F4 0F 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0EB
; Address: $CD8A95
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0EB:
	JSL $C9029E		  ; 22 9E 02 C9 | Jump to subroutine long
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BNE $1C			  ; D0 1C | Branch if not equal
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E7F6E		  ; 8F 6E 7F 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0ED
; Address: $CD8AA9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0ED:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	JMP ($7E98)		  ; 6C 98 7E | Jump to address (absolute indirect)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$19			 ; A9 19 | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0EE
; Address: $CD8AB6
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0EE:
	JSL $C731E0		  ; 22 E0 31 C7 | Jump to subroutine long
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BNE $04			  ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0EF
; Address: $CD8ABF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0EF:
	JSL $C1E281		  ; 22 81 E2 C1 | Jump to subroutine long
	LDA $FBC7			; AD C7 FB | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0F0
; Address: $CD8ACC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0F0:
	JSL $C05A94		  ; 22 94 5A C0 | Jump to subroutine long
	LDA $FBC3			; AD C3 FB | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $04			  ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0F1
; Address: $CD8AD8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0F1:
	JSL $C68AE4		  ; 22 E4 8A C6 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E7F6E		  ; 8F 6E 7F 7E | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_0F2
; Address: $CD8AE4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_0F2:
	JSL $C606D7		  ; 22 D7 06 C6 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDY #$FE			 ; A0 FE | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_108
; Address: $CD8B3A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_108:
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $FBC7			; 8D C7 FB | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	LSR $FC			  ; 46 FC | Logical shift right (zero page)
	LDA #$01			 ; A9 01 | Read graphics status
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $7FFC4A		  ; 8F 4A FC 7F | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FFC4C		  ; 8F 4C FC 7F | Update graphics data
	LDA $FBC5			; AD C5 FB | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_109
; Address: $CD8B60
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_109:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_10A
; Address: $CD8B6F
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_10A:
	JSL $C0769C		  ; 22 9C 76 C0 | Jump to subroutine long
	BCC $0A			  ; 90 0A | Branch if carry clear
	LDA $7FE552		  ; AF 52 E5 7F | Read graphics status
	STA $FBC7			; 8D C7 FB | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_10D
; Address: $CD8B84
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_10D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_10E
; Address: $CD8B93
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_10E:
	JSL $C030D2		  ; 22 D2 30 C0 | Jump to subroutine long
	STA $FBC9			; 8D C9 FB | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_114
; Address: $CD8BAC
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_114:
	LDA $7FC8			; AD C8 7F | Read graphics status
	STA $F807			; 8D 07 F8 | Update graphics data
	LDA $7FCA			; AD CA 7F | Read graphics status
	STA $F809			; 8D 09 F8 | Update graphics data
	LDA $7FCC			; AD CC 7F | Read graphics status
	STA $F80B			; 8D 0B F8 | Update graphics data
	LDA $7FCE			; AD CE 7F | Read graphics status
	STA $F80D			; 8D 0D F8 | Update graphics data
	LDA $7FD0			; AD D0 7F | Read graphics status
	STA $F80F			; 8D 0F F8 | Update graphics data
	LDA $7FD2			; AD D2 7F | Read graphics status
	STA $F811			; 8D 11 F8 | Update graphics data
	LDA $7FBA			; AD BA 7F | Read graphics status
	STA $F813			; 8D 13 F8 | Update graphics data
	LDA $7FBC			; AD BC 7F | Read graphics status
	STA $F815			; 8D 15 F8 | Update graphics data
	LDA $7FBE			; AD BE 7F | Read graphics status
	STA $F817			; 8D 17 F8 | Update graphics data
	LDA $99D9			; AD D9 99 | Read graphics status
	STA $F803			; 8D 03 F8 | Update graphics data
	LDA $7FD4			; AD D4 7F | Read graphics status
	STA $F819			; 8D 19 F8 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_117
; Address: $CD8BF6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_117:
	JSL $C08938		  ; 22 38 89 C0 | Jump to subroutine long
	LDA #$84			 ; A9 84 | Read graphics status
	BPL $8D			  ; 10 8D | Branch if positive
	LDA #$E4			 ; A9 E4 | Read graphics status
	STA $7FD8			; 8D D8 7F | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_11A
; Address: $CD8C0E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_11A:
	JSL $C08938		  ; 22 38 89 C0 | Jump to subroutine long
	LDA #$84			 ; A9 84 | Read graphics status
	BPL $8D			  ; 10 8D | Branch if positive
	LDA #$E4			 ; A9 E4 | Read graphics status
	STA $7FD8			; 8D D8 7F | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_11D
; Address: $CD8C26
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_11D:
	JSL $C08938		  ; 22 38 89 C0 | Jump to subroutine long
	LDA $F807			; AD 07 F8 | Read graphics status
	STA $7FC8			; 8D C8 7F | Update graphics data
	LDA $F809			; AD 09 F8 | Read graphics status
	STA $7FCA			; 8D CA 7F | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_11E
; Address: $CD8C36
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_11E:
	LDA $F80B			; AD 0B F8 | Read graphics status
	STA $7FCC			; 8D CC 7F | Update graphics data
	LDA $F80D			; AD 0D F8 | Read graphics status
	STA $7FCE			; 8D CE 7F | Update graphics data
	LDA $F80F			; AD 0F F8 | Read graphics status
	STA $7FD0			; 8D D0 7F | Update graphics data
	LDA $F811			; AD 11 F8 | Read graphics status
	STA $7FD2			; 8D D2 7F | Update graphics data
	LDA $F813			; AD 13 F8 | Read graphics status
	STA $7FBA			; 8D BA 7F | Update graphics data
	LDA $F815			; AD 15 F8 | Read graphics status
	STA $7FBC			; 8D BC 7F | Update graphics data
	LDA $F817			; AD 17 F8 | Read graphics status
	STA $7FBE			; 8D BE 7F | Update graphics data
	STZ $7FD4			; 9C D4 7F | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_123
; Address: $CD8C75
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_123:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF AC AE 7F | Read graphics status
	STA $F8FD,X		  ; 9D FD F8 | Update graphics data
	LDA				  ; BF C4 AE 7F | Read graphics status
	STA $F91D,X		  ; 9D 1D F9 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $EB			  ; 90 EB | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF F2 B0 7F | Read graphics status
	STA $F93D,X		  ; 9D 3D F9 | Update graphics data
	LDA				  ; BF 16 B1 7F | Read graphics status
	STA $F95D,X		  ; 9D 5D F9 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BCC $EB			  ; 90 EB | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF AC AE 7F | Read graphics status
	STA $F97D,X		  ; 9D 7D F9 | Update graphics data
	LDA				  ; BF C4 AE 7F | Read graphics status
	STA $F99D,X		  ; 9D 9D F9 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_124
; Address: $CD8CBF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_124:
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $EB			  ; 90 EB | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_127
; Address: $CD8CCD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_127:
	JSL $C05C67		  ; 22 67 5C C0 | Jump to subroutine long
	LDA $99D9			; AD D9 99 | Read graphics status
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_129
; Address: $CD8CDE
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_129:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $F8FD,X		  ; BD FD F8 | Read graphics status
	STA				  ; 9F AC AE 7F | Update graphics data
	LDA $F91D,X		  ; BD 1D F9 | Read graphics status
	STA				  ; 9F C4 AE 7F | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $EB			  ; 90 EB | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $F97D,X		  ; BD 7D F9 | Read graphics status
	STA				  ; 9F AC AE 7F | Update graphics data
	LDA $F99D,X		  ; BD 9D F9 | Read graphics status
	STA				  ; 9F C4 AE 7F | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $EB			  ; 90 EB | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	TXA				  ; 8A | Transfer X register to accumulator
	BNE $15			  ; D0 15 | Branch if not equal
	LDA $F93D,X		  ; BD 3D F9 | Read graphics status
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA $F95D,X		  ; BD 5D F9 | Read graphics status
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_12B
; Address: $CD8D23
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_12B:
	JSL $C063C0		  ; 22 C0 63 C0 | Jump to subroutine long
	BRA $0E			  ; 80 0E | Branch always
	LDA $F93D,X		  ; BD 3D F9 | Read graphics status
	STA				  ; 9F F2 B0 7F | Update graphics data
	LDA $F95D,X		  ; BD 5D F9 | Read graphics status
	STA				  ; 9F 16 B1 7F | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BCC $D3			  ; 90 D3 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_12C
; Address: $CD8D3F
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_12C:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $F8FD,X		  ; BD FD F8 | Read graphics status
	BEQ $0A			  ; F0 0A | Branch if equal
	LDA $F91D,X		  ; BD 1D F9 | Read graphics status
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_12D
; Address: $CD8D53
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_12D:
	JSL $C05CE1		  ; 22 E1 5C C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $EA			  ; 90 EA | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $F93D,X		  ; BD 3D F9 | Read graphics status
	BEQ $0A			  ; F0 0A | Branch if equal
	LDA $F95D,X		  ; BD 5D F9 | Read graphics status
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_12E
; Address: $CD8D6C
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_12E:
	JSL $C05DA1		  ; 22 A1 5D C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0C			 ; E0 0C | Compare X register (immediate)
	BCC $EA			  ; 90 EA | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $F97D,X		  ; BD 7D F9 | Read graphics status
	BEQ $0A			  ; F0 0A | Branch if equal
	LDA $F99D,X		  ; BD 9D F9 | Read graphics status
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_12F
; Address: $CD8D85
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_12F:
	JSL $C05E61		  ; 22 61 5E C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $EA			  ; 90 EA | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_130
; Address: $CD8D92
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_130:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF 60 B7 7F | Read graphics status
	STA $F9BD,X		  ; 9D BD F9 | Update graphics data
	BEQ $1E			  ; F0 1E | Branch if equal
	LDA				  ; BF C0 B7 7F | Read graphics status
	STA $FA3D,X		  ; 9D 3D FA | Update graphics data
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BCS $12			  ; B0 12 | Branch if carry set

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_131
; Address: $CD8DAA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_131:
	LDA				  ; BF 00 B8 7F | Read graphics status
	STA $FABD,X		  ; 9D BD FA | Update graphics data
	LDA				  ; BF E0 B7 7F | Read graphics status
	STA $FB3D,X		  ; 9D 3D FB | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_132
; Address: $CD8DB8
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_132:
	JSL $C06AD1		  ; 22 D1 6A C0 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $D2			  ; 90 D2 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_133
; Address: $CD8DC4
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_133:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF 60 B7 7F | Read graphics status
	BEQ $0D			  ; F0 0D | Branch if equal
	LDA				  ; BF C0 B7 7F | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BCS $04			  ; B0 04 | Branch if carry set

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_134
; Address: $CD8DD6
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_134:
	JSL $C06AD1		  ; 22 D1 6A C0 | Jump to subroutine long
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $E6			  ; 90 E6 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	PHX				  ; DA | Push X register to stack
	LDA $F9BD,X		  ; BD BD F9 | Read graphics status
	BEQ $68			  ; F0 68 | Branch if equal
	STA $7FB75E		  ; 8F 5E B7 7F | Update graphics data
	LDA $FA3D,X		  ; BD 3D FA | Read graphics status
	STA				  ; 9F C0 B7 7F | Update graphics data
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	RTI				  ; 40 | Return from interrupt
	BCS $58			  ; B0 58 | Branch if carry set
	STA $18			  ; 85 18 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA				  ; 9F 60 B7 7F | Update graphics data
	LDA $FABD,X		  ; BD BD FA | Read graphics status
	STA $7FAEA2		  ; 8F A2 AE 7F | Update graphics data
	STA $1A			  ; 85 1A | Update graphics data
	LDA $FB3D,X		  ; BD 3D FB | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2E			  ; F0 2E | Branch if equal
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $17			  ; F0 17 | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $34			  ; D0 34 | Branch if not equal
	LDX $1A			  ; A6 1A | Load from zero page into X register
	LDA				  ; BF B4 AE 7F | Read graphics status
	STA $7FAEA6		  ; 8F A6 AE 7F | Update graphics data
	LDX $18			  ; A6 18 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_136
; Address: $CD8E2E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_136:
	BRA $22			  ; 80 22 | Branch always
	LDX $1A			  ; A6 1A | Load from zero page into X register
	LDA				  ; BF FE B0 7F | Read graphics status
	STA $7FAEA6		  ; 8F A6 AE 7F | Update graphics data
	LDX $18			  ; A6 18 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_137
; Address: $CD8E3C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_137:
	JSL $C069C5		  ; 22 C5 69 C0 | Jump to subroutine long
	BRA $10			  ; 80 10 | Branch always
	LDX $1A			  ; A6 1A | Load from zero page into X register
	LDA				  ; BF B4 AE 7F | Read graphics status
	STA $7FAEA6		  ; 8F A6 AE 7F | Update graphics data
	LDX $18			  ; A6 18 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_138
; Address: $CD8E4E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_138:
	JSL $C0693F		  ; 22 3F 69 C0 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $8A			  ; 90 8A | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_139
; Address: $CD8E5B
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_139:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $8946,X		  ; BD 46 89 | Read graphics status
	STA $F81B,X		  ; 9D 1B F8 | Update graphics data
	LDA $8926,X		  ; BD 26 89 | Read graphics status
	STA $F83B,X		  ; 9D 3B F8 | Update graphics data
	LDA $8966,X		  ; BD 66 89 | Read graphics status
	STA $F85B,X		  ; 9D 5B F8 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $E7			  ; 90 E7 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_13B
; Address: $CD8E7C
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_13B:
	JSL $C02F96		  ; 22 96 2F C0 | Jump to subroutine long
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $F81B,X		  ; BD 1B F8 | Read graphics status
	STA $8946,X		  ; 9D 46 89 | Update graphics data
	LDA $F83B,X		  ; BD 3B F8 | Read graphics status
	STA $8926,X		  ; 9D 26 89 | Update graphics data
	LDA $F85B,X		  ; BD 5B F8 | Read graphics status
	STA $8966,X		  ; 9D 66 89 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$20			 ; E0 20 | Compare X register (immediate)
	BCC $E7			  ; 90 E7 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_141
; Address: $CD8EB2
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_141:
	LDA $96A0			; AD A0 96 | Read graphics status
	STA $FBBD			; 8D BD FB | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $96A0			; 8D A0 96 | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF 6C E3 7F | Read graphics status
	STA $F8BB,X		  ; 9D BB F8 | Update graphics data
	LDA				  ; BF 76 E3 7F | Read graphics status
	STA $F8C5,X		  ; 9D C5 F8 | Update graphics data
	LDA				  ; BF 1E E3 7F | Read graphics status
	STA $F8CF,X		  ; 9D CF F8 | Update graphics data
	LDA				  ; BF 28 E3 7F | Read graphics status
	STA $F8D9,X		  ; 9D D9 F8 | Update graphics data
	LDA				  ; BF 32 E3 7F | Read graphics status
	STA $F8E3,X		  ; 9D E3 F8 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	STA				  ; 9F 6C E3 7F | Update graphics data
	STA				  ; 9F 76 E3 7F | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA				  ; 9F 1E E3 7F | Update graphics data
	STA				  ; 9F 28 E3 7F | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $C0			  ; 90 C0 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF B2 E4 7F | Read graphics status
	STA $F8ED,X		  ; 9D ED F8 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA				  ; 9F B2 E4 7F | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $EB			  ; 90 EB | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_142
; Address: $CD8F1A
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_142:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $F8BB,X		  ; BD BB F8 | Read graphics status
	STA				  ; 9F 6C E3 7F | Update graphics data
	LDA $F8C5,X		  ; BD C5 F8 | Read graphics status
	STA				  ; 9F 76 E3 7F | Update graphics data
	LDA $F8CF,X		  ; BD CF F8 | Read graphics status
	STA				  ; 9F 1E E3 7F | Update graphics data
	LDA $F8D9,X		  ; BD D9 F8 | Read graphics status
	STA				  ; 9F 28 E3 7F | Update graphics data
	LDA $F8E3,X		  ; BD E3 F8 | Read graphics status
	STA				  ; 9F 32 E3 7F | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_143
; Address: $CD8F42
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_143:
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $D6			  ; 90 D6 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $F8ED,X		  ; BD ED F8 | Read graphics status
	STA				  ; 9F B2 E4 7F | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F2			  ; 90 F2 | Branch if carry clear
	LDA $FBBD			; AD BD FB | Read graphics status
	STA $96A0			; 8D A0 96 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_144
; Address: $CD8F5F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_144:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $DD49,X		  ; BD 49 DD | Read graphics status
	STA $F87B,X		  ; 9D 7B F8 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_149
; Address: $CD8F80
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_149:
	JSL $C633D7		  ; 22 D7 33 C6 | Jump to subroutine long
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $F87B,X		  ; BD 7B F8 | Read graphics status
	STA $DD49,X		  ; 9D 49 DD | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_156
; Address: $CD8FCB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_156:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC $18			  ; 65 18 | Add with carry (zero page)
	STA $18			  ; 85 18 | Update graphics data
	DEX				  ; CA | Decrement X register
	BNE $F1			  ; D0 F1 | Branch if not equal
	XBA				  ; EB | Exchange accumulator bytes
	STA $F796			; 8D 96 F7 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_158
; Address: $CD8FDD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_158:
	JSL $C690A1		  ; 22 A1 90 C6 | Jump to subroutine long
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $46			  ; F0 46 | Branch if equal
	STA $1A			  ; 85 1A | Update graphics data
	STZ $02			  ; 64 02 | Store zero to zero page
	STX $00			  ; 86 00 | Store X register to zero page
	LDX $1A			  ; A6 1A | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_159
; Address: $CD8FEE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_159:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 2F 90 C6 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_15A
; Address: $CD9003
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_15A:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROL $02			  ; 26 02 | Rotate left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ROL $02			  ; 26 02 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_15D
; Address: $CD9015
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_15D:
	JSR $908A			; 20 8A 90 | Jump to subroutine
	LDA $F796			; AD 96 F7 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $01			  ; E5 01 | Subtract with carry (zero page)
	STA $F796			; 8D 96 F7 | Update graphics data
	BCS $09			  ; B0 09 | Branch if carry set

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_15E
; Address: $CD9023
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_15E:
	JSL $C68FC3		  ; 22 C3 8F C6 | Jump to subroutine long
	LDA $1A			  ; A5 1A | Read graphics status
	PLY				  ; 7A | Pull Y register from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_15F
; Address: $CD902C
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_15F:
	PLY				  ; 7A | Pull Y register from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_162
; Address: $CD9037
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_162:
	BRA $00			  ; 80 00 | Branch always
	LDA $7E353B		  ; AF 3B 35 7E | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal
	LSR $02			  ; 46 02 | Logical shift right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_163
; Address: $CD904D
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_163:
	LDA $98AF			; AD AF 98 | Read graphics status
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BCS $34			  ; B0 34 | Branch if carry set
	LDA $7E353B		  ; AF 3B 35 7E | Read graphics status
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $7E353A		  ; AF 3A 35 7E | Read graphics status
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $22			  ; F0 22 | Branch if equal
	LDX $1A			  ; A6 1A | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_164
; Address: $CD9069
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_164:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $DB1B			; AD 1B DB | Read graphics status
	SEC				  ; 38 | Set carry flag
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	BCC $07			  ; 90 07 | Branch if carry clear
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BCC $02			  ; 90 02 | Branch if carry clear
	STZ $01			  ; 64 01 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_165
; Address: $CD908A
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_165:
	LDA $7E3545		  ; AF 45 35 7E | Read graphics status
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal
	LDA $99F7			; AD F7 99 | Read graphics status
	CMP #$55			 ; C9 55 | Compare accumulator (immediate)
	BNE $05			  ; D0 05 | Branch if not equal
	LDA #$00			 ; A9 00 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	STA $01			  ; 85 01 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_167
; Address: $CD90A4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_167:
	JSL $C69160		  ; 22 60 91 C6 | Jump to subroutine long
	LDA $98AF			; AD AF 98 | Read graphics status
	BEQ $09			  ; F0 09 | Branch if equal
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BCC $08			  ; 90 08 | Branch if carry clear
	LDX #$50			 ; A2 50 | Load immediate value into X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_16A
; Address: $CD90BA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_16A:
	DEC				  ; 3A | Decrement accumulator
	STA $18			  ; 85 18 | Update graphics data
	LDX $DB05			; AE 05 DB | Load from absolute address into X register
	CPY $90			  ; C4 90 | Compare Y register (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_16B
; Address: $CD90C4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_16B:
	BNE $90			  ; D0 90 | Branch if not equal
	CMP $F190,X		  ; DD 90 F1 | Compare accumulator (absolute,X)
	BCC $D0			  ; 90 D0 | Branch if carry clear
	BCC $F1			  ; 90 F1 | Branch if carry clear
	BCC $E7			  ; 90 E7 | Branch if carry clear
	BCC $A6			  ; 90 A6 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	LDA				  ; BF 5C 91 C6 | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_176
; Address: $CD90F8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_176:
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $C765			; AD 65 C7 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_177
; Address: $CD9109
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_177:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	ORA ($10,X)		  ; 01 10 | Logical OR with accumulator ((zero page,X))
	SBC $C8BD,X		  ; FD BD C8 | Subtract with carry (absolute,X)
	LDA $C725			; AD 25 C7 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_178
; Address: $CD9120
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_178:
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDX $18			  ; A6 18 | Load from zero page into X register
	LDA				  ; BF 5E 91 C6 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $C8A5			; AD A5 C8 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_179
; Address: $CD913A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_179:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ROR $C8BF,X		  ; 7E BF C8 | Rotate right (absolute,X)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_17B
; Address: $CD914D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_17B:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ROR $C8BF,X		  ; 7E BF C8 | Rotate right (absolute,X)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_17C
; Address: $CD915D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_17C:
	BPL $00			  ; 10 00 | Branch if positive
	BPL $48			  ; 10 48 | Branch if positive
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA $352C			; AD 2C 35 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCC $13			  ; 90 13 | Branch if carry clear
	CMP #$90			 ; C9 90 | Compare accumulator (immediate)
	BCC $1C			  ; 90 1C | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_17D
; Address: $CD9173
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_17D:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $AC			  ; 05 AC | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	BRA $1A			  ; 80 1A | Branch always

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_17E
; Address: $CD9181
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_17E:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $AC			  ; 05 AC | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	BRA $0C			  ; 80 0C | Branch always

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_17F
; Address: $CD918F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_17F:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA ($06,X)		  ; 01 06 | Logical OR with accumulator ((zero page,X))
	ORA $AC			  ; 05 AC | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_180
; Address: $CD919B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_180:
	STA $FBC5			; 8D C5 FB | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_182
; Address: $CD91A5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_182:
	JSL $C61F4E		  ; 22 4E 1F C6 | Jump to subroutine long
	STA $C135			; 8D 35 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_183
; Address: $CD91AD
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_183:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA $48			  ; 05 48 | Logical OR with accumulator (zero page)
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	TXS				  ; 9A | Transfer X register to stack pointer
	ROR $2085,X		  ; 7E 85 20 | Rotate right (absolute,X)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	TXS				  ; 9A | Transfer X register to stack pointer
	ROR $2285,X		  ; 7E 85 22 | Rotate right (absolute,X)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	TXS				  ; 9A | Transfer X register to stack pointer
	ROR $2485,X		  ; 7E 85 24 | Rotate right (absolute,X)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	TXS				  ; 9A | Transfer X register to stack pointer
	ROR $2685,X		  ; 7E 85 26 | Rotate right (absolute,X)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_184
; Address: $CD91F3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_184:
	JSL $C61F47		  ; 22 47 1F C6 | Jump to subroutine long
	STA $18			  ; 85 18 | Update graphics data
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	PLB				  ; AB | Pull data bank register from stack
	LDA $20			  ; A5 20 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_185
; Address: $CD9206
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_185:
	JSR $935D			; 20 5D 93 | Jump to subroutine
	LDA $20			  ; A5 20 | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_186
; Address: $CD920D
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_186:
	STA $20			  ; 85 20 | Update graphics data
	CMP $24			  ; C5 24 | Compare accumulator (zero page)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	STA $20			  ; 85 20 | Update graphics data
	LDA $22			  ; A5 22 | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $22			  ; 85 22 | Update graphics data
	CMP $26			  ; C5 26 | Compare accumulator (zero page)
	BCC $E3			  ; 90 E3 | Branch if carry clear
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_187
; Address: $CD9222
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_187:
	PHA				  ; 48 | Push accumulator to stack
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCS $07			  ; B0 07 | Branch if carry set
	STA $AC7B,X		  ; 9D 7B AC | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $ACBB,X		  ; 9D BB AC | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_188
; Address: $CD9234
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_188:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA $48			  ; 05 48 | Logical OR with accumulator (zero page)
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1A			  ; 85 1A | Update graphics data
	TAX				  ; AA | Transfer accumulator to X register
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	ADC ($9A,X)		  ; 61 9A | Add with carry ((zero page,X))
	ROR $2085,X		  ; 7E 85 20 | Rotate right (absolute,X)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	STA ($9A,X)		  ; 81 9A | Update graphics data
	ROR $2285,X		  ; 7E 85 22 | Rotate right (absolute,X)
	STA $26			  ; 85 26 | Update graphics data
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	ADC ($9A,X)		  ; 61 9A | Add with carry ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_189
; Address: $CD9270
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_189:
	ROR $2485,X		  ; 7E 85 24 | Rotate right (absolute,X)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_18A
; Address: $CD9279
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_18A:
	JSL $C61F47		  ; 22 47 1F C6 | Jump to subroutine long
	STA $18			  ; 85 18 | Update graphics data
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_18B
; Address: $CD9289
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_18B:
	JSR $92E8			; 20 E8 92 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_18C
; Address: $CD928E
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_18C:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA $48			  ; 05 48 | Logical OR with accumulator (zero page)
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $1A			  ; 85 1A | Update graphics data
	TAX				  ; AA | Transfer accumulator to X register
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	ADC ($9A,X)		  ; 61 9A | Add with carry ((zero page,X))
	ROR $2085,X		  ; 7E 85 20 | Rotate right (absolute,X)
	STA $24			  ; 85 24 | Update graphics data
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	STA ($9A,X)		  ; 81 9A | Update graphics data
	ROR $2285,X		  ; 7E 85 22 | Rotate right (absolute,X)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	STA ($9A,X)		  ; 81 9A | Update graphics data
	ROR $2685,X		  ; 7E 85 26 | Rotate right (absolute,X)
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_18D
; Address: $CD92D3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_18D:
	JSL $C61F47		  ; 22 47 1F C6 | Jump to subroutine long
	STA $18			  ; 85 18 | Update graphics data
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_18F
; Address: $CD92E3
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_18F:
	JSR $92E8			; 20 E8 92 | Jump to subroutine
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_190
; Address: $CD92E8
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_190:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $A843,X		  ; BD 43 A8 | Read graphics status
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$B4			 ; E0 B4 | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	BRA $FE			  ; 80 FE | Branch always
	LDA $18			  ; A5 18 | Read graphics status
	STA $A843,X		  ; 9D 43 A8 | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $A8F7,X		  ; 9D F7 A8 | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	STA $A9AB,X		  ; 9D AB A9 | Update graphics data
	LDA $22			  ; A5 22 | Read graphics status
	STA $AA5F,X		  ; 9D 5F AA | Update graphics data
	LDA $24			  ; A5 24 | Read graphics status
	STA $AB13,X		  ; 9D 13 AB | Update graphics data
	LDA $26			  ; A5 26 | Read graphics status
	STA $ABC7,X		  ; 9D C7 AB | Update graphics data
	LDY $1A			  ; A4 1A | Load from zero page into Y register
	LDA $9AE1,Y		  ; B9 E1 9A | Read graphics status
	STA $00			  ; 85 00 | Update graphics data
	LDA $22			  ; A5 22 | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_191
; Address: $CD9323
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_191:
	JSL $C010D6		  ; 22 D6 10 C0 | Jump to subroutine long
	LDA $20			  ; A5 20 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ADC $9A41,Y		  ; 79 41 9A | Add with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ADC $00			  ; 65 00 | Add with carry (zero page)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $22			  ; A5 22 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDA $20			  ; A5 20 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA				  ; BF 00 00 7F | Read graphics status
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	STA				  ; 9F 00 00 7F | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	CMP $24			  ; C5 24 | Compare accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_192
; Address: $CD934A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_192:
	BCC $EC			  ; 90 EC | Branch if carry clear
	BEQ $EA			  ; F0 EA | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	ADC $9AE1,Y		  ; 79 E1 9A | Add with carry (absolute,Y)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	CMP $26			  ; C5 26 | Compare accumulator (zero page)
	BCC $DA			  ; 90 DA | Branch if carry clear
	BEQ $D8			  ; F0 D8 | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_193
; Address: $CD935D
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_193:
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7F7F		   ; F4 7F 7F | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $E3E2,Y		  ; B9 E2 E3 | Read graphics status
	BPL $3D			  ; 10 3D | Branch if positive
	LDA $E472,Y		  ; B9 72 E4 | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_194
; Address: $CD936E
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_194:
	JSL $C014F2		  ; 22 F2 14 C0 | Jump to subroutine long
	AND $FC60			; 2D 60 FC | Logical AND with accumulator (absolute)
	BEQ $31			  ; F0 31 | Branch if equal
	LDA $E3F2,Y		  ; B9 F2 E3 | Read graphics status
	CMP #$06			 ; C9 06 | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	CMP #$0A			 ; C9 0A | Compare accumulator (immediate)
	BNE $1F			  ; D0 1F | Branch if not equal
	LDA $20			  ; A5 20 | Read graphics status
	CMP $E432,Y		  ; D9 32 E4 | Compare accumulator (absolute,Y)
	BCC $18			  ; 90 18 | Branch if carry clear
	LDA $E442,Y		  ; B9 42 E4 | Read graphics status
	CMP $20			  ; C5 20 | Compare accumulator (zero page)
	BCC $11			  ; 90 11 | Branch if carry clear
	LDA $22			  ; A5 22 | Read graphics status
	CMP $E452,Y		  ; D9 52 E4 | Compare accumulator (absolute,Y)
	BCC $0A			  ; 90 0A | Branch if carry clear
	LDA $E462,Y		  ; B9 62 E4 | Read graphics status
	CMP $22			  ; C5 22 | Compare accumulator (zero page)
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_195
; Address: $CD93A5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_195:
	JSR $93B1			; 20 B1 93 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BCC $B7			  ; 90 B7 | Branch if carry clear
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_197
; Address: $CD93B4
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_197:
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	INC				  ; 1A | Increment accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $1A			  ; 85 1A | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $1C			  ; 85 1C | Update graphics data
	LDA $22			  ; A5 22 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E452,Y		  ; F9 52 E4 | Subtract with carry (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	LDA $1A			  ; A5 1A | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_198
; Address: $CD93D1
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_198:
	JSL $C01098		  ; 22 98 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	CLC				  ; 18 | Clear carry flag
	ADC $1C			  ; 65 1C | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $E412,Y		  ; 79 12 E4 | Add with carry (absolute,Y)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$FF			 ; A9 FF | Read graphics status
	AND $0000,X		  ; 3D 00 00 | Logical AND with accumulator (absolute,X)
	ORA $18			  ; 05 18 | Logical OR with accumulator (zero page)
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_199
; Address: $CD946B
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_199:
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
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_19A
; Address: $CD9495
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_19A:
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($02,X)		  ; 01 02 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($03,X)		  ; 01 03 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA ($04,X)		  ; 01 04 | Logical OR with accumulator ((zero page,X))
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_19B
; Address: $CD9573
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_19B:
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $01			  ; 05 01 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $01			  ; 06 01 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $02			  ; 06 02 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $03			  ; 05 03 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_19C
; Address: $CD95E7
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_19C:
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA $04			  ; 05 04 | Logical OR with accumulator (zero page)
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ORA ($07,X)		  ; 01 07 | Logical OR with accumulator ((zero page,X))
	ASL $03			  ; 06 03 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	ORA ($08,X)		  ; 01 08 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_19D
; Address: $CD9675
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_19D:
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_19E
; Address: $CD96D9
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_19E:
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ORA ($0B,X)		  ; 01 0B | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA ($0C,X)		  ; 01 0C | Logical OR with accumulator ((zero page,X))
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA $0D00			; 0D 00 0D | Logical OR with accumulator (absolute)
	ORA $0D00			; 0D 00 0D | Logical OR with accumulator (absolute)
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_19F
; Address: $CD9776
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_19F:
	ORA ($0D,X)		  ; 01 0D | Logical OR with accumulator ((zero page,X))
	ORA $0D02			; 0D 02 0D | Logical OR with accumulator (absolute)
	ORA $0D03			; 0D 03 0D | Logical OR with accumulator (absolute)
	ORA $0D03			; 0D 03 0D | Logical OR with accumulator (absolute)
	ORA $0D04			; 0D 04 0D | Logical OR with accumulator (absolute)
	ORA $0C05			; 0D 05 0C | Logical OR with accumulator (absolute)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ASL $0E00			; 0E 00 0E | Arithmetic shift left (absolute)
	ASL $0E01			; 0E 01 0E | Arithmetic shift left (absolute)
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ORA ($0E,X)		  ; 01 0E | Logical OR with accumulator ((zero page,X))
	ASL $0E02			; 0E 02 0E | Arithmetic shift left (absolute)
	ASL $0E03			; 0E 03 0E | Arithmetic shift left (absolute)
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	ASL $0E04			; 0E 04 0E | Arithmetic shift left (absolute)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ORA $0C07			; 0D 07 0C | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA ($0F,X)		  ; 01 0F | Logical OR with accumulator ((zero page,X))
	ORA $0F			  ; 05 0F | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1A0
; Address: $CD9808
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1A0:
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ASL $0D07			; 0E 07 0D | Arithmetic shift left (absolute)
	ORA $0D08			; 0D 08 0D | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA $0D08			; 0D 08 0D | Logical OR with accumulator (absolute)
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $00			  ; 10 00 | Branch if positive
	BPL $01			  ; 10 01 | Branch if positive
	BPL $01			  ; 10 01 | Branch if positive
	BPL $02			  ; 10 02 | Branch if positive
	BPL $02			  ; 10 02 | Branch if positive
	BPL $02			  ; 10 02 | Branch if positive
	BPL $03			  ; 10 03 | Branch if positive
	BPL $03			  ; 10 03 | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	BPL $04			  ; 10 04 | Branch if positive
	BPL $05			  ; 10 05 | Branch if positive
	BPL $05			  ; 10 05 | Branch if positive
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0F			  ; 06 0F | Arithmetic shift left (zero page)
	ASL $0E08			; 0E 08 0E | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0E08			; 0E 08 0E | Arithmetic shift left (absolute)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	ORA #$0D			 ; 09 0D | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0D0A			; 0D 0A 0D | Logical OR with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	ORA ($01),Y		  ; 11 01 | Logical OR with accumulator ((zero page),Y)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ORA ($02),Y		  ; 11 02 | Logical OR with accumulator ((zero page),Y)
	ORA ($03),Y		  ; 11 03 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1A1
; Address: $CD987B
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1A1:
	ORA ($03),Y		  ; 11 03 | Logical OR with accumulator ((zero page),Y)
	ORA ($03),Y		  ; 11 03 | Logical OR with accumulator ((zero page),Y)
	ORA ($04),Y		  ; 11 04 | Logical OR with accumulator ((zero page),Y)
	ORA ($04),Y		  ; 11 04 | Logical OR with accumulator ((zero page),Y)
	ORA ($05),Y		  ; 11 05 | Logical OR with accumulator ((zero page),Y)
	ORA ($05),Y		  ; 11 05 | Logical OR with accumulator ((zero page),Y)
	BPL $06			  ; 10 06 | Branch if positive
	BPL $06			  ; 10 06 | Branch if positive
	BPL $06			  ; 10 06 | Branch if positive
	BPL $07			  ; 10 07 | Branch if positive
	BPL $07			  ; 10 07 | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$0F			 ; 09 0F | Logical OR with accumulator (immediate)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0E0A			; 0E 0A 0E | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0D0B			; 0E 0B 0D | Arithmetic shift left (absolute)
	ORA $0D0B			; 0D 0B 0D | Logical OR with accumulator (absolute)
	ORA $120C			; 0D 0C 12 | Logical OR with accumulator (absolute)
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	ORA ($12,X)		  ; 01 12 | Logical OR with accumulator ((zero page,X))
	ORA $12			  ; 05 12 | Logical OR with accumulator (zero page)
	ORA $12			  ; 05 12 | Logical OR with accumulator (zero page)
	ORA $11			  ; 05 11 | Logical OR with accumulator (zero page)
	ASL $11			  ; 06 11 | Arithmetic shift left (zero page)
	ASL $11			  ; 06 11 | Arithmetic shift left (zero page)
	ORA ($07),Y		  ; 11 07 | Logical OR with accumulator ((zero page),Y)
	ORA ($08),Y		  ; 11 08 | Logical OR with accumulator ((zero page),Y)
	BPL $08			  ; 10 08 | Branch if positive
	BPL $08			  ; 10 08 | Branch if positive
	BPL $09			  ; 10 09 | Branch if positive
	BPL $09			  ; 10 09 | Branch if positive
	BPL $0A			  ; 10 0A | Branch if positive
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0E0B			; 0E 0B 0E | Arithmetic shift left (absolute)
	ASL $0E0C			; 0E 0C 0E | Arithmetic shift left (absolute)
	ORA $130D			; 0D 0D 13 | Logical OR with accumulator (absolute)
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	ORA ($13,X)		  ; 01 13 | Logical OR with accumulator ((zero page,X))
	ORA $13			  ; 05 13 | Logical OR with accumulator (zero page)
	ORA $12			  ; 05 12 | Logical OR with accumulator (zero page)
	ASL $12			  ; 06 12 | Arithmetic shift left (zero page)
	ASL $12			  ; 06 12 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA ($08),Y		  ; 11 08 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1A2
; Address: $CD9913
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1A2:
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	ORA ($09),Y		  ; 11 09 | Logical OR with accumulator ((zero page),Y)
	ORA ($0A),Y		  ; 11 0A | Logical OR with accumulator ((zero page),Y)
	BPL $0A			  ; 10 0A | Branch if positive
	BPL $0B			  ; 10 0B | Branch if positive
	BPL $0B			  ; 10 0B | Branch if positive
	BPL $0B			  ; 10 0B | Branch if positive
	ORA $0D0E			; 0D 0E 0D | Logical OR with accumulator (absolute)
	ASL $140D			; 0E 0D 14 | Arithmetic shift left (absolute)
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $14			  ; 05 14 | Logical OR with accumulator (zero page)
	ORA $14			  ; 05 14 | Logical OR with accumulator (zero page)
	ASL $13			  ; 06 13 | Arithmetic shift left (zero page)
	ASL $13			  ; 06 13 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	ORA #$12			 ; 09 12 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0B),Y		  ; 11 0B | Logical OR with accumulator ((zero page),Y)
	ORA ($0B),Y		  ; 11 0B | Logical OR with accumulator ((zero page),Y)
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	BPL $0C			  ; 10 0C | Branch if positive
	BPL $0C			  ; 10 0C | Branch if positive
	BPL $0D			  ; 10 0D | Branch if positive
	ORA $0E0F			; 0D 0F 0E | Logical OR with accumulator (absolute)
	ASL $0015			; 0E 15 00 | Arithmetic shift left (absolute)
	ORA ($15,X)		  ; 01 15 | Logical OR with accumulator ((zero page,X))
	ORA ($15,X)		  ; 01 15 | Logical OR with accumulator ((zero page,X))
	ORA $15			  ; 05 15 | Logical OR with accumulator (zero page)
	ORA $15			  ; 05 15 | Logical OR with accumulator (zero page)
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	ASL $14			  ; 06 14 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$13			 ; 09 13 | Logical OR with accumulator (immediate)
	ORA #$13			 ; 09 13 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0C),Y		  ; 11 0C | Logical OR with accumulator ((zero page),Y)
	ORA ($0D),Y		  ; 11 0D | Logical OR with accumulator ((zero page),Y)
	ORA ($0D),Y		  ; 11 0D | Logical OR with accumulator ((zero page),Y)
	ORA ($0D),Y		  ; 11 0D | Logical OR with accumulator ((zero page),Y)
	BPL $0E			  ; 10 0E | Branch if positive
	BPL $0E			  ; 10 0E | Branch if positive
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))
	ORA ($16,X)		  ; 01 16 | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1A3
; Address: $CD99BE
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1A3:
	ORA $16			  ; 05 16 | Logical OR with accumulator (zero page)
	ORA $16			  ; 05 16 | Logical OR with accumulator (zero page)
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ASL $15			  ; 06 15 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$14			 ; 09 14 | Logical OR with accumulator (immediate)
	ORA #$14			 ; 09 14 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0D12			; 0D 12 0D | Logical OR with accumulator (absolute)
	ASL $0E11			; 0E 11 0E | Arithmetic shift left (absolute)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	ORA ($0F),Y		  ; 11 0F | Logical OR with accumulator ((zero page),Y)
	BPL $0F			  ; 10 0F | Branch if positive
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	ORA ($17,X)		  ; 01 17 | Logical OR with accumulator ((zero page,X))
	ORA $17			  ; 05 17 | Logical OR with accumulator (zero page)
	ORA $17			  ; 05 17 | Logical OR with accumulator (zero page)
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	ASL $16			  ; 06 16 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$15			 ; 09 15 | Logical OR with accumulator (immediate)
	ORA #$15			 ; 09 15 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0D13			; 0D 13 0D | Logical OR with accumulator (absolute)
	ASL $0E12			; 0E 12 0E | Arithmetic shift left (absolute)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $18			  ; 05 18 | Logical OR with accumulator (zero page)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	ASL $17			  ; 06 17 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$16			 ; 09 16 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0D14			; 0D 14 0D | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1A4
; Address: $CD9A5E
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1A4:
	ASL $0E14			; 0E 14 0E | Arithmetic shift left (absolute)
	BPL $12			  ; 10 12 | Branch if positive
	BPL $12			  ; 10 12 | Branch if positive
	ORA ($19),Y		  ; 11 19 | Logical OR with accumulator ((zero page),Y)
	ORA $1900,Y		  ; 19 00 19 | Logical OR with accumulator (absolute,Y)
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	ORA ($19,X)		  ; 01 19 | Logical OR with accumulator ((zero page,X))
	ORA $1903,Y		  ; 19 03 19 | Logical OR with accumulator (absolute,Y)
	ORA $1904,Y		  ; 19 04 19 | Logical OR with accumulator (absolute,Y)
	ORA $19			  ; 05 19 | Logical OR with accumulator (zero page)
	ORA $19			  ; 05 19 | Logical OR with accumulator (zero page)
	ASL $19			  ; 06 19 | Arithmetic shift left (zero page)
	ASL $18			  ; 06 18 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	PHP				  ; 08 | Push processor status to stack
	CLC				  ; 18 | Clear carry flag
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ORA #$17			 ; 09 17 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0D15			; 0D 15 0D | Logical OR with accumulator (absolute)
	ASL $0E15			; 0E 15 0E | Arithmetic shift left (absolute)
	BPL $13			  ; 10 13 | Branch if positive
	BPL $13			  ; 10 13 | Branch if positive
	ORA ($12),Y		  ; 11 12 | Logical OR with accumulator ((zero page),Y)
	ORA ($1A),Y		  ; 11 1A | Logical OR with accumulator ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	ORA $1A			  ; 05 1A | Logical OR with accumulator (zero page)
	ASL $1A			  ; 06 1A | Arithmetic shift left (zero page)
	ORA $1907,Y		  ; 19 07 19 | Logical OR with accumulator (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ORA $1909,Y		  ; 19 09 19 | Logical OR with accumulator (absolute,Y)
	ORA #$18			 ; 09 18 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $0D17			; 0D 17 0D | Logical OR with accumulator (absolute)
	ASL $0F16			; 0E 16 0F | Arithmetic shift left (absolute)
	BPL $15			  ; 10 15 | Branch if positive

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1A5
; Address: $CD9AE2
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1A5:
	BPL $14			  ; 10 14 | Branch if positive
	ORA ($14),Y		  ; 11 14 | Logical OR with accumulator ((zero page),Y)
	ORA ($14),Y		  ; 11 14 | Logical OR with accumulator ((zero page),Y)
	ORA ($1B,X)		  ; 01 1B | Logical OR with accumulator ((zero page,X))
	ORA $1B			  ; 05 1B | Logical OR with accumulator (zero page)
	ASL $1B			  ; 06 1B | Arithmetic shift left (zero page)
	ASL $1A			  ; 06 1A | Arithmetic shift left (zero page)
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	PHP				  ; 08 | Push processor status to stack
	INC				  ; 1A | Increment accumulator
	ORA #$1A			 ; 09 1A | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $190A,Y		  ; 19 0A 19 | Logical OR with accumulator (absolute,Y)
	ORA $190B,Y		  ; 19 0B 19 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ORA $0D18			; 0D 18 0D | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	ASL $0E17			; 0E 17 0E | Arithmetic shift left (absolute)
	BPL $16			  ; 10 16 | Branch if positive
	BPL $16			  ; 10 16 | Branch if positive
	ORA ($15),Y		  ; 11 15 | Logical OR with accumulator ((zero page),Y)
	ORA ($15),Y		  ; 11 15 | Logical OR with accumulator ((zero page),Y)
	ORA ($1C,X)		  ; 01 1C | Logical OR with accumulator ((zero page,X))
	ORA $1C			  ; 05 1C | Logical OR with accumulator (zero page)
	ASL $1C			  ; 06 1C | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ORA #$1B			 ; 09 1B | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $190D,Y		  ; 19 0D 19 | Logical OR with accumulator (absolute,Y)
	ORA $0E19			; 0D 19 0E | Logical OR with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	ASL $0F18			; 0E 18 0F | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	BPL $17			  ; 10 17 | Branch if positive
	BPL $17			  ; 10 17 | Branch if positive
	ORA ($16),Y		  ; 11 16 | Logical OR with accumulator ((zero page),Y)
	ORA ($16),Y		  ; 11 16 | Logical OR with accumulator ((zero page),Y)
	ORA $1D00,X		  ; 1D 00 1D | Logical OR with accumulator (absolute,X)
	ORA $1D01,X		  ; 1D 01 1D | Logical OR with accumulator (absolute,X)
	ORA $1D02,X		  ; 1D 02 1D | Logical OR with accumulator (absolute,X)
	ORA $1D04,X		  ; 1D 04 1D | Logical OR with accumulator (absolute,X)
	ORA $1D			  ; 05 1D | Logical OR with accumulator (zero page)
	ORA $1D			  ; 05 1D | Logical OR with accumulator (zero page)
	ASL $1D			  ; 06 1D | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1A6
; Address: $CD9B82
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1A6:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$1C			 ; 09 1C | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	ORA $0E1A			; 0D 1A 0E | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	ASL $0F19			; 0E 19 0F | Arithmetic shift left (absolute)
	ORA $1810,Y		  ; 19 10 18 | Logical OR with accumulator (absolute,Y)
	BPL $18			  ; 10 18 | Branch if positive
	ORA ($18),Y		  ; 11 18 | Logical OR with accumulator ((zero page),Y)
	ORA ($17),Y		  ; 11 17 | Logical OR with accumulator ((zero page),Y)
	ASL $1E00,X		  ; 1E 00 1E | Arithmetic shift left (absolute,X)
	ASL $1E01,X		  ; 1E 01 1E | Arithmetic shift left (absolute,X)
	ASL $1E03,X		  ; 1E 03 1E | Arithmetic shift left (absolute,X)
	ASL $1E04,X		  ; 1E 04 1E | Arithmetic shift left (absolute,X)
	ORA $1E			  ; 05 1E | Logical OR with accumulator (zero page)
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ASL $1E			  ; 06 1E | Arithmetic shift left (zero page)
	ORA $1D08,X		  ; 1D 08 1D | Logical OR with accumulator (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA $1D09,X		  ; 1D 09 1D | Logical OR with accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0D1B			; 0D 1B 0D | Logical OR with accumulator (absolute)
	ASL $0F1A			; 0E 1A 0F | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	BPL $19			  ; 10 19 | Branch if positive
	ORA ($19),Y		  ; 11 19 | Logical OR with accumulator ((zero page),Y)
	ORA ($18),Y		  ; 11 18 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA ($1F,X)		  ; 01 1F | Logical OR with accumulator ((zero page,X))
	ORA $1F			  ; 05 1F | Logical OR with accumulator (zero page)
	ASL $1F			  ; 06 1F | Arithmetic shift left (zero page)
	ASL $1E08,X		  ; 1E 08 1E | Arithmetic shift left (absolute,X)
	ORA #$1E			 ; 09 1E | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1D0A,X		  ; 1E 0A 1D | Arithmetic shift left (absolute,X)
	ORA $1D0C,X		  ; 1D 0C 1D | Logical OR with accumulator (absolute,X)
	ORA $0E1C			; 0D 1C 0E | Logical OR with accumulator (absolute)
	BPL $1B			  ; 10 1B | Branch if positive
	ORA ($1A),Y		  ; 11 1A | Logical OR with accumulator ((zero page),Y)
	ORA ($1A),Y		  ; 11 1A | Logical OR with accumulator ((zero page),Y)
	ORA $1913,Y		  ; 19 13 19 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1AA
; Address: $CD9C37
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1AA:
	JSR $2004			; 20 04 20 | Jump to subroutine
	ORA $20			  ; 05 20 | Logical OR with accumulator (zero page)
	ASL $20			  ; 06 20 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1AB
; Address: $CD9C3F
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1AB:
	JSR $1F08			; 20 08 1F | Jump to subroutine
	PHP				  ; 08 | Push processor status to stack
	ORA #$1F			 ; 09 1F | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1E0B,X		  ; 1E 0B 1E | Arithmetic shift left (absolute,X)
	ASL $1D0D,X		  ; 1E 0D 1D | Arithmetic shift left (absolute,X)
	ASL $0E1D			; 0E 1D 0E | Arithmetic shift left (absolute)
	ORA $1C0F,X		  ; 1D 0F 1C | Logical OR with accumulator (absolute,X)
	BPL $1C			  ; 10 1C | Branch if positive
	BPL $1B			  ; 10 1B | Branch if positive
	ORA ($1B),Y		  ; 11 1B | Logical OR with accumulator ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $1814,Y		  ; 19 14 18 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	AND ($01,X)		  ; 21 01 | Logical AND with accumulator ((zero page,X))
	AND ($02,X)		  ; 21 02 | Logical AND with accumulator ((zero page,X))
	AND ($03,X)		  ; 21 03 | Logical AND with accumulator ((zero page,X))
	AND ($04,X)		  ; 21 04 | Logical AND with accumulator ((zero page,X))
	AND ($04,X)		  ; 21 04 | Logical AND with accumulator ((zero page,X))
	AND ($05,X)		  ; 21 05 | Logical AND with accumulator ((zero page,X))
	AND ($06,X)		  ; 21 06 | Logical AND with accumulator ((zero page,X))
	AND ($07,X)		  ; 21 07 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1AC
; Address: $CD9C7F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1AC:
	JSR $2008			; 20 08 20 | Jump to subroutine
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	ORA #$20			 ; 09 20 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1AD
; Address: $CD9C87
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1AD:
	JSR $1F0B			; 20 0B 1F | Jump to subroutine
	ORA $0D1F			; 0D 1F 0D | Logical OR with accumulator (absolute)
	ASL $1E0E,X		  ; 1E 0E 1E | Arithmetic shift left (absolute,X)
	ORA $1D10,X		  ; 1D 10 1D | Logical OR with accumulator (absolute,X)
	BPL $1D			  ; 10 1D | Branch if positive
	ORA ($1C),Y		  ; 11 1C | Logical OR with accumulator ((zero page),Y)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA $1916,Y		  ; 19 16 19 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1B2
; Address: $CD9CBB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1B2:
	JSL $072206		  ; 22 06 22 07 | Jump to subroutine long
	AND ($08,X)		  ; 21 08 | Logical AND with accumulator ((zero page,X))
	AND ($09,X)		  ; 21 09 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1B5
; Address: $CD9CCB
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1B5:
	JSR $1F0D			; 20 0D 1F | Jump to subroutine
	ASL $0E1F			; 0E 1F 0E | Arithmetic shift left (absolute)
	ASL $1E10,X		  ; 1E 10 1E | Arithmetic shift left (absolute,X)
	ORA ($1E),Y		  ; 11 1E | Logical OR with accumulator ((zero page),Y)
	ORA ($1D),Y		  ; 11 1D | Logical OR with accumulator ((zero page),Y)
	ORA $1C13,X		  ; 1D 13 1C | Logical OR with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $1917,Y		  ; 19 17 19 | Logical OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	ORA ($23,X)		  ; 01 23 | Logical OR with accumulator ((zero page,X))
	ORA $23			  ; 05 23 | Logical OR with accumulator (zero page)
	ASL $23			  ; 06 23 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1B7
; Address: $CD9D03
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1B7:
	JSL $0B220A		  ; 22 0A 22 0B | Jump to subroutine long
	AND ($0C,X)		  ; 21 0C | Logical AND with accumulator ((zero page,X))
	AND ($0C,X)		  ; 21 0C | Logical AND with accumulator ((zero page,X))
	AND ($0D,X)		  ; 21 0D | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1B9
; Address: $CD9D11
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1B9:
	JSR $1F10			; 20 10 1F | Jump to subroutine
	BPL $1F			  ; 10 1F | Branch if positive
	ORA ($1E),Y		  ; 11 1E | Logical OR with accumulator ((zero page),Y)
	ASL $1D13,X		  ; 1E 13 1D | Arithmetic shift left (absolute,X)
	ORA $1C14,X		  ; 1D 14 1C | Logical OR with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $00			  ; 24 00 | Test bits in accumulator (zero page)
	BIT $01			  ; 24 01 | Test bits in accumulator (zero page)
	BIT $02			  ; 24 02 | Test bits in accumulator (zero page)
	BIT $03			  ; 24 03 | Test bits in accumulator (zero page)
	BIT $04			  ; 24 04 | Test bits in accumulator (zero page)
	BIT $05			  ; 24 05 | Test bits in accumulator (zero page)
	BIT $06			  ; 24 06 | Test bits in accumulator (zero page)
	BIT $07			  ; 24 07 | Test bits in accumulator (zero page)
	BIT $08			  ; 24 08 | Test bits in accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$23			 ; 09 23 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1BB
; Address: $CD9D4B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1BB:
	JSL $0E210E		  ; 22 0E 21 0E | Jump to subroutine long
	AND ($0F,X)		  ; 21 0F | Logical AND with accumulator ((zero page,X))
	AND ($10,X)		  ; 21 10 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1BC
; Address: $CD9D53
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1BC:
	JSR $2011			; 20 11 20 | Jump to subroutine
	ASL $1E14,X		  ; 1E 14 1E | Arithmetic shift left (absolute,X)
	ORA $1D16,X		  ; 1D 16 1D | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1BD
; Address: $CD9D66
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1BD:
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	ORA $0025,Y		  ; 19 25 00 | Logical OR with accumulator (absolute,Y)
	AND $00			  ; 25 00 | Logical AND with accumulator (zero page)
	AND $01			  ; 25 01 | Logical AND with accumulator (zero page)
	AND $02			  ; 25 02 | Logical AND with accumulator (zero page)
	AND $03			  ; 25 03 | Logical AND with accumulator (zero page)
	AND $04			  ; 25 04 | Logical AND with accumulator (zero page)
	AND $05			  ; 25 05 | Logical AND with accumulator (zero page)
	AND $06			  ; 25 06 | Logical AND with accumulator (zero page)
	AND $07			  ; 25 07 | Logical AND with accumulator (zero page)
	AND $08			  ; 25 08 | Logical AND with accumulator (zero page)
	BIT $09			  ; 24 09 | Test bits in accumulator (zero page)
	BIT $0A			  ; 24 0A | Test bits in accumulator (zero page)
	BIT $0B			  ; 24 0B | Test bits in accumulator (zero page)
	BIT $0B			  ; 24 0B | Test bits in accumulator (zero page)
	ORA $0E23			; 0D 23 0E | Logical OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1BE
; Address: $CD9D8D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1BE:
	JSL $10220F		  ; 22 0F 22 10 | Jump to subroutine long
	AND ($11,X)		  ; 21 11 | Logical AND with accumulator ((zero page,X))
	AND ($11,X)		  ; 21 11 | Logical AND with accumulator ((zero page,X))
	AND ($12,X)		  ; 21 12 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1BF
; Address: $CD9D97
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1BF:
	JSR $2013			; 20 13 20 | Jump to subroutine
	ASL $1D16,X		  ; 1E 16 1D | Arithmetic shift left (absolute,X)
	ORA $1C18,X		  ; 1D 18 1C | Logical OR with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA $1A1B,Y		  ; 19 1B 1A | Logical OR with accumulator (absolute,Y)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $00			  ; 26 00 | Rotate left (zero page)
	ROL $01			  ; 26 01 | Rotate left (zero page)
	ROL $02			  ; 26 02 | Rotate left (zero page)
	ROL $03			  ; 26 03 | Rotate left (zero page)
	ROL $04			  ; 26 04 | Rotate left (zero page)
	ROL $05			  ; 26 05 | Rotate left (zero page)
	ROL $06			  ; 26 06 | Rotate left (zero page)
	ROL $07			  ; 26 07 | Rotate left (zero page)
	ROL $08			  ; 26 08 | Rotate left (zero page)
	AND $09			  ; 25 09 | Logical AND with accumulator (zero page)
	AND $0A			  ; 25 0A | Logical AND with accumulator (zero page)
	AND $0B			  ; 25 0B | Logical AND with accumulator (zero page)
	AND $0C			  ; 25 0C | Logical AND with accumulator (zero page)
	BIT $0D			  ; 24 0D | Test bits in accumulator (zero page)
	BIT $0E			  ; 24 0E | Test bits in accumulator (zero page)
	BIT $0E			  ; 24 0E | Test bits in accumulator (zero page)
	BPL $22			  ; 10 22 | Branch if positive
	ORA ($22),Y		  ; 11 22 | Logical OR with accumulator ((zero page),Y)
	AND ($13,X)		  ; 21 13 | Logical AND with accumulator ((zero page,X))
	AND ($14,X)		  ; 21 14 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1C1
; Address: $CD9DE4
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1C1:
	CLC				  ; 18 | Clear carry flag
	ORA $1C19,X		  ; 1D 19 1C | Logical OR with accumulator (absolute,X)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA ($27,X)		  ; 01 27 | Logical OR with accumulator ((zero page,X))
	ORA $27			  ; 05 27 | Logical OR with accumulator (zero page)
	ASL $27			  ; 06 27 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROL $09			  ; 26 09 | Rotate left (zero page)
	ROL $0A			  ; 26 0A | Rotate left (zero page)
	ROL $0B			  ; 26 0B | Rotate left (zero page)
	AND $0C			  ; 25 0C | Logical AND with accumulator (zero page)
	AND $0D			  ; 25 0D | Logical AND with accumulator (zero page)
	AND $0E			  ; 25 0E | Logical AND with accumulator (zero page)
	BIT $0F			  ; 24 0F | Test bits in accumulator (zero page)
	BIT $10			  ; 24 10 | Test bits in accumulator (zero page)
	BIT $11			  ; 24 11 | Test bits in accumulator (zero page)
	ORA ($23),Y		  ; 11 23 | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1C2
; Address: $CD9E15
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1C2:
	JSL $142213		  ; 22 13 22 14 | Jump to subroutine long
	AND ($15,X)		  ; 21 15 | Logical AND with accumulator ((zero page,X))
	AND ($16,X)		  ; 21 16 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1C3
; Address: $CD9E1D
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1C3:
	JSR $2017			; 20 17 20 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	ASL $1E19,X		  ; 1E 19 1E | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $1C1A,X		  ; 1D 1A 1C | Logical OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA ($28,X)		  ; 01 28 | Logical OR with accumulator ((zero page,X))
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA $28			  ; 05 28 | Logical OR with accumulator (zero page)
	ASL $28			  ; 06 28 | Arithmetic shift left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$27			 ; 09 27 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $0C			  ; 26 0C | Rotate left (zero page)
	ROL $0D			  ; 26 0D | Rotate left (zero page)
	ROL $0E			  ; 26 0E | Rotate left (zero page)
	AND $0F			  ; 25 0F | Logical AND with accumulator (zero page)
	AND $10			  ; 25 10 | Logical AND with accumulator (zero page)
	AND $11			  ; 25 11 | Logical AND with accumulator (zero page)
	BIT $12			  ; 24 12 | Test bits in accumulator (zero page)
	BIT $13			  ; 24 13 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1C6
; Address: $CD9E62
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1C6:
	ORA $1A1F,Y		  ; 19 1F 1A | Logical OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	ASL $1D1B,X		  ; 1E 1B 1D | Arithmetic shift left (absolute,X)
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	AND #$03			 ; 29 03 | Logical AND with accumulator (immediate)
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	AND #$05			 ; 29 05 | Logical AND with accumulator (immediate)
	AND #$06			 ; 29 06 | Logical AND with accumulator (immediate)
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ORA #$28			 ; 09 28 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA $0E27			; 0D 27 0E | Logical OR with accumulator (absolute)
	ROL $10			  ; 26 10 | Rotate left (zero page)
	ROL $11			  ; 26 11 | Rotate left (zero page)
	AND $11			  ; 25 11 | Logical AND with accumulator (zero page)
	AND $12			  ; 25 12 | Logical AND with accumulator (zero page)
	AND $13			  ; 25 13 | Logical AND with accumulator (zero page)
	BIT $14			  ; 24 14 | Test bits in accumulator (zero page)
	BIT $15			  ; 24 15 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1C7
; Address: $CD9E9B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1C7:
	JSL $182217		  ; 22 17 22 18 | Jump to subroutine long
	AND ($19,X)		  ; 21 19 | Logical AND with accumulator ((zero page,X))
	AND ($19,X)		  ; 21 19 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1C8
; Address: $CD9EA3
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1C8:
	JSR $1F1A			; 20 1A 1F | Jump to subroutine
	ASL $2A1C,X		  ; 1E 1C 2A | Arithmetic shift left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA ($2A,X)		  ; 01 2A | Logical OR with accumulator ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $2A			  ; 05 2A | Logical OR with accumulator (zero page)
	ASL $2A			  ; 06 2A | Arithmetic shift left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	AND #$09			 ; 29 09 | Logical AND with accumulator (immediate)
	AND #$0A			 ; 29 0A | Logical AND with accumulator (immediate)
	AND #$0B			 ; 29 0B | Logical AND with accumulator (immediate)
	AND #$0C			 ; 29 0C | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ORA $0E28			; 0D 28 0E | Logical OR with accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	BPL $27			  ; 10 27 | Branch if positive
	ORA ($26),Y		  ; 11 26 | Logical OR with accumulator ((zero page),Y)
	ROL $13			  ; 26 13 | Rotate left (zero page)
	AND $14			  ; 25 14 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1C9
; Address: $CD9ED5
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1C9:
	AND $15			  ; 25 15 | Logical AND with accumulator (zero page)
	BIT $16			  ; 24 16 | Test bits in accumulator (zero page)
	BIT $17			  ; 24 17 | Test bits in accumulator (zero page)
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1CB
; Address: $CD9EE5
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1CB:
	JSR $1F1C			; 20 1C 1F | Jump to subroutine
	ORA $002B,X		  ; 1D 2B 00 | Logical OR with accumulator (absolute,X)
	ORA ($2B,X)		  ; 01 2B | Logical OR with accumulator ((zero page,X))
	ORA $2B			  ; 05 2B | Logical OR with accumulator (zero page)
	ASL $2B			  ; 06 2B | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROL				  ; 2A | Rotate left (accumulator)
	ORA #$2A			 ; 09 2A | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$0D			 ; 29 0D | Logical AND with accumulator (immediate)
	AND #$0E			 ; 29 0E | Logical AND with accumulator (immediate)
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	BPL $28			  ; 10 28 | Branch if positive
	ORA ($27),Y		  ; 11 27 | Logical OR with accumulator ((zero page),Y)
	ROL $14			  ; 26 14 | Rotate left (zero page)
	ROL $15			  ; 26 15 | Rotate left (zero page)
	AND $16			  ; 25 16 | Logical AND with accumulator (zero page)
	AND $17			  ; 25 17 | Logical AND with accumulator (zero page)
	BIT $18			  ; 24 18 | Test bits in accumulator (zero page)
	ORA $1A23,Y		  ; 19 23 1A | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1CD
; Address: $CD9F27
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1CD:
	JSR $1F1D			; 20 1D 1F | Jump to subroutine
	ASL $002C,X		  ; 1E 2C 00 | Arithmetic shift left (absolute,X)
	BIT $2C01			; 2C 01 2C | Test bits in accumulator (absolute)
	BIT $2C03			; 2C 03 2C | Test bits in accumulator (absolute)
	BIT $2C05			; 2C 05 2C | Test bits in accumulator (absolute)
	ASL $2C			  ; 06 2C | Arithmetic shift left (zero page)
	BIT $2B08			; 2C 08 2B | Test bits in accumulator (absolute)
	ORA #$2B			 ; 09 2B | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0E2A			; 0D 2A 0E | Logical OR with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	AND #$11			 ; 29 11 | Logical AND with accumulator (immediate)
	AND #$12			 ; 29 12 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $17			  ; 26 17 | Rotate left (zero page)
	ROL $18			  ; 26 18 | Rotate left (zero page)
	AND $19			  ; 25 19 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1D0
; Address: $CD9F69
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1D0:
	JSR $2D1F			; 20 1F 2D | Jump to subroutine
	AND $2D01			; 2D 01 2D | Logical AND with accumulator (absolute)
	AND $2D03			; 2D 03 2D | Logical AND with accumulator (absolute)
	AND $2D05			; 2D 05 2D | Logical AND with accumulator (absolute)
	ASL $2D			  ; 06 2D | Arithmetic shift left (zero page)
	AND $2C08			; 2D 08 2C | Logical AND with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BIT $2C0B			; 2C 0B 2C | Test bits in accumulator (absolute)
	BIT $2B0D			; 2C 0D 2B | Test bits in accumulator (absolute)
	ASL $0F2B			; 0E 2B 0F | Arithmetic shift left (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	BPL $2A			  ; 10 2A | Branch if positive
	ORA ($2A),Y		  ; 11 2A | Logical OR with accumulator ((zero page),Y)
	AND #$13			 ; 29 13 | Logical AND with accumulator (immediate)
	AND #$14			 ; 29 14 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL $18			  ; 26 18 | Rotate left (zero page)
	ROL $19			  ; 26 19 | Rotate left (zero page)
	AND $1A			  ; 25 1A | Logical AND with accumulator (zero page)
	BIT $1B			  ; 24 1B | Test bits in accumulator (zero page)
	BIT $1C			  ; 24 1C | Test bits in accumulator (zero page)
	ORA $1E22,X		  ; 1D 22 1E | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1D1
; Address: $CD9FA7
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1D1:
	JSL $1F211E		  ; 22 1E 21 1F | Jump to subroutine long
	ROL $2E00			; 2E 00 2E | Rotate left (absolute)
	ORA ($2E,X)		  ; 01 2E | Logical OR with accumulator ((zero page,X))
	ROL $2E03			; 2E 03 2E | Rotate left (absolute)
	ROL $2E05			; 2E 05 2E | Rotate left (absolute)
	ASL $2E			  ; 06 2E | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ROL $2D09			; 2E 09 2D | Rotate left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $2D0B			; 2D 0B 2D | Logical AND with accumulator (absolute)
	BIT $2C0D			; 2C 0D 2C | Test bits in accumulator (absolute)
	ASL $0F2C			; 0E 2C 0F | Arithmetic shift left (absolute)
	BPL $2B			  ; 10 2B | Branch if positive
	ORA ($2A),Y		  ; 11 2A | Logical OR with accumulator ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$15			 ; 29 15 | Logical AND with accumulator (immediate)
	AND #$16			 ; 29 16 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	ORA $1A27,Y		  ; 19 27 1A | Logical OR with accumulator (absolute,Y)
	ROL $1B			  ; 26 1B | Rotate left (zero page)
	AND $1B			  ; 25 1B | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1D2
; Address: $CD9FE1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1D2:
	AND $1C			  ; 25 1C | Logical AND with accumulator (zero page)
	BIT $1D			  ; 24 1D | Test bits in accumulator (zero page)
	ASL $1F22,X		  ; 1E 22 1F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1D3
; Address: $CD9FE9
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1D3:
	JSL $002F20		  ; 22 20 2F 00 | Jump to subroutine long
	ORA ($2F,X)		  ; 01 2F | Logical OR with accumulator ((zero page,X))
	ORA $2F			  ; 05 2F | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$2E			 ; 09 2E | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROL $2E0B			; 2E 0B 2E | Rotate left (absolute)
	AND $2D0D			; 2D 0D 2D | Logical AND with accumulator (absolute)
	AND $2C10			; 2D 10 2C | Logical AND with accumulator (absolute)
	ORA ($2C),Y		  ; 11 2C | Logical OR with accumulator ((zero page),Y)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$17			 ; 29 17 | Logical AND with accumulator (immediate)
	AND #$18			 ; 29 18 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ORA $1A27,Y		  ; 19 27 1A | Logical OR with accumulator (absolute,Y)
	ROL $1C			  ; 26 1C | Rotate left (zero page)
	AND $1D			  ; 25 1D | Logical AND with accumulator (zero page)
	AND $1E			  ; 25 1E | Logical AND with accumulator (zero page)
	BIT $1F			  ; 24 1F | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1D4
; Address: $CDA028
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1D4:
	JSR $2122			; 20 22 21 | PPU graphics register access
	BMI $00			  ; 30 00 | Branch if negative
	BMI $01			  ; 30 01 | Branch if negative
	BMI $02			  ; 30 02 | Branch if negative
	BMI $03			  ; 30 03 | Branch if negative
	BMI $04			  ; 30 04 | Branch if negative
	BMI $05			  ; 30 05 | Branch if negative
	BMI $07			  ; 30 07 | Branch if negative
	BMI $08			  ; 30 08 | Branch if negative
	BMI $09			  ; 30 09 | Branch if negative
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0E2E			; 0D 2E 0E | Logical OR with accumulator (absolute)
	ROL $2E0F			; 2E 0F 2E | Rotate left (absolute)
	BPL $2D			  ; 10 2D | Branch if positive
	ORA ($2D),Y		  ; 11 2D | Logical OR with accumulator ((zero page),Y)
	BIT $2C13			; 2C 13 2C | Test bits in accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	CLC				  ; 18 | Clear carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $1A29,Y		  ; 19 29 1A | Logical OR with accumulator (absolute,Y)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA $1E26,X		  ; 1D 26 1E | Logical OR with accumulator (absolute,X)
	AND $1F			  ; 25 1F | Logical AND with accumulator (zero page)
	AND $20			  ; 25 20 | Logical AND with accumulator (zero page)
	BIT $20			  ; 24 20 | Test bits in accumulator (zero page)
	AND ($31,X)		  ; 21 31 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1D5
; Address: $CDA06D
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1D5:
	AND ($01),Y		  ; 31 01 | Logical AND with accumulator ((zero page),Y)
	AND ($02),Y		  ; 31 02 | Logical AND with accumulator ((zero page),Y)
	AND ($03),Y		  ; 31 03 | Logical AND with accumulator ((zero page),Y)
	AND ($04),Y		  ; 31 04 | Logical AND with accumulator ((zero page),Y)
	AND ($06),Y		  ; 31 06 | Logical AND with accumulator ((zero page),Y)
	AND ($07),Y		  ; 31 07 | Logical AND with accumulator ((zero page),Y)
	AND ($08),Y		  ; 31 08 | Logical AND with accumulator ((zero page),Y)
	AND ($09),Y		  ; 31 09 | Logical AND with accumulator ((zero page),Y)
	BMI $0A			  ; 30 0A | Branch if negative
	BMI $0C			  ; 30 0C | Branch if negative
	BMI $0D			  ; 30 0D | Branch if negative
	ASL $0F2F			; 0E 2F 0F | Arithmetic shift left (absolute)
	BPL $2E			  ; 10 2E | Branch if positive
	ORA ($2E),Y		  ; 11 2E | Logical OR with accumulator ((zero page),Y)
	AND $2D14			; 2D 14 2D | Logical AND with accumulator (absolute)
	BIT $2C16			; 2C 16 2C | Test bits in accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $1A2A,Y		  ; 19 2A 1A | Logical OR with accumulator (absolute,Y)
	AND #$1B			 ; 29 1B | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	ORA $1E27,X		  ; 1D 27 1E | Logical OR with accumulator (absolute,X)
	ROL $1F			  ; 26 1F | Rotate left (zero page)
	AND $20			  ; 25 20 | Logical AND with accumulator (zero page)
	AND $21			  ; 25 21 | PPU graphics register access
	BIT $22			  ; 24 22 | Test bits in accumulator (zero page)
	ORA ($32,X)		  ; 01 32 | Logical OR with accumulator ((zero page,X))
	ASL $32			  ; 06 32 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$31			 ; 09 31 | Logical OR with accumulator (immediate)
	AND ($0C),Y		  ; 31 0C | Logical AND with accumulator ((zero page),Y)
	AND ($0D),Y		  ; 31 0D | Logical AND with accumulator ((zero page),Y)
	BMI $0E			  ; 30 0E | Branch if negative
	BMI $0F			  ; 30 0F | Branch if negative
	BMI $11			  ; 30 11 | Branch if negative
	ROL $2E14			; 2E 14 2E | Rotate left (absolute)
	AND $2C16			; 2D 16 2C | Logical AND with accumulator (absolute)
	CLC				  ; 18 | Clear carry flag
	BIT $2B19			; 2C 19 2B | Test bits in accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	AND #$1D			 ; 29 1D | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ASL $1F28,X		  ; 1E 28 1F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1D6
; Address: $CDA0E4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1D6:
	JSR $2126			; 20 26 21 | PPU graphics register access
	AND $22			  ; 25 22 | Logical AND with accumulator (zero page)
	BIT $23			  ; 24 23 | Test bits in accumulator (zero page)
	ORA ($33,X)		  ; 01 33 | Logical OR with accumulator ((zero page,X))
	ORA $33			  ; 05 33 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1D7
; Address: $CDA0F6
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1D7:
	ASL $33			  ; 06 33 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0F31			; 0D 31 0F | Logical OR with accumulator (absolute)
	AND ($10),Y		  ; 31 10 | Logical AND with accumulator ((zero page),Y)
	BMI $11			  ; 30 11 | Branch if negative
	BMI $12			  ; 30 12 | Branch if negative
	BMI $13			  ; 30 13 | Branch if negative
	ROL $2D17			; 2E 17 2D | Rotate left (absolute)
	CLC				  ; 18 | Clear carry flag
	AND $2C19			; 2D 19 2C | Logical AND with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	ROL				  ; 2A | Rotate left (accumulator)
	ORA $1E29,X		  ; 1D 29 1E | Logical OR with accumulator (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1D8
; Address: $CDA124
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1D8:
	JSR $2127			; 20 27 21 | PPU graphics register access
	ROL $22			  ; 26 22 | Rotate left (zero page)
	AND $23			  ; 25 23 | Logical AND with accumulator (zero page)
	ORA ($34,X)		  ; 01 34 | Logical OR with accumulator ((zero page,X))
	ORA $34			  ; 05 34 | Logical OR with accumulator (zero page)
	ASL $34			  ; 06 34 | Arithmetic shift left (zero page)
	ORA #$33			 ; 09 33 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0F32			; 0E 32 0F | Arithmetic shift left (absolute)
	BPL $31			  ; 10 31 | Branch if positive
	ORA ($31),Y		  ; 11 31 | Logical OR with accumulator ((zero page),Y)
	BMI $14			  ; 30 14 | Branch if negative
	BMI $15			  ; 30 15 | Branch if negative
	ROL $2E18			; 2E 18 2E | Rotate left (absolute)
	INC				  ; 1A | Increment accumulator
	AND $2C1B			; 2D 1B 2C | Logical AND with accumulator (absolute)
	BIT $2B1D			; 2C 1D 2B | Test bits in accumulator (absolute)
	ASL $1F2A,X		  ; 1E 2A 1F | Arithmetic shift left (absolute,X)
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	AND ($28,X)		  ; 21 28 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1D9
; Address: $CDA166
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1D9:
	JSL $262327		  ; 22 27 23 26 | Jump to subroutine long
	BIT $35			  ; 24 35 | Test bits in accumulator (zero page)
	ORA ($35,X)		  ; 01 35 | Logical OR with accumulator ((zero page,X))
	ORA $35			  ; 05 35 | Logical OR with accumulator (zero page)
	ASL $35			  ; 06 35 | Arithmetic shift left (zero page)
	ORA #$34			 ; 09 34 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0E34			; 0D 34 0E | Logical OR with accumulator (absolute)
	BPL $32			  ; 10 32 | Branch if positive
	AND ($14),Y		  ; 31 14 | Logical AND with accumulator ((zero page),Y)
	AND ($15),Y		  ; 31 15 | Logical AND with accumulator ((zero page),Y)
	BMI $17			  ; 30 17 | Branch if negative
	BMI $18			  ; 30 18 | Branch if negative

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1DA
; Address: $CDA194
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1DA:
	ORA $1A2E,Y		  ; 19 2E 1A | Logical OR with accumulator (absolute,Y)
	ROL $2D1B			; 2E 1B 2D | Rotate left (absolute)
	BIT $2C1E			; 2C 1E 2C | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1DB
; Address: $CDA1A0
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1DB:
	JSR $212A			; 20 2A 21 | PPU graphics register access
	AND #$22			 ; 29 22 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	PLP				  ; 28 | Pull processor status from stack
	BIT $27			  ; 24 27 | Test bits in accumulator (zero page)
	AND $36			  ; 25 36 | Logical AND with accumulator (zero page)
	ORA ($36,X)		  ; 01 36 | Logical OR with accumulator ((zero page,X))
	ORA $36			  ; 05 36 | Logical OR with accumulator (zero page)
	ASL $36			  ; 06 36 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$35			 ; 09 35 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0E35			; 0D 35 0E | Logical OR with accumulator (absolute)
	ORA ($33),Y		  ; 11 33 | Logical OR with accumulator ((zero page),Y)
	AND ($17),Y		  ; 31 17 | Logical AND with accumulator ((zero page),Y)
	AND ($18),Y		  ; 31 18 | Logical AND with accumulator ((zero page),Y)
	BMI $19			  ; 30 19 | Branch if negative
	ROL $2D1D			; 2E 1D 2D | Rotate left (absolute)
	ASL $1F2C,X		  ; 1E 2C 1F | Arithmetic shift left (absolute,X)
	BIT $2B20			; 2C 20 2B | Test bits in accumulator (absolute)
	AND ($2A,X)		  ; 21 2A | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1DC
; Address: $CDA1E4
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1DC:
	JSL $282329		  ; 22 29 23 28 | Jump to subroutine long
	BIT $27			  ; 24 27 | Test bits in accumulator (zero page)
	AND $37			  ; 25 37 | Logical AND with accumulator (zero page)
	ORA ($37,X)		  ; 01 37 | Logical OR with accumulator ((zero page,X))
	ORA $37			  ; 05 37 | Logical OR with accumulator (zero page)
	ASL $37			  ; 06 37 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$36			 ; 09 36 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0E35			; 0D 35 0E | Logical OR with accumulator (absolute)
	BPL $35			  ; 10 35 | Branch if positive
	ORA ($34),Y		  ; 11 34 | Logical OR with accumulator ((zero page),Y)
	ORA $1A31,Y		  ; 19 31 1A | Logical OR with accumulator (absolute,Y)
	BMI $1B			  ; 30 1B | Branch if negative
	BMI $1C			  ; 30 1C | Branch if negative
	ORA $1F2E,X		  ; 1D 2E 1F | Logical OR with accumulator (absolute,X)
	AND $2C20			; 2D 20 2C | Logical AND with accumulator (absolute)
	AND ($2C,X)		  ; 21 2C | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1DD
; Address: $CDA222
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1DD:
	JSL $2A232B		  ; 22 2B 23 2A | Jump to subroutine long
	BIT $29			  ; 24 29 | Test bits in accumulator (zero page)
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	ROL $38			  ; 26 38 | Rotate left (zero page)
	SEC				  ; 38 | Set carry flag
	ORA ($38,X)		  ; 01 38 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1DE
; Address: $CDA234
; Size: 69 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1DE:
	ORA $38			  ; 05 38 | Logical OR with accumulator (zero page)
	ASL $38			  ; 06 38 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEC				  ; 38 | Set carry flag
	ORA #$37			 ; 09 37 | Logical OR with accumulator (immediate)
	ORA $0F36			; 0D 36 0F | Logical OR with accumulator (absolute)
	BPL $36			  ; 10 36 | Branch if positive
	ORA ($35),Y		  ; 11 35 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA $1A32,Y		  ; 19 32 1A | Logical OR with accumulator (absolute,Y)
	AND ($1C),Y		  ; 31 1C | Logical AND with accumulator ((zero page),Y)
	BMI $1D			  ; 30 1D | Branch if negative
	BMI $1E			  ; 30 1E | Branch if negative
	ROL $2D20			; 2E 20 2D | Rotate left (absolute)
	AND ($2C,X)		  ; 21 2C | Logical AND with accumulator ((zero page,X))
	BIT $2B24			; 2C 24 2B | Test bits in accumulator (absolute)
	AND $2A			  ; 25 2A | Logical AND with accumulator (zero page)
	ROL $29			  ; 26 29 | Rotate left (zero page)
	AND $3900,Y		  ; 39 00 39 | Logical AND with accumulator (absolute,Y)
	ORA ($39,X)		  ; 01 39 | Logical OR with accumulator ((zero page,X))
	AND $3904,Y		  ; 39 04 39 | Logical AND with accumulator (absolute,Y)
	ORA $39			  ; 05 39 | Logical OR with accumulator (zero page)
	AND $3908,Y		  ; 39 08 39 | Logical AND with accumulator (absolute,Y)
	ORA #$38			 ; 09 38 | Logical OR with accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	SEC				  ; 38 | Set carry flag
	ASL $0F37			; 0E 37 0F | Arithmetic shift left (absolute)
	BPL $37			  ; 10 37 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	AND ($1D),Y		  ; 31 1D | Logical AND with accumulator ((zero page),Y)
	AND ($1F),Y		  ; 31 1F | Logical AND with accumulator ((zero page),Y)
	BMI $20			  ; 30 20 | Branch if negative
	AND ($2E,X)		  ; 21 2E | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1DF
; Address: $CDA2A0
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1DF:
	JSL $2C232D		  ; 22 2D 23 2C | Jump to subroutine long
	BIT $2B			  ; 24 2B | Test bits in accumulator (zero page)
	AND $2A			  ; 25 2A | Logical AND with accumulator (zero page)
	ROL $2A			  ; 26 2A | Rotate left (zero page)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ORA ($3A,X)		  ; 01 3A | Logical OR with accumulator ((zero page,X))
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ORA $3A			  ; 05 3A | Logical OR with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	PHP				  ; 08 | Push processor status to stack
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $390B,Y		  ; 39 0B 39 | Logical AND with accumulator (absolute,Y)
	AND $380E,Y		  ; 39 0E 38 | Logical AND with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1E0
; Address: $CDA2C3
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1E0:
	SEC				  ; 38 | Set carry flag
	ORA ($38),Y		  ; 11 38 | Logical OR with accumulator ((zero page),Y)
	ORA $1A34,Y		  ; 19 34 1A | Logical OR with accumulator (absolute,Y)
	ORA $1E32,X		  ; 1D 32 1E | Logical OR with accumulator (absolute,X)
	AND ($1F),Y		  ; 31 1F | Logical AND with accumulator ((zero page),Y)
	AND ($20),Y		  ; 31 20 | Logical AND with accumulator ((zero page),Y)
	BMI $21			  ; 30 21 | PPU graphics register access
	ROL $2D24			; 2E 24 2D | Rotate left (absolute)
	AND $2C			  ; 25 2C | Logical AND with accumulator (zero page)
	ROL $2B			  ; 26 2B | Rotate left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	PLP				  ; 28 | Pull processor status from stack
	ORA ($3B,X)		  ; 01 3B | Logical OR with accumulator ((zero page,X))
	ORA $3B			  ; 05 3B | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ORA $0E3A			; 0D 3A 0E | Logical OR with accumulator (absolute)
	AND $3910,Y		  ; 39 10 39 | Logical AND with accumulator (absolute,Y)
	ORA ($38),Y		  ; 11 38 | Logical OR with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	ORA $1A35,Y		  ; 19 35 1A | Logical OR with accumulator (absolute,Y)
	ORA $1E33,X		  ; 1D 33 1E | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1E1
; Address: $CDA31A
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1E1:
	JSR $2131			; 20 31 21 | PPU graphics register access
	AND ($22),Y		  ; 31 22 | Logical AND with accumulator ((zero page),Y)
	BMI $23			  ; 30 23 | Branch if negative
	BIT $2E			  ; 24 2E | Test bits in accumulator (zero page)
	ROL $2D			  ; 26 2D | Rotate left (zero page)
	BIT $2B28			; 2C 28 2B | Test bits in accumulator (absolute)
	AND #$3C			 ; 29 3C | Logical AND with accumulator (immediate)
	ORA ($3C,X)		  ; 01 3C | Logical OR with accumulator ((zero page,X))
	ORA $3C			  ; 05 3C | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0E3B			; 0D 3B 0E | Logical OR with accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	BPL $3A			  ; 10 3A | Branch if positive
	ORA ($39),Y		  ; 11 39 | Logical OR with accumulator ((zero page),Y)
	AND $3814,Y		  ; 39 14 38 | Logical AND with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	ASL $1F34,X		  ; 1E 34 1F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1E2
; Address: $CDA35A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1E2:
	JSR $2132			; 20 32 21 | PPU graphics register access
	AND ($23),Y		  ; 31 23 | Logical AND with accumulator ((zero page),Y)
	BMI $24			  ; 30 24 | Branch if negative
	BMI $25			  ; 30 25 | Branch if negative
	ROL $2E			  ; 26 2E | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1E3
; Address: $CDA367
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1E3:
	AND $2C28			; 2D 28 2C | Logical AND with accumulator (absolute)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $3D00,X		  ; 3D 00 3D | Logical AND with accumulator (absolute,X)
	ORA ($3D,X)		  ; 01 3D | Logical OR with accumulator ((zero page,X))
	AND $3D04,X		  ; 3D 04 3D | Logical AND with accumulator (absolute,X)
	ASL $3D			  ; 06 3D | Arithmetic shift left (zero page)
	AND $3D09,X		  ; 3D 09 3D | Logical AND with accumulator (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0F3C			; 0D 3C 0F | Logical OR with accumulator (absolute)
	BPL $3B			  ; 10 3B | Branch if positive
	ORA ($3A),Y		  ; 11 3A | Logical OR with accumulator ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	AND $3916,Y		  ; 39 16 39 | Logical AND with accumulator (absolute,Y)
	SEC				  ; 38 | Set carry flag
	ORA $1A38,Y		  ; 19 38 1A | Logical OR with accumulator (absolute,Y)
	ORA $1E35,X		  ; 1D 35 1E | Logical OR with accumulator (absolute,X)
	AND ($33,X)		  ; 21 33 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1E4
; Address: $CDA39C
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1E4:
	JSL $312332		  ; 22 32 23 31 | Jump to subroutine long
	BIT $30			  ; 24 30 | Test bits in accumulator (zero page)
	ROL $2F			  ; 26 2F | Rotate left (zero page)
	ROL $2D28			; 2E 28 2D | Rotate left (absolute)
	AND #$2C			 ; 29 2C | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $3E00,X		  ; 3E 00 3E | Rotate left (absolute,X)
	ORA ($3E,X)		  ; 01 3E | Logical OR with accumulator ((zero page,X))
	ROL $3E04,X		  ; 3E 04 3E | Rotate left (absolute,X)
	ASL $3E			  ; 06 3E | Arithmetic shift left (zero page)
	ROL $3E09,X		  ; 3E 09 3E | Rotate left (absolute,X)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $3D0C,X		  ; 3D 0C 3D | Logical AND with accumulator (absolute,X)
	ORA $0F3D			; 0D 3D 0F | Logical OR with accumulator (absolute)
	BPL $3C			  ; 10 3C | Branch if positive
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	CLC				  ; 18 | Clear carry flag
	AND $3819,Y		  ; 39 19 38 | Logical AND with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	SEC				  ; 38 | Set carry flag
	ORA $1F36,X		  ; 1D 36 1F | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1E5
; Address: $CDA3D8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1E5:
	JSR $2135			; 20 35 21 | PPU graphics register access
	BIT $32			  ; 24 32 | Test bits in accumulator (zero page)
	AND $31			  ; 25 31 | Logical AND with accumulator (zero page)
	ROL $30			  ; 26 30 | Rotate left (zero page)
	AND #$2E			 ; 29 2E | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $3F2B			; 2D 2B 3F | Logical AND with accumulator (absolute)
	ORA ($3F,X)		  ; 01 3F | Logical OR with accumulator ((zero page,X))
	ASL $3F			  ; 06 3F | Arithmetic shift left (zero page)
	ORA #$3F			 ; 09 3F | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1E6
; Address: $CDA3FB
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1E6:
	ROL $3E0C,X		  ; 3E 0C 3E | Rotate left (absolute,X)
	ASL $0F3E			; 0E 3E 0F | Arithmetic shift left (absolute)
	AND $3D11,X		  ; 3D 11 3D | Logical AND with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	DEC				  ; 3A | Decrement accumulator
	ORA $1B39,Y		  ; 19 39 1B | Logical OR with accumulator (absolute,Y)
	AND $381C,Y		  ; 39 1C 38 | Logical AND with accumulator (absolute,Y)
	ASL $1F37,X		  ; 1E 37 1F | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1E7
; Address: $CDA418
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1E7:
	JSR $2236			; 20 36 22 | Jump to subroutine
	BIT $33			  ; 24 33 | Test bits in accumulator (zero page)
	ROL $32			  ; 26 32 | Rotate left (zero page)
	AND ($28),Y		  ; 31 28 | Logical AND with accumulator ((zero page),Y)
	BMI $29			  ; 30 29 | Branch if negative
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $402C			; 2E 2C 40 | Rotate left (absolute)
	RTI				  ; 40 | Return from interrupt
	ORA ($40,X)		  ; 01 40 | Logical OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $40			  ; 06 40 | Arithmetic shift left (zero page)
	RTI				  ; 40 | Return from interrupt
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	ASL $0F3F			; 0E 3F 0F | Arithmetic shift left (absolute)
	ROL $3E11,X		  ; 3E 11 3E | Rotate left (absolute,X)
	AND $3D14,X		  ; 3D 14 3D | Logical AND with accumulator (absolute,X)
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	ORA $1E39,X		  ; 1D 39 1E | Logical OR with accumulator (absolute,X)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1E9
; Address: $CDA45A
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1E9:
	JSL $352436		  ; 22 36 24 35 | Jump to subroutine long
	AND $34			  ; 25 34 | Logical AND with accumulator (zero page)
	ROL $33			  ; 26 33 | Rotate left (zero page)
	AND #$31			 ; 29 31 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	BMI $2B			  ; 30 2B | Branch if negative
	BIT $0041			; 2C 41 00 | Test bits in accumulator (absolute)
	EOR ($01,X)		  ; 41 01 | Exclusive OR with accumulator ((zero page,X))
	EOR ($03,X)		  ; 41 03 | Exclusive OR with accumulator ((zero page,X))
	EOR ($04,X)		  ; 41 04 | Exclusive OR with accumulator ((zero page,X))
	EOR ($06,X)		  ; 41 06 | Exclusive OR with accumulator ((zero page,X))
	EOR ($08,X)		  ; 41 08 | Exclusive OR with accumulator ((zero page,X))
	EOR ($09,X)		  ; 41 09 | Exclusive OR with accumulator ((zero page,X))
	EOR ($0B,X)		  ; 41 0B | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $1040			; 0E 40 10 | Arithmetic shift left (absolute)
	ORA ($3F),Y		  ; 11 3F | Logical OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1EA
; Address: $CDA485
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1EA:
	ROL $3E14,X		  ; 3E 14 3E | Rotate left (absolute,X)
	AND $3C17,X		  ; 3D 17 3C | Logical AND with accumulator (absolute,X)
	ORA $1A3C,Y		  ; 19 3C 1A | Logical OR with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	ORA $1F3A,X		  ; 1D 3A 1F | Logical OR with accumulator (absolute,X)
	AND $3820,Y		  ; 39 20 38 | Logical AND with accumulator (absolute,Y)
	AND ($37,X)		  ; 21 37 | Logical AND with accumulator ((zero page,X))
	BIT $35			  ; 24 35 | Test bits in accumulator (zero page)
	ROL $35			  ; 26 35 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$31			 ; 29 31 | Logical AND with accumulator (immediate)
	BMI $2C			  ; 30 2C | Branch if negative
	AND $0042			; 2D 42 00 | Logical AND with accumulator (absolute)
	WDM #$01			 ; 42 01 | Reserved instruction
	WDM #$03			 ; 42 03 | Reserved instruction
	WDM #$04			 ; 42 04 | Reserved instruction
	WDM #$06			 ; 42 06 | Reserved instruction
	WDM #$08			 ; 42 08 | Reserved instruction
	WDM #$09			 ; 42 09 | Reserved instruction
	WDM #$0B			 ; 42 0B | Reserved instruction
	EOR ($0D,X)		  ; 41 0D | Exclusive OR with accumulator ((zero page,X))
	EOR ($0E,X)		  ; 41 0E | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BPL $40			  ; 10 40 | Branch if positive
	ORA ($40),Y		  ; 11 40 | Logical OR with accumulator ((zero page),Y)
	ROL $3D18,X		  ; 3E 18 3D | Rotate left (absolute,X)
	ORA $1B3D,Y		  ; 19 3D 1B | Logical OR with accumulator (absolute,Y)
	ASL $1F3B,X		  ; 1E 3B 1F | Arithmetic shift left (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	AND ($39,X)		  ; 21 39 | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1EB
; Address: $CDA4D8
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1EB:
	JSL $372338		  ; 22 38 23 37 | Jump to subroutine long
	AND $36			  ; 25 36 | Logical AND with accumulator (zero page)
	ROL $35			  ; 26 35 | Rotate left (zero page)
	AND #$33			 ; 29 33 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	AND ($2C),Y		  ; 31 2C | Logical AND with accumulator ((zero page),Y)
	BMI $2E			  ; 30 2E | Branch if negative
	ORA ($43,X)		  ; 01 43 | Logical OR with accumulator ((zero page,X))
	ORA $43			  ; 05 43 | Logical OR with accumulator (zero page)
	ASL $43			  ; 06 43 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$42			 ; 09 42 | Hardware register operation
	WDM #$0D			 ; 42 0D | Reserved instruction
	WDM #$0E			 ; 42 0E | Reserved instruction
	EOR ($10,X)		  ; 41 10 | Exclusive OR with accumulator ((zero page,X))
	EOR ($12,X)		  ; 41 12 | Exclusive OR with accumulator ((zero page,X))
	EOR ($13,X)		  ; 41 13 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1EC
; Address: $CDA50B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1EC:
	ROL $3E1A,X		  ; 3E 1A 3E | Rotate left (absolute,X)
	AND $3C1D,X		  ; 3D 1D 3C | Logical AND with accumulator (absolute,X)
	ASL $203B,X		  ; 1E 3B 20 | Arithmetic shift left (absolute,X)
	AND ($3A,X)		  ; 21 3A | Logical AND with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1ED
; Address: $CDA518
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1ED:
	JSL $382439		  ; 22 39 24 38 | Jump to subroutine long
	AND $37			  ; 25 37 | Logical AND with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$34			 ; 29 34 | Logical AND with accumulator (immediate)
	BIT $2D32			; 2C 32 2D | Test bits in accumulator (absolute)
	AND ($2E),Y		  ; 31 2E | Logical AND with accumulator ((zero page),Y)
	ORA ($44,X)		  ; 01 44 | Logical OR with accumulator ((zero page,X))
	ORA $44			  ; 05 44 | Logical OR with accumulator (zero page)
	ASL $44			  ; 06 44 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0F43			; 0D 43 0F | Logical OR with accumulator (absolute)
	WDM #$10			 ; 42 10 | Reserved instruction
	WDM #$12			 ; 42 12 | Reserved instruction
	WDM #$14			 ; 42 14 | Reserved instruction
	EOR ($15,X)		  ; 41 15 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	ROL $3D1D,X		  ; 3E 1D 3D | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1EE
; Address: $CDA554
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1EE:
	JSR $223C			; 20 3C 22 | Jump to subroutine
	DEC				  ; 3A | Decrement accumulator
	BIT $39			  ; 24 39 | Test bits in accumulator (zero page)
	ROL $38			  ; 26 38 | Rotate left (zero page)
	AND #$36			 ; 29 36 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $2E33			; 2D 33 2E | Logical AND with accumulator (absolute)
	AND ($2F),Y		  ; 31 2F | Logical AND with accumulator ((zero page),Y)
	EOR $00			  ; 45 00 | Exclusive OR with accumulator (zero page)
	EOR $01			  ; 45 01 | Exclusive OR with accumulator (zero page)
	EOR $03			  ; 45 03 | Exclusive OR with accumulator (zero page)
	EOR $05			  ; 45 05 | Exclusive OR with accumulator (zero page)
	EOR $06			  ; 45 06 | Exclusive OR with accumulator (zero page)
	EOR $08			  ; 45 08 | Exclusive OR with accumulator (zero page)
	EOR $0A			  ; 45 0A | Exclusive OR with accumulator (zero page)
	ORA $0F44			; 0D 44 0F | Logical OR with accumulator (absolute)
	ORA ($43),Y		  ; 11 43 | Logical OR with accumulator ((zero page),Y)
	WDM #$14			 ; 42 14 | Reserved instruction
	WDM #$15			 ; 42 15 | Reserved instruction
	EOR ($17,X)		  ; 41 17 | Exclusive OR with accumulator ((zero page,X))
	EOR ($19,X)		  ; 41 19 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	INC				  ; 1A | Increment accumulator
	ORA $1F3E,X		  ; 1D 3E 1F | Logical OR with accumulator (absolute,X)
	AND $3C20,X		  ; 3D 20 3C | Logical AND with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1EF
; Address: $CDA596
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1EF:
	JSL $3B233C		  ; 22 3C 23 3B | Jump to subroutine long
	AND $3A			  ; 25 3A | Logical AND with accumulator (zero page)
	ROL $39			  ; 26 39 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	AND #$37			 ; 29 37 | Logical AND with accumulator (immediate)
	BIT $2D35			; 2C 35 2D | Test bits in accumulator (absolute)
	BMI $46			  ; 30 46 | Branch if negative
	LSR $01			  ; 46 01 | Logical shift right (zero page)
	LSR $03			  ; 46 03 | Logical shift right (zero page)
	LSR $05			  ; 46 05 | Logical shift right (zero page)
	LSR $06			  ; 46 06 | Logical shift right (zero page)
	LSR $08			  ; 46 08 | Logical shift right (zero page)
	LSR $0A			  ; 46 0A | Logical shift right (zero page)
	EOR $0C			  ; 45 0C | Exclusive OR with accumulator (zero page)
	EOR $0D			  ; 45 0D | Exclusive OR with accumulator (zero page)
	EOR $0F			  ; 45 0F | Exclusive OR with accumulator (zero page)
	ORA ($44),Y		  ; 11 44 | Logical OR with accumulator ((zero page),Y)
	WDM #$17			 ; 42 17 | Reserved instruction
	WDM #$19			 ; 42 19 | Reserved instruction
	EOR ($1B,X)		  ; 41 1B | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	RTI				  ; 40 | Return from interrupt
	ASL $1F3F,X		  ; 1E 3F 1F | Arithmetic shift left (absolute,X)
	ROL $3D21,X		  ; 3E 21 3D | Rotate left (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1F0
; Address: $CDA5D6
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1F0:
	JSL $3B243C		  ; 22 3C 24 3B | Jump to subroutine long
	AND $3B			  ; 25 3B | Logical AND with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	PLP				  ; 28 | Pull processor status from stack
	AND $372A,Y		  ; 39 2A 37 | Logical AND with accumulator (absolute,Y)
	AND $2E35			; 2D 35 2E | Logical AND with accumulator (absolute)
	BMI $47			  ; 30 47 | Branch if negative
	ORA ($47,X)		  ; 01 47 | Logical OR with accumulator ((zero page,X))
	ORA $47			  ; 05 47 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LSR $0C			  ; 46 0C | Logical shift right (zero page)
	LSR $0E			  ; 46 0E | Logical shift right (zero page)
	LSR $0F			  ; 46 0F | Logical shift right (zero page)
	EOR $11			  ; 45 11 | Exclusive OR with accumulator (zero page)
	EOR $13			  ; 45 13 | Exclusive OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ORA $1B42,Y		  ; 19 42 1B | Logical OR with accumulator (absolute,Y)
	EOR ($1D,X)		  ; 41 1D | Exclusive OR with accumulator ((zero page,X))
	EOR ($1E,X)		  ; 41 1E | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1F1
; Address: $CDA612
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1F1:
	JSR $213F			; 20 3F 21 | PPU graphics register access
	ROL $3D23,X		  ; 3E 23 3D | Rotate left (absolute,X)
	AND $3C			  ; 25 3C | Logical AND with accumulator (zero page)
	ROL $3B			  ; 26 3B | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1F2
; Address: $CDA61C
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1F2:
	PLP				  ; 28 | Pull processor status from stack
	DEC				  ; 3A | Decrement accumulator
	AND #$39			 ; 29 39 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	SEC				  ; 38 | Set carry flag
	BIT $2D37			; 2C 37 2D | Test bits in accumulator (absolute)
	BMI $34			  ; 30 34 | Branch if negative
	AND ($48),Y		  ; 31 48 | Logical AND with accumulator ((zero page),Y)
	PHA				  ; 48 | Push accumulator to stack
	ORA ($48,X)		  ; 01 48 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	ORA $48			  ; 05 48 | Logical OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PHP				  ; 08 | Push processor status to stack
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0F47			; 0E 47 0F | Arithmetic shift left (absolute)
	LSR $11			  ; 46 11 | Logical shift right (zero page)
	LSR $13			  ; 46 13 | Logical shift right (zero page)
	EOR $15			  ; 45 15 | Exclusive OR with accumulator (zero page)
	EOR $16			  ; 45 16 | Exclusive OR with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	WDM #$1D			 ; 42 1D | Reserved instruction
	EOR ($1F,X)		  ; 41 1F | Exclusive OR with accumulator ((zero page,X))
	EOR ($20,X)		  ; 41 20 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1F3
; Address: $CDA654
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1F3:
	JSL $3E233F		  ; 22 3F 23 3E | Jump to subroutine long
	AND $3D			  ; 25 3D | Logical AND with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	AND $382C,Y		  ; 39 2C 38 | Logical AND with accumulator (absolute,Y)
	ROL $2F37			; 2E 37 2F | Rotate left (absolute)
	AND ($34),Y		  ; 31 34 | Logical AND with accumulator ((zero page),Y)
	EOR #$00			 ; 49 00 | Exclusive OR with accumulator (immediate)
	EOR #$01			 ; 49 01 | Exclusive OR with accumulator (immediate)
	EOR #$03			 ; 49 03 | Exclusive OR with accumulator (immediate)
	EOR #$05			 ; 49 05 | Exclusive OR with accumulator (immediate)
	EOR #$07			 ; 49 07 | Exclusive OR with accumulator (immediate)
	EOR #$09			 ; 49 09 | Exclusive OR with accumulator (immediate)
	EOR #$0A			 ; 49 0A | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	ASL $1048			; 0E 48 10 | Arithmetic shift left (absolute)
	ORA ($47),Y		  ; 11 47 | Logical OR with accumulator ((zero page),Y)
	LSR $15			  ; 46 15 | Logical shift right (zero page)
	LSR $17			  ; 46 17 | Logical shift right (zero page)
	EOR $18			  ; 45 18 | Exclusive OR with accumulator (zero page)
	EOR $1A			  ; 45 1A | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1F4
; Address: $CDA68E
; Size: 96 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1F4:
	ORA $1F42,X		  ; 1D 42 1F | Logical OR with accumulator (absolute,X)
	WDM #$21			 ; 42 21 | PPU graphics register access
	EOR ($22,X)		  ; 41 22 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BIT $3F			  ; 24 3F | Test bits in accumulator (zero page)
	ROL $3E			  ; 26 3E | Rotate left (zero page)
	AND $3C29,X		  ; 3D 29 3C | Logical AND with accumulator (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2D3A			; 2C 3A 2D | Test bits in accumulator (absolute)
	AND $382E,Y		  ; 39 2E 38 | Logical AND with accumulator (absolute,Y)
	BMI $36			  ; 30 36 | Branch if negative
	AND ($35),Y		  ; 31 35 | Logical AND with accumulator ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($4A,X)		  ; 01 4A | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA $4A			  ; 05 4A | Logical OR with accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA #$4A			 ; 09 4A | Logical OR with accumulator (immediate)
	EOR #$0C			 ; 49 0C | Exclusive OR with accumulator (immediate)
	EOR #$0E			 ; 49 0E | Exclusive OR with accumulator (immediate)
	EOR #$10			 ; 49 10 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	LSR $19			  ; 46 19 | Logical shift right (zero page)
	EOR $1A			  ; 45 1A | Exclusive OR with accumulator (zero page)
	EOR $1C			  ; 45 1C | Exclusive OR with accumulator (zero page)
	ASL $2043,X		  ; 1E 43 20 | Arithmetic shift left (absolute,X)
	WDM #$21			 ; 42 21 | PPU graphics register access
	WDM #$23			 ; 42 23 | Reserved instruction
	EOR ($24,X)		  ; 41 24 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ROL $3F			  ; 26 3F | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ROL $3D29,X		  ; 3E 29 3D | Rotate left (absolute,X)
	BIT $2E3B			; 2C 3B 2E | Test bits in accumulator (absolute)
	AND $382F,Y		  ; 39 2F 38 | Logical AND with accumulator (absolute,Y)
	BMI $37			  ; 30 37 | Branch if negative
	ORA ($4B,X)		  ; 01 4B | Logical OR with accumulator ((zero page,X))
	ORA $4B			  ; 05 4B | Logical OR with accumulator (zero page)
	ORA #$4B			 ; 09 4B | Logical OR with accumulator (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL $104A			; 0E 4A 10 | Arithmetic shift left (absolute)
	EOR #$12			 ; 49 12 | Exclusive OR with accumulator (immediate)
	EOR #$14			 ; 49 14 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA $1B46,Y		  ; 19 46 1B | Logical OR with accumulator (absolute,Y)
	LSR $1D			  ; 46 1D | Logical shift right (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1F6
; Address: $CDA710
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1F6:
	JSR $2243			; 20 43 22 | Jump to subroutine
	WDM #$25			 ; 42 25 | Reserved instruction
	EOR ($27,X)		  ; 41 27 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $3D2B,X		  ; 3E 2B 3D | Rotate left (absolute,X)
	AND $2E3B			; 2D 3B 2E | Logical AND with accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	BMI $39			  ; 30 39 | Branch if negative
	AND ($38),Y		  ; 31 38 | Logical AND with accumulator ((zero page),Y)
	JMP $4C00			; 4C 00 4C | Jump to address
	ORA ($4C,X)		  ; 01 4C | Logical OR with accumulator ((zero page,X))
	JMP $4C05			; 4C 05 4C | Jump to address
	JMP $4C09			; 4C 09 4C | Jump to address
	ORA $0F4B			; 0D 4B 0F | Logical OR with accumulator (absolute)
	BPL $4A			  ; 10 4A | Branch if positive
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$16			 ; 49 16 | Exclusive OR with accumulator (immediate)
	EOR #$18			 ; 49 18 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	ORA $1B47,Y		  ; 19 47 1B | Logical OR with accumulator (absolute,Y)
	ORA $1F46,X		  ; 1D 46 1F | Logical OR with accumulator (absolute,X)
	EOR $20			  ; 45 20 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1F7
; Address: $CDA752
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1F7:
	JSL $422443		  ; 22 43 24 42 | Hardware register operation
	AND $42			  ; 25 42 | Hardware register operation
	EOR ($29,X)		  ; 41 29 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $3D2C,X		  ; 3E 2C 3D | Rotate left (absolute,X)
	AND $2F3C			; 2D 3C 2F | Logical AND with accumulator (absolute)
	BMI $3A			  ; 30 3A | Branch if negative
	AND $3733,Y		  ; 39 33 37 | Logical AND with accumulator (absolute,Y)
	EOR $4D00			; 4D 00 4D | Exclusive OR with accumulator (absolute)
	ORA ($4D,X)		  ; 01 4D | Logical OR with accumulator ((zero page,X))
	EOR $4D05			; 4D 05 4D | Exclusive OR with accumulator (absolute)
	EOR $4D09			; 4D 09 4D | Exclusive OR with accumulator (absolute)
	JMP $4C0D			; 4C 0D 4C | Jump to address
	JMP $4B11			; 4C 11 4B | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	EOR #$1A			 ; 49 1A | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	PHA				  ; 48 | Push accumulator to stack
	ORA $1F47,X		  ; 1D 47 1F | Logical OR with accumulator (absolute,X)
	LSR $21			  ; 46 21 | PPU graphics register access
	EOR $23			  ; 45 23 | Exclusive OR with accumulator (zero page)
	BIT $43			  ; 24 43 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1F8
; Address: $CDA796
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1F8:
	ROL $42			  ; 26 42 | Hardware register operation
	PLP				  ; 28 | Pull processor status from stack
	EOR ($29,X)		  ; 41 29 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	BIT $2E3E			; 2C 3E 2E | Test bits in accumulator (absolute)
	AND $3C2F,X		  ; 3D 2F 3C | Logical AND with accumulator (absolute,X)
	AND ($3B),Y		  ; 31 3B | Logical AND with accumulator ((zero page),Y)
	AND $3834,Y		  ; 39 34 38 | Logical AND with accumulator (absolute,Y)
	LSR $4E00			; 4E 00 4E | Logical shift right (absolute)
	ORA ($4E,X)		  ; 01 4E | Logical OR with accumulator ((zero page,X))
	LSR $4E05			; 4E 05 4E | Logical shift right (absolute)
	LSR $4E09			; 4E 09 4E | Logical shift right (absolute)
	EOR $4D0D			; 4D 0D 4D | Exclusive OR with accumulator (absolute)
	EOR $4C11			; 4D 11 4C | Exclusive OR with accumulator (absolute)
	JMP $4B15			; 4C 15 4B | Jump to address
	CLC				  ; 18 | Clear carry flag
	LSR				  ; 4A | Logical shift right (accumulator)
	INC				  ; 1A | Increment accumulator
	EOR #$1C			 ; 49 1C | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	ASL $2048,X		  ; 1E 48 20 | Arithmetic shift left (absolute,X)
	AND ($46,X)		  ; 21 46 | Logical AND with accumulator ((zero page,X))
	EOR $25			  ; 45 25 | Exclusive OR with accumulator (zero page)
	ROL $43			  ; 26 43 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	WDM #$2A			 ; 42 2A | Reserved instruction
	EOR ($2B,X)		  ; 41 2B | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	AND $2F3F			; 2D 3F 2F | Logical AND with accumulator (absolute)
	ROL $3D30,X		  ; 3E 30 3D | Rotate left (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	AND $4F36,Y		  ; 39 36 4F | Logical AND with accumulator (absolute,Y)
	ORA ($4F,X)		  ; 01 4F | Logical OR with accumulator ((zero page,X))
	ORA $4F			  ; 05 4F | Logical OR with accumulator (zero page)
	ORA #$4F			 ; 09 4F | Logical OR with accumulator (immediate)
	LSR $4E0D			; 4E 0D 4E | Logical shift right (absolute)
	LSR $4D11			; 4E 11 4D | Logical shift right (absolute)
	EOR $4C15			; 4D 15 4C | Exclusive OR with accumulator (absolute)
	ORA $1A4B,Y		  ; 19 4B 1A | Logical OR with accumulator (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$1E			 ; 49 1E | Exclusive OR with accumulator (immediate)
	EOR #$20			 ; 49 20 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1F9
; Address: $CDA810
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1F9:
	JSL $462347		  ; 22 47 23 46 | Jump to subroutine long
	AND $45			  ; 25 45 | Logical AND with accumulator (zero page)
	AND #$43			 ; 29 43 | Logical AND with accumulator (immediate)
	ROL				  ; 2A | Rotate left (accumulator)
	WDM #$2C			 ; 42 2C | Reserved instruction
	EOR ($2E,X)		  ; 41 2E | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1FA
; Address: $CDA822
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1FA:
	AND ($3D),Y		  ; 31 3D | Logical AND with accumulator ((zero page),Y)
	AND $5037,Y		  ; 39 37 50 | Logical AND with accumulator (absolute,Y)
	BVC $01			  ; 50 01 | Branch if overflow clear
	BVC $03			  ; 50 03 | Branch if overflow clear
	BVC $05			  ; 50 05 | Branch if overflow clear
	BVC $07			  ; 50 07 | Branch if overflow clear
	BVC $09			  ; 50 09 | Branch if overflow clear
	BVC $0B			  ; 50 0B | Branch if overflow clear
	ORA $0F4F			; 0D 4F 0F | Logical OR with accumulator (absolute)
	ORA ($4E),Y		  ; 11 4E | Logical OR with accumulator ((zero page),Y)
	LSR $4D15			; 4E 15 4D | Logical shift right (absolute)
	JMP $4C19			; 4C 19 4C | Jump to address
	ORA $1E4A,X		  ; 1D 4A 1E | Logical OR with accumulator (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1FB
; Address: $CDA84E
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1FB:
	JSR $2249			; 20 49 22 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	BIT $47			  ; 24 47 | Test bits in accumulator (zero page)
	ROL $46			  ; 26 46 | Rotate left (zero page)
	EOR $29			  ; 45 29 | Exclusive OR with accumulator (zero page)
	AND $2E42			; 2D 42 2E | Logical AND with accumulator (absolute)
	EOR ($30,X)		  ; 41 30 | Exclusive OR with accumulator ((zero page,X))
	AND ($3E),Y		  ; 31 3E | Logical AND with accumulator ((zero page),Y)
	AND $3C34,X		  ; 3D 34 3C | Logical AND with accumulator (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	EOR ($00),Y		  ; 51 00 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($02),Y		  ; 51 02 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($04),Y		  ; 51 04 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($06),Y		  ; 51 06 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($08),Y		  ; 51 08 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($0A),Y		  ; 51 0A | Exclusive OR with accumulator ((zero page),Y)
	EOR ($0C),Y		  ; 51 0C | Exclusive OR with accumulator ((zero page),Y)
	BVC $0E			  ; 50 0E | Branch if overflow clear
	BVC $0F			  ; 50 0F | Branch if overflow clear
	BVC $11			  ; 50 11 | Branch if overflow clear
	LSR $4D17			; 4E 17 4D | Logical shift right (absolute)
	ORA $1B4D,Y		  ; 19 4D 1B | Logical OR with accumulator (absolute,Y)
	JMP $4B1D			; 4C 1D 4B | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	AND ($4A,X)		  ; 21 4A | Logical AND with accumulator ((zero page,X))
	EOR #$24			 ; 49 24 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	ROL $47			  ; 26 47 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	LSR $2A			  ; 46 2A | Logical shift right (zero page)
	EOR $2B			  ; 45 2B | Exclusive OR with accumulator (zero page)
	AND $2F43			; 2D 43 2F | Logical AND with accumulator (absolute)
	EOR ($30,X)		  ; 41 30 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ROL $3C35,X		  ; 3E 35 3C | Rotate left (absolute,X)
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1FC
; Address: $CDA8B2
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1FC:
	ASL $52			  ; 06 52 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR ($0E),Y		  ; 51 0E | Exclusive OR with accumulator ((zero page),Y)
	EOR ($10),Y		  ; 51 10 | Exclusive OR with accumulator ((zero page),Y)
	BVC $12			  ; 50 12 | Branch if overflow clear
	BVC $14			  ; 50 14 | Branch if overflow clear
	CLC				  ; 18 | Clear carry flag
	LSR $4E1A			; 4E 1A 4E | Logical shift right (absolute)
	EOR $4C1D			; 4D 1D 4C | Exclusive OR with accumulator (absolute)
	AND ($4B,X)		  ; 21 4B | Logical AND with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	AND $49			  ; 25 49 | Logical AND with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	LSR $2C			  ; 46 2C | Logical shift right (zero page)
	EOR $2E			  ; 45 2E | Exclusive OR with accumulator (zero page)
	WDM #$31			 ; 42 31 | Reserved instruction
	EOR ($33,X)		  ; 41 33 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ROL $3D36,X		  ; 3E 36 3D | Rotate left (absolute,X)
	AND $0053,Y		  ; 39 53 00 | Logical AND with accumulator (absolute,Y)
	ASL $53			  ; 06 53 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1052			; 0E 52 10 | Arithmetic shift left (absolute)
	EOR ($12),Y		  ; 51 12 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($14),Y		  ; 51 14 | Exclusive OR with accumulator ((zero page),Y)
	BVC $16			  ; 50 16 | Branch if overflow clear
	BVC $18			  ; 50 18 | Branch if overflow clear
	INC				  ; 1A | Increment accumulator
	LSR $4D1E			; 4E 1E 4D | Logical shift right (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1FD
; Address: $CDA90C
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1FD:
	JSR $224C			; 20 4C 22 | Jump to subroutine
	AND $4A			  ; 25 4A | Logical AND with accumulator (zero page)
	EOR #$29			 ; 49 29 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $2C			  ; 46 2C | Logical shift right (zero page)
	EOR $2E			  ; 45 2E | Exclusive OR with accumulator (zero page)
	BMI $43			  ; 30 43 | Branch if negative
	WDM #$33			 ; 42 33 | Reserved instruction
	RTI				  ; 40 | Return from interrupt
	ROL $3C38,X		  ; 3E 38 3C | Rotate left (absolute,X)
	AND $0054,Y		  ; 39 54 00 | Logical AND with accumulator (absolute,Y)
	ASL $54			  ; 06 54 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1053			; 0E 53 10 | Arithmetic shift left (absolute)
	EOR ($16),Y		  ; 51 16 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($18),Y		  ; 51 18 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1FE
; Address: $CDA945
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1FE:
	BVC $1A			  ; 50 1A | Branch if overflow clear
	BVC $1C			  ; 50 1C | Branch if overflow clear
	ASL $204E,X		  ; 1E 4E 20 | Arithmetic shift left (absolute,X)
	EOR $4C22			; 4D 22 4C | Exclusive OR with accumulator (absolute)
	BIT $4B			  ; 24 4B | Test bits in accumulator (zero page)
	ROL $4A			  ; 26 4A | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	EOR #$29			 ; 49 29 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	AND $2F46			; 2D 46 2F | Logical AND with accumulator (absolute)
	EOR $30			  ; 45 30 | Exclusive OR with accumulator (zero page)
	EOR ($35,X)		  ; 41 35 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ROL $3D39,X		  ; 3E 39 3D | Rotate left (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	ASL $55			  ; 06 55 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1054			; 0E 54 10 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	EOR ($1A),Y		  ; 51 1A | Exclusive OR with accumulator ((zero page),Y)
	BVC $1C			  ; 50 1C | Branch if overflow clear
	BVC $1E			  ; 50 1E | Branch if overflow clear

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_1FF
; Address: $CDA98C
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_1FF:
	JSR $224E			; 20 4E 22 | Jump to subroutine
	EOR $4C24			; 4D 24 4C | Exclusive OR with accumulator (absolute)
	ROL $4B			  ; 26 4B | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	ROL				  ; 2A | Rotate left (accumulator)
	EOR #$2C			 ; 49 2C | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	ROL $2F47			; 2E 47 2F | Rotate left (absolute)
	LSR $31			  ; 46 31 | Logical shift right (zero page)
	EOR $33			  ; 45 33 | Exclusive OR with accumulator (zero page)
	WDM #$36			 ; 42 36 | Reserved instruction
	EOR ($38,X)		  ; 41 38 | Exclusive OR with accumulator ((zero page,X))
	AND $3B3E,Y		  ; 39 3E 3B | Logical AND with accumulator (absolute,Y)
	ASL $56			  ; 06 56 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1055			; 0E 55 10 | Arithmetic shift left (absolute)
	ORA $1B52,Y		  ; 19 52 1B | Logical OR with accumulator (absolute,Y)
	EOR ($1D),Y		  ; 51 1D | Exclusive OR with accumulator ((zero page),Y)
	EOR ($1F),Y		  ; 51 1F | Exclusive OR with accumulator ((zero page),Y)
	BVC $21			  ; 50 21 | PPU graphics register access
	LSR $4D25			; 4E 25 4D | Logical shift right (absolute)
	JMP $4B29			; 4C 29 4B | Jump to address
	ROL				  ; 2A | Rotate left (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	BIT $2E49			; 2C 49 2E | Test bits in accumulator (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_200
; Address: $CDA9DB
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_200:
	PHA				  ; 48 | Push accumulator to stack
	BMI $47			  ; 30 47 | Branch if negative
	EOR $33			  ; 45 33 | Exclusive OR with accumulator (zero page)
	EOR ($38,X)		  ; 41 38 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	DEC				  ; 3A | Decrement accumulator
	ASL $57			  ; 06 57 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($55),Y		  ; 11 55 | Logical OR with accumulator ((zero page),Y)
	ORA $1B53,Y		  ; 19 53 1B | Logical OR with accumulator (absolute,Y)
	ORA $1F52,X		  ; 1D 52 1F | Logical OR with accumulator (absolute,X)
	EOR ($21),Y		  ; 51 21 | PPU graphics register access
	BVC $23			  ; 50 23 | Branch if overflow clear
	AND $4E			  ; 25 4E | Logical AND with accumulator (zero page)
	EOR $4C29			; 4D 29 4C | Exclusive OR with accumulator (absolute)
	AND $2F4A			; 2D 4A 2F | Logical AND with accumulator (absolute)
	EOR #$30			 ; 49 30 | Exclusive OR with accumulator (immediate)
	LSR $34			  ; 46 34 | Logical shift right (zero page)
	EOR $36			  ; 45 36 | Exclusive OR with accumulator (zero page)
	WDM #$39			 ; 42 39 | Reserved instruction
	EOR ($3B,X)		  ; 41 3B | Exclusive OR with accumulator ((zero page,X))
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	CLI				  ; 58 | Clear interrupt disable flag
	ASL $58			  ; 06 58 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	CLI				  ; 58 | Clear interrupt disable flag
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLI				  ; 58 | Clear interrupt disable flag
	ORA $0F57			; 0D 57 0F | Logical OR with accumulator (absolute)
	ORA ($56),Y		  ; 11 56 | Logical OR with accumulator ((zero page),Y)
	ORA $1B54,Y		  ; 19 54 1B | Logical OR with accumulator (absolute,Y)
	ORA $2053,X		  ; 1D 53 20 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_201
; Address: $CDAA4C
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_201:
	JSL $502451		  ; 22 51 24 50 | Jump to subroutine long
	ROL $4F			  ; 26 4F | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	LSR $4D29			; 4E 29 4D | Logical shift right (absolute)
	JMP $4B2D			; 4C 2D 4B | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	AND ($48),Y		  ; 31 48 | Logical AND with accumulator ((zero page),Y)
	LSR $36			  ; 46 36 | Logical shift right (zero page)
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	EOR ($3B,X)		  ; 41 3B | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	AND $0059,X		  ; 3D 59 00 | Logical AND with accumulator (absolute,X)
	EOR $5902,Y		  ; 59 02 59 | Exclusive OR with accumulator (absolute,Y)
	EOR $5906,Y		  ; 59 06 59 | Exclusive OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_202
; Address: $CDAA74
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_202:
	PHP				  ; 08 | Push processor status to stack
	EOR $590B,Y		  ; 59 0B 59 | Exclusive OR with accumulator (absolute,Y)
	ORA $0F58			; 0D 58 0F | Logical OR with accumulator (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	ORA ($57),Y		  ; 11 57 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	ASL $2053,X		  ; 1E 53 20 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_203
; Address: $CDAA8C
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_203:
	JSL $512452		  ; 22 52 24 51 | Jump to subroutine long
	ROL $50			  ; 26 50 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	LSR $4D2C			; 4E 2C 4D | Logical shift right (absolute)
	ROL $304C			; 2E 4C 30 | Rotate left (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$33			 ; 49 33 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $37			  ; 46 37 | Logical shift right (zero page)
	EOR $39			  ; 45 39 | Exclusive OR with accumulator (zero page)
	DEC				  ; 3A | Decrement accumulator
	WDM #$3C			 ; 42 3C | Reserved instruction
	EOR ($3E,X)		  ; 41 3E | Exclusive OR with accumulator ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	ASL $5A			  ; 06 5A | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	ORA $0F59			; 0D 59 0F | Logical OR with accumulator (absolute)
	EOR $5811,Y		  ; 59 11 58 | Exclusive OR with accumulator (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	CLC				  ; 18 | Clear carry flag
	INC				  ; 1A | Increment accumulator
	ASL $2054,X		  ; 1E 54 20 | Arithmetic shift left (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_204
; Address: $CDAACC
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_204:
	JSL $522453		  ; 22 53 24 52 | Jump to subroutine long
	ROL $51			  ; 26 51 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BVC $2A			  ; 50 2A | Branch if overflow clear
	BIT $2E4E			; 2C 4E 2E | Test bits in accumulator (absolute)
	JMP $4B30			; 4C 30 4B | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$36			 ; 49 36 | Exclusive OR with accumulator (immediate)
	LSR $39			  ; 46 39 | Logical shift right (zero page)
	AND $3E41,X		  ; 3D 41 3E | Logical AND with accumulator (absolute,X)
	ASL $5B			  ; 06 5B | Arithmetic shift left (zero page)
	ORA #$5B			 ; 09 5B | Logical OR with accumulator (immediate)
	ORA $0F5A			; 0D 5A 0F | Logical OR with accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_205
; Address: $CDAAFC
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_205:
	ORA ($59),Y		  ; 11 59 | Logical OR with accumulator ((zero page),Y)
	EOR $5816,Y		  ; 59 16 58 | Exclusive OR with accumulator (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	CLI				  ; 58 | Clear interrupt disable flag
	INC				  ; 1A | Increment accumulator
	ASL $2155,X		  ; 1E 55 21 | PPU graphics register access
	AND $53			  ; 25 53 | Logical AND with accumulator (zero page)
	AND #$51			 ; 29 51 | Logical AND with accumulator (immediate)
	BVC $2D			  ; 50 2D | Branch if overflow clear
	LSR $4D2F			; 4E 2F 4D | Logical shift right (absolute)
	AND ($4C),Y		  ; 31 4C | Logical AND with accumulator ((zero page),Y)
	EOR #$36			 ; 49 36 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	EOR $3C			  ; 45 3C | Exclusive OR with accumulator (zero page)
	AND $3F42,X		  ; 3D 42 3F | Logical AND with accumulator (absolute,X)
	JMP $025C00		  ; 5C 00 5C 02 | Jump to address long
	JMP $065C04		  ; 5C 04 5C 06 | Jump to address long
	JMP $0B5C09		  ; 5C 09 5C 0B | Jump to address long
	ORA $0F5B			; 0D 5B 0F | Logical OR with accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	PHY				  ; 5A | Push Y register to stack
	EOR $5818,Y		  ; 59 18 58 | Exclusive OR with accumulator (absolute,Y)
	INC				  ; 1A | Increment accumulator
	CLI				  ; 58 | Clear interrupt disable flag
	ORA $1F57,X		  ; 1D 57 1F | Logical OR with accumulator (absolute,X)
	AND ($55,X)		  ; 21 55 | Logical AND with accumulator ((zero page,X))
	AND $54			  ; 25 54 | Logical AND with accumulator (zero page)
	AND #$52			 ; 29 52 | Logical AND with accumulator (immediate)
	BVC $2D			  ; 50 2D | Branch if overflow clear
	LSR $4D31			; 4E 31 4D | Logical shift right (absolute)
	JMP $4A35			; 4C 35 4A | Jump to address
	EOR #$39			 ; 49 39 | Exclusive OR with accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	LSR $3C			  ; 46 3C | Logical shift right (zero page)
	ROL $4043,X		  ; 3E 43 40 | Rotate left (absolute,X)
	EOR $5D00,X		  ; 5D 00 5D | Exclusive OR with accumulator (absolute,X)
	EOR $5D04,X		  ; 5D 04 5D | Exclusive OR with accumulator (absolute,X)
	ASL $5D			  ; 06 5D | Arithmetic shift left (zero page)
	ORA #$5D			 ; 09 5D | Logical OR with accumulator (immediate)
	JMP $105C0D		  ; 5C 0D 5C 10 | Jump to address long
	JMP $145B12		  ; 5C 12 5B 14 | Jump to address long
	PHY				  ; 5A | Push Y register to stack
	ORA $1B59,Y		  ; 19 59 1B | Logical OR with accumulator (absolute,Y)
	EOR $581D,Y		  ; 59 1D 58 | Exclusive OR with accumulator (absolute,Y)
	AND ($56,X)		  ; 21 56 | Logical AND with accumulator ((zero page,X))
	ROL $54			  ; 26 54 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_206
; Address: $CDAB94
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_206:
	BIT $2E51			; 2C 51 2E | Test bits in accumulator (absolute)
	BVC $30			  ; 50 30 | Branch if overflow clear
	LSR $4C34			; 4E 34 4C | Logical shift right (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND $3B48,Y		  ; 39 48 3B | Logical AND with accumulator (absolute,Y)
	AND $3F45,X		  ; 3D 45 3F | Logical AND with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	LSR $5E00,X		  ; 5E 00 5E | Logical shift right (absolute,X)
	LSR $5E04,X		  ; 5E 04 5E | Logical shift right (absolute,X)
	ASL $5E			  ; 06 5E | Arithmetic shift left (zero page)
	ORA #$5E			 ; 09 5E | Logical OR with accumulator (immediate)
	EOR $5D0D,X		  ; 5D 0D 5D | Exclusive OR with accumulator (absolute,X)
	BPL $5D			  ; 10 5D | Branch if positive
	JMP $175C14		  ; 5C 14 5C 17 | Jump to address long
	ORA $1B5A,Y		  ; 19 5A 1B | Logical OR with accumulator (absolute,Y)
	PHY				  ; 5A | Push Y register to stack
	ORA $2059,X		  ; 1D 59 20 | Logical OR with accumulator (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_207
; Address: $CDABCA
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_207:
	JSL $562457		  ; 22 57 24 56 | Jump to subroutine long
	ROL $55			  ; 26 55 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	BIT $2E52			; 2C 52 2E | Test bits in accumulator (absolute)
	EOR ($30),Y		  ; 51 30 | Exclusive OR with accumulator ((zero page),Y)
	BVC $32			  ; 50 32 | Branch if overflow clear
	LSR $4D34			; 4E 34 4D | Logical shift right (absolute)
	JMP $4A38			; 4C 38 4A | Jump to address
	DEC				  ; 3A | Decrement accumulator
	EOR #$3C			 ; 49 3C | Exclusive OR with accumulator (immediate)
	ROL $3F46,X		  ; 3E 46 3F | Rotate left (absolute,X)
	EOR ($5F,X)		  ; 41 5F | Exclusive OR with accumulator ((zero page,X))
	ORA #$5F			 ; 09 5F | Logical OR with accumulator (immediate)
	LSR $5E0E,X		  ; 5E 0E 5E | Logical shift right (absolute,X)
	BPL $5E			  ; 10 5E | Branch if positive
	EOR $5D15,X		  ; 5D 15 5D | Exclusive OR with accumulator (absolute,X)
	JMP $1B5B19		  ; 5C 19 5B 1B | Jump to address long
	ASL $205A,X		  ; 1E 5A 20 | Arithmetic shift left (absolute,X)
	EOR $5822,Y		  ; 59 22 58 | Exclusive OR with accumulator (absolute,Y)
	BIT $57			  ; 24 57 | Test bits in accumulator (zero page)
	ROL $56			  ; 26 56 | Rotate left (zero page)
	AND #$55			 ; 29 55 | Logical AND with accumulator (immediate)
	AND $2F53			; 2D 53 2F | Logical AND with accumulator (absolute)
	AND ($51),Y		  ; 31 51 | Logical AND with accumulator ((zero page),Y)
	LSR $4D37			; 4E 37 4D | Logical shift right (absolute)
	AND $3B4B,Y		  ; 39 4B 3B | Logical AND with accumulator (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	ROL $4047,X		  ; 3E 47 40 | Rotate left (absolute,X)
	EOR $42			  ; 45 42 | Hardware register operation
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_20C
; Address: $CDAC34
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_20C:
	ORA #$60			 ; 09 60 | Logical OR with accumulator (immediate)
	ASL $105F			; 0E 5F 10 | Arithmetic shift left (absolute)
	LSR $5E15,X		  ; 5E 15 5E | Logical shift right (absolute,X)
	EOR $5C19,X		  ; 5D 19 5C | Exclusive OR with accumulator (absolute,X)
	JMP $205B1E		  ; 5C 1E 5B 20 | Jump to address long
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_20D
; Address: $CDAC4A
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_20D:
	JSL $582559		  ; 22 59 25 58 | Jump to subroutine long
	AND #$56			 ; 29 56 | Logical AND with accumulator (immediate)
	AND $2F54			; 2D 54 2F | Logical AND with accumulator (absolute)
	AND ($51),Y		  ; 31 51 | Logical AND with accumulator ((zero page),Y)
	BVC $35			  ; 50 35 | Branch if overflow clear
	EOR $4C39			; 4D 39 4C | Exclusive OR with accumulator (absolute)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND $3F49,X		  ; 3D 49 3F | Logical AND with accumulator (absolute,X)
	EOR ($46,X)		  ; 41 46 | Exclusive OR with accumulator ((zero page,X))
	WDM #$61			 ; 42 61 | Reserved instruction
	ADC ($02,X)		  ; 61 02 | Add with carry ((zero page,X))
	ADC ($04,X)		  ; 61 04 | Add with carry ((zero page,X))
	ADC ($07,X)		  ; 61 07 | Add with carry ((zero page,X))
	ADC ($09,X)		  ; 61 09 | Add with carry ((zero page,X))
	ADC ($0B,X)		  ; 61 0B | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_20F
; Address: $CDAC81
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_20F:
	LSR $5D1A,X		  ; 5E 1A 5D | Logical shift right (absolute,X)
	EOR $5C1E,X		  ; 5D 1E 5C | Exclusive OR with accumulator (absolute,X)
	AND ($5B,X)		  ; 21 5B | Logical AND with accumulator ((zero page,X))
	PHY				  ; 5A | Push Y register to stack
	AND $59			  ; 25 59 | Logical AND with accumulator (zero page)
	CLI				  ; 58 | Clear interrupt disable flag
	AND #$57			 ; 29 57 | Logical AND with accumulator (immediate)
	BIT $2E56			; 2C 56 2E | Test bits in accumulator (absolute)
	BMI $54			  ; 30 54 | Branch if negative
	EOR ($36),Y		  ; 51 36 | Exclusive OR with accumulator ((zero page),Y)
	BVC $38			  ; 50 38 | Branch if overflow clear
	LSR $4D3A			; 4E 3A 4D | Logical shift right (absolute)
	ROL $404A,X		  ; 3E 4A 40 | Rotate left (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	EOR ($46,X)		  ; 41 46 | Exclusive OR with accumulator ((zero page,X))
	ORA #$62			 ; 09 62 | Logical OR with accumulator (immediate)
	ADC ($0E,X)		  ; 61 0E | Add with carry ((zero page,X))
	ADC ($10,X)		  ; 61 10 | Add with carry ((zero page,X))
	ADC ($13,X)		  ; 61 13 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_212
; Address: $CDACC2
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_212:
	INC				  ; 1A | Increment accumulator
	LSR $5E1C,X		  ; 5E 1C 5E | Logical shift right (absolute,X)
	EOR $5C21,X		  ; 5D 21 5C | Exclusive OR with accumulator (absolute,X)
	AND $5A			  ; 25 5A | Logical AND with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	EOR $582A,Y		  ; 59 2A 58 | Exclusive OR with accumulator (absolute,Y)
	BIT $2E57			; 2C 57 2E | Test bits in accumulator (absolute)
	BMI $54			  ; 30 54 | Branch if negative
	BVC $39			  ; 50 39 | Branch if overflow clear
	DEC				  ; 3A | Decrement accumulator
	LSR $4C3C			; 4E 3C 4C | Logical shift right (absolute)
	ROL $404A,X		  ; 3E 4A 40 | Rotate left (absolute,X)
	EOR #$42			 ; 49 42 | Hardware register operation
	ORA #$63			 ; 09 63 | Logical OR with accumulator (immediate)
	ASL $1162			; 0E 62 11 | Arithmetic shift left (absolute)
	ADC ($15,X)		  ; 61 15 | Add with carry ((zero page,X))
	ADC ($18,X)		  ; 61 18 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_213
; Address: $CDAD02
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_213:
	INC				  ; 1A | Increment accumulator
	ORA $1F5E,X		  ; 1D 5E 1F | Logical OR with accumulator (absolute,X)
	LSR $5D21,X		  ; 5E 21 5D | Logical shift right (absolute,X)
	JMP $285B26		  ; 5C 26 5B 28 | Jump to address long
	PHY				  ; 5A | Push Y register to stack
	ROL				  ; 2A | Rotate left (accumulator)
	EOR $582C,Y		  ; 59 2C 58 | Exclusive OR with accumulator (absolute,Y)
	AND ($55),Y		  ; 31 55 | Logical AND with accumulator ((zero page),Y)
	EOR ($39),Y		  ; 51 39 | Exclusive OR with accumulator ((zero page),Y)
	BVC $3B			  ; 50 3B | Branch if overflow clear
	LSR $4D3D			; 4E 3D 4D | Logical shift right (absolute)
	EOR ($4A,X)		  ; 41 4A | Exclusive OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack
	STZ $00			  ; 64 00 | Store zero to zero page
	STZ $02			  ; 64 02 | Store zero to zero page
	STZ $04			  ; 64 04 | Store zero to zero page
	STZ $07			  ; 64 07 | Store zero to zero page
	STZ $09			  ; 64 09 | Store zero to zero page
	STZ $0C			  ; 64 0C | Store zero to zero page
	ASL $1163			; 0E 63 11 | Arithmetic shift left (absolute)
	ADC ($18,X)		  ; 61 18 | Add with carry ((zero page,X))
	ADC ($1A,X)		  ; 61 1A | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_215
; Address: $CDAD48
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_215:
	JSL $5D245E		  ; 22 5E 24 5D | Jump to subroutine long
	ROL $5C			  ; 26 5C | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PHY				  ; 5A | Push Y register to stack
	AND $2F59			; 2D 59 2F | Logical AND with accumulator (absolute)
	AND ($56),Y		  ; 31 56 | Logical AND with accumulator ((zero page),Y)
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_216
; Address: $CDAD5F
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_216:
	EOR ($3C),Y		  ; 51 3C | Exclusive OR with accumulator ((zero page),Y)
	ROL $404E,X		  ; 3E 4E 40 | Rotate left (absolute,X)
	JMP $4A41			; 4C 41 4A | Jump to address
	EOR #$45			 ; 49 45 | Exclusive OR with accumulator (immediate)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	ADC $02			  ; 65 02 | Add with carry (zero page)
	ADC $05			  ; 65 05 | Add with carry (zero page)
	ADC $07			  ; 65 07 | Add with carry (zero page)
	ADC $09			  ; 65 09 | Add with carry (zero page)
	ADC $0C			  ; 65 0C | Add with carry (zero page)
	STZ $0E			  ; 64 0E | Store zero to zero page
	STZ $11			  ; 64 11 | Store zero to zero page
	STZ $13			  ; 64 13 | Store zero to zero page
	CLC				  ; 18 | Clear carry flag
	ADC ($1D,X)		  ; 61 1D | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_218
; Address: $CDAD88
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_218:
	JSL $5E245F		  ; 22 5F 24 5E | Jump to subroutine long
	EOR $5C29,X		  ; 5D 29 5C | Exclusive OR with accumulator (absolute,X)
	AND $3059			; 2D 59 30 | Logical AND with accumulator (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	EOR ($3C),Y		  ; 51 3C | Exclusive OR with accumulator ((zero page),Y)
	BVC $3E			  ; 50 3E | Branch if overflow clear
	LSR $4D40			; 4E 40 4D | Logical shift right (absolute)
	WDM #$4B			 ; 42 4B | Reserved instruction
	EOR #$46			 ; 49 46 | Exclusive OR with accumulator (immediate)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	ROR $02			  ; 66 02 | Rotate right (zero page)
	ROR $05			  ; 66 05 | Rotate right (zero page)
	ROR $07			  ; 66 07 | Rotate right (zero page)
	ROR $0A			  ; 66 0A | Rotate right (zero page)
	ROR $0C			  ; 66 0C | Rotate right (zero page)
	ADC $0F			  ; 65 0F | Add with carry (zero page)
	ADC $11			  ; 65 11 | Add with carry (zero page)
	ADC $14			  ; 65 14 | Add with carry (zero page)
	STZ $16			  ; 64 16 | Store zero to zero page
	ORA $1B63,Y		  ; 19 63 1B | Logical OR with accumulator (absolute,Y)
	ORA $2061,X		  ; 1D 61 20 | Logical OR with accumulator (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_219
; Address: $CDADC8
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_219:
	JSL $5F2560		  ; 22 60 25 5F | Jump to subroutine long
	LSR $5D29,X		  ; 5E 29 5D | Logical shift right (absolute,X)
	BIT $2E5C			; 2C 5C 2E | Test bits in accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	BMI $59			  ; 30 59 | Branch if negative
	CLI				  ; 58 | Clear interrupt disable flag
	AND $3B54,Y		  ; 39 54 3B | Logical AND with accumulator (absolute,Y)
	AND $3F51,X		  ; 3D 51 3F | Logical AND with accumulator (absolute,X)
	EOR ($4D,X)		  ; 41 4D | Exclusive OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_21A
; Address: $CDADE7
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_21A:
	JMP $4A45			; 4C 45 4A | Jump to address
	ORA $67			  ; 05 67 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR $0F			  ; 66 0F | Rotate right (zero page)
	ROR $11			  ; 66 11 | Rotate right (zero page)
	ROR $14			  ; 66 14 | Rotate right (zero page)
	ADC $16			  ; 65 16 | Add with carry (zero page)
	STZ $19			  ; 64 19 | Store zero to zero page
	STZ $1B			  ; 64 1B | Store zero to zero page
	ASL $2062,X		  ; 1E 62 20 | Arithmetic shift left (absolute,X)
	ADC ($23,X)		  ; 61 23 | Add with carry ((zero page,X))
	ADC ($25,X)		  ; 61 25 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_21B
; Address: $CDAE0E
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_21B:
	ROL				  ; 2A | Rotate left (accumulator)
	LSR $5C2C,X		  ; 5E 2C 5C | Logical shift right (absolute,X)
	ROL $315B			; 2E 5B 31 | Rotate left (absolute)
	PHY				  ; 5A | Push Y register to stack
	EOR $5735,Y		  ; 59 35 57 | Exclusive OR with accumulator (absolute,Y)
	AND $3B55,Y		  ; 39 55 3B | Logical AND with accumulator (absolute,Y)
	AND $3F51,X		  ; 3D 51 3F | Logical AND with accumulator (absolute,X)
	BVC $41			  ; 50 41 | Branch if overflow clear
	LSR $4D43			; 4E 43 4D | Logical shift right (absolute)
	EOR $4B			  ; 45 4B | Exclusive OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ORA $68			  ; 05 68 | Logical OR with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($66),Y		  ; 11 66 | Logical OR with accumulator ((zero page),Y)
	ROR $17			  ; 66 17 | Rotate right (zero page)
	ADC $19			  ; 65 19 | Add with carry (zero page)
	ADC $1C			  ; 65 1C | Add with carry (zero page)
	STZ $1E			  ; 64 1E | Store zero to zero page

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_21C
; Address: $CDAE46
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_21C:
	JSR $2362			; 20 62 23 | Jump to subroutine
	ADC ($25,X)		  ; 61 25 | Add with carry ((zero page,X))
	ADC ($28,X)		  ; 61 28 | Add with carry ((zero page,X))
	ROL				  ; 2A | Rotate left (accumulator)
	LSR $5D2C,X		  ; 5E 2C 5D | Logical shift right (absolute,X)
	JMP $335B31		  ; 5C 31 5B 33 | Jump to address long
	PHY				  ; 5A | Push Y register to stack
	CLI				  ; 58 | Clear interrupt disable flag
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	ROL $4052,X		  ; 3E 52 40 | Rotate left (absolute,X)
	EOR ($42),Y		  ; 51 42 | Hardware register operation
	EOR $4C46			; 4D 46 4C | Exclusive OR with accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	ADC #$00			 ; 69 00 | Add with carry (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_21D
; Address: $CDAE6D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_21D:
	ADC #$02			 ; 69 02 | Add with carry (immediate)
	ADC #$05			 ; 69 05 | Add with carry (immediate)
	ADC #$07			 ; 69 07 | Add with carry (immediate)
	ADC #$0A			 ; 69 0A | Add with carry (immediate)
	ADC #$0C			 ; 69 0C | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ROR $19			  ; 66 19 | Rotate right (zero page)
	ROR $1C			  ; 66 1C | Rotate right (zero page)
	ADC $1E			  ; 65 1E | Add with carry (zero page)
	STZ $21			  ; 64 21 | PPU graphics register access
	ROL $61			  ; 26 61 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_21E
; Address: $CDAE8E
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_21E:
	ROL				  ; 2A | Rotate left (accumulator)
	AND $2F5E			; 2D 5E 2F | Logical AND with accumulator (absolute)
	EOR $5C31,X		  ; 5D 31 5C | Exclusive OR with accumulator (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	EOR $5838,Y		  ; 59 38 58 | Exclusive OR with accumulator (absolute,Y)
	DEC				  ; 3A | Decrement accumulator
	AND $3F55,X		  ; 3D 55 3F | Logical AND with accumulator (absolute,X)
	EOR ($51,X)		  ; 41 51 | Exclusive OR with accumulator ((zero page,X))
	BVC $45			  ; 50 45 | Branch if overflow clear
	LSR $4C47			; 4E 47 4C | Logical shift right (absolute)
	EOR #$6A			 ; 49 6A | Exclusive OR with accumulator (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $6A			  ; 05 6A | Logical OR with accumulator (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $0F69			; 0D 69 0F | Logical OR with accumulator (absolute)
	ADC #$12			 ; 69 12 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	ORA $1C67,Y		  ; 19 67 1C | Logical OR with accumulator (absolute,Y)
	ROR $1F			  ; 66 1F | Rotate right (zero page)
	ADC $21			  ; 65 21 | PPU graphics register access
	STZ $24			  ; 64 24 | Store zero to zero page
	ROL $62			  ; 26 62 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ADC ($2B,X)		  ; 61 2B | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_21F
; Address: $CDAED0
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_21F:
	AND $305F			; 2D 5F 30 | Logical AND with accumulator (absolute)
	LSR $5D32,X		  ; 5E 32 5D | Logical shift right (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	AND $3B58,Y		  ; 39 58 3B | Logical AND with accumulator (absolute,Y)
	AND $3F55,X		  ; 3D 55 3F | Logical AND with accumulator (absolute,X)
	EOR ($52,X)		  ; 41 52 | Exclusive OR with accumulator ((zero page,X))
	EOR ($45),Y		  ; 51 45 | Exclusive OR with accumulator ((zero page),Y)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_224
; Address: $CDAEF6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_224:
	ORA $0F6A			; 0D 6A 0F | Logical OR with accumulator (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$15			 ; 69 15 | Add with carry (immediate)
	ADC #$17			 ; 69 17 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	PLA				  ; 68 | Pull accumulator from stack
	ROR $21			  ; 66 21 | PPU graphics register access
	ADC $24			  ; 65 24 | Add with carry (zero page)
	STZ $26			  ; 64 26 | Store zero to zero page
	AND #$62			 ; 29 62 | Logical AND with accumulator (immediate)
	ADC ($2E,X)		  ; 61 2E | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_225
; Address: $CDAF12
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_225:
	BMI $5F			  ; 30 5F | Branch if negative
	EOR $5C35,X		  ; 5D 35 5C | Exclusive OR with accumulator (absolute,X)
	AND $3C59,Y		  ; 39 59 3C | Logical AND with accumulator (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	ROL $4056,X		  ; 3E 56 40 | Rotate left (absolute,X)
	WDM #$53			 ; 42 53 | Reserved instruction
	EOR ($46),Y		  ; 51 46 | Exclusive OR with accumulator ((zero page),Y)
	BVC $48			  ; 50 48 | Branch if overflow clear
	LSR $6C4A			; 4E 4A 6C | Logical shift right (absolute)
	JMP ($6C02)		  ; 6C 02 6C | Jump to address (absolute indirect)
	ORA $6C			  ; 05 6C | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	JMP ($6C0A)		  ; 6C 0A 6C | Jump to address (absolute indirect)
	ORA $0F6B			; 0D 6B 0F | Logical OR with accumulator (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_226
; Address: $CDAF3B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_226:
	ROR				  ; 6A | Rotate right (accumulator)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$1A			 ; 69 1A | Add with carry (immediate)
	ADC #$1D			 ; 69 1D | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_227
; Address: $CDAF46
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_227:
	JSL $652466		  ; 22 66 24 65 | Jump to subroutine long
	STZ $29			  ; 64 29 | Store zero to zero page
	BIT $2E62			; 2C 62 2E | Test bits in accumulator (absolute)
	ADC ($31,X)		  ; 61 31 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_228
; Address: $CDAF55
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_228:
	LSR $5D35,X		  ; 5E 35 5D | Logical shift right (absolute,X)
	SEC				  ; 38 | Set carry flag
	JMP $3C5A3A		  ; 5C 3A 5A 3C | Jump to address long
	EOR $573E,Y		  ; 59 3E 57 | Exclusive OR with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_229
; Address: $CDAF64
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_229:
	EOR $52			  ; 45 52 | Exclusive OR with accumulator (zero page)
	BVC $49			  ; 50 49 | Branch if overflow clear
	LSR $6D4B			; 4E 4B 6D | Logical shift right (absolute)
	ADC $6D02			; 6D 02 6D | Add with carry (absolute)
	ORA $6D			  ; 05 6D | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ADC $6D0A			; 6D 0A 6D | Add with carry (absolute)
	ORA $106C			; 0D 6C 10 | Logical OR with accumulator (absolute)
	JMP ($6B12)		  ; 6C 12 6B | Jump to address (absolute indirect)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_22A
; Address: $CDAF7E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_22A:
	CLC				  ; 18 | Clear carry flag
	ROR				  ; 6A | Rotate right (accumulator)
	INC				  ; 1A | Increment accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $1F69,X		  ; 1D 69 1F | Logical OR with accumulator (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_22B
; Address: $CDAF86
; Size: 62 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_22B:
	JSL $662567		  ; 22 67 25 66 | Jump to subroutine long
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	STZ $2C			  ; 64 2C | Store zero to zero page
	AND ($61),Y		  ; 31 61 | Logical AND with accumulator ((zero page),Y)
	LSR $5C38,X		  ; 5E 38 5C | Logical shift right (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	AND $3F59,X		  ; 3D 59 3F | Logical AND with accumulator (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR ($56,X)		  ; 41 56 | Exclusive OR with accumulator ((zero page,X))
	EOR $53			  ; 45 53 | Exclusive OR with accumulator (zero page)
	EOR ($49),Y		  ; 51 49 | Exclusive OR with accumulator ((zero page),Y)
	ROR $6E00			; 6E 00 6E | Rotate right (absolute)
	ROR $6E05			; 6E 05 6E | Rotate right (absolute)
	PHP				  ; 08 | Push processor status to stack
	ROR $6E0A			; 6E 0A 6E | Rotate right (absolute)
	ORA $106D			; 0D 6D 10 | Logical OR with accumulator (absolute)
	ADC $6C12			; 6D 12 6C | Add with carry (absolute)
	JMP ($6B18)		  ; 6C 18 6B | Jump to address (absolute indirect)
	INC				  ; 1A | Increment accumulator
	ROR				  ; 6A | Rotate right (accumulator)
	ORA $206A,X		  ; 1D 6A 20 | Logical OR with accumulator (absolute,X)
	ADC #$22			 ; 69 22 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	AND $67			  ; 25 67 | Logical AND with accumulator (zero page)
	ROR $2A			  ; 66 2A | Rotate right (zero page)
	ADC $2C			  ; 65 2C | Add with carry (zero page)
	STZ $2F			  ; 64 2F | Store zero to zero page
	AND ($61),Y		  ; 31 61 | Logical AND with accumulator ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_22C
; Address: $CDAFD8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_22C:
	AND $3B5D,Y		  ; 39 5D 3B | Logical AND with accumulator (absolute,Y)
	JMP $3F5A3D		  ; 5C 3D 5A 3F | Jump to address long
	EOR $5742,Y		  ; 59 42 57 | Exclusive OR with accumulator (absolute,Y)
	LSR $54			  ; 46 54 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_22D
; Address: $CDAFE8
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_22D:
	LSR				  ; 4A | Logical shift right (accumulator)
	BVC $4C			  ; 50 4C | Branch if overflow clear
	ORA $6F			  ; 05 6F | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $106E			; 0D 6E 10 | Logical OR with accumulator (absolute)
	ROR $6D13			; 6E 13 6D | Rotate right (absolute)
	ADC $6C18			; 6D 18 6C | Add with carry (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_22E
; Address: $CDB002
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_22E:
	ORA $206B,X		  ; 1D 6B 20 | Logical OR with accumulator (absolute,X)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$25			 ; 69 25 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $2D			  ; 66 2D | Rotate right (zero page)
	ADC $2F			  ; 65 2F | Add with carry (zero page)
	STZ $32			  ; 64 32 | Store zero to zero page
	ADC ($37,X)		  ; 61 37 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_22F
; Address: $CDB018
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_22F:
	AND $3B5E,Y		  ; 39 5E 3B | Logical AND with accumulator (absolute,Y)
	EOR $5B3E,X		  ; 5D 3E 5B | Exclusive OR with accumulator (absolute,X)
	RTI				  ; 40 | Return from interrupt
	EOR $5842,Y		  ; 59 42 58 | Exclusive OR with accumulator (absolute,Y)
	EOR #$52			 ; 49 52 | Exclusive OR with accumulator (immediate)
	EOR ($4D),Y		  ; 51 4D | Exclusive OR with accumulator ((zero page),Y)
	BVS $00			  ; 70 00 | Branch if overflow set
	BVS $02			  ; 70 02 | Branch if overflow set
	BVS $05			  ; 70 05 | Branch if overflow set
	BVS $08			  ; 70 08 | Branch if overflow set
	BVS $0B			  ; 70 0B | Branch if overflow set
	BVS $0D			  ; 70 0D | Branch if overflow set
	BPL $6F			  ; 10 6F | Branch if positive
	ROR $6E16			; 6E 16 6E | Rotate right (absolute)
	CLC				  ; 18 | Clear carry flag
	ADC $6C1B			; 6D 1B 6C | Add with carry (absolute)
	ASL $206C,X		  ; 1E 6C 20 | Arithmetic shift left (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_230
; Address: $CDB047
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_230:
	ROR				  ; 6A | Rotate right (accumulator)
	ROL $69			  ; 26 69 | Rotate left (zero page)
	PLP				  ; 28 | Pull processor status from stack
	PLA				  ; 68 | Pull accumulator from stack
	AND $3066			; 2D 66 30 | Logical AND with accumulator (absolute)
	STZ $32			  ; 64 32 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_231
; Address: $CDB058
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_231:
	DEC				  ; 3A | Decrement accumulator
	EOR $5C3E,X		  ; 5D 3E 5C | Exclusive OR with accumulator (absolute,X)
	EOR ($5A,X)		  ; 41 5A | Exclusive OR with accumulator ((zero page,X))
	EOR $5745,Y		  ; 59 45 57 | Exclusive OR with accumulator (absolute,Y)
	EOR #$53			 ; 49 53 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_232
; Address: $CDB069
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_232:
	EOR ($4D),Y		  ; 51 4D | Exclusive OR with accumulator ((zero page),Y)
	ADC ($00),Y		  ; 71 00 | Add with carry ((zero page),Y)
	ADC ($02),Y		  ; 71 02 | Add with carry ((zero page),Y)
	ADC ($05),Y		  ; 71 05 | Add with carry ((zero page),Y)
	ADC ($08),Y		  ; 71 08 | Add with carry ((zero page),Y)
	ADC ($0B),Y		  ; 71 0B | Add with carry ((zero page),Y)
	ADC ($0D),Y		  ; 71 0D | Add with carry ((zero page),Y)
	BVS $10			  ; 70 10 | Branch if overflow set
	BVS $13			  ; 70 13 | Branch if overflow set
	CLC				  ; 18 | Clear carry flag
	ROR $6D1B			; 6E 1B 6D | Rotate right (absolute)
	ASL $216D,X		  ; 1E 6D 21 | PPU graphics register access
	JMP ($6B23)		  ; 6C 23 6B | Jump to address (absolute indirect)
	ROL $6A			  ; 26 6A | Rotate left (zero page)
	AND #$69			 ; 29 69 | Logical AND with accumulator (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ROL $3067			; 2E 67 30 | Rotate left (absolute)
	ADC $33			  ; 65 33 | Add with carry (zero page)
	STZ $35			  ; 64 35 | Store zero to zero page
	SEC				  ; 38 | Set carry flag
	ADC ($3A,X)		  ; 61 3A | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_233
; Address: $CDB09B
; Size: 59 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_233:
	LSR $5D3F,X		  ; 5E 3F 5D | Logical shift right (absolute,X)
	EOR ($5B,X)		  ; 41 5B | Exclusive OR with accumulator ((zero page,X))
	EOR $5846,Y		  ; 59 46 58 | Exclusive OR with accumulator (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	JMP $4E52			; 4C 52 4E | Jump to address
	ORA $72			  ; 05 72 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $1071			; 0E 71 10 | Arithmetic shift left (absolute)
	ADC ($13),Y		  ; 71 13 | Add with carry ((zero page),Y)
	BVS $16			  ; 70 16 | Branch if overflow set
	BVS $19			  ; 70 19 | Branch if overflow set
	ROR $6E1E			; 6E 1E 6E | Rotate right (absolute)
	AND ($6D,X)		  ; 21 6D | Logical AND with accumulator ((zero page,X))
	BIT $6C			  ; 24 6C | Test bits in accumulator (zero page)
	ROL $6B			  ; 26 6B | Rotate left (zero page)
	AND #$6A			 ; 29 6A | Logical AND with accumulator (immediate)
	BIT $2E69			; 2C 69 2E | Test bits in accumulator (absolute)
	AND ($66),Y		  ; 31 66 | Logical AND with accumulator ((zero page),Y)
	ADC $36			  ; 65 36 | Add with carry (zero page)
	STZ $38			  ; 64 38 | Store zero to zero page
	ADC ($3D,X)		  ; 61 3D | Add with carry ((zero page,X))
	LSR $5C42,X		  ; 5E 42 5C | Logical shift right (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	LSR $58			  ; 46 58 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	EOR $4F53			; 4D 53 4F | Exclusive OR with accumulator (absolute)
	ORA $73			  ; 05 73 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_234
; Address: $CDB0F2
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_234:
	PHP				  ; 08 | Push processor status to stack
	ASL $1172			; 0E 72 11 | Arithmetic shift left (absolute)
	ADC ($16),Y		  ; 71 16 | Add with carry ((zero page),Y)
	ADC ($19),Y		  ; 71 19 | Add with carry ((zero page),Y)
	BVS $1C			  ; 70 1C | Branch if overflow set
	ASL $216F,X		  ; 1E 6F 21 | PPU graphics register access
	ROR $6D24			; 6E 24 6D | Rotate right (absolute)
	JMP ($6B29)		  ; 6C 29 6B | Jump to address (absolute indirect)
	BIT $2F6A			; 2C 6A 2F | Test bits in accumulator (absolute)
	PLA				  ; 68 | Pull accumulator from stack
	AND ($67),Y		  ; 31 67 | Logical AND with accumulator ((zero page),Y)
	ROR $36			  ; 66 36 | Rotate right (zero page)
	STZ $39			  ; 64 39 | Store zero to zero page
	ROL $4060,X		  ; 3E 60 40 | Rotate left (absolute,X)
	LSR $5D42,X		  ; 5E 42 5D | Logical shift right (absolute,X)
	EOR $5B			  ; 45 5B | Exclusive OR with accumulator (zero page)
	EOR $5749,Y		  ; 59 49 57 | Exclusive OR with accumulator (absolute,Y)
	EOR $4F54			; 4D 54 4F | Exclusive OR with accumulator (absolute)
	ORA $74			  ; 05 74 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $1173			; 0E 73 11 | Arithmetic shift left (absolute)
	ORA $1C71,Y		  ; 19 71 1C | Logical OR with accumulator (absolute,Y)
	BVS $1F			  ; 70 1F | Branch if overflow set
	AND ($6F,X)		  ; 21 6F | Logical AND with accumulator ((zero page,X))
	BIT $6E			  ; 24 6E | Test bits in accumulator (zero page)
	ADC $6C2A			; 6D 2A 6C | Add with carry (absolute)
	BIT $2F6A			; 2C 6A 2F | Test bits in accumulator (absolute)
	ADC #$32			 ; 69 32 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ADC $39			  ; 65 39 | Add with carry (zero page)
	STZ $3C			  ; 64 3C | Store zero to zero page
	ROL $4161,X		  ; 3E 61 41 | Rotate left (absolute,X)
	EOR $5C45,X		  ; 5D 45 5C | Exclusive OR with accumulator (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $4E56			; 4C 56 4E | Jump to address
	BVC $75			  ; 50 75 | Branch if overflow clear
	ORA $75			  ; 05 75 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $1174			; 0E 74 11 | Arithmetic shift left (absolute)
	ORA $1C72,Y		  ; 19 72 1C | Logical OR with accumulator (absolute,Y)
	ADC ($1F),Y		  ; 71 1F | Add with carry ((zero page),Y)
	BVS $22			  ; 70 22 | Branch if overflow set
	BVS $25			  ; 70 25 | Branch if overflow set
	ROR $6D2A			; 6E 2A 6D | Rotate right (absolute)
	AND $2F6B			; 2D 6B 2F | Logical AND with accumulator (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$35			 ; 69 35 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_235
; Address: $CDB195
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_235:
	ROR $3A			  ; 66 3A | Rotate right (zero page)
	ADC $3C			  ; 65 3C | Add with carry (zero page)
	EOR ($60,X)		  ; 41 60 | Exclusive OR with accumulator ((zero page,X))
	LSR $5D46,X		  ; 5E 46 5D | Logical shift right (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR $574D,Y		  ; 59 4D 57 | Exclusive OR with accumulator (absolute,Y)
	EOR ($76),Y		  ; 51 76 | Exclusive OR with accumulator ((zero page),Y)
	ORA $76			  ; 05 76 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $1175			; 0E 75 11 | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	ADC ($22),Y		  ; 71 22 | Add with carry ((zero page),Y)
	BVS $25			  ; 70 25 | Branch if overflow set
	BVS $28			  ; 70 28 | Branch if overflow set
	ROL				  ; 2A | Rotate left (accumulator)
	ADC $6C2D			; 6D 2D 6C | Add with carry (absolute)
	BMI $6B			  ; 30 6B | Branch if negative
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	ROR $3D			  ; 66 3D | Rotate right (zero page)
	STZ $3F			  ; 64 3F | Store zero to zero page
	WDM #$61			 ; 42 61 | Reserved instruction
	LSR $5D			  ; 46 5D | Logical shift right (zero page)
	EOR #$5B			 ; 49 5B | Exclusive OR with accumulator (immediate)
	PHY				  ; 5A | Push Y register to stack
	EOR $4F58			; 4D 58 4F | Exclusive OR with accumulator (absolute)
	ORA $77			  ; 05 77 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $1176			; 0E 76 11 | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	ORA $2073,X		  ; 1D 73 20 | Logical OR with accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_236
; Address: $CDB204
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_236:
	JSL $702571		  ; 22 71 25 70 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ROR $6D2D			; 6E 2D 6D | Rotate right (absolute)
	BMI $6C			  ; 30 6C | Branch if negative
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_237
; Address: $CDB213
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_237:
	ADC #$38			 ; 69 38 | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	ROR $3D			  ; 66 3D | Rotate right (zero page)
	ADC $40			  ; 65 40 | Add with carry (zero page)
	WDM #$62			 ; 42 62 | Reserved instruction
	EOR $60			  ; 45 60 | Exclusive OR with accumulator (zero page)
	LSR $5C49,X		  ; 5E 49 5C | Logical shift right (absolute,X)
	JMP $4E5A			; 4C 5A 4E | Jump to address
	CLI				  ; 58 | Clear interrupt disable flag
	BVC $56			  ; 50 56 | Branch if overflow clear
	SEI				  ; 78 | Set interrupt disable flag

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_238
; Address: $CDB22D
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_238:
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ORA $78			  ; 05 78 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	ASL $1177			; 0E 77 11 | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	ORA $2074,X		  ; 1D 74 20 | Logical OR with accumulator (absolute,X)
	AND $71			  ; 25 71 | Logical AND with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BVS $2B			  ; 70 2B | Branch if overflow set
	ROL $316E			; 2E 6E 31 | Rotate left (absolute)
	ADC $6C33			; 6D 33 6C | Add with carry (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	AND $3B69,Y		  ; 39 69 3B | Logical AND with accumulator (absolute,Y)
	ROL $4066,X		  ; 3E 66 40 | Rotate left (absolute,X)
	STZ $43			  ; 64 43 | Store zero to zero page
	EOR $61			  ; 45 61 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR $5B4C,X		  ; 5D 4C 5B | Exclusive OR with accumulator (absolute,X)
	EOR $5751,Y		  ; 59 51 57 | Exclusive OR with accumulator (absolute,Y)
	ADC $7900,Y		  ; 79 00 79 | Add with carry (absolute,Y)
	ADC $7905,Y		  ; 79 05 79 | Add with carry (absolute,Y)
	PHP				  ; 08 | Push processor status to stack
	ADC $790B,Y		  ; 79 0B 79 | Add with carry (absolute,Y)
	ASL $1178			; 0E 78 11 | Arithmetic shift left (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	INC				  ; 1A | Increment accumulator
	ORA $2075,X		  ; 1D 75 20 | Logical OR with accumulator (absolute,X)
	ROL $72			  ; 26 72 | Rotate left (zero page)
	AND #$71			 ; 29 71 | Logical AND with accumulator (immediate)
	BVS $2E			  ; 70 2E | Branch if overflow set
	AND ($6E),Y		  ; 31 6E | Logical AND with accumulator ((zero page),Y)
	JMP ($6B36)		  ; 6C 36 6B | Jump to address (absolute indirect)
	AND $3C6A,Y		  ; 39 6A 3C | Logical AND with accumulator (absolute,Y)
	PLA				  ; 68 | Pull accumulator from stack
	ROL $4167,X		  ; 3E 67 41 | Rotate left (absolute,X)
	ADC $43			  ; 65 43 | Add with carry (zero page)
	LSR $61			  ; 46 61 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_239
; Address: $CDB2A3
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_239:
	LSR $5C4D,X		  ; 5E 4D 5C | Logical shift right (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	EOR ($58),Y		  ; 51 58 | Exclusive OR with accumulator ((zero page),Y)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	ASL $7A			  ; 06 7A | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_23A
; Address: $CDB2B2
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_23A:
	ORA #$7A			 ; 09 7A | Logical OR with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7912,Y		  ; 79 12 79 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	SEI				  ; 78 | Set interrupt disable flag
	INC				  ; 1A | Increment accumulator
	ORA $2076,X		  ; 1D 76 20 | Logical OR with accumulator (absolute,X)
	ROL $73			  ; 26 73 | Rotate left (zero page)
	AND #$72			 ; 29 72 | Logical AND with accumulator (immediate)
	BIT $2F71			; 2C 71 2F | Test bits in accumulator (absolute)
	BVS $31			  ; 70 31 | Branch if overflow set
	ADC $6C37			; 6D 37 6C | Add with carry (absolute)
	AND $3C6B,Y		  ; 39 6B 3C | Logical AND with accumulator (absolute,Y)
	ADC #$3F			 ; 69 3F | Add with carry (immediate)
	EOR ($66,X)		  ; 41 66 | Exclusive OR with accumulator ((zero page,X))
	STZ $46			  ; 64 46 | Store zero to zero page
	EOR #$60			 ; 49 60 | Exclusive OR with accumulator (immediate)
	LSR $505D			; 4E 5D 50 | Logical shift right (absolute)
	EOR $7B54,Y		  ; 59 54 7B | Exclusive OR with accumulator (absolute,Y)
	ASL $7B			  ; 06 7B | Arithmetic shift left (zero page)
	ORA #$7B			 ; 09 7B | Logical OR with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	ADC $7818,Y		  ; 79 18 78 | Add with carry (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	ASL $2177,X		  ; 1E 77 21 | PPU graphics register access
	ROL $74			  ; 26 74 | Rotate left (zero page)
	AND #$73			 ; 29 73 | Logical AND with accumulator (immediate)
	BIT $2F72			; 2C 72 2F | Test bits in accumulator (absolute)
	ADC ($32),Y		  ; 71 32 | Add with carry ((zero page),Y)
	BVS $35			  ; 70 35 | Branch if overflow set
	ROR $6D37			; 6E 37 6D | Rotate right (absolute)
	DEC				  ; 3A | Decrement accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_23B
; Address: $CDB316
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_23B:
	AND $3F6A,X		  ; 3D 6A 3F | Logical AND with accumulator (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	WDM #$67			 ; 42 67 | Reserved instruction
	ADC $47			  ; 65 47 | Add with carry (zero page)
	EOR #$61			 ; 49 61 | Exclusive OR with accumulator (immediate)
	JMP $4E5F			; 4C 5F 4E | Jump to address
	EOR $5B50,X		  ; 5D 50 5B | Exclusive OR with accumulator (absolute,X)
	EOR $7C55,Y		  ; 59 55 7C | Exclusive OR with accumulator (absolute,Y)
	ASL $7C			  ; 06 7C | Arithmetic shift left (zero page)
	ORA #$7C			 ; 09 7C | Logical OR with accumulator (immediate)
	PLY				  ; 7A | Pull Y register from stack
	CLC				  ; 18 | Clear carry flag
	ADC $791B,Y		  ; 79 1B 79 | Add with carry (absolute,Y)
	ASL $2178,X		  ; 1E 78 21 | PPU graphics register access
	BIT $76			  ; 24 76 | Test bits in accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_23C
; Address: $CDB34A
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_23C:
	BIT $2F73			; 2C 73 2F | Test bits in accumulator (absolute)
	BVS $35			  ; 70 35 | Branch if overflow set
	SEC				  ; 38 | Set carry flag
	ROR $6C3A			; 6E 3A 6C | Rotate right (absolute)
	AND $406B,X		  ; 3D 6B 40 | Logical AND with accumulator (absolute,X)
	ADC #$42			 ; 69 42 | Hardware register operation
	EOR $66			  ; 45 66 | Exclusive OR with accumulator (zero page)
	STZ $4A			  ; 64 4A | Store zero to zero page
	JMP $4F60			; 4C 60 4F | Jump to address
	LSR $5C51,X		  ; 5E 51 5C | Logical shift right (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	ADC $7D00,X		  ; 7D 00 7D | Add with carry (absolute,X)
	ADC $7D06,X		  ; 7D 06 7D | Add with carry (absolute,X)
	ORA #$7D			 ; 09 7D | Logical OR with accumulator (immediate)
	ADC $7C0F,X		  ; 7D 0F 7C | Add with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	ASL $2179,X		  ; 1E 79 21 | PPU graphics register access
	SEI				  ; 78 | Set interrupt disable flag
	BIT $77			  ; 24 77 | Test bits in accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $3074			; 2D 74 30 | Logical AND with accumulator (absolute)
	ADC ($35),Y		  ; 71 35 | Add with carry ((zero page),Y)
	BVS $38			  ; 70 38 | Branch if overflow set
	ADC $6C3E			; 6D 3E 6C | Add with carry (absolute)
	RTI				  ; 40 | Return from interrupt
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	LSR $67			  ; 46 67 | Logical shift right (zero page)
	PHA				  ; 48 | Push accumulator to stack
	ADC $4B			  ; 65 4B | Add with carry (zero page)
	EOR $4F61			; 4D 61 4F | Exclusive OR with accumulator (absolute)
	EOR $5B54,X		  ; 5D 54 5B | Exclusive OR with accumulator (absolute,X)
	ROR $7E00,X		  ; 7E 00 7E | Rotate right (absolute,X)
	ROR $7E06,X		  ; 7E 06 7E | Rotate right (absolute,X)
	ORA #$7E			 ; 09 7E | Logical OR with accumulator (immediate)
	ROR $7D0F,X		  ; 7E 0F 7D | Rotate right (absolute,X)
	ADC $7C15,X		  ; 7D 15 7C | Add with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ASL $217A,X		  ; 1E 7A 21 | PPU graphics register access
	ADC $7824,Y		  ; 79 24 78 | Add with carry (absolute,Y)
	ROL				  ; 2A | Rotate left (accumulator)
	AND $3075			; 2D 75 30 | Logical AND with accumulator (absolute)
	ADC ($39),Y		  ; 71 39 | Add with carry ((zero page),Y)
	BVS $3B			  ; 70 3B | Branch if overflow set
	ROR $6C3E			; 6E 3E 6C | Rotate right (absolute)
	EOR ($6B,X)		  ; 41 6B | Exclusive OR with accumulator ((zero page,X))
	ADC #$46			 ; 69 46 | Add with carry (immediate)
	EOR #$66			 ; 49 66 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_23D
; Address: $CDB3E1
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_23D:
	STZ $4E			  ; 64 4E | Store zero to zero page
	BVC $60			  ; 50 60 | Branch if overflow clear
	LSR $5B55,X		  ; 5E 55 5B | Logical shift right (absolute,X)
	ASL $7F			  ; 06 7F | Arithmetic shift left (zero page)
	ORA #$7F			 ; 09 7F | Logical OR with accumulator (immediate)
	ROR $7E12,X		  ; 7E 12 7E | Rotate right (absolute,X)
	ADC $7C18,X		  ; 7D 18 7C | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_23E
; Address: $CDB402
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_23E:
	JSL $79257A		  ; 22 7A 25 79 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	SEI				  ; 78 | Set interrupt disable flag
	ROL $3076			; 2E 76 30 | Rotate left (absolute)
	AND $3C70,Y		  ; 39 70 3C | Logical AND with accumulator (absolute,Y)
	ADC $6C41			; 6D 41 6C | Add with carry (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	EOR #$66			 ; 49 66 | Exclusive OR with accumulator (immediate)
	JMP $4E64			; 4C 64 4E | Jump to address
	EOR ($60),Y		  ; 51 60 | Exclusive OR with accumulator ((zero page),Y)
	LSR $5C55,X		  ; 5E 55 5C | Logical shift right (absolute,X)
	CLI				  ; 58 | Clear interrupt disable flag
	BRA $00			  ; 80 00 | Branch always
	BRA $03			  ; 80 03 | Branch always
	BRA $06			  ; 80 06 | Branch always
	BRA $09			  ; 80 09 | Branch always
	BRA $0C			  ; 80 0C | Branch always
	BRA $0F			  ; 80 0F | Branch always
	ROR $7D19,X		  ; 7E 19 7D | Rotate right (absolute,X)
	ADC $7C1F,X		  ; 7D 1F 7C | Add with carry (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_23F
; Address: $CDB442
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_23F:
	JSL $7A257B		  ; 22 7B 25 7A | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	ADC $782B,Y		  ; 79 2B 78 | Add with carry (absolute,Y)
	ROL $3177			; 2E 77 31 | Rotate left (absolute)
	AND $3C71,Y		  ; 39 71 3C | Logical AND with accumulator (absolute,Y)
	BVS $3F			  ; 70 3F | Branch if overflow set
	ROR $6C42			; 6E 42 6C | Rotate right (absolute)
	EOR $6B			  ; 45 6B | Exclusive OR with accumulator (zero page)
	ADC #$4A			 ; 69 4A | Add with carry (immediate)
	JMP $4F65			; 4C 65 4F | Jump to address
	EOR ($61),Y		  ; 51 61 | Exclusive OR with accumulator ((zero page),Y)
	EOR $8158,X		  ; 5D 58 81 | Exclusive OR with accumulator (absolute,X)
	STA ($03,X)		  ; 81 03 | Update graphics data
	STA ($06,X)		  ; 81 06 | Update graphics data
	STA ($09,X)		  ; 81 09 | Update graphics data
	STA ($0C,X)		  ; 81 0C | Update graphics data
	STA ($0F,X)		  ; 81 0F | Update graphics data
	BRA $13			  ; 80 13 | Branch always
	BRA $16			  ; 80 16 | Branch always
	ORA $1C7E,Y		  ; 19 7E 1C | Logical OR with accumulator (absolute,Y)
	ROR $7D1F,X		  ; 7E 1F 7D | Rotate right (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_241
; Address: $CDB486
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_241:
	PLP				  ; 28 | Pull processor status from stack
	PLY				  ; 7A | Pull Y register from stack
	ADC $782E,Y		  ; 79 2E 78 | Add with carry (absolute,Y)
	AND ($76),Y		  ; 31 76 | Logical AND with accumulator ((zero page),Y)
	DEC				  ; 3A | Decrement accumulator
	AND $4071,X		  ; 3D 71 40 | Logical AND with accumulator (absolute,X)
	WDM #$6D			 ; 42 6D | Reserved instruction
	EOR $6C			  ; 45 6C | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	ROR				  ; 6A | Rotate right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	EOR $4F66			; 4D 66 4F | Exclusive OR with accumulator (absolute)
	STZ $52			  ; 64 52 | Store zero to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_242
; Address: $CDB4A9
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_242:
	LSR $8259,X		  ; 5E 59 82 | Logical shift right (absolute,X)
	ASL $82			  ; 06 82 | Arithmetic shift left (zero page)
	ORA #$82			 ; 09 82 | Logical OR with accumulator (immediate)
	BPL $81			  ; 10 81 | Branch if positive
	STA ($16,X)		  ; 81 16 | Update graphics data
	BRA $19			  ; 80 19 | Branch always
	ROR $7D22,X		  ; 7E 22 7D | Rotate right (absolute,X)
	ROL $7C			  ; 26 7C | Rotate left (zero page)
	AND #$7B			 ; 29 7B | Logical AND with accumulator (immediate)
	BIT $2F7A			; 2C 7A 2F | Test bits in accumulator (absolute)
	ADC $7732,Y		  ; 79 32 77 | Add with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	DEC				  ; 3A | Decrement accumulator
	AND $4071,X		  ; 3D 71 40 | Logical AND with accumulator (absolute,X)
	BVS $43			  ; 70 43 | Branch if overflow set
	ROR $6C46			; 6E 46 6C | Rotate right (absolute)
	PHA				  ; 48 | Push accumulator to stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_243
; Address: $CDB4DF
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_243:
	ADC #$4E			 ; 69 4E | Add with carry (immediate)
	BVC $65			  ; 50 65 | Branch if overflow clear
	ADC ($57,X)		  ; 61 57 | Add with carry ((zero page,X))
	LSR $835A,X		  ; 5E 5A 83 | Logical shift right (absolute,X)
	ASL $83			  ; 06 83 | Arithmetic shift left (zero page)
	ORA #$83			 ; 09 83 | Logical OR with accumulator (immediate)
	BPL $82			  ; 10 82 | Branch if positive
	STA ($19,X)		  ; 81 19 | Update graphics data
	BRA $1C			  ; 80 1C | Branch always
	BRA $20			  ; 80 20 | Branch always
	ROR $7D26,X		  ; 7E 26 7D | Rotate right (absolute,X)
	AND #$7C			 ; 29 7C | Logical AND with accumulator (immediate)
	BIT $2F7B			; 2C 7B 2F | Test bits in accumulator (absolute)
	ADC $7832,Y		  ; 79 32 78 | Add with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	ROL $4172,X		  ; 3E 72 41 | Rotate left (absolute,X)
	ADC ($43),Y		  ; 71 43 | Add with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_244
; Address: $CDB51A
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_244:
	LSR $6D			  ; 46 6D | Logical shift right (zero page)
	EOR #$6B			 ; 49 6B | Exclusive OR with accumulator (immediate)
	JMP $4E6A			; 4C 6A 4E | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($66),Y		  ; 51 66 | Exclusive OR with accumulator ((zero page),Y)
	ADC ($58,X)		  ; 61 58 | Add with carry ((zero page,X))
	STY $00			  ; 84 00 | Store Y register to zero page
	STY $03			  ; 84 03 | Store Y register to zero page
	STY $06			  ; 84 06 | Store Y register to zero page
	STY $09			  ; 84 09 | Store Y register to zero page
	STY $0D			  ; 84 0D | Store Y register to zero page
	BPL $83			  ; 10 83 | Branch if positive
	ORA $1D81,Y		  ; 19 81 1D | Logical OR with accumulator (absolute,Y)
	STA ($20,X)		  ; 81 20 | Update graphics data
	BRA $23			  ; 80 23 | Branch always
	ROL $7E			  ; 26 7E | Rotate left (zero page)
	AND #$7D			 ; 29 7D | Logical AND with accumulator (immediate)
	BIT $2F7C			; 2C 7C 2F | Test bits in accumulator (absolute)
	PLY				  ; 7A | Pull Y register from stack
	ADC $7835,Y		  ; 79 35 78 | Add with carry (absolute,Y)
	SEC				  ; 38 | Set carry flag
	ROL $4173,X		  ; 3E 73 41 | Rotate left (absolute,X)
	BVS $47			  ; 70 47 | Branch if overflow set
	ROR $6C49			; 6E 49 6C | Rotate right (absolute)
	JMP $4F6A			; 4C 6A 4F | Jump to address
	PLA				  ; 68 | Pull accumulator from stack
	EOR ($66),Y		  ; 51 66 | Exclusive OR with accumulator ((zero page),Y)
	STZ $56			  ; 64 56 | Store zero to zero page
	EOR $5B60,Y		  ; 59 60 5B | Exclusive OR with accumulator (absolute,Y)
	STA $00			  ; 85 00 | Update graphics data
	STA $03			  ; 85 03 | Update graphics data
	STA $06			  ; 85 06 | Update graphics data
	STA $09			  ; 85 09 | Update graphics data
	STA $0D			  ; 85 0D | Update graphics data
	STY $10			  ; 84 10 | Store Y register to zero page
	STY $13			  ; 84 13 | Store Y register to zero page
	STY $16			  ; 84 16 | Store Y register to zero page
	INC				  ; 1A | Increment accumulator
	ORA $2081,X		  ; 1D 81 20 | Logical OR with accumulator (absolute,X)
	STA ($23,X)		  ; 81 23 | Update graphics data
	BRA $26			  ; 80 26 | Branch always
	ROL				  ; 2A | Rotate left (accumulator)
	ROR $7D2D,X		  ; 7E 2D 7D | Rotate right (absolute,X)
	BMI $7B			  ; 30 7B | Branch if negative
	PLY				  ; 7A | Pull Y register from stack
	ADC $7739,Y		  ; 79 39 77 | Add with carry (absolute,Y)
	WDM #$72			 ; 42 72 | Reserved instruction
	ADC ($47),Y		  ; 71 47 | Add with carry ((zero page),Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $6B4D			; 6D 4D 6B | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_245
; Address: $CDB5A1
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_245:
	ADC #$52			 ; 69 52 | Add with carry (immediate)
	ADC $57			  ; 65 57 | Add with carry (zero page)
	EOR $5C61,Y		  ; 59 61 5C | Exclusive OR with accumulator (absolute,Y)
	STX $00			  ; 86 00 | Store X register to zero page
	STX $03			  ; 86 03 | Store X register to zero page
	STX $06			  ; 86 06 | Store X register to zero page
	STX $09			  ; 86 09 | Store X register to zero page
	STX $0D			  ; 86 0D | Store X register to zero page
	STA $10			  ; 85 10 | Update graphics data
	STA $13			  ; 85 13 | Update graphics data
	STA $17			  ; 85 17 | Update graphics data
	STY $1A			  ; 84 1A | Store Y register to zero page
	ORA $2082,X		  ; 1D 82 20 | Logical OR with accumulator (absolute,X)
	BIT $81			  ; 24 81 | Test bits in accumulator (zero page)
	BRA $2A			  ; 80 2A | Branch always
	AND $307D			; 2D 7D 30 | Logical AND with accumulator (absolute)
	PLY				  ; 7A | Pull Y register from stack
	AND $3C78,Y		  ; 39 78 3C | Logical AND with accumulator (absolute,Y)
	WDM #$73			 ; 42 73 | Reserved instruction
	EOR $72			  ; 45 72 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	BVS $4B			  ; 70 4B | Branch if overflow set
	ROR $6C4D			; 6E 4D 6C | Rotate right (absolute)
	BVC $6A			  ; 50 6A | Branch if overflow clear
	PLA				  ; 68 | Pull accumulator from stack
	ROR $58			  ; 66 58 | Rotate right (zero page)
	STZ $5A			  ; 64 5A | Store zero to zero page
	ADC ($5D,X)		  ; 61 5D | Add with carry ((zero page,X))
	ASL $87			  ; 06 87 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $1086			; 0D 86 10 | Logical OR with accumulator (absolute)
	STX $13			  ; 86 13 | Store X register to zero page
	STA $17			  ; 85 17 | Update graphics data
	STA $1A			  ; 85 1A | Update graphics data
	STY $1D			  ; 84 1D | Store Y register to zero page
	AND ($83,X)		  ; 21 83 | Logical AND with accumulator ((zero page,X))
	BIT $82			  ; 24 82 | Test bits in accumulator (zero page)
	STA ($2A,X)		  ; 81 2A | Update graphics data
	BRA $2D			  ; 80 2D | Branch always
	ROR $7D30,X		  ; 7E 30 7D | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	DEC				  ; 3A | Decrement accumulator
	ADC $773D,Y		  ; 79 3D 77 | Add with carry (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	EOR $72			  ; 45 72 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	ADC ($4B),Y		  ; 71 4B | Add with carry ((zero page),Y)
	LSR $516D			; 4E 6D 51 | Logical shift right (absolute)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_247
; Address: $CDB625
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_247:
	ROR $58			  ; 66 58 | Rotate right (zero page)
	STZ $5B			  ; 64 5B | Store zero to zero page
	EOR $0088,X		  ; 5D 88 00 | Exclusive OR with accumulator (absolute,X)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	ASL $88			  ; 06 88 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEY				  ; 88 | Decrement Y register
	ORA $1087			; 0D 87 10 | Logical OR with accumulator (absolute)
	STX $17			  ; 86 17 | Store X register to zero page
	STX $1A			  ; 86 1A | Store X register to zero page
	STA $1E			  ; 85 1E | Update graphics data
	STY $21			  ; 84 21 | PPU graphics register access
	STY $24			  ; 84 24 | Store Y register to zero page
	ROL				  ; 2A | Rotate left (accumulator)
	BRA $2E			  ; 80 2E | Branch always
	AND ($7E),Y		  ; 31 7E | Logical AND with accumulator ((zero page),Y)
	ADC $7B37,X		  ; 7D 37 7B | Add with carry (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	PLY				  ; 7A | Pull Y register from stack
	AND $4078,X		  ; 3D 78 40 | Logical AND with accumulator (absolute,X)
	LSR $73			  ; 46 73 | Logical shift right (zero page)
	EOR #$71			 ; 49 71 | Exclusive OR with accumulator (immediate)
	JMP $4E70			; 4C 70 4E | Jump to address
	ROR $6C51			; 6E 51 6C | Rotate right (absolute)
	ADC #$56			 ; 69 56 | Add with carry (immediate)
	EOR $5C65,Y		  ; 59 65 5C | Exclusive OR with accumulator (absolute,Y)
	LSR $0089,X		  ; 5E 89 00 | Logical shift right (absolute,X)
	BIT #$03			 ; 89 03 | Test bits in accumulator (immediate)
	BIT #$06			 ; 89 06 | Test bits in accumulator (immediate)
	BIT #$0A			 ; 89 0A | Test bits in accumulator (immediate)
	BIT #$0D			 ; 89 0D | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	BPL $88			  ; 10 88 | Branch if positive
	INC				  ; 1A | Increment accumulator
	STX $1E			  ; 86 1E | Store X register to zero page
	STA $21			  ; 85 21 | PPU graphics register access
	STA $24			  ; 85 24 | Update graphics data
	STY $28			  ; 84 28 | Store Y register to zero page
	STA ($2E,X)		  ; 81 2E | Update graphics data
	BRA $31			  ; 80 31 | Branch always
	ROR $7C37,X		  ; 7E 37 7C | Rotate right (absolute,X)
	ROL $4179,X		  ; 3E 79 41 | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	LSR $74			  ; 46 74 | Logical shift right (zero page)
	EOR #$72			 ; 49 72 | Exclusive OR with accumulator (immediate)
	JMP $4F70			; 4C 70 4F | Jump to address
	ROR $6C52			; 6E 52 6C | Rotate right (absolute)
	ROR				  ; 6A | Rotate right (accumulator)
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_248
; Address: $CDB6A6
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_248:
	PHY				  ; 5A | Push Y register to stack
	ROR $5C			  ; 66 5C | Rotate right (zero page)
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	ASL $8A			  ; 06 8A | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator
	ORA $1189			; 0D 89 11 | Logical OR with accumulator (absolute)
	BIT #$14			 ; 89 14 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	ASL $2186,X		  ; 1E 86 21 | PPU graphics register access
	STA $25			  ; 85 25 | Update graphics data
	STA $28			  ; 85 28 | Update graphics data
	ROL $3281			; 2E 81 32 | Rotate left (absolute)
	BRA $35			  ; 80 35 | Branch always
	SEC				  ; 38 | Set carry flag
	ADC $7C3B,X		  ; 7D 3B 7C | Add with carry (absolute,X)
	ROL $417A,X		  ; 3E 7A 41 | Rotate left (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR $5071			; 4D 71 50 | Exclusive OR with accumulator (absolute)
	ADC $6B55			; 6D 55 6B | Add with carry (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	ADC #$5A			 ; 69 5A | Add with carry (immediate)
	ROR $5D			  ; 66 5D | Rotate right (zero page)
	STZ $5F			  ; 64 5F | Store zero to zero page
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	PHB				  ; 8B | Push data bank register to stack
	ASL $8B			  ; 06 8B | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHB				  ; 8B | Push data bank register to stack
	ORA $118A			; 0D 8A 11 | Logical OR with accumulator (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$17			 ; 89 17 | Test bits in accumulator (immediate)
	BIT #$1B			 ; 89 1B | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	ASL $2287,X		  ; 1E 87 22 | Arithmetic shift left (absolute,X)
	STX $25			  ; 86 25 | Store X register to zero page
	STA $28			  ; 85 28 | Update graphics data
	STY $2B			  ; 84 2B | Store Y register to zero page
	STA ($35,X)		  ; 81 35 | Update graphics data
	SEC				  ; 38 | Set carry flag
	ROR $7D3B,X		  ; 7E 3B 7D | Rotate right (absolute,X)
	ROL $417B,X		  ; 3E 7B 41 | Rotate left (absolute,X)
	ADC $7845,Y		  ; 79 45 78 | Add with carry (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR $5072			; 4D 72 50 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_249
; Address: $CDB71F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_249:
	BVS $53			  ; 70 53 | Branch if overflow set
	ROR $6C56			; 6E 56 6C | Rotate right (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	ROR				  ; 6A | Rotate right (accumulator)
	LSR $6065,X		  ; 5E 65 60 | Logical shift right (absolute,X)
	STY $8C00			; 8C 00 8C | Store Y register to absolute address
	STY $8C06			; 8C 06 8C | Store Y register to absolute address
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STY $8B0D			; 8C 0D 8B | Store Y register to absolute address
	ORA ($8B),Y		  ; 11 8B | Logical OR with accumulator ((zero page),Y)
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$1E			 ; 89 1E | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_24A
; Address: $CDB740
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_24A:
	JSL $862587		  ; 22 87 25 86 | Jump to subroutine long
	PLP				  ; 28 | Pull processor status from stack
	STA $2C			  ; 85 2C | Update graphics data
	STY $2F			  ; 84 2F | Store Y register to zero page
	BRA $39			  ; 80 39 | Branch always
	ADC $7C3F,X		  ; 7D 3F 7C | Add with carry (absolute,X)
	WDM #$7A			 ; 42 7A | Reserved instruction
	EOR $78			  ; 45 78 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	LSR $5173			; 4E 73 51 | Logical shift right (absolute)
	ADC ($53),Y		  ; 71 53 | Add with carry ((zero page),Y)
	JMP ($6A59)		  ; 6C 59 6A | Jump to address (absolute indirect)
	JMP $665E68		  ; 5C 68 5E 66 | Jump to address long
	ADC ($8D,X)		  ; 61 8D | Add with carry ((zero page,X))
	STA $8D03			; 8D 03 8D | Update graphics data
	ASL $8D			  ; 06 8D | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $8C0D			; 8D 0D 8C | Update graphics data
	ORA ($8C),Y		  ; 11 8C | Logical OR with accumulator ((zero page),Y)
	PHB				  ; 8B | Push data bank register to stack
	CLC				  ; 18 | Clear carry flag
	PHB				  ; 8B | Push data bank register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	BIT #$22			 ; 89 22 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	AND $87			  ; 25 87 | Logical AND with accumulator (zero page)
	AND #$86			 ; 29 86 | Logical AND with accumulator (immediate)
	BIT $2F85			; 2C 85 2F | Test bits in accumulator (absolute)
	STY $33			  ; 84 33 | Store Y register to zero page
	STA ($39,X)		  ; 81 39 | Update graphics data
	BRA $3C			  ; 80 3C | Branch always
	ROR $7D3F,X		  ; 7E 3F 7D | Rotate right (absolute,X)
	WDM #$7B			 ; 42 7B | Reserved instruction
	EOR $79			  ; 45 79 | Exclusive OR with accumulator (zero page)
	EOR #$77			 ; 49 77 | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_24B
; Address: $CDB79C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_24B:
	LSR $5174			; 4E 74 51 | Logical shift right (absolute)
	ADC $6B5A			; 6D 5A 6B | Add with carry (absolute)
	JMP $665F69		  ; 5C 69 5F 66 | Jump to address long
	ADC ($8E,X)		  ; 61 8E | Add with carry ((zero page,X))
	STX $8E03			; 8E 03 8E | Store X register to absolute address
	STX $8E0A			; 8E 0A 8E | Store X register to absolute address
	ASL $118D			; 0E 8D 11 | Arithmetic shift left (absolute)
	STA $8C14			; 8D 14 8C | Update graphics data
	CLC				  ; 18 | Clear carry flag
	STY $8B1B			; 8C 1B 8B | Store Y register to absolute address
	TXA				  ; 8A | Transfer X register to accumulator

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_24C
; Address: $CDB7C0
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_24C:
	JSL $882689		  ; 22 89 26 88 | Jump to subroutine long
	AND #$87			 ; 29 87 | Logical AND with accumulator (immediate)
	BIT $3086			; 2C 86 30 | Test bits in accumulator (absolute)
	STA $33			  ; 85 33 | Update graphics data
	STY $36			  ; 84 36 | Store Y register to zero page
	AND $3D81,Y		  ; 39 81 3D | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	ROR $7C43,X		  ; 7E 43 7C | Rotate right (absolute,X)
	LSR $7A			  ; 46 7A | Logical shift right (zero page)
	EOR #$78			 ; 49 78 | Exclusive OR with accumulator (immediate)
	JMP $4F76			; 4C 76 4F | Jump to address
	BVS $57			  ; 70 57 | Branch if overflow set
	ROR $6C5A			; 6E 5A 6C | Rotate right (absolute)
	EOR $6069,X		  ; 5D 69 60 | Exclusive OR with accumulator (absolute,X)
	STA $038F00		  ; 8F 00 8F 03 | Update graphics data
	STA $0A8F07		  ; 8F 07 8F 0A | Update graphics data
	STA $118E0E		  ; 8F 0E 8E 11 | Update graphics data
	STX $8D15			; 8E 15 8D | Store X register to absolute address
	CLC				  ; 18 | Clear carry flag
	STA $8C1C			; 8D 1C 8C | Update graphics data
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_24D
; Address: $CDB800
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_24D:
	JSL $89268A		  ; 22 8A 26 89 | Jump to subroutine long
	AND #$88			 ; 29 88 | Logical AND with accumulator (immediate)
	AND $3087			; 2D 87 30 | Logical AND with accumulator (absolute)
	STX $33			  ; 86 33 | Store X register to zero page
	STA $37			  ; 85 37 | Update graphics data
	DEC				  ; 3A | Decrement accumulator
	AND $4080,X		  ; 3D 80 40 | Logical AND with accumulator (absolute,X)
	ROR $7D43,X		  ; 7E 43 7D | Rotate right (absolute,X)
	LSR $7B			  ; 46 7B | Logical shift right (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	ADC $774D,Y		  ; 79 4D 77 | Add with carry (absolute,Y)
	BVC $75			  ; 50 75 | Branch if overflow clear
	ADC ($58),Y		  ; 71 58 | Add with carry ((zero page),Y)
	ADC $6A5E			; 6D 5E 6A | Add with carry (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_24E
; Address: $CDB829
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_24E:
	PLA				  ; 68 | Pull accumulator from stack
	BCC $00			  ; 90 00 | Branch if carry clear
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_24F
; Address: $CDB82F
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_24F:
	BCC $07			  ; 90 07 | Branch if carry clear
	BCC $0A			  ; 90 0A | Branch if carry clear
	BCC $0E			  ; 90 0E | Branch if carry clear
	STA $158F11		  ; 8F 11 8F 15 | Update graphics data
	STX $8E18			; 8E 18 8E | Store X register to absolute address
	STA $8C1F			; 8D 1F 8C | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	ROL $8A			  ; 26 8A | Rotate left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	BIT #$2D			 ; 89 2D | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	BMI $87			  ; 30 87 | Branch if negative
	STA $37			  ; 85 37 | Update graphics data
	STY $3A			  ; 84 3A | Store Y register to zero page
	AND $4181,X		  ; 3D 81 41 | Logical AND with accumulator (absolute,X)
	ROR $7C47,X		  ; 7E 47 7C | Rotate right (absolute,X)
	LSR				  ; 4A | Logical shift right (accumulator)
	PLY				  ; 7A | Pull Y register from stack
	EOR $5078			; 4D 78 50 | Exclusive OR with accumulator (absolute)
	EOR $5B70,Y		  ; 59 70 5B | Exclusive OR with accumulator (absolute,Y)
	ADC $6B5E			; 6D 5E 6B | Add with carry (absolute)
	ADC ($69,X)		  ; 61 69 | Add with carry ((zero page,X))
	STA ($00),Y		  ; 91 00 | Update graphics data
	STA ($03),Y		  ; 91 03 | Update graphics data
	STA ($07),Y		  ; 91 07 | Update graphics data
	STA ($0A),Y		  ; 91 0A | Update graphics data
	STA ($0E),Y		  ; 91 0E | Update graphics data
	BCC $11			  ; 90 11 | Branch if carry clear
	BCC $15			  ; 90 15 | Branch if carry clear
	STA $1C8F18		  ; 8F 18 8F 1C | Update graphics data
	STX $8D1F			; 8E 1F 8D | Store X register to absolute address
	STY $8B26			; 8C 26 8B | Store Y register to absolute address
	ROL				  ; 2A | Rotate left (accumulator)
	TXA				  ; 8A | Transfer X register to accumulator
	AND $3189			; 2D 89 31 | Logical AND with accumulator (absolute)
	DEY				  ; 88 | Decrement Y register
	STX $37			  ; 86 37 | Store X register to zero page
	STA $3B			  ; 85 3B | Update graphics data
	ROL $4182,X		  ; 3E 82 41 | Rotate left (absolute,X)
	BRA $44			  ; 80 44 | Branch always
	ADC $7B4B,X		  ; 7D 4B 7B | Add with carry (absolute,X)
	LSR $5179			; 4E 79 51 | Logical shift right (absolute)
	EOR $5C70,Y		  ; 59 70 5C | Exclusive OR with accumulator (absolute,Y)
	ROR $6C5F			; 6E 5F 6C | Rotate right (absolute)
	ADC #$64			 ; 69 64 | Add with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1191			; 0E 91 11 | Arithmetic shift left (absolute)
	STA ($15),Y		  ; 91 15 | Update graphics data
	BCC $19			  ; 90 19 | Branch if carry clear
	BCC $1C			  ; 90 1C | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_250
; Address: $CDB8BD
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_250:
	STA $238E20		  ; 8F 20 8E 23 | Update graphics data
	STA $8C27			; 8D 27 8C | Update graphics data
	ROL				  ; 2A | Rotate left (accumulator)
	PHB				  ; 8B | Push data bank register to stack
	ROL $318A			; 2E 8A 31 | Rotate left (absolute)
	BIT #$34			 ; 89 34 | Test bits in accumulator (immediate)
	SEC				  ; 38 | Set carry flag
	STX $3B			  ; 86 3B | Store X register to zero page
	STY $3E			  ; 84 3E | Store Y register to zero page
	WDM #$81			 ; 42 81 | Reserved instruction
	EOR $7F			  ; 45 7F | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	ROR $7C4B,X		  ; 7E 4B 7C | Rotate right (absolute,X)
	LSR $517A			; 4E 7A 51 | Logical shift right (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	PHY				  ; 5A | Push Y register to stack
	ADC ($5D),Y		  ; 71 5D | Add with carry ((zero page),Y)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_251
; Address: $CDB8E7
; Size: 71 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_251:
	JMP ($6A62)		  ; 6C 62 6A | Jump to address (absolute indirect)
	ADC $93			  ; 65 93 | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1292			; 0E 92 12 | Arithmetic shift left (absolute)
	STA ($19),Y		  ; 91 19 | Update graphics data
	STA ($1C),Y		  ; 91 1C | Update graphics data
	BCC $20			  ; 90 20 | Branch if carry clear
	STA $278E23		  ; 8F 23 8E 27 | Update graphics data
	STA $8C2A			; 8D 2A 8C | Update graphics data
	ROL $318B			; 2E 8B 31 | Rotate left (absolute)
	TXA				  ; 8A | Transfer X register to accumulator
	DEY				  ; 88 | Decrement Y register
	SEC				  ; 38 | Set carry flag
	STA $3F			  ; 85 3F | Update graphics data
	STY $42			  ; 84 42 | Hardware register operation
	EOR $80			  ; 45 80 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	ROR $7D4C,X		  ; 7E 4C 7D | Rotate right (absolute,X)
	ADC $7655,Y		  ; 79 55 76 | Add with carry (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $6070,X		  ; 5D 70 60 | Exclusive OR with accumulator (absolute,X)
	ADC $6B63			; 6D 63 6B | Add with carry (absolute)
	ROR $94			  ; 66 94 | Rotate right (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $1293			; 0E 93 12 | Arithmetic shift left (absolute)
	ORA $1D92,Y		  ; 19 92 1D | Logical OR with accumulator (absolute,Y)
	STA ($20),Y		  ; 91 20 | Update graphics data
	BCC $24			  ; 90 24 | Branch if carry clear
	STA $2B8E27		  ; 8F 27 8E 2B | Update graphics data
	STA $8C2E			; 8D 2E 8C | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	BIT #$39			 ; 89 39 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_252
; Address: $CDB94D
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_252:
	DEY				  ; 88 | Decrement Y register
	STX $3F			  ; 86 3F | Store X register to zero page
	STA $42			  ; 85 42 | Hardware register operation
	LSR $81			  ; 46 81 | Logical shift right (zero page)
	EOR #$7F			 ; 49 7F | Exclusive OR with accumulator (immediate)
	JMP $4F7D			; 4C 7D 4F | Jump to address
	ADC $7755,Y		  ; 79 55 77 | Add with carry (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	LSR $6170,X		  ; 5E 70 61 | Logical shift right (absolute,X)
	ROR $6B64			; 6E 64 6B | Rotate right (absolute)
	ROR $95			  ; 66 95 | Rotate right (zero page)
	ASL $1294			; 0E 94 12 | Arithmetic shift left (absolute)
	ORA $1D93,Y		  ; 19 93 1D | Logical OR with accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_253
; Address: $CDB97E
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_253:
	JSR $2491			; 20 91 24 | Jump to subroutine
	BCC $28			  ; 90 28 | Branch if carry clear
	STA $2F8E2B		  ; 8F 2B 8E 2F | Update graphics data
	STA $8B32			; 8D 32 8B | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	AND $3C89,Y		  ; 39 89 3C | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	STA $43			  ; 85 43 | Update graphics data
	STY $46			  ; 84 46 | Store Y register to zero page
	EOR #$80			 ; 49 80 | Exclusive OR with accumulator (immediate)
	EOR $507E			; 4D 7E 50 | Exclusive OR with accumulator (absolute)
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	EOR $5C76,Y		  ; 59 76 5C | Exclusive OR with accumulator (absolute,Y)
	ADC ($61),Y		  ; 71 61 | Add with carry ((zero page),Y)
	STZ $6C			  ; 64 6C | Store zero to zero page
	ASL $1295			; 0E 95 12 | Arithmetic shift left (absolute)
	ORA $1D94,Y		  ; 19 94 1D | Logical OR with accumulator (absolute,Y)
	AND ($92,X)		  ; 21 92 | Logical AND with accumulator ((zero page,X))
	BIT $91			  ; 24 91 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BCC $2B			  ; 90 2B | Branch if carry clear
	STA $328E2F		  ; 8F 2F 8E 32 | Update graphics data
	STY $8B36			; 8C 36 8B | Store Y register to absolute address
	AND $3D8A,Y		  ; 39 8A 3D | Logical AND with accumulator (absolute,Y)
	DEY				  ; 88 | Decrement Y register
	RTI				  ; 40 | Return from interrupt
	STX $43			  ; 86 43 | Store X register to zero page
	STA $47			  ; 85 47 | Update graphics data
	LSR				  ; 4A | Logical shift right (accumulator)
	STA ($4D,X)		  ; 81 4D | Update graphics data
	BVC $7D			  ; 50 7D | Branch if overflow clear
	ADC $7759,Y		  ; 79 59 77 | Add with carry (absolute,Y)
	JMP $725F74		  ; 5C 74 5F 72 | Jump to address long
	ADC $6D			  ; 65 6D | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	ASL $1296			; 0E 96 12 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_254
; Address: $CDB9FA
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_254:
	ORA $1D95,Y		  ; 19 95 1D | Logical OR with accumulator (absolute,Y)
	AND ($93,X)		  ; 21 93 | Logical AND with accumulator ((zero page,X))
	BIT $92			  ; 24 92 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	STA ($2C),Y		  ; 91 2C | Update graphics data
	BCC $2F			  ; 90 2F | Branch if carry clear
	STA $368D33		  ; 8F 33 8D 36 | Update graphics data
	STY $8A3A			; 8C 3A 8A | Store Y register to absolute address
	AND $4089,X		  ; 3D 89 40 | Logical AND with accumulator (absolute,X)
	STX $47			  ; 86 47 | Store X register to zero page
	STY $4A			  ; 84 4A | Store Y register to zero page
	LSR $5180			; 4E 80 51 | Logical shift right (absolute)
	ROR $7C54,X		  ; 7E 54 7C | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	PHY				  ; 5A | Push Y register to stack
	EOR $6075,X		  ; 5D 75 60 | Exclusive OR with accumulator (absolute,X)
	BVS $66			  ; 70 66 | Branch if overflow set
	ROR $9868			; 6E 68 98 | Rotate right (absolute)
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL $1297			; 0E 97 12 | Arithmetic shift left (absolute)
	INC				  ; 1A | Increment accumulator
	ORA $2195,X		  ; 1D 95 21 | PPU graphics register access
	AND $93			  ; 25 93 | Logical AND with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BIT $2F91			; 2C 91 2F | Test bits in accumulator (absolute)
	BCC $33			  ; 90 33 | Branch if carry clear
	STX $8D37			; 8E 37 8D | Store X register to absolute address
	DEC				  ; 3A | Decrement accumulator
	PHB				  ; 8B | Push data bank register to stack
	ROL $418A,X		  ; 3E 8A 41 | Rotate left (absolute,X)
	DEY				  ; 88 | Decrement Y register
	STX $48			  ; 86 48 | Store X register to zero page
	STA $4B			  ; 85 4B | Update graphics data
	LSR $5181			; 4E 81 51 | Logical shift right (absolute)
	ADC $7A58,X		  ; 7D 58 7A | Add with carry (absolute,X)
	SEI				  ; 78 | Set interrupt disable flag
	LSR $6176,X		  ; 5E 76 61 | Logical shift right (absolute,X)
	ADC ($66),Y		  ; 71 66 | Add with carry ((zero page),Y)
	ROR $9969			; 6E 69 99 | Rotate right (absolute)
	STA $9903,Y		  ; 99 03 99 | Update graphics data
	STA $990B,Y		  ; 99 0B 99 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	INC				  ; 1A | Increment accumulator
	ASL $2196,X		  ; 1E 96 21 | PPU graphics register access
	AND $94			  ; 25 94 | Logical AND with accumulator (zero page)
	AND #$93			 ; 29 93 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_255
; Address: $CDBA84
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_255:
	BIT $3092			; 2C 92 30 | Test bits in accumulator (absolute)
	BCC $33			  ; 90 33 | Branch if carry clear
	STA $3A8E37		  ; 8F 37 8E 3A | Update graphics data
	STY $8B3E			; 8C 3E 8B | Store Y register to absolute address
	EOR ($89,X)		  ; 41 89 | Exclusive OR with accumulator ((zero page,X))
	EOR $87			  ; 45 87 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	STA $4B			  ; 85 4B | Update graphics data
	STY $4F			  ; 84 4F | Store Y register to zero page
	BRA $55			  ; 80 55 | Branch always
	ADC $7B58,X		  ; 7D 58 7B | Add with carry (absolute,X)
	ADC $775E,Y		  ; 79 5E 77 | Add with carry (absolute,Y)
	ADC ($74,X)		  ; 61 74 | Add with carry ((zero page,X))
	STZ $72			  ; 64 72 | Store zero to zero page
	ROR				  ; 6A | Rotate right (accumulator)
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $9912,Y		  ; 99 12 99 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	INC				  ; 1A | Increment accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	ASL $2197,X		  ; 1E 97 21 | PPU graphics register access
	AND $95			  ; 25 95 | Logical AND with accumulator (zero page)
	AND #$94			 ; 29 94 | Logical AND with accumulator (immediate)
	BIT $3093			; 2C 93 30 | Test bits in accumulator (absolute)
	STA ($34),Y		  ; 91 34 | Update graphics data
	BCC $37			  ; 90 37 | Branch if carry clear
	STA $3E8D3B		  ; 8F 3B 8D 3E | Update graphics data
	STY $8A42			; 8C 42 8A | Store Y register to absolute address
	EOR $88			  ; 45 88 | Exclusive OR with accumulator (zero page)
	EOR #$86			 ; 49 86 | Exclusive OR with accumulator (immediate)
	JMP $4F84			; 4C 84 4F | Jump to address
	BRA $56			  ; 80 56 | Branch always
	ROR $7C59,X		  ; 7E 59 7C | Rotate right (absolute,X)
	JMP $775F7A		  ; 5C 7A 5F 77 | Jump to address long
	ADC $72			  ; 65 72 | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	BVS $6A			  ; 70 6A | Branch if overflow set
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $991A,Y		  ; 99 1A 99 | Update graphics data
	ASL $2298,X		  ; 1E 98 22 | Arithmetic shift left (absolute,X)
	AND $96			  ; 25 96 | Logical AND with accumulator (zero page)
	AND #$95			 ; 29 95 | Logical AND with accumulator (immediate)
	AND $3094			; 2D 94 30 | Logical AND with accumulator (absolute)
	STA ($38),Y		  ; 91 38 | Update graphics data
	BCC $3B			  ; 90 3B | Branch if carry clear

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_256
; Address: $CDBB0D
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_256:
	STX $8D3F			; 8E 3F 8D | Store X register to absolute address
	WDM #$8B			 ; 42 8B | Reserved instruction
	LSR $89			  ; 46 89 | Logical shift right (zero page)
	EOR #$87			 ; 49 87 | Exclusive OR with accumulator (immediate)
	JMP $5085			; 4C 85 50 | Jump to address
	STA ($56,X)		  ; 81 56 | Update graphics data
	EOR $5C7D,Y		  ; 59 7D 5C | Exclusive OR with accumulator (absolute,Y)
	PLY				  ; 7A | Pull Y register from stack
	SEI				  ; 78 | Set interrupt disable flag
	ADC $73			  ; 65 73 | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	BVS $6B			  ; 70 6B | Branch if overflow set
	STZ $9C00			; 9C 00 9C | Store zero to absolute
	STZ $9C07			; 9C 07 9C | Store zero to absolute
	STZ $9B0F			; 9C 0F 9B | Store zero to absolute
	TXS				  ; 9A | Transfer X register to stack pointer
	INC				  ; 1A | Increment accumulator
	STA $991E,Y		  ; 99 1E 99 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_257
; Address: $CDBB3E
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_257:
	JSL $972698		  ; 22 98 26 97 | Jump to subroutine long
	AND #$96			 ; 29 96 | Logical AND with accumulator (immediate)
	AND $3195			; 2D 95 31 | Logical AND with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	STA ($3C),Y		  ; 91 3C | Update graphics data
	STA $438D3F		  ; 8F 3F 8D 43 | Update graphics data
	STY $8A46			; 8C 46 8A | Store Y register to absolute address
	LSR				  ; 4A | Logical shift right (accumulator)
	DEY				  ; 88 | Decrement Y register
	EOR $5086			; 4D 86 50 | Exclusive OR with accumulator (absolute)
	STY $53			  ; 84 53 | Store Y register to zero page
	BRA $5A			  ; 80 5A | Branch always
	ROR $7B5D,X		  ; 7E 5D 7B | Rotate right (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_258
; Address: $CDBB63
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_258:
	ADC $7663,Y		  ; 79 63 76 | Add with carry (absolute,Y)
	ROR $74			  ; 66 74 | Rotate right (zero page)
	ADC #$71			 ; 69 71 | Add with carry (immediate)
	JMP ($009D)		  ; 6C 9D 00 | Jump to address (absolute indirect)
	STA $9D03,X		  ; 9D 03 9D | Update graphics data
	STA $9D0B,X		  ; 9D 0B 9D | Update graphics data
	STZ $9C13			; 9C 13 9C | Store zero to absolute
	TXS				  ; 9A | Transfer X register to stack pointer
	ASL $229A,X		  ; 1E 9A 22 | Arithmetic shift left (absolute,X)
	STA $9826,Y		  ; 99 26 98 | Update graphics data
	ROL				  ; 2A | Rotate left (accumulator)
	AND $3196			; 2D 96 31 | Logical AND with accumulator (absolute)
	SEC				  ; 38 | Set carry flag
	STA ($3C),Y		  ; 91 3C | Update graphics data
	BCC $40			  ; 90 40 | Branch if carry clear
	STX $8D43			; 8E 43 8D | Store X register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_259
; Address: $CDBB95
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_259:
	BIT #$4D			 ; 89 4D | Test bits in accumulator (immediate)
	EOR ($85),Y		  ; 51 85 | Exclusive OR with accumulator ((zero page),Y)
	STA ($5A,X)		  ; 81 5A | Update graphics data
	ROR $7C5E,X		  ; 7E 5E 7C | Rotate right (absolute,X)
	ADC ($7A,X)		  ; 61 7A | Add with carry ((zero page,X))
	STZ $77			  ; 64 77 | Store zero to zero page
	ROR				  ; 6A | Rotate right (accumulator)
	JMP ($009E)		  ; 6C 9E 00 | Jump to address (absolute indirect)
	STZ $9E03,X		  ; 9E 03 9E | Store zero to absolute,X
	STZ $9E0B,X		  ; 9E 0B 9E | Store zero to absolute,X
	STA $9D13,X		  ; 9D 13 9D | Update graphics data
	STZ $9B1B			; 9C 1B 9B | Store zero to absolute

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_25A
; Address: $CDBBBE
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_25A:
	JSL $99269A		  ; 22 9A 26 99 | Jump to subroutine long
	ROL				  ; 2A | Rotate left (accumulator)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROL $3196			; 2E 96 31 | Rotate left (absolute)
	AND $3C92,Y		  ; 39 92 3C | Logical AND with accumulator (absolute,Y)
	STA ($40),Y		  ; 91 40 | Update graphics data
	STA $478E43		  ; 8F 43 8E 47 | Update graphics data
	STY $8A4A			; 8C 4A 8A | Store Y register to absolute address
	LSR $5188			; 4E 88 51 | Logical shift right (absolute)
	STX $55			  ; 86 55 | Store X register to zero page
	STY $58			  ; 84 58 | Store Y register to zero page
	STA ($5B,X)		  ; 81 5B | Update graphics data
	LSR $617D,X		  ; 5E 7D 61 | Logical shift right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	STZ $78			  ; 64 78 | Store zero to zero page
	ROR				  ; 6A | Rotate right (accumulator)
	ADC $009F			; 6D 9F 00 | Add with carry (absolute)
	STA				  ; 9F 03 9F 07 | Update graphics data
	STA				  ; 9F 0B 9F 0F | Update graphics data
	STZ $9E13,X		  ; 9E 13 9E | Store zero to absolute,X
	STA $9C1B,X		  ; 9D 1B 9C | Update graphics data
	STZ $9B23			; 9C 23 9B | Store zero to absolute
	ROL $9A			  ; 26 9A | Rotate left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	STA $972E,Y		  ; 99 2E 97 | Update graphics data
	AND $3D93,Y		  ; 39 93 3D | Logical AND with accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	BCC $44			  ; 90 44 | Branch if carry clear
	STX $8D47			; 8E 47 8D | Store X register to absolute address
	PHB				  ; 8B | Push data bank register to stack
	LSR $5289			; 4E 89 52 | Logical shift right (absolute)
	STA $58			  ; 85 58 | Update graphics data
	JMP $7E5F80		  ; 5C 80 5F 7E | Jump to address long
	ADC $79			  ; 65 79 | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_25C
; Address: $CDBC2F
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_25C:
	LDY #$07			 ; A0 07 | Load immediate value into Y register
	LDY #$0B			 ; A0 0B | Load immediate value into Y register
	LDY #$0F			 ; A0 0F | Load immediate value into Y register
	STA				  ; 9F 13 9F 17 | Update graphics data
	STZ $9D1B,X		  ; 9E 1B 9D | Store zero to absolute,X
	STA $9C23,X		  ; 9D 23 9C | Update graphics data
	ROL				  ; 2A | Rotate left (accumulator)
	TXS				  ; 9A | Transfer X register to stack pointer
	ROL $3298			; 2E 98 32 | Rotate left (absolute)
	AND $3D94,Y		  ; 39 94 3D | Logical AND with accumulator (absolute,Y)
	EOR ($91,X)		  ; 41 91 | Exclusive OR with accumulator ((zero page,X))
	STA $4B8D48		  ; 8F 48 8D 4B | Update graphics data
	STY $8A4F			; 8C 4F 8A | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	STA $59			  ; 85 59 | Update graphics data
	JMP $7E5F81		  ; 5C 81 5F 7E | Jump to address long
	ROR $79			  ; 66 79 | Rotate right (zero page)
	ADC #$77			 ; 69 77 | Add with carry (immediate)
	JMP ($6F74)		  ; 6C 74 6F | Jump to address (absolute indirect)
	LDA ($00,X)		  ; A1 00 | Read graphics status
	LDA ($03,X)		  ; A1 03 | Read graphics status
	LDA ($07,X)		  ; A1 07 | Read graphics status
	LDA ($0B,X)		  ; A1 0B | Read graphics status
	LDA ($0F,X)		  ; A1 0F | Read graphics status
	LDY #$13			 ; A0 13 | Load immediate value into Y register
	LDY #$17			 ; A0 17 | Load immediate value into Y register
	STA				  ; 9F 1B 9E 1F | Update graphics data
	STZ $9D23,X		  ; 9E 23 9D | Store zero to absolute,X
	STZ $9B2B			; 9C 2B 9B | Store zero to absolute
	STA $9832,Y		  ; 99 32 98 | Update graphics data
	DEC				  ; 3A | Decrement accumulator
	AND $4194,X		  ; 3D 94 41 | Logical AND with accumulator (absolute,X)
	EOR $90			  ; 45 90 | Exclusive OR with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	STX $8C4C			; 8E 4C 8C | Store X register to absolute address
	TXA				  ; 8A | Transfer X register to accumulator
	DEY				  ; 88 | Decrement Y register
	STX $5A			  ; 86 5A | Store X register to zero page
	STY $5D			  ; 84 5D | Store Y register to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_25D
; Address: $CDBCA3
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_25D:
	ADC $7A66,X		  ; 7D 66 7A | Add with carry (absolute,X)
	ADC #$78			 ; 69 78 | Add with carry (immediate)
	JMP ($6F75)		  ; 6C 75 6F | Jump to address (absolute indirect)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDX #$04			 ; A2 04 | Load immediate value into X register
	LDX #$07			 ; A2 07 | Load immediate value into X register
	LDX #$0B			 ; A2 0B | Load immediate value into X register
	LDX #$0F			 ; A2 0F | Load immediate value into X register
	LDA ($13,X)		  ; A1 13 | Read graphics status
	LDA ($17,X)		  ; A1 17 | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_25E
; Address: $CDBCB9
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_25E:
	LDY #$1B			 ; A0 1B | Load immediate value into Y register
	STA				  ; 9F 1F 9F 23 | Update graphics data
	STZ $9D27,X		  ; 9E 27 9D | Store zero to absolute,X
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $9836,Y		  ; 99 36 98 | Update graphics data
	DEC				  ; 3A | Decrement accumulator
	ROL $4295,X		  ; 3E 95 42 | Hardware register operation
	EOR $91			  ; 45 91 | Exclusive OR with accumulator (zero page)
	EOR #$8F			 ; 49 8F | Exclusive OR with accumulator (immediate)
	JMP $508D			; 4C 8D 50 | Jump to address
	PHB				  ; 8B | Push data bank register to stack
	BIT #$57			 ; 89 57 | Test bits in accumulator (immediate)
	PHY				  ; 5A | Push Y register to stack
	STA $5D			  ; 85 5D | Update graphics data
	ADC ($80,X)		  ; 61 80 | Add with carry ((zero page,X))
	STZ $7E			  ; 64 7E | Store zero to zero page
	ROR				  ; 6A | Rotate right (accumulator)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $7076			; 6D 76 70 | Add with carry (absolute)
	PHP				  ; 08 | Push processor status to stack
	BPL $A2			  ; 10 A2 | Branch if positive
	LDX #$18			 ; A2 18 | Load immediate value into X register
	LDA ($1C,X)		  ; A1 1C | Read graphics status
	LDY #$1F			 ; A0 1F | Load immediate value into Y register
	LDY #$23			 ; A0 23 | Load immediate value into Y register
	STA				  ; 9F 27 9E 2B | Update graphics data
	STZ $9B2F			; 9C 2F 9B | Store zero to absolute
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $973B,Y		  ; 99 3B 97 | Update graphics data
	ROL $4295,X		  ; 3E 95 42 | Hardware register operation
	LSR $92			  ; 46 92 | Logical shift right (zero page)
	EOR #$90			 ; 49 90 | Exclusive OR with accumulator (immediate)
	EOR $508E			; 4D 8E 50 | Exclusive OR with accumulator (absolute)
	STY $8A54			; 8C 54 8A | Store Y register to absolute address
	DEY				  ; 88 | Decrement Y register
	STX $5E			  ; 86 5E | Store X register to zero page
	ADC ($81,X)		  ; 61 81 | Add with carry ((zero page,X))
	STZ $7E			  ; 64 7E | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_25F
; Address: $CDBD27
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_25F:
	ADC $766E,Y		  ; 79 6E 76 | Add with carry (absolute,Y)
	ADC ($A4),Y		  ; 71 A4 | Add with carry ((zero page),Y)
	LDY $04			  ; A4 04 | Load from zero page into Y register
	LDY $08			  ; A4 08 | Load from zero page into Y register
	LDY $0C			  ; A4 0C | Load from zero page into Y register
	LDY $10			  ; A4 10 | Load from zero page into Y register
	CLC				  ; 18 | Clear carry flag
	LDX #$1C			 ; A2 1C | Load immediate value into X register
	LDA ($20,X)		  ; A1 20 | Read graphics status
	LDY #$24			 ; A0 24 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_260
; Address: $CDBD3F
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_260:
	LDY #$28			 ; A0 28 | Load immediate value into Y register
	STA				  ; 9F 2C 9D 2F | Update graphics data
	STZ $9B33			; 9C 33 9B | Store zero to absolute
	STA $983B,Y		  ; 99 3B 98 | Update graphics data
	WDM #$95			 ; 42 95 | Reserved instruction
	LSR $93			  ; 46 93 | Logical shift right (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA ($4D),Y		  ; 91 4D | Update graphics data
	STA $548D51		  ; 8F 51 8D 54 | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	CLI				  ; 58 | Clear interrupt disable flag
	BIT #$5B			 ; 89 5B | Test bits in accumulator (immediate)
	STX $5F			  ; 86 5F | Store X register to zero page
	STY $62			  ; 84 62 | Store Y register to zero page
	ADC $7F			  ; 65 7F | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_261
; Address: $CDBD67
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_261:
	PLY				  ; 7A | Pull Y register from stack
	ROR $7177			; 6E 77 71 | Rotate right (absolute)
	LDA $00			  ; A5 00 | Read graphics status
	LDA $04			  ; A5 04 | Read graphics status
	LDA $08			  ; A5 08 | Read graphics status
	LDA $0C			  ; A5 0C | Read graphics status
	LDA $10			  ; A5 10 | Read graphics status
	LDY $14			  ; A4 14 | Load from zero page into Y register
	LDY $18			  ; A4 18 | Load from zero page into Y register
	LDX #$20			 ; A2 20 | Load immediate value into X register
	LDA ($24,X)		  ; A1 24 | Read graphics status
	LDA ($28,X)		  ; A1 28 | Read graphics status
	STA				  ; 9F 2C 9E 30 | Update graphics data
	STA $9C34,X		  ; 9D 34 9C | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $973F,Y		  ; 99 3F 97 | Update graphics data
	LSR $94			  ; 46 94 | Logical shift right (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR $5190			; 4E 90 51 | Logical shift right (absolute)
	STX $8C55			; 8E 55 8C | Store X register to absolute address
	CLI				  ; 58 | Clear interrupt disable flag
	TXA				  ; 8A | Transfer X register to accumulator
	JMP $855F87		  ; 5C 87 5F 85 | Jump to address long
	ROR $80			  ; 66 80 | Rotate right (zero page)
	ADC #$7D			 ; 69 7D | Add with carry (immediate)
	JMP ($6F7A)		  ; 6C 7A 6F | Jump to address (absolute indirect)
	SEI				  ; 78 | Set interrupt disable flag
	LDX $00			  ; A6 00 | Load from zero page into X register
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDX $08			  ; A6 08 | Load from zero page into X register
	LDX $0C			  ; A6 0C | Load from zero page into X register
	LDX $10			  ; A6 10 | Load from zero page into X register
	LDA $14			  ; A5 14 | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_263
; Address: $CDBDBC
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_263:
	JSR $24A2			; 20 A2 24 | Jump to subroutine
	LDA ($28,X)		  ; A1 28 | Read graphics status
	LDY #$2C			 ; A0 2C | Load immediate value into Y register
	STA				  ; 9F 30 9E 34 | Update graphics data
	STA $9B38,X		  ; 9D 38 9B | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	TYA				  ; 98 | Transfer Y register to accumulator
	LSR $5291			; 4E 91 52 | Logical shift right (absolute)
	STA $598D55		  ; 8F 55 8D 59 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	JMP $866088		  ; 5C 88 60 86 | Jump to address long
	ROR $81			  ; 66 81 | Rotate right (zero page)
	ADC #$7E			 ; 69 7E | Add with carry (immediate)
	ADC $707B			; 6D 7B 70 | Add with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	PHP				  ; 08 | Push processor status to stack
	BPL $A6			  ; 10 A6 | Branch if positive
	LDX $18			  ; A6 18 | Load from zero page into X register
	LDA $1C			  ; A5 1C | Read graphics status
	LDY $20			  ; A4 20 | Load from zero page into Y register
	BIT $A2			  ; 24 A2 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	LDA ($2C,X)		  ; A1 2C | Read graphics status
	LDY #$30			 ; A0 30 | Load immediate value into Y register
	STA				  ; 9F 34 9E 38 | Update graphics data
	STZ $9B3C			; 9C 3C 9B | Store zero to absolute
	RTI				  ; 40 | Return from interrupt
	STA $9744,Y		  ; 99 44 97 | Update graphics data
	BCC $56			  ; 90 56 | Branch if carry clear
	STA $8B59			; 8D 59 8B | Update graphics data
	EOR $6089,X		  ; 5D 89 60 | Exclusive OR with accumulator (absolute,X)
	STX $64			  ; 86 64 | Store X register to zero page
	STY $67			  ; 84 67 | Store Y register to zero page
	STA ($6A,X)		  ; 81 6A | Update graphics data
	ADC $707C			; 6D 7C 70 | Add with carry (absolute)
	ADC $A873,Y		  ; 79 73 A8 | Add with carry (absolute,Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	PHP				  ; 08 | Push processor status to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	BPL $A7			  ; 10 A7 | Branch if positive
	CLC				  ; 18 | Clear carry flag
	LDX $1C			  ; A6 1C | Load from zero page into X register
	LDA $20			  ; A5 20 | Read graphics status
	LDY $25			  ; A4 25 | Load from zero page into Y register
	AND #$A2			 ; 29 A2 | Logical AND with accumulator (immediate)
	AND $31A1			; 2D A1 31 | Logical AND with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_264
; Address: $CDBE45
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_264:
	LDY #$35			 ; A0 35 | Load immediate value into Y register
	STA				  ; 9F 38 9D 3C | Update graphics data
	STZ $9A40			; 9C 40 9A | Store zero to absolute
	TYA				  ; 98 | Transfer Y register to accumulator
	PHA				  ; 48 | Push accumulator to stack
	BCC $56			  ; 90 56 | Branch if carry clear
	STX $8C5A			; 8E 5A 8C | Store X register to absolute address
	EOR $618A,X		  ; 5D 8A 61 | Exclusive OR with accumulator (absolute,X)
	STZ $85			  ; 64 85 | Store zero to zero page
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_265
; Address: $CDBE66
; Size: 55 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_265:
	ROR $717D			; 6E 7D 71 | Rotate right (absolute)
	PLY				  ; 7A | Pull Y register from stack
	LDA #$00			 ; A9 00 | Read graphics status
	LDA #$04			 ; A9 04 | Read graphics status
	LDA #$08			 ; A9 08 | Read graphics status
	LDA #$0C			 ; A9 0C | Read graphics status
	LDA #$10			 ; A9 10 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	CLC				  ; 18 | Clear carry flag
	ORA $21A6,X		  ; 1D A6 21 | PPU graphics register access
	LDA $25			  ; A5 25 | Read graphics status
	LDY $29			  ; A4 29 | Load from zero page into Y register
	AND $31A2			; 2D A2 31 | Logical AND with accumulator (absolute)
	LDA ($35,X)		  ; A1 35 | Read graphics status
	LDY #$39			 ; A0 39 | Load immediate value into Y register
	STZ $9D3D,X		  ; 9E 3D 9D | Store zero to absolute,X
	EOR ($9B,X)		  ; 41 9B | Exclusive OR with accumulator ((zero page,X))
	STA $9748,Y		  ; 99 48 97 | Update graphics data
	JMP $5095			; 4C 95 50 | Jump to address
	STA ($57),Y		  ; 91 57 | Update graphics data
	STA $5E8D5A		  ; 8F 5A 8D 5E | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ADC ($88,X)		  ; 61 88 | Add with carry ((zero page,X))
	ADC $86			  ; 65 86 | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_266
; Address: $CDBEA5
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_266:
	BRA $6F			  ; 80 6F | Branch always
	ADC $7B72,X		  ; 7D 72 7B | Add with carry (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	PHP				  ; 08 | Push processor status to stack
	TAX				  ; AA | Transfer accumulator to X register
	TAX				  ; AA | Transfer accumulator to X register
	BPL $A9			  ; 10 A9 | Branch if positive
	LDA #$19			 ; A9 19 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	ORA $21A7,X		  ; 1D A7 21 | PPU graphics register access
	LDX $25			  ; A6 25 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_267
; Address: $CDBEBF
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_267:
	LDA $29			  ; A5 29 | Read graphics status
	LDY $2D			  ; A4 2D | Load from zero page into Y register
	AND ($A2),Y		  ; 31 A2 | Logical AND with accumulator ((zero page),Y)
	LDA ($39,X)		  ; A1 39 | Read graphics status
	STA				  ; 9F 3D 9D 41 | Update graphics data
	STZ $9A45			; 9C 45 9A | Store zero to absolute
	EOR #$98			 ; 49 98 | Exclusive OR with accumulator (immediate)
	JMP $5096			; 4C 96 50 | Jump to address
	BCC $5B			  ; 90 5B | Branch if carry clear
	STX $8B5F			; 8E 5F 8B | Store X register to absolute address
	BIT #$65			 ; 89 65 | Test bits in accumulator (immediate)
	STX $69			  ; 86 69 | Store X register to zero page
	STY $6C			  ; 84 6C | Store Y register to zero page
	STA ($6F,X)		  ; 81 6F | Update graphics data
	ROR $7B72,X		  ; 7E 72 7B | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHP				  ; 08 | Push processor status to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	BPL $AA			  ; 10 AA | Branch if positive
	TAX				  ; AA | Transfer accumulator to X register
	ORA $1DA9,Y		  ; 19 A9 1D | Logical OR with accumulator (absolute,Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	AND ($A7,X)		  ; 21 A7 | Logical AND with accumulator ((zero page,X))
	AND $A6			  ; 25 A6 | Logical AND with accumulator (zero page)
	AND #$A5			 ; 29 A5 | Logical AND with accumulator (immediate)
	AND $31A4			; 2D A4 31 | Logical AND with accumulator (absolute)
	LDA ($39,X)		  ; A1 39 | Read graphics status
	LDY #$3D			 ; A0 3D | Load immediate value into Y register
	STZ $9D41,X		  ; 9E 41 9D | Store zero to absolute,X
	EOR $9B			  ; 45 9B | Exclusive OR with accumulator (zero page)
	EOR #$99			 ; 49 99 | Exclusive OR with accumulator (immediate)
	EOR $5197			; 4D 97 51 | Exclusive OR with accumulator (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	STA ($5C),Y		  ; 91 5C | Update graphics data
	STA $638C5F		  ; 8F 5F 8C 63 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ROR $87			  ; 66 87 | Rotate right (zero page)
	ADC #$84			 ; 69 84 | Add with carry (immediate)
	ADC $7082			; 6D 82 70 | Add with carry (absolute)
	LDY $AC00			; AC 00 AC | Load from absolute address into Y register
	LDY $AC08			; AC 08 AC | Load from absolute address into Y register
	LDY $AB10			; AC 10 AB | Load from absolute address into Y register
	PLB				  ; AB | Pull data bank register from stack
	ORA $1DAA,Y		  ; 19 AA 1D | Logical OR with accumulator (absolute,Y)
	LDA #$21			 ; A9 21 | PPU graphics register access
	TAY				  ; A8 | Transfer accumulator to Y register
	AND $A7			  ; 25 A7 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_268
; Address: $CDBF40
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_268:
	ROL				  ; 2A | Rotate left (accumulator)
	LDX $2E			  ; A6 2E | Load from zero page into X register
	LDA $32			  ; A5 32 | Read graphics status
	LDY $36			  ; A4 36 | Load from zero page into Y register
	LDX #$3A			 ; A2 3A | Load immediate value into X register
	LDA ($3E,X)		  ; A1 3E | Read graphics status
	STA				  ; 9F 42 9E 46 | Update graphics data
	STZ $9A49			; 9C 49 9A | Store zero to absolute
	EOR $5198			; 4D 98 51 | Exclusive OR with accumulator (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	JMP $8D608F		  ; 5C 8F 60 8D | Jump to address long
	TXA				  ; 8A | Transfer X register to accumulator
	DEY				  ; 88 | Decrement Y register
	ROR				  ; 6A | Rotate right (accumulator)
	STA $6D			  ; 85 6D | Update graphics data
	BVS $80			  ; 70 80 | Branch if overflow set
	ADC $AD77,X		  ; 7D 77 AD | Add with carry (absolute,X)
	LDA $AD04			; AD 04 AD | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	LDA $AD0C			; AD 0C AD | Read graphics status
	ORA ($AC),Y		  ; 11 AC | Logical OR with accumulator ((zero page),Y)
	LDY $AB19			; AC 19 AB | Load from absolute address into Y register
	ORA $21AA,X		  ; 1D AA 21 | PPU graphics register access
	LDA #$26			 ; A9 26 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $32A6			; 2E A6 32 | Rotate left (absolute)
	LDA $36			  ; A5 36 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	LDX #$3E			 ; A2 3E | Load immediate value into X register
	LDY #$42			 ; A0 42 | Hardware register operation
	STA				  ; 9F 46 9D 4A | Update graphics data
	LSR $5299			; 4E 99 52 | Logical shift right (absolute)
	EOR $5D93,Y		  ; 59 93 5D | Exclusive OR with accumulator (absolute,Y)
	BCC $60			  ; 90 60 | Branch if carry clear
	STX $8B64			; 8E 64 8B | Store X register to absolute address
	BIT #$6B			 ; 89 6B | Test bits in accumulator (immediate)
	STX $6E			  ; 86 6E | Store X register to zero page
	ADC ($80),Y		  ; 71 80 | Add with carry ((zero page),Y)
	ROR $AE77,X		  ; 7E 77 AE | Rotate right (absolute,X)
	LDX $AE04			; AE 04 AE | Load from absolute address into X register
	PHP				  ; 08 | Push processor status to stack
	LDX $AE0C			; AE 0C AE | Load from absolute address into X register
	ORA ($AD),Y		  ; 11 AD | Logical OR with accumulator ((zero page),Y)
	LDA $AC19			; AD 19 AC | Read graphics status
	ORA $22AB,X		  ; 1D AB 22 | Logical OR with accumulator (absolute,X)
	TAX				  ; AA | Transfer accumulator to X register
	ROL $A9			  ; 26 A9 | Rotate left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_269
; Address: $CDBFC2
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_269:
	ROL $32A7			; 2E A7 32 | Rotate left (absolute)
	LDX $36			  ; A6 36 | Load from zero page into X register
	LDY $3A			  ; A4 3A | Load from zero page into Y register
	ROL $42A1,X		  ; 3E A1 42 | Hardware register operation
	STA				  ; 9F 46 9E 4A | Update graphics data
	STZ $9A4E			; 9C 4E 9A | Store zero to absolute
	TYA				  ; 98 | Transfer Y register to accumulator
	EOR $5D93,Y		  ; 59 93 5D | Exclusive OR with accumulator (absolute,Y)
	STA ($61),Y		  ; 91 61 | Update graphics data
	STA $688C64		  ; 8F 64 8C 68 | Update graphics data
	BIT #$6B			 ; 89 6B | Test bits in accumulator (immediate)
	STY $72			  ; 84 72 | Store Y register to zero page
	STA ($75,X)		  ; 81 75 | Update graphics data
	ROR $AF78,X		  ; 7E 78 AF | Rotate right (absolute,X)
	LDA $08AF04		  ; AF 04 AF 08 | Read graphics status
	LDA $11AF0C		  ; AF 0C AF 11 | Read graphics status
	LDX $AE15			; AE 15 AE | Load from absolute address into X register
	ORA $1EAD,Y		  ; 19 AD 1E | Logical OR with accumulator (absolute,Y)
	LDY $AB22			; AC 22 AB | Load from absolute address into Y register
	ROL $AA			  ; 26 AA | Rotate left (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	LDA #$2E			 ; A9 2E | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $3B			  ; A5 3B | Read graphics status
	LDY $3F			  ; A4 3F | Load from zero page into Y register
	LDX #$43			 ; A2 43 | Load immediate value into X register
	LDY #$47			 ; A0 47 | Load immediate value into Y register
	STA				  ; 9F 4B 9D 4F | Update graphics data
	STA $9656,Y		  ; 99 56 96 | Update graphics data
	PHY				  ; 5A | Push Y register to stack
	LSR $6192,X		  ; 5E 92 61 | Logical shift right (absolute,X)
	STA $688D65		  ; 8F 65 8D 68 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	JMP ($6F88)		  ; 6C 88 6F | Jump to address (absolute indirect)
	STA $72			  ; 85 72 | Update graphics data
	ADC $00B0,Y		  ; 79 B0 00 | Add with carry (absolute,Y)
	BCS $04			  ; B0 04 | Branch if carry set
	BCS $08			  ; B0 08 | Branch if carry set
	BCS $0D			  ; B0 0D | Branch if carry set
	BCS $11			  ; B0 11 | Branch if carry set
	LDA $19AF15		  ; AF 15 AF 19 | Read graphics status
	LDX $AD1E			; AE 1E AD | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_26A
; Address: $CDC03C
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_26A:
	JSL $AB26AC		  ; 22 AC 26 AB | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$33			 ; A9 33 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX $3B			  ; A6 3B | Load from zero page into X register
	LDA $3F			  ; A5 3F | Read graphics status
	LDA ($47,X)		  ; A1 47 | Read graphics status
	LDY #$4B			 ; A0 4B | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_26B
; Address: $CDC051
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_26B:
	STZ $9C4F,X		  ; 9E 4F 9C | Store zero to absolute,X
	TXS				  ; 9A | Transfer X register to stack pointer
	PHY				  ; 5A | Push Y register to stack
	LSR $6293,X		  ; 5E 93 62 | Logical shift right (absolute,X)
	BCC $65			  ; 90 65 | Branch if carry clear
	STX $8B69			; 8E 69 8B | Store X register to absolute address
	JMP ($7088)		  ; 6C 88 70 | Jump to address (absolute indirect)
	STX $73			  ; 86 73 | Store X register to zero page
	BRA $7A			  ; 80 7A | Branch always
	LDA ($00),Y		  ; B1 00 | Read graphics status
	LDA ($04),Y		  ; B1 04 | Read graphics status
	LDA ($08),Y		  ; B1 08 | Read graphics status
	LDA ($0D),Y		  ; B1 0D | Read graphics status
	LDA ($11),Y		  ; B1 11 | Read graphics status
	BCS $15			  ; B0 15 | Branch if carry set
	BCS $1A			  ; B0 1A | Branch if carry set
	LDA $22AE1E		  ; AF 1E AE 22 | Read graphics status
	LDA $AC27			; AD 27 AC | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$37			 ; A9 37 | Read graphics status
	LDX $40			  ; A6 40 | Load from zero page into X register
	LDY $44			  ; A4 44 | Load from zero page into Y register
	LDX #$48			 ; A2 48 | Load immediate value into X register
	LDY #$4C			 ; A0 4C | Load immediate value into Y register
	STZ $9C50,X		  ; 9E 50 9C | Store zero to absolute,X
	TXS				  ; 9A | Transfer X register to stack pointer
	TYA				  ; 98 | Transfer Y register to accumulator
	STA ($66),Y		  ; 91 66 | Update graphics data
	STX $8C6A			; 8E 6A 8C | Store X register to absolute address
	ADC $7089			; 6D 89 70 | Add with carry (absolute)
	STX $74			  ; 86 74 | Store X register to zero page
	BRA $7A			  ; 80 7A | Branch always
	PHP				  ; 08 | Push processor status to stack
	ORA $11B2			; 0D B2 11 | Logical OR with accumulator (absolute)
	LDA ($15),Y		  ; B1 15 | Read graphics status
	LDA ($1A),Y		  ; B1 1A | Read graphics status
	BCS $1E			  ; B0 1E | Branch if carry set
	LDA $27AE22		  ; AF 22 AE 27 | Read graphics status
	LDA $AC2B			; AD 2B AC | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	LDA #$38			 ; A9 38 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	RTI				  ; 40 | Return from interrupt
	LDA $44			  ; A5 44 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA ($4C,X)		  ; A1 4C | Read graphics status
	STA				  ; 9F 50 9D 54 | Update graphics data
	CLI				  ; 58 | Clear interrupt disable flag
	STA $975C,Y		  ; 99 5C 97 | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_26C
; Address: $CDC0DF
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_26C:
	STA $6E8D6A		  ; 8F 6A 8D 6E | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ADC ($87),Y		  ; 71 87 | Add with carry ((zero page),Y)
	STY $78			  ; 84 78 | Store Y register to zero page
	STA ($7B,X)		  ; 81 7B | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	ORA $11B3			; 0D B3 11 | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	LDA ($1E),Y		  ; B1 1E | Read graphics status
	BCS $23			  ; B0 23 | Branch if carry set
	LDA $2BAE27		  ; AF 27 AE 2B | Read graphics status
	LDA $AC30			; AD 30 AC | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	SEC				  ; 38 | Set carry flag
	LDA #$3C			 ; A9 3C | Read graphics status
	RTI				  ; 40 | Return from interrupt
	LDX $44			  ; A6 44 | Load from zero page into X register
	LDY $48			  ; A4 48 | Load from zero page into Y register
	LDX #$4C			 ; A2 4C | Load immediate value into X register
	LDY #$50			 ; A0 50 | Load immediate value into Y register
	STZ $9C54,X		  ; 9E 54 9C | Store zero to absolute,X
	CLI				  ; 58 | Clear interrupt disable flag
	TXS				  ; 9A | Transfer X register to stack pointer
	JMP $956098		  ; 5C 98 60 95 | Jump to address long
	STZ $93			  ; 64 93 | Store zero to zero page
	BCC $6B			  ; 90 6B | Branch if carry clear
	STA $8B6E			; 8D 6E 8B | Update graphics data
	DEY				  ; 88 | Decrement Y register
	STA $78			  ; 85 78 | Update graphics data
	PHP				  ; 08 | Push processor status to stack
	ORA $11B4			; 0D B4 11 | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	ASL $23B1,X		  ; 1E B1 23 | Arithmetic shift left (absolute,X)
	BCS $27			  ; B0 27 | Branch if carry set
	LDA $30AE2B		  ; AF 2B AE 30 | Read graphics status
	LDA $AB34			; AD 34 AB | Read graphics status
	SEC				  ; 38 | Set carry flag
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR ($A7,X)		  ; 41 A7 | Exclusive OR with accumulator ((zero page,X))
	EOR $A5			  ; 45 A5 | Exclusive OR with accumulator (zero page)
	EOR #$A3			 ; 49 A3 | Exclusive OR with accumulator (immediate)
	EOR $51A1			; 4D A1 51 | Exclusive OR with accumulator (absolute)
	STA				  ; 9F 55 9D 59 | Update graphics data
	EOR $6098,X		  ; 5D 98 60 | Exclusive OR with accumulator (absolute,X)
	STZ $93			  ; 64 93 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	STA ($6B),Y		  ; 91 6B | Update graphics data
	STX $8B6F			; 8E 6F 8B | Store X register to absolute address
	BIT #$76			 ; 89 76 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_26D
; Address: $CDC167
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_26D:
	STX $79			  ; 86 79 | Store X register to zero page
	PHP				  ; 08 | Push processor status to stack
	ORA $11B5			; 0D B5 11 | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	LDA ($27),Y		  ; B1 27 | Read graphics status
	BCS $2C			  ; B0 2C | Branch if carry set
	LDA $34AE30		  ; AF 30 AE 34 | Read graphics status
	LDY $AB39			; AC 39 AB | Load from absolute address into Y register
	AND $41A9,X		  ; 3D A9 41 | Logical AND with accumulator (absolute,X)
	TAY				  ; A8 | Transfer accumulator to Y register
	EOR $A6			  ; 45 A6 | Exclusive OR with accumulator (zero page)
	EOR #$A4			 ; 49 A4 | Exclusive OR with accumulator (immediate)
	EOR $51A2			; 4D A2 51 | Exclusive OR with accumulator (absolute)
	LDY #$55			 ; A0 55 | Load immediate value into Y register
	STZ $9C59,X		  ; 9E 59 9C | Store zero to absolute,X
	EOR $6199,X		  ; 5D 99 61 | Exclusive OR with accumulator (absolute,X)
	ADC $94			  ; 65 94 | Add with carry (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($6F8F)		  ; 6C 8F 6F | Jump to address (absolute indirect)
	STY $8973			; 8C 73 89 | Store Y register to absolute address
	STX $7A			  ; 86 7A | Store X register to zero page
	ADC $00B6,X		  ; 7D B6 00 | Add with carry (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	ORA $11B6			; 0D B6 11 | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	PLP				  ; 28 | Pull processor status from stack
	LDA ($2C),Y		  ; B1 2C | Read graphics status
	BCS $30			  ; B0 30 | Branch if carry set
	LDA $39AD35		  ; AF 35 AD 39 | Read graphics status
	LDY $AA3D			; AC 3D AA | Load from absolute address into Y register
	EOR ($A9,X)		  ; 41 A9 | Exclusive OR with accumulator ((zero page,X))
	LSR $A7			  ; 46 A7 | Logical shift right (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA $4E			  ; A5 4E | Read graphics status
	LDA ($56,X)		  ; A1 56 | Read graphics status
	STA				  ; 9F 5A 9C 5E | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	ADC ($98,X)		  ; 61 98 | Add with carry ((zero page,X))
	ADC $95			  ; 65 95 | Add with carry (zero page)
	ADC #$92			 ; 69 92 | Add with carry (immediate)
	ADC $7090			; 6D 90 70 | Add with carry (absolute)
	STA $8A74			; 8D 74 8A | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	STY $7E			  ; 84 7E | Store Y register to zero page
	ORA #$B7			 ; 09 B7 | Logical OR with accumulator (immediate)
	ORA $12B7			; 0D B7 12 | Logical OR with accumulator (absolute)
	INC				  ; 1A | Increment accumulator
	PLP				  ; 28 | Pull processor status from stack
	BIT $31B1			; 2C B1 31 | Test bits in accumulator (absolute)
	BCS $35			  ; B0 35 | Branch if carry set

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_26E
; Address: $CDC205
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_26E:
	LDX $AD39			; AE 39 AD | Load from absolute address into X register
	AND $42AB,X		  ; 3D AB 42 | Hardware register operation
	LDA #$46			 ; A9 46 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LSR				  ; 4A | Logical shift right (accumulator)
	LDX $4E			  ; A6 4E | Load from zero page into X register
	LDY $52			  ; A4 52 | Load from zero page into Y register
	LDX #$56			 ; A2 56 | Load immediate value into X register
	LDY #$5A			 ; A0 5A | Load immediate value into Y register
	STA $9B5E,X		  ; 9D 5E 9B | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $96			  ; 66 96 | Rotate right (zero page)
	ADC #$93			 ; 69 93 | Add with carry (immediate)
	ADC $7191			; 6D 91 71 | Add with carry (absolute)
	STX $8B74			; 8E 74 8B | Store X register to absolute address
	SEI				  ; 78 | Set interrupt disable flag
	DEY				  ; 88 | Decrement Y register
	STA $7E			  ; 85 7E | Update graphics data
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	CLV				  ; B8 | Clear overflow flag
	ORA #$B8			 ; 09 B8 | Logical OR with accumulator (immediate)
	ORA $12B8			; 0D B8 12 | Logical OR with accumulator (absolute)
	BIT $B4			  ; 24 B4 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BIT $31B2			; 2C B2 31 | Test bits in accumulator (absolute)
	LDA ($35),Y		  ; B1 35 | Read graphics status
	LDA $3EAE3A		  ; AF 3A AE 3E | Read graphics status
	LDY $AA42			; AC 42 AA | Load from absolute address into Y register
	LSR $A9			  ; 46 A9 | Logical shift right (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA $53			  ; A5 53 | Read graphics status
	LDY #$5B			 ; A0 5B | Load immediate value into Y register
	STZ $9C5F,X		  ; 9E 5F 9C | Store zero to absolute,X
	STA $9766,Y		  ; 99 66 97 | Update graphics data
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $7191			; 6E 91 71 | Rotate right (absolute)
	STA $788C75		  ; 8F 75 8C 78 | Update graphics data
	BIT #$7C			 ; 89 7C | Test bits in accumulator (immediate)
	STA $7F			  ; 85 7F | Update graphics data
	LDA $B900,Y		  ; B9 00 B9 | Read graphics status
	LDA $B909,Y		  ; B9 09 B9 | Read graphics status
	ORA $12B9			; 0D B9 12 | Logical OR with accumulator (absolute)
	CLV				  ; B8 | Clear overflow flag
	BIT $B5			  ; 24 B5 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND $31B3			; 2D B3 31 | Logical AND with accumulator (absolute)
	LDA ($35),Y		  ; B1 35 | Read graphics status
	BCS $3A			  ; B0 3A | Branch if carry set
	LDA $42AD3E		  ; AF 3E AD 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_26F
; Address: $CDC28B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_26F:
	PLB				  ; AB | Pull data bank register from stack
	TAX				  ; AA | Transfer accumulator to X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX $53			  ; A6 53 | Load from zero page into X register
	LDY $57			  ; A4 57 | Load from zero page into Y register
	LDA ($5B,X)		  ; A1 5B | Read graphics status
	STA				  ; 9F 5F 9D 63 | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	TYA				  ; 98 | Transfer Y register to accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_270
; Address: $CDC2A0
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_270:
	ROR $7292			; 6E 92 72 | Rotate right (absolute)
	STA $798C75		  ; 8F 75 8C 79 | Update graphics data
	BIT #$7C			 ; 89 7C | Test bits in accumulator (immediate)
	STX $80			  ; 86 80 | Store X register to zero page
	TSX				  ; BA | Transfer stack pointer to X register
	TSX				  ; BA | Transfer stack pointer to X register
	TSX				  ; BA | Transfer stack pointer to X register
	ORA #$BA			 ; 09 BA | Logical OR with accumulator (immediate)
	ORA $12BA			; 0D BA 12 | Logical OR with accumulator (absolute)
	LDA $B816,Y		  ; B9 16 B8 | Read graphics status
	CLV				  ; B8 | Clear overflow flag
	BIT $B6			  ; 24 B6 | Test bits in accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND $31B4			; 2D B4 31 | Logical AND with accumulator (absolute)
	LDA ($3A),Y		  ; B1 3A | Read graphics status
	BCS $3E			  ; B0 3E | Branch if carry set
	LDX $AC43			; AE 43 AC | Load from absolute address into X register
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$4F			 ; A9 4F | Read graphics status
	LDY $58			  ; A4 58 | Load from zero page into Y register
	LDX #$5C			 ; A2 5C | Load immediate value into X register
	LDY #$60			 ; A0 60 | Load immediate value into Y register
	STA $9B64,X		  ; 9D 64 9B | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_271
; Address: $CDC2E3
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_271:
	BCC $76			  ; 90 76 | Branch if carry clear
	STA $8A7A			; 8D 7A 8A | Update graphics data
	ADC $8087,X		  ; 7D 87 80 | Add with carry (absolute,X)
	ORA #$BB			 ; 09 BB | Logical OR with accumulator (immediate)
	ORA $12BB			; 0D BB 12 | Logical OR with accumulator (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	LDA $B91B,Y		  ; B9 1B B9 | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_272
; Address: $CDC2FA
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_272:
	JSR $24B8			; 20 B8 24 | Jump to subroutine
	AND #$B6			 ; 29 B6 | Logical AND with accumulator (immediate)
	AND $32B5			; 2D B5 32 | Logical AND with accumulator (absolute)
	DEC				  ; 3A | Decrement accumulator
	LDA ($3F),Y		  ; B1 3F | Read graphics status
	LDA $47AD43		  ; AF 43 AD 47 | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	JMP $50A9			; 4C A9 50 | Jump to address

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_273
; Address: $CDC313
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_273:
	LDA $58			  ; A5 58 | Read graphics status
	JMP $9E60A1		  ; 5C A1 60 9E | Jump to address long
	STZ $9C			  ; 64 9C | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	STA $976C,Y		  ; 99 6C 97 | Update graphics data
	STA ($77),Y		  ; 91 77 | Update graphics data
	STX $8B7A			; 8E 7A 8B | Store X register to absolute address
	ROR $8188,X		  ; 7E 88 81 | Rotate right (absolute,X)
	LDY $BC00,X		  ; BC 00 BC | Load from absolute,X into Y register
	LDY $BC09,X		  ; BC 09 BC | Load from absolute,X into Y register
	ORA $12BC			; 0D BC 12 | Logical OR with accumulator (absolute)
	TSX				  ; BA | Transfer stack pointer to X register
	TSX				  ; BA | Transfer stack pointer to X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_274
; Address: $CDC33A
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_274:
	JSR $24B9			; 20 B9 24 | Jump to subroutine
	CLV				  ; B8 | Clear overflow flag
	AND #$B7			 ; 29 B7 | Logical AND with accumulator (immediate)
	AND $32B6			; 2D B6 32 | Logical AND with accumulator (absolute)
	LDA ($3F),Y		  ; B1 3F | Read graphics status
	BCS $44			  ; B0 44 | Branch if carry set
	LDX $AC48			; AE 48 AC | Load from absolute address into X register
	JMP $50AA			; 4C AA 50 | Jump to address
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX $59			  ; A6 59 | Load from zero page into X register
	LDY $5D			  ; A4 5D | Load from zero page into Y register
	LDX #$61			 ; A2 61 | Load immediate value into X register
	STA				  ; 9F 65 9D 69 | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	JMP ($7097)		  ; 6C 97 70 | Jump to address (absolute indirect)
	STA $7E8C7B		  ; 8F 7B 8C 7E | Update graphics data
	DEY				  ; 88 | Decrement Y register
	LDA $BD00,X		  ; BD 00 BD | Read graphics status
	LDA $BD09,X		  ; BD 09 BD | Read graphics status
	ORA $12BD			; 0D BD 12 | Logical OR with accumulator (absolute)
	LDY $BB17,X		  ; BC 17 BB | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_275
; Address: $CDC37A
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_275:
	JSR $25BA			; 20 BA 25 | Jump to subroutine
	LDA $B829,Y		  ; B9 29 B8 | Read graphics status
	ROL $32B7			; 2E B7 32 | Rotate left (absolute)
	RTI				  ; 40 | Return from interrupt
	LDA ($44),Y		  ; B1 44 | Read graphics status
	LDA $4CAD48		  ; AF 48 AD 4C | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	EOR ($A9),Y		  ; 51 A9 | Exclusive OR with accumulator ((zero page),Y)
	EOR $5DA5,Y		  ; 59 A5 5D | Exclusive OR with accumulator (absolute,Y)
	LDX #$61			 ; A2 61 | Load immediate value into X register
	LDY #$65			 ; A0 65 | Load immediate value into Y register
	STA $9B69,X		  ; 9D 69 9B | Update graphics data
	ADC $7198			; 6D 98 71 | Add with carry (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	STA $7F8C7C		  ; 8F 7C 8C 7F | Update graphics data
	BIT #$83			 ; 89 83 | Test bits in accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_276
; Address: $CDC3AB
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_276:
	LDX $BE00,Y		  ; BE 00 BE | Load from absolute,Y into X register
	LDX $BE09,Y		  ; BE 09 BE | Load from absolute,Y into X register
	ASL $12BE			; 0E BE 12 | Arithmetic shift left (absolute)
	LDA $BC17,X		  ; BD 17 BC | Read graphics status
	LDY $BB20,X		  ; BC 20 BB | Load from absolute,X into Y register
	AND $BA			  ; 25 BA | Logical AND with accumulator (zero page)
	AND #$B9			 ; 29 B9 | Logical AND with accumulator (immediate)
	ROL $32B8			; 2E B8 32 | Rotate left (absolute)
	RTI				  ; 40 | Return from interrupt
	BCS $49			  ; B0 49 | Branch if carry set
	LDX $AC4D			; AE 4D AC | Load from absolute address into X register
	EOR ($AA),Y		  ; 51 AA | Exclusive OR with accumulator ((zero page),Y)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHY				  ; 5A | Push Y register to stack
	LDX $5E			  ; A6 5E | Load from zero page into X register
	LDA ($66,X)		  ; A1 66 | Read graphics status
	STZ $9C6A,X		  ; 9E 6A 9C | Store zero to absolute,X
	ADC $7199			; 6D 99 71 | Add with carry (absolute)
	ADC $7C90,Y		  ; 79 90 7C | Add with carry (absolute,Y)
	STA $8A80			; 8D 80 8A | Update graphics data
	LDA				  ; BF 00 BF 04 | Read graphics status
	LDA				  ; BF 09 BF 0E | Read graphics status
	LDA				  ; BF 12 BE 17 | Read graphics status
	LDA $BD1C,X		  ; BD 1C BD | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_277
; Address: $CDC3FA
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_277:
	JSR $25BC			; 20 BC 25 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	TSX				  ; BA | Transfer stack pointer to X register
	ROL $33B9			; 2E B9 33 | Rotate left (absolute)
	RTI				  ; 40 | Return from interrupt
	EOR $B1			  ; 45 B1 | Exclusive OR with accumulator (zero page)
	EOR #$AF			 ; 49 AF | Exclusive OR with accumulator (immediate)
	EOR $52AD			; 4D AD 52 | Exclusive OR with accumulator (absolute)
	PLB				  ; AB | Pull data bank register from stack
	LDA #$5A			 ; A9 5A | Read graphics status
	LSR $62A4,X		  ; 5E A4 62 | Logical shift right (absolute,X)
	LDX #$66			 ; A2 66 | Load immediate value into X register
	STA				  ; 9F 6A 9C 6E | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	ADC $7D91,Y		  ; 79 91 7D | Add with carry (absolute,Y)
	STX $8B80			; 8E 80 8B | Store X register to absolute address
	STY $C0			  ; 84 C0 | Store Y register to zero page
	CPY #$04			 ; C0 04 | Compare Y register (immediate)
	CPY #$09			 ; C0 09 | Compare Y register (immediate)
	CPY #$0E			 ; C0 0E | Compare Y register (immediate)
	CPY #$12			 ; C0 12 | Compare Y register (immediate)
	LDA				  ; BF 17 BE 1C | Read graphics status
	LDX $BD20,Y		  ; BE 20 BD | Load from absolute,Y into X register
	AND $BC			  ; 25 BC | Logical AND with accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	ROL $33BA			; 2E BA 33 | Rotate left (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_278
; Address: $CDC443
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_278:
	CLV				  ; B8 | Clear overflow flag
	SEC				  ; 38 | Set carry flag
	EOR ($B4,X)		  ; 41 B4 | Exclusive OR with accumulator ((zero page,X))
	EOR $B2			  ; 45 B2 | Exclusive OR with accumulator (zero page)
	EOR #$B0			 ; 49 B0 | Exclusive OR with accumulator (immediate)
	LSR $52AE			; 4E AE 52 | Logical shift right (absolute)
	LDY $AA56			; AC 56 AA | Load from absolute address into Y register
	PHY				  ; 5A | Push Y register to stack
	LDA $63			  ; A5 63 | Read graphics status
	LDY #$6B			 ; A0 6B | Load immediate value into Y register
	STA $9B6F,X		  ; 9D 6F 9B | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	PLY				  ; 7A | Pull Y register from stack
	ROR $818F,X		  ; 7E 8F 81 | Rotate right (absolute,X)
	PHB				  ; 8B | Push data bank register to stack
	STA $C1			  ; 85 C1 | Update graphics data
	CMP ($04,X)		  ; C1 04 | Compare accumulator ((zero page,X))
	CMP ($09,X)		  ; C1 09 | Compare accumulator ((zero page,X))
	CMP ($0E,X)		  ; C1 0E | Compare accumulator ((zero page,X))
	CMP ($13,X)		  ; C1 13 | Compare accumulator ((zero page,X))
	CPY #$17			 ; C0 17 | Compare Y register (immediate)
	LDA				  ; BF 1C BF 21 | Read graphics status
	LDX $BD25,Y		  ; BE 25 BD | Load from absolute,Y into X register
	ROL				  ; 2A | Rotate left (accumulator)
	LDY $BA2F,X		  ; BC 2F BA | Load from absolute,X into Y register
	LDA $B838,Y		  ; B9 38 B8 | Read graphics status
	EOR ($B5,X)		  ; 41 B5 | Exclusive OR with accumulator ((zero page,X))
	EOR $B3			  ; 45 B3 | Exclusive OR with accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA ($4E),Y		  ; B1 4E | Read graphics status
	LDA $57AD52		  ; AF 52 AD 57 | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX $63			  ; A6 63 | Load from zero page into X register
	LDA ($6B,X)		  ; A1 6B | Read graphics status
	STZ $9B6F,X		  ; 9E 6F 9B | Store zero to absolute,X
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $828F,X		  ; 7E 8F 82 | Rotate right (absolute,X)
	STY $C285			; 8C 85 C2 | Store Y register to absolute address
	REP #$04			 ; C2 04 | Reset processor status bits
	REP #$09			 ; C2 09 | Reset processor status bits
	REP #$0E			 ; C2 0E | Reset processor status bits
	REP #$13			 ; C2 13 | Reset processor status bits
	CMP ($17,X)		  ; C1 17 | Compare accumulator ((zero page,X))
	CPY #$1C			 ; C0 1C | Compare Y register (immediate)
	CPY #$21			 ; C0 21 | PPU graphics register access
	LDA				  ; BF 26 BE 2A | Read graphics status
	LDA $BB2F,X		  ; BD 2F BB | Read graphics status
	TSX				  ; BA | Transfer stack pointer to X register
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_279
; Address: $CDC4C5
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_279:
	LDA $B73D,Y		  ; B9 3D B7 | Read graphics status
	EOR ($B5,X)		  ; 41 B5 | Exclusive OR with accumulator ((zero page,X))
	LSR $B4			  ; 46 B4 | Logical shift right (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCS $53			  ; B0 53 | Branch if carry set
	LDX $AB57			; AE 57 AB | Load from absolute address into X register
	LDA #$60			 ; A9 60 | Read graphics status
	STZ $A4			  ; 64 A4 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	LDX #$6C			 ; A2 6C | Load immediate value into X register
	STA				  ; 9F 70 9C 74 | Update graphics data
	STA $9677,Y		  ; 99 77 96 | Update graphics data
	BCC $82			  ; 90 82 | Branch if carry clear
	STA $C386			; 8D 86 C3 | Update graphics data
	ORA #$C3			 ; 09 C3 | Logical OR with accumulator (immediate)
	ASL $13C3			; 0E C3 13 | Arithmetic shift left (absolute)
	REP #$17			 ; C2 17 | Reset processor status bits
	CMP ($1C,X)		  ; C1 1C | Compare accumulator ((zero page,X))
	CMP ($21,X)		  ; C1 21 | PPU graphics register access
	CPY #$26			 ; C0 26 | Compare Y register (immediate)
	LDA				  ; BF 2A BE 2F | Read graphics status
	LDY $BB34,X		  ; BC 34 BB | Load from absolute,X into Y register
	SEC				  ; 38 | Set carry flag
	TSX				  ; BA | Transfer stack pointer to X register
	AND $42B8,X		  ; 3D B8 42 | Hardware register operation
	LSR $B5			  ; 46 B5 | Logical shift right (zero page)
	LDA ($53),Y		  ; B1 53 | Read graphics status
	LDA $5CAC58		  ; AF 58 AC 5C | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_27A
; Address: $CDC517
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_27A:
	TAY				  ; A8 | Transfer accumulator to Y register
	STZ $A5			  ; 64 A5 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	LDX #$6C			 ; A2 6C | Load immediate value into X register
	LDY #$70			 ; A0 70 | Load immediate value into Y register
	STA $9A74,X		  ; 9D 74 9A | Update graphics data
	SEI				  ; 78 | Set interrupt disable flag
	BRA $91			  ; 80 91 | Branch always
	STA $C487			; 8D 87 C4 | Update graphics data
	CPY $04			  ; C4 04 | Compare Y register (zero page)
	CPY $09			  ; C4 09 | Compare Y register (zero page)
	CPY $0E			  ; C4 0E | Compare Y register (zero page)
	CPY $13			  ; C4 13 | Compare Y register (zero page)
	CLC				  ; 18 | Clear carry flag
	REP #$1C			 ; C2 1C | Reset processor status bits
	REP #$21			 ; C2 21 | PPU graphics register access
	CMP ($26,X)		  ; C1 26 | Compare accumulator ((zero page,X))
	CPY #$2B			 ; C0 2B | Compare Y register (immediate)
	LDA				  ; BF 2F BD 34 | Read graphics status
	LDY $BB39,X		  ; BC 39 BB | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_27B
; Address: $CDC546
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_27B:
	AND $42B9,X		  ; 3D B9 42 | Hardware register operation
	LSR $B6			  ; 46 B6 | Logical shift right (zero page)
	LDA $5CAD58		  ; AF 58 AD 5C | Read graphics status
	PLB				  ; AB | Pull data bank register from stack
	ADC ($A8,X)		  ; 61 A8 | Add with carry ((zero page,X))
	ADC $A6			  ; 65 A6 | Add with carry (zero page)
	ADC #$A3			 ; 69 A3 | Add with carry (immediate)
	ADC $71A1			; 6D A1 71 | Add with carry (absolute)
	STZ $9B75,X		  ; 9E 75 9B | Store zero to absolute,X
	ADC $7C98,Y		  ; 79 98 7C | Add with carry (absolute,Y)
	BRA $91			  ; 80 91 | Branch always
	STY $8E			  ; 84 8E | Store Y register to zero page
	CMP $00			  ; C5 00 | Compare accumulator (zero page)
	CMP $04			  ; C5 04 | Compare accumulator (zero page)
	CMP $09			  ; C5 09 | Compare accumulator (zero page)
	CMP $0E			  ; C5 0E | Compare accumulator (zero page)
	CMP $13			  ; C5 13 | Compare accumulator (zero page)
	CPY $18			  ; C4 18 | Compare Y register (zero page)
	ORA $21C3,X		  ; 1D C3 21 | PPU graphics register access
	REP #$26			 ; C2 26 | Reset processor status bits
	CMP ($2B,X)		  ; C1 2B | Compare accumulator ((zero page,X))
	CPY #$30			 ; C0 30 | Compare Y register (immediate)
	LDX $BD34,Y		  ; BE 34 BD | Load from absolute,Y into X register
	AND $3EBC,Y		  ; 39 BC 3E | Logical AND with accumulator (absolute,Y)
	TSX				  ; BA | Transfer stack pointer to X register
	WDM #$B8			 ; 42 B8 | Reserved instruction
	BVC $B2			  ; 50 B2 | Branch if overflow clear
	BCS $59			  ; B0 59 | Branch if carry set
	LDX $AC5D			; AE 5D AC | Load from absolute address into X register
	ADC ($A9,X)		  ; 61 A9 | Add with carry ((zero page,X))
	ADC $A7			  ; 65 A7 | Add with carry (zero page)
	ADC #$A4			 ; 69 A4 | Add with carry (immediate)
	ROR $72A1			; 6E A1 72 | Rotate right (absolute)
	STA				  ; 9F 75 9C 79 | Update graphics data
	STA $957D,Y		  ; 99 7D 95 | Update graphics data
	STA ($92,X)		  ; 81 92 | Update graphics data
	STY $8F			  ; 84 8F | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	DEC $00			  ; C6 00 | Decrement (zero page)
	DEC $04			  ; C6 04 | Decrement (zero page)
	DEC $09			  ; C6 09 | Decrement (zero page)
	DEC $0E			  ; C6 0E | Decrement (zero page)
	DEC $13			  ; C6 13 | Decrement (zero page)
	CMP $18			  ; C5 18 | Compare accumulator (zero page)
	CPY $1D			  ; C4 1D | Compare Y register (zero page)
	CPY $22			  ; C4 22 | Compare Y register (zero page)
	ROL $C2			  ; 26 C2 | Rotate left (zero page)
	CMP ($30,X)		  ; C1 30 | Compare accumulator ((zero page,X))
	LDA				  ; BF 35 BE 39 | Read graphics status
	LDY $BB3E,X		  ; BC 3E BB | Load from absolute,X into Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_27C
; Address: $CDC5C9
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_27C:
	LDA $B747,Y		  ; B9 47 B7 | Read graphics status
	JMP $50B5			; 4C B5 50 | Jump to address
	LDA ($59),Y		  ; B1 59 | Read graphics status
	LDA $62AD5D		  ; AF 5D AD 62 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	ROR $A8			  ; 66 A8 | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	LDA $6E			  ; A5 6E | Read graphics status
	LDX #$72			 ; A2 72 | Load immediate value into X register
	STA				  ; 9F 76 9C 7A | Update graphics data
	STA $967E,Y		  ; 99 7E 96 | Update graphics data
	STA ($93,X)		  ; 81 93 | Update graphics data
	STA $90			  ; 85 90 | Update graphics data
	BIT #$C7			 ; 89 C7 | Test bits in accumulator (immediate)
	ORA #$C7			 ; 09 C7 | Logical OR with accumulator (immediate)
	ASL $13C7			; 0E C7 13 | Arithmetic shift left (absolute)
	DEC $18			  ; C6 18 | Decrement (zero page)
	CMP $1D			  ; C5 1D | Compare accumulator (zero page)
	CMP $22			  ; C5 22 | Compare accumulator (zero page)
	CPY $27			  ; C4 27 | Compare Y register (zero page)
	REP #$30			 ; C2 30 | Reset processor status bits
	CPY #$35			 ; C0 35 | Compare Y register (immediate)
	LDA				  ; BF 3A BD 3E | Read graphics status
	LDY $BA43,X		  ; BC 43 BA | Load from absolute,X into Y register
	CLV				  ; B8 | Clear overflow flag
	JMP $51B6			; 4C B6 51 | Jump to address
	EOR $5EB0,Y		  ; 59 B0 5E | Exclusive OR with accumulator (absolute,Y)
	LDX $AB62			; AE 62 AB | Load from absolute address into X register
	ROR $A8			  ; 66 A8 | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	LDX $6F			  ; A6 6F | Load from zero page into X register
	LDY #$77			 ; A0 77 | Load immediate value into Y register
	STA $9A7B,X		  ; 9D 7B 9A | Update graphics data
	ROR $8297,X		  ; 7E 97 82 | Rotate right (absolute,X)
	STX $90			  ; 86 90 | Store X register to zero page
	BIT #$C8			 ; 89 C8 | Test bits in accumulator (immediate)
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	ORA #$C8			 ; 09 C8 | Logical OR with accumulator (immediate)
	ASL $13C8			; 0E C8 13 | Arithmetic shift left (absolute)
	CLC				  ; 18 | Clear carry flag
	DEC $1D			  ; C6 1D | Decrement (zero page)
	DEC $22			  ; C6 22 | Decrement (zero page)
	CMP $27			  ; C5 27 | Compare accumulator (zero page)
	CPY $2C			  ; C4 2C | Compare Y register (zero page)
	REP #$30			 ; C2 30 | Reset processor status bits
	CMP ($35,X)		  ; C1 35 | Compare accumulator ((zero page,X))
	CPY #$3A			 ; C0 3A | Compare Y register (immediate)
	LDX $BD3F,Y		  ; BE 3F BD | Load from absolute,Y into X register
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_27D
; Address: $CDC64B
; Size: 105 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_27D:
	LDA $B74C,Y		  ; B9 4C B7 | Read graphics status
	EOR ($B5),Y		  ; 51 B5 | Exclusive OR with accumulator ((zero page),Y)
	PHY				  ; 5A | Push Y register to stack
	LDA ($5E),Y		  ; B1 5E | Read graphics status
	LDX $AC63			; AE 63 AC | Load from absolute address into X register
	LDA #$6B			 ; A9 6B | Read graphics status
	LDY $73			  ; A4 73 | Load from zero page into Y register
	LDA ($77,X)		  ; A1 77 | Read graphics status
	STZ $9B7B,X		  ; 9E 7B 9B | Store zero to absolute,X
	TYA				  ; 98 | Transfer Y register to accumulator
	STX $91			  ; 86 91 | Store X register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	CMP #$09			 ; C9 09 | Compare accumulator (immediate)
	CMP #$0E			 ; C9 0E | Compare accumulator (immediate)
	CMP #$13			 ; C9 13 | Compare accumulator (immediate)
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	ORA $22C7,X		  ; 1D C7 22 | Logical OR with accumulator (absolute,X)
	DEC $27			  ; C6 27 | Decrement (zero page)
	CMP $2C			  ; C5 2C | Compare accumulator (zero page)
	AND ($C2),Y		  ; 31 C2 | Logical AND with accumulator ((zero page),Y)
	CMP ($3A,X)		  ; C1 3A | Compare accumulator ((zero page,X))
	LDA				  ; BF 3F BE 44 | Read graphics status
	LDY $BA48,X		  ; BC 48 BA | Load from absolute,X into Y register
	EOR $51B8			; 4D B8 51 | Exclusive OR with accumulator (absolute)
	PHY				  ; 5A | Push Y register to stack
	LDA $67AD63		  ; AF 63 AD 67 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	JMP ($70A7)		  ; 6C A7 70 | Jump to address (absolute indirect)
	LDA $74			  ; A5 74 | Read graphics status
	LDX #$78			 ; A2 78 | Load immediate value into X register
	STA				  ; 9F 7C 9C 80 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	PHB				  ; 8B | Push data bank register to stack
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	ORA #$CA			 ; 09 CA | Logical OR with accumulator (immediate)
	ASL $13CA			; 0E CA 13 | Arithmetic shift left (absolute)
	CMP #$18			 ; C9 18 | Compare accumulator (immediate)
	INY				  ; C8 | Increment Y register
	ORA $22C8,X		  ; 1D C8 22 | Logical OR with accumulator (absolute,X)
	DEC $2C			  ; C6 2C | Decrement (zero page)
	CPY $31			  ; C4 31 | Compare Y register (zero page)
	REP #$3A			 ; C2 3A | Reset processor status bits
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	LDA				  ; BF 44 BD 49 | Read graphics status
	EOR $52B9			; 4D B9 52 | Exclusive OR with accumulator (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_27E
; Address: $CDC6D5
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_27E:
	BCS $64			  ; B0 64 | Branch if carry set
	LDX $AB68			; AE 68 AB | Load from absolute address into X register
	JMP ($70A8)		  ; 6C A8 70 | Jump to address (absolute indirect)
	LDA $74			  ; A5 74 | Read graphics status
	SEI				  ; 78 | Set interrupt disable flag
	LDY #$7C			 ; A0 7C | Load immediate value into Y register
	STZ $9980			; 9C 80 99 | Store zero to absolute
	STY $96			  ; 84 96 | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	PHB				  ; 8B | Push data bank register to stack
	ORA $CB			  ; 05 CB | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEX				  ; CA | Decrement X register
	CLC				  ; 18 | Clear carry flag
	CMP #$1D			 ; C9 1D | Compare accumulator (immediate)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_27F
; Address: $CDC6FA
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_27F:
	JSL $C727C8		  ; 22 C8 27 C7 | Jump to subroutine long
	BIT $31C5			; 2C C5 31 | Test bits in accumulator (absolute)
	CPY $36			  ; C4 36 | Compare Y register (zero page)
	CMP ($3F,X)		  ; C1 3F | Compare accumulator ((zero page,X))
	CPY #$44			 ; C0 44 | Compare Y register (immediate)
	LDX $BC49,Y		  ; BE 49 BC | Load from absolute,Y into X register
	LSR $52BA			; 4E BA 52 | Logical shift right (absolute)
	CLV				  ; B8 | Clear overflow flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_280
; Address: $CDC715
; Size: 61 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_280:
	LDA ($64),Y		  ; B1 64 | Read graphics status
	LDX $AC68			; AE 68 AC | Load from absolute address into X register
	ADC $71A9			; 6D A9 71 | Add with carry (absolute)
	LDX $75			  ; A6 75 | Load from zero page into X register
	ADC $7DA0,Y		  ; 79 A0 7D | Add with carry (absolute,Y)
	STA $9A81,X		  ; 9D 81 9A | Update graphics data
	STA $97			  ; 85 97 | Update graphics data
	DEY				  ; 88 | Decrement Y register
	STY $00CC			; 8C CC 00 | Store Y register to absolute address
	CPY $CC05			; CC 05 CC | Compare Y register (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CPY $CC0F			; CC 0F CC | Compare Y register (absolute)
	ORA $1ECA,Y		  ; 19 CA 1E | Logical OR with accumulator (absolute,Y)
	CMP #$23			 ; C9 23 | Compare accumulator (immediate)
	CMP #$27			 ; C9 27 | Compare accumulator (immediate)
	INY				  ; C8 | Increment Y register
	BIT $31C6			; 2C C6 31 | Test bits in accumulator (absolute)
	CMP $36			  ; C5 36 | Compare accumulator (zero page)
	CPY $3B			  ; C4 3B | Compare Y register (zero page)
	REP #$40			 ; C2 40 | Reset processor status bits
	CMP ($45,X)		  ; C1 45 | Compare accumulator ((zero page,X))
	LDA				  ; BF 49 BD 4E | Read graphics status
	LDA $B757,Y		  ; B9 57 B7 | Read graphics status
	JMP $B260B4		  ; 5C B4 60 B2 | Jump to address long
	ADC $AF			  ; 65 AF | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_281
; Address: $CDC758
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_281:
	ADC #$AD			 ; 69 AD | Add with carry (immediate)
	ADC $71AA			; 6D AA 71 | Add with carry (absolute)
	LDY $7A			  ; A4 7A | Load from zero page into Y register
	LDA ($7E,X)		  ; A1 7E | Read graphics status
	STZ $9B82,X		  ; 9E 82 9B | Store zero to absolute,X
	STA $97			  ; 85 97 | Update graphics data
	BIT #$94			 ; 89 94 | Test bits in accumulator (immediate)
	STA $00CD			; 8D CD 00 | Update graphics data
	CMP $CD05			; CD 05 CD | Compare accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP $CD0F			; CD 0F CD | Compare accumulator (absolute)
	CPY $CB19			; CC 19 CB | Compare Y register (absolute)
	ASL $23CA,X		  ; 1E CA 23 | Arithmetic shift left (absolute,X)
	DEX				  ; CA | Decrement X register
	PLP				  ; 28 | Pull processor status from stack
	INY				  ; C8 | Increment Y register
	AND $32C7			; 2D C7 32 | Logical AND with accumulator (absolute)
	DEC $36			  ; C6 36 | Decrement (zero page)
	CMP $3B			  ; C5 3B | Compare accumulator (zero page)
	RTI				  ; 40 | Return from interrupt
	CMP ($45,X)		  ; C1 45 | Compare accumulator ((zero page,X))
	CPY #$4A			 ; C0 4A | Compare Y register (immediate)
	LDX $BC4E,Y		  ; BE 4E BC | Load from absolute,Y into X register
	TSX				  ; BA | Transfer stack pointer to X register
	CLI				  ; 58 | Clear interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	JMP $B361B5		  ; 5C B5 61 B3 | Jump to address long
	ADC $B0			  ; 65 B0 | Add with carry (zero page)
	ADC #$AE			 ; 69 AE | Add with carry (immediate)
	ROR $72AB			; 6E AB 72 | Rotate right (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $7A			  ; A5 7A | Read graphics status
	LDX #$7E			 ; A2 7E | Load immediate value into X register
	STA				  ; 9F 82 9B 86 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	TXA				  ; 8A | Transfer X register to accumulator
	STX $00CE			; 8E CE 00 | Store X register to absolute address
	DEC $CE05			; CE 05 CE | Decrement (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC $CE0F			; CE 0F CE | Decrement (absolute)
	CMP $CC19			; CD 19 CC | Compare accumulator (absolute)
	ASL $23CB,X		  ; 1E CB 23 | Arithmetic shift left (absolute,X)
	PLP				  ; 28 | Pull processor status from stack
	CMP #$2D			 ; C9 2D | Compare accumulator (immediate)
	INY				  ; C8 | Increment Y register
	DEC $3C			  ; C6 3C | Decrement (zero page)
	CPY $40			  ; C4 40 | Compare Y register (zero page)
	REP #$45			 ; C2 45 | Reset processor status bits
	CMP ($4A,X)		  ; C1 4A | Compare accumulator ((zero page,X))
	LDA				  ; BF 4F BD 53 | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_282
; Address: $CDC7D0
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_282:
	CLI				  ; 58 | Clear interrupt disable flag
	CLV				  ; B8 | Clear overflow flag
	EOR $61B6,X		  ; 5D B6 61 | Exclusive OR with accumulator (absolute,X)
	ROR $B1			  ; 66 B1 | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	LDX $AC6E			; AE 6E AC | Load from absolute address into X register
	LDA #$77			 ; A9 77 | Read graphics status
	LDX $7B			  ; A6 7B | Load from zero page into X register
	LDY #$83			 ; A0 83 | Load immediate value into Y register
	STZ $9987			; 9C 87 99 | Store zero to absolute
	PHB				  ; 8B | Push data bank register to stack
	STX $00CF			; 8E CF 00 | Store X register to absolute address
	ORA $CF			  ; 05 CF | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC $CE14			; CE 14 CE | Decrement (absolute)
	ORA $1ECD,Y		  ; 19 CD 1E | Logical OR with accumulator (absolute,Y)
	CPY $CC23			; CC 23 CC | Compare Y register (absolute)
	PLP				  ; 28 | Pull processor status from stack
	DEX				  ; CA | Decrement X register
	AND $32C9			; 2D C9 32 | Logical AND with accumulator (absolute)
	INY				  ; C8 | Increment Y register
	CMP $41			  ; C5 41 | Compare accumulator (zero page)
	LSR $C2			  ; 46 C2 | Logical shift right (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPY #$4F			 ; C0 4F | Compare Y register (immediate)
	LDX $BC54,Y		  ; BE 54 BC | Load from absolute,Y into X register
	CLI				  ; 58 | Clear interrupt disable flag
	LDA $B75D,Y		  ; B9 5D B7 | Read graphics status
	ROR $B2			  ; 66 B2 | Rotate right (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	LDA $73AC6F		  ; AF 6F AC 73 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$83			 ; A0 83 | Load immediate value into Y register
	STA $9A87,X		  ; 9D 87 9A | Update graphics data
	PHB				  ; 8B | Push data bank register to stack
	STA $D000D0		  ; 8F D0 00 D0 | Update graphics data
	ORA $D0			  ; 05 D0 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BNE $0F			  ; D0 0F | Branch if not equal
	ORA $1ECE,Y		  ; 19 CE 1E | Logical OR with accumulator (absolute,Y)
	CMP $CC23			; CD 23 CC | Compare accumulator (absolute)
	PLP				  ; 28 | Pull processor status from stack
	AND $32CA			; 2D CA 32 | Logical AND with accumulator (absolute)
	CMP #$37			 ; C9 37 | Compare accumulator (immediate)
	INY				  ; C8 | Increment Y register
	DEC $41			  ; C6 41 | Decrement (zero page)
	CPY $46			  ; C4 46 | Compare Y register (zero page)
	REP #$4B			 ; C2 4B | Reset processor status bits
	CMP ($4F,X)		  ; C1 4F | Compare accumulator ((zero page,X))
	LDA				  ; BF 54 BC 59 | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_283
; Address: $CDC851
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_283:
	TSX				  ; BA | Transfer stack pointer to X register
	EOR $62B8,X		  ; 5D B8 62 | Exclusive OR with accumulator (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_284
; Address: $CDC859
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_284:
	BCS $6F			  ; B0 6F | Branch if carry set
	LDA $AA74			; AD 74 AA | Read graphics status
	SEI				  ; 78 | Set interrupt disable flag
	LDY $80			  ; A4 80 | Load from zero page into Y register
	LDA ($84,X)		  ; A1 84 | Read graphics status
	STZ $9A88,X		  ; 9E 88 9A | Store zero to absolute,X
	STY $9097			; 8C 97 90 | Store Y register to absolute address
	CMP ($00),Y		  ; D1 00 | Compare accumulator ((zero page),Y)
	CMP ($05),Y		  ; D1 05 | Compare accumulator ((zero page),Y)
	CMP ($0A),Y		  ; D1 0A | Compare accumulator ((zero page),Y)
	CMP ($0F),Y		  ; D1 0F | Compare accumulator ((zero page),Y)
	BNE $14			  ; D0 14 | Branch if not equal
	BNE $19			  ; D0 19 | Branch if not equal
	ASL $23CE,X		  ; 1E CE 23 | Arithmetic shift left (absolute,X)
	CMP $CC28			; CD 28 CC | Compare accumulator (absolute)
	ROL $33CB			; 2E CB 33 | Rotate left (absolute)
	DEX				  ; CA | Decrement X register
	SEC				  ; 38 | Set carry flag
	INY				  ; C8 | Increment Y register
	EOR ($C5,X)		  ; 41 C5 | Exclusive OR with accumulator ((zero page,X))
	LSR $C3			  ; 46 C3 | Logical shift right (zero page)
	REP #$50			 ; C2 50 | Reset processor status bits
	LDA				  ; BF 55 BD 59 | Read graphics status
	LSR $62B9,X		  ; 5E B9 62 | Logical shift right (absolute,X)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_285
; Address: $CDC899
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_285:
	LDA ($70),Y		  ; B1 70 | Read graphics status
	LDX $AB74			; AE 74 AB | Load from absolute address into X register
	SEI				  ; 78 | Set interrupt disable flag
	TAY				  ; A8 | Transfer accumulator to Y register
	ADC $81A5,X		  ; 7D A5 81 | Add with carry (absolute,X)
	LDX #$85			 ; A2 85 | Load immediate value into X register
	STA				  ; 9F 89 9B 8D | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	BCC $D2			  ; 90 D2 | Branch if carry clear
	ORA $D2			  ; 05 D2 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP ($14),Y		  ; D1 14 | Compare accumulator ((zero page),Y)
	CMP ($19),Y		  ; D1 19 | Compare accumulator ((zero page),Y)
	BNE $1E			  ; D0 1E | Branch if not equal
	BIT $CE			  ; 24 CE | Test bits in accumulator (zero page)
	AND #$CD			 ; 29 CD | Logical AND with accumulator (immediate)
	ROL $33CC			; 2E CC 33 | Rotate left (absolute)
	SEC				  ; 38 | Set carry flag
	CMP #$3D			 ; C9 3D | Compare accumulator (immediate)
	INY				  ; C8 | Increment Y register
	WDM #$C6			 ; 42 C6 | Reserved instruction
	CPY $4B			  ; C4 4B | Compare Y register (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_286
; Address: $CDC8CB
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_286:
	REP #$50			 ; C2 50 | Reset processor status bits
	CPY #$55			 ; C0 55 | Compare Y register (immediate)
	LDX $BC5A,Y		  ; BE 5A BC | Load from absolute,Y into X register
	LSR $63BA,X		  ; 5E BA 63 | Logical shift right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($70B2)		  ; 6C B2 70 | Jump to address (absolute indirect)
	LDA $79AC75		  ; AF 75 AC 79 | Read graphics status
	LDA #$7D			 ; A9 7D | Read graphics status
	LDX $81			  ; A6 81 | Load from zero page into X register
	STA $9F			  ; 85 9F | Update graphics data
	BIT #$9C			 ; 89 9C | Test bits in accumulator (immediate)
	STA $9198			; 8D 98 91 | Update graphics data
	ORA $D3			  ; 05 D3 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $1FD1,Y		  ; 19 D1 1F | Logical OR with accumulator (absolute,Y)
	BNE $24			  ; D0 24 | Branch if not equal
	AND #$CE			 ; 29 CE | Logical AND with accumulator (immediate)
	ROL $33CD			; 2E CD 33 | Rotate left (absolute)
	CPY $CA38			; CC 38 CA | Compare Y register (absolute)
	AND $42C9,X		  ; 3D C9 42 | Hardware register operation
	CMP $4C			  ; C5 4C | Compare accumulator (zero page)
	EOR ($C1),Y		  ; 51 C1 | Exclusive OR with accumulator ((zero page),Y)
	LDA				  ; BF 5A BD 5F | Read graphics status
	TSX				  ; BA | Transfer stack pointer to X register
	CLV				  ; B8 | Clear overflow flag
	PLA				  ; 68 | Pull accumulator from stack
	JMP ($71B3)		  ; 6C B3 71 | Jump to address (absolute indirect)
	BCS $75			  ; B0 75 | Branch if carry set
	LDA $AA7A			; AD 7A AA | Read graphics status
	ROR $82A7,X		  ; 7E A7 82 | Rotate right (absolute,X)
	STX $A0			  ; 86 A0 | Store X register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	STA $998E,X		  ; 9D 8E 99 | Update graphics data
	ORA $D4			  ; 05 D4 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	CMP ($24),Y		  ; D1 24 | Compare accumulator ((zero page),Y)
	BNE $29			  ; D0 29 | Branch if not equal
	ROL $33CE			; 2E CE 33 | Rotate left (absolute)
	CMP $CB38			; CD 38 CB | Compare accumulator (absolute)
	AND $42CA,X		  ; 3D CA 42 | Hardware register operation
	INY				  ; C8 | Increment Y register
	DEC $4C			  ; C6 4C | Decrement (zero page)
	CPY $51			  ; C4 51 | Compare Y register (zero page)
	REP #$56			 ; C2 56 | Reset processor status bits
	CPY #$5B			 ; C0 5B | Compare Y register (immediate)
	LDX $BB5F,Y		  ; BE 5F BB | Load from absolute,Y into X register
	STZ $B9			  ; 64 B9 | Store zero to zero page
	PLA				  ; 68 | Pull accumulator from stack
	ADC $71B3			; 6D B3 71 | Add with carry (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_287
; Address: $CDC95B
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_287:
	LDA ($76),Y		  ; B1 76 | Read graphics status
	LDX $AB7A			; AE 7A AB | Load from absolute address into X register
	ROR $83A7,X		  ; 7E A7 83 | Rotate right (absolute,X)
	LDY $87			  ; A4 87 | Load from zero page into Y register
	LDA ($8B,X)		  ; A1 8B | Read graphics status
	STA $9A8F,X		  ; 9D 8F 9A | Update graphics data
	ORA $D5			  ; 05 D5 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	BIT $D1			  ; 24 D1 | Test bits in accumulator (zero page)
	AND #$D0			 ; 29 D0 | Logical AND with accumulator (immediate)
	ROL $33CF			; 2E CF 33 | Rotate left (absolute)
	DEC $CC39			; CE 39 CC | Decrement (absolute)
	ROL $43CB,X		  ; 3E CB 43 | Rotate left (absolute,X)
	CMP #$48			 ; C9 48 | Compare accumulator (immediate)
	EOR $51C5			; 4D C5 51 | Exclusive OR with accumulator (absolute)
	CMP ($5B,X)		  ; C1 5B | Compare accumulator ((zero page,X))
	LDA				  ; BF 60 BC 64 | Read graphics status
	TSX				  ; BA | Transfer stack pointer to X register
	ADC #$B7			 ; 69 B7 | Add with carry (immediate)
	ROR $72B4			; 6E B4 72 | Rotate right (absolute)
	LDA ($76),Y		  ; B1 76 | Read graphics status
	LDX $AB7B			; AE 7B AB | Load from absolute address into X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $87			  ; A5 87 | Read graphics status
	LDX #$8B			 ; A2 8B | Load immediate value into X register
	STZ $9A8F,X		  ; 9E 8F 9A | Store zero to absolute,X
	ORA $D6			  ; 05 D6 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	BIT $D2			  ; 24 D2 | Test bits in accumulator (zero page)
	AND #$D1			 ; 29 D1 | Logical AND with accumulator (immediate)
	BNE $34			  ; D0 34 | Branch if not equal
	AND $3ECD,Y		  ; 39 CD 3E | Logical AND with accumulator (absolute,Y)
	CPY $CA43			; CC 43 CA | Compare Y register (absolute)
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	EOR $52C6			; 4D C6 52 | Exclusive OR with accumulator (absolute)
	CPY $57			  ; C4 57 | Compare Y register (zero page)
	REP #$5B			 ; C2 5B | Reset processor status bits
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	LDA $BB65,X		  ; BD 65 BB | Read graphics status
	ADC #$B8			 ; 69 B8 | Add with carry (immediate)
	ROR $73B5			; 6E B5 73 | Rotate right (absolute)
	LDA $80AC7B		  ; AF 7B AC 80 | Read graphics status
	LDA #$84			 ; A9 84 | Read graphics status
	LDX $88			  ; A6 88 | Load from zero page into X register
	LDX #$8C			 ; A2 8C | Load immediate value into X register
	STA				  ; 9F 90 9B 94 | Update graphics data
	ORA $D7			  ; 05 D7 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_288
; Address: $CDC9F0
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_288:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INC				  ; 1A | Increment accumulator
	BIT $D3			  ; 24 D3 | Test bits in accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP ($34),Y		  ; D1 34 | Compare accumulator ((zero page),Y)
	BNE $39			  ; D0 39 | Branch if not equal
	DEC $CD3E			; CE 3E CD | Decrement (absolute)
	PHA				  ; 48 | Push accumulator to stack
	CMP #$4D			 ; C9 4D | Compare accumulator (immediate)
	CMP $57			  ; C5 57 | Compare accumulator (zero page)
	JMP $BE61C0		  ; 5C C0 61 BE | Jump to address long
	ADC $BB			  ; 65 BB | Add with carry (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	LDA $B66F,Y		  ; B9 6F B6 | Read graphics status
	SEI				  ; 78 | Set interrupt disable flag
	BCS $7C			  ; B0 7C | Branch if carry set
	LDA $AA80			; AD 80 AA | Read graphics status
	STY $A6			  ; 84 A6 | Store Y register to zero page
	BIT #$A3			 ; 89 A3 | Test bits in accumulator (immediate)
	STA $91A0			; 8D A0 91 | Update graphics data
	STZ $D894			; 9C 94 D8 | Store zero to absolute
	CLD				  ; D8 | Clear decimal mode flag
	ORA $D8			  ; 05 D8 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CLD				  ; D8 | Clear decimal mode flag
	INC				  ; 1A | Increment accumulator
	AND $D4			  ; 25 D4 | Logical AND with accumulator (zero page)
	ROL				  ; 2A | Rotate left (accumulator)
	CMP ($39),Y		  ; D1 39 | Compare accumulator ((zero page),Y)
	ROL $44CE,X		  ; 3E CE 44 | Rotate left (absolute,X)
	CPY $CA49			; CC 49 CA | Compare Y register (absolute)
	LSR $53C8			; 4E C8 53 | Logical shift right (absolute)
	DEC $57			  ; C6 57 | Decrement (zero page)
	CPY $5C			  ; C4 5C | Compare Y register (zero page)
	CMP ($61,X)		  ; C1 61 | Compare accumulator ((zero page,X))
	LDA				  ; BF 66 BC 6A | Read graphics status
	TSX				  ; BA | Transfer stack pointer to X register
	SEI				  ; 78 | Set interrupt disable flag
	LDA ($7C),Y		  ; B1 7C | Read graphics status
	LDX $AB81			; AE 81 AB | Load from absolute address into X register
	STA $A7			  ; 85 A7 | Update graphics data
	BIT #$A4			 ; 89 A4 | Test bits in accumulator (immediate)
	STA $91A0			; 8D A0 91 | Update graphics data
	STA $D995,X		  ; 9D 95 D9 | Update graphics data
	CMP $D905,Y		  ; D9 05 D9 | Compare accumulator (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP $D810,Y		  ; D9 10 D8 | Compare accumulator (absolute,Y)
	CLD				  ; D8 | Clear decimal mode flag
	INC				  ; 1A | Increment accumulator
	AND $D5			  ; 25 D5 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_289
; Address: $CDCA7C
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_289:
	ROL				  ; 2A | Rotate left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	BNE $3F			  ; D0 3F | Branch if not equal
	DEC $CD44			; CE 44 CD | Decrement (absolute)
	EOR #$CB			 ; 49 CB | Exclusive OR with accumulator (immediate)
	LSR $53C9			; 4E C9 53 | Logical shift right (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	CMP $5D			  ; C5 5D | Compare accumulator (zero page)
	REP #$62			 ; C2 62 | Reset processor status bits
	CPY #$66			 ; C0 66 | Compare Y register (immediate)
	LDA $BA6B,X		  ; BD 6B BA | Read graphics status
	BVS $B8			  ; 70 B8 | Branch if overflow set
	ADC $7DB2,Y		  ; 79 B2 7D | Add with carry (absolute,Y)
	LDA $86AB81		  ; AF 81 AB 86 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	TXA				  ; 8A | Transfer X register to accumulator
	LDA $8E			  ; A5 8E | Read graphics status
	LDA ($92,X)		  ; A1 92 | Read graphics status
	STA $DA96,X		  ; 9D 96 DA | Update graphics data
	PHX				  ; DA | Push X register to stack
	ORA $DA			  ; 05 DA | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHX				  ; DA | Push X register to stack
	BPL $D9			  ; 10 D9 | Branch if positive
	CMP $D81A,Y		  ; D9 1A D8 | Compare accumulator (absolute,Y)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_28A
; Address: $CDCAB8
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_28A:
	JSR $25D7			; 20 D7 25 | Jump to subroutine
	ROL				  ; 2A | Rotate left (accumulator)
	DEC				  ; 3A | Decrement accumulator
	CMP ($3F),Y		  ; D1 3F | Compare accumulator ((zero page),Y)
	DEC $CC49			; CE 49 CC | Decrement (absolute)
	LSR $53CA			; 4E CA 53 | Logical shift right (absolute)
	INY				  ; C8 | Increment Y register
	CLI				  ; 58 | Clear interrupt disable flag
	CMP $5D			  ; C5 5D | Compare accumulator (zero page)
	CMP ($67,X)		  ; C1 67 | Compare accumulator ((zero page,X))
	LDX $BB6B,Y		  ; BE 6B BB | Load from absolute,Y into X register
	BVS $B9			  ; 70 B9 | Branch if overflow set
	ADC $7EB3,Y		  ; 79 B3 7E | Add with carry (absolute,Y)
	LDA $86AC82		  ; AF 82 AC 86 | Read graphics status
	LDA #$8A			 ; A9 8A | Read graphics status
	LDA $8F			  ; A5 8F | Read graphics status
	LDX #$93			 ; A2 93 | Load immediate value into X register
	STZ $DB97,X		  ; 9E 97 DB | Store zero to absolute,X
	ORA $DB			  ; 05 DB | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $DA			  ; 10 DA | Branch if positive
	PHX				  ; DA | Push X register to stack
	INC				  ; 1A | Increment accumulator
	CMP $D820,Y		  ; D9 20 D8 | Compare accumulator (absolute,Y)
	AND $D7			  ; 25 D7 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_28B
; Address: $CDCAFC
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_28B:
	ROL				  ; 2A | Rotate left (accumulator)
	BMI $D5			  ; 30 D5 | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	BNE $45			  ; D0 45 | Branch if not equal
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $CB4F			; CD 4F CB | Compare accumulator (absolute)
	CMP #$59			 ; C9 59 | Compare accumulator (immediate)
	DEC $5E			  ; C6 5E | Decrement (zero page)
	CPY $62			  ; C4 62 | Compare Y register (zero page)
	REP #$67			 ; C2 67 | Reset processor status bits
	LDA				  ; BF 6C BC 71 | Read graphics status
	LDA $B675,Y		  ; B9 75 B6 | Read graphics status
	PLY				  ; 7A | Pull Y register from stack
	ROR $83B0,X		  ; 7E B0 83 | Rotate right (absolute,X)
	LDA $AA87			; AD 87 AA | Read graphics status
	PHB				  ; 8B | Push data bank register to stack
	LDX $8F			  ; A6 8F | Load from zero page into X register
	STA				  ; 9F 97 DC 00 | Update graphics data
	ORA $DC			  ; 05 DC | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $DB			  ; 10 DB | Branch if positive
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_28C
; Address: $CDCB38
; Size: 48 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_28C:
	JSR $25D9			; 20 D9 25 | Jump to subroutine
	CLD				  ; D8 | Clear decimal mode flag
	BMI $D6			  ; 30 D6 | Branch if negative
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	CMP ($45),Y		  ; D1 45 | Compare accumulator ((zero page),Y)
	BNE $4A			  ; D0 4A | Branch if not equal
	DEC $CC4F			; CE 4F CC | Decrement (absolute)
	DEX				  ; CA | Decrement X register
	EOR $5EC7,Y		  ; 59 C7 5E | Exclusive OR with accumulator (absolute,Y)
	CMP $63			  ; C5 63 | Compare accumulator (zero page)
	REP #$68			 ; C2 68 | Reset processor status bits
	CPY #$6C			 ; C0 6C | Compare Y register (immediate)
	LDA $BA71,X		  ; BD 71 BA | Read graphics status
	PLY				  ; 7A | Pull Y register from stack
	LDA ($83),Y		  ; B1 83 | Read graphics status
	LDX $AA87			; AE 87 AA | Load from absolute address into X register
	STY $90A7			; 8C A7 90 | Store Y register to absolute address
	LDY #$98			 ; A0 98 | Load immediate value into Y register
	CMP $DD00,X		  ; DD 00 DD | Compare accumulator (absolute,X)
	ORA $DD			  ; 05 DD | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	CMP $DC10,X		  ; DD 10 DC | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_28D
; Address: $CDCB78
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_28D:
	JSR $25DA			; 20 DA 25 | Jump to subroutine
	CMP $D82B,Y		  ; D9 2B D8 | Compare accumulator (absolute,Y)
	BMI $D7			  ; 30 D7 | Branch if negative
	RTI				  ; 40 | Return from interrupt
	EOR $D1			  ; 45 D1 | Exclusive OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_28E
; Address: $CDCB88
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_28E:
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $CA54			; CD 54 CA | Compare accumulator (absolute)
	EOR $5EC8,Y		  ; 59 C8 5E | Exclusive OR with accumulator (absolute,Y)
	DEC $63			  ; C6 63 | Decrement (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	CMP ($6D,X)		  ; C1 6D | Compare accumulator ((zero page,X))
	LDX $BB72,Y		  ; BE 72 BB | Load from absolute,Y into X register
	CLV				  ; B8 | Clear overflow flag
	STY $AF			  ; 84 AF | Store Y register to zero page
	DEY				  ; 88 | Decrement Y register
	PLB				  ; AB | Pull data bank register from stack
	STY $91A8			; 8C A8 91 | Store Y register to absolute address
	LDY $95			  ; A4 95 | Load from zero page into Y register
	LDY #$99			 ; A0 99 | Load immediate value into Y register
	DEC $DE00,X		  ; DE 00 DE | Decrement (absolute,X)
	ORA $DE			  ; 05 DE | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	DEC $DD10,X		  ; DE 10 DD | Decrement (absolute,X)
	CMP $DC1B,X		  ; DD 1B DC | Compare accumulator (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_28F
; Address: $CDCBB8
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_28F:
	JSR $26DB			; 20 DB 26 | Jump to subroutine
	PHX				  ; DA | Push X register to stack
	CMP $D830,Y		  ; D9 30 D8 | Compare accumulator (absolute,Y)
	RTI				  ; 40 | Return from interrupt
	EOR $D1			  ; 45 D1 | Exclusive OR with accumulator (zero page)
	BNE $50			  ; D0 50 | Branch if not equal
	DEC $CB55			; CE 55 CB | Decrement (absolute)
	PHY				  ; 5A | Push Y register to stack
	CMP #$5F			 ; C9 5F | Compare accumulator (immediate)
	STZ $C4			  ; 64 C4 | Store zero to zero page
	ADC #$C2			 ; 69 C2 | Add with carry (immediate)
	ADC $72BF			; 6D BF 72 | Add with carry (absolute)
	LDY $B977,X		  ; BC 77 B9 | Load from absolute,X into Y register
	BRA $B3			  ; 80 B3 | Branch always
	STY $AF			  ; 84 AF | Store Y register to zero page
	BIT #$AC			 ; 89 AC | Test bits in accumulator (immediate)
	STA $91A8			; 8D A8 91 | Update graphics data
	LDA $95			  ; A5 95 | Read graphics status
	LDA ($99,X)		  ; A1 99 | Read graphics status
	ORA $DF			  ; 05 DF | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BPL $DE			  ; 10 DE | Branch if positive
	DEC $DD1B,X		  ; DE 1B DD | Decrement (absolute,X)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_290
; Address: $CDCBF8
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_290:
	JSR $26DC			; 20 DC 26 | Jump to subroutine
	PHX				  ; DA | Push X register to stack
	AND ($D9),Y		  ; 31 D9 | Logical AND with accumulator ((zero page),Y)
	EOR ($D4,X)		  ; 41 D4 | Exclusive OR with accumulator ((zero page,X))
	LSR $D2			  ; 46 D2 | Logical shift right (zero page)
	BNE $50			  ; D0 50 | Branch if not equal
	DEC $CC55			; CE 55 CC | Decrement (absolute)
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_291
; Address: $CDCC0F
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_291:
	DEX				  ; CA | Decrement X register
	INY				  ; C8 | Increment Y register
	STZ $C5			  ; 64 C5 | Store zero to zero page
	ADC #$C2			 ; 69 C2 | Add with carry (immediate)
	ROR $73C0			; 6E C0 73 | Rotate right (absolute)
	LDA $BA77,X		  ; BD 77 BA | Read graphics status
	BRA $B3			  ; 80 B3 | Branch always
	STA $B0			  ; 85 B0 | Update graphics data
	BIT #$AD			 ; 89 AD | Test bits in accumulator (immediate)
	STX $92A9			; 8E A9 92 | Store X register to absolute address
	LDA $96			  ; A5 96 | Read graphics status
	LDX #$9A			 ; A2 9A | Load immediate value into X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	CPX #$05			 ; E0 05 | Compare X register (immediate)
	CPX #$0B			 ; E0 0B | Compare X register (immediate)
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	DEC $DD21,X		  ; DE 21 DD | Decrement (absolute,X)
	ROL $DC			  ; 26 DC | Rotate left (zero page)
	AND ($DA),Y		  ; 31 DA | Logical AND with accumulator ((zero page),Y)
	CLD				  ; D8 | Clear decimal mode flag
	EOR ($D5,X)		  ; 41 D5 | Exclusive OR with accumulator ((zero page,X))
	LSR $D3			  ; 46 D3 | Logical shift right (zero page)
	CMP ($50),Y		  ; D1 50 | Compare accumulator ((zero page),Y)
	CMP $CB5B			; CD 5B CB | Compare accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_292
; Address: $CDCC51
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_292:
	INY				  ; C8 | Increment Y register
	ADC $C6			  ; 65 C6 | Add with carry (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	ROR $73C0			; 6E C0 73 | Rotate right (absolute)
	LDX $BB78,Y		  ; BE 78 BB | Load from absolute,Y into X register
	ADC $81B7,X		  ; 7D B7 81 | Add with carry (absolute,X)
	STX $B1			  ; 86 B1 | Store X register to zero page
	TXA				  ; 8A | Transfer X register to accumulator
	LDA $AA8E			; AD 8E AA | Read graphics status
	LDX $97			  ; A6 97 | Load from zero page into X register
	LDX #$9B			 ; A2 9B | Load immediate value into X register
	SBC ($00,X)		  ; E1 00 | Subtract with carry ((zero page,X))
	SBC ($05,X)		  ; E1 05 | Subtract with carry ((zero page,X))
	SBC ($0B,X)		  ; E1 0B | Subtract with carry ((zero page,X))
	SBC ($10,X)		  ; E1 10 | Subtract with carry ((zero page,X))
	CPX #$16			 ; E0 16 | Compare X register (immediate)
	CPX #$1B			 ; E0 1B | Compare X register (immediate)
	AND ($DE,X)		  ; 21 DE | Logical AND with accumulator ((zero page,X))
	ROL $DD			  ; 26 DD | Rotate left (zero page)
	BIT $31DC			; 2C DC 31 | Test bits in accumulator (absolute)
	CMP $D83C,Y		  ; D9 3C D8 | Compare accumulator (absolute,Y)
	EOR ($D6,X)		  ; 41 D6 | Exclusive OR with accumulator ((zero page,X))
	LSR $D4			  ; 46 D4 | Logical shift right (zero page)
	JMP $51D2			; 4C D2 51 | Jump to address
	BNE $56			  ; D0 56 | Branch if not equal

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_294
; Address: $CDCC91
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_294:
	CMP #$65			 ; C9 65 | Compare accumulator (immediate)
	ROR				  ; 6A | Rotate right (accumulator)
	CPY $6F			  ; C4 6F | Compare Y register (zero page)
	CMP ($74,X)		  ; C1 74 | Compare accumulator ((zero page,X))
	LDX $BB78,Y		  ; BE 78 BB | Load from absolute,Y into X register
	ADC $82B8,X		  ; 7D B8 82 | Add with carry (absolute,X)
	STX $B2			  ; 86 B2 | Store X register to zero page
	PHB				  ; 8B | Push data bank register to stack
	LDX $AB8F			; AE 8F AB | Load from absolute address into X register
	SEP #$00			 ; E2 00 | Set processor status bits
	SEP #$05			 ; E2 05 | Set processor status bits
	SEP #$0B			 ; E2 0B | Set processor status bits
	SEP #$10			 ; E2 10 | Set processor status bits
	SBC ($16,X)		  ; E1 16 | Subtract with carry ((zero page,X))
	SBC ($1B,X)		  ; E1 1B | Subtract with carry ((zero page,X))
	CPX #$21			 ; E0 21 | PPU graphics register access
	ROL $DE			  ; 26 DE | Rotate left (zero page)
	BIT $31DD			; 2C DD 31 | Test bits in accumulator (absolute)
	PHX				  ; DA | Push X register to stack
	CMP $D741,Y		  ; D9 41 D7 | Compare accumulator (absolute,Y)
	JMP $51D3			; 4C D3 51 | Jump to address
	CMP ($56),Y		  ; D1 56 | Compare accumulator ((zero page),Y)
	CMP $CA61			; CD 61 CA | Compare accumulator (absolute)
	ROR $C8			  ; 66 C8 | Rotate right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_295
; Address: $CDCCD5
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_295:
	CMP $6F			  ; C5 6F | Compare accumulator (zero page)
	REP #$74			 ; C2 74 | Reset processor status bits
	LDA				  ; BF 79 BC 7E | Read graphics status
	LDA $B682,Y		  ; B9 82 B6 | Read graphics status
	PHB				  ; 8B | Push data bank register to stack
	LDA $94AB90		  ; AF 90 AB 94 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY $9C			  ; A4 9C | Load from zero page into Y register
	ORA $E3			  ; 05 E3 | Logical OR with accumulator (zero page)
	BPL $E2			  ; 10 E2 | Branch if positive
	SEP #$1B			 ; E2 1B | Set processor status bits
	SBC ($21,X)		  ; E1 21 | PPU graphics register access
	CPX #$26			 ; E0 26 | Compare X register (immediate)
	BIT $31DE			; 2C DE 31 | Test bits in accumulator (absolute)
	CMP $DB37,X		  ; DD 37 DB | Compare accumulator (absolute,X)
	PHX				  ; DA | Push X register to stack
	WDM #$D8			 ; 42 D8 | Reserved instruction
	JMP $52D4			; 4C D4 52 | Jump to address
	BNE $5C			  ; D0 5C | Branch if not equal
	DEC $CB61			; CE 61 CB | Decrement (absolute)
	ROR $C9			  ; 66 C9 | Rotate right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_296
; Address: $CDCD15
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_296:
	DEC $70			  ; C6 70 | Decrement (zero page)
	CPY #$79			 ; C0 79 | Compare Y register (immediate)
	LDA $BA7E,X		  ; BD 7E BA | Read graphics status
	STY $90B0			; 8C B0 90 | Store Y register to absolute address
	LDY $A894			; AC 94 A8 | Load from absolute address into Y register
	STA $9DA5,Y		  ; 99 A5 9D | Update graphics data
	CPX $00			  ; E4 00 | Compare X register (zero page)
	CPX $05			  ; E4 05 | Compare X register (zero page)
	CPX $0B			  ; E4 0B | Compare X register (zero page)
	CPX $10			  ; E4 10 | Compare X register (zero page)
	SEP #$21			 ; E2 21 | PPU graphics register access
	SBC ($27,X)		  ; E1 27 | Subtract with carry ((zero page,X))
	CPX #$2C			 ; E0 2C | Compare X register (immediate)
	DEC $DC37,X		  ; DE 37 DC | Decrement (absolute,X)
	AND $42DB,X		  ; 3D DB 42 | Hardware register operation
	CMP $D747,Y		  ; D9 47 D7 | Compare accumulator (absolute,Y)
	EOR $52D5			; 4D D5 52 | Exclusive OR with accumulator (absolute)
	CMP ($5C),Y		  ; D1 5C | Compare accumulator ((zero page),Y)
	ADC ($CC,X)		  ; 61 CC | Add with carry ((zero page,X))
	ROR $C9			  ; 66 C9 | Rotate right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_297
; Address: $CDCD56
; Size: 64 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_297:
	BVS $C4			  ; 70 C4 | Branch if overflow set
	CMP ($7A,X)		  ; C1 7A | Compare accumulator ((zero page,X))
	LDX $BB7F,Y		  ; BE 7F BB | Load from absolute,Y into X register
	DEY				  ; 88 | Decrement Y register
	STY $91B1			; 8C B1 91 | Store Y register to absolute address
	LDA $A995			; AD 95 A9 | Read graphics status
	STA $9DA5,Y		  ; 99 A5 9D | Update graphics data
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	SBC $05			  ; E5 05 | Subtract with carry (zero page)
	SBC $0B			  ; E5 0B | Subtract with carry (zero page)
	SBC $10			  ; E5 10 | Subtract with carry (zero page)
	CPX $16			  ; E4 16 | Compare X register (zero page)
	CPX $1C			  ; E4 1C | Compare X register (zero page)
	AND ($E2,X)		  ; 21 E2 | Logical AND with accumulator ((zero page,X))
	SBC ($2C,X)		  ; E1 2C | Subtract with carry ((zero page,X))
	CPX #$32			 ; E0 32 | Compare X register (immediate)
	CMP $DC3D,X		  ; DD 3D DC | Compare accumulator (absolute,X)
	WDM #$DA			 ; 42 DA | Reserved instruction
	PHA				  ; 48 | Push accumulator to stack
	CLD				  ; D8 | Clear decimal mode flag
	EOR $52D6			; 4D D6 52 | Exclusive OR with accumulator (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $62CF,X		  ; 5D CF 62 | Exclusive OR with accumulator (absolute,X)
	CMP $CA67			; CD 67 CA | Compare accumulator (absolute)
	JMP ($71C8)		  ; 6C C8 71 | Jump to address (absolute indirect)
	CMP $76			  ; C5 76 | Compare accumulator (zero page)
	REP #$7B			 ; C2 7B | Reset processor status bits
	LDA				  ; BF 7F BC 84 | Read graphics status
	CLV				  ; B8 | Clear overflow flag

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_298
; Address: $CDCDA0
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_298:
	BIT #$B5			 ; 89 B5 | Test bits in accumulator (immediate)
	STA $91B1			; 8D B1 91 | Update graphics data
	LDX $AA96			; AE 96 AA | Load from absolute address into X register
	TXS				  ; 9A | Transfer X register to stack pointer
	LDX $9E			  ; A6 9E | Load from zero page into X register
	INC $00			  ; E6 00 | Increment (zero page)
	INC $05			  ; E6 05 | Increment (zero page)
	INC $0B			  ; E6 0B | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	SBC $16			  ; E5 16 | Subtract with carry (zero page)
	SBC $1C			  ; E5 1C | Subtract with carry (zero page)
	CPX $21			  ; E4 21 | PPU graphics register access
	SEP #$2D			 ; E2 2D | Set processor status bits
	SBC ($32,X)		  ; E1 32 | Subtract with carry ((zero page,X))
	CPX #$38			 ; E0 38 | Compare X register (immediate)
	DEC $DD3D,X		  ; DE 3D DD | Decrement (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	CMP $D74D,Y		  ; D9 4D D7 | Compare accumulator (absolute,Y)
	CLI				  ; 58 | Clear interrupt disable flag
	EOR $62D0,X		  ; 5D D0 62 | Exclusive OR with accumulator (absolute,X)
	DEC $CB67			; CE 67 CB | Decrement (absolute)
	JMP ($71C8)		  ; 6C C8 71 | Jump to address (absolute indirect)
	DEC $76			  ; C6 76 | Decrement (zero page)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDY $B985,X		  ; BC 85 B9 | Load from absolute,X into Y register
	BIT #$B6			 ; 89 B6 | Test bits in accumulator (immediate)
	STX $92B2			; 8E B2 92 | Store X register to absolute address
	LDX $AB96			; AE 96 AB | Load from absolute address into X register
	STA				  ; 9F E7 00 E7 | Update graphics data
	ORA $E7			  ; 05 E7 | Logical OR with accumulator (zero page)
	ORA ($E6),Y		  ; 11 E6 | Logical OR with accumulator ((zero page),Y)
	INC $1C			  ; E6 1C | Increment (zero page)
	SBC $22			  ; E5 22 | Subtract with carry (zero page)
	CPX $27			  ; E4 27 | Compare X register (zero page)
	AND $32E2			; 2D E2 32 | Logical AND with accumulator (absolute)
	SBC ($38,X)		  ; E1 38 | Subtract with carry ((zero page,X))
	AND $43DE,X		  ; 3D DE 43 | Logical AND with accumulator (absolute,X)
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LSR $53D8			; 4E D8 53 | Logical shift right (absolute)
	CLI				  ; 58 | Clear interrupt disable flag
	LSR $63D1,X		  ; 5E D1 63 | Logical shift right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	CPY $C96D			; CC 6D C9 | Compare Y register (absolute)
	DEC $77			  ; C6 77 | Decrement (zero page)
	CPY $7C			  ; C4 7C | Compare Y register (zero page)
	CPY #$80			 ; C0 80 | Compare Y register (immediate)
	LDA $BA85,X		  ; BD 85 BA | Read graphics status
	TXA				  ; 8A | Transfer X register to accumulator
	STX $93B3			; 8E B3 93 | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_299
; Address: $CDCE25
; Size: 66 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_299:
	LDA $9BAB97		  ; AF 97 AB 9B | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	STA				  ; 9F E8 00 E8 | Update graphics data
	ORA $E8			  ; 05 E8 | Logical OR with accumulator (zero page)
	INX				  ; E8 | Increment X register
	ORA ($E7),Y		  ; 11 E7 | Logical OR with accumulator ((zero page),Y)
	INC $22			  ; E6 22 | Increment (zero page)
	SBC $27			  ; E5 27 | Subtract with carry (zero page)
	CPX $2D			  ; E4 2D | Compare X register (zero page)
	SEP #$38			 ; E2 38 | Set processor status bits
	CPX #$3E			 ; E0 3E | Compare X register (immediate)
	DEC $DD43,X		  ; DE 43 DD | Decrement (absolute,X)
	EOR #$DB			 ; 49 DB | Exclusive OR with accumulator (immediate)
	LSR $53D9			; 4E D9 53 | Logical shift right (absolute)
	EOR $5ED5,Y		  ; 59 D5 5E | Exclusive OR with accumulator (absolute,Y)
	BNE $68			  ; D0 68 | Branch if not equal
	CMP $CA6D			; CD 6D CA | Compare accumulator (absolute)
	CPY $7C			  ; C4 7C | Compare Y register (zero page)
	CMP ($81,X)		  ; C1 81 | Compare accumulator ((zero page,X))
	LDX $BB86,Y		  ; BE 86 BB | Load from absolute,Y into X register
	TXA				  ; 8A | Transfer X register to accumulator
	STA $B093B4		  ; 8F B4 93 B0 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	LDY $A89C			; AC 9C A8 | Load from absolute address into Y register
	LDY #$E9			 ; A0 E9 | Load immediate value into Y register
	SBC #$05			 ; E9 05 | Subtract with carry (immediate)
	SBC #$0B			 ; E9 0B | Subtract with carry (immediate)
	SBC #$11			 ; E9 11 | Subtract with carry (immediate)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_29A
; Address: $CDCE78
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_29A:
	JSL $E528E6		  ; 22 E6 28 E5 | Jump to subroutine long
	AND $33E4			; 2D E4 33 | Logical AND with accumulator (absolute)
	SEP #$38			 ; E2 38 | Set processor status bits
	SBC ($3E,X)		  ; E1 3E | Subtract with carry ((zero page,X))
	DEC $DC49,X		  ; DE 49 DC | Decrement (absolute,X)
	LSR $54DA			; 4E DA 54 | Logical shift right (absolute)
	CLD				  ; D8 | Clear decimal mode flag
	EOR $5ED5,Y		  ; 59 D5 5E | Exclusive OR with accumulator (absolute,Y)
	STZ $D1			  ; 64 D1 | Store zero to zero page
	ADC #$CE			 ; 69 CE | Add with carry (immediate)
	ROR $73CB			; 6E CB 73 | Rotate right (absolute)
	INY				  ; C8 | Increment Y register
	SEI				  ; 78 | Set interrupt disable flag
	CMP $7D			  ; C5 7D | Compare accumulator (zero page)
	REP #$82			 ; C2 82 | Reset processor status bits
	LDA				  ; BF 86 BB 8B | Read graphics status
	CLV				  ; B8 | Clear overflow flag
	STA $B194B4		  ; 8F B4 94 B1 | Update graphics data
	TYA				  ; 98 | Transfer Y register to accumulator
	LDA $A99D			; AD 9D A9 | Read graphics status

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_29B
; Address: $CDCEAA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_29B:
	LDA ($EA,X)		  ; A1 EA | Read graphics status
	NOP				  ; EA | No operation
	ORA $EA			  ; 05 EA | Logical OR with accumulator (zero page)
	NOP				  ; EA | No operation
	ORA ($E9),Y		  ; 11 E9 | Logical OR with accumulator ((zero page),Y)
	SBC #$1C			 ; E9 1C | Subtract with carry (immediate)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_29C
; Address: $CDCEB8
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_29C:
	JSL $E628E7		  ; 22 E7 28 E6 | Jump to subroutine long
	AND $33E5			; 2D E5 33 | Logical AND with accumulator (absolute)
	AND $3EE2,Y		  ; 39 E2 3E | Logical AND with accumulator (absolute,Y)
	CPX #$44			 ; E0 44 | Compare X register (immediate)
	EOR #$DD			 ; 49 DD | Exclusive OR with accumulator (immediate)
	CMP $D659,Y		  ; D9 59 D6 | Compare accumulator (absolute,Y)
	STZ $D1			  ; 64 D1 | Store zero to zero page
	ADC #$CF			 ; 69 CF | Add with carry (immediate)
	ROR $73CC			; 6E CC 73 | Rotate right (absolute)
	CMP #$78			 ; C9 78 | Compare accumulator (immediate)
	DEC $7D			  ; C6 7D | Decrement (zero page)
	CPY #$87			 ; C0 87 | Compare Y register (immediate)
	LDY $B98B,X		  ; BC 8B B9 | Load from absolute,X into Y register
	BCC $B5			  ; 90 B5 | Branch if carry clear
	LDA ($99),Y		  ; B1 99 | Read graphics status
	LDX $AA9D			; AE 9D AA | Load from absolute address into X register
	LDX #$EB			 ; A2 EB | Load immediate value into X register
	XBA				  ; EB | Exchange accumulator bytes
	ORA $EB			  ; 05 EB | Logical OR with accumulator (zero page)
	XBA				  ; EB | Exchange accumulator bytes
	ORA ($EA),Y		  ; 11 EA | Logical OR with accumulator ((zero page),Y)
	NOP				  ; EA | No operation
	SBC #$22			 ; E9 22 | Subtract with carry (immediate)
	INX				  ; E8 | Increment X register
	PLP				  ; 28 | Pull processor status from stack
	ROL $33E6			; 2E E6 33 | Rotate left (absolute)
	CPX $39			  ; E4 39 | Compare X register (zero page)
	ROL $44E1,X		  ; 3E E1 44 | Rotate left (absolute,X)
	CPX #$4A			 ; E0 4A | Compare X register (immediate)
	DEC $DC4F,X		  ; DE 4F DC | Decrement (absolute,X)
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STZ $D2			  ; 64 D2 | Store zero to zero page
	ROR				  ; 6A | Rotate right (accumulator)
	BNE $6F			  ; D0 6F | Branch if not equal
	CMP $CA74			; CD 74 CA | Compare accumulator (absolute)
	ADC $7EC7,Y		  ; 79 C7 7E | Add with carry (absolute,Y)
	CPY $83			  ; C4 83 | Compare Y register (zero page)
	CPY #$87			 ; C0 87 | Compare Y register (immediate)
	LDA $BA8C,X		  ; BD 8C BA | Read graphics status
	STA ($B6),Y		  ; 91 B6 | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	LDX $AA9E			; AE 9E AA | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_29D
; Address: $CDCF2A
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_29D:
	LDX #$EC			 ; A2 EC | Load immediate value into X register
	CPX $EC05			; EC 05 EC | Compare X register (absolute)
	CPX $EB11			; EC 11 EB | Compare X register (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	ORA $22EA,X		  ; 1D EA 22 | Logical OR with accumulator (absolute,X)
	SBC #$28			 ; E9 28 | Subtract with carry (immediate)
	INX				  ; E8 | Increment X register
	ROL $33E7			; 2E E7 33 | Rotate left (absolute)
	SBC $39			  ; E5 39 | Subtract with carry (zero page)
	CPX $3F			  ; E4 3F | Compare X register (zero page)
	SEP #$44			 ; E2 44 | Set processor status bits
	SBC ($4A,X)		  ; E1 4A | Subtract with carry ((zero page,X))
	CMP $DA55,X		  ; DD 55 DA | Compare accumulator (absolute,X)
	PHY				  ; 5A | Push Y register to stack
	CLD				  ; D8 | Clear decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_29E
; Address: $CDCF50
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_29E:
	ADC $D3			  ; 65 D3 | Add with carry (zero page)
	ROR				  ; 6A | Rotate right (accumulator)
	CMP ($6F),Y		  ; D1 6F | Compare accumulator ((zero page),Y)
	DEC $CB74			; CE 74 CB | Decrement (absolute)
	ADC $7EC8,Y		  ; 79 C8 7E | Add with carry (absolute,Y)
	CMP $83			  ; C5 83 | Compare accumulator (zero page)
	CMP ($88,X)		  ; C1 88 | Compare accumulator ((zero page,X))
	LDX $BA8D,Y		  ; BE 8D BA | Load from absolute,Y into X register
	STA ($B7),Y		  ; 91 B7 | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	LDA $A3AB9F		  ; AF 9F AB A3 | Read graphics status
	SBC $ED00			; ED 00 ED | Subtract with carry (absolute)
	ORA $ED			  ; 05 ED | Logical OR with accumulator (zero page)
	SBC $EC11			; ED 11 EC | Subtract with carry (absolute)
	CPX $EB1D			; EC 1D EB | Compare X register (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_29F
; Address: $CDCF78
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_29F:
	JSL $E928EA		  ; 22 EA 28 E9 | Jump to subroutine long
	ROL $34E8			; 2E E8 34 | Rotate left (absolute)
	INC $39			  ; E6 39 | Increment (zero page)
	SBC $3F			  ; E5 3F | Subtract with carry (zero page)
	EOR $E1			  ; 45 E1 | Exclusive OR with accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	CPX #$50			 ; E0 50 | Compare X register (immediate)
	DEC $DB55,X		  ; DE 55 DB | Decrement (absolute,X)
	CMP $D760,Y		  ; D9 60 D7 | Compare accumulator (absolute,Y)
	ADC $D4			  ; 65 D4 | Add with carry (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2A0
; Address: $CDCF93
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2A0:
	CMP ($70),Y		  ; D1 70 | Compare accumulator ((zero page),Y)
	CPY $C97A			; CC 7A C9 | Compare Y register (absolute)
	CMP $84			  ; C5 84 | Compare accumulator (zero page)
	REP #$89			 ; C2 89 | Reset processor status bits
	LDA				  ; BF 8D BB 92 | Read graphics status
	BCS $9F			  ; B0 9F | Branch if carry set
	LDY $EEA4			; AC A4 EE | Load from absolute address into Y register
	INC $EE05			; EE 05 EE | Increment (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2A1
; Address: $CDCFB1
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2A1:
	INC $ED11			; EE 11 ED | Increment (absolute)
	SBC $EC1D			; ED 1D EC | Subtract with carry (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	PLP				  ; 28 | Pull processor status from stack
	NOP				  ; EA | No operation
	ROL $34E9			; 2E E9 34 | Rotate left (absolute)
	DEC				  ; 3A | Decrement accumulator
	INC $3F			  ; E6 3F | Increment (zero page)
	CPX $45			  ; E4 45 | Compare X register (zero page)
	SEP #$4A			 ; E2 4A | Set processor status bits
	SBC ($50,X)		  ; E1 50 | Subtract with carry ((zero page,X))
	DEC $DC56,X		  ; DE 56 DC | Decrement (absolute,X)
	PHX				  ; DA | Push X register to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2A2
; Address: $CDCFCF
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2A2:
	CLD				  ; D8 | Clear decimal mode flag
	ROR $D5			  ; 66 D5 | Rotate right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2A3
; Address: $CDCFD4
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2A3:
	BVS $CF			  ; 70 CF | Branch if overflow set
	CPY $C97A			; CC 7A C9 | Compare Y register (absolute)
	DEC $84			  ; C6 84 | Decrement (zero page)
	BIT #$BF			 ; 89 BF | Test bits in accumulator (immediate)
	STX $93BC			; 8E BC 93 | Store X register to absolute address
	CLV				  ; B8 | Clear overflow flag
	STZ $A0B1			; 9C B1 A0 | Store zero to absolute
	LDA $EFA4			; AD A4 EF | Read graphics status
	ORA $EF			  ; 05 EF | Logical OR with accumulator (zero page)
	ORA ($EE),Y		  ; 11 EE | Logical OR with accumulator ((zero page),Y)
	INC $ED1D			; EE 1D ED | Increment (absolute)
	CPX $EB29			; EC 29 EB | Compare X register (absolute)
	ROL $34EA			; 2E EA 34 | Rotate left (absolute)
	INX				  ; E8 | Increment X register
	DEC				  ; 3A | Decrement accumulator
	RTI				  ; 40 | Return from interrupt
	SBC $45			  ; E5 45 | Subtract with carry (zero page)
	SBC ($50,X)		  ; E1 50 | Subtract with carry ((zero page,X))
	CMP $DB5B,X		  ; DD 5B DB | Compare accumulator (absolute,X)
	ADC ($D8,X)		  ; 61 D8 | Add with carry ((zero page,X))
	ROR $D6			  ; 66 D6 | Rotate right (zero page)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2A4
; Address: $CDD014
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2A4:
	ADC ($D0),Y		  ; 71 D0 | Add with carry ((zero page),Y)
	CMP $CA7B			; CD 7B CA | Compare accumulator (absolute)
	BRA $C7			  ; 80 C7 | Branch always
	STA $C4			  ; 85 C4 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	CPY #$8E			 ; C0 8E | Compare Y register (immediate)
	LDA $B993,X		  ; BD 93 B9 | Read graphics status
	TYA				  ; 98 | Transfer Y register to accumulator
	STZ $A1B1			; 9C B1 A1 | Store zero to absolute
	LDA $F0A5			; AD A5 F0 | Read graphics status
	BEQ $05			  ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2A5
; Address: $CDD02F
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2A5:
	BEQ $0B			  ; F0 0B | Branch if equal
	BEQ $11			  ; F0 11 | Branch if equal
	ORA $23EE,X		  ; 1D EE 23 | Logical OR with accumulator (absolute,X)
	SBC $EC29			; ED 29 EC | Subtract with carry (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	SBC #$3A			 ; E9 3A | Subtract with carry (immediate)
	INX				  ; E8 | Increment X register
	RTI				  ; 40 | Return from interrupt
	INC $45			  ; E6 45 | Increment (zero page)
	CPX $4B			  ; E4 4B | Compare X register (zero page)
	SEP #$51			 ; E2 51 | Set processor status bits
	CPX #$56			 ; E0 56 | Compare X register (immediate)
	DEC $DC5C,X		  ; DE 5C DC | Decrement (absolute,X)
	ADC ($D9,X)		  ; 61 D9 | Add with carry ((zero page,X))
	JMP ($71D4)		  ; 6C D4 71 | Jump to address (absolute indirect)
	CMP ($76),Y		  ; D1 76 | Compare accumulator ((zero page),Y)
	DEC $CB7B			; CE 7B CB | Decrement (absolute)
	BRA $C8			  ; 80 C8 | Branch always
	STA $C5			  ; 85 C5 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	CMP ($8F,X)		  ; C1 8F | Compare accumulator ((zero page,X))
	LDA $BA94,X		  ; BD 94 BA | Read graphics status
	TYA				  ; 98 | Transfer Y register to accumulator
	STA $A1B2,X		  ; 9D B2 A1 | Update graphics data
	LDX $F1A6			; AE A6 F1 | Load from absolute address into X register
	SBC ($05),Y		  ; F1 05 | Subtract with carry ((zero page),Y)
	SBC ($0B),Y		  ; F1 0B | Subtract with carry ((zero page),Y)
	SBC ($11),Y		  ; F1 11 | Subtract with carry ((zero page),Y)
	BEQ $17			  ; F0 17 | Branch if equal
	BEQ $1D			  ; F0 1D | Branch if equal
	INC $ED29			; EE 29 ED | Increment (absolute)
	CPX $EA35			; EC 35 EA | Compare X register (absolute)
	DEC				  ; 3A | Decrement accumulator
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	LSR $E5			  ; 46 E5 | Logical shift right (zero page)
	EOR ($E1),Y		  ; 51 E1 | Exclusive OR with accumulator ((zero page),Y)
	JMP $DA62DD		  ; 5C DD 62 DA | Jump to address long
	CLD				  ; D8 | Clear decimal mode flag
	JMP ($72D5)		  ; 6C D5 72 | Jump to address (absolute indirect)
	CPY $C981			; CC 81 C9 | Compare Y register (absolute)
	STX $C5			  ; 86 C5 | Store X register to zero page
	PHB				  ; 8B | Push data bank register to stack
	REP #$90			 ; C2 90 | Reset processor status bits
	LDX $BB94,Y		  ; BE 94 BB | Load from absolute,Y into X register
	STA $9EB7,Y		  ; 99 B7 9E | Update graphics data
	LDX #$AF			 ; A2 AF | Load immediate value into X register
	LDX $F2			  ; A6 F2 | Load from zero page into X register
	ORA $F2			  ; 05 F2 | Logical OR with accumulator (zero page)
	ORA ($F1),Y		  ; 11 F1 | Logical OR with accumulator ((zero page),Y)
	SBC ($1D),Y		  ; F1 1D | Subtract with carry ((zero page),Y)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2A6
; Address: $CDD0B7
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2A6:
	BEQ $23			  ; F0 23 | Branch if equal
	AND #$EE			 ; 29 EE | Logical AND with accumulator (immediate)
	SBC $EB35			; ED 35 EB | Subtract with carry (absolute)
	NOP				  ; EA | No operation
	RTI				  ; 40 | Return from interrupt
	INX				  ; E8 | Increment X register
	LSR $E6			  ; 46 E6 | Logical shift right (zero page)
	JMP $51E4			; 4C E4 51 | Jump to address
	SEP #$57			 ; E2 57 | Set processor status bits
	CPX #$5C			 ; E0 5C | Compare X register (immediate)
	DEC $DB62,X		  ; DE 62 DB | Decrement (absolute,X)
	CMP $D66D,Y		  ; D9 6D D6 | Compare accumulator (absolute,Y)
	BNE $7C			  ; D0 7C | Branch if not equal
	CMP $CA82			; CD 82 CA | Compare accumulator (absolute)
	DEC $8B			  ; C6 8B | Decrement (zero page)
	BCC $BF			  ; 90 BF | Branch if carry clear
	TXS				  ; 9A | Transfer X register to stack pointer
	CLV				  ; B8 | Clear overflow flag
	STZ $A3B4,X		  ; 9E B4 A3 | Store zero to absolute,X
	LDA $00F3A7		  ; AF A7 F3 00 | Read graphics status
	ORA $F3			  ; 05 F3 | Logical OR with accumulator (zero page)
	ORA ($F2),Y		  ; 11 F2 | Logical OR with accumulator ((zero page),Y)
	ORA $23F1,X		  ; 1D F1 23 | Logical OR with accumulator (absolute,X)
	BEQ $29			  ; F0 29 | Branch if equal
	INC $EC35			; EE 35 EC | Increment (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	EOR ($E9,X)		  ; 41 E9 | Exclusive OR with accumulator ((zero page,X))
	LSR $E7			  ; 46 E7 | Logical shift right (zero page)
	JMP $52E5			; 4C E5 52 | Jump to address
	SBC ($5D,X)		  ; E1 5D | Subtract with carry ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	CMP $D76D,Y		  ; D9 6D D7 | Compare accumulator (absolute,Y)
	SEI				  ; 78 | Set interrupt disable flag
	CMP ($7D),Y		  ; D1 7D | Compare accumulator ((zero page),Y)
	DEC $CA82			; CE 82 CA | Decrement (absolute)
	STY $91C3			; 8C C3 91 | Store Y register to absolute address
	CPY #$96			 ; C0 96 | Compare Y register (immediate)
	LDY $B89A,X		  ; BC 9A B8 | Load from absolute,X into Y register
	STA				  ; 9F B4 A3 B0 | Update graphics data
	TAY				  ; A8 | Transfer accumulator to Y register
	PEA #$F400		   ; F4 00 F4 | Push effective address to stack
	ASL $F4			  ; 06 F4 | Arithmetic shift left (zero page)
	PEA #$F312		   ; F4 12 F3 | Push effective address to stack
	CLC				  ; 18 | Clear carry flag
	ORA $23F2,X		  ; 1D F2 23 | Logical OR with accumulator (absolute,X)
	SBC ($29),Y		  ; F1 29 | Subtract with carry ((zero page),Y)
	BEQ $2F			  ; F0 2F | Branch if equal
	SBC $EC3B			; ED 3B EC | Subtract with carry (absolute)
	EOR ($EA,X)		  ; 41 EA | Exclusive OR with accumulator ((zero page,X))
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2A7
; Address: $CDD146
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2A7:
	JMP $52E6			; 4C E6 52 | Jump to address
	CPX $58			  ; E4 58 | Compare X register (zero page)
	SEP #$5D			 ; E2 5D | Set processor status bits
	CMP $DA68,X		  ; DD 68 DA | Compare accumulator (absolute,X)
	ROR $73D8			; 6E D8 73 | Rotate right (absolute)
	SEI				  ; 78 | Set interrupt disable flag
	ADC $83CE,X		  ; 7D CE 83 | Add with carry (absolute,X)
	DEY				  ; 88 | Decrement Y register
	INY				  ; C8 | Increment Y register
	STA $91C4			; 8D C4 91 | Update graphics data
	CMP ($96,X)		  ; C1 96 | Compare accumulator ((zero page,X))
	LDA $B99B,X		  ; BD 9B B9 | Read graphics status
	LDY #$B5			 ; A0 B5 | Load immediate value into Y register
	LDY $B1			  ; A4 B1 | Load from zero page into Y register
	TAY				  ; A8 | Transfer accumulator to Y register
	ASL $F5			  ; 06 F5 | Arithmetic shift left (zero page)
	PEA #$F418		   ; F4 18 F4 | Push effective address to stack
	ASL $24F3,X		  ; 1E F3 24 | Arithmetic shift left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	SBC ($2F),Y		  ; F1 2F | Subtract with carry ((zero page),Y)
	BEQ $35			  ; F0 35 | Branch if equal
	INC $ED3B			; EE 3B ED | Increment (absolute)
	EOR ($EB,X)		  ; 41 EB | Exclusive OR with accumulator ((zero page,X))
	SBC #$4D			 ; E9 4D | Subtract with carry (immediate)
	SBC $58			  ; E5 58 | Subtract with carry (zero page)
	LSR $63E0,X		  ; 5E E0 63 | Logical shift right (absolute,X)
	DEC $DB69,X		  ; DE 69 DB | Decrement (absolute,X)
	ROR $73D8			; 6E D8 73 | Rotate right (absolute)
	ADC $7ED3,Y		  ; 79 D3 7E | Add with carry (absolute,Y)
	CPY $C988			; CC 88 C9 | Compare Y register (absolute)
	STA $92C5			; 8D C5 92 | Update graphics data
	CMP ($97,X)		  ; C1 97 | Compare accumulator ((zero page,X))
	LDX $BA9C,Y		  ; BE 9C BA | Load from absolute,Y into X register
	LDY #$B6			 ; A0 B6 | Load immediate value into Y register
	LDA $B2			  ; A5 B2 | Read graphics status
	LDA #$F6			 ; A9 F6 | Read graphics status
	ASL $F6			  ; 06 F6 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $24F4,X		  ; 1E F4 24 | Arithmetic shift left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	BMI $F0			  ; 30 F0 | Branch if negative
	INC $EC41			; EE 41 EC | Increment (absolute)
	NOP				  ; EA | No operation
	EOR $53E8			; 4D E8 53 | Exclusive OR with accumulator (absolute)
	INC $58			  ; E6 58 | Increment (zero page)
	CPX $5E			  ; E4 5E | Compare X register (zero page)
	SBC ($64,X)		  ; E1 64 | Subtract with carry ((zero page,X))
	ADC #$DC			 ; 69 DC | Add with carry (immediate)
	CMP $D674,Y		  ; D9 74 D6 | Compare accumulator (absolute,Y)
	ADC $7ED3,Y		  ; 79 D3 7E | Add with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2A8
; Address: $CDD1D9
; Size: 101 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2A8:
	BNE $84			  ; D0 84 | Branch if not equal
	CMP $C989			; CD 89 C9 | Compare accumulator (absolute)
	STX $93C6			; 8E C6 93 | Store X register to absolute address
	REP #$97			 ; C2 97 | Reset processor status bits
	LDX $BB9C,Y		  ; BE 9C BB | Load from absolute,Y into X register
	LDA ($B7,X)		  ; A1 B7 | Read graphics status
	LDA $B2			  ; A5 B2 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	ASL $F7			  ; 06 F7 | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $24F5,X		  ; 1E F5 24 | Arithmetic shift left (absolute,X)
	PEA #$F32A		   ; F4 2A F3 | Push effective address to stack
	BMI $F1			  ; 30 F1 | Branch if negative
	BEQ $3C			  ; F0 3C | Branch if equal
	WDM #$ED			 ; 42 ED | Reserved instruction
	XBA				  ; EB | Exchange accumulator bytes
	EOR $53E9			; 4D E9 53 | Exclusive OR with accumulator (absolute)
	EOR $5EE5,Y		  ; 59 E5 5E | Exclusive OR with accumulator (absolute,Y)
	SEP #$64			 ; E2 64 | Set processor status bits
	CPX #$6A			 ; E0 6A | Compare X register (immediate)
	CMP $DA6F,X		  ; DD 6F DA | Compare accumulator (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	CMP ($84),Y		  ; D1 84 | Compare accumulator ((zero page),Y)
	DEC $CA89			; CE 89 CA | Decrement (absolute)
	STX $93C7			; 8E C7 93 | Store X register to absolute address
	TYA				  ; 98 | Transfer Y register to accumulator
	LDA				  ; BF 9D BB A1 | Read graphics status
	LDX $B3			  ; A6 B3 | Load from zero page into X register
	PLB				  ; AB | Pull data bank register from stack
	SED				  ; F8 | Set decimal mode flag
	SED				  ; F8 | Set decimal mode flag
	ASL $F8			  ; 06 F8 | Arithmetic shift left (zero page)
	SED				  ; F8 | Set decimal mode flag
	CLC				  ; 18 | Clear carry flag
	ASL $24F6,X		  ; 1E F6 24 | Arithmetic shift left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	PEA #$F230		   ; F4 30 F2 | Push effective address to stack
	SBC ($3C),Y		  ; F1 3C | Subtract with carry ((zero page),Y)
	WDM #$EE			 ; 42 EE | Reserved instruction
	PHA				  ; 48 | Push accumulator to stack
	CPX $EA4E			; EC 4E EA | Compare X register (absolute)
	INX				  ; E8 | Increment X register
	EOR $5FE6,Y		  ; 59 E6 5F | Exclusive OR with accumulator (absolute,Y)
	STZ $E1			  ; 64 E1 | Store zero to zero page
	ROR				  ; 6A | Rotate right (accumulator)
	DEC $DB6F,X		  ; DE 6F DB | Decrement (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	PLY				  ; 7A | Pull Y register from stack
	BRA $D2			  ; 80 D2 | Branch always
	STA $CF			  ; 85 CF | Update graphics data

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2A9
; Address: $CDD25C
; Size: 88 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2A9:
	TXA				  ; 8A | Transfer X register to accumulator
	STA $C494C7		  ; 8F C7 94 C4 | Update graphics data
	STA $9DC0,Y		  ; 99 C0 9D | Update graphics data
	LDY $B8A2,X		  ; BC A2 B8 | Load from absolute,X into Y register
	PLB				  ; AB | Pull data bank register from stack
	SBC $F900,Y		  ; F9 00 F9 | Subtract with carry (absolute,Y)
	ASL $F9			  ; 06 F9 | Arithmetic shift left (zero page)
	SBC $F812,Y		  ; F9 12 F8 | Subtract with carry (absolute,Y)
	CLC				  ; 18 | Clear carry flag
	SED				  ; F8 | Set decimal mode flag
	ASL $24F7,X		  ; 1E F7 24 | Arithmetic shift left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	BMI $F3			  ; 30 F3 | Branch if negative
	BEQ $42			  ; F0 42 | Hardware register operation
	PHA				  ; 48 | Push accumulator to stack
	SBC $EB4E			; ED 4E EB | Subtract with carry (absolute)
	SBC #$59			 ; E9 59 | Subtract with carry (immediate)
	INC $5F			  ; E6 5F | Increment (zero page)
	CPX $65			  ; E4 65 | Compare X register (zero page)
	SBC ($6A,X)		  ; E1 6A | Subtract with carry ((zero page,X))
	BVS $DC			  ; 70 DC | Branch if overflow set
	CMP $D67B,Y		  ; D9 7B D6 | Compare accumulator (absolute,Y)
	BRA $D3			  ; 80 D3 | Branch always
	STA $CF			  ; 85 CF | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	CPY $C88F			; CC 8F C8 | Compare Y register (absolute)
	CMP $99			  ; C5 99 | Compare accumulator (zero page)
	CMP ($9E,X)		  ; C1 9E | Compare accumulator ((zero page,X))
	LDA $B9A3,X		  ; BD A3 B9 | Read graphics status
	LDY $00FA			; AC FA 00 | Load from absolute address into Y register
	PLX				  ; FA | Pull X register from stack
	ASL $FA			  ; 06 FA | Arithmetic shift left (zero page)
	PLX				  ; FA | Pull X register from stack
	SBC $F918,Y		  ; F9 18 F9 | Subtract with carry (absolute,Y)
	ASL $24F8,X		  ; 1E F8 24 | Arithmetic shift left (absolute,X)
	ROL				  ; 2A | Rotate left (accumulator)
	BMI $F4			  ; 30 F4 | Branch if negative
	SBC ($42),Y		  ; F1 42 | Hardware register operation
	BEQ $48			  ; F0 48 | Branch if equal
	INC $EC4E			; EE 4E EC | Increment (absolute)
	NOP				  ; EA | No operation
	PHY				  ; 5A | Push Y register to stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2AA
; Address: $CDD2CD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2AA:
	SBC $65			  ; E5 65 | Subtract with carry (zero page)
	SEP #$6B			 ; E2 6B | Set processor status bits
	CPX #$70			 ; E0 70 | Compare X register (immediate)
	CMP $DA76,X		  ; DD 76 DA | Compare accumulator (absolute,X)
	STA ($D4,X)		  ; 81 D4 | Update graphics data
	STX $D0			  ; 86 D0 | Store X register to zero page
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2AB
; Address: $CDD2DD
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2AB:
	CMP $C990			; CD 90 C9 | Compare accumulator (absolute)
	CMP $9A			  ; C5 9A | Compare accumulator (zero page)
	REP #$9F			 ; C2 9F | Reset processor status bits
	LDX $B9A3,Y		  ; BE A3 B9 | Load from absolute,Y into X register
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00FB			; AD FB 00 | Read graphics status
	ASL $FB			  ; 06 FB | Arithmetic shift left (zero page)
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	PLX				  ; FA | Pull X register from stack
	ASL $24F9,X		  ; 1E F9 24 | Arithmetic shift left (absolute,X)
	SED				  ; F8 | Set decimal mode flag
	AND ($F5),Y		  ; 31 F5 | Logical AND with accumulator ((zero page),Y)
	PEA #$F23D		   ; F4 3D F2 | Push effective address to stack
	SBC ($49),Y		  ; F1 49 | Subtract with carry ((zero page),Y)
	SBC $EB54			; ED 54 EB | Subtract with carry (absolute)
	PHY				  ; 5A | Push Y register to stack
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2AD
; Address: $CDD311
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2AD:
	SBC ($71,X)		  ; E1 71 | Subtract with carry ((zero page,X))
	DEC $DB76,X		  ; DE 76 DB | Decrement (absolute,X)
	CLD				  ; D8 | Clear decimal mode flag
	STA ($D4,X)		  ; 81 D4 | Update graphics data
	STX $D1			  ; 86 D1 | Store X register to zero page
	STY $91CE			; 8C CE 91 | Store Y register to absolute address
	DEX				  ; CA | Decrement X register
	DEC $9B			  ; C6 9B | Decrement (zero page)
	REP #$9F			 ; C2 9F | Reset processor status bits
	LDX $BAA4,Y		  ; BE A4 BA | Load from absolute,Y into X register
	LDA #$B6			 ; A9 B6 | Read graphics status
	LDA $00FC			; AD FC 00 | Read graphics status
	ASL $FC			  ; 06 FC | Arithmetic shift left (zero page)
	CLC				  ; 18 | Clear carry flag
	ASL $25FA,X		  ; 1E FA 25 | Arithmetic shift left (absolute,X)
	SBC $F82B,Y		  ; F9 2B F8 | Subtract with carry (absolute,Y)
	AND ($F6),Y		  ; 31 F6 | Logical AND with accumulator ((zero page),Y)
	AND $43F3,X		  ; 3D F3 43 | Logical AND with accumulator (absolute,X)
	EOR #$F0			 ; 49 F0 | Exclusive OR with accumulator (immediate)
	INC $EC55			; EE 55 EC | Increment (absolute)
	SBC #$60			 ; E9 60 | Subtract with carry (immediate)
	ROR $E4			  ; 66 E4 | Rotate right (zero page)
	JMP ($71E1)		  ; 6C E1 71 | Jump to address (absolute indirect)
	CMP $D582,Y		  ; D9 82 D5 | Compare accumulator (absolute,Y)
	STY $91CE			; 8C CE 91 | Store Y register to absolute address
	LDY #$BF			 ; A0 BF | Load immediate value into Y register
	LDA $BB			  ; A5 BB | Read graphics status
	LDA #$B7			 ; A9 B7 | Read graphics status
	LDX $00FD			; AE FD 00 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2AE
; Address: $CDD36D
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2AE:
	SBC $FD06,X		  ; FD 06 FD | Subtract with carry (absolute,X)
	SBC $FC12,X		  ; FD 12 FC | Subtract with carry (absolute,X)
	CLC				  ; 18 | Clear carry flag
	AND $FA			  ; 25 FA | Logical AND with accumulator (zero page)
	SBC $F731,Y		  ; F9 31 F7 | Subtract with carry (absolute,Y)
	AND $43F4,X		  ; 3D F4 43 | Logical AND with accumulator (absolute,X)
	EOR #$F1			 ; 49 F1 | Exclusive OR with accumulator (immediate)
	CPX $EA5B			; EC 5B EA | Compare X register (absolute)
	ADC ($E8,X)		  ; 61 E8 | Add with carry ((zero page,X))
	ROR $E5			  ; 66 E5 | Rotate right (zero page)
	JMP ($72E2)		  ; 6C E2 72 | Jump to address (absolute indirect)
	CPX #$77			 ; E0 77 | Compare X register (immediate)
	CMP $D97D,X		  ; DD 7D D9 | Compare accumulator (absolute,X)
	STA $92CF			; 8D CF 92 | Update graphics data
	CPY $C897			; CC 97 C8 | Compare Y register (absolute)
	STZ $A1C4			; 9C C4 A1 | Store zero to absolute
	CPY #$A5			 ; C0 A5 | Compare Y register (immediate)
	LDY $B7AA,X		  ; BC AA B7 | Load from absolute,X into Y register
	LDA $FE00FE		  ; AF FE 00 FE | Read graphics status
	ASL $FE			  ; 06 FE | Arithmetic shift left (zero page)
	INC $FD12,X		  ; FE 12 FD | Increment (absolute,X)
	CLC				  ; 18 | Clear carry flag
	SBC $FC1F,X		  ; FD 1F FC | Subtract with carry (absolute,X)
	AND $FB			  ; 25 FB | Logical AND with accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	AND ($F8),Y		  ; 31 F8 | Logical AND with accumulator ((zero page),Y)
	AND $44F5,X		  ; 3D F5 44 | Logical AND with accumulator (absolute,X)
	PEA #$F24A		   ; F4 4A F2 | Push effective address to stack
	BEQ $55			  ; F0 55 | Branch if equal
	SBC $EB5B			; ED 5B EB | Subtract with carry (absolute)
	ADC ($E9,X)		  ; 61 E9 | Add with carry ((zero page,X))
	INC $6D			  ; E6 6D | Increment (zero page)
	CPX #$78			 ; E0 78 | Compare X register (immediate)
	CMP $DA7D,X		  ; DD 7D DA | Compare accumulator (absolute,X)
	DEY				  ; 88 | Decrement Y register
	STA $92D0			; 8D D0 92 | Update graphics data
	CPY $C997			; CC 97 C9 | Compare Y register (absolute)
	STZ $A1C5			; 9C C5 A1 | Store zero to absolute
	CMP ($A6,X)		  ; C1 A6 | Compare accumulator ((zero page,X))
	LDY $B8AB,X		  ; BC AB B8 | Load from absolute,X into Y register
	LDA $07000E		  ; AF 0E 00 07 | Read graphics status
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2AF
; Address: $CDD42F
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2AF:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2B0
; Address: $CDD64B
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2B0:
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2B1
; Address: $CDD84F
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2B1:
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2B2
; Address: $CDDA4E
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2B2:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2B3
; Address: $CDDC33
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2B3:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $0500			; 0E 00 05 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0500			; 0E 00 05 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $0500			; 0E 00 05 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $0700			; 0E 00 07 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2B4
; Address: $CDDE0D
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2B4:
	PHP				  ; 08 | Push processor status to stack
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2B5
; Address: $CDDF6B
; Size: 70 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2B5:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2B6
; Address: $CDE056
; Size: 92 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2B6:
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $0500			; 0E 00 05 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $0500			; 0E 00 05 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2B7
; Address: $CDE1F6
; Size: 73 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2B7:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2B8
; Address: $CDE2EB
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2B8:
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2B9
; Address: $CDE3F8
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2B9:
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0500			; 0E 00 05 | Arithmetic shift left (absolute)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0500			; 0E 00 05 | Arithmetic shift left (absolute)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0600			; 0E 00 06 | Arithmetic shift left (absolute)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2BA
; Address: $CDE56D
; Size: 82 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2BA:
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2BB
; Address: $CDE634
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2BB:
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2BC
; Address: $CDE732
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2BC:
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2BD
; Address: $CDE7FA
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2BD:
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $0300			; 0E 00 03 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0300			; 0E 00 03 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2BE
; Address: $CDE90B
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2BE:
	ASL $0500			; 0E 00 05 | Arithmetic shift left (absolute)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0500			; 0E 00 05 | Arithmetic shift left (absolute)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2BF
; Address: $CDEA0D
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2BF:
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2C0
; Address: $CDEAB4
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2C0:
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2C1
; Address: $CDEBB9
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2C1:
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2C2
; Address: $CDEC6B
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2C2:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $0200			; 0E 00 02 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0300			; 0E 00 03 | Arithmetic shift left (absolute)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0300			; 0E 00 03 | Arithmetic shift left (absolute)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0500			; 0E 00 05 | Arithmetic shift left (absolute)
	ORA $0906			; 0D 06 09 | Logical OR with accumulator (absolute)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2C3
; Address: $CDEDBD
; Size: 85 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2C3:
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2C4
; Address: $CDEE5E
; Size: 86 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2C4:
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2C5
; Address: $CDEF6F
; Size: 89 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2C5:
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2C6
; Address: $CDF016
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2C6:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA #$02			 ; 09 02 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ASL $0100			; 0E 00 01 | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $0200			; 0E 00 02 | Arithmetic shift left (absolute)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2C7
; Address: $CDF0CF
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2C7:
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $0300			; 0E 00 03 | Arithmetic shift left (absolute)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $0400			; 0E 00 04 | Arithmetic shift left (absolute)
	ORA $0906			; 0D 06 09 | Logical OR with accumulator (absolute)
	ASL $0500			; 0E 00 05 | Arithmetic shift left (absolute)
	ASL $0906			; 0E 06 09 | Arithmetic shift left (absolute)
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0E			  ; 06 0E | Arithmetic shift left (zero page)
	ASL $0D			  ; 06 0D | Arithmetic shift left (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0E			  ; 05 0E | Logical OR with accumulator (zero page)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2C8
; Address: $CDF1EB
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2C8:
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA #$0B			 ; 09 0B | Logical OR with accumulator (immediate)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$03			 ; 09 03 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2C9
; Address: $CDF273
; Size: 81 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2C9:
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ORA #$04			 ; 09 04 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ASL $0800			; 0E 00 08 | Arithmetic shift left (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0C0A			; 0D 0A 0C | Logical OR with accumulator (absolute)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$0A			 ; 09 0A | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHP				  ; 08 | Push processor status to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$06			 ; 09 06 | Logical OR with accumulator (immediate)
	ORA #$05			 ; 09 05 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2CA
; Address: $CDF36D
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2CA:
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	ORA #$09			 ; 09 09 | Logical OR with accumulator (immediate)
	PHP				  ; 08 | Push processor status to stack
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ORA $0B			  ; 05 0B | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	PHP				  ; 08 | Push processor status to stack
	PHP				  ; 08 | Push processor status to stack
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $08			  ; 05 08 | Logical OR with accumulator (zero page)
	ORA $06			  ; 05 06 | Logical OR with accumulator (zero page)
	ORA $05			  ; 05 05 | Logical OR with accumulator (zero page)
	ORA $07			  ; 05 07 | Logical OR with accumulator (zero page)
	ORA $09			  ; 05 09 | Logical OR with accumulator (zero page)
	ORA $0A			  ; 05 0A | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ASL $0C			  ; 06 0C | Arithmetic shift left (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $08			  ; 06 08 | Arithmetic shift left (zero page)
	ASL $07			  ; 06 07 | Arithmetic shift left (zero page)
	ASL $06			  ; 06 06 | Arithmetic shift left (zero page)
	ASL $04			  ; 06 04 | Arithmetic shift left (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA $0D			  ; 05 0D | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ORA $0C			  ; 05 0C | Logical OR with accumulator (zero page)
	ASL $0B			  ; 06 0B | Arithmetic shift left (zero page)
	ASL $0A			  ; 06 0A | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	ASL $09			  ; 06 09 | Arithmetic shift left (zero page)
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $C1FFFE		  ; AF FE FF C1 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank1A_GraphicsFunction_2CB
; Address: $CDFFFC
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank1A_GraphicsFunction_2CB:
	NOP				  ; EA | No operation
	BRA $FD			  ; 80 FD | Branch always
	RTL				  ; 6B | Return from subroutine long
