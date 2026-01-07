;==============================================================================
; Dragon Quest III - Battle System (Bank 02)
; Combat mechanics and battle interface
;==============================================================================

.include "hardware.inc"

.segment "BATTLE_CODE"

Battle_Function_0000:
	CMP $29,X			; D5 29
	SBC $0000,Y		  ; F9 00 00
	BRK $00			  ; 00 00
	BRK $4C			  ; 00 4C
	CMP $F7			  ; C7 F7
	ASL				  ; 0A
	ASL				  ; 0A
	BIT $0126			; 2C 26 01
	DEC $F7C7,X		  ; DE C7 F7
	BPL $0026			; 10 11
	ORA $37011E,X		; 1F 1E 01 37
	INY				  ; C8
	SBC $01			  ; F7 01
	ASL				  ; 0A
	ASL $0110,X		  ; 1E 10 01
	ROR				  ; 6A
	INY				  ; C8
	SBC $0A			  ; F7 0A
	PLP				  ; 28
	ASL $0118			; 0E 18 01
	LDA $C8			  ; A3 C8
	SBC $00			  ; F7 00
	COP $20			  ; 02 20
	INC				  ; 1A
	ORA $E0			  ; 01 E0
	INY				  ; C8
	SBC $00			  ; F7 00
	PHD				  ; 0B
	RTS				  ; 60
	PHP				  ; 08
	ORA $19			  ; 01 19
	CMP #$F7			 ; C9 F7
	ORA $34			  ; 17 34
	AND $46			  ; 37 46
	ORA $3A			  ; 01 3A
	DEX				  ; CA
	SBC $17			  ; F7 17
	ROR $46,X			; 76 46
	WDM $01			  ; 42 01
	DEY				  ; 88
	WAI				  ; CB
	SBC $4B			  ; F7 4B
	TSB $6A1C			; 0C 1C 6A
	ORA $73			  ; 01 73
	CPY $00F7			; CC F7 00
	COP $20			  ; 02 20
	INC				  ; 1A
	ORA $B0			  ; 01 B0
	CPY $10F7			; CC F7 10
	ORA $18			  ; 12 18
	ORA $01,X			; 15 01
	SBC $F7CC,Y		  ; F9 CC F7
	TRB $12			  ; 14 12
	BPL $007E			; 10 17
	ORA $20			  ; 01 20
	CMP $0FF7			; CD F7 0F
	ASL				  ; 0A
	MVP $0147			; 44 47 01
	STZ $F7CE			; 9C CE F7
	BPL $0083			; 10 0E
	AND $17			  ; 23 17
	ORA $07			  ; 01 07
	CMP $110FF7		  ; CF F7 0F 11
	JSR $0147			; 20 47 01
	CMP $CF			  ; C1 CF
	SBC $00			  ; F7 00
	BRK $40			  ; 00 40
	BRA $0089			; 80 01
	CMP $D1,X			; D5 D1
	SBC $0F			  ; F7 0F
	BPL $00A4			; 10 16
	AND $01			  ; 23 01
	JSL $08F7D2		  ; 22 D2 F7 08
	BRK $48			  ; 00 48
	LSR				  ; 4A
	ORA $7D			  ; 01 7D
	CMP $F7			  ; D3 F7
	ORA $12			  ; 12 12
	LSR				  ; 4A
	LSR $01,X			; 56 01
	STA $D5			  ; 85 D5
	SBC $12			  ; F7 12
	TRB $10			  ; 14 10
	ORA $A101			; 0D 01 A1
	CMP $F7,X			; D5 F7
	BPL $00BF			; 10 12
	BPL $00C4			; 10 15
	ORA $D3			  ; 01 D3
	CMP $F7,X			; D5 F7
	BPL $00C7			; 10 12
	BPL $00CC			; 10 15
	ORA $FD			  ; 01 FD
	CMP $F7,X			; D5 F7
	TRB $18			  ; 14 18
	BPL $00D2			; 10 13
	ORA $2C			  ; 01 2C
	DEC $F7,X			; D6 F7
	TRB $0E			  ; 14 0E
	BPL $00E2			; 10 1B
	ORA $5E			  ; 01 5E
	DEC $F7,X			; D6 F7
	ASL $660E			; 0E 0E 66
	LSR $01,X			; 56 01
	TCD				  ; 5B
	CMP $13F7,Y		  ; D9 F7 13
