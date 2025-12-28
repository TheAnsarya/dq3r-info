#!/usr/bin/env python3
"""
Dragon Quest III ROM Builder and Comparison Tool
Assembles extracted code back into ROM format and compares with original
"""

import re
import struct
from collections import defaultdict

class DQ3ROMBuilder:
    def __init__(self):
        self.rom_data = bytearray(4 * 1024 * 1024)  # 4MB ROM
        self.assembled_bytes = 0
        self.assembly_map = {}  # Track what we've assembled

    def parse_instruction(self, line):
        """Parse an assembly instruction line into bytes."""
        line = line.strip()
        if not line or line.startswith(';') or line.endswith(':'):
            return None

        # Handle .byte directives
        if '.byte' in line:
            # Extract hex values from .byte directive
            byte_start = line.find('.byte') + 5
            byte_part = line[byte_start:].strip()

            # Handle comma-separated values like .byte $00, $01, $02
            hex_bytes = []
            values = byte_part.split(',')
            for value in values:
                value = value.strip()
                if value.startswith('$'):
                    try:
                        hex_bytes.append(int(value[1:], 16))
                    except ValueError:
                        continue
                elif value.isdigit():
                    hex_bytes.append(int(value))
            if hex_bytes:
                return bytes(hex_bytes)

        # Handle directive lines
        if line.startswith('.'):
            return None

        # Extract comment with hex bytes (original format)
        if ';' in line:
            parts = line.split(';', 1)
            instruction = parts[0].strip()
            comment = parts[1].strip()

            # Extract hex bytes from comment
            hex_bytes = []
            hex_parts = comment.split()
            for part in hex_parts:
                if re.match(r'^[0-9A-F]{2}$', part, re.IGNORECASE):
                    hex_bytes.append(int(part, 16))

            if hex_bytes:
                return bytes(hex_bytes)

        return None

    def assemble_file(self, filename, start_address):
        """Assemble a single ASM file into ROM data."""
        print(f"Assembling {filename} at ${start_address:06X}...")

        try:
            with open(filename, 'r', encoding='utf-8') as f:
                lines = f.readlines()
        except FileNotFoundError:
            print(f"Warning: {filename} not found")
            return 0

        current_address = start_address
        assembled_count = 0

        for line_num, line in enumerate(lines, 1):
            instruction_bytes = self.parse_instruction(line)
            if instruction_bytes:
                # Convert address to file offset
                file_offset = self.address_to_offset(current_address)

                if file_offset is not None and file_offset + len(instruction_bytes) <= len(self.rom_data):
                    # Store in ROM
                    for i, byte in enumerate(instruction_bytes):
                        self.rom_data[file_offset + i] = byte

                    # Track what we assembled
                    self.assembly_map[current_address] = {
                        'file': filename,
                        'line': line_num,
                        'bytes': instruction_bytes,
                        'instruction': line.strip()
                    }

                    current_address += len(instruction_bytes)
                    assembled_count += len(instruction_bytes)

        print(f"  Assembled {assembled_count} bytes from {filename}")
        self.assembled_bytes += assembled_count
        return assembled_count

    def address_to_offset(self, address):
        """Convert SNES address to ROM file offset for HiROM."""
        # HiROM mapping
        if address >= 0xFF0000:
            # High ROM area (bank 7F+)
            return address - 0xFF0000 + 0x3F0000
        elif address >= 0xC00000:
            # ROM banks C0-FF
            bank = (address >> 16) & 0xFF
            offset = address & 0xFFFF
            if offset >= 0x8000:
                return (bank - 0xC0) * 0x8000 + (offset - 0x8000)
        elif address >= 0x008000 and address <= 0x00FFFF:
            # Bank 00 area
            return address - 0x8000
        elif address >= 0x018000 and address <= 0x01FFFF:
            # Bank 01 area
            return 0x8000 + (address - 0x18000)
        elif address >= 0x028000 and address <= 0x02FFFF:
            # Bank 02 area
            return 0x10000 + (address - 0x28000)

        return None

    def build_rom(self):
        """Assemble all source files into a ROM."""
        print("Building Dragon Quest III ROM...")
        print("=" * 60)

        # Assemble all extracted files
        total_bytes = 0

        # Boot code
        total_bytes += self.assemble_file('src/boot/boot.asm', 0xFF0000)

        # All extracted bank files - dynamically load all
        bank_files = [
            ('src/boot_00.asm', 0xFF0000),
            ('src/engine_01.asm', 0xC08000),
            ('src/battle_02.asm', 0xC10000),
            ('src/menu_03.asm', 0xC18000),
            ('src/field_04.asm', 0xC20000),
            ('src/audio_05.asm', 0xC28000),
            ('src/graphics_06.asm', 0xC30000),
            ('src/text_07.asm', 0xC38000),
        ]

        # Add all extracted bank files
        import os
        banks_dir = "src/banks"
        if os.path.exists(banks_dir):
            for filename in os.listdir(banks_dir):
                if filename.endswith('.asm'):
                    filepath = os.path.join(banks_dir, filename)

                    # Extract bank number from filename and calculate address
                    if filename.startswith('bank_'):
                        bank_num = int(filename.split('_')[1].split('.')[0], 16)
                        address = 0xC00000 + (bank_num * 0x8000)
                        bank_files.append((filepath, address))
                    elif filename.startswith('graphics_'):
                        bank_num = int(filename.split('_')[1].split('.')[0], 16)
                        address = 0xC00000 + (bank_num * 0x8000)
                        bank_files.append((filepath, address))
                    elif filename.startswith('text_'):
                        bank_num = int(filename.split('_')[1].split('.')[0], 16)
                        address = 0xC00000 + (bank_num * 0x8000)
                        bank_files.append((filepath, address))

        for filename, address in bank_files:
            total_bytes += self.assemble_file(filename, address)

        print(f"\nTotal assembled: {self.assembled_bytes} bytes")

        # Write assembled ROM
        with open('build/dragonquest3_assembled.smc', 'wb') as f:
            f.write(self.rom_data)

        print(f"ROM written to build/dragonquest3_assembled.smc")

        return self.assembled_bytes

    def compare_with_original(self, original_path):
        """Compare assembled ROM with original."""
        try:
            with open(original_path, 'rb') as f:
                original_data = f.read()
        except FileNotFoundError:
            print(f"Error: Original ROM not found: {original_path}")
            return None

        print(f"\n{'='*60}")
        print("ROM COMPARISON")
        print(f"{'='*60}")

        print(f"Original ROM:  {len(original_data):,} bytes")
        print(f"Assembled ROM: {len(self.rom_data):,} bytes")
        print(f"Assembled Code: {self.assembled_bytes:,} bytes")

        # Calculate match percentage
        matching_bytes = 0
        total_compared = 0
        match_percentage = 0.0

        min_size = min(len(original_data), len(self.rom_data))

        # Only compare areas we actually assembled
        for address, info in self.assembly_map.items():
            file_offset = self.address_to_offset(address)
            if file_offset is not None:
                for i, byte in enumerate(info['bytes']):
                    offset = file_offset + i
                    if offset < len(original_data):
                        if original_data[offset] == self.rom_data[offset]:
                            matching_bytes += 1
                        total_compared += 1

        if total_compared > 0:
            match_percentage = (matching_bytes / total_compared) * 100
            print(f"Match Rate: {matching_bytes}/{total_compared} bytes ({match_percentage:.2f}%)")
        else:
            print("No bytes compared")

        # Show first few differences
        differences = []
        for address, info in list(self.assembly_map.items())[:10]:
            file_offset = self.address_to_offset(address)
            if file_offset is not None:
                for i, byte in enumerate(info['bytes']):
                    offset = file_offset + i
                    if offset < len(original_data):
                        if original_data[offset] != self.rom_data[offset]:
                            differences.append({
                                'offset': offset,
                                'address': address + i,
                                'original': original_data[offset],
                                'assembled': self.rom_data[offset],
                                'instruction': info['instruction']
                            })

                            if len(differences) >= 10:
                                break
                if len(differences) >= 10:
                    break

        if differences:
            print(f"\nFirst {len(differences)} differences:")
            print("Offset     Address    Original Assembled  Instruction")
            print("-" * 70)
            for diff in differences:
                print(f"${diff['offset']:06X}  ${diff['address']:06X}   ${diff['original']:02X}       ${diff['assembled']:02X}         {diff['instruction'][:30]}")
        else:
            print("\nNo differences found in compared regions!")

        # Calculate coverage
        rom_coverage = (self.assembled_bytes / len(original_data)) * 100
        print(f"\nROM Coverage: {self.assembled_bytes:,}/{len(original_data):,} bytes ({rom_coverage:.2f}%)")

        return {
            'match_percentage': match_percentage if total_compared > 0 else 0,
            'coverage_percentage': rom_coverage,
            'matching_bytes': matching_bytes,
            'total_compared': total_compared,
            'assembled_bytes': self.assembled_bytes
        }

