#!/usr/bin/env python3
"""
Improved Dragon Quest III Code Extractor
Follows jumps to find actual executable code
"""

import struct
from dq3_rom_analyzer_v2 import DQ3ROMAnalyzer

def extract_real_code():
    """Extract actual executable code from DQ3 ROM."""
    analyzer = DQ3ROMAnalyzer()

    # Load ROM
    rom_path = 'static/Dragon Quest III - Soshite Densetsu he... (J).smc'
    with open(rom_path, 'rb') as f:
        rom_data = f.read()

    print("Extracting real Dragon Quest III code...")

    # Extract Boot Code - Start from the actual boot sequence at $FFB6
    boot_code = extract_boot_sequence(rom_data, analyzer)

    # Extract Main Initialization at $806D (from JMP in boot sequence)
    main_init_code = extract_main_init(rom_data, analyzer, 0x806D)

    # Extract System Functions at $C01098 and $C08FD7 (from JSL calls)
    system_func1 = extract_function(rom_data, analyzer, 0xC01098, "InitializeSystem")
    system_func2 = extract_function(rom_data, analyzer, 0xC08FD7, "InitializeGraphics")

    # Write combined boot.asm
    write_boot_file(boot_code, main_init_code, system_func1, system_func2)

    # Extract substantial engine code from Bank 01
    extract_engine_code(rom_data, analyzer)

    # Extract battle code from Bank 02
    extract_battle_code(rom_data, analyzer)

def extract_boot_sequence(rom_data, analyzer):
    """Extract the actual boot sequence starting from $FFB6."""
    boot_lines = []
    boot_lines.append(";==============================================================================")
    boot_lines.append("; Dragon Quest III - Real Boot Sequence")
    boot_lines.append("; Actual executable code starting at $FFB6")
    boot_lines.append(";==============================================================================")
    boot_lines.append("")
    boot_lines.append('.include "hardware.inc"')
    boot_lines.append("")
    boot_lines.append('.segment "BOOT_CODE"')
    boot_lines.append("")

    # Start from the actual boot code at $FFB6
    boot_offset = 0xFFB6 - 0x8000  # Convert to file offset
    boot_data = rom_data[boot_offset:boot_offset + 0x50]

    boot_lines.append("ResetHandler:")
    boot_lines.append("    ; Reset vector jumps here at $FFB6")

    pc = 0
    instruction_count = 0

    while pc < len(boot_data) and instruction_count < 20:
        addr = 0xFFB6 + pc
        remaining = boot_data[pc:]

        if not remaining:
            break

        instruction, length, comment = analyzer.decode_instruction(remaining, addr)

        # Add meaningful labels
        if addr == 0xFFB6:
            boot_lines.append("ActualBootStart:")
        elif addr == 0xFFBF:
            boot_lines.append("    ; Call system initialization")
        elif addr == 0xFFC9:
            boot_lines.append("    ; Call graphics initialization")

        boot_lines.append(f"    {instruction:<20} {comment}")

        pc += length
        instruction_count += 1

        # Stop at JMP to main init
        if remaining[0] == 0x4C:  # JMP
            break

    return boot_lines

def extract_main_init(rom_data, analyzer, address):
    """Extract main initialization code."""
    init_lines = []
    init_lines.append("")
    init_lines.append(";==============================================================================")
    init_lines.append(f"; Main Initialization Code at ${address:04X}")
    init_lines.append(";==============================================================================")
    init_lines.append("")

    # Convert address to file offset
    if address >= 0x8000:
        init_offset = address - 0x8000
    else:
        init_offset = address

    init_data = rom_data[init_offset:init_offset + 0x100]

    init_lines.append(f"MainInit_{address:04X}:")

    pc = 0
    instruction_count = 0

    while pc < len(init_data) and instruction_count < 50:
        addr = address + pc
        remaining = init_data[pc:]

        if not remaining:
            break

        instruction, length, comment = analyzer.decode_instruction(remaining, addr)
        init_lines.append(f"    {instruction:<20} {comment}")

        pc += length
        instruction_count += 1

        # Stop at RTS/RTL/JMP to avoid going into data
        if remaining[0] in [0x60, 0x6B, 0x4C, 0x5C]:
            pc += length
            break

    return init_lines

