;==============================================================================
; Dragon Quest III - Field System (Bank $04)
; Comprehensive code extraction
;==============================================================================

.include "hardware.inc"

.segment "FIELD_CODE"

Field_Function_000:
	AND $00			  ; 23 00
	; Skipped 20 bytes of data
	BRK $00			  ; 00 00
	SBC $FFFFFF,X		; FF FF FF FF
	ORA $000000		  ; 0F 00 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $71			  ; 00 71
	ORA $01			  ; 01 01
	TSB $00			  ; 04 00
	COP $24			  ; 02 24
	BVC $006E			; 50 40
	CMP $B80004		  ; CF 04 00 B8
	AND $040201		  ; 2F 01 02 04

Field_Function_001:
	PHP				  ; 08
	LDY #$26			 ; A0 26
	BRA $FFD5			; 80 9A
	BRK $00			  ; 00 00
	WDM $42			  ; 42 42
	AND $30524F		  ; 2F 4F 52 30
	BRK $00			  ; 00 00
	TSB $0843			; 0C 43 08
	BRK $10			  ; 00 10
	ADC $01			  ; 72 01
	ORA $06			  ; 01 06
	BRK $03			  ; 00 03
	PLP				  ; 28
	RTS				  ; 60
	CPY #$C3			 ; C0 C3
	ASL $00			  ; 06 00
	CLV				  ; B8
	ORA $040201,X		; 1F 01 02 04

Field_Function_002:
	PHP				  ; 08
	BPL $007E			; 10 20
	RTI				  ; 40
	BRA $0061			; 80 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $10			  ; 00 10
	AND #$00			 ; 29 00
	BRK $0C			  ; 00 0C
	STA $09			  ; 83 09
	BRK $08			  ; 00 08
	ADC $01			  ; 73 01
	COP $08			  ; 02 08
	BRK $03			  ; 00 03
	BMI $FFF7			; 30 80
	RTI				  ; 40
	CMP $05			  ; D2 05
	BRK $B8			  ; 00 B8
	AND $01			  ; 33 01
	PEI $04			  ; D4 04

Field_Function_003:
	PHP				  ; 08
	BPL $00C3			; 10 40
	EOR $0080			; 4D 80 00
	BRK $F0			  ; 00 F0
	BRK $F0			  ; 00 F0
	BRK $10			  ; 00 10
	BPL $008E			; 10 00
	BRK $0C			  ; 00 0C
	STA $0A			  ; 83 0A
	BRK $08			  ; 00 08
	STZ $01,X			; 74 01
	ORA $0C			  ; 03 0C
	BRK $04			  ; 00 04
	BIT $80,X			; 34 80
	BRK $B1			  ; 00 B1
	ASL $00			  ; 06 00
	ADC $0103,Y		  ; 79 03 01
	COP $04			  ; 02 04

Field_Function_004:
	PHP				  ; 08
	BPL $00C8			; 10 20
	RTI				  ; 40
	BRA $00AB			; 80 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $50			  ; 00 50
	JSR $0000			; 20 00 00
	ORA $0D83			; 0D 83 0D
	BRK $08			  ; 00 08
	ADC $01,X			; 75 01
	ORA $09			  ; 03 09
	BRK $04			  ; 00 04
	BIT $4070			; 2C 70 40
	LDA $BB0508		  ; AF 08 05 BB
	ORA $01			  ; 01 01
	COP $04			  ; 02 04

Field_Function_005:
	PHP				  ; 08
	BMI $00F0			; 30 23
	CPY #$8C			 ; C0 8C
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	RTS				  ; 60
	AND $00			  ; 21 00
	BRK $01			  ; 00 01
	EOR $0C			  ; 41 0C
	BRK $08			  ; 00 08
	ROR $01,X			; 76 01
	ORA $0C			  ; 03 0C
	BRK $05			  ; 00 05
	SEC				  ; 38
	BRA $00E7			; 80 00
	LDA $B80007,X		; BF 07 00 B8
	INC				  ; 1A
	ORA $02			  ; 01 02
	LDY #$09			 ; A0 09
	BPL $0112			; 10 20
	RTI				  ; 40
	BRA $00F5			; 80 00
	BRK $00			  ; 00 00
	ORA $800000		  ; 0F 00 00 80
	ORA $00			  ; 11 00
	BRK $0C			  ; 00 0C
	STA $0F			  ; 83 0F
	BRK $08			  ; 00 08
	ADC $01			  ; 77 01
	TSB $10			  ; 04 10
	BRK $08			  ; 00 08
	RTI				  ; 40
	BCC $00CC			; 90 C0
	LDA $0C			  ; B1 0C
	BRK $B9			  ; 00 B9
	TSB $6A			  ; 04 6A
	COP $10			  ; 02 10

Field_Function_006:
	PHP				  ; 08
	LDY #$86			 ; A0 86
	RTI				  ; 40
	BRA $011A			; 80 00
	BRK $0F			  ; 00 0F
	ORA $1F			  ; 01 1F
	BRK $10			  ; 00 10

Field_Function_007:
	PHP				  ; 08
	BRK $00			  ; 00 00
	ASL $0A43			; 0E 43 0A
	BRK $0C			  ; 00 0C
	SEI				  ; 78
	ORA $04			  ; 01 04
	TRB $00			  ; 14 00
	ASL				  ; 0A
	BIT $00F0,X		  ; 3C F0 00
	BCS $0140			; B0 0D
	TSB $BA			  ; 04 BA
	COP $06			  ; 02 06
	COP $04			  ; 02 04
	BVC $019E			; 50 63
	JSR $0180			; 20 80 01
	ORA $D0			  ; 03 D0
	BPL $0133			; 10 F1
	BPL $0144			; 10 00
	ADC $20			  ; 61 20
	BRK $00			  ; 00 00
	BRK $C4			  ; 00 C4
	ORA $00			  ; 17 00

Field_Function_008:
	PHP				  ; 08
	ADC $0401,Y		  ; 79 01 04
	ASL $0600			; 0E 00 06
	PHA				  ; 48
	BCS $0116			; B0 C0
	TYX				  ; BB
	ASL				  ; 0A
	BRK $B5			  ; 00 B5
	ORA $01,X			; 15 01
	COP $04			  ; 02 04
	BRK $13			  ; 00 13
	BRK $4C			  ; 00 4C
	BRK $30			  ; 00 30
	BRK $00			  ; 00 00
	BMI $0198			; 30 30
	BMI $017A			; 30 10
	PLP				  ; 28
	BRK $00			  ; 00 00
	TSB $0C43			; 0C 43 0C
	BRK $08			  ; 00 08
	PLY				  ; 7A
	ORA $04			  ; 01 04
	CLC				  ; 18
	BRK $08			  ; 00 08
	SEC				  ; 38
	LDY #$40			 ; A0 40
	LDA $FF0F,X		  ; BD 0F FF
	LDA $17			  ; B2 17
	ORA $42			  ; 01 42
	STY $08			  ; 84 08
	BPL $01A8			; 10 22
	MVP $1088			; 44 88 10
	BRK $01			  ; 00 01
	BPL $018D			; 10 00
	BRK $01			  ; 00 01
	PLP				  ; 28
	LDY #$11			 ; A0 11
	ASL $1EC6			; 0E C6 1E
	BRK $0A			  ; 00 0A
	TDC				  ; 7B
	ORA $04			  ; 01 04
	TSB $0700			; 0C 00 07
	BVC $012F			; 50 90
	RTI				  ; 40
	LDA $0A			  ; B1 0A
	BRK $B8			  ; 00 B8
	ORA $01			  ; 03 01
	COP $04			  ; 02 04
	BVC $01BD			; 50 13
	JSR $8040			; 20 40 80
	BRK $00			  ; 00 00
	BRK $F0			  ; 00 F0
	BRK $00			  ; 00 00
	BVC $01C5			; 50 10
	TSB $00			  ; 04 00
	ORA $1587,X		  ; 1D 87 15
	BRK $08			  ; 00 08
	JMP ($0401,X)		; 7C 01 04
	ASL $0800			; 0E 00 08
	MVN $80C0			; 54 C0 80
	CMP $09			  ; D2 09
	ASL $79			  ; 06 79
	AND $6A			  ; 33 6A
	COP $A8			  ; 02 A8
	ORA #$10			 ; 09 10
	BRK $46			  ; 00 46
	BRK $18			  ; 00 18
	LDY #$0F			 ; A0 0F
	ORA $601010		  ; 0F 10 10 60
	AND $00			  ; 21 00
	BRK $01			  ; 00 01
	STX $14,Y			; 96 14
	BRK $08			  ; 00 08
	ADC $0501,X		  ; 7D 01 05
	TRB $00			  ; 14 00
	ORA #$60			 ; 09 60
	CPY #$40			 ; C0 40
	LDA $B9000C,X		; BF 0C 00 B9
	INC				  ; 1A
	ROR				  ; 6A

Field_Function_009:
	PHP				  ; 08
	TSB $08			  ; 04 08
	RTI				  ; 40
	JSR $0040			; 20 40 00
	COP $90			  ; 02 90
	ORA $100100,X		; 1F 00 01 10
	RTI				  ; 40
	ORA $00			  ; 11 00

Field_Function_00A:
	BRK $4D			  ; 00 4D
	STA $19			  ; 83 19
	BRK $08			  ; 00 08
	ROR $0601,X		  ; 7E 01 06
	AND $00			  ; 23 00
	TSB $9084			; 0C 84 90
	CMP $C9			  ; C1 C9
	PHD				  ; 0B
	ORA $B8			  ; 07 B8
	PLP				  ; 28
	DEC				  ; 3A
	STZ $04,X			; 74 04

