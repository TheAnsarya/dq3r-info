# Dragon Quest III - Deep Disassembly Analysis

## ROM Information
- **File:** Dragon Quest III - english (patched).smc
- **Size:** 6,291,456 bytes
- **Code Regions Found:** 105

## Interrupt Vectors

| Vector | Address |
|--------|---------|
| cop_native | $E2FB |
| brk_native | $8B30 |
| abort_native | $00A9 |
| nmi_native | $AB48 |
| unused_native | $80A9 |
| irq_native | $008D |
| unused1 | $A921 |
| unused2 | $8D00 |
| cop_emulation | $2101 |
| unused3 | $028D |
| abort_emulation | $8D21 |
| nmi_emulation | $2103 |
| reset | $058D |
| irq_emulation | $8D21 |

## Code Regions

### Region 1: Subroutine
- **Address Range:** $9000 - $9013
- **Size:** 20 bytes
- **Bank:** 0
- **Instructions:** 17

**First Instructions:**
- `DB $1E` - Unknown opcode $1E
- `DB $00` - Unknown opcode $00
- `LDA #$55` - Load accumulator immediate
- `DB $55` - Unknown opcode $55
- `DB $9D` - Unknown opcode $9D
- `DB $1F` - Unknown opcode $1F
- `DB $DD` - Unknown opcode $DD
- `DB $CA` - Unknown opcode $CA
- `DB $CA` - Unknown opcode $CA
- `BPL #$F9` - Branch plus
- ... (7 more instructions)

### Region 2: Subroutine
- **Address Range:** $B000 - $B038
- **Size:** 57 bytes
- **Bank:** 0
- **Instructions:** 38

**First Instructions:**
- `JSR $34BE` - Jump subroutine
- `DB $BD` - Unknown opcode $BD
- `DB $88` - Unknown opcode $88
- `DB $89` - Unknown opcode $89
- `JSR $34BE` - Jump subroutine
- `DB $BD` - Unknown opcode $BD
- `DB $8A` - Unknown opcode $8A
- `DB $89` - Unknown opcode $89
- `JSR $34BE` - Jump subroutine
- `DB $BD` - Unknown opcode $BD
- ... (28 more instructions)

### Region 3: Subroutine
- **Address Range:** $F000 - $F00D
- **Size:** 14 bytes
- **Bank:** 0
- **Instructions:** 10

**First Instructions:**
- `JSR $74A9` - Jump subroutine
- `BCC #$09` - Branch carry clear
- `DB $AB` - Unknown opcode $AB
- `REP #$30` - Reset processor status
- `DB $7A` - Unknown opcode $7A
- `DB $FA` - Unknown opcode $FA
- `DB $68` - Unknown opcode $68
- `DB $28` - Unknown opcode $28
- `SEC` - Set carry flag
- `RTL` - Return from subroutine long

### Region 4: Subroutine
- **Address Range:** $E000 - $E5D3
- **Size:** 1492 bytes
- **Bank:** 0
- **Instructions:** 1198

**First Instructions:**
- `CLC` - Clear carry flag
- `DB $65` - Unknown opcode $65
- `CLC` - Clear carry flag
- `DB $85` - Unknown opcode $85
- `DB $1A` - Unknown opcode $1A
- `LDA $4214` - Load accumulator absolute
- `DB $8F` - Unknown opcode $8F
- `DB $F9` - Unknown opcode $F9
- `BEQ #$7E` - Branch equal
- `LDA #$00` - Load accumulator immediate
- ... (1188 more instructions)

### Region 5: Subroutine
- **Address Range:** $8000 - $82B9
- **Size:** 698 bytes
- **Bank:** 0
- **Instructions:** 512

**First Instructions:**
- `DB $26` - Unknown opcode $26
- `DB $88` - Unknown opcode $88
- `DB $81` - Unknown opcode $81
- `DB $89` - Unknown opcode $89
- `LDA $E3D0` - Load accumulator absolute
- `DB $48` - Unknown opcode $48
- `DB $4A` - Unknown opcode $4A
- `DB $4A` - Unknown opcode $4A
- `DB $4A` - Unknown opcode $4A
- `DB $0A` - Unknown opcode $0A
- ... (502 more instructions)

### Region 6: Subroutine
- **Address Range:** $E000 - $E01F
- **Size:** 32 bytes
- **Bank:** 0
- **Instructions:** 22

**First Instructions:**
- `DB $E0` - Unknown opcode $E0
- `BPL #$00` - Branch plus
- `BCC #$F1` - Branch carry clear
- `DB $A2` - Unknown opcode $A2
- `DB $00` - Unknown opcode $00
- `DB $00` - Unknown opcode $00
- `DB $BD` - Unknown opcode $BD
- `DB $D6` - Unknown opcode $D6
- `DB $96` - Unknown opcode $96
- `BMI #$13` - Branch minus
- ... (12 more instructions)

### Region 7: Subroutine
- **Address Range:** $D000 - $D29F
- **Size:** 672 bytes
- **Bank:** 0
- **Instructions:** 507

**First Instructions:**
- `BPL #$50` - Branch plus
- `DB $15` - Unknown opcode $15
- `BVC #$22` - Branch overflow clear
- `BVC #$27` - Branch overflow clear
- `BVC #$34` - Branch overflow clear
- `BVC #$39` - Branch overflow clear
- `BVC #$46` - Branch overflow clear
- `BVC #$4B` - Branch overflow clear
- `BVC #$A6` - Branch overflow clear
- `DB $04` - Unknown opcode $04
- ... (497 more instructions)

### Region 8: Subroutine
- **Address Range:** $E000 - $E00A
- **Size:** 11 bytes
- **Bank:** 0
- **Instructions:** 11

**First Instructions:**
- `DB $03` - Unknown opcode $03
- `DB $00` - Unknown opcode $00
- `CLC` - Clear carry flag
- `DB $63` - Unknown opcode $63
- `DB $01` - Unknown opcode $01
- `DB $0A` - Unknown opcode $0A
- `DB $AA` - Unknown opcode $AA
- `DB $68` - Unknown opcode $68
- `DB $FC` - Unknown opcode $FC
- `DB $1C` - Unknown opcode $1C
- ... (1 more instructions)

### Region 9: Subroutine
- **Address Range:** $F000 - $F002
- **Size:** 3 bytes
- **Bank:** 0
- **Instructions:** 3

**First Instructions:**
- `DB $24` - Unknown opcode $24
- `CLC` - Clear carry flag
- `RTS` - Return from subroutine

### Region 10: Subroutine
- **Address Range:** $8000 - $8007
- **Size:** 8 bytes
- **Bank:** 0
- **Instructions:** 6

**First Instructions:**
- `DB $01` - Unknown opcode $01
- `DB $83` - Unknown opcode $83
- `DB $01` - Unknown opcode $01
- `DB $68` - Unknown opcode $68
- `JSR $8008` - Jump subroutine
- `RTS` - Return from subroutine

### Region 11: Subroutine
- **Address Range:** $9000 - $9014
- **Size:** 21 bytes
- **Bank:** 0
- **Instructions:** 15