def extract_function(rom_data, analyzer, address, name):
    """Extract a specific function by address."""
    func_lines = []
    func_lines.append("")
    func_lines.append(";==============================================================================")
    func_lines.append(f"; {name} at ${address:06X}")
    func_lines.append(";==============================================================================")
    func_lines.append("")

    # Convert to file offset for HiROM
    bank = (address >> 16) & 0xFF
    offset = address & 0xFFFF
    if offset >= 0x8000:
        file_offset = bank * 0x8000 + (offset - 0x8000)
    else:
        file_offset = bank * 0x8000 + offset

    func_data = rom_data[file_offset:file_offset + 0x200]

    func_lines.append(f"{name}:")

    pc = 0
    instruction_count = 0

    while pc < len(func_data) and instruction_count < 100:
        addr = address + pc
        remaining = func_data[pc:]

        if not remaining:
            break

        instruction, length, comment = analyzer.decode_instruction(remaining, addr)
        func_lines.append(f"    {instruction:<20} {comment}")

        pc += length
        instruction_count += 1

        # Stop at RTL (return from long)
        if remaining[0] == 0x6B:  # RTL
            break

    return func_lines

def write_boot_file(boot_code, main_init, func1, func2):
    """Write complete boot file."""
    all_lines = boot_code + main_init + func1 + func2

    # Add interrupt handlers and vectors
    all_lines.extend([
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
        f.write('\n'.join(all_lines))
        f.write('\n')

    print(f"Wrote boot.asm with {len(all_lines)} lines")

def extract_engine_code(rom_data, analyzer):
    """Extract substantial engine code from Bank 01."""
    engine_lines = []
    engine_lines.append(";==============================================================================")
    engine_lines.append("; Dragon Quest III - Game Engine (Bank 01)")
    engine_lines.append("; Main game logic and system management")
    engine_lines.append(";==============================================================================")
    engine_lines.append("")
    engine_lines.append('.include "hardware.inc"')
    engine_lines.append("")
    engine_lines.append('.segment "ENGINE_CODE"')
    engine_lines.append("")

    # Extract from Bank 01 starting at beginning
    bank_offset = 0x8000  # Bank 01 starts at file offset 0x8000
    engine_data = rom_data[bank_offset:bank_offset + 0x4000]  # Extract 16KB

    pc = 0
    instruction_count = 0
    current_function = None

    while pc < len(engine_data) and instruction_count < 1000:
        addr = 0xC08000 + pc
        remaining = engine_data[pc:]

        if not remaining:
            break

        # Add function labels at certain boundaries
        if pc % 0x100 == 0 or (pc > 0 and remaining[0] in [0x18, 0x78, 0xC2, 0xE2]):  # Common function starts
            if current_function:
                engine_lines.append("")
            engine_lines.append(f"Engine_Function_{pc:04X}:")
            current_function = pc

        instruction, length, comment = analyzer.decode_instruction(remaining, addr)
        engine_lines.append(f"    {instruction:<20} {comment}")

        pc += length
        instruction_count += 1

        # Stop at obvious data sections (lots of zeros or repeated patterns)
        if pc > 16 and all(engine_data[pc-16+i] == 0x00 for i in range(16)):
            break

    with open('src/engine/engine.asm', 'w', encoding='utf-8') as f:
        f.write('\n'.join(engine_lines))
        f.write('\n')

    print(f"Wrote engine.asm with {instruction_count} instructions")

def extract_battle_code(rom_data, analyzer):
    """Extract battle system code from Bank 02."""
    battle_lines = []
    battle_lines.append(";==============================================================================")
    battle_lines.append("; Dragon Quest III - Battle System (Bank 02)")
    battle_lines.append("; Combat mechanics and battle interface")
    battle_lines.append(";==============================================================================")
    battle_lines.append("")
    battle_lines.append('.include "hardware.inc"')
    battle_lines.append("")
    battle_lines.append('.segment "BATTLE_CODE"')
    battle_lines.append("")

    # Extract from Bank 02
    bank_offset = 0x10000  # Bank 02 starts at file offset 0x10000
    battle_data = rom_data[bank_offset:bank_offset + 0x4000]  # Extract 16KB

    pc = 0
    instruction_count = 0
    current_function = None

    while pc < len(battle_data) and instruction_count < 800:
        addr = 0xC10000 + pc
        remaining = battle_data[pc:]

        if not remaining:
            break

        # Add function labels
        if pc % 0x100 == 0 or (pc > 0 and remaining[0] in [0x18, 0x78, 0xC2, 0xE2]):
            if current_function:
                battle_lines.append("")
            battle_lines.append(f"Battle_Function_{pc:04X}:")
            current_function = pc

        instruction, length, comment = analyzer.decode_instruction(remaining, addr)
        battle_lines.append(f"    {instruction:<20} {comment}")

        pc += length
        instruction_count += 1

        # Stop at data sections
        if pc > 16 and all(battle_data[pc-16+i] == 0x00 for i in range(16)):
            break

    with open('src/battle/battle.asm', 'w', encoding='utf-8') as f:
        f.write('\n'.join(battle_lines))
        f.write('\n')

    print(f"Wrote battle.asm with {instruction_count} instructions")

if __name__ == '__main__':
    extract_real_code()
