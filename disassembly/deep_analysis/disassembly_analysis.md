# Dragon Quest III - Deep Disassembly Analysis

## ROM Information
- **File:** Dragon Quest III - english (patched).smc
- **Size:** 6,291,456 bytes
- **Code Regions Found:** 105

## Interrupt Vectors

| Vector | Address |
|--------|---------|
| cop_native | $e2fb |
| brk_native | $8b30 |
| abort_native | $00a9 |
| nmi_native | $ab48 |
| unused_native | $80a9 |
| irq_native | $008d |
| unused1 | $a921 |
| unused2 | $8d00 |
| cop_emulation | $2101 |
| unused3 | $028d |
| abort_emulation | $8d21 |
| nmi_emulation | $2103 |
| reset | $058d |
| irq_emulation | $8d21 |

## Code Regions

### Region 1: Subroutine
- **Address Range:** $9000 - $9013
- **Size:** 20 bytes
- **Bank:** 0
- **Instructions:** 17

**First Instructions:**
- `db $1e` - Unknown opcode $1e
- `db $00` - Unknown opcode $00
- `LDA #$55` - Load accumulator immediate
- `db $55` - Unknown opcode $55
- `db $9d` - Unknown opcode $9d
- `db $1f` - Unknown opcode $1f
- `db $dd` - Unknown opcode $dd
- `db $ca` - Unknown opcode $ca
- `db $ca` - Unknown opcode $ca
- `BPL #$f9` - Branch plus
- ... (7 more instructions)

### Region 2: Subroutine
- **Address Range:** $b000 - $b038
- **Size:** 57 bytes
- **Bank:** 0
- **Instructions:** 38

**First Instructions:**
- `JSR $34be` - Jump subroutine
- `db $bd` - Unknown opcode $bd
- `db $88` - Unknown opcode $88
- `db $89` - Unknown opcode $89
- `JSR $34be` - Jump subroutine
- `db $bd` - Unknown opcode $bd
- `db $8a` - Unknown opcode $8a
- `db $89` - Unknown opcode $89
- `JSR $34be` - Jump subroutine
- `db $bd` - Unknown opcode $bd
- ... (28 more instructions)

### Region 3: Subroutine
- **Address Range:** $f000 - $f00d
- **Size:** 14 bytes
- **Bank:** 0
- **Instructions:** 10

**First Instructions:**
- `JSR $74a9` - Jump subroutine
- `BCC #$09` - Branch carry clear
- `db $ab` - Unknown opcode $ab
- `REP #$30` - Reset processor status
- `db $7a` - Unknown opcode $7a
- `db $fa` - Unknown opcode $fa
- `db $68` - Unknown opcode $68
- `db $28` - Unknown opcode $28
- `SEC` - Set carry flag
- `RTL` - Return from subroutine long

### Region 4: Subroutine
- **Address Range:** $e000 - $e5d3
- **Size:** 1492 bytes
- **Bank:** 0
- **Instructions:** 1198

**First Instructions:**
- `CLC` - Clear carry flag
- `db $65` - Unknown opcode $65
- `CLC` - Clear carry flag
- `db $85` - Unknown opcode $85
- `db $1a` - Unknown opcode $1a
- `LDA $4214` - Load accumulator absolute
- `db $8f` - Unknown opcode $8f
- `db $f9` - Unknown opcode $f9
- `BEQ #$7e` - Branch equal
- `LDA #$00` - Load accumulator immediate
- ... (1188 more instructions)

### Region 5: Subroutine
- **Address Range:** $8000 - $82b9
- **Size:** 698 bytes
- **Bank:** 0
- **Instructions:** 512

**First Instructions:**
- `db $26` - Unknown opcode $26
- `db $88` - Unknown opcode $88
- `db $81` - Unknown opcode $81
- `db $89` - Unknown opcode $89
- `LDA $e3d0` - Load accumulator absolute
- `db $48` - Unknown opcode $48
- `db $4a` - Unknown opcode $4a
- `db $4a` - Unknown opcode $4a
- `db $4a` - Unknown opcode $4a
- `db $0a` - Unknown opcode $0a
- ... (502 more instructions)

### Region 6: Subroutine
- **Address Range:** $e000 - $e01f
- **Size:** 32 bytes
- **Bank:** 0
- **Instructions:** 22

**First Instructions:**
- `db $e0` - Unknown opcode $e0
- `BPL #$00` - Branch plus
- `BCC #$f1` - Branch carry clear
- `db $a2` - Unknown opcode $a2
- `db $00` - Unknown opcode $00
- `db $00` - Unknown opcode $00
- `db $bd` - Unknown opcode $bd
- `db $d6` - Unknown opcode $d6
- `db $96` - Unknown opcode $96
- `BMI #$13` - Branch minus
- ... (12 more instructions)

### Region 7: Subroutine
- **Address Range:** $d000 - $d29f
- **Size:** 672 bytes
- **Bank:** 0
- **Instructions:** 507

**First Instructions:**
- `BPL #$50` - Branch plus
- `db $15` - Unknown opcode $15
- `BVC #$22` - Branch overflow clear
- `BVC #$27` - Branch overflow clear
- `BVC #$34` - Branch overflow clear
- `BVC #$39` - Branch overflow clear
- `BVC #$46` - Branch overflow clear
- `BVC #$4b` - Branch overflow clear
- `BVC #$a6` - Branch overflow clear
- `db $04` - Unknown opcode $04
- ... (497 more instructions)

### Region 8: Subroutine
- **Address Range:** $e000 - $e00a
- **Size:** 11 bytes
- **Bank:** 0
- **Instructions:** 11

**First Instructions:**
- `db $03` - Unknown opcode $03
- `db $00` - Unknown opcode $00
- `CLC` - Clear carry flag
- `db $63` - Unknown opcode $63
- `db $01` - Unknown opcode $01
- `db $0a` - Unknown opcode $0a
- `db $aa` - Unknown opcode $aa
- `db $68` - Unknown opcode $68
- `db $fc` - Unknown opcode $fc
- `db $1c` - Unknown opcode $1c
- ... (1 more instructions)

### Region 9: Subroutine
- **Address Range:** $f000 - $f002
- **Size:** 3 bytes
- **Bank:** 0
- **Instructions:** 3

**First Instructions:**
- `db $24` - Unknown opcode $24
- `CLC` - Clear carry flag
- `RTS` - Return from subroutine

### Region 10: Subroutine
- **Address Range:** $8000 - $8007
- **Size:** 8 bytes
- **Bank:** 0
- **Instructions:** 6

**First Instructions:**
- `db $01` - Unknown opcode $01
- `db $83` - Unknown opcode $83
- `db $01` - Unknown opcode $01
- `db $68` - Unknown opcode $68
- `JSR $8008` - Jump subroutine
- `RTS` - Return from subroutine

### Region 11: Subroutine
- **Address Range:** $9000 - $9014
- **Size:** 21 bytes
- **Bank:** 0
- **Instructions:** 15

**First Instructions:**
- `db $85` - Unknown opcode $85
- `db $00` - Unknown opcode $00
- `BRA #$e4` - Branch always
- `LDA #$10` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSL $c0133e` - Jump subroutine long
- `CLC` - Clear carry flag
- `db $69` - Unknown opcode $69
- `BPL #$00` - Branch plus
- `CLC` - Clear carry flag
- ... (5 more instructions)

