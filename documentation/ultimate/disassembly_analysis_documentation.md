# disassembly_analysis.md
**Project**: Dragon Quest III ROM Analysis
**Type**: Markdown Documentation
**Size**: 46,625 bytes
**Last Modified**: 2025-11-09 04:23:21
**Git Status**: 🔄 M disassembly/deep_analysis/disassembly_analysis.md

## Overview
This file is part of the comprehensive Dragon Quest III ROM analysis project.

⚡ High complexity file with advanced algorithmic implementations.

## Technical Details
- **File Size**: 46,625 bytes
- **Line Count**: 1784
- **Character Encoding**: UTF-8 (auto-detected)
- **Comment Lines**: 223
- **Documentation Coverage**: 14.2%
- **Estimated Complexity**: 10/10

## Code Metrics
- **Complexity Score**: 61/10
- **Documentation Coverage**: 14.2%
- **Function Count**: 0
- **Comment Lines**: 223

## Source Code Preview

```text
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
...
```

**Lines shown**: 50 of 1784 total

