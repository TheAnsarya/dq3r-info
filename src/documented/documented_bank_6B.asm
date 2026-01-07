;==============================================================================
; Dragon Quest III - Bank 6B
;==============================================================================
; File: bank_6B.asm
; Purpose: Game system module with comprehensive documentation
; Functions: Auto-analyzed and labeled with meaningful names
; Comments: Context-aware instruction documentation
;==============================================================================

.include "hardware.inc"
.include "constants.inc"

; Dragon Quest III - Bank $6B Code
; Ultra-aggressive code extraction


.segment "BANK_6B_CODE"


;==============================================================================
; GeneralPurpose_00
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_00:
	SBC $5008,X		  ; FD 08 50 | Unknown operation
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $00			  ; 03 00 | Logical OR with accumulator
	INY				  ; C8 | Unknown operation
	INC				  ; 1A | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	CPY #$1B			 ; C0 1B | Unknown operation
	BRK $08			  ; 00 08 | Software interrupt
	CPY #$06			 ; C0 06 | Unknown operation
	BPL $8019			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $03			  ; 00 03 | Software interrupt
	BRK $C8			  ; 00 C8 | Software interrupt
	TRB $00			  ; 14 00 | Unknown operation
	BRK $C0			  ; 00 C0 | Software interrupt
	TSB $00			  ; 04 00 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	CPY #$06			 ; C0 06 | Unknown operation
	BPL $802A			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $05			  ; 00 05 | Software interrupt
	PHP				  ; 08 | Push processor status to stack
	BNE $8049			; D0 1C | Branch if not equal (zero flag clear)
	BRK $00			  ; 00 00 | Software interrupt
	BNE $804E			; D0 1D | Branch if not equal (zero flag clear)
	BRK $00			  ; 00 00 | Software interrupt
	INY				  ; C8 | Unknown operation
	TRB $00			  ; 14 00 | Unknown operation
	BRK $C0			  ; 00 C0 | Software interrupt
	TSB $00			  ; 04 00 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	CPY #$06			 ; C0 06 | Unknown operation
	BPL $8043			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $06			  ; 00 06 | Software interrupt
	PHP				  ; 08 | Push processor status to stack
	CLD				  ; D8 | Unknown operation
	ASL $0000,X		  ; 1E 00 00 | Arithmetic shift left
	BNE $8069			; D0 1F | Branch if not equal (zero flag clear)
	BRK $08			  ; 00 08 | Software interrupt
	BNE $8051			; D0 03 | Branch if not equal (zero flag clear)
	BRK $00			  ; 00 00 | Software interrupt
	INY				  ; C8 | Unknown operation
	TRB $00			  ; 14 00 | Unknown operation
	BRK $C0			  ; 00 C0 | Software interrupt
	TSB $00			  ; 04 00 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	CPY #$06			 ; C0 06 | Unknown operation

	CPY #$06			 ; C0 06
	BPL $8060			; 10 04
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	BRK $D8			  ; 00 D8
	JSR $0800			; 20 00 08
	CLD				  ; D8
	ORA $00			  ; 13 00
	PHP				  ; 08
	BNE $806E			; D0 03
	BRK $00			  ; 00 00
	BNE $8071			; D0 02
	BRK $00			  ; 00 00
	INY				  ; C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $8081			; 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	BRK $D0			  ; 00 D0
	COP $10			  ; 02 10
	BRK $C8			  ; 00 C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $8096			; 10 04
	BRK $00			  ; 00 00
	BRK $06			  ; 00 06
	SED				  ; F8
	CLD				  ; D8
	AND $00			  ; 21 00
	SED				  ; F8
	BNE $80BF			; D0 22
	BRK $00			  ; 00 00
	BNE $80A3			; D0 02
	BPL $80A3			; 10 00
	INY				  ; C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $80B3			; 10 04
	BRK $00			  ; 00 00
	BRK $06			  ; 00 06
	SED				  ; F8
	CLD				  ; D8
	AND $00			  ; 21 00
	SED				  ; F8
	BNE $80BF			; D0 05
	BRK $00			  ; 00 00
	BNE $80C0			; D0 02
	BPL $80C0			; 10 00
	INY				  ; C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $80D0			; 10 04
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	BEQ $80A2			; F0 D0
	TCS				  ; 1B
	BRK $F8			  ; 00 F8
	CLD				  ; D8
	AND $00			  ; 23 00
	SED				  ; F8
	BNE $80E0			; D0 05
	BRK $00			  ; 00 00
	BNE $80E1			; D0 02
	BPL $80E1			; 10 00
	INY				  ; C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $80F1			; 10 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	SED				  ; F8
	CLD				  ; D8
	ORA $00,X			; 15 00
	BEQ $80CF			; F0 D8
	BIT $00			  ; 24 00
	SED				  ; F8
	BNE $8101			; D0 05
	BRK $F0			  ; 00 F0
	BNE $8104			; D0 04

;==============================================================================
; GeneralPurpose_01
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_01:
	BRK $00			  ; 00 00 | Software interrupt
	BNE $8106			; D0 02 | Branch if not equal (zero flag clear)
	BPL $8106			; 10 00 | Unknown operation
	INY				  ; C8 | Unknown operation
	TRB $00			  ; 14 00 | Unknown operation
	BRK $C0			  ; 00 C0 | Software interrupt
	TSB $00			  ; 04 00 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	CPY #$06			 ; C0 06 | Unknown operation
	BPL $8116			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $05			  ; 00 05 | Software interrupt
	BEQ $80E8			; F0 D0 | Branch if equal (zero flag set)
	TSB $10			  ; 04 10 | Unknown operation
	BRK $D0			  ; 00 D0 | Software interrupt
	COP $10			  ; 02 10 | Unknown operation
	BRK $C8			  ; 00 C8 | Software interrupt
	TRB $00			  ; 14 00 | Unknown operation
	BRK $C0			  ; 00 C0 | Software interrupt
	TSB $00			  ; 04 00 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	CPY #$06			 ; C0 06 | Unknown operation
	BPL $812F			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $07			  ; 00 07 | Software interrupt
	SED				  ; F8 | Unknown operation
	CPX #$1C			 ; E0 1C | Unknown operation
	BRK $F0			  ; 00 F0 | Software interrupt
	CPX #$1D			 ; E0 1D | Unknown operation
	BRK $F0			  ; 00 F0 | Software interrupt
	BNE $813E			; D0 04 | Branch if not equal (zero flag clear)
	BPL $813C			; 10 00 | Unknown operation
	BNE $8140			; D0 02 | Branch if not equal (zero flag clear)
	BPL $8140			; 10 00 | Unknown operation
	INY				  ; C8 | Unknown operation
	TRB $00			  ; 14 00 | Unknown operation
	BRK $C0			  ; 00 C0 | Software interrupt
	TSB $00			  ; 04 00 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	CPY #$06			 ; C0 06 | Unknown operation
	BPL $8150			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $08			  ; 00 08 | Software interrupt
	SED				  ; F8 | Unknown operation
	INX				  ; E8 | Unknown operation
	ASL $F800,X		  ; 1E 00 F8 | Arithmetic shift left
	CPX #$03			 ; E0 03 | Unknown operation
	BRK $F0			  ; 00 F0 | Software interrupt
	CPX #$1F			 ; E0 1F | Unknown operation

	CPX #$1F			 ; E0 1F
	BRK $F0			  ; 00 F0
	BNE $8163			; D0 04
	BPL $8161			; 10 00
	BNE $8165			; D0 02
	BPL $8165			; 10 00
	INY				  ; C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $8175			; 10 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	SED				  ; F8
	INX				  ; E8
	ORA $00			  ; 13 00
	BEQ $8163			; F0 E8
	JSR $F800			; 20 00 F8
	CPX #$03			 ; E0 03
	BRK $F0			  ; 00 F0
	CPX #$02			 ; E0 02
	BRK $F0			  ; 00 F0
	BNE $818C			; D0 04
	BPL $818A			; 10 00
	BNE $818E			; D0 02
	BPL $818E			; 10 00
	INY				  ; C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $819E			; 10 04
	BRK $00			  ; 00 00
	BRK $06			  ; 00 06
	BEQ $8180			; F0 E0
	COP $10			  ; 02 10
	BEQ $8174			; F0 D0
	TSB $10			  ; 04 10
	BRK $D0			  ; 00 D0
	COP $10			  ; 02 10
	BRK $C8			  ; 00 C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $81BB			; 10 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	INX				  ; E8
	INX				  ; E8
	AND $00			  ; 21 00
	INX				  ; E8
	CPX #$22			 ; E0 22
	BRK $F0			  ; 00 F0
	CPX #$02			 ; E0 02
	BPL $81B8			; 10 F0
	BNE $81CE			; D0 04
	BPL $81CC			; 10 00
	BNE $81D0			; D0 02
	BPL $81D0			; 10 00
	INY				  ; C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $81E0			; 10 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	INX				  ; E8
	INX				  ; E8
	AND $00			  ; 21 00
	INX				  ; E8
	CPX #$05			 ; E0 05
	BRK $F0			  ; 00 F0
	CPX #$02			 ; E0 02
	BPL $81DD			; 10 F0
	BNE $81F3			; D0 04
	BPL $81F1			; 10 00
	BNE $81F5			; D0 02
	BPL $81F5			; 10 00
	INY				  ; C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $8205			; 10 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	CPX #$E0			 ; E0 E0
	TCS				  ; 1B
	BRK $E8			  ; 00 E8
	INX				  ; E8
	AND $00			  ; 23 00
	INX				  ; E8
	CPX #$05			 ; E0 05
	BRK $F0			  ; 00 F0
	CPX #$02			 ; E0 02
	BPL $8206			; 10 F0
	BNE $821C			; D0 04
	BPL $821A			; 10 00
	BNE $821E			; D0 02
	BPL $821E			; 10 00
	INY				  ; C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $822E			; 10 04
	BRK $00			  ; 00 00
	BRK $0A			  ; 00 0A
	CPX #$E8			 ; E0 E8
	BIT $00			  ; 24 00
	INX				  ; E8
	INX				  ; E8
	ORA $00,X			; 15 00
	INX				  ; E8
	CPX #$05			 ; E0 05
	BRK $E0			  ; 00 E0
	CPX #$04			 ; E0 04
	BRK $F0			  ; 00 F0
	CPX #$02			 ; E0 02
	BPL $8233			; 10 F0
	BNE $8249			; D0 04
	BPL $8247			; 10 00
	BNE $824B			; D0 02
	BPL $824B			; 10 00
	INY				  ; C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $825B			; 10 04
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	BEQ $823D			; F0 E0
	COP $10			  ; 02 10
	CPX #$E0			 ; E0 E0
	TSB $10			  ; 04 10
	BEQ $8235			; F0 D0
	TSB $10			  ; 04 10
	BRK $D0			  ; 00 D0
	COP $10			  ; 02 10
	BRK $C8			  ; 00 C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $827C			; 10 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	INX				  ; E8
	BEQ $82A4			; F0 25
	BRK $E0			  ; 00 E0
	BEQ $82A9			; F0 26
	BRK $F0			  ; 00 F0
	CPX #$02			 ; E0 02
	BPL $8269			; 10 E0
	CPX #$04			 ; E0 04
	BPL $827D			; 10 F0
	BNE $8293			; D0 04
	BPL $8291			; 10 00
	BNE $8295			; D0 02
	BPL $8295			; 10 00
	INY				  ; C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $82A5			; 10 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	INX				  ; E8
	BEQ $82A9			; F0 01
	BRK $E0			  ; 00 E0
	BEQ $82AC			; F0 00
	BRK $F0			  ; 00 F0
	CPX #$02			 ; E0 02
	BPL $8292			; 10 E0
	CPX #$04			 ; E0 04
	BPL $82A6			; 10 F0
	BNE $82BC			; D0 04
	BPL $82BA			; 10 00
	BNE $82BE			; D0 02
	BPL $82BE			; 10 00
	INY				  ; C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $82CE			; 10 04
	BRK $00			  ; 00 00
	BRK $0B			  ; 00 0B
	INX				  ; E8
	SED				  ; F8
	AND $00			  ; 27 00
	CPX #$F8			 ; E0 F8
	PLP				  ; 28
	BRK $E8			  ; 00 E8
	BEQ $82DA			; F0 01
	BRK $E0			  ; 00 E0
	BEQ $82DD			; F0 00
	BRK $F0			  ; 00 F0
	CPX #$02			 ; E0 02
	BPL $82C3			; 10 E0
	CPX #$04			 ; E0 04
	BPL $82D7			; 10 F0
	BNE $82ED			; D0 04
	BPL $82EB			; 10 00
	BNE $82EF			; D0 02
	BPL $82EF			; 10 00
	INY				  ; C8
	TRB $00			  ; 14 00
	BRK $C0			  ; 00 C0
	TSB $00			  ; 04 00
	PHP				  ; 08
	CPY #$06			 ; C0 06
	BPL $82FF			; 10 04
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SED				  ; F8