**First Instructions:**
- `DB $85` - Unknown opcode $85
- `DB $00` - Unknown opcode $00
- `BRA #$E4` - Branch always
- `LDA #$10` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSL $C0133E` - Jump subroutine long
- `CLC` - Clear carry flag
- `DB $69` - Unknown opcode $69
- `BPL #$00` - Branch plus
- `CLC` - Clear carry flag
- ... (5 more instructions)

### Region 12: Subroutine
- **Address Range:** $A000 - $A022
- **Size:** 35 bytes
- **Bank:** 0
- **Instructions:** 17

**First Instructions:**
- `STA $BE81` - Store accumulator absolute
- `STZ $BE83` - Store zero absolute
- `JSL $C1A867` - Jump subroutine long
- `DB $44` - Unknown opcode $44
- `DB $01` - Unknown opcode $01
- `JSL $C43A42` - Jump subroutine long
- `DB $06` - Unknown opcode $06
- `DB $FD` - Unknown opcode $FD
- `DB $FF` - Unknown opcode $FF
- `JSL $C2CA98` - Jump subroutine long
- ... (7 more instructions)

### Region 13: Subroutine
- **Address Range:** $B000 - $B053
- **Size:** 84 bytes
- **Bank:** 0
- **Instructions:** 56

**First Instructions:**
- `DB $2B` - Unknown opcode $2B
- `DB $CB` - Unknown opcode $CB
- `REP #$51` - Reset processor status
- `JSR $0010` - Jump subroutine
- `BEQ #$07` - Branch equal
- `LDA #$00` - Load accumulator immediate
- `DB $02` - Unknown opcode $02
- `DB $03` - Unknown opcode $03
- `DB $01` - Unknown opcode $01
- `DB $83` - Unknown opcode $83
- ... (46 more instructions)

### Region 14: Subroutine
- **Address Range:** $C000 - $C006
- **Size:** 7 bytes
- **Bank:** 0
- **Instructions:** 5

**First Instructions:**
- `BPL #$00` - Branch plus
- `DB $99` - Unknown opcode $99
- `BVC #$20` - Branch overflow clear
- `CLC` - Clear carry flag
- `RTS` - Return from subroutine

### Region 15: Subroutine
- **Address Range:** $D000 - $D013
- **Size:** 20 bytes
- **Bank:** 0
- **Instructions:** 13

**First Instructions:**
- `DB $8E` - Unknown opcode $8E
- `DB $CF` - Unknown opcode $CF
- `JSR $CF3B` - Jump subroutine
- `JSR $CF31` - Jump subroutine
- `DB $68` - Unknown opcode $68
- `STA $2428` - Store accumulator absolute
- `DB $AB` - Unknown opcode $AB
- `REP #$30` - Reset processor status
- `DB $7A` - Unknown opcode $7A
- `DB $FA` - Unknown opcode $FA
- ... (3 more instructions)

### Region 16: Subroutine
- **Address Range:** $A000 - $A024
- **Size:** 37 bytes
- **Bank:** 0
- **Instructions:** 19

**First Instructions:**
- `DB $0A` - Unknown opcode $0A
- `JSR $203B` - Jump subroutine
- `JSL $C31B8D` - Jump subroutine long
- `DB $EE` - Unknown opcode $EE
- `DB $92` - Unknown opcode $92
- `DB $33` - Unknown opcode $33
- `LDA $3392` - Load accumulator absolute
- `BEQ #$0C` - Branch equal
- `JSL $C325BD` - Jump subroutine long
- `JSL $C31DBA` - Jump subroutine long
- ... (9 more instructions)

### Region 17: Subroutine
- **Address Range:** $C000 - $C004
- **Size:** 5 bytes
- **Bank:** 0
- **Instructions:** 3

**First Instructions:**
- `DB $0A` - Unknown opcode $0A
- `STA $2A74` - Store accumulator absolute
- `RTS` - Return from subroutine

### Region 18: Interrupt Handler
- **Address Range:** $D000 - $D00F
- **Size:** 16 bytes
- **Bank:** 0
- **Instructions:** 13

**First Instructions:**
- `DB $08` - Unknown opcode $08
- `DB $0A` - Unknown opcode $0A
- `DB $AA` - Unknown opcode $AA
- `DB $BF` - Unknown opcode $BF
- `DB $0E` - Unknown opcode $0E
- `BVC #$C3` - Branch overflow clear
- `DB $AA` - Unknown opcode $AA
- `DB $BD` - Unknown opcode $BD
- `DB $00` - Unknown opcode $00
- `DB $00` - Unknown opcode $00
- ... (3 more instructions)

### Region 19: Subroutine
- **Address Range:** $E000 - $E003
- **Size:** 4 bytes
- **Bank:** 0
- **Instructions:** 4

**First Instructions:**
- `DB $AA` - Unknown opcode $AA
- `DB $BF` - Unknown opcode $BF
- `DB $12` - Unknown opcode $12
- `RTS` - Return from subroutine

### Region 20: Subroutine
- **Address Range:** $F000 - $F060
- **Size:** 97 bytes
- **Bank:** 0
- **Instructions:** 43

**First Instructions:**
- `JSL $C32B70` - Jump subroutine long
- `JSL $C35512` - Jump subroutine long
- `DB $A2` - Unknown opcode $A2
- `DB $07` - Unknown opcode $07
- `DB $00` - Unknown opcode $00
- `JSL $C32B70` - Jump subroutine long
- `JSL $C34F61` - Jump subroutine long
- `DB $A2` - Unknown opcode $A2
- `DB $03` - Unknown opcode $03
- `DB $00` - Unknown opcode $00
- ... (33 more instructions)

### Region 21: Subroutine
- **Address Range:** $8000 - $805C
- **Size:** 93 bytes
- **Bank:** 0
- **Instructions:** 40

**First Instructions:**
- `DB $2C` - Unknown opcode $2C
- `DB $C3` - Unknown opcode $C3
- `JSL $C35522` - Jump subroutine long
- `LDA #$01` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSL $C32B8D` - Jump subroutine long
- `LDA #$01` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSL $C32B8D` - Jump subroutine long
- `JSL $C34EFC` - Jump subroutine long
- ... (30 more instructions)

### Region 22: Subroutine
- **Address Range:** $9000 - $903E
- **Size:** 63 bytes
- **Bank:** 0
- **Instructions:** 24

**First Instructions:**
- `BCC #$A9` - Branch carry clear
- `DB $00` - Unknown opcode $00
- `DB $00` - Unknown opcode $00
- `JSL $C33D5C` - Jump subroutine long
- `JSL $C3484A` - Jump subroutine long
- `DB $A2` - Unknown opcode $A2
- `DB $0C` - Unknown opcode $0C
- `DB $00` - Unknown opcode $00
- `JSL $C32BC2` - Jump subroutine long
- `JSL $C32BD2` - Jump subroutine long
- ... (14 more instructions)

### Region 23: Subroutine
- **Address Range:** $A000 - $A121
- **Size:** 290 bytes
- **Bank:** 0
- **Instructions:** 122

