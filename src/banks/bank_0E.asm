;==============================================================================
; Dragon Quest III - Bank $0E Code
; Ultra-aggressive code extraction
;==============================================================================

.include "../include/hardware.inc"

.segment "BANK_0E_CODE"


Bank_0E_Function_00:
	INC $01			  ; E6 01
	CMP $29			  ; C7 29
	COP $C7			  ; 02 C7
	JMP ($C702)		  ; 6C 02 C7
	LDA $F2C702		  ; AF 02 C7 F2
	COP $C7			  ; 02 C7
	AND $03,X			; 35 03
	CMP $78			  ; C7 78
	ORA $C7			  ; 03 C7
	TYX				  ; BB
	ORA $C7			  ; 03 C7
	INC $C703,X		  ; FE 03 C7
	EOR $04			  ; 41 04
	CMP $84			  ; C7 84
	TSB $C7			  ; 04 C7
	CMP $04			  ; C7 04
	CMP $0A			  ; C7 0A
	ORA $C7			  ; 05 C7
	EOR $C705			; 4D 05 C7
	BCC $0031			; 90 05
	CMP $D3			  ; C7 D3
	ORA $C7			  ; 05 C7
	ASL $06,X			; 16 06
	CMP $59			  ; C7 59
	ASL $C7			  ; 06 C7
	STZ $C706			; 9C 06 C7
	CMP $22C706,X		; DF 06 C7 22
	ORA $C7			  ; 07 C7
	ADC $07			  ; 65 07
	CMP $A8			  ; C7 A8
	ORA $C7			  ; 07 C7
	XBA				  ; EB
	ORA $C7			  ; 07 C7
	ROL $C708			; 2E 08 C7
	AND $08,X			; 35 08
	CMP $3C			  ; C7 3C
	PHP				  ; 08
	CMP $43			  ; C7 43
	PHP				  ; 08
	CMP $4A			  ; C7 4A
	PHP				  ; 08
	CMP $51			  ; C7 51
	PHP				  ; 08
	CMP $58			  ; C7 58
	PHP				  ; 08
	CMP $5F			  ; C7 5F
	PHP				  ; 08
	CMP $66			  ; C7 66
	PHP				  ; 08
	CMP $6D			  ; C7 6D
	PHP				  ; 08
	CMP $74			  ; C7 74
	PHP				  ; 08
	CMP $7B			  ; C7 7B
	PHP				  ; 08
	CMP $82			  ; C7 82
	PHP				  ; 08
	CMP $89			  ; C7 89
	PHP				  ; 08
	CMP $90			  ; C7 90
	PHP				  ; 08
	CMP $97			  ; C7 97
	PHP				  ; 08
	CMP $9E			  ; C7 9E
	PHP				  ; 08
	CMP $A5			  ; C7 A5
	PHP				  ; 08
	CMP $AC			  ; C7 AC
	PHP				  ; 08
	CMP $B3			  ; C7 B3
	PHP				  ; 08
	CMP $BA			  ; C7 BA
	PHP				  ; 08
	CMP $C1			  ; C7 C1
	PHP				  ; 08
	CMP $C8			  ; C7 C8
	PHP				  ; 08
	CMP $CF			  ; C7 CF
	PHP				  ; 08
	CMP $D6			  ; C7 D6
	PHP				  ; 08
	CMP $DD			  ; C7 DD
	PHP				  ; 08
	CMP $E4			  ; C7 E4
	PHP				  ; 08
	CMP $EB			  ; C7 EB
	PHP				  ; 08
	CMP $F2			  ; C7 F2
	PHP				  ; 08
	CMP $F9			  ; C7 F9
	PHP				  ; 08
	CMP $00			  ; C7 00
	ORA #$C7			 ; 09 C7
	ORA $09			  ; 07 09
	CMP $0E			  ; C7 0E
	ORA #$C7			 ; 09 C7
	STA $09			  ; 91 09
	CMP $14			  ; C7 14
	ASL				  ; 0A
	CMP $97			  ; C7 97
	ASL				  ; 0A
	CMP $1A			  ; C7 1A
	PHD				  ; 0B
	CMP $21			  ; C7 21
	PHD				  ; 0B
	CMP $28			  ; C7 28
	PHD				  ; 0B
	CMP $2F			  ; C7 2F
	PHD				  ; 0B
	CMP $36			  ; C7 36
	PHD				  ; 0B
	CMP $3D			  ; C7 3D
	PHD				  ; 0B
	CMP $44			  ; C7 44
	PHD				  ; 0B
	CMP $4B			  ; C7 4B
	PHD				  ; 0B
	CMP $52			  ; C7 52
	PHD				  ; 0B
	CMP $59			  ; C7 59
	PHD				  ; 0B
	CMP $60			  ; C7 60
	PHD				  ; 0B
	CMP $67			  ; C7 67
	PHD				  ; 0B
	CMP $6E			  ; C7 6E
	PHD				  ; 0B
	CMP $75			  ; C7 75
	PHD				  ; 0B
	CMP $7C			  ; C7 7C
	PHD				  ; 0B
	CMP $83			  ; C7 83
	PHD				  ; 0B
	CMP $8A			  ; C7 8A
	PHD				  ; 0B
	CMP $91			  ; C7 91
	PHD				  ; 0B
	CMP $98			  ; C7 98
	PHD				  ; 0B
	CMP $9F			  ; C7 9F
	PHD				  ; 0B
	CMP $A6			  ; C7 A6
	PHD				  ; 0B
	CMP $AD			  ; C7 AD
	PHD				  ; 0B
	CMP $B4			  ; C7 B4
	PHD				  ; 0B
	CMP $BB			  ; C7 BB
	PHD				  ; 0B
	CMP $C2			  ; C7 C2
	PHD				  ; 0B
	CMP $C9			  ; C7 C9