;==============================================================================
; GeneralPurpose_03
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_03:
	SED				  ; F8 | Unknown operation
	AND #$10			 ; 29 10 | Logical AND with accumulator
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $F8			  ; 01 F8 | Logical OR with accumulator
	SED				  ; F8 | Unknown operation
	PLD				  ; 2B | Unknown operation
	BPL $8311			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	SED				  ; F8 | Unknown operation
	SED				  ; F8 | Unknown operation
	AND $0410			; 2D 10 04 | Logical AND with accumulator
	BRK $00			  ; 00 00 | Software interrupt
	BRK $02			  ; 00 02 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	AND $00F800		  ; 2F 00 F8 00 | Logical AND with accumulator
	BMI $8322			; 30 00 | Unknown operation
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $F8			  ; 01 F8 | Logical OR with accumulator
	SED				  ; F8 | Unknown operation
	RTI				  ; 40 | Unknown operation
	BPL $8330			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	SED				  ; F8 | Unknown operation
	SED				  ; F8 | Unknown operation
	WDM $10			  ; 42 10 | Unknown operation
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $F8			  ; 01 F8 | Logical OR with accumulator
	SED				  ; F8 | Unknown operation
	MVP $0410			; 44 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	SED				  ; F8 | Unknown operation
	SED				  ; F8 | Unknown operation
	LSR $10			  ; 46 10 | Unknown operation
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $F8			  ; 01 F8 | Logical OR with accumulator
	SED				  ; F8 | Unknown operation
	PHA				  ; 48 | Push accumulator to stack
	BPL $8354			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $01			  ; 00 01 | Software interrupt
	SED				  ; F8 | Unknown operation
	SED				  ; F8 | Unknown operation

	SED				  ; F8
	LSR				  ; 4A
	BPL $835D			; 10 04
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SED				  ; F8
	SED				  ; F8
	JMP $0410			; 4C 10 04
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SED				  ; F8
	SED				  ; F8
	LSR $0410			; 4E 10 04
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SED				  ; F8
	SED				  ; F8
	RTS				  ; 60
	BPL $83F0			; 10 7C
	STA $F5			  ; 83 F5
	STA $83			  ; 81 83
	SBC $BA,X			; F5 BA
	STA $F5			  ; 83 F5
	BRK $01			  ; 00 01
	BRK $00			  ; 00 00
	SBC $000401,X		; FF 01 04 00
	BRK $02			  ; 00 02
	TSB $00			  ; 04 00
	BRK $03			  ; 00 03
	TSB $00			  ; 04 00
	BRK $04			  ; 00 04
	TSB $00			  ; 04 00
	BRK $05			  ; 00 05
	TSB $00			  ; 04 00
	BRK $06			  ; 00 06
	TSB $00			  ; 04 00
	BRK $07			  ; 00 07
	TSB $00			  ; 04 00
	BRK $08			  ; 00 08
	TSB $00			  ; 04 00
	BRK $09			  ; 00 09
	TSB $00			  ; 04 00
	BRK $0A			  ; 00 0A
	TSB $00			  ; 04 00
	BRK $0B			  ; 00 0B
	TSB $00			  ; 04 00
	BRK $0C			  ; 00 0C
	TSB $00			  ; 04 00
	BRK $0D			  ; 00 0D
	TSB $00			  ; 04 00
	BRK $0E			  ; 00 0E
	TSB $00			  ; 04 00
	BRK $FF			  ; 00 FF
	ORA $000004		  ; 0F 04 00 00
	BPL $83C4			; 10 04
	BRK $00			  ; 00 00
	ORA $04			  ; 11 04
	BRK $00			  ; 00 00
	ORA $04			  ; 12 04
	BRK $00			  ; 00 00
	ORA $04			  ; 13 04
	BRK $00			  ; 00 00
	TRB $04			  ; 14 04
	BRK $00			  ; 00 00
	ORA $04,X			; 15 04
	BRK $00			  ; 00 00
	ASL $04,X			; 16 04
	BRK $00			  ; 00 00
	ORA $04			  ; 17 04
	BRK $00			  ; 00 00
	CLC				  ; 18
	TSB $00			  ; 04 00
	BRK $19			  ; 00 19
	TSB $00			  ; 04 00
	BRK $1A			  ; 00 1A
	TSB $00			  ; 04 00
	BRK $1B			  ; 00 1B
	TSB $00			  ; 04 00
	BRK $1C			  ; 00 1C
	TSB $00			  ; 04 00
	BRK $FF			  ; 00 FF
	LSR				  ; 4A
	STY $F5			  ; 84 F5
	STA $84			  ; 91 84
	SBC $9A,X			; F5 9A
	STY $F5			  ; 84 F5
	LDA $84			  ; A7 84
	SBC $B8,X			; F5 B8

;==============================================================================
; GeneralPurpose_04
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_04:
	STY $F5			  ; 84 F5 | Store Y register
	CMP $F584			; CD 84 F5 | Compare with accumulator
	INC $84			  ; E6 84 | Unknown operation
	SBC $03,X			; F5 03 | Unknown operation
	STA $F5			  ; 85 F5 | Store accumulator to memory
	BIT $85			  ; 24 85 | Unknown operation
	SBC $45,X			; F5 45 | Unknown operation
	STA $F5			  ; 85 F5 | Store accumulator to memory
	ROR $85			  ; 66 85 | Unknown operation
	SBC $87,X			; F5 87 | Unknown operation
	STA $F5			  ; 85 F5 | Store accumulator to memory
	TAY				  ; A8 | Unknown operation
	STA $F5			  ; 85 F5 | Store accumulator to memory
	CMP $85			  ; C5 85 | Compare with accumulator
	SBC $DE,X			; F5 DE | Unknown operation
	STA $F5			  ; 85 F5 | Store accumulator to memory
	SBC $85			  ; F3 85 | Unknown operation
	SBC $FC,X			; F5 FC | Unknown operation
	STA $F5			  ; 85 F5 | Store accumulator to memory
	ORA #$86			 ; 09 86 | Logical OR with accumulator
	SBC $1A,X			; F5 1A | Unknown operation
	STX $F5			  ; 86 F5 | Store X register
	AND $48F586		  ; 2F 86 F5 48 | Logical AND with accumulator
	STX $F5			  ; 86 F5 | Store X register
	ADC $86			  ; 65 86 | Unknown operation
	SBC $86,X			; F5 86 | Unknown operation
	STX $F5			  ; 86 F5 | Store X register
	LDA $86			  ; A7 86 | Load value into accumulator
	SBC $C8,X			; F5 C8 | Unknown operation
	STX $F5			  ; 86 F5 | Store X register
	SBC #$86			 ; E9 86 | Unknown operation
	SBC $0A,X			; F5 0A | Unknown operation
	STA $F5			  ; 87 F5 | Store accumulator to memory
	AND $87			  ; 27 87 | Logical AND with accumulator
	SBC $40,X			; F5 40 | Unknown operation
	STA $F5			  ; 87 F5 | Store accumulator to memory
	ROL $1E00,X		  ; 3E 00 1E | Unknown operation
	BRK $E5			  ; 00 E5 | Software interrupt
	LDA #$E6			 ; A9 E6 | Load value into accumulator
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $EA			  ; 00 EA | Software interrupt
	LDA #$E7			 ; A9 E7 | Load value into accumulator
	LDA #$E8			 ; A9 E8 | Load value into accumulator
	LDA #$2F			 ; A9 2F | Load value into accumulator
	EOR $00A9E9,X		; 5F E9 A9 00 | Unknown operation
	BRK $EB			  ; 00 EB | Software interrupt
	LDA #$00			 ; A9 00 | Load value into accumulator
	BRK $EC			  ; 00 EC | Software interrupt
	LDA #$00			 ; A9 00 | Load value into accumulator

	LDA #$00			 ; A9 00
	BRK $ED			  ; 00 ED
	LDA #$02			 ; A9 02
	SBC $EFA9EE,X		; FF EE A9 EF
	LDA #$F4			 ; A9 F4
	LDA #$F5			 ; A9 F5
	LDA #$F0			 ; A9 F0
	LDA #$F1			 ; A9 F1
	LDA #$F2			 ; A9 F2
	LDA #$F3			 ; A9 F3
	LDA #$F4			 ; A9 F4
	LDA #$00			 ; A9 00
	BRK $F6			  ; 00 F6
	LDA #$00			 ; A9 00
	BRK $00			  ; 00 00
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	PHP				  ; 08
	SED				  ; F8
	BRK $10			  ; 00 10
	SED				  ; F8
	SED				  ; F8
	BRK $10			  ; 00 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA $0D			  ; 01 0D
	SED				  ; F8
	COP $10			  ; 02 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	COP $08			  ; 02 08
	SBC $0D1002		  ; EF 02 10 0D
	SED				  ; F8
	TSB $10			  ; 04 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA $00			  ; 03 00
	SBC #$02			 ; E9 02
	BPL $84B9			; 10 08
	SBC $0D1004		  ; EF 04 10 0D
	SBC $1006,Y		  ; F9 06 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	TSB $F8			  ; 04 F8
	INC $02			  ; E6 02
	BPL $84C2			; 10 00
	SBC #$04			 ; E9 04
	BPL $84CE			; 10 08
	BEQ $84CC			; F0 04
	BPL $84D7			; 10 0D
	PLX				  ; FA
	ASL $10			  ; 06 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA $F0			  ; 05 F0
	SBC #$02			 ; E9 02
	BPL $84CF			; 10 F8
	INC $04			  ; E6 04
	BPL $84DB			; 10 00
	NOP				  ; EA
	TSB $10			  ; 04 10
	PHP				  ; 08
	SBC $06			  ; F1 06
	BPL $84F0			; 10 0D
	XCE				  ; FB
	COP $10			  ; 02 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ASL $E8			  ; 06 E8
	SBC $F01002		  ; EF 02 10 F0
	SBC #$04			 ; E9 04
	BPL $84EC			; 10 F8
	SBC $04			  ; E7 04
	BPL $84F8			; 10 00
	XBA				  ; EB
	ASL $10			  ; 06 10
	PHP				  ; 08
	SBC $02			  ; F2 02
	BPL $850D			; 10 0D

;==============================================================================
; GeneralPurpose_05
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_05:
	JSR ($1008,X)		; FC 08 10 | Call local function
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $E3			  ; 07 E3 | Logical OR with accumulator
	SED				  ; F8 | Unknown operation
	COP $10			  ; 02 10 | Unknown operation
	INX				  ; E8 | Unknown operation
	SBC $F01004		  ; EF 04 10 F0 | Unknown operation
	NOP				  ; EA | Unknown operation
	TSB $10			  ; 04 10 | Unknown operation
	SED				  ; F8 | Unknown operation
	INX				  ; E8 | Unknown operation
	ASL $10			  ; 06 10 | Arithmetic shift left
	BRK $EC			  ; 00 EC | Software interrupt
	COP $10			  ; 02 10 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	SBC $08			  ; F3 08 | Unknown operation
	BPL $852E			; 10 0D | Unknown operation
	SBC $100A,X		  ; FD 0A 10 | Unknown operation
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $E3			  ; 07 E3 | Logical OR with accumulator
	SED				  ; F8 | Unknown operation
	TSB $10			  ; 04 10 | Unknown operation
	INX				  ; E8 | Unknown operation
	BEQ $8534			; F0 04 | Branch if equal (zero flag set)
	BPL $8522			; 10 F0 | Unknown operation
	XBA				  ; EB | Exchange accumulator bytes
	ASL $10			  ; 06 10 | Arithmetic shift left
	SED				  ; F8 | Unknown operation
	SBC #$02			 ; E9 02 | Unknown operation
	BPL $853A			; 10 00 | Unknown operation
	SBC $1008			; ED 08 10 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	PEA $100A			; F4 0A 10 | Push effective address
	ORA $0CFE			; 0D FE 0C | Logical OR with accumulator
	BPL $854A			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $07			  ; 00 07 | Software interrupt
	SBC $F9			  ; E3 F9 | Unknown operation
	TSB $10			  ; 04 10 | Unknown operation
	INX				  ; E8 | Unknown operation
	SBC $06			  ; F1 06 | Unknown operation
	BPL $8543			; 10 F0 | Unknown operation
	CPX $1002			; EC 02 10 | Unknown operation
	SED				  ; F8 | Unknown operation
	NOP				  ; EA | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	BPL $855B			; 10 00 | Unknown operation

	BPL $855B			; 10 00
	INC $100A			; EE 0A 10
	PHP				  ; 08
	SBC $0C,X			; F5 0C
	BPL $8570			; 10 0D
	SBC $04100C,X		; FF 0C 10 04
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	SBC $FA			  ; E3 FA
	ASL $10			  ; 06 10
	INX				  ; E8
	SBC $02			  ; F2 02
	BPL $8564			; 10 F0
	SBC $1008			; ED 08 10
	SED				  ; F8
	XBA				  ; EB
	ASL				  ; 0A
	BPL $857C			; 10 00
	SBC $08100C		  ; EF 0C 10 08
	INC $0C,X			; F6 0C
	BPL $8591			; 10 0D
	BRK $0C			  ; 00 0C
	BPL $858C			; 10 04
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	SBC $FB			  ; E3 FB
	COP $10			  ; 02 10
	INX				  ; E8
	SBC $08			  ; F3 08
	BPL $8585			; 10 F0
	INC $100A			; EE 0A 10
	SED				  ; F8
	CPX $100C			; EC 0C 10
	BRK $F0			  ; 00 F0
	TSB $0810			; 0C 10 08
	SBC $0C			  ; F7 0C
	BPL $85B2			; 10 0D
	ORA $0C			  ; 01 0C
	BPL $85AD			; 10 04
	BRK $00			  ; 00 00
	BRK $06			  ; 00 06
	SBC $FC			  ; E3 FC
	PHP				  ; 08
	BPL $859A			; 10 E8
	PEA $100A			; F4 0A 10
	BEQ $85A7			; F0 F0
	TSB $F810			; 0C 10 F8
	INC $100C			; EE 0C 10
	BRK $F2			  ; 00 F2
	TSB $0810			; 0C 10 08
	SBC $100C,Y		  ; F9 0C 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA $E3			  ; 05 E3
	SBC $100A,X		  ; FD 0A 10
	INX				  ; E8
	SBC $0C,X			; F5 0C
	BPL $85C3			; 10 F0
	SBC $0C			  ; F1 0C
	BPL $85CF			; 10 F8
	SBC $00100C		  ; EF 0C 10 00
	SBC $0C			  ; F3 0C
	BPL $85E3			; 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	SBC $FE			  ; E3 FE
	TSB $E810			; 0C 10 E8
	INC $0C,X			; F6 0C
	BPL $85DC			; 10 F0
	SBC $0C			  ; F2 0C
	BPL $85E8			; 10 F8
	BEQ $85FE			; F0 0C
	BPL $85F8			; 10 04
	BRK $00			  ; 00 00
	BRK $01			  ; 00 01
	SBC $F8			  ; E3 F8
	COP $50			  ; 02 50
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00