def main():
    # Create build directory
    import os
    os.makedirs('build', exist_ok=True)

    # Build ROM
    builder = DQ3ROMBuilder()
    assembled_bytes = builder.build_rom()

    if assembled_bytes > 0:
        # Compare with original
        original_rom = 'static/Dragon Quest III - Soshite Densetsu he... (J).smc'
        results = builder.compare_with_original(original_rom)

        if results:
            print(f"\n🎯 RESULTS:")
            print(f"   Accuracy: {results['match_percentage']:.2f}% of assembled code matches")
            print(f"   Coverage: {results['coverage_percentage']:.2f}% of ROM assembled")
            print(f"   Progress: {results['assembled_bytes']:,} bytes of code extracted")

            if results['match_percentage'] > 95:
                print("   ✅ Excellent match! ROM assembly is highly accurate.")
            elif results['match_percentage'] > 80:
                print("   ✅ Good match! Minor differences need investigation.")
            elif results['match_percentage'] > 50:
                print("   ⚠️  Partial match. More work needed on instruction decoding.")
            else:
                print("   ❌ Poor match. Assembly extraction needs improvement.")
        else:
            print("❌ Could not compare with original ROM.")
    else:
        print("❌ No code assembled. Check source files.")

if __name__ == '__main__':
    main()