**First Instructions:**
- `JSL $C32BAF` - Jump subroutine long
- `LDA #$00` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSL $C33D5C` - Jump subroutine long
- `LDA #$88` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSL $C32BAF` - Jump subroutine long
- `LDA #$90` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSL $C32BAF` - Jump subroutine long
- ... (112 more instructions)

### Region 24: Subroutine
- **Address Range:** $B000 - $B016
- **Size:** 23 bytes
- **Bank:** 0
- **Instructions:** 11

**First Instructions:**
- `JMP $B00A` - Jump absolute
- `JSL $C3305F` - Jump subroutine long
- `LDA $2BF0` - Load accumulator absolute
- `DB $C9` - Unknown opcode $C9
- `DB $00` - Unknown opcode $00
- `DB $00` - Unknown opcode $00
- `BEQ #$03` - Branch equal
- `JMP $AF20` - Jump absolute
- `JMP $AF02` - Jump absolute
- `CLC` - Clear carry flag
- ... (1 more instructions)

### Region 25: Interrupt Handler
- **Address Range:** $C000 - $C001
- **Size:** 2 bytes
- **Bank:** 0
- **Instructions:** 2

**First Instructions:**
- `DB $F7` - Unknown opcode $F7
- `RTI` - Return from interrupt

### Region 26: Interrupt Handler
- **Address Range:** $D000 - $D0CB
- **Size:** 204 bytes
- **Bank:** 0
- **Instructions:** 111

**First Instructions:**
- `DB $CC` - Unknown opcode $CC
- `DB $2B` - Unknown opcode $2B
- `DB $29` - Unknown opcode $29
- `DB $FF` - Unknown opcode $FF
- `DB $00` - Unknown opcode $00
- `STA $33E4` - Store accumulator absolute
- `DB $0E` - Unknown opcode $0E
- `SEP #$33` - Set processor status
- `DB $2E` - Unknown opcode $2E
- `DB $E4` - Unknown opcode $E4
- ... (101 more instructions)

### Region 27: Subroutine
- **Address Range:** $9000 - $9004
- **Size:** 5 bytes
- **Bank:** 0
- **Instructions:** 3

**First Instructions:**
- `DB $AF` - Unknown opcode $AF
- `JSR $B783` - Jump subroutine
- `RTS` - Return from subroutine

### Region 28: Subroutine
- **Address Range:** $A000 - $A0C4
- **Size:** 197 bytes
- **Bank:** 0
- **Instructions:** 104

**First Instructions:**
- `DB $BA` - Unknown opcode $BA
- `DB $2A` - Unknown opcode $2A
- `DB $C0` - Unknown opcode $C0
- `DB $12` - Unknown opcode $12
- `DB $B2` - Unknown opcode $B2
- `DB $C4` - Unknown opcode $C4
- `DB $BD` - Unknown opcode $BD
- `BRA #$48` - Branch always
- `JSL $C04604` - Jump subroutine long
- `DB $6D` - Unknown opcode $6D
- ... (94 more instructions)

### Region 29: Subroutine
- **Address Range:** $E000 - $E00E
- **Size:** 15 bytes
- **Bank:** 0
- **Instructions:** 10

**First Instructions:**
- `DB $F6` - Unknown opcode $F6
- `SEP #$C9` - Set processor status
- `JSL $C9E28D` - Jump subroutine long
- `DB $AB` - Unknown opcode $AB
- `REP #$30` - Reset processor status
- `DB $7A` - Unknown opcode $7A
- `DB $FA` - Unknown opcode $FA
- `DB $68` - Unknown opcode $68
- `DB $28` - Unknown opcode $28
- `RTL` - Return from subroutine long

### Region 30: Subroutine
- **Address Range:** $F000 - $F00D
- **Size:** 14 bytes
- **Bank:** 0
- **Instructions:** 10

**First Instructions:**
- `JMP $700C` - Jump absolute
- `DB $02` - Unknown opcode $02
- `DB $A3` - Unknown opcode $A3
- `DB $01` - Unknown opcode $01
- `DB $1A` - Unknown opcode $1A
- `DB $83` - Unknown opcode $83
- `DB $01` - Unknown opcode $01
- `JMP $6FEB` - Jump absolute
- `DB $68` - Unknown opcode $68
- `RTL` - Return from subroutine long

### Region 31: Interrupt Handler
- **Address Range:** $8000 - $804F
- **Size:** 80 bytes
- **Bank:** 0
- **Instructions:** 36

**First Instructions:**
- `DB $66` - Unknown opcode $66
- `DB $AC` - Unknown opcode $AC
- `DB $CD` - Unknown opcode $CD
- `BCS #$03` - Branch carry set
- `JMP $80EB` - Jump absolute
- `JSL $C569C9` - Jump subroutine long
- `JMP $80B5` - Jump absolute
- `JSL $C737BE` - Jump subroutine long
- `DB $EF` - Unknown opcode $EF
- `DB $0E` - Unknown opcode $0E
- ... (26 more instructions)

### Region 32: Subroutine
- **Address Range:** $9000 - $900A
- **Size:** 11 bytes
- **Bank:** 0
- **Instructions:** 5

**First Instructions:**
- `DB $D9` - Unknown opcode $D9
- `DB $C1` - Unknown opcode $C1
- `JSL $C56984` - Jump subroutine long
- `JSL $CCD066` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 33: Subroutine
- **Address Range:** $9000 - $9020
- **Size:** 33 bytes
- **Bank:** 0
- **Instructions:** 18

**First Instructions:**
- `LDA #$00` - Load accumulator immediate
- `JSR $418D` - Jump subroutine
- `DB $42` - Unknown opcode $42
- `LDA #$08` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `STA $4243` - Store accumulator absolute
- `LDA #$02` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `STA $4245` - Store accumulator absolute
- `DB $A2` - Unknown opcode $A2
- ... (8 more instructions)

### Region 34: Subroutine
- **Address Range:** $F000 - $F041
- **Size:** 66 bytes
- **Bank:** 0
- **Instructions:** 50

**First Instructions:**
- `DB $03` - Unknown opcode $03
- `DB $00` - Unknown opcode $00
- `BEQ #$15` - Branch equal
- `DB $C9` - Unknown opcode $C9
- `BPL #$00` - Branch plus
- `BEQ #$10` - Branch equal
- `DB $C9` - Unknown opcode $C9
- `DB $14` - Unknown opcode $14
- `DB $00` - Unknown opcode $00
- `BEQ #$0B` - Branch equal
- ... (40 more instructions)

### Region 35: Subroutine
- **Address Range:** $B000 - $B002
- **Size:** 3 bytes
- **Bank:** 0
- **Instructions:** 3

**First Instructions:**
- `DB $E3` - Unknown opcode $E3
- `DB $C1` - Unknown opcode $C1
- `RTL` - Return from subroutine long

### Region 36: Subroutine
- **Address Range:** $E000 - $E00A
- **Size:** 11 bytes
- **Bank:** 0
- **Instructions:** 9

**First Instructions:**
- `DB $00` - Unknown opcode $00
- `BRA #$03` - Branch always
- `LDA #$00` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `DB $99` - Unknown opcode $99
- `DB $65` - Unknown opcode $65
- `DB $D1` - Unknown opcode $D1
- `CLC` - Clear carry flag
- `RTL` - Return from subroutine long

### Region 37: Subroutine
- **Address Range:** $F000 - $F01D
- **Size:** 30 bytes
- **Bank:** 0
- **Instructions:** 22

