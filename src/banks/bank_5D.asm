;==============================================================================
; Dragon Quest III - Bank $5D Code
; Ultra-aggressive code extraction
;==============================================================================

.include "../include/hardware.inc"

.segment "BANK_5D_CODE"


Bank_5D_Function_00:
	PLY				  ; 7A
	PHB				  ; 8B
	INC $8BA3			; EE A3 8B
	INC $8BCC			; EE CC 8B
	INC $8BF1			; EE F1 8B
	INC $8C1A			; EE 1A 8C
	INC $8C43			; EE 43 8C
	INC $8C68			; EE 68 8C
	INC $8C85			; EE 85 8C
	INC $8CA2			; EE A2 8C
	INC $8CB3			; EE B3 8C
	INC $8CC4			; EE C4 8C
	INC $0138			; EE 38 01
	TXS				  ; 9A
	BRK $DB			  ; 00 DB
	ORA $DC			  ; 12 DC
	ORA $E5			  ; 12 E5
	ORA $E2			  ; 12 E2
	ORA $C0			  ; 12 C0
	ORA $D0			  ; 12 D0
	ORA $D2			  ; 12 D2
	ORA $D1			  ; 12 D1
	ORA $CA			  ; 12 CA
	ORA $D9			  ; 12 D9
	ORA $DA			  ; 11 DA
	ORA $D7			  ; 12 D7
	ORA $C9			  ; 12 C9
	ORA $C4			  ; 12 C4
	ORA $E1			  ; 12 E1
	ORA $D9			  ; 12 D9
	ORA $CF			  ; 12 CF
	ORA $C3			  ; 12 C3
	ORA $CD			  ; 12 CD
	ORA $CE			  ; 12 CE
	ORA $D8			  ; 12 D8
	ORA $E3			  ; 12 E3
	ORA $37			  ; 12 37
	ORA $44			  ; 12 44
	ORA $43			  ; 12 43
	ORA $4F			  ; 12 4F
	ORA $50			  ; 12 50
	ORA $4E			  ; 12 4E
	ORA $4D			  ; 12 4D
	ORA $7B			  ; 12 7B
	ORA $71			  ; 12 71
	ORA $72			  ; 12 72
	ORA $45			  ; 12 45
	ORA $46			  ; 12 46
	ORA $49			  ; 12 49
	ORA $4A			  ; 12 4A
	ORA $69			  ; 12 69
	ORA $67			  ; 12 67
	ORA $6D			  ; 12 6D
	ORA $6C			  ; 12 6C
	ORA $74			  ; 12 74
	ORA $73			  ; 12 73
	ORA $6B			  ; 12 6B
	ORA $6A			  ; 12 6A
	ORA $79			  ; 12 79
	ORA $8F			  ; 12 8F
	ORA $7A			  ; 11 7A
	ORA $70			  ; 12 70
	ORA $47			  ; 12 47
	ORA $48			  ; 12 48
	ORA $4B			  ; 12 4B
	ORA $4C			  ; 12 4C
	ORA $7C			  ; 12 7C
	ORA $76			  ; 12 76
	ORA $75			  ; 12 75
	ORA $78			  ; 12 78
	ORA $77			  ; 12 77
	ORA $6F			  ; 12 6F
	ORA $6E			  ; 12 6E
	ORA $A3			  ; 12 A3
	ORA $A2			  ; 12 A2
	ORA $90			  ; 12 90
	ORA $9B			  ; 12 9B
	ORA $91			  ; 11 91
	ORA $81			  ; 12 81
	ORA $B3			  ; 12 B3
	ORA $7E			  ; 11 7E
	ORA $7D			  ; 12 7D
	ORA $B2			  ; 12 B2
	ORA $8F			  ; 11 8F
	ORA $8E			  ; 12 8E
	ORA $80			  ; 12 80
	ORA $7F			  ; 12 7F
	ORA $68			  ; 12 68
	ORA $AA			  ; 12 AA
	ORA $94			  ; 11 94
	ORA $86			  ; 12 86
	ORA $87			  ; 12 87
	ORA $95			  ; 12 95
	ORA $85			  ; 12 85
	ORA $84			  ; 12 84
	ORA $93			  ; 12 93
	ORA $92			  ; 12 92
	ORA $83			  ; 12 83
	ORA $82			  ; 12 82
	ORA $62			  ; 12 62
	ORA $98			  ; 12 98
	ORA $8C			  ; 12 8C
	ORA $99			  ; 12 99
	ORA $8D			  ; 12 8D
	ORA $6E			  ; 12 6E
	BPL $8067			; 10 8B
	ORA $8A			  ; 12 8A
	ORA $97			  ; 12 97
	ORA $96			  ; 12 96
	ORA $89			  ; 12 89
	ORA $88			  ; 12 88
	ORA $9E			  ; 12 9E
	ORA $7F			  ; 12 7F
	ORA $66			  ; 11 66
	ORA $61			  ; 12 61
	ORA $65			  ; 12 65
	ORA $60			  ; 12 60
	ORA $9D			  ; 12 9D
	ORA $9C			  ; 12 9C
	ORA $A5			  ; 12 A5
	ORA $A4			  ; 12 A4
	ORA $9B			  ; 12 9B
	ORA $9A			  ; 12 9A
	ORA $B0			  ; 12 B0

Bank_5D_Function_01:
	ORA $5C			  ; 12 5C
	ORA $B7			  ; 12 B7
	ORA $AD			  ; 12 AD
	ORA $AE			  ; 12 AE
	ORA $B8			  ; 12 B8
	ORA $AF			  ; 12 AF
	ORA $AC			  ; 12 AC
	ORA $AB			  ; 12 AB
	ORA $B6			  ; 12 B6
	ORA $B5			  ; 12 B5
	ORA $AA			  ; 12 AA
	ORA $A9			  ; 12 A9
	ORA $C2			  ; 12 C2
	ORA $CC			  ; 12 CC
	ORA $C1			  ; 12 C1
	ORA $CB			  ; 12 CB
	ORA $DA			  ; 12 DA
	ORA $57			  ; 11 57
	ORA $A6			  ; 12 A6
	ORA $9F			  ; 12 9F
	ORA $A7			  ; 12 A7
	ORA $A0			  ; 12 A0
	ORA $A1			  ; 12 A1
	ORA $A8			  ; 12 A8
	ORA $64			  ; 12 64
	ORA $5F			  ; 12 5F
	ORA $5E			  ; 12 5E
	ORA $56			  ; 12 56
	ORA $5B			  ; 12 5B
	ORA $55			  ; 12 55
	ORA $5A			  ; 12 5A
	ORA $5D			  ; 12 5D
	ORA $63			  ; 12 63
	ORA $59			  ; 12 59
	ORA $54			  ; 12 54
	ORA $58			  ; 12 58
	ORA $53			  ; 12 53
	ORA $52			  ; 12 52
	ORA $51			  ; 12 51
	ORA $CA			  ; 12 CA
	ORA $BD			  ; 11 BD
	ORA $CB			  ; 11 CB
	ORA $D6			  ; 11 D6
	ORA $D7			  ; 11 D7
	ORA $08			  ; 11 08
	BRK $08			  ; 00 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	PHP				  ; 08
	BPL $8167			; 10 02
	TSB $00			  ; 04 00
	BPL $816C			; 10 03
	TSB $04			  ; 04 04
	ORA $04			  ; 05 04
	TSB $04			  ; 04 04
	ORA $0405			; 0D 05 04
	PHP				  ; 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA #$08			 ; 09 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	BRK $08			  ; 00 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	BPL $818C			; 10 02
	TSB $00			  ; 04 00
	BPL $8191			; 10 03
	TSB $04			  ; 04 04
	PHD				  ; 0B
	ORA $04			  ; 05 04
	TSB $03			  ; 04 03
	TSB $04			  ; 04 04
	TSB $05			  ; 04 05
	TSB $04			  ; 04 04
	PHP				  ; 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	PHP				  ; 08
	PHP				  ; 08
	BPL $81AD			; 10 02
	TSB $00			  ; 04 00
	BPL $81B2			; 10 03
	TSB $08			  ; 04 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	BRK $08			  ; 00 08
	BRK $04			  ; 00 04
	TSB $09			  ; 04 09
	PHP				  ; 08
	TSB $04			  ; 04 04
	ORA $09			  ; 01 09
	TSB $08			  ; 04 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA #$00			 ; 09 00
	PHP				  ; 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	PHP				  ; 08
	BPL $81DA			; 10 02
	TSB $00			  ; 04 00
	BPL $81DF			; 10 03
	TSB $04			  ; 04 04
	ORA $04040A		  ; 0F 0A 04 04
	ORA $08			  ; 07 08
	TSB $04			  ; 04 04
	SBC $080409,X		; FF 09 04 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA #$00			 ; 09 00
	PHP				  ; 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	PHP				  ; 08
	BPL $8203			; 10 02
	TSB $00			  ; 04 00
	BPL $8208			; 10 03
	TSB $04			  ; 04 04
	ORA $040B			; 0D 0B 04
	TSB $05			  ; 04 05
	TSB $0404			; 0C 04 04
	SBC $0404,X		  ; FD 04 04
	PHP				  ; 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA #$08			 ; 09 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	BRK $08			  ; 00 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	BPL $822C			; 10 02
	TSB $00			  ; 04 00
	BPL $8231			; 10 03
	TSB $04			  ; 04 04
	PHD				  ; 0B
	PHD				  ; 0B
	TSB $04			  ; 04 04
	ORA $0C			  ; 03 0C
	TSB $04			  ; 04 04
	XCE				  ; FB
	TSB $04			  ; 04 04
	PHP				  ; 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA #$08			 ; 09 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	BRK $08			  ; 00 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	BPL $8255			; 10 02
	TSB $00			  ; 04 00
	BPL $825A			; 10 03
	TSB $04			  ; 04 04
	ORA #$0B			 ; 09 0B
	TSB $04			  ; 04 04
	ORA $0C			  ; 01 0C
	TSB $04			  ; 04 04
	SBC $0404,Y		  ; F9 04 04
	PHP				  ; 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA #$00			 ; 09 00
	PHP				  ; 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	PHP				  ; 08
	BPL $827E			; 10 02
	TSB $00			  ; 04 00
	BPL $8283			; 10 03
	TSB $04			  ; 04 04
	PHP				  ; 08
	ASL				  ; 0A
	TSB $04			  ; 04 04
	BRK $05			  ; 00 05
	TSB $04			  ; 04 04
	SED				  ; F8
	TSB $04			  ; 04 04
	PHP				  ; 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ASL				  ; 0A
	PHP				  ; 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	BRK $08			  ; 00 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	BPL $82A7			; 10 02
	TSB $00			  ; 04 00
	BPL $82AC			; 10 03
	TSB $04			  ; 04 04
	SED				  ; F8
	ORA $FC04			; 0D 04 FC
	BRK $0E			  ; 00 0E
	TSB $04			  ; 04 04
	PHP				  ; 08
	ORA $000404		  ; 0F 04 04 00
	BPL $82BE			; 10 04
	PHP				  ; 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ASL				  ; 0A
	BRK $08			  ; 00 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	PHP				  ; 08
	BPL $82D4			; 10 02
	TSB $00			  ; 04 00
	BPL $82D9			; 10 03
	TSB $FE			  ; 04 FE
	SED				  ; F8
	ORA $04			  ; 11 04
	JSR ($1200,X)		; FC 00 12
	TSB $04			  ; 04 04
	BRK $13			  ; 00 13
	TSB $04			  ; 04 04
	PHP				  ; 08
	TRB $04			  ; 14 04
	PHP				  ; 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ASL				  ; 0A
	BRK $08			  ; 00 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	PHP				  ; 08
	BPL $8301			; 10 02
	TSB $00			  ; 04 00
	BPL $8306			; 10 03
	TSB $0C			  ; 04 0C
	BRK $0E			  ; 00 0E
	MVP $F804			; 44 04 F8
	ORA $0444			; 0D 44 04
	PHP				  ; 08
	ORA $000444		  ; 0F 44 04 00
	BPL $8358			; 10 44
	PHP				  ; 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ASL				  ; 0A
	PHP				  ; 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	BRK $08			  ; 00 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	BPL $832E			; 10 02
	TSB $00			  ; 04 00
	BPL $8333			; 10 03
	TSB $09			  ; 04 09
	SED				  ; F8
	ORA $44			  ; 11 44
	PHD				  ; 0B
	BRK $12			  ; 00 12
	MVP $0003			; 44 03 00
	ORA $44			  ; 13 44
	ORA $08			  ; 03 08
	TRB $44			  ; 14 44
	PHP				  ; 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA #$04			 ; 09 04
	BRK $15			  ; 00 15
	TSB $00			  ; 04 00
	PHP				  ; 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	PHP				  ; 08
	BPL $835F			; 10 02
	TSB $00			  ; 04 00
	BPL $8364			; 10 03
	TSB $04			  ; 04 04
	PHP				  ; 08
	ASL				  ; 0A
	TSB $04			  ; 04 04
	SED				  ; F8
	TSB $04			  ; 04 04
	PHP				  ; 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ASL $08			  ; 06 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	BRK $08			  ; 00 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	BPL $8384			; 10 02
	TSB $00			  ; 04 00
	BPL $8389			; 10 03
	TSB $00			  ; 04 00
	BRK $20			  ; 00 20
	TRB $04			  ; 14 04
	SBC $0416,Y		  ; F9 16 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	PHP				  ; 08
	PHP				  ; 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	BRK $08			  ; 00 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	BPL $83A1			; 10 02
	TSB $00			  ; 04 00
	BPL $83A6			; 10 03
	TSB $00			  ; 04 00
	INC $1420,X		  ; FE 20 14
	TSB $F7			  ; 04 F7
	ASL $04,X			; 16 04
	PHP				  ; 08
	ASL $0417			; 0E 17 04
	BRK $0E			  ; 00 0E
	CLC				  ; 18
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $0C			  ; 00 0C
	PHP				  ; 08
	PHP				  ; 08
	ORA $04			  ; 01 04
	BRK $08			  ; 00 08
	BRK $04			  ; 00 04
	PHP				  ; 08
	BPL $83C6			; 10 02
	TSB $00			  ; 04 00
	BPL $83CB			; 10 03
	TSB $04			  ; 04 04
	SBC $19			  ; F3 19
	TSB $10			  ; 04 10
	ORA $1A			  ; 03 1A
	MVP $03F8			; 44 F8 03
	INC				  ; 1A
	TSB $10			  ; 04 10
	XCE				  ; FB
	TCS				  ; 1B
	MVP $FBF8			; 44 F8 FB
	TCS				  ; 1B
	TSB $08			  ; 04 08
	PHD				  ; 0B
	TRB $0044			; 1C 44 00
	PHD				  ; 0B
	TRB $0004			; 1C 04 00
	XCE				  ; FB
	JSL $000414		  ; 22 14 04 00
	BRK $00			  ; 00 00
	TSB $0808			; 0C 08 08
	TRB $0044			; 1C 44 00
	PHP				  ; 08
	TRB $0004			; 1C 04 00
	SED				  ; F8
	JSL $080814		  ; 22 14 08 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08