### Region 12: Subroutine
- **Address Range:** $a000 - $a022
- **Size:** 35 bytes
- **Bank:** 0
- **Instructions:** 17

**First Instructions:**
- `STA $be81` - Store accumulator absolute
- `STZ $be83` - Store zero absolute
- `JSL $c1a867` - Jump subroutine long
- `db $44` - Unknown opcode $44
- `db $01` - Unknown opcode $01
- `JSL $c43a42` - Jump subroutine long
- `db $06` - Unknown opcode $06
- `db $fd` - Unknown opcode $fd
- `db $ff` - Unknown opcode $ff
- `JSL $c2ca98` - Jump subroutine long
- ... (7 more instructions)

### Region 13: Subroutine
- **Address Range:** $b000 - $b053
- **Size:** 84 bytes
- **Bank:** 0
- **Instructions:** 56

**First Instructions:**
- `db $2b` - Unknown opcode $2b
- `db $cb` - Unknown opcode $cb
- `REP #$51` - Reset processor status
- `JSR $0010` - Jump subroutine
- `BEQ #$07` - Branch equal
- `LDA #$00` - Load accumulator immediate
- `db $02` - Unknown opcode $02
- `db $03` - Unknown opcode $03
- `db $01` - Unknown opcode $01
- `db $83` - Unknown opcode $83
- ... (46 more instructions)

### Region 14: Subroutine
- **Address Range:** $c000 - $c006
- **Size:** 7 bytes
- **Bank:** 0
- **Instructions:** 5

**First Instructions:**
- `BPL #$00` - Branch plus
- `db $99` - Unknown opcode $99
- `BVC #$20` - Branch overflow clear
- `CLC` - Clear carry flag
- `RTS` - Return from subroutine

### Region 15: Subroutine
- **Address Range:** $d000 - $d013
- **Size:** 20 bytes
- **Bank:** 0
- **Instructions:** 13

**First Instructions:**
- `db $8e` - Unknown opcode $8e
- `db $cf` - Unknown opcode $cf
- `JSR $cf3b` - Jump subroutine
- `JSR $cf31` - Jump subroutine
- `db $68` - Unknown opcode $68
- `STA $2428` - Store accumulator absolute
- `db $ab` - Unknown opcode $ab
- `REP #$30` - Reset processor status
- `db $7a` - Unknown opcode $7a
- `db $fa` - Unknown opcode $fa
- ... (3 more instructions)

### Region 16: Subroutine
- **Address Range:** $a000 - $a024
- **Size:** 37 bytes
- **Bank:** 0
- **Instructions:** 19

**First Instructions:**
- `db $0a` - Unknown opcode $0a
- `JSR $203b` - Jump subroutine
- `JSL $c31b8d` - Jump subroutine long
- `db $ee` - Unknown opcode $ee
- `db $92` - Unknown opcode $92
- `db $33` - Unknown opcode $33
- `LDA $3392` - Load accumulator absolute
- `BEQ #$0c` - Branch equal
- `JSL $c325bd` - Jump subroutine long
- `JSL $c31dba` - Jump subroutine long
- ... (9 more instructions)

### Region 17: Subroutine
- **Address Range:** $c000 - $c004
- **Size:** 5 bytes
- **Bank:** 0
- **Instructions:** 3

**First Instructions:**
- `db $0a` - Unknown opcode $0a
- `STA $2a74` - Store accumulator absolute
- `RTS` - Return from subroutine

### Region 18: Interrupt Handler
- **Address Range:** $d000 - $d00f
- **Size:** 16 bytes
- **Bank:** 0
- **Instructions:** 13

**First Instructions:**
- `db $08` - Unknown opcode $08
- `db $0a` - Unknown opcode $0a
- `db $aa` - Unknown opcode $aa
- `db $bf` - Unknown opcode $bf
- `db $0e` - Unknown opcode $0e
- `BVC #$c3` - Branch overflow clear
- `db $aa` - Unknown opcode $aa
- `db $bd` - Unknown opcode $bd
- `db $00` - Unknown opcode $00
- `db $00` - Unknown opcode $00
- ... (3 more instructions)

### Region 19: Subroutine
- **Address Range:** $e000 - $e003
- **Size:** 4 bytes
- **Bank:** 0
- **Instructions:** 4

**First Instructions:**
- `db $aa` - Unknown opcode $aa
- `db $bf` - Unknown opcode $bf
- `db $12` - Unknown opcode $12
- `RTS` - Return from subroutine

### Region 20: Subroutine
- **Address Range:** $f000 - $f060
- **Size:** 97 bytes
- **Bank:** 0
- **Instructions:** 43

**First Instructions:**
- `JSL $c32b70` - Jump subroutine long
- `JSL $c35512` - Jump subroutine long
- `db $a2` - Unknown opcode $a2
- `db $07` - Unknown opcode $07
- `db $00` - Unknown opcode $00
- `JSL $c32b70` - Jump subroutine long
- `JSL $c34f61` - Jump subroutine long
- `db $a2` - Unknown opcode $a2
- `db $03` - Unknown opcode $03
- `db $00` - Unknown opcode $00
- ... (33 more instructions)

### Region 21: Subroutine
- **Address Range:** $8000 - $805c
- **Size:** 93 bytes
- **Bank:** 0
- **Instructions:** 40

**First Instructions:**
- `db $2c` - Unknown opcode $2c
- `db $c3` - Unknown opcode $c3
- `JSL $c35522` - Jump subroutine long
- `LDA #$01` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSL $c32b8d` - Jump subroutine long
- `LDA #$01` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSL $c32b8d` - Jump subroutine long
- `JSL $c34efc` - Jump subroutine long
- ... (30 more instructions)

### Region 22: Subroutine
- **Address Range:** $9000 - $903e
- **Size:** 63 bytes
- **Bank:** 0
- **Instructions:** 24

**First Instructions:**
- `BCC #$a9` - Branch carry clear
- `db $00` - Unknown opcode $00
- `db $00` - Unknown opcode $00
- `JSL $c33d5c` - Jump subroutine long
- `JSL $c3484a` - Jump subroutine long
- `db $a2` - Unknown opcode $a2
- `db $0c` - Unknown opcode $0c
- `db $00` - Unknown opcode $00
- `JSL $c32bc2` - Jump subroutine long
- `JSL $c32bd2` - Jump subroutine long
- ... (14 more instructions)

### Region 23: Subroutine
- **Address Range:** $a000 - $a121
- **Size:** 290 bytes
- **Bank:** 0
- **Instructions:** 122

**First Instructions:**
- `JSL $c32baf` - Jump subroutine long
- `LDA #$00` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSL $c33d5c` - Jump subroutine long
- `LDA #$88` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSL $c32baf` - Jump subroutine long
- `LDA #$90` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSL $c32baf` - Jump subroutine long
- ... (112 more instructions)

### Region 24: Subroutine
- **Address Range:** $b000 - $b016
- **Size:** 23 bytes
- **Bank:** 0
- **Instructions:** 11

**First Instructions:**
- `JMP $b00a` - Jump absolute
- `JSL $c3305f` - Jump subroutine long
- `LDA $2bf0` - Load accumulator absolute
- `db $c9` - Unknown opcode $c9
- `db $00` - Unknown opcode $00
- `db $00` - Unknown opcode $00
- `BEQ #$03` - Branch equal
- `JMP $af20` - Jump absolute
- `JMP $af02` - Jump absolute
- `CLC` - Clear carry flag
- ... (1 more instructions)

