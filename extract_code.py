#!/usr/bin/env python3
"""
Dragon Quest III Code Extractor
Extracts actual assembly code from ROM to populate source files
"""

import struct
from dq3_rom_analyzer_v2 import DQ3ROMAnalyzer

class DQ3CodeExtractor:
    def __init__(self):
        self.analyzer = DQ3ROMAnalyzer()

    def extract_bank_code(self, rom_data, bank, start_offset, size, output_file):
        """Extract assembly code from a specific ROM bank."""
        print(f"Extracting Bank ${bank:02X} code to {output_file}...")

        # Calculate file offset for HiROM bank
        bank_offset = bank * 0x8000 + start_offset
        if bank_offset + size > len(rom_data):
            print(f"Warning: Bank ${bank:02X} extends beyond ROM")
            size = len(rom_data) - bank_offset

        bank_data = rom_data[bank_offset:bank_offset + size]

        # Disassemble the code
        assembly_lines = []
        pc = 0
        instruction_count = 0

        assembly_lines.append(f";==============================================================================")
        assembly_lines.append(f"; Dragon Quest III - Bank ${bank:02X} Code")
        assembly_lines.append(f"; Extracted from ROM at offset ${bank_offset:06X}")
        assembly_lines.append(f";==============================================================================")
        assembly_lines.append("")
        assembly_lines.append('.include "hardware.inc"')
        assembly_lines.append("")
        assembly_lines.append(f'.segment "BANK_{bank:02X}_CODE"')
        assembly_lines.append("")

        while pc < len(bank_data) and instruction_count < 500:  # Limit to prevent huge files
            addr = 0xC00000 + bank * 0x8000 + start_offset + pc
            remaining = bank_data[pc:]

            if not remaining:
                break

            instruction, length, comment = self.analyzer.decode_instruction(remaining, addr)

            # Add labels for jump targets and function starts
            if pc % 0x100 == 0 or (pc > 0 and self._is_function_start(bank_data, pc)):
                assembly_lines.append(f"")
                assembly_lines.append(f"Function_{bank:02X}_{pc:04X}:")

            # Format the assembly line
            assembly_lines.append(f"    {instruction:<20} {comment}")

            pc += length
            instruction_count += 1

            # Stop at RTS/RTL/RTI to avoid disassembling data
            if remaining[0] in [0x60, 0x6B, 0x40]:  # RTS, RTL, RTI
                pc += length  # Move past the return instruction
                if pc % 16 == 0:  # If at boundary, might be next function
                    break

        # Write to file
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write('\n'.join(assembly_lines))
            f.write('\n')

        return instruction_count

    def _is_function_start(self, data, pc):
        """Heuristic to detect function starts."""
        if pc < 1:
            return False
        # Check if previous instruction was RTS/RTL/RTI
        prev_opcode = data[pc - 1]
        return prev_opcode in [0x60, 0x6B, 0x40]

    def extract_boot_code(self, rom_data, output_file):
        """Extract the actual boot code starting from reset vector."""
        print("Extracting boot code...")

        # Find reset vector
        header_pos = 0xFFC0
        if header_pos + 32 <= len(rom_data):
            vectors = struct.unpack('<16H', rom_data[header_pos + 0x20:header_pos + 0x40])
            reset_vector = vectors[15]  # Emulation mode reset
            print(f"Reset vector: ${reset_vector:04X}")

            # Convert to file offset
            if reset_vector >= 0x8000:
                boot_offset = reset_vector - 0x8000

                assembly_lines = []
                assembly_lines.append(f";==============================================================================")
                assembly_lines.append(f"; Dragon Quest III - Boot System")
                assembly_lines.append(f"; Extracted from reset vector ${reset_vector:04X}")
                assembly_lines.append(f";==============================================================================")
                assembly_lines.append("")
                assembly_lines.append('.include "hardware.inc"')
                assembly_lines.append("")
                assembly_lines.append('.segment "BOOT_CODE"')
                assembly_lines.append("")
                assembly_lines.append("ResetHandler:")

                # Extract boot code
                boot_data = rom_data[boot_offset:boot_offset + 0x200]  # 512 bytes should be enough
                pc = 0
                instruction_count = 0

                while pc < len(boot_data) and instruction_count < 100:
                    addr = reset_vector + pc
                    remaining = boot_data[pc:]

                    if not remaining:
                        break

                    instruction, length, comment = self.analyzer.decode_instruction(remaining, addr)
                    assembly_lines.append(f"    {instruction:<20} {comment}")

                    pc += length
                    instruction_count += 1

                    # Stop at certain instructions that indicate end of boot
                    if remaining[0] in [0x4C, 0x5C]:  # JMP, JML
                        break

                assembly_lines.append("")
                assembly_lines.append(";==============================================================================")
                assembly_lines.append("; Interrupt Handlers")
                assembly_lines.append(";==============================================================================")
                assembly_lines.append("")
                assembly_lines.append("NMIHandler:")
                assembly_lines.append("    rti")
                assembly_lines.append("")
                assembly_lines.append("IRQHandler:")
                assembly_lines.append("    rti")
                assembly_lines.append("")
                assembly_lines.append(";==============================================================================")
                assembly_lines.append("; Hardware Vectors")
                assembly_lines.append(";==============================================================================")
                assembly_lines.append("")
                assembly_lines.append('.segment "VECTORS"')
                assembly_lines.append("")
                assembly_lines.append("; Native mode vectors")
                assembly_lines.append(".word 0, 0, 0, 0, 0, NMIHandler, ResetHandler, IRQHandler")
                assembly_lines.append("")
                assembly_lines.append("; Emulation mode vectors")
                assembly_lines.append(".word 0, 0, 0, 0, 0, NMIHandler, ResetHandler, IRQHandler")

                # Write to file
                with open(output_file, 'w', encoding='utf-8') as f:
                    f.write('\n'.join(assembly_lines))
                    f.write('\n')

                return instruction_count

        return 0

def main():
    extractor = DQ3CodeExtractor()

    # Load ROM
    rom_path = 'static/Dragon Quest III - Soshite Densetsu he... (J).smc'
    try:
        with open(rom_path, 'rb') as f:
            rom_data = f.read()
    except FileNotFoundError:
        print(f"Error: ROM file not found: {rom_path}")
        return

    print(f"ROM loaded: {len(rom_data):,} bytes")

    # Extract boot code
    boot_count = extractor.extract_boot_code(rom_data, 'src/boot/boot.asm')
    print(f"Extracted {boot_count} boot instructions")

    # Extract engine code (Bank 01)
    engine_count = extractor.extract_bank_code(rom_data, 0x01, 0x0000, 0x2000, 'src/engine/engine.asm')
    print(f"Extracted {engine_count} engine instructions")

    # Extract battle code (Bank 02)
    battle_count = extractor.extract_bank_code(rom_data, 0x02, 0x0000, 0x2000, 'src/battle/battle.asm')
    print(f"Extracted {battle_count} battle instructions")

    total_instructions = boot_count + engine_count + battle_count
    print(f"\nTotal instructions extracted: {total_instructions}")

if __name__ == '__main__':
    main()