Battle_Function_00D4:
	CLC				  ; 18
	ASL $1D,X			; 16 1D
	ORA $A6			  ; 01 A6
	CMP $13F7,Y		  ; D9 F7 13

Battle_Function_00DC:
	CLC				  ; 18
	ORA $0D			  ; 12 0D
	ORA $CF			  ; 01 CF
	CMP $11F7,Y		  ; D9 F7 11
	TRB $3F28			; 1C 28 3F
	ORA $B0			  ; 01 B0
	PHX				  ; DA
	SBC $0C			  ; F7 0C
	BPL $0118			; 10 2A
	ROL $01,X			; 36 01
	ADC $DB			  ; 63 DB
	SBC $0C			  ; F7 0C
	ORA $32			  ; 12 32
	MVP $7D01			; 44 01 7D
	JMP $0EF7			; DC F7 0E
	ORA $4A			  ; 12 4A
	LSR $5B01			; 4E 01 5B
	DEC $10F7,X		  ; DE F7 10
	ORA $60			  ; 12 60
	BVC $0109			; 50 01
	LDA $10F7E0		  ; AF E0 F7 10
	ORA $60			  ; 12 60
	BVC $0111			; 50 01
	BRK $E3			  ; 00 E3
	SBC $13			  ; F7 13
	ASL $0C,X			; 16 0C
	PHD				  ; 0B
	ORA $18			  ; 01 18
	SBC $F7			  ; E3 F7
	ORA $16			  ; 13 16
	ORA $1D			  ; 12 1D
	ORA $53			  ; 01 53
	SBC $F7			  ; E3 F7
	ORA $1D2A16		  ; 0F 16 2A 1D
	ORA $CD			  ; 01 CD
	SBC $F7			  ; E3 F7
	ORA $1D2A16		  ; 0F 16 2A 1D
	ORA $47			  ; 01 47
	CPX $F7			  ; E4 F7
	ORA $16			  ; 13 16
	ASL $010D			; 0E 0D 01
	ADC $E4			  ; 65 E4
	SBC $08			  ; F7 08
	ASL $4A46,X		  ; 1E 46 4A
	ORA $1C			  ; 01 1C
	INC $F7			  ; E6 F7
	TRB $18			  ; 14 18
	JSR $0116			; 20 16 01
	ROR $E6,X			; 76 E6
	SBC $10			  ; F7 10

Battle_Function_014C:
	CLC				  ; 18
	ORA $0F			  ; 12 0F
	ORA $9D			  ; 01 9D
	INC $F7			  ; E6 F7
	BPL $016D			; 10 18
	ORA $0D			  ; 12 0D
	ORA $C2			  ; 01 C2
	INC $F7			  ; E6 F7
	BPL $016D			; 10 10
	ROL $0158,X		  ; 3E 58 01
	INX				  ; E8
	INX				  ; E8
	SBC $10			  ; F7 10
	BPL $0188			; 10 22
	ASL $4A01,X		  ; 1E 01 4A
	SBC #$F7			 ; E9 F7
	BPL $0180			; 10 13
	INC				  ; 1A
	ORA $01			  ; 12 01
	BRL $F95C			; 82 E9 F7
	ORA $10			  ; 12 10
	MVP $015B			; 44 5B 01
	BCC $0165			; 90 EB
	SBC $11			  ; F7 11
	TRB $0E			  ; 14 0E
	ORA $BF01,Y		  ; 19 01 BF
	XBA				  ; EB
	SBC $1A			  ; F7 1A