Field_Function_00B:
	PHP				  ; 08
	BPL $023A			; 10 20
	BRA $01AA			; 80 8E
	BRK $43			  ; 00 43
	AND $00			  ; 33 00
	BRK $03			  ; 00 03
	JSR $0010			; 20 10 00
	BRK $00			  ; 00 00
	CMP $32			  ; C1 32
	BRK $04			  ; 00 04
	ADC $1D0601,X		; 7F 01 06 1D
	BRK $12			  ; 00 12
	SEI				  ; 78
	BRA $01F5			; 80 C1
	LDA $0F			  ; B2 0F
	ORA $04			  ; 05 04
	ASL $01			  ; 06 01
	COP $C8			  ; 02 C8

Field_Function_00C:
	PHP				  ; 08
	BPL $025F			; 10 20
	BRA $01CD			; 80 8C
	BRK $44			  ; 00 44
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	JSR $0021			; 20 21 00
	BRK $55			  ; 00 55
	EOR $1C			  ; 41 1C
	BRK $08			  ; 00 08
	BRA $0253			; 80 01
	STA $1D			  ; 87 1D
	BRK $0F			  ; 00 0F
	BVS $0298			; 70 40
	RTI				  ; 40
	LDA $0B,X			; B5 0B
	ASL $0AB7,X		  ; 1E B7 0A
	ORA $02			  ; 01 02
	TSB $F0			  ; 04 F0
	BPL $0224			; 10 C0
	EOR $00			  ; 43 00
	ORA $100000		  ; 0F 00 00 10
	BPL $027C			; 10 10
	JSR $0028			; 20 28 00
	BRK $03			  ; 00 03
	EOR $32			  ; 41 32
	BRK $08			  ; 00 08
	STA $01			  ; 81 01
	ASL $1A			  ; 06 1A
	BRK $0D			  ; 00 0D
	BRA $026D			; 80 F0
	BRK $BC			  ; 00 BC
	ORA $BF00			; 0D 00 BF
	ORA $6A,X			; 15 6A
	COP $14			  ; 02 14

Field_Function_00D:
	PHP				  ; 08
	BPL $02A9			; 10 20
	RTI				  ; 40
	STA $02			  ; 81 02
	CPY $0F			  ; C4 0F
	ORA $00			  ; 01 00
	ORA $10			  ; 11 10
	ORA #$10			 ; 09 10
	BRK $0D			  ; 00 0D
	CMP $19			  ; D3 19
	BRK $08			  ; 00 08
	BRL $0A9E			; 82 01 08
	AND $00			  ; 23 00
	TSB $C080			; 0C 80 C0
	CMP $C2			  ; C3 C2
	TSB $4D00			; 0C 00 4D
	ASL $C001,X		  ; 1E 01 C0
	TSB $08			  ; 04 08
	BRK $26			  ; 00 26
	BRK $98			  ; 00 98
	BRK $50			  ; 00 50
	BMI $02B4			; 30 00
	ORA $03			  ; 03 03
	BCC $02D9			; 90 21
	BRK $00			  ; 00 00
	EOR $1CE7			; 4D E7 1C
	BRK $08			  ; 00 08
	STA $01			  ; 83 01

Field_Function_00E:
	PHP				  ; 08
	AND $00			  ; 23 00
	ASL $E058			; 0E 58 E0
	BRA $0281			; 80 B8
	TRB $B412			; 1C 12 B4
	BPL $02CF			; 10 01
	COP $18			  ; 02 18
	BMI $02E2			; 30 10
	CPY #$80			 ; C0 80
	ORA $03			  ; 01 03
	BRK $33			  ; 00 33
	MVP $4443			; 44 43 44
	PER $0029			; 62 29 00
	BRK $C3			  ; 00 C3
	BNE $02FB			; D0 19
	BRK $0A			  ; 00 0A
	STY $01			  ; 84 01
	ORA #$27			 ; 09 27
	BRK $12			  ; 00 12
	SEI				  ; 78
	CPY #$00			 ; C0 00
	CMP $08			  ; C5 08
	BRK $BA			  ; 00 BA
	AND $01			  ; 21 01
	PEI $04			  ; D4 04
	BEQ $0309			; F0 12
	CPY #$4B			 ; C0 4B
	BRA $02FB			; 80 00
	PLP				  ; 28
	BEQ $031E			; F0 20
	JSR $0000			; 20 00 00
	CLC				  ; 18
	BRK $00			  ; 00 00
	STA $188F,X		  ; 9D 8F 18
	BRK $0A			  ; 00 0A
	STA $01			  ; 85 01
	ORA #$2F			 ; 09 2F
	BRK $14			  ; 00 14
	LDY #$00			 ; A0 00
	ORA $CA			  ; 01 CA
	ASL $B900			; 0E 00 B9
	PLP				  ; 28
	ROR				  ; 6A
	COP $74			  ; 02 74
	ORA #$10			 ; 09 10
	JSR $8040			; 20 40 80
	ROL $0F84			; 2E 84 0F
	COP $00			  ; 02 00
	JSR $0810			; 20 10 08
	BPL $0329			; 10 00
	ORA $23C3			; 0D C3 23
	BRK $04			  ; 00 04
	STX $01			  ; 86 01
	ORA #$2D			 ; 09 2D
	BRK $16			  ; 00 16
	BCC $0356			; 90 20
	ORA $C4			  ; 01 C4
	ASL $B314			; 0E 14 B3
	ORA $04026A,X		; 1F 6A 02 04

Field_Function_00F:
	PHP				  ; 08
	BPL $0362			; 10 20
	RTI				  ; 40
	BRA $0345			; 80 00
	BRK $0F			  ; 00 0F
	BRK $00			  ; 00 00
	BRK $10			  ; 00 10

Field_Function_010:
	SEP #$00			 ; E2 00
	BRK $41			  ; 00 41
	CMP $19			  ; D3 19
	BRK $08			  ; 00 08
	STA $01			  ; 87 01
	ASL				  ; 0A
	AND $00,X			; 35 00
	ASL $60A8			; 0E A8 60
	STA $B5			  ; 81 B5
	BPL $0363			; 10 04
	LDX $0A,Y			; B6 0A
	ORA $02			  ; 01 02
	TSB $08			  ; 04 08
	BPL $0327			; 10 C0
	LSR $00			  ; 46 00
	TCS				  ; 1B
	LDY #$00			 ; A0 00
	BRK $10			  ; 00 10
	BPL $03D0			; 10 60
	PLP				  ; 28
	BPL $0373			; 10 00
	EOR $53			  ; 52 53
	PLP				  ; 28
	BRK $08			  ; 00 08
	DEY				  ; 88
	ORA $0A			  ; 01 0A
	SEC				  ; 38
	BRK $14			  ; 00 14
	LDY $4190			; AC 90 41
	CMP $0F			  ; C5 0F
	BRK $BB			  ; 00 BB
	AND $6A			  ; 21 6A
	COP $0C			  ; 02 0C
	BVC $03BE			; 50 33
	CPY #$4B			 ; C0 4B
	BRK $2F			  ; 00 2F
	LDY $0F,X			; B4 0F
	SBC $22			  ; F2 22
	JSR $1850			; 20 50 18
	BPL $0398			; 10 00
	EOR $1EC3,X		  ; 5D C3 1E
	BRK $0A			  ; 00 0A
	BIT #$01			 ; 89 01
	ASL				  ; 0A
	AND $00			  ; 21 00
	TSB $C080			; 0C 80 C0
	CMP $BF			  ; C3 BF
	TSB $4D00			; 0C 00 4D
	TCS				  ; 1B
	ORA $C0			  ; 01 C0
	TSB $08			  ; 04 08
	BRK $26			  ; 00 26
	BRK $98			  ; 00 98
	BRK $52			  ; 00 52
	AND $11			  ; 31 11
	ORA $13			  ; 13 13
	STA $23			  ; 91 23
	BRK $00			  ; 00 00
	EOR $1CE7			; 4D E7 1C
	BRK $08			  ; 00 08
	TXA				  ; 8A
	ORA $0A			  ; 01 0A
	AND $1900,X		  ; 3D 00 19
	CPY $01C0			; CC C0 01
	LDA $13			  ; B3 13
	ORA #$B5			 ; 09 B5
	ASL $0F			  ; 06 0F
	COP $04			  ; 02 04

Field_Function_011:
	PHP				  ; 08
	BPL $03B6			; 10 E0
	EOR $80			  ; 41 80
	ORA $A1			  ; 07 A1
	ORA $00			  ; 01 00
	BPL $03EE			; 10 10
	BPL $0401			; 10 21
	BRK $00			  ; 00 00
	ORA $D6			  ; 01 D6
	AND $00			  ; 23 00

Field_Function_012:
	PHP				  ; 08

Field_Function_013:
	PHB				  ; 8B
	ORA $0A			  ; 01 0A
	AND $00			  ; 37 00
	ORA $8230C4		  ; 0F C4 30 82
	LDA $090411		  ; AF 11 04 09
	ORA $6A			  ; 01 6A
	COP $80			  ; 02 80
	AND $10			  ; 21 10
	RTS				  ; 60
	LSR $80			  ; 46 80
	BRK $24			  ; 00 24
	ORA $001024		  ; 0F 24 10 00
	RTI				  ; 40
	ROL				  ; 2A
	BPL $0407			; 10 00
	ORA $E1			  ; 01 E1
	INC				  ; 1A
	BRK $08			  ; 00 08
	STY $0B01			; 8C 01 0B
	MVP $1E00			; 44 00 1E
	LDY $C320,X		  ; BC 20 C3
	CMP $0A			  ; D2 0A
	BRK $03			  ; 00 03
	BIT $02,X			; 34 02
	COP $84			  ; 02 84
	ORA #$10			 ; 09 10
	JSR $9840			; 20 40 98
	BRK $44			  ; 00 44
	ORA $02			  ; 01 02
	BRK $02			  ; 00 02
	BVC $044A			; 50 20
	BPL $045C			; 10 30
	LSR $378F			; 4E 8F 37
	BRK $08			  ; 00 08
	STA $0B01			; 8D 01 0B
	EOR $00			  ; 41 00
	TRB $C0			  ; 14 C0
	BPL $03FD			; 10 C3
	LDY $1C,X			; B4 1C
	TSB $47			  ; 04 47
	ORA #$01			 ; 09 01
	BNE $0446			; D0 04