**First Instructions:**
- `BCC #$F6` - Branch carry clear
- `JSL $C4297C` - Jump subroutine long
- `DB $01` - Unknown opcode $01
- `CLC` - Clear carry flag
- `DB $A2` - Unknown opcode $A2
- `DB $00` - Unknown opcode $00
- `DB $00` - Unknown opcode $00
- `DB $9B` - Unknown opcode $9B
- `JSL $C429DA` - Jump subroutine long
- `DB $01` - Unknown opcode $01
- ... (12 more instructions)

### Region 38: Subroutine
- **Address Range:** $9000 - $901E
- **Size:** 31 bytes
- **Bank:** 0
- **Instructions:** 15

**First Instructions:**
- `DB $00` - Unknown opcode $00
- `DB $99` - Unknown opcode $99
- `DB $65` - Unknown opcode $65
- `DB $D1` - Unknown opcode $D1
- `JSR $901F` - Jump subroutine
- `JSL $C6594A` - Jump subroutine long
- `JSL $C65C38` - Jump subroutine long
- `DB $7A` - Unknown opcode $7A
- `JSL $C76597` - Jump subroutine long
- `BCS #$03` - Branch carry set
- ... (5 more instructions)

### Region 39: Interrupt Handler
- **Address Range:** $D000 - $D011
- **Size:** 18 bytes
- **Bank:** 0
- **Instructions:** 15

**First Instructions:**
- `DB $28` - Unknown opcode $28
- `DB $42` - Unknown opcode $42
- `DB $B7` - Unknown opcode $B7
- `DB $68` - Unknown opcode $68
- `BCS #$40` - Branch carry set
- `DB $2C` - Unknown opcode $2C
- `DB $42` - Unknown opcode $42
- `DB $B7` - Unknown opcode $B7
- `DB $68` - Unknown opcode $68
- `BMI #$41` - Branch minus
- ... (5 more instructions)

### Region 40: Subroutine
- **Address Range:** $9000 - $905B
- **Size:** 92 bytes
- **Bank:** 0
- **Instructions:** 52

**First Instructions:**
- `DB $33` - Unknown opcode $33
- `JSL $C43672` - Jump subroutine long
- `DB $01` - Unknown opcode $01
- `DB $FE` - Unknown opcode $FE
- `DB $FF` - Unknown opcode $FF
- `DB $C9` - Unknown opcode $C9
- `DB $FF` - Unknown opcode $FF
- `DB $00` - Unknown opcode $00
- `BCC #$0F` - Branch carry clear
- `JSL $C1A8D4` - Jump subroutine long
- ... (42 more instructions)

### Region 41: Subroutine
- **Address Range:** $A000 - $A03C
- **Size:** 61 bytes
- **Bank:** 0
- **Instructions:** 41

**First Instructions:**
- `LDA #$2B` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSR $203D` - Jump subroutine
- `BCC #$06` - Branch carry clear
- `LDA #$40` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `DB $0C` - Unknown opcode $0C
- `DB $B6` - Unknown opcode $B6
- `DB $2B` - Unknown opcode $2B
- `LDA #$46` - Load accumulator immediate
- ... (31 more instructions)

### Region 42: Subroutine
- **Address Range:** $C000 - $C050
- **Size:** 81 bytes
- **Bank:** 0
- **Instructions:** 52

**First Instructions:**
- `JSR $7BC2` - Jump subroutine
- `LDA $63DC` - Load accumulator absolute
- `CLC` - Clear carry flag
- `DB $6D` - Unknown opcode $6D
- `DB $DC` - Unknown opcode $DC
- `DB $65` - Unknown opcode $65
- `DB $2D` - Unknown opcode $2D
- `DB $14` - Unknown opcode $14
- `DB $6F` - Unknown opcode $6F
- `STA $63DC` - Store accumulator absolute
- ... (42 more instructions)

### Region 43: Subroutine
- **Address Range:** $D000 - $D058
- **Size:** 89 bytes
- **Bank:** 0
- **Instructions:** 52

**First Instructions:**
- `LDA $6C54` - Load accumulator absolute
- `CLC` - Clear carry flag
- `DB $6D` - Unknown opcode $6D
- `DB $D4` - Unknown opcode $D4
- `DB $6C` - Unknown opcode $6C
- `STA $6C54` - Store accumulator absolute
- `LDA $6DD4` - Load accumulator absolute
- `CLC` - Clear carry flag
- `DB $6D` - Unknown opcode $6D
- `DB $54` - Unknown opcode $54
- ... (42 more instructions)

### Region 44: Subroutine
- **Address Range:** $E000 - $E000
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
- `LDA $33C8` - Load accumulator absolute
- `STA $7FD0` - Store accumulator absolute
- `LDA $33CA` - Load accumulator absolute
- `STA $7FD2` - Store accumulator absolute
- `LDA $33CC` - Load accumulator absolute
- `STA $7FD4` - Store accumulator absolute
- `RTL` - Return from subroutine long

### Region 46: Subroutine
- **Address Range:** $8000 - $8004
- **Size:** 5 bytes
- **Bank:** 0
- **Instructions:** 2

**First Instructions:**
- `JSL $CADCEA` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 47: Subroutine
- **Address Range:** $9000 - $9004
- **Size:** 5 bytes
- **Bank:** 0
- **Instructions:** 2

**First Instructions:**
- `JSL $CA0FC2` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 48: Subroutine
- **Address Range:** $A000 - $A059
- **Size:** 90 bytes
- **Bank:** 0
- **Instructions:** 38

**First Instructions:**
- `DB $03` - Unknown opcode $03
- `JMP $200B` - Jump absolute
- `JSL $CCD276` - Jump subroutine long
- `JMP $1FF9` - Jump absolute
- `JSL $CDA724` - Jump subroutine long
- `JSL $CCD6ED` - Jump subroutine long
- `LDA $3436` - Load accumulator absolute
- `DB $C9` - Unknown opcode $C9
- `DB $E8` - Unknown opcode $E8
- `DB $03` - Unknown opcode $03
- ... (28 more instructions)

### Region 49: Subroutine
- **Address Range:** $B000 - $B039
- **Size:** 58 bytes
- **Bank:** 0
- **Instructions:** 28

**First Instructions:**
- `JMP $A9C7` - Jump absolute
- `DB $35` - Unknown opcode $35
- `DB $00` - Unknown opcode $00
- `DB $A2` - Unknown opcode $A2
- `DB $5E` - Unknown opcode $5E
- `DB $00` - Unknown opcode $00
- `JSL $C75305` - Jump subroutine long
- `DB $02` - Unknown opcode $02
- `JMP $300C` - Jump absolute
- `JSL $CA3381` - Jump subroutine long
- ... (18 more instructions)

### Region 50: Subroutine
- **Address Range:** $C000 - $C000
- **Size:** 1 bytes
- **Bank:** 0
- **Instructions:** 1

**First Instructions:**
- `RTL` - Return from subroutine long

### Region 51: Subroutine
- **Address Range:** $D000 - $D039
- **Size:** 58 bytes
- **Bank:** 0
- **Instructions:** 25

**First Instructions:**
- `DB $00` - Unknown opcode $00
- `BEQ #$03` - Branch equal
- `JMP $500C` - Jump absolute
- `LDA #$20` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `DB $1C` - Unknown opcode $1C
- `JMP $A935` - Jump absolute
- `SEI` - Set interrupt disable
- `DB $00` - Unknown opcode $00
- `JSL $C77365` - Jump subroutine long
- ... (15 more instructions)