Battle_Function_0184:
	CLC				  ; 18
	ASL $011B			; 0E 1B 01
	INX				  ; E8
	XBA				  ; EB
	SBC $11			  ; F7 11
	TRB $22			  ; 14 22
	ORA $4F01,Y		  ; 19 01 4F
	CPX $10F7			; EC F7 10
	TRB $42			  ; 14 42
	BRL $059A			; 82 01 04
	SBC $1A12F7		  ; EF F7 12 1A

Battle_Function_019D:
	CLC				  ; 18
	ORA $01			  ; 13 01
	WDM $EF			  ; 42 EF
	SBC $11			  ; F7 11
	ORA $42,X			; 15 42
	ROR				  ; 6A
	ORA $C1			  ; 01 C1
	SBC $F7			  ; F1 F7
	ORA $1A,X			; 15 1A

Battle_Function_01AD:
	CLC				  ; 18
	ORA $01			  ; 17 01
	TSB $F2			  ; 04 F2
	SBC $13			  ; F7 13

Battle_Function_01B4:
	CLC				  ; 18
	ORA $15			  ; 12 15
	ORA $40			  ; 01 40
	SBC $F7			  ; F2 F7
	ORA $2A12			; 0D 12 2A
	AND $01,X			; 35 01
	ASL				  ; 0A
	SBC $F7			  ; F3 F7
	ORA $08			  ; 12 08
	ROR				  ; 6A
	MVN $EB01			; 54 01 EB
	SBC $F7,X			; F5 F7
	BPL $01DD			; 10 10
	INC				  ; 1A
	ORA $01			  ; 13 01
	PLD				  ; 2B
	INC $F7,X			; F6 F7
	ORA $10			  ; 11 10
	INC				  ; 1A
	ORA $01			  ; 17 01
	ADC $F6			  ; 72 F6
	SBC $10			  ; F7 10
	BPL $0224			; 10 46
	PER $C901			; 62 01 C9
	SED				  ; F8
	SBC $13			  ; F7 13
	TRB $12			  ; 14 12
	ORA $F001			; 0D 01 F0
	SED				  ; F8
	SBC $13			  ; F7 13
	TRB $16			  ; 14 16
	ORA $01			  ; 17 01
	AND $F9,X			; 35 F9
	SBC $11			  ; F7 11
	ORA $015446		  ; 0F 46 54 01
	ADC #$FB			 ; 69 FB
	SBC $13			  ; F7 13
	TRB $0C			  ; 14 0C
	ORA $01			  ; 17 01