Bank_5D_Function_04:
	ORA $04			  ; 07 04
	PHP				  ; 08
	BPL $8407			; 10 02
	TSB $00			  ; 04 00
	BPL $840C			; 10 03
	TSB $04			  ; 04 04
	SBC $19			  ; F1 19
	TSB $10			  ; 04 10
	ORA $1A			  ; 01 1A
	MVP $01F8			; 44 F8 01
	INC				  ; 1A
	TSB $10			  ; 04 10
	SBC $441B,Y		  ; F9 1B 44
	SED				  ; F8
	SBC $041B,Y		  ; F9 1B 04
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	TSB $0908			; 0C 08 09
	TRB $0044			; 1C 44 00
	ORA #$1C			 ; 09 1C
	TSB $00			  ; 04 00
	SBC $1422,Y		  ; F9 22 14
	PHP				  ; 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	PHP				  ; 08
	BPL $843C			; 10 02
	TSB $00			  ; 04 00
	BPL $8441			; 10 03
	TSB $04			  ; 04 04
	SBC $19			  ; F2 19
	TSB $10			  ; 04 10
	COP $1A			  ; 02 1A
	MVP $02F8			; 44 F8 02
	INC				  ; 1A
	TSB $10			  ; 04 10
	PLX				  ; FA
	TCS				  ; 1B
	MVP $FAF8			; 44 F8 FA
	TCS				  ; 1B
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $0B			  ; 00 0B
	BPL $8455			; 10 FB
	TCS				  ; 1B
	MVP $FBF8			; 44 F8 FB
	TCS				  ; 1B
	TSB $10			  ; 04 10
	ORA $1A			  ; 03 1A
	MVP $03F8			; 44 F8 03
	INC				  ; 1A
	TSB $08			  ; 04 08
	ASL				  ; 0A
	TRB $0044			; 1C 44 00
	ASL				  ; 0A
	TRB $0004			; 1C 04 00
	PLX				  ; FA
	JSL $080814		  ; 22 14 08 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	PHP				  ; 08
	BPL $8481			; 10 02
	TSB $00			  ; 04 00
	BPL $8486			; 10 03
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $0B			  ; 00 0B
	BPL $8487			; 10 FC
	TCS				  ; 1B
	MVP $FCF8			; 44 F8 FC
	TCS				  ; 1B
	TSB $10			  ; 04 10
	TSB $1A			  ; 04 1A
	MVP $04F8			; 44 F8 04
	INC				  ; 1A
	TSB $08			  ; 04 08
	TSB $441C			; 0C 1C 44
	BRK $0C			  ; 00 0C
	TRB $0004			; 1C 04 00
	JSR ($1422,X)		; FC 22 14
	PHP				  ; 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	PHP				  ; 08
	BPL $84B2			; 10 02
	TSB $00			  ; 04 00
	BPL $84B7			; 10 03
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $0B			  ; 00 0B
	BPL $84C2			; 10 06
	INC				  ; 1A
	MVP $06F8			; 44 F8 06
	INC				  ; 1A
	TSB $10			  ; 04 10
	INC $441B,X		  ; FE 1B 44
	SED				  ; F8
	INC $041B,X		  ; FE 1B 04
	PHP				  ; 08
	ASL $441C			; 0E 1C 44
	BRK $0E			  ; 00 0E
	TRB $0004			; 1C 04 00
	INC $1422,X		  ; FE 22 14
	PHP				  ; 08
	PHP				  ; 08
	ASL $04			  ; 06 04
	BRK $08			  ; 00 08
	ORA $04			  ; 07 04
	PHP				  ; 08
	BPL $84E3			; 10 02
	TSB $00			  ; 04 00
	BPL $84E8			; 10 03
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	BPL $84EE			; 10 01
	TCS				  ; 1B
	MVP $01F8			; 44 F8 01
	TCS				  ; 1B
	TSB $10			  ; 04 10
	ORA #$1A			 ; 09 1A
	MVP $08F8			; 44 F8 08
	INC				  ; 1A
	TSB $08			  ; 04 08
	ORA $1C			  ; 11 1C
	MVP $1100			; 44 00 11
	TRB $0004			; 1C 04 00
	ORA $22			  ; 01 22
	TRB $04			  ; 14 04
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	BPL $8512			; 10 04
	TCS				  ; 1B
	MVP $04F8			; 44 F8 04
	TCS				  ; 1B
	TSB $10			  ; 04 10
	TSB $441A			; 0C 1A 44
	SED				  ; F8
	PHD				  ; 0B
	INC				  ; 1A
	TSB $08			  ; 04 08
	TRB $1C			  ; 14 1C
	MVP $1400			; 44 00 14
	TRB $0004			; 1C 04 00
	TSB $22			  ; 04 22
	TRB $04			  ; 14 04
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	BPL $8534			; 10 05
	TCS				  ; 1B
	MVP $05F8			; 44 F8 05
	TCS				  ; 1B
	TSB $10			  ; 04 10
	ORA $441A			; 0D 1A 44
	SED				  ; F8
	TSB $041A			; 0C 1A 04
	PHP				  ; 08
	ORA $1C,X			; 15 1C
	MVP $1500			; 44 00 15
	TRB $0004			; 1C 04 00
	ORA $22			  ; 05 22
	TRB $04			  ; 14 04
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	BPL $8556			; 10 06
	TCS				  ; 1B
	MVP $06F8			; 44 F8 06
	TCS				  ; 1B
	TSB $10			  ; 04 10
	ASL $441A			; 0E 1A 44
	SED				  ; F8
	ORA $041A			; 0D 1A 04
	PHP				  ; 08
	ASL $1C,X			; 16 1C
	MVP $1600			; 44 00 16
	TRB $0004			; 1C 04 00
	ASL $22			  ; 06 22
	TRB $04			  ; 14 04
	BRK $00			  ; 00 00
	BRK $10			  ; 00 10
	CLC				  ; 18
	ORA $441D,X		  ; 1D 1D 44
	BEQ $8592			; F0 1D
	ORA $1804,X		  ; 1D 04 18
	ORA $1E,X			; 15 1E
	MVP $15F0			; 44 F0 15
	ASL $1004,X		  ; 1E 04 10
	TRB $441F			; 1C 1F 44
	SED				  ; F8
	TRB $041F			; 1C 1F 04
	BPL $859D			; 10 14
	BIT $44			  ; 24 44
	SED				  ; F8
	TRB $24			  ; 14 24
	TSB $10			  ; 04 10
	TSB $4425			; 0C 25 44
	SED				  ; F8
	TSB $0425			; 0C 25 04
	PHP				  ; 08
	TRB $26			  ; 14 26
	TSB $00			  ; 04 00
	TRB $27			  ; 14 27
	TSB $08			  ; 04 08
	TSB $0428			; 0C 28 04
	BRK $0C			  ; 00 0C
	AND #$04			 ; 29 04
	PHP				  ; 08
	TSB $2A			  ; 04 2A
	TSB $00			  ; 04 00
	TSB $2B			  ; 04 2B
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $10			  ; 00 10
	CLC				  ; 18
	TRB $442C			; 1C 2C 44
	BEQ $85D6			; F0 1C
	BIT $1804			; 2C 04 18
	TRB $2D			  ; 14 2D
	MVP $14F0			; 44 F0 14
	AND $1004			; 2D 04 10
	TRB $442E			; 1C 2E 44
	SED				  ; F8
	TRB $042E			; 1C 2E 04
	BPL $85E2			; 10 14
	AND $14F844		  ; 2F 44 F8 14
	AND $0C1004		  ; 2F 04 10 0C
	BIT $44,X			; 34 44
	SED				  ; F8
	TSB $0434			; 0C 34 04
	PHP				  ; 08
	TRB $35			  ; 14 35
	TSB $00			  ; 04 00
	TRB $36			  ; 14 36
	TSB $08			  ; 04 08
	TSB $0437			; 0C 37 04
	BRK $0C			  ; 00 0C
	SEC				  ; 38
	TSB $08			  ; 04 08
	TSB $39			  ; 04 39
	TSB $00			  ; 04 00
	TSB $3A			  ; 04 3A
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $15			  ; 00 15
	BPL $8617			; 10 1C
	TSC				  ; 3B
	MVP $1CF8			; 44 F8 1C
	TSC				  ; 3B

