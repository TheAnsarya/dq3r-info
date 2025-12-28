#!/usr/bin/env python3
"""
Dragon Quest III (SNES) ROM Analysis Tool v2
Complete 65C816 instruction set with proper DQ3 system analysis
"""

import struct

class DQ3ROMAnalyzer:
    """Professional Dragon Quest III ROM analyzer with complete 65C816 support."""

    def __init__(self):
        self.opcodes = self._build_opcode_table()

    def _build_opcode_table(self):
        """Build complete 65C816 instruction table."""
        return {
            # 0x00-0x0F
            0x00: ("BRK", 2, "stack_sig"), 0x01: ("ORA", 2, "dp_x_ind"),
            0x02: ("COP", 2, "stack_sig"), 0x03: ("ORA", 2, "stack_rel"),
            0x04: ("TSB", 2, "dp"), 0x05: ("ORA", 2, "dp"),
            0x06: ("ASL", 2, "dp"), 0x07: ("ORA", 2, "dp_ind_long"),
            0x08: ("PHP", 1, "stack"), 0x09: ("ORA", 2, "imm_m"),
            0x0A: ("ASL", 1, "acc"), 0x0B: ("PHD", 1, "stack"),
            0x0C: ("TSB", 3, "abs"), 0x0D: ("ORA", 3, "abs"),
            0x0E: ("ASL", 3, "abs"), 0x0F: ("ORA", 4, "abs_long"),

            # 0x10-0x1F
            0x10: ("BPL", 2, "rel8"), 0x11: ("ORA", 2, "dp_ind_y"),
            0x12: ("ORA", 2, "dp_ind"), 0x13: ("ORA", 2, "stack_rel_y"),
            0x14: ("TRB", 2, "dp"), 0x15: ("ORA", 2, "dp_x"),
            0x16: ("ASL", 2, "dp_x"), 0x17: ("ORA", 2, "dp_ind_long_y"),
            0x18: ("CLC", 1, "imp"), 0x19: ("ORA", 3, "abs_y"),
            0x1A: ("INC", 1, "acc"), 0x1B: ("TCS", 1, "imp"),
            0x1C: ("TRB", 3, "abs"), 0x1D: ("ORA", 3, "abs_x"),
            0x1E: ("ASL", 3, "abs_x"), 0x1F: ("ORA", 4, "abs_long_x"),

            # 0x20-0x2F
            0x20: ("JSR", 3, "abs"), 0x21: ("AND", 2, "dp_x_ind"),
            0x22: ("JSL", 4, "abs_long"), 0x23: ("AND", 2, "stack_rel"),
            0x24: ("BIT", 2, "dp"), 0x25: ("AND", 2, "dp"),
            0x26: ("ROL", 2, "dp"), 0x27: ("AND", 2, "dp_ind_long"),
            0x28: ("PLP", 1, "stack"), 0x29: ("AND", 2, "imm_m"),
            0x2A: ("ROL", 1, "acc"), 0x2B: ("PLD", 1, "stack"),
            0x2C: ("BIT", 3, "abs"), 0x2D: ("AND", 3, "abs"),
            0x2E: ("ROL", 3, "abs"), 0x2F: ("AND", 4, "abs_long"),

            # 0x30-0x3F
            0x30: ("BMI", 2, "rel8"), 0x31: ("AND", 2, "dp_ind_y"),
            0x32: ("AND", 2, "dp_ind"), 0x33: ("AND", 2, "stack_rel_y"),
            0x34: ("BIT", 2, "dp_x"), 0x35: ("AND", 2, "dp_x"),
            0x36: ("ROL", 2, "dp_x"), 0x37: ("AND", 2, "dp_ind_long_y"),
            0x38: ("SEC", 1, "imp"), 0x39: ("AND", 3, "abs_y"),
            0x3A: ("DEC", 1, "acc"), 0x3B: ("TSC", 1, "imp"),
            0x3C: ("BIT", 3, "abs_x"), 0x3D: ("AND", 3, "abs_x"),
            0x3E: ("ROL", 3, "abs_x"), 0x3F: ("AND", 4, "abs_long_x"),

            # 0x40-0x4F
            0x40: ("RTI", 1, "stack"), 0x41: ("EOR", 2, "dp_x_ind"),
            0x42: ("WDM", 2, "sig"), 0x43: ("EOR", 2, "stack_rel"),
            0x44: ("MVP", 3, "block_move"), 0x45: ("EOR", 2, "dp"),
            0x46: ("LSR", 2, "dp"), 0x47: ("EOR", 2, "dp_ind_long"),
            0x48: ("PHA", 1, "stack"), 0x49: ("EOR", 2, "imm_m"),
            0x4A: ("LSR", 1, "acc"), 0x4B: ("PHK", 1, "stack"),
            0x4C: ("JMP", 3, "abs"), 0x4D: ("EOR", 3, "abs"),
            0x4E: ("LSR", 3, "abs"), 0x4F: ("EOR", 4, "abs_long"),

            # 0x50-0x5F
            0x50: ("BVC", 2, "rel8"), 0x51: ("EOR", 2, "dp_ind_y"),
            0x52: ("EOR", 2, "dp_ind"), 0x53: ("EOR", 2, "stack_rel_y"),
            0x54: ("MVN", 3, "block_move"), 0x55: ("EOR", 2, "dp_x"),
            0x56: ("LSR", 2, "dp_x"), 0x57: ("EOR", 2, "dp_ind_long_y"),
            0x58: ("CLI", 1, "imp"), 0x59: ("EOR", 3, "abs_y"),
            0x5A: ("PHY", 1, "stack"), 0x5B: ("TCD", 1, "imp"),
            0x5C: ("JMP", 4, "abs_long"), 0x5D: ("EOR", 3, "abs_x"),
            0x5E: ("LSR", 3, "abs_x"), 0x5F: ("EOR", 4, "abs_long_x"),

            # 0x60-0x6F
            0x60: ("RTS", 1, "stack"), 0x61: ("ADC", 2, "dp_x_ind"),
            0x62: ("PER", 3, "stack_rel16"), 0x63: ("ADC", 2, "stack_rel"),
            0x64: ("STZ", 2, "dp"), 0x65: ("ADC", 2, "dp"),
            0x66: ("ROR", 2, "dp"), 0x67: ("ADC", 2, "dp_ind_long"),
            0x68: ("PLA", 1, "stack"), 0x69: ("ADC", 2, "imm_m"),
            0x6A: ("ROR", 1, "acc"), 0x6B: ("RTL", 1, "stack"),
            0x6C: ("JMP", 3, "abs_ind"), 0x6D: ("ADC", 3, "abs"),
            0x6E: ("ROR", 3, "abs"), 0x6F: ("ADC", 4, "abs_long"),

            # 0x70-0x7F
            0x70: ("BVS", 2, "rel8"), 0x71: ("ADC", 2, "dp_ind_y"),
            0x72: ("ADC", 2, "dp_ind"), 0x73: ("ADC", 2, "stack_rel_y"),
            0x74: ("STZ", 2, "dp_x"), 0x75: ("ADC", 2, "dp_x"),
            0x76: ("ROR", 2, "dp_x"), 0x77: ("ADC", 2, "dp_ind_long_y"),
            0x78: ("SEI", 1, "imp"), 0x79: ("ADC", 3, "abs_y"),
            0x7A: ("PLY", 1, "stack"), 0x7B: ("TDC", 1, "imp"),
            0x7C: ("JMP", 3, "abs_x_ind"), 0x7D: ("ADC", 3, "abs_x"),
            0x7E: ("ROR", 3, "abs_x"), 0x7F: ("ADC", 4, "abs_long_x"),

            # 0x80-0x8F
            0x80: ("BRA", 2, "rel8"), 0x81: ("STA", 2, "dp_x_ind"),
            0x82: ("BRL", 3, "rel16"), 0x83: ("STA", 2, "stack_rel"),
            0x84: ("STY", 2, "dp"), 0x85: ("STA", 2, "dp"),
            0x86: ("STX", 2, "dp"), 0x87: ("STA", 2, "dp_ind_long"),
            0x88: ("DEY", 1, "imp"), 0x89: ("BIT", 2, "imm_m"),
            0x8A: ("TXA", 1, "imp"), 0x8B: ("PHB", 1, "stack"),
            0x8C: ("STY", 3, "abs"), 0x8D: ("STA", 3, "abs"),
            0x8E: ("STX", 3, "abs"), 0x8F: ("STA", 4, "abs_long"),

            # 0x90-0x9F
            0x90: ("BCC", 2, "rel8"), 0x91: ("STA", 2, "dp_ind_y"),
            0x92: ("STA", 2, "dp_ind"), 0x93: ("STA", 2, "stack_rel_y"),
            0x94: ("STY", 2, "dp_x"), 0x95: ("STA", 2, "dp_x"),
            0x96: ("STX", 2, "dp_y"), 0x97: ("STA", 2, "dp_ind_long_y"),
            0x98: ("TYA", 1, "imp"), 0x99: ("STA", 3, "abs_y"),
            0x9A: ("TXS", 1, "imp"), 0x9B: ("TXY", 1, "imp"),
            0x9C: ("STZ", 3, "abs"), 0x9D: ("STA", 3, "abs_x"),
            0x9E: ("STZ", 3, "abs_x"), 0x9F: ("STA", 4, "abs_long_x"),

            # 0xA0-0xAF
            0xA0: ("LDY", 2, "imm_x"), 0xA1: ("LDA", 2, "dp_x_ind"),
            0xA2: ("LDX", 2, "imm_x"), 0xA3: ("LDA", 2, "stack_rel"),
            0xA4: ("LDY", 2, "dp"), 0xA5: ("LDA", 2, "dp"),
            0xA6: ("LDX", 2, "dp"), 0xA7: ("LDA", 2, "dp_ind_long"),
            0xA8: ("TAY", 1, "imp"), 0xA9: ("LDA", 2, "imm_m"),
            0xAA: ("TAX", 1, "imp"), 0xAB: ("PLB", 1, "stack"),
            0xAC: ("LDY", 3, "abs"), 0xAD: ("LDA", 3, "abs"),
            0xAE: ("LDX", 3, "abs"), 0xAF: ("LDA", 4, "abs_long"),

            # 0xB0-0xBF
            0xB0: ("BCS", 2, "rel8"), 0xB1: ("LDA", 2, "dp_ind_y"),
            0xB2: ("LDA", 2, "dp_ind"), 0xB3: ("LDA", 2, "stack_rel_y"),
            0xB4: ("LDY", 2, "dp_x"), 0xB5: ("LDA", 2, "dp_x"),
            0xB6: ("LDX", 2, "dp_y"), 0xB7: ("LDA", 2, "dp_ind_long_y"),
            0xB8: ("CLV", 1, "imp"), 0xB9: ("LDA", 3, "abs_y"),
            0xBA: ("TSX", 1, "imp"), 0xBB: ("TYX", 1, "imp"),
            0xBC: ("LDY", 3, "abs_x"), 0xBD: ("LDA", 3, "abs_x"),
            0xBE: ("LDX", 3, "abs_y"), 0xBF: ("LDA", 4, "abs_long_x"),

            # 0xC0-0xCF
            0xC0: ("CPY", 2, "imm_x"), 0xC1: ("CMP", 2, "dp_x_ind"),
            0xC2: ("REP", 2, "imm8"), 0xC3: ("CMP", 2, "stack_rel"),
            0xC4: ("CPY", 2, "dp"), 0xC5: ("CMP", 2, "dp"),
            0xC6: ("DEC", 2, "dp"), 0xC7: ("CMP", 2, "dp_ind_long"),
            0xC8: ("INY", 1, "imp"), 0xC9: ("CMP", 2, "imm_m"),
            0xCA: ("DEX", 1, "imp"), 0xCB: ("WAI", 1, "imp"),
            0xCC: ("CPY", 3, "abs"), 0xCD: ("CMP", 3, "abs"),
            0xCE: ("DEC", 3, "abs"), 0xCF: ("CMP", 4, "abs_long"),

            # 0xD0-0xDF
            0xD0: ("BNE", 2, "rel8"), 0xD1: ("CMP", 2, "dp_ind_y"),
            0xD2: ("CMP", 2, "dp_ind"), 0xD3: ("CMP", 2, "stack_rel_y"),
            0xD4: ("PEI", 2, "stack_dp_ind"), 0xD5: ("CMP", 2, "dp_x"),
            0xD6: ("DEC", 2, "dp_x"), 0xD7: ("CMP", 2, "dp_ind_long_y"),
            0xD8: ("CLD", 1, "imp"), 0xD9: ("CMP", 3, "abs_y"),
            0xDA: ("PHX", 1, "stack"), 0xDB: ("STP", 1, "imp"),
            0xDC: ("JMP", 3, "abs_ind_long"), 0xDD: ("CMP", 3, "abs_x"),
            0xDE: ("DEC", 3, "abs_x"), 0xDF: ("CMP", 4, "abs_long_x"),

            # 0xE0-0xEF
            0xE0: ("CPX", 2, "imm_x"), 0xE1: ("SBC", 2, "dp_x_ind"),
            0xE2: ("SEP", 2, "imm8"), 0xE3: ("SBC", 2, "stack_rel"),
            0xE4: ("CPX", 2, "dp"), 0xE5: ("SBC", 2, "dp"),
            0xE6: ("INC", 2, "dp"), 0xE7: ("SBC", 2, "dp_ind_long"),
            0xE8: ("INX", 1, "imp"), 0xE9: ("SBC", 2, "imm_m"),
            0xEA: ("NOP", 1, "imp"), 0xEB: ("XBA", 1, "imp"),
            0xEC: ("CPX", 3, "abs"), 0xED: ("SBC", 3, "abs"),
            0xEE: ("INC", 3, "abs"), 0xEF: ("SBC", 4, "abs_long"),

            # 0xF0-0xFF
            0xF0: ("BEQ", 2, "rel8"), 0xF1: ("SBC", 2, "dp_ind_y"),
            0xF2: ("SBC", 2, "dp_ind"), 0xF3: ("SBC", 2, "stack_rel_y"),
            0xF4: ("PEA", 3, "stack_abs"), 0xF5: ("SBC", 2, "dp_x"),
            0xF6: ("INC", 2, "dp_x"), 0xF7: ("SBC", 2, "dp_ind_long_y"),
            0xF8: ("SED", 1, "imp"), 0xF9: ("SBC", 3, "abs_y"),
            0xFA: ("PLX", 1, "stack"), 0xFB: ("XCE", 1, "imp"),
            0xFC: ("JSR", 3, "abs_x_ind"), 0xFD: ("SBC", 3, "abs_x"),
            0xFE: ("INC", 3, "abs_x"), 0xFF: ("SBC", 4, "abs_long_x")
        }

    def decode_instruction(self, data, address):
        """Decode a single 65C816 instruction with proper addressing modes."""
        if not data:
            return "???", 1, "; ??"

        opcode = data[0]
        if opcode not in self.opcodes:
            return f"??? #${opcode:02X}", 1, f"; {opcode:02X} (invalid)"

        mnemonic, length, addr_mode = self.opcodes[opcode]

        # Build operand based on addressing mode
        if length == 1:
            instruction = mnemonic
            comment = f"; {opcode:02X}"
        elif length == 2 and len(data) >= 2:
            operand = data[1]
            if addr_mode == "rel8":
                # Branch instructions
                target = (address + 2 + operand) & 0xFFFF if operand < 0x80 else (address + 2 + operand - 0x100) & 0xFFFF
                instruction = f"{mnemonic} ${target:04X}"
            elif addr_mode in ["imm_m", "imm_x", "imm8"]:
                instruction = f"{mnemonic} #${operand:02X}"
            elif addr_mode == "dp":
                instruction = f"{mnemonic} ${operand:02X}"
            elif addr_mode == "dp_x":
                instruction = f"{mnemonic} ${operand:02X},X"
            elif addr_mode == "dp_y":
                instruction = f"{mnemonic} ${operand:02X},Y"
            else:
                instruction = f"{mnemonic} ${operand:02X}"
            comment = f"; {opcode:02X} {data[1]:02X}"
        elif length == 3 and len(data) >= 3:
            addr = data[1] | (data[2] << 8)
            if addr_mode == "rel16":
                # BRL instruction
                target = (address + 3 + addr) & 0xFFFF if addr < 0x8000 else (address + 3 + addr - 0x10000) & 0xFFFF
                instruction = f"{mnemonic} ${target:04X}"
            elif addr_mode == "abs":
                instruction = f"{mnemonic} ${addr:04X}"
            elif addr_mode == "abs_x":
                instruction = f"{mnemonic} ${addr:04X},X"
            elif addr_mode == "abs_y":
                instruction = f"{mnemonic} ${addr:04X},Y"
            elif addr_mode == "abs_ind":
                instruction = f"{mnemonic} (${addr:04X})"
            elif addr_mode == "abs_x_ind":
                instruction = f"{mnemonic} (${addr:04X},X)"
            else:
                instruction = f"{mnemonic} ${addr:04X}"
            comment = f"; {opcode:02X} {data[1]:02X} {data[2]:02X}"
        elif length == 4 and len(data) >= 4:
            addr = data[1] | (data[2] << 8) | (data[3] << 16)
            if addr_mode == "abs_long":
                instruction = f"{mnemonic} ${addr:06X}"
            elif addr_mode == "abs_long_x":
                instruction = f"{mnemonic} ${addr:06X},X"
            else:
                instruction = f"{mnemonic} ${addr:06X}"
            comment = f"; {opcode:02X} {data[1]:02X} {data[2]:02X} {data[3]:02X}"
        else:
            instruction = f"{mnemonic} ???"
            comment = f"; {opcode:02X}"

        return instruction, length, comment

    def analyze_rom(self, rom_path):
        """Complete Dragon Quest III ROM analysis."""
        try:
            with open(rom_path, 'rb') as f:
                rom_data = f.read()
        except FileNotFoundError:
            print(f"Error: ROM file '{rom_path}' not found")
            return None

        print("=" * 60)
        print("DRAGON QUEST III (SNES) ROM ANALYSIS v2")
        print("Professional 65C816 Disassembler")
        print("=" * 60)
        print(f"ROM Size: {len(rom_data):,} bytes ({len(rom_data)//1024}KB)")

        # Expected size for DQ3
        expected_size = 4 * 1024 * 1024  # 4MB
        print(f"Expected: {expected_size:,} bytes (4MB)")

        if len(rom_data) < 512:
            print("Error: ROM too small for analysis")
            return None

        # Initialize variables with defaults
        title = "Unknown"
        rom_type = 0
        reset_vector = 0
        calculated_checksum = 0
        checksum = 0

        # Check for SMC header
        header_offset = 512 if len(rom_data) % 1024 == 512 else 0
        if header_offset:
            print("Note: SMC header detected, adjusting offsets")
            rom_data = rom_data[header_offset:]

        # Try both HiROM and LoROM header locations
        header_locations = [
            (0xFFC0, "HiROM"),  # HiROM header - correct for DQ3
            (0x7FC0, "LoROM"),  # LoROM header
            (0x40FFC0, "HiROM Extended"),  # Extended HiROM
        ]

        header_pos = 0xFFC0  # Default to HiROM
        header_found = False
        for pos, header_type in header_locations:
            if pos + 32 <= len(rom_data):
                # Check for Dragon Quest 3 signature
                title_data = rom_data[pos:pos+21]
                title = title_data.decode('ascii', errors='replace').rstrip('\x00 ')
                rom_type_byte = rom_data[pos + 21]

                if "DRAGONQUEST" in title or (rom_type_byte & 0x30):  # HiROM signature
                    print(f"\n=== ROM HEADER ({header_type} at 0x{pos:04X}) ===")
                    header_pos = pos
                    header_found = True
                    break

        if not header_found:
            print(f"\n=== ROM HEADER (Default HiROM) ===")

        if header_pos + 32 <= len(rom_data):            # Title (21 bytes)
            title_data = rom_data[header_pos:header_pos+21]
            title = title_data.decode('ascii', errors='replace').rstrip('\x00')
            print(f'Title: "{title}"')

            # ROM makeup byte
            rom_type = rom_data[header_pos + 21]
            print(f"ROM Type: 0x{rom_type:02X}")
            if rom_type & 0x01:
                print("  - HiROM mapping")
            else:
                print("  - LoROM mapping")
            if rom_type & 0x10:
                print("  - FastROM (3.58MHz)")
            else:
                print("  - SlowROM (2.68MHz)")

            # ROM size
            rom_size_code = rom_data[header_pos + 22]
            calculated_size = 1024 << rom_size_code if rom_size_code <= 13 else 0
            print(f"ROM Size Code: 0x{rom_size_code:02X} ({calculated_size//1024//1024}MB)")

            # Region
            region = rom_data[header_pos + 23]
            regions = {0x00: "Japan", 0x01: "USA", 0x02: "Europe", 0x03: "Sweden",
                      0x04: "Finland", 0x05: "Denmark", 0x06: "France", 0x07: "Netherlands",
                      0x08: "Spain", 0x09: "Germany", 0x0A: "Italy", 0x0B: "China",
                      0x0C: "Indonesia", 0x0D: "Korea"}
            region_name = regions.get(region, f"Unknown ({region})")
            print(f"Region: {region_name}")

            # Checksum validation
            complement = struct.unpack('<H', rom_data[header_pos + 28:header_pos + 30])[0]
            checksum = struct.unpack('<H', rom_data[header_pos + 30:header_pos + 32])[0]

            # Calculate actual checksum
            calculated_checksum = sum(rom_data) & 0xFFFF
            print(f"Complement: 0x{complement:04X}")
            print(f"Checksum: 0x{checksum:04X}")
            print(f"Calculated: 0x{calculated_checksum:04X} (should match checksum)")
            if calculated_checksum == checksum:
                print("  ✓ Checksum validation PASSED")
            else:
                print("  ✗ Checksum validation FAILED")

        # Interrupt vectors (HiROM: header_pos + 0x20 to header_pos + 0x3F)
        vector_pos = header_pos + 0x20
        if vector_pos + 32 <= len(rom_data):
            print("\n=== INTERRUPT VECTORS ===")

            # Native mode vectors
            vectors = struct.unpack('<16H', rom_data[vector_pos:vector_pos + 32])
            print("Native Mode (16-bit):")
            print(f"  COP Vector:   0x{vectors[2]:04X}")
            print(f"  BRK Vector:   0x{vectors[3]:04X}")
            print(f"  NMI Vector:   0x{vectors[5]:04X}")
            print(f"  Reset Vector: 0x{vectors[7]:04X}")
            print(f"  IRQ Vector:   0x{vectors[7]:04X}")

            print("Emulation Mode (6502):")
            print(f"  COP Vector:   0x{vectors[10]:04X}")
            print(f"  BRK Vector:   0x{vectors[11]:04X}")
            print(f"  NMI Vector:   0x{vectors[13]:04X}")
            print(f"  Reset Vector: 0x{vectors[15]:04X}")
            print(f"  IRQ/BRK:      0x{vectors[14]:04X}")

            # Analyze reset vector for boot code
            reset_vector = vectors[15]  # Emulation mode reset
            print(f"\n=== BOOT CODE ANALYSIS ===")
            print(f"Reset Vector: 0x{reset_vector:04X}")

            # Convert to file offset for HiROM
            if reset_vector >= 0x8000:
                # HiROM high bank
                boot_offset = reset_vector - 0x8000
                boot_bank = 0

                if boot_offset < len(rom_data):
                    boot_code = rom_data[boot_offset:boot_offset + 64]
                    print(f'Boot code at file offset: 0x{boot_offset:06X}')
                    print()

                    # Disassemble first instructions
                    print('First 16 instructions:')
                    pc = 0
                    instruction_count = 0

                    while pc < len(boot_code) and instruction_count < 16:
                        addr = reset_vector + pc
                        remaining = boot_code[pc:]

                        instruction, length, comment = self.decode_instruction(remaining, addr)
                        print(f'  ${addr:06X}: {instruction:<20} {comment}')

                        pc += length
                        instruction_count += 1

        # ROM bank organization
        print(f"\n=== ROM BANK ORGANIZATION ===")
        print("HiROM Memory Map:")
        print("  $C00000-$FFFFFF: ROM Banks (4MB max)")
        print("  $000000-$3FFFFF: ROM Mirror (first 4MB)")
        print("  $800000-$BFFFFF: ROM Mirror (all banks)")
        print()

        total_banks = len(rom_data) // 0x8000
        print(f'Total ROM Banks: {total_banks} (0x{total_banks:02X})')
        print('Bank Layout:')
        for bank in range(min(16, total_banks)):
            start_addr = 0xC00000 + bank * 0x8000
            end_addr = start_addr + 0x7FFF
            print(f'  Bank ${bank:02X}: ${start_addr:06X}-${end_addr:06X}')

        if total_banks > 16:
            print(f'  ... and {total_banks - 16} more banks')

        # Dragon Quest III specific analysis
        print(f"\n=== DRAGON QUEST III SIGNATURES ===")

        # Look for DQ3 text signatures
        dq3_signatures = [
            b"DRAGON QUEST",
            b"ERDRICK",
            b"ALEFGARD",
            b"TANTEGEL"
        ]

        for sig in dq3_signatures:
            pos = rom_data.find(sig)
            if pos >= 0:
                print(f"Found '{sig.decode()}' at offset 0x{pos:06X}")

        # Check for compressed graphics patterns
        print(f"\nGraphics data analysis:")
        for bank in [0x10, 0x20, 0x30]:  # Common graphics banks
            bank_offset = bank * 0x8000
            if bank_offset < len(rom_data):
                bank_data = rom_data[bank_offset:bank_offset + 0x1000]
                unique_bytes = len(set(bank_data))
                print(f"  Bank ${bank:02X}: {unique_bytes}/256 unique bytes (graphics likely: {unique_bytes > 200})")

        return {
            'title': title,
            'size': len(rom_data),
            'banks': total_banks,
            'reset_vector': reset_vector,
            'rom_type': rom_type,
            'checksum_valid': calculated_checksum == checksum
        }

def main():
    analyzer = DQ3ROMAnalyzer()
    rom_info = analyzer.analyze_rom('static/Dragon Quest III - Soshite Densetsu he... (J).smc')

    if rom_info:
        print(f"\n✓ ROM Analysis Complete")
        print(f"  Title: {rom_info['title']}")
        print(f"  Size: {rom_info['size']:,} bytes")
        print(f"  Banks: {rom_info['banks']}")
        print(f"  Checksum: {'Valid' if rom_info['checksum_valid'] else 'Invalid'}")

if __name__ == '__main__':
    main()