Battle_Function_0200:
	STA $FB			  ; 93 FB
	SBC $13			  ; F7 13
	TRB $14			  ; 14 14
	ORA $FBBA01		  ; 0F 01 BA FB
	SBC $15			  ; F7 15
	ASL $28,X			; 16 28
	AND $01			  ; 33 01
	STA $FC			  ; 85 FC
	SBC $11			  ; F7 11
	BPL $025F			; 10 49
	EOR $01			  ; 52 01
	ORA $FF			  ; 03 FF
	SBC $10			  ; F7 10
	BPL $022C			; 10 0E
	ORA $01			  ; 13 01
	BIT $F7FF			; 2C FF F7
	ORA $10			  ; 12 10
	ASL				  ; 0A
	ORA $4101			; 0D 01 41
	SBC $1010F7,X		; FF F7 10 10
	TRB $13			  ; 14 13
	ORA $70			  ; 01 70
	SBC $0E10F7,X		; FF F7 10 0E
	WDM $48			  ; 42 48
	ORA $1C			  ; 01 1C
	ORA $F8			  ; 01 F8
	BPL $024F			; 10 12
	ASL $13,X			; 16 13
	ORA $56			  ; 01 56
	ORA $F8			  ; 01 F8
	ASL $0E,X			; 16 0E
	ORA $7F0115		  ; 0F 15 01 7F
	ORA $F8			  ; 01 F8
	BPL $025D			; 10 10
	LSR				  ; 4A
	JMP $03B701		  ; 5C 01 B7 03
	SED				  ; F8
	PHP				  ; 08
	JSR $644C			; 20 4C 64
	ORA $3C			  ; 01 3C
	ASL $F8			  ; 06 F8
	BPL $0277			; 10 1A
	BPL $0274			; 10 15
	ORA $63			  ; 01 63
	ASL $F8			  ; 06 F8
	ORA $1A			  ; 11 1A
	ASL $0115			; 0E 15 01
	BRL $FA71			; 82 06 F8
	ASL $4C18			; 0E 18 4C
	ROR $01			  ; 66 01
	ORA $09			  ; 17 09
	SED				  ; F8
	TRB $16			  ; 14 16
	ASL $0115			; 0E 15 01
	LSR $09			  ; 46 09
	SED				  ; F8
	ORA $1C			  ; 12 1C
	ASL $0113			; 0E 13 01
	ADC $11F809		  ; 6F 09 F8 11
	TRB $1B10			; 1C 10 1B
	ORA $9B			  ; 01 9B
	ORA #$F8			 ; 09 F8
	TSB $4E0C			; 0C 0C 4E
	BRL $BF92			; 82 01 BD
	TSB $11F8			; 0C F8 11
	ORA $38			  ; 12 38
	AND $0DEF01,X		; 3F 01 EF 0D
	SED				  ; F8
	ORA $09			  ; 07 09
	BPL $02B1			; 10 12
	ORA $11			  ; 01 11
	ASL $06F8			; 0E F8 06
	TSB $6646			; 0C 46 66
	ORA $4A			  ; 01 4A
	BPL $02A3			; 10 F8
	ORA $1A			  ; 11 1A
	TSB $010F			; 0C 0F 01
	ADC $10			  ; 65 10
	SED				  ; F8
	ORA $1A			  ; 11 1A
	BPL $02C8			; 10 11
	ORA $8A			  ; 01 8A
	BPL $02B3			; 10 F8
	ASL $3E16			; 0E 16 3E
	EOR $01			  ; 47 01
	ROL				  ; 2A
	ORA $F8			  ; 12 F8
	BPL $02DB			; 10 16
	ORA $11			  ; 12 11
	ORA $53			  ; 01 53
	ORA $F8			  ; 12 F8
	BPL $02E1			; 10 14
	TRB $13			  ; 14 13
	ORA $82			  ; 01 82
	ORA $F8			  ; 12 F8
	BPL $02E3			; 10 0E
	PHA				  ; 48
	PER $5301			; 62 01 53
	TRB $F8			  ; 14 F8
	ORA $16			  ; 13 16
	BPL $02F2			; 10 13
	ORA $7E			  ; 01 7E
	TRB $F8			  ; 14 F8
	ORA $22			  ; 12 22
	MVP $0154			; 44 54 01
	CLV				  ; B8
	ASL $F8,X			; 16 F8
	TSB $1C0E			; 0C 0E 1C
	TRB $01			  ; 14 01
	ORA $17			  ; 01 17
	SED				  ; F8
	PHP				  ; 08