Bank_5D_Function_06:
	TSB $18			  ; 04 18
	TRB $443C			; 1C 3C 44
	BEQ $8623			; F0 1C
	BIT $1804,X		  ; 3C 04 18
	TRB $3D			  ; 14 3D
	MVP $14F0			; 44 F0 14
	AND $1804,X		  ; 3D 04 18
	TSB $443E			; 0C 3E 44
	BEQ $8623			; F0 0C
	ROL $1004,X		  ; 3E 04 10
	TRB $3F			  ; 14 3F
	MVP $14F8			; 44 F8 14
	AND $0C1004,X		; 3F 04 10 0C
	RTI				  ; 40
	MVP $0CF8			; 44 F8 0C
	RTI				  ; 40
	TSB $10			  ; 04 10
	TSB $41			  ; 04 41
	MVP $04F8			; 44 F8 04
	EOR $04			  ; 41 04
	PHP				  ; 08
	TRB $42			  ; 14 42
	TSB $00			  ; 04 00
	TRB $43			  ; 14 43
	TSB $04			  ; 04 04
	JSR ($0444,X)		; FC 44 04
	PHP				  ; 08
	TSB $0445			; 0C 45 04
	BRK $0C			  ; 00 0C
	LSR $04			  ; 46 04
	PHP				  ; 08
	TSB $47			  ; 04 47
	TSB $00			  ; 04 00
	TSB $48			  ; 04 48
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $13			  ; 00 13
	TSB $FC			  ; 04 FC
	MVP $E804			; 44 04 E8
	ORA $49			  ; 13 49
	MVP $1320			; 44 20 13
	EOR #$04			 ; 49 04
	BPL $8664			; 10 04
	LSR				  ; 4A
	MVP $04F8			; 44 F8 04
	LSR				  ; 4A
	TSB $18			  ; 04 18
	TRB $4B			  ; 14 4B
	MVP $14F0			; 44 F0 14
	PHK				  ; 4B
	TSB $18			  ; 04 18
	TSB $444C			; 0C 4C 44
	BEQ $8680			; F0 0C
	JMP $1004			; 4C 04 10
	TSB $444D			; 0C 4D 44
	SED				  ; F8
	TSB $044D			; 0C 4D 04
	BPL $8694			; 10 14
	LSR $F844			; 4E 44 F8
	TRB $4E			  ; 14 4E
	TSB $08			  ; 04 08
	TRB $4F			  ; 14 4F
	TSB $00			  ; 04 00
	TRB $50			  ; 14 50
	TSB $08			  ; 04 08
	TSB $0451			; 0C 51 04
	BRK $0C			  ; 00 0C
	EOR $04			  ; 52 04
	PHP				  ; 08
	TSB $53			  ; 04 53
	TSB $00			  ; 04 00
	TSB $54			  ; 04 54
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $13			  ; 00 13
	INX				  ; E8
	TSB $4455			; 0C 55 44
	JSR $550C			; 20 0C 55
	TSB $18			  ; 04 18
	ORA $4456			; 0D 56 44
	BEQ $86BE			; F0 0D
	LSR $04,X			; 56 04
	CLC				  ; 18
	ORA $57			  ; 05 57
	MVP $05F0			; 44 F0 05
	EOR $04			  ; 57 04
	BPL $86CA			; 10 0D
	CLI				  ; 58
	MVP $0DF8			; 44 F8 0D
	CLI				  ; 58
	TSB $10			  ; 04 10
	ORA $59			  ; 05 59
	MVP $05F8			; 44 F8 05
	EOR $1004,Y		  ; 59 04 10
	TRB $5A			  ; 14 5A
	MVP $14F8			; 44 F8 14
	PHY				  ; 5A
	TSB $08			  ; 04 08
	TRB $5B			  ; 14 5B
	TSB $00			  ; 04 00
	TRB $5C			  ; 14 5C
	TSB $04			  ; 04 04
	JSR ($0444,X)		; FC 44 04
	PHP				  ; 08
	TSB $045D			; 0C 5D 04
	BRK $0C			  ; 00 0C
	LSR $0804,X		  ; 5E 04 08
	TSB $5F			  ; 04 5F
	TSB $00			  ; 04 00
	TSB $60			  ; 04 60
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $12			  ; 00 12
	JSR $6101			; 20 01 61
	MVP $01E8			; 44 E8 01
	ADC $04			  ; 61 04
	BEQ $86FA			; F0 FC
	PER $1844			; 62 44 18
	JSR ($0462,X)		; FC 62 04
	BEQ $8712			; F0 0C
	ADC $44			  ; 63 44
	CLC				  ; 18
	TSB $0463			; 0C 63 04
	BEQ $8712			; F0 04
	STZ $44			  ; 64 44
	CLC				  ; 18
	TSB $64			  ; 04 64
	TSB $F8			  ; 04 F8
	TSB $4465			; 0C 65 44
	BPL $8726			; 10 0C
	ADC $04			  ; 65 04
	SED				  ; F8
	TSB $66			  ; 04 66
	MVP $0410			; 44 10 04
	ROR $04			  ; 66 04
	PHP				  ; 08
	TRB $67			  ; 14 67
	TSB $00			  ; 04 00
	TRB $68			  ; 14 68
	TSB $08			  ; 04 08
	TSB $0469			; 0C 69 04
	BRK $0C			  ; 00 0C
	ROR				  ; 6A
	TSB $08			  ; 04 08
	TSB $6B			  ; 04 6B
	TSB $00			  ; 04 00
	TSB $6C			  ; 04 6C
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $15			  ; 00 15
	JSR $6DF8			; 20 F8 6D
	MVP $F8E8			; 44 E8 F8
	ADC $F004			; 6D 04 F0
	SBC $6E			  ; F3 6E
	MVP $F318			; 44 18 F3
	ROR $1804			; 6E 04 18
	ORA $6F			  ; 03 6F
	MVP $03F0			; 44 F0 03
	ADC $FB1804		  ; 6F 04 18 FB
	BVS $87A1			; 70 44
	BEQ $875A			; F0 FB
	BVS $8765			; 70 04
	BPL $875E			; 10 FB
	ADC $44			  ; 71 44
	SED				  ; F8
	XCE				  ; FB
	ADC $04			  ; 71 04
	BPL $876E			; 10 03
	ADC $44			  ; 72 44
	SED				  ; F8
	ORA $72			  ; 03 72
	TSB $10			  ; 04 10
	PHD				  ; 0B
	ADC $44			  ; 73 44
	SED				  ; F8
	PHD				  ; 0B
	ADC $04			  ; 73 04
	PHP				  ; 08
	ORA $74			  ; 13 74
	TSB $00			  ; 04 00
	ORA $75			  ; 13 75
	TSB $04			  ; 04 04
	XCE				  ; FB
	ORA #$04			 ; 09 04
	PHP				  ; 08
	PHD				  ; 0B
	ROR $04,X			; 76 04
	BRK $0B			  ; 00 0B
	ADC $04			  ; 77 04
	PHP				  ; 08
	ORA $78			  ; 03 78
	TSB $00			  ; 04 00
	ORA $79			  ; 03 79
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $16			  ; 00 16
	PHP				  ; 08
	ORA $7A			  ; 03 7A
	TSB $08			  ; 04 08
	PHD				  ; 0B
	TDC				  ; 7B
	TSB $00			  ; 04 00
	ORA $7C			  ; 03 7C
	TSB $00			  ; 04 00
	PHD				  ; 0B
	ADC $0804,X		  ; 7D 04 08
	XCE				  ; FB
	ROR $0044,X		  ; 7E 44 00
	XCE				  ; FB
	ROR $F004,X		  ; 7E 04 F0
	ORA $7F			  ; 03 7F
	MVP $0318			; 44 18 03
	ADC $0B1004,X		; 7F 04 10 0B
	BRA $8802			; 80 44
	SED				  ; F8
	PHD				  ; 0B
	BRA $87C6			; 80 04
	BPL $87C7			; 10 03
	STA $44			  ; 81 44
	SED				  ; F8
	ORA $81			  ; 03 81
	TSB $F0			  ; 04 F0
	XCE				  ; FB
	BRL $9FD3			; 82 04 18
	XCE				  ; FB
	BRL $A017			; 82 44 18
	SBC $83			  ; F3 83
	MVP $F3F0			; 44 F0 F3
	STA $04			  ; 83 04
	BPL $87CF			; 10 F3
	STY $44			  ; 84 44
	SED				  ; F8
	SBC $84			  ; F3 84
	TSB $10			  ; 04 10
	XCE				  ; FB
	STA $44			  ; 85 44
	SED				  ; F8
	XCE				  ; FB
	STA $04			  ; 85 04
	PHP				  ; 08
	ORA $74			  ; 13 74
	TSB $00			  ; 04 00
	ORA $75			  ; 13 75
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $18			  ; 00 18
	TSB $FD			  ; 04 FD
	TSB $04			  ; 04 04
	TSB $0D			  ; 04 0D
	STX $04			  ; 86 04
	TSB $05			  ; 04 05
	STA $04			  ; 87 04
	TSB $FE			  ; 04 FE
	DEY				  ; 88
	TSB $08			  ; 04 08
	ORA $89			  ; 03 89
	TSB $08			  ; 04 08
	PHD				  ; 0B
	TXA				  ; 8A
	TSB $00			  ; 04 00
	ORA $8B			  ; 03 8B
	TSB $00			  ; 04 00
	PHD				  ; 0B
	STY $F004			; 8C 04 F0
	ORA $7F			  ; 03 7F
	MVP $0318			; 44 18 03
	ADC $0B1004,X		; 7F 04 10 0B
	BRA $8867			; 80 44
	SED				  ; F8
	PHD				  ; 0B
	BRA $882B			; 80 04
	BPL $882C			; 10 03
	STA $44			  ; 81 44
	SED				  ; F8
	ORA $81			  ; 03 81
	TSB $F0			  ; 04 F0
	XCE				  ; FB
	BRL $A038			; 82 04 18
	XCE				  ; FB
	BRL $A07C			; 82 44 18
	SBC $83			  ; F3 83
	MVP $F3F0			; 44 F0 F3
	STA $04			  ; 83 04
	BPL $8834			; 10 F3
	STY $44			  ; 84 44
	SED				  ; F8
	SBC $84			  ; F3 84
	TSB $10			  ; 04 10
	XCE				  ; FB
	STA $44			  ; 85 44
	SED				  ; F8
	XCE				  ; FB
	STA $04			  ; 85 04
	PHP				  ; 08
	ORA $74			  ; 13 74
	TSB $00			  ; 04 00
	ORA $75			  ; 13 75
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $1A			  ; 00 1A
	TSB $F9			  ; 04 F9
	TSB $04			  ; 04 04
	TSB $09			  ; 04 09
	STX $04			  ; 86 04
	TSB $01			  ; 04 01
	STA $04			  ; 87 04
	TSB $02			  ; 04 02
	STA $0404			; 8D 04 04
	PHP				  ; 08
	STX $0404			; 8E 04 04
	PHP				  ; 08
	STX $0804			; 8E 04 08
	ORA $89			  ; 03 89
	TSB $08			  ; 04 08
	PHD				  ; 0B
	TXA				  ; 8A
	TSB $00			  ; 04 00
	ORA $8B			  ; 03 8B
	TSB $00			  ; 04 00
	PHD				  ; 0B
	STY $F004			; 8C 04 F0
	ORA $7F			  ; 03 7F
	MVP $0318			; 44 18 03
	ADC $0B1004,X		; 7F 04 10 0B
	BRA $88D4			; 80 44
	SED				  ; F8
	PHD				  ; 0B
	BRA $8898			; 80 04
	BPL $8899			; 10 03
	STA $44			  ; 81 44
	SED				  ; F8
	ORA $81			  ; 03 81
	TSB $F0			  ; 04 F0
	XCE				  ; FB
	BRL $A0A5			; 82 04 18
	XCE				  ; FB
	BRL $A0E9			; 82 44 18
	SBC $83			  ; F3 83
	MVP $F3F0			; 44 F0 F3
	STA $04			  ; 83 04
	BPL $88A1			; 10 F3
	STY $44			  ; 84 44
	SED				  ; F8
	SBC $84			  ; F3 84
	TSB $10			  ; 04 10
	XCE				  ; FB
	STA $44			  ; 85 44
	SED				  ; F8
	XCE				  ; FB
	STA $04			  ; 85 04
	PHP				  ; 08
	ORA $74			  ; 13 74
	TSB $00			  ; 04 00
	ORA $75			  ; 13 75
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $19			  ; 00 19
	TSB $F6			  ; 04 F6
	TSB $04			  ; 04 04
	TSB $06			  ; 04 06
	STX $04			  ; 86 04
	TSB $FE			  ; 04 FE
	STA $04			  ; 87 04
	TSB $02			  ; 04 02
	STA $0404			; 8D 04 04
	PHP				  ; 08
	STX $0804			; 8E 04 08
	ORA $89			  ; 03 89
	TSB $08			  ; 04 08
	PHD				  ; 0B
	TXA				  ; 8A
	TSB $00			  ; 04 00
	ORA $8B			  ; 03 8B
	TSB $00			  ; 04 00
	PHD				  ; 0B
	STY $F004			; 8C 04 F0
	ORA $7F			  ; 03 7F
	MVP $0318			; 44 18 03
	ADC $0B1004,X		; 7F 04 10 0B
	BRA $893D			; 80 44
	SED				  ; F8
	PHD				  ; 0B
	BRA $8901			; 80 04
	BPL $8902			; 10 03
	STA $44			  ; 81 44
	SED				  ; F8
	ORA $81			  ; 03 81
	TSB $F0			  ; 04 F0
	XCE				  ; FB
	BRL $A10E			; 82 04 18
	XCE				  ; FB
	BRL $A152			; 82 44 18
	SBC $83			  ; F3 83
	MVP $F3F0			; 44 F0 F3
	STA $04			  ; 83 04
	BPL $890A			; 10 F3
	STY $44			  ; 84 44
	SED				  ; F8
	SBC $84			  ; F3 84
	TSB $10			  ; 04 10
	XCE				  ; FB
	STA $44			  ; 85 44
	SED				  ; F8
	XCE				  ; FB
	STA $04			  ; 85 04
	PHP				  ; 08
	ORA $74			  ; 13 74
	TSB $00			  ; 04 00
	ORA $75			  ; 13 75
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $18			  ; 00 18
	TSB $02			  ; 04 02
	STA $FA0404		  ; 8F 04 04 FA
	BCC $893E			; 90 04
	TSB $02			  ; 04 02
	STA $0404			; 8D 04 04
	PHP				  ; 08
	STX $0804			; 8E 04 08
	ORA $89			  ; 03 89
	TSB $08			  ; 04 08
	PHD				  ; 0B
	TXA				  ; 8A
	TSB $00			  ; 04 00
	ORA $8B			  ; 03 8B
	TSB $00			  ; 04 00
	PHD				  ; 0B
	STY $F004			; 8C 04 F0
	ORA $7F			  ; 03 7F
	MVP $0318			; 44 18 03
	ADC $0B1004,X		; 7F 04 10 0B
	BRA $89A2			; 80 44
	SED				  ; F8
	PHD				  ; 0B
	BRA $8966			; 80 04
	BPL $8967			; 10 03
	STA $44			  ; 81 44
	SED				  ; F8
	ORA $81			  ; 03 81
	TSB $F0			  ; 04 F0
	XCE				  ; FB
	BRL $A173			; 82 04 18
	XCE				  ; FB
	BRL $A1B7			; 82 44 18
	SBC $83			  ; F3 83
	MVP $F3F0			; 44 F0 F3
	STA $04			  ; 83 04
	BPL $896F			; 10 F3
	STY $44			  ; 84 44
	SED				  ; F8
	SBC $84			  ; F3 84
	TSB $10			  ; 04 10
	XCE				  ; FB
	STA $44			  ; 85 44
	SED				  ; F8
	XCE				  ; FB
	STA $04			  ; 85 04
	PHP				  ; 08
	ORA $74			  ; 13 74
	TSB $00			  ; 04 00
	ORA $75			  ; 13 75
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $18			  ; 00 18
	TSB $01			  ; 04 01
	STA $04			  ; 91 04
	TSB $F9			  ; 04 F9
	STA $04			  ; 92 04
	TSB $01			  ; 04 01
	STA $0404			; 8D 04 04
	PHP				  ; 08
	STX $0804			; 8E 04 08
	ORA $89			  ; 03 89
	TSB $08			  ; 04 08
	PHD				  ; 0B
	TXA				  ; 8A
	TSB $00			  ; 04 00
	ORA $8B			  ; 03 8B
	TSB $00			  ; 04 00
	PHD				  ; 0B
	STY $F004			; 8C 04 F0
	ORA $7F			  ; 03 7F
	MVP $0318			; 44 18 03
	ADC $0B1004,X		; 7F 04 10 0B
	BRA $8A07			; 80 44
	SED				  ; F8
	PHD				  ; 0B
	BRA $89CB			; 80 04
	BPL $89CC			; 10 03
	STA $44			  ; 81 44
	SED				  ; F8
	ORA $81			  ; 03 81
	TSB $F0			  ; 04 F0
	XCE				  ; FB
	BRL $A1D8			; 82 04 18
	XCE				  ; FB
	BRL $A21C			; 82 44 18
	SBC $83			  ; F3 83
	MVP $F3F0			; 44 F0 F3
	STA $04			  ; 83 04
	BPL $89D4			; 10 F3
	STY $44			  ; 84 44
	SED				  ; F8
	SBC $84			  ; F3 84
	TSB $10			  ; 04 10
	XCE				  ; FB
	STA $44			  ; 85 44
	SED				  ; F8
	XCE				  ; FB
	STA $04			  ; 85 04
	PHP				  ; 08
	ORA $74			  ; 13 74
	TSB $00			  ; 04 00
	ORA $75			  ; 13 75
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $18			  ; 00 18
	TSB $FD			  ; 04 FD
	STA $04			  ; 93 04