Bank_0E_Function_01:
	PHD				  ; 0B
	CMP $D0			  ; C7 D0
	PHD				  ; 0B
	CMP $D7			  ; C7 D7
	PHD				  ; 0B
	CMP $DE			  ; C7 DE
	PHD				  ; 0B
	CMP $E5			  ; C7 E5
	PHD				  ; 0B
	CMP $EC			  ; C7 EC
	PHD				  ; 0B
	CMP $F3			  ; C7 F3
	PHD				  ; 0B
	CMP $FA			  ; C7 FA
	PHD				  ; 0B
	CMP $01			  ; C7 01
	TSB $08C7			; 0C C7 08
	TSB $0FC7			; 0C C7 0F
	TSB $16C7			; 0C C7 16
	TSB $1DC7			; 0C C7 1D
	TSB $24C7			; 0C C7 24
	TSB $2BC7			; 0C C7 2B
	TSB $32C7			; 0C C7 32
	TSB $39C7			; 0C C7 39
	TSB $40C7			; 0C C7 40
	TSB $47C7			; 0C C7 47
	TSB $72C7			; 0C C7 72
	TSB $99C7			; 0C C7 99
	TSB $C4C7			; 0C C7 C4
	TSB $EBC7			; 0C C7 EB
	TSB $0EC7			; 0C C7 0E
	ORA $31C7			; 0D C7 31
	ORA $58C7			; 0D C7 58
	ORA $77C7			; 0D C7 77
	ORA $A2C7			; 0D C7 A2
	ORA $C5C7			; 0D C7 C5
	ORA $E8C7			; 0D C7 E8
	ORA $0BC7			; 0D C7 0B
	ASL $2EC7			; 0E C7 2E
	ASL $4DC7			; 0E C7 4D
	ASL $74C7			; 0E C7 74
	ASL $9BC7			; 0E C7 9B
	ASL $FEC7			; 0E C7 FE
	ASL $19C7			; 0E C7 19
	ORA $0F48C7		  ; 0F C7 48 0F
	CMP $67			  ; C7 67
	ORA $0FA2C7		  ; 0F C7 A2 0F
	CMP $DD			  ; C7 DD
	ORA $1018C7		  ; 0F C7 18 10
	CMP $53			  ; C7 53
	BPL $0147			; 10 C7
	PHY				  ; 5A
	BPL $014A			; 10 C7
	ADC $10			  ; 61 10
	CMP $74			  ; C7 74
	BPL $0150			; 10 C7
	STA $10			  ; 87 10
	CMP $9A			  ; C7 9A
	BPL $0156			; 10 C7
	LDA $C710			; AD 10 C7
	CPY #$10			 ; C0 10
	CMP $D3			  ; C7 D3
	BPL $015F			; 10 C7
	SBC $10			  ; F2 10
	CMP $FD			  ; C7 FD
	BPL $0165			; 10 C7
	TSB $11			  ; 04 11
	CMP $0F			  ; C7 0F
	ORA $C7			  ; 11 C7
	ROL				  ; 2A
	ORA $C7			  ; 11 C7
	EOR $11			  ; 41 11
	CMP $54			  ; C7 54
	TRB $C7			  ; 14 C7
	STA $42C717		  ; 8F 17 C7 42
	INC				  ; 1A
	CMP $F9			  ; C7 F9
	TCS				  ; 1B
	CMP $2C			  ; C7 2C
	ORA $201FC7,X		; 1F C7 1F 20
	CMP $8A			  ; C7 8A
	JSR $F1C7			; 20 C7 F1
	JSR $10C7			; 20 C7 10
	AND $C7			  ; 21 C7
	AND $4EC721		  ; 2F 21 C7 4E
	AND $C7			  ; 21 C7
	ADC $C721			; 6D 21 C7
	BRA $01F1			; 80 21
	CMP $CB			  ; C7 CB
	AND $C7			  ; 21 C7
	ROR $C722,X		  ; 7E 22 C7
	ADC $C723			; 6D 23 C7
	SEI				  ; 78
	AND $C7			  ; 23 C7
	STA $23			  ; 83 23
	CMP $8A			  ; C7 8A
	AND $C7			  ; 23 C7
	LDA $23,X			; B5 23
	CMP $00			  ; C7 00
	SBC $000100,X		; FF 00 01 00
	SBC $000700,X		; FF 00 07 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000700,X		; FF 00 07 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000700,X		; FF 00 07 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000700,X		; FF 00 07 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000700,X		; FF 00 07 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000700,X		; FF 00 07 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000700,X		; FF 00 07 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000700,X		; FF 00 07 00
	BRK $FF			  ; 00 FF
	ORA $00			  ; 01 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	SBC $040100,X		; FF 00 01 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 07 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 07 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 07 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 07 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 07 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 07 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 07 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 07 00
	BRK $FF			  ; 00 FF
	SBC $010600,X		; FF 00 06 01
	SBC $070600,X		; FF 00 06 07
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $070600,X		; FF 00 06 07
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $070600,X		; FF 00 06 07
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $070600,X		; FF 00 06 07
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $070600,X		; FF 00 06 07
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $070600,X		; FF 00 06 07
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $070600,X		; FF 00 06 07
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $070600,X		; FF 00 06 07
	BRK $00			  ; 00 00
	SBC $02FF01,X		; FF 01 FF 02
	ORA $01			  ; 01 01
	SBC $000702,X		; FF 02 07 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000702,X		; FF 02 07 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000702,X		; FF 02 07 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000702,X		; FF 02 07 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000702,X		; FF 02 07 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000702,X		; FF 02 07 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000702,X		; FF 02 07 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000702,X		; FF 02 07 00
	BRK $FF			  ; 00 FF
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $07			  ; 02 07
	BRK $00			  ; 00 00
	SBC $0601FF,X		; FF FF 01 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 07 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 07 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 07 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 07 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 07 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 07 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 07 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 07 00
	BRK $FF			  ; 00 FF
	SBC $0106FF,X		; FF FF 06 01
	SBC $0706FF,X		; FF FF 06 07
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0706FF,X		; FF FF 06 07
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0706FF,X		; FF FF 06 07
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0706FF,X		; FF FF 06 07
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0706FF,X		; FF FF 06 07
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0706FF,X		; FF FF 06 07
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0706FF,X		; FF FF 06 07
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0706FF,X		; FF FF 06 07
	BRK $00			  ; 00 00
	SBC $00FF00,X		; FF 00 FF 00
	ORA $00			  ; 01 00
	SBC $000300,X		; FF 00 03 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000300,X		; FF 00 03 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000300,X		; FF 00 03 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000300,X		; FF 00 03 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000300,X		; FF 00 03 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000300,X		; FF 00 03 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000300,X		; FF 00 03 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000300,X		; FF 00 03 00
	BRK $FF			  ; 00 FF
	ORA $00			  ; 01 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	SBC $040100,X		; FF 00 01 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 03 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 03 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 03 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 03 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 03 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 03 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 03 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 03 00
	BRK $FF			  ; 00 FF
	SBC $010600,X		; FF 00 06 01
	SBC $030600,X		; FF 00 06 03
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $030600,X		; FF 00 06 03
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $030600,X		; FF 00 06 03
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $030600,X		; FF 00 06 03
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $030600,X		; FF 00 06 03
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $030600,X		; FF 00 06 03
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $030600,X		; FF 00 06 03
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $030600,X		; FF 00 06 03
	BRK $00			  ; 00 00
	SBC $02FF01,X		; FF 01 FF 02
	ORA $01			  ; 01 01
	SBC $000302,X		; FF 02 03 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000302,X		; FF 02 03 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000302,X		; FF 02 03 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000302,X		; FF 02 03 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000302,X		; FF 02 03 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000302,X		; FF 02 03 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000302,X		; FF 02 03 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000302,X		; FF 02 03 00
	BRK $FF			  ; 00 FF
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $03			  ; 02 03
	BRK $00			  ; 00 00
	SBC $0601FF,X		; FF FF 01 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 03 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 03 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 03 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 03 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 03 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 03 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 03 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 03 00
	BRK $FF			  ; 00 FF
	SBC $0106FF,X		; FF FF 06 01
	SBC $0306FF,X		; FF FF 06 03
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0306FF,X		; FF FF 06 03
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0306FF,X		; FF FF 06 03
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0306FF,X		; FF FF 06 03
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0306FF,X		; FF FF 06 03
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0306FF,X		; FF FF 06 03
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0306FF,X		; FF FF 06 03
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0306FF,X		; FF FF 06 03
	BRK $00			  ; 00 00
	SBC $00FF00,X		; FF 00 FF 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $FF			  ; 00 FF
	ORA $00			  ; 01 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $00			  ; 01 00
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	SBC $040100,X		; FF 00 01 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 01 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 01 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 01 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 01 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 01 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 01 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 01 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $00			  ; 01 00
	BRK $FF			  ; 00 FF
	SBC $010600,X		; FF 00 06 01
	SBC $010600,X		; FF 00 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $010600,X		; FF 00 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $010600,X		; FF 00 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $010600,X		; FF 00 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $010600,X		; FF 00 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $010600,X		; FF 00 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $010600,X		; FF 00 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $010600,X		; FF 00 06 01
	BRK $00			  ; 00 00
	SBC $02FF01,X		; FF 01 FF 02
	ORA $01			  ; 01 01
	SBC $000102,X		; FF 02 01 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000102,X		; FF 02 01 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000102,X		; FF 02 01 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000102,X		; FF 02 01 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000102,X		; FF 02 01 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000102,X		; FF 02 01 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000102,X		; FF 02 01 00
	BRK $02			  ; 00 02
	ORA $01			  ; 01 01
	SBC $000102,X		; FF 02 01 00
	BRK $FF			  ; 00 FF
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $01			  ; 01 01
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	SBC $0601FF,X		; FF FF 01 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 01 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 01 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 01 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 01 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 01 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 01 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 01 00
	BRK $06			  ; 00 06
	ORA $FF			  ; 01 FF
	ORA $06			  ; 01 06
	ORA $00			  ; 01 00
	BRK $FF			  ; 00 FF
	SBC $0106FF,X		; FF FF 06 01
	SBC $0106FF,X		; FF FF 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0106FF,X		; FF FF 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0106FF,X		; FF FF 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0106FF,X		; FF FF 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0106FF,X		; FF FF 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0106FF,X		; FF FF 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0106FF,X		; FF FF 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0106FF,X		; FF FF 06 01
	BRK $00			  ; 00 00
	SBC $00FF00,X		; FF 00 FF 00
	PHP				  ; 08
	BRK $FF			  ; 00 FF
	SBC $020001,X		; FF 01 00 02
	PHP				  ; 08
	ORA $00			  ; 01 00
	SBC $040100,X		; FF 00 01 04
	PHP				  ; 08
	BRK $01			  ; 00 01
	SBC $0600FF,X		; FF FF 00 06
	PHP				  ; 08
	SBC $01FF00,X		; FF 00 FF 01
	SBC $010802,X		; FF 02 08 01
	SBC $0101FF,X		; FF FF 01 01
	COP $08			  ; 02 08
	ORA $01			  ; 01 01
	SBC $0601FF,X		; FF FF 01 06
	PHP				  ; 08
	SBC $FFFF01,X		; FF 01 FF FF
	SBC $FF0806,X		; FF 06 08 FF
	SBC $FF00FF,X		; FF FF 00 FF
	BRK $04			  ; 00 04
	BRK $FE			  ; 00 FE
	SBC $020001,X		; FF 01 00 02
	TSB $02			  ; 04 02
	BRK $FF			  ; 00 FF
	BRK $01			  ; 00 01
	TSB $04			  ; 04 04
	BRK $02			  ; 00 02
	SBC $0600FF,X		; FF FF 00 06
	TSB $FE			  ; 04 FE
	BRK $FF			  ; 00 FF
	ORA $FF			  ; 01 FF
	COP $04			  ; 02 04
	COP $FE			  ; 02 FE
	SBC $020101,X		; FF 01 01 02
	TSB $02			  ; 04 02
	COP $FF			  ; 02 FF
	SBC $040601,X		; FF 01 06 04
	INC $FF02,X		  ; FE 02 FF
	SBC $0406FF,X		; FF FF 06 04
	INC $FFFE,X		  ; FE FE FF
	BRK $FF			  ; 00 FF
	BRK $02			  ; 00 02
	BRK $FC			  ; 00 FC
	SBC $020001,X		; FF 01 00 02
	COP $04			  ; 02 04
	BRK $FF			  ; 00 FF
	BRK $01			  ; 00 01
	TSB $02			  ; 04 02
	BRK $04			  ; 00 04
	SBC $0600FF,X		; FF FF 00 06
	COP $FC			  ; 02 FC
	BRK $FF			  ; 00 FF
	ORA $FF			  ; 01 FF
	COP $02			  ; 02 02
	TSB $FC			  ; 04 FC
	SBC $020101,X		; FF 01 01 02
	COP $04			  ; 02 04
	TSB $FF			  ; 04 FF
	SBC $020601,X		; FF 01 06 02
	JSR ($FF04,X)		; FC 04 FF
	SBC $0206FF,X		; FF FF 06 02
	JSR ($FFFC,X)		; FC FC FF
	BRK $FF			  ; 00 FF
	BRK $01			  ; 00 01
	BRK $F8			  ; 00 F8
	SBC $020001,X		; FF 01 00 02
	ORA $08			  ; 01 08
	BRK $FF			  ; 00 FF
	BRK $01			  ; 00 01
	TSB $01			  ; 04 01
	BRK $08			  ; 00 08
	SBC $0600FF,X		; FF FF 00 06
	ORA $F8			  ; 01 F8
	BRK $FF			  ; 00 FF
	ORA $FF			  ; 01 FF
	COP $01			  ; 02 01
	PHP				  ; 08
	SED				  ; F8
	SBC $020101,X		; FF 01 01 02
	ORA $08			  ; 01 08
	PHP				  ; 08
	SBC $0601FF,X		; FF FF 01 06
	ORA $F8			  ; 01 F8
	PHP				  ; 08
	SBC $06FFFF,X		; FF FF FF 06
	ORA $F8			  ; 01 F8
	SED				  ; F8
	SBC $00FE00,X		; FF 00 FE 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $FF			  ; 00 FF
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	SBC $000200,X		; FF 00 02 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $FF			  ; 00 FF
	INC $0000,X		  ; FE 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00

