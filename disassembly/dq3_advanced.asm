; SNES 65816 Disassembly
; Bank $00: System/Boot code
; Address range: $8000-$8200

$8000:	05           	db $8001:	C9 00 09     	cmp	#$0900
$8004:	00 D8        	brk	#$d8
$8006:	41           	db $8007:	C5           	db $8008:	04           	db $8009:	00 FF        	brk	#$ff
$800b:	03           	db $800c:	00 DA        	brk	#$da
$800e:	AA           	tax
$800f:	22 72 05 C9  	jsl	$c90572
$8013:	00 04        	brk	#$04
$8015:	00 32        	brk	#$32
$8017:	42           	db $8018:	C5           	db $8019:	01           	db $801a:	00 FC        	brk	#$fc
$801c:	FF           	db $801d:	03           	db $801e:	8D B8 E0     	sta	$e0b8
$8021:	22 72 05 C9  	jsl	$c90572
$8025:	00 04        	brk	#$04
$8027:	00 32        	brk	#$32
$8029:	42           	db $802a:	C5           	db $802b:	00 00        	brk	#$00
$802d:	FF           	db $802e:	03           	db $802f:	00 AA        	brk	#$aa
$8031:	22 FD 67 C0  	jsl	$c067fd
$8035:	FA           	plx
$8036:	90 2E        	bcc	$8066
$8038:	22 EE 03 C9  	jsl	$c903ee
$803c:	00 09        	brk	#$09
$803e:	00 D8        	brk	#$d8
$8040:	41           	db $8041:	C5           	db $8042:	06           	db $8043:	00 85        	brk	#$85
$8045:	00 22        	brk	#$22
$8047:	EE           	db $8048:	03           	db $8049:	C9 00 09     	cmp	#$0900
$804c:	00 D8        	brk	#$d8
$804e:	41           	db $804f:	C5           	db $8050:	08           	php
$8051:	00 29        	brk	#$29
$8053:	FF           	db $8054:	00 85        	brk	#$85
$8056:	02 A9        	cop	#$a9
$8058:	0E           	db $8059:	00 20        	brk	#$20
$805b:	7A           	ply
$805c:	84           	db $805d:	AB           	plb
$805e:	C2 30        	rep	#$30
$8060:	7A           	ply
$8061:	FA           	plx
$8062:	68           	pla
$8063:	28           	plp
$8064:	38           	sec
$8065:	6B           	rtl
$8066:	AE 9A AE     	ldx	$ae9a
$8069:	22 52 90 C0  	jsl	$c09052
$806d:	AB           	plb
$806e:	C2 30        	rep	#$30
$8070:	7A           	ply
$8071:	FA           	plx
$8072:	68           	pla
$8073:	28           	plp
$8074:	18           	clc
$8075:	6B           	rtl
$8076:	08           	php
$8077:	C2 30        	rep	#$30
$8079:	48           	pha
$807a:	DA           	phx
$807b:	5A           	phy
$807c:	8B           	phb
$807d:	F4           	db $807e:	7F 7F AB AB  	adc	$abab7f,X
$8082:	AA           	tax
$8083:	22 72 05 C9  	jsl	$c90572
$8087:	00 09        	brk	#$09
$8089:	00 93        	brk	#$93
$808b:	42           	db $808c:	C5           	db $808d:	00 00        	brk	#$00
$808f:	FF           	db $8090:	00 00        	brk	#$00
$8092:	8D B2 E0     	sta	$e0b2
$8095:	22 72 05 C9  	jsl	$c90572
$8099:	00 09        	brk	#$09
$809b:	00 93        	brk	#$93
$809d:	42           	db $809e:	C5           	db $809f:	01           	db $80a0:	00 FF        	brk	#$ff
$80a2:	00 00        	brk	#$00
$80a4:	8D B4 E0     	sta	$e0b4
$80a7:	0D           	db $80a8:	B2           	db $80a9:	E0 D0        	cpx	#$d0
$80ab:	03           	db $80ac:	4C 66 81     	jmp	$8166
$80af:	E2 20        	sep	#$20
$80b1:	AD B2 E0     	lda	$e0b2
$80b4:	EB           	db $80b5:	AD B4 E0     	lda	$e0b4
$80b8:	22 98 10 C0  	jsl	$c01098
$80bc:	C2 20        	rep	#$20
$80be:	8D B6 E0     	sta	$e0b6
$80c1:	0A           	asl
$80c2:	22 D7 8F C0  	jsl	$c08fd7
$80c6:	B0 03        	bcs	$80cb
$80c8:	4C 66 81     	jmp	$8166
$80cb:	22 72 05 C9  	jsl	$c90572
$80cf:	00 09        	brk	#$09
$80d1:	00 93        	brk	#$93
$80d3:	42           	db $80d4:	C5           	db $80d5:	02 00        	cop	#$00
$80d7:	FF           	db $80d8:	00 00        	brk	#$00
$80da:	0A           	asl
$80db:	6D 46 FC     	adc	$fc46
$80de:	8D 46 FC     	sta	$fc46
$80e1:	22 72 05 C9  	jsl	$c90572
$80e5:	00 09        	brk	#$09
$80e7:	00 93        	brk	#$93
$80e9:	42           	db $80ea:	C5           	db $80eb:	03           	db $80ec:	00 FF        	brk	#$ff
$80ee:	00 00        	brk	#$00
$80f0:	0A           	asl
$80f1:	6D 48 FC     	adc	$fc48
$80f4:	8D 48 FC     	sta	$fc48
$80f7:	22 72 05 C9  	jsl	$c90572
$80fb:	00 09        	brk	#$09
$80fd:	00 93        	brk	#$93
$80ff:	42           	db $8100:	C5           	db $8101:	04           	db $8102:	00 FF        	brk	#$ff
$8104:	03           	db $8105:	00 DA        	brk	#$da
$8107:	AA           	tax
$8108:	22 72 05 C9  	jsl	$c90572
$810c:	00 04        	brk	#$04
$810e:	00 9C        	brk	#$9c
$8110:	42           	db $8111:	C5           	db $8112:	01           	db $8113:	00 FC        	brk	#$fc
$8115:	FF           	db $8116:	03           	db $8117:	8D B8 E0     	sta	$e0b8
$811a:	22 72 05 C9  	jsl	$c90572
$811e:	00 04        	brk	#$04
$8120:	00 9C        	brk	#$9c
$8122:	42           	db $8123:	C5           	db $8124:	00 00        	brk	#$00
$8126:	FF           	db $8127:	03           	db $8128:	00 AA        	brk	#$aa
$812a:	22 9E 68 C0  	jsl	$c0689e
$812e:	FA           	plx
$812f:	90 2E        	bcc	$815f
$8131:	22 EE 03 C9  	jsl	$c903ee
$8135:	00 09        	brk	#$09
$8137:	00 93        	brk	#$93
$8139:	42           	db $813a:	C5           	db $813b:	06           	db $813c:	00 85        	brk	#$85
$813e:	00 22        	brk	#$22
$8140:	EE           	db $8141:	03           	db $8142:	C9 00 09     	cmp	#$0900
$8145:	00 93        	brk	#$93
$8147:	42           	db $8148:	C5           	db $8149:	08           	php
$814a:	00 29        	brk	#$29
$814c:	FF           	db $814d:	00 85        	brk	#$85
$814f:	02 A9        	cop	#$a9
$8151:	10 00        	bpl	$8153
$8153:	20 7A 84     	jsr	$847a
$8156:	AB           	plb
$8157:	C2 30        	rep	#$30
$8159:	7A           	ply
$815a:	FA           	plx
$815b:	68           	pla
$815c:	28           	plp
$815d:	38           	sec
$815e:	6B           	rtl
$815f:	AE 9A AE     	ldx	$ae9a
$8162:	22 52 90 C0  	jsl	$c09052
$8166:	AB           	plb
$8167:	C2 30        	rep	#$30
$8169:	7A           	ply
$816a:	FA           	plx
$816b:	68           	pla
$816c:	28           	plp
$816d:	18           	clc
$816e:	6B           	rtl
$816f:	08           	php
$8170:	C2 30        	rep	#$30
$8172:	48           	pha
$8173:	DA           	phx
$8174:	5A           	phy
$8175:	8B           	phb
$8176:	78           	sei
$8177:	F4           	db $8178:	7F 7F AB AB  	adc	$abab7f,X
$817c:	B9           	db $817d:	E2 E3        	sep	#$e3
$817f:	10 05        	bpl	$8186
$8181:	B9           	db $8182:	A2 E4        	ldx	#$e4
$8184:	10 03        	bpl	$8189
$8186:	4C 44 82     	jmp	$8244
$8189:	20 09 84     	jsr	$8409
$818c:	22 72 05 C9  	jsl	$c90572
$8190:	00 09        	brk	#$09
$8192:	00 93        	brk	#$93
$8194:	10 C5        	bpl	$815b
$8196:	00 00        	brk	#$00
$8198:	FF           	db $8199:	00 00        	brk	#$00
$819b:	8D C4 E0     	sta	$e0c4
$819e:	22 72 05 C9  	jsl	$c90572
$81a2:	00 09        	brk	#$09
$81a4:	00 93        	brk	#$93
$81a6:	10 C5        	bpl	$816d
$81a8:	01           	db $81a9:	00 FF        	brk	#$ff
$81ab:	00 00        	brk	#$00
$81ad:	8D C8 E0     	sta	$e0c8
$81b0:	E2 20        	sep	#$20
$81b2:	AD C4 E0     	lda	$e0c4
$81b5:	EB           	db $81b6:	AD C8 E0     	lda	$e0c8
$81b9:	22 98 10 C0  	jsl	$c01098
$81bd:	C2 20        	rep	#$20
$81bf:	8D B6 E0     	sta	$e0b6
$81c2:	22 EE 03 C9  	jsl	$c903ee
$81c6:	00 09        	brk	#$09
$81c8:	00 93        	brk	#$93
$81ca:	10 C5        	bpl	$8191
$81cc:	06           	db $81cd:	00 85        	brk	#$85
$81cf:	00 22        	brk	#$22
$81d1:	EE           	db $81d2:	03           	db $81d3:	C9 00 09     	cmp	#$0900
$81d6:	00 93        	brk	#$93
$81d8:	10 C5        	bpl	$819f
$81da:	08           	php
$81db:	00 29        	brk	#$29
$81dd:	FF           	db $81de:	00 85        	brk	#$85
$81e0:	02 22        	cop	#$22
$81e2:	72 05        	adc	($05)
$81e4:	C9 00 09     	cmp	#$0900
$81e7:	00 93        	brk	#$93
$81e9:	10 C5        	bpl	$81b0
$81eb:	00 00        	brk	#$00
$81ed:	FF           	db $81ee:	00 00        	brk	#$00
$81f0:	85           	db $81f1:	0C           	db $81f2:	22 72 05 C9  	jsl	$c90572
$81f6:	00 09        	brk	#$09
$81f8:	00 93        	brk	#$93
$81fa:	10 C5        	bpl	$81c1
$81fc:	04           	db $81fd:	00 FF        	brk	#$ff
$81ff:	03           	db $8200:	00 DA        	brk	#$da