Bank_5D_Function_0A:
	TSB $F5			  ; 04 F5
	STY $04,X			; 94 04
	TSB $01			  ; 04 01
	STA $0404			; 8D 04 04
	PHP				  ; 08
	STX $0804			; 8E 04 08
	ORA $89			  ; 03 89
	TSB $08			  ; 04 08
	PHD				  ; 0B
	TXA				  ; 8A
	TSB $00			  ; 04 00
	ORA $8B			  ; 03 8B
	TSB $00			  ; 04 00
	PHD				  ; 0B
	STY $F004			; 8C 04 F0
	ORA $7F			  ; 03 7F
	MVP $0318			; 44 18 03
	ADC $0B1004,X		; 7F 04 10 0B
	BRA $8A6C			; 80 44
	SED				  ; F8
	PHD				  ; 0B
	BRA $8A30			; 80 04
	BPL $8A31			; 10 03
	STA $44			  ; 81 44
	SED				  ; F8
	ORA $81			  ; 03 81
	TSB $F0			  ; 04 F0
	XCE				  ; FB
	BRL $A23D			; 82 04 18
	XCE				  ; FB
	BRL $A281			; 82 44 18
	SBC $83			  ; F3 83
	MVP $F3F0			; 44 F0 F3
	STA $04			  ; 83 04
	BPL $8A39			; 10 F3
	STY $44			  ; 84 44
	SED				  ; F8
	SBC $84			  ; F3 84
	TSB $10			  ; 04 10
	XCE				  ; FB
	STA $44			  ; 85 44
	SED				  ; F8
	XCE				  ; FB
	STA $04			  ; 85 04
	PHP				  ; 08
	ORA $74			  ; 13 74
	TSB $00			  ; 04 00
	ORA $75			  ; 13 75
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $18			  ; 00 18
	TSB $FC			  ; 04 FC
	STA $04			  ; 93 04
	TSB $F4			  ; 04 F4
	STY $04,X			; 94 04
	TSB $01			  ; 04 01
	STA $0404			; 8D 04 04
	PHP				  ; 08
	STX $0804			; 8E 04 08
	ORA $89			  ; 03 89
	TSB $08			  ; 04 08
	PHD				  ; 0B
	TXA				  ; 8A
	TSB $00			  ; 04 00
	ORA $8B			  ; 03 8B
	TSB $00			  ; 04 00
	PHD				  ; 0B
	STY $F004			; 8C 04 F0
	ORA $7F			  ; 03 7F
	MVP $0318			; 44 18 03
	ADC $0B1004,X		; 7F 04 10 0B
	BRA $8AD1			; 80 44
	SED				  ; F8
	PHD				  ; 0B
	BRA $8A95			; 80 04
	BPL $8A96			; 10 03
	STA $44			  ; 81 44
	SED				  ; F8
	ORA $81			  ; 03 81
	TSB $F0			  ; 04 F0
	XCE				  ; FB
	BRL $A2A2			; 82 04 18
	XCE				  ; FB
	BRL $A2E6			; 82 44 18
	SBC $83			  ; F3 83
	MVP $F3F0			; 44 F0 F3
	STA $04			  ; 83 04
	BPL $8A9E			; 10 F3
	STY $44			  ; 84 44
	SED				  ; F8
	SBC $84			  ; F3 84
	TSB $10			  ; 04 10
	XCE				  ; FB
	STA $44			  ; 85 44
	SED				  ; F8
	XCE				  ; FB
	STA $04			  ; 85 04
	PHP				  ; 08
	ORA $74			  ; 13 74
	TSB $00			  ; 04 00
	ORA $75			  ; 13 75
	TSB $04			  ; 04 04
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	PHP				  ; 08
	BPL $8A5E			; 10 95
	ASL $10			  ; 06 10
	BRK $95			  ; 00 95
	ASL $F8			  ; 06 F8
	PHP				  ; 08
	STA $06,X			; 95 06
	CLC				  ; 18
	BPL $8A6B			; 10 96
	ASL $F0			  ; 06 F0
	BPL $8A6F			; 10 96
	ASL $10			  ; 06 10
	JSR $0697			; 20 97 06
	SED				  ; F8
	CLC				  ; 18
	STA $06			  ; 97 06
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA $08			  ; 07 08
	ORA $97			  ; 11 97
	ASL $11			  ; 06 11
	BRK $97			  ; 00 97
	ASL $11			  ; 06 11
	AND $98			  ; 21 98
	ASL $19			  ; 06 19
	BPL $8A8B			; 10 95
	ASL $F7			  ; 06 F7
	PHP				  ; 08
	STA $06			  ; 97 06
	SBC $19			  ; F7 19
	STA $06,X			; 95 06
	SBC $069510		  ; EF 10 95 06
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	PHP				  ; 08
	PHP				  ; 08
	INC				  ; 1A
	STX $06,Y			; 96 06
	PHP				  ; 08
	ORA $95			  ; 12 95
	ASL $12			  ; 06 12
	BRK $97			  ; 00 97
	ASL $11			  ; 06 11
	JSL $1A0699		  ; 22 99 06 1A
	ORA $97			  ; 11 97
	ASL $F6			  ; 06 F6
	PHP				  ; 08
	STA $06,X			; 95 06
	INC $1A,X			; F6 1A
	STX $06,Y			; 96 06
	INC $9710			; EE 10 97
	ASL $04			  ; 06 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	PHP				  ; 08
	TCS				  ; 1B
	STA $06,X			; 95 06
	PHP				  ; 08
	ORA $96			  ; 13 96
	ASL $13			  ; 06 13
	BRK $95			  ; 00 95
	ASL $11			  ; 06 11
	AND $98			  ; 23 98
	ASL $1C			  ; 06 1C
	ORA $98			  ; 13 98
	ASL $E8			  ; 06 E8
	PHP				  ; 08
	STX $06,Y			; 96 06
	SBC $08,X			; F5 08
	STX $06,Y			; 96 06
	SBC $1B,X			; F5 1B
	STA $06,X			; 95 06
	SBC $9811			; ED 11 98
	ASL $04			  ; 06 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	ORA #$1C			 ; 09 1C
	STA $06			  ; 97 06
	CLC				  ; 18
	CLC				  ; 18
	STX $06,Y			; 96 06
	TRB $00			  ; 14 00
	STX $06,Y			; 96 06
	ORA $24			  ; 12 24
	STA $06			  ; 97 06
	ORA $9914,X		  ; 1D 14 99
	ASL $E7			  ; 06 E7
	PHP				  ; 08
	STA $06,X			; 95 06
	INX				  ; E8
	CLC				  ; 18
	STX $06,Y			; 96 06
	PEA $971C			; F4 1C 97
	ASL $EC			  ; 06 EC
	ORA $99			  ; 12 99
	ASL $04			  ; 06 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	ORA #$1D			 ; 09 1D
	TYA				  ; 98
	ASL $19			  ; 06 19
	ORA $0695,Y		  ; 19 95 06
	ORA $25			  ; 13 25
	STA $06,X			; 95 06
	ASL $9815,X		  ; 1E 15 98
	ASL $E6			  ; 06 E6
	PHP				  ; 08
	STA $06			  ; 97 06
	BEQ $8BB5			; F0 20
	STX $06,Y			; 96 06
	SBC $19			  ; E7 19
	STA $06,X			; 95 06
	SBC $1D			  ; F3 1D
	TYA				  ; 98
	ASL $EB			  ; 06 EB
	ORA $98			  ; 13 98
	ASL $04			  ; 06 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	ORA #$1E			 ; 09 1E
	STA $1A06,Y		  ; 99 06 1A
	INC				  ; 1A
	STA $06			  ; 97 06
	TRB $26			  ; 14 26
	STX $06,Y			; 96 06
	ORA $069716,X		; 1F 16 97 06
	SBC $08			  ; E5 08
	STA $06,X			; 95 06
	SBC $069521		  ; EF 21 95 06
	INC $1A			  ; E6 1A
	STA $06			  ; 97 06
	SBC $1E			  ; F2 1E
	STA $EA06,Y		  ; 99 06 EA
	TRB $97			  ; 14 97
	ASL $04			  ; 06 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	ORA #$1F			 ; 09 1F
	TYA				  ; 98
	ASL $1B			  ; 06 1B
	TCS				  ; 1B
	TYA				  ; 98
	ASL $20			  ; 06 20
	ORA $95			  ; 17 95
	ASL $E4			  ; 06 E4
	PHP				  ; 08
	STX $06,Y			; 96 06
	INC $9722			; EE 22 97
	ASL $E5			  ; 06 E5
	TCS				  ; 1B
	TYA				  ; 98
	ASL $F1			  ; 06 F1
	ORA $E90698,X		; 1F 98 06 E9
	ORA $95,X			; 15 95
	ASL $04			  ; 06 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	BPL $8C18			; 10 20
	STX $06,Y			; 96 06
	ORA #$20			 ; 09 20
	STA $06			  ; 97 06
	TRB $991C			; 1C 1C 99
	ASL $21			  ; 06 21
	CLC				  ; 18
	STX $06,Y			; 96 06
	CPX #$10			 ; E0 10
	STX $06,Y			; 96 06
	SBC $9523			; ED 23 95
	ASL $E4			  ; 06 E4
	TRB $0699			; 1C 99 06
	BEQ $8C34			; F0 20
	STA $06			  ; 97 06
	INX				  ; E8
	ORA $96			  ; 17 96
	ASL $04			  ; 06 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	JSR $9610			; 20 10 96
	ASL $11			  ; 06 11
	AND $95			  ; 21 95
	ASL $09			  ; 06 09
	AND $95			  ; 21 95
	ASL $1D			  ; 06 1D
	ORA $0698,X		  ; 1D 98 06
	CPX #$20			 ; E0 20
	STX $06,Y			; 96 06
	CMP $069510,X		; DF 10 95 06
	CPX $9624			; EC 24 96
	ASL $E3			  ; 06 E3
	ORA $0698,X		  ; 1D 98 06
	SBC $069521		  ; EF 21 95 06
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	PHP				  ; 08
	AND $10			  ; 21 10
	STA $06,X			; 95 06
	ORA $22			  ; 11 22
	STA $06			  ; 97 06
	ORA #$22			 ; 09 22
	STX $06,Y			; 96 06
	ASL $971F,X		  ; 1E 1F 97
	ASL $DF			  ; 06 DF
	AND $95			  ; 21 95
	ASL $DE			  ; 06 DE
	ORA $97			  ; 11 97
	ASL $E2			  ; 06 E2
	ASL $0697,X		  ; 1E 97 06
	INC $9622			; EE 22 96
	ASL $04			  ; 06 04
	BRK $00			  ; 00 00
	BRK $06			  ; 00 06
	JSL $069711		  ; 22 11 97 06
	ORA $23			  ; 12 23
	TYA				  ; 98
	ASL $1F			  ; 06 1F
	JSR $0695			; 20 95 06
	DEC $9722,X		  ; DE 22 97
	ASL $DD			  ; 06 DD
	ORA $95			  ; 11 95
	ASL $E1			  ; 06 E1
	ORA $040695,X		; 1F 95 06 04
	BRK $00			  ; 00 00
	BRK $06			  ; 00 06
	AND $11			  ; 23 11
	TYA				  ; 98
	ASL $12			  ; 06 12
	BIT $97			  ; 24 97
	ASL $20			  ; 06 20
	JSL $DD0696		  ; 22 96 06 DD
	AND $98			  ; 23 98
	ASL $DC			  ; 06 DC
	ORA $96			  ; 12 96
	ASL $E8			  ; 06 E8
	CLC				  ; 18
	STX $06,Y			; 96 06
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA $24			  ; 03 24
	ORA $97			  ; 12 97
	ASL $13			  ; 06 13
	AND $95			  ; 25 95
	ASL $DC			  ; 06 DC
	BIT $97			  ; 24 97
	ASL $04			  ; 06 04
	BRK $00			  ; 00 00
	BRK $03			  ; 00 03
	AND $12			  ; 25 12
	STA $06,X			; 95 06
	ORA $26			  ; 13 26
	STX $06,Y			; 96 06
	STP				  ; DB
	AND $95			  ; 25 95
	ASL $04			  ; 06 04
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	ROL $13			  ; 26 13
	STX $06,Y			; 96 06
	PHX				  ; DA
	AND $96			  ; 27 96
	ASL $DA			  ; 06 DA
	STY $DFEE			; 8C EE DF
	STY $E4EE			; 8C EE E4
	STY $00EE			; 8C EE 00
	ORA $00			  ; 01 00
	BRK $FF			  ; 00 FF
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	SBC $000102,X		; FF 02 01 00
	BRK $FF			  ; 00 FF
	SBC $8C			  ; F2 8C
	INC $8D3B			; EE 3B 8D
	INC $8D60			; EE 60 8D
	INC $003C			; EE 3C 00
	TRB $B300			; 1C 00 B3
	ORA $B4			  ; 12 B4
	ORA $C8			  ; 12 C8
	ORA $C7			  ; 12 C7
	ORA $DB			  ; 12 DB
	ORA $DC			  ; 12 DC
	ORA $E5			  ; 12 E5
	ORA $E2			  ; 12 E2
	ORA $C0			  ; 12 C0
	ORA $D0			  ; 12 D0
	ORA $D2			  ; 12 D2
	ORA $D1			  ; 12 D1
	ORA $B0			  ; 12 B0
	ORA $5C			  ; 12 5C
	ORA $B7			  ; 12 B7
	ORA $AD			  ; 12 AD
	ORA $BE			  ; 12 BE
	ORA $BF			  ; 12 BF
	ORA $AE			  ; 12 AE
	ORA $B8			  ; 12 B8
	ORA $AF			  ; 12 AF
	ORA $AC			  ; 12 AC
	ORA $AB			  ; 12 AB
	ORA $D9			  ; 12 D9
	ORA $B6			  ; 11 B6
	ORA $B5			  ; 12 B5
	ORA $AA			  ; 12 AA
	ORA $A9			  ; 12 A9
	ORA $03			  ; 12 03
	PHP				  ; 08
	BPL $8D34			; 10 02
	BRK $00			  ; 00 00
	BPL $8D39			; 10 03
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BPL $8D40			; 10 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	BRK $08			  ; 00 08
	TSB $00			  ; 04 00
	PHP				  ; 08
	PHP				  ; 08
	ORA $00			  ; 05 00
	PHP				  ; 08
	BPL $8D51			; 10 06
	BRK $00			  ; 00 00
	BPL $8D56			; 10 07
	BRK $04			  ; 00 04
	ORA $08			  ; 05 08
	BRK $04			  ; 00 04
	ORA $0009			; 0D 09 00
	PHP				  ; 08
	PHP				  ; 08
	ASL				  ; 0A
	BRK $00			  ; 00 00
	PHP				  ; 08
	PHD				  ; 0B
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	BRK $15			  ; 00 15
	JSR $0CF8			; 20 F8 0C
	RTI				  ; 40
	INX				  ; E8
	SED				  ; F8
	TSB $F000			; 0C 00 F0
	SBC $0D			  ; F3 0D
	RTI				  ; 40
	CLC				  ; 18
	SBC $0D			  ; F3 0D
	BRK $18			  ; 00 18
	ORA $0E			  ; 03 0E
	RTI				  ; 40
	BEQ $8D7E			; F0 03
	ASL $1800			; 0E 00 18
	XCE				  ; FB
	ORA $FBF040		  ; 0F 40 F0 FB
	ORA $FB1000		  ; 0F 00 10 FB
	ORA $40			  ; 12 40
	SED				  ; F8
	XCE				  ; FB
	ORA $00			  ; 12 00
	BPL $8D92			; 10 03
	ORA $40			  ; 13 40
	SED				  ; F8
	ORA $13			  ; 03 13
	BRK $10			  ; 00 10
	PHD				  ; 0B
	TRB $40			  ; 14 40
	SED				  ; F8
	PHD				  ; 0B
	TRB $00			  ; 14 00
	PHP				  ; 08
	ORA $15			  ; 13 15
	BRK $00			  ; 00 00
	ORA $16			  ; 13 16
	BRK $04			  ; 00 04
	XCE				  ; FB
	ORA $00			  ; 17 00
	PHP				  ; 08
	PHD				  ; 0B
	CLC				  ; 18
	BRK $00			  ; 00 00
	PHD				  ; 0B
	ORA $0800,Y		  ; 19 00 08
	ORA $1A			  ; 03 1A
	BRK $00			  ; 00 00
	ORA $1B			  ; 03 1B
	BRK $BC			  ; 00 BC
	STA $00EE			; 8D EE 00
	ORA $04			  ; 01 04
	BRK $00			  ; 00 00
	JSR $0002			; 20 02 00
	ORA $20			  ; 01 20
	ORA $02			  ; 01 02
	ORA $01			  ; 01 01
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	ORA $02			  ; 01 02
	ORA $01			  ; 01 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02