Battle_Function_02F4:
	CLC				  ; 18
	LSR $69,X			; 56 69
	ORA $0C			  ; 01 0C
	INC				  ; 1A
	SED				  ; F8
	TRB $06			  ; 14 06
	ORA $24			  ; 17 24
	ORA $57			  ; 01 57
	INC				  ; 1A
	SED				  ; F8
	TRB $0E			  ; 14 0E
	TRB $15			  ; 14 15
	ORA $93			  ; 01 93
	INC				  ; 1A
	SED				  ; F8
	TRB $0E			  ; 14 0E
	ASL $1D,X			; 16 1D
	ORA $E8			  ; 01 E8
	INC				  ; 1A
	SED				  ; F8
	TRB $10			  ; 14 10
	TRB $25			  ; 14 25
	ORA $3C			  ; 01 3C
	TCS				  ; 1B
	SED				  ; F8
	TRB $10			  ; 14 10
	TRB $23			  ; 14 23
	ORA $89			  ; 01 89
	TCS				  ; 1B
	SED				  ; F8
	TRB $0E			  ; 14 0E
	BPL $0342			; 10 1B
	ORA $B8			  ; 01 B8
	TCS				  ; 1B
	SED				  ; F8
	ORA $14,X			; 15 14
	BPL $0340			; 10 11
	ORA $E7			  ; 01 E7
	TCS				  ; 1B
	SED				  ; F8
	ORA #$23			 ; 09 23
	EOR $5A			  ; 47 5A
	ORA $17			  ; 01 17
	ASL $13F8,X		  ; 1E F8 13
	TRB $3726			; 1C 26 37
	ORA $D3			  ; 01 D3
	ASL $0FF8,X		  ; 1E F8 0F
	TRB $18			  ; 14 18
	AND $01			  ; 21 01
	ORA $13F81F,X		; 1F 1F F8 13
	ORA $011418,X		; 1F 18 14 01
	LSR $1F,X			; 56 1F
	SED				  ; F8
	ORA #$18			 ; 09 18
	EOR $5B			  ; 52 5B
	ORA $D4			  ; 01 D4
	AND $F8			  ; 21 F8
	BPL $036F			; 10 12
	BPL $037A			; 10 1B
	ORA $12			  ; 01 12
	JSL $0E14F8		  ; 22 F8 14 0E
	TRB $011B			; 1C 1B 01
	ROR $22			  ; 66 22
	SED				  ; F8
	ORA $12			  ; 11 12
	ROL				  ; 2A
	AND $1B01			; 2D 01 1B
	AND $F8			  ; 23 F8
	ORA $16			  ; 11 16
	TSB $0117			; 0C 17 01
	PHA				  ; 48
	AND $F8			  ; 23 F8
	ORA $16			  ; 11 16
	TSB $0117			; 0C 17 01
	ADC $23,X			; 75 23
	SED				  ; F8
	ORA $554624		  ; 0F 24 46 55
	ORA $43			  ; 01 43
	AND $F8			  ; 25 F8
	ORA $16			  ; 11 16
	WDM $29			  ; 42 29
	ORA $1B			  ; 01 1B
	ROL $F8			  ; 26 F8
	ORA $1C			  ; 13 1C
	TSB $010D			; 0C 0D 01
	BMI $03C0			; 30 26
	SED				  ; F8
	ORA $1C			  ; 13 1C
	TSB $010D			; 0C 0D 01
	EOR $26			  ; 45 26
	SED				  ; F8
	ORA $1C			  ; 13 1C
	ASL $0115			; 0E 15 01
	ROR $F826			; 6E 26 F8
	ORA $1C			  ; 13 1C
	ASL $0115			; 0E 15 01
	STA $26			  ; 97 26
	SED				  ; F8
	ORA $1C			  ; 13 1C
	ASL $011F			; 0E 1F 01
	CMP $26			  ; C3 26
	SED				  ; F8
	ORA $18			  ; 13 18
	ROL $014D,X		  ; 3E 4D 01
	EOR $28			  ; 43 28
	SED				  ; F8
	ORA #$1C			 ; 09 1C
	ROL $4D,X			; 36 4D
	ORA $BE			  ; 01 BE
	AND #$F8			 ; 29 F8
	ORA #$34			 ; 09 34
	JSL $570133		  ; 22 33 01 57
	ROL				  ; 2A
	SED				  ; F8
	PHP				  ; 08

Battle_Function_03D4:
	CLC				  ; 18
	JSL $50014C		  ; 22 4C 01 50
	PLD				  ; 2B
	SED				  ; F8
	TSB $4F10			; 0C 10 4F
	STA $01			  ; 91 01
	LDA #$2E			 ; A9 2E
	SED				  ; F8
	PHP				  ; 08
	ORA $33			  ; 12 33
	EOR $01			  ; 43 01
	LDY $F82F			; AC 2F F8
	ORA $10,X			; 15 10
	INC				  ; 1A
	AND $01			  ; 21 01
	SBC $2F			  ; F7 2F
	SED				  ; F8
	ORA $3018			; 0D 18 30
	EOR $0F01			; 4D 01 0F
	AND $F8			  ; 31 F8
	ORA $17			  ; 13 17
	TSB $0116			; 0C 16 01