;==============================================================================
; GeneralPurpose_06
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_06:
	COP $E8			  ; 02 E8 | Unknown operation
	SBC $E35002		  ; EF 02 50 E3 | Unknown operation
	SED				  ; F8 | Unknown operation
	TSB $50			  ; 04 50 | Unknown operation
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $F0			  ; 03 F0 | Logical OR with accumulator
	SBC #$02			 ; E9 02 | Unknown operation
	BVC $85FB			; 50 E8 | Unknown operation
	SBC $E35004		  ; EF 04 50 E3 | Unknown operation
	SBC $5006,Y		  ; F9 06 50 | Unknown operation
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	TSB $F8			  ; 04 F8 | Unknown operation
	INC $02			  ; E6 02 | Unknown operation
	BVC $8614			; 50 F0 | Unknown operation
	SBC #$04			 ; E9 04 | Unknown operation
	BVC $8610			; 50 E8 | Unknown operation
	BEQ $862E			; F0 04 | Branch if equal (zero flag set)
	BVC $860F			; 50 E3 | Unknown operation
	PLX				  ; FA | Pull X register from stack
	ASL $50			  ; 06 50 | Arithmetic shift left
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $00			  ; 05 00 | Logical OR with accumulator
	SBC #$02			 ; E9 02 | Unknown operation
	BVC $8631			; 50 F8 | Unknown operation
	INC $04			  ; E6 04 | Unknown operation
	BVC $862D			; 50 F0 | Unknown operation
	NOP				  ; EA | Unknown operation
	TSB $50			  ; 04 50 | Unknown operation
	INX				  ; E8 | Unknown operation
	SBC $06			  ; F1 06 | Unknown operation
	BVC $8628			; 50 E3 | Unknown operation
	XCE				  ; FB | Unknown operation
	COP $50			  ; 02 50 | Unknown operation
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ASL $08			  ; 06 08 | Arithmetic shift left
	SBC $005002		  ; EF 02 50 00 | Unknown operation
	SBC #$04			 ; E9 04 | Unknown operation
	BVC $864E			; 50 F8 | Unknown operation
	SBC $04			  ; E7 04 | Unknown operation
	BVC $864A			; 50 F0 | Unknown operation
	XBA				  ; EB | Exchange accumulator bytes
	ASL $50			  ; 06 50 | Arithmetic shift left
	INX				  ; E8 | Unknown operation
	SBC $02			  ; F2 02 | Unknown operation
	BVC $8645			; 50 E3 | Unknown operation

	BVC $8645			; 50 E3
	JSR ($5008,X)		; FC 08 50
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA $0D			  ; 07 0D
	SED				  ; F8
	COP $50			  ; 02 50
	PHP				  ; 08
	SBC $005004		  ; EF 04 50 00
	NOP				  ; EA
	TSB $50			  ; 04 50
	SED				  ; F8
	INX				  ; E8
	ASL $50			  ; 06 50
	BEQ $8668			; F0 EC
	COP $50			  ; 02 50
	INX				  ; E8
	SBC $08			  ; F3 08
	BVC $8666			; 50 E3
	SBC $500A,X		  ; FD 0A 50
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	ORA $0D			  ; 07 0D
	SED				  ; F8
	TSB $50			  ; 04 50
	PHP				  ; 08
	BEQ $8696			; F0 04
	BVC $8694			; 50 00
	XBA				  ; EB
	ASL $50			  ; 06 50
	SED				  ; F8
	SBC #$02			 ; E9 02
	BVC $868C			; 50 F0
	SBC $5008			; ED 08 50
	INX				  ; E8
	PEA $500A			; F4 0A 50
	SBC $FE			  ; E3 FE
	TSB $0450			; 0C 50 04
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	ORA $04F9			; 0D F9 04
	BVC $86B9			; 50 08
	SBC $06			  ; F1 06
	BVC $86B5			; 50 00
	CPX $5002			; EC 02 50
	SED				  ; F8
	NOP				  ; EA
	PHP				  ; 08
	BVC $86AD			; 50 F0
	INC $500A			; EE 0A 50
	INX				  ; E8
	SBC $0C,X			; F5 0C
	BVC $86A8			; 50 E3
	SBC $04500C,X		; FF 0C 50 04
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	ORA $06FA			; 0D FA 06
	BVC $86DA			; 50 08
	SBC $02			  ; F2 02
	BVC $86D6			; 50 00
	SBC $5008			; ED 08 50
	SED				  ; F8
	XBA				  ; EB
	ASL				  ; 0A
	BVC $86CE			; 50 F0
	SBC $E8500C		  ; EF 0C 50 E8
	INC $0C,X			; F6 0C
	BVC $86C9			; 50 E3
	BRK $0C			  ; 00 0C
	BVC $86EE			; 50 04
	BRK $00			  ; 00 00
	BRK $07			  ; 00 07
	ORA $02FB			; 0D FB 02
	BVC $86FB			; 50 08
	SBC $08			  ; F3 08
	BVC $86F7			; 50 00
	INC $500A			; EE 0A 50
	SED				  ; F8
	CPX $500C			; EC 0C 50
	BEQ $86F0			; F0 F0