Bank_5D_Function_0E:
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $10			  ; 02 10
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	SBC $010301,X		; FF 01 03 01
	SBC $010302,X		; FF 02 03 01
	SBC $010301,X		; FF 01 03 01
	SBC $010302,X		; FF 02 03 01
	INC $0301,X		  ; FE 01 03
	ORA $FF			  ; 01 FF
	COP $03			  ; 02 03
	ORA $FE			  ; 01 FE
	ORA $03			  ; 01 03
	ORA $FF			  ; 01 FF
	COP $03			  ; 02 03
	ORA $FE			  ; 01 FE
	ORA $03			  ; 01 03
	ORA $FF			  ; 01 FF
	COP $03			  ; 02 03
	ORA $FE			  ; 01 FE
	ORA $03			  ; 01 03
	ORA $FF			  ; 01 FF
	COP $03			  ; 02 03
	ORA $FE			  ; 01 FE
	ORA $03			  ; 01 03
	ORA $FF			  ; 01 FF
	COP $03			  ; 02 03
	ORA $FE			  ; 01 FE
	ORA $03			  ; 01 03
	ORA $FF			  ; 01 FF
	COP $03			  ; 02 03
	ORA $FE			  ; 01 FE
	ORA $03			  ; 01 03
	ORA $FE			  ; 01 FE
	COP $03			  ; 02 03
	ORA $FE			  ; 01 FE
	ORA $03			  ; 01 03
	ORA $FE			  ; 01 FE
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	ORA $04			  ; 01 04
	ORA $FD			  ; 01 FD
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	ORA $04			  ; 01 04
	ORA $FD			  ; 01 FD
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	ORA $04			  ; 01 04
	ORA $FD			  ; 01 FD
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	ORA $04			  ; 01 04
	ORA $FD			  ; 01 FD
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	ORA $04			  ; 01 04
	BPL $8EBC			; 10 FD
	ORA $04			  ; 01 04
	ORA $FD			  ; 01 FD
	ORA $04			  ; 01 04
	ORA $FD			  ; 01 FD
	BRK $04			  ; 00 04
	ORA $FD			  ; 01 FD
	ORA $04			  ; 01 04
	ORA $FD			  ; 01 FD
	ORA $04			  ; 01 04
	ORA $FD			  ; 01 FD
	BRK $04			  ; 00 04
	ORA $FD			  ; 01 FD
	ORA $04			  ; 01 04
	ORA $FD			  ; 01 FD
	ORA $04			  ; 01 04
	ORA $FD			  ; 01 FD
	BRK $04			  ; 00 04
	ORA $FD			  ; 01 FD
	ORA $04			  ; 01 04
	ORA $FC			  ; 01 FC
	BRK $04			  ; 00 04
	ORA $FD			  ; 01 FD
	ORA $04			  ; 01 04
	ORA $FC			  ; 01 FC
	BRK $04			  ; 00 04
	ORA $FD			  ; 01 FD
	ORA $04			  ; 01 04
	ORA $FC			  ; 01 FC
	BRK $04			  ; 00 04
	ORA $FD			  ; 01 FD
	ORA $04			  ; 01 04
	ORA $FC			  ; 01 FC
	BRK $04			  ; 00 04
	ORA $FC			  ; 01 FC
	ORA $04			  ; 01 04
	ORA $FC			  ; 01 FC
	BRK $04			  ; 00 04
	ORA $FC			  ; 01 FC
	ORA $04			  ; 01 04
	ORA $FC			  ; 01 FC
	BRK $04			  ; 00 04
	ORA $FC			  ; 01 FC
	ORA $04			  ; 01 04
	ORA $FC			  ; 01 FC
	BRK $04			  ; 00 04
	ORA $FC			  ; 01 FC
	ORA $04			  ; 01 04
	ORA $FC			  ; 01 FC
	BRK $04			  ; 00 04
	BPL $8F1F			; 10 FC
	BRK $05			  ; 00 05
	JSR $FAFF			; 20 FF FA
	BRK $16			  ; 00 16
	ORA $00			  ; 03 00
	BRK $02			  ; 00 02
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	ORA $01			  ; 03 01
	BRK $10			  ; 00 10
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $02			  ; 02 02
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $02			  ; 02 02
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	ORA $02			  ; 01 02
	ORA $01			  ; 01 01
	COP $01			  ; 02 01