Field_Function_014:
	PHP				  ; 08
	BPL $0485			; 10 40
	BRA $0461			; 80 1A
	ORA $F002,Y		  ; 19 02 F0
	BRK $10			  ; 00 10
	AND $1431A0		  ; 2F A0 31 14
	BPL $04A7			; 10 55
	CMP $28,X			; D5 28
	BRK $08			  ; 00 08
	STX $0B01			; 8E 01 0B
	LSR $00			  ; 46 00
	ORA $C4			  ; 17 C4
	BVC $03E1			; 50 82
	LDA $0B1E12,X		; BF 12 1E 0B
	INC				  ; 1A
	ORA $02			  ; 01 02
	CPY #$08			 ; C0 08
	BPL $048A			; 10 20
	BRK $8C			  ; 00 8C
	BRK $44			  ; 00 44
	BRK $02			  ; 00 02
	BRK $02			  ; 00 02
	BVC $0495			; 50 21
	BVC $0486			; 50 10
	EOR $C5			  ; 45 C5
	ROL $00			  ; 26 00

Field_Function_015:
	PHP				  ; 08
	STA $3C0B01		  ; 8F 01 0B 3C
	BRK $1E			  ; 00 1E
	JMP $0280			; DC 80 02
	CMP $0015			; CD 15 00
	LDA $2C			  ; B2 2C
	COP $C0			  ; 02 C0
	TSB $08			  ; 04 08
	BPL $04AF			; 10 20
	BRK $98			  ; 00 98
	BRK $00			  ; 00 00
	AND $00			  ; 21 00
	BRK $02			  ; 00 02
	BPL $04C1			; 10 28
	BRA $04AB			; 80 10
	STA $3CE7,X		  ; 9D E7 3C
	BRK $06			  ; 00 06
	BCC $04A3			; 90 01
	PHD				  ; 0B
	ORA $00			  ; 05 00
	LSR $503D,X		  ; 5E 3D 50
	COP $B7			  ; 02 B7
	RTI				  ; 40
	SBC $660DB4,X		; FF B4 0D 66
	BIT $08F4,X		  ; 3C F4 08
	JSR $0663			; 20 63 06

Field_Function_016:
	PHP				  ; 08
	BPL $04EF			; 10 37
	ORA $01			  ; 12 01
	ORA $11			  ; 11 11
	LDY #$27			 ; A0 27
	BEQ $04F3			; F0 33
	ADC $2B			  ; 73 2B
	PLP				  ; 28
	BRK $02			  ; 00 02
	STA $01			  ; 91 01
	TSB $0049			; 0C 49 00
	ORA $10DC,Y		  ; 19 DC 10
	EOR $C9			  ; 43 C9
	ORA $00			  ; 13 00
	CPX $27			  ; E4 27
	ORA $02			  ; 01 02

Field_Function_017:
	PHP				  ; 08

Field_Function_018:
	PHP				  ; 08
	BPL $04F9			; 10 20
	RTI				  ; 40
	BRA $04DC			; 80 00
	BRK $11			  ; 00 11
	BPL $04F1			; 10 11
	ORA $01			  ; 11 01
	BPL $04E8			; 10 04
	BMI $0543			; 30 5D
	EOR $23			  ; 53 23
	BRK $08			  ; 00 08
	STA $01			  ; 92 01
	TSB $004E			; 0C 4E 00
	ORA $C8			  ; 17 C8
	CPX #$06			 ; E0 06
	CMP $13			  ; C3 13
	ASL $1E6A,X		  ; 1E 6A 1E
	ORA $02			  ; 01 02
	PEA $D008			; F4 08 D0
	AND $40			  ; 23 40
	BRA $0501			; 80 00
	TRB $00			  ; 14 00
	COP $02			  ; 02 02
	BRK $10			  ; 00 10
	JSR $1010			; 20 10 10
	STA $D7			  ; 85 D7
	PLP				  ; 28
	BRK $08			  ; 00 08
	STA $01			  ; 93 01
	ORA $0052			; 0D 52 00
	AND $DC			  ; 23 DC
	BEQ $055A			; F0 42
	LDX $1D,Y			; B6 1D
	ASL				  ; 0A
	LDA $0C,X			; B5 0C
	ORA $02			  ; 01 02
	JMP $1008			; 4C 08 10
	RTS				  ; 60

Field_Function_019:
	REP #$84			 ; C2 84
	ORA #$E4			 ; 09 E4
	BRK $01			  ; 00 01
	BPL $053C			; 10 11
	BVC $054D			; 50 20
	BVC $0540			; 50 11
	LSR $EA,X			; 56 EA
	AND $00			  ; 23 00

Field_Function_01A:
	PHP				  ; 08
	STY $01,X			; 94 01
	ORA $0048			; 0D 48 00
	AND $B4			  ; 23 B4
	BRA $057F			; 80 42
	DEX				  ; CA
	TRB $00			  ; 14 00
	LDX $28,Y			; B6 28
	ORA $AE			  ; 01 AE
	TSB $50			  ; 04 50
	ORA $E0			  ; 13 E0
	LSR				  ; 4A
	BRA $0576			; 80 2B
	LDX #$10			 ; A2 10
	BEQ $055F			; F0 10
	BPL $05A1			; 10 50
	PLP				  ; 28
	BMI $0564			; 30 10
	LSR $2DD7,X		  ; 5E D7 2D
	BRK $04			  ; 00 04
	STA $01,X			; 95 01
	ORA $0052			; 0D 52 00
	BIT $F0			  ; 24 F0
	BMI $04E4			; 30 82
	CMP #$14			 ; C9 14
	ASL $27BA,X		  ; 1E BA 27
	COP $02			  ; 02 02
	STY $1009			; 8C 09 10
	RTS				  ; 60
	CPY $0098			; CC 98 00
	STZ $10			  ; 64 10
	ORA $21			  ; 12 21
	ORA $11			  ; 12 11
	JSR $3200			; 20 00 32
	STX $64,Y			; 96 64
	AND $00			  ; 37 00

Field_Function_01B:
	PHP				  ; 08
	STX $01,Y			; 96 01
	ASL $005C			; 0E 5C 00
	PLP				  ; 28
	LDY $8340			; AC 40 83
	CMP $14			  ; C5 14
	ASL				  ; 0A
	TYX				  ; BB
	AND $6A			  ; 21 6A
	COP $04			  ; 02 04

Field_Function_01C:
	PHP				  ; 08
	BEQ $0572			; F0 E0
	ORA $08			  ; 01 08
	BPL $05C6			; 10 30
	ORA $111100		  ; 0F 00 11 11
	BCC $05BC			; 90 20
	BCC $059E			; 90 00
	ORA $C5			  ; 05 C5
	PLP				  ; 28
	BRK $0A			  ; 00 0A
	STA $01			  ; 97 01
	ASL $0062			; 0E 62 00
	ORA $E0C8,Y		  ; 19 C8 E0
	EOR $BC			  ; 41 BC
	ORA $0A			  ; 12 0A
	MVP $6A15			; 44 15 6A
	COP $04			  ; 02 04
	PHA				  ; 48
	BCC $05D7			; 90 20
	RTI				  ; 40
	BRL $DDBF			; 82 04 D8
	ORA $220220		  ; 0F 20 02 22
	BPL $05EA			; 10 29
	BPL $05D3			; 10 10
	ASL $84			  ; 06 84
	ASL $0800,X		  ; 1E 00 08
	TYA				  ; 98
	ORA $0E			  ; 01 0E
	EOR $0C1400,X		; 5F 00 14 0C
	CMP $C2			  ; D1 C2
	LDA $14,X			; B5 14
	ORA $B7			  ; 05 B7
	ASL				  ; 0A
	RTS				  ; 60
	COP $04			  ; 02 04
	TYA				  ; 98
	ORA $20			  ; 11 20
	RTI				  ; 40
	BRA $05F8			; 80 19
	DEY				  ; 88
	ORA $10			  ; 01 10
	BRK $10			  ; 00 10
	JSR $0029			; 20 29 00
	BPL $062E			; 10 45
	EOR $2A			  ; 45 2A
	BRK $08			  ; 00 08
	STA $1001,Y		  ; 99 01 10
	BRA $05F2			; 80 00
	AND $F0			  ; 37 F0
	CPX #$82			 ; E0 82
	LDX $19,Y			; B6 19
	ASL				  ; 0A
	CPX $0C			  ; E4 0C
	ORA $D4			  ; 01 D4
	CPY $11F8			; CC F8 11

