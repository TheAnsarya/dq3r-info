; SNES 65816 Disassembly
; Bank $00: System/Boot code
; Address range: $8000-$8200

$8000:	05           	db
$8001:	C9 00 09     	cmp	#$0900
$8004:	00 D8        	brk	#$D8
$8006:	41           	db
$8007:	C5           	db
$8008:	04           	db
$8009:	00 FF        	brk	#$FF
$800B:	03           	db
$800C:	00 DA        	brk	#$DA
$800E:	AA           	tax
$800F:	22 72 05 C9  	jsl	$C90572
$8013:	00 04        	brk	#$04
$8015:	00 32        	brk	#$32
$8017:	42           	db
$8018:	C5           	db
$8019:	01           	db
$801A:	00 FC        	brk	#$FC
$801C:	FF           	db
$801D:	03           	db
$801E:	8D B8 E0     	sta	$E0B8
$8021:	22 72 05 C9  	jsl	$C90572
$8025:	00 04        	brk	#$04
$8027:	00 32        	brk	#$32
$8029:	42           	db
$802A:	C5           	db
$802B:	00 00        	brk	#$00
$802D:	FF           	db
$802E:	03           	db
$802F:	00 AA        	brk	#$AA
$8031:	22 FD 67 C0  	jsl	$C067FD
$8035:	FA           	plx
$8036:	90 2E        	bcc	$8066
$8038:	22 EE 03 C9  	jsl	$C903EE
$803C:	00 09        	brk	#$09
$803E:	00 D8        	brk	#$D8
$8040:	41           	db
$8041:	C5           	db
$8042:	06           	db
$8043:	00 85        	brk	#$85
$8045:	00 22        	brk	#$22
$8047:	EE           	db
$8048:	03           	db
$8049:	C9 00 09     	cmp	#$0900
$804C:	00 D8        	brk	#$D8
$804E:	41           	db
$804F:	C5           	db
$8050:	08           	php
$8051:	00 29        	brk	#$29
$8053:	FF           	db
$8054:	00 85        	brk	#$85
$8056:	02 A9        	cop	#$A9
$8058:	0E           	db
$8059:	00 20        	brk	#$20
$805B:	7A           	ply
$805C:	84           	db
$805D:	AB           	plb
$805E:	C2 30        	rep	#$30
$8060:	7A           	ply
$8061:	FA           	plx
$8062:	68           	pla
$8063:	28           	plp
$8064:	38           	sec
$8065:	6B           	rtl
$8066:	AE 9A AE     	ldx	$AE9A
$8069:	22 52 90 C0  	jsl	$C09052
$806D:	AB           	plb
$806E:	C2 30        	rep	#$30
$8070:	7A           	ply
$8071:	FA           	plx
$8072:	68           	pla
$8073:	28           	plp
$8074:	18           	clc
$8075:	6B           	rtl
$8076:	08           	php
$8077:	C2 30        	rep	#$30
$8079:	48           	pha
$807A:	DA           	phx
$807B:	5A           	phy
$807C:	8B           	phb
$807D:	F4           	db
$807E:	7F 7F AB AB  	adc	$ABAB7F,X
$8082:	AA           	tax
$8083:	22 72 05 C9  	jsl	$C90572
$8087:	00 09        	brk	#$09
$8089:	00 93        	brk	#$93
$808B:	42           	db
$808C:	C5           	db
$808D:	00 00        	brk	#$00
$808F:	FF           	db
$8090:	00 00        	brk	#$00
$8092:	8D B2 E0     	sta	$E0B2
$8095:	22 72 05 C9  	jsl	$C90572
$8099:	00 09        	brk	#$09
$809B:	00 93        	brk	#$93
$809D:	42           	db
$809E:	C5           	db
$809F:	01           	db
$80A0:	00 FF        	brk	#$FF
$80A2:	00 00        	brk	#$00
$80A4:	8D B4 E0     	sta	$E0B4
$80A7:	0D           	db
$80A8:	B2           	db
$80A9:	E0 D0        	cpx	#$D0
$80AB:	03           	db
$80AC:	4C 66 81     	jmp	$8166
$80AF:	E2 20        	sep	#$20
$80B1:	AD B2 E0     	lda	$E0B2
$80B4:	EB           	db
$80B5:	AD B4 E0     	lda	$E0B4
$80B8:	22 98 10 C0  	jsl	$C01098
$80BC:	C2 20        	rep	#$20
$80BE:	8D B6 E0     	sta	$E0B6
$80C1:	0A           	asl
$80C2:	22 D7 8F C0  	jsl	$C08FD7
$80C6:	B0 03        	bcs	$80CB
$80C8:	4C 66 81     	jmp	$8166
$80CB:	22 72 05 C9  	jsl	$C90572
$80CF:	00 09        	brk	#$09
$80D1:	00 93        	brk	#$93
$80D3:	42           	db
$80D4:	C5           	db
$80D5:	02 00        	cop	#$00
$80D7:	FF           	db
$80D8:	00 00        	brk	#$00
$80DA:	0A           	asl
$80DB:	6D 46 FC     	adc	$FC46
$80DE:	8D 46 FC     	sta	$FC46
$80E1:	22 72 05 C9  	jsl	$C90572
$80E5:	00 09        	brk	#$09
$80E7:	00 93        	brk	#$93
$80E9:	42           	db
$80EA:	C5           	db
$80EB:	03           	db
$80EC:	00 FF        	brk	#$FF
$80EE:	00 00        	brk	#$00
$80F0:	0A           	asl
$80F1:	6D 48 FC     	adc	$FC48
$80F4:	8D 48 FC     	sta	$FC48
$80F7:	22 72 05 C9  	jsl	$C90572
$80FB:	00 09        	brk	#$09
$80FD:	00 93        	brk	#$93
$80FF:	42           	db
$8100:	C5           	db
$8101:	04           	db
$8102:	00 FF        	brk	#$FF
$8104:	03           	db
$8105:	00 DA        	brk	#$DA
$8107:	AA           	tax
$8108:	22 72 05 C9  	jsl	$C90572
$810C:	00 04        	brk	#$04
$810E:	00 9C        	brk	#$9C
$8110:	42           	db
$8111:	C5           	db
$8112:	01           	db
$8113:	00 FC        	brk	#$FC
$8115:	FF           	db
$8116:	03           	db
$8117:	8D B8 E0     	sta	$E0B8
$811A:	22 72 05 C9  	jsl	$C90572
$811E:	00 04        	brk	#$04
$8120:	00 9C        	brk	#$9C
$8122:	42           	db
$8123:	C5           	db
$8124:	00 00        	brk	#$00
$8126:	FF           	db
$8127:	03           	db
$8128:	00 AA        	brk	#$AA
$812A:	22 9E 68 C0  	jsl	$C0689E
$812E:	FA           	plx
$812F:	90 2E        	bcc	$815F
$8131:	22 EE 03 C9  	jsl	$C903EE
$8135:	00 09        	brk	#$09
$8137:	00 93        	brk	#$93
$8139:	42           	db
$813A:	C5           	db
$813B:	06           	db
$813C:	00 85        	brk	#$85
$813E:	00 22        	brk	#$22
$8140:	EE           	db
$8141:	03           	db
$8142:	C9 00 09     	cmp	#$0900
$8145:	00 93        	brk	#$93
$8147:	42           	db
$8148:	C5           	db
$8149:	08           	php
$814A:	00 29        	brk	#$29
$814C:	FF           	db
$814D:	00 85        	brk	#$85
$814F:	02 A9        	cop	#$A9
$8151:	10 00        	bpl	$8153
$8153:	20 7A 84     	jsr	$847A
$8156:	AB           	plb
$8157:	C2 30        	rep	#$30
$8159:	7A           	ply
$815A:	FA           	plx
$815B:	68           	pla
$815C:	28           	plp
$815D:	38           	sec
$815E:	6B           	rtl
$815F:	AE 9A AE     	ldx	$AE9A
$8162:	22 52 90 C0  	jsl	$C09052
$8166:	AB           	plb
$8167:	C2 30        	rep	#$30
$8169:	7A           	ply
$816A:	FA           	plx
$816B:	68           	pla
$816C:	28           	plp
$816D:	18           	clc
$816E:	6B           	rtl
$816F:	08           	php
$8170:	C2 30        	rep	#$30
$8172:	48           	pha
$8173:	DA           	phx
$8174:	5A           	phy
$8175:	8B           	phb
$8176:	78           	sei
$8177:	F4           	db
$8178:	7F 7F AB AB  	adc	$ABAB7F,X
$817C:	B9           	db
$817D:	E2 E3        	sep	#$E3
$817F:	10 05        	bpl	$8186
$8181:	B9           	db
$8182:	A2 E4        	ldx	#$E4
$8184:	10 03        	bpl	$8189
$8186:	4C 44 82     	jmp	$8244
$8189:	20 09 84     	jsr	$8409
$818C:	22 72 05 C9  	jsl	$C90572
$8190:	00 09        	brk	#$09
$8192:	00 93        	brk	#$93
$8194:	10 C5        	bpl	$815B
$8196:	00 00        	brk	#$00
$8198:	FF           	db
$8199:	00 00        	brk	#$00
$819B:	8D C4 E0     	sta	$E0C4
$819E:	22 72 05 C9  	jsl	$C90572
$81A2:	00 09        	brk	#$09
$81A4:	00 93        	brk	#$93
$81A6:	10 C5        	bpl	$816D
$81A8:	01           	db
$81A9:	00 FF        	brk	#$FF
$81AB:	00 00        	brk	#$00
$81AD:	8D C8 E0     	sta	$E0C8
$81B0:	E2 20        	sep	#$20
$81B2:	AD C4 E0     	lda	$E0C4
$81B5:	EB           	db
$81B6:	AD C8 E0     	lda	$E0C8
$81B9:	22 98 10 C0  	jsl	$C01098
$81BD:	C2 20        	rep	#$20
$81BF:	8D B6 E0     	sta	$E0B6
$81C2:	22 EE 03 C9  	jsl	$C903EE
$81C6:	00 09        	brk	#$09
$81C8:	00 93        	brk	#$93
$81CA:	10 C5        	bpl	$8191
$81CC:	06           	db
$81CD:	00 85        	brk	#$85
$81CF:	00 22        	brk	#$22
$81D1:	EE           	db
$81D2:	03           	db
$81D3:	C9 00 09     	cmp	#$0900
$81D6:	00 93        	brk	#$93
$81D8:	10 C5        	bpl	$819F
$81DA:	08           	php
$81DB:	00 29        	brk	#$29
$81DD:	FF           	db
$81DE:	00 85        	brk	#$85
$81E0:	02 22        	cop	#$22
$81E2:	72 05        	adc	($05)
$81E4:	C9 00 09     	cmp	#$0900
$81E7:	00 93        	brk	#$93
$81E9:	10 C5        	bpl	$81B0
$81EB:	00 00        	brk	#$00
$81ED:	FF           	db
$81EE:	00 00        	brk	#$00
$81F0:	85           	db
$81F1:	0C           	db
$81F2:	22 72 05 C9  	jsl	$C90572
$81F6:	00 09        	brk	#$09
$81F8:	00 93        	brk	#$93
$81FA:	10 C5        	bpl	$81C1
$81FC:	04           	db
$81FD:	00 FF        	brk	#$FF
$81FF:	03           	db
$8200:	00 DA        	brk	#$DA