;==============================================================================
; GeneralPurpose_07
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_07:
	TSB $E850			; 0C 50 E8 | Unknown operation
	SBC $0C			  ; F7 0C | Unknown operation
	BVC $86EA			; 50 E3 | Unknown operation
	ORA $0C			  ; 01 0C | Logical OR with accumulator
	BVC $870F			; 50 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $06			  ; 00 06 | Software interrupt
	ORA $08FC			; 0D FC 08 | Logical OR with accumulator
	BVC $871C			; 50 08 | Unknown operation
	PEA $500A			; F4 0A 50 | Push effective address
	BRK $F0			  ; 00 F0 | Software interrupt
	TSB $F850			; 0C 50 F8 | Unknown operation
	INC $500C			; EE 0C 50 | Unknown operation
	BEQ $8713			; F0 F2 | Branch if equal (zero flag set)
	TSB $E850			; 0C 50 E8 | Unknown operation
	SBC $500C,Y		  ; F9 0C 50 | Unknown operation
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	ORA $0D			  ; 05 0D | Logical OR with accumulator
	SBC $500A,X		  ; FD 0A 50 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	SBC $0C,X			; F5 0C | Unknown operation
	BVC $8735			; 50 00 | Unknown operation
	SBC $0C			  ; F1 0C | Unknown operation
	BVC $8731			; 50 F8 | Unknown operation
	SBC $F0500C		  ; EF 0C 50 F0 | Unknown operation
	SBC $0C			  ; F3 0C | Unknown operation
	BVC $8745			; 50 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $04			  ; 00 04 | Software interrupt
	ORA $0CFE			; 0D FE 0C | Logical OR with accumulator
	BVC $8752			; 50 08 | Unknown operation
	INC $0C,X			; F6 0C | Unknown operation
	BVC $874E			; 50 00 | Unknown operation
	SBC $0C			  ; F2 0C | Unknown operation
	BVC $874A			; 50 F8 | Unknown operation
	BEQ $8760			; F0 0C | Branch if equal (zero flag set)
	BVC $87C0			; 50 6A | Unknown operation
	STA $F5			  ; 87 F5 | Store accumulator to memory
	PHB				  ; 8B | Push data bank register
	STA $F5			  ; 87 F5 | Store accumulator to memory
	LDY $F587			; AC 87 F5 | Load Y register
	CMP $F587			; CD 87 F5 | Compare with accumulator
	INC $F587			; EE 87 F5 | Unknown operation
	ORA $30F588		  ; 0F 88 F5 30 | Logical OR with accumulator
	DEY				  ; 88 | Unknown operation
	SBC $00,X			; F5 00 | Unknown operation
	COP $00			  ; 02 00 | Unknown operation
	BRK $01			  ; 00 01 | Software interrupt

	BRK $01			  ; 00 01
	COP $00			  ; 02 00
	BRK $02			  ; 00 02
	COP $00			  ; 02 00
	BRK $03			  ; 00 03
	COP $00			  ; 02 00
	BRK $04			  ; 00 04
	COP $00			  ; 02 00
	BRK $05			  ; 00 05
	COP $00			  ; 02 00
	BRK $06			  ; 00 06
	COP $00			  ; 02 00
	BRK $07			  ; 00 07
	COP $00			  ; 02 00
	BRK $FF			  ; 00 FF
	PHP				  ; 08
	COP $00			  ; 02 00
	BRK $09			  ; 00 09
	COP $00			  ; 02 00
	BRK $0A			  ; 00 0A
	COP $00			  ; 02 00
	BRK $0B			  ; 00 0B
	COP $00			  ; 02 00
	BRK $0C			  ; 00 0C
	COP $00			  ; 02 00
	BRK $0D			  ; 00 0D
	COP $00			  ; 02 00
	BRK $0E			  ; 00 0E
	COP $00			  ; 02 00
	BRK $0F			  ; 00 0F
	COP $00			  ; 02 00
	BRK $FF			  ; 00 FF
	BPL $87B0			; 10 02
	BRK $00			  ; 00 00
	ORA $02			  ; 11 02
	BRK $00			  ; 00 00
	ORA $02			  ; 12 02
	BRK $00			  ; 00 00
	ORA $02			  ; 13 02
	BRK $00			  ; 00 00
	TRB $02			  ; 14 02
	BRK $00			  ; 00 00
	ORA $02,X			; 15 02
	BRK $00			  ; 00 00
	ASL $02,X			; 16 02
	BRK $00			  ; 00 00
	ORA $02			  ; 17 02
	BRK $00			  ; 00 00
	SBC $000218,X		; FF 18 02 00
	BRK $19			  ; 00 19
	COP $00			  ; 02 00
	BRK $1A			  ; 00 1A
	COP $00			  ; 02 00
	BRK $1B			  ; 00 1B
	COP $00			  ; 02 00
	BRK $1C			  ; 00 1C
	COP $00			  ; 02 00
	BRK $1D			  ; 00 1D
	COP $00			  ; 02 00
	BRK $1E			  ; 00 1E
	COP $00			  ; 02 00
	BRK $1F			  ; 00 1F
	COP $00			  ; 02 00
	BRK $FF			  ; 00 FF
	JSR $0002			; 20 02 00
	BRK $21			  ; 00 21
	COP $00			  ; 02 00
	BRK $22			  ; 00 22
	COP $00			  ; 02 00
	BRK $23			  ; 00 23
	COP $00			  ; 02 00
	BRK $24			  ; 00 24
	COP $00			  ; 02 00
	BRK $25			  ; 00 25
	COP $00			  ; 02 00
	BRK $26			  ; 00 26
	COP $00			  ; 02 00
	BRK $27			  ; 00 27
	COP $00			  ; 02 00
	BRK $FF			  ; 00 FF
	PLP				  ; 28
	COP $00			  ; 02 00
	BRK $29			  ; 00 29
	COP $00			  ; 02 00
	BRK $2A			  ; 00 2A
	COP $00			  ; 02 00
	BRK $2B			  ; 00 2B
	COP $00			  ; 02 00
	BRK $2C			  ; 00 2C
	COP $00			  ; 02 00
	BRK $2D			  ; 00 2D
	COP $00			  ; 02 00
	BRK $2E			  ; 00 2E
	COP $00			  ; 02 00
	BRK $2F			  ; 00 2F
	COP $00			  ; 02 00
	BRK $FF			  ; 00 FF
	BMI $8833			; 30 01
	BRK $00			  ; 00 00
	AND $01			  ; 31 01
	BRK $00			  ; 00 00
	AND $01			  ; 32 01
	BRK $00			  ; 00 00
	AND $01			  ; 33 01
	BRK $00			  ; 00 00
	BIT $01,X			; 34 01
	BRK $00			  ; 00 00
	AND $01,X			; 35 01
	BRK $00			  ; 00 00
	ROL $01,X			; 36 01
	BRK $00			  ; 00 00
	AND $01			  ; 37 01
	BRK $00			  ; 00 00
	SEC				  ; 38
	ORA $00			  ; 01 00
	BRK $39			  ; 00 39
	ORA $00			  ; 01 00
	BRK $3A			  ; 00 3A
	ORA $00			  ; 01 00
	BRK $3B			  ; 00 3B
	ORA $00			  ; 01 00
	BRK $3C			  ; 00 3C
	ORA $00			  ; 01 00
	BRK $3D			  ; 00 3D
	ORA $00			  ; 01 00
	BRK $3E			  ; 00 3E
	ORA $00			  ; 01 00
	BRK $3F			  ; 00 3F
	ORA $00			  ; 01 00
	BRK $40			  ; 00 40
	ORA $00			  ; 01 00
	BRK $41			  ; 00 41
	ORA $00			  ; 01 00
	BRK $42			  ; 00 42
	ORA $00			  ; 01 00
	BRK $43			  ; 00 43
	ORA $00			  ; 01 00
	BRK $44			  ; 00 44
	ORA $00			  ; 01 00
	BRK $45			  ; 00 45
	ORA $00			  ; 01 00
	BRK $FF			  ; 00 FF
	TCD				  ; 5B
	BIT #$F5			 ; 89 F5
	TXA				  ; 8A
	TXA				  ; 8A
	SBC $9F,X			; F5 9F
	TXA				  ; 8A
	SBC $B4,X			; F5 B4
	TXA				  ; 8A
	SBC $C9,X			; F5 C9
	TXA				  ; 8A
	SBC $F2,X			; F5 F2
	TXA				  ; 8A
	SBC $07,X			; F5 07
	PHB				  ; 8B
	SBC $1C,X			; F5 1C
	PHB				  ; 8B
	SBC $31,X			; F5 31
	PHB				  ; 8B
	SBC $5A,X			; F5 5A
	PHB				  ; 8B
	SBC $6F,X			; F5 6F
	PHB				  ; 8B
	SBC $84,X			; F5 84
	PHB				  ; 8B
	SBC $99,X			; F5 99
	PHB				  ; 8B
	SBC $C2,X			; F5 C2
	PHB				  ; 8B
	SBC $D7,X			; F5 D7
	PHB				  ; 8B
	SBC $EC,X			; F5 EC
	PHB				  ; 8B
	SBC $01,X			; F5 01
	STY $2AF5			; 8C F5 2A
	STY $3FF5			; 8C F5 3F
	STY $54F5			; 8C F5 54
	STY $69F5			; 8C F5 69
	STY $92F5			; 8C F5 92
	STY $A7F5			; 8C F5 A7
	STY $BCF5			; 8C F5 BC
	STY $D1F5			; 8C F5 D1
	STY $FAF5			; 8C F5 FA
	STY $0FF5			; 8C F5 0F
	STA $24F5			; 8D F5 24
	STA $39F5			; 8D F5 39
	STA $62F5			; 8D F5 62
	STA $77F5			; 8D F5 77
	STA $8CF5			; 8D F5 8C
	STA $A1F5			; 8D F5 A1
	STA $CAF5			; 8D F5 CA
	STA $DFF5			; 8D F5 DF
	STA $F4F5			; 8D F5 F4
	STA $09F5			; 8D F5 09
	STX $32F5			; 8E F5 32
	STX $47F5			; 8E F5 47
	STX $5CF5			; 8E F5 5C
	STX $71F5			; 8E F5 71
	STX $9AF5			; 8E F5 9A
	STX $AFF5			; 8E F5 AF
	STX $C4F5			; 8E F5 C4
	STX $D9F5			; 8E F5 D9
	STX $02F5			; 8E F5 02
	STA $8F17F5		  ; 8F F5 17 8F
	SBC $2C,X			; F5 2C
	STA $8F41F5		  ; 8F F5 41 8F
	SBC $5E,X			; F5 5E
	STA $8F73F5		  ; 8F F5 73 8F
	SBC $88,X			; F5 88
	STA $8F9DF5		  ; 8F F5 9D 8F
	SBC $C2,X			; F5 C2
	STA $8FE7F5		  ; 8F F5 E7 8F
	SBC $0C,X			; F5 0C
	BCC $8926			; 90 F5
	AND $90			  ; 31 90
	SBC $56,X			; F5 56
	BCC $892C			; 90 F5
	TDC				  ; 7B
	BCC $892F			; 90 F5
	LDY #$90			 ; A0 90
	SBC $C5,X			; F5 C5
	BCC $8935			; 90 F5
	NOP				  ; EA
	BCC $8938			; 90 F5
	ORA $34F591		  ; 0F 91 F5 34
	STA $F5			  ; 91 F5
	EOR $F591,Y		  ; 59 91 F5
	ROR $F591,X		  ; 7E 91 F5
	LDA $91			  ; A3 91
	SBC $C8,X			; F5 C8
	STA $F5			  ; 91 F5
	SBC $F591			; ED 91 F5
	ORA $92			  ; 12 92
	SBC $0A,X			; F5 0A
	ORA $92			  ; 01 92
	BRK $14			  ; 00 14
	TAX				  ; AA
	ORA $AA,X			; 15 AA
	PHD				  ; 0B
	TAX				  ; AA
	ASL				  ; 0A
	TAX				  ; AA
	SBC $16A9,X		  ; FD A9 16
	TAX				  ; AA
	TRB $22AA			; 1C AA 22
	TAX				  ; AA
	AND $AA			  ; 21 AA
	JSR $F7AA			; 20 AA F7
	LDA #$F8			 ; A9 F8
	LDA #$F9			 ; A9 F9
	LDA #$FA			 ; A9 FA
	LDA #$45			 ; A9 45
	TAX				  ; AA
	LSR $AA			  ; 46 AA
	INC				  ; 1A
	TAX				  ; AA
	TCS				  ; 1B
	TAX				  ; AA
	BIT $3BAA,X		  ; 3C AA 3B
	TAX				  ; AA
	BIT $47AA			; 2C AA 47
	TAX				  ; AA
	EOR $53AA			; 4D AA 53
	TAX				  ; AA
	EOR $AA			  ; 52 AA
	EOR $AA			  ; 51 AA
	ORA $AA			  ; 05 AA
	ASL $AA			  ; 06 AA
	ORA $AA			  ; 07 AA
	PHP				  ; 08
	TAX				  ; AA
	PHK				  ; 4B
	TAX				  ; AA
	JMP $26AA			; 4C AA 26
	TAX				  ; AA
	AND $AA			  ; 27 AA
	PLP				  ; 28
	TAX				  ; AA
	AND #$AA			 ; 29 AA
	ADC $AA			  ; 71 AA
	ADC $AA			  ; 72 AA
	ROR				  ; 6A
	TAX				  ; AA
	ADC #$AA			 ; 69 AA
	EOR $73AA,X		  ; 5D AA 73
	TAX				  ; AA
	ADC $7FAA,Y		  ; 79 AA 7F
	TAX				  ; AA
	ROR $7DAA,X		  ; 7E AA 7D
	TAX				  ; AA
	EOR $AA			  ; 57 AA
	CLI				  ; 58
	TAX				  ; AA
	AND $AA,X			; 35 AA
	ROL $AA,X			; 36 AA
	AND $AA			  ; 37 AA
	SEC				  ; 38
	TAX				  ; AA
	ADC $AA			  ; 77 AA
	SEI				  ; 78
	TAX				  ; AA
	ORA $AA			  ; 13 AA
	ORA $AA			  ; 12 AA
	TSB $AA			  ; 04 AA
	ORA $1FAA,Y		  ; 19 AA 1F
	TAX				  ; AA
	AND $AA			  ; 25 AA
	BIT $AA			  ; 24 AA
	AND $AA			  ; 23 AA
	ADC $AA			  ; 63 AA
	STZ $AA			  ; 64 AA
	EOR $5AAA,Y		  ; 59 AA 5A
	TAX				  ; AA
	ORA $AA			  ; 17 AA
	CLC				  ; 18
	TAX				  ; AA
	INC $FFA9,X		  ; FE A9 FF
	LDA #$00			 ; A9 00
	TAX				  ; AA
	ORA $AA			  ; 01 AA
	PHA				  ; 48
	TAX				  ; AA
	EOR #$AA			 ; 49 AA
	MVP $43AA			; 44 AA 43
	TAX				  ; AA
	AND $AA			  ; 33 AA
	LSR				  ; 4A
	TAX				  ; AA
	BVC $89A7			; 50 AA
	LSR $AA,X			; 56 AA
	ADC $AA			  ; 65 AA
	ROR $AA			  ; 66 AA
	ORA $1EAA,X		  ; 1D AA 1E
	TAX				  ; AA
	TSB $0DAA			; 0C AA 0D
	TAX				  ; AA
	ASL $0FAA			; 0E AA 0F
	TAX				  ; AA
	LSR $4FAA			; 4E AA 4F
	TAX				  ; AA
	EOR $AA,X			; 55 AA
	MVN $70AA			; 54 AA 70
	TAX				  ; AA
	ADC $AA62AA		  ; 6F AA 62 AA
	ROR $AA,X			; 76 AA
	AND $2EAA			; 2D AA 2E
	TAX				  ; AA
	AND $AA30AA		  ; 2F AA 30 AA
	STZ $AA,X			; 74 AA
	ADC $AA,X			; 75 AA
	JMP ($82AA,X)		; 7C AA 82
	TAX				  ; AA
	STA $AA			  ; 81 AA
	BRA $89DD			; 80 AA
	LSR $5FAA,X		  ; 5E AA 5F
	TAX				  ; AA
	RTS				  ; 60
	TAX				  ; AA
	ADC $AA			  ; 61 AA
	COP $AA			  ; 02 AA
	ORA $AA			  ; 03 AA
	AND $3EAA,X		  ; 3D AA 3E
	TAX				  ; AA
	AND $AA40AA,X		; 3F AA 40 AA
	PLY				  ; 7A
	TAX				  ; AA
	TDC				  ; 7B
	TAX				  ; AA
	BIT $AA,X			; 34 AA
	ORA $FF			  ; 03 FF
	RTL				  ; 6B
	TAX				  ; AA
	JMP ($6DAA)		  ; 6C AA 6D
	TAX				  ; AA
	ROR $10AA			; 6E AA 10
	TAX				  ; AA
	ORA $AA			  ; 11 AA
	ROL				  ; 2A
	TAX				  ; AA
	PLD				  ; 2B
	TAX				  ; AA
	ASL $39FF			; 0E FF 39
	TAX				  ; AA
	DEC				  ; 3A
	TAX				  ; AA
	ORA #$FC			 ; 09 FC
	PHP				  ; 08
	COP $00			  ; 02 00
	PEA $0300			; F4 00 03
	BRK $FE			  ; 00 FE
	SBC $04			  ; F2 04
	BRK $04			  ; 00 04
	PEA $0005			; F4 05 00
	TSB $FC			  ; 04 FC
	ASL $00			  ; 06 00
	TSB $04			  ; 04 04
	ORA $00			  ; 07 00
	JSR ($0804,X)		; FC 04 08
	BRK $F4			  ; 00 F4
	TSB $09			  ; 04 09
	BRK $F4			  ; 00 F4
	PEA $1000			; F4 00 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	TSB $FC			  ; 04 FC
	PHP				  ; 08
	COP $00			  ; 02 00
	PEA $0400			; F4 00 04
	BRK $FE			  ; 00 FE
	SBC $04			  ; F2 04
	BRK $F8			  ; 00 F8
	SED				  ; F8
	ASL				  ; 0A
	BPL $8AA4			; 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($0308,X)		; FC 08 03
	BRK $F4			  ; 00 F4
	BRK $04			  ; 00 04
	BRK $FE			  ; 00 FE
	SBC $03			  ; F2 03
	BRK $F8			  ; 00 F8
	SED				  ; F8
	TSB $0410			; 0C 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($0308,X)		; FC 08 03
	BRK $F4			  ; 00 F4
	BRK $03			  ; 00 03
	BRK $FE			  ; 00 FE
	SBC $03			  ; F2 03
	BRK $F8			  ; 00 F8
	SED				  ; F8
	ASL				  ; 0A
	BPL $8ACE			; 10 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	JSR ($0408,X)		; FC 08 04
	BRK $F4			  ; 00 F4
	BRK $03			  ; 00 03
	BRK $FE			  ; 00 FE
	SBC $02			  ; F2 02
	BRK $04			  ; 00 04
	PEA $0005			; F4 05 00
	TSB $FC			  ; 04 FC
	ASL $00			  ; 06 00
	TSB $04			  ; 04 04
	ORA $00			  ; 07 00
	JSR ($0804,X)		; FC 04 08
	BRK $F4			  ; 00 F4
	TSB $09			  ; 04 09
	BRK $F4			  ; 00 F4
	PEA $1000			; F4 00 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	TSB $FC			  ; 04 FC
	PHP				  ; 08
	TSB $00			  ; 04 00
	PEA $0200			; F4 00 02
	BRK $FE			  ; 00 FE