Field_Function_01D:
	JSR $8FC0			; 20 C0 8F
	ORA $F0CC,Y		  ; 19 CC F0
	ORA $00			  ; 11 00
	ORA $60			  ; 11 60
	BPL $061C			; 10 10
	BPL $0667			; 10 59
	DEX				  ; CA
	ROL				  ; 2A
	BRK $08			  ; 00 08
	TXS				  ; 9A
	ORA $0F			  ; 01 0F
	ADC #$00			 ; 69 00
	TRB $C0C8			; 1C C8 C0
	CMP $B8			  ; C3 B8
	CLC				  ; 18
	BRK $B5			  ; 00 B5
	BPL $0678			; 10 57
	COP $5C			  ; 02 5C
	LDA $E012,Y		  ; B9 12 E0
	LSR				  ; 4A
	BRA $0654			; 80 2B
	BRK $01			  ; 00 01
	ORA $10			  ; 11 10
	BPL $062F			; 10 00
	AND #$30			 ; 29 30
	BPL $0650			; 10 1D
	CMP $25			  ; D7 25
	BRK $0A			  ; 00 0A
	TXY				  ; 9B
	ORA $0F			  ; 01 0F
	ROR $1900			; 6E 00 19
	BIT $82D1			; 2C D1 82
	LDA $0A			  ; B1 0A
	BRK $05			  ; 00 05
	ORA $01			  ; 03 01
	PEI $04			  ; D4 04

Field_Function_01E:
	PHP				  ; 08
	BPL $066B			; 10 20
	RTI				  ; 40
	BRA $064E			; 80 00
	BRK $F0			  ; 00 F0
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BMI $0666			; 30 10
	BPL $06B6			; 10 5E
	CMP $32			  ; C7 32
	BRK $08			  ; 00 08
	STZ $0E01			; 9C 01 0E
	ASL $01,X			; 16 01
	ROL $B4			  ; 26 B4
	JSR $BD83			; 20 83 BD
	ORA $FF			  ; 12 FF
	LDY $17,X			; B4 17
	AND $02			  ; 27 02
	STZ $7008			; 9C 08 70
	JSL $0089C0		  ; 22 C0 89 00
	BRK $10			  ; 00 10
	BPL $0687			; 10 10
	BPL $067A			; 10 01
	AND #$50			 ; 29 50
	ORA $15			  ; 11 15
	CMP $32			  ; D7 32
	BRK $0A			  ; 00 0A
	STA $1101,X		  ; 9D 01 11
	LDX #$00			 ; A2 00
	AND $1104			; 2D 04 11
	STA $BC			  ; 83 BC
	TRB $650C			; 1C 0C 65
	ASL $6A,X			; 16 6A
	COP $A8			  ; 02 A8
	ORA #$90			 ; 09 90
	JSR $8240			; 20 40 82
	BRK $00			  ; 00 00
	ORA $02020F		  ; 0F 0F 02 02
	RTS				  ; 60
	PLP				  ; 28
	BRK $10			  ; 00 10
	EOR $C8,X			; 55 C8
	BIT $0800,X		  ; 3C 00 08
	STZ $1001,X		  ; 9E 01 10
	STA $00			  ; 87 00
	AND $FC			  ; 23 FC
	JSR $B503			; 20 03 B5
	TRB $00			  ; 14 00
	EOR $09			  ; 47 09
	ROR				  ; 6A
	CPY $0004			; CC 04 00
	LDA $26			  ; A3 26
	BRK $18			  ; 00 18
	AND $82			  ; 33 82
	AND $220F20		  ; 2F 20 0F 22
	JSR $002B			; 20 2B 00
	BPL $0724			; 10 5D
	EOR $23			  ; 47 23
	BRK $08			  ; 00 08
	STA $721E01,X		; 9F 01 1E 72
	ASL $55			  ; 06 55
	STY $4551			; 8C 51 45
	BCS $0710			; B0 3A
	SBC $2602BC,X		; FF BC 02 26
	BCS $0724			; B0 48
	BCC $06DF			; 90 01
	SBC $C7			  ; E3 C7
	ORA $09			  ; 01 09
	INC $0000,X		  ; FE 00 00
	BRK $00			  ; 00 00
	AND $28			  ; 21 28
	LDY #$25			 ; A0 25
	INC				  ; 1A
	ADC $005F			; 6D 5F 00

Field_Function_01F:
	PHP				  ; 08
	LDY #$01			 ; A0 01
	ORA $AA			  ; 12 AA
	BRK $2D			  ; 00 2D
	RTI				  ; 40
	EOR $43			  ; 41 43
	CMP $061A			; CD 1A 06
	TYX				  ; BB
	BIT $C001			; 2C 01 C0
	TSB $08			  ; 04 08
	BPL $0704			; 10 00
	JMP $0080			; 4C 80 00
	JSL $200020		  ; 22 20 00 20
	BRK $60			  ; 00 60
	JSR $1010			; 20 10 10
	STX $C2,Y			; 96 C2
	PLP				  ; 28
	BRK $06			  ; 00 06
	LDA $01			  ; A1 01
	ORA $DC			  ; 13 DC
	BRK $47			  ; 00 47
	TSB $C1			  ; 04 C1
	EOR $B9			  ; 43 B9
	ASL $E40C,X		  ; 1E 0C E4
	ORA $01			  ; 11 01
	COP $04			  ; 02 04

Field_Function_020:
	PHP				  ; 08
	LDY #$20			 ; A0 20
	BRA $06AD			; 80 82
	BRK $50			  ; 00 50
	BRK $00			  ; 00 00
	COP $02			  ; 02 02
	BVC $0743			; 50 10
	BRK $00			  ; 00 00
	STX $C0			  ; 86 C0
	BIT $0400,X		  ; 3C 00 04
	LDX #$01			 ; A2 01
	ORA $2C			  ; 17 2C
	BPL $0745			; 10 05
	LDY #$F0			 ; A0 F0
	LDA $0C2FCF,X		; BF CF 2F 0C
	LDA $2F			  ; B3 2F
	ORA $D4			  ; 01 D4
	CLC				  ; 18
	BVC $0760			; 50 13
	CPY #$80			 ; C0 80
	INC				  ; 1A
	ORA $00			  ; 03 00
	SBC $F1			  ; F3 F1
	TRB $1F			  ; 14 1F
	ORA $18			  ; 03 18
	BEQ $0759			; F0 FF
	SBC $0004F7,X		; FF F7 04 00
	ORA $A3			  ; 11 A3
	ORA $15			  ; 01 15
	AND #$01			 ; 29 01
	AND $20			  ; 32 20
	CMP $C2			  ; D1 C2
	LDY $0319,X		  ; BC 19 03
	LDA $16			  ; B2 16
	ORA $02			  ; 01 02
	TAY				  ; A8
	ORA #$10			 ; 09 10
	JSR $0040			; 20 40 00
	ORA $0F0080		  ; 0F 80 00 0F
	BRK $20			  ; 00 20
	RTS				  ; 60
	JSR $1010			; 20 10 10
	EOR $D4			  ; 41 D4
	LSR $00			  ; 46 00

Field_Function_021:
	PHP				  ; 08
	LDY $01			  ; A4 01
	ORA $96			  ; 11 96
	BRK $23			  ; 00 23
	BIT $71,X			; 34 71
	EOR $C1			  ; 43 C1
	CLC				  ; 18
	BRK $09			  ; 00 09
	ORA $0401,X		  ; 1D 01 04
	TSB $08			  ; 04 08
	JSR $4020			; 20 20 40
	BRA $079B			; 80 00
	BRK $10			  ; 00 10
	BRK $01			  ; 00 01
	BRK $10			  ; 00 10
	JSR $1000			; 20 00 10
	EOR $2DC7,X		  ; 5D C7 2D
	BRK $06			  ; 00 06
	LDA $01			  ; A5 01
	ORA $64			  ; 13 64
	BRK $2D			  ; 00 2D
	JMP $4210			; DC 10 42
	LDA $17			  ; B2 17
	BRK $85			  ; 00 85
	ORA $6A			  ; 05 6A
	LDY $38,X			; B4 38
	INY				  ; C8
	BCC $077E			; 90 C1
	STA $06			  ; 81 06
	AND $1FFE			; 2D FE 1F
	ORA $11			  ; 11 11
	ORA $00			  ; 11 00
	AND $21A0,Y		  ; 39 A0 21
	ORA $C3			  ; 03 C3
	LSR $00			  ; 46 00

Field_Function_022:
	PHP				  ; 08
	LDX $01			  ; A6 01
	ASL $57,X			; 16 57
	ORA $30			  ; 01 30
	PEI $B0			  ; D4 B0

Field_Function_023:
	REP #$B6			 ; C2 B6
	SEC				  ; 38
	ASL $E4,X			; 16 E4
	TSB $7E69			; 0C 69 7E
	LDY $19			  ; A4 19
	STA $E6			  ; 91 E6
	EOR $9A			  ; 47 9A
	BRK $22			  ; 00 22
	ORA $0F1F1F,X		; 1F 1F 1F 0F
	BNE $07BD			; D0 D1
	BVC $080F			; 50 21
	TAX				  ; AA
	PHX				  ; DA
	BVC $07F2			; 50 00

Field_Function_024:
	PHP				  ; 08
	LDA $01			  ; A7 01
	ORA $0089,Y		  ; 19 89 00
	BIT $7320,X		  ; 3C 20 73
	ORA $BB			  ; 03 BB
	EOR $00			  ; 43 00
	BRK $13			  ; 00 13
	COP $BC			  ; 02 BC
	TSB $08			  ; 04 08
	BPL $0827			; 10 20
	RTI				  ; 40
	BRK $2F			  ; 00 2F
	BRK $12			  ; 00 12
	BRK $00			  ; 00 00
	BPL $0810			; 10 00
	DEC				  ; 3A
	RTS				  ; 60
	AND $9E			  ; 25 9E
	CMP $78			  ; D7 78
	BRK $02			  ; 00 02
	TAY				  ; A8
	ORA $18			  ; 01 18
	SEI				  ; 78
	ORA $35			  ; 01 35
	JMP $8321			; 4C 21 83
	CMP $20			  ; C1 20
	ASL $0D			  ; 06 0D
	ORA $D432,X		  ; 1D 32 D4
	INY				  ; C8