Bank_5D_Function_10:
	ORA $01			  ; 01 01
	ORA $02			  ; 01 02
	ASL $01			  ; 06 01
	COP $01			  ; 02 01
	ASL $01			  ; 06 01
	ORA $02			  ; 01 02
	ASL $01			  ; 06 01
	COP $01			  ; 02 01
	ASL $01			  ; 06 01
	ORA $02			  ; 01 02
	ASL $01			  ; 06 01
	COP $02			  ; 02 02
	ASL $01			  ; 06 01
	ORA $02			  ; 01 02
	ORA $01			  ; 07 01
	COP $02			  ; 02 02
	ORA $01			  ; 07 01
	ORA $02			  ; 01 02
	ORA $01			  ; 07 01
	COP $02			  ; 02 02
	ORA $02			  ; 07 02
	ORA $02			  ; 01 02
	ASL $04			  ; 06 04
	ORA $02			  ; 01 02
	COP $03			  ; 02 03
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	PHP				  ; 08
	ORA $01			  ; 01 01
	COP $08			  ; 02 08
	ORA $01			  ; 01 01
	ORA $08			  ; 01 08
	ORA $00			  ; 01 00
	COP $08			  ; 02 08
	ORA $01			  ; 01 01
	ORA $09			  ; 01 09
	ORA $00			  ; 01 00
	COP $09			  ; 02 09
	ORA $01			  ; 01 01
	ORA $09			  ; 01 09
	ORA $00			  ; 01 00
	COP $09			  ; 02 09
	ORA $01			  ; 01 01
	ORA $09			  ; 01 09
	ORA $00			  ; 01 00
	ORA $09			  ; 01 09
	ORA $01			  ; 01 01
	ORA $09			  ; 01 09
	ORA $00			  ; 01 00
	ORA $09			  ; 01 09
	ORA $00			  ; 01 00
	ORA $09			  ; 01 09
	ORA $01			  ; 01 01
	ORA $09			  ; 01 09
	ORA $00			  ; 01 00
	ORA $09			  ; 01 09
	ORA $00			  ; 01 00
	ORA $09			  ; 01 09
	ORA $01			  ; 01 01
	ORA $09			  ; 01 09
	ASL				  ; 0A
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	SBC $010901,X		; FF 01 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	SBC $010901,X		; FF 01 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	SBC $010901,X		; FF 01 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	SBC $010901,X		; FF 01 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	SBC $010901,X		; FF 01 09 01
	BRK $01			  ; 00 01
	ORA #$01			 ; 09 01
	SBC $010801,X		; FF 01 08 01
	SBC $010801,X		; FF 01 08 01
	SBC $010801,X		; FF 01 08 01
	SBC $010801,X		; FF 01 08 01
	SBC $010301,X		; FF 01 03 01
	SBC $010301,X		; FF 01 03 01
	SBC $010301,X		; FF 01 03 01
	SBC $010301,X		; FF 01 03 01
	SBC $010300,X		; FF 00 03 01
	SBC $010301,X		; FF 01 03 01
	SBC $010301,X		; FF 01 03 01
	SBC $010300,X		; FF 00 03 01
	SBC $010301,X		; FF 01 03 01
	SBC $010301,X		; FF 01 03 01
	INC $0300,X		  ; FE 00 03
	ORA $FF			  ; 01 FF
	ORA $03			  ; 01 03
	ORA $FE			  ; 01 FE
	BRK $03			  ; 00 03
	ORA $FF			  ; 01 FF
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FF			  ; 01 FF
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FF			  ; 01 FF
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FF			  ; 01 FF
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FF			  ; 01 FF
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FF			  ; 01 FF
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FF			  ; 01 FF
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 13 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	SBC $FE0104,X		; FF 04 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	SBC $FE0104,X		; FF 04 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	SBC $FE0104,X		; FF 04 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	SBC $FE0104,X		; FF 04 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	SBC $FE0104,X		; FF 04 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	SBC $FE0104,X		; FF 04 01 FE
	BRK $04			  ; 00 04
	ORA $FE			  ; 01 FE
	SBC $FE0104,X		; FF 04 01 FE
	SBC $FE0104,X		; FF 04 01 FE
	SBC $FE0104,X		; FF 04 01 FE
	SBC $FD0104,X		; FF 04 01 FD
	SBC $FE0104,X		; FF 04 01 FE
	SBC $FF0104,X		; FF 04 01 FF
	SBC $FE0104,X		; FF 04 01 FE
	SBC $FF0104,X		; FF 04 01 FF
	INC $0104,X		  ; FE 04 01
	INC $04FF,X		  ; FE FF 04
	ORA $FF			  ; 01 FF
	INC $0104,X		  ; FE 04 01
	INC $0AFF,X		  ; FE FF 0A
	ORA $FF			  ; 01 FF
	INC $010A,X		  ; FE 0A 01
	INC $0AFF,X		  ; FE FF 0A
	ORA $FF			  ; 01 FF
	INC $010A,X		  ; FE 0A 01
	SBC $010AFF,X		; FF FF 0A 01
	INC $0AFE,X		  ; FE FE 0A
	ORA $FF			  ; 01 FF
	SBC $FF010A,X		; FF 0A 01 FF
	INC $010A,X		  ; FE 0A 01
	INC $05FF,X		  ; FE FF 05
	ORA $FF			  ; 01 FF
	INC $0105,X		  ; FE 05 01
	SBC $0105FE,X		; FF FE 05 01
	SBC $0105FE,X		; FF FE 05 01
	SBC $0105FE,X		; FF FE 05 01
	SBC $0105FE,X		; FF FE 05 01
	SBC $0105FE,X		; FF FE 05 01
	BRK $FE			  ; 00 FE
	ORA $01			  ; 05 01
	SBC $0105FE,X		; FF FE 05 01
	BRK $FD			  ; 00 FD
	ORA $01			  ; 05 01
	SBC $0105FE,X		; FF FE 05 01
	BRK $FD			  ; 00 FD
	ORA $01			  ; 05 01
	SBC $0105FE,X		; FF FE 05 01
	BRK $FD			  ; 00 FD
	ORA $01			  ; 05 01
	SBC $0105FE,X		; FF FE 05 01
	BRK $FD			  ; 00 FD
	ORA $01			  ; 05 01
	BRK $FE			  ; 00 FE
	ORA $01			  ; 05 01
	BRK $FD			  ; 00 FD
	ORA $01			  ; 05 01
	BRK $FE			  ; 00 FE
	ORA $01			  ; 05 01
	BRK $FD			  ; 00 FD
	ORA $01			  ; 05 01
	BRK $FE			  ; 00 FE
	ORA $01			  ; 05 01
	BRK $FE			  ; 00 FE
	ORA $01			  ; 05 01
	BRK $FE			  ; 00 FE
	ORA $01			  ; 05 01
	ORA $FE			  ; 01 FE
	ORA $01			  ; 05 01
	BRK $FE			  ; 00 FE
	ORA $01			  ; 05 01
	ORA $FE			  ; 01 FE
	ORA $01			  ; 05 01
	BRK $FE			  ; 00 FE
	ORA $01			  ; 05 01
	ORA $FE			  ; 01 FE
	ORA $01			  ; 05 01
	BRK $FE			  ; 00 FE
	ORA $01			  ; 05 01
	ORA $FE			  ; 01 FE
	ORA $01			  ; 05 01
	BRK $FE			  ; 00 FE
	ORA $01			  ; 05 01
	ORA $FE			  ; 01 FE
	ORA $01			  ; 05 01
	ORA $FE			  ; 01 FE
	ORA $01			  ; 05 01
	ORA $FE			  ; 01 FE
	ORA $01			  ; 05 01
	ORA $FE			  ; 01 FE
	ORA $01			  ; 05 01
	ORA $FE			  ; 01 FE
	ORA $01			  ; 05 01
	ORA $FE			  ; 01 FE
	ORA $01			  ; 05 01
	ORA $FE			  ; 01 FE
	ORA $01			  ; 05 01
	ORA $FE			  ; 01 FE
	ORA $01			  ; 05 01
	ORA $FE			  ; 01 FE
	PHD				  ; 0B
	ORA $01			  ; 01 01
	INC $010B,X		  ; FE 0B 01
	COP $FE			  ; 02 FE
	PHD				  ; 0B
	ORA $01			  ; 01 01
	INC $010B,X		  ; FE 0B 01
	COP $FE			  ; 02 FE
	PHD				  ; 0B
	ORA $01			  ; 01 01
	INC $010B,X		  ; FE 0B 01
	COP $FF			  ; 02 FF
	PHD				  ; 0B
	ORA $01			  ; 01 01
	INC $010B,X		  ; FE 0B 01
	COP $FF			  ; 02 FF
	PHD				  ; 0B
	ORA $01			  ; 01 01
	INC $010B,X		  ; FE 0B 01
	COP $FF			  ; 02 FF
	PHD				  ; 0B
	ORA $01			  ; 01 01
	INC $010B,X		  ; FE 0B 01
	COP $FF			  ; 02 FF
	BRK $01			  ; 00 01
	ORA $FE			  ; 01 FE
	BRK $01			  ; 00 01
	COP $FF			  ; 02 FF
	BRK $01			  ; 00 01
	ORA $FE			  ; 01 FE
	BRK $01			  ; 00 01
	COP $FF			  ; 02 FF
	BRK $01			  ; 00 01
	ORA $FF			  ; 01 FF
	BRK $01			  ; 00 01
	COP $FF			  ; 02 FF