### Region 52: Subroutine
- **Address Range:** $E000 - $E007
- **Size:** 8 bytes
- **Bank:** 0
- **Instructions:** 5

**First Instructions:**
- `JSL $C77889` - Jump subroutine long
- `DB $A8` - Unknown opcode $A8
- `DB $E6` - Unknown opcode $E6
- `DB $CA` - Unknown opcode $CA
- `RTL` - Return from subroutine long

### Region 53: Subroutine
- **Address Range:** $F000 - $F00A
- **Size:** 11 bytes
- **Bank:** 0
- **Instructions:** 8

**First Instructions:**
- `DB $1F` - Unknown opcode $1F
- `DB $D9` - Unknown opcode $D9
- `DB $CA` - Unknown opcode $CA
- `JSL $C77889` - Jump subroutine long
- `DB $03` - Unknown opcode $03
- `DB $E9` - Unknown opcode $E9
- `DB $CA` - Unknown opcode $CA
- `RTL` - Return from subroutine long

### Region 54: Subroutine
- **Address Range:** $8000 - $8019
- **Size:** 26 bytes
- **Bank:** 0
- **Instructions:** 13

**First Instructions:**
- `DB $A2` - Unknown opcode $A2
- `DB $00` - Unknown opcode $00
- `DB $00` - Unknown opcode $00
- `JSL $C743C6` - Jump subroutine long
- `LDA #$80` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `DB $A2` - Unknown opcode $A2
- `DB $04` - Unknown opcode $04
- `DB $00` - Unknown opcode $00
- `JSL $C743C6` - Jump subroutine long
- ... (3 more instructions)

### Region 55: Subroutine
- **Address Range:** $9000 - $9010
- **Size:** 17 bytes
- **Bank:** 0
- **Instructions:** 8

**First Instructions:**
- `DB $00` - Unknown opcode $00
- `JSL $C62407` - Jump subroutine long
- `DB $A2` - Unknown opcode $A2
- `SEC` - Set carry flag
- `DB $00` - Unknown opcode $00
- `JSL $C66696` - Jump subroutine long
- `JSL $CCB8BF` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 56: Subroutine
- **Address Range:** $A000 - $A00A
- **Size:** 11 bytes
- **Bank:** 0
- **Instructions:** 8

**First Instructions:**
- `DB $BB` - Unknown opcode $BB
- `DB $14` - Unknown opcode $14
- `DB $C6` - Unknown opcode $C6
- `DB $A2` - Unknown opcode $A2
- `DB $67` - Unknown opcode $67
- `DB $00` - Unknown opcode $00
- `JSL $C614BB` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 57: Subroutine
- **Address Range:** $B000 - $B00E
- **Size:** 15 bytes
- **Bank:** 0
- **Instructions:** 9

**First Instructions:**
- `DB $96` - Unknown opcode $96
- `DB $66` - Unknown opcode $66
- `DB $C6` - Unknown opcode $C6
- `DB $A2` - Unknown opcode $A2
- `DB $02` - Unknown opcode $02
- `DB $01` - Unknown opcode $01
- `JSL $C66696` - Jump subroutine long
- `JSL $CBEADB` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 58: Subroutine
- **Address Range:** $C000 - $C00A
- **Size:** 11 bytes
- **Bank:** 0
- **Instructions:** 5

**First Instructions:**
- `DB $43` - Unknown opcode $43
- `DB $C7` - Unknown opcode $C7
- `JSL $CBEBF6` - Jump subroutine long
- `JSL $C59384` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 59: Subroutine
- **Address Range:** $D000 - $D00F
- **Size:** 16 bytes
- **Bank:** 0
- **Instructions:** 7

**First Instructions:**
- `DB $00` - Unknown opcode $00
- `JSL $C737BE` - Jump subroutine long
- `DB $68` - Unknown opcode $68
- `DB $00` - Unknown opcode $00
- `JSL $CDACD2` - Jump subroutine long
- `JSL $CCD383` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 60: Subroutine
- **Address Range:** $E000 - $E011
- **Size:** 18 bytes
- **Bank:** 0
- **Instructions:** 10

**First Instructions:**
- `DB $CD` - Unknown opcode $CD
- `SEI` - Set interrupt disable
- `DB $C7` - Unknown opcode $C7
- `LDA #$CE` - Load accumulator immediate
- `DB $03` - Unknown opcode $03
- `JSL $C778E3` - Jump subroutine long
- `LDA #$CE` - Load accumulator immediate
- `DB $03` - Unknown opcode $03
- `JSL $C778E7` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 61: Subroutine
- **Address Range:** $F000 - $F081
- **Size:** 130 bytes
- **Bank:** 0
- **Instructions:** 70

**First Instructions:**
- `STA $9680` - Store accumulator absolute
- `LDA #$00` - Load accumulator immediate
- `DB $0A` - Unknown opcode $0A
- `STA $9682` - Store accumulator absolute
- `DB $A2` - Unknown opcode $A2
- `DB $D1` - Unknown opcode $D1
- `DB $03` - Unknown opcode $03
- `DB $A0` - Unknown opcode $A0
- `DB $00` - Unknown opcode $00
- `DB $00` - Unknown opcode $00
- ... (60 more instructions)

### Region 62: Subroutine
- **Address Range:** $8000 - $8014
- **Size:** 21 bytes
- **Bank:** 0
- **Instructions:** 14

**First Instructions:**
- `LDA $3547` - Load accumulator absolute
- `DB $29` - Unknown opcode $29
- `DB $04` - Unknown opcode $04
- `DB $00` - Unknown opcode $00
- `BNE #$03` - Branch not equal
- `JMP $0011` - Jump absolute
- `DB $00` - Unknown opcode $00
- `DB $D1` - Unknown opcode $D1
- `DB $01` - Unknown opcode $01
- `JMP $0014` - Jump absolute
- ... (4 more instructions)

### Region 63: Subroutine
- **Address Range:** $9000 - $9001
- **Size:** 2 bytes
- **Bank:** 0
- **Instructions:** 2

**First Instructions:**
- `DB $02` - Unknown opcode $02
- `RTL` - Return from subroutine long

### Region 64: Subroutine
- **Address Range:** $A000 - $A008
- **Size:** 9 bytes
- **Bank:** 0
- **Instructions:** 4

**First Instructions:**
- `DB $C7` - Unknown opcode $C7
- `JSL $CCD276` - Jump subroutine long
- `JMP $2001` - Jump absolute
- `RTL` - Return from subroutine long

### Region 65: Subroutine
- **Address Range:** $B000 - $B002
- **Size:** 3 bytes
- **Bank:** 0
- **Instructions:** 3

**First Instructions:**
- `DB $11` - Unknown opcode $11
- `DB $06` - Unknown opcode $06
- `RTL` - Return from subroutine long

### Region 66: Subroutine
- **Address Range:** $C000 - $C013
- **Size:** 20 bytes
- **Bank:** 0
- **Instructions:** 12