### Region 25: Interrupt Handler
- **Address Range:** $c000 - $c001
- **Size:** 2 bytes
- **Bank:** 0
- **Instructions:** 2

**First Instructions:**
- `db $f7` - Unknown opcode $f7
- `RTI` - Return from interrupt

### Region 26: Interrupt Handler
- **Address Range:** $d000 - $d0cb
- **Size:** 204 bytes
- **Bank:** 0
- **Instructions:** 111

**First Instructions:**
- `db $cc` - Unknown opcode $cc
- `db $2b` - Unknown opcode $2b
- `db $29` - Unknown opcode $29
- `db $ff` - Unknown opcode $ff
- `db $00` - Unknown opcode $00
- `STA $33e4` - Store accumulator absolute
- `db $0e` - Unknown opcode $0e
- `SEP #$33` - Set processor status
- `db $2e` - Unknown opcode $2e
- `db $e4` - Unknown opcode $e4
- ... (101 more instructions)

### Region 27: Subroutine
- **Address Range:** $9000 - $9004
- **Size:** 5 bytes
- **Bank:** 0
- **Instructions:** 3

**First Instructions:**
- `db $af` - Unknown opcode $af
- `JSR $b783` - Jump subroutine
- `RTS` - Return from subroutine

### Region 28: Subroutine
- **Address Range:** $a000 - $a0c4
- **Size:** 197 bytes
- **Bank:** 0
- **Instructions:** 104

**First Instructions:**
- `db $ba` - Unknown opcode $ba
- `db $2a` - Unknown opcode $2a
- `db $c0` - Unknown opcode $c0
- `db $12` - Unknown opcode $12
- `db $b2` - Unknown opcode $b2
- `db $c4` - Unknown opcode $c4
- `db $bd` - Unknown opcode $bd
- `BRA #$48` - Branch always
- `JSL $c04604` - Jump subroutine long
- `db $6d` - Unknown opcode $6d
- ... (94 more instructions)

### Region 29: Subroutine
- **Address Range:** $e000 - $e00e
- **Size:** 15 bytes
- **Bank:** 0
- **Instructions:** 10

**First Instructions:**
- `db $f6` - Unknown opcode $f6
- `SEP #$c9` - Set processor status
- `JSL $c9e28d` - Jump subroutine long
- `db $ab` - Unknown opcode $ab
- `REP #$30` - Reset processor status
- `db $7a` - Unknown opcode $7a
- `db $fa` - Unknown opcode $fa
- `db $68` - Unknown opcode $68
- `db $28` - Unknown opcode $28
- `RTL` - Return from subroutine long

### Region 30: Subroutine
- **Address Range:** $f000 - $f00d
- **Size:** 14 bytes
- **Bank:** 0
- **Instructions:** 10

**First Instructions:**
- `JMP $700c` - Jump absolute
- `db $02` - Unknown opcode $02
- `db $a3` - Unknown opcode $a3
- `db $01` - Unknown opcode $01
- `db $1a` - Unknown opcode $1a
- `db $83` - Unknown opcode $83
- `db $01` - Unknown opcode $01
- `JMP $6feb` - Jump absolute
- `db $68` - Unknown opcode $68
- `RTL` - Return from subroutine long

### Region 31: Interrupt Handler
- **Address Range:** $8000 - $804f
- **Size:** 80 bytes
- **Bank:** 0
- **Instructions:** 36

**First Instructions:**
- `db $66` - Unknown opcode $66
- `db $ac` - Unknown opcode $ac
- `db $cd` - Unknown opcode $cd
- `BCS #$03` - Branch carry set
- `JMP $80eb` - Jump absolute
- `JSL $c569c9` - Jump subroutine long
- `JMP $80b5` - Jump absolute
- `JSL $c737be` - Jump subroutine long
- `db $ef` - Unknown opcode $ef
- `db $0e` - Unknown opcode $0e
- ... (26 more instructions)

### Region 32: Subroutine
- **Address Range:** $9000 - $900a
- **Size:** 11 bytes
- **Bank:** 0
- **Instructions:** 5

**First Instructions:**
- `db $d9` - Unknown opcode $d9
- `db $c1` - Unknown opcode $c1
- `JSL $c56984` - Jump subroutine long
- `JSL $ccd066` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 33: Subroutine
- **Address Range:** $9000 - $9020
- **Size:** 33 bytes
- **Bank:** 0
- **Instructions:** 18

**First Instructions:**
- `LDA #$00` - Load accumulator immediate
- `JSR $418d` - Jump subroutine
- `db $42` - Unknown opcode $42
- `LDA #$08` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `STA $4243` - Store accumulator absolute
- `LDA #$02` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `STA $4245` - Store accumulator absolute
- `db $a2` - Unknown opcode $a2
- ... (8 more instructions)

### Region 34: Subroutine
- **Address Range:** $f000 - $f041
- **Size:** 66 bytes
- **Bank:** 0
- **Instructions:** 50

**First Instructions:**
- `db $03` - Unknown opcode $03
- `db $00` - Unknown opcode $00
- `BEQ #$15` - Branch equal
- `db $c9` - Unknown opcode $c9
- `BPL #$00` - Branch plus
- `BEQ #$10` - Branch equal
- `db $c9` - Unknown opcode $c9
- `db $14` - Unknown opcode $14
- `db $00` - Unknown opcode $00
- `BEQ #$0b` - Branch equal
- ... (40 more instructions)

### Region 35: Subroutine
- **Address Range:** $b000 - $b002
- **Size:** 3 bytes
- **Bank:** 0
- **Instructions:** 3

**First Instructions:**
- `db $e3` - Unknown opcode $e3
- `db $c1` - Unknown opcode $c1
- `RTL` - Return from subroutine long

### Region 36: Subroutine
- **Address Range:** $e000 - $e00a
- **Size:** 11 bytes
- **Bank:** 0
- **Instructions:** 9

**First Instructions:**
- `db $00` - Unknown opcode $00
- `BRA #$03` - Branch always
- `LDA #$00` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `db $99` - Unknown opcode $99
- `db $65` - Unknown opcode $65
- `db $d1` - Unknown opcode $d1
- `CLC` - Clear carry flag
- `RTL` - Return from subroutine long

### Region 37: Subroutine
- **Address Range:** $f000 - $f01d
- **Size:** 30 bytes
- **Bank:** 0
- **Instructions:** 22

**First Instructions:**
- `BCC #$f6` - Branch carry clear
- `JSL $c4297c` - Jump subroutine long
- `db $01` - Unknown opcode $01
- `CLC` - Clear carry flag
- `db $a2` - Unknown opcode $a2
- `db $00` - Unknown opcode $00
- `db $00` - Unknown opcode $00
- `db $9b` - Unknown opcode $9b
- `JSL $c429da` - Jump subroutine long
- `db $01` - Unknown opcode $01
- ... (12 more instructions)

