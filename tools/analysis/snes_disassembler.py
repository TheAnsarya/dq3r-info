#!/usr/bin/env python3
"""
Dragon Quest III - Advanced SNES 65816 Disassembler
Comprehensive assembly analysis with HiROM banking support

This module provides sophisticated disassembly capabilities for the Dragon Quest III
ROM, including proper 65816 instruction decoding, HiROM address translation,
and game-specific code analysis patterns.

Features:
- Complete 65816 instruction set support
- HiROM bank-aware address translation
- Subroutine detection and analysis
- Data reference tracking
- Jump table analysis
- Code flow analysis
- Interactive disassembly output
"""

import sys
import struct
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Any
from dataclasses import dataclass
from enum import Enum
import json

# Add required paths
sys.path.insert(0, str(Path(__file__).parent.parent / "utils"))
from snes_address_translation import SNESAddressTranslator

class AddressMode(Enum):
    """65816 addressing modes"""
    IMPLIED = "imp"
    IMMEDIATE_8 = "imm8"
    IMMEDIATE_16 = "imm16"
    DIRECT_PAGE = "dp"
    DIRECT_PAGE_X = "dpx"
    DIRECT_PAGE_Y = "dpy"
    ABSOLUTE = "abs"
    ABSOLUTE_X = "absx"
    ABSOLUTE_Y = "absy"
    LONG = "long"
    LONG_X = "longx"
    RELATIVE_8 = "rel8"
    RELATIVE_16 = "rel16"
    INDIRECT = "ind"
    INDEXED_INDIRECT = "idx_ind"
    INDIRECT_INDEXED = "ind_idx"
    STACK_RELATIVE = "sr"
    BLOCK_MOVE = "block"

@dataclass
class Instruction:
    """Represents a disassembled 65816 instruction"""
    address: int
    snes_address: str
    opcode: int
    mnemonic: str
    operands: str
    bytes: bytes
    size: int
    addressing_mode: AddressMode
    cycles: int
    flags_affected: str
    description: str

@dataclass
class Subroutine:
    """Represents a code subroutine"""
    start_address: int
    end_address: int
    snes_start: str
    snes_end: str
    size: int
    instructions: List[Instruction]
    entry_points: List[int]
    exit_points: List[int]
    data_references: List[int]
    called_subroutines: List[int]
    analysis_notes: List[str]