Bank_5D_Function_13:
	BRK $01			  ; 00 01
	ORA $FF			  ; 01 FF
	BRK $01			  ; 00 01
	COP $FF			  ; 02 FF
	BRK $01			  ; 00 01
	COP $FF			  ; 02 FF
	BRK $01			  ; 00 01
	COP $FF			  ; 02 FF
	BRK $01			  ; 00 01
	COP $FF			  ; 02 FF
	BRK $01			  ; 00 01
	COP $FF			  ; 02 FF
	BRK $01			  ; 00 01
	COP $FF			  ; 02 FF
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $FF			  ; 02 FF
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $FF			  ; 02 FF
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $FF			  ; 02 FF
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $FF			  ; 02 FF
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $FF			  ; 02 FF
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $02			  ; 00 02
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	ORA $02			  ; 01 02
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	ORA $02			  ; 01 02
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	ORA $02			  ; 01 02
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	ORA $02			  ; 01 02
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	ORA $02			  ; 01 02
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02

Bank_5D_Function_14:
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	ORA $02			  ; 01 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	BRK $02			  ; 00 02
	COP $01			  ; 02 01
	SBC $010202,X		; FF 02 02 01
	SBC $010202,X		; FF 02 02 01
	SBC $010202,X		; FF 02 02 01
	SBC $010202,X		; FF 02 02 01
	SBC $010202,X		; FF 02 02 01
	SBC $010202,X		; FF 02 02 01
	SBC $010201,X		; FF 01 02 01
	SBC $010201,X		; FF 01 02 01
	SBC $010201,X		; FF 01 02 01
	SBC $010201,X		; FF 01 02 01
	SBC $010201,X		; FF 01 02 01
	SBC $010201,X		; FF 01 02 01
	SBC $010201,X		; FF 01 02 01
	SBC $010201,X		; FF 01 02 01
	SBC $010301,X		; FF 01 03 01
	SBC $010301,X		; FF 01 03 01
	SBC $010301,X		; FF 01 03 01
	SBC $010301,X		; FF 01 03 01
	SBC $010301,X		; FF 01 03 01
	SBC $010301,X		; FF 01 03 01
	SBC $010300,X		; FF 00 03 01
	SBC $010301,X		; FF 01 03 01
	SBC $010300,X		; FF 00 03 01
	SBC $010301,X		; FF 01 03 01
	INC $0300,X		  ; FE 00 03
	ORA $FF			  ; 01 FF
	ORA $03			  ; 01 03
	ORA $FE			  ; 01 FE
	BRK $03			  ; 00 03
	ORA $FF			  ; 01 FF
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FF			  ; 01 FF
	ORA $04			  ; 01 04
	ORA $FE			  ; 01 FE
	BRK $04			  ; 00 04
	ORA $FF			  ; 01 FF
	SBC $FE0104,X		; FF 04 01 FE
	BRK $04			  ; 00 04
	ORA $FF			  ; 01 FF
	SBC $FE0104,X		; FF 04 01 FE
	BRK $04			  ; 00 04
	ORA $FF			  ; 01 FF
	SBC $FE0104,X		; FF 04 01 FE
	BRK $04			  ; 00 04
	ORA $FF			  ; 01 FF
	SBC $FE0104,X		; FF 04 01 FE
	BRK $04			  ; 00 04
	ORA $FF			  ; 01 FF
	SBC $FE010A,X		; FF 0A 01 FE
	SBC $FF010A,X		; FF 0A 01 FF
	SBC $FE010A,X		; FF 0A 01 FE
	SBC $FF010A,X		; FF 0A 01 FF
	SBC $FE010A,X		; FF 0A 01 FE
	SBC $FF010A,X		; FF 0A 01 FF
	INC $010A,X		  ; FE 0A 01
	INC $0AFF,X		  ; FE FF 0A
	ORA $FF			  ; 01 FF
	INC $010A,X		  ; FE 0A 01
	INC $05FF,X		  ; FE FF 05
	ORA $FF			  ; 01 FF
	INC $0105,X		  ; FE 05 01
	INC $05FF,X		  ; FE FF 05
	ORA $FF			  ; 01 FF
	INC $0105,X		  ; FE 05 01
	INC $05FF,X		  ; FE FF 05
	TSB $FF			  ; 04 FF
	INC $0105,X		  ; FE 05 01
	BRK $FE			  ; 00 FE
	ORA $01			  ; 05 01
	SBC $0105FE,X		; FF FE 05 01
	BRK $FE			  ; 00 FE
	ORA $01			  ; 05 01
	SBC $0805FE,X		; FF FE 05 08
	BRK $FE			  ; 00 FE
	TSB $0003			; 0C 03 00
	INC $030D,X		  ; FE 0D 03
	BRK $FE			  ; 00 FE
	ASL $0003			; 0E 03 00
	INC $030F,X		  ; FE 0F 03
	BRK $FE			  ; 00 FE
	BPL $95B9			; 10 03
	BRK $FE			  ; 00 FE
	ORA $FE0003		  ; 0F 03 00 FE
	ASL $0003			; 0E 03 00
	INC $030D,X		  ; FE 0D 03
	BRK $FE			  ; 00 FE
	TSB $0003			; 0C 03 00
	INC $0405,X		  ; FE 05 04
	BRK $FD			  ; 00 FD
	ORA $05			  ; 11 05
	BRK $FD			  ; 00 FD
	ORA $06			  ; 12 06
	BRK $FD			  ; 00 FD
	ORA $20			  ; 11 20
	BRK $FD			  ; 00 FD
	SBC $EE9612,X		; FF 12 96 EE
	EOR $98			  ; 41 98
	INC $986A			; EE 6A 98
	INC $98BF			; EE BF 98
	INC $98E8			; EE E8 98
	INC $9925			; EE 25 99
	INC $9982			; EE 82 99
	INC $99E3			; EE E3 99
	INC $9A48			; EE 48 9A
	INC $9A99			; EE 99 9A
	INC $9AEA			; EE EA 9A
	INC $9B0F			; EE 0F 9B
	INC $9B34			; EE 34 9B
	INC $9BA1			; EE A1 9B
	INC $9C16			; EE 16 9C
	INC $9C83			; EE 83 9C
	INC $9CE8			; EE E8 9C
	INC $9D55			; EE 55 9D
	INC $9DB2			; EE B2 9D
	INC $01F6			; EE F6 01
	SBC $F800,Y		  ; F9 00 F8
	ORA $F9			  ; 11 F9
	ORA $08			  ; 11 08
	ORA $09			  ; 12 09
	ORA $03			  ; 12 03
	ORA $04			  ; 11 04
	ORA $EB			  ; 11 EB
	BPL $9611			; 10 EC
	BPL $9606			; 10 DF
	BPL $9609			; 10 E0
	BPL $9626			; 10 FB
	BPL $9629			; 10 FC
	BPL $9629			; 10 FA
	ORA $14			  ; 11 14
	ORA $E2			  ; 12 E2
	BPL $9624			; 10 EF
	BPL $963D			; 10 06
	ORA $07			  ; 12 07
	ORA $15			  ; 12 15
	ORA $FE			  ; 12 FE
	ORA $0F			  ; 12 0F
	ORA $10			  ; 11 10
	ORA $F9			  ; 11 F9
	BPL $963F			; 10 FA
	BPL $9634			; 10 ED
	BPL $9637			; 10 EE
	BPL $9651			; 10 06
	ORA $07			  ; 11 07
	ORA $E1			  ; 11 E1
	BPL $9640			; 10 EF
	ORA $E7			  ; 11 E7
	ORA $05			  ; 11 05
	ORA $EC			  ; 11 EC
	ORA $ED			  ; 12 ED
	ORA $F8			  ; 12 F8
	ORA $F9			  ; 12 F9
	ORA $EA			  ; 12 EA
	ORA $EB			  ; 12 EB
	ORA $F6			  ; 12 F6
	ORA $F7			  ; 12 F7
	ORA $E8			  ; 12 E8
	ORA $E9			  ; 12 E9
	ORA $F5			  ; 12 F5
	ORA $EE			  ; 12 EE
	ORA $FB			  ; 12 FB
	ORA $FA			  ; 12 FA
	ORA $B8			  ; 12 B8
	ORA $7F			  ; 11 7F
	ORA $F3			  ; 11 F3
	ORA $F4			  ; 12 F4
	ORA $00			  ; 12 00
	BRK $FD			  ; 00 FD
	ORA $F1			  ; 12 F1
	ORA $F2			  ; 12 F2
	ORA $FC			  ; 12 FC
	ORA $00			  ; 12 00
	BRK $EF			  ; 00 EF
	ORA $F0			  ; 12 F0
	ORA $3A			  ; 12 3A
	ORA $31			  ; 13 31
	ORA $39			  ; 13 39
	ORA $30			  ; 13 30
	ORA $C1			  ; 13 C1
	ORA $56			  ; 11 56
	ORA $B5			  ; 13 B5
	ORA $57			  ; 11 57
	ORA $C0			  ; 13 C0
	ORA $55			  ; 11 55
	ORA $B4			  ; 13 B4
	ORA $71			  ; 11 71
	ORA $2C			  ; 11 2C
	ORA $64			  ; 13 64
	ORA $83			  ; 11 83
	ORA $79			  ; 11 79
	ORA $82			  ; 11 82
	ORA $78			  ; 11 78
	ORA $3D			  ; 11 3D
	ORA $77			  ; 13 77
	ORA $43			  ; 11 43
	ORA $81			  ; 13 81
	ORA $2D			  ; 11 2D
	ORA $38			  ; 13 38
	ORA $74			  ; 13 74
	ORA $2F			  ; 11 2F
	ORA $68			  ; 13 68
	ORA $5C			  ; 11 5C
	ORA $DE			  ; 12 DE
	ORA $DB			  ; 11 DB
	ORA $CE			  ; 11 CE
	ORA $CF			  ; 11 CF
	ORA $DC			  ; 11 DC
	ORA $D0			  ; 11 D0
	ORA $DD			  ; 11 DD
	ORA $59			  ; 11 59
	ORA $CD			  ; 13 CD
	ORA $D9			  ; 11 D9
	ORA $5B			  ; 11 5B
	ORA $D8			  ; 13 D8
	ORA $58			  ; 11 58
	ORA $CC			  ; 13 CC
	ORA $DA			  ; 11 DA
	ORA $57			  ; 11 57
	ORA $C6			  ; 12 C6
	ORA $B9			  ; 11 B9
	ORA $C7			  ; 11 C7
	ORA $BA			  ; 11 BA
	ORA $BB			  ; 11 BB
	ORA $C8			  ; 11 C8
	ORA $BC			  ; 11 BC
	ORA $5C			  ; 11 5C
	ORA $DF			  ; 13 DF
	ORA $5A			  ; 11 5A
	ORA $D2			  ; 13 D2
	ORA $B0			  ; 11 B0
	ORA $A3			  ; 11 A3
	ORA $B1			  ; 11 B1
	ORA $A4			  ; 11 A4
	ORA $54			  ; 11 54
	ORA $51			  ; 13 51
	ORA $A2			  ; 13 A2
	ORA $B2			  ; 11 B2
	ORA $53			  ; 11 53
	ORA $AD			  ; 13 AD
	ORA $50			  ; 11 50
	ORA $A1			  ; 13 A1
	ORA $68			  ; 11 68
	ORA $AA			  ; 12 AA
	ORA $AB			  ; 11 AB
	ORA $9F			  ; 11 9F
	ORA $A0			  ; 11 A0
	ORA $AC			  ; 11 AC
	ORA $4F			  ; 11 4F
	ORA $9E			  ; 13 9E
	ORA $52			  ; 11 52
	ORA $A8			  ; 13 A8
	ORA $4E			  ; 11 4E
	ORA $9D			  ; 13 9D
	ORA $00			  ; 11 00
	BRK $FF			  ; 00 FF
	ORA $09			  ; 12 09
	ORA $0A			  ; 13 0A
	ORA $14			  ; 13 14
	ORA $15			  ; 13 15
	ORA $11			  ; 13 11
	ORA $00			  ; 13 00
	ORA $65			  ; 13 65
	ORA $80			  ; 11 80
	ORA $37			  ; 11 37
	ORA $2E			  ; 13 2E
	ORA $66			  ; 13 66
	ORA $72			  ; 11 72
	ORA $70			  ; 11 70
	ORA $6F			  ; 11 6F
	ORA $03			  ; 11 03
	ORA $04			  ; 13 04
	ORA $0F			  ; 13 0F
	ORA $10			  ; 13 10
	ORA $18			  ; 13 18
	ORA $19			  ; 13 19
	ORA $6E			  ; 13 6E
	ORA $0D			  ; 11 0D
	ORA $0E			  ; 13 0E
	ORA $01			  ; 13 01
	ORA $02			  ; 13 02
	ORA $05			  ; 13 05
	ORA $06			  ; 13 06
	ORA $36			  ; 13 36
	ORA $2B			  ; 13 2B
	ORA $35			  ; 13 35
	ORA $2A			  ; 13 2A
	ORA $34			  ; 13 34
	ORA $6B			  ; 13 6B
	ORA $29			  ; 11 29
	ORA $61			  ; 13 61
	ORA $16			  ; 11 16
	ORA $25			  ; 13 25
	ORA $12			  ; 13 12
	ORA $13			  ; 13 13
	ORA $07			  ; 13 07
	ORA $08			  ; 13 08
	ORA $0B			  ; 13 0B
	ORA $0C			  ; 13 0C
	ORA $5D			  ; 13 5D
	ORA $1E			  ; 11 1E
	ORA $53			  ; 13 53
	ORA $5E			  ; 11 5E
	ORA $3C			  ; 11 3C
	ORA $33			  ; 13 33
	ORA $3B			  ; 13 3B
	ORA $32			  ; 13 32
	ORA $28			  ; 13 28
	ORA $1F			  ; 13 1F
	ORA $54			  ; 13 54
	ORA $24			  ; 11 24
	ORA $1D			  ; 13 1D
	ORA $51			  ; 13 51
	ORA $5B			  ; 11 5B
	ORA $50			  ; 11 50
	ORA $5A			  ; 11 5A
	ORA $4F			  ; 11 4F
	ORA $59			  ; 11 59
	ORA $4E			  ; 11 4E
	ORA $23			  ; 11 23
	ORA $58			  ; 13 58
	ORA $1C			  ; 11 1C
	ORA $4D			  ; 13 4D
	ORA $22			  ; 11 22
	ORA $57			  ; 13 57
	ORA $27			  ; 11 27
	ORA $21			  ; 13 21
	ORA $26			  ; 13 26
	ORA $60			  ; 13 60
	ORA $20			  ; 11 20
	ORA $56			  ; 13 56
	ORA $44			  ; 11 44
	ORA $3C			  ; 11 3C
	ORA $3B			  ; 11 3B
	ORA $43			  ; 11 43
	ORA $49			  ; 11 49
	ORA $4C			  ; 11 4C
	ORA $1A			  ; 11 1A
	ORA $4A			  ; 13 4A
	ORA $17			  ; 11 17
	ORA $48			  ; 13 48
	ORA $1B			  ; 11 1B
	ORA $4B			  ; 13 4B
	ORA $87			  ; 11 87
	ORA $7D			  ; 11 7D
	ORA $44			  ; 11 44
	ORA $3E			  ; 13 3E
	ORA $7A			  ; 13 7A
	ORA $84			  ; 11 84
	ORA $40			  ; 11 40
	ORA $46			  ; 13 46
	ORA $45			  ; 13 45
	ORA $3F			  ; 13 3F
	ORA $7C			  ; 13 7C
	ORA $4C			  ; 11 4C
	ORA $48			  ; 13 48
	ORA $42			  ; 13 42
	ORA $4B			  ; 13 4B
	ORA $47			  ; 13 47
	ORA $41			  ; 13 41
	ORA $49			  ; 13 49
	ORA $8A			  ; 13 8A
	ORA $4D			  ; 11 4D
	ORA $91			  ; 13 91
	ORA $4A			  ; 11 4A
	ORA $8B			  ; 13 8B
	ORA $0E			  ; 11 0E
	INC $0CE8			; EE E8 0C
	RTI				  ; 40
	INC $0DF8,X		  ; FE F8 0D
	RTI				  ; 40
	INC $00E8,X		  ; FE E8 00
