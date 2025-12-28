#!/usr/bin/env python3
"""
Mass Dragon Quest III Code Extractor
Extract large amounts of code to maximize ROM coverage
"""

from dq3_rom_analyzer_v2 import DQ3ROMAnalyzer
import os

def extract_massive_code():
    """Extract massive amounts of code from all ROM banks."""
    analyzer = DQ3ROMAnalyzer()

    # Load ROM
    rom_path = 'static/Dragon Quest III - Soshite Densetsu he... (J).smc'
    with open(rom_path, 'rb') as f:
        rom_data = f.read()

    print("🚀 MASSIVE CODE EXTRACTION")
    print("Extracting code from all ROM banks...")

    total_instructions = 0

    # Extract from many banks
    banks_to_extract = [
        (0x00, "boot", 0x7000),      # Boot bank - extract from boot area
        (0x01, "engine", 0x8000),    # Engine bank
        (0x02, "battle", 0x8000),    # Battle bank
        (0x03, "menu", 0x8000),      # Menu bank
        (0x04, "field", 0x8000),     # Field bank
        (0x05, "audio", 0x8000),     # Audio bank
        (0x06, "graphics", 0x8000),  # Graphics bank
        (0x07, "text", 0x8000),      # Text bank
    ]

    for bank, name, size in banks_to_extract:
        instructions = extract_bank_comprehensive(rom_data, analyzer, bank, name, size)
        total_instructions += instructions
        print(f"  Bank ${bank:02X} ({name}): {instructions:,} instructions")

    print(f"\n🎯 EXTRACTION COMPLETE")
    print(f"   Total Instructions: {total_instructions:,}")
    print(f"   Estimated Coverage: ~{total_instructions * 2 / 4194304 * 100:.1f}% of ROM")

def extract_bank_comprehensive(rom_data, analyzer, bank, name, size):
    """Extract comprehensive code from a specific bank."""
    lines = []
    lines.append(f";==============================================================================")
    lines.append(f"; Dragon Quest III - {name.title()} System (Bank ${bank:02X})")
    lines.append(f"; Comprehensive code extraction")
    lines.append(f";==============================================================================")
    lines.append("")
    lines.append('.include "hardware.inc"')
    lines.append("")
    lines.append(f'.segment "{name.upper()}_CODE"')
    lines.append("")

    # Calculate bank offset
    bank_offset = bank * 0x8000
    if bank == 0:
        # Boot bank - start from actual code area
        bank_offset = 0x7000
        bank_data = rom_data[bank_offset:bank_offset + size]
        base_address = 0xFF00  # High ROM area
    else:
        bank_data = rom_data[bank_offset:bank_offset + size]
        base_address = 0xC00000 + bank * 0x8000

    pc = 0
    instruction_count = 0
    function_count = 0

    while pc < len(bank_data):
        if instruction_count >= 2000:  # Limit per bank to keep files manageable
            break

        addr = base_address + pc
        remaining = bank_data[pc:]

        if not remaining:
            break

        # Add function labels at regular intervals and likely function starts
        if pc % 0x200 == 0 or _is_likely_function_start(remaining):
            if function_count > 0:
                lines.append("")
            lines.append(f"{name.title()}_Function_{function_count:03X}:")
            function_count += 1

        instruction, length, comment = analyzer.decode_instruction(remaining, addr)
        lines.append(f"    {instruction:<20} {comment}")

        pc += length
        instruction_count += 1

        # Skip obvious data sections
        if _is_data_section(remaining):
            # Skip ahead through data
            skip_count = 0
            while pc < len(bank_data) and skip_count < 256:
                if not _is_data_section(bank_data[pc:]):
                    break
                pc += 1
                skip_count += 1

            if skip_count > 0:
                lines.append(f"    ; Skipped {skip_count} bytes of data")

    # Write to file
    os.makedirs('src', exist_ok=True)
    filename = f'src/{name}_{bank:02X}.asm'
    with open(filename, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))
        f.write('\n')

    return instruction_count

def _is_likely_function_start(data):
    """Heuristic to detect function starts."""
    if len(data) < 4:
        return False

    # Common function start patterns
    opcodes = data[:4]

    # SEP/REP at start
    if opcodes[0] in [0xC2, 0xE2]:  # REP/SEP
        return True

    # PHP at start (save registers)
    if opcodes[0] == 0x08:  # PHP
        return True

    # PHB/PHK at start (save bank)
    if opcodes[0] in [0x8B, 0x4B]:  # PHB/PHK
        return True

    return False

def _is_data_section(data):
    """Detect if we're in a data section vs code."""
    if len(data) < 16:
        return True

    # Check for patterns that indicate data
    sample = data[:16]

    # Lots of zeros
    if sum(1 for b in sample if b == 0x00) > 12:
        return True

    # Lots of 0xFF
    if sum(1 for b in sample if b == 0xFF) > 12:
        return True

    # Repeated bytes (graphics/audio data)
    if len(set(sample)) < 4:
        return True

    return False

# Also create an improved boot extractor for the correct location
def extract_correct_boot():
    """Extract boot code from the correct location."""
    analyzer = DQ3ROMAnalyzer()

    with open('static/Dragon Quest III - Soshite Densetsu he... (J).smc', 'rb') as f:
        rom_data = f.read()

    lines = []
    lines.append(f";==============================================================================")
    lines.append(f"; Dragon Quest III - Corrected Boot Sequence")
    lines.append(f"; Boot code at proper ROM addresses")
    lines.append(f";==============================================================================")
    lines.append("")
    lines.append('.include "hardware.inc"')
    lines.append("")
    lines.append('.segment "BOOT_CODE"')
    lines.append("")

    # Extract boot code from the high ROM area ($FFB6)
    boot_offset = 0x3FFB6  # File offset for $FFB6 in HiROM
    boot_data = rom_data[boot_offset:boot_offset + 0x100]

    lines.append("ResetHandler:")
    lines.append("    ; Actual boot sequence from $FFB6")

    pc = 0
    instruction_count = 0

    while pc < len(boot_data) and instruction_count < 50:
        addr = 0xFFB6 + pc
        remaining = boot_data[pc:]

        if not remaining:
            break

        instruction, length, comment = analyzer.decode_instruction(remaining, addr)
        lines.append(f"    {instruction:<20} {comment}")

        pc += length
        instruction_count += 1

        # Stop at obvious end points
        if remaining[0] in [0x4C, 0x5C]:  # JMP/JML
            break

    # Add vectors
    lines.extend([
        "",
        ";==============================================================================",
        "; Interrupt Handlers",
        ";==============================================================================",
        "",
        "NMIHandler:",
        "    rti",
        "",
        "IRQHandler:",
        "    rti",
        "",
        ";==============================================================================",
        "; Hardware Vectors",
        ";==============================================================================",
        "",
        '.segment "VECTORS"',
        "",
        "; Native mode vectors",
        ".word 0, 0, 0, 0, 0, NMIHandler, ResetHandler, IRQHandler",
        "",
        "; Emulation mode vectors",
        ".word 0, 0, 0, 0, 0, NMIHandler, ResetHandler, IRQHandler"
    ])

    with open('src/boot/boot.asm', 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))
        f.write('\n')

    print(f"Corrected boot.asm with {instruction_count} instructions")

if __name__ == '__main__':
    # Extract corrected boot code
    extract_correct_boot()

    # Extract massive amounts of code
    extract_massive_code()