Battle_Function_0400:
	AND $F831,Y		  ; 39 31 F8
	ORA $560A			; 0D 0A 56
	ADC $34E101,X		; 7F 01 E1 34
	SED				  ; F8
	ORA $21,X			; 15 21
	LSR				  ; 4A
	AND $01,X			; 35 01
	AND $36			  ; 33 36
	SED				  ; F8
	ORA $14,X			; 15 14
	JMP $0153			; 4C 53 01
	BVC $0452			; 50 38
	SED				  ; F8
	ORA $14,X			; 15 14
	TRB $011B			; 1C 1B 01
	LDY $38			  ; A4 38
	SED				  ; F8
	ORA $0C			  ; 11 0C
	PHA				  ; 48
	EOR $3A5001		  ; 4F 01 50 3A
	SED				  ; F8
	ORA $0610,X		  ; 1D 10 06
	AND $3A6F01		  ; 2F 01 6F 3A
	SED				  ; F8
	ORA $1C			  ; 17 1C
	BIT $37,X			; 34 37
	ORA $7A			  ; 01 7A
	TSC				  ; 3B
	SED				  ; F8
	ORA $4C16,X		  ; 1D 16 4C
	STA $01			  ; 83 01
	ADC $21F83E,X		; 7F 3E F8 21
	JSL $015750		  ; 22 50 57 01
	TSX				  ; BA
	RTI				  ; 40
	SED				  ; F8
	TCS				  ; 1B
	INC				  ; 1A
	JSL $570137		  ; 22 37 01 57
	EOR $F8			  ; 41 F8
	ORA #$22			 ; 09 22
	MVP $0167			; 44 67 01
	CMP $43			  ; C3 43
	SED				  ; F8
	TRB $0E			  ; 14 0E
	ASL $0117			; 0E 17 01
	BEQ $04A5			; F0 43
	SED				  ; F8
	ORA $12			  ; 11 12
	TSB $010D			; 0C 0D 01
	ASL				  ; 0A
	MVP $10F8			; 44 F8 10
	ORA $18			  ; 12 18
	ORA $01			  ; 17 01
	EOR $F844			; 4D 44 F8
	ORA $2B2E12		  ; 0F 12 2E 2B
	ORA $0E			  ; 01 0E
	EOR $F8			  ; 45 F8
	BPL $048F			; 10 12
	ASL $0119			; 0E 19 01
	RTI				  ; 40
	EOR $F8			  ; 45 F8
	ORA $0A,X			; 15 0A
	PER $0151			; 62 51 01
	DEC $F847			; CE 47 F8
	ORA $2A			  ; 07 2A
	LSR $53			  ; 46 53
	ORA $A5			  ; 01 A5
	EOR #$F8			 ; 49 F8
	ORA $20141B		  ; 0F 1B 14 20
	ORA $FD			  ; 01 FD
	EOR #$F8			 ; 49 F8
	ORA $0B0A1C		  ; 0F 1C 0A 0B
	ORA $0E			  ; 01 0E
	LSR				  ; 4A
	SED				  ; F8
	ORA $16			  ; 13 16
	ROL $3D			  ; 26 3D
	ORA $CB			  ; 01 CB
	LSR				  ; 4A
	SED				  ; F8
	ORA $16			  ; 13 16
	BMI $04FC			; 30 4D
	ORA $E7			  ; 01 E7
	PHK				  ; 4B
	SED				  ; F8
	BPL $04C3			; 10 0E
	PLA				  ; 68
	LSR $D101			; 4E 01 D1
	LSR $10F8			; 4E F8 10
	ASL $16,X			; 16 16
	ORA $4EF801		  ; 0F 01 F8 4E
	SED				  ; F8
	ORA $12			  ; 11 12