### Region 38: Subroutine
- **Address Range:** $9000 - $901e
- **Size:** 31 bytes
- **Bank:** 0
- **Instructions:** 15

**First Instructions:**
- `db $00` - Unknown opcode $00
- `db $99` - Unknown opcode $99
- `db $65` - Unknown opcode $65
- `db $d1` - Unknown opcode $d1
- `JSR $901f` - Jump subroutine
- `JSL $c6594a` - Jump subroutine long
- `JSL $c65c38` - Jump subroutine long
- `db $7a` - Unknown opcode $7a
- `JSL $c76597` - Jump subroutine long
- `BCS #$03` - Branch carry set
- ... (5 more instructions)

### Region 39: Interrupt Handler
- **Address Range:** $d000 - $d011
- **Size:** 18 bytes
- **Bank:** 0
- **Instructions:** 15

**First Instructions:**
- `db $28` - Unknown opcode $28
- `db $42` - Unknown opcode $42
- `db $b7` - Unknown opcode $b7
- `db $68` - Unknown opcode $68
- `BCS #$40` - Branch carry set
- `db $2c` - Unknown opcode $2c
- `db $42` - Unknown opcode $42
- `db $b7` - Unknown opcode $b7
- `db $68` - Unknown opcode $68
- `BMI #$41` - Branch minus
- ... (5 more instructions)

### Region 40: Subroutine
- **Address Range:** $9000 - $905b
- **Size:** 92 bytes
- **Bank:** 0
- **Instructions:** 52

**First Instructions:**
- `db $33` - Unknown opcode $33
- `JSL $c43672` - Jump subroutine long
- `db $01` - Unknown opcode $01
- `db $fe` - Unknown opcode $fe
- `db $ff` - Unknown opcode $ff
- `db $c9` - Unknown opcode $c9
- `db $ff` - Unknown opcode $ff
- `db $00` - Unknown opcode $00
- `BCC #$0f` - Branch carry clear
- `JSL $c1a8d4` - Jump subroutine long
- ... (42 more instructions)

### Region 41: Subroutine
- **Address Range:** $a000 - $a03c
- **Size:** 61 bytes
- **Bank:** 0
- **Instructions:** 41

**First Instructions:**
- `LDA #$2b` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSR $203d` - Jump subroutine
- `BCC #$06` - Branch carry clear
- `LDA #$40` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `db $0c` - Unknown opcode $0c
- `db $b6` - Unknown opcode $b6
- `db $2b` - Unknown opcode $2b
- `LDA #$46` - Load accumulator immediate
- ... (31 more instructions)

### Region 42: Subroutine
- **Address Range:** $c000 - $c050
- **Size:** 81 bytes
- **Bank:** 0
- **Instructions:** 52

**First Instructions:**
- `JSR $7bc2` - Jump subroutine
- `LDA $63dc` - Load accumulator absolute
- `CLC` - Clear carry flag
- `db $6d` - Unknown opcode $6d
- `db $dc` - Unknown opcode $dc
- `db $65` - Unknown opcode $65
- `db $2d` - Unknown opcode $2d
- `db $14` - Unknown opcode $14
- `db $6f` - Unknown opcode $6f
- `STA $63dc` - Store accumulator absolute
- ... (42 more instructions)

### Region 43: Subroutine
- **Address Range:** $d000 - $d058
- **Size:** 89 bytes
- **Bank:** 0
- **Instructions:** 52

**First Instructions:**
- `LDA $6c54` - Load accumulator absolute
- `CLC` - Clear carry flag
- `db $6d` - Unknown opcode $6d
- `db $d4` - Unknown opcode $d4
- `db $6c` - Unknown opcode $6c
- `STA $6c54` - Store accumulator absolute
- `LDA $6dd4` - Load accumulator absolute
- `CLC` - Clear carry flag
- `db $6d` - Unknown opcode $6d
- `db $54` - Unknown opcode $54
- ... (42 more instructions)

### Region 44: Subroutine
- **Address Range:** $e000 - $e000
- **Size:** 1 bytes
- **Bank:** 0
- **Instructions:** 1

**First Instructions:**
- `RTL` - Return from subroutine long

### Region 45: Subroutine
- **Address Range:** $9000 - $9012
- **Size:** 19 bytes
- **Bank:** 0
- **Instructions:** 7

**First Instructions:**
- `LDA $33c8` - Load accumulator absolute
- `STA $7fd0` - Store accumulator absolute
- `LDA $33ca` - Load accumulator absolute
- `STA $7fd2` - Store accumulator absolute
- `LDA $33cc` - Load accumulator absolute
- `STA $7fd4` - Store accumulator absolute
- `RTL` - Return from subroutine long

### Region 46: Subroutine
- **Address Range:** $8000 - $8004
- **Size:** 5 bytes
- **Bank:** 0
- **Instructions:** 2

**First Instructions:**
- `JSL $cadcea` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 47: Subroutine
- **Address Range:** $9000 - $9004
- **Size:** 5 bytes
- **Bank:** 0
- **Instructions:** 2

**First Instructions:**
- `JSL $ca0fc2` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 48: Subroutine
- **Address Range:** $a000 - $a059
- **Size:** 90 bytes
- **Bank:** 0
- **Instructions:** 38

**First Instructions:**
- `db $03` - Unknown opcode $03
- `JMP $200b` - Jump absolute
- `JSL $ccd276` - Jump subroutine long
- `JMP $1ff9` - Jump absolute
- `JSL $cda724` - Jump subroutine long
- `JSL $ccd6ed` - Jump subroutine long
- `LDA $3436` - Load accumulator absolute
- `db $c9` - Unknown opcode $c9
- `db $e8` - Unknown opcode $e8
- `db $03` - Unknown opcode $03
- ... (28 more instructions)

### Region 49: Subroutine
- **Address Range:** $b000 - $b039
- **Size:** 58 bytes
- **Bank:** 0
- **Instructions:** 28

**First Instructions:**
- `JMP $a9c7` - Jump absolute
- `db $35` - Unknown opcode $35
- `db $00` - Unknown opcode $00
- `db $a2` - Unknown opcode $a2
- `db $5e` - Unknown opcode $5e
- `db $00` - Unknown opcode $00
- `JSL $c75305` - Jump subroutine long
- `db $02` - Unknown opcode $02
- `JMP $300c` - Jump absolute
- `JSL $ca3381` - Jump subroutine long
- ... (18 more instructions)

### Region 50: Subroutine
- **Address Range:** $c000 - $c000
- **Size:** 1 bytes
- **Bank:** 0
- **Instructions:** 1

**First Instructions:**
- `RTL` - Return from subroutine long

### Region 51: Subroutine
- **Address Range:** $d000 - $d039
- **Size:** 58 bytes
- **Bank:** 0
- **Instructions:** 25

**First Instructions:**
- `db $00` - Unknown opcode $00
- `BEQ #$03` - Branch equal
- `JMP $500c` - Jump absolute
- `LDA #$20` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `db $1c` - Unknown opcode $1c
- `JMP $a935` - Jump absolute
- `SEI` - Set interrupt disable
- `db $00` - Unknown opcode $00
- `JSL $c77365` - Jump subroutine long
- ... (15 more instructions)

