#!/usr/bin/env python3
"""
Dragon Quest III ROM Structure Analysis
Analyze the Japanese ROM to understand its organization and structure
"""

import struct
import sys

def analyze_dq3_rom(rom_path):
    """Analyze DQ3 ROM structure and extract key information"""

    with open(rom_path, 'rb') as f:
        rom_data = f.read()

    print('=' * 60)
    print('DRAGON QUEST III (SNES) ROM ANALYSIS')
    print('=' * 60)
    print(f'ROM Size: {len(rom_data):,} bytes ({len(rom_data) // 1024}KB)')
    print(f'Expected: 4,194,304 bytes (4MB)')
    print()

    # Check ROM header location (SNES HiROM starts at 0x81C0 for internal header)
    header_offset = 0x81C0
    if header_offset < len(rom_data):
        header = rom_data[header_offset:header_offset + 64]

        print('=== ROM HEADER (Internal) ===')
        # Game title (bytes 0-20, ASCII)
        title = header[0:21].decode('ascii', errors='ignore').rstrip('\x00 ')
        print(f'Title: "{title}"')

        # ROM type and speed
        rom_type = header[21]
        print(f'ROM Type: 0x{rom_type:02X}')
        if rom_type & 0x01:
            print('  - HiROM mapping')
        else:
            print('  - LoROM mapping')
        if rom_type & 0x10:
            print('  - FastROM (3.58MHz)')
        else:
            print('  - SlowROM (2.68MHz)')

        # ROM size
        rom_size_code = header[23]
        rom_size_mb = (32 * (1 << rom_size_code)) // 1024
        print(f'ROM Size Code: 0x{rom_size_code:02X} ({rom_size_mb}MB)')

        # Region
        region_code = header[25]
        regions = {0: 'Japan', 1: 'USA', 2: 'Europe', 3: 'Scandinavia',
                  4: 'Finland', 5: 'Denmark', 6: 'France', 7: 'Holland',
                  8: 'Spain', 9: 'Germany', 10: 'Italy', 11: 'China',
                  12: 'Indonesia', 13: 'Korea'}
        region_name = regions.get(region_code, f'Unknown ({region_code})')
        print(f'Region: {region_name}')

        # Checksums
        complement = struct.unpack('<H', header[28:30])[0]
        checksum = struct.unpack('<H', header[30:32])[0]
        print(f'Complement: 0x{complement:04X}')
        print(f'Checksum: 0x{checksum:04X}')
        print(f'Calculated: 0x{(complement ^ 0xFFFF):04X} (should match checksum)')

        if (complement ^ 0xFFFF) == checksum:
            print('  ✓ Checksum validation PASSED')
        else:
            print('  ✗ Checksum validation FAILED')

        print()

    # Check vectors (at end of ROM for HiROM)
    vector_offset = len(rom_data) - 64
    if vector_offset >= 0:
        vectors = rom_data[vector_offset:vector_offset + 64]
        print('=== INTERRUPT VECTORS ===')

        # Native mode vectors
        native_vectors = struct.unpack('<8H', vectors[32:48])
        print('Native Mode (16-bit):')
        print(f'  Reset Vector: 0x{native_vectors[7]:04X}')
        print(f'  IRQ Vector:   0x{native_vectors[6]:04X}')
        print(f'  NMI Vector:   0x{native_vectors[5]:04X}')
        print(f'  BRK Vector:   0x{native_vectors[4]:04X}')

        # Emulation mode vectors
        emu_vectors = struct.unpack('<8H', vectors[48:64])
        print('Emulation Mode (6502):')
        print(f'  Reset Vector: 0x{emu_vectors[7]:04X}')
        print(f'  IRQ/BRK:      0x{emu_vectors[6]:04X}')
        print(f'  NMI Vector:   0x{emu_vectors[5]:04X}')
        print()

    # Check boot code at reset vector
    reset_vector = struct.unpack('<H', rom_data[-2:])[0]
    print(f'=== BOOT CODE ANALYSIS ===')
    print(f'Reset Vector: 0x{reset_vector:04X}')

    if reset_vector >= 0x8000:
        # Convert to file offset for HiROM
        if reset_vector >= 0xC00000:
            # Bank C0-FF
            boot_offset = reset_vector - 0xC00000
        elif reset_vector >= 0x800000:
            # Bank 80-BF (mirror)
            boot_offset = reset_vector - 0x800000
        else:
            # Bank 00-7F
            boot_offset = reset_vector & 0x7FFF

        if boot_offset < len(rom_data):
            boot_code = rom_data[boot_offset:boot_offset + 64]
            print(f'Boot code at file offset: 0x{boot_offset:06X}')
            print()

            # Disassemble first few instructions
            print('First instructions:')
            pc = 0
            while pc < min(32, len(boot_code)):
                opcode = boot_code[pc]
                addr = reset_vector + pc

                # Simple 65816 instruction decode for common opcodes
                if opcode == 0x18:
                    print(f'  ${addr:06X}: CLC                    ; {opcode:02X}')
                    pc += 1
                elif opcode == 0x38:
                    print(f'  ${addr:06X}: SEC                    ; {opcode:02X}')
                    pc += 1
                elif opcode == 0xC2:
                    if pc + 1 < len(boot_code):
                        flags = boot_code[pc + 1]
                        print(f'  ${addr:06X}: REP #${flags:02X}              ; {opcode:02X} {flags:02X}')
                        pc += 2
                    else:
                        break
                elif opcode == 0xE2:
                    if pc + 1 < len(boot_code):
                        flags = boot_code[pc + 1]
                        print(f'  ${addr:06X}: SEP #${flags:02X}              ; {opcode:02X} {flags:02X}')
                        pc += 2
                    else:
                        break
                elif opcode == 0xA9:
                    if pc + 1 < len(boot_code):
                        value = boot_code[pc + 1]
                        print(f'  ${addr:06X}: LDA #${value:02X}              ; {opcode:02X} {flags:02X}')
                        pc += 2
                    else:
                        break
                elif opcode == 0x8D:
                    if pc + 2 < len(boot_code):
                        addr_low = boot_code[pc + 1]
                        addr_high = boot_code[pc + 2]
                        target = addr_low | (addr_high << 8)
                        print(f'  ${addr:06X}: STA ${target:04X}            ; {opcode:02X} {addr_low:02X} {addr_high:02X}')
                        pc += 3
                    else:
                        break
                elif opcode == 0x5C:
                    if pc + 3 < len(boot_code):
                        addr_low = boot_code[pc + 1]
                        addr_mid = boot_code[pc + 2]
                        addr_high = boot_code[pc + 3]
                        target = addr_low | (addr_mid << 8) | (addr_high << 16)
                        print(f'  ${addr:06X}: JML ${target:06X}          ; {opcode:02X} {addr_low:02X} {addr_mid:02X} {addr_high:02X}')
                        pc += 4
                    else:
                        break
                elif opcode == 0x4C:
                    if pc + 2 < len(boot_code):
                        addr_low = boot_code[pc + 1]
                        addr_high = boot_code[pc + 2]
                        target = addr_low | (addr_high << 8)
                        print(f'  ${addr:06X}: JMP ${target:04X}            ; {opcode:02X} {addr_low:02X} {addr_high:02X}')
                        pc += 3
                    else:
                        break
                else:
                    print(f'  ${addr:06X}: ???                    ; {opcode:02X}')
                    pc += 1

    print()
    print('=== ROM BANK ORGANIZATION ===')
    print('HiROM Memory Map:')
    print('  $C00000-$FFFFFF: ROM Banks (4MB max)')
    print('  $000000-$3FFFFF: ROM Mirror (first 4MB)')
    print('  $800000-$BFFFFF: ROM Mirror (all banks)')
    print()

    # Show bank boundaries
    total_banks = len(rom_data) // 0x8000
    print(f'Total ROM Banks: {total_banks} (0x{total_banks:02X})')
    print('Bank Layout:')
    for bank in range(min(16, total_banks)):
        start_addr = 0xC00000 + bank * 0x8000
        end_addr = start_addr + 0x7FFF
        print(f'  Bank ${bank:02X}: ${start_addr:06X}-${end_addr:06X}')

    if total_banks > 16:
        print(f'  ... and {total_banks - 16} more banks')

    return {
        'title': title if 'title' in locals() else 'Unknown',
        'size': len(rom_data),
        'banks': total_banks,
        'reset_vector': reset_vector if 'reset_vector' in locals() else 0,
        'rom_type': rom_type if 'rom_type' in locals() else 0,
        'checksum_valid': (complement ^ 0xFFFF) == checksum if 'complement' in locals() and 'checksum' in locals() else False
    }

if __name__ == '__main__':
    rom_info = analyze_dq3_rom('static/Dragon Quest III - Soshite Densetsu he... (J).smc')
    print(f"\n✓ ROM Analysis Complete")
    print(f"  Title: {rom_info['title']}")
    print(f"  Size: {rom_info['size']:,} bytes")
    print(f"  Banks: {rom_info['banks']}")
    print(f"  Checksum: {'Valid' if rom_info['checksum_valid'] else 'Invalid'}")