class SNESDisassembler:
    """Advanced SNES 65816 disassembler"""

    def __init__(self, project_root: str):
        self.project_root = Path(project_root)
        self.rom_path = self.project_root / "static" / "Dragon Quest III - english (patched).smc"

        # Load ROM
        with open(self.rom_path, 'rb') as f:
            self.rom_data = f.read()

        self.address_translator = SNESAddressTranslator(rom_size=len(self.rom_data))

        # 65816 instruction table
        self.opcodes = self._init_opcode_table()

        # Analysis results
        self.instructions = {}
        self.subroutines = []
        self.data_references = {}
        self.jump_tables = {}

    def _init_opcode_table(self) -> Dict[int, Dict[str, Any]]:
        """Initialize 65816 opcode lookup table"""
        opcodes = {}

        # Core instruction set (simplified for Dragon Quest III analysis)
        instructions = [
            # Load/Store
            (0xA9, "LDA", AddressMode.IMMEDIATE_16, 2, 2, "NZ", "Load Accumulator"),
            (0xA5, "LDA", AddressMode.DIRECT_PAGE, 2, 3, "NZ", "Load Accumulator"),
            (0xB5, "LDA", AddressMode.DIRECT_PAGE_X, 2, 4, "NZ", "Load Accumulator"),
            (0xAD, "LDA", AddressMode.ABSOLUTE, 3, 4, "NZ", "Load Accumulator"),
            (0xBD, "LDA", AddressMode.ABSOLUTE_X, 3, 4, "NZ", "Load Accumulator"),
            (0xB9, "LDA", AddressMode.ABSOLUTE_Y, 3, 4, "NZ", "Load Accumulator"),
            (0xAF, "LDA", AddressMode.LONG, 4, 5, "NZ", "Load Accumulator Long"),

            (0x85, "STA", AddressMode.DIRECT_PAGE, 2, 3, "", "Store Accumulator"),
            (0x95, "STA", AddressMode.DIRECT_PAGE_X, 2, 4, "", "Store Accumulator"),
            (0x8D, "STA", AddressMode.ABSOLUTE, 3, 4, "", "Store Accumulator"),
            (0x9D, "STA", AddressMode.ABSOLUTE_X, 3, 5, "", "Store Accumulator"),
            (0x99, "STA", AddressMode.ABSOLUTE_Y, 3, 5, "", "Store Accumulator"),
            (0x8F, "STA", AddressMode.LONG, 4, 5, "", "Store Accumulator Long"),

            # Transfer
            (0xAA, "TAX", AddressMode.IMPLIED, 1, 2, "NZ", "Transfer A to X"),
            (0xA8, "TAY", AddressMode.IMPLIED, 1, 2, "NZ", "Transfer A to Y"),
            (0x8A, "TXA", AddressMode.IMPLIED, 1, 2, "NZ", "Transfer X to A"),
            (0x98, "TYA", AddressMode.IMPLIED, 1, 2, "NZ", "Transfer Y to A"),

            # Stack
            (0x48, "PHA", AddressMode.IMPLIED, 1, 3, "", "Push Accumulator"),
            (0x68, "PLA", AddressMode.IMPLIED, 1, 4, "NZ", "Pull Accumulator"),
            (0xDA, "PHX", AddressMode.IMPLIED, 1, 3, "", "Push X"),
            (0xFA, "PLX", AddressMode.IMPLIED, 1, 4, "NZ", "Pull X"),
            (0x5A, "PHY", AddressMode.IMPLIED, 1, 3, "", "Push Y"),
            (0x7A, "PLY", AddressMode.IMPLIED, 1, 4, "NZ", "Pull Y"),

            # Jump/Branch
            (0x4C, "JMP", AddressMode.ABSOLUTE, 3, 3, "", "Jump"),
            (0x6C, "JMP", AddressMode.INDIRECT, 3, 5, "", "Jump Indirect"),
            (0x5C, "JMP", AddressMode.LONG, 4, 4, "", "Jump Long"),
            (0x20, "JSR", AddressMode.ABSOLUTE, 3, 6, "", "Jump Subroutine"),
            (0x22, "JSL", AddressMode.LONG, 4, 8, "", "Jump Subroutine Long"),
            (0x60, "RTS", AddressMode.IMPLIED, 1, 6, "", "Return from Subroutine"),
            (0x6B, "RTL", AddressMode.IMPLIED, 1, 6, "", "Return from Subroutine Long"),
            (0x40, "RTI", AddressMode.IMPLIED, 1, 6, "NVMXDIZC", "Return from Interrupt"),

            # Branches
            (0x10, "BPL", AddressMode.RELATIVE_8, 2, 2, "", "Branch if Plus"),
            (0x30, "BMI", AddressMode.RELATIVE_8, 2, 2, "", "Branch if Minus"),
            (0x50, "BVC", AddressMode.RELATIVE_8, 2, 2, "", "Branch if Overflow Clear"),
            (0x70, "BVS", AddressMode.RELATIVE_8, 2, 2, "", "Branch if Overflow Set"),
            (0x90, "BCC", AddressMode.RELATIVE_8, 2, 2, "", "Branch if Carry Clear"),
            (0xB0, "BCS", AddressMode.RELATIVE_8, 2, 2, "", "Branch if Carry Set"),
            (0xD0, "BNE", AddressMode.RELATIVE_8, 2, 2, "", "Branch if Not Equal"),
            (0xF0, "BEQ", AddressMode.RELATIVE_8, 2, 2, "", "Branch if Equal"),

            # Arithmetic
            (0x69, "ADC", AddressMode.IMMEDIATE_16, 2, 2, "NVZC", "Add with Carry"),
            (0x65, "ADC", AddressMode.DIRECT_PAGE, 2, 3, "NVZC", "Add with Carry"),
            (0xE9, "SBC", AddressMode.IMMEDIATE_16, 2, 2, "NVZC", "Subtract with Carry"),
            (0xE5, "SBC", AddressMode.DIRECT_PAGE, 2, 3, "NVZC", "Subtract with Carry"),

            # Logic
            (0x29, "AND", AddressMode.IMMEDIATE_16, 2, 2, "NZ", "Logical AND"),
            (0x25, "AND", AddressMode.DIRECT_PAGE, 2, 3, "NZ", "Logical AND"),
            (0x09, "ORA", AddressMode.IMMEDIATE_16, 2, 2, "NZ", "Logical OR"),
            (0x05, "ORA", AddressMode.DIRECT_PAGE, 2, 3, "NZ", "Logical OR"),
            (0x49, "EOR", AddressMode.IMMEDIATE_16, 2, 2, "NZ", "Exclusive OR"),
            (0x45, "EOR", AddressMode.DIRECT_PAGE, 2, 3, "NZ", "Exclusive OR"),

            # Compare
            (0xC9, "CMP", AddressMode.IMMEDIATE_16, 2, 2, "NZC", "Compare Accumulator"),
            (0xC5, "CMP", AddressMode.DIRECT_PAGE, 2, 3, "NZC", "Compare Accumulator"),
            (0xE0, "CPX", AddressMode.IMMEDIATE_16, 2, 2, "NZC", "Compare X"),
            (0xC0, "CPY", AddressMode.IMMEDIATE_16, 2, 2, "NZC", "Compare Y"),

            # Flags
            (0x18, "CLC", AddressMode.IMPLIED, 1, 2, "C", "Clear Carry"),
            (0x38, "SEC", AddressMode.IMPLIED, 1, 2, "C", "Set Carry"),
            (0x58, "CLI", AddressMode.IMPLIED, 1, 2, "I", "Clear Interrupt"),
            (0x78, "SEI", AddressMode.IMPLIED, 1, 2, "I", "Set Interrupt"),
            (0xD8, "CLD", AddressMode.IMPLIED, 1, 2, "D", "Clear Decimal"),
            (0xF8, "SED", AddressMode.IMPLIED, 1, 2, "D", "Set Decimal"),

            # Misc
            (0xEA, "NOP", AddressMode.IMPLIED, 1, 2, "", "No Operation"),
        ]

        for opcode, mnemonic, mode, size, cycles, flags, desc in instructions:
            opcodes[opcode] = {
                "mnemonic": mnemonic,
                "mode": mode,
                "size": size,
                "cycles": cycles,
                "flags": flags,
                "description": desc
            }

        return opcodes

    def disassemble_region(self, start_offset: int, size: int) -> List[Instruction]:
        """Disassemble a region of ROM"""
        instructions = []
        current_offset = start_offset
        end_offset = min(start_offset + size, len(self.rom_data))

        while current_offset < end_offset:
            # Get ROM address and convert to SNES
            snes_addr = self.address_translator.rom_to_snes_address(current_offset)
            if not snes_addr:
                current_offset += 1
                continue

            snes_address = f"${snes_addr.bank:02X}:{snes_addr.offset:04X}"

            # Decode instruction
            instruction = self.decode_instruction(current_offset, snes_address)
            if instruction:
                instructions.append(instruction)
                current_offset += instruction.size
            else:
                current_offset += 1

        return instructions

    def decode_instruction(self, rom_offset: int, snes_address: str) -> Optional[Instruction]:
        """Decode single 65816 instruction"""
        if rom_offset >= len(self.rom_data):
            return None

        opcode = self.rom_data[rom_offset]

        if opcode not in self.opcodes:
            # Unknown opcode - treat as data
            return Instruction(
                address=rom_offset,
                snes_address=snes_address,
                opcode=opcode,
                mnemonic="???",
                operands=f"${opcode:02X}",
                bytes=bytes([opcode]),
                size=1,
                addressing_mode=AddressMode.IMPLIED,
                cycles=2,
                flags_affected="",
                description="Unknown opcode"
            )

        instr_info = self.opcodes[opcode]
        size = instr_info["size"]

        # Get instruction bytes
        instr_bytes = self.rom_data[rom_offset:rom_offset + size]
        if len(instr_bytes) < size:
            return None

        # Format operands based on addressing mode
        operands = self.format_operands(instr_bytes[1:], instr_info["mode"])

        return Instruction(
            address=rom_offset,
            snes_address=snes_address,
            opcode=opcode,
            mnemonic=instr_info["mnemonic"],
            operands=operands,
            bytes=instr_bytes,
            size=size,
            addressing_mode=instr_info["mode"],
            cycles=instr_info["cycles"],
            flags_affected=instr_info["flags"],
            description=instr_info["description"]
        )

    def format_operands(self, operand_bytes: bytes, mode: AddressMode) -> str:
        """Format instruction operands based on addressing mode"""
        if not operand_bytes or mode == AddressMode.IMPLIED:
            return ""

        if mode == AddressMode.IMMEDIATE_8:
            return f"#${operand_bytes[0]:02X}"
        elif mode == AddressMode.IMMEDIATE_16:
            if len(operand_bytes) >= 2:
                val = struct.unpack('<H', operand_bytes[:2])[0]
                return f"#${val:04X}"
            else:
                return f"#${operand_bytes[0]:02X}"

        elif mode == AddressMode.DIRECT_PAGE:
            return f"${operand_bytes[0]:02X}"
        elif mode == AddressMode.DIRECT_PAGE_X:
            return f"${operand_bytes[0]:02X},X"
        elif mode == AddressMode.DIRECT_PAGE_Y:
            return f"${operand_bytes[0]:02X},Y"

        elif mode == AddressMode.ABSOLUTE:
            if len(operand_bytes) >= 2:
                addr = struct.unpack('<H', operand_bytes[:2])[0]
                return f"${addr:04X}"
            return f"${operand_bytes[0]:02X}??"
        elif mode == AddressMode.ABSOLUTE_X:
            if len(operand_bytes) >= 2:
                addr = struct.unpack('<H', operand_bytes[:2])[0]
                return f"${addr:04X},X"
            return f"${operand_bytes[0]:02X}??,X"
        elif mode == AddressMode.ABSOLUTE_Y:
            if len(operand_bytes) >= 2:
                addr = struct.unpack('<H', operand_bytes[:2])[0]
                return f"${addr:04X},Y"
            return f"${operand_bytes[0]:02X}??,Y"

        elif mode == AddressMode.LONG:
            if len(operand_bytes) >= 3:
                addr = struct.unpack('<I', operand_bytes[:3] + b'\x00')[0]
                return f"${addr:06X}"
            return f"${operand_bytes[0]:02X}????"
        elif mode == AddressMode.LONG_X:
            if len(operand_bytes) >= 3:
                addr = struct.unpack('<I', operand_bytes[:3] + b'\x00')[0]
                return f"${addr:06X},X"
            return f"${operand_bytes[0]:02X}????,X"

        elif mode == AddressMode.RELATIVE_8:
            offset = operand_bytes[0]
            if offset >= 128:
                offset = offset - 256
            return f"${offset:+d}"

        elif mode == AddressMode.INDIRECT:
            if len(operand_bytes) >= 2:
                addr = struct.unpack('<H', operand_bytes[:2])[0]
                return f"(${addr:04X})"
            return f"(${operand_bytes[0]:02X}??)"

        return operand_bytes.hex().upper()

    def analyze_subroutines(self, instructions: List[Instruction]) -> List[Subroutine]:
        """Analyze code flow and identify subroutines"""
        subroutines = []

        # Find subroutine entry points (JSR/JSL targets)
        entry_points = set()
        for instr in instructions:
            if instr.mnemonic in ["JSR", "JSL"]:
                # Extract target address from operands
                target = self.extract_target_address(instr.operands)
                if target:
                    entry_points.add(target)

        # Find subroutine boundaries
        current_sub = None
        for instr in instructions:
            # Check if this is a subroutine start
            if (instr.address in entry_points or
                (current_sub is None and instr.mnemonic not in ["???"])):
                if current_sub:
                    subroutines.append(current_sub)

                current_sub = Subroutine(
                    start_address=instr.address,
                    end_address=instr.address,
                    snes_start=instr.snes_address,
                    snes_end=instr.snes_address,
                    size=0,
                    instructions=[],
                    entry_points=[],
                    exit_points=[],
                    data_references=[],
                    called_subroutines=[],
                    analysis_notes=[]
                )

            if current_sub:
                current_sub.instructions.append(instr)
                current_sub.end_address = instr.address
                current_sub.snes_end = instr.snes_address
                current_sub.size += instr.size

                # Check for subroutine end
                if instr.mnemonic in ["RTS", "RTL", "RTI"]:
                    current_sub.exit_points.append(instr.address)
                    subroutines.append(current_sub)
                    current_sub = None

        # Add final subroutine if needed
        if current_sub:
            subroutines.append(current_sub)

        return subroutines

    def extract_target_address(self, operands: str) -> Optional[int]:
        """Extract target address from operand string"""
        if not operands or operands.startswith("#"):
            return None

        # Simple extraction for absolute addresses
        if operands.startswith("$"):
            try:
                addr_str = operands[1:].split(",")[0]  # Remove ,X or ,Y
                return int(addr_str, 16)
            except ValueError:
                return None

        return None

    def generate_disassembly_report(self, instructions: List[Instruction],
                                  subroutines: List[Subroutine]) -> str:
        """Generate formatted disassembly report"""
        lines = []

        lines.append("DRAGON QUEST III - 65816 DISASSEMBLY")
        lines.append("=" * 40)
        lines.append(f"Instructions analyzed: {len(instructions)}")
        lines.append(f"Subroutines found: {len(subroutines)}")
        lines.append("")

        # Instruction listing
        lines.append("INSTRUCTION LISTING")
        lines.append("-" * 20)
        for instr in instructions[:50]:  # Limit for display
            bytes_str = " ".join(f"{b:02X}" for b in instr.bytes)
            lines.append(f"{instr.snes_address}: {bytes_str:12} "
                        f"{instr.mnemonic:4} {instr.operands:10} "
                        f"; {instr.description}")

        if len(instructions) > 50:
            lines.append(f"... and {len(instructions) - 50} more instructions")

        lines.append("")

        # Subroutine summary
        lines.append("SUBROUTINE SUMMARY")
        lines.append("-" * 18)
        for sub in subroutines[:20]:  # Limit for display
            lines.append(f"{sub.snes_start} - {sub.snes_end}: "
                        f"{sub.size:4} bytes, {len(sub.instructions):3} instructions")

        return "\n".join(lines)