;==============================================================================
; GeneralPurpose_0B
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0B:
	SBC $02			  ; F2 02 | Unknown operation
	BRK $F8			  ; 00 F8 | Software interrupt
	SED				  ; F8 | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	BPL $8B0C			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $04			  ; 00 04 | Software interrupt
	JSR ($0308,X)		; FC 08 03 | Call local function
	BRK $F4			  ; 00 F4 | Software interrupt
	BRK $02			  ; 00 02 | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	SBC $03			  ; F2 03 | Unknown operation
	BRK $F8			  ; 00 F8 | Software interrupt
	SED				  ; F8 | Unknown operation
	TSB $0410			; 0C 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $04			  ; 00 04 | Software interrupt
	JSR ($0308,X)		; FC 08 03 | Call local function
	BRK $F4			  ; 00 F4 | Software interrupt
	BRK $03			  ; 00 03 | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	SBC $03			  ; F2 03 | Unknown operation
	BRK $F8			  ; 00 F8 | Software interrupt
	SED				  ; F8 | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	BPL $8B36			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $09			  ; 00 09 | Software interrupt
	JSR ($1208,X)		; FC 08 12 | Call local function
	BRK $F4			  ; 00 F4 | Software interrupt
	BRK $13			  ; 00 13 | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	SBC $14			  ; F2 14 | Unknown operation
	BRK $04			  ; 00 04 | Software interrupt
	PEA $0015			; F4 15 00 | Push effective address
	TSB $FC			  ; 04 FC | Unknown operation
	ASL $00,X			; 16 00 | Arithmetic shift left
	TSB $04			  ; 04 04 | Unknown operation
	ORA $00			  ; 17 00 | Logical OR with accumulator
	JSR ($1804,X)		; FC 04 18 | Call local function
	BRK $F4			  ; 00 F4 | Software interrupt
	TSB $19			  ; 04 19 | Unknown operation
	BRK $F4			  ; 00 F4 | Software interrupt
	PEA $100E			; F4 0E 10 | Push effective address
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	TSB $FC			  ; 04 FC | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 12 00 | Logical OR with accumulator

	ORA $00			  ; 12 00
	PEA $1400			; F4 00 14
	BRK $FE			  ; 00 FE
	SBC $14			  ; F2 14
	BRK $F8			  ; 00 F8
	SED				  ; F8
	JSR $0410			; 20 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($1308,X)		; FC 08 13
	BRK $F4			  ; 00 F4
	BRK $14			  ; 00 14
	BRK $FE			  ; 00 FE
	SBC $13			  ; F2 13
	BRK $F8			  ; 00 F8
	SED				  ; F8
	JSL $000410		  ; 22 10 04 00
	BRK $00			  ; 00 00
	TSB $FC			  ; 04 FC
	PHP				  ; 08
	ORA $00			  ; 13 00
	PEA $1300			; F4 00 13
	BRK $FE			  ; 00 FE
	SBC $13			  ; F2 13
	BRK $F8			  ; 00 F8
	SED				  ; F8
	JSR $0410			; 20 10 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	JSR ($1408,X)		; FC 08 14
	BRK $F4			  ; 00 F4
	BRK $13			  ; 00 13
	BRK $FE			  ; 00 FE
	SBC $12			  ; F2 12
	BRK $04			  ; 00 04
	PEA $0015			; F4 15 00
	TSB $FC			  ; 04 FC
	ASL $00,X			; 16 00
	TSB $04			  ; 04 04
	ORA $00			  ; 17 00
	JSR ($1804,X)		; FC 04 18
	BRK $F4			  ; 00 F4
	TSB $19			  ; 04 19
	BRK $F4			  ; 00 F4
	PEA $100E			; F4 0E 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	TSB $FC			  ; 04 FC
	PHP				  ; 08
	TRB $00			  ; 14 00
	PEA $1200			; F4 00 12
	BRK $FE			  ; 00 FE
	SBC $12			  ; F2 12
	BRK $F8			  ; 00 F8
	SED				  ; F8
	JSR $0410			; 20 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($1308,X)		; FC 08 13
	BRK $F4			  ; 00 F4
	BRK $12			  ; 00 12
	BRK $FE			  ; 00 FE
	SBC $13			  ; F2 13
	BRK $F8			  ; 00 F8
	SED				  ; F8
	JSL $000410		  ; 22 10 04 00
	BRK $00			  ; 00 00
	TSB $FC			  ; 04 FC
	PHP				  ; 08
	ORA $00			  ; 13 00
	PEA $1300			; F4 00 13
	BRK $FE			  ; 00 FE
	SBC $13			  ; F2 13
	BRK $F8			  ; 00 F8
	SED				  ; F8
	JSR $0410			; 20 10 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	JSR ($2608,X)		; FC 08 26
	BRK $F4			  ; 00 F4
	BRK $27			  ; 00 27
	BRK $FE			  ; 00 FE
	SBC $28			  ; F2 28
	BRK $04			  ; 00 04
	PEA $0029			; F4 29 00
	TSB $FC			  ; 04 FC
	ROL				  ; 2A
	BRK $04			  ; 00 04
	TSB $2B			  ; 04 2B
	BRK $FC			  ; 00 FC
	TSB $2C			  ; 04 2C
	BRK $F4			  ; 00 F4
	TSB $2D			  ; 04 2D
	BRK $F4			  ; 00 F4
	PEA $1024			; F4 24 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	TSB $FC			  ; 04 FC
	PHP				  ; 08
	ROL $00			  ; 26 00
	PEA $2800			; F4 00 28
	BRK $FE			  ; 00 FE
	SBC $28			  ; F2 28
	BRK $F8			  ; 00 F8
	SED				  ; F8
	ROL $0410			; 2E 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($2708,X)		; FC 08 27
	BRK $F4			  ; 00 F4
	BRK $28			  ; 00 28
	BRK $FE			  ; 00 FE
	SBC $27			  ; F2 27
	BRK $F8			  ; 00 F8
	SED				  ; F8
	RTI				  ; 40
	BPL $8C59			; 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($2708,X)		; FC 08 27
	BRK $F4			  ; 00 F4
	BRK $27			  ; 00 27
	BRK $FE			  ; 00 FE
	SBC $27			  ; F2 27
	BRK $F8			  ; 00 F8
	SED				  ; F8
	ROL $0410			; 2E 10 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	JSR ($2808,X)		; FC 08 28
	BRK $F4			  ; 00 F4
	BRK $27			  ; 00 27
	BRK $FE			  ; 00 FE
	SBC $26			  ; F2 26
	BRK $04			  ; 00 04
	PEA $0029			; F4 29 00
	TSB $FC			  ; 04 FC
	ROL				  ; 2A
	BRK $04			  ; 00 04
	TSB $2B			  ; 04 2B
	BRK $FC			  ; 00 FC
	TSB $2C			  ; 04 2C
	BRK $F4			  ; 00 F4
	TSB $2D			  ; 04 2D
	BRK $F4			  ; 00 F4
	PEA $1024			; F4 24 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	TSB $FC			  ; 04 FC
	PHP				  ; 08
	PLP				  ; 28
	BRK $F4			  ; 00 F4
	BRK $26			  ; 00 26
	BRK $FE			  ; 00 FE
	SBC $26			  ; F2 26
	BRK $F8			  ; 00 F8
	SED				  ; F8
	ROL $0410			; 2E 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($2708,X)		; FC 08 27
	BRK $F4			  ; 00 F4
	BRK $26			  ; 00 26
	BRK $FE			  ; 00 FE
	SBC $27			  ; F2 27
	BRK $F8			  ; 00 F8
	SED				  ; F8
	RTI				  ; 40
	BPL $8CC1			; 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($2708,X)		; FC 08 27
	BRK $F4			  ; 00 F4
	BRK $27			  ; 00 27
	BRK $FE			  ; 00 FE
	SBC $27			  ; F2 27
	BRK $F8			  ; 00 F8
	SED				  ; F8
	ROL $0410			; 2E 10 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	JSR ($3608,X)		; FC 08 36
	BRK $F4			  ; 00 F4
	BRK $37			  ; 00 37
	BRK $FE			  ; 00 FE
	SBC $38			  ; F2 38
	BRK $04			  ; 00 04
	PEA $0039			; F4 39 00
	TSB $FC			  ; 04 FC
	DEC				  ; 3A
	BRK $04			  ; 00 04
	TSB $3B			  ; 04 3B
	BRK $FC			  ; 00 FC
	TSB $3C			  ; 04 3C
	BRK $F4			  ; 00 F4
	TSB $3D			  ; 04 3D
	BRK $F4			  ; 00 F4
	PEA $1042			; F4 42 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	TSB $FC			  ; 04 FC

;==============================================================================
; GeneralPurpose_0D
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0D:
	PHP				  ; 08 | Push processor status to stack
	ROL $00,X			; 36 00 | Unknown operation
	PEA $3800			; F4 00 38 | Push effective address
	BRK $FE			  ; 00 FE | Software interrupt
	SBC $38			  ; F2 38 | Unknown operation
	BRK $F8			  ; 00 F8 | Software interrupt
	SED				  ; F8 | Unknown operation
	MVP $0410			; 44 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $04			  ; 00 04 | Software interrupt
	JSR ($3708,X)		; FC 08 37 | Call local function
	BRK $F4			  ; 00 F4 | Software interrupt
	BRK $38			  ; 00 38 | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	SBC $37			  ; F2 37 | Unknown operation
	BRK $F8			  ; 00 F8 | Software interrupt
	SED				  ; F8 | Unknown operation
	LSR $10			  ; 46 10 | Unknown operation
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	TSB $FC			  ; 04 FC | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	AND $00			  ; 37 00 | Logical AND with accumulator
	PEA $3700			; F4 00 37 | Push effective address
	BRK $FE			  ; 00 FE | Software interrupt
	SBC $37			  ; F2 37 | Unknown operation
	BRK $F8			  ; 00 F8 | Software interrupt
	SED				  ; F8 | Unknown operation
	MVP $0410			; 44 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $09			  ; 00 09 | Software interrupt
	JSR ($3808,X)		; FC 08 38 | Call local function
	BRK $F4			  ; 00 F4 | Software interrupt
	BRK $37			  ; 00 37 | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	SBC $36			  ; F2 36 | Unknown operation
	BRK $04			  ; 00 04 | Software interrupt
	PEA $0039			; F4 39 00 | Push effective address
	TSB $FC			  ; 04 FC | Unknown operation
	DEC				  ; 3A | Unknown operation
	BRK $04			  ; 00 04 | Software interrupt
	TSB $3B			  ; 04 3B | Unknown operation
	BRK $FC			  ; 00 FC | Software interrupt
	TSB $3C			  ; 04 3C | Unknown operation
	BRK $F4			  ; 00 F4 | Software interrupt
	TSB $3D			  ; 04 3D | Unknown operation
	BRK $F4			  ; 00 F4 | Software interrupt
	PEA $1042			; F4 42 10 | Push effective address
	TSB $00			  ; 04 00 | Unknown operation

	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	TSB $FC			  ; 04 FC
	PHP				  ; 08
	SEC				  ; 38
	BRK $F4			  ; 00 F4
	BRK $36			  ; 00 36
	BRK $FE			  ; 00 FE
	SBC $36			  ; F2 36
	BRK $F8			  ; 00 F8
	SED				  ; F8
	MVP $0410			; 44 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($3708,X)		; FC 08 37
	BRK $F4			  ; 00 F4
	BRK $36			  ; 00 36
	BRK $FE			  ; 00 FE
	SBC $37			  ; F2 37
	BRK $F8			  ; 00 F8
	SED				  ; F8
	LSR $10			  ; 46 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	TSB $FC			  ; 04 FC
	PHP				  ; 08
	AND $00			  ; 37 00
	PEA $3700			; F4 00 37
	BRK $FE			  ; 00 FE
	SBC $37			  ; F2 37
	BRK $F8			  ; 00 F8
	SED				  ; F8
	MVP $0410			; 44 10 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	JSR ($4A08,X)		; FC 08 4A
	BRK $F4			  ; 00 F4
	BRK $4B			  ; 00 4B
	BRK $FE			  ; 00 FE
	SBC $4C			  ; F2 4C
	BRK $04			  ; 00 04
	PEA $004D			; F4 4D 00
	TSB $FC			  ; 04 FC
	LSR $0400			; 4E 00 04
	TSB $4F			  ; 04 4F
	BRK $FC			  ; 00 FC
	TSB $5A			  ; 04 5A
	BRK $F4			  ; 00 F4
	TSB $5B			  ; 04 5B
	BRK $F4			  ; 00 F4
	PEA $1048			; F4 48 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	TSB $FC			  ; 04 FC
	PHP				  ; 08
	LSR				  ; 4A
	BRK $F4			  ; 00 F4
	BRK $4C			  ; 00 4C
	BRK $FE			  ; 00 FE
	SBC $4C			  ; F2 4C
	BRK $F8			  ; 00 F8
	SED				  ; F8
	RTS				  ; 60
	BPL $8DE4			; 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($4B08,X)		; FC 08 4B
	BRK $F4			  ; 00 F4
	BRK $4C			  ; 00 4C
	BRK $FE			  ; 00 FE
	SBC $4B			  ; F2 4B
	BRK $F8			  ; 00 F8
	SED				  ; F8
	PER $0410			; 62 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($4B08,X)		; FC 08 4B
	BRK $F4			  ; 00 F4
	BRK $4B			  ; 00 4B