Field_Function_025:
	PHP				  ; 08
	BPL $086C			; 10 40
	STX $80			  ; 86 80
	BRK $25			  ; 00 25
	SBC $03			  ; F3 03
	BMI $0835			; 30 01
	RTS				  ; 60
	PLP				  ; 28
	BVC $0848			; 50 10
	EOR $D5,X			; 55 D5
	SEI				  ; 78
	BRK $06			  ; 00 06
	LDA #$01			 ; A9 01
	ORA $AF			  ; 12 AF
	BRK $2C			  ; 00 2C
	JMP $82B0			; DC B0 82
	DEC $18			  ; C6 18
	BRK $B6			  ; 00 B6
	AND $01			  ; 23 01
	COP $04			  ; 02 04

Field_Function_026:
	PHP				  ; 08
	BPL $0871			; 10 20
	RTI				  ; 40
	BRA $0854			; 80 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	CPX #$00			 ; E0 00
	BPL $08BB			; 10 5D
	CMP $2B			  ; D3 2B
	BRK $08			  ; 00 08
	TAX				  ; AA
	ORA $13			  ; 01 13
	CMP $00			  ; D2 00
	TRB $805C			; 1C 5C 80
	CPY $23D1			; CC D1 23
	ORA $6A3201		  ; 0F 01 32 6A

Field_Function_027:
	REP #$3C			 ; C2 3C

Field_Function_028:
	PHP				  ; 08
	SBC $20			  ; F3 20
	TSB $078C			; 0C 8C 07
	PEI $1F			  ; D4 1F
	ORA $11			  ; 11 11
	ORA $50			  ; 11 50
	CLC				  ; 18
	BEQ $08A1			; F0 1F
	AND $4F			  ; 27 4F
	TRB $00			  ; 14 00
	ASL $01AB			; 0E AB 01
	EOR $0320,Y		  ; 59 20 03
	LDY $40,X			; B4 40
	CMP $03			  ; C1 03
	CPY $0028			; CC 28 00
	LDA $2B			  ; B7 2B
	CLI				  ; 58
	COP $60			  ; 02 60
	ORA #$10			 ; 09 10
	BRK $4B			  ; 00 4B
	BRK $2C			  ; 00 2C
	LDA $01			  ; A5 01
	ORA $10			  ; 01 10
	BPL $08A4			; 10 00
	JSR $1030			; 20 30 10
	LSR $500B,X		  ; 5E 0B 50
	BRK $06			  ; 00 06
	LDY $1401			; AC 01 14
	XBA				  ; EB
	BRK $34			  ; 00 34
	BIT $4431,X		  ; 3C 31 44
	LDA $1C			  ; B3 1C
	TSB $064D			; 0C 4D 06
	ORA $64			  ; 01 64
	TSB $08			  ; 04 08
	BPL $0900			; 10 40
	LSR $80			  ; 46 80
	ORA $22			  ; 11 22
	BPL $08C6			; 10 00
	BPL $08D8			; 10 10
	LDY #$21			 ; A0 21
	BPL $08DC			; 10 10
	TXS				  ; 9A
	LSR $3A			  ; 46 3A
	BRK $08			  ; 00 08
	LDA $1501			; AD 01 15
	AND $01			  ; 31 01
	BIT $CC,X			; 34 CC
	JSR $C803			; 20 03 C8
	ASL $A918,X		  ; 1E 18 A9
	AND $01			  ; 25 01
	TRB $28			  ; 14 28
	CLC				  ; 18
	AND $22			  ; 31 22
	RTI				  ; 40
	BRK $05			  ; 00 05
	STX $10			  ; 86 10
	ORA $01			  ; 11 01
	BPL $08FE			; 10 10
	BMI $0910			; 30 20
	BPL $0948			; 10 56
	DEX				  ; CA
	ROL $00,X			; 36 00
	TSB $AE			  ; 04 AE
	ORA $14			  ; 01 14
	CPX $00			  ; E4 00
	AND $D0			  ; 25 D0
	LDY #$C3			 ; A0 C3
	DEC $1D			  ; C6 1D

Field_Function_029:
	PHP				  ; 08
	LDA $23			  ; B3 23
	ROL $02,X			; 36 02
	CLD				  ; D8

Field_Function_02A:
	PHP				  ; 08
	RTS				  ; 60
	AND $80			  ; 23 80
	STA $5400			; 8D 00 54
	ORA $01			  ; 01 01
	ORA $01			  ; 01 01
	CPX #$D0			 ; E0 D0
	BPL $0926			; 10 10
	STA $C1,X			; 95 C1
	AND $00			  ; 37 00

Field_Function_02B:
	PHP				  ; 08
	LDA $3B1501		  ; AF 01 15 3B
	ORA $39			  ; 01 39
	PLA				  ; 68
	EOR $06			  ; 41 06
	CMP $17			  ; D3 17
	BRK $41			  ; 00 41
	BIT $02,X			; 34 02
	COP $08			  ; 02 08

Field_Function_02C:
	PHP				  ; 08
	BPL $094F			; 10 20
	BRA $08B1			; 80 80
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $01			  ; 00 01
	BRK $20			  ; 00 20
	JSR $5D10			; 20 10 5D
	CMP $3C			  ; C7 3C
	BRK $08			  ; 00 08
	BCS $0943			; B0 01
	ORA $C5			  ; 12 C5
	BRK $23			  ; 00 23
	LDY $0640,X		  ; BC 40 06
	CMP $1C			  ; D2 1C
	TSB $BB			  ; 04 BB
	AND $3A			  ; 32 3A
	COP $E8			  ; 02 E8

Field_Function_02D:
	PHP				  ; 08
	LDY #$46			 ; A0 46
	EOR $00			  ; 47 00
	ORA $01A4,X		  ; 1D A4 01
	ORA $1F			  ; 01 1F
	BPL $097D			; 10 20
	JSR $1190			; 20 90 11
	EOR $D5,X			; 55 D5
	ROL $00			  ; 26 00
	ASL $01B1			; 0E B1 01
	ORA $B4			  ; 12 B4
	BRK $26			  ; 00 26
	JMP $C320			; DC 20 C3
	LDA $0023,X		  ; BD 23 00
	LDA $026017,X		; BF 17 60 02
	TRB $08			  ; 14 08
	BRK $A6			  ; 00 A6
	RTI				  ; 40
	BRA $097E			; 80 02
	LDY $12			  ; A4 12
	ORA $32			  ; 13 32
	AND $11			  ; 31 11
	AND $50			  ; 21 50
	ORA $4D,X			; 15 4D
	STP				  ; DB
	PLP				  ; 28
	BRK $0A			  ; 00 0A
	LDA $01			  ; B2 01
	TRB $F0			  ; 14 F0
	BRK $30			  ; 00 30
	TSB $D1			  ; 04 D1
	BRL $285D			; 82 C8 1E
	ORA $B2			  ; 05 B2
	ROL $36			  ; 26 36
	JMP ($0804)		  ; 6C 04 08
	BPL $09BE			; 10 20
	BRA $092D			; 80 8D
	BRK $42			  ; 00 42
	ORA $00			  ; 11 00
	BRK $01			  ; 00 01
	BPL $09D0			; 10 28
	BCC $09CA			; 90 20
	LSR $C5,X			; 56 C5
	ROL $00,X			; 36 00
	ASL $B3			  ; 06 B3
	ORA $16			  ; 01 16
	ADC $01			  ; 63 01
	PHY				  ; 5A
	MVN $0281			; 54 81 02
	LDX $0020,Y		  ; BE 20 00
	LDA $18			  ; B7 18
	ORA $02			  ; 01 02
	TSB $08			  ; 04 08
	BPL $09E3			; 10 20
	RTI				  ; 40
	BRA $09C6			; 80 00
	BRK $11			  ; 00 11
	ORA $11			  ; 11 11
	ORA $01			  ; 11 01
	PLP				  ; 28
	BRA $09DF			; 80 10
	STA $87C7			; 8D C7 87
	BRK $06			  ; 00 06
	LDY $01,X			; B4 01
	ORA $22,X			; 15 22
	ORA $2D			  ; 01 2D
	BPL $0A3D			; 10 61
	EOR #$C3			 ; 49 C3
	ORA $5000,Y		  ; 19 00 50
	ASL $0202,X		  ; 1E 02 02
	TSB $08			  ; 04 08
	BPL $0A28			; 10 40
	RTI				  ; 40
	BRA $09EB			; 80 00
	BRK $01			  ; 00 01
	BRK $10			  ; 00 10
	BRK $00			  ; 00 00
	PLP				  ; 28
	RTI				  ; 40
	BPL $0A42			; 10 4D
	CMP $32			  ; C7 32
	BRK $08			  ; 00 08
	LDA $01,X			; B5 01
	ORA $07,X			; 15 07
	ORA $3A			  ; 01 3A
	JSR $C321			; 20 21 C3
	INY				  ; C8
	JSR $790C			; 20 0C 79
	ROL $0F			  ; 26 0F
	COP $04			  ; 02 04
	SEI				  ; 78
	BPL $09ED			; 10 E0
	EOR $80			  ; 41 80
	ORA $00			  ; 11 00
	ORA $10			  ; 01 10
	BPL $0A25			; 10 10
	BVC $0A48			; 50 31
	BCC $0A39			; 90 20
	LSR $C5,X			; 56 C5
	BIT $0600,X		  ; 3C 00 06
	LDX $01,Y			; B6 01
	ORA $6F			  ; 17 6F
	ORA $47			  ; 01 47
	TRB $C1			  ; 14 C1
	CMP $B9			  ; C3 B9
	AND $1C			  ; 21 1C
	CPX $11			  ; E4 11
	ORA $02			  ; 01 02
	BVS $0A38			; 70 08
	CPY #$21			 ; C0 21
	BRK $87			  ; 00 87
	BRK $54			  ; 00 54
	ORA $12			  ; 11 12
	ORA $12			  ; 12 12
	ORA $11			  ; 11 11
	BPL $0A4E			; 10 10
	EOR #$C5			 ; 49 C5
	STZ $00			  ; 64 00
	TSB $B7			  ; 04 B7
	ORA $17			  ; 01 17
	CLV				  ; B8
	ORA $37			  ; 01 37
	JMP ($C281,X)		; 7C 81 C2
	CMP $1E			  ; C5 1E
	BRK $B2			  ; 00 B2
	JSL $040201		  ; 22 01 02 04

Field_Function_02E:
	PHP				  ; 08
	BPL $0A77			; 10 20
	RTI				  ; 40
	BRA $0A5A			; 80 00
	BRK $11			  ; 00 11
	ORA $11			  ; 11 11
	ORA $00			  ; 11 00
	JSR $1000			; 20 00 10
	CMP $5ACB,X		  ; DD CB 5A
	BRK $06			  ; 00 06
	CLV				  ; B8
	ORA $90			  ; 01 90
	SEI				  ; 78
	BRK $0F			  ; 00 0F
	TSB $C101			; 0C 01 C1
	CMP $0014			; CD 14 00
	AND $692D,X		  ; 3D 2D 69
	COP $04			  ; 02 04

Field_Function_02F:
	PHP				  ; 08
	BPL $0A7C			; 10 00
	EOR $0080			; 4D 80 00
	AND $0F			  ; 21 0F
	BRK $F0			  ; 00 F0
	BRK $00			  ; 00 00
	JSR $1004			; 20 04 10
	CMP $00624F,X		; DF 4F 62 00

Field_Function_030:
	PHP				  ; 08
	LDA $1701,Y		  ; B9 01 17
	ADC $01			  ; 61 01
	MVP $712C			; 44 2C 71
	ORA $BD			  ; 03 BD
	CLC				  ; 18
	BRK $BA			  ; 00 BA
	ASL $01,X			; 16 01
	COP $78			  ; 02 78
	ORA #$10			 ; 09 10
	CPY #$8B			 ; C0 8B
	STA $00			  ; 97 00
	STZ $00			  ; 64 00
	ORA $10			  ; 01 10
	ORA $00			  ; 01 00
	JSR $1050			; 20 50 10
	EOR $4BC7			; 4D C7 4B
	BRK $08			  ; 00 08
	TSX				  ; BA
	ORA $12			  ; 01 12
	LDA $00			  ; A5 00
	AND $F8			  ; 23 F8
	LDY #$C0			 ; A0 C0
	LDA $BF001E		  ; AF 1E 00 BF
	ORA $05			  ; 01 05
	COP $14			  ; 02 14

Field_Function_031:
	PHP				  ; 08
	BPL $0A66			; 10 A0
	RTI				  ; 40
	BRA $0ACB			; 80 02
	LDY $03			  ; A4 03
	ORA $30			  ; 03 30
	BMI $0ACF			; 30 00
	ORA $0010,Y		  ; 19 10 00
	EOR $28C3			; 4D C3 28
	BRK $08			  ; 00 08
	TYX				  ; BB
	ORA $97			  ; 01 97
	BVS $0ADD			; 70 01
	ORA $2104,Y		  ; 19 04 21
	ORA $CE			  ; 03 CE
	ORA $00			  ; 17 00
	LDA $682D,Y		  ; B9 2D 68
	DEX				  ; CA
	BPL $0AD1			; 10 E8
	WDM $A0			  ; 42 A0

Field_Function_032:
	PHK				  ; 4B
	BRK $02			  ; 00 02
	LDY $214F,X		  ; BC 4F 21
	AND $10			  ; 21 10
	BPL $0B15			; 10 20
	TSB $10			  ; 04 10
	EOR $00505B,X		; 5F 5B 50 00

Field_Function_033:
	PHP				  ; 08
	LDY $1701,X		  ; BC 01 17
	STZ $01,X			; 74 01
	JSR $40F0			; 20 F0 40
	ORA $C7			  ; 03 C7
	AND $10			  ; 21 10
	BRK $23			  ; 00 23
	ORA $26			  ; 01 26
	TSB $08			  ; 04 08
	BMI $0B31			; 30 21
	RTI				  ; 40
	BRA $0B1C			; 80 09
	STA $10			  ; 92 10
	BRK $01			  ; 00 01
	BPL $0B29			; 10 10
	SEI				  ; 78
	BRK $11			  ; 00 11
	EOR $C0,X			; 55 C0
	BIT $0800,X		  ; 3C 00 08
	LDA $1901,X		  ; BD 01 19
	LDX #$01			 ; A2 01
	BVC $0B98			; 50 70
	ADC $49			  ; 61 49
	CMP $23			  ; D3 23
	ORA $42			  ; 05 42
	BIT $01,X			; 34 01
	JMP ($0804)		  ; 6C 04 08
	RTS				  ; 60
	AND $80			  ; 23 80
	STA $5200			; 8D 00 52
	JSR $0200			; 20 00 02
	COP $60			  ; 02 60
	PLP				  ; 28
	JSR $6611			; 20 11 66
	CMP $46,X			; D5 46
	BRK $08			  ; 00 08
	LDX $2001,Y		  ; BE 01 20
	LDY $2A03			; AC 03 2A
	CPX #$71			 ; E0 71
	CMP $C1			  ; C3 C1
	DEC				  ; 3A
	BRK $06			  ; 00 06
	ORA $0401,X		  ; 1D 01 04
	BRA $0B61			; 80 09
	BPL $0B7A			; 10 20
	BRA $0ADC			; 80 80
	BRK $46			  ; 00 46
	BPL $0B62			; 10 02
	BRK $01			  ; 00 01
	BPL $0B94			; 10 30
	BVC $0B77			; 50 11
	STX $73D7			; 8E D7 73
	BRK $06			  ; 00 06
	LDA $A11801,X		; BF 01 18 A1
	ORA $3D			  ; 01 3D
	MVP $4281			; 44 81 42
	TSX				  ; BA
	ORA $00			  ; 12 00
	LDY $0112,X		  ; BC 12 01
	BCS $0BDC			; B0 60
	ORA #$10			 ; 09 10
	JSR $95C0			; 20 C0 95
	BRK $06			  ; 00 06
	BPL $0B86			; 10 01
	BRK $01			  ; 00 01
	BRK $28			  ; 00 28
	BMI $0B9C			; 30 11
	EOR $3CD7			; 4D D7 3C
	BRK $06			  ; 00 06
	CPY #$01			 ; C0 01
	ASL $66,X			; 16 66
	ORA $32			  ; 01 32
	TSB $41			  ; 04 41
	ORA $D0			  ; 03 D0
	AND $12			  ; 25 12
	LDA $30,X			; B5 30
	ROR				  ; 6A
	COP $04			  ; 02 04

Field_Function_034:
	PHP				  ; 08
	BPL $0C04			; 10 60
	CPY $1218			; CC 18 12
	BRK $0F			  ; 00 0F
	BRK $00			  ; 00 00
	JSR $18A0			; 20 A0 18
	BVC $0BD1			; 50 21
	STA $D6,X			; 95 D6
	EOR $0800,X		  ; 5D 00 08
	CMP $01			  ; C1 01
	TSB $01CF			; 0C CF 01
	AND $432104,X		; 3F 04 21 43
	INY				  ; C8
	EOR $64,X			; 55 64
	LDA #$25			 ; A9 25
	ASL				  ; 0A
	LSR $70			  ; 46 70
	CLC				  ; 18
	LDA $60			  ; A1 60
	TSB $07			  ; 04 07
	AND $44,X			; 35 44
	ORA $11			  ; 11 11
	ORA $F1			  ; 11 F1
	CPX #$21			 ; E0 21
	LDY #$20			 ; A0 20
	EOR $D6,X			; 55 D6
	LSR $00			  ; 46 00
	TSB $C2			  ; 04 C2
	ORA $1E			  ; 01 1E
	SBC $02			  ; E7 02
	ORA $0410FC,X		; 1F FC 10 04
	CPY #$32			 ; C0 32
	ORA $0B			  ; 12 0B
	TCS				  ; 1B
	ORA $20			  ; 01 20
	TSB $80			  ; 04 80
	BPL $0C0E			; 10 20
	BRK $84			  ; 00 84
	BRK $4A			  ; 00 4A
	AND $21			  ; 21 21
	ORA $12			  ; 11 12
	ORA $2A			  ; 11 2A
	BVC $0C1F			; 50 25
	STX $85,Y			; 96 85
	LSR $00			  ; 46 00

Field_Function_035:
	PHP				  ; 08
	CMP $01			  ; C3 01
	CLC				  ; 18
	STA $01,X			; 95 01
	LSR				  ; 4A
	STZ $61,X			; 74 61
	STA $BA			  ; 83 BA
	ORA $00			  ; 17 00
	STZ $12,X			; 74 12
	PHY				  ; 5A
	COP $68			  ; 02 68
	ORA #$10			 ; 09 10
	RTI				  ; 40

Field_Function_036:
	PHB				  ; 8B
	ORA $2D			  ; 17 2D
	CPX $01			  ; E4 01
	ORA $10			  ; 01 10
	ORA $00			  ; 12 00
	PLP				  ; 28
	CPY #$21			 ; C0 21
	LSR $8CD7,X		  ; 5E D7 8C
	BRK $06			  ; 00 06
	CPY $01			  ; C4 01
	ROL $F4			  ; 26 F4
	ASL $4B			  ; 06 4B
	CPX #$61			 ; E0 61
	MVP $44C4			; 44 C4 44
	BRK $BB			  ; 00 BB
	JSR $0202			; 20 02 02
	RTS				  ; 60
	ORA #$80			 ; 09 80
	AND $C0			  ; 25 C0
	STA $00,X			; 95 00
	MVN $3032			; 54 32 30
	BMI $0C70			; 30 30
	ORA $21			  ; 03 21
	BPL $0C64			; 10 20
	EOR $50D7,X		  ; 5D D7 50
	BRK $08			  ; 00 08
	CMP $01			  ; C5 01
	ORA $01B0,Y		  ; 19 B0 01
	MVP $A1A4			; 44 A4 A1
	STA $CD			  ; 83 CD
	PLP				  ; 28
	BRK $B7			  ; 00 B7
	BIT $0264			; 2C 64 02
	BCC $0C64			; 90 09
	BPL $0BDD			; 10 80
	JMP $0080			; 4C 80 00
	BRK $02			  ; 00 02
	COP $20			  ; 02 20
	BRK $50			  ; 00 50
	AND $50			  ; 21 50
	BPL $0CC7			; 10 5D
	CMP $5F			  ; D7 5F
	BRK $06			  ; 00 06
	DEC $01			  ; C6 01
	ORA $028C,X		  ; 1D 8C 02
	CLI				  ; 58
	STZ $81			  ; 64 81
	CPY $19C0			; CC C0 19
	BRK $73			  ; 00 73
	TRB $0201			; 1C 01 02
	TSB $F0			  ; 04 F0

Field_Function_037:
	SEP #$25			 ; E2 25
	BRA $0C1B			; 80 97
	BRK $58			  ; 00 58
	BRK $20			  ; 00 20
	COP $02			  ; 02 02
	BPL $0CAC			; 10 20
	LDY #$16			 ; A0 16
	LDA $44DB			; AD DB 44
	BRK $04			  ; 00 04
	CMP $01			  ; C7 01
	JSR $03D4			; 20 D4 03
	EOR $60,X			; 55 60
	STA $82			  ; 81 82
	LDA $143C,Y		  ; B9 3C 14
	CPX $11			  ; E4 11
	ROL				  ; 2A
	PEI $A4			  ; D4 A4
	EOR $A1			  ; 51 A1
	ROL $8D			  ; 26 8D
	ASL				  ; 0A
	AND $92,X			; 35 92
	SBC $3F			  ; F3 3F
	SBC $D9C0F3,X		; FF F3 C0 D9
	BVC $0CD8			; 50 25
	ORA $C5			  ; 05 C5
	PHY				  ; 5A
	BRK $04			  ; 00 04
	INY				  ; C8
	ORA $1A			  ; 01 1A
	STY $02,X			; 94 02
	ADC #$00			 ; 69 00
	BRK $80			  ; 00 80
	LDX $0400,Y		  ; BE 00 04
	TAY				  ; A8
	ORA $D269,Y		  ; 19 69 D2
	LDY $49			  ; A4 49
	STA $46			  ; 93 46
	STA $06			  ; 83 06
	ORA $FF00			; 0D 00 FF
	SBC $9FFFFF,X		; FF FF FF 9F
	INX				  ; E8
	BRK $30			  ; 00 30
	ORA $01F4BF		  ; 0F BF F4 01

Field_Function_038:
	PHP				  ; 08
	CMP #$01			 ; C9 01
	TCS				  ; 1B
	PHD				  ; 0B
	COP $41			  ; 02 41
	BMI $0C87			; 30 A2
	ORA $C6			  ; 05 C6
	AND $00			  ; 21 00
	LDA $22			  ; B2 22
	ORA $02			  ; 01 02

Field_Function_039:
	PHP				  ; 08

Field_Function_03A:
	PHP				  ; 08
	BPL $0D11			; 10 20
	RTI				  ; 40
	BRA $0CF4			; 80 00
	BRK $11			  ; 00 11
	BPL $0D09			; 10 11
	ORA $00			  ; 11 00
	JSR $1090			; 20 90 10
	EOR $6ED7,X		  ; 5D D7 6E
	BRK $06			  ; 00 06
	DEX				  ; CA
	ORA $9D			  ; 01 9D
	LDA $02			  ; A1 02
	EOR $43C110,X		; 5F 10 C1 43
	BNE $0D50			; D0 43
	TRB $BC			  ; 14 BC
	BMI $0D7B			; 30 6A
	DEC				  ; 3A
	STY $D121			; 8C 21 D1
	CMP $C5			  ; C1 C5

Field_Function_03B:
	PHP				  ; 08
	ORA $50			  ; 17 50
	AND $222220		  ; 2F 20 22 22
	BCC $0D51			; 90 31
	BCC $0D44			; 90 22
	INC				  ; 1A
	STA $78,X			; 95 78
	BRK $08			  ; 00 08
	WAI				  ; CB
	ORA $24			  ; 01 24
	STY $7805			; 8C 05 78
	CPY $81			  ; C4 81
	TSB $5AC1			; 0C C1 5A
	ORA $011CB5		  ; 0F B5 1C 01
	COP $04			  ; 02 04
	CPY #$A2			 ; C0 A2
	ORA $4B			  ; 03 4B
	BRA $0D5F			; 80 21
	BRK $00			  ; 00 00
	BPL $0D55			; 10 13
	BMI $0CE4			; 30 A0
	JSR $6AA0			; 20 A0 6A
	EOR #$DA			 ; 49 DA
	SEI				  ; 78
	BRK $04			  ; 00 04
	CPY $5901			; CC 01 59
	CLV				  ; B8
	ORA $5A			  ; 01 5A
	STZ $C1,X			; 74 C1
	EOR $CC			  ; 43 CC
	AND $00			  ; 32 00
	LDA $2B			  ; B7 2B
	TCD				  ; 5B
	COP $68			  ; 02 68
	ORA #$10			 ; 09 10
	RTI				  ; 40

Field_Function_03C:
	PHK				  ; 4B
	BRK $2D			  ; 00 2D
	LDA $01			  ; A5 01
	ORA $10			  ; 01 10
	BPL $0D69			; 10 00
	ROR				  ; 6A
	CPY #$20			 ; C0 20
	EOR $6ED7,X		  ; 5D D7 6E
	BRK $06			  ; 00 06
	CMP $2101			; CD 01 21
	ASL $04			  ; 06 04
	ADC #$6C			 ; 69 6C
	COP $C2			  ; 02 C2
	BNE $0DA6			; D0 2A
	BRK $02			  ; 00 02
	AND $02			  ; 31 02
	COP $04			  ; 02 04

Field_Function_03D:
	PHP				  ; 08
	BPL $0DA5			; 10 20
	BRA $0D07			; 80 80
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $20			  ; 00 20
	BRK $20			  ; 00 20
	EOR $FA87			; 4D 87 FA
	BRK $04			  ; 00 04
	DEC $2101			; CE 01 21
	ROL $4404			; 2E 04 44
	JSR $02F1			; 20 F1 02
	LDA $1233,Y		  ; B9 33 12
	CPX $10			  ; E4 10
	PHY				  ; 5A
	COP $04			  ; 02 04
	BNE $0D4B			; D0 A2
	ORA $02			  ; 05 02
	TSB $08			  ; 04 08
	CPX #$02			 ; E0 02
	JSR $4442			; 20 42 44
	BPL $0DCD			; 10 19
	CPY #$11			 ; C0 11
	ORA $50C5,Y		  ; 19 C5 50
	BRK $0A			  ; 00 0A
	CMP $0A1001		  ; CF 01 10 0A
	BRK $FF			  ; 00 FF
	SBC $40			  ; E7 40
	LSR $B7			  ; 46 B7
	LSR $FF			  ; 46 FF
	RTI				  ; 40
	ASL $0233			; 0E 33 02
	CLD				  ; D8
	BEQ $0DBE			; F0 F0
	CMP $4C			  ; C3 4C
	INC				  ; 1A
	AND $10,X			; 35 10
	COP $22			  ; 02 22
	ORA $FF			  ; 12 FF
	CPX #$B7			 ; E0 B7
	BEQ $0DDA			; F0 FF
	SBC $0032FF,X		; FF FF 32 00
	COP $D0			  ; 02 D0
	ORA $1C			  ; 01 1C

Field_Function_03E:
	PHK				  ; 4B
	COP $59			  ; 02 59
	MVN $82D1			; 54 D1 82
	LDA $37			  ; B2 37
	CLC				  ; 18
	ADC $05,X			; 75 05
	PHY				  ; 5A
	ASL $3804			; 0E 04 38
	LDY #$25			 ; A0 25
	CPY #$81			 ; C0 81
	ORA $CA			  ; 03 CA
	ORA $10			  ; 11 10
	ORA $11			  ; 01 11
	BVC $0E27			; 50 29
	BPL $0E20			; 10 20

Field_Function_03F:
	PHY				  ; 5A
	CMP $0050,Y		  ; D9 50 00

Field_Function_040:
	PHP				  ; 08
	CMP $01			  ; D1 01
	AND $00			  ; 23 00
	ORA $78			  ; 05 78
	LDY $40F1			; AC F1 40
	LDX $0024,Y		  ; BE 24 00
	PHA				  ; 48
	CLC				  ; 18
	ORA $02			  ; 01 02
	TSB $08			  ; 04 08
	BPL $0E39			; 10 20
	RTI				  ; 40
	BRA $0E1C			; 80 00
	BRK $11			  ; 00 11
	ORA $11			  ; 11 11
	ORA $01			  ; 11 01
	PLA				  ; 68
	RTI				  ; 40
	BPL $0E73			; 10 4D
	CMP $C8			  ; D7 C8
	BRK $06			  ; 00 06
	CMP $01			  ; D2 01
	ORA $44034B,X		; 1F 4B 03 44
	JMP ($83A1,X)		; 7C A1 83
	LDA $4B			  ; B7 4B
	ORA $07			  ; 12 07
	ORA $D80236		  ; 0F 36 02 D8

