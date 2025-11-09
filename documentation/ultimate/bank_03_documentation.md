# bank_03.asm
**Project**: Dragon Quest III ROM Analysis
**Type**: 65816 Assembly Language
**Size**: 124,581 bytes
**Last Modified**: 2025-11-09 02:52:22
**Git Status**: 🔄 M src/bank_03.asm

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

📄 Simple file with linear execution flow.

## Technical Details
- **File Size**: 124,581 bytes
- **Line Count**: 2234
- **Character Encoding**: UTF-8 (auto-detected)
- **Documentation Coverage**: 0.0%
- **Estimated Complexity**: 0/10

## Code Metrics
- **Complexity Score**: 0/10
- **Documentation Coverage**: 0.0%
- **Function Count**: 0
- **Comment Lines**: 0

## Source Code Preview

```nasm
; Dragon Quest III - Bank $03
; Regions: 1

.BANK 3
.ORG $0000

; Region $018000-$019000
; SNES address: $03:$8000
region_018000:
    db $26           ; 26          ; $018000 [03:$8000]
    DEY              ; 88          ; $018001 [03:$8001]
    STA ($89,X)      ; 81 89       ; $018002 [03:$8002]
    LDA $e3d0        ; AD D0 E3    ; $018004 [03:$8004]
    PHA              ; 48          ; $018007 [03:$8007]
    LSR A            ; 4A          ; $018008 [03:$8008]
    LSR A            ; 4A          ; $018009 [03:$8009]
    LSR A            ; 4A          ; $01800a [03:$800a]
    ASL A            ; 0A          ; $01800b [03:$800b]
    db $25           ; 25          ; $01800c [03:$800c]
    db $26           ; 26          ; $01800d [03:$800d]
    STA $10          ; 85 10       ; $01800e [03:$800e]
    TAY              ; A8          ; $018010 [03:$8010]
    db $b7           ; B7          ; $018011 [03:$8011]
    BRK #$aa         ; 00 AA       ; $018012 [03:$8012]
    SEP #$20         ; E2 20       ; $018014 [03:$8014]
    db $9c           ; 9C          ; $018016 [03:$8016]
    db $4f           ; 4F          ; $018017 [03:$8017]
    JSR ($519c,X)    ; FC 9C 51    ; $018018 [03:$8018]
    JSR ($539c,X)    ; FC 9C 53    ; $01801b [03:$801b]
    JSR ($559c,X)    ; FC 9C 55    ; $01801e [03:$801e]
    JSR ($9cbf,X)    ; FC BF 9C    ; $018021 [03:$8021]
    db $a4           ; A4          ; $018024 [03:$8024]
    db $ed           ; ED          ; $018025 [03:$8025]
    STA $fc4e        ; 8D 4E FC    ; $018026 [03:$8026]
    db $bf           ; BF          ; $018029 [03:$8029]
    db $d9           ; D9          ; $01802a [03:$802a]
    LDX $8ded        ; AE ED 8D    ; $01802b [03:$802b]
    BVC $802c        ; 50 FC       ; $01802e [03:$802e]
    db $bf           ; BF          ; $018030 [03:$8030]
    db $16           ; 16          ; $018031 [03:$8031]
    LDA $8ded,Y      ; B9 ED 8D    ; $018032 [03:$8032]
    db $52           ; 52          ; $018035 [03:$8035]
    JSR ($53bf,X)    ; FC BF 53    ; $018036 [03:$8036]
    db $c3           ; C3          ; $018039 [03:$8039]
    db $ed           ; ED          ; $01803a [03:$803a]
    STA $fc54        ; 8D 54 FC    ; $01803b [03:$803b]
    REP #$20         ; C2 20       ; $01803e [03:$803e]
    PLA              ; 68          ; $018040 [03:$8040]
    AND #$0007       ; 29 07 00    ; $018041 [03:$8041]
    ASL A            ; 0A          ; $018044 [03:$8044]
...
```

**Lines shown**: 50 of 2234 total