;==============================================================================
; GeneralPurpose_0E
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_0E:
	BRK $FE			  ; 00 FE | Software interrupt
	SBC $4B			  ; F2 4B | Unknown operation
	BRK $F8			  ; 00 F8 | Software interrupt
	SED				  ; F8 | Unknown operation
	RTS				  ; 60 | Return from local function
	BPL $8E0E			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $09			  ; 00 09 | Software interrupt
	JSR ($4C08,X)		; FC 08 4C | Call local function
	BRK $F4			  ; 00 F4 | Software interrupt
	BRK $4B			  ; 00 4B | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	SBC $4A			  ; F2 4A | Unknown operation
	BRK $04			  ; 00 04 | Software interrupt
	PEA $004D			; F4 4D 00 | Push effective address
	TSB $FC			  ; 04 FC | Unknown operation
	LSR $0400			; 4E 00 04 | Unknown operation
	TSB $4F			  ; 04 4F | Unknown operation
	BRK $FC			  ; 00 FC | Software interrupt
	TSB $5A			  ; 04 5A | Unknown operation
	BRK $F4			  ; 00 F4 | Software interrupt
	TSB $5B			  ; 04 5B | Unknown operation
	BRK $F4			  ; 00 F4 | Software interrupt
	PEA $1048			; F4 48 10 | Push effective address
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	TSB $FC			  ; 04 FC | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	JMP $F400			; 4C 00 F4 | Unknown operation
	BRK $4A			  ; 00 4A | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	SBC $4A			  ; F2 4A | Unknown operation
	BRK $F8			  ; 00 F8 | Software interrupt
	SED				  ; F8 | Unknown operation
	RTS				  ; 60 | Return from local function
	BPL $8E4C			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $04			  ; 00 04 | Software interrupt
	JSR ($4B08,X)		; FC 08 4B | Call local function
	BRK $F4			  ; 00 F4 | Software interrupt
	BRK $4A			  ; 00 4A | Software interrupt
	BRK $FE			  ; 00 FE | Software interrupt
	SBC $4B			  ; F2 4B | Unknown operation
	BRK $F8			  ; 00 F8 | Software interrupt
	SED				  ; F8 | Unknown operation
	PER $0410			; 62 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $04			  ; 00 04 | Software interrupt
	JSR ($4B08,X)		; FC 08 4B | Call local function

	JSR ($4B08,X)		; FC 08 4B
	BRK $F4			  ; 00 F4
	BRK $4B			  ; 00 4B
	BRK $FE			  ; 00 FE
	SBC $4B			  ; F2 4B
	BRK $F8			  ; 00 F8
	SED				  ; F8
	RTS				  ; 60
	BPL $8E76			; 10 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	JSR ($5C08,X)		; FC 08 5C
	BRK $F4			  ; 00 F4
	BRK $5D			  ; 00 5D
	BRK $FE			  ; 00 FE
	SBC $5E			  ; F2 5E
	BRK $04			  ; 00 04
	PEA $005F			; F4 5F 00
	TSB $FC			  ; 04 FC
	ROR $00			  ; 66 00
	TSB $04			  ; 04 04
	ADC $00			  ; 67 00
	JSR ($6804,X)		; FC 04 68
	BRK $F4			  ; 00 F4
	TSB $69			  ; 04 69
	BRK $F4			  ; 00 F4
	PEA $1064			; F4 64 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	TSB $FC			  ; 04 FC
	PHP				  ; 08
	JMP $00F400		  ; 5C 00 F4 00
	LSR $FE00,X		  ; 5E 00 FE
	SBC $5E			  ; F2 5E
	BRK $F8			  ; 00 F8
	SED				  ; F8
	ROR				  ; 6A
	BPL $8EB4			; 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($5D08,X)		; FC 08 5D
	BRK $F4			  ; 00 F4
	BRK $5E			  ; 00 5E
	BRK $FE			  ; 00 FE
	SBC $5D			  ; F2 5D
	BRK $F8			  ; 00 F8
	SED				  ; F8
	JMP ($0410)		  ; 6C 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($5D08,X)		; FC 08 5D
	BRK $F4			  ; 00 F4
	BRK $5D			  ; 00 5D
	BRK $FE			  ; 00 FE
	SBC $5D			  ; F2 5D
	BRK $F8			  ; 00 F8
	SED				  ; F8
	ROR				  ; 6A
	BPL $8EDE			; 10 04
	BRK $00			  ; 00 00
	BRK $09			  ; 00 09
	JSR ($5E08,X)		; FC 08 5E
	BRK $F4			  ; 00 F4
	BRK $5D			  ; 00 5D
	BRK $FE			  ; 00 FE
	SBC $5C			  ; F2 5C
	BRK $04			  ; 00 04
	PEA $005F			; F4 5F 00
	TSB $FC			  ; 04 FC
	ROR $00			  ; 66 00
	TSB $04			  ; 04 04
	ADC $00			  ; 67 00
	JSR ($6804,X)		; FC 04 68
	BRK $F4			  ; 00 F4
	TSB $69			  ; 04 69
	BRK $F4			  ; 00 F4
	PEA $1064			; F4 64 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	TSB $FC			  ; 04 FC
	PHP				  ; 08
	LSR $F400,X		  ; 5E 00 F4
	BRK $5C			  ; 00 5C
	BRK $FE			  ; 00 FE
	SBC $5C			  ; F2 5C
	BRK $F8			  ; 00 F8
	SED				  ; F8
	ROR				  ; 6A
	BPL $8F1C			; 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($5D08,X)		; FC 08 5D
	BRK $F4			  ; 00 F4
	BRK $5C			  ; 00 5C
	BRK $FE			  ; 00 FE
	SBC $5D			  ; F2 5D
	BRK $F8			  ; 00 F8
	SED				  ; F8
	JMP ($0410)		  ; 6C 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($5D08,X)		; FC 08 5D
	BRK $F4			  ; 00 F4
	BRK $5D			  ; 00 5D
	BRK $FE			  ; 00 FE
	SBC $5D			  ; F2 5D
	BRK $F8			  ; 00 F8
	SED				  ; F8
	ROR				  ; 6A
	BPL $8F46			; 10 04
	BRK $00			  ; 00 00
	BRK $06			  ; 00 06
	PEA $2D04			; F4 04 2D
	BRK $FC			  ; 00 FC
	TSB $2C			  ; 04 2C
	BRK $04			  ; 00 04
	TSB $2B			  ; 04 2B
	BRK $04			  ; 00 04
	JSR ($002A,X)		; FC 2A 00
	TSB $F4			  ; 04 F4
	AND #$00			 ; 29 00
	PEA $24F4			; F4 F4 24
	BPL $8F63			; 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	JSR ($2EF8,X)		; FC F8 2E
	BPL $8F60			; 10 F8
	JSR ($102E,X)		; FC 2E 10
	PEA $2EF8			; F4 F8 2E
	BPL $8F68			; 10 F8
	PEA $102E			; F4 2E 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	TSB $FD			  ; 04 FD
	SED				  ; F8
	ROL $F810			; 2E 10 F8
	SBC $102E,X		  ; FD 2E 10
	SBC $F8			  ; F3 F8
	ROL $F810			; 2E 10 F8
	SBC $2E			  ; F3 2E
	BPL $8F8D			; 10 04
	BRK $00			  ; 00 00
	BRK $04			  ; 00 04
	INC $44F8,X		  ; FE F8 44
	BPL $8F8A			; 10 F8
	INC $1044,X		  ; FE 44 10
	SBC $F8			  ; F2 F8
	MVP $F810			; 44 10 F8
	SBC $44			  ; F2 44
	BPL $8FA2			; 10 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	INC $38F8,X		  ; FE F8 38
	BRK $FE			  ; 00 FE
	INC $0038,X		  ; FE 38 00
	SED				  ; F8
	INC $0038,X		  ; FE 38 00
	SED				  ; F8
	SED				  ; F8
	SEC				  ; 38
	BRK $FF			  ; 00 FF
	SED				  ; F8
	MVP $F110			; 44 10 F1
	SED				  ; F8
	MVP $F810			; 44 10 F8
	SBC $F81044,X		; FF 44 10 F8
	SBC $44			  ; F1 44
	BPL $8FC7			; 10 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	INC $14FF,X		  ; FE FF 14
	BRK $FE			  ; 00 FE
	SBC $14			  ; F7 14
	BRK $F8			  ; 00 F8
	SBC $14			  ; F7 14
	BRK $F8			  ; 00 F8
	SBC $000014,X		; FF 14 00 00
	SED				  ; F8
	JSR $F010			; 20 10 F0
	SED				  ; F8
	JSR $F810			; 20 10 F8
	BRK $20			  ; 00 20
	BPL $8FDC			; 10 F8
	BEQ $9006			; F0 20
	BPL $8FEC			; 10 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	SBC $001400,X		; FF 00 14 00
	SBC $0014F6,X		; FF F6 14 00
	SBC $F6			  ; F7 F6
	TRB $00			  ; 14 00
	SBC $00			  ; F7 00
	TRB $00			  ; 14 00
	ORA $F8			  ; 01 F8
	JSR $EF10			; 20 10 EF
	SED				  ; F8
	JSR $F810			; 20 10 F8
	ORA $20			  ; 01 20
	BPL $9001			; 10 F8
	SBC $041020		  ; EF 20 10 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	BRK $01			  ; 00 01
	JMP $0000			; 4C 00 00
	SBC $4C,X			; F5 4C
	BRK $F6			  ; 00 F6
	SBC $4C,X			; F5 4C
	BRK $F6			  ; 00 F6
	ORA $4C			  ; 01 4C
	BRK $02			  ; 00 02
	SED				  ; F8
	RTS				  ; 60
	BPL $9014			; 10 EE
	SED				  ; F8
	RTS				  ; 60
	BPL $9022			; 10 F8
	COP $60			  ; 02 60
	BPL $9026			; 10 F8
	INC $1060			; EE 60 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	PHP				  ; 08
	ORA $02			  ; 01 02
	JMP $0100			; 4C 00 01
	PEA $004C			; F4 4C 00
	SBC $F4,X			; F5 F4
	JMP $F500			; 4C 00 F5
	COP $4C			  ; 02 4C
	BRK $03			  ; 00 03
	SED				  ; F8
	RTS				  ; 60
	BPL $9038			; 10 ED
	SED				  ; F8
	RTS				  ; 60
	BPL $9047			; 10 F8
	ORA $60			  ; 03 60
	BPL $904B			; 10 F8
	SBC $1060			; ED 60 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	PHP				  ; 08
	COP $03			  ; 02 03
	TSB $00			  ; 04 00
	COP $F3			  ; 02 F3
	TSB $00			  ; 04 00
	PEA $04F3			; F4 F3 04
	BRK $F4			  ; 00 F4
	ORA $04			  ; 03 04
	BRK $04			  ; 00 04
	SED				  ; F8
	ASL				  ; 0A
	BPL $905C			; 10 EC
	SED				  ; F8
	ASL				  ; 0A
	BPL $906C			; 10 F8
	TSB $0A			  ; 04 0A
	BPL $9070			; 10 F8
	CPX $100A			; EC 0A 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	PHP				  ; 08
	ORA $04			  ; 03 04
	TSB $00			  ; 04 00
	ORA $F2			  ; 03 F2
	TSB $00			  ; 04 00
	SBC $F2			  ; F3 F2
	TSB $00			  ; 04 00
	SBC $04			  ; F3 04
	TSB $00			  ; 04 00
	ORA $F8			  ; 05 F8
	TSB $EB10			; 0C 10 EB
	SED				  ; F8
	TSB $F810			; 0C 10 F8
	ORA $0C			  ; 05 0C
	BPL $9095			; 10 F8
	XBA				  ; EB
	TSB $0410			; 0C 10 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	TSB $05			  ; 04 05
	PLP				  ; 28
	BRK $04			  ; 00 04
	SBC $28			  ; F1 28
	BRK $F2			  ; 00 F2
	SBC $28			  ; F1 28
	BRK $F2			  ; 00 F2
	ORA $28			  ; 05 28
	BRK $06			  ; 00 06
	SED				  ; F8
	RTI				  ; 40
	BPL $90A4			; 10 EA
	SED				  ; F8
	RTI				  ; 40
	BPL $90B6			; 10 F8
	ASL $40			  ; 06 40
	BPL $90BA			; 10 F8
	NOP				  ; EA
	RTI				  ; 40
	BPL $90CA			; 10 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	ORA $06			  ; 05 06
	AND $00			  ; 27 00
	ORA $F0			  ; 05 F0
	AND $00			  ; 27 00
	SBC $F0			  ; F1 F0
	AND $00			  ; 27 00
	SBC $06			  ; F1 06
	AND $00			  ; 27 00
	ORA $F8			  ; 07 F8
	RTI				  ; 40
	BPL $90C8			; 10 E9
	SED				  ; F8
	RTI				  ; 40
	BPL $90DB			; 10 F8
	ORA $40			  ; 07 40
	BPL $90DF			; 10 F8
	SBC #$40			 ; E9 40
	BPL $90EF			; 10 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	ASL $07			  ; 06 07
	AND $00			  ; 37 00
	ASL $EF			  ; 06 EF
	AND $00			  ; 37 00
	BEQ $90E8			; F0 EF
	AND $00			  ; 37 00
	BEQ $9104			; F0 07
	AND $00			  ; 37 00
	PHP				  ; 08

;==============================================================================
; GeneralPurpose_11
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_11:
	SED				  ; F8 | Unknown operation
	ROR $E810			; 6E 10 E8 | Unknown operation
	SED				  ; F8 | Unknown operation
	ROR $F810			; 6E 10 F8 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	ROR $F810			; 6E 10 F8 | Unknown operation
	INX				  ; E8 | Unknown operation
	ROR $0410			; 6E 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $08			  ; 00 08 | Software interrupt
	ORA $08			  ; 07 08 | Logical OR with accumulator
	AND $00			  ; 37 00 | Logical AND with accumulator
	ORA $EE			  ; 07 EE | Logical OR with accumulator
	AND $00			  ; 37 00 | Logical AND with accumulator
	SBC $0037EE		  ; EF EE 37 00 | Unknown operation
	SBC $003708		  ; EF 08 37 00 | Unknown operation
	ORA #$F8			 ; 09 F8 | Logical OR with accumulator
	ROR $E710			; 6E 10 E7 | Unknown operation
	SED				  ; F8 | Unknown operation
	ROR $F810			; 6E 10 F8 | Unknown operation
	ORA #$6E			 ; 09 6E | Logical OR with accumulator
	BPL $9129			; 10 F8 | Unknown operation
	SBC $6E			  ; E7 6E | Unknown operation
	BPL $9139			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $08			  ; 00 08 | Software interrupt
	PHP				  ; 08 | Push processor status to stack
	ORA #$13			 ; 09 13 | Logical OR with accumulator
	BRK $08			  ; 00 08 | Software interrupt
	SBC $0013			; ED 13 00 | Unknown operation
	INC $13ED			; EE ED 13 | Unknown operation
	BRK $EE			  ; 00 EE | Software interrupt
	ORA #$13			 ; 09 13 | Logical OR with accumulator
	BRK $0A			  ; 00 0A | Software interrupt
	SED				  ; F8 | Unknown operation
	BRA $915D			; 80 10 | Unknown operation
	INC $F8			  ; E6 F8 | Unknown operation
	BRA $9161			; 80 10 | Unknown operation
	SED				  ; F8 | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	BRA $9165			; 80 10 | Unknown operation
	SED				  ; F8 | Unknown operation
	INC $80			  ; E6 80 | Unknown operation
	BPL $915E			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $08			  ; 00 08 | Software interrupt
	ORA #$0A			 ; 09 0A | Logical OR with accumulator
	ORA $00			  ; 12 00 | Logical OR with accumulator
	ORA #$EC			 ; 09 EC | Logical OR with accumulator

	ORA #$EC			 ; 09 EC
	ORA $00			  ; 12 00
	SBC $12EC			; ED EC 12
	BRK $ED			  ; 00 ED
	ASL				  ; 0A
	ORA $00			  ; 12 00
	ASL $14FB			; 0E FB 14
	BRK $E8			  ; 00 E8
	XCE				  ; FB
	TRB $00			  ; 14 00
	XCE				  ; FB
	ASL $0014			; 0E 14 00
	XCE				  ; FB
	INX				  ; E8
	TRB $00			  ; 14 00
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	PHP				  ; 08
	ASL				  ; 0A
	PHD				  ; 0B
	ORA $00			  ; 12 00
	ASL				  ; 0A
	XBA				  ; EB
	ORA $00			  ; 12 00
	CPX $12EB			; EC EB 12
	BRK $EC			  ; 00 EC
	PHD				  ; 0B
	ORA $00			  ; 12 00
	ORA $0014FB		  ; 0F FB 14 00
	SBC $FB			  ; E7 FB
	TRB $00			  ; 14 00
	XCE				  ; FB
	ORA $FB0014		  ; 0F 14 00 FB
	SBC $14			  ; E7 14
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	PHD				  ; 0B
	TSB $004A			; 0C 4A 00
	PHD				  ; 0B
	NOP				  ; EA
	LSR				  ; 4A
	BRK $EB			  ; 00 EB
	NOP				  ; EA
	LSR				  ; 4A
	BRK $EB			  ; 00 EB
	TSB $004A			; 0C 4A 00
	BPL $91B5			; 10 FB
	PHK				  ; 4B
	BRK $E6			  ; 00 E6
	XCE				  ; FB
	PHK				  ; 4B
	BRK $FB			  ; 00 FB
	BPL $920E			; 10 4B
	BRK $FB			  ; 00 FB
	INC $4B			  ; E6 4B
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	TSB $760D			; 0C 0D 76
	BRK $0C			  ; 00 0C
	SBC #$76			 ; E9 76
	BRK $EA			  ; 00 EA
	SBC #$76			 ; E9 76
	BRK $EA			  ; 00 EA
	ORA $0076			; 0D 76 00
	ORA $FB			  ; 11 FB
	LSR				  ; 4A
	BRK $E5			  ; 00 E5
	XCE				  ; FB
	LSR				  ; 4A
	BRK $FB			  ; 00 FB
	ORA $4A			  ; 11 4A
	BRK $FB			  ; 00 FB
	SBC $4A			  ; E5 4A
	BRK $04			  ; 00 04
	BRK $00			  ; 00 00
	BRK $08			  ; 00 08
	ORA $760E			; 0D 0E 76
	BRK $0D			  ; 00 0D
	INX				  ; E8
	ROR $00,X			; 76 00
	SBC #$E8			 ; E9 E8
	ROR $00,X			; 76 00
	SBC #$0E			 ; E9 0E