### Region 52: Subroutine
- **Address Range:** $e000 - $e007
- **Size:** 8 bytes
- **Bank:** 0
- **Instructions:** 5

**First Instructions:**
- `JSL $c77889` - Jump subroutine long
- `db $a8` - Unknown opcode $a8
- `db $e6` - Unknown opcode $e6
- `db $ca` - Unknown opcode $ca
- `RTL` - Return from subroutine long

### Region 53: Subroutine
- **Address Range:** $f000 - $f00a
- **Size:** 11 bytes
- **Bank:** 0
- **Instructions:** 8

**First Instructions:**
- `db $1f` - Unknown opcode $1f
- `db $d9` - Unknown opcode $d9
- `db $ca` - Unknown opcode $ca
- `JSL $c77889` - Jump subroutine long
- `db $03` - Unknown opcode $03
- `db $e9` - Unknown opcode $e9
- `db $ca` - Unknown opcode $ca
- `RTL` - Return from subroutine long

### Region 54: Subroutine
- **Address Range:** $8000 - $8019
- **Size:** 26 bytes
- **Bank:** 0
- **Instructions:** 13

**First Instructions:**
- `db $a2` - Unknown opcode $a2
- `db $00` - Unknown opcode $00
- `db $00` - Unknown opcode $00
- `JSL $c743c6` - Jump subroutine long
- `LDA #$80` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `db $a2` - Unknown opcode $a2
- `db $04` - Unknown opcode $04
- `db $00` - Unknown opcode $00
- `JSL $c743c6` - Jump subroutine long
- ... (3 more instructions)

### Region 55: Subroutine
- **Address Range:** $9000 - $9010
- **Size:** 17 bytes
- **Bank:** 0
- **Instructions:** 8

**First Instructions:**
- `db $00` - Unknown opcode $00
- `JSL $c62407` - Jump subroutine long
- `db $a2` - Unknown opcode $a2
- `SEC` - Set carry flag
- `db $00` - Unknown opcode $00
- `JSL $c66696` - Jump subroutine long
- `JSL $ccb8bf` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 56: Subroutine
- **Address Range:** $a000 - $a00a
- **Size:** 11 bytes
- **Bank:** 0
- **Instructions:** 8

**First Instructions:**
- `db $bb` - Unknown opcode $bb
- `db $14` - Unknown opcode $14
- `db $c6` - Unknown opcode $c6
- `db $a2` - Unknown opcode $a2
- `db $67` - Unknown opcode $67
- `db $00` - Unknown opcode $00
- `JSL $c614bb` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 57: Subroutine
- **Address Range:** $b000 - $b00e
- **Size:** 15 bytes
- **Bank:** 0
- **Instructions:** 9

**First Instructions:**
- `db $96` - Unknown opcode $96
- `db $66` - Unknown opcode $66
- `db $c6` - Unknown opcode $c6
- `db $a2` - Unknown opcode $a2
- `db $02` - Unknown opcode $02
- `db $01` - Unknown opcode $01
- `JSL $c66696` - Jump subroutine long
- `JSL $cbeadb` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 58: Subroutine
- **Address Range:** $c000 - $c00a
- **Size:** 11 bytes
- **Bank:** 0
- **Instructions:** 5

**First Instructions:**
- `db $43` - Unknown opcode $43
- `db $c7` - Unknown opcode $c7
- `JSL $cbebf6` - Jump subroutine long
- `JSL $c59384` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 59: Subroutine
- **Address Range:** $d000 - $d00f
- **Size:** 16 bytes
- **Bank:** 0
- **Instructions:** 7

**First Instructions:**
- `db $00` - Unknown opcode $00
- `JSL $c737be` - Jump subroutine long
- `db $68` - Unknown opcode $68
- `db $00` - Unknown opcode $00
- `JSL $cdacd2` - Jump subroutine long
- `JSL $ccd383` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 60: Subroutine
- **Address Range:** $e000 - $e011
- **Size:** 18 bytes
- **Bank:** 0
- **Instructions:** 10

**First Instructions:**
- `db $cd` - Unknown opcode $cd
- `SEI` - Set interrupt disable
- `db $c7` - Unknown opcode $c7
- `LDA #$ce` - Load accumulator immediate
- `db $03` - Unknown opcode $03
- `JSL $c778e3` - Jump subroutine long
- `LDA #$ce` - Load accumulator immediate
- `db $03` - Unknown opcode $03
- `JSL $c778e7` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 61: Subroutine
- **Address Range:** $f000 - $f081
- **Size:** 130 bytes
- **Bank:** 0
- **Instructions:** 70

**First Instructions:**
- `STA $9680` - Store accumulator absolute
- `LDA #$00` - Load accumulator immediate
- `db $0a` - Unknown opcode $0a
- `STA $9682` - Store accumulator absolute
- `db $a2` - Unknown opcode $a2
- `db $d1` - Unknown opcode $d1
- `db $03` - Unknown opcode $03
- `db $a0` - Unknown opcode $a0
- `db $00` - Unknown opcode $00
- `db $00` - Unknown opcode $00
- ... (60 more instructions)

### Region 62: Subroutine
- **Address Range:** $8000 - $8014
- **Size:** 21 bytes
- **Bank:** 0
- **Instructions:** 14

**First Instructions:**
- `LDA $3547` - Load accumulator absolute
- `db $29` - Unknown opcode $29
- `db $04` - Unknown opcode $04
- `db $00` - Unknown opcode $00
- `BNE #$03` - Branch not equal
- `JMP $0011` - Jump absolute
- `db $00` - Unknown opcode $00
- `db $d1` - Unknown opcode $d1
- `db $01` - Unknown opcode $01
- `JMP $0014` - Jump absolute
- ... (4 more instructions)

### Region 63: Subroutine
- **Address Range:** $9000 - $9001
- **Size:** 2 bytes
- **Bank:** 0
- **Instructions:** 2

**First Instructions:**
- `db $02` - Unknown opcode $02
- `RTL` - Return from subroutine long

### Region 64: Subroutine
- **Address Range:** $a000 - $a008
- **Size:** 9 bytes
- **Bank:** 0
- **Instructions:** 4

**First Instructions:**
- `db $c7` - Unknown opcode $c7
- `JSL $ccd276` - Jump subroutine long
- `JMP $2001` - Jump absolute
- `RTL` - Return from subroutine long

### Region 65: Subroutine
- **Address Range:** $b000 - $b002
- **Size:** 3 bytes
- **Bank:** 0
- **Instructions:** 3

**First Instructions:**
- `db $11` - Unknown opcode $11
- `db $06` - Unknown opcode $06
- `RTL` - Return from subroutine long

### Region 66: Subroutine
- **Address Range:** $c000 - $c013
- **Size:** 20 bytes
- **Bank:** 0
- **Instructions:** 12

**First Instructions:**
- `JMP $2935` - Jump absolute
- `BRA #$00` - Branch always
- `BNE #$03` - Branch not equal
- `JMP $4010` - Jump absolute
- `db $00` - Unknown opcode $00
- `db $6d` - Unknown opcode $6d
- `db $04` - Unknown opcode $04
- `JMP $4013` - Jump absolute
- `db $00` - Unknown opcode $00
- `db $49` - Unknown opcode $49
- ... (2 more instructions)

### Region 67: Subroutine
- **Address Range:** $d000 - $d005
- **Size:** 6 bytes
- **Bank:** 0
- **Instructions:** 5

**First Instructions:**
- `BVC #$22` - Branch overflow clear
- `NOP` - No operation
- `db $c1` - Unknown opcode $c1
- `db $cd` - Unknown opcode $cd
- `RTL` - Return from subroutine long

### Region 68: Subroutine
- **Address Range:** $e000 - $e01d
- **Size:** 30 bytes
- **Bank:** 0
- **Instructions:** 19

**First Instructions:**
- `JMP $6009` - Jump absolute
- `db $00` - Unknown opcode $00
- `db $d2` - Unknown opcode $d2
- `db $05` - Unknown opcode $05
- `JMP $601d` - Jump absolute
- `LDA $3545` - Load accumulator absolute
- `db $29` - Unknown opcode $29
- `db $04` - Unknown opcode $04
- `db $00` - Unknown opcode $00
- `BNE #$03` - Branch not equal
- ... (9 more instructions)

### Region 69: Subroutine
- **Address Range:** $f000 - $f02c
- **Size:** 45 bytes
- **Bank:** 0
- **Instructions:** 25

**First Instructions:**
- `db $00` - Unknown opcode $00
- `BEQ #$03` - Branch equal
- `JMP $700a` - Jump absolute
- `db $02` - Unknown opcode $02
- `JMP $6ffb` - Jump absolute
- `LDA #$12` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `STA $9c11` - Store accumulator absolute
- `LDA #$1c` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- ... (15 more instructions)

### Region 70: Subroutine
- **Address Range:** $8000 - $804f
- **Size:** 80 bytes
- **Bank:** 0
- **Instructions:** 43

**First Instructions:**
- `db $87` - Unknown opcode $87
- `db $8f` - Unknown opcode $8f
- `db $cc` - Unknown opcode $cc
- `BCS #$03` - Branch carry set
- `JMP $802c` - Jump absolute
- `JSL $cc7b05` - Jump subroutine long
- `BCS #$03` - Branch carry set
- `JMP $8026` - Jump absolute
- `JSL $cc7a64` - Jump subroutine long
- `BCS #$03` - Branch carry set
- ... (33 more instructions)

### Region 71: Subroutine
- **Address Range:** $9000 - $906d
- **Size:** 110 bytes
- **Bank:** 0
- **Instructions:** 56

**First Instructions:**
- `db $0f` - Unknown opcode $0f
- `db $07` - Unknown opcode $07
- `JSL $cdac66` - Jump subroutine long
- `BCS #$03` - Branch carry set
- `JMP $902f` - Jump absolute
- `db $00` - Unknown opcode $00
- `db $11` - Unknown opcode $11
- `db $07` - Unknown opcode $07
- `JSL $cdac66` - Jump subroutine long
- `BCS #$03` - Branch carry set
- ... (46 more instructions)

### Region 72: Subroutine
- **Address Range:** $a000 - $a008
- **Size:** 9 bytes
- **Bank:** 0
- **Instructions:** 7

**First Instructions:**
- `db $05` - Unknown opcode $05
- `db $a0` - Unknown opcode $a0
- `JMP $a008` - Jump absolute
- `db $00` - Unknown opcode $00
- `db $f7` - Unknown opcode $f7
- `db $07` - Unknown opcode $07
- `RTL` - Return from subroutine long

### Region 73: Subroutine
- **Address Range:** $b000 - $b0a4
- **Size:** 165 bytes
- **Bank:** 0
- **Instructions:** 88

**First Instructions:**
- `db $08` - Unknown opcode $08
- `STA $9680` - Store accumulator absolute
- `LDA #$80` - Load accumulator immediate
- `db $09` - Unknown opcode $09
- `STA $9682` - Store accumulator absolute
- `db $a2` - Unknown opcode $a2
- `db $13` - Unknown opcode $13
- `db $02` - Unknown opcode $02
- `db $a0` - Unknown opcode $a0
- `db $01` - Unknown opcode $01
- ... (78 more instructions)

### Region 74: Subroutine
- **Address Range:** $e000 - $e008
- **Size:** 9 bytes
- **Bank:** 0
- **Instructions:** 6

**First Instructions:**
- `JSL $c04604` - Jump subroutine long
- `db $93` - Unknown opcode $93
- `db $33` - Unknown opcode $33
- `db $f6` - Unknown opcode $f6
- `db $00` - Unknown opcode $00
- `RTL` - Return from subroutine long

### Region 75: Subroutine
- **Address Range:** $8000 - $8012
- **Size:** 19 bytes
- **Bank:** 0
- **Instructions:** 10

**First Instructions:**
- `JSL $c77734` - Jump subroutine long
- `JSL $c77843` - Jump subroutine long
- `db $13` - Unknown opcode $13
- `db $00` - Unknown opcode $00
- `db $cc` - Unknown opcode $cc
- `JSL $c7786d` - Jump subroutine long
- `db $48` - Unknown opcode $48
- `db $a2` - Unknown opcode $a2
- `db $cd` - Unknown opcode $cd
- `RTL` - Return from subroutine long

### Region 76: Subroutine
- **Address Range:** $9000 - $9020
- **Size:** 33 bytes
- **Bank:** 0
- **Instructions:** 13

**First Instructions:**
- `db $76` - Unknown opcode $76
- `db $00` - Unknown opcode $00
- `LDA #$eb` - Load accumulator immediate
- `db $01` - Unknown opcode $01
- `JSL $c75474` - Jump subroutine long
- `JSL $ccd57b` - Jump subroutine long
- `JSL $cdadfb` - Jump subroutine long
- `LDA #$6a` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSL $c75446` - Jump subroutine long
- ... (3 more instructions)

### Region 77: Subroutine
- **Address Range:** $a000 - $a000
- **Size:** 1 bytes
- **Bank:** 0
- **Instructions:** 1

**First Instructions:**
- `RTL` - Return from subroutine long

### Region 78: Interrupt Handler
- **Address Range:** $b000 - $b5e3
- **Size:** 1508 bytes
- **Bank:** 0
- **Instructions:** 712

**First Instructions:**
- `db $d7` - Unknown opcode $d7
- `db $ac` - Unknown opcode $ac
- `db $cd` - Unknown opcode $cd
- `LDA #$03` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSL $c1a988` - Jump subroutine long
- `db $d7` - Unknown opcode $d7
- `db $0c` - Unknown opcode $0c
- `JSL $cdacd7` - Jump subroutine long
- `LDA #$03` - Load accumulator immediate
- ... (702 more instructions)

### Region 79: Subroutine
- **Address Range:** $c000 - $c14c
- **Size:** 333 bytes
- **Bank:** 0
- **Instructions:** 204

**First Instructions:**
- `db $03` - Unknown opcode $03
- `JMP $3de9` - Jump absolute
- `db $c9` - Unknown opcode $c9
- `db $05` - Unknown opcode $05
- `db $00` - Unknown opcode $00
- `BNE #$03` - Branch not equal
- `JMP $3df5` - Jump absolute
- `db $c9` - Unknown opcode $c9
- `db $06` - Unknown opcode $06
- `db $00` - Unknown opcode $00
- ... (194 more instructions)

### Region 80: Interrupt Handler
- **Address Range:** $d000 - $d15a
- **Size:** 347 bytes
- **Bank:** 0
- **Instructions:** 168

**First Instructions:**
- `db $00` - Unknown opcode $00
- `db $00` - Unknown opcode $00
- `JSL $c736d0` - Jump subroutine long
- `db $02` - Unknown opcode $02
- `JSL $c78fdf` - Jump subroutine long
- `JSL $ccd400` - Jump subroutine long
- `JSL $ccd2da` - Jump subroutine long
- `LDA $361a` - Load accumulator absolute
- `db $c9` - Unknown opcode $c9
- `db $00` - Unknown opcode $00
- ... (158 more instructions)

### Region 81: Subroutine
- **Address Range:** $e000 - $e026
- **Size:** 39 bytes
- **Bank:** 0
- **Instructions:** 18

**First Instructions:**
- `db $01` - Unknown opcode $01
- `db $00` - Unknown opcode $00
- `db $0c` - Unknown opcode $0c
- `db $19` - Unknown opcode $19
- `db $36` - Unknown opcode $36
- `LDA $3619` - Load accumulator absolute
- `db $29` - Unknown opcode $29
- `JSR $f000` - Jump subroutine
- `db $03` - Unknown opcode $03
- `JMP $6017` - Jump absolute
- ... (8 more instructions)

### Region 82: Subroutine
- **Address Range:** $f000 - $f002
- **Size:** 3 bytes
- **Bank:** 0
- **Instructions:** 3

**First Instructions:**
- `db $68` - Unknown opcode $68
- `db $68` - Unknown opcode $68
- `RTL` - Return from subroutine long

### Region 83: Subroutine
- **Address Range:** $8000 - $803d
- **Size:** 62 bytes
- **Bank:** 0
- **Instructions:** 44

**First Instructions:**
- `BRA #$ad` - Branch always
- `db $2e` - Unknown opcode $2e
- `db $34` - Unknown opcode $34
- `db $83` - Unknown opcode $83
- `db $03` - Unknown opcode $03
- `LDA $342e` - Load accumulator absolute
- `db $83` - Unknown opcode $83
- `db $01` - Unknown opcode $01
- `db $a3` - Unknown opcode $a3
- `db $03` - Unknown opcode $03
- ... (34 more instructions)

### Region 84: Subroutine
- **Address Range:** $9000 - $9006
- **Size:** 7 bytes
- **Bank:** 0
- **Instructions:** 4

**First Instructions:**
- `BCC #$38` - Branch carry clear
- `JMP $9006` - Jump absolute
- `CLC` - Clear carry flag
- `RTL` - Return from subroutine long

### Region 85: Subroutine
- **Address Range:** $a000 - $a008
- **Size:** 9 bytes
- **Bank:** 0
- **Instructions:** 8

**First Instructions:**
- `db $81` - Unknown opcode $81
- `db $c7` - Unknown opcode $c7
- `LDA #$80` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `db $0c` - Unknown opcode $0c
- `db $41` - Unknown opcode $41
- `db $35` - Unknown opcode $35
- `RTL` - Return from subroutine long

### Region 86: Subroutine
- **Address Range:** $b000 - $b08b
- **Size:** 140 bytes
- **Bank:** 0
- **Instructions:** 61

**First Instructions:**
- `CLI` - Clear interrupt disable
- `db $c7` - Unknown opcode $c7
- `LDA #$bf` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSL $c75828` - Jump subroutine long
- `JMP $b02f` - Jump absolute
- `LDA #$c0` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSL $c75828` - Jump subroutine long
- `LDA #$c1` - Load accumulator immediate
- ... (51 more instructions)

### Region 87: Subroutine
- **Address Range:** $c000 - $c010
- **Size:** 17 bytes
- **Bank:** 0
- **Instructions:** 9

**First Instructions:**
- `CLI` - Clear interrupt disable
- `db $c7` - Unknown opcode $c7
- `LDA #$b5` - Load accumulator immediate
- `db $02` - Unknown opcode $02
- `JSL $c75828` - Jump subroutine long
- `LDA #$b6` - Load accumulator immediate
- `db $02` - Unknown opcode $02
- `JSL $c75828` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 88: Subroutine
- **Address Range:** $d000 - $d014
- **Size:** 21 bytes
- **Bank:** 0
- **Instructions:** 10

**First Instructions:**
- `db $9f` - Unknown opcode $9f
- `db $00` - Unknown opcode $00
- `JSL $c758de` - Jump subroutine long
- `LDA #$a0` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSL $c758de` - Jump subroutine long
- `LDA #$a1` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSL $c758de` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 89: Subroutine
- **Address Range:** $e000 - $e013
- **Size:** 20 bytes
- **Bank:** 0
- **Instructions:** 8

**First Instructions:**
- `db $00` - Unknown opcode $00
- `BNE #$03` - Branch not equal
- `JMP $dfa7` - Jump absolute
- `JSL $cdacd2` - Jump subroutine long
- `JSL $ccd383` - Jump subroutine long
- `JSL $cc9a99` - Jump subroutine long
- `db $68` - Unknown opcode $68
- `RTL` - Return from subroutine long

### Region 90: Subroutine
- **Address Range:** $8000 - $8006
- **Size:** 7 bytes
- **Bank:** 0
- **Instructions:** 6

**First Instructions:**
- `LDA #$01` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `db $0c` - Unknown opcode $0c
- `db $2b` - Unknown opcode $2b
- `db $36` - Unknown opcode $36
- `RTL` - Return from subroutine long

### Region 91: Subroutine
- **Address Range:** $9000 - $90bd
- **Size:** 190 bytes
- **Bank:** 0
- **Instructions:** 94

**First Instructions:**
- `db $00` - Unknown opcode $00
- `db $00` - Unknown opcode $00
- `JSL $c736d0` - Jump subroutine long
- `db $02` - Unknown opcode $02
- `JSL $c78fdf` - Jump subroutine long
- `JSL $ccd400` - Jump subroutine long
- `JSL $cce1d1` - Jump subroutine long
- `JSL $ccd37e` - Jump subroutine long
- `LDA $3556` - Load accumulator absolute
- `db $29` - Unknown opcode $29
- ... (84 more instructions)

### Region 92: Subroutine
- **Address Range:** $b000 - $b00b
- **Size:** 12 bytes
- **Bank:** 0
- **Instructions:** 7

**First Instructions:**
- `JMP $2f7a` - Jump absolute
- `db $c9` - Unknown opcode $c9
- `db $06` - Unknown opcode $06
- `db $00` - Unknown opcode $00
- `BNE #$03` - Branch not equal
- `JMP $2fa9` - Jump absolute
- `RTL` - Return from subroutine long

### Region 93: Subroutine
- **Address Range:** $c000 - $c03b
- **Size:** 60 bytes
- **Bank:** 0
- **Instructions:** 31

