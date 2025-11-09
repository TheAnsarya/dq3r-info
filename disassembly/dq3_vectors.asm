; SNES 65816 Disassembly
; Bank $00: System/Boot code
; Address range: $FF90-$FFFF

$FF90:	FF           	db
$FF91:	FF           	db
$FF92:	FF           	db
$FF93:	FF           	db
$FF94:	FF           	db
$FF95:	FF           	db
$FF96:	FF           	db
$FF97:	FF           	db
$FF98:	78           	sei
$FF99:	18           	clc
$FF9A:	FB           	xce
$FF9B:	D8           	cld
$FF9C:	5C A4 04 C0  	jml	$C004A4
$FFA0:	5C E0 05 C0  	jml	$C005E0
$FFA4:	5C E3 0F C0  	jml	$C00FE3
$FFA8:	5C 8C 37 C7  	jml	$C7378C
$FFAC:	5C 4B 2A C0  	jml	$C02A4B
$FFB0:	42           	db
$FFB1:	34           	db
$FFB2:	41           	db
$FFB3:	51           	db
$FFB4:	33 4A        	and	$4A
$FFB6:	00 00        	brk	#$00
$FFB8:	00 00        	brk	#$00
$FFBA:	00 00        	brk	#$00
$FFBC:	00 00        	brk	#$00
$FFBE:	00 00        	brk	#$00
$FFC0:	44 52 41     	mvp	$4152
$FFC3:	47           	db
$FFC4:	4F           	db
$FFC5:	4E           	db
$FFC6:	51           	db
$FFC7:	55           	db
$FFC8:	45           	db
$FFC9:	53           	db
$FFCA:	54 33 20     	mvn	$2033
$FFCD:	20 20 20     	jsr	$2020
$FFD0:	20 20 20     	jsr	$2020
$FFD3:	20 20 35     	jsr	$3520
$FFD6:	02 0D        	cop	#$0D
$FFD8:	03           	db
$FFD9:	00 33        	brk	#$33
$FFDB:	00 8C        	brk	#$8C
$FFDD:	8B           	phb
$FFDE:	73 74        	adc	$74
$FFE0:	FF           	db
$FFE1:	FF           	db
$FFE2:	FF           	db
$FFE3:	FF           	db
$FFE4:	AC FF A8     	ldy	$A8FF
$FFE7:	FF           	db
$FFE8:	A4           	db
$FFE9:	FF           	db
$FFEA:	A0 FF        	ldy	#$FF
$FFEC:	A4           	db
$FFED:	FF           	db
$FFEE:	A4           	db
$FFEF:	FF           	db
$FFF0:	FF           	db
$FFF1:	FF           	db
$FFF2:	FF           	db
$FFF3:	FF           	db
$FFF4:	A4           	db
$FFF5:	FF           	db
$FFF6:	A4           	db
$FFF7:	FF           	db
$FFF8:	A4           	db
$FFF9:	FF           	db
$FFFA:	A0 FF        	ldy	#$FF
$FFFC:	98           	tya
$FFFD:	FF           	db
$FFFE:	A4           	db
$FFFF:	FF           	db