;==============================================================================
; GeneralPurpose_12
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_12:
	ROR $00,X			; 76 00 | Unknown operation
	ORA $FB			  ; 12 FB | Logical OR with accumulator
	LSR				  ; 4A | Unknown operation
	BRK $E4			  ; 00 E4 | Software interrupt
	XCE				  ; FB | Unknown operation
	LSR				  ; 4A | Unknown operation
	BRK $FB			  ; 00 FB | Software interrupt
	ORA $4A			  ; 12 4A | Logical OR with accumulator
	BRK $FB			  ; 00 FB | Software interrupt
	CPX $4A			  ; E4 4A | Unknown operation
	BRK $04			  ; 00 04 | Software interrupt
	BRK $00			  ; 00 00 | Software interrupt
	BRK $04			  ; 00 04 | Software interrupt
	ORA $FB			  ; 12 FB | Logical OR with accumulator
	ROR $00,X			; 76 00 | Unknown operation
	CPX $FB			  ; E4 FB | Unknown operation
	ROR $00,X			; 76 00 | Unknown operation
	XCE				  ; FB | Unknown operation
	ORA $76			  ; 12 76 | Logical OR with accumulator
	BRK $FB			  ; 00 FB | Software interrupt
	CPX $76			  ; E4 76 | Unknown operation
	BRK $2A			  ; 00 2A | Software interrupt
	STA $F5			  ; 92 F5 | Store accumulator to memory
	BRK $01			  ; 00 01 | Software interrupt
	BRK $FF			  ; 00 FF | Software interrupt
	ORA $01			  ; 01 01 | Logical OR with accumulator
	BRK $FF			  ; 00 FF | Software interrupt
	COP $01			  ; 02 01 | Unknown operation
	BRK $FF			  ; 00 FF | Software interrupt
	ORA $01			  ; 03 01 | Logical OR with accumulator
	BRK $FF			  ; 00 FF | Software interrupt
	TSB $01			  ; 04 01 | Unknown operation
	BRK $FF			  ; 00 FF | Software interrupt
	ORA $01			  ; 05 01 | Logical OR with accumulator
	BRK $FF			  ; 00 FF | Software interrupt
	ASL $01			  ; 06 01 | Arithmetic shift left
	BRK $FF			  ; 00 FF | Software interrupt
	ORA $01			  ; 07 01 | Logical OR with accumulator
	BRK $FF			  ; 00 FF | Software interrupt
	PHP				  ; 08 | Push processor status to stack
	ORA $00			  ; 01 00 | Logical OR with accumulator
	SBC $000109,X		; FF 09 01 00 | Unknown operation
	SBC $00010A,X		; FF 0A 01 00 | Unknown operation
	SBC $00010B,X		; FF 0B 01 00 | Unknown operation
	SBC $00010C,X		; FF 0C 01 00 | Unknown operation
	SBC $00010D,X		; FF 0D 01 00 | Unknown operation
	SBC $00010E,X		; FF 0E 01 00 | Unknown operation
	SBC $00010F,X		; FF 0F 01 00 | Unknown operation
	SBC $000110,X		; FF 10 01 00 | Unknown operation

	SBC $000110,X		; FF 10 01 00
	SBC $000111,X		; FF 11 01 00
	SBC $000112,X		; FF 12 01 00
	SBC $000113,X		; FF 13 01 00
	SBC $000114,X		; FF 14 01 00
	SBC $000115,X		; FF 15 01 00
	SBC $000116,X		; FF 16 01 00
	SBC $000117,X		; FF 17 01 00
	SBC $000118,X		; FF 18 01 00
	SBC $000119,X		; FF 19 01 00
	SBC $00011A,X		; FF 1A 01 00
	SBC $00011B,X		; FF 1B 01 00
	SBC $00011C,X		; FF 1C 01 00
	SBC $000100,X		; FF 00 01 00
	SBC $000101,X		; FF 01 01 00
	BRK $02			  ; 00 02
	ORA $00			  ; 01 00
	SBC $000103,X		; FF 03 01 00
	BRK $04			  ; 00 04
	ORA $00			  ; 01 00
	SBC $000105,X		; FF 05 01 00
	BRK $06			  ; 00 06
	ORA $00			  ; 01 00
	SBC $000107,X		; FF 07 01 00
	BRK $08			  ; 00 08
	ORA $00			  ; 01 00
	SBC $000109,X		; FF 09 01 00
	BRK $0A			  ; 00 0A
	ORA $00			  ; 01 00
	SBC $00010B,X		; FF 0B 01 00
	BRK $0C			  ; 00 0C
	ORA $00			  ; 01 00
	SBC $00010D,X		; FF 0D 01 00
	BRK $0E			  ; 00 0E
	ORA $00			  ; 01 00
	SBC $00010F,X		; FF 0F 01 00
	BRK $10			  ; 00 10
	ORA $00			  ; 01 00
	SBC $000111,X		; FF 11 01 00
	BRK $12			  ; 00 12
	ORA $00			  ; 01 00
	SBC $000113,X		; FF 13 01 00
	BRK $14			  ; 00 14
	ORA $00			  ; 01 00
	SBC $000115,X		; FF 15 01 00
	BRK $16			  ; 00 16
	ORA $00			  ; 01 00
	SBC $000117,X		; FF 17 01 00
	BRK $18			  ; 00 18
	ORA $00			  ; 01 00
	SBC $000119,X		; FF 19 01 00
	BRK $1A			  ; 00 1A
	ORA $00			  ; 01 00
	SBC $00011B,X		; FF 1B 01 00
	BRK $1C			  ; 00 1C
	ORA $00			  ; 01 00
	SBC $00011D,X		; FF 1D 01 00
	BRK $1E			  ; 00 1E
	ORA $00			  ; 01 00
	SBC $00011F,X		; FF 1F 01 00
	BRK $20			  ; 00 20
	ORA $00			  ; 01 00
	SBC $000121,X		; FF 21 01 00
	BRK $22			  ; 00 22
	ORA $00			  ; 01 00
	SBC $000123,X		; FF 23 01 00
	BRK $24			  ; 00 24
	ORA $00			  ; 01 00
	SBC $000125,X		; FF 25 01 00
	BRK $26			  ; 00 26
	ORA $00			  ; 01 00
	SBC $000127,X		; FF 27 01 00
	BRK $28			  ; 00 28
	ORA $00			  ; 01 00
	SBC $000129,X		; FF 29 01 00
	BRK $2A			  ; 00 2A
	ORA $00			  ; 01 00
	SBC $00012B,X		; FF 2B 01 00
	BRK $2C			  ; 00 2C
	ORA $00			  ; 01 00
	SBC $00012D,X		; FF 2D 01 00
	BRK $2E			  ; 00 2E
	ORA $00			  ; 01 00
	SBC $00012F,X		; FF 2F 01 00
	BRK $30			  ; 00 30
	ORA $00			  ; 01 00
	SBC $000131,X		; FF 31 01 00
	BRK $32			  ; 00 32
	ORA $00			  ; 01 00
	SBC $000133,X		; FF 33 01 00
	BRK $34			  ; 00 34
	ORA $00			  ; 01 00
	SBC $000135,X		; FF 35 01 00
	BRK $36			  ; 00 36
	ORA $00			  ; 01 00
	SBC $000137,X		; FF 37 01 00
	BRK $38			  ; 00 38
	ORA $00			  ; 01 00
	SBC $000139,X		; FF 39 01 00
	BRK $3A			  ; 00 3A
	ORA $00			  ; 01 00
	SBC $00013B,X		; FF 3B 01 00
	BRK $3C			  ; 00 3C
	ORA $00			  ; 01 00
	SBC $00013D,X		; FF 3D 01 00
	BRK $3E			  ; 00 3E
	ORA $00			  ; 01 00
	SBC $00013F,X		; FF 3F 01 00
	BRK $40			  ; 00 40
	ORA $00			  ; 01 00
	SBC $000141,X		; FF 41 01 00
	BRK $42			  ; 00 42
	ORA $00			  ; 01 00
	SBC $000143,X		; FF 43 01 00
	BRK $44			  ; 00 44
	ORA $00			  ; 01 00
	SBC $000145,X		; FF 45 01 00
	BRK $46			  ; 00 46
	ORA $00			  ; 01 00
	SBC $000147,X		; FF 47 01 00
	BRK $48			  ; 00 48
	ORA $00			  ; 01 00
	SBC $000149,X		; FF 49 01 00
	BRK $4A			  ; 00 4A
	ORA $00			  ; 01 00
	BRK $4B			  ; 00 4B
	ORA $00			  ; 01 00
	BRK $4C			  ; 00 4C
	ORA $00			  ; 01 00
	BRK $4D			  ; 00 4D
	ORA $00			  ; 01 00
	BRK $4E			  ; 00 4E
	ORA $00			  ; 01 00
	BRK $4F			  ; 00 4F
	ORA $00			  ; 01 00
	BRK $50			  ; 00 50
	ORA $00			  ; 01 00
	BRK $51			  ; 00 51
	ORA $00			  ; 01 00
	BRK $52			  ; 00 52
	ORA $00			  ; 01 00
	BRK $53			  ; 00 53
	ORA $00			  ; 01 00
	BRK $54			  ; 00 54
	ORA $00			  ; 01 00
	BRK $55			  ; 00 55
	ORA $00			  ; 01 00
	BRK $56			  ; 00 56
	ORA $00			  ; 01 00
	BRK $57			  ; 00 57
	ORA $00			  ; 01 00
	BRK $58			  ; 00 58
	ORA $00			  ; 01 00
	BRK $59			  ; 00 59
	ORA $00			  ; 01 00
	BRK $5A			  ; 00 5A
	ORA $00			  ; 01 00
	BRK $5B			  ; 00 5B
	ORA $00			  ; 01 00
	BRK $5C			  ; 00 5C
	ORA $00			  ; 01 00
	BRK $FF			  ; 00 FF
	ROL				  ; 2A
	STA $F5,X			; 95 F5
	CMP $95			  ; D7 95
	SBC $E4,X			; F5 E4
	STA $F5,X			; 95 F5
	SBC $95			  ; F1 95
	SBC $FE,X			; F5 FE
	STA $F5,X			; 95 F5
	PHD				  ; 0B
	STX $F5,Y			; 96 F5
	CLC				  ; 18
	STX $F5,Y			; 96 F5
	AND $96			  ; 25 96
	SBC $32,X			; F5 32
	STX $F5,Y			; 96 F5
	AND $4CF596,X		; 3F 96 F5 4C
	STX $F5,Y			; 96 F5
	EOR $F596,Y		  ; 59 96 F5
	ROR $96			  ; 66 96
	SBC $73,X			; F5 73
	STX $F5,Y			; 96 F5
	BRA $93D5			; 80 96
	SBC $8D,X			; F5 8D
	STX $F5,Y			; 96 F5
	TXS				  ; 9A
	STX $F5,Y			; 96 F5
	LDA $96			  ; A7 96
	SBC $B4,X			; F5 B4
	STX $F5,Y			; 96 F5
	CMP $96			  ; C1 96
	SBC $CE,X			; F5 CE
	STX $F5,Y			; 96 F5
	STP				  ; DB
	STX $F5,Y			; 96 F5
	INX				  ; E8
	STX $F5,Y			; 96 F5
	SBC $96,X			; F5 96
	SBC $02,X			; F5 02
	STA $F5			  ; 97 F5
	ORA $1CF597		  ; 0F 97 F5 1C
	STA $F5			  ; 97 F5
	AND #$97			 ; 29 97
	SBC $36,X			; F5 36
	STA $F5			  ; 97 F5
	EOR $97			  ; 43 97
	SBC $50,X			; F5 50
	STA $F5			  ; 97 F5
	EOR $F597,X		  ; 5D 97 F5
	ROR				  ; 6A
	STA $F5			  ; 97 F5
	ADC $97			  ; 77 97
	SBC $84,X			; F5 84
	STA $F5			  ; 97 F5
	STA $97			  ; 91 97
	SBC $9E,X			; F5 9E
	STA $F5			  ; 97 F5
	PLB				  ; AB
	STA $F5			  ; 97 F5
	CLV				  ; B8
	STA $F5			  ; 97 F5
	CMP $97			  ; C5 97
	SBC $D2,X			; F5 D2
	STA $F5			  ; 97 F5
	CMP $ECF597,X		; DF 97 F5 EC
	STA $F5			  ; 97 F5
	SBC $F597,Y		  ; F9 97 F5
	ASL $98			  ; 06 98
	SBC $13,X			; F5 13
	TYA				  ; 98
	SBC $20,X			; F5 20
	TYA				  ; 98
	SBC $2D,X			; F5 2D
	TYA				  ; 98
	SBC $3A,X			; F5 3A
	TYA				  ; 98
	SBC $47,X			; F5 47
	TYA				  ; 98
	SBC $54,X			; F5 54
	TYA				  ; 98
	SBC $61,X			; F5 61
	TYA				  ; 98
	SBC $6E,X			; F5 6E
	TYA				  ; 98
	SBC $7B,X			; F5 7B
	TYA				  ; 98
	SBC $88,X			; F5 88
	TYA				  ; 98
	SBC $95,X			; F5 95
	TYA				  ; 98
	SBC $A2,X			; F5 A2
	TYA				  ; 98
	SBC $AF,X			; F5 AF
	TYA				  ; 98
	SBC $BC,X			; F5 BC
	TYA				  ; 98
	SBC $C9,X			; F5 C9
	TYA				  ; 98
	SBC $D6,X			; F5 D6
	TYA				  ; 98
	SBC $E3,X			; F5 E3
	TYA				  ; 98
	SBC $F0,X			; F5 F0
	TYA				  ; 98
	SBC $FD,X			; F5 FD
	TYA				  ; 98
	SBC $0A,X			; F5 0A
	STA $17F5,Y		  ; 99 F5 17
	STA $24F5,Y		  ; 99 F5 24
	STA $31F5,Y		  ; 99 F5 31
	STA $3EF5,Y		  ; 99 F5 3E
	STA $4BF5,Y		  ; 99 F5 4B
	STA $58F5,Y		  ; 99 F5 58
	STA $65F5,Y		  ; 99 F5 65
	STA $72F5,Y		  ; 99 F5 72
	STA $7FF5,Y		  ; 99 F5 7F
	STA $8CF5,Y		  ; 99 F5 8C
	STA $A9F5,Y		  ; 99 F5 A9
	STA $BEF5,Y		  ; 99 F5 BE
	STA $D7F5,Y		  ; 99 F5 D7
	STA $F0F5,Y		  ; 99 F5 F0
	STA $09F5,Y		  ; 99 F5 09
	TXS				  ; 9A
	SBC $22,X			; F5 22
	TXS				  ; 9A
	SBC $3B,X			; F5 3B
	TXS				  ; 9A
	SBC $68,X			; F5 68
	TXS				  ; 9A
	SBC $81,X			; F5 81
	TXS				  ; 9A
	SBC $9A,X			; F5 9A
	TXS				  ; 9A
	SBC $B3,X			; F5 B3
	TXS				  ; 9A
	SBC $CC,X			; F5 CC
	TXS				  ; 9A
	SBC $E5,X			; F5 E5
	TXS				  ; 9A
	SBC $FE,X			; F5 FE
	TXS				  ; 9A
	SBC $13,X			; F5 13
	TXY				  ; 9B
	SBC $28,X			; F5 28
	TXY				  ; 9B
	SBC $35,X			; F5 35
	TXY				  ; 9B
	SBC $42,X			; F5 42
	TXY				  ; 9B
	SBC $A4,X			; F5 A4
	BRK $52			  ; 00 52
	BRK $28			  ; 00 28
	TAX				  ; AA
	AND #$AA			 ; 29 AA
	EOR $5AAA,Y		  ; 59 AA 5A
	TAX				  ; AA
	ROL $AA			  ; 26 AA
	AND $AA			  ; 27 AA
	TCD				  ; 5B
	TAX				  ; AA
	JMP $AA57AA		  ; 5C AA 57 AA
	CLI				  ; 58
	TAX				  ; AA
	ROL				  ; 2A
	TAX				  ; AA
	PLD				  ; 2B
	TAX				  ; AA
	ADC $AA			  ; 71 AA
	ADC $AA			  ; 72 AA
	ADC $AA			  ; 73 AA
	ADC $37AA,Y		  ; 79 AA 37
	TAX				  ; AA
	SEC				  ; 38
	TAX				  ; AA
	ADC $AA			  ; 65 AA
	ROR $AA			  ; 66 AA
	AND $AA,X			; 35 AA
	ROL $AA,X			; 36 AA
	ADC $AA			  ; 67 AA
	PLA				  ; 68
	TAX				  ; AA
	ADC $AA			  ; 63 AA
	STZ $AA			  ; 64 AA
	AND $3AAA,Y		  ; 39 AA 3A
	TAX				  ; AA
	ADC $AA			  ; 77 AA
	SEI				  ; 78
	TAX				  ; AA
	ADC $AA7EAA,X		; 7F AA 7E AA
	ADC $5DAA,X		  ; 7D AA 5D
	TAX				  ; AA
	COP $AA			  ; 02 AA
	ORA $AA			  ; 03 AA
	BRK $AA			  ; 00 AA
	ORA $AA			  ; 01 AA
	AND $2EAA			; 2D AA 2E
	TAX				  ; AA
	AND $AA30AA		  ; 2F AA 30 AA
	SBC $A9			  ; F7 A9
	SED				  ; F8
	LDA #$FB			 ; A9 FB
	LDA #$FC			 ; A9 FC
	LDA #$FE			 ; A9 FE
	LDA #$FF			 ; A9 FF
	LDA #$2C			 ; A9 2C
	TAX				  ; AA
	AND $AA			  ; 33 AA
	BPL $953E			; 10 AA
	ORA $AA			  ; 11 AA
	ASL $0FAA			; 0E AA 0F
	TAX				  ; AA
	AND $3EAA,X		  ; 3D AA 3E
	TAX				  ; AA
	AND $AA40AA,X		; 3F AA 40 AA
	ORA $AA			  ; 05 AA
	ASL $AA			  ; 06 AA
	ORA #$AA			 ; 09 AA
	DEC $A0			  ; C6 A0
	TSB $0DAA			; 0C AA 0D
	TAX				  ; AA
	AND $AA			  ; 31 AA
	AND $AA			  ; 32 AA
	SBC $0AA9,X		  ; FD A9 0A
	TAX				  ; AA
	ADC #$AA			 ; 69 AA
	ORA $AA			  ; 13 AA
	ORA $AA			  ; 12 AA
	BIT $3BAA,X		  ; 3C AA 3B
	TAX				  ; AA
	MVP $43AA			; 44 AA 43
	TAX				  ; AA
	PHD				  ; 0B
	TAX				  ; AA
	ROR				  ; 6A
	TAX				  ; AA
	ORA $FF			  ; 03 FF
	EOR $AA			  ; 41 AA
	WDM $AA			  ; 42 AA
	COP $04			  ; 02 04
	SED				  ; F8
	BRK $10			  ; 00 10
	CPX $02F8			; EC F8 02
	BPL $95DC			; 10 04
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	ORA $F8			  ; 03 F8
	BRK $10			  ; 00 10
	SBC $02F8			; ED F8 02
	BPL $95E9			; 10 04
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	ORA $F8			  ; 01 F8
	TSB $10			  ; 04 10
	SBC $1002F8		  ; EF F8 02 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	COP $FF			  ; 02 FF
	SED				  ; F8
	TSB $10			  ; 04 10
	SBC $F8			  ; F1 F8
	ASL $10			  ; 06 10
	TSB $00			  ; 04 00