Bank_0E_Function_0B:
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $FF			  ; 00 FF
	BRK $FE			  ; 00 FE
	BRK $10			  ; 00 10
	BRK $FF			  ; 00 FF
	SBC $020002,X		; FF 02 00 02
	BPL $0B27			; 10 01
	BRK $FF			  ; 00 FF
	BRK $02			  ; 00 02
	TSB $10			  ; 04 10
	BRK $01			  ; 00 01
	SBC $0600FE,X		; FF FE 00 06
	BPL $0B33			; 10 FF
	BRK $FF			  ; 00 FF
	COP $FE			  ; 02 FE
	COP $10			  ; 02 10
	ORA $FF			  ; 01 FF
	SBC $020202,X		; FF 02 02 02
	BPL $0B43			; 10 01
	ORA $FF			  ; 01 FF
	INC $0602,X		  ; FE 02 06
	BPL $0B48			; 10 FF
	ORA $FF			  ; 01 FF
	INC $06FE,X		  ; FE FE 06
	BPL $0B4F			; 10 FF
	SBC $FE00FF,X		; FF FF 00 FE
	BRK $08			  ; 00 08
	BRK $FE			  ; 00 FE
	SBC $020002,X		; FF 02 00 02
	PHP				  ; 08
	COP $00			  ; 02 00
	SBC $040200,X		; FF 00 02 04
	PHP				  ; 08
	BRK $02			  ; 00 02
	SBC $0600FE,X		; FF FE 00 06
	PHP				  ; 08
	INC $FF00,X		  ; FE 00 FF
	COP $FE			  ; 02 FE
	COP $08			  ; 02 08
	COP $FE			  ; 02 FE
	SBC $020202,X		; FF 02 02 02
	PHP				  ; 08
	COP $02			  ; 02 02
	SBC $0602FE,X		; FF FE 02 06
	PHP				  ; 08
	INC $FF02,X		  ; FE 02 FF
	INC $06FE,X		  ; FE FE 06
	PHP				  ; 08
	INC $FFFE,X		  ; FE FE FF
	BRK $FE			  ; 00 FE
	BRK $04			  ; 00 04
	BRK $FC			  ; 00 FC
	SBC $000002,X		; FF 02 00 00
	TSB $04			  ; 04 04
	BRK $FF			  ; 00 FF
	BRK $02			  ; 00 02
	BRK $04			  ; 00 04
	BRK $04			  ; 00 04
	SBC $0000FE,X		; FF FE 00 00
	TSB $FC			  ; 04 FC
	BRK $FF			  ; 00 FF
	COP $FE			  ; 02 FE
	BRK $04			  ; 00 04
	TSB $FC			  ; 04 FC
	SBC $000202,X		; FF 02 02 00
	TSB $04			  ; 04 04
	TSB $FF			  ; 04 FF
	INC $0002,X		  ; FE 02 00
	TSB $FC			  ; 04 FC
	TSB $FF			  ; 04 FF
	INC $00FE,X		  ; FE FE 00
	TSB $FC			  ; 04 FC
	JSR ($02FF,X)		; FC FF 02
	JSR ($1000,X)		; FC 00 10
	ORA $FE			  ; 01 FE
	SBC $000204,X		; FF 04 02 00
	BPL $0BD0			; 10 02
	ORA $FF			  ; 01 FF
	INC $0004,X		  ; FE 04 00
	BPL $0BD4			; 10 FF
	COP $FF			  ; 02 FF
	JSR ($00FE,X)		; FC FE 00
	BPL $0BDA			; 10 FE
	SBC $FE04FF,X		; FF FF 04 FE
	BRK $10			  ; 00 10
	COP $FF			  ; 02 FF
	SBC $000402,X		; FF 02 04 00
	BPL $0BEB			; 10 01
	COP $FF			  ; 02 FF
	JSR ($0002,X)		; FC 02 00
	BPL $0BEF			; 10 FE
	ORA $FF			  ; 01 FF
	INC $00FC,X		  ; FE FC 00
	BPL $0BF7			; 10 FF
	INC $00FF,X		  ; FE FF 00
	JSR ($1000,X)		; FC 00 10
	BRK $FE			  ; 00 FE

Bank_0E_Function_0C:
	SBC $010004,X		; FF 04 00 01
	BPL $0C08			; 10 02
	BRK $FF			  ; 00 FF
	BRK $04			  ; 00 04
	COP $10			  ; 02 10
	BRK $02			  ; 00 02
	SBC $0300FC,X		; FF FC 00 03
	BPL $0C12			; 10 FE
	BRK $FF			  ; 00 FF
	TSB $FC			  ; 04 FC
	BRK $10			  ; 00 10
	COP $FE			  ; 02 FE
	SBC $010404,X		; FF 04 04 01
	BPL $0C24			; 10 02
	COP $FF			  ; 02 FF
	JSR ($0204,X)		; FC 04 02
	BPL $0C27			; 10 FE
	COP $FF			  ; 02 FF
	JSR ($03FC,X)		; FC FC 03
	BPL $0C2E			; 10 FE
	INC $00FF,X		  ; FE FF 00
	ASL $1C00			; 0E 00 1C
	BRK $04			  ; 00 04
	SBC $00F200,X		; FF 00 F2 00
	TRB $FC00			; 1C 00 FC
	SBC $001000,X		; FF 00 10 00
	JSR $0400			; 20 00 04
	SBC $02FF02,X		; FF 02 FF 02
	ORA $00			  ; 03 00
	ORA $03			  ; 01 03
	ORA $00			  ; 01 00
	SBC $0202,X		  ; FD 02 02
	ORA $FD			  ; 01 FD
	COP $01			  ; 02 01
	BRK $00			  ; 00 00
	COP $01			  ; 02 01
	ORA $FD			  ; 01 FD
	COP $04			  ; 02 04
	ORA $FE			  ; 01 FE
	ORA $01			  ; 03 01
	ORA $01			  ; 01 01
	COP $04			  ; 02 04
	COP $02			  ; 02 02
	ORA $03			  ; 03 03
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $FD			  ; 00 FD
	SBC $0601FE,X		; FF FE 01 06
	ORA $00			  ; 03 00
	ORA $07			  ; 01 07
	ORA $00			  ; 01 00
	SBC $0306,X		  ; FD 06 03
	SBC $0306FD,X		; FF FD 06 03
	SBC $0107FE,X		; FF FE 07 01
	SBC $0906FF,X		; FF FF 06 09
	SBC $030602,X		; FF 02 06 03
	BRK $02			  ; 00 02
	ORA $03			  ; 07 03
	BRK $01			  ; 00 01
	ASL $01			  ; 06 01
	BRK $FD			  ; 00 FD
	SBC $06FFFE,X		; FF FE FF 06
	ORA $00			  ; 03 00
	ORA $07			  ; 01 07
	ORA $00			  ; 01 00
	SBC $0206,X		  ; FD 06 02
	SBC $0106FD,X		; FF FD 06 01
	BRK $00			  ; 00 00
	ASL $01			  ; 06 01
	SBC $0406FD,X		; FF FD 06 04
	SBC $0107FE,X		; FF FE 07 01
	SBC $040601,X		; FF 01 06 04
	INC $0702,X		  ; FE 02 07
	ORA $00			  ; 03 00
	ORA $06			  ; 01 06
	ORA $00			  ; 01 00
	SBC $02FF,X		  ; FD FF 02
	ORA $02			  ; 01 02
	ORA $00			  ; 03 00
	ORA $03			  ; 01 03
	ORA $00			  ; 01 00
	SBC $0302,X		  ; FD 02 03
	ORA $FD			  ; 01 FD
	COP $03			  ; 02 03
	ORA $FE			  ; 01 FE
	ORA $01			  ; 03 01
	ORA $FF			  ; 01 FF
	COP $09			  ; 02 09
	ORA $02			  ; 01 02
	COP $03			  ; 02 03
	BRK $02			  ; 00 02
	ORA $03			  ; 03 03
	BRK $01			  ; 00 01
	COP $01			  ; 02 01
	BRK $FD			  ; 00 FD
	SBC $00FF00,X		; FF 00 FF 00
	TSB $00			  ; 04 00
	SBC $0300,X		  ; FD 00 03
	BRK $FE			  ; 00 FE
	BRK $02			  ; 00 02
	BRK $FF			  ; 00 FF
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	BRK $03			  ; 00 03
	BRK $03			  ; 00 03
	BRK $01			  ; 00 01
	BRK $02			  ; 00 02
	BRK $02			  ; 00 02
	BRK $02			  ; 00 02
	BRK $03			  ; 00 03
	BRK $FF			  ; 00 FF
	SBC $00FE00,X		; FF 00 FE 00
	ASL $00			  ; 06 00
	SBC $0300,X		  ; FD 00 03
	BRK $FE			  ; 00 FE
	BRK $02			  ; 00 02
	BRK $FF			  ; 00 FF
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	BRK $03			  ; 00 03
	BRK $02			  ; 00 02
	BRK $02			  ; 00 02
	BRK $02			  ; 00 02
	BRK $01			  ; 00 01
	BRK $02			  ; 00 02
	BRK $FF			  ; 00 FF
	SBC $000000,X		; FF 00 00 00
	TSB $00			  ; 04 00
	SBC $0300,X		  ; FD 00 03
	BRK $FE			  ; 00 FE
	BRK $02			  ; 00 02
	BRK $FF			  ; 00 FF
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	BRK $03			  ; 00 03
	BRK $03			  ; 00 03
	BRK $03			  ; 00 03
	BRK $02			  ; 00 02
	BRK $03			  ; 00 03
	BRK $02			  ; 00 02
	BRK $02			  ; 00 02
	BRK $01			  ; 00 01
	BRK $03			  ; 00 03
	BRK $FF			  ; 00 FF
	SBC $000000,X		; FF 00 00 00
	ORA $00			  ; 03 00
	INC $0200,X		  ; FE 00 02
	BRK $FF			  ; 00 FF
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	BRK $03			  ; 00 03
	BRK $02			  ; 00 02
	BRK $02			  ; 00 02
	BRK $03			  ; 00 03
	BRK $01			  ; 00 01
	BRK $FE			  ; 00 FE
	BRK $02			  ; 00 02
	BRK $FF			  ; 00 FF
	SBC $000000,X		; FF 00 00 00
	TSB $00			  ; 04 00
	SBC $0301,X		  ; FD 01 03
	BRK $FE			  ; 00 FE
	BRK $02			  ; 00 02
	BRK $FF			  ; 00 FF
	ORA $04			  ; 01 04
	BRK $00			  ; 00 00
	BRK $03			  ; 00 03
	BRK $03			  ; 00 03
	ORA $03			  ; 01 03
	BRK $02			  ; 00 02
	BRK $03			  ; 00 03
	BRK $02			  ; 00 02
	ORA $02			  ; 01 02
	BRK $01			  ; 00 01
	BRK $03			  ; 00 03
	BRK $FF			  ; 00 FF
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	SBC $000000,X		; FF 00 00 00
	TSB $00			  ; 04 00
	SBC $0300,X		  ; FD 00 03
	BRK $FE			  ; 00 FE
	BRK $02			  ; 00 02
	BRK $FF			  ; 00 FF
	ORA $05			  ; 01 05
	BRK $00			  ; 00 00
	ORA $03			  ; 01 03
	BRK $03			  ; 00 03
	BRK $03			  ; 00 03
	BRK $02			  ; 00 02
	BRK $03			  ; 00 03
	BRK $01			  ; 00 01
	ORA $02			  ; 01 02
	BRK $01			  ; 00 01
	SBC $020000,X		; FF 00 00 02
	TSB $00			  ; 04 00
	SBC $0302,X		  ; FD 02 03
	BRK $FE			  ; 00 FE
	COP $02			  ; 02 02
	BRK $FF			  ; 00 FF
	ORA $05			  ; 03 05
	BRK $00			  ; 00 00
	ORA $03			  ; 03 03
	BRK $03			  ; 00 03
	COP $03			  ; 02 03
	BRK $02			  ; 00 02
	COP $03			  ; 02 03
	BRK $01			  ; 00 01
	ORA $02			  ; 03 02
	BRK $01			  ; 00 01
	SBC $040000,X		; FF 00 00 04
	TSB $00			  ; 04 00
	SBC $0304,X		  ; FD 04 03
	BRK $FE			  ; 00 FE
	TSB $02			  ; 04 02
	BRK $FF			  ; 00 FF
	ORA $05			  ; 05 05
	BRK $00			  ; 00 00
	ORA $03			  ; 05 03
	BRK $03			  ; 00 03
	TSB $03			  ; 04 03

Bank_0E_Function_0E:
	BRK $02			  ; 00 02
	TSB $03			  ; 04 03
	BRK $01			  ; 00 01
	ORA $02			  ; 05 02
	BRK $01			  ; 00 01
	SBC $060000,X		; FF 00 00 06
	TSB $00			  ; 04 00
	SBC $0306,X		  ; FD 06 03
	BRK $FE			  ; 00 FE
	ASL $02			  ; 06 02
	BRK $FF			  ; 00 FF
	ORA $05			  ; 07 05
	BRK $00			  ; 00 00
	ORA $03			  ; 07 03
	BRK $03			  ; 00 03
	ASL $03			  ; 06 03
	BRK $02			  ; 00 02
	ASL $03			  ; 06 03
	BRK $01			  ; 00 01
	ORA $02			  ; 07 02
	BRK $01			  ; 00 01
	SBC $000000,X		; FF 00 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $FF			  ; 00 FF
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	INC $0000,X		  ; FE 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $0000FF,X		; FF FF 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 03 00
	BRK $01			  ; 00 01
	BRK $02			  ; 00 02
	BRK $01			  ; 00 01
	SBC $0000,X		  ; FD 00 00
	ORA $00			  ; 01 00
	INC $0100,X		  ; FE 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $01			  ; 00 01
	BRK $02			  ; 00 02
	BRK $01			  ; 00 01
	INC $0000,X		  ; FE 00 00
	ORA $00			  ; 01 00
	INC $FDFF,X		  ; FE FF FD
	SBC $000600		  ; EF 00 06 00
	JSR ($0100,X)		; FC 00 01
	SBC $0100FC,X		; FF FC 00 01
	BRK $FC			  ; 00 FC
	BRK $01			  ; 00 01
	SBC $0100FC,X		; FF FC 00 01
	BRK $FC			  ; 00 FC
	BRK $01			  ; 00 01
	SBC $0100FC,X		; FF FC 00 01
	BRK $FC			  ; 00 FC
	BRK $01			  ; 00 01
	SBC $0100FC,X		; FF FC 00 01
	BRK $FC			  ; 00 FC
	BRK $01			  ; 00 01
	SBC $0100FC,X		; FF FC 00 01
	BRK $FC			  ; 00 FC
	BRK $01			  ; 00 01
	SBC $0100FC,X		; FF FC 00 01
	BRK $FC			  ; 00 FC
	BRK $01			  ; 00 01
	SBC $0100FC,X		; FF FC 00 01
	BRK $FC			  ; 00 FC
	BRK $01			  ; 00 01
	SBC $0100FC,X		; FF FC 00 01
	BRK $FC			  ; 00 FC
	BRK $01			  ; 00 01
	SBC $0100FC,X		; FF FC 00 01
	BRK $FC			  ; 00 FC
	BRK $01			  ; 00 01
	SBC $0100FC,X		; FF FC 00 01
	BRK $FC			  ; 00 FC
	BRK $06			  ; 00 06
	SBC $0200FC,X		; FF FC 00 02
	SBC $0100FC,X		; FF FC 00 01
	PLX				  ; FA
	BRK $FF			  ; 00 FF
	SBC $EE			  ; F2 EE