**First Instructions:**
- `db $42` - Unknown opcode $42
- `db $f6` - Unknown opcode $f6
- `BCC #$03` - Branch carry clear
- `JMP $400b` - Jump absolute
- `db $02` - Unknown opcode $02
- `JMP $3ffb` - Jump absolute
- `JSL $c04835` - Jump subroutine long
- `db $53` - Unknown opcode $53
- `db $42` - Unknown opcode $42
- `db $f6` - Unknown opcode $f6
- ... (21 more instructions)

### Region 94: Subroutine
- **Address Range:** $d000 - $d00f
- **Size:** 16 bytes
- **Bank:** 0
- **Instructions:** 9

**First Instructions:**
- `LDA #$08` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `db $1c` - Unknown opcode $1c
- `db $53` - Unknown opcode $53
- `db $35` - Unknown opcode $35
- `JSL $ccd383` - Jump subroutine long
- `JSL $ccd298` - Jump subroutine long
- `db $68` - Unknown opcode $68
- `RTL` - Return from subroutine long

### Region 95: Subroutine
- **Address Range:** $e000 - $e144
- **Size:** 325 bytes
- **Bank:** 0
- **Instructions:** 173

**First Instructions:**
- `LDA #$00` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `db $83` - Unknown opcode $83
- `db $01` - Unknown opcode $01
- `LDA #$04` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSL $c73c23` - Jump subroutine long
- `JMP $6041` - Jump absolute
- `LDA #$97` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- ... (163 more instructions)

### Region 96: Subroutine
- **Address Range:** $f000 - $f0f4
- **Size:** 245 bytes
- **Bank:** 0
- **Instructions:** 129

**First Instructions:**
- `JMP $7007` - Jump absolute
- `db $02` - Unknown opcode $02
- `JMP $6ff8` - Jump absolute
- `LDA #$1e` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `JSL $c74b39` - Jump subroutine long
- `JSL $c1a92e` - Jump subroutine long
- `JML $2e2208` - Jump long
- `LDA #$c1` - Load accumulator immediate
- `db $56` - Unknown opcode $56
- ... (119 more instructions)

### Region 97: Subroutine
- **Address Range:** $8000 - $800f
- **Size:** 16 bytes
- **Bank:** 0
- **Instructions:** 9

**First Instructions:**
- `db $c9` - Unknown opcode $c9
- `db $00` - Unknown opcode $00
- `db $00` - Unknown opcode $00
- `BNE #$03` - Branch not equal
- `JMP $800c` - Jump absolute
- `db $02` - Unknown opcode $02
- `JMP $7ffd` - Jump absolute
- `JMP $7fc0` - Jump absolute
- `RTL` - Return from subroutine long

### Region 98: Subroutine
- **Address Range:** $9000 - $9056
- **Size:** 87 bytes
- **Bank:** 0
- **Instructions:** 51

**First Instructions:**
- `db $00` - Unknown opcode $00
- `db $00` - Unknown opcode $00
- `STA $9684` - Store accumulator absolute
- `LDA #$19` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `db $a2` - Unknown opcode $a2
- `db $05` - Unknown opcode $05
- `db $00` - Unknown opcode $00
- `db $a0` - Unknown opcode $a0
- `db $02` - Unknown opcode $02
- ... (41 more instructions)

### Region 99: Subroutine
- **Address Range:** $a000 - $a02a
- **Size:** 43 bytes
- **Bank:** 0
- **Instructions:** 22

**First Instructions:**
- `db $a0` - Unknown opcode $a0
- `LDA $343e` - Load accumulator absolute
- `db $c9` - Unknown opcode $c9
- `db $01` - Unknown opcode $01
- `db $00` - Unknown opcode $00
- `BNE #$03` - Branch not equal
- `JMP $9fd9` - Jump absolute
- `db $c9` - Unknown opcode $c9
- `db $03` - Unknown opcode $03
- `db $00` - Unknown opcode $00
- ... (12 more instructions)

### Region 100: Subroutine
- **Address Range:** $b000 - $b000
- **Size:** 1 bytes
- **Bank:** 0
- **Instructions:** 1

**First Instructions:**
- `RTL` - Return from subroutine long

### Region 101: Subroutine
- **Address Range:** $c000 - $c00e
- **Size:** 15 bytes
- **Bank:** 0
- **Instructions:** 9

**First Instructions:**
- `db $01` - Unknown opcode $01
- `db $00` - Unknown opcode $00
- `BEQ #$03` - Branch equal
- `JMP $c00e` - Jump absolute
- `db $00` - Unknown opcode $00
- `db $24` - Unknown opcode $24
- `db $0a` - Unknown opcode $0a
- `JSL $cdacd2` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 102: Subroutine
- **Address Range:** $d000 - $d012
- **Size:** 19 bytes
- **Bank:** 0
- **Instructions:** 13

**First Instructions:**
- `BNE #$4c` - Branch not equal
- `db $12` - Unknown opcode $12
- `BNE #$22` - Branch not equal
- `db $df` - Unknown opcode $df
- `db $cf` - Unknown opcode $cf
- `db $cd` - Unknown opcode $cd
- `JSL $cc9e86` - Jump subroutine long
- `LDA #$10` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `db $0c` - Unknown opcode $0c
- ... (3 more instructions)

### Region 103: Subroutine
- **Address Range:** $e000 - $e01b
- **Size:** 28 bytes
- **Bank:** 0
- **Instructions:** 16

**First Instructions:**
- `db $a4` - Unknown opcode $a4
- `db $6f` - Unknown opcode $6f
- `db $c7` - Unknown opcode $c7
- `LDA #$00` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `STA $3608` - Store accumulator absolute
- `LDA #$00` - Load accumulator immediate
- `db $00` - Unknown opcode $00
- `STA $360a` - Store accumulator absolute
- `LDA #$00` - Load accumulator immediate
- ... (6 more instructions)

### Region 104: Interrupt Handler
- **Address Range:** $f000 - $f00c
- **Size:** 13 bytes
- **Bank:** 0
- **Instructions:** 12

**First Instructions:**
- `db $06` - Unknown opcode $06
- `db $1c` - Unknown opcode $1c
- `db $16` - Unknown opcode $16
- `db $68` - Unknown opcode $68
- `db $14` - Unknown opcode $14
- `db $f8` - Unknown opcode $f8
- `db $04` - Unknown opcode $04
- `db $b8` - Unknown opcode $b8
- `db $88` - Unknown opcode $88
- `BEQ #$b0` - Branch equal
- ... (2 more instructions)

### Region 105: Interrupt Handler
- **Address Range:** $f000 - $f019
- **Size:** 26 bytes
- **Bank:** 0
- **Instructions:** 23

**First Instructions:**
- `db $c6` - Unknown opcode $c6
- `db $3a` - Unknown opcode $3a
- `db $0a` - Unknown opcode $0a
- `db $f4` - Unknown opcode $f4
- `JSL $f42cdc` - Jump subroutine long
- `db $0c` - Unknown opcode $0c
- `db $b4` - Unknown opcode $b4
- `CLC` - Clear carry flag
- `db $e8` - Unknown opcode $e8
- `db $68` - Unknown opcode $68
- ... (13 more instructions)