;==============================================================================
; GeneralPurpose_16
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_16:
	BRK $00			  ; 00 00 | Software interrupt
	COP $FD			  ; 02 FD | Unknown operation
	SED				  ; F8 | Unknown operation
	TSB $10			  ; 04 10 | Unknown operation
	SBC $F8			  ; F3 F8 | Unknown operation
	ASL $10			  ; 06 10 | Arithmetic shift left
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	COP $FB			  ; 02 FB | Unknown operation
	SED				  ; F8 | Unknown operation
	TSB $10			  ; 04 10 | Unknown operation
	SBC $F8,X			; F5 F8 | Unknown operation
	ASL $10			  ; 06 10 | Arithmetic shift left
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	COP $F9			  ; 02 F9 | Unknown operation
	SED				  ; F8 | Unknown operation
	TSB $10			  ; 04 10 | Unknown operation
	SBC $F8			  ; F7 F8 | Unknown operation
	ASL $10			  ; 06 10 | Arithmetic shift left
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	COP $F7			  ; 02 F7 | Unknown operation
	SED				  ; F8 | Unknown operation
	TSB $10			  ; 04 10 | Unknown operation
	SBC $06F8,Y		  ; F9 F8 06 | Unknown operation
	BPL $9637			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $02			  ; 00 02 | Software interrupt
	SBC $F8,X			; F5 F8 | Unknown operation
	TSB $10			  ; 04 10 | Unknown operation
	XCE				  ; FB | Unknown operation
	SED				  ; F8 | Unknown operation
	ASL $10			  ; 06 10 | Arithmetic shift left
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	COP $F3			  ; 02 F3 | Unknown operation
	SED				  ; F8 | Unknown operation
	BRK $10			  ; 00 10 | Software interrupt
	SBC $06F8,X		  ; FD F8 06 | Unknown operation
	BPL $9651			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $02			  ; 00 02 | Software interrupt
	SBC $F8			  ; F1 F8 | Unknown operation
	BRK $10			  ; 00 10 | Software interrupt
	SBC $1006F8,X		; FF F8 06 10 | Unknown operation
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	COP $EF			  ; 02 EF | Unknown operation

	COP $EF			  ; 02 EF
	SED				  ; F8
	BRK $10			  ; 00 10
	ORA $F8			  ; 01 F8
	COP $10			  ; 02 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	COP $EE			  ; 02 EE
	SED				  ; F8
	BRK $10			  ; 00 10
	COP $F8			  ; 02 F8
	COP $10			  ; 02 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	COP $ED			  ; 02 ED
	SED				  ; F8
	BRK $10			  ; 00 10
	ORA $F8			  ; 03 F8
	COP $10			  ; 02 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	COP $EC			  ; 02 EC
	SED				  ; F8
	BRK $10			  ; 00 10
	TSB $F8			  ; 04 F8
	COP $10			  ; 02 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	COP $ED			  ; 02 ED
	SED				  ; F8
	BRK $10			  ; 00 10
	ORA $F8			  ; 03 F8
	COP $10			  ; 02 10
	TSB $00			  ; 04 00
	BRK $00			  ; 00 00
	COP $EE			  ; 02 EE
	SED				  ; F8
	BRK $10			  ; 00 10
	COP $F8			  ; 02 F8
	PHP				  ; 08
	BPL $96AC			; 10 04
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	BEQ $96A6			; F0 F8
	BRK $10			  ; 00 10
	BRK $F8			  ; 00 F8
	PHP				  ; 08
	BPL $96B9			; 10 04
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	SBC $F8			  ; F2 F8
	ASL				  ; 0A
	BPL $96BC			; 10 FE
	SED				  ; F8
	PHP				  ; 08
	BPL $96C6			; 10 04
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	JSR ($08F8,X)		; FC F8 08
	BPL $96BF			; 10 F4
	SED				  ; F8
	ASL				  ; 0A
	BPL $96D3			; 10 04
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	PLX				  ; FA
	SED				  ; F8
	PHP				  ; 08
	BPL $96CE			; 10 F6
	SED				  ; F8
	ASL				  ; 0A
	BPL $96E0			; 10 04
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	SED				  ; F8
	SED				  ; F8
	PHP				  ; 08
	BPL $96DD			; 10 F8
	SED				  ; F8
	ASL				  ; 0A
	BPL $96ED			; 10 04
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	INC $F8,X			; F6 F8
	PHP				  ; 08
	BPL $96EC			; 10 FA
	SED				  ; F8
	ASL				  ; 0A
	BPL $96FA			; 10 04
	BRK $00			  ; 00 00
	BRK $02			  ; 00 02
	PEA $08F8			; F4 F8 08
	BPL $96FB			; 10 FC
	SED				  ; F8

;==============================================================================
; GeneralPurpose_17
; Purpose: Handles general game logic and utility operations
; Type: GeneralPurpose
; Instructions: 0
;==============================================================================
GeneralPurpose_17:
	ASL				  ; 0A | Arithmetic shift left
	BPL $9707			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $02			  ; 00 02 | Software interrupt
	SBC $F8			  ; F2 F8 | Unknown operation
	PHP				  ; 08 | Push processor status to stack
	BPL $970A			; 10 FE | Unknown operation
	SED				  ; F8 | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	BPL $9714			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $02			  ; 00 02 | Software interrupt
	BEQ $970E			; F0 F8 | Branch if equal (zero flag set)
	PHP				  ; 08 | Push processor status to stack
	BPL $9719			; 10 00 | Unknown operation
	SED				  ; F8 | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	BPL $9721			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $02			  ; 00 02 | Software interrupt
	INC $08F8			; EE F8 08 | Unknown operation
	BPL $9728			; 10 02 | Unknown operation
	SED				  ; F8 | Unknown operation
	ASL				  ; 0A | Arithmetic shift left
	BPL $972E			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $02			  ; 00 02 | Software interrupt
	SBC $02F8			; ED F8 02 | Unknown operation
	BPL $9736			; 10 03 | Unknown operation
	SED				  ; F8 | Unknown operation
	BRK $10			  ; 00 10 | Software interrupt
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	COP $EC			  ; 02 EC | Unknown operation
	SED				  ; F8 | Unknown operation
	COP $10			  ; 02 10 | Unknown operation
	TSB $F8			  ; 04 F8 | Unknown operation
	BRK $10			  ; 00 10 | Software interrupt
	TSB $00			  ; 04 00 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	COP $03			  ; 02 03 | Unknown operation
	SED				  ; F8 | Unknown operation
	BRK $10			  ; 00 10 | Software interrupt
	SBC $02F8			; ED F8 02 | Unknown operation
	BPL $9755			; 10 04 | Unknown operation
	BRK $00			  ; 00 00 | Software interrupt
	BRK $02			  ; 00 02 | Software interrupt
	COP $F8			  ; 02 F8 | Unknown operation
	BRK $10			  ; 00 10 | Software interrupt

	BRK $10			  ; 00 10
	INC $02F8			; EE F8 02
	BPL $9762			; 10 04
;==============================================================================
; Function Index (14 functions)
;==============================================================================
; GeneralPurpose_00
; GeneralPurpose_01
; GeneralPurpose_03
; GeneralPurpose_04
; GeneralPurpose_05
; GeneralPurpose_06
; GeneralPurpose_07
; GeneralPurpose_0B
; GeneralPurpose_0D
; GeneralPurpose_0E
; GeneralPurpose_11
; GeneralPurpose_12
; GeneralPurpose_16
; GeneralPurpose_17
;==============================================================================