Field_Function_041:
	PHP				  ; 08
	RTS				  ; 60
	AND $80			  ; 23 80
	STA $5500			; 8D 00 55
	BPL $0E54			; 10 10
	BPL $0E56			; 10 10
	BNE $0E30			; D0 E8
	BVC $0E6F			; 50 25
	STA $4A,X			; 95 4A

Field_Function_042:
	PHK				  ; 4B
	BRK $06			  ; 00 06
	CMP $01			  ; D3 01
	JSL $6E02DF		  ; 22 DF 02 6E
	SEI				  ; 78
	SBC $44			  ; E1 44
	TYX				  ; BB
	STZ $0A			  ; 64 0A
	BPL $0E70			; 10 13
	ORA $02			  ; 01 02
	STZ $E8,X			; 74 E8
	BNE $0E64			; D0 01
	DEC $01			  ; C6 01
	TSB $0000			; 0C 00 00
	AND $33			  ; 33 33
	AND $90			  ; 33 90
	SBC $A0			  ; F3 A0
	AND $5E			  ; 21 5E
	LDY $00F0			; AC F0 00
	COP $D4			  ; 02 D4
	ORA $22			  ; 01 22
	LDX $04			  ; A6 04
	EOR #$CC			 ; 49 CC
	SBC $C3			  ; F1 C3
	LDA $3A			  ; B7 3A
	BRK $B3			  ; 00 B3
	ORA $7C0201		  ; 0F 01 02 7C
	ORA #$10			 ; 09 10
	CPX #$4B			 ; E0 4B
	BRA $0E8B			; 80 00
	BIT $11			  ; 24 11
	ORA $31			  ; 13 31
	ORA $11			  ; 11 11
	BEQ $0EE3			; F0 50
	AND $4E			  ; 25 4E
	TCD				  ; 5B
	BRL $1499			; 82 00 06
	CMP $01,X			; D5 01
	JSL $2A0410		  ; 22 10 04 2A
	TSB $42F1			; 0C F1 42
	CPY #$3B			 ; C0 3B
	TRB $E4			  ; 14 E4
	TCS				  ; 1B
	ORA $30			  ; 01 30
	TSB $C8			  ; 04 C8
	BPL $0EAD			; 10 00
	EOR $80			  ; 43 80
	BRK $2A			  ; 00 2A
	AND $21			  ; 21 21
	AND $11			  ; 21 11
	ORA $12			  ; 01 12
	CPX #$35			 ; E0 35
	LSR $55,X			; 56 55
	EOR $00,X			; 55 00

Field_Function_043:
	PHP				  ; 08
	DEC $01,X			; D6 01
	AND $000820,X		; 3F 20 08 00

Field_Function_044:
	PHP				  ; 08
	WDM $84			  ; 42 84
	DEX				  ; CA
	PLP				  ; 28
	TSB $291F			; 0C 1F 29
	CLI				  ; 58
	COP $60			  ; 02 60
	ORA #$10			 ; 09 10
	BRK $4B			  ; 00 4B
	BRA $0ED5			; 80 00
	AND $01			  ; 25 01
	ORA $10			  ; 01 10
	BRK $10			  ; 00 10
	RTI				  ; 40
	BMI $0ECE			; 30 F0
	LSR $08FF,X		  ; 5E FF 08
	ORA $02			  ; 07 02
	DEC $01,X			; D6 01
	AND $E81F68,X		; 3F 68 1F E8
	AND $42			  ; 33 42
	STY $CA			  ; 84 CA
	AND $0C			  ; 32 0C
	BRK $29			  ; 00 29
	ORA $02			  ; 01 02
	RTS				  ; 60
	ORA #$10			 ; 09 10
	CPX #$4A			 ; E0 4A
	BRK $2C			  ; 00 2C
	LDA $00			  ; A5 00
	ORA $10			  ; 01 10
	BPL $0F10			; 10 10
	CPY #$30			 ; C0 30
	BEQ $0F63			; F0 5F
	SBC $0207D0,X		; FF D0 07 02
	CMP $01			  ; D7 01
	AND $F4			  ; 25 F4
	ASL $52			  ; 06 52
	BMI $0E92			; 30 82
	WDM $C7			  ; 42 C7
	ORA $5100,X		  ; 1D 00 51
	BIT $02			  ; 24 02
	COP $04			  ; 02 04

Field_Function_045:
	PHP				  ; 08
	BPL $0F3C			; 10 20
	RTI				  ; 40
	BRA $0F1F			; 80 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	PLP				  ; 28
	PER $9D65			; 62 65 9D
	WAI				  ; CB
	CMP $00			  ; C3 00
	ASL $D8			  ; 06 D8
	ORA $6A			  ; 01 6A
	BVS $0F49			; 70 17
	LDY $58,X			; B4 58
	LDA $83			  ; B2 83
	CPY $0046			; CC 46 00
	LDA $2B			  ; B2 2B
	EOR $6402,Y		  ; 59 02 64
	ORA #$90			 ; 09 90
	AND $40			  ; 25 40
	BRA $0F70			; 80 2C
	STA $01,X			; 95 01
	ORA $01			  ; 01 01
	BPL $0F4A			; 10 00
	PLP				  ; 28
	JSR $5E20			; 20 20 5E
	STP				  ; DB
	INY				  ; C8
	BRK $06			  ; 00 06
	CMP $3F01,Y		  ; D9 01 3F

Field_Function_046:
	PHP				  ; 08
	BRK $02			  ; 00 02
	PHA				  ; 48
	RTS				  ; 60
	CPY #$CF			 ; C0 CF
	ORA $00			  ; 07 00
	CLV				  ; B8
	AND $A80201		  ; 2F 01 02 A8
	ORA #$A0			 ; 09 A0
	ROL $80			  ; 26 80
	TXS				  ; 9A
	BRK $00			  ; 00 00
	RTI				  ; 40
	ORA $000F4F		  ; 0F 4F 0F 00
	JSR $0000			; 20 00 00
	BRK $C0			  ; 00 C0
	ASL $00			  ; 06 00
	BPL $0F52			; 10 DA
	ORA $23			  ; 01 23
	BNE $0F7E			; D0 02
	LSR $B168			; 4E 68 B1
	STY $BB			  ; 84 BB
	TSC				  ; 3B
	BRK $0A			  ; 00 0A
	TRB $01			  ; 14 01
	CPY #$04			 ; C0 04
	BRK $13			  ; 00 13
	BRK $0C			  ; 00 0C
	CLC				  ; 18
	AND $00			  ; 31 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	LDA $20			  ; A1 20
	MVP $5D11			; 44 11 5D
	CMP $46			  ; D7 46
	BRK $0E			  ; 00 0E
	STP				  ; DB
	ORA $26			  ; 01 26
	LDX $4D06			; AE 06 4D
	LDY $C1			  ; A4 C1
	STA $C0			  ; 83 C0
	BVC $0FC6			; 50 1E
	TAY				  ; A8
	TCS				  ; 1B
	ORA $02			  ; 01 02
	RTS				  ; 60

Field_Function_047:
	PHP				  ; 08
	CPX #$C5			 ; E0 C5
	PHD				  ; 0B
	ASL $0C			  ; 06 0C
	BEQ $0FC6			; F0 11
	ORA $00			  ; 12 00
	JSL $D02111		  ; 22 11 21 D0
	AND $53			  ; 21 53
	LDX $0082			; AE 82 00

Field_Function_048:
	PHP				  ; 08
	JMP $2601			; DC 01 26
	TXA				  ; 8A
	ORA $69			  ; 07 69
	RTI				  ; 40
	CMP $83			  ; C1 83
	BNE $1014			; D0 48
	SBC $6A30C6,X		; FF C6 30 6A
	COP $5C			  ; 02 5C
	AND $D3			  ; 31 D3
	SBC $C0			  ; E3 C0
	CLC				  ; 18
	ORA $18			  ; 13 18
	ORA $2F2201		  ; 0F 01 22 2F
	BCC $0FFF			; 90 20
	RTS				  ; 60
	AND $59			  ; 21 59
	DEC $96,X			; D6 96
	BRK $04			  ; 00 04
	CMP $1801,X		  ; DD 01 18

Field_Function_049:
	PHP				  ; 08
	STA $DC0A,X		  ; 9D 0A DC
	BEQ $102E			; F0 3F
	LDA $96			  ; B2 96
	SBC $6A0486,X		; FF 86 04 6A
	COP $A8			  ; 02 A8
	EOR #$A0			 ; 49 A0
	LSR $4D			  ; 46 4D
	COP $35			  ; 02 35
	PHA				  ; 48
	ORA $F2FF2F		  ; 0F 2F FF F2
	BRK $22			  ; 00 22
	BEQ $1005			; F0 FF
	SBC $0006FF,X		; FF FF 06 00
	ORA $01DE			; 0D DE 01
	BIT $F6			  ; 24 F6
	TSB $30			  ; 04 30
	JMP ($40A1,X)		; 7C A1 40
	DEC $052D			; CE 2D 05
	MVP $012D			; 44 2D 01
	DEX				  ; CA
	CPY $1008			; CC 08 10
	LDY #$CC			 ; A0 CC
	STY $6600			; 8C 00 66
	RTI				  ; 40
	ORA $40			  ; 03 40
	ORA $10			  ; 03 10
	BMI $102A			; 30 00
	JSR $5BC7			; 20 C7 5B
	TAX				  ; AA
