;==============================================================================
; Dragon Quest III - Bank $06
; Type: Graphics
; Purpose: Graphics processing and PPU management
; Address Range: $C30000-$C37FFF
; Instructions: 11668
; Bytes: 32768
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

.segment "BANK_06"

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_000
; Address: $C38000
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_000:
	ROL $88			  ; 26 88 | Rotate left (zero page)
	STA ($89,X)		  ; 81 89 | Update graphics data
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 9C A4 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF D9 AE ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 16 B9 ED | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 53 C3 ED | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	EOR #$80			 ; 49 80 | Exclusive OR with accumulator (immediate)
	EOR $5E80,Y		  ; 59 80 5E | Exclusive OR with accumulator (absolute,Y)
	BRA $6B			  ; 80 6B | Branch always
	BRA $70			  ; 80 70 | Branch always
	BRA $7D			  ; 80 7D | Branch always
	BRA $82			  ; 80 82 | Branch always
	BRA $8F			  ; 80 8F | Branch always
	BRA $94			  ; 80 94 | Branch always
	BRA $A6			  ; 80 A6 | Branch always
	JMP $80D7			; 4C D7 80 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $80EB			; 4C EB 80 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $80F7			; 4C F7 80 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_001
; Address: $C38072
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_001:
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $810B			; 4C 0B 81 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8117			; 4C 17 81 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $812B			; 4C 2B 81 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8137			; 4C 37 81 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $814B			; 4C 4B 81 | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 9C A4 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF D9 AE ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 16 B9 ED | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 53 C3 ED | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_002
; Address: $C380E2
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_002:
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_003
; Address: $C3813F
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_003:
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $80A1			; 4C A1 80 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_004
; Address: $C3815F
; Size: 75 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_004:
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 9C A4 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF D9 AE ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 16 B9 ED | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 53 C3 ED | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY $81			  ; A4 81 | Load from zero page into Y register
	STA ($B9,X)		  ; 81 B9 | Update graphics data
	STA ($C6,X)		  ; 81 C6 | Update graphics data
	STA ($CB,X)		  ; 81 CB | Update graphics data
	STA ($D8,X)		  ; 81 D8 | Update graphics data
	STA ($DD,X)		  ; 81 DD | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_005
; Address: $C381AF
; Size: 104 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_005:
	STA ($EA,X)		  ; 81 EA | Update graphics data
	STA ($EF,X)		  ; 81 EF | Update graphics data
	STA ($A6,X)		  ; 81 A6 | Update graphics data
	JMP $8232			; 4C 32 82 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $8246			; 4C 46 82 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8252			; 4C 52 82 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $8266			; 4C 66 82 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8272			; 4C 72 82 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $8286			; 4C 86 82 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8292			; 4C 92 82 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $82A6			; 4C A6 82 | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 9C A4 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_006
; Address: $C3821A
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_006:
	LDA				  ; BF D9 AE ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 16 B9 ED | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 53 C3 ED | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_007