Bank_0E_Function_0F:
	BRK $01			  ; 00 01
	BRK $FC			  ; 00 FC
	BRK $03			  ; 00 03
	SBC $0600FC,X		; FF FC 00 06
	INC $00FC,X		  ; FE FC 00
	ORA $FD			  ; 07 FD
	JSR ($0F00,X)		; FC 00 0F
	JSR ($00FC,X)		; FC FC 00
	TSB $FC			  ; 04 FC
	JSR ($08FF,X)		; FC FF 08
	INC $0400			; EE 00 04
	BRK $FC			  ; 00 FC
	BRK $01			  ; 00 01
	ORA $FC			  ; 01 FC
	BRK $01			  ; 00 01
	BRK $FC			  ; 00 FC
	BRK $01			  ; 00 01
	ORA $FC			  ; 01 FC
	BRK $01			  ; 00 01
	BRK $FC			  ; 00 FC
	BRK $01			  ; 00 01
	ORA $FC			  ; 01 FC
	BRK $01			  ; 00 01
	BRK $FC			  ; 00 FC
	BRK $08			  ; 00 08
	ORA $FC			  ; 01 FC
	BRK $08			  ; 00 08
	COP $FC			  ; 02 FC
	BRK $0A			  ; 00 0A
	ORA $FC			  ; 03 FC
	BRK $01			  ; 00 01
	ORA $00			  ; 07 00
	SBC $00F213,X		; FF 13 F2 00
	COP $01			  ; 02 01
	JSR ($0200,X)		; FC 00 02
	COP $FC			  ; 02 FC
	BRK $06			  ; 00 06
	ORA $FC			  ; 03 FC
	BRK $06			  ; 00 06
	ORA $FD			  ; 03 FD
	BRK $06			  ; 00 06
	TSB $FD			  ; 04 FD
	BRK $10			  ; 00 10
	ORA $FE			  ; 05 FE
	BRK $01			  ; 00 01
	ASL $FC			  ; 06 FC
	SBC $040605,X		; FF 05 06 04
	JSL $040101		  ; 22 01 01 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $01			  ; 01 01
	ORA $04			  ; 01 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $01			  ; 01 01
	ORA $04			  ; 01 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $01			  ; 01 01
	ORA $04			  ; 01 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $01			  ; 01 01
	ORA $04			  ; 01 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $01			  ; 01 01
	ORA $04			  ; 01 04
	ORA $00			  ; 01 00
	ORA $04			  ; 01 04
	ORA $01			  ; 01 01
	ORA $04			  ; 01 04
	PHP				  ; 08
	BRK $01			  ; 00 01
	SBC $02F9FB,X		; FF FB F9 02
	JSL $02FFFF		  ; 22 FF FF 02
	ORA $00			  ; 01 00
	SBC $FF0102,X		; FF 02 01 FF
	SBC $000102,X		; FF 02 01 00
	SBC $FF0102,X		; FF 02 01 FF
	SBC $000102,X		; FF 02 01 00
	SBC $FF0102,X		; FF 02 01 FF
	SBC $000102,X		; FF 02 01 00
	SBC $FF0102,X		; FF 02 01 FF
	SBC $000102,X		; FF 02 01 00
	SBC $FF0102,X		; FF 02 01 FF
	SBC $000102,X		; FF 02 01 00
	SBC $FF0102,X		; FF 02 01 FF
	SBC $000802,X		; FF 02 08 00
	SBC $0705FF,X		; FF FF 05 07
	BRK $22			  ; 00 22
	ORA $01			  ; 01 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	ORA $01			  ; 01 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	ORA $01			  ; 01 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	ORA $01			  ; 01 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	ORA $01			  ; 01 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	ORA $01			  ; 01 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	ORA $01			  ; 01 01
	BRK $10			  ; 00 10
	BRK $01			  ; 00 01
	SBC $00F8FB,X		; FF FB F8 00
	JSL $00FFFF		  ; 22 FF FF 00
	ORA $00			  ; 01 00
	SBC $FF0100,X		; FF 00 01 FF
	SBC $000100,X		; FF 00 01 00
	SBC $FF0100,X		; FF 00 01 FF
	SBC $000100,X		; FF 00 01 00
	SBC $FF0100,X		; FF 00 01 FF
	SBC $000100,X		; FF 00 01 00
	SBC $FF0100,X		; FF 00 01 FF
	SBC $000100,X		; FF 00 01 00
	SBC $FF0100,X		; FF 00 01 FF
	SBC $000100,X		; FF 00 01 00
	SBC $FF0100,X		; FF 00 01 FF
	SBC $001000,X		; FF 00 10 00
	SBC $F400FF,X		; FF FF 00 F4
	BRK $5A			  ; 00 5A
	BRK $FF			  ; 00 FF
	SBC $000000,X		; FF 00 00 00
	COP $00			  ; 02 00
	BRK $FF			  ; 00 FF
	BRK $F6			  ; 00 F6
	BRK $06			  ; 00 06
	BRK $FF			  ; 00 FF
	ORA $0A			  ; 03 0A
	BRK $FE			  ; 00 FE
	BRK $0A			  ; 00 0A
	BRK $FD			  ; 00 FD
	ORA $06			  ; 05 06
	BRK $FC			  ; 00 FC
	SBC $000A00,X		; FF 00 0A 00
	ASL $00			  ; 06 00
	ORA $03			  ; 01 03
	ASL				  ; 0A
	BRK $02			  ; 00 02
	BRK $0A			  ; 00 0A
	BRK $03			  ; 00 03
	ORA $06			  ; 05 06
	BRK $04			  ; 00 04
	SBC $00FC0B,X		; FF 0B FC 00
	TSB $01			  ; 04 01
	SBC $020A02,X		; FF 02 0A 02
	SBC $030807,X		; FF 07 08 03
	SBC $040A03,X		; FF 03 0A 04
	SBC $040BFF,X		; FF FF 0B 04
	BRK $04			  ; 00 04
	ORA $01			  ; 01 01
	COP $0A			  ; 02 0A
	COP $01			  ; 02 01
	ORA $08			  ; 07 08
	ORA $01			  ; 03 01
	ORA $0A			  ; 03 0A
	TSB $01			  ; 04 01
	SBC $00FCF5,X		; FF F5 FC 00
	TSB $FF			  ; 04 FF
	SBC $FE0A02,X		; FF 02 0A FE
	SBC $FD0807,X		; FF 07 08 FD
	SBC $FC0A03,X		; FF 03 0A FC
	SBC $04F5FF,X		; FF FF F5 04
	BRK $04			  ; 00 04
	SBC $0A0201,X		; FF 01 02 0A
	INC $0701,X		  ; FE 01 07
	PHP				  ; 08
	SBC $0301,X		  ; FD 01 03
	ASL				  ; 0A
	JSR ($FF01,X)		; FC 01 FF
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	BRK $FD			  ; 00 FD
	BRK $01			  ; 00 01
	BRK $FE			  ; 00 FE
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $02			  ; 00 02
	BRK $03			  ; 00 03
	SBC $000000,X		; FF 00 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $FF			  ; 00 FF
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	SBC $0000FF,X		; FF FF 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $FF			  ; 00 FF
	SBC $0100FF,X		; FF FF 00 01
	BRK $FF			  ; 00 FF
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $FF			  ; 00 FF
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $FF			  ; 00 FF
	BRK $01			  ; 00 01
	SBC $01FF00,X		; FF 00 FF 01
	BRK $00			  ; 00 00
	ORA $01			  ; 03 01
	JSR ($0300,X)		; FC 00 03
	ORA $FF			  ; 01 FF
	BRK $03			  ; 00 03
	ORA $01			  ; 01 01
	BRK $03			  ; 00 03
	ORA $02			  ; 01 02
	BRK $03			  ; 00 03
	ORA $03			  ; 01 03
	SBC $00FD0D,X		; FF 0D FD 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00

Bank_0E_Function_12:
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00

Bank_0E_Function_13:
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $010100,X		; FF 00 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	SBC $010100,X		; FF 00 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $010100,X		; FF 00 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $010100,X		; FF 00 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $010100,X		; FF 00 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $010100,X		; FF 00 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	SBC $000100,X		; FF 00 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $010100,X		; FF 00 01 01
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $010100,X		; FF 00 01 01
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $010100,X		; FF 00 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $FF0100,X		; FF 00 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $FF0100,X		; FF 00 01 FF
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $FF0100,X		; FF 00 01 FF
	SBC $000100,X		; FF 00 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $FF0100,X		; FF 00 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $FF0100,X		; FF 00 01 FF
	SBC $000100,X		; FF 00 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $FF0100,X		; FF 00 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $FF0100,X		; FF 00 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $FF0100,X		; FF 00 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $01F5FF,X		; FF FF F5 01
	BRK $30			  ; 00 30
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01

Bank_0E_Function_15:
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010001,X		; FF 01 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010001,X		; FF 01 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010001,X		; FF 01 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010001,X		; FF 01 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01

Bank_0E_Function_16:
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010001,X		; FF 01 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01

Bank_0E_Function_17:
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $010000,X		; FF 00 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	SBC $00FF05,X		; FF 05 FF 00
	ORA $01			  ; 01 01
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	SBC $000100,X		; FF 00 01 00

Bank_0E_Function_18:
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $010100,X		; FF 00 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $010100,X		; FF 00 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $010100,X		; FF 00 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $010100,X		; FF 00 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $010100,X		; FF 00 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	SBC $000100,X		; FF 00 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	SBC $010100,X		; FF 00 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01

Bank_0E_Function_19:
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $01			  ; 01 01
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00

Bank_0E_Function_1A:
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $00			  ; 00 00
	ORA $00			  ; 01 00
	BRK $00			  ; 00 00
	ORA $FF			  ; 01 FF
	BRK $FF			  ; 00 FF
	COP $FD			  ; 02 FD
	BRK $01			  ; 00 01
	BRK $FF			  ; 00 FF
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $FF			  ; 01 FF
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $FF			  ; 01 FF
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $FF			  ; 00 FF
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $FF			  ; 01 FF
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $FF			  ; 01 FF
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $FF			  ; 01 FF
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $FF			  ; 00 FF
	BRK $01			  ; 00 01
	ORA $00			  ; 01 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $FF			  ; 00 FF
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	ORA $FF			  ; 01 FF
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	BRK $FF			  ; 00 FF
	BRK $01			  ; 00 01