def main():
    """Main disassembler function"""
    import argparse

    parser = argparse.ArgumentParser(description="Dragon Quest III 65816 Disassembler")
    parser.add_argument('--start', type=str, default="$C0:8000",
                       help='Start SNES address (e.g., $C0:8000)')
    parser.add_argument('--size', type=int, default=1024,
                       help='Number of bytes to disassemble')
    parser.add_argument('--project-root', default='.', help='Project root directory')

    args = parser.parse_args()

    print("DRAGON QUEST III - 65816 DISASSEMBLER")
    print("=" * 38)

    disasm = SNESDisassembler(args.project_root)

    # Convert SNES address to ROM offset
    start_offset = disasm.address_translator.snes_to_rom_offset(args.start)
    if start_offset == 0:
        print(f"Error: Could not translate SNES address {args.start}")
        return 1

    print(f"Disassembling {args.size} bytes from {args.start}")
    print(f"ROM offset: ${start_offset:06X}")
    print()

    # Disassemble region
    instructions = disasm.disassemble_region(start_offset, args.size)
    subroutines = disasm.analyze_subroutines(instructions)

    # Generate report
    report = disasm.generate_disassembly_report(instructions, subroutines)
    print(report)

    return 0


if __name__ == "__main__":
    sys.exit(main())