Battle_Function_04C5:
	CLC				  ; 18
	ORA $2701			; 0D 01 27
	EOR $1210F8		  ; 4F F8 10 12
	ASL $010F			; 0E 0F 01
	EOR $4F			  ; 45 4F
	SED				  ; F8
	ASL $10,X			; 16 10
	AND $0160,Y		  ; 39 60 01
	AND $51			  ; 31 51
	SED				  ; F8
	ASL $0A,X			; 16 0A
	LSR $4B			  ; 46 4B
	ORA $BC			  ; 01 BC
	EOR $F8			  ; 52 F8
	ORA $321E,X		  ; 1D 1E 32
	EOR $01			  ; 53 01
	BVC $053E			; 50 54
	SED				  ; F8
	ORA $14			  ; 11 14
	ASL $0123,X		  ; 1E 23 01

Battle_Function_04F0:
	REP #$54			 ; C2 54
	SED				  ; F8
	ORA $14			  ; 11 14
	ASL $012B,X		  ; 1E 2B 01
	ROL $55,X			; 36 55
	SED				  ; F8
	ORA $14			  ; 11 14
	ASL $010B			; 0E 0B 01

Battle_Function_0500:
	EOR $55			  ; 52 55
	SED				  ; F8
	ORA $14			  ; 11 14
	ASL $21,X			; 16 21
	ORA $A3			  ; 01 A3
	EOR $F8,X			; 55 F8
	ORA $6B5E22		  ; 0F 22 5E 6B
	ORA $30			  ; 01 30
	EOR $11F8,Y		  ; 59 F8 11
	ASL $38,X			; 16 38
	ADC $01			  ; 73 01
	ASL $F85B,X		  ; 1E 5B F8
	TRB $12			  ; 14 12
	BMI $0591			; 30 72
	ORA $4E			  ; 01 4E
	EOR $11F8,X		  ; 5D F8 11
	TSB $7B4E			; 0C 4E 7B
	ORA $58			  ; 01 58
	RTS				  ; 60
	SED				  ; F8
	ORA $20			  ; 17 20
	LSR $7F,X			; 56 7F
	ORA $D5			  ; 01 D5
	ADC $F8			  ; 63 F8
	AND $20,X			; 35 20
	INC				  ; 1A
	ADC $01			  ; 65 01
	INC $64,X			; F6 64
	SED				  ; F8
	AND $20,X			; 35 20
	INC				  ; 1A
	AND $01			  ; 32 01
	ADC $F865			; 6D 65 F8
	ORA $12			  ; 13 12
	ASL $0116			; 0E 16 01
	TXA				  ; 8A
	ADC $F8			  ; 65 F8
	ORA $7614			; 0D 14 76
	PHY				  ; 5A
	ORA $80			  ; 01 80
	PLA				  ; 68
	SED				  ; F8
	ASL $3410			; 0E 10 34
	ROL $4E01			; 2E 01 4E
	ADC #$F8			 ; 69 F8
	ASL				  ; 0A
	TSB $4C4A			; 0C 4A 4C
	ORA $3B			  ; 01 3B
	RTL				  ; 6B
	SED				  ; F8
	ORA $16			  ; 13 16
	ROL $012F,X		  ; 3E 2F 01
	ORA $6C			  ; 13 6C
	SED				  ; F8
	ORA $16			  ; 13 16
	CLI				  ; 58
	STA $01,X			; 95 01
	TYX				  ; BB
	ADC $1211F8		  ; 6F F8 11 12
	AND $53			  ; 32 53
	ORA $F0			  ; 01 F0
	BVS $0573			; 70 F8
	ORA $16			  ; 13 16
	ROL $0129			; 2E 29 01
	PHB				  ; 8B
	ADC $F8			  ; 71 F8
	PHD				  ; 0B
	ASL $723C			; 0E 3C 72
	ORA $AF			  ; 01 AF
	ADC $F8			  ; 73 F8
	ORA $420E			; 0D 0E 42
	ROR				  ; 6A
	ORA $FF			  ; 01 FF
	ADC $F8,X			; 75 F8
	ORA $14,X			; 15 14
	ASL				  ; 0A
	ORA $01			  ; 12 01
	INC				  ; 1A
	ROR $F8,X			; 76 F8
	ORA $1C,X			; 15 1C
	ASL $0A,X			; 16 0A
	ORA $2F			  ; 01 2F
	ROR $F8,X			; 76 F8
	ORA $0E			  ; 11 0E
	LSR $013E,X		  ; 5E 3E 01
	JSR ($F877,X)		; FC 77 F8
	PHD				  ; 0B
	PHP				  ; 08
	INC				  ; 1A
	TRB $4801			; 1C 01 48