**First Instructions:**
- `JMP $2935` - Jump absolute
- `BRA #$00` - Branch always
- `BNE #$03` - Branch not equal
- `JMP $4010` - Jump absolute
- `DB $00` - Unknown opcode $00
- `DB $6D` - Unknown opcode $6D
- `DB $04` - Unknown opcode $04
- `JMP $4013` - Jump absolute
- `DB $00` - Unknown opcode $00
- `DB $49` - Unknown opcode $49
- ... (2 more instructions)

### Region 67: Subroutine
- **Address Range:** $D000 - $D005
- **Size:** 6 bytes
- **Bank:** 0
- **Instructions:** 5

**First Instructions:**
- `BVC #$22` - Branch overflow clear
- `NOP` - No operation
- `DB $C1` - Unknown opcode $C1
- `DB $CD` - Unknown opcode $CD
- `RTL` - Return from subroutine long

### Region 68: Subroutine
- **Address Range:** $E000 - $E01D
- **Size:** 30 bytes
- **Bank:** 0
- **Instructions:** 19

**First Instructions:**
- `JMP $6009` - Jump absolute
- `DB $00` - Unknown opcode $00
- `DB $D2` - Unknown opcode $D2
- `DB $05` - Unknown opcode $05
- `JMP $601D` - Jump absolute
- `LDA $3545` - Load accumulator absolute
- `DB $29` - Unknown opcode $29
- `DB $04` - Unknown opcode $04
- `DB $00` - Unknown opcode $00
- `BNE #$03` - Branch not equal
- ... (9 more instructions)

### Region 69: Subroutine
- **Address Range:** $F000 - $F02C
- **Size:** 45 bytes
- **Bank:** 0
- **Instructions:** 25

**First Instructions:**
- `DB $00` - Unknown opcode $00
- `BEQ #$03` - Branch equal
- `JMP $700A` - Jump absolute
- `DB $02` - Unknown opcode $02
- `JMP $6FFB` - Jump absolute
- `LDA #$12` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `STA $9C11` - Store accumulator absolute
- `LDA #$1C` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- ... (15 more instructions)

### Region 70: Subroutine
- **Address Range:** $8000 - $804F
- **Size:** 80 bytes
- **Bank:** 0
- **Instructions:** 43

**First Instructions:**
- `DB $87` - Unknown opcode $87
- `DB $8F` - Unknown opcode $8F
- `DB $CC` - Unknown opcode $CC
- `BCS #$03` - Branch carry set
- `JMP $802C` - Jump absolute
- `JSL $CC7B05` - Jump subroutine long
- `BCS #$03` - Branch carry set
- `JMP $8026` - Jump absolute
- `JSL $CC7A64` - Jump subroutine long
- `BCS #$03` - Branch carry set
- ... (33 more instructions)

### Region 71: Subroutine
- **Address Range:** $9000 - $906D
- **Size:** 110 bytes
- **Bank:** 0
- **Instructions:** 56

**First Instructions:**
- `DB $0F` - Unknown opcode $0F
- `DB $07` - Unknown opcode $07
- `JSL $CDAC66` - Jump subroutine long
- `BCS #$03` - Branch carry set
- `JMP $902F` - Jump absolute
- `DB $00` - Unknown opcode $00
- `DB $11` - Unknown opcode $11
- `DB $07` - Unknown opcode $07
- `JSL $CDAC66` - Jump subroutine long
- `BCS #$03` - Branch carry set
- ... (46 more instructions)

### Region 72: Subroutine
- **Address Range:** $A000 - $A008
- **Size:** 9 bytes
- **Bank:** 0
- **Instructions:** 7

**First Instructions:**
- `DB $05` - Unknown opcode $05
- `DB $A0` - Unknown opcode $A0
- `JMP $A008` - Jump absolute
- `DB $00` - Unknown opcode $00
- `DB $F7` - Unknown opcode $F7
- `DB $07` - Unknown opcode $07
- `RTL` - Return from subroutine long

### Region 73: Subroutine
- **Address Range:** $B000 - $B0A4
- **Size:** 165 bytes
- **Bank:** 0
- **Instructions:** 88

**First Instructions:**
- `DB $08` - Unknown opcode $08
- `STA $9680` - Store accumulator absolute
- `LDA #$80` - Load accumulator immediate
- `DB $09` - Unknown opcode $09
- `STA $9682` - Store accumulator absolute
- `DB $A2` - Unknown opcode $A2
- `DB $13` - Unknown opcode $13
- `DB $02` - Unknown opcode $02
- `DB $A0` - Unknown opcode $A0
- `DB $01` - Unknown opcode $01
- ... (78 more instructions)

### Region 74: Subroutine
- **Address Range:** $E000 - $E008
- **Size:** 9 bytes
- **Bank:** 0
- **Instructions:** 6

**First Instructions:**
- `JSL $C04604` - Jump subroutine long
- `DB $93` - Unknown opcode $93
- `DB $33` - Unknown opcode $33
- `DB $F6` - Unknown opcode $F6
- `DB $00` - Unknown opcode $00
- `RTL` - Return from subroutine long

### Region 75: Subroutine
- **Address Range:** $8000 - $8012
- **Size:** 19 bytes
- **Bank:** 0
- **Instructions:** 10

**First Instructions:**
- `JSL $C77734` - Jump subroutine long
- `JSL $C77843` - Jump subroutine long
- `DB $13` - Unknown opcode $13
- `DB $00` - Unknown opcode $00
- `DB $CC` - Unknown opcode $CC
- `JSL $C7786D` - Jump subroutine long
- `DB $48` - Unknown opcode $48
- `DB $A2` - Unknown opcode $A2
- `DB $CD` - Unknown opcode $CD
- `RTL` - Return from subroutine long

### Region 76: Subroutine
- **Address Range:** $9000 - $9020
- **Size:** 33 bytes
- **Bank:** 0
- **Instructions:** 13

**First Instructions:**
- `DB $76` - Unknown opcode $76
- `DB $00` - Unknown opcode $00
- `LDA #$EB` - Load accumulator immediate
- `DB $01` - Unknown opcode $01
- `JSL $C75474` - Jump subroutine long
- `JSL $CCD57B` - Jump subroutine long
- `JSL $CDADFB` - Jump subroutine long
- `LDA #$6A` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSL $C75446` - Jump subroutine long
- ... (3 more instructions)

### Region 77: Subroutine
- **Address Range:** $A000 - $A000
- **Size:** 1 bytes
- **Bank:** 0
- **Instructions:** 1

**First Instructions:**
- `RTL` - Return from subroutine long

### Region 78: Interrupt Handler
- **Address Range:** $B000 - $B5E3
- **Size:** 1508 bytes
- **Bank:** 0
- **Instructions:** 712

**First Instructions:**
- `DB $D7` - Unknown opcode $D7
- `DB $AC` - Unknown opcode $AC
- `DB $CD` - Unknown opcode $CD
- `LDA #$03` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSL $C1A988` - Jump subroutine long
- `DB $D7` - Unknown opcode $D7
- `DB $0C` - Unknown opcode $0C
- `JSL $CDACD7` - Jump subroutine long
- `LDA #$03` - Load accumulator immediate
- ... (702 more instructions)

### Region 79: Subroutine
- **Address Range:** $C000 - $C14C
- **Size:** 333 bytes
- **Bank:** 0
- **Instructions:** 204

