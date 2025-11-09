; SNES 65816 Disassembly
; Bank $00: System/Boot code
; Address range: $ff90-$ffff

$ff90:	FF           	db $ff91:	FF           	db $ff92:	FF           	db $ff93:	FF           	db $ff94:	FF           	db $ff95:	FF           	db $ff96:	FF           	db $ff97:	FF           	db $ff98:	78           	sei
$ff99:	18           	clc
$ff9a:	FB           	xce
$ff9b:	D8           	cld
$ff9c:	5C A4 04 C0  	jml	$c004a4
$ffa0:	5C E0 05 C0  	jml	$c005e0
$ffa4:	5C E3 0F C0  	jml	$c00fe3
$ffa8:	5C 8C 37 C7  	jml	$c7378c
$ffac:	5C 4B 2A C0  	jml	$c02a4b
$ffb0:	42           	db $ffb1:	34           	db $ffb2:	41           	db $ffb3:	51           	db $ffb4:	33 4A        	and	$4a
$ffb6:	00 00        	brk	#$00
$ffb8:	00 00        	brk	#$00
$ffba:	00 00        	brk	#$00
$ffbc:	00 00        	brk	#$00
$ffbe:	00 00        	brk	#$00
$ffc0:	44 52 41     	mvp	$4152
$ffc3:	47           	db $ffc4:	4F           	db $ffc5:	4E           	db $ffc6:	51           	db $ffc7:	55           	db $ffc8:	45           	db $ffc9:	53           	db $ffca:	54 33 20     	mvn	$2033
$ffcd:	20 20 20     	jsr	$2020
$ffd0:	20 20 20     	jsr	$2020
$ffd3:	20 20 35     	jsr	$3520
$ffd6:	02 0D        	cop	#$0d
$ffd8:	03           	db $ffd9:	00 33        	brk	#$33
$ffdb:	00 8C        	brk	#$8c
$ffdd:	8B           	phb
$ffde:	73 74        	adc	$74
$ffe0:	FF           	db $ffe1:	FF           	db $ffe2:	FF           	db $ffe3:	FF           	db $ffe4:	AC FF A8     	ldy	$a8ff
$ffe7:	FF           	db $ffe8:	A4           	db $ffe9:	FF           	db $ffea:	A0 FF        	ldy	#$ff
$ffec:	A4           	db $ffed:	FF           	db $ffee:	A4           	db $ffef:	FF           	db $fff0:	FF           	db $fff1:	FF           	db $fff2:	FF           	db $fff3:	FF           	db $fff4:	A4           	db $fff5:	FF           	db $fff6:	A4           	db $fff7:	FF           	db $fff8:	A4           	db $fff9:	FF           	db $fffa:	A0 FF        	ldy	#$ff
$fffc:	98           	tya
$fffd:	FF           	db $fffe:	A4           	db $ffff:	FF           	db