Battle_Function_05B1:
	SEI				  ; 78
	SED				  ; F8
	ORA $3818,Y		  ; 19 18 38
	SEC				  ; 38
	ORA $75			  ; 01 75
	ADC $0FF8,Y		  ; 79 F8 0F
	TRB $82			  ; 14 82
	AND $01,X			; 35 01
	STA $F87B,X		  ; 9D 7B F8
	TCS				  ; 1B
	PLP				  ; 28
	ADC $2F			  ; 67 2F
	ORA $19			  ; 01 19
	ADC $0DF8,X		  ; 7D F8 0D

Battle_Function_05CC:
	CLC				  ; 18
	PHK				  ; 4B
	ORA $E601,X		  ; 1D 01 E6
	ADC $1FF8,X		  ; 7D F8 1F
	INC				  ; 1A
	ADC $016B,X		  ; 7D 6B 01
	ROR $82,X			; 76 82
	SED				  ; F8
	ASL $4C28			; 0E 28 4C
	ADC $01			  ; 65 01
	ASL $F885			; 0E 85 F8
	MVN $4C56			; 54 56 4C
	ORA $A601,Y		  ; 19 01 A6
	STA $F8			  ; 85 F8
	ASL				  ; 0A
	ASL $4A,X			; 16 4A
	AND $01			  ; 31 01
	LDA $86			  ; B3 86
	SED				  ; F8
	ORA $635C24		  ; 0F 24 5C 63
	ORA $A7			  ; 01 A7
	BIT #$F8			 ; 89 F8
	ASL $1A,X			; 16 1A
	STX $5B			  ; 86 5B
	ORA $BD			  ; 01 BD
	STX $19F8			; 8E F8 19

Battle_Function_0604:
	CLC				  ; 18
	LSR $0185			; 4E 85 01
	ASL $92			  ; 06 92
	SED				  ; F8
	ORA $14			  ; 13 14
	ROL $0167,X		  ; 3E 67 01
	PHP				  ; 08
	STY $F8,X			; 94 F8
	ORA $1E			  ; 12 1E
	ADC $65			  ; 63 65
	ORA $66			  ; 01 66
	STA $F8			  ; 97 F8
	BPL $063D			; 10 20
	TCD				  ; 5B
	PHA				  ; 48
	ORA $6E			  ; 01 6E
	STA $31F8,Y		  ; 99 F8 31
	TRB $0E			  ; 14 0E
	LSR				  ; 4A
	ORA $D9			  ; 01 D9
	STA $1BF8,Y		  ; 99 F8 1B
	TCD				  ; 5B
	AND $010A,Y		  ; 39 0A 01
	ORA $F89A			; 0D 9A F8
	ORA $3662,X		  ; 1D 62 36
	PHK				  ; 4B
	ORA $6B			  ; 01 6B
	TXY				  ; 9B
	SED				  ; F8
	AND $3EAA			; 2D AA 3E
	ORA $01			  ; 13 01
	CLD				  ; D8
	TXY				  ; 9B
	SED				  ; F8
	ORA $14			  ; 11 14
	PLP				  ; 28
	ORA #$01			 ; 09 01
	SBC $9B			  ; F7 9B
	SED				  ; F8
	ORA $14			  ; 13 14
	PHY				  ; 5A
	ADC #$01			 ; 69 01
	EOR $15F89E,X		; 5F 9E F8 15
	BPL $067C			; 10 26
	ORA $8B01			; 0D 01 8B
	STZ $11F8,X		  ; 9E F8 11
	BPL $0688			; 10 2A
	AND $9F2701		  ; 2F 01 27 9F
	SED				  ; F8