**First Instructions:**
- `DB $03` - Unknown opcode $03
- `JMP $3DE9` - Jump absolute
- `DB $C9` - Unknown opcode $C9
- `DB $05` - Unknown opcode $05
- `DB $00` - Unknown opcode $00
- `BNE #$03` - Branch not equal
- `JMP $3DF5` - Jump absolute
- `DB $C9` - Unknown opcode $C9
- `DB $06` - Unknown opcode $06
- `DB $00` - Unknown opcode $00
- ... (194 more instructions)

### Region 80: Interrupt Handler
- **Address Range:** $D000 - $D15A
- **Size:** 347 bytes
- **Bank:** 0
- **Instructions:** 168

**First Instructions:**
- `DB $00` - Unknown opcode $00
- `DB $00` - Unknown opcode $00
- `JSL $C736D0` - Jump subroutine long
- `DB $02` - Unknown opcode $02
- `JSL $C78FDF` - Jump subroutine long
- `JSL $CCD400` - Jump subroutine long
- `JSL $CCD2DA` - Jump subroutine long
- `LDA $361A` - Load accumulator absolute
- `DB $C9` - Unknown opcode $C9
- `DB $00` - Unknown opcode $00
- ... (158 more instructions)

### Region 81: Subroutine
- **Address Range:** $E000 - $E026
- **Size:** 39 bytes
- **Bank:** 0
- **Instructions:** 18

**First Instructions:**
- `DB $01` - Unknown opcode $01
- `DB $00` - Unknown opcode $00
- `DB $0C` - Unknown opcode $0C
- `DB $19` - Unknown opcode $19
- `DB $36` - Unknown opcode $36
- `LDA $3619` - Load accumulator absolute
- `DB $29` - Unknown opcode $29
- `JSR $F000` - Jump subroutine
- `DB $03` - Unknown opcode $03
- `JMP $6017` - Jump absolute
- ... (8 more instructions)

### Region 82: Subroutine
- **Address Range:** $F000 - $F002
- **Size:** 3 bytes
- **Bank:** 0
- **Instructions:** 3

**First Instructions:**
- `DB $68` - Unknown opcode $68
- `DB $68` - Unknown opcode $68
- `RTL` - Return from subroutine long

### Region 83: Subroutine
- **Address Range:** $8000 - $803D
- **Size:** 62 bytes
- **Bank:** 0
- **Instructions:** 44

**First Instructions:**
- `BRA #$AD` - Branch always
- `DB $2E` - Unknown opcode $2E
- `DB $34` - Unknown opcode $34
- `DB $83` - Unknown opcode $83
- `DB $03` - Unknown opcode $03
- `LDA $342E` - Load accumulator absolute
- `DB $83` - Unknown opcode $83
- `DB $01` - Unknown opcode $01
- `DB $A3` - Unknown opcode $A3
- `DB $03` - Unknown opcode $03
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
- **Address Range:** $A000 - $A008
- **Size:** 9 bytes
- **Bank:** 0
- **Instructions:** 8

**First Instructions:**
- `DB $81` - Unknown opcode $81
- `DB $C7` - Unknown opcode $C7
- `LDA #$80` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `DB $0C` - Unknown opcode $0C
- `DB $41` - Unknown opcode $41
- `DB $35` - Unknown opcode $35
- `RTL` - Return from subroutine long

### Region 86: Subroutine
- **Address Range:** $B000 - $B08B
- **Size:** 140 bytes
- **Bank:** 0
- **Instructions:** 61

**First Instructions:**
- `CLI` - Clear interrupt disable
- `DB $C7` - Unknown opcode $C7
- `LDA #$BF` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSL $C75828` - Jump subroutine long
- `JMP $B02F` - Jump absolute
- `LDA #$C0` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSL $C75828` - Jump subroutine long
- `LDA #$C1` - Load accumulator immediate
- ... (51 more instructions)

### Region 87: Subroutine
- **Address Range:** $C000 - $C010
- **Size:** 17 bytes
- **Bank:** 0
- **Instructions:** 9

**First Instructions:**
- `CLI` - Clear interrupt disable
- `DB $C7` - Unknown opcode $C7
- `LDA #$B5` - Load accumulator immediate
- `DB $02` - Unknown opcode $02
- `JSL $C75828` - Jump subroutine long
- `LDA #$B6` - Load accumulator immediate
- `DB $02` - Unknown opcode $02
- `JSL $C75828` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 88: Subroutine
- **Address Range:** $D000 - $D014
- **Size:** 21 bytes
- **Bank:** 0
- **Instructions:** 10

**First Instructions:**
- `DB $9F` - Unknown opcode $9F
- `DB $00` - Unknown opcode $00
- `JSL $C758DE` - Jump subroutine long
- `LDA #$A0` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSL $C758DE` - Jump subroutine long
- `LDA #$A1` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSL $C758DE` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 89: Subroutine
- **Address Range:** $E000 - $E013
- **Size:** 20 bytes
- **Bank:** 0
- **Instructions:** 8

**First Instructions:**
- `DB $00` - Unknown opcode $00
- `BNE #$03` - Branch not equal
- `JMP $DFA7` - Jump absolute
- `JSL $CDACD2` - Jump subroutine long
- `JSL $CCD383` - Jump subroutine long
- `JSL $CC9A99` - Jump subroutine long
- `DB $68` - Unknown opcode $68
- `RTL` - Return from subroutine long

### Region 90: Subroutine
- **Address Range:** $8000 - $8006
- **Size:** 7 bytes
- **Bank:** 0
- **Instructions:** 6

**First Instructions:**
- `LDA #$01` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `DB $0C` - Unknown opcode $0C
- `DB $2B` - Unknown opcode $2B
- `DB $36` - Unknown opcode $36
- `RTL` - Return from subroutine long

### Region 91: Subroutine
- **Address Range:** $9000 - $90BD
- **Size:** 190 bytes
- **Bank:** 0
- **Instructions:** 94

**First Instructions:**
- `DB $00` - Unknown opcode $00
- `DB $00` - Unknown opcode $00
- `JSL $C736D0` - Jump subroutine long
- `DB $02` - Unknown opcode $02
- `JSL $C78FDF` - Jump subroutine long
- `JSL $CCD400` - Jump subroutine long
- `JSL $CCE1D1` - Jump subroutine long
- `JSL $CCD37E` - Jump subroutine long
- `LDA $3556` - Load accumulator absolute
- `DB $29` - Unknown opcode $29
- ... (84 more instructions)

### Region 92: Subroutine
- **Address Range:** $B000 - $B00B
- **Size:** 12 bytes
- **Bank:** 0
- **Instructions:** 7

**First Instructions:**
- `JMP $2F7A` - Jump absolute
- `DB $C9` - Unknown opcode $C9
- `DB $06` - Unknown opcode $06
- `DB $00` - Unknown opcode $00
- `BNE #$03` - Branch not equal
- `JMP $2FA9` - Jump absolute
- `RTL` - Return from subroutine long

### Region 93: Subroutine
- **Address Range:** $C000 - $C03B
- **Size:** 60 bytes
- **Bank:** 0
- **Instructions:** 31

**First Instructions:**
- `DB $42` - Unknown opcode $42
- `DB $F6` - Unknown opcode $F6
- `BCC #$03` - Branch carry clear
- `JMP $400B` - Jump absolute
- `DB $02` - Unknown opcode $02
- `JMP $3FFB` - Jump absolute
- `JSL $C04835` - Jump subroutine long
- `DB $53` - Unknown opcode $53
- `DB $42` - Unknown opcode $42
- `DB $F6` - Unknown opcode $F6
- ... (21 more instructions)

### Region 94: Subroutine
- **Address Range:** $D000 - $D00F
- **Size:** 16 bytes
- **Bank:** 0
- **Instructions:** 9

**First Instructions:**
- `LDA #$08` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `DB $1C` - Unknown opcode $1C
- `DB $53` - Unknown opcode $53
- `DB $35` - Unknown opcode $35
- `JSL $CCD383` - Jump subroutine long
- `JSL $CCD298` - Jump subroutine long
- `DB $68` - Unknown opcode $68
- `RTL` - Return from subroutine long

### Region 95: Subroutine
- **Address Range:** $E000 - $E144
- **Size:** 325 bytes
- **Bank:** 0
- **Instructions:** 173

**First Instructions:**
- `LDA #$00` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `DB $83` - Unknown opcode $83
- `DB $01` - Unknown opcode $01
- `LDA #$04` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSL $C73C23` - Jump subroutine long
- `JMP $6041` - Jump absolute
- `LDA #$97` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- ... (163 more instructions)

### Region 96: Subroutine
- **Address Range:** $F000 - $F0F4
- **Size:** 245 bytes
- **Bank:** 0
- **Instructions:** 129

**First Instructions:**
- `JMP $7007` - Jump absolute
- `DB $02` - Unknown opcode $02
- `JMP $6FF8` - Jump absolute
- `LDA #$1E` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `JSL $C74B39` - Jump subroutine long
- `JSL $C1A92E` - Jump subroutine long
- `JML $2E2208` - Jump long
- `LDA #$C1` - Load accumulator immediate
- `DB $56` - Unknown opcode $56
- ... (119 more instructions)

### Region 97: Subroutine
- **Address Range:** $8000 - $800F
- **Size:** 16 bytes
- **Bank:** 0
- **Instructions:** 9

**First Instructions:**
- `DB $C9` - Unknown opcode $C9
- `DB $00` - Unknown opcode $00
- `DB $00` - Unknown opcode $00
- `BNE #$03` - Branch not equal
- `JMP $800C` - Jump absolute
- `DB $02` - Unknown opcode $02
- `JMP $7FFD` - Jump absolute
- `JMP $7FC0` - Jump absolute
- `RTL` - Return from subroutine long

### Region 98: Subroutine
- **Address Range:** $9000 - $9056
- **Size:** 87 bytes
- **Bank:** 0
- **Instructions:** 51

**First Instructions:**
- `DB $00` - Unknown opcode $00
- `DB $00` - Unknown opcode $00
- `STA $9684` - Store accumulator absolute
- `LDA #$19` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `DB $A2` - Unknown opcode $A2
- `DB $05` - Unknown opcode $05
- `DB $00` - Unknown opcode $00
- `DB $A0` - Unknown opcode $A0
- `DB $02` - Unknown opcode $02
- ... (41 more instructions)

### Region 99: Subroutine
- **Address Range:** $A000 - $A02A
- **Size:** 43 bytes
- **Bank:** 0
- **Instructions:** 22

**First Instructions:**
- `DB $A0` - Unknown opcode $A0
- `LDA $343E` - Load accumulator absolute
- `DB $C9` - Unknown opcode $C9
- `DB $01` - Unknown opcode $01
- `DB $00` - Unknown opcode $00
- `BNE #$03` - Branch not equal
- `JMP $9FD9` - Jump absolute
- `DB $C9` - Unknown opcode $C9
- `DB $03` - Unknown opcode $03
- `DB $00` - Unknown opcode $00
- ... (12 more instructions)

### Region 100: Subroutine
- **Address Range:** $B000 - $B000
- **Size:** 1 bytes
- **Bank:** 0
- **Instructions:** 1

**First Instructions:**
- `RTL` - Return from subroutine long

### Region 101: Subroutine
- **Address Range:** $C000 - $C00E
- **Size:** 15 bytes
- **Bank:** 0
- **Instructions:** 9

**First Instructions:**
- `DB $01` - Unknown opcode $01
- `DB $00` - Unknown opcode $00
- `BEQ #$03` - Branch equal
- `JMP $C00E` - Jump absolute
- `DB $00` - Unknown opcode $00
- `DB $24` - Unknown opcode $24
- `DB $0A` - Unknown opcode $0A
- `JSL $CDACD2` - Jump subroutine long
- `RTL` - Return from subroutine long

### Region 102: Subroutine
- **Address Range:** $D000 - $D012
- **Size:** 19 bytes
- **Bank:** 0
- **Instructions:** 13

**First Instructions:**
- `BNE #$4C` - Branch not equal
- `DB $12` - Unknown opcode $12
- `BNE #$22` - Branch not equal
- `DB $DF` - Unknown opcode $DF
- `DB $CF` - Unknown opcode $CF
- `DB $CD` - Unknown opcode $CD
- `JSL $CC9E86` - Jump subroutine long
- `LDA #$10` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `DB $0C` - Unknown opcode $0C
- ... (3 more instructions)

### Region 103: Subroutine
- **Address Range:** $E000 - $E01B
- **Size:** 28 bytes
- **Bank:** 0
- **Instructions:** 16

**First Instructions:**
- `DB $A4` - Unknown opcode $A4
- `DB $6F` - Unknown opcode $6F
- `DB $C7` - Unknown opcode $C7
- `LDA #$00` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `STA $3608` - Store accumulator absolute
- `LDA #$00` - Load accumulator immediate
- `DB $00` - Unknown opcode $00
- `STA $360A` - Store accumulator absolute
- `LDA #$00` - Load accumulator immediate
- ... (6 more instructions)

### Region 104: Interrupt Handler
- **Address Range:** $F000 - $F00C
- **Size:** 13 bytes
- **Bank:** 0
- **Instructions:** 12

**First Instructions:**
- `DB $06` - Unknown opcode $06
- `DB $1C` - Unknown opcode $1C
- `DB $16` - Unknown opcode $16
- `DB $68` - Unknown opcode $68
- `DB $14` - Unknown opcode $14
- `DB $F8` - Unknown opcode $F8
- `DB $04` - Unknown opcode $04
- `DB $B8` - Unknown opcode $B8
- `DB $88` - Unknown opcode $88
- `BEQ #$B0` - Branch equal
- ... (2 more instructions)

### Region 105: Interrupt Handler
- **Address Range:** $F000 - $F019
- **Size:** 26 bytes
- **Bank:** 0
- **Instructions:** 23

**First Instructions:**
- `DB $C6` - Unknown opcode $C6
- `DB $3A` - Unknown opcode $3A
- `DB $0A` - Unknown opcode $0A
- `DB $F4` - Unknown opcode $F4
- `JSL $F42CDC` - Jump subroutine long
- `DB $0C` - Unknown opcode $0C
- `DB $B4` - Unknown opcode $B4
- `CLC` - Clear carry flag
- `DB $E8` - Unknown opcode $E8
- `DB $68` - Unknown opcode $68
- ... (13 more instructions)