; Address: $C38281
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_007:
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $81FC			; 4C FC 81 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_008
; Address: $C382BA
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_008:
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 90 CD ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF CD D7 ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 0A E2 ED | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_009
; Address: $C382EA
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_009:
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 47 EC ED | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	AND ($83,X)		  ; 21 83 | Logical AND with accumulator ((zero page,X))
	ROL $83			  ; 26 83 | Rotate left (zero page)
	SEC				  ; 38 | Set carry flag
	EOR $83			  ; 45 83 | Exclusive OR with accumulator (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $838D			; 4C 8D 83 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $83A1			; 4C A1 83 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $83AD			; 4C AD 83 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $83C1			; 4C C1 83 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $83CD			; 4C CD 83 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $83E1			; 4C E1 83 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $83ED			; 4C ED 83 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $8401			; 4C 01 84 | Jump to address
	LDA $10			  ; A5 10 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_00A
; Address: $C38359
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_00A:
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 90 CD ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF CD D7 ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 0A E2 ED | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 47 EC ED | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_00B
; Address: $C383C8
; Size: 77 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_00B:
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $8357			; 4C 57 83 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_00C
; Address: $C38415
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_00C:
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_00D
; Address: $C38424
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_00D:
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 90 CD ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF CD D7 ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 0A E2 ED | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 47 EC ED | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	PHY				  ; 5A | Push Y register to stack
	STY $6A			  ; 84 6A | Store Y register to zero page
	STY $6F			  ; 84 6F | Store Y register to zero page
	STY $7C			  ; 84 7C | Store Y register to zero page
	STY $81			  ; 84 81 | Store Y register to zero page
	STY $8E			  ; 84 8E | Store Y register to zero page
	STY $93			  ; 84 93 | Store Y register to zero page
	STY $A0			  ; 84 A0 | Store Y register to zero page
	STY $A5			  ; 84 A5 | Store Y register to zero page
	STY $A6			  ; 84 A6 | Store Y register to zero page
	JMP $84E8			; 4C E8 84 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $84FC			; 4C FC 84 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8508			; 4C 08 85 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $851C			; 4C 1C 85 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8528			; 4C 28 85 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_00E
; Address: $C38498
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_00E:
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $853C			; 4C 3C 85 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8548			; 4C 48 85 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $855C			; 4C 5C 85 | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 90 CD ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF CD D7 ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 0A E2 ED | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 47 EC ED | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_00F
; Address: $C38506
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_00F:
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_010
; Address: $C38564
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_010:
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $84B2			; 4C B2 84 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_011
; Address: $C38570
; Size: 94 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_011:
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 84 F6 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF C1 00 EE | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF FE 0A EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 3B 15 EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	STA $C5			  ; 85 C5 | Update graphics data
	STA $CA			  ; 85 CA | Update graphics data
	STA $D7			  ; 85 D7 | Update graphics data
	STA $DC			  ; 85 DC | Update graphics data
	STA $E9			  ; 85 E9 | Update graphics data
	STA $EE			  ; 85 EE | Update graphics data
	STA $FB			  ; 85 FB | Update graphics data
	STA $00			  ; 85 00 | Update graphics data
	STX $A6			  ; 86 A6 | Store X register to zero page
	JMP $8643			; 4C 43 86 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_012
; Address: $C385D4
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_012:
	JMP $8657			; 4C 57 86 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8663			; 4C 63 86 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $8677			; 4C 77 86 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8683			; 4C 83 86 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $8697			; 4C 97 86 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $86A3			; 4C A3 86 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $86B7			; 4C B7 86 | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 84 F6 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF C1 00 EE | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF FE 0A EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 3B 15 EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_013
; Address: $C38647
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_013:
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_014
; Address: $C386A6
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_014:
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $860D			; 4C 0D 86 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_015
; Address: $C386CB
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_015:
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 84 F6 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF C1 00 EE | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF FE 0A EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 3B 15 EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	BPL $87			  ; 10 87 | Branch if positive

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_017
; Address: $C3871A
; Size: 106 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_017:
	EOR #$87			 ; 49 87 | Exclusive OR with accumulator (immediate)
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $879E			; 4C 9E 87 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $87B2			; 4C B2 87 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $87BE			; 4C BE 87 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $87D2			; 4C D2 87 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $87DE			; 4C DE 87 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $87F2			; 4C F2 87 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $87FE			; 4C FE 87 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $8812			; 4C 12 88 | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 84 F6 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF C1 00 EE | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_018
; Address: $C3878A
; Size: 100 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_018:
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF FE 0A EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 3B 15 EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_019
; Address: $C387EE
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_019:
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $8768			; 4C 68 87 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_01A
; Address: $C38826
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_01A:
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 78 1F EE | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF B5 29 EE | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF F2 33 EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_01B
; Address: $C38859
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_01B:
	LDA				  ; BF 2F 3E EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_01C
; Address: $C3886A
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_01C:
	DEY				  ; 88 | Decrement Y register
	DEY				  ; 88 | Decrement Y register
	BRA $88			  ; 80 88 | Branch always
	STA $9288			; 8D 88 92 | Update graphics data
	DEY				  ; 88 | Decrement Y register
	STA				  ; 9F 88 A4 88 | Update graphics data
	LDA ($88),Y		  ; B1 88 | Read graphics status
	DEY				  ; 88 | Decrement Y register
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $88F9			; 4C F9 88 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $890D			; 4C 0D 89 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8919			; 4C 19 89 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $892D			; 4C 2D 89 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8939			; 4C 39 89 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $894D			; 4C 4D 89 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8959			; 4C 59 89 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_01D
; Address: $C388BF
; Size: 108 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_01D:
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $896D			; 4C 6D 89 | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 78 1F EE | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF B5 29 EE | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF F2 33 EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 2F 3E EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_01E
; Address: $C3892D
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_01E:
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $88C3			; 4C C3 88 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_01F
; Address: $C38981
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_01F:
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_020
; Address: $C38989
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_020:
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 78 1F EE | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF B5 29 EE | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF F2 33 EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 2F 3E EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	DEC $89			  ; C6 89 | Decrement (zero page)
	BIT #$DB			 ; 89 DB | Test bits in accumulator (immediate)
	BIT #$E8			 ; 89 E8 | Test bits in accumulator (immediate)
	BIT #$ED			 ; 89 ED | Test bits in accumulator (immediate)
	BIT #$FA			 ; 89 FA | Test bits in accumulator (immediate)
	BIT #$FF			 ; 89 FF | Test bits in accumulator (immediate)
	BIT #$0C			 ; 89 0C | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	ORA ($8A),Y		  ; 11 8A | Logical OR with accumulator ((zero page),Y)
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8A54			; 4C 54 8A | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $8A68			; 4C 68 8A | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8A74			; 4C 74 8A | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $8A88			; 4C 88 8A | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_021
; Address: $C389FC
; Size: 112 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_021:
	JMP $8A94			; 4C 94 8A | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $8AA8			; 4C A8 8A | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $8AB4			; 4C B4 8A | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $8AC8			; 4C C8 8A | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 78 1F EE | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF B5 29 EE | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF F2 33 EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 2F 3E EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_022
; Address: $C38A6E
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_022:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_023
; Address: $C38ACB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_023:
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $8A1E			; 4C 1E 8A | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_024
; Address: $C38ADC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_024:
	LDX $18			  ; A6 18 | Load from zero page into X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BNE $01			  ; D0 01 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_025
; Address: $C38AE4
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_025:
	INC $E34E,X		  ; FE 4E E3 | Increment (absolute,X)
	LDA $14			  ; A5 14 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $E3C4			; 8D C4 E3 | Update graphics data
	LDA $E376,X		  ; BD 76 E3 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $E3C6			; 8D C6 E3 | Update graphics data
	LDA				  ; BF 0E 6F C1 | Read graphics status
	STA $E3C8			; 8D C8 E3 | Update graphics data
	LDA $E3B4			; AD B4 E3 | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $E5C0			; 8D C0 E5 | Update graphics data
	LDX $18			  ; A6 18 | Load from zero page into X register
	LDA $E3E2			; AD E2 E3 | Read graphics status
	BPL $13			  ; 10 13 | Branch if positive
	LDA $18			  ; A5 18 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $E472			; CD 72 E4 | Compare accumulator (absolute)
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA $E4B2			; AD B2 E4 | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	JMP $8BCA			; 4C CA 8B | Jump to address
	LDA $E3E4			; AD E4 E3 | Read graphics status
	BPL $13			  ; 10 13 | Branch if positive
	LDA $18			  ; A5 18 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $E474			; CD 74 E4 | Compare accumulator (absolute)
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA $E4B4			; AD B4 E4 | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_026
; Address: $C38B36
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_026:
	JMP $8BCA			; 4C CA 8B | Jump to address
	LDA $E3E6			; AD E6 E3 | Read graphics status
	BPL $13			  ; 10 13 | Branch if positive
	LDA $18			  ; A5 18 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $E476			; CD 76 E4 | Compare accumulator (absolute)
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA $E4B6			; AD B6 E4 | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	LDY #$04			 ; A0 04 | Load immediate value into Y register
	JMP $8BCA			; 4C CA 8B | Jump to address
	LDA $E3E8			; AD E8 E3 | Read graphics status
	BPL $13			  ; 10 13 | Branch if positive
	LDA $18			  ; A5 18 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $E478			; CD 78 E4 | Compare accumulator (absolute)
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA $E4B8			; AD B8 E4 | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	LDY #$06			 ; A0 06 | Load immediate value into Y register
	JMP $8BCA			; 4C CA 8B | Jump to address
	LDA $E3EA			; AD EA E3 | Read graphics status
	BPL $13			  ; 10 13 | Branch if positive
	LDA $18			  ; A5 18 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $E47A			; CD 7A E4 | Compare accumulator (absolute)
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA $E4BA			; AD BA E4 | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	LDY #$08			 ; A0 08 | Load immediate value into Y register
	JMP $8BCA			; 4C CA 8B | Jump to address
	LDA $E3EC			; AD EC E3 | Read graphics status
	BPL $13			  ; 10 13 | Branch if positive
	LDA $18			  ; A5 18 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $E47C			; CD 7C E4 | Compare accumulator (absolute)
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA $E4BC			; AD BC E4 | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	LDY #$0A			 ; A0 0A | Load immediate value into Y register
	JMP $8BCA			; 4C CA 8B | Jump to address
	LDA $E3EE			; AD EE E3 | Read graphics status
	BPL $13			  ; 10 13 | Branch if positive
	LDA $18			  ; A5 18 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $E47E			; CD 7E E4 | Compare accumulator (absolute)
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA $E4BE			; AD BE E4 | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	LDY #$0C			 ; A0 0C | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_027
; Address: $C38BAE
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_027:
	JMP $8BCA			; 4C CA 8B | Jump to address
	LDA $E3F0			; AD F0 E3 | Read graphics status
	BPL $13			  ; 10 13 | Branch if positive
	LDA $18			  ; A5 18 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	CMP $E480			; CD 80 E4 | Compare accumulator (absolute)
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA $E4C0			; AD C0 E4 | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	LDY #$0E			 ; A0 0E | Load immediate value into Y register
	JMP $8BCA			; 4C CA 8B | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_028
; Address: $C38BCA
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_028:
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$62			 ; 69 62 | Add with carry (immediate)
	STA $08			  ; 85 08 | Update graphics data
	LDA $E3C4			; AD C4 E3 | Read graphics status
	STA $0A			  ; 85 0A | Update graphics data
	LDA $E3C6			; AD C6 E3 | Read graphics status
	STA $0C			  ; 85 0C | Update graphics data
	LDA $E3C8			; AD C8 E3 | Read graphics status
	STA $04			  ; 85 04 | Update graphics data
	LDA $E412,Y		  ; B9 12 E4 | Read graphics status
	STA $00			  ; 85 00 | Update graphics data
	LDA $E422,Y		  ; B9 22 E4 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_029
; Address: $C38BF1
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_029:
	JSR $A703			; 20 03 A7 | Jump to subroutine
	LDA $E402,Y		  ; B9 02 E4 | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8C33			; 4C 33 8C | Jump to address
	LDA $E5B8			; AD B8 E5 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $26			  ; 85 26 | Update graphics data
	LDA $E5BA			; AD BA E5 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	STA $28			  ; 85 28 | Update graphics data
	LDA $0A			  ; A5 0A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC $E432,Y		  ; 79 32 E4 | Add with carry (absolute,Y)
	STA $0A			  ; 85 0A | Update graphics data
	LDA $0C			  ; A5 0C | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_02A
; Address: $C38C1B
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_02A:
	SEC				  ; 38 | Set carry flag
	SBC $E452,Y		  ; F9 52 E4 | Subtract with carry (absolute,Y)
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	STA $E3D0			; 8D D0 E3 | Update graphics data
	LDA $E5C0			; AD C0 E5 | Read graphics status
	STA $24			  ; 85 24 | Update graphics data
	LDA $E3F2,Y		  ; B9 F2 E3 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PHY				  ; 5A | Push Y register to stack
	TAY				  ; A8 | Transfer accumulator to Y register
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_02B
; Address: $C38C33
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_02B:
	LDA $0A			  ; A5 0A | Read graphics status
	CMP $E432,Y		  ; D9 32 E4 | Compare accumulator (absolute,Y)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8C7D			; 4C 7D 8C | Jump to address
	LDA $E4D2,Y		  ; B9 D2 E4 | Read graphics status
	STA $E3D6			; 8D D6 E3 | Update graphics data
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $05			  ; D0 05 | Branch if not equal
	STA $E3D6			; 8D D6 E3 | Update graphics data
	LDA $E502,Y		  ; B9 02 E5 | Read graphics status
	STA $E3DA			; 8D DA E3 | Update graphics data
	LDA $E522,Y		  ; B9 22 E5 | Read graphics status
	STA $E3DE			; 8D DE E3 | Update graphics data
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $06			  ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_02C
; Address: $C38C5E
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_02C:
	JSR $A78C			; 20 8C A7 | Jump to subroutine
	STA $E3DE			; 8D DE E3 | Update graphics data
	LDA $E432,Y		  ; B9 32 E4 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $0A			  ; E5 0A | Subtract with carry (zero page)
	CMP #$21			 ; C9 21 | PPU graphics register access
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8D7D			; 4C 7D 8D | Jump to address
	AND $1E			  ; 25 1E | Logical AND with accumulator (zero page)
	CLC				  ; 18 | Clear carry flag
	ADC $E432,Y		  ; 79 32 E4 | Add with carry (absolute,Y)
	STA $0A			  ; 85 0A | Update graphics data
	JMP $8CF8			; 4C F8 8C | Jump to address
	LDA $E442,Y		  ; B9 42 E4 | Read graphics status
	CMP $0A			  ; C5 0A | Compare accumulator (zero page)
	BCC $2B			  ; 90 2B | Branch if carry clear
	LDA $E4E2,Y		  ; B9 E2 E4 | Read graphics status
	STA $E3D6			; 8D D6 E3 | Update graphics data
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $06			  ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_02D
; Address: $C38C8F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_02D:
	JSR $A7A2			; 20 A2 A7 | Jump to subroutine
	STA $E3D6			; 8D D6 E3 | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_02E
; Address: $C38C98
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_02E:
	STA $E3DA			; 8D DA E3 | Update graphics data
	LDA $E532,Y		  ; B9 32 E5 | Read graphics status
	STA $E3DE			; 8D DE E3 | Update graphics data
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $06			  ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_02F
; Address: $C38CA6
; Size: 46 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_02F:
	JSR $A7AC			; 20 AC A7 | Jump to subroutine
	STA $E3DE			; 8D DE E3 | Update graphics data
	JMP $8CF8			; 4C F8 8C | Jump to address
	LDA $E4F2,Y		  ; B9 F2 E4 | Read graphics status
	STA $E3D6			; 8D D6 E3 | Update graphics data
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $0D			  ; D0 0D | Branch if not equal
	PHY				  ; 5A | Push Y register to stack
	LDA $E5B4			; AD B4 E5 | Read graphics status
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $E3D6			; 8D D6 E3 | Update graphics data
	PLY				  ; 7A | Pull Y register from stack
	LDA $E512,Y		  ; B9 12 E5 | Read graphics status
	STA $E3DA			; 8D DA E3 | Update graphics data
	LDA $E542,Y		  ; B9 42 E5 | Read graphics status
	STA $E3DE			; 8D DE E3 | Update graphics data
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $06			  ; D0 06 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_030
; Address: $C38CD8
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_030:
	JSR $A776			; 20 76 A7 | Jump to subroutine
	STA $E3DE			; 8D DE E3 | Update graphics data
	LDA $0A			  ; A5 0A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E442,Y		  ; F9 42 E4 | Subtract with carry (absolute,Y)
	CMP #$21			 ; C9 21 | PPU graphics register access
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $8D7D			; 4C 7D 8D | Jump to address
	AND $1E			  ; 25 1E | Logical AND with accumulator (zero page)
	PHA				  ; 48 | Push accumulator to stack
	LDA $E442,Y		  ; B9 42 E4 | Read graphics status
	SEC				  ; 38 | Set carry flag
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PLA				  ; 68 | Pull accumulator from stack
	STZ $E3CA			; 9C CA E3 | Store zero to absolute
	STZ $E3CC			; 9C CC E3 | Store zero to absolute
	STZ $E3CE			; 9C CE E3 | Store zero to absolute
	LDA $E5C0			; AD C0 E5 | Read graphics status
	STA $20			  ; 85 20 | Update graphics data
	LDA $0C			  ; A5 0C | Read graphics status
	CMP $E452,Y		  ; D9 52 E4 | Compare accumulator (absolute,Y)
	BCC $14			  ; 90 14 | Branch if carry clear
	CMP $E462,Y		  ; D9 62 E4 | Compare accumulator (absolute,Y)
	BEQ $37			  ; F0 37 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_031
; Address: $C38D12
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_031:
	BCC $35			  ; 90 35 | Branch if carry clear
	LDA $0C			  ; A5 0C | Read graphics status
	STA $E3D4			; 8D D4 E3 | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	STA $E3CE			; 8D CE E3 | Update graphics data
	JMP $8D74			; 4C 74 8D | Jump to address
	LDA $0C			  ; A5 0C | Read graphics status
	STA $E3D0			; 8D D0 E3 | Update graphics data
	LDA $E452,Y		  ; B9 52 E4 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $0C			  ; E5 0C | Subtract with carry (zero page)
	STA $E3CA			; 8D CA E3 | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E3CA			; ED CA E3 | Subtract with carry (absolute)
	BCS $08			  ; B0 08 | Branch if carry set
	LDA $20			  ; A5 20 | Read graphics status
	STA $E3CA			; 8D CA E3 | Update graphics data
	JMP $8D74			; 4C 74 8D | Jump to address
	STA $20			  ; 85 20 | Update graphics data
	LDA $0C			  ; A5 0C | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $E3CA			; 6D CA E3 | Add with carry (absolute)
	STA $0C			  ; 85 0C | Update graphics data
	LDA $0C			  ; A5 0C | Read graphics status
	STA $E3D2			; 8D D2 E3 | Update graphics data
	LDA $E462,Y		  ; B9 62 E4 | Read graphics status
	INC				  ; 1A | Increment accumulator
	SEC				  ; 38 | Set carry flag
	SBC $0C			  ; E5 0C | Subtract with carry (zero page)
	STA $E3CC			; 8D CC E3 | Update graphics data
	LDA $20			  ; A5 20 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E3CC			; ED CC E3 | Subtract with carry (absolute)
	BCS $08			  ; B0 08 | Branch if carry set
	LDA $20			  ; A5 20 | Read graphics status
	STA $E3CC			; 8D CC E3 | Update graphics data
	JMP $8D74			; 4C 74 8D | Jump to address
	STA $20			  ; 85 20 | Update graphics data
	LDA $0C			  ; A5 0C | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $E3CC			; 6D CC E3 | Add with carry (absolute)
	STA $0C			  ; 85 0C | Update graphics data
	BRA $A0			  ; 80 A0 | Branch always
	LDA $E3F2,Y		  ; B9 F2 E3 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	PHY				  ; 5A | Push Y register to stack
	AND ($A8),Y		  ; 31 A8 | Logical AND with accumulator ((zero page),Y)
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_032
; Address: $C38D7E
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_032:
	PHY				  ; 5A | Push Y register to stack
	LDA $E3C6			; AD C6 E3 | Read graphics status
	STA $0C			  ; 85 0C | Update graphics data
	LDA $0A			  ; A5 0A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	BCC $02			  ; 90 02 | Branch if carry clear
	INC $02			  ; E6 02 | Increment (zero page)
	LDA $E5B4			; AD B4 E5 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $0E			  ; 85 0E | Update graphics data
	LDA $E452,Y		  ; B9 52 E4 | Read graphics status
	STA $E5C4			; 8D C4 E5 | Update graphics data
	LDA $E3CA			; AD CA E3 | Read graphics status
	BEQ $08			  ; F0 08 | Branch if equal
	STA $24			  ; 85 24 | Update graphics data
	LDA $E3D6			; AD D6 E3 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_033
; Address: $C38DA9
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_033:
	JSR $8E04			; 20 04 8E | Jump to subroutine
	LDA $E3CC			; AD CC E3 | Read graphics status
	BEQ $44			  ; F0 44 | Branch if equal
	STA $24			  ; 85 24 | Update graphics data
	LDA $E3DA			; AD DA E3 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_034
; Address: $C38DBB
; Size: 50 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_034:
	JSR $8E04			; 20 04 8E | Jump to subroutine
	BRA $35			  ; 80 35 | Branch always
	LDA $E3D2			; AD D2 E3 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E5C4			; ED C4 E5 | Subtract with carry (absolute)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $00			  ; A5 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	WDM #$00			 ; 42 00 | Reserved instruction
	STA $00			  ; 85 00 | Update graphics data
	INC $04			  ; E6 04 | Increment (zero page)
	INC $04			  ; E6 04 | Increment (zero page)
	LDA $00			  ; A5 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	BCC $02			  ; 90 02 | Branch if carry clear
	INC $02			  ; E6 02 | Increment (zero page)
	DEC $24			  ; C6 24 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_035
; Address: $C38DF3
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_035:
	BNE $E9			  ; D0 E9 | Branch if not equal
	LDA $E3CE			; AD CE E3 | Read graphics status
	BEQ $08			  ; F0 08 | Branch if equal
	STA $24			  ; 85 24 | Update graphics data
	LDA $E3DE			; AD DE E3 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_036
; Address: $C38DFF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_036:
	JSR $8E04			; 20 04 8E | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_037
; Address: $C38E06
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_037:
	INC $04			  ; E6 04 | Increment (zero page)
	INC $04			  ; E6 04 | Increment (zero page)
	DEC $24			  ; C6 24 | Decrement (zero page)
	BNE $F6			  ; D0 F6 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_038
; Address: $C38E0F
; Size: 63 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_038:
	LDA $E3C6			; AD C6 E3 | Read graphics status
	STA $0C			  ; 85 0C | Update graphics data
	LDA $0A			  ; A5 0A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	BCC $02			  ; 90 02 | Branch if carry clear
	INC $02			  ; E6 02 | Increment (zero page)
	LDA $E5B4			; AD B4 E5 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $0E			  ; 85 0E | Update graphics data
	LDA $E452,Y		  ; B9 52 E4 | Read graphics status
	STA $E5C4			; 8D C4 E5 | Update graphics data
	LDA $0A			  ; A5 0A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $937B			; 4C 7B 93 | Jump to address
	LDA $E3CA			; AD CA E3 | Read graphics status
	BEQ $10			  ; F0 10 | Branch if equal
	STA $24			  ; 85 24 | Update graphics data
	LDA $E3D0			; AD D0 E3 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E5C4			; ED C4 E5 | Subtract with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $E3D6			; AD D6 E3 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_039
; Address: $C38E4E
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_039:
	JSR $9351			; 20 51 93 | Jump to subroutine
	LDA $E3CC			; AD CC E3 | Read graphics status
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $8ED3			; 4C D3 8E | Jump to address
	STA $24			  ; 85 24 | Update graphics data
	LDA $E3D2			; AD D2 E3 | Read graphics status
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_03A
; Address: $C38E5F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_03A:
	SBC $E5C4			; ED C4 E5 | Subtract with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $E3DA			; AD DA E3 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	LDA $E3DA			; AD DA E3 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_03B
; Address: $C38E6E
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_03B:
	JSR $9351			; 20 51 93 | Jump to subroutine
	JMP $8ED3			; 4C D3 8E | Jump to address
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $00			  ; A5 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	WDM #$00			 ; 42 00 | Reserved instruction
	STA $00			  ; 85 00 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $28			  ; 90 28 | Branch if carry clear
	LDA $24			  ; A5 24 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF E9 8E C1 | Read graphics status
	STA $001D9A		  ; 8F 9A 1D 00 | Update graphics data
	LDA #$C1			 ; A9 C1 | Read graphics status
	STA $001D9C		  ; 8F 9C 1D 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_03C
; Address: $C38EA6
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_03C:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDX $04			  ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_03D
; Address: $C38EB4
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_03D:
	JSR $A80A			; 20 0A A8 | Jump to subroutine
	BRA $18			  ; 80 18 | Branch always
	LDA $24			  ; A5 24 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 2D 8F C1 | Read graphics status
	STA $001D9A		  ; 8F 9A 1D 00 | Update graphics data
	LDA #$C1			 ; A9 C1 | Read graphics status
	STA $001D9C		  ; 8F 9C 1D 00 | Update graphics data
	LDX $04			  ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_03E
; Address: $C38ECE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_03E:
	JSR $A80A			; 20 0A A8 | Jump to subroutine
	STX $04			  ; 86 04 | Store X register to zero page
	LDA $E3CE			; AD CE E3 | Read graphics status
	BEQ $10			  ; F0 10 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_03F
; Address: $C38ED8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_03F:
	STA $24			  ; 85 24 | Update graphics data
	LDA $E3D4			; AD D4 E3 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E5C4			; ED C4 E5 | Subtract with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $E3DE			; AD DE E3 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_041
; Address: $C38EE9
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_041:
	BVC $93			  ; 50 93 | Branch if overflow clear
	EOR ($91),Y		  ; 51 91 | Exclusive OR with accumulator ((zero page),Y)
	STA ($14),Y		  ; 91 14 | Update graphics data
	STA ($F6),Y		  ; 91 F6 | Update graphics data
	BCC $D8			  ; 90 D8 | Branch if carry clear
	CMP $BA90,Y		  ; D9 90 BA | Compare accumulator (absolute,Y)
	BCC $9C			  ; 90 9C | Branch if carry clear
	STA $7E90,X		  ; 9D 90 7E | Update graphics data
	BCC $60			  ; 90 60 | Branch if carry clear
	ADC ($90,X)		  ; 61 90 | Add with carry ((zero page,X))
	WDM #$92			 ; 42 92 | Reserved instruction
	BCC $24			  ; 90 24 | Branch if carry clear
	AND $90			  ; 25 90 | Logical AND with accumulator (zero page)
	ASL $92			  ; 06 92 | Arithmetic shift left (zero page)
	BCC $E8			  ; 90 E8 | Branch if carry clear
	STA ($E9),Y		  ; 91 E9 | Update graphics data
	STA $CB91CA		  ; 8F CA 91 CB | Update graphics data
	STA $AD91AC		  ; 8F AC 91 AD | Update graphics data
	STA $8F918E		  ; 8F 8E 91 8F | Update graphics data
	STA $719170		  ; 8F 70 91 71 | Update graphics data
	STA $3A9159		  ; 8F 59 91 3A | Update graphics data
	STA ($1C),Y		  ; 91 1C | Update graphics data
	ORA $FE91,X		  ; 1D 91 FE | Logical OR with accumulator (absolute,X)
	BCC $E0			  ; 90 E0 | Game work RAM access
	SBC ($90,X)		  ; E1 90 | Subtract with carry ((zero page,X))
	REP #$92			 ; C2 92 | Reset processor status bits
	BCC $A4			  ; 90 A4 | Branch if carry clear
	LDA $90			  ; A5 90 | Read graphics status
	STX $92			  ; 86 92 | Store X register to zero page
	BCC $68			  ; 90 68 | Branch if carry clear
	ADC #$90			 ; 69 90 | Add with carry (immediate)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $2C			  ; 90 2C | Branch if carry clear
	AND $0E90			; 2D 90 0E | Logical AND with accumulator (absolute)
	BCC $F0			  ; 90 F0 | Branch if carry clear
	STA ($F1),Y		  ; 91 F1 | Update graphics data
	STA $D391D2		  ; 8F D2 91 D3 | Update graphics data
	STA $B591B4		  ; 8F B4 91 B5 | Update graphics data
	STA $979196		  ; 8F 96 91 97 | Update graphics data
	STA $799178		  ; 8F 78 91 79 | Update graphics data
	STA $B9915A		  ; 8F 5A 91 B9 | Update graphics data
	STX $D0			  ; 86 D0 | Store X register to zero page

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_042
; Address: $C38F74
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_042:
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_043
; Address: $C38F7B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_043:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_044
; Address: $C38F99
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_044:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_045
; Address: $C38FB7
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_045:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_046
; Address: $C38FD5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_046:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_047
; Address: $C38FDF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_047:
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_048
; Address: $C38FF3
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_048:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_049
; Address: $C39011
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_049:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_04A
; Address: $C3902F
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_04A:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_04C
; Address: $C3904D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_04C:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_04D
; Address: $C3906B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_04D:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_04E
; Address: $C39089
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_04E:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_04F
; Address: $C390A7
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_04F:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_050
; Address: $C390B6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_050:
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_051
; Address: $C390C5
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_051:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_052
; Address: $C390E3
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_052:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_053
; Address: $C39101
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_053:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_055
; Address: $C39123
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_055:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_056
; Address: $C3913D
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_056:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_057
; Address: $C3915C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_057:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_058
; Address: $C3917A
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_058:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_059
; Address: $C3918C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_059:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_05A
; Address: $C39198
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_05A:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_05B
; Address: $C391B6
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_05B:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_05C
; Address: $C391D4
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_05C:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_05E
; Address: $C391F7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_05E:
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_05F
; Address: $C39210
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_05F:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_060
; Address: $C3922E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_060:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_061
; Address: $C3924C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_061:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_062
; Address: $C39260
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_062:
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_063
; Address: $C3926A
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_063:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_064
; Address: $C39288
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_064:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_065
; Address: $C392A6
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_065:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_066
; Address: $C392C4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_066:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_067
; Address: $C392CC
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_067:
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_068
; Address: $C392E2
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_068:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_069
; Address: $C39300
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_069:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_06A
; Address: $C3931E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_06A:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_06C
; Address: $C3933C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_06C:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_06D
; Address: $C39351
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_06D:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $10			  ; 85 10 | Update graphics data
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $12			  ; 85 12 | Update graphics data
	LDY $04			  ; A4 04 | Load from zero page into Y register
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $0A			  ; 90 0A | Branch if carry clear
	LDA $24			  ; A5 24 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	BIT #$7C			 ; 89 7C | Test bits in accumulator (immediate)
	STY $04			  ; 84 04 | Store Y register to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_06E
; Address: $C39371
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_06E:
	LDA $24			  ; A5 24 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	CMP $847C			; CD 7C 84 | Compare accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_06F
; Address: $C3937B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_06F:
	LDA $E3CA			; AD CA E3 | Read graphics status
	BEQ $10			  ; F0 10 | Branch if equal
	STA $24			  ; 85 24 | Update graphics data
	LDA $E3D0			; AD D0 E3 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E5C4			; ED C4 E5 | Subtract with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $E3D6			; AD D6 E3 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_070
; Address: $C3938D
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_070:
	JSR $9890			; 20 90 98 | Jump to subroutine
	LDA $E3CC			; AD CC E3 | Read graphics status
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $9412			; 4C 12 94 | Jump to address
	STA $24			  ; 85 24 | Update graphics data
	LDA $E3D2			; AD D2 E3 | Read graphics status
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_071
; Address: $C3939E
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_071:
	SBC $E5C4			; ED C4 E5 | Subtract with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $E3DA			; AD DA E3 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	LDA $E3DA			; AD DA E3 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_072
; Address: $C393AD
; Size: 51 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_072:
	JSR $9890			; 20 90 98 | Jump to subroutine
	JMP $9412			; 4C 12 94 | Jump to address
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $00			  ; A5 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	WDM #$00			 ; 42 00 | Reserved instruction
	STA $00			  ; 85 00 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $28			  ; 90 28 | Branch if carry clear
	LDA $24			  ; A5 24 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 28 94 C1 | Read graphics status
	STA $001D9A		  ; 8F 9A 1D 00 | Update graphics data
	LDA #$C1			 ; A9 C1 | Read graphics status
	STA $001D9C		  ; 8F 9C 1D 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_073
; Address: $C393E5
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_073:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDX $04			  ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_074
; Address: $C393F3
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_074:
	JSR $A80A			; 20 0A A8 | Jump to subroutine
	BRA $18			  ; 80 18 | Branch always
	LDA $24			  ; A5 24 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 6C 94 C1 | Read graphics status
	STA $001D9A		  ; 8F 9A 1D 00 | Update graphics data
	LDA #$C1			 ; A9 C1 | Read graphics status
	STA $001D9C		  ; 8F 9C 1D 00 | Update graphics data
	LDX $04			  ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_075
; Address: $C3940D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_075:
	JSR $A80A			; 20 0A A8 | Jump to subroutine
	STX $04			  ; 86 04 | Store X register to zero page
	LDA $E3CE			; AD CE E3 | Read graphics status
	BEQ $10			  ; F0 10 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_076
; Address: $C39417
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_076:
	STA $24			  ; 85 24 | Update graphics data
	LDA $E3D4			; AD D4 E3 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E5C4			; ED C4 E5 | Subtract with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $E3DE			; AD DE E3 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_078
; Address: $C39428
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_078:
	STA $969098		  ; 8F 98 90 96 | Update graphics data
	ADC ($98),Y		  ; 71 98 | Add with carry ((zero page),Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	SBC $FA97,Y		  ; F9 97 FA | Subtract with carry (absolute,Y)
	LDA $BE97,X		  ; BD 97 BE | Read graphics status
	STA				  ; 9F 97 A0 95 | Update graphics data
	STA ($97,X)		  ; 81 97 | Update graphics data
	STZ $95			  ; 64 95 | Store zero to zero page
	EOR $97			  ; 45 97 | Exclusive OR with accumulator (zero page)
	LSR $95			  ; 46 95 | Logical shift right (zero page)
	PLP				  ; 28 | Pull processor status from stack
	ORA #$97			 ; 09 97 | Logical OR with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	XBA				  ; EB | Exchange accumulator bytes
	CPX $CD94			; EC 94 CD | Compare X register (absolute)
	DEC $AF94			; CE 94 AF | Decrement (absolute)
	BCS $94			  ; B0 94 | Branch if carry set
	TYA				  ; 98 | Transfer Y register to accumulator
	ADC $7A98,Y		  ; 79 98 7A | Add with carry (absolute,Y)
	TYA				  ; 98 | Transfer Y register to accumulator
	JMP $983D96		  ; 5C 96 3D 98 | Jump to address long
	ROL $1F96,X		  ; 3E 96 1F | Rotate left (absolute,X)
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_079
; Address: $C3947C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_079:
	JSR $0196			; 20 96 01 | Jump to subroutine
	TYA				  ; 98 | Transfer Y register to accumulator
	CPX $95			  ; E4 95 | Compare X register (zero page)
	CMP $97			  ; C5 97 | Compare accumulator (zero page)
	DEC $95			  ; C6 95 | Decrement (zero page)
	TAY				  ; A8 | Transfer accumulator to Y register
	BIT #$97			 ; 89 97 | Test bits in accumulator (immediate)
	TXA				  ; 8A | Transfer X register to accumulator
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_07A
; Address: $C39494
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_07A:
	JMP ($4D95)		  ; 6C 95 4D | Jump to address (absolute indirect)
	LSR $2F95			; 4E 95 2F | Logical shift right (absolute)
	BMI $95			  ; 30 95 | Branch if negative
	ORA ($97),Y		  ; 11 97 | Logical OR with accumulator ((zero page),Y)
	PEA #$D594		   ; F4 94 D5 | Push effective address to stack
	CLV				  ; B8 | Clear overflow flag
	STA $B996,Y		  ; 99 96 B9 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_07B
; Address: $C394B1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_07B:
	STX $C8			  ; 86 C8 | Store X register to zero page
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_07C
; Address: $C394BA
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_07C:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_07D
; Address: $C394D8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_07D:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_07E
; Address: $C394F6
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_07E:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_07F
; Address: $C39514
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_07F:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_080
; Address: $C3951C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_080:
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_081
; Address: $C39532
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_081:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_082
; Address: $C39550
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_082:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_083
; Address: $C3956E
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_083:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_085
; Address: $C3958C
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_085:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_086
; Address: $C395AA
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_086:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_087
; Address: $C395C8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_087:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_088
; Address: $C395E6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_088:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_089
; Address: $C395F2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_089:
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_08A
; Address: $C39604
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_08A:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_08B
; Address: $C39622
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_08B:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_08C
; Address: $C39640
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_08C:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_08D
; Address: $C3965E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_08D:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_08E
; Address: $C3967C
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_08E:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_08F
; Address: $C3969B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_08F:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_090
; Address: $C396B9
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_090:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_091
; Address: $C396C8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_091:
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_092
; Address: $C396D7
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_092:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_093
; Address: $C396F5
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_093:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_094
; Address: $C39713
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_094:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_096
; Address: $C39735
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_096:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_097
; Address: $C3974F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_097:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_098
; Address: $C3976D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_098:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_099
; Address: $C3978B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_099:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_09A
; Address: $C3979E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_09A:
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_09B
; Address: $C397A9
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_09B:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_09C
; Address: $C397C7
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_09C:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_09D
; Address: $C397E5
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_09D:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_09E
; Address: $C39803
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_09E:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_09F
; Address: $C39809
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_09F:
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0A0
; Address: $C39821
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0A0:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0A1
; Address: $C3983F
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0A1:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0A2
; Address: $C3985D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0A2:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0A3
; Address: $C39874
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0A3:
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0A4
; Address: $C3987B
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0A4:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $00			  ; A5 00 | Read graphics status
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0A5
; Address: $C39890
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0A5:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $10			  ; 85 10 | Update graphics data
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $12			  ; 85 12 | Update graphics data
	LDY $04			  ; A4 04 | Load from zero page into Y register
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $0A			  ; 90 0A | Branch if carry clear
	LDA $24			  ; A5 24 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	BIT #$7C			 ; 89 7C | Test bits in accumulator (immediate)
	STY $04			  ; 84 04 | Store Y register to zero page
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0A6
; Address: $C398B0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0A6:
	LDA $24			  ; A5 24 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	CMP $847C			; CD 7C 84 | Compare accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0A7
; Address: $C398BA
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0A7:
	LDA $0A			  ; A5 0A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	BCC $02			  ; 90 02 | Branch if carry clear
	INC $02			  ; E6 02 | Increment (zero page)
	LDA $E5B4			; AD B4 E5 | Read graphics status
	STA $0E			  ; 85 0E | Update graphics data
	LDA $28			  ; A5 28 | Read graphics status
	AND #$FE			 ; 29 FE | Logical AND with accumulator (immediate)
	STA $28			  ; 85 28 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0A8
; Address: $C398D6
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0A8:
	LDA $0A			  ; A5 0A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $9956			; 4C 56 99 | Jump to address
	LDA $E3D0			; AD D0 E3 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $2F			  ; 90 2F | Branch if carry clear
	TXA				  ; 8A | Transfer X register to accumulator
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0A9
; Address: $C39904
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0A9:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	INC $04			  ; E6 04 | Increment (zero page)
	INC $04			  ; E6 04 | Increment (zero page)
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $3D			  ; F0 3D | Branch if equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0AA
; Address: $C39933
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0AA:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	INC $04			  ; E6 04 | Increment (zero page)
	INC $04			  ; E6 04 | Increment (zero page)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0AB
; Address: $C39943
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0AB:
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	INC $04			  ; E6 04 | Increment (zero page)
	INC $04			  ; E6 04 | Increment (zero page)
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BNE $C3			  ; D0 C3 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0AC
; Address: $C39956
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0AC:
	LDA $E3D0			; AD D0 E3 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $2F			  ; 90 2F | Branch if carry clear
	TXA				  ; 8A | Transfer X register to accumulator
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0AD
; Address: $C39978
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0AD:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	INC $04			  ; E6 04 | Increment (zero page)
	INC $04			  ; E6 04 | Increment (zero page)
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $3D			  ; F0 3D | Branch if equal
	TXA				  ; 8A | Transfer X register to accumulator
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0AE
; Address: $C399A7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0AE:
	JSL $7FFDA2		  ; 22 A2 FD 7F | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0AF
; Address: $C399B2
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0AF:
	INC $04			  ; E6 04 | Increment (zero page)
	INC $04			  ; E6 04 | Increment (zero page)
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	INC $04			  ; E6 04 | Increment (zero page)
	INC $04			  ; E6 04 | Increment (zero page)
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BNE $C3			  ; D0 C3 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0B0
; Address: $C399CA
; Size: 68 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0B0:
	LDA $E4C2,Y		  ; B9 C2 E4 | Read graphics status
	STA $2A			  ; 85 2A | Update graphics data
	LDA $0A			  ; A5 0A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $00			  ; 65 00 | Add with carry (zero page)
	STA $00			  ; 85 00 | Update graphics data
	BCC $02			  ; 90 02 | Branch if carry clear
	INC $02			  ; E6 02 | Increment (zero page)
	LDA $E5B4			; AD B4 E5 | Read graphics status
	STA $0E			  ; 85 0E | Update graphics data
	LDA $28			  ; A5 28 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $28			  ; 85 28 | Update graphics data
	LDA $0A			  ; A5 0A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	SBC $6099,X		  ; FD 99 60 | Subtract with carry (absolute,X)
	ORA $929A			; 0D 9A 92 | Logical OR with accumulator (absolute)
	STA $9E9C,X		  ; 9D 9C 9E | Update graphics data
	AND ($A0,X)		  ; 21 A0 | Logical AND with accumulator ((zero page,X))
	LDX $A1			  ; A6 A1 | Load from zero page into X register
	BCS $A4			  ; B0 A4 | Branch if carry set
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0B1
; Address: $C39A14
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0B1:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 9C A4 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF 90 CD ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 84 F6 ED | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 78 1F EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	TXS				  ; 9A | Transfer X register to stack pointer
	BIT #$9A			 ; 89 9A | Test bits in accumulator (immediate)
	STX $9B9A			; 8E 9A 9B | Store X register to absolute address
	TXS				  ; 9A | Transfer X register to stack pointer
	LDY #$9A			 ; A0 9A | Load immediate value into Y register
	LDA $B29A			; AD 9A B2 | Read graphics status
	TXS				  ; 9A | Transfer X register to stack pointer
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $9B0A			; 4C 0A 9B | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9B1E			; 4C 1E 9B | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0B2
; Address: $C39A89
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0B2:
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $9B2A			; 4C 2A 9B | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9B3E			; 4C 3E 9B | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $9B4A			; 4C 4A 9B | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9B5E			; 4C 5E 9B | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $9B6A			; 4C 6A 9B | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9B7E			; 4C 7E 9B | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 9C A4 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF 90 CD ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0B3
; Address: $C39AF9
; Size: 99 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0B3:
	LDA				  ; BF 84 F6 ED | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 78 1F EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0B4
; Address: $C39B5C
; Size: 54 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0B4:
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $9ABF			; 4C BF 9A | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0B5
; Address: $C39B92
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0B5:
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0B6
; Address: $C39BBF
; Size: 116 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0B6:
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 9C A4 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF 90 CD ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 84 F6 ED | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 78 1F EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	CPX $FC9B			; EC 9B FC | Compare X register (absolute)
	ORA ($9C,X)		  ; 01 9C | Logical OR with accumulator ((zero page,X))
	ASL $139C			; 0E 9C 13 | Arithmetic shift left (absolute)
	STZ $9C20			; 9C 20 9C | Store zero to absolute
	AND $9C			  ; 25 9C | Logical AND with accumulator (zero page)
	STZ $9C37			; 9C 37 9C | Store zero to absolute
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $9C8F			; 4C 8F 9C | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9CA3			; 4C A3 9C | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $9CAF			; 4C AF 9C | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9CC3			; 4C C3 9C | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $9CCF			; 4C CF 9C | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9CE3			; 4C E3 9C | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $9CEF			; 4C EF 9C | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0B7
; Address: $C39C37
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0B7:
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9D03			; 4C 03 9D | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 9C A4 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF 90 CD ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 84 F6 ED | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 78 1F EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0B8
; Address: $C39CAA
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0B8:
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0B9
; Address: $C39D09
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0B9:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $9C44			; 4C 44 9C | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0BA
; Address: $C39D17
; Size: 95 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0BA:
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF D9 AE ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF CD D7 ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF C1 00 EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF B5 29 EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	ADC ($9D),Y		  ; 71 9D | Add with carry ((zero page),Y)
	STA ($9D,X)		  ; 81 9D | Update graphics data
	STX $9D			  ; 86 9D | Store X register to zero page
	STA $9D98,X		  ; 9D 98 9D | Update graphics data
	LDA $9D			  ; A5 9D | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0BB
; Address: $C39D7B
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0BB:
	TAX				  ; AA | Transfer accumulator to X register
	STA $9DB7,X		  ; 9D B7 9D | Update graphics data
	LDY $A69D,X		  ; BC 9D A6 | Load from absolute,X into Y register
	JMP $9E14			; 4C 14 9E | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9E28			; 4C 28 9E | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $9E34			; 4C 34 9E | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9E48			; 4C 48 9E | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $9E54			; 4C 54 9E | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9E68			; 4C 68 9E | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $9E74			; 4C 74 9E | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9E88			; 4C 88 9E | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0BC
; Address: $C39DE5
; Size: 109 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0BC:
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF D9 AE ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF CD D7 ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF C1 00 EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF B5 29 EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0BD
; Address: $C39E52
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0BD:
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $9DC9			; 4C C9 9D | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0BE
; Address: $C39E9C
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0BE:
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0BF
; Address: $C39EB0
; Size: 122 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0BF:
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF D9 AE ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF CD D7 ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF C1 00 EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF B5 29 EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	STZ $9F06,X		  ; 9E 06 9F | Store zero to absolute,X
	STA				  ; 9F 18 9F 1D | Update graphics data
	STA				  ; 9F 2A 9F 2F | Update graphics data
	STA				  ; 9F 3C 9F 41 | Update graphics data
	STA				  ; 9F A6 04 4C | Update graphics data
	STA $A69F,Y		  ; 99 9F A6 | Update graphics data
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9FAD			; 4C AD 9F | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $9FB9			; 4C B9 9F | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9FCD			; 4C CD 9F | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $9FD9			; 4C D9 9F | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0C0
; Address: $C39F31
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0C0:
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $9FED			; 4C ED 9F | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $9FF9			; 4C F9 9F | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A00D			; 4C 0D A0 | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF D9 AE ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF CD D7 ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF C1 00 EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF B5 29 EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0C1
; Address: $C39FA4
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0C1:
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0C2
; Address: $C3A001
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0C2:
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $9F4E			; 4C 4E 9F | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0C3
; Address: $C3A021
; Size: 80 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0C3:
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 16 B9 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF 0A E2 ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF FE 0A EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF F2 33 EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0C4
; Address: $C3A073
; Size: 98 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0C4:
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$8B			 ; A0 8B | Load immediate value into Y register
	LDY #$90			 ; A0 90 | Load immediate value into Y register
	LDY #$9D			 ; A0 9D | Load immediate value into Y register
	LDY #$A2			 ; A0 A2 | Load immediate value into Y register
	LDY #$AF			 ; A0 AF | Load immediate value into Y register
	LDY #$B4			 ; A0 B4 | Load immediate value into Y register
	LDY #$C1			 ; A0 C1 | Load immediate value into Y register
	LDY #$C6			 ; A0 C6 | Load immediate value into Y register
	LDY #$A6			 ; A0 A6 | Load immediate value into Y register
	JMP $A11E			; 4C 1E A1 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A132			; 4C 32 A1 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $A13E			; 4C 3E A1 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A152			; 4C 52 A1 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $A15E			; 4C 5E A1 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A172			; 4C 72 A1 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $A17E			; 4C 7E A1 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A192			; 4C 92 A1 | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	SEP #$20			 ; E2 20 | Set processor status bits

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0C5
; Address: $C3A0D9
; Size: 113 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0C5:
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 16 B9 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF 0A E2 ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF FE 0A EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF F2 33 EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0C6
; Address: $C3A14C
; Size: 90 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0C6:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $A0D3			; 4C D3 A0 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0C8
; Address: $C3A1AA
; Size: 110 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0C8:
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 16 B9 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF 0A E2 ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF FE 0A EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF F2 33 EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDX #$10			 ; A2 10 | Load immediate value into X register
	LDX #$15			 ; A2 15 | Load immediate value into X register
	LDX #$22			 ; A2 22 | Load immediate value into X register
	LDX #$27			 ; A2 27 | Load immediate value into X register
	LDX #$34			 ; A2 34 | Load immediate value into X register
	LDX #$39			 ; A2 39 | Load immediate value into X register
	LDX #$46			 ; A2 46 | Load immediate value into X register
	LDX #$4B			 ; A2 4B | Load immediate value into X register
	LDX #$A6			 ; A2 A6 | Load immediate value into X register
	JMP $A2A3			; 4C A3 A2 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0C9
; Address: $C3A21E
; Size: 107 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0C9:
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A2B7			; 4C B7 A2 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $A2C3			; 4C C3 A2 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A2D7			; 4C D7 A2 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $A2E3			; 4C E3 A2 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A2F7			; 4C F7 A2 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $A303			; 4C 03 A3 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A317			; 4C 17 A3 | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 16 B9 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0CA
; Address: $C3A28B
; Size: 103 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0CA:
	LDA				  ; BF 0A E2 ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF FE 0A EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF F2 33 EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0CB
; Address: $C3A2F2
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0CB:
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $A258			; 4C 58 A2 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0CC
; Address: $C3A32B
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0CC:
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0CD
; Address: $C3A352
; Size: 114 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0CD:
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 53 C3 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF 47 EC ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 3B 15 EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 2F 3E EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	STA $A3			  ; 85 A3 | Update graphics data
	TXS				  ; 9A | Transfer X register to stack pointer
	LDY $B9A3			; AC A3 B9 | Load from absolute address into Y register
	LDX $CBA3,Y		  ; BE A3 CB | Load from absolute,Y into X register
	BNE $A3			  ; D0 A3 | Branch if not equal
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $A428			; 4C 28 A4 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A43C			; 4C 3C A4 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $A448			; 4C 48 A4 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A45C			; 4C 5C A4 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $A468			; 4C 68 A4 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A47C			; 4C 7C A4 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0CE
; Address: $C3A3CD
; Size: 115 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0CE:
	JMP $A488			; 4C 88 A4 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A49C			; 4C 9C A4 | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 53 C3 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF 47 EC ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 3B 15 EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 2F 3E EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0CF
; Address: $C3A442
; Size: 93 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0CF:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C086,Y		  ; B9 86 C0 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $D086,Y		  ; B9 86 D0 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0D0
; Address: $C3A49F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0D0:
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $A3DD			; 4C DD A3 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0D1
; Address: $C3A4B0
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0D1:
	LDA $E3D0			; AD D0 E3 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	STA $10			  ; 85 10 | Update graphics data
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 53 C3 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF 47 EC ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 3B 15 EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 2F 3E EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	LDA $1A			  ; A5 1A | Read graphics status
	LDA $1F			  ; A5 1F | Read graphics status
	LDA $2C			  ; A5 2C | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0D2
; Address: $C3A50F
; Size: 102 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0D2:
	LDA $31			  ; A5 31 | Read graphics status
	LDA $3E			  ; A5 3E | Read graphics status
	LDA $43			  ; A5 43 | Read graphics status
	LDA $50			  ; A5 50 | Read graphics status
	LDA $55			  ; A5 55 | Read graphics status
	LDA $A6			  ; A5 A6 | Read graphics status
	JMP $A5AD			; 4C AD A5 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A5C1			; 4C C1 A5 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $A5CD			; 4C CD A5 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A5E1			; 4C E1 A5 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $A5ED			; 4C ED A5 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A601			; 4C 01 A6 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	JMP $A60D			; 4C 0D A6 | Jump to address
	LDX $04			  ; A6 04 | Load from zero page into X register
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	JMP $A621			; 4C 21 A6 | Jump to address
	LDA $10			  ; A5 10 | Read graphics status
	AND $28			  ; 25 28 | Logical AND with accumulator (zero page)
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	LDA $0E			  ; A5 0E | Read graphics status
	STA $004203		  ; 8F 03 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0D3
; Address: $C3A576
; Size: 111 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0D3:
	NOP				  ; EA | No operation
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	SEP #$20			 ; E2 20 | Set processor status bits
	STZ $FC4F			; 9C 4F FC | Store zero to absolute
	STZ $FC51			; 9C 51 FC | Store zero to absolute
	STZ $FC53			; 9C 53 FC | Store zero to absolute
	STZ $FC55			; 9C 55 FC | Store zero to absolute
	LDA				  ; BF 53 C3 ED | Read graphics status
	STA $FC4E			; 8D 4E FC | Update graphics data
	LDA				  ; BF 47 EC ED | Read graphics status
	STA $FC50			; 8D 50 FC | Update graphics data
	LDA				  ; BF 3B 15 EE | Read graphics status
	STA $FC52			; 8D 52 FC | Update graphics data
	LDA				  ; BF 2F 3E EE | Read graphics status
	STA $FC54			; 8D 54 FC | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	PLX				  ; FA | Pull X register from stack
	LDA $FC4E			; AD 4E FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $73			  ; F0 73 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $67			  ; F0 67 | Branch if equal
	LDA $FC50			; AD 50 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $53			  ; F0 53 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0D4
; Address: $C3A5E7
; Size: 78 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0D4:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $47			  ; F0 47 | Branch if equal
	LDA $FC52			; AD 52 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $33			  ; F0 33 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $27			  ; F0 27 | Branch if equal
	LDA $FC54			; AD 54 FC | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $2A			  ; 65 2A | Add with carry (zero page)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $B886,Y		  ; B9 86 B8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $13			  ; F0 13 | Branch if equal
	LDA $C886,Y		  ; B9 86 C8 | Read graphics status
	STA $0000,X		  ; 9D 00 00 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $24			  ; C6 24 | Decrement (zero page)
	BEQ $07			  ; F0 07 | Branch if equal
	INC $10			  ; E6 10 | Increment (zero page)
	INC $10			  ; E6 10 | Increment (zero page)
	JMP $A562			; 4C 62 A5 | Jump to address
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0D5
; Address: $C3A635
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0D5:
	LDX $18			  ; A6 18 | Load from zero page into X register
	LDA $E344,X		  ; BD 44 E3 | Read graphics status
	BEQ $62			  ; F0 62 | Branch if equal
	LDA $E31E,X		  ; BD 1E E3 | Read graphics status
	AND $E3BC			; 2D BC E3 | Logical AND with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $0E			  ; 85 0E | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0D6
; Address: $C3A646
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0D6:
	LDA $E31E,X		  ; BD 1E E3 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	STA $10			  ; 85 10 | Update graphics data
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $E574,X		  ; 9D 74 E5 | Update graphics data
	EOR #$3E			 ; 49 3E | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $E55C,X		  ; 9D 5C E5 | Update graphics data
	LDA				  ; BF 06 6F C1 | Read graphics status
	STA $E564,X		  ; 9D 64 E5 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $E55C,X		  ; 7D 5C E5 | Add with carry (absolute,X)
	STA $E57C,X		  ; 9D 7C E5 | Update graphics data
	LDA $E362,X		  ; BD 62 E3 | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	EOR $0E			  ; 45 0E | Exclusive OR with accumulator (zero page)
	ADC $10			  ; 65 10 | Add with carry (zero page)
	STA $E554,X		  ; 9D 54 E5 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	EOR $0E			  ; 45 0E | Exclusive OR with accumulator (zero page)
	EOR $E3BE			; 4D BE E3 | Exclusive OR with accumulator (absolute)
	STA $E56C,X		  ; 9D 6C E5 | Update graphics data
	LDA $E31E,X		  ; BD 1E E3 | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA $E3BC			; AD BC E3 | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	INC $E574,X		  ; FE 74 E5 | Increment (absolute,X)
	INC $E574,X		  ; FE 74 E5 | Increment (absolute,X)
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7E7FE2		  ; 8F E2 7F 7E | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0D7
; Address: $C3A69F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0D7:
	LDX $18			  ; A6 18 | Load from zero page into X register
	LDA $E34E,X		  ; BD 4E E3 | Read graphics status
	BEQ $3C			  ; F0 3C | Branch if equal
	LDA $E328,X		  ; BD 28 E3 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $E5A4,X		  ; 9D A4 E5 | Update graphics data
	EOR #$3E			 ; 49 3E | Exclusive OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0D8
; Address: $C3A6B6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0D8:
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $E58C,X		  ; 9D 8C E5 | Update graphics data
	LDA				  ; BF 0E 6F C1 | Read graphics status
	STA $E594,X		  ; 9D 94 E5 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	ADC $E58C,X		  ; 7D 8C E5 | Add with carry (absolute,X)
	STA $E5AC,X		  ; 9D AC E5 | Update graphics data
	LDA $E328,X		  ; BD 28 E3 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0D9
; Address: $C3A6CC
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0D9:
	JSR $A6E3			; 20 E3 A6 | Jump to subroutine
	STA $E584,X		  ; 9D 84 E5 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0DA
; Address: $C3A6D5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0DA:
	JSR $A6E3			; 20 E3 A6 | Jump to subroutine
	STA $E59C,X		  ; 9D 9C E5 | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7E7FE2		  ; 8F E2 7F 7E | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0DB
; Address: $C3A6E3
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0DB:
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $0E			  ; 85 0E | Update graphics data
	LDA $E358,X		  ; BD 58 E3 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$1F			 ; 29 1F | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $0E			  ; 65 0E | Add with carry (zero page)
	STA $0E			  ; 85 0E | Update graphics data
	LDA $E358,X		  ; BD 58 E3 | Read graphics status
	AND $E3BC			; 2D BC E3 | Logical AND with accumulator (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR $0E			  ; 45 0E | Exclusive OR with accumulator (zero page)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0DC
; Address: $C3A703
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0DC:
	LDA $E442,Y		  ; B9 42 E4 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)
	INC				  ; 1A | Increment accumulator
	STA $E5B4			; 8D B4 E5 | Update graphics data
	STA $E5B8			; 8D B8 E5 | Update graphics data
	LDA $E462,Y		  ; B9 62 E4 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E452,Y		  ; F9 52 E4 | Subtract with carry (absolute,Y)
	INC				  ; 1A | Increment accumulator
	STA $E5B6			; 8D B6 E5 | Update graphics data
	STA $E5BA			; 8D BA E5 | Update graphics data
	LDA $0A			  ; A5 0A | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E432,Y		  ; F9 32 E4 | Subtract with carry (absolute,Y)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0DD
; Address: $C3A725
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0DD:
	STA $E5BC			; 8D BC E5 | Update graphics data
	LDA $0C			  ; A5 0C | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $E452,Y		  ; F9 52 E4 | Subtract with carry (absolute,Y)
	STA $E5BE			; 8D BE E5 | Update graphics data
	LDA $E3F2,Y		  ; B9 F2 E3 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 55 A8 C1 | Read graphics status
	STA $1E			  ; 85 1E | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0DE
; Address: $C3A745
; Size: 49 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0DE:
	ADC #$A7			 ; 69 A7 | Add with carry (immediate)
	ADC #$A7			 ; 69 A7 | Add with carry (immediate)
	ADC #$A7			 ; 69 A7 | Add with carry (immediate)
	EOR ($A7),Y		  ; 51 A7 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($A7),Y		  ; 51 A7 | Exclusive OR with accumulator ((zero page),Y)
	EOR ($A7),Y		  ; 51 A7 | Exclusive OR with accumulator ((zero page),Y)
	LSR $E5B4			; 4E B4 E5 | Logical shift right (absolute)
	LSR $E5B4			; 4E B4 E5 | Logical shift right (absolute)
	LSR $E5B6			; 4E B6 E5 | Logical shift right (absolute)
	LSR $E5B6			; 4E B6 E5 | Logical shift right (absolute)
	LSR $E5BC			; 4E BC E5 | Logical shift right (absolute)
	LSR $E5BC			; 4E BC E5 | Logical shift right (absolute)
	LSR $E5BE			; 4E BE E5 | Logical shift right (absolute)
	LSR $E5BE			; 4E BE E5 | Logical shift right (absolute)
	LSR $E5B4			; 4E B4 E5 | Logical shift right (absolute)
	LSR $E5B6			; 4E B6 E5 | Logical shift right (absolute)
	LSR $E5BC			; 4E BC E5 | Logical shift right (absolute)
	LSR $E5BE			; 4E BE E5 | Logical shift right (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0DF
; Address: $C3A776
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0DF:
	PHY				  ; 5A | Push Y register to stack
	LDA $E5B4			; AD B4 E5 | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E5B6			; AD B6 E5 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0E0
; Address: $C3A780
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0E0:
	JSR $A7F2			; 20 F2 A7 | Jump to subroutine
	REP #$20			 ; C2 20 | Reset processor status bits
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0E1
; Address: $C3A78C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0E1:
	PHY				  ; 5A | Push Y register to stack
	LDA $E5B4			; AD B4 E5 | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E5B6			; AD B6 E5 | Read graphics status
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0E2
; Address: $C3A797
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0E2:
	JSR $A7F2			; 20 F2 A7 | Jump to subroutine
	REP #$20			 ; C2 20 | Reset processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0E3
; Address: $C3A79D
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0E3:
	TAY				  ; A8 | Transfer accumulator to Y register
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0E4
; Address: $C3A7A2
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0E4:
	PHY				  ; 5A | Push Y register to stack
	LDA $E5BC			; AD BC E5 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0E5
; Address: $C3A7AC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0E5:
	PHY				  ; 5A | Push Y register to stack
	LDA $E5B4			; AD B4 E5 | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E5B6			; AD B6 E5 | Read graphics status
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0E6
; Address: $C3A7B7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0E6:
	JSR $A7F2			; 20 F2 A7 | Jump to subroutine
	REP #$20			 ; C2 20 | Reset processor status bits
	CLC				  ; 18 | Clear carry flag
	ADC $E5BC			; 6D BC E5 | Add with carry (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0E7
; Address: $C3A7C6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0E7:
	PHY				  ; 5A | Push Y register to stack
	LDA $E5B4			; AD B4 E5 | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E5BE			; AD BE E5 | Read graphics status
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0E8
; Address: $C3A7D1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0E8:
	JSR $A7F2			; 20 F2 A7 | Jump to subroutine
	REP #$20			 ; C2 20 | Reset processor status bits
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0E9
; Address: $C3A7DD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0E9:
	PHY				  ; 5A | Push Y register to stack
	LDA $E5B4			; AD B4 E5 | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	XBA				  ; EB | Exchange accumulator bytes
	LDA $E5BE			; AD BE E5 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0EA
; Address: $C3A7E7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0EA:
	JSR $A7F2			; 20 F2 A7 | Jump to subroutine
	REP #$20			 ; C2 20 | Reset processor status bits
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	PLY				  ; 7A | Pull Y register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0EB
; Address: $C3A7F2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0EB:
	STA $004202		  ; 8F 02 42 00 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	STA $004203		  ; 8F 03 42 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0EC
; Address: $C3A7FB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0EC:
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004217		  ; AF 17 42 00 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0ED
; Address: $C3A80B
; Size: 84 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0ED:
	TXS				  ; 9A | Transfer X register to stack pointer
	ORA $71B5,X		  ; 1D B5 71 | Logical OR with accumulator (absolute,X)
	ADC ($B5),Y		  ; 71 B5 | Add with carry ((zero page),Y)
	ADC ($7A),Y		  ; 71 7A | Add with carry ((zero page),Y)
	PLY				  ; 7A | Pull Y register from stack
	PLY				  ; 7A | Pull Y register from stack
	LDA $7FAF7F		  ; AF 7F AF 7F | Read graphics status
	LDA $72367F		  ; AF 7F 36 72 | Read graphics status
	SBC ($7E,X)		  ; E1 7E | Subtract with carry ((zero page,X))
	SBC ($7E,X)		  ; E1 7E | Subtract with carry ((zero page,X))
	SBC ($7E,X)		  ; E1 7E | Subtract with carry ((zero page,X))
	LDA $7FAF7F		  ; AF 7F AF 7F | Read graphics status
	LDA $8D7E7F		  ; AF 7F 7E 8D | Read graphics status
	ROR $7E8D,X		  ; 7E 8D 7E | Rotate right (absolute,X)
	STA $8E0F			; 8D 0F 8E | Update graphics data
	STX $8E0F			; 8E 0F 8E | Store X register to absolute address
	DEX				  ; CA | Decrement X register
	STA $99CA,Y		  ; 99 CA 99 | Update graphics data
	DEX				  ; CA | Decrement X register
	STA $8D7E,Y		  ; 99 7E 8D | Update graphics data
	ROR $7E8D,X		  ; 7E 8D 7E | Rotate right (absolute,X)
	STA $98BA			; 8D BA 98 | Update graphics data
	TSX				  ; BA | Transfer stack pointer to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	TSX				  ; BA | Transfer stack pointer to X register
	TYA				  ; 98 | Transfer Y register to accumulator
	DEX				  ; CA | Decrement X register
	STA $99CA,Y		  ; 99 CA 99 | Update graphics data
	DEX				  ; CA | Decrement X register
	STA $0000,Y		  ; 99 00 00 | Update graphics data
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0EF
; Address: $C3A874
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0EF:
	JSR $A8B7			; 20 B7 A8 | Jump to subroutine
	JMP $A88D			; 4C 8D A8 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $BDDF			; 8D DF BD | Update graphics data
	JMP $A88D			; 4C 8D A8 | Jump to address
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE4B			; 8D 4B BE | Update graphics data
	STA $BE49			; 8D 49 BE | Update graphics data
	STZ $BE4D			; 9C 4D BE | Store zero to absolute
	STZ $BDF7			; 9C F7 BD | Store zero to absolute
	STZ $BE55			; 9C 55 BE | Store zero to absolute
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE41			; 8D 41 BE | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $BE59			; 8D 59 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0F0
; Address: $C3A8AB
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0F0:
	JSL $C1ABC0		  ; 22 C0 AB C1 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0F1
; Address: $C3A8B7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0F1:
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA $AB48			; 0D 48 AB | Logical OR with accumulator (absolute)
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	STA $7EBDDF		  ; 8F DF BD 7E | Update graphics data
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0F2
; Address: $C3A8D4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0F2:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0F3
; Address: $C3A8DA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0F3:
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0F5
; Address: $C3A8E4
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0F5:
	JSR $AB82			; 20 82 AB | Jump to subroutine
	JMP $AAF9			; 4C F9 AA | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0F7
; Address: $C3A8FA
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0F7:
	JSR $AB76			; 20 76 AB | Jump to subroutine
	JMP $AAF9			; 4C F9 AA | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7EBDDF		  ; 8F DF BD 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0F8
; Address: $C3A911
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0F8:
	JSR $AB82			; 20 82 AB | Jump to subroutine
	JMP $AAF9			; 4C F9 AA | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7EBDDF		  ; 8F DF BD 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0F9
; Address: $C3A928
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0F9:
	JSR $AB76			; 20 76 AB | Jump to subroutine
	JMP $AAF9			; 4C F9 AA | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0FA
; Address: $C3A932
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0FA:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0FC
; Address: $C3A93E
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0FC:
	JSR $AB82			; 20 82 AB | Jump to subroutine
	JMP $AB29			; 4C 29 AB | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0FE
; Address: $C3A954
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0FE:
	JSR $AB76			; 20 76 AB | Jump to subroutine
	JMP $AB29			; 4C 29 AB | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7EBDDF		  ; 8F DF BD 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_0FF
; Address: $C3A96B
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_0FF:
	JSR $AB82			; 20 82 AB | Jump to subroutine
	JMP $AB29			; 4C 29 AB | Jump to address
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7EBDDF		  ; 8F DF BD 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_100
; Address: $C3A982
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_100:
	JSR $AB76			; 20 76 AB | Jump to subroutine
	JMP $AB29			; 4C 29 AB | Jump to address
	PHP				  ; 08 | Push processor status to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_101
; Address: $C3A989
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_101:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $BE43			; AE 43 BE | Load from absolute address into X register
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	STA $BE45			; 8D 45 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_102
; Address: $C3A9A0
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_102:
	JSR $AB59			; 20 59 AB | Jump to subroutine
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE4B			; 8D 4B BE | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE47			; 8D 47 BE | Update graphics data
	STZ $BE4D			; 9C 4D BE | Store zero to absolute
	STZ $BE4F			; 9C 4F BE | Store zero to absolute
	STZ $BE57			; 9C 57 BE | Store zero to absolute
	STZ $BDE3			; 9C E3 BD | Store zero to absolute
	STZ $BDE5			; 9C E5 BD | Store zero to absolute
	STZ $BDE9			; 9C E9 BD | Store zero to absolute
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $BE59			; 8D 59 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_103
; Address: $C3A9C7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_103:
	JSL $C1AF1D		  ; 22 1D AF C1 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_104
; Address: $C3A9D3
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_104:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX $BE43			; AE 43 BE | Load from absolute address into X register
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	STA $BE45			; 8D 45 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_106
; Address: $C3A9F1
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_106:
	STA $BE4B			; 8D 4B BE | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE47			; 8D 47 BE | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE4D			; 8D 4D BE | Update graphics data
	STA $BE4F			; 8D 4F BE | Update graphics data
	STA $BE57			; 8D 57 BE | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE59			; 8D 59 BE | Update graphics data
	STZ $BDE3			; 9C E3 BD | Store zero to absolute
	STZ $BDE5			; 9C E5 BD | Store zero to absolute
	STZ $BDE9			; 9C E9 BD | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_107
; Address: $C3AA15
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_107:
	JSL $C1AF1D		  ; 22 1D AF C1 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_108
; Address: $C3AA21
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_108:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7EBDDF		  ; 8F DF BD 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_109
; Address: $C3AA32
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_109:
	JSR $AB82			; 20 82 AB | Jump to subroutine
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE4B			; 8D 4B BE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE47			; 8D 47 BE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE4D			; 8D 4D BE | Update graphics data
	STA $BE4F			; 8D 4F BE | Update graphics data
	STA $BE57			; 8D 57 BE | Update graphics data
	STA $BDE3			; 8D E3 BD | Update graphics data
	STA $BDE9			; 8D E9 BD | Update graphics data
	STZ $BDE5			; 9C E5 BD | Store zero to absolute
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $BE59			; 8D 59 BE | Update graphics data
	STZ $BE43			; 9C 43 BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_10A
; Address: $C3AA5F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_10A:
	JSL $C1AF44		  ; 22 44 AF C1 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_10B
; Address: $C3AA67
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_10B:
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_10C
; Address: $C3AA6B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_10C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7EBDDF		  ; 8F DF BD 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_10D
; Address: $C3AA7C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_10D:
	JSR $AB82			; 20 82 AB | Jump to subroutine
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE4B			; 8D 4B BE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE47			; 8D 47 BE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE4D			; 8D 4D BE | Update graphics data
	STA $BE4F			; 8D 4F BE | Update graphics data
	STA $BE57			; 8D 57 BE | Update graphics data
	STZ $BDE3			; 9C E3 BD | Store zero to absolute
	STA $BDE5			; 8D E5 BD | Update graphics data
	STA $BDE9			; 8D E9 BD | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $BE59			; 8D 59 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_10E
; Address: $C3AAA6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_10E:
	JSL $C1AF1D		  ; 22 1D AF C1 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_10F
; Address: $C3AAB2
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_10F:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	SEI				  ; 78 | Set interrupt disable flag
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $7EBDDF		  ; 8F DF BD 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_111
; Address: $C3AAC9
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_111:
	STA $BE4B			; 8D 4B BE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE47			; 8D 47 BE | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BDE5			; 8D E5 BD | Update graphics data
	STA $BDE9			; 8D E9 BD | Update graphics data
	STZ $BE4D			; 9C 4D BE | Store zero to absolute
	STZ $BE4F			; 9C 4F BE | Store zero to absolute
	STZ $BE57			; 9C 57 BE | Store zero to absolute
	STZ $BDE3			; 9C E3 BD | Store zero to absolute
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $BE59			; 8D 59 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_112
; Address: $C3AAED
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_112:
	JSL $C1AF1D		  ; 22 1D AF C1 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_113
; Address: $C3AAF9
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_113:
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE4B			; 8D 4B BE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE47			; 8D 47 BE | Update graphics data
	STZ $BE4D			; 9C 4D BE | Store zero to absolute
	STZ $BE4F			; 9C 4F BE | Store zero to absolute
	STZ $BE57			; 9C 57 BE | Store zero to absolute
	STZ $BDE3			; 9C E3 BD | Store zero to absolute
	STZ $BDE5			; 9C E5 BD | Store zero to absolute
	STZ $BDE9			; 9C E9 BD | Store zero to absolute
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $BE59			; 8D 59 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_114
; Address: $C3AB1D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_114:
	JSL $C1AF1D		  ; 22 1D AF C1 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_115
; Address: $C3AB29
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_115:
	JSR $AB8E			; 20 8E AB | Jump to subroutine
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE47			; 8D 47 BE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE4D			; 8D 4D BE | Update graphics data
	STA $BE4F			; 8D 4F BE | Update graphics data
	STA $BE57			; 8D 57 BE | Update graphics data
	STZ $BDE3			; 9C E3 BD | Store zero to absolute
	STZ $BDE5			; 9C E5 BD | Store zero to absolute
	STZ $BDE9			; 9C E9 BD | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_117
; Address: $C3AB4D
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_117:
	JSL $C1AF1D		  ; 22 1D AF C1 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_118
; Address: $C3AB59
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_118:
	SEP #$20			 ; E2 20 | Set processor status bits
	ORA $AB48			; 0D 48 AB | Logical OR with accumulator (absolute)
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	STA $7EBDDF		  ; 8F DF BD 7E | Update graphics data
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_119
; Address: $C3AB76
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_119:
	LDA $BE43			; AD 43 BE | Read graphics status
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE45			; 8D 45 BE | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_11A
; Address: $C3AB82
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_11A:
	LDA $BE43			; AD 43 BE | Read graphics status
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$12			 ; A9 12 | Read graphics status
	STA $BE45			; 8D 45 BE | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_11B
; Address: $C3AB8E
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_11B:
	LDA #$4B			 ; A9 4B | Read graphics status
	STA $BE4B			; 8D 4B BE | Update graphics data
	LDA $C36F			; AD 6F C3 | Read graphics status
	BEQ $26			  ; F0 26 | Branch if equal
	LDY $C36D			; AC 6D C3 | Load from absolute address into Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $1B			  ; F0 1B | Branch if equal
	LDA $CF65,Y		  ; B9 65 CF | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_11C
; Address: $C3ABA8
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_11C:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	INC $0000,X		  ; FE 00 00 | Increment (absolute,X)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	STA $BE4B			; 8D 4B BE | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_124
; Address: $C3ABDA
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_124:
	LDA $99F3			; AD F3 99 | Read graphics status
	ORA $B485			; 0D 85 B4 | Logical OR with accumulator (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_125
; Address: $C3ABE2
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_125:
	JSR $618D			; 20 8D 61 | Jump to subroutine
	LDX $2920,Y		  ; BE 20 29 | Load from absolute,Y into X register
	LDY $01A9			; AC A9 01 | Load from absolute address into Y register
	STA $BDED			; 8D ED BD | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_126
; Address: $C3ABEF
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_126:
	JSL $C1AF0F		  ; 22 0F AF C1 | Jump to subroutine long
	BCS $30			  ; B0 30 | Branch if carry set
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE89,X		  ; 9D 89 BE | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	STZ $BDEF			; 9C EF BD | Store zero to absolute
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BDF1			; 8D F1 BD | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	CPY #$8D			 ; C0 8D | Compare Y register (immediate)
	AND $9CC0			; 2D C0 9C | Logical AND with accumulator (absolute)
	AND #$C0			 ; 29 C0 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_127
; Address: $C3AC1A
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_127:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	EOR ($A9),Y		  ; 51 A9 | Exclusive OR with accumulator ((zero page),Y)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $BE43			; 8D 43 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_129
; Address: $C3AC29
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_129:
	LDA #$86			 ; A9 86 | Read graphics status
	STA $BE5B			; 8D 5B BE | Update graphics data
	LDA #$02			 ; A9 02 | Read graphics status
	STA $BDF3			; 8D F3 BD | Update graphics data
	LDA #$07			 ; A9 07 | Read graphics status
	STA $BE5D			; 8D 5D BE | Update graphics data
	STZ $BDE3			; 9C E3 BD | Store zero to absolute
	STZ $BDE5			; 9C E5 BD | Store zero to absolute
	STZ $BDE9			; 9C E9 BD | Store zero to absolute
	STZ $BDF5			; 9C F5 BD | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_12A
; Address: $C3AC48
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_12A:
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	LDX $C029			; AE 29 C0 | Load from absolute address into X register
	LDA $BDF1			; AD F1 BD | Read graphics status
	STA $C02B,X		  ; 9D 2B C0 | Update graphics data
	INX				  ; E8 | Increment X register
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	BCS $05			  ; B0 05 | Branch if carry set
	STZ $C02B,X		  ; 9E 2B C0 | Store zero to absolute,X
	BRA $F5			  ; 80 F5 | Branch always
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_12B
; Address: $C3AC61
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_12B:
	LDA $BDDF			; AD DF BD | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	STA $BE6D			; 8D 6D BE | Update graphics data
	LDA $BDDF			; AD DF BD | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LDA				  ; BF A4 52 C1 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	STA $A0			  ; 85 A0 | Update graphics data
	LDA				  ; BF A6 52 C1 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ADC #$56			 ; 69 56 | Add with carry (immediate)
	STA $A2			  ; 85 A2 | Update graphics data
	STZ $A4			  ; 64 A4 | Store zero to zero page
	LDA $BE6D			; AD 6D BE | Read graphics status
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_12C
; Address: $C3AC93
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_12C:
	JSR $ACA6			; 20 A6 AC | Jump to subroutine
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	CMP #$AE			 ; C9 AE | Compare accumulator (immediate)
	BNE $F3			  ; D0 F3 | Branch if not equal
	DEC $BE6D			; CE 6D BE | Decrement (absolute)
	BRA $E9			  ; 80 E9 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_12D
; Address: $C3ACA6
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_12D:
	LDA $BDF5			; AD F5 BD | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $0C			  ; D0 0C | Branch if not equal
	LDX $BDFB			; AE FB BD | Load from absolute address into X register
	LDA $BDFD,X		  ; BD FD BD | Read graphics status
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	STX $BDFB			; 8E FB BD | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_12F
; Address: $C3ACBB
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_12F:
	LDY #$48			 ; A0 48 | Load immediate value into Y register
	LDA $A0			  ; A5 A0 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$01			 ; 69 01 | Add with carry (immediate)
	STA $A0			  ; 85 A0 | Update graphics data
	BCC $02			  ; 90 02 | Branch if carry clear
	INC $A2			  ; E6 A2 | Increment (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_130
; Address: $C3ACCE
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_130:
	JMP $FEFDF0		  ; 5C F0 FD FE | Jump to address long
	LDX $ABC9,Y		  ; BE C9 AB | Load from absolute,Y into X register
	BCC $0C			  ; 90 0C | Branch if carry clear
	CMP #$C9			 ; C9 C9 | Compare accumulator (immediate)
	BCS $10			  ; B0 10 | Branch if carry set

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_132
; Address: $C3ACE5
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_132:
	JSR $AD7F			; 20 7F AD | Jump to subroutine
	INC $BDEF			; EE EF BD | Increment (absolute)
	JMP $AD49			; 4C 49 AD | Jump to address
	CMP #$F2			 ; C9 F2 | Compare accumulator (immediate)
	BCS $20			  ; B0 20 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	SBC #$C9			 ; E9 C9 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 4A AD C1 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_133
; Address: $C3ACFF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_133:
	JSR $AD7F			; 20 7F AD | Jump to subroutine
	LDA #$04			 ; A9 04 | Read graphics status
	DEC $BDF1			; CE F1 BD | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_134
; Address: $C3AD08
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_134:
	JSR $AD7F			; 20 7F AD | Jump to subroutine
	INC $BDF1			; EE F1 BD | Increment (absolute)
	INC $BDEF			; EE EF BD | Increment (absolute)
	BRA $36			  ; 80 36 | Branch always
	CMP #$FC			 ; C9 FC | Compare accumulator (immediate)
	BCS $20			  ; B0 20 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	SBC #$F2			 ; E9 F2 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 73 AD C1 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_135
; Address: $C3AD24
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_135:
	JSR $AD7F			; 20 7F AD | Jump to subroutine
	LDA #$03			 ; A9 03 | Read graphics status
	DEC $BDF1			; CE F1 BD | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_136
; Address: $C3AD2D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_136:
	JSR $AD7F			; 20 7F AD | Jump to subroutine
	INC $BDF1			; EE F1 BD | Increment (absolute)
	INC $BDEF			; EE EF BD | Increment (absolute)
	BRA $11			  ; 80 11 | Branch always
	SBC #$FC			 ; E9 FC | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_137
; Address: $C3AD3B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_137:
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 7D AD C1 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_138
; Address: $C3AD43
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_138:
	JSR $AD7F			; 20 7F AD | Jump to subroutine
	INC $BDEF			; EE EF BD | Increment (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_139
; Address: $C3AD4A
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_139:
	ORA ($12),Y		  ; 11 12 | Logical OR with accumulator ((zero page),Y)
	CLC				  ; 18 | Clear carry flag
	ORA $1B1A,Y		  ; 19 1A 1B | Logical OR with accumulator (absolute,Y)
	ORA $1F1E,X		  ; 1D 1E 1F | Logical OR with accumulator (absolute,X)
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$45			 ; 29 45 | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	EOR #$4A			 ; 49 4A | Exclusive OR with accumulator (immediate)
	JMP $4E4D			; 4C 4D 4E | Jump to address
	BVC $51			  ; 50 51 | Branch if overflow clear
	JMP $5F5E5D		  ; 5C 5D 5E 5F | Jump to address long
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_13A
; Address: $C3AD73
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_13A:
	AND $26			  ; 25 26 | Logical AND with accumulator (zero page)
	PLP				  ; 28 | Pull processor status from stack
	AND #$5C			 ; 29 5C | Logical AND with accumulator (immediate)
	EOR $5F5E,X		  ; 5D 5E 5F | Exclusive OR with accumulator (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_13C
; Address: $C3AD7F
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_13C:
	JSL $C1B29A		  ; 22 9A B2 C1 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	LDA $BDF1			; AD F1 BD | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($63,X)		  ; 01 63 | Logical OR with accumulator ((zero page,X))
	ADC $BDEF			; 6D EF BD | Add with carry (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLA				  ; 68 | Pull accumulator from stack
	LDY $BDEF			; AC EF BD | Load from absolute address into Y register
	CPY #$1A			 ; C0 1A | Compare Y register (immediate)
	BCS $09			  ; B0 09 | Branch if carry set
	STA $BE89,X		  ; 9D 89 BE | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE53			; 8D 53 BE | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_141
; Address: $C3ADBD
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_141:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	SEC				  ; 38 | Set carry flag
	SBC #$AB			 ; E9 AB | Subtract with carry (immediate)
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDA #$5C			 ; A9 5C | Read graphics status
	STA $BE6D			; 8D 6D BE | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	LDA				  ; BF 3C 0C C1 | Read graphics status
	STA $BE6E			; 8D 6E BE | Update graphics data
	LDA				  ; BF 3D 0C C1 | Read graphics status
	STA $BE6F			; 8D 6F BE | Update graphics data
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_142
; Address: $C3ADE6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_142:
	JSL $7EBE6D		  ; 22 6D BE 7E | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_143
; Address: $C3ADED
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_143:
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $BE55			; AD 55 BE | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_144
; Address: $C3ADFA
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_144:
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_145
; Address: $C3ADFD
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_145:
	LDA $BDE1			; AD E1 BD | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $0A			  ; D0 0A | Branch if not equal
	LDA $BE55			; AD 55 BE | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_14B
; Address: $C3AE23
; Size: 87 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_14B:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDY $BE5B			; AC 5B BE | Load from absolute address into Y register
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $BE89,X		  ; BD 89 BE | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	LDA #$AD			 ; A9 AD | Read graphics status
	BRA $08			  ; 80 08 | Branch always
	LDA #$B2			 ; A9 B2 | Read graphics status
	BRA $03			  ; 80 03 | Branch always
	LDA #$B3			 ; A9 B3 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $BE61			; 6D 61 BE | Add with carry (absolute)
	STA $2BF2,Y		  ; 99 F2 2B | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$34			 ; E0 34 | Compare X register (immediate)
	BCC $D3			  ; 90 D3 | Branch if carry clear
	LDA $BE5B			; AD 5B BE | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $BE5D			; AD 5D BE | Read graphics status
	STA $BE6D			; 8D 6D BE | Update graphics data
	LDA #$1A			 ; A9 1A | Read graphics status
	STA $BE6F			; 8D 6F BE | Update graphics data
	LDA $BEBD,X		  ; BD BD BE | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $BE61			; 6D 61 BE | Add with carry (absolute)
	STA $2BF2,Y		  ; 99 F2 2B | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_14C
; Address: $C3AE85
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_14C:
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	DEC $BE6F			; CE 6F BE | Decrement (absolute)
	BNE $ED			  ; D0 ED | Branch if not equal
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$0C			 ; 69 0C | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	DEC $BE6D			; CE 6D BE | Decrement (absolute)
	BNE $DC			  ; D0 DC | Branch if not equal
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_14D
; Address: $C3AE9F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_14D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_150
; Address: $C3AEAF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_150:
	JSL $C1B6AF		  ; 22 AF B6 C1 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_151
; Address: $C3AEBB
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_151:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_153
; Address: $C3AEC5
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_153:
	JSR $AC48			; 20 48 AC | Jump to subroutine
	LDA #$01			 ; A9 01 | Read graphics status
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_154
; Address: $C3AED3
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_154:
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_155
; Address: $C3AED7
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_155:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_158
; Address: $C3AEE7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_158:
	JSL $C1B6AF		  ; 22 AF B6 C1 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_159
; Address: $C3AEF3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_159:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_15C
; Address: $C3AF03
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_15C:
	JSL $C1B6AF		  ; 22 AF B6 C1 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_15D
; Address: $C3AF0F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_15D:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$51			 ; A9 51 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_15E
; Address: $C3AF15
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_15E:
	JSL $C31AFC		  ; 22 FC 1A C3 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_15F
; Address: $C3AF1D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_15F:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_169
; Address: $C3AF44
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_169:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_170
; Address: $C3AF60
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_170:
	JSL $C1ADFD		  ; 22 FD AD C1 | Jump to subroutine long
	BCC $EB			  ; 90 EB | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_171
; Address: $C3AF67
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_171:
	LDA #$02			 ; A9 02 | Read graphics status
	STA $BDED			; 8D ED BD | Update graphics data
	CMP $BE43			; CD 43 BE | Compare accumulator (absolute)
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_172
; Address: $C3AF72
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_172:
	JSL $C1BC96		  ; 22 96 BC C1 | Jump to subroutine long
	JMP $AF8B			; 4C 8B AF | Jump to address
	LDA #$02			 ; A9 02 | Read graphics status
	STA $BDED			; 8D ED BD | Update graphics data
	CMP $BE43			; CD 43 BE | Compare accumulator (absolute)
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_173
; Address: $C3AF84
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_173:
	JSL $C1BCCC		  ; 22 CC BC C1 | Jump to subroutine long
	JMP $AF8B			; 4C 8B AF | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BDF3			; 8D F3 BD | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE49			; 8D 49 BE | Update graphics data
	STZ $BDEB			; 9C EB BD | Store zero to absolute
	STZ $BE51			; 9C 51 BE | Store zero to absolute
	STZ $BDF5			; 9C F5 BD | Store zero to absolute
	STZ $BDF7			; 9C F7 BD | Store zero to absolute
	STZ $BE55			; 9C 55 BE | Store zero to absolute
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE41			; 8D 41 BE | Update graphics data
	LDA $BDF1			; AD F1 BD | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_174
; Address: $C3AFAF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_174:
	STA $BE3F			; 8D 3F BE | Update graphics data
	STZ $BE3D			; 9C 3D BE | Store zero to absolute
	STZ $BDE7			; 9C E7 BD | Store zero to absolute
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_175
; Address: $C3AFB9
; Size: 74 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_175:
	LDA $BDDF			; AD DF BD | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	STA $BE6D			; 8D 6D BE | Update graphics data
	LDA $BDDF			; AD DF BD | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LDA				  ; BF 31 53 C1 | Read graphics status
	STA $A0			  ; 85 A0 | Update graphics data
	JMP $AFE3			; 4C E3 AF | Jump to address
	PHX				  ; DA | Push X register to stack
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 1C B0 C1 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $A4			  ; 85 A4 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	LDA				  ; BF 33 53 C1 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	JMP $B002			; 4C 02 B0 | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	ROR $A0			  ; 66 A0 | Rotate right (zero page)
	LSR				  ; 4A | Logical shift right (accumulator)
	ROR $A0			  ; 66 A0 | Rotate right (zero page)
	STA $A2			  ; 85 A2 | Update graphics data
	LDA $A0			  ; A5 A0 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$58			 ; 69 58 | Add with carry (immediate)
	REP #$85			 ; C2 85 | Reset processor status bits
	LDY #$A5			 ; A0 A5 | Load immediate value into Y register
	LDX #$69			 ; A2 69 | Load immediate value into X register
	STA $A2			  ; 85 A2 | Update graphics data
	LDA $BE6D			; AD 6D BE | Read graphics status
	BEQ $12			  ; F0 12 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_176
; Address: $C3B009
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_176:
	JSR $B024			; 20 24 B0 | Jump to subroutine
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	CMP #$AE			 ; C9 AE | Compare accumulator (immediate)
	BNE $F3			  ; D0 F3 | Branch if not equal
	DEC $BE6D			; CE 6D BE | Decrement (absolute)
	BRA $E9			  ; 80 E9 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_178
; Address: $C3B01F
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_178:
	PHP				  ; 08 | Push processor status to stack
	BPL $20			  ; 10 20 | Branch if positive
	RTI				  ; 40 | Return from interrupt
	BRA $22			  ; 80 22 | Branch always
	CMP ($60,X)		  ; C1 60 | Compare accumulator ((zero page,X))
	BNE $0F			  ; D0 0F | Branch if not equal
	LDX $BDFB			; AE FB BD | Load from absolute address into X register
	LDA $BDFD,X		  ; BD FD BD | Read graphics status
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	STX $BDFB			; 8E FB BD | Store X register to absolute address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_17A
; Address: $C3B03B
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_17A:
	LDA $A0			  ; A5 A0 | Read graphics status
	STA $C02F			; 8D 2F C0 | Update graphics data
	LDA $A2			  ; A5 A2 | Read graphics status
	STA $C031			; 8D 31 C0 | Update graphics data
	LDA $A4			  ; A5 A4 | Read graphics status
	STA $C033			; 8D 33 C0 | Update graphics data
	LDX #$D2			 ; A2 D2 | Load immediate value into X register
	LDY #$25			 ; A0 25 | Load immediate value into Y register
	LDY $08			  ; A4 08 | Load from zero page into Y register
	LSR $A4			  ; 46 A4 | Logical shift right (zero page)
	BNE $0B			  ; D0 0B | Branch if not equal
	LDA #$80			 ; A9 80 | Read graphics status
	STA $A4			  ; 85 A4 | Update graphics data
	INC $A0			  ; E6 A0 | Increment (zero page)
	BNE $02			  ; D0 02 | Branch if not equal
	INC $A2			  ; E6 A2 | Increment (zero page)
	PLP				  ; 28 | Pull processor status from stack
	BNE $07			  ; D0 07 | Branch if not equal
	LDA				  ; BF D3 59 C1 | Read graphics status
	BMI $08			  ; 30 08 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_17B
; Address: $C3B06B
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_17B:
	LDA				  ; BF A7 61 C1 | Read graphics status
	BMI $01			  ; 30 01 | Branch if negative
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_17C
; Address: $C3B072
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_17C:
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	BRA $D5			  ; 80 D5 | Branch always
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$AB			 ; C9 AB | Compare accumulator (immediate)
	BCC $05			  ; 90 05 | Branch if carry clear
	CMP #$C9			 ; C9 C9 | Compare accumulator (immediate)
	BCC $06			  ; 90 06 | Branch if carry clear
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF D5 0C C1 | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_17E
; Address: $C3B08D
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_17E:
	LDA $BE57			; AD 57 BE | Read graphics status
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA $BE4F			; AD 4F BE | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	LDA #$10			 ; A9 10 | Read graphics status
	STA $BDEF			; 8D EF BD | Update graphics data
	LDA $BE4D			; AD 4D BE | Read graphics status
	BEQ $38			  ; F0 38 | Branch if equal
	LDA $BE4F			; AD 4F BE | Read graphics status
	BEQ $30			  ; F0 30 | Branch if equal
	ORA ($C9,X)		  ; 01 C9 | Logical OR with accumulator ((zero page,X))
	CMP $F000			; CD 00 F0 | Compare accumulator (absolute)
	BIT $E9AD			; 2C AD E9 | Test bits in accumulator (absolute)
	LDA $05F0,X		  ; BD F0 05 | Read graphics status
	LDA #$25			 ; A9 25 | Read graphics status
	BRA $03			  ; 80 03 | Branch always
	LDA #$24			 ; A9 24 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_17F
; Address: $C3B0BB
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_17F:
	JSL $C1B762		  ; 22 62 B7 C1 | Jump to subroutine long
	LDA $C02F			; AD 2F C0 | Read graphics status
	STA $A0			  ; 85 A0 | Update graphics data
	LDA $C031			; AD 31 C0 | Read graphics status
	STA $A2			  ; 85 A2 | Update graphics data
	LDA $C033			; AD 33 C0 | Read graphics status
	STA $A4			  ; 85 A4 | Update graphics data
	STZ $BE4F			; 9C 4F BE | Store zero to absolute
	STZ $BE51			; 9C 51 BE | Store zero to absolute
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_180
; Address: $C3B0D7
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_180:
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_181
; Address: $C3B0DA
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_181:
	STZ $BE4D			; 9C 4D BE | Store zero to absolute
	STZ $BE4F			; 9C 4F BE | Store zero to absolute
	BRA $F5			  ; 80 F5 | Branch always
	STA $BDF9			; 8D F9 BD | Update graphics data
	STZ $BE53			; 9C 53 BE | Store zero to absolute
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCS $06			  ; B0 06 | Branch if carry set

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_182
; Address: $C3B0ED
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_182:
	JSL $C1ADBD		  ; 22 BD AD C1 | Jump to subroutine long
	BRA $0E			  ; 80 0E | Branch always
	STZ $BDE7			; 9C E7 BD | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_186
; Address: $C3B102
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_186:
	LDA $BDF9			; AD F9 BD | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_188
; Address: $C3B10D
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_188:
	LDA $BDF1			; AD F1 BD | Read graphics status
	CMP #$38			 ; C9 38 | Compare accumulator (immediate)
	BCC $01			  ; 90 01 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_189
; Address: $C3B116
; Size: 97 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_189:
	LDA $BDF1			; AD F1 BD | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$0E			 ; 69 0E | Add with carry (immediate)
	SEC				  ; 38 | Set carry flag
	SBC $C087			; ED 87 C0 | Subtract with carry (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	LDA $BDEF			; AD EF BD | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	CLC				  ; 18 | Clear carry flag
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C087			; AD 87 C0 | Read graphics status
	BEQ $4F			  ; F0 4F | Branch if equal
	LDA $BDEF			; AD EF BD | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	STA $C07D			; 8D 7D C0 | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $C089,Y		  ; B9 89 C0 | Read graphics status
	STA $C07B			; 8D 7B C0 | Update graphics data
	STZ $C079			; 9C 79 C0 | Store zero to absolute
	LDA $C07D			; AD 7D C0 | Read graphics status
	BEQ $09			  ; F0 09 | Branch if equal
	LSR $C07B			; 4E 7B C0 | Logical shift right (absolute)
	ROR $C079			; 6E 79 C0 | Rotate right (absolute)
	DEC				  ; 3A | Decrement accumulator
	BNE $F7			  ; D0 F7 | Branch if not equal
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $C07C			; AD 7C C0 | Read graphics status
	ORA $B6DF,X		  ; 1D DF B6 | Logical OR with accumulator (absolute,X)
	STA $B6DF,X		  ; 9D DF B6 | Update graphics data
	LDA $C07B			; AD 7B C0 | Read graphics status
	ORA $B6E0,X		  ; 1D E0 B6 | Logical OR with accumulator (absolute,X)
	STA $B6E0,X		  ; 9D E0 B6 | Update graphics data
	LDA $C07A			; AD 7A C0 | Read graphics status
	ORA $B6E1,X		  ; 1D E1 B6 | Logical OR with accumulator (absolute,X)
	STA $B6E1,X		  ; 9D E1 B6 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_18A
; Address: $C3B17B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_18A:
	ADC #$20			 ; 69 20 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	DEC $C087			; CE 87 C0 | Decrement (absolute)
	BNE $BD			  ; D0 BD | Branch if not equal
	LDA $BDEF			; AD EF BD | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $C085			; 6D 85 C0 | Add with carry (absolute)
	BRA $00			  ; 80 00 | Branch always
	STA $BDEF			; 8D EF BD | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE53			; 8D 53 BE | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_18B
; Address: $C3B199
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_18B:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $BE53			; AD 53 BE | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $17			  ; D0 17 | Branch if not equal
	LDA $BDE3			; AD E3 BD | Read graphics status
	BEQ $0E			  ; F0 0E | Branch if equal
	LDA $7FE6			; AD E6 7F | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_18D
; Address: $C3B1C0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_18D:
	JSL $C1BCF3		  ; 22 F3 BC C1 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_18E
; Address: $C3B1CC
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_18E:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_18F
; Address: $C3B1D3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_18F:
	JSL $C0255C		  ; 22 5C 25 C0 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_190
; Address: $C3B1DA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_190:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_191
; Address: $C3B1DF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_191:
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
; Bank06_GraphicsFunction_192
; Address: $C3B1EB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_192:
	JSL $C0240A		  ; 22 0A 24 C0 | Jump to subroutine long
	LDA $7F70			; AD 70 7F | Read graphics status
	BEQ $16			  ; F0 16 | Branch if equal
	LDX #$3C			 ; A2 3C | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_194
; Address: $C3B1FB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_194:
	JSL $C0240A		  ; 22 0A 24 C0 | Jump to subroutine long
	LDA $7F70			; AD 70 7F | Read graphics status
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	DEX				  ; CA | Decrement X register
	BNE $ED			  ; D0 ED | Branch if not equal
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_196
; Address: $C3B216
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_196:
	LDA $BDED			; AD ED BD | Read graphics status
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA $BDEF			; AD EF BD | Read graphics status
	BEQ $1F			  ; F0 1F | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_198
; Address: $C3B229
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_198:
	JSL $C1B747		  ; 22 47 B7 C1 | Jump to subroutine long
	LDA $BDEF			; AD EF BD | Read graphics status
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BEQ $0D			  ; F0 0D | Branch if equal
	STZ $BE3D			; 9C 3D BE | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_199
; Address: $C3B238
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_199:
	JSL $C1B246		  ; 22 46 B2 C1 | Jump to subroutine long
	LDA #$10			 ; A9 10 | Read graphics status
	STA $BDEF			; 8D EF BD | Update graphics data
	JMP $C1B3B7		  ; 5C B7 B3 C1 | Jump to address long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_19A
; Address: $C3B246
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_19A:
	JSL $C1B29A		  ; 22 9A B2 C1 | Jump to subroutine long
	LDA $BDED			; AD ED BD | Read graphics status
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $0C			  ; F0 0C | Branch if equal
	LDA $BDF1			; AD F1 BD | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	STA $BDF1			; 8D F1 BD | Update graphics data
	STZ $BDEF			; 9C EF BD | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_19B
; Address: $C3B25E
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_19B:
	JSL $C1B747		  ; 22 47 B7 C1 | Jump to subroutine long
	LDA $BDF1			; AD F1 BD | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	STA $BDF1			; 8D F1 BD | Update graphics data
	LDA #$10			 ; A9 10 | Read graphics status
	STA $BDEF			; 8D EF BD | Update graphics data
	LDA $BE57			; AD 57 BE | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	LDA #$21			 ; A9 21 | PPU graphics register access
	STA $BDEF			; 8D EF BD | Update graphics data
	LDA $BE3D			; AD 3D BE | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $BDF1			; AD F1 BD | Read graphics status
	STA $BE3F			; 8D 3F BE | Update graphics data
	STZ $BE3D			; 9C 3D BE | Store zero to absolute
	LDA $BE51			; AD 51 BE | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	INC $BE4F			; EE 4F BE | Increment (absolute)
	STZ $BE51			; 9C 51 BE | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_19C
; Address: $C3B29A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_19C:
	PHA				  ; 48 | Push accumulator to stack
	LDA $BDED			; AD ED BD | Read graphics status
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $16			  ; F0 16 | Branch if equal
	LDA $BDF1			; AD F1 BD | Read graphics status
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCC $0C			  ; 90 0C | Branch if carry clear

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_19E
; Address: $C3B2AE
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_19E:
	JSR $B2CC			; 20 CC B2 | Jump to subroutine
	LDA #$07			 ; A9 07 | Read graphics status
	STA $BDF1			; 8D F1 BD | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_19F
; Address: $C3B2B9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_19F:
	LDA $BDF1			; AD F1 BD | Read graphics status
	CMP #$30			 ; C9 30 | Compare accumulator (immediate)
	BCC $09			  ; 90 09 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1A1
; Address: $C3B2C7
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1A1:
	STA $BDF1			; 8D F1 BD | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1A2
; Address: $C3B2CC
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1A2:
	LDA $BDF3			; AD F3 BD | Read graphics status
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $24			  ; F0 24 | Branch if equal
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $BEBD,X		  ; BD BD BE | Read graphics status
	STA $BE89,X		  ; 9D 89 BE | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$6C			 ; E0 6C | Compare X register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BFF5,X		  ; 9D F5 BF | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$34			 ; E0 34 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1A5
; Address: $C3B300
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1A5:
	JSR $B318			; 20 18 B3 | Jump to subroutine
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7EBE53		  ; 8F 53 BE 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1A6
; Address: $C3B30A
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1A6:
	JSL $C1B199		  ; 22 99 B1 C1 | Jump to subroutine long
	DEC $BE3F			; CE 3F BE | Decrement (absolute)
	DEC $BE3F			; CE 3F BE | Decrement (absolute)
	DEY				  ; 88 | Decrement Y register
	BNE $E9			  ; D0 E9 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1A7
; Address: $C3B318
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1A7:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX #$1F			 ; A2 1F | Load immediate value into X register
	LDY #$DF			 ; A0 DF | Load immediate value into Y register
	LDA #$C0			 ; A9 C0 | Read graphics status
	ASL $54			  ; 06 54 | Arithmetic shift left (zero page)
	ROR $9C7E,X		  ; 7E 7E 9C | Rotate right (absolute,X)
	STA				  ; 9F BD 9C A1 | Update graphics data
	LDA $A39C,X		  ; BD 9C A3 | Read graphics status
	LDA $A59C,X		  ; BD 9C A5 | Read graphics status
	LDA $A79C,X		  ; BD 9C A7 | Read graphics status
	LDA $A99C,X		  ; BD 9C A9 | Read graphics status
	LDA $AB9C,X		  ; BD 9C AB | Read graphics status
	LDA $AD9C,X		  ; BD 9C AD | Read graphics status
	LDA $AF9C,X		  ; BD 9C AF | Read graphics status
	LDA $B19C,X		  ; BD 9C B1 | Read graphics status
	LDA $B39C,X		  ; BD 9C B3 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1A8
; Address: $C3B346
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1A8:
	LDA $B59C,X		  ; BD 9C B5 | Read graphics status
	LDA $B79C,X		  ; BD 9C B7 | Read graphics status
	LDA $B99C,X		  ; BD 9C B9 | Read graphics status
	LDA $BB9C,X		  ; BD 9C BB | Read graphics status
	LDA $BD9C,X		  ; BD 9C BD | Read graphics status
	LDA $BF9C,X		  ; BD 9C BF | Read graphics status
	LDA $C19C,X		  ; BD 9C C1 | Read graphics status
	LDA $C39C,X		  ; BD 9C C3 | Read graphics status
	LDA $C59C,X		  ; BD 9C C5 | Read graphics status
	LDA $C79C,X		  ; BD 9C C7 | Read graphics status
	LDA $C99C,X		  ; BD 9C C9 | Read graphics status
	LDA $CB9C,X		  ; BD 9C CB | Read graphics status
	LDA $CD9C,X		  ; BD 9C CD | Read graphics status
	LDA $CF9C,X		  ; BD 9C CF | Read graphics status
	LDA $D19C,X		  ; BD 9C D1 | Read graphics status
	LDA $D39C,X		  ; BD 9C D3 | Read graphics status
	LDA $D59C,X		  ; BD 9C D5 | Read graphics status
	LDA $D79C,X		  ; BD 9C D7 | Read graphics status
	LDA $D99C,X		  ; BD 9C D9 | Read graphics status
	LDA $DB9C,X		  ; BD 9C DB | Read graphics status
	LDA $DD9C,X		  ; BD 9C DD | Read graphics status
	LDA $FA7A,X		  ; BD 7A FA | Read graphics status
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1A9
; Address: $C3B389
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1A9:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $BDED			; AD ED BD | Read graphics status
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $1F			  ; D0 1F | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1AA
; Address: $C3B394
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1AA:
	JSL $C1B747		  ; 22 47 B7 C1 | Jump to subroutine long
	LDA $BE41			; AD 41 BE | Read graphics status
	BEQ $16			  ; F0 16 | Branch if equal
	LDA $BE3F			; AD 3F BE | Read graphics status
	BEQ $11			  ; F0 11 | Branch if equal
	BMI $0F			  ; 30 0F | Branch if negative

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1AB
; Address: $C3B3A4
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1AB:
	JSR $B2F9			; 20 F9 B2 | Jump to subroutine
	LDA $BDF1			; AD F1 BD | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$10			 ; E9 10 | Subtract with carry (immediate)
	STA $BDF1			; 8D F1 BD | Update graphics data
	BRA $EA			  ; 80 EA | Branch always
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1AC
; Address: $C3B3B7
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1AC:
	JSL $C1B389		  ; 22 89 B3 C1 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE55			; 8D 55 BE | Update graphics data
	LDA $C029			; AD 29 C0 | Read graphics status
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1AD
; Address: $C3B3C5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1AD:
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA #$03			 ; A9 03 | Read graphics status
	STA $C029			; 8D 29 C0 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1AE
; Address: $C3B3D1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1AE:
	LDA $BDED			; AD ED BD | Read graphics status
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $07			  ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1B0
; Address: $C3B3E0
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1B0:
	JSL $C1AE11		  ; 22 11 AE C1 | Jump to subroutine long
	LDA #$08			 ; A9 08 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$12			 ; 69 12 | Add with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$0F			 ; 69 0F | Add with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	STZ $7FFC			; 9C FC 7F | Store zero to absolute
	LDY #$B6			 ; A0 B6 | Load immediate value into Y register
	LDA $7FFC			; AD FC 7F | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	LDY #$AD			 ; A0 AD | Load immediate value into Y register
	BRA $20			  ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1B1
; Address: $C3B407
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1B1:
	JSL $A722B4		  ; 22 B4 22 A7 | Jump to subroutine long
	BIT $C0			  ; 24 C0 | Test bits in accumulator (zero page)
	LDA $7F70			; AD 70 7F | Read graphics status
	AND #$E0			 ; 29 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	LDY #$AD			 ; A0 AD | Load immediate value into Y register
	BRA $20			  ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1B2
; Address: $C3B419
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1B2:
	JSL $01A9B4		  ; 22 B4 A9 01 | Jump to subroutine long
	STA $BE51			; 8D 51 BE | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1B3
; Address: $C3B422
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1B3:
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $BE61			; 6D 61 BE | Add with carry (absolute)
	STA $2BF2,X		  ; 9D F2 2B | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1B5
; Address: $C3B42F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1B5:
	JSL $C1B389		  ; 22 89 B3 C1 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE3D			; 8D 3D BE | Update graphics data
	LDA $BDE3			; AD E3 BD | Read graphics status
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1B6
; Address: $C3B43E
; Size: 29 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1B6:
	JMP $B3B7			; 4C B7 B3 | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BDE7			; 8D E7 BD | Update graphics data
	STZ $7FFC			; 9C FC 7F | Store zero to absolute
	LDY #$E4			 ; A0 E4 | Load immediate value into Y register
	LDA $BE47			; AD 47 BE | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	LDY #$E5			 ; A0 E5 | Load immediate value into Y register
	LDA $7FFC			; AD FC 7F | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1B9
; Address: $C3B466
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1B9:
	JSL $C024A7		  ; 22 A7 24 C0 | Jump to subroutine long
	LDA $BDE5			; AD E5 BD | Read graphics status
	BEQ $08			  ; F0 08 | Branch if equal
	LDA $7F70			; AD 70 7F | Read graphics status
	AND #$60			 ; 29 60 | Logical AND with accumulator (immediate)
	BNE $1E			  ; D0 1E | Branch if not equal
	LDA $7F70			; AD 70 7F | Read graphics status
	AND #$E0			 ; 29 E0 | Game work RAM access
	BEQ $F0			  ; F0 F0 | Branch if equal
	STA $BE6B			; 8D 6B BE | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1BA
; Address: $C3B482
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1BA:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	AND $2000,X		  ; 3D 00 20 | Logical AND with accumulator (absolute,X)
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1BB
; Address: $C3B48B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1BB:
	JSR $B589			; 20 89 B5 | Jump to subroutine
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE51			; 8D 51 BE | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1BD
; Address: $C3B498
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1BD:
	JSR $B589			; 20 89 B5 | Jump to subroutine
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE51			; 8D 51 BE | Update graphics data
	STA $BDEB			; 8D EB BD | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1BF
; Address: $C3B4A9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1BF:
	LDA $BDED			; AD ED BD | Read graphics status
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $07			  ; D0 07 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1C1
; Address: $C3B4B8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1C1:
	JSL $C1AE11		  ; 22 11 AE C1 | Jump to subroutine long
	LDA #$08			 ; A9 08 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$12			 ; 69 12 | Add with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1C2
; Address: $C3B4C6
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1C2:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$0F			 ; 69 0F | Add with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	STZ $7FFC			; 9C FC 7F | Store zero to absolute
	LDY #$B6			 ; A0 B6 | Load immediate value into Y register
	LDA $7FFC			; AD FC 7F | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	LDY #$AD			 ; A0 AD | Load immediate value into Y register
	BRA $20			  ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1C3
; Address: $C3B4DF
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1C3:
	JSL $A722B4		  ; 22 B4 22 A7 | Jump to subroutine long
	BIT $C0			  ; 24 C0 | Test bits in accumulator (zero page)
	LDA $7FFC			; AD FC 7F | Read graphics status
	CMP #$64			 ; C9 64 | Compare accumulator (immediate)
	BCC $E3			  ; 90 E3 | Branch if carry clear
	LDY #$AD			 ; A0 AD | Load immediate value into Y register
	BRA $20			  ; 80 20 | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1C4
; Address: $C3B4F1
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1C4:
	JSL $01A9B4		  ; 22 B4 A9 01 | Jump to subroutine long
	STA $BE51			; 8D 51 BE | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1C5
; Address: $C3B4FA
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1C5:
	JSL $C1B389		  ; 22 89 B3 C1 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE3D			; 8D 3D BE | Update graphics data
	LDA $BDE3			; AD E3 BD | Read graphics status
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $B3B7			; 4C B7 B3 | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BDE7			; 8D E7 BD | Update graphics data
	LDA $BDF1			; AD F1 BD | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	AND #$30			 ; 29 30 | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	STA $BE69			; 8D 69 BE | Update graphics data
	STZ $7FFC			; 9C FC 7F | Store zero to absolute
	LDY #$E2			 ; A0 E2 | Load immediate value into Y register
	BRA $AD			  ; 80 AD | Branch always
	LDX $00C9,Y		  ; BE C9 00 | Load from absolute,Y into X register
	BEQ $03			  ; F0 03 | Branch if equal
	LDY #$E6			 ; A0 E6 | Load immediate value into Y register
	LDA $7FFC			; AD FC 7F | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1C9
; Address: $C3B547
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1C9:
	BEQ $08			  ; F0 08 | Branch if equal
	LDA $7F70			; AD 70 7F | Read graphics status
	AND #$60			 ; 29 60 | Logical AND with accumulator (immediate)
	BNE $15			  ; D0 15 | Branch if not equal
	LDA $7FFC			; AD FC 7F | Read graphics status
	CMP $BE69			; CD 69 BE | Compare accumulator (absolute)
	BCC $CB			  ; 90 CB | Branch if carry clear

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1CB
; Address: $C3B55C
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1CB:
	JSR $B589			; 20 89 B5 | Jump to subroutine
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE51			; 8D 51 BE | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1CD
; Address: $C3B569
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1CD:
	JSR $B589			; 20 89 B5 | Jump to subroutine
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE51			; 8D 51 BE | Update graphics data
	STA $BDEB			; 8D EB BD | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1CF
; Address: $C3B57A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1CF:
	LDY #$E2			 ; A0 E2 | Load immediate value into Y register
	BRA $AD			  ; 80 AD | Branch always
	LDX $00C9,Y		  ; BE C9 00 | Load from absolute,Y into X register
	BEQ $03			  ; F0 03 | Branch if equal
	LDY #$E6			 ; A0 E6 | Load immediate value into Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1D0
; Address: $C3B589
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1D0:
	TYA				  ; 98 | Transfer Y register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $99F5			; 6D F5 99 | Add with carry (absolute)
	ORA $BE63			; 0D 63 BE | Logical OR with accumulator (absolute)
	STA $BE67			; 8D 67 BE | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1D1
; Address: $C3B594
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1D1:
	JSL $C1C014		  ; 22 14 C0 C1 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	ADC #$0F			 ; 69 0F | Add with carry (immediate)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	LDA #$67			 ; A9 67 | Read graphics status
	LDX $2722,Y		  ; BE 22 27 | Load from absolute,Y into X register
	ROL $C0			  ; 26 C0 | Rotate left (zero page)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1D3
; Address: $C3B5AC
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1D3:
	JSL $C1B747		  ; 22 47 B7 C1 | Jump to subroutine long
	LDA $BDED			; AD ED BD | Read graphics status
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1D4
; Address: $C3B5B8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1D4:
	JSL $C1AE11		  ; 22 11 AE C1 | Jump to subroutine long
	LDA $BDE3			; AD E3 BD | Read graphics status
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $B3B7			; 4C B7 B3 | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1D7
; Address: $C3B5CC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1D7:
	JSL $C42D43		  ; 22 43 2D C4 | Jump to subroutine long
	PEA #$369F		   ; F4 9F 36 | Push effective address to stack
	PEA #$0007		   ; F4 07 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1D8
; Address: $C3B5DA
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1D8:
	JSL $C9029E		  ; 22 9E 02 C9 | Jump to subroutine long
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $B3D1			; 4C D1 B3 | Jump to address
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1D9
; Address: $C3B5E7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1D9:
	JSL $C1AE11		  ; 22 11 AE C1 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	LDA				  ; BF FC B5 C1 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1DA
; Address: $C3B5F4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1DA:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	BNE $F9			  ; D0 F9 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1DB
; Address: $C3B5FC
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1DB:
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	ORA ($16),Y		  ; 11 16 | Logical OR with accumulator ((zero page),Y)
	PLP				  ; 28 | Pull processor status from stack
	BMI $A9			  ; 30 A9 | Branch if negative
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	STA $BE5F			; 8D 5F BE | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1DD
; Address: $C3B611
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1DD:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	DEX				  ; CA | Decrement X register
	BNE $F9			  ; D0 F9 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1DE
; Address: $C3B619
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1DE:
	JSL $C1B747		  ; 22 47 B7 C1 | Jump to subroutine long
	LDX #$0F			 ; A2 0F | Load immediate value into X register
	JMP $B611			; 4C 11 B6 | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1DF
; Address: $C3B623
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1DF:
	JSL $C1B747		  ; 22 47 B7 C1 | Jump to subroutine long
	LDX #$08			 ; A2 08 | Load immediate value into X register
	JMP $B611			; 4C 11 B6 | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1E0
; Address: $C3B62D
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1E0:
	JSL $C1B747		  ; 22 47 B7 C1 | Jump to subroutine long
	LDX $40B3			; AE B3 40 | Load from absolute address into X register
	JMP $B611			; 4C 11 B6 | Jump to address
	LDA $BE59			; AD 59 BE | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE59			; 8D 59 BE | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1E1
; Address: $C3B646
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1E1:
	LDA $BE59			; AD 59 BE | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1E2
; Address: $C3B64E
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1E2:
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE59			; 8D 59 BE | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1E3
; Address: $C3B655
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1E3:
	LDA $BDEF			; AD EF BD | Read graphics status
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$21			 ; A9 21 | PPU graphics register access
	STA $BDEF			; 8D EF BD | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1E4
; Address: $C3B664
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1E4:
	LDA $BDE9			; AD E9 BD | Read graphics status
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$4C			 ; A9 4C | Read graphics status
	STA $BE4B			; 8D 4B BE | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1E5
; Address: $C3B670
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1E5:
	LDA $BDE9			; AD E9 BD | Read graphics status
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$4B			 ; A9 4B | Read graphics status
	STA $BE4B			; 8D 4B BE | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1E6
; Address: $C3B67C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1E6:
	LDA $BDE9			; AD E9 BD | Read graphics status
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$4D			 ; A9 4D | Read graphics status
	STA $BE4B			; 8D 4B BE | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1E7
; Address: $C3B688
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1E7:
	JSL $C1B747		  ; 22 47 B7 C1 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE4B			; 8D 4B BE | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1E8
; Address: $C3B693
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1E8:
	JMP $B762			; 4C 62 B7 | Jump to address
	STZ $BE41			; 9C 41 BE | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1E9
; Address: $C3B69A
; Size: 42 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1E9:
	LDA #$00			 ; A9 00 | Read graphics status
	JMP $B6AF			; 4C AF B6 | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	JMP $B6AF			; 4C AF B6 | Jump to address
	LDA #$02			 ; A9 02 | Read graphics status
	JMP $B6AF			; 4C AF B6 | Jump to address
	LDA #$03			 ; A9 03 | Read graphics status
	LDX $BDED			; AE ED BD | Load from absolute address into X register
	CPX #$02			 ; E0 02 | Compare X register (immediate)
	BEQ $68			  ; F0 68 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA $C02B,X		  ; BD 2B C0 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BNE $09			  ; D0 09 | Branch if not equal
	DEX				  ; CA | Decrement X register
	BNE $F5			  ; D0 F5 | Branch if not equal
	LDA #$01			 ; A9 01 | Read graphics status
	STA $C02B,X		  ; 9D 2B C0 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1EA
; Address: $C3B6CB
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1EA:
	PHX				  ; DA | Push X register to stack
	LDA $C02B,X		  ; BD 2B C0 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCS $22			  ; B0 22 | Branch if carry set
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($63,X)		  ; 01 63 | Logical OR with accumulator ((zero page,X))
	JMP $FED600		  ; 5C 00 D6 FE | Jump to address long
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE89,X		  ; 9D 89 BE | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$A0			 ; E0 A0 | Compare X register (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE53			; 8D 53 BE | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $C029			; 8D 29 C0 | Update graphics data
	SEP #$30			 ; E2 30 | Set processor status bits
	TAX				  ; AA | Transfer accumulator to X register
	LDA $C02B,X		  ; BD 2B C0 | Read graphics status
	STA $BDF1			; 8D F1 BD | Update graphics data
	STZ $BDEF			; 9C EF BD | Store zero to absolute
	INX				  ; E8 | Increment X register
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	BCS $05			  ; B0 05 | Branch if carry set
	STZ $C02B,X		  ; 9E 2B C0 | Store zero to absolute,X
	BRA $F6			  ; 80 F6 | Branch always
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1EE
; Address: $C3B721
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1EE:
	PHA				  ; 48 | Push accumulator to stack
	LDA $BE4B			; AD 4B BE | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $1B			  ; F0 1B | Branch if equal
	LDA $BE49			; AD 49 BE | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	CMP $BE4B			; CD 4B BE | Compare accumulator (absolute)
	BEQ $0E			  ; F0 0E | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1F1
; Address: $C3B741
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1F1:
	JSL $C1E314		  ; 22 14 E3 C1 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1F2
; Address: $C3B747
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1F2:
	PHA				  ; 48 | Push accumulator to stack
	LDA $BE49			; AD 49 BE | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1F3
; Address: $C3B750
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1F3:
	JSL $C1E5EF		  ; 22 EF E5 C1 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BE49			; 8D 49 BE | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1F4
; Address: $C3B75C
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1F4:
	JSR $B998			; 20 98 B9 | Jump to subroutine
	LDA $BE77			; AD 77 BE | Read graphics status
	STZ $BDFB			; 9C FB BD | Store zero to absolute
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1F6
; Address: $C3B76C
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1F6:
	JSL $C1BACC		  ; 22 CC BA C1 | Jump to subroutine long
	STA $BDFD,X		  ; 9D FD BD | Update graphics data
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $04			  ; F0 04 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $F0			  ; 80 F0 | Branch always
	LDA #$AB			 ; A9 AB | Read graphics status
	STA $BDFD,X		  ; 9D FD BD | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BDF5			; 8D F5 BD | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1F7
; Address: $C3B789
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1F7:
	JSR $B998			; 20 98 B9 | Jump to subroutine
	LDA $BE73			; AD 73 BE | Read graphics status
	JMP $B8B5			; 4C B5 B8 | Jump to address
	LDA $3604			; AD 04 36 | Read graphics status
	BEQ $13			  ; F0 13 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1F8
; Address: $C3B797
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1F8:
	JSL $C42A12		  ; 22 12 2A C4 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	BCS $0A			  ; B0 0A | Branch if carry set

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_1F9
; Address: $C3B7A0
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_1F9:
	JSL $C42F5E		  ; 22 5E 2F C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	JMP $B762			; 4C 62 B7 | Jump to address
	LDA #$23			 ; A9 23 | Read graphics status
	JMP $B762			; 4C 62 B7 | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_203
; Address: $C3B7E5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_203:
	JSR $B998			; 20 98 B9 | Jump to subroutine
	LDX $23E4			; AE E4 23 | Load from absolute address into X register
	JMP $B7F4			; 4C F4 B7 | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_205
; Address: $C3B7F4
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_205:
	JSL $C2AD86		  ; 22 86 AD C2 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_209
; Address: $C3B80A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_209:
	JSL $C429DA		  ; 22 DA 29 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	JMP $B8BA			; 4C BA B8 | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_20B
; Address: $C3B81A
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_20B:
	JSL $C429DA		  ; 22 DA 29 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	JMP $B8BA			; 4C BA B8 | Jump to address
	LDA #$20			 ; A9 20 | Read graphics status
	JMP $B762			; 4C 62 B7 | Jump to address
	LDA #$01			 ; A9 01 | Read graphics status
	JMP $B8B5			; 4C B5 B8 | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_20C
; Address: $C3B830
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_20C:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	BMI $22			  ; 30 22 | Branch if negative

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_20D
; Address: $C3B839
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_20D:
	JSL $C42DA1		  ; 22 A1 2D C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $F1			  ; D0 F1 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_20E
; Address: $C3B845
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_20E:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $0A			  ; D0 0A | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_210
; Address: $C3B855
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_210:
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	JMP $B762			; 4C 62 B7 | Jump to address
	JMP $B85E			; 4C 5E B8 | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_211
; Address: $C3B85E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_211:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($A6,X)		  ; 01 A6 | Logical OR with accumulator ((zero page,X))
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_212
; Address: $C3B867
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_212:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	INX				  ; E8 | Increment X register
	CPX $A6			  ; E4 A6 | Compare X register (zero page)
	BCC $EF			  ; 90 EF | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_213
; Address: $C3B879
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_213:
	JSL $C42F5E		  ; 22 5E 2F C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	JMP $B762			; 4C 62 B7 | Jump to address
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_214
; Address: $C3B886
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_214:
	JSL $C42F5E		  ; 22 5E 2F C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	JMP $B762			; 4C 62 B7 | Jump to address
	PHX				  ; DA | Push X register to stack
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_216
; Address: $C3B89B
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_216:
	JSL $C42DA1		  ; 22 A1 2D C4 | Jump to subroutine long
	INC $C3FF,X		  ; FE FF C3 | Increment (absolute,X)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_217
; Address: $C3B8A7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_217:
	JSL $C429DA		  ; 22 DA 29 C4 | Jump to subroutine long
	INC $FAFF,X		  ; FE FF FA | Increment (absolute,X)
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_218
; Address: $C3B8B1
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_218:
	PLA				  ; 68 | Pull accumulator from stack
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_21A
; Address: $C3B8BA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_21A:
	JSL $C42F5E		  ; 22 5E 2F C4 | Jump to subroutine long
	ASL $FF			  ; 06 FF | Arithmetic shift left (zero page)
	JMP $B762			; 4C 62 B7 | Jump to address
	LDA #$23			 ; A9 23 | Read graphics status
	JMP $B762			; 4C 62 B7 | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_21B
; Address: $C3B8CA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_21B:
	JSR $B998			; 20 98 B9 | Jump to subroutine
	LDA $BE81			; AD 81 BE | Read graphics status
	STA $A6			  ; 85 A6 | Update graphics data
	LDA $BE82			; AD 82 BE | Read graphics status
	STA $A7			  ; 85 A7 | Update graphics data
	JMP $B8FE			; 4C FE B8 | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_21C
; Address: $C3B8DA
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_21C:
	JSR $B998			; 20 98 B9 | Jump to subroutine
	LDA $BE85			; AD 85 BE | Read graphics status
	STA $A6			  ; 85 A6 | Update graphics data
	LDA $BE86			; AD 86 BE | Read graphics status
	STA $A7			  ; 85 A7 | Update graphics data
	JMP $B8FE			; 4C FE B8 | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_21E
; Address: $C3B8ED
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_21E:
	JSL $C3F05C		  ; 22 5C F0 C3 | Jump to subroutine long
	LDA $BE81			; AD 81 BE | Read graphics status
	STA $A6			  ; 85 A6 | Update graphics data
	LDA $BE82			; AD 82 BE | Read graphics status
	STA $A7			  ; 85 A7 | Update graphics data
	JMP $B8FE			; 4C FE B8 | Jump to address
	LDX #$A6			 ; A2 A6 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_21F
; Address: $C3B901
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_21F:
	JSL $C01579		  ; 22 79 15 C0 | Jump to subroutine long
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDX #$00			 ; A2 00 | Load immediate value into X register
	PHX				  ; DA | Push X register to stack
	LDX $29			  ; A6 29 | Load from zero page into X register
	BNE $05			  ; D0 05 | Branch if not equal
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BEQ $09			  ; F0 09 | Branch if equal
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	STA $BDFD,Y		  ; 99 FD BD | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	PLX				  ; FA | Pull X register from stack
	INX				  ; E8 | Increment X register
	CPX #$08			 ; E0 08 | Compare X register (immediate)
	BCC $E3			  ; 90 E3 | Branch if carry clear
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	BNE $08			  ; D0 08 | Branch if not equal
	LDA #$87			 ; A9 87 | Read graphics status
	STA $BDFD			; 8D FD BD | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	LDA #$AB			 ; A9 AB | Read graphics status
	STA $BDFD,Y		  ; 99 FD BD | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BDF5			; 8D F5 BD | Update graphics data
	STZ $BDFB			; 9C FB BD | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_220
; Address: $C3B945
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_220:
	JSR $B9A1			; 20 A1 B9 | Jump to subroutine
	BCC $06			  ; 90 06 | Branch if carry clear
	LDA #$CE			 ; A9 CE | Read graphics status
	JMP $B762			; 4C 62 B7 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_222
; Address: $C3B956
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_222:
	LDA #$26			 ; A9 26 | Read graphics status
	JMP $B762			; 4C 62 B7 | Jump to address
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_223
; Address: $C3B95D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_223:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STZ $A6			  ; 64 A6 | Store zero to zero page
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $1F			  ; F0 1F | Branch if equal
	DEX				  ; CA | Decrement X register
	BMI $1C			  ; 30 1C | Branch if negative

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_224
; Address: $C3B96D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_224:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $F1			  ; D0 F1 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_225
; Address: $C3B979
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_225:
	JSL $C42E19		  ; 22 19 2E C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $E5			  ; D0 E5 | Branch if not equal
	INC $A6			  ; E6 A6 | Increment (zero page)
	BRA $E1			  ; 80 E1 | Branch always
	LDA $A6			  ; A5 A6 | Read graphics status
	BNE $05			  ; D0 05 | Branch if not equal
	LDA #$28			 ; A9 28 | Read graphics status
	BRA $03			  ; 80 03 | Branch always
	LDA #$27			 ; A9 27 | Read graphics status
	JMP $B762			; 4C 62 B7 | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $BE59			; 8D 59 BE | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_226
; Address: $C3B9A1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_226:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	STZ $A6			  ; 64 A6 | Store zero to zero page
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $13			  ; F0 13 | Branch if equal
	DEX				  ; CA | Decrement X register
	BMI $10			  ; 30 10 | Branch if negative

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_227
; Address: $C3B9B1
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_227:
	JSL $C43F87		  ; 22 87 3F C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $F1			  ; D0 F1 | Branch if not equal
	INC $A6			  ; E6 A6 | Increment (zero page)
	BRA $ED			  ; 80 ED | Branch always
	LDA $A6			  ; A5 A6 | Read graphics status
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_228
; Address: $C3B9C7
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_228:
	JSR $B998			; 20 98 B9 | Jump to subroutine
	STZ $BDFB			; 9C FB BD | Store zero to absolute
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_229
; Address: $C3B9D1
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_229:
	LDA $3332,X		  ; BD 32 33 | Read graphics status
	STA $BDFD,Y		  ; 99 FD BD | Update graphics data
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BRA $F0			  ; 80 F0 | Branch always
	LDA #$AB			 ; A9 AB | Read graphics status
	STA $BDFD,Y		  ; 99 FD BD | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BDF5			; 8D F5 BD | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_22A
; Address: $C3B9EE
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_22A:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	BMI $19			  ; 30 19 | Branch if negative
	BVS $38			  ; 70 38 | Branch if overflow set
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $0000,Y		  ; 99 00 00 | Update graphics data
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	BRA $E6			  ; 80 E6 | Branch always
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_22B
; Address: $C3BA10
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_22B:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	PHX				  ; DA | Push X register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LSR				  ; 4A | Logical shift right (accumulator)
	LDA $F0C1			; AD C1 F0 | Read graphics status
	ORA #$E8			 ; 09 E8 | Logical OR with accumulator (immediate)
	CPX #$2A			 ; E0 2A | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	REP #$20			 ; C2 20 | Reset processor status bits
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$C9			 ; 69 C9 | Add with carry (immediate)
	BRA $1F			  ; 80 1F | Branch always
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $0000,X		  ; BD 00 00 | Read graphics status
	PHX				  ; DA | Push X register to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_22C
; Address: $C3BA3C
; Size: 91 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_22C:
	LDA $F0C1			; AD C1 F0 | Read graphics status
	ORA #$E8			 ; 09 E8 | Logical OR with accumulator (immediate)
	CPX #$0A			 ; E0 0A | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	REP #$20			 ; C2 20 | Reset processor status bits
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$F2			 ; 69 F2 | Add with carry (immediate)
	PLX				  ; FA | Pull X register from stack
	BRA $A9			  ; 80 A9 | Branch always
	PHX				  ; DA | Push X register to stack
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $05			  ; 90 05 | Branch if carry clear
	CMP #$23			 ; C9 23 | Compare accumulator (immediate)
	BCC $48			  ; 90 48 | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	STA $C0A9			; 8D A9 C0 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	PHA				  ; 48 | Push accumulator to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	LDA				  ; BF 1F 59 C1 | Read graphics status
	STA $BA			  ; 85 BA | Update graphics data
	LDA				  ; BF 20 59 C1 | Read graphics status
	STA $BB			  ; 85 BB | Update graphics data
	LDA $BA			  ; A5 BA | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	BRA $85			  ; 80 85 | Branch always
	TSX				  ; BA | Transfer stack pointer to X register
	LDA $BC			  ; A5 BC | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ADC #$41			 ; 69 41 | Add with carry (immediate)
	STA $BC			  ; 85 BC | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $C0A9			; AD A9 C0 | Read graphics status
	BEQ $22			  ; F0 22 | Branch if equal
	TSX				  ; BA | Transfer stack pointer to X register
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BNE $F5			  ; D0 F5 | Branch if not equal
	DEC $C0A9			; CE A9 C0 | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_22E
; Address: $C3BAA6
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_22E:
	JSL $C46CC1		  ; 22 C1 6C C4 | Jump to subroutine long
	LDA $4A			  ; A5 4A | Read graphics status
	STA $BA			  ; 85 BA | Update graphics data
	LDA $4C			  ; A5 4C | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $BC			  ; 85 BC | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PHY				  ; 5A | Push Y register to stack
	LDX #$FF			 ; A2 FF | Load immediate value into X register
	TSX				  ; BA | Transfer stack pointer to X register
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	INX				  ; E8 | Increment X register
	CMP #$AC			 ; C9 AC | Compare accumulator (immediate)
	BNE $F4			  ; D0 F4 | Branch if not equal
	PLY				  ; 7A | Pull Y register from stack
	TXA				  ; 8A | Transfer X register to accumulator
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_22F
; Address: $C3BACD
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_22F:
	TSX				  ; BA | Transfer stack pointer to X register
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_231
; Address: $C3BAD4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_231:
	JSL $FF1000		  ; 22 00 10 FF | Jump to subroutine long
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	CMP #$C9			 ; C9 C9 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_232
; Address: $C3BADF
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_232:
	JSR $BAE4			; 20 E4 BA | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_233
; Address: $C3BAE4
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_233:
	CMP #$F2			 ; C9 F2 | Compare accumulator (immediate)
	BCS $10			  ; B0 10 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	SBC #$C9			 ; E9 C9 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 4A AD C1 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BRA $60			  ; 80 60 | Branch always
	CMP #$FC			 ; C9 FC | Compare accumulator (immediate)
	BCS $10			  ; B0 10 | Branch if carry set
	SEC				  ; 38 | Set carry flag
	SBC #$F2			 ; E9 F2 | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 73 AD C1 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_235
; Address: $C3BB0E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_235:
	SBC #$FC			 ; E9 FC | Subtract with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 7D AD C1 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_236
; Address: $C3BB1A
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_236:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $C083			; 8D 83 C0 | Update graphics data
	LDA #$04			 ; A9 04 | Read graphics status
	STA $C085			; 8D 85 C0 | Update graphics data
	LDA #$0B			 ; A9 0B | Read graphics status
	STA $C087			; 8D 87 C0 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_237
; Address: $C3BB35
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_237:
	JSR $BC65			; 20 65 BC | Jump to subroutine
	LDA $C083			; AD 83 C0 | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_238
; Address: $C3BB3D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_238:
	JSR $BB4B			; 20 4B BB | Jump to subroutine
	BRA $01			  ; 80 01 | Branch always
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_239
; Address: $C3BB4B
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_239:
	REP #$30			 ; C2 30 | Reset processor status bits
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	AND #$7F			 ; 29 7F | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF D3 0E C1 | Read graphics status
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	STA $C085			; 8D 85 C0 | Update graphics data
	LDA #$0D			 ; A9 0D | Read graphics status
	STA $C087			; 8D 87 C0 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF D3 0F C1 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_23A
; Address: $C3BB71
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_23A:
	STA $C089,Y		  ; 99 89 C0 | Update graphics data
	INX				  ; E8 | Increment X register
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)
	BCC $EE			  ; 90 EE | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_23B
; Address: $C3BB7D
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_23B:
	STA $C081			; 8D 81 C0 | Update graphics data
	LDA $C07F			; AD 7F C0 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $C081			; ED 81 C0 | Subtract with carry (absolute)
	STA $C07F			; 8D 7F C0 | Update graphics data
	LDA				  ; BF AA 51 C1 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	STA $B4			  ; 85 B4 | Update graphics data
	STA $C085			; 8D 85 C0 | Update graphics data
	LDA				  ; BF AE 51 C1 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	STA $B6			  ; 85 B6 | Update graphics data
	STA $C087			; 8D 87 C0 | Update graphics data
	PHX				  ; DA | Push X register to stack
	LDX #$B4			 ; A2 B4 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_23C
; Address: $C3BBAD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_23C:
	JSL $C010C2		  ; 22 C2 10 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $C07F			; AD 7F C0 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_23D
; Address: $C3BBB6
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_23D:
	JSL $C01146		  ; 22 46 11 C0 | Jump to subroutine long
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $B4			  ; A5 B4 | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	STA $B8			  ; 85 B8 | Update graphics data
	LSR $B6			  ; 46 B6 | Logical shift right (zero page)
	ROR $B5			  ; 66 B5 | Rotate right (zero page)
	ROR $B4			  ; 66 B4 | Rotate right (zero page)
	LSR $B6			  ; 46 B6 | Logical shift right (zero page)
	ROR $B5			  ; 66 B5 | Rotate right (zero page)
	ROR $B4			  ; 66 B4 | Rotate right (zero page)
	LSR $B6			  ; 46 B6 | Logical shift right (zero page)
	ROR $B5			  ; 66 B5 | Rotate right (zero page)
	ROR $B4			  ; 66 B4 | Rotate right (zero page)
	LDA #$C1			 ; A9 C1 | Read graphics status
	STA $B6			  ; 85 B6 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_23E
; Address: $C3BBDB
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_23E:
	LDA				  ; BF AC 51 C1 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $B4			  ; 65 B4 | Add with carry (zero page)
	STA $B4			  ; 85 B4 | Update graphics data
	BNE $02			  ; D0 02 | Branch if not equal
	INC $B6			  ; E6 B6 | Increment (zero page)
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_23F
; Address: $C3BBEA
; Size: 83 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_23F:
	PHP				  ; 08 | Push processor status to stack
	PHB				  ; 8B | Push data bank register to stack
	SEP #$30			 ; E2 30 | Set processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $C087			; AD 87 C0 | Read graphics status
	STA $C07C			; 8D 7C C0 | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $B8			  ; A5 B8 | Read graphics status
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $C079			; 8D 79 C0 | Update graphics data
	INY				  ; C8 | Increment Y register
	STA $C07A			; 8D 7A C0 | Update graphics data
	INY				  ; C8 | Increment Y register
	STA $C07B			; 8D 7B C0 | Update graphics data
	LDA $B8			  ; A5 B8 | Read graphics status
	AND #$07			 ; 29 07 | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ADC $C085			; 6D 85 C0 | Add with carry (absolute)
	SBC #$0F			 ; E9 0F | Subtract with carry (immediate)
	BEQ $1C			  ; F0 1C | Branch if equal
	BMI $0E			  ; 30 0E | Branch if negative
	LSR $C07B			; 4E 7B C0 | Logical shift right (absolute)
	ROR $C07A			; 6E 7A C0 | Rotate right (absolute)
	ROR $C079			; 6E 79 C0 | Rotate right (absolute)
	DEC				  ; 3A | Decrement accumulator
	BNE $F4			  ; D0 F4 | Branch if not equal
	BRA $0C			  ; 80 0C | Branch always
	ASL $C079			; 0E 79 C0 | Arithmetic shift left (absolute)
	ROL $C07A			; 2E 7A C0 | Rotate left (absolute)
	ROL $C07B			; 2E 7B C0 | Rotate left (absolute)
	INC				  ; 1A | Increment accumulator
	BMI $F4			  ; 30 F4 | Branch if negative
	LDA $C085			; AD 85 C0 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	ADC $B8			  ; 65 B8 | Add with carry (zero page)
	STA $B8			  ; 85 B8 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_240
; Address: $C3BC43
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_240:
	PLA				  ; 68 | Pull accumulator from stack
	DEC				  ; 3A | Decrement accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAY				  ; A8 | Transfer accumulator to Y register
	REP #$20			 ; C2 20 | Reset processor status bits
	PLB				  ; AB | Pull data bank register from stack
	LDA $BC76,Y		  ; B9 76 BC | Read graphics status
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	AND $C079			; 2D 79 C0 | Logical AND with accumulator (absolute)
	STA $C089,X		  ; 9D 89 C0 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	SEP #$20			 ; E2 20 | Set processor status bits
	DEC $C07C			; CE 7C C0 | Decrement (absolute)
	BNE $99			  ; D0 99 | Branch if not equal
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_241
; Address: $C3BC65
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_241:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHX				  ; DA | Push X register to stack
	LDX #$1E			 ; A2 1E | Load immediate value into X register
	STZ $C089,X		  ; 9E 89 C0 | Store zero to absolute,X
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F9			  ; 10 F9 | Branch if positive
	PLX				  ; FA | Pull X register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_242
; Address: $C3BC77
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_242:
	BRA $00			  ; 80 00 | Branch always
	CPY #$00			 ; C0 00 | Compare Y register (immediate)
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BEQ $00			  ; F0 00 | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FF00,X		  ; FE 00 FF | Increment (absolute,X)
	BRA $FF			  ; 80 FF | Branch always
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	CPX #$FF			 ; E0 FF | Compare X register (immediate)
	BEQ $FF			  ; F0 FF | Branch if equal
	SED				  ; F8 | Set decimal mode flag
	INC $FFFF,X		  ; FE FF FF | Increment (absolute,X)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_243
; Address: $C3BC96
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_243:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	BIT $AD			  ; 24 AD | Test bits in accumulator (zero page)
	STA $09B4			; 8D B4 09 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_244
; Address: $C3BCA0
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_244:
	JSR $638D			; 20 8D 63 | Jump to subroutine
	LDX $02A9,Y		  ; BE A9 02 | Load from absolute,Y into X register
	STA $BE43			; 8D 43 BE | Update graphics data
	LDA $BE45			; AD 45 BE | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_246
; Address: $C3BCB0
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_246:
	JSL $C1BD72		  ; 22 72 BD C1 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FEC			; 8D EC 7F | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_24D
; Address: $C3BCD1
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_24D:
	JSR $638D			; 20 8D 63 | Jump to subroutine
	LDX $02A9,Y		  ; BE A9 02 | Load from absolute,Y into X register
	STA $BE43			; 8D 43 BE | Update graphics data
	LDA $BE45			; AD 45 BE | Read graphics status
	STA $C037			; 8D 37 C0 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_254
; Address: $C3BCFE
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_254:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $BE43			; AD 43 BE | Read graphics status
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $20			  ; D0 20 | Branch if not equal
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $7EEE5B		  ; AF 5B EE 7E | Read graphics status
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	STA $7EEE5B		  ; 8F 5B EE 7E | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $B48D			; AD 8D B4 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_255
; Address: $C3BD27
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_255:
	JSR $638D			; 20 8D 63 | Jump to subroutine
	LDX $7222,Y		  ; BE 22 72 | Load from absolute,Y into X register
	LDA $20C1,X		  ; BD C1 20 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_256
; Address: $C3BD30
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_256:
	DEC $7ABF,X		  ; DE BF 7A | Decrement (absolute,X)
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_257
; Address: $C3BD38
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_257:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $BE43			; AD 43 BE | Read graphics status
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BNE $20			  ; D0 20 | Branch if not equal
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $7EEE5B		  ; AF 5B EE 7E | Read graphics status
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	ORA #$0E			 ; 09 0E | Logical OR with accumulator (immediate)
	STA $7EEE5B		  ; 8F 5B EE 7E | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $B48F			; AD 8F B4 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_258
; Address: $C3BD61
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_258:
	JSR $638D			; 20 8D 63 | Jump to subroutine
	LDX $7222,Y		  ; BE 22 72 | Load from absolute,Y into X register
	LDA $20C1,X		  ; BD C1 20 | Read graphics status
	DEC $7ABF,X		  ; DE BF 7A | Decrement (absolute,X)
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_259
; Address: $C3BD72
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_259:
	JSL $C1BDC7		  ; 22 C7 BD C1 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Read graphics status
	STA $BE65			; 8D 65 BE | Update graphics data
	STZ $AE			  ; 64 AE | Store zero to zero page
	LDA $BE47			; AD 47 BE | Read graphics status
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $22			  ; F0 22 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_262
; Address: $C3BD9E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_262:
	JSR $BE0A			; 20 0A BE | Jump to subroutine
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $C035			; 8D 35 C0 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_26B
; Address: $C3BDC0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_26B:
	JSR $BE28			; 20 28 BE | Jump to subroutine
	STZ $C035			; 9C 35 C0 | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_26D
; Address: $C3BDCD
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_26D:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	CPY #$2A			 ; C0 2A | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA $C037			; AD 37 C0 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$F2			 ; 69 F2 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_26F
; Address: $C3BDEF
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_26F:
	JSR $BE82			; 20 82 BE | Jump to subroutine
	STA $0002,X		  ; 9D 02 00 | Update graphics data
	LDA #$E2			 ; A9 E2 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_271
; Address: $C3BDFB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_271:
	JSR $BE91			; 20 91 BE | Jump to subroutine
	LDA #$E1			 ; A9 E1 | Read graphics status
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_272
; Address: $C3BE01
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_272:
	JSR $BE82			; 20 82 BE | Jump to subroutine
	STA $003C,X		  ; 9D 3C 00 | Update graphics data
	JMP $BE8A			; 4C 8A BE | Jump to address
	LDA #$E1			 ; A9 E1 | Read graphics status
	BRA $20			  ; 80 20 | Branch always
	LDX $029D,Y		  ; BE 9D 02 | Load from absolute,Y into X register
	LDA #$E2			 ; A9 E2 | Read graphics status
	BRA $20			  ; 80 20 | Branch always
	LDX $9120,Y		  ; BE 20 91 | Load from absolute,Y into X register
	LDX $E1A9,Y		  ; BE A9 E1 | Load from absolute,Y into X register
	CPY #$20			 ; C0 20 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_273
; Address: $C3BE21
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_273:
	LDX $3C9D,Y		  ; BE 9D 3C | Load from absolute,Y into X register
	JMP $BE8A			; 4C 8A BE | Jump to address
	LDA #$E6			 ; A9 E6 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_274
; Address: $C3BE2B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_274:
	JSR $BE82			; 20 82 BE | Jump to subroutine
	STA $0002,X		  ; 9D 02 00 | Update graphics data
	STA $003C,X		  ; 9D 3C 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_275
; Address: $C3BE34
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_275:
	JSR $BE91			; 20 91 BE | Jump to subroutine
	JMP $BE8A			; 4C 8A BE | Jump to address
	LDA #$E3			 ; A9 E3 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_276
; Address: $C3BE3D
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_276:
	JSR $BE82			; 20 82 BE | Jump to subroutine
	STA $0002,X		  ; 9D 02 00 | Update graphics data
	LDA $AE			  ; A5 AE | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_278
; Address: $C3BE4A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_278:
	JSR $BEE6			; 20 E6 BE | Jump to subroutine
	LDA #$E3			 ; A9 E3 | Read graphics status
	RTI				  ; 40 | Return from interrupt

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_279
; Address: $C3BE50
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_279:
	JSR $BE82			; 20 82 BE | Jump to subroutine
	STA $003C,X		  ; 9D 3C 00 | Update graphics data
	LDA $AE			  ; A5 AE | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$20			 ; 69 20 | Add with carry (immediate)
	STA $AE			  ; 85 AE | Update graphics data
	JMP $BE8A			; 4C 8A BE | Jump to address
	LDA #$E6			 ; A9 E6 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_27A
; Address: $C3BE64
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_27A:
	JSR $BE82			; 20 82 BE | Jump to subroutine
	STA $0002,X		  ; 9D 02 00 | Update graphics data
	STA $003C,X		  ; 9D 3C 00 | Update graphics data
	LDA $AE			  ; A5 AE | Read graphics status
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_27C
; Address: $C3BE74
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_27C:
	JSR $BEE6			; 20 E6 BE | Jump to subroutine
	LDA $AE			  ; A5 AE | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$20			 ; 69 20 | Add with carry (immediate)
	STA $AE			  ; 85 AE | Update graphics data
	JMP $BE8A			; 4C 8A BE | Jump to address
	CLC				  ; 18 | Clear carry flag
	ADC $99F5			; 6D F5 99 | Add with carry (absolute)
	ORA $BE63			; 0D 63 BE | Logical OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_27D
; Address: $C3BE8A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_27D:
	TXA				  ; 8A | Transfer X register to accumulator
	CLC				  ; 18 | Clear carry flag
	ADC #$40			 ; 69 40 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_27F
; Address: $C3BE97
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_27F:
	STA $0008,X		  ; 9D 08 00 | Update graphics data
	STA $000A,X		  ; 9D 0A 00 | Update graphics data
	STA $000C,X		  ; 9D 0C 00 | Update graphics data
	STA $000E,X		  ; 9D 0E 00 | Update graphics data
	STA $0010,X		  ; 9D 10 00 | Update graphics data
	STA $0012,X		  ; 9D 12 00 | Update graphics data
	STA $0014,X		  ; 9D 14 00 | Update graphics data
	STA $0016,X		  ; 9D 16 00 | Update graphics data
	STA $0018,X		  ; 9D 18 00 | Update graphics data
	STA $001A,X		  ; 9D 1A 00 | Update graphics data
	STA $001C,X		  ; 9D 1C 00 | Update graphics data
	STA $001E,X		  ; 9D 1E 00 | Update graphics data
	STA $0020,X		  ; 9D 20 00 | Update graphics data
	STA $0022,X		  ; 9D 22 00 | Update graphics data
	STA $0024,X		  ; 9D 24 00 | Update graphics data
	STA $0026,X		  ; 9D 26 00 | Update graphics data
	STA $0028,X		  ; 9D 28 00 | Update graphics data
	STA $002A,X		  ; 9D 2A 00 | Update graphics data
	STA $002C,X		  ; 9D 2C 00 | Update graphics data
	STA $002E,X		  ; 9D 2E 00 | Update graphics data
	STA $0030,X		  ; 9D 30 00 | Update graphics data
	STA $0032,X		  ; 9D 32 00 | Update graphics data
	STA $0034,X		  ; 9D 34 00 | Update graphics data
	STA $0036,X		  ; 9D 36 00 | Update graphics data
	STA $0038,X		  ; 9D 38 00 | Update graphics data
	STA $003A,X		  ; 9D 3A 00 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_280
; Address: $C3BEE6
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_280:
	STA $0004,X		  ; 9D 04 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0006,X		  ; 9D 06 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0008,X		  ; 9D 08 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $000A,X		  ; 9D 0A 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $000C,X		  ; 9D 0C 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $000E,X		  ; 9D 0E 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0010,X		  ; 9D 10 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0012,X		  ; 9D 12 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0014,X		  ; 9D 14 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0016,X		  ; 9D 16 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0018,X		  ; 9D 18 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $001A,X		  ; 9D 1A 00 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_281
; Address: $C3BF15
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_281:
	INC				  ; 1A | Increment accumulator
	STA $001C,X		  ; 9D 1C 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $001E,X		  ; 9D 1E 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0020,X		  ; 9D 20 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0022,X		  ; 9D 22 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0024,X		  ; 9D 24 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0026,X		  ; 9D 26 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0028,X		  ; 9D 28 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $002A,X		  ; 9D 2A 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $002C,X		  ; 9D 2C 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $002E,X		  ; 9D 2E 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0030,X		  ; 9D 30 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0032,X		  ; 9D 32 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0034,X		  ; 9D 34 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0036,X		  ; 9D 36 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $0038,X		  ; 9D 38 00 | Update graphics data
	INC				  ; 1A | Increment accumulator
	STA $003A,X		  ; 9D 3A 00 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_282
; Address: $C3BF56
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_282:
	LDA #$10			 ; A9 10 | Read graphics status
	STA $BDEF			; 8D EF BD | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $BDF1			; 8D F1 BD | Update graphics data
	LDX #$FE			 ; A2 FE | Load immediate value into X register
	ASL $9E			  ; 06 9E | Arithmetic shift left (zero page)
	DEX				  ; CA | Decrement X register
	DEX				  ; CA | Decrement X register
	BPL $F9			  ; 10 F9 | Branch if positive
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_283
; Address: $C3BF6D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_283:
	JSR $BF81			; 20 81 BF | Jump to subroutine
	LDA $C037			; AD 37 C0 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	INC $C039,X		  ; FE 39 C0 | Increment (absolute,X)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_284
; Address: $C3BF7C
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_284:
	INX				  ; E8 | Increment X register
	DEY				  ; 88 | Decrement Y register
	BNE $F8			  ; D0 F8 | Branch if not equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_285
; Address: $C3BF81
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_285:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $C039,X		  ; 9E 39 C0 | Store zero to absolute,X
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$40			 ; E0 40 | Compare X register (immediate)
	BCC $F6			  ; 90 F6 | Branch if carry clear
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_287
; Address: $C3BF92
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_287:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$2A			 ; C0 2A | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 60 AD BF | Read graphics status
	LDA				  ; BF CA BF 22 | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_28A
; Address: $C3BFB6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_28A:
	JSL $C1C014		  ; 22 14 C0 C1 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$9F			 ; A9 9F | Read graphics status
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_28D
; Address: $C3BFCA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_28D:
	JSL $C1C014		  ; 22 14 C0 C1 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$9F			 ; A9 9F | Read graphics status
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_291
; Address: $C3BFE1
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_291:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$2A			 ; C0 2A | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF 60 FC BF | Read graphics status
	SBC $11BF,X		  ; FD BF 11 | Subtract with carry (absolute,X)
	CPY #$60			 ; C0 60 | Compare Y register (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_292
; Address: $C3BFFD
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_292:
	JSL $C1C014		  ; 22 14 C0 C1 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$9F			 ; A9 9F | Read graphics status
	LDY #$40			 ; A0 40 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_295
; Address: $C3C011
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_295:
	JMP $BFB2			; 4C B2 BF | Jump to address
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX $99D9			; AE D9 99 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_296
; Address: $C3C019
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_296:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$2A			 ; C0 2A | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_297
; Address: $C3C02A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_297:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$32			 ; C0 32 | Compare Y register (immediate)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_298
; Address: $C3C039
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_298:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$32			 ; C0 32 | Compare Y register (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LDA $C037			; AD 37 C0 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($FA,X)		  ; 01 FA | Logical OR with accumulator ((zero page,X))
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_29A
; Address: $C3C057
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_29A:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	CPY #$2A			 ; C0 2A | Compare Y register (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	JMP ($60C0)		  ; 6C C0 60 | Jump to address (absolute indirect)
	CPY #$76			 ; C0 76 | Compare Y register (immediate)
	CPY #$24			 ; C0 24 | Compare Y register (immediate)
	CMP ($20,X)		  ; C1 20 | Compare accumulator ((zero page,X))
	STA ($BF,X)		  ; 81 BF | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_29B
; Address: $C3C076
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_29B:
	JSR $BF6D			; 20 6D BF | Jump to subroutine
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $EE4F			; AD 4F EE | Read graphics status
	AND #$FC			 ; 29 FC | Logical AND with accumulator (immediate)
	ORA #$01			 ; 09 01 | Logical OR with accumulator (immediate)
	STA $EE54			; 8D 54 EE | Update graphics data
	LDA $EE3F			; AD 3F EE | Read graphics status
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	STA $EE47			; 8D 47 EE | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_29C
; Address: $C3C08D
; Size: 117 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_29C:
	LDA $EE40			; AD 40 EE | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	STA $EE48			; 8D 48 EE | Update graphics data
	LDA $EE41			; AD 41 EE | Read graphics status
	ORA #$07			 ; 09 07 | Logical OR with accumulator (immediate)
	STA $EE49			; 8D 49 EE | Update graphics data
	LDA $EE42			; AD 42 EE | Read graphics status
	AND #$F8			 ; 29 F8 | Logical AND with accumulator (immediate)
	STA $EE4A			; 8D 4A EE | Update graphics data
	LDA $EE55			; AD 55 EE | Read graphics status
	STA $EE57			; 8D 57 EE | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $EE58			; 8D 58 EE | Update graphics data
	LDA $EE59			; AD 59 EE | Read graphics status
	AND #$F0			 ; 29 F0 | Logical AND with accumulator (immediate)
	ORA #$0C			 ; 09 0C | Logical OR with accumulator (immediate)
	STA $EE5B			; 8D 5B EE | Update graphics data
	LDA $EE5A			; AD 5A EE | Read graphics status
	STA $EE5C			; 8D 5C EE | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	ADC ($EE,X)		  ; 61 EE | Add with carry ((zero page,X))
	LDA $C037			; AD 37 C0 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $EE63			; 8D 63 EE | Update graphics data
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	LDA $C037			; AD 37 C0 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $C037			; 6D 37 C0 | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	DEY				  ; 88 | Decrement Y register
	BMI $3E			  ; 30 3E | Branch if negative
	LDA #$08			 ; A9 08 | Read graphics status
	STA $EB29,X		  ; 9D 29 EB | Update graphics data
	STA $EB89,X		  ; 9D 89 EB | Update graphics data
	STA $EBE9,X		  ; 9D E9 EB | Update graphics data
	STA $EC49,X		  ; 9D 49 EC | Update graphics data
	STA $ECA9,X		  ; 9D A9 EC | Update graphics data
	STA $ED09,X		  ; 9D 09 ED | Update graphics data
	LDA #$47			 ; A9 47 | Read graphics status
	INC $2A9D			; EE 9D 2A | Increment (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$54			 ; A9 54 | Read graphics status
	INC $8A9D			; EE 9D 8A | Increment (absolute)
	XBA				  ; EB | Exchange accumulator bytes

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_29D
; Address: $C3C106
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_29D:
	LDA #$57			 ; A9 57 | Read graphics status
	INC $EA9D			; EE 9D EA | Increment (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$5B			 ; A9 5B | Read graphics status
	INC $4A9D			; EE 9D 4A | Increment (absolute)
	CPX $61A9			; EC A9 61 | Compare X register (absolute)
	INC $AA9D			; EE 9D AA | Increment (absolute)
	CPX $63A9			; EC A9 63 | Compare X register (absolute)
	INC $0A9D			; EE 9D 0A | Increment (absolute)
	SBC $E8E8			; ED E8 E8 | Subtract with carry (absolute)
	INX				  ; E8 | Increment X register
	BRA $BF			  ; 80 BF | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_29E
; Address: $C3C124
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_29E:
	JSR $BF6D			; 20 6D BF | Jump to subroutine
	LDA $7F94			; AD 94 7F | Read graphics status
	AND #$FC			 ; 29 FC | Logical AND with accumulator (immediate)
	STA $7F94			; 8D 94 7F | Update graphics data
	STZ $7FA0			; 9C A0 7F | Store zero to absolute
	STZ $7FA8			; 9C A8 7F | Store zero to absolute
	DEC $7FA8			; CE A8 7F | Decrement (absolute)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_29F
; Address: $C3C139
; Size: 65 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_29F:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$09			 ; A9 09 | Read graphics status
	STA $EE50			; 8D 50 EE | Update graphics data
	LDA #$04			 ; A9 04 | Read graphics status
	STA $EE47			; 8D 47 EE | Update graphics data
	STA $EE49			; 8D 49 EE | Update graphics data
	STZ $EE48			; 9C 48 EE | Store zero to absolute
	STZ $EE4A			; 9C 4A EE | Store zero to absolute
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$09			 ; A0 09 | Load immediate value into Y register
	LDA $C037			; AD 37 C0 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $C037			; 6D 37 C0 | Add with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	DEY				  ; 88 | Decrement Y register
	BMI $1A			  ; 30 1A | Branch if negative
	LDA #$08			 ; A9 08 | Read graphics status
	STA $EB29,X		  ; 9D 29 EB | Update graphics data
	STA $EB89,X		  ; 9D 89 EB | Update graphics data
	LDA #$47			 ; A9 47 | Read graphics status
	INC $2A9D			; EE 9D 2A | Increment (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$50			 ; A9 50 | Read graphics status
	INC $8A9D			; EE 9D 8A | Increment (absolute)
	XBA				  ; EB | Exchange accumulator bytes
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $E3			  ; 80 E3 | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2A1
; Address: $C3C17D
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2A1:
	JSL $C012E3		  ; 22 E3 12 C0 | Jump to subroutine long
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BCS $36			  ; B0 36 | Branch if carry set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PHY				  ; 5A | Push Y register to stack
	LDA $DAC7,Y		  ; B9 C7 DA | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $22			  ; F0 22 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2A3
; Address: $C3C199
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2A3:
	JSL $C44151		  ; 22 51 41 C4 | Jump to subroutine long
	ORA ($A8,X)		  ; 01 A8 | Logical OR with accumulator ((zero page,X))
	LDA $DAA5,Y		  ; B9 A5 DA | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C525,Y		  ; B9 25 C5 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA #$40			 ; A9 40 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	ORA ($99,X)		  ; 01 99 | Logical OR with accumulator ((zero page,X))
	AND $C5			  ; 25 C5 | Logical AND with accumulator (zero page)
	PLA				  ; 68 | Pull accumulator from stack
	PLY				  ; 7A | Pull Y register from stack
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$10			 ; C0 10 | Compare Y register (immediate)
	BCC $CD			  ; 90 CD | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2A4
; Address: $C3C1BD
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2A4:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $7E99C5		  ; AF C5 99 7E | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA $3532			; AD 32 35 | Read graphics status
	BEQ $25			  ; F0 25 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	BEQ $09			  ; F0 09 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	BRA $06			  ; 80 06 | Branch always
	LDA $3532			; AD 32 35 | Read graphics status
	BEQ $1A			  ; F0 1A | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	STA $3532			; 8D 32 35 | Update graphics data
	BNE $14			  ; D0 14 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2A5
; Address: $C3C1DF
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2A5:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	ROL $2200			; 2E 00 22 | Rotate left (absolute)
	BIT $38			  ; 24 38 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2A7
; Address: $C3C1EF
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2A7:
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2A8
; Address: $C3C1F7
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2A8:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $98AF			; AD AF 98 | Read graphics status
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BCS $53			  ; B0 53 | Branch if carry set
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $4E			  ; F0 4E | Branch if equal
	LDA $7E99C5		  ; AF C5 99 7E | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA $3534			; AD 34 35 | Read graphics status
	BEQ $40			  ; F0 40 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	BEQ $09			  ; F0 09 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	BRA $06			  ; 80 06 | Branch always
	LDA $3534			; AD 34 35 | Read graphics status
	BEQ $35			  ; F0 35 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	STA $3534			; 8D 34 35 | Update graphics data
	BNE $2F			  ; D0 2F | Branch if not equal
	LDA $7E353B		  ; AF 3B 35 7E | Read graphics status
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BEQ $08			  ; F0 08 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2A9
; Address: $C3C22F
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2A9:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	AND $8000			; 2D 00 80 | Logical AND with accumulator (absolute)
	ASL $22			  ; 06 22 | Arithmetic shift left (zero page)
	LDX $C737,Y		  ; BE 37 C7 | Load from absolute,Y into X register
	BIT $2200			; 2C 00 22 | Test bits in accumulator (absolute)
	BIT $38			  ; 24 38 | Test bits in accumulator (zero page)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2AB
; Address: $C3C24B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2AB:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ROR $0040,X		  ; 7E 40 00 | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2AC
; Address: $C3C259
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2AC:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $7E99C5		  ; AF C5 99 7E | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2AD
; Address: $C3C263
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2AD:
	BEQ $0B			  ; F0 0B | Branch if equal
	LDA $3536			; AD 36 35 | Read graphics status
	BEQ $11			  ; F0 11 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	BEQ $09			  ; F0 09 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	BRA $06			  ; 80 06 | Branch always
	LDA $3536			; AD 36 35 | Read graphics status
	BEQ $06			  ; F0 06 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	STA $3536			; 8D 36 35 | Update graphics data
	BEQ $04			  ; F0 04 | Branch if equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2AE
; Address: $C3C27F
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2AE:
	LDA $7E353B		  ; AF 3B 35 7E | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BNE $39			  ; D0 39 | Branch if not equal
	LDA $7E353B		  ; AF 3B 35 7E | Read graphics status
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $57			  ; D0 57 | Branch if not equal
	LDA $7E353B		  ; AF 3B 35 7E | Read graphics status
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BEQ $E1			  ; F0 E1 | Branch if equal
	LDA $DB05			; AD 05 DB | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $04			  ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2B3
; Address: $C3C2BA
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2B3:
	JSL $C73824		  ; 22 24 38 C7 | Jump to subroutine long
	JMP $C27B			; 4C 7B C2 | Jump to address
	LDA $DB05			; AD 05 DB | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $04			  ; D0 04 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2B9
; Address: $C3C2E8
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2B9:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ROR $0020,X		  ; 7E 20 00 | Rotate right (absolute,X)
	LDA $DB05			; AD 05 DB | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2C0
; Address: $C3C319
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2C0:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	LDX #$21			 ; A2 21 | PPU graphics register access
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $0B			  ; 90 0B | Branch if carry clear
	LDA $353B			; AD 3B 35 | Read graphics status
	ORA #$10			 ; 09 10 | Logical OR with accumulator (immediate)
	STA $353B			; 8D 3B 35 | Update graphics data
	BRA $0C			  ; 80 0C | Branch always
	LDA #$10			 ; A9 10 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $353B			; 2D 3B 35 | Logical AND with accumulator (absolute)
	STA $353B			; 8D 3B 35 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2C1
; Address: $C3C342
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2C1:
	JSL $C62DD5		  ; 22 D5 2D C6 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	BMI $03			  ; 30 03 | Branch if negative
	BRA $FA			  ; 80 FA | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	BCC $01			  ; 90 01 | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	DEX				  ; CA | Decrement X register
	BNE $C7			  ; D0 C7 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2C2
; Address: $C3C35F
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2C2:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	SBC #$00			 ; E9 00 | Subtract with carry (immediate)
	LDX #$21			 ; A2 21 | PPU graphics register access
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2C3
; Address: $C3C36F
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2C3:
	BCC $0B			  ; 90 0B | Branch if carry clear
	LDA $353B			; AD 3B 35 | Read graphics status
	ORA #$40			 ; 09 40 | Logical OR with accumulator (immediate)
	STA $353B			; 8D 3B 35 | Update graphics data
	BRA $0C			  ; 80 0C | Branch always
	LDA #$40			 ; A9 40 | Read graphics status
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	AND $353B			; 2D 3B 35 | Logical AND with accumulator (absolute)
	STA $353B			; 8D 3B 35 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2C4
; Address: $C3C388
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2C4:
	JSL $C62DD5		  ; 22 D5 2D C6 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	TYA				  ; 98 | Transfer Y register to accumulator
	XBA				  ; EB | Exchange accumulator bytes
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	DEC				  ; 3A | Decrement accumulator
	BMI $03			  ; 30 03 | Branch if negative
	BRA $FA			  ; 80 FA | Branch always
	TYA				  ; 98 | Transfer Y register to accumulator
	SEC				  ; 38 | Set carry flag
	SBC #$40			 ; E9 40 | Subtract with carry (immediate)
	BCC $01			  ; 90 01 | Branch if carry clear
	TAY				  ; A8 | Transfer accumulator to Y register
	DEX				  ; CA | Decrement X register
	BNE $C7			  ; D0 C7 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2C6
; Address: $C3C3A6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2C6:
	JSR $C3F8			; 20 F8 C3 | Jump to subroutine
	CMP #$10			 ; C9 10 | Compare accumulator (immediate)
	BCS $0F			  ; B0 0F | Branch if carry set
	LDA $7EC206		  ; AF 06 C2 7E | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	LDX #$01			 ; A2 01 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2C8
; Address: $C3C3BE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2C8:
	JSR $C3F8			; 20 F8 C3 | Jump to subroutine
	CMP #$70			 ; C9 70 | Compare accumulator (immediate)
	BCS $0F			  ; B0 0F | Branch if carry set
	LDA $7EC206		  ; AF 06 C2 7E | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $06			  ; F0 06 | Branch if equal
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2CA
; Address: $C3C3D6
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2CA:
	JSR $C3F8			; 20 F8 C3 | Jump to subroutine
	CMP #$D0			 ; C9 D0 | Compare accumulator (immediate)
	BCS $0F			  ; B0 0F | Branch if carry set
	LDA $7EC206		  ; AF 06 C2 7E | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2D1
; Address: $C3C403
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2D1:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPX $F2			  ; E4 F2 | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $14			  ; F0 14 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2D2
; Address: $C3C417
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2D2:
	JSR $C49B			; 20 9B C4 | Jump to subroutine
	PHA				  ; 48 | Push accumulator to stack
	LDA $DB1B			; AD 1B DB | Read graphics status
	SEC				  ; 38 | Set carry flag
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	BRA $03			  ; 80 03 | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2D4
; Address: $C3C42F
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2D4:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPX $F2			  ; E4 F2 | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	INC $C903			; EE 03 C9 | Increment (absolute)
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPX $F2			  ; E4 F2 | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	STA $1C			  ; 85 1C | Update graphics data
	STZ $18			  ; 64 18 | Store zero to zero page
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $1A			  ; 85 1A | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2D5
; Address: $C3C460
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2D5:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	ORA ($14,X)		  ; 01 14 | Logical OR with accumulator ((zero page,X))
	ORA $B6			  ; 05 B6 | Logical OR with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2D6
; Address: $C3C469
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2D6:
	INY				  ; C8 | Increment Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	BEQ $1C			  ; F0 1C | Branch if equal
	LDA $1C			  ; A5 1C | Read graphics status
	SEC				  ; 38 | Set carry flag
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	CMP $1A			  ; C5 1A | Compare accumulator (zero page)
	BEQ $08			  ; F0 08 | Branch if equal
	BCS $0F			  ; B0 0F | Branch if carry set
	STA $1A			  ; 85 1A | Update graphics data
	STY $18			  ; 84 18 | Store Y register to zero page
	BRA $09			  ; 80 09 | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2D7
; Address: $C3C485
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2D7:
	JSL $C012D1		  ; 22 D1 12 C0 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	BCC $02			  ; 90 02 | Branch if carry clear
	STY $18			  ; 84 18 | Store Y register to zero page
	PLA				  ; 68 | Pull accumulator from stack
	INY				  ; C8 | Increment Y register
	CPY #$69			 ; C0 69 | Compare Y register (immediate)
	BCC $CB			  ; 90 CB | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2D8
; Address: $C3C49B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2D8:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPX $F2			  ; E4 F2 | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2D9
; Address: $C3C4A8
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2D9:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	CPX $F2			  ; E4 F2 | Compare X register (zero page)
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	ROL $C013,X		  ; 3E 13 C0 | Rotate left (absolute,X)
	CLC				  ; 18 | Clear carry flag
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2DB
; Address: $C3C4C5
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2DB:
	JSL $C43041		  ; 22 41 30 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	CLC				  ; 18 | Clear carry flag
	LDX #$18			 ; A2 18 | Load immediate value into X register
	LDA #$03			 ; A9 03 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2DC
; Address: $C3C4D2
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2DC:
	JSL $C0121C		  ; 22 1C 12 C0 | Jump to subroutine long
	LDA $18			  ; A5 18 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2DF
; Address: $C3C4DF
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2DF:
	JSL $C43305		  ; 22 05 33 C4 | Jump to subroutine long
	ORA ($FF,X)		  ; 01 FF | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	BNE $03			  ; D0 03 | Branch if not equal
	LDA #$01			 ; A9 01 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2E2
; Address: $C3C4F7
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2E2:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY $99C7			; AC C7 99 | Load from absolute address into Y register
	CMP $8D			  ; C5 8D | Compare accumulator (zero page)
	CMP ($C9,X)		  ; C1 C9 | Compare accumulator ((zero page,X))
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C1F9			; 8D F9 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2E3
; Address: $C3C512
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2E3:
	ROL				  ; 2A | Rotate left (accumulator)
	CMP $69			  ; C5 69 | Compare accumulator (zero page)
	CMP $A8			  ; C5 A8 | Compare accumulator (zero page)
	CMP $E7			  ; C5 E7 | Compare accumulator (zero page)
	CMP $26			  ; C5 26 | Compare accumulator (zero page)
	DEC $65			  ; C6 65 | Decrement (zero page)
	DEC $A4			  ; C6 A4 | Decrement (zero page)
	DEC $E3			  ; C6 E3 | Decrement (zero page)
	DEC $22			  ; C6 22 | Decrement (zero page)
	ADC ($C7,X)		  ; 61 C7 | Add with carry ((zero page,X))
	LDY #$C7			 ; A0 C7 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2E4
; Address: $C3C52A
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2E4:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	BEQ $0F			  ; F0 0F | Branch if equal
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2A			  ; F0 2A | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2E5
; Address: $C3C53F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2E5:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ORA $7000			; 0D 00 70 | Logical OR with accumulator (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2E6
; Address: $C3C54F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2E6:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	EOR ($F5),Y		  ; 51 F5 | Exclusive OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2E7
; Address: $C3C55C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2E7:
	JSL $C0135F		  ; 22 5F 13 C0 | Jump to subroutine long
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2E9
; Address: $C3C569
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2E9:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ORA $8000			; 0D 00 80 | Logical OR with accumulator (absolute)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2A			  ; F0 2A | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2EA
; Address: $C3C57E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2EA:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ASL $8000			; 0E 00 80 | Arithmetic shift left (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2EB
; Address: $C3C58E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2EB:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	EOR ($F5),Y		  ; 51 F5 | Exclusive OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2EC
; Address: $C3C59B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2EC:
	JSL $C0135F		  ; 22 5F 13 C0 | Jump to subroutine long
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2ED
; Address: $C3C5A8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2ED:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2A			  ; F0 2A | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2EE
; Address: $C3C5BD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2EE:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	BPL $00			  ; 10 00 | Branch if positive
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2EF
; Address: $C3C5CD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2EF:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	EOR ($F5),Y		  ; 51 F5 | Exclusive OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2F0
; Address: $C3C5DA
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2F0:
	JSL $C0135F		  ; 22 5F 13 C0 | Jump to subroutine long
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2F1
; Address: $C3C5E7
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2F1:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	BPL $00			  ; 10 00 | Branch if positive
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2A			  ; F0 2A | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2F2
; Address: $C3C5FC
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2F2:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ORA ($00),Y		  ; 11 00 | Logical OR with accumulator ((zero page),Y)
	CPX #$00			 ; E0 00 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2F4
; Address: $C3C60C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2F4:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	EOR ($F5),Y		  ; 51 F5 | Exclusive OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2F5
; Address: $C3C619
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2F5:
	JSL $C0135F		  ; 22 5F 13 C0 | Jump to subroutine long
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2F6
; Address: $C3C626
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2F6:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2A			  ; F0 2A | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2F7
; Address: $C3C63B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2F7:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2F8
; Address: $C3C64B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2F8:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	EOR ($F5),Y		  ; 51 F5 | Exclusive OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2F9
; Address: $C3C658
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2F9:
	JSL $C0135F		  ; 22 5F 13 C0 | Jump to subroutine long
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2FA
; Address: $C3C665
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2FA:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2A			  ; F0 2A | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2FB
; Address: $C3C67A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2FB:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	SEC				  ; 38 | Set carry flag
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2FC
; Address: $C3C68A
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2FC:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	EOR ($F5),Y		  ; 51 F5 | Exclusive OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2FD
; Address: $C3C697
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2FD:
	JSL $C0135F		  ; 22 5F 13 C0 | Jump to subroutine long
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_2FE
; Address: $C3C6A4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_2FE:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_300
; Address: $C3C6B9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_300:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	CPY #$01			 ; C0 01 | Compare Y register (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_301
; Address: $C3C6C9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_301:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	EOR ($F5),Y		  ; 51 F5 | Exclusive OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_302
; Address: $C3C6D6
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_302:
	JSL $C0135F		  ; 22 5F 13 C0 | Jump to subroutine long
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_303
; Address: $C3C6E3
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_303:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2A			  ; F0 2A | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_304
; Address: $C3C6F8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_304:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ASL $0000			; 0E 00 00 | Arithmetic shift left (absolute)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_305
; Address: $C3C708
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_305:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	EOR ($F5),Y		  ; 51 F5 | Exclusive OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_306
; Address: $C3C715
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_306:
	JSL $C0135F		  ; 22 5F 13 C0 | Jump to subroutine long
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_307
; Address: $C3C722
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_307:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	BEQ $0F			  ; F0 0F | Branch if equal
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2A			  ; F0 2A | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_308
; Address: $C3C737
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_308:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	BVS $00			  ; 70 00 | Branch if overflow set
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_309
; Address: $C3C747
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_309:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	EOR ($F5),Y		  ; 51 F5 | Exclusive OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_30B
; Address: $C3C758
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_30B:
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_30C
; Address: $C3C761
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_30C:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	BRA $7F			  ; 80 7F | Branch always
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2A			  ; F0 2A | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_30D
; Address: $C3C776
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_30D:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ORA $8000,Y		  ; 19 00 80 | Logical OR with accumulator (absolute,Y)
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_30E
; Address: $C3C786
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_30E:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	EOR ($F5),Y		  ; 51 F5 | Exclusive OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_30F
; Address: $C3C793
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_30F:
	JSL $C0135F		  ; 22 5F 13 C0 | Jump to subroutine long
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_310
; Address: $C3C7A0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_310:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	INC				  ; 1A | Increment accumulator
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2A			  ; F0 2A | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_311
; Address: $C3C7B5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_311:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_312
; Address: $C3C7C5
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_312:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	EOR ($F5),Y		  ; 51 F5 | Exclusive OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_313
; Address: $C3C7D2
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_313:
	JSL $C0135F		  ; 22 5F 13 C0 | Jump to subroutine long
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_314
; Address: $C3C7DF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_314:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $2A			  ; F0 2A | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_317
; Address: $C3C804
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_317:
	JSL $C903E2		  ; 22 E2 03 C9 | Jump to subroutine long
	EOR ($F5),Y		  ; 51 F5 | Exclusive OR with accumulator ((zero page),Y)
	INY				  ; C8 | Increment Y register
	DEC				  ; 3A | Decrement accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_318
; Address: $C3C811
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_318:
	JSL $C0135F		  ; 22 5F 13 C0 | Jump to subroutine long
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_31A
; Address: $C3C821
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_31A:
	JSL $C0133E		  ; 22 3E 13 C0 | Jump to subroutine long
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDY $99C7			; AC C7 99 | Load from absolute address into Y register
	INY				  ; C8 | Increment Y register
	STA $C1F5			; 8D F5 C1 | Update graphics data
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C1F9			; 8D F9 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_31B
; Address: $C3C83D
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_31B:
	INY				  ; C8 | Increment Y register
	STZ $C8			  ; 64 C8 | Store zero to zero page
	INY				  ; C8 | Increment Y register
	STY $C8			  ; 84 C8 | Store Y register to zero page
	INY				  ; C8 | Increment Y register
	LDY $C8			  ; A4 C8 | Load from zero page into Y register
	INY				  ; C8 | Increment Y register
	CPY $C8			  ; C4 C8 | Compare Y register (zero page)
	INY				  ; C8 | Increment Y register
	CPX $C8			  ; E4 C8 | Compare X register (zero page)
	PEA #$04C8		   ; F4 C8 04 | Push effective address to stack
	CMP #$22			 ; C9 22 | Compare accumulator (immediate)
	ROR $05			  ; 66 05 | Rotate right (zero page)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	INY				  ; C8 | Increment Y register
	BEQ $0F			  ; F0 0F | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_31C
; Address: $C3C864
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_31C:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ORA $8000			; 0D 00 80 | Logical OR with accumulator (absolute)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_31D
; Address: $C3C874
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_31D:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_31E
; Address: $C3C884
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_31E:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_320
; Address: $C3C894
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_320:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_321
; Address: $C3C8A4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_321:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_322
; Address: $C3C8B4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_322:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	CPY #$3F			 ; C0 3F | Compare Y register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_323
; Address: $C3C8C4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_323:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	INC $0001,X		  ; FE 01 00 | Increment (absolute,X)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_324
; Address: $C3C8D4
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_324:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	BEQ $0F			  ; F0 0F | Branch if equal
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_325
; Address: $C3C8E4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_325:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	CLC				  ; 18 | Clear carry flag
	BRA $7F			  ; 80 7F | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_326
; Address: $C3C8F4
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_326:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	INC				  ; 1A | Increment accumulator
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_327
; Address: $C3C904
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_327:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	CPX #$1F			 ; E0 1F | Compare X register (immediate)
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_329
; Address: $C3C917
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_329:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	BEQ $FF			  ; F0 FF | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_32A
; Address: $C3C927
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_32A:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	BEQ $FF			  ; F0 FF | Branch if equal
	SEC				  ; 38 | Set carry flag
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	CMP ($68,X)		  ; C1 68 | Compare accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_32C
; Address: $C3C948
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_32C:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	PHP				  ; 08 | Push processor status to stack
	BEQ $FF			  ; F0 FF | Branch if equal
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_32D
; Address: $C3C958
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_32D:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	BEQ $FF			  ; F0 FF | Branch if equal
	SEC				  ; 38 | Set carry flag
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CPY #$18			 ; C0 18 | Compare Y register (immediate)
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	CMP ($68,X)		  ; C1 68 | Compare accumulator ((zero page,X))
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_32F
; Address: $C3C97C
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_32F:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	INY				  ; C8 | Increment Y register
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $11			  ; F0 11 | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $13			  ; F0 13 | Branch if equal
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $15			  ; F0 15 | Branch if equal
	LDX #$04			 ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_337
; Address: $C3C9B3
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_337:
	LDA $C1DD			; AD DD C1 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_338
; Address: $C3C9BA
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_338:
	STZ $C1EF			; 9C EF C1 | Store zero to absolute
	LDA $C1FFFE		  ; AF FE FF C1 | Read graphics status
	BPL $1F			  ; 10 1F | Branch if positive
	STZ $33B8			; 9C B8 33 | Store zero to absolute
	STZ $33BA			; 9C BA 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_339
; Address: $C3C9C9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_339:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	LDX #$B0			 ; A2 B0 | Load immediate value into X register
	ASL $BCAD			; 0E AD BC | Arithmetic shift left (absolute)
	CMP #$31			 ; C9 31 | Compare accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_33A
; Address: $C3C9D6
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_33A:
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA #$30			 ; A9 30 | Read graphics status
	STA $C1EF			; 8D EF C1 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_33E
; Address: $C3C9F5
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_33E:
	JSL $C90501		  ; 22 01 05 C9 | Jump to subroutine long
	BMI $00			  ; 30 00 | Branch if negative
	PEA #$C8F1		   ; F4 F1 C8 | Push effective address to stack
	LDA $C1EF			; AD EF C1 | Read graphics status
	BEQ $03			  ; F0 03 | Branch if equal
	DEC				  ; 3A | Decrement accumulator
	BRA $26			  ; 80 26 | Branch always
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $18			  ; 85 18 | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $1A			  ; 85 1A | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $1C			  ; 85 1C | Update graphics data
	STZ $1E			  ; 64 1E | Store zero to zero page

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_342
; Address: $C3CA25
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_342:
	JSL $C01396		  ; 22 96 13 C0 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	LDA #$00			 ; A9 00 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$00			 ; 69 00 | Add with carry (immediate)
	TAY				  ; A8 | Transfer accumulator to Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_343
; Address: $C3CA3C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_343:
	JSL $C56D29		  ; 22 29 6D C5 | Jump to subroutine long
	BCS $06			  ; B0 06 | Branch if carry set
	LDA #$1E			 ; A9 1E | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_346
; Address: $C3CA4C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_346:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	INY				  ; C8 | Increment Y register
	AND #$00			 ; 29 00 | Logical AND with accumulator (immediate)
	BRA $FF			  ; 80 FF | Branch always
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $06			  ; D0 06 | Branch if not equal
	LDA #$1F			 ; A9 1F | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_34B
; Address: $C3CA6E
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_34B:
	PHA				  ; 48 | Push accumulator to stack
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDX #$00			 ; A2 00 | Load immediate value into X register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	ORA ($D0,X)		  ; 01 D0 | Logical OR with accumulator ((zero page,X))
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	LSR				  ; 4A | Logical shift right (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_34C
; Address: $C3CA8C
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_34C:
	JSL $C014F2		  ; 22 F2 14 C0 | Jump to subroutine long
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	CLC				  ; 18 | Clear carry flag
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	INY				  ; C8 | Increment Y register
	INX				  ; E8 | Increment X register
	CPX #$30			 ; E0 30 | Compare X register (immediate)
	BCC $D5			  ; 90 D5 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_34D
; Address: $C3CAA2
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_34D:
	LDA #$01			 ; A9 01 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_34E
; Address: $C3CAA9
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_34E:
	LDA #$02			 ; A9 02 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_34F
; Address: $C3CAB0
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_34F:
	LDA #$03			 ; A9 03 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_350
; Address: $C3CAB7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_350:
	LDA #$04			 ; A9 04 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_351
; Address: $C3CABE
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_351:
	LDA #$05			 ; A9 05 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_352
; Address: $C3CAC5
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_352:
	LDA #$06			 ; A9 06 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_355
; Address: $C3CAD3
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_355:
	LDA #$64			 ; A9 64 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_356
; Address: $C3CADA
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_356:
	LDA #$96			 ; A9 96 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_357
; Address: $C3CAE1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_357:
	LDA #$C8			 ; A9 C8 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_358
; Address: $C3CAE8
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_358:
	LDA #$FA			 ; A9 FA | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_359
; Address: $C3CAEF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_359:
	LDA #$2C			 ; A9 2C | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	CMP ($6B,X)		  ; C1 6B | Compare accumulator ((zero page,X))
	LDA #$F4			 ; A9 F4 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	CMP ($6B,X)		  ; C1 6B | Compare accumulator ((zero page,X))
	LDA #$E8			 ; A9 E8 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_35A
; Address: $C3CB04
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_35A:
	LDA #$D0			 ; A9 D0 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_35B
; Address: $C3CB0B
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_35B:
	LDA #$B8			 ; A9 B8 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_35C
; Address: $C3CB12
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_35C:
	LDA #$88			 ; A9 88 | Read graphics status
	STA $C1F5			; 8D F5 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_35D
; Address: $C3CB19
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_35D:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_35E
; Address: $C3CB20
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_35E:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	BCS $16			  ; B0 16 | Branch if carry set
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_35F
; Address: $C3CB28
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_35F:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BCS $D4			  ; B0 D4 | Branch if carry set
	INY				  ; C8 | Increment Y register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_360
; Address: $C3CB36
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_360:
	JSL $C0CD63		  ; 22 63 CD C0 | Jump to subroutine long
	BCC $E4			  ; 90 E4 | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_363
; Address: $C3CB46
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_363:
	JSL $C0049F		  ; 22 9F 04 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_364
; Address: $C3CB4C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_364:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	LDA $B0			  ; A5 B0 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_365
; Address: $C3CB54
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_365:
	JSL $C31EE4		  ; 22 E4 1E C3 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	JMP $C1D182		  ; 5C 82 D1 C1 | Jump to address long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_369
; Address: $C3CB6C
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_369:
	JSL $C737BE		  ; 22 BE 37 C7 | Jump to subroutine long
	EOR $2200			; 4D 00 22 | Exclusive OR with accumulator (absolute)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_36A
; Address: $C3CB78
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_36A:
	JSL $C1D415		  ; 22 15 D4 C1 | Jump to subroutine long
	BCC $04			  ; 90 04 | Branch if carry clear
	JMP $C1D445		  ; 5C 45 D4 C1 | Jump to address long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_36B
; Address: $C3CB84
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_36B:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	DEX				  ; CA | Decrement X register
	BMI $24			  ; 30 24 | Branch if negative

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_370
; Address: $C3CBA8
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_370:
	JSL $C43337		  ; 22 37 33 C4 | Jump to subroutine long
	ORA ($FE,X)		  ; 01 FE | Logical OR with accumulator ((zero page,X))
	BRA $D9			  ; 80 D9 | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_371
; Address: $C3CBB1
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_371:
	JSL $C31EE4		  ; 22 E4 1E C3 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_372
; Address: $C3CBB7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_372:
	JSL $C3D36D		  ; 22 6D D3 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_375
; Address: $C3CBC8
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_375:
	BCS $59			  ; B0 59 | Branch if carry set
	CMP $B0			  ; C5 B0 | Compare accumulator (zero page)
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$0F			 ; A9 0F | Read graphics status
	BRA $04			  ; 80 04 | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_376
; Address: $C3CBD3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_376:
	JSL $C014F2		  ; 22 F2 14 C0 | Jump to subroutine long
	STA $AE			  ; 85 AE | Update graphics data
	STA $B2			  ; 85 B2 | Update graphics data
	STZ $33B8			; 9C B8 33 | Store zero to absolute
	STZ $33BA			; 9C BA 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_377
; Address: $C3CBE1
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_377:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	LDX #$B0			 ; A2 B0 | Load immediate value into X register
	LDA $33BC			; AD BC 33 | Read graphics status
	CMP #$63			 ; C9 63 | Compare accumulator (immediate)
	BCC $03			  ; 90 03 | Branch if carry clear
	LDA #$63			 ; A9 63 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_378
; Address: $C3CBF4
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_378:
	JSL $C4297C		  ; 22 7C 29 C4 | Jump to subroutine long
	ORA ($B0,X)		  ; 01 B0 | Logical OR with accumulator ((zero page,X))
	LDA $B0			  ; A5 B0 | Read graphics status
	BEQ $1D			  ; F0 1D | Branch if equal
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LSR $AE			  ; 46 AE | Logical shift right (zero page)
	BCC $11			  ; 90 11 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_379
; Address: $C3CC05
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_379:
	JSL $C429DA		  ; 22 DA 29 C4 | Jump to subroutine long
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	INC $08B0,X		  ; FE B0 08 | Increment (absolute,X)
	ORA ($5A,X)		  ; 01 5A | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_37A
; Address: $C3CC11
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_37A:
	JSL $C46E82		  ; 22 82 6E C4 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	INY				  ; C8 | Increment Y register
	CPY $B0			  ; C4 B0 | Compare Y register (zero page)
	BCC $E6			  ; 90 E6 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	LDA $B2			  ; A5 B2 | Read graphics status
	CMP #$0F			 ; C9 0F | Compare accumulator (immediate)
	BNE $9A			  ; D0 9A | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_37D
; Address: $C3CC2D
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_37D:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	BCS $3B			  ; B0 3B | Branch if carry set
	CMP $B0			  ; C5 B0 | Compare accumulator (zero page)
	BCC $05			  ; 90 05 | Branch if carry clear
	LDA #$0F			 ; A9 0F | Read graphics status
	BRA $04			  ; 80 04 | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_37F
; Address: $C3CC41
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_37F:
	STA $AE			  ; 85 AE | Update graphics data
	STA $B2			  ; 85 B2 | Update graphics data
	STZ $33B8			; 9C B8 33 | Store zero to absolute
	STZ $33BA			; 9C BA 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_380
; Address: $C3CC4B
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_380:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	BCS $1D			  ; B0 1D | Branch if carry set
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LSR $AE			  ; 46 AE | Logical shift right (zero page)
	BCC $0A			  ; 90 0A | Branch if carry clear
	LDA $33BC			; AD BC 33 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_381
; Address: $C3CC5C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_381:
	JSL $C42ED6		  ; 22 D6 2E C4 | Jump to subroutine long
	ORA ($FD,X)		  ; 01 FD | Logical OR with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	CPY $B0			  ; C4 B0 | Compare Y register (zero page)
	BCC $ED			  ; 90 ED | Branch if carry clear
	LDA $B2			  ; A5 B2 | Read graphics status
	CMP #$0F			 ; C9 0F | Compare accumulator (immediate)
	BNE $B8			  ; D0 B8 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_383
; Address: $C3CC77
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_383:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	LDX #$B0			 ; A2 B0 | Load immediate value into X register
	ASL $BCAC			; 0E AC BC | Arithmetic shift left (absolute)
	LDA $33BE			; AD BE 33 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_384
; Address: $C3CC87
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_384:
	JSL $C45ADC		  ; 22 DC 5A C4 | Jump to subroutine long
	PLX				  ; FA | Pull X register from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_386
; Address: $C3CC91
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_386:
	JSL $C45399		  ; 22 99 53 C4 | Jump to subroutine long
	INC $E0E8,X		  ; FE E8 E0 | Game work RAM access
	SBC $00			  ; E5 00 | Subtract with carry (zero page)
	BCC $F5			  ; 90 F5 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_387
; Address: $C3CC9E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_387:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	TAY				  ; A8 | Transfer accumulator to Y register
	BCS $1A			  ; B0 1A | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_388
; Address: $C3CCA6
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_388:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	LDA $03A348		  ; AF 48 A3 03 | Read graphics status
	STA $18			  ; 85 18 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	BCS $09			  ; B0 09 | Branch if carry set
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_38A
; Address: $C3CCBB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_38A:
	JSL $C62DD5		  ; 22 D5 2D C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_38C
; Address: $C3CCCA
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_38C:
	JSL $C43154		  ; 22 54 31 C4 | Jump to subroutine long
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_38D
; Address: $C3CCD2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_38D:
	JSL $C440F1		  ; 22 F1 40 C4 | Jump to subroutine long
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_38E
; Address: $C3CCD9
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_38E:
	JSL $C44078		  ; 22 78 40 C4 | Jump to subroutine long
	ORA ($18,X)		  ; 01 18 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_38F
; Address: $C3CCE0
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_38F:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	ADC $F722,X		  ; 7D 22 F7 | Add with carry (absolute,X)
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_390
; Address: $C3CCEB
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_390:
	JSL $C68846		  ; 22 46 88 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_391
; Address: $C3CCF1
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_391:
	JSL $C690A1		  ; 22 A1 90 C6 | Jump to subroutine long
	STA $33B8			; 8D B8 33 | Update graphics data
	STZ $33BA			; 9C BA 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_392
; Address: $C3CCFB
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_392:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	LDX #$B0			 ; A2 B0 | Load immediate value into X register
	ORA $BEAD,Y		  ; 19 AD BE | Logical OR with accumulator (absolute,Y)
	STA $33BA			; 8D BA 33 | Update graphics data
	LDA $33BC			; AD BC 33 | Read graphics status
	STA $33B8			; 8D B8 33 | Update graphics data
	CMP #$69			 ; C9 69 | Compare accumulator (immediate)
	BCS $E8			  ; B0 E8 | Branch if carry set

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_394
; Address: $C3CD17
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_394:
	JSL $C68794		  ; 22 94 87 C6 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_399
; Address: $C3CD2C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_399:
	JSL $C68A2B		  ; 22 2B 8A C6 | Jump to subroutine long
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $FBC7			; 8D C7 FB | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))
	LSR $FC			  ; 46 FC | Logical shift right (zero page)
	LDA #$01			 ; A9 01 | Read graphics status
	ORA ($8F,X)		  ; 01 8F | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_39A
; Address: $C3CD41
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_39A:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $7FFC4A		  ; 8F 4A FC 7F | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7FFC4C		  ; 8F 4C FC 7F | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_39B
; Address: $C3CD56
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_39B:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_39C
; Address: $C3CD65
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_39C:
	JSL $C0769C		  ; 22 9C 76 C0 | Jump to subroutine long
	BCC $1D			  ; 90 1D | Branch if carry clear
	LDA $7FE552		  ; AF 52 E5 7F | Read graphics status
	STA $FBC7			; 8D C7 FB | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_39D
; Address: $C3CD72
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_39D:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	TAX				  ; AA | Transfer accumulator to X register
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_39F
; Address: $C3CD88
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_39F:
	JSL $C050FB		  ; 22 FB 50 C0 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7E7F6E		  ; 8F 6E 7F 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3A1
; Address: $C3CD9A
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3A1:
	JSL $C01014		  ; 22 14 10 C0 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Read graphics status
	PEA #$F802		   ; F4 02 F8 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3A3
; Address: $C3CDAE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3A3:
	JSL $C3F254		  ; 22 54 F2 C3 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	PEA #$F802		   ; F4 02 F8 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3A5
; Address: $C3CDC5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3A5:
	JSL $C01056		  ; 22 56 10 C0 | Jump to subroutine long
	LDA $FBC7			; AD C7 FB | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	TAY				  ; A8 | Transfer accumulator to Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3A7
; Address: $C3CDD6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3A7:
	JSL $C68AE4		  ; 22 E4 8A C6 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	STA $7E7F6E		  ; 8F 6E 7F 7E | Update graphics data
	LDA #$01			 ; A9 01 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3AB
; Address: $C3CDF0
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3AB:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	BCS $17			  ; B0 17 | Branch if carry set
	LDA $33BC			; AD BC 33 | Read graphics status
	CMP #$7F			 ; C9 7F | Compare accumulator (immediate)
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	LDA #$7E			 ; A9 7E | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	CLV				  ; B8 | Clear overflow flag
	STZ $33BA			; 9C BA 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3AC
; Address: $C3CE08
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3AC:
	JSL $C1E314		  ; 22 14 E3 C1 | Jump to subroutine long
	BRA $E2			  ; 80 E2 | Branch always
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3AD
; Address: $C3CE10
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3AD:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ROL $2001,X		  ; 3E 01 20 | Rotate left (absolute,X)
	BCC $13			  ; 90 13 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3AE
; Address: $C3CE1B
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3AE:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	BIT #$07			 ; 89 07 | Test bits in accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ROR $0002,X		  ; 7E 02 00 | Rotate right (absolute,X)
	JMP $CF05			; 4C 05 CF | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3AF
; Address: $C3CE2E
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3AF:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	RTI				  ; 40 | Return from interrupt
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CPY $C907			; CC 07 C9 | Compare Y register (absolute)
	ROR $0002,X		  ; 7E 02 00 | Rotate right (absolute,X)
	JMP $CF05			; 4C 05 CF | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3B3
; Address: $C3CE52
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3B3:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	JMP $CF05			; 4C 05 CF | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3B4
; Address: $C3CE5F
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3B4:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	CPY $C907			; CC 07 C9 | Compare Y register (absolute)
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	JMP $CF05			; 4C 05 CF | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3B5
; Address: $C3CE72
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3B5:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	BCC $13			  ; 90 13 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3B8
; Address: $C3CE83
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3B8:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)
	JMP $CF05			; 4C 05 CF | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3BA
; Address: $C3CE96
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3BA:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)
	JMP $CF05			; 4C 05 CF | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3BB
; Address: $C3CEA3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3BB:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	BCC $13			  ; 90 13 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3BC
; Address: $C3CEAE
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3BC:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	BIT #$07			 ; 89 07 | Test bits in accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ROR $0008,X		  ; 7E 08 00 | Rotate right (absolute,X)
	JMP $CF05			; 4C 05 CF | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3BE
; Address: $C3CEC7
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3BE:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ROR $0008,X		  ; 7E 08 00 | Rotate right (absolute,X)
	JMP $CF05			; 4C 05 CF | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3BF
; Address: $C3CED4
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3BF:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	LSR				  ; 4A | Logical shift right (accumulator)
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	BCC $13			  ; 90 13 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3C0
; Address: $C3CEDF
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3C0:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	ORA ($22,X)		  ; 01 22 | Logical OR with accumulator ((zero page,X))
	BIT #$07			 ; 89 07 | Test bits in accumulator (immediate)
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	ROR $0010,X		  ; 7E 10 00 | Rotate right (absolute,X)
	JMP $CF05			; 4C 05 CF | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3C1
; Address: $C3CEF2
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3C1:
	JSL $C1A8D4		  ; 22 D4 A8 C1 | Jump to subroutine long
	JMP $2201			; 4C 01 22 | Jump to address
	CPY $C907			; CC 07 C9 | Compare Y register (absolute)
	ROR $0010,X		  ; 7E 10 00 | Rotate right (absolute,X)
	JMP $CF05			; 4C 05 CF | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3C2
; Address: $C3CF05
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3C2:
	JSL $C340F7		  ; 22 F7 40 C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3C3
; Address: $C3CF0B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3C3:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	BCS $06			  ; B0 06 | Branch if carry set
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	BNE $02			  ; D0 02 | Branch if not equal
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3C6
; Address: $C3CF1A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3C6:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	LDX $B0			  ; A6 B0 | Load from zero page into X register
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3C7
; Address: $C3CF22
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3C7:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	SBC $F7			  ; E5 F7 | Subtract with carry (zero page)
	INY				  ; C8 | Increment Y register
	LDY #$02			 ; A0 02 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3C8
; Address: $C3CF30
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3C8:
	JSL $C0CD63		  ; 22 63 CD C0 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3C9
; Address: $C3CF36
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3C9:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	BCS $22			  ; B0 22 | Branch if carry set
	RTI				  ; 40 | Return from interrupt
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3CA
; Address: $C3CF41
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3CA:
	LDA #$15			 ; A9 15 | Read graphics status
	STA $C30B			; 8D 0B C3 | Update graphics data
	LDA #$07			 ; A9 07 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3CB
; Address: $C3CF4A
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3CB:
	JSL $C7315E		  ; 22 5E 31 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3CC
; Address: $C3CF50
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3CC:
	LDA $C36B			; AD 6B C3 | Read graphics status
	STA $33B8			; 8D B8 33 | Update graphics data
	STZ $33BA			; 9C BA 33 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3CD
; Address: $C3CF59
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3CD:
	JSL $C32251		  ; 22 51 22 C3 | Jump to subroutine long
	LDX #$B0			 ; A2 B0 | Load immediate value into X register
	LDA $33BE			; AD BE 33 | Read graphics status
	STA $33BA			; 8D BA 33 | Update graphics data
	LDA $33BC			; AD BC 33 | Read graphics status
	STA $33B8			; 8D B8 33 | Update graphics data
	CMP #$09			 ; C9 09 | Compare accumulator (immediate)
	BCS $E8			  ; B0 E8 | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3CE
; Address: $C3CF72
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3CE:
	JSL $C31EE4		  ; 22 E4 1E C3 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	STA $C36B			; 8D 6B C3 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3CF
; Address: $C3CF7C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3CF:
	JSL $C31EE4		  ; 22 E4 1E C3 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3D0
; Address: $C3CF82
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3D0:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $01			  ; D0 01 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3D3
; Address: $C3CF91
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3D3:
	ADC ($F5),Y		  ; 71 F5 | Add with carry ((zero page),Y)
	INY				  ; C8 | Increment Y register
	CPX #$7F			 ; E0 7F | Compare X register (immediate)
	STA $C307			; 8D 07 C3 | Update graphics data
	JMP $CFBC			; 4C BC CF | Jump to address
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $01			  ; D0 01 | Branch if not equal
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3D5
; Address: $C3CFA7
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3D5:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ADC ($F5),Y		  ; 71 F5 | Add with carry ((zero page),Y)
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	STA $C307			; 8D 07 C3 | Update graphics data
	JMP $CFBC			; 4C BC CF | Jump to address
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDA $C5E5,Y		  ; B9 E5 C5 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3D6
; Address: $C3CFCD
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3D6:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ADC ($F5),Y		  ; 71 F5 | Add with carry ((zero page),Y)
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SED				  ; F8 | Set decimal mode flag
	STA $4245			; 8D 45 42 | Hardware register operation
	LDA #$00			 ; A9 00 | Read graphics status
	BMI $8D			  ; 30 8D | Branch if negative
	EOR ($42,X)		  ; 41 42 | Hardware register operation
	LDA #$08			 ; A9 08 | Read graphics status
	STA $4243			; 8D 43 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3D7
; Address: $C3CFEB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3D7:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ADC ($F5),Y		  ; 71 F5 | Add with carry ((zero page),Y)
	INY				  ; C8 | Increment Y register
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3D9
; Address: $C3D003
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3D9:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ADC ($F5),Y		  ; 71 F5 | Add with carry ((zero page),Y)
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3DA
; Address: $C3D00D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3DA:
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	BRA $00			  ; 80 00 | Branch always
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $16			  ; D0 16 | Branch if not equal
	PHA				  ; 48 | Push accumulator to stack
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA $D765,Y		  ; B9 65 D7 | Read graphics status
	TAY				  ; A8 | Transfer accumulator to Y register
	PLA				  ; 68 | Pull accumulator from stack
	LDX $D7E5,Y		  ; BE E5 D7 | Load from absolute,Y into X register
	LDA $44F2,X		  ; BD F2 44 | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC #$E8			 ; 69 E8 | Add with carry (immediate)
	STA $44F2,X		  ; 9D F2 44 | Update graphics data
	ORA ($AA,X)		  ; 01 AA | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3DB
; Address: $C3D030
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3DB:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	ADC ($F5),Y		  ; 71 F5 | Add with carry ((zero page),Y)
	INY				  ; C8 | Increment Y register
	CPY #$07			 ; C0 07 | Compare Y register (immediate)
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3DE
; Address: $C3D04E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3DE:
	JSL $C73E7F		  ; 22 7F 3E C7 | Jump to subroutine long
	LDA $C307			; AD 07 C3 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $22			  ; F0 22 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3DF
; Address: $C3D05C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3DF:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	LDY $C723,X		  ; BC 23 C7 | Load from absolute,X into Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BNE $0D			  ; D0 0D | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3E0
; Address: $C3D070
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3E0:
	JSL $C7304B		  ; 22 4B 30 C7 | Jump to subroutine long
	BCS $03			  ; B0 03 | Branch if carry set
	BRA $F7			  ; 80 F7 | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3E2
; Address: $C3D07D
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3E2:
	JSL $C73E56		  ; 22 56 3E C7 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3E4
; Address: $C3D085
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3E4:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	BVS $C8			  ; 70 C8 | Branch if overflow set
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	LDX #$3A			 ; A2 3A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3E8
; Address: $C3D09F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3E8:
	PHP				  ; 08 | Push processor status to stack
	STA $C87C,Y		  ; 99 7C C8 | Update graphics data
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDX #$3A			 ; A2 3A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3EB
; Address: $C3D0AF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3EB:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	STA $81			  ; 85 81 | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	LDX #$3A			 ; A2 3A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3EE
; Address: $C3D0C4
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3EE:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	BVS $C8			  ; 70 C8 | Branch if overflow set
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	LDX #$3A			 ; A2 3A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3F1
; Address: $C3D0D9
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3F1:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	STA $C87C,Y		  ; 99 7C C8 | Update graphics data
	ASL $00			  ; 06 00 | Arithmetic shift left (zero page)
	LDX #$3A			 ; A2 3A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3F4
; Address: $C3D0EE
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3F4:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	STA $81			  ; 85 81 | Update graphics data
	INY				  ; C8 | Increment Y register
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	LDX #$3A			 ; A2 3A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3F7
; Address: $C3D103
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3F7:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	BVS $C8			  ; 70 C8 | Branch if overflow set
	BRA $7F			  ; 80 7F | Branch always
	STA $C191			; 8D 91 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3F9
; Address: $C3D117
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3F9:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	STA $C87C,Y		  ; 99 7C C8 | Update graphics data
	STA $C191			; 8D 91 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3FB
; Address: $C3D128
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3FB:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	STA $81			  ; 85 81 | Update graphics data
	INY				  ; C8 | Increment Y register
	BRA $1F			  ; 80 1F | Branch always
	STA $C191			; 8D 91 C1 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3FC
; Address: $C3D13B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3FC:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PEA #$99C5		   ; F4 C5 99 | Push effective address to stack
	PEA #$0003		   ; F4 03 00 | Push effective address to stack
	PEA #$7E00		   ; F4 00 7E | Push effective address to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3FD
; Address: $C3D146
; Size: 52 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3FD:
	JSL $C9029E		  ; 22 9E 02 C9 | Jump to subroutine long
	CMP #$01			 ; C9 01 | Compare accumulator (immediate)
	BEQ $21			  ; F0 21 | PPU graphics register access
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $17			  ; F0 17 | Branch if equal
	LDA $7E3628		  ; AF 28 36 7E | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $0E			  ; D0 0E | Branch if not equal
	LDA $7E353A		  ; AF 3A 35 7E | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $12			  ; 80 12 | Branch always
	LDA #$02			 ; A9 02 | Read graphics status
	BRA $0D			  ; 80 0D | Branch always
	LDA $DB05			; AD 05 DB | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $F3			  ; D0 F3 | Branch if not equal
	LDA #$01			 ; A9 01 | Read graphics status
	BRA $00			  ; 80 00 | Branch always
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_3FE
; Address: $C3D182
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_3FE:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_401
; Address: $C3D193
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_401:
	JSR $D19B			; 20 9B D1 | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	JMP $C731E0		  ; 5C E0 31 C7 | Jump to address long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_402
; Address: $C3D19B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_402:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	JMP ($7E98)		  ; 6C 98 7E | Jump to address (absolute indirect)
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	LDA #$18			 ; A9 18 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_404
; Address: $C3D1AC
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_404:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	BMI $0A			  ; 30 0A | Branch if negative
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BMI $99			  ; 30 99 | Branch if negative
	LDA $C3			  ; A5 C3 | Read graphics status
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $EA			  ; 90 EA | Branch if carry clear
	LDA $7FE37E		  ; AF 7E E3 7F | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$18			 ; E9 18 | Subtract with carry (immediate)
	STA $DB19			; 8D 19 DB | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_406
; Address: $C3D1D4
; Size: 67 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_406:
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $DB19			; ED 19 DB | Subtract with carry (absolute)
	AND $96A0			; 2D A0 96 | Logical AND with accumulator (absolute)
	PHA				  ; 48 | Push accumulator to stack
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	SEC				  ; 38 | Set carry flag
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	ORA $68DB,Y		  ; 19 DB 68 | Logical OR with accumulator (absolute,Y)
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $18			  ; 64 18 | Store zero to zero page
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	BMI $25			  ; 30 25 | Branch if negative
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $1C			  ; D0 1C | Branch if not equal
	LDA $CF25,Y		  ; B9 25 CF | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $14			  ; F0 14 | Branch if equal
	LDA $DB19			; AD 19 DB | Read graphics status
	CMP $C625,Y		  ; D9 25 C6 | Compare accumulator (absolute,Y)
	BCS $0C			  ; B0 0C | Branch if carry set
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$08			 ; E9 08 | Subtract with carry (immediate)
	STA $C625,Y		  ; 99 25 C6 | Update graphics data
	INC $18			  ; E6 18 | Increment (zero page)
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_407
; Address: $C3D21C
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_407:
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $CF			  ; 90 CF | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	BEQ $03			  ; F0 03 | Branch if equal
	BRA $C3			  ; 80 C3 | Branch always
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_408
; Address: $C3D22A
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_408:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $DAD7,X		  ; 9D D7 DA | Update graphics data
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	BMI $13			  ; 30 13 | Branch if negative
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status
	STA $DAD7,X		  ; 9D D7 DA | Update graphics data
	LDA $C3A5,Y		  ; B9 A5 C3 | Read graphics status
	STA $DAE7,X		  ; 9D E7 DA | Update graphics data
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	BMI $99			  ; 30 99 | Branch if negative
	LDA $C3			  ; A5 C3 | Read graphics status
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $DB			  ; 90 DB | Branch if carry clear
	LDA $7FE37E		  ; AF 7E E3 7F | Read graphics status
	STA $DB19			; 8D 19 DB | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_40A
; Address: $C3D25C
; Size: 56 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_40A:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA				  ; BF CA D2 C1 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $11			  ; F0 11 | Branch if equal
	STA $7FE3A8		  ; 8F A8 E3 7F | Update graphics data
	STA $7FE3AA		  ; 8F AA E3 7F | Update graphics data
	STA $7FE3B0		  ; 8F B0 E3 7F | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	BRA $E6			  ; 80 E6 | Branch always
	LDX #$1E			 ; A2 1E | Load immediate value into X register
	DEX				  ; CA | Decrement X register
	BNE $FC			  ; D0 FC | Branch if not equal
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STZ $18			  ; 64 18 | Store zero to zero page
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	BMI $15			  ; 30 15 | Branch if negative
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $DAD7,X		  ; BD D7 DA | Read graphics status
	CMP $C625,Y		  ; D9 25 C6 | Compare accumulator (absolute,Y)
	BEQ $0C			  ; F0 0C | Branch if equal
	LDA $C625,Y		  ; B9 25 C6 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_40B
; Address: $C3D29C
; Size: 41 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_40B:
	CLC				  ; 18 | Clear carry flag
	ADC #$04			 ; 69 04 | Add with carry (immediate)
	STA $C625,Y		  ; 99 25 C6 | Update graphics data
	INC $18			  ; E6 18 | Increment (zero page)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $DF			  ; 90 DF | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	BEQ $03			  ; F0 03 | Branch if equal
	BRA $D3			  ; 80 D3 | Branch always
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $DAA5,X		  ; BD A5 DA | Read graphics status
	BMI $07			  ; 30 07 | Branch if negative
	TAY				  ; A8 | Transfer accumulator to Y register
	LDA $DAE7,X		  ; BD E7 DA | Read graphics status
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $ED			  ; 90 ED | Branch if carry clear
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_40C
; Address: $C3D2CD
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_40C:
	PLX				  ; FA | Pull X register from stack
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INC $0100,X		  ; FE 00 01 | Increment (absolute,X)
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $3504			; 8D 04 35 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_40D
; Address: $C3D2EE
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_40D:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHX				  ; DA | Push X register to stack
	LDA $99FF			; AD FF 99 | Read graphics status
	BNE $29			  ; D0 29 | Branch if not equal
	LDA $3504			; AD 04 35 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $05			  ; D0 05 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_40E
; Address: $C3D305
; Size: 37 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_40E:
	JSR $D37F			; 20 7F D3 | Jump to subroutine
	BCC $12			  ; 90 12 | Branch if carry clear
	LDA $7E3628		  ; AF 28 36 7E | Read graphics status
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $7E353A		  ; AF 3A 35 7E | Read graphics status
	AND #$20			 ; 29 20 | Logical AND with accumulator (immediate)
	BNE $05			  ; D0 05 | Branch if not equal
	LDA #$02			 ; A9 02 | Read graphics status
	BRA $08			  ; 80 08 | Branch always
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $03			  ; 80 03 | Branch always
	LDA #$01			 ; A9 01 | Read graphics status
	PLX				  ; FA | Pull X register from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	XBA				  ; EB | Exchange accumulator bytes
	XBA				  ; EB | Exchange accumulator bytes
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_40F
; Address: $C3D32F
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_40F:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_410
; Address: $C3D336
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_410:
	JSR $D37E			; 20 7E D3 | Jump to subroutine
	LDA $3504			; AD 04 35 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $26			  ; F0 26 | Branch if equal
	LDA #$00			 ; A9 00 | Read graphics status
	STA $18			  ; 85 18 | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $1C			  ; 85 1C | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $99C9,X		  ; BD C9 99 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_411
; Address: $C3D356
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_411:
	JSR $D39D			; 20 9D D3 | Jump to subroutine
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $EE			  ; 90 EE | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $13			  ; D0 13 | Branch if not equal
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $99C9,X		  ; BD C9 99 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $08			  ; D0 08 | Branch if not equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_414
; Address: $C3D37F
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_414:
	STZ $18			  ; 64 18 | Store zero to zero page
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $99C9,X		  ; BD C9 99 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $02			  ; F0 02 | Branch if equal
	INC $18			  ; E6 18 | Increment (zero page)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $EF			  ; 90 EF | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	BEQ $02			  ; F0 02 | Branch if equal
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_416
; Address: $C3D39D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_416:
	TAY				  ; A8 | Transfer accumulator to Y register
	STA $1A			  ; 85 1A | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $1E			  ; 85 1E | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_417
; Address: $C3D3A5
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_417:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	CMP $3504			; CD 04 35 | Compare accumulator (absolute)
	BNE $5B			  ; D0 5B | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_418
; Address: $C3D3B9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_418:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	BMI $00			  ; 30 00 | Branch if negative
	CMP $350A			; CD 0A 35 | Compare accumulator (absolute)
	BNE $47			  ; D0 47 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_419
; Address: $C3D3CD
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_419:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	ORA ($00,X)		  ; 01 00 | Logical OR with accumulator ((zero page,X))
	SEC				  ; 38 | Set carry flag
	SBC $3506			; ED 06 35 | Subtract with carry (absolute)
	BCS $04			  ; B0 04 | Branch if carry set
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	STA $1E			  ; 85 1E | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_41A
; Address: $C3D3E8
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_41A:
	JSL $C90566		  ; 22 66 05 C9 | Jump to subroutine long
	ORA $00			  ; 05 00 | Logical OR with accumulator (zero page)
	INY				  ; C8 | Increment Y register
	SED				  ; F8 | Set decimal mode flag
	SEC				  ; 38 | Set carry flag

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_41B
; Address: $C3D3F8
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_41B:
	SBC $3508			; ED 08 35 | Subtract with carry (absolute)
	BCS $04			  ; B0 04 | Branch if carry set
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	CLC				  ; 18 | Clear carry flag
	ADC $1E			  ; 65 1E | Add with carry (zero page)
	STA $1E			  ; 85 1E | Update graphics data
	LDA $1C			  ; A5 1C | Read graphics status
	CMP $1E			  ; C5 1E | Compare accumulator (zero page)
	BCC $08			  ; 90 08 | Branch if carry clear
	LDA $1E			  ; A5 1E | Read graphics status
	STA $1C			  ; 85 1C | Update graphics data
	LDA $1A			  ; A5 1A | Read graphics status
	STA $18			  ; 85 18 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_41C
; Address: $C3D415
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_41C:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $7E99C6		  ; AF C6 99 7E | Read graphics status
	AND #$10			 ; 29 10 | Logical AND with accumulator (immediate)
	BEQ $1F			  ; F0 1F | Branch if equal
	LDA $7E353A		  ; AF 3A 35 7E | Read graphics status
	AND #$80			 ; 29 80 | Logical AND with accumulator (immediate)
	BEQ $16			  ; F0 16 | Branch if equal
	LDA $7E3628		  ; AF 28 36 7E | Read graphics status
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BNE $0D			  ; D0 0D | Branch if not equal
	LDA $352E			; AD 2E 35 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_41D
; Address: $C3D440
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_41D:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_422
; Address: $C3D458
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_422:
	JSL $C73281		  ; 22 81 32 C7 | Jump to subroutine long
	PHA				  ; 48 | Push accumulator to stack
	LDA $7E353B		  ; AF 3B 35 7E | Read graphics status
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $0D			  ; D0 0D | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_423
; Address: $C3D466
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_423:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	ROR $0004,X		  ; 7E 04 00 | Rotate right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_424
; Address: $C3D473
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_424:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_425
; Address: $C3D476
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_425:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	LDA $7E353B		  ; AF 3B 35 7E | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BNE $0D			  ; D0 0D | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_426
; Address: $C3D486
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_426:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	ROR $0001,X		  ; 7E 01 00 | Rotate right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_427
; Address: $C3D493
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_427:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_428
; Address: $C3D496
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_428:
	PHA				  ; 48 | Push accumulator to stack
	LDA #$00			 ; A9 00 | Read graphics status
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_429
; Address: $C3D49D
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_429:
	JSL $C907CC		  ; 22 CC 07 C9 | Jump to subroutine long
	ROR $0002,X		  ; 7E 02 00 | Rotate right (absolute,X)
	LDA $7E353A		  ; AF 3A 35 7E | Read graphics status
	AND #$40			 ; 29 40 | Logical AND with accumulator (immediate)
	BNE $0D			  ; D0 0D | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_42A
; Address: $C3D4B0
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_42A:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	ROR $0040,X		  ; 7E 40 00 | Rotate right (absolute,X)
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_42B
; Address: $C3D4BD
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_42B:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_42C
; Address: $C3D4C0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_42C:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_42D
; Address: $C3D4C8
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_42D:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_433
; Address: $C3D4F7
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_433:
	JSL $C90789		  ; 22 89 07 C9 | Jump to subroutine long
	ROR $0020,X		  ; 7E 20 00 | Rotate right (absolute,X)
	LDA #$40			 ; A9 40 | Read graphics status
	STA $3536			; 8D 36 35 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_434
; Address: $C3D507
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_434:
	JSL $C62DD5		  ; 22 D5 2D C6 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_435
; Address: $C3D50F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_435:
	PHA				  ; 48 | Push accumulator to stack
	LDA $DB05			; AD 05 DB | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_436
; Address: $C3D51B
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_436:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_437
; Address: $C3D51E
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_437:
	LDA $99B5			; AD B5 99 | Read graphics status
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BCS $54			  ; B0 54 | Branch if carry set

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_43A
; Address: $C3D532
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_43A:
	JSL $C012E3		  ; 22 E3 12 C0 | Jump to subroutine long
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BCC $0E			  ; 90 0E | Branch if carry clear

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_43B
; Address: $C3D53B
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_43B:
	JSL $C012E3		  ; 22 E3 12 C0 | Jump to subroutine long
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	LDX #$00			 ; A2 00 | Load immediate value into X register
	BRA $2C			  ; 80 2C | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_43C
; Address: $C3D549
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_43C:
	JSL $C45AB0		  ; 22 B0 5A C4 | Jump to subroutine long
	LDA $02			  ; A5 02 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $02			  ; 85 02 | Update graphics data
	LSR $02			  ; 46 02 | Logical shift right (zero page)
	ROR $00			  ; 66 00 | Rotate right (zero page)
	LDA $00			  ; A5 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_43D
; Address: $C3D55B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_43D:
	ORA $02			  ; 05 02 | Logical OR with accumulator (zero page)
	BEQ $DC			  ; F0 DC | Branch if equal
	LDA $00			  ; A5 00 | Read graphics status
	LDY $02			  ; A4 02 | Load from zero page into Y register
	LDX #$00			 ; A2 00 | Load immediate value into X register
	BRA $0D			  ; 80 0D | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_43F
; Address: $C3D56C
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_43F:
	JSL $C67EC1		  ; 22 C1 7E C6 | Jump to subroutine long
	BCC $08			  ; 90 08 | Branch if carry clear
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_440
; Address: $C3D575
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_440:
	JSR $D57F			; 20 7F D5 | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_441
; Address: $C3D57A
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_441:
	JSR $D57F			; 20 7F D5 | Jump to subroutine
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_442
; Address: $C3D57F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_442:
	PHA				  ; 48 | Push accumulator to stack
	LDA $99B5			; AD B5 99 | Read graphics status
	INC				  ; 1A | Increment accumulator
	BEQ $03			  ; F0 03 | Branch if equal
	STA $99B5			; 8D B5 99 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_443
; Address: $C3D58B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_443:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $7E3628		  ; AF 28 36 7E | Read graphics status
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BNE $17			  ; D0 17 | Branch if not equal
	LDA $7E353A		  ; AF 3A 35 7E | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $0E			  ; F0 0E | Branch if equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_444
; Address: $C3D5A0
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_444:
	JSL $C690A1		  ; 22 A1 90 C6 | Jump to subroutine long
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_445
; Address: $C3D5AE
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_445:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_449
; Address: $C3D5C0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_449:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $09			  ; D0 09 | Branch if not equal
	LDA $7E99C6		  ; AF C6 99 7E | Read graphics status
	AND #$02			 ; 29 02 | Logical AND with accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_44A
; Address: $C3D5D1
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_44A:
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_44B
; Address: $C3D5D4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_44B:
	PHA				  ; 48 | Push accumulator to stack
	LDA $99B1			; AD B1 99 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_44C
; Address: $C3D5E0
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_44C:
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_44D
; Address: $C3D5E3
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_44D:
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	STZ $C0AF			; 9C AF C0 | Store zero to absolute
	LDA $99B1			; AD B1 99 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $D65F			; 4C 5F D6 | Jump to address
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_44E
; Address: $C3D5F7
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_44E:
	JSL $C6727B		  ; 22 7B 72 C6 | Jump to subroutine long
	BCC $5A			  ; 90 5A | Branch if carry clear
	LDA $18			  ; A5 18 | Read graphics status
	SEC				  ; 38 | Set carry flag
	BCC $51			  ; 90 51 | Branch if carry clear
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCC $4C			  ; 90 4C | Branch if carry clear
	CMP #$F8			 ; C9 F8 | Compare accumulator (immediate)
	BCS $47			  ; B0 47 | Branch if carry set
	LDA $1A			  ; A5 1A | Read graphics status
	SEC				  ; 38 | Set carry flag
	ROR $7FE3,X		  ; 7E E3 7F | Rotate right (absolute,X)
	BCC $3E			  ; 90 3E | Branch if carry clear
	CMP #$08			 ; C9 08 | Compare accumulator (immediate)
	BCC $39			  ; 90 39 | Branch if carry clear
	CMP #$D8			 ; C9 D8 | Compare accumulator (immediate)
	BCS $34			  ; B0 34 | Branch if carry set
	LDX $99B1			; AE B1 99 | Load from absolute address into X register
	LDA $18			  ; A5 18 | Read graphics status
	STA $42D2,X		  ; 9D D2 42 | Hardware register operation

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_44F
; Address: $C3D62B
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_44F:
	LDA $1A			  ; A5 1A | Read graphics status
	STA $42F2,X		  ; 9D F2 42 | Hardware register operation
	LDA #$00			 ; A9 00 | Read graphics status
	STA $44F2,X		  ; 9D F2 44 | Update graphics data
	LDA #$08			 ; A9 08 | Read graphics status
	STA $4247			; 8D 47 42 | Hardware register operation
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_453
; Address: $C3D650
; Size: 20 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_453:
	JSL $C79F6B		  ; 22 6B 9F C7 | Jump to subroutine long
	INC $C0AF			; EE AF C0 | Increment (absolute)
	PLY				  ; 7A | Pull Y register from stack
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$60			 ; C0 60 | Compare Y register (immediate)
	BCC $97			  ; 90 97 | Branch if carry clear
	LDA $C0AF			; AD AF C0 | Read graphics status
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_454
; Address: $C3D665
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_454:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_455
; Address: $C3D66B
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_455:
	JSL $C6253F		  ; 22 3F 25 C6 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_456
; Address: $C3D673
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_456:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA #$AD			 ; A9 AD | Read graphics status
	STA $C11B			; 8D 1B C1 | Update graphics data
	LDY $DAA5			; AC A5 DA | Load from absolute address into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_457
; Address: $C3D67F
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_457:
	JSL $C6253F		  ; 22 3F 25 C6 | Jump to subroutine long
	BCC $2D			  ; 90 2D | Branch if carry clear
	LDA $A6DF,X		  ; BD DF A6 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_458
; Address: $C3D68A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_458:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	PHP				  ; 08 | Push processor status to stack
	BIT #$C8			 ; 89 C8 | Test bits in accumulator (immediate)
	SED				  ; F8 | Set decimal mode flag
	TAX				  ; AA | Transfer accumulator to X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_45A
; Address: $C3D6A2
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_45A:
	TYA				  ; 98 | Transfer Y register to accumulator
	INY				  ; C8 | Increment Y register
	LDY #$03			 ; A0 03 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_45B
; Address: $C3D6A8
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_45B:
	JSL $C0CD63		  ; 22 63 CD C0 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	BCC $03			  ; 90 03 | Branch if carry clear
	ORA $38			  ; 05 38 | Logical OR with accumulator (zero page)
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_45C
; Address: $C3D6B6
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_45C:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_460
; Address: $C3D6CB
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_460:
	JSL $C02892		  ; 22 92 28 C0 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_461
; Address: $C3D6D3
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_461:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDX $99F7			; AE F7 99 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_462
; Address: $C3D6D8
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_462:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	LDX $C8			  ; A6 C8 | Load from zero page into X register
	STA $C161			; 8D 61 C1 | Update graphics data
	LDA $99B7			; AD B7 99 | Read graphics status
	STA $C165			; 8D 65 C1 | Update graphics data
	BEQ $04			  ; F0 04 | Branch if equal
	SEC				  ; 38 | Set carry flag
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_463
; Address: $C3D6F3
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_463:
	CLC				  ; 18 | Clear carry flag
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_464
; Address: $C3D6F7
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_464:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDX $99F7			; AE F7 99 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_465
; Address: $C3D6FD
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_465:
	JSL $C90572		  ; 22 72 05 C9 | Jump to subroutine long
	ORA #$00			 ; 09 00 | Logical OR with accumulator (immediate)
	LDX $C8			  ; A6 C8 | Load from zero page into X register
	BPL $00			  ; 10 00 | Branch if positive

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_466
; Address: $C3D70C
; Size: 38 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_466:
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $3F			  ; F0 3F | Branch if equal
	LDA #$FF			 ; A9 FF | Read graphics status
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	LSR				  ; 4A | Logical shift right (accumulator)
	INC				  ; 1A | Increment accumulator
	STA $38			  ; 85 38 | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $3C			  ; 85 3C | Update graphics data
	STA $3E			  ; 85 3E | Update graphics data
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	LDA $9C19,Y		  ; B9 19 9C | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	LDA $9CB9,Y		  ; B9 B9 9C | Read graphics status
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	CMP #$04			 ; C9 04 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_467
; Address: $C3D739
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_467:
	JSR $D75E			; 20 5E D7 | Jump to subroutine
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	CPY #$A0			 ; C0 A0 | Compare Y register (immediate)
	BCC $E1			  ; 90 E1 | Branch if carry clear
	LSR $C167			; 4E 67 C1 | Logical shift right (absolute)
	LSR $C169			; 4E 69 C1 | Logical shift right (absolute)
	LDY $3E			  ; A4 3E | Load from zero page into Y register
	CPY #$FF			 ; C0 FF | Compare Y register (immediate)
	BNE $09			  ; D0 09 | Branch if not equal
	STZ $C167			; 9C 67 C1 | Store zero to absolute
	STZ $C169			; 9C 69 C1 | Store zero to absolute
	CLC				  ; 18 | Clear carry flag
	BRA $01			  ; 80 01 | Branch always
	SEC				  ; 38 | Set carry flag
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_468
; Address: $C3D75E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_468:
	JSR $D7B9			; 20 B9 D7 | Jump to subroutine
	LDA $30			  ; A5 30 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $C725			; ED 25 C7 | Subtract with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	BPL $04			  ; 10 04 | Branch if positive
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_469
; Address: $C3D76E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_469:
	JSR $D7DC			; 20 DC D7 | Jump to subroutine
	STA $34			  ; 85 34 | Update graphics data
	STX $30			  ; 86 30 | Store X register to zero page
	LDA $32			  ; A5 32 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_46A
; Address: $C3D777
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_46A:
	SEC				  ; 38 | Set carry flag
	SBC $C765			; ED 65 C7 | Subtract with carry (absolute)
	TAX				  ; AA | Transfer accumulator to X register
	BPL $04			  ; 10 04 | Branch if positive
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_46B
; Address: $C3D782
; Size: 53 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_46B:
	JSR $D7DC			; 20 DC D7 | Jump to subroutine
	STA $3A			  ; 85 3A | Update graphics data
	STX $32			  ; 86 32 | Store X register to zero page
	LDA $34			  ; A5 34 | Read graphics status
	CMP #$12			 ; C9 12 | Compare accumulator (immediate)
	BCS $07			  ; B0 07 | Branch if carry set
	LDA $3A			  ; A5 3A | Read graphics status
	CMP #$0E			 ; C9 0E | Compare accumulator (immediate)
	BCC $21			  ; 90 21 | PPU graphics register access
	LDA $3A			  ; A5 3A | Read graphics status
	CLC				  ; 18 | Clear carry flag
	ADC $34			  ; 65 34 | Add with carry (zero page)
	CMP $3C			  ; C5 3C | Compare accumulator (zero page)
	BCS $18			  ; B0 18 | Branch if carry set
	STA $3C			  ; 85 3C | Update graphics data
	STY $3E			  ; 84 3E | Store Y register to zero page
	LDA $34			  ; A5 34 | Read graphics status
	STA $C167			; 8D 67 C1 | Update graphics data
	LDA $3A			  ; A5 3A | Read graphics status
	STA $C169			; 8D 69 C1 | Update graphics data
	LDA $30			  ; A5 30 | Read graphics status
	STA $C16B			; 8D 6B C1 | Update graphics data
	LDA $32			  ; A5 32 | Read graphics status
	STA $C16D			; 8D 6D C1 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_46C
; Address: $C3D7B9
; Size: 32 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_46C:
	LDA $9FD9,Y		  ; B9 D9 9F | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $9E99,Y		  ; F9 99 9E | Subtract with carry (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	LDA $9E99,Y		  ; B9 99 9E | Read graphics status
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	BMI $68			  ; 30 68 | Branch if negative
	LDA $A079,Y		  ; B9 79 A0 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC $9F39,Y		  ; F9 39 9F | Subtract with carry (absolute,Y)
	PHA				  ; 48 | Push accumulator to stack
	CLC				  ; 18 | Clear carry flag
	LDA $9F39,Y		  ; B9 39 9F | Read graphics status
	ORA ($85,X)		  ; 01 85 | Logical OR with accumulator ((zero page,X))
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_46E
; Address: $C3D7E0
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_46E:
	BCC $0F			  ; 90 0F | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack
	LDA $36			  ; A5 36 | Read graphics status
	INC				  ; 1A | Increment accumulator
	SEC				  ; 38 | Set carry flag
	ORA ($83,X)		  ; 01 83 | Logical OR with accumulator ((zero page,X))
	ORA ($8A,X)		  ; 01 8A | Logical OR with accumulator ((zero page,X))
	EOR #$FF			 ; 49 FF | Exclusive OR with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_46F
; Address: $C3D7F2
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_46F:
	LDA $7E99C6		  ; AF C6 99 7E | Read graphics status
	AND #$04			 ; 29 04 | Logical AND with accumulator (immediate)
	BEQ $0A			  ; F0 0A | Branch if equal
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_470
; Address: $C3D7FD
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_470:
	JSL $C67253		  ; 22 53 72 C6 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_473
; Address: $C3D80C
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_473:
	LDA #$03			 ; A9 03 | Read graphics status
	JMP $D81E			; 4C 1E D8 | Jump to address
	LDA #$0A			 ; A9 0A | Read graphics status
	JMP $D81E			; 4C 1E D8 | Jump to address
	LDA #$20			 ; A9 20 | Read graphics status
	JMP $D81E			; 4C 1E D8 | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_474
; Address: $C3D81E
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_474:
	JSL $C7910E		  ; 22 0E 91 C7 | Jump to subroutine long
	BCC $02			  ; 90 02 | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_476
; Address: $C3D82C
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_476:
	JSL $C73824		  ; 22 24 38 C7 | Jump to subroutine long
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_477
; Address: $C3D832
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_477:
	PHA				  ; 48 | Push accumulator to stack
	LDA $7E99C6		  ; AF C6 99 7E | Read graphics status
	AND #$08			 ; 29 08 | Logical AND with accumulator (immediate)
	BEQ $03			  ; F0 03 | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_478
; Address: $C3D83F
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_478:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_47A
; Address: $C3D846
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_47A:
	BCC $17			  ; 90 17 | Branch if carry clear
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$6B			 ; A9 6B | Read graphics status
	CLD				  ; D8 | Clear decimal mode flag
	LDY #$C1			 ; A0 C1 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_47B
; Address: $C3D84F
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_47B:
	JSL $C02990		  ; 22 90 29 C0 | Jump to subroutine long
	LDA #$01			 ; A9 01 | Read graphics status
	STA $7EA8,X		  ; 9D A8 7E | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_47C
; Address: $C3D859
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_47C:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_47E
; Address: $C3D861
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_47E:
	LDA #$FE			 ; A9 FE | Read graphics status
	STA $BDE1			; 8D E1 BD | Update graphics data
	STZ $BE43			; 9C 43 BE | Store zero to absolute
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_47F
; Address: $C3D86B
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_47F:
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA #$01			 ; A9 01 | Read graphics status
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $BDE1			; 8D E1 BD | Update graphics data
	LDA $BDE1			; AD E1 BD | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $11			  ; F0 11 | Branch if equal
	CMP #$FE			 ; C9 FE | Compare accumulator (immediate)
	BEQ $0E			  ; F0 0E | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $BDE1			; 8D E1 BD | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_480
; Address: $C3D890
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_480:
	JSL $C1AA21		  ; 22 21 AA C1 | Jump to subroutine long
	BRA $E4			  ; 80 E4 | Branch always
	LDY $7F2A			; AC 2A 7F | Load from absolute address into Y register
	LDA #$00			 ; A9 00 | Read graphics status
	STA $C3A5,Y		  ; 99 A5 C3 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_481
; Address: $C3D8A0
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_481:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	STA $50			  ; 85 50 | Update graphics data
	STY $52			  ; 84 52 | Store Y register to zero page
	LDY #$00			 ; A0 00 | Load immediate value into Y register
	PHY				  ; 5A | Push Y register to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$AA			 ; A9 AA | Read graphics status
	CMP $2140			; CD 40 21 | PPU graphics register access
	BNE $FB			  ; D0 FB | Branch if not equal
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA #$CC			 ; A9 CC | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_482
; Address: $C3D8B9
; Size: 76 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_482:
	BRA $26			  ; 80 26 | Branch always
	BVC $C8			  ; 50 C8 | Branch if overflow clear
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$00			 ; A9 00 | Read graphics status
	BRA $0B			  ; 80 0B | Branch always
	XBA				  ; EB | Exchange accumulator bytes
	BVC $C8			  ; 50 C8 | Branch if overflow clear
	XBA				  ; EB | Exchange accumulator bytes
	CMP $2140			; CD 40 21 | PPU graphics register access
	BNE $FB			  ; D0 FB | Branch if not equal
	INC				  ; 1A | Increment accumulator
	REP #$20			 ; C2 20 | Reset processor status bits
	STA $2140			; 8D 40 21 | PPU graphics register access
	SEP #$20			 ; E2 20 | Set processor status bits
	DEX				  ; CA | Decrement X register
	BNE $EB			  ; D0 EB | Branch if not equal
	CMP $2140			; CD 40 21 | PPU graphics register access
	BNE $FB			  ; D0 FB | Branch if not equal
	ADC #$03			 ; 69 03 | Add with carry (immediate)
	BEQ $FC			  ; F0 FC | Branch if equal
	PHA				  ; 48 | Push accumulator to stack
	REP #$20			 ; C2 20 | Reset processor status bits
	BVC $C8			  ; 50 C8 | Branch if overflow clear
	INY				  ; C8 | Increment Y register
	TAX				  ; AA | Transfer accumulator to X register
	BVC $C8			  ; 50 C8 | Branch if overflow clear
	INY				  ; C8 | Increment Y register
	STA $2142			; 8D 42 21 | PPU graphics register access
	SEP #$20			 ; E2 20 | Set processor status bits
	CPX #$01			 ; E0 01 | Compare X register (immediate)
	LDA #$00			 ; A9 00 | Read graphics status
	ROL				  ; 2A | Rotate left (accumulator)
	STA $2141			; 8D 41 21 | PPU graphics register access
	ADC #$7F			 ; 69 7F | Add with carry (immediate)
	PLA				  ; 68 | Pull accumulator from stack
	STA $2140			; 8D 40 21 | PPU graphics register access
	CMP $2140			; CD 40 21 | PPU graphics register access
	BNE $FB			  ; D0 FB | Branch if not equal
	BVS $B3			  ; 70 B3 | Branch if overflow set
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_483
; Address: $C3D90A
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_483:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STX $58			  ; 86 58 | Store X register to zero page
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $58			  ; A5 58 | Read graphics status
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_486
; Address: $C3D921
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_486:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHY				  ; 5A | Push Y register to stack
	STX $58			  ; 86 58 | Store X register to zero page
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $58			  ; A5 58 | Read graphics status
	REP #$20			 ; C2 20 | Reset processor status bits
	LDX #$06			 ; A2 06 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_489
; Address: $C3D93D
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_489:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STX $58			  ; 86 58 | Store X register to zero page
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $58			  ; A5 58 | Read graphics status
	REP #$20			 ; C2 20 | Reset processor status bits
	LDX #$0E			 ; A2 0E | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_48B
; Address: $C3D954
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_48B:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$04			 ; A2 04 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_48D
; Address: $C3D962
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_48D:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $58			  ; 85 58 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $58			  ; A5 58 | Read graphics status
	REP #$20			 ; C2 20 | Reset processor status bits
	LDX #$07			 ; A2 07 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_48F
; Address: $C3D97A
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_48F:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$05			 ; A2 05 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_491
; Address: $C3D987
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_491:
	JSR $DFB3			; 20 B3 DF | Jump to subroutine
	LDA $002141		  ; AF 41 21 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_492
; Address: $C3D992
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_492:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $58			  ; 85 58 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	XBA				  ; EB | Exchange accumulator bytes
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $58			  ; A5 58 | Read graphics status
	REP #$20			 ; C2 20 | Reset processor status bits
	LDX #$08			 ; A2 08 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_494
; Address: $C3D9AA
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_494:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDX #$09			 ; A2 09 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_496
; Address: $C3D9B8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_496:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	AND #$0F			 ; 29 0F | Logical AND with accumulator (immediate)
	LDX #$0A			 ; A2 0A | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_497
; Address: $C3D9C9
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_497:
	JSR $DD82			; 20 82 DD | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_498
; Address: $C3D9D1
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_498:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_499
; Address: $C3D9D8
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_499:
	STA $96AE			; 8D AE 96 | Update graphics data
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $96D6,X		  ; BD D6 96 | Read graphics status
	CMP $96AE			; CD AE 96 | Compare accumulator (absolute)
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	BRA $06			  ; 80 06 | Branch always
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $96B0			; 8D B0 96 | Update graphics data
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_49A
; Address: $C3D9F5
; Size: 36 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_49A:
	LDA $9812			; AD 12 98 | Read graphics status
	SEC				  ; 38 | Set carry flag
	SBC #$03			 ; E9 03 | Subtract with carry (immediate)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC #$10			 ; 69 10 | Add with carry (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $96AE			; AD AE 96 | Read graphics status
	STA $96D6,X		  ; 9D D6 96 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $96B0			; 8D B0 96 | Update graphics data
	LDA $9812			; AD 12 98 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF A7 DA C1 | Read graphics status
	STA $96B4			; 8D B4 96 | Update graphics data
	LDX $96AE			; AE AE 96 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_49B
; Address: $C3DA1B
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_49B:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	LDY $C723,X		  ; BC 23 C7 | Load from absolute,X into Y register
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	STA $55			  ; 85 55 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $54			  ; 85 54 | Update graphics data
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $96A4			; 8D A4 96 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_49C
; Address: $C3DA47
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_49C:
	JSR $E0AC			; 20 AC E0 | Game work RAM access
	BCS $05			  ; B0 05 | Branch if carry set
	BRA $FE			  ; 80 FE | Branch always
	STZ $96A6			; 9C A6 96 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_49D
; Address: $C3DA51
; Size: 16 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_49D:
	PLY				  ; 7A | Pull Y register from stack
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $96A6			; AD A6 96 | Read graphics status
	STA $96B5,Y		  ; 99 B5 96 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	INY				  ; C8 | Increment Y register
	PLX				  ; FA | Pull X register from stack
	DEX				  ; CA | Decrement X register
	BNE $DC			  ; D0 DC | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_49E
; Address: $C3DA63
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_49E:
	JSR $DFC7			; 20 C7 DF | Jump to subroutine
	STA $96B2			; 8D B2 96 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	PHY				  ; 5A | Push Y register to stack
	LDX #$02			 ; A2 02 | Load immediate value into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4A0
; Address: $C3DA75
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4A0:
	JSR $DDB0			; 20 B0 DD | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $96B6,X		  ; BD B6 96 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4A1
; Address: $C3DA7E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4A1:
	JSR $DDB0			; 20 B0 DD | Jump to subroutine
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	LDA $96B4			; AD B4 96 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4A3
; Address: $C3DA91
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4A3:
	JSR $DDB0			; 20 B0 DD | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	LDX $96B2			; AE B2 96 | Load from absolute address into X register
	LDA $54			  ; A5 54 | Read graphics status
	STA $50			  ; 85 50 | Update graphics data
	LDA $56			  ; A5 56 | Read graphics status
	STA $52			  ; 85 52 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4A4
; Address: $C3DAA0
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4A4:
	JSR $DDEF			; 20 EF DD | Jump to subroutine
	LDA $96B0			; AD B0 96 | Read graphics status
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4A8
; Address: $C3DAB4
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4A8:
	JSR $30C2			; 20 C2 30 | Jump to subroutine
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $96AE			; 8D AE 96 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4AA
; Address: $C3DAC3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4AA:
	JSR $DFF3			; 20 F3 DF | Jump to subroutine
	BCC $03			  ; 90 03 | Branch if carry clear
	JMP $DB76			; 4C 76 DB | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4AC
; Address: $C3DACE
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4AC:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	LDY $C723,X		  ; BC 23 C7 | Load from absolute,X into Y register
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	STA $55			  ; 85 55 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $54			  ; 85 54 | Update graphics data
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4AD
; Address: $C3DAF7
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4AD:
	JSL $C1DCBF		  ; 22 BF DC C1 | Jump to subroutine long
	BCS $05			  ; B0 05 | Branch if carry set
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	JMP $DB7B			; 4C 7B DB | Jump to address
	PLY				  ; 7A | Pull Y register from stack
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $96A6			; AD A6 96 | Read graphics status
	STA $96B5,Y		  ; 99 B5 96 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	INY				  ; C8 | Increment Y register
	PLX				  ; FA | Pull X register from stack
	DEX				  ; CA | Decrement X register
	BNE $DE			  ; D0 DE | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4AE
; Address: $C3DB14
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4AE:
	JSR $DFC7			; 20 C7 DF | Jump to subroutine
	STA $96B2			; 8D B2 96 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	PHY				  ; 5A | Push Y register to stack
	LDA $980E			; AD 0E 98 | Read graphics status
	STA $96B4			; 8D B4 96 | Update graphics data
	LDA $96B2			; AD B2 96 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $96B2			; 6D B2 96 | Add with carry (absolute)
	CLC				  ; 18 | Clear carry flag
	ADC $96B4			; 6D B4 96 | Add with carry (absolute)
	BCS $05			  ; B0 05 | Branch if carry set
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $04			  ; 90 04 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	JMP $DB7B			; 4C 7B DB | Jump to address
	LDA $96B2			; AD B2 96 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4B2
; Address: $C3DB48
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4B2:
	JSR $DDB0			; 20 B0 DD | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $96B6,X		  ; BD B6 96 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4B3
; Address: $C3DB51
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4B3:
	JSR $DDB0			; 20 B0 DD | Jump to subroutine
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	LDA $96B4			; AD B4 96 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4B5
; Address: $C3DB64
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4B5:
	JSR $DDB0			; 20 B0 DD | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	LDX $96B2			; AE B2 96 | Load from absolute address into X register
	LDA $54			  ; A5 54 | Read graphics status
	STA $50			  ; 85 50 | Update graphics data
	LDA $56			  ; A5 56 | Read graphics status
	STA $52			  ; 85 52 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4B6
; Address: $C3DB73
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4B6:
	JSR $DDEF			; 20 EF DD | Jump to subroutine
	LDA $96B0			; AD B0 96 | Read graphics status
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4B7
; Address: $C3DB7B
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4B7:
	LDA $96B0			; AD B0 96 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $96D6,X		  ; 9D D6 96 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4B8
; Address: $C3DB88
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4B8:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $58			  ; 85 58 | Update graphics data
	STA $96AE			; 8D AE 96 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4B9
; Address: $C3DB94
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4B9:
	JSR $E032			; 20 32 E0 | Game work RAM access
	LDA $96B0			; AD B0 96 | Read graphics status
	STA $5A			  ; 85 5A | Update graphics data
	BCC $02			  ; 90 02 | Branch if carry clear
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4BA
; Address: $C3DBA0
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4BA:
	LDA #$01			 ; A9 01 | Read graphics status
	STA $983C			; 8D 3C 98 | Update graphics data
	LDX $96AE			; AE AE 96 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4BB
; Address: $C3DBA9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4BB:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	LDY $C723,X		  ; BC 23 C7 | Load from absolute,X into Y register
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4BC
; Address: $C3DBBD
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4BC:
	STA $55			  ; 85 55 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $54			  ; 85 54 | Update graphics data
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4BD
; Address: $C3DBD2
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4BD:
	JSL $C1DD1E		  ; 22 1E DD C1 | Jump to subroutine long
	BCS $05			  ; B0 05 | Branch if carry set
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	JMP $DC61			; 4C 61 DC | Jump to address
	PLY				  ; 7A | Pull Y register from stack
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $96C5,Y		  ; 99 C5 96 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	INY				  ; C8 | Increment Y register
	PLX				  ; FA | Pull X register from stack
	DEX				  ; CA | Decrement X register
	BNE $E1			  ; D0 E1 | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4BE
; Address: $C3DBEC
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4BE:
	JSR $DFC7			; 20 C7 DF | Jump to subroutine
	STA $96B2			; 8D B2 96 | Update graphics data
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	PHY				  ; 5A | Push Y register to stack
	LDA $980E			; AD 0E 98 | Read graphics status
	STA $96B4			; 8D B4 96 | Update graphics data
	LDA $96B2			; AD B2 96 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $96B2			; 6D B2 96 | Add with carry (absolute)
	CLC				  ; 18 | Clear carry flag
	ADC $96B4			; 6D B4 96 | Add with carry (absolute)
	BCS $05			  ; B0 05 | Branch if carry set
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $04			  ; 90 04 | Branch if carry clear
	PLY				  ; 7A | Pull Y register from stack
	JMP $DC61			; 4C 61 DC | Jump to address
	LDA $96B2			; AD B2 96 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4C1
; Address: $C3DC1F
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4C1:
	JSR $DDB0			; 20 B0 DD | Jump to subroutine
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $96C6,X		  ; BD C6 96 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4C2
; Address: $C3DC28
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4C2:
	JSR $DDB0			; 20 B0 DD | Jump to subroutine
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4C3
; Address: $C3DC2D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4C3:
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	LDA $96B4			; AD B4 96 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4C4
; Address: $C3DC35
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4C4:
	JSR $DDB0			; 20 B0 DD | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	LDA $5A			  ; A5 5A | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $54			  ; A5 54 | Read graphics status
	STA $50			  ; 85 50 | Update graphics data
	LDA $56			  ; A5 56 | Read graphics status
	STA $52			  ; 85 52 | Update graphics data
	LDA $96B4			; AD B4 96 | Read graphics status
	STA $5C			  ; 85 5C | Update graphics data
	LDA $96B2			; AD B2 96 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4C5
; Address: $C3DC4C
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4C5:
	JSR $DE25			; 20 25 DE | Jump to subroutine
	STZ $983C			; 9C 3C 98 | Store zero to absolute
	BCC $0C			  ; 90 0C | Branch if carry clear
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	TAX				  ; AA | Transfer accumulator to X register
	LDA $58			  ; A5 58 | Read graphics status
	STA $96D6,X		  ; 9D D6 96 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4C6
; Address: $C3DC60
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4C6:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4C8
; Address: $C3DC68
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4C8:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	LDY $C723,X		  ; BC 23 C7 | Load from absolute,X into Y register
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	PHA				  ; 48 | Push accumulator to stack
	INY				  ; C8 | Increment Y register
	STA $55			  ; 85 55 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $54			  ; 85 54 | Update graphics data
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BEQ $15			  ; F0 15 | Branch if equal
	TAX				  ; AA | Transfer accumulator to X register
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4C9
; Address: $C3DC93
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4C9:
	JSL $C1DCBF		  ; 22 BF DC C1 | Jump to subroutine long
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	INY				  ; C8 | Increment Y register
	DEX				  ; CA | Decrement X register
	BNE $EF			  ; D0 EF | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4CB
; Address: $C3DC9E
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4CB:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $96D6,X		  ; BD D6 96 | Read graphics status
	ORA ($F0,X)		  ; 01 F0 | Logical OR with accumulator ((zero page,X))
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BCC $F2			  ; 90 F2 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4CC
; Address: $C3DCBA
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4CC:
	PLA				  ; 68 | Pull accumulator from stack
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4CD
; Address: $C3DCBF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4CD:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $96A4			; 8D A4 96 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4CF
; Address: $C3DCCE
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4CF:
	JSR $E071			; 20 71 E0 | Game work RAM access
	LDA $96AC			; AD AC 96 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $96AC			; 6D AC 96 | Add with carry (absolute)
	ADC $96A8			; 6D A8 96 | Add with carry (absolute)
	BCS $05			  ; B0 05 | Branch if carry set
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0D			  ; 90 0D | Branch if carry clear
	LDA $96A6			; AD A6 96 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $9706,X		  ; 9D 06 97 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4D7
; Address: $C3DD10
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4D7:
	JSR $DDB0			; 20 B0 DD | Jump to subroutine
	LDX $96AC			; AE AC 96 | Load from absolute address into X register
	LDY #$04			 ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4D8
; Address: $C3DD19
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4D8:
	JSR $DDEF			; 20 EF DD | Jump to subroutine
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4D9
; Address: $C3DD1E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4D9:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $96A4			; 8D A4 96 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4DB
; Address: $C3DD2D
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4DB:
	JSR $E071			; 20 71 E0 | Game work RAM access
	LDA $96AC			; AD AC 96 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ADC $96AC			; 6D AC 96 | Add with carry (absolute)
	ADC $96A8			; 6D A8 96 | Add with carry (absolute)
	BCS $05			  ; B0 05 | Branch if carry set
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BCC $0F			  ; 90 0F | Branch if carry clear
	LDA $96A6			; AD A6 96 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA #$FF			 ; A9 FF | Read graphics status
	STA $9706,X		  ; 9D 06 97 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4E2
; Address: $C3DD6B
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4E2:
	JSR $DDB0			; 20 B0 DD | Jump to subroutine
	LDA $96A6			; AD A6 96 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $96A8			; AD A8 96 | Read graphics status
	STA $5C			  ; 85 5C | Update graphics data
	LDY #$04			 ; A0 04 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4E4
; Address: $C3DD7D
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4E4:
	JSR $DE25			; 20 25 DE | Jump to subroutine
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4E5
; Address: $C3DD82
; Size: 45 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4E5:
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA $002140		  ; AF 40 21 00 | Read graphics status
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BNE $F6			  ; D0 F6 | Branch if not equal
	CMP $96A2			; CD A2 96 | Compare accumulator (absolute)
	BNE $F1			  ; D0 F1 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	STA $002142		  ; 8F 42 21 00 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	STA $002143		  ; 8F 43 21 00 | Update graphics data
	TXA				  ; 8A | Transfer X register to accumulator
	STA $002141		  ; 8F 41 21 00 | Update graphics data
	INC $96A2			; EE A2 96 | Increment (absolute)
	LDA $96A2			; AD A2 96 | Read graphics status
	STA $002140		  ; 8F 40 21 00 | Update graphics data
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4E6
; Address: $C3DDB0
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4E6:
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	LDA $002140		  ; AF 40 21 00 | Read graphics status
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BNE $F6			  ; D0 F6 | Branch if not equal
	CMP $96A2			; CD A2 96 | Compare accumulator (absolute)
	BNE $F1			  ; D0 F1 | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	STA $002142		  ; 8F 42 21 00 | Update graphics data
	XBA				  ; EB | Exchange accumulator bytes
	STA $002143		  ; 8F 43 21 00 | Update graphics data
	INC $96A2			; EE A2 96 | Increment (absolute)
	LDA $96A2			; AD A2 96 | Read graphics status
	STA $002140		  ; 8F 40 21 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4E7
; Address: $C3DDD9
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4E7:
	REP #$20			 ; C2 20 | Reset processor status bits
	PLA				  ; 68 | Pull accumulator from stack
	STA $002142		  ; 8F 42 21 00 | Update graphics data
	INC $96A2			; EE A2 96 | Increment (absolute)
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $96A2			; AD A2 96 | Read graphics status
	STA $002140		  ; 8F 40 21 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4E8
; Address: $C3DDEF
; Size: 47 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4E8:
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $002140		  ; AF 40 21 00 | Read graphics status
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BNE $F6			  ; D0 F6 | Branch if not equal
	CMP $96A2			; CD A2 96 | Compare accumulator (absolute)
	BNE $F1			  ; D0 F1 | Branch if not equal
	BVC $8F			  ; 50 8F | Branch if overflow clear
	EOR ($21,X)		  ; 41 21 | PPU graphics register access
	INY				  ; C8 | Increment Y register
	BVC $8F			  ; 50 8F | Branch if overflow clear
	WDM #$21			 ; 42 21 | PPU graphics register access
	INY				  ; C8 | Increment Y register
	BVC $8F			  ; 50 8F | Branch if overflow clear
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	INC $96A2			; EE A2 96 | Increment (absolute)
	LDA $96A2			; AD A2 96 | Read graphics status
	STA $002140		  ; 8F 40 21 00 | Update graphics data
	DEX				  ; CA | Decrement X register
	BNE $CF			  ; D0 CF | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4E9
; Address: $C3DE25
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4E9:
	PHA				  ; 48 | Push accumulator to stack
	STZ $5E			  ; 64 5E | Store zero to zero page
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $002137		  ; AF 37 21 00 | Read graphics status
	LDA $00213F		  ; AF 3F 21 00 | Read graphics status
	LDA $00213D		  ; AF 3D 21 00 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	LDA #$00			 ; A9 00 | Read graphics status
	XBA				  ; EB | Exchange accumulator bytes
	TAX				  ; AA | Transfer accumulator to X register
	LDA				  ; BF B3 DE C1 | Read graphics status
	BEQ $57			  ; F0 57 | Branch if equal
	STA $5E			  ; 85 5E | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	ORA ($C5,X)		  ; 01 C5 | Logical OR with accumulator ((zero page,X))
	LSR $0290,X		  ; 5E 90 02 | Logical shift right (absolute,X)
	LDA $5E			  ; A5 5E | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDX #$0D			 ; A2 0D | Load immediate value into X register
	LDA $5C			  ; A5 5C | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4EA
; Address: $C3DE53
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4EA:
	JSR $DD82			; 20 82 DD | Jump to subroutine
	ORA ($20,X)		  ; 01 20 | Logical OR with accumulator ((zero page,X))
	BCS $DD			  ; B0 DD | Branch if carry set
	ORA ($0A,X)		  ; 01 0A | Logical OR with accumulator ((zero page,X))
	ORA ($65,X)		  ; 01 65 | Logical OR with accumulator ((zero page,X))
	JMP $FA5C85		  ; 5C 85 5C FA | Jump to address long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4EB
; Address: $C3DE65
; Size: 44 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4EB:
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $002140		  ; AF 40 21 00 | Read graphics status
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BNE $F6			  ; D0 F6 | Branch if not equal
	CMP $96A2			; CD A2 96 | Compare accumulator (absolute)
	BNE $F1			  ; D0 F1 | Branch if not equal
	BVC $8F			  ; 50 8F | Branch if overflow clear
	EOR ($21,X)		  ; 41 21 | PPU graphics register access
	INY				  ; C8 | Increment Y register
	BVC $8F			  ; 50 8F | Branch if overflow clear
	WDM #$21			 ; 42 21 | PPU graphics register access
	INY				  ; C8 | Increment Y register
	BVC $8F			  ; 50 8F | Branch if overflow clear
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	INY				  ; C8 | Increment Y register
	INC $96A2			; EE A2 96 | Increment (absolute)
	LDA $96A2			; AD A2 96 | Read graphics status
	STA $002140		  ; 8F 40 21 00 | Update graphics data
	DEX				  ; CA | Decrement X register
	BNE $CF			  ; D0 CF | Branch if not equal

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4EC
; Address: $C3DE98
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4EC:
	JSL $C028B4		  ; 22 B4 28 C0 | Jump to subroutine long
	REP #$20			 ; C2 20 | Reset processor status bits
	LDA $983C			; AD 3C 98 | Read graphics status
	BEQ $0D			  ; F0 0D | Branch if equal
	PLA				  ; 68 | Pull accumulator from stack
	SEC				  ; 38 | Set carry flag
	SBC $5E			  ; E5 5E | Subtract with carry (zero page)
	BCC $05			  ; 90 05 | Branch if carry clear
	BEQ $03			  ; F0 03 | Branch if equal
	JMP $DE25			; 4C 25 DE | Jump to address
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4ED
; Address: $C3DEB0
; Size: 3 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4ED:
	PLA				  ; 68 | Pull accumulator from stack
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4EE
; Address: $C3DEB3
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4EE:
	TXS				  ; 9A | Transfer X register to stack pointer
	STA $9798,Y		  ; 99 98 97 | Update graphics data
	STA ($91),Y		  ; 91 91 | Update graphics data
	BCC $8F			  ; 90 8F | Branch if carry clear
	STA $8C8D8E		  ; 8F 8E 8D 8C | Update graphics data
	STY $8A8B			; 8C 8B 8A | Store Y register to absolute address
	BIT #$89			 ; 89 89 | Test bits in accumulator (immediate)
	DEY				  ; 88 | Decrement Y register
	STX $86			  ; 86 86 | Store X register to zero page
	STA $84			  ; 85 84 | Update graphics data
	STA ($80,X)		  ; 81 80 | Update graphics data
	BRA $7F			  ; 80 7F | Branch always
	ROR $7D7E,X		  ; 7E 7E 7D | Rotate right (absolute,X)
	PLY				  ; 7A | Pull Y register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4EF
; Address: $C3DEDF
; Size: 21 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4EF:
	ADC $7878,Y		  ; 79 78 78 | Add with carry (absolute,Y)
	ADC ($70),Y		  ; 71 70 | Add with carry ((zero page),Y)
	ROR $6D6D			; 6E 6D 6D | Rotate right (absolute)
	JMP ($6A6B)		  ; 6C 6B 6A | Jump to address (absolute indirect)
	ROR				  ; 6A | Rotate right (accumulator)
	ADC #$68			 ; 69 68 | Add with carry (immediate)
	ROR $65			  ; 66 65 | Rotate right (zero page)
	STZ $64			  ; 64 64 | Store zero to zero page
	ADC ($61,X)		  ; 61 61 | Add with carry ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4F0
; Address: $C3DF04
; Size: 58 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4F0:
	LSR $5C5D,X		  ; 5E 5D 5C | Logical shift right (absolute,X)
	JMP $595A5B		  ; 5C 5B 5A 59 | Jump to address long
	EOR $5758,Y		  ; 59 58 57 | Exclusive OR with accumulator (absolute,Y)
	EOR ($50),Y		  ; 51 50 | Exclusive OR with accumulator ((zero page),Y)
	BVC $4F			  ; 50 4F | Branch if overflow clear
	LSR $4D4E			; 4E 4E 4D | Logical shift right (absolute)
	JMP $4B4B			; 4C 4B 4B | Jump to address
	LSR				  ; 4A | Logical shift right (accumulator)
	EOR #$48			 ; 49 48 | Exclusive OR with accumulator (immediate)
	PHA				  ; 48 | Push accumulator to stack
	LSR $45			  ; 46 45 | Logical shift right (zero page)
	EOR $44			  ; 45 44 | Exclusive OR with accumulator (zero page)
	WDM #$42			 ; 42 42 | Hardware register operation
	EOR ($40,X)		  ; 41 40 | Exclusive OR with accumulator ((zero page,X))
	RTI				  ; 40 | Return from interrupt
	ROL $3D3D,X		  ; 3E 3D 3D | Rotate left (absolute,X)
	DEC				  ; 3A | Decrement accumulator
	DEC				  ; 3A | Decrement accumulator
	AND $3738,Y		  ; 39 38 37 | Logical AND with accumulator (absolute,Y)
	AND ($31),Y		  ; 31 31 | Logical AND with accumulator ((zero page),Y)
	BMI $2F			  ; 30 2F | Branch if negative
	ROL $2C2D			; 2E 2D 2C | Rotate left (absolute)
	BIT $2A2B			; 2C 2B 2A | Test bits in accumulator (absolute)
	AND #$29			 ; 29 29 | Logical AND with accumulator (immediate)
	PLP				  ; 28 | Pull processor status from stack
	ROL $26			  ; 26 26 | Rotate left (zero page)
	AND $24			  ; 25 24 | Logical AND with accumulator (zero page)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4F1
; Address: $C3DF55
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4F1:
	JSL $202021		  ; 22 21 20 20 | Jump to subroutine long
	ASL $1D1E,X		  ; 1E 1E 1D | Arithmetic shift left (absolute,X)
	INC				  ; 1A | Increment accumulator
	ORA $1818,Y		  ; 19 18 18 | Logical OR with accumulator (absolute,Y)
	ORA ($10),Y		  ; 11 10 | Logical OR with accumulator ((zero page),Y)
	BPL $0F			  ; 10 0F | Branch if positive
	ASL $0D0D			; 0E 0D 0D | Arithmetic shift left (absolute)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA #$08			 ; 09 08 | Logical OR with accumulator (immediate)
	ASL $05			  ; 06 05 | Arithmetic shift left (zero page)
	ORA ($01,X)		  ; 01 01 | Logical OR with accumulator ((zero page,X))
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4F2
; Address: $C3DF9B
; Size: 43 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4F2:
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	LDY #$A0			 ; A0 A0 | Load immediate value into Y register
	PHP				  ; 08 | Push processor status to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $002140		  ; AF 40 21 00 | Read graphics status
	RTI				  ; 40 | Return from interrupt
	AND ($00,X)		  ; 21 00 | Logical AND with accumulator ((zero page,X))
	BNE $F6			  ; D0 F6 | Branch if not equal
	CMP $96A2			; CD A2 96 | Compare accumulator (absolute)
	BNE $F1			  ; D0 F1 | Branch if not equal
	PLP				  ; 28 | Pull processor status from stack
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4F3
; Address: $C3DFC7
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4F3:
	STA $004204		  ; 8F 04 42 00 | Update graphics data
	LDA #$03			 ; A9 03 | Read graphics status
	SEP #$20			 ; E2 20 | Set processor status bits
	STA $004206		  ; 8F 06 42 00 | Update graphics data
	REP #$20			 ; C2 20 | Reset processor status bits
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	NOP				  ; EA | No operation
	LDA $004214		  ; AF 14 42 00 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack
	LDA $004216		  ; AF 16 42 00 | Read graphics status
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	BEQ $05			  ; F0 05 | Branch if equal
	ORA ($1A,X)		  ; 01 1A | Logical OR with accumulator ((zero page,X))
	ORA ($68,X)		  ; 01 68 | Logical OR with accumulator ((zero page,X))
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4F4
; Address: $C3DFF3
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4F4:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $96D6,X		  ; BD D6 96 | Read graphics status
	CMP $96AE			; CD AE 96 | Compare accumulator (absolute)
	BEQ $18			  ; F0 18 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4F5
; Address: $C3E003
; Size: 17 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4F5:
	BCC $F1			  ; 90 F1 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $96D6,X		  ; BD D6 96 | Read graphics status
	BMI $13			  ; 30 13 | Branch if negative
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	BRA $1A			  ; 80 1A | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4F6
; Address: $C3E016
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4F6:
	JSR $E065			; 20 65 E0 | Game work RAM access
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $96B0			; 8D B0 96 | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4F8
; Address: $C3E026
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4F8:
	JSR $E065			; 20 65 E0 | Game work RAM access
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $96B0			; 8D B0 96 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4F9
; Address: $C3E030
; Size: 40 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4F9:
	BRA $FE			  ; 80 FE | Branch always
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $96D6,X		  ; BD D6 96 | Read graphics status
	CMP $96AE			; CD AE 96 | Compare accumulator (absolute)
	BEQ $18			  ; F0 18 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $96D6,X		  ; BD D6 96 | Read graphics status
	BMI $10			  ; 30 10 | Branch if negative
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	BRA $0E			  ; 80 0E | Branch always
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $96B0			; 8D B0 96 | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4FA
; Address: $C3E05C
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4FA:
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $96B0			; 8D B0 96 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4FB
; Address: $C3E063
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4FB:
	BRA $FE			  ; 80 FE | Branch always
	LDA $9806			; AD 06 98 | Read graphics status
	CMP $96EE,X		  ; DD EE 96 | Compare accumulator (absolute,X)
	BCS $03			  ; B0 03 | Branch if carry set
	STA $96EE,X		  ; 9D EE 96 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4FC
; Address: $C3E071
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4FC:
	LDA $980E			; AD 0E 98 | Read graphics status
	STA $96A8			; 8D A8 96 | Update graphics data
	LDX $96A4			; AE A4 96 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4FD
; Address: $C3E07A
; Size: 35 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4FD:
	JSL $C9050D		  ; 22 0D 05 C9 | Jump to subroutine long
	DEC				  ; 3A | Decrement accumulator
	INY				  ; C8 | Increment Y register
	BVC $A0			  ; 50 A0 | Branch if overflow clear
	BVC $48			  ; 50 48 | Branch if overflow clear
	INY				  ; C8 | Increment Y register
	INY				  ; C8 | Increment Y register
	BVC $29			  ; 50 29 | Branch if overflow clear
	STA $52			  ; 85 52 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	STA $50			  ; 85 50 | Update graphics data
	BVC $20			  ; 50 20 | Branch if overflow clear
	STA $96AC			; 8D AC 96 | Update graphics data
	LDY #$02			 ; A0 02 | Load immediate value into Y register
	BVC $18			  ; 50 18 | Branch if overflow clear
	ADC $96A8			; 6D A8 96 | Add with carry (absolute)
	STA $96AA			; 8D AA 96 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4FE
; Address: $C3E0AC
; Size: 31 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4FE:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $9706,X		  ; BD 06 97 | Read graphics status
	CMP $96A4			; CD A4 96 | Compare accumulator (absolute)
	BEQ $18			  ; F0 18 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BCC $F1			  ; 90 F1 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $9706,X		  ; BD 06 97 | Read graphics status
	BMI $13			  ; 30 13 | Branch if negative
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	BRA $1A			  ; 80 1A | Branch always

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_4FF
; Address: $C3E0CF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_4FF:
	JSR $E0EB			; 20 EB E0 | Game work RAM access
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $96A6			; 8D A6 96 | Update graphics data
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_502
; Address: $C3E0DF
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_502:
	JSR $E0EB			; 20 EB E0 | Game work RAM access
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	STA $96A6			; 8D A6 96 | Update graphics data
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_503
; Address: $C3E0E9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_503:
	BRA $FE			  ; 80 FE | Branch always
	LDA $9806			; AD 06 98 | Read graphics status
	CMP $9786,X		  ; DD 86 97 | Compare accumulator (absolute,X)
	BCS $03			  ; B0 03 | Branch if carry set
	STA $9786,X		  ; 9D 86 97 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_504
; Address: $C3E0F7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_504:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$0A			 ; A9 0A | Read graphics status
	LDY #$C5			 ; A0 C5 | Load immediate value into Y register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_505
; Address: $C3E104
; Size: 57 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_505:
	JSL $C1D8A0		  ; 22 A0 D8 C1 | Jump to subroutine long
	PEA #$0000		   ; F4 00 00 | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	SEP #$20			 ; E2 20 | Set processor status bits
	LDA $2141			; AD 41 21 | PPU graphics register access
	CMP $2141			; CD 41 21 | PPU graphics register access
	BNE $F8			  ; D0 F8 | Branch if not equal
	CMP #$65			 ; C9 65 | Compare accumulator (immediate)
	BNE $F4			  ; D0 F4 | Branch if not equal
	LDA $2142			; AD 42 21 | PPU graphics register access
	CMP $2142			; CD 42 21 | PPU graphics register access
	BNE $F8			  ; D0 F8 | Branch if not equal
	CMP #$61			 ; C9 61 | Compare accumulator (immediate)
	BNE $E8			  ; D0 E8 | Branch if not equal
	LDA $2143			; AD 43 21 | PPU graphics register access
	CMP $2143			; CD 43 21 | PPU graphics register access
	BNE $F8			  ; D0 F8 | Branch if not equal
	CMP #$74			 ; C9 74 | Compare accumulator (immediate)
	BNE $DC			  ; D0 DC | Branch if not equal
	REP #$20			 ; C2 20 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STZ $96A2			; 9C A2 96 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_507
; Address: $C3E142
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_507:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_508
; Address: $C3E149
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_508:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDA #$00			 ; A9 00 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_509
; Address: $C3E14E
; Size: 22 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_509:
	JSR $E1A5			; 20 A5 E1 | Jump to subroutine
	LDA #$FF			 ; A9 FF | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STA $96E6,X		  ; 9D E6 96 | Update graphics data
	STA $96FE,X		  ; 9D FE 96 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$04			 ; E0 04 | Compare X register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_50A
; Address: $C3E167
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_50A:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDA #$02			 ; A9 02 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_50B
; Address: $C3E173
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_50B:
	JSR $E1A5			; 20 A5 E1 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_50C
; Address: $C3E179
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_50C:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDA #$04			 ; A9 04 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_50D
; Address: $C3E185
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_50D:
	JSR $E1A5			; 20 A5 E1 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_50E
; Address: $C3E18B
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_50E:
	REP #$30			 ; C2 30 | Reset processor status bits
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDA $9806			; AD 06 98 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BNE $03			  ; D0 03 | Branch if not equal
	JMP $E14B			; 4C 4B E1 | Jump to address

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_50F
; Address: $C3E19F
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_50F:
	JSR $E1A5			; 20 A5 E1 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_511
; Address: $C3E1A5
; Size: 79 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_511:
	PHA				  ; 48 | Push accumulator to stack
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $9706,X		  ; BD 06 97 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	LDA $9786,X		  ; BD 86 97 | Read graphics status
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	ORA #$A9			 ; 09 A9 | Logical OR with accumulator (immediate)
	STA $9706,X		  ; 9D 06 97 | Update graphics data
	STA $9786,X		  ; 9D 86 97 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$80			 ; E0 80 | Compare X register (immediate)
	BCC $E1			  ; 90 E1 | Branch if carry clear
	LDX #$00			 ; A2 00 | Load immediate value into X register
	LDA $96D6,X		  ; BD D6 96 | Read graphics status
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $10			  ; F0 10 | Branch if equal
	LDA $96EE,X		  ; BD EE 96 | Read graphics status
	ORA ($90,X)		  ; 01 90 | Logical OR with accumulator ((zero page,X))
	ORA #$A9			 ; 09 A9 | Logical OR with accumulator (immediate)
	STA $96D6,X		  ; 9D D6 96 | Update graphics data
	STA $96EE,X		  ; 9D EE 96 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$10			 ; E0 10 | Compare X register (immediate)
	BCC $E1			  ; 90 E1 | Branch if carry clear
	PLA				  ; 68 | Pull accumulator from stack
	STA $9806			; 8D 06 98 | Update graphics data
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $0F			  ; F0 0F | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $1A			  ; F0 1A | Branch if equal
	LDA $980A			; AD 0A 98 | Read graphics status
	STA $980C			; 8D 0C 98 | Update graphics data
	STA $980E			; 8D 0E 98 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_512
; Address: $C3E202
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_512:
	LDA #$00			 ; A9 00 | Read graphics status
	STA $980E			; 8D 0E 98 | Update graphics data
	STA $9808			; 8D 08 98 | Update graphics data
	STA $980A			; 8D 0A 98 | Update graphics data
	STA $980C			; 8D 0C 98 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_513
; Address: $C3E212
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_513:
	LDA $9808			; AD 08 98 | Read graphics status
	STA $980E			; 8D 0E 98 | Update graphics data
	STA $980A			; 8D 0A 98 | Update graphics data
	STA $980C			; 8D 0C 98 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_515
; Address: $C3E220
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_515:
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	ORA ($6D,X)		  ; 01 6D | Logical OR with accumulator ((zero page,X))
	ASL $8D98			; 0E 98 8D | Arithmetic shift left (absolute)
	ASL $6898			; 0E 98 68 | Arithmetic shift left (absolute)
	LDA $9806			; AD 06 98 | Read graphics status
	CMP #$00			 ; C9 00 | Compare accumulator (immediate)
	BEQ $16			  ; F0 16 | Branch if equal
	CMP #$02			 ; C9 02 | Compare accumulator (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	LDA $980E			; AD 0E 98 | Read graphics status
	STA $980C			; 8D 0C 98 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_516
; Address: $C3E23E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_516:
	LDA $980E			; AD 0E 98 | Read graphics status
	STA $980A			; 8D 0A 98 | Update graphics data
	STA $980C			; 8D 0C 98 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_517
; Address: $C3E248
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_517:
	LDA $980E			; AD 0E 98 | Read graphics status
	STA $9808			; 8D 08 98 | Update graphics data
	STA $980A			; 8D 0A 98 | Update graphics data
	STA $980C			; 8D 0C 98 | Update graphics data
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_518
; Address: $C3E255
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_518:
	JSL $C1E32E		  ; 22 2E E3 C1 | Jump to subroutine long
	ORA $4800,X		  ; 1D 00 48 | Logical OR with accumulator (absolute,X)
	LDA #$00			 ; A9 00 | Read graphics status
	STA $99AF			; 8D AF 99 | Update graphics data
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_519
; Address: $C3E264
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_519:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $99AF			; AD AF 99 | Read graphics status
	STA $9814			; 8D 14 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_51A
; Address: $C3E276
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_51A:
	JSR $E3E2			; 20 E2 E3 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_51B
; Address: $C3E281
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_51B:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_51C
; Address: $C3E286
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_51C:
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $99AF			; AD AF 99 | Read graphics status
	STA $9814			; 8D 14 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_51D
; Address: $C3E293
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_51D:
	JSR $E6E7			; 20 E7 E6 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_51E
; Address: $C3E29E
; Size: 28 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_51E:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA #$FF			 ; A9 FF | Read graphics status
	LDX #$00			 ; A2 00 | Load immediate value into X register
	STA $96D6,X		  ; 9D D6 96 | Update graphics data
	STA $96EE,X		  ; 9D EE 96 | Update graphics data
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$18			 ; E0 18 | Compare X register (immediate)
	BCC $F3			  ; 90 F3 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_51F
; Address: $C3E2BD
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_51F:
	JSL $C1E0F7		  ; 22 F7 E0 C1 | Jump to subroutine long
	LDA #$00			 ; A9 00 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_520
; Address: $C3E2C5
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_520:
	JSL $C1D954		  ; 22 54 D9 C1 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_522
; Address: $C3E2D7
; Size: 25 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_522:
	JSL $C1DC63		  ; 22 63 DC C1 | Jump to subroutine long
	STZ $9818			; 9C 18 98 | Store zero to absolute
	STZ $981A			; 9C 1A 98 | Store zero to absolute
	STZ $981C			; 9C 1C 98 | Store zero to absolute
	STZ $981E			; 9C 1E 98 | Store zero to absolute
	STZ $9820			; 9C 20 98 | Store zero to absolute
	STZ $9822			; 9C 22 98 | Store zero to absolute
	STZ $9824			; 9C 24 98 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_523
; Address: $C3E2F0
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_523:
	STZ $9826			; 9C 26 98 | Store zero to absolute
	STZ $9828			; 9C 28 98 | Store zero to absolute
	STZ $982A			; 9C 2A 98 | Store zero to absolute
	STZ $982C			; 9C 2C 98 | Store zero to absolute
	STZ $982E			; 9C 2E 98 | Store zero to absolute
	STZ $9830			; 9C 30 98 | Store zero to absolute
	STZ $9832			; 9C 32 98 | Store zero to absolute
	STZ $9810			; 9C 10 98 | Store zero to absolute

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_524
; Address: $C3E308
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_524:
	JSL $C1E179		  ; 22 79 E1 C1 | Jump to subroutine long
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_525
; Address: $C3E314
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_525:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $9814			; 8D 14 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_526
; Address: $C3E323
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_526:
	JSR $E6C3			; 20 C3 E6 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_527
; Address: $C3E32E
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_527:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $09A3,X		  ; 7E A3 09 | Rotate right (absolute,X)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_528
; Address: $C3E34A
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_528:
	INC				  ; 1A | Increment accumulator
	ORA #$F4			 ; 09 F4 | Logical OR with accumulator (immediate)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_529
; Address: $C3E352
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_529:
	JSR $E6C3			; 20 C3 E6 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_52A
; Address: $C3E35B
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_52A:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $99AF			; AD AF 99 | Read graphics status
	STA $9814			; 8D 14 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_52B
; Address: $C3E36D
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_52B:
	JSR $E6C3			; 20 C3 E6 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_52C
; Address: $C3E378
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_52C:
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
; Bank06_GraphicsFunction_52D
; Address: $C3E384
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_52D:
	JSR $E3DA			; 20 DA E3 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_52E
; Address: $C3E38F
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_52E:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_52F
; Address: $C3E393
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_52F:
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $09A3,X		  ; 7E A3 09 | Rotate right (absolute,X)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$F4			 ; 09 F4 | Logical OR with accumulator (immediate)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	LDA $7E9814		  ; AF 14 98 7E | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_530
; Address: $C3E3B7
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_530:
	JSR $E3DA			; 20 DA E3 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_531
; Address: $C3E3C0
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_531:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $99AF			; AD AF 99 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_532
; Address: $C3E3CF
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_532:
	JSR $E3DA			; 20 DA E3 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_538
; Address: $C3E3EB
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_538:
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $9814			; 8D 14 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_539
; Address: $C3E3F9
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_539:
	JSR $E6D4			; 20 D4 E6 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_53A
; Address: $C3E404
; Size: 34 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_53A:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $C8C8,X		  ; 7E C8 C8 | Rotate right (absolute,X)
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	ORA #$1A			 ; 09 1A | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$F4			 ; 09 F4 | Logical OR with accumulator (immediate)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_53B
; Address: $C3E42E
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_53B:
	JSR $E6D4			; 20 D4 E6 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_53C
; Address: $C3E437
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_53C:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_53D
; Address: $C3E43C
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_53D:
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $99AF			; AD AF 99 | Read graphics status
	STA $9814			; 8D 14 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_53E
; Address: $C3E449
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_53E:
	JSR $E6D4			; 20 D4 E6 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_53F
; Address: $C3E454
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_53F:
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
; Bank06_GraphicsFunction_540
; Address: $C3E460
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_540:
	JSR $E51C			; 20 1C E5 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_541
; Address: $C3E46B
; Size: 27 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_541:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $C8C8,X		  ; 7E C8 C8 | Rotate right (absolute,X)
	ORA #$AA			 ; 09 AA | Logical OR with accumulator (immediate)
	ORA #$1A			 ; 09 1A | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_542
; Address: $C3E48D
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_542:
	INC				  ; 1A | Increment accumulator
	ORA #$F4			 ; 09 F4 | Logical OR with accumulator (immediate)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_543
; Address: $C3E495
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_543:
	JSR $E51C			; 20 1C E5 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_544
; Address: $C3E49E
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_544:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $99AF			; AD AF 99 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_545
; Address: $C3E4AD
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_545:
	JSR $E51C			; 20 1C E5 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_546
; Address: $C3E4B8
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_546:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	STA $9814			; 8D 14 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_547
; Address: $C3E4C7
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_547:
	JSR $E6E7			; 20 E7 E6 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_548
; Address: $C3E4D2
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_548:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_549
; Address: $C3E4D6
; Size: 26 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_549:
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $09A3,X		  ; 7E A3 09 | Rotate right (absolute,X)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$F4			 ; 09 F4 | Logical OR with accumulator (immediate)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_54A
; Address: $C3E4F6
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_54A:
	JSR $E6E7			; 20 E7 E6 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_54B
; Address: $C3E4FF
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_54B:
	PHP				  ; 08 | Push processor status to stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $99AF			; AD AF 99 | Read graphics status
	STA $9814			; 8D 14 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_54C
; Address: $C3E511
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_54C:
	JSR $E6E7			; 20 E7 E6 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_54F
; Address: $C3E524
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_54F:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_550
; Address: $C3E529
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_550:
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_551
; Address: $C3E531
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_551:
	JSR $E6A0			; 20 A0 E6 | Jump to subroutine
	ORA $7A			  ; 05 7A | Logical OR with accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_552
; Address: $C3E53C
; Size: 33 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_552:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $09A3,X		  ; 7E A3 09 | Rotate right (absolute,X)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$F4			 ; 09 F4 | Logical OR with accumulator (immediate)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	LDA $9814			; AD 14 98 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_553
; Address: $C3E563
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_553:
	JSR $E6A0			; 20 A0 E6 | Jump to subroutine
	ORA $7A			  ; 05 7A | Logical OR with accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_554
; Address: $C3E56E
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_554:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_556
; Address: $C3E57E
; Size: 10 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_556:
	JSR $E6A0			; 20 A0 E6 | Jump to subroutine
	ORA $7A			  ; 05 7A | Logical OR with accumulator (zero page)
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_557
; Address: $C3E589
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_557:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_558
; Address: $C3E596
; Size: 39 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_558:
	JSR $E6A0			; 20 A0 E6 | Jump to subroutine
	JMP $E5DC			; 4C DC E5 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $09A3,X		  ; 7E A3 09 | Rotate right (absolute,X)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$F4			 ; 09 F4 | Logical OR with accumulator (immediate)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	LDA $9814			; AD 14 98 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_559
; Address: $C3E5C3
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_559:
	JSR $E6A0			; 20 A0 E6 | Jump to subroutine
	JMP $E5DC			; 4C DC E5 | Jump to address
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_55A
; Address: $C3E5D2
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_55A:
	PLB				  ; AB | Pull data bank register from stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	LDA $9816			; AD 16 98 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_55B
; Address: $C3E5D9
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_55B:
	JSR $E6A0			; 20 A0 E6 | Jump to subroutine
	CMP #$FF			 ; C9 FF | Compare accumulator (immediate)
	BEQ $07			  ; F0 07 | Branch if equal
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	CLC				  ; 18 | Clear carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_55C
; Address: $C3E5E8
; Size: 7 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_55C:
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	SEC				  ; 38 | Set carry flag
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_55D
; Address: $C3E5EF
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_55D:
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
; Bank06_GraphicsFunction_55E
; Address: $C3E5FB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_55E:
	JSR $E693			; 20 93 E6 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_55F
; Address: $C3E606
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_55F:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_560
; Address: $C3E616
; Size: 19 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_560:
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $09A3,X		  ; 7E A3 09 | Rotate right (absolute,X)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$F4			 ; 09 F4 | Logical OR with accumulator (immediate)
	ROR $AB7E,X		  ; 7E 7E AB | Rotate right (absolute,X)
	PLB				  ; AB | Pull data bank register from stack
	LDA $9814			; AD 14 98 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_561
; Address: $C3E62D
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_561:
	JSR $E693			; 20 93 E6 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_562
; Address: $C3E636
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_562:
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
; Bank06_GraphicsFunction_563
; Address: $C3E642
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_563:
	JSR $E684			; 20 84 E6 | Jump to subroutine
	PLB				  ; AB | Pull data bank register from stack
	REP #$30			 ; C2 30 | Reset processor status bits
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_564
; Address: $C3E64D
; Size: 24 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_564:
	PHP				  ; 08 | Push processor status to stack
	SEI				  ; 78 | Set interrupt disable flag
	REP #$30			 ; C2 30 | Reset processor status bits
	PHB				  ; 8B | Push data bank register to stack
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	PHY				  ; 5A | Push Y register to stack
	SEP #$20			 ; E2 20 | Set processor status bits
	PHA				  ; 48 | Push accumulator to stack
	PLB				  ; AB | Pull data bank register from stack
	REP #$20			 ; C2 20 | Reset processor status bits
	LDY #$01			 ; A0 01 | Load immediate value into Y register
	ORA #$8F			 ; 09 8F | Logical OR with accumulator (immediate)
	TYA				  ; 98 | Transfer Y register to accumulator
	ROR $C8C8,X		  ; 7E C8 C8 | Rotate right (absolute,X)
	ORA #$A8			 ; 09 A8 | Logical OR with accumulator (immediate)

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_565
; Address: $C3E66C
; Size: 14 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_565:
	ORA #$1A			 ; 09 1A | Logical OR with accumulator (immediate)
	INC				  ; 1A | Increment accumulator
	INC				  ; 1A | Increment accumulator
	ORA #$BB			 ; 09 BB | Logical OR with accumulator (immediate)
	PEA #$7E7E		   ; F4 7E 7E | Push effective address to stack
	PLB				  ; AB | Pull data bank register from stack
	PLB				  ; AB | Pull data bank register from stack
	LDA $9814			; AD 14 98 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_566
; Address: $C3E67B
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_566:
	JSR $E684			; 20 84 E6 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	PLB				  ; AB | Pull data bank register from stack
	PLP				  ; 28 | Pull processor status from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_568
; Address: $C3E685
; Size: 6 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_568:
	JSR $E6AE			; 20 AE E6 | Jump to subroutine
	PLX				  ; FA | Pull X register from stack
	BCC $07			  ; 90 07 | Branch if carry clear

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_571
; Address: $C3E6AE
; Size: 15 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_571:
	LDX #$00			 ; A2 00 | Load immediate value into X register
	CMP $9818,X		  ; DD 18 98 | Compare accumulator (absolute,X)
	BEQ $09			  ; F0 09 | Branch if equal
	INX				  ; E8 | Increment X register
	INX				  ; E8 | Increment X register
	CPX #$0E			 ; E0 0E | Compare X register (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_572
; Address: $C3E6BF
; Size: 4 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_572:
	TXA				  ; 8A | Transfer X register to accumulator
	LSR				  ; 4A | Logical shift right (accumulator)
	SEC				  ; 38 | Set carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_573
; Address: $C3E6C3
; Size: 8 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_573:
	JSR $E714			; 20 14 E7 | Jump to subroutine
	BCC $0B			  ; 90 0B | Branch if carry clear
	LDX $9812			; AE 12 98 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_577
; Address: $C3E6D5
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_577:
	JSR $E714			; 20 14 E7 | Jump to subroutine
	PLY				  ; 7A | Pull Y register from stack
	BCC $0B			  ; 90 0B | Branch if carry clear
	LDX $9812			; AE 12 98 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_57A
; Address: $C3E6E7
; Size: 23 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_57A:
	JSR $E714			; 20 14 E7 | Jump to subroutine
	BCC $1A			  ; 90 1A | Branch if carry clear
	PHA				  ; 48 | Push accumulator to stack
	LDA $9812			; AD 12 98 | Read graphics status
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $9818,X		  ; BD 18 98 | Read graphics status
	CMP $9814			; CD 14 98 | Compare accumulator (absolute)
	BNE $0D			  ; D0 0D | Branch if not equal
	PLA				  ; 68 | Pull accumulator from stack
	LDX $9812			; AE 12 98 | Load from absolute address into X register

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_580
; Address: $C3E714
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_580:
	LDX $9814			; AE 14 98 | Load from absolute address into X register
	CPX #$00			 ; E0 00 | Compare X register (immediate)
	BNE $02			  ; D0 02 | Branch if not equal
	CLC				  ; 18 | Clear carry flag
	RTS				  ; 60 | Return from subroutine

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_581
; Address: $C3E71E
; Size: 30 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_581:
	JSL $C903EE		  ; 22 EE 03 C9 | Jump to subroutine long
	LDY $C723,X		  ; BC 23 C7 | Load from absolute,X into Y register
	AND #$FF			 ; 29 FF | Logical AND with accumulator (immediate)
	STA $9812			; 8D 12 98 | Update graphics data
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BCC $33			  ; 90 33 | Branch if carry clear
	CMP #$05			 ; C9 05 | Compare accumulator (immediate)
	BCS $1E			  ; B0 1E | Branch if carry set
	PHA				  ; 48 | Push accumulator to stack
	LDA $9810			; AD 10 98 | Read graphics status
	AND #$01			 ; 29 01 | Logical AND with accumulator (immediate)
	CLC				  ; 18 | Clear carry flag
	ORA ($8D,X)		  ; 01 8D | Logical OR with accumulator ((zero page,X))
	TYA				  ; 98 | Transfer Y register to accumulator

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_584
; Address: $C3E74F
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_584:
	JSL $C1D9D1		  ; 22 D1 D9 C1 | Jump to subroutine long
	INC $9810			; EE 10 98 | Increment (absolute)
	BRA $29			  ; 80 29 | Branch always
	STA $9812			; 8D 12 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_586
; Address: $C3E762
; Size: 9 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_586:
	JSL $C1D9D1		  ; 22 D1 D9 C1 | Jump to subroutine long
	BRA $19			  ; 80 19 | Branch always
	LDA $9814			; AD 14 98 | Read graphics status

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_58C
; Address: $C3E783
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_58C:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDA #$00			 ; A9 00 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_58D
; Address: $C3E789
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_58D:
	JSL $C1D954		  ; 22 54 D9 C1 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	CMP #$03			 ; C9 03 | Compare accumulator (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_58E
; Address: $C3E797
; Size: 5 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_58E:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	LDA #$00			 ; A9 00 | Read graphics status
	PHA				  ; 48 | Push accumulator to stack

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_58F
; Address: $C3E79D
; Size: 13 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_58F:
	JSL $C1D954		  ; 22 54 D9 C1 | Jump to subroutine long
	PLA				  ; 68 | Pull accumulator from stack
	INC				  ; 1A | Increment accumulator
	CMP #$07			 ; C9 07 | Compare accumulator (immediate)
	BCC $F4			  ; 90 F4 | Branch if carry clear
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_590
; Address: $C3E7AB
; Size: 11 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_590:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	TXA				  ; 8A | Transfer X register to accumulator
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $9818,X		  ; BD 18 98 | Read graphics status
	STA $9826,X		  ; 9D 26 98 | Update graphics data

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_591
; Address: $C3E7B6
; Size: 12 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_591:
	LDA $9814			; AD 14 98 | Read graphics status
	STA $9818,X		  ; 9D 18 98 | Update graphics data
	STA $9816			; 8D 16 98 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTL				  ; 6B | Return from subroutine long

;------------------------------------------------------------------------------
; Bank06_GraphicsFunction_592
; Address: $C3E7C2
; Size: 18 bytes
;------------------------------------------------------------------------------
Bank06_GraphicsFunction_592:
	PHA				  ; 48 | Push accumulator to stack
	PHX				  ; DA | Push X register to stack
	ASL				  ; 0A | Arithmetic shift left (accumulator)
	TAX				  ; AA | Transfer accumulator to X register
	LDA $9818,X		  ; BD 18 98 | Read graphics status
	STA $9826,X		  ; 9D 26 98 | Update graphics data
	LDA #$00			 ; A9 00 | Read graphics status
	STA $9818,X		  ; 9D 18 98 | Update graphics data
	PLX				  ; FA | Pull X register from stack
	PLA				  ; 68 | Pull accumulator from stack
	RTS				  ; 60 | Return from subroutine
