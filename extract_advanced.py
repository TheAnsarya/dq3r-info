#!/usr/bin/env python3
"""
Dragon Quest III Advanced Code Extractor
Extracts and analyzes code with intelligent pattern recognition and documentation
"""

import re
import os
from collections import defaultdict, Counter

class DQ3AdvancedExtractor:
    def __init__(self, rom_path):
        with open(rom_path, 'rb') as f:
            self.rom_data = f.read()

        # 65C816 instruction set with operand analysis
        self.instructions = {
            # Data Movement
            0xA9: ("LDA", "immediate", 2, "Load immediate value into accumulator"),
            0xA5: ("LDA", "zero_page", 2, "Load from zero page into accumulator"),
            0xB5: ("LDA", "zero_page_x", 2, "Load from zero page,X into accumulator"),
            0xAD: ("LDA", "absolute", 3, "Load from absolute address into accumulator"),
            0xBD: ("LDA", "absolute_x", 3, "Load from absolute,X into accumulator"),
            0xB9: ("LDA", "absolute_y", 3, "Load from absolute,Y into accumulator"),
            0xA1: ("LDA", "indirect_x", 2, "Load from (zero page,X) into accumulator"),
            0xB1: ("LDA", "indirect_y", 2, "Load from (zero page),Y into accumulator"),
            0xA3: ("LDA", "stack_relative", 2, "Load from stack relative into accumulator"),
            0xB3: ("LDA", "stack_relative_y", 2, "Load from (stack relative),Y into accumulator"),
            0xA7: ("LDA", "indirect_long", 2, "Load from [zero page] into accumulator"),
            0xB7: ("LDA", "indirect_long_y", 2, "Load from [zero page],Y into accumulator"),
            0xAF: ("LDA", "absolute_long", 4, "Load from absolute long address into accumulator"),
            0xBF: ("LDA", "absolute_long_x", 4, "Load from absolute long,X into accumulator"),

            0x85: ("STA", "zero_page", 2, "Store accumulator to zero page"),
            0x95: ("STA", "zero_page_x", 2, "Store accumulator to zero page,X"),
            0x8D: ("STA", "absolute", 3, "Store accumulator to absolute address"),
            0x9D: ("STA", "absolute_x", 3, "Store accumulator to absolute,X"),
            0x99: ("STA", "absolute_y", 3, "Store accumulator to absolute,Y"),
            0x81: ("STA", "indirect_x", 2, "Store accumulator to (zero page,X)"),
            0x91: ("STA", "indirect_y", 2, "Store accumulator to (zero page),Y"),
            0x83: ("STA", "stack_relative", 2, "Store accumulator to stack relative"),
            0x93: ("STA", "stack_relative_y", 2, "Store accumulator to (stack relative),Y"),
            0x87: ("STA", "indirect_long", 2, "Store accumulator to [zero page]"),
            0x97: ("STA", "indirect_long_y", 2, "Store accumulator to [zero page],Y"),
            0x8F: ("STA", "absolute_long", 4, "Store accumulator to absolute long address"),
            0x9F: ("STA", "absolute_long_x", 4, "Store accumulator to absolute long,X"),

            # Index Registers
            0xA2: ("LDX", "immediate", 2, "Load immediate value into X register"),
            0xA6: ("LDX", "zero_page", 2, "Load from zero page into X register"),
            0xB6: ("LDX", "zero_page_y", 2, "Load from zero page,Y into X register"),
            0xAE: ("LDX", "absolute", 3, "Load from absolute address into X register"),
            0xBE: ("LDX", "absolute_y", 3, "Load from absolute,Y into X register"),

            0xA0: ("LDY", "immediate", 2, "Load immediate value into Y register"),
            0xA4: ("LDY", "zero_page", 2, "Load from zero page into Y register"),
            0xB4: ("LDY", "zero_page_x", 2, "Load from zero page,X into Y register"),
            0xAC: ("LDY", "absolute", 3, "Load from absolute address into Y register"),
            0xBC: ("LDY", "absolute_x", 3, "Load from absolute,X into Y register"),

            0x86: ("STX", "zero_page", 2, "Store X register to zero page"),
            0x96: ("STX", "zero_page_y", 2, "Store X register to zero page,Y"),
            0x8E: ("STX", "absolute", 3, "Store X register to absolute address"),

            0x84: ("STY", "zero_page", 2, "Store Y register to zero page"),
            0x94: ("STY", "zero_page_x", 2, "Store Y register to zero page,X"),
            0x8C: ("STY", "absolute", 3, "Store Y register to absolute address"),

            # Stack Operations
            0x48: ("PHA", "implied", 1, "Push accumulator to stack"),
            0x68: ("PLA", "implied", 1, "Pull accumulator from stack"),
            0xDA: ("PHX", "implied", 1, "Push X register to stack"),
            0xFA: ("PLX", "implied", 1, "Pull X register from stack"),
            0x5A: ("PHY", "implied", 1, "Push Y register to stack"),
            0x7A: ("PLY", "implied", 1, "Pull Y register from stack"),
            0x08: ("PHP", "implied", 1, "Push processor status to stack"),
            0x28: ("PLP", "implied", 1, "Pull processor status from stack"),
            0x8B: ("PHB", "implied", 1, "Push data bank register to stack"),
            0xAB: ("PLB", "implied", 1, "Pull data bank register from stack"),
            0x0B: ("PHD", "implied", 1, "Push direct page register to stack"),
            0x2B: ("PLD", "implied", 1, "Pull direct page register from stack"),
            0x4B: ("PHK", "implied", 1, "Push program bank register to stack"),
            0xF4: ("PEA", "immediate", 3, "Push effective address to stack"),
            0xD4: ("PEI", "indirect", 2, "Push effective indirect address to stack"),
            0x62: ("PER", "relative", 3, "Push effective relative address to stack"),

            # Transfer Instructions
            0xAA: ("TAX", "implied", 1, "Transfer accumulator to X register"),
            0x8A: ("TXA", "implied", 1, "Transfer X register to accumulator"),
            0xA8: ("TAY", "implied", 1, "Transfer accumulator to Y register"),
            0x98: ("TYA", "implied", 1, "Transfer Y register to accumulator"),
            0x9A: ("TXS", "implied", 1, "Transfer X register to stack pointer"),
            0xBA: ("TSX", "implied", 1, "Transfer stack pointer to X register"),
            0x9B: ("TXY", "implied", 1, "Transfer X register to Y register"),
            0xBB: ("TYX", "implied", 1, "Transfer Y register to X register"),
            0x5B: ("TCD", "implied", 1, "Transfer accumulator to direct page register"),
            0x7B: ("TDC", "implied", 1, "Transfer direct page register to accumulator"),
            0x1B: ("TCS", "implied", 1, "Transfer accumulator to stack pointer"),
            0x3B: ("TSC", "implied", 1, "Transfer stack pointer to accumulator"),

            # Arithmetic
            0x69: ("ADC", "immediate", 2, "Add with carry (immediate)"),
            0x65: ("ADC", "zero_page", 2, "Add with carry (zero page)"),
            0x75: ("ADC", "zero_page_x", 2, "Add with carry (zero page,X)"),
            0x6D: ("ADC", "absolute", 3, "Add with carry (absolute)"),
            0x7D: ("ADC", "absolute_x", 3, "Add with carry (absolute,X)"),
            0x79: ("ADC", "absolute_y", 3, "Add with carry (absolute,Y)"),
            0x61: ("ADC", "indirect_x", 2, "Add with carry ((zero page,X))"),
            0x71: ("ADC", "indirect_y", 2, "Add with carry ((zero page),Y)"),
            0x63: ("ADC", "stack_relative", 2, "Add with carry (stack relative)"),
            0x73: ("ADC", "stack_relative_y", 2, "Add with carry ((stack relative),Y)"),
            0x67: ("ADC", "indirect_long", 2, "Add with carry ([zero page])"),
            0x77: ("ADC", "indirect_long_y", 2, "Add with carry ([zero page],Y)"),
            0x6F: ("ADC", "absolute_long", 4, "Add with carry (absolute long)"),
            0x7F: ("ADC", "absolute_long_x", 4, "Add with carry (absolute long,X)"),

            0xE9: ("SBC", "immediate", 2, "Subtract with carry (immediate)"),
            0xE5: ("SBC", "zero_page", 2, "Subtract with carry (zero page)"),
            0xF5: ("SBC", "zero_page_x", 2, "Subtract with carry (zero page,X)"),
            0xED: ("SBC", "absolute", 3, "Subtract with carry (absolute)"),
            0xFD: ("SBC", "absolute_x", 3, "Subtract with carry (absolute,X)"),
            0xF9: ("SBC", "absolute_y", 3, "Subtract with carry (absolute,Y)"),
            0xE1: ("SBC", "indirect_x", 2, "Subtract with carry ((zero page,X))"),
            0xF1: ("SBC", "indirect_y", 2, "Subtract with carry ((zero page),Y)"),
            0xE3: ("SBC", "stack_relative", 2, "Subtract with carry (stack relative)"),
            0xF3: ("SBC", "stack_relative_y", 2, "Subtract with carry ((stack relative),Y)"),
            0xE7: ("SBC", "indirect_long", 2, "Subtract with carry ([zero page])"),
            0xF7: ("SBC", "indirect_long_y", 2, "Subtract with carry ([zero page],Y)"),
            0xEF: ("SBC", "absolute_long", 4, "Subtract with carry (absolute long)"),
            0xFF: ("SBC", "absolute_long_x", 4, "Subtract with carry (absolute long,X)"),

            # Logical Operations
            0x29: ("AND", "immediate", 2, "Logical AND with accumulator (immediate)"),
            0x25: ("AND", "zero_page", 2, "Logical AND with accumulator (zero page)"),
            0x35: ("AND", "zero_page_x", 2, "Logical AND with accumulator (zero page,X)"),
            0x2D: ("AND", "absolute", 3, "Logical AND with accumulator (absolute)"),
            0x3D: ("AND", "absolute_x", 3, "Logical AND with accumulator (absolute,X)"),
            0x39: ("AND", "absolute_y", 3, "Logical AND with accumulator (absolute,Y)"),
            0x21: ("AND", "indirect_x", 2, "Logical AND with accumulator ((zero page,X))"),
            0x31: ("AND", "indirect_y", 2, "Logical AND with accumulator ((zero page),Y)"),
            0x23: ("AND", "stack_relative", 2, "Logical AND with accumulator (stack relative)"),
            0x33: ("AND", "stack_relative_y", 2, "Logical AND with accumulator ((stack relative),Y)"),
            0x27: ("AND", "indirect_long", 2, "Logical AND with accumulator ([zero page])"),
            0x37: ("AND", "indirect_long_y", 2, "Logical AND with accumulator ([zero page],Y)"),
            0x2F: ("AND", "absolute_long", 4, "Logical AND with accumulator (absolute long)"),
            0x3F: ("AND", "absolute_long_x", 4, "Logical AND with accumulator (absolute long,X)"),

            0x09: ("ORA", "immediate", 2, "Logical OR with accumulator (immediate)"),
            0x05: ("ORA", "zero_page", 2, "Logical OR with accumulator (zero page)"),
            0x15: ("ORA", "zero_page_x", 2, "Logical OR with accumulator (zero page,X)"),
            0x0D: ("ORA", "absolute", 3, "Logical OR with accumulator (absolute)"),
            0x1D: ("ORA", "absolute_x", 3, "Logical OR with accumulator (absolute,X)"),
            0x19: ("ORA", "absolute_y", 3, "Logical OR with accumulator (absolute,Y)"),
            0x01: ("ORA", "indirect_x", 2, "Logical OR with accumulator ((zero page,X))"),
            0x11: ("ORA", "indirect_y", 2, "Logical OR with accumulator ((zero page),Y)"),
            0x03: ("ORA", "stack_relative", 2, "Logical OR with accumulator (stack relative)"),
            0x13: ("ORA", "stack_relative_y", 2, "Logical OR with accumulator ((stack relative),Y)"),
            0x07: ("ORA", "indirect_long", 2, "Logical OR with accumulator ([zero page])"),
            0x17: ("ORA", "indirect_long_y", 2, "Logical OR with accumulator ([zero page],Y)"),
            0x0F: ("ORA", "absolute_long", 4, "Logical OR with accumulator (absolute long)"),
            0x1F: ("ORA", "absolute_long_x", 4, "Logical OR with accumulator (absolute long,X)"),

            0x49: ("EOR", "immediate", 2, "Exclusive OR with accumulator (immediate)"),
            0x45: ("EOR", "zero_page", 2, "Exclusive OR with accumulator (zero page)"),
            0x55: ("EOR", "zero_page_x", 2, "Exclusive OR with accumulator (zero page,X)"),
            0x4D: ("EOR", "absolute", 3, "Exclusive OR with accumulator (absolute)"),
            0x5D: ("EOR", "absolute_x", 3, "Exclusive OR with accumulator (absolute,X)"),
            0x59: ("EOR", "absolute_y", 3, "Exclusive OR with accumulator (absolute,Y)"),
            0x41: ("EOR", "indirect_x", 2, "Exclusive OR with accumulator ((zero page,X))"),
            0x51: ("EOR", "indirect_y", 2, "Exclusive OR with accumulator ((zero page),Y)"),
            0x43: ("EOR", "stack_relative", 2, "Exclusive OR with accumulator (stack relative)"),
            0x53: ("EOR", "stack_relative_y", 2, "Exclusive OR with accumulator ((stack relative),Y)"),
            0x47: ("EOR", "indirect_long", 2, "Exclusive OR with accumulator ([zero page])"),
            0x57: ("EOR", "indirect_long_y", 2, "Exclusive OR with accumulator ([zero page],Y)"),
            0x4F: ("EOR", "absolute_long", 4, "Exclusive OR with accumulator (absolute long)"),
            0x5F: ("EOR", "absolute_long_x", 4, "Exclusive OR with accumulator (absolute long,X)"),

            # Comparison
            0xC9: ("CMP", "immediate", 2, "Compare accumulator (immediate)"),
            0xC5: ("CMP", "zero_page", 2, "Compare accumulator (zero page)"),
            0xD5: ("CMP", "zero_page_x", 2, "Compare accumulator (zero page,X)"),
            0xCD: ("CMP", "absolute", 3, "Compare accumulator (absolute)"),
            0xDD: ("CMP", "absolute_x", 3, "Compare accumulator (absolute,X)"),
            0xD9: ("CMP", "absolute_y", 3, "Compare accumulator (absolute,Y)"),
            0xC1: ("CMP", "indirect_x", 2, "Compare accumulator ((zero page,X))"),
            0xD1: ("CMP", "indirect_y", 2, "Compare accumulator ((zero page),Y)"),
            0xC3: ("CMP", "stack_relative", 2, "Compare accumulator (stack relative)"),
            0xD3: ("CMP", "stack_relative_y", 2, "Compare accumulator ((stack relative),Y)"),
            0xC7: ("CMP", "indirect_long", 2, "Compare accumulator ([zero page])"),
            0xD7: ("CMP", "indirect_long_y", 2, "Compare accumulator ([zero page],Y)"),
            0xCF: ("CMP", "absolute_long", 4, "Compare accumulator (absolute long)"),
            0xDF: ("CMP", "absolute_long_x", 4, "Compare accumulator (absolute long,X)"),

            0xE0: ("CPX", "immediate", 2, "Compare X register (immediate)"),
            0xE4: ("CPX", "zero_page", 2, "Compare X register (zero page)"),
            0xEC: ("CPX", "absolute", 3, "Compare X register (absolute)"),

            0xC0: ("CPY", "immediate", 2, "Compare Y register (immediate)"),
            0xC4: ("CPY", "zero_page", 2, "Compare Y register (zero page)"),
            0xCC: ("CPY", "absolute", 3, "Compare Y register (absolute)"),

            # Bit Operations
            0x89: ("BIT", "immediate", 2, "Test bits in accumulator (immediate)"),
            0x24: ("BIT", "zero_page", 2, "Test bits in accumulator (zero page)"),
            0x34: ("BIT", "zero_page_x", 2, "Test bits in accumulator (zero page,X)"),
            0x2C: ("BIT", "absolute", 3, "Test bits in accumulator (absolute)"),
            0x3C: ("BIT", "absolute_x", 3, "Test bits in accumulator (absolute,X)"),

            # Shifts
            0x0A: ("ASL", "accumulator", 1, "Arithmetic shift left (accumulator)"),
            0x06: ("ASL", "zero_page", 2, "Arithmetic shift left (zero page)"),
            0x16: ("ASL", "zero_page_x", 2, "Arithmetic shift left (zero page,X)"),
            0x0E: ("ASL", "absolute", 3, "Arithmetic shift left (absolute)"),
            0x1E: ("ASL", "absolute_x", 3, "Arithmetic shift left (absolute,X)"),

            0x4A: ("LSR", "accumulator", 1, "Logical shift right (accumulator)"),
            0x46: ("LSR", "zero_page", 2, "Logical shift right (zero page)"),
            0x56: ("LSR", "zero_page_x", 2, "Logical shift right (zero page,X)"),
            0x4E: ("LSR", "absolute", 3, "Logical shift right (absolute)"),
            0x5E: ("LSR", "absolute_x", 3, "Logical shift right (absolute,X)"),

            0x2A: ("ROL", "accumulator", 1, "Rotate left (accumulator)"),
            0x26: ("ROL", "zero_page", 2, "Rotate left (zero page)"),
            0x36: ("ROL", "zero_page_x", 2, "Rotate left (zero page,X)"),
            0x2E: ("ROL", "absolute", 3, "Rotate left (absolute)"),
            0x3E: ("ROL", "absolute_x", 3, "Rotate left (absolute,X)"),

            0x6A: ("ROR", "accumulator", 1, "Rotate right (accumulator)"),
            0x66: ("ROR", "zero_page", 2, "Rotate right (zero page)"),
            0x76: ("ROR", "zero_page_x", 2, "Rotate right (zero page,X)"),
            0x6E: ("ROR", "absolute", 3, "Rotate right (absolute)"),
            0x7E: ("ROR", "absolute_x", 3, "Rotate right (absolute,X)"),

            # Increment/Decrement
            0x1A: ("INC", "accumulator", 1, "Increment accumulator"),
            0xE6: ("INC", "zero_page", 2, "Increment (zero page)"),
            0xF6: ("INC", "zero_page_x", 2, "Increment (zero page,X)"),
            0xEE: ("INC", "absolute", 3, "Increment (absolute)"),
            0xFE: ("INC", "absolute_x", 3, "Increment (absolute,X)"),

            0x3A: ("DEC", "accumulator", 1, "Decrement accumulator"),
            0xC6: ("DEC", "zero_page", 2, "Decrement (zero page)"),
            0xD6: ("DEC", "zero_page_x", 2, "Decrement (zero page,X)"),
            0xCE: ("DEC", "absolute", 3, "Decrement (absolute)"),
            0xDE: ("DEC", "absolute_x", 3, "Decrement (absolute,X)"),

            0xE8: ("INX", "implied", 1, "Increment X register"),
            0xCA: ("DEX", "implied", 1, "Decrement X register"),
            0xC8: ("INY", "implied", 1, "Increment Y register"),
            0x88: ("DEY", "implied", 1, "Decrement Y register"),

            # Control Flow
            0x20: ("JSR", "absolute", 3, "Jump to subroutine"),
            0xFC: ("JSR", "absolute_indexed_indirect", 3, "Jump to subroutine (absolute indexed indirect)"),
            0x22: ("JSL", "absolute_long", 4, "Jump to subroutine long"),
            0x60: ("RTS", "implied", 1, "Return from subroutine"),
            0x6B: ("RTL", "implied", 1, "Return from subroutine long"),
            0x40: ("RTI", "implied", 1, "Return from interrupt"),

            0x4C: ("JMP", "absolute", 3, "Jump to address"),
            0x6C: ("JMP", "absolute_indirect", 3, "Jump to address (absolute indirect)"),
            0x7C: ("JMP", "absolute_indexed_indirect", 3, "Jump to address (absolute indexed indirect)"),
            0x5C: ("JMP", "absolute_long", 4, "Jump to address long"),
            0xDC: ("JMP", "absolute_indirect_long", 3, "Jump to address (absolute indirect long)"),

            # Branches
            0x10: ("BPL", "relative", 2, "Branch if positive"),
            0x30: ("BMI", "relative", 2, "Branch if negative"),
            0x50: ("BVC", "relative", 2, "Branch if overflow clear"),
            0x70: ("BVS", "relative", 2, "Branch if overflow set"),
            0x90: ("BCC", "relative", 2, "Branch if carry clear"),
            0xB0: ("BCS", "relative", 2, "Branch if carry set"),
            0xD0: ("BNE", "relative", 2, "Branch if not equal"),
            0xF0: ("BEQ", "relative", 2, "Branch if equal"),
            0x80: ("BRA", "relative", 2, "Branch always"),
            0x82: ("BRL", "relative_long", 3, "Branch always long"),

            # Status Flag Operations
            0x18: ("CLC", "implied", 1, "Clear carry flag"),
            0x38: ("SEC", "implied", 1, "Set carry flag"),
            0x58: ("CLI", "implied", 1, "Clear interrupt disable flag"),
            0x78: ("SEI", "implied", 1, "Set interrupt disable flag"),
            0xD8: ("CLD", "implied", 1, "Clear decimal mode flag"),
            0xF8: ("SED", "implied", 1, "Set decimal mode flag"),
            0xB8: ("CLV", "implied", 1, "Clear overflow flag"),
            0xC2: ("REP", "immediate", 2, "Reset processor status bits"),
            0xE2: ("SEP", "immediate", 2, "Set processor status bits"),

            # Special Operations
            0xEB: ("XBA", "implied", 1, "Exchange accumulator bytes"),
            0x00: ("BRK", "immediate", 2, "Software interrupt"),
            0x02: ("COP", "immediate", 2, "Coprocessor interrupt"),
            0xEA: ("NOP", "implied", 1, "No operation"),
            0x42: ("WDM", "immediate", 2, "Reserved instruction"),
            0xDB: ("STP", "implied", 1, "Stop processor"),
            0xCB: ("WAI", "implied", 1, "Wait for interrupt"),
            0x44: ("MVP", "block_move", 3, "Block move previous"),
            0x54: ("MVN", "block_move", 3, "Block move next"),

            # Memory Operations
            0x64: ("STZ", "zero_page", 2, "Store zero to zero page"),
            0x74: ("STZ", "zero_page_x", 2, "Store zero to zero page,X"),
            0x9C: ("STZ", "absolute", 3, "Store zero to absolute"),
            0x9E: ("STZ", "absolute_x", 3, "Store zero to absolute,X"),

            0x14: ("TRB", "zero_page", 2, "Test and reset bits (zero page)"),
            0x1C: ("TRB", "absolute", 3, "Test and reset bits (absolute)"),
            0x04: ("TSB", "zero_page", 2, "Test and set bits (zero page)"),
            0x0C: ("TSB", "absolute", 3, "Test and set bits (absolute)"),
        }

        # Function pattern recognition
        self.function_patterns = {
            'system_init': [
                (0x08, 'PHP'),      # Save status
                (0xC2, 'REP'),      # 16-bit mode
                (0x48, 'PHA'),      # Save registers
                (0xDA, 'PHX'),
                (0x5A, 'PHY'),
                (0x8B, 'PHB')       # Save bank
            ],
            'pointer_calc': [
                (0xAD, 'LDA'),      # Load coordinate
                (0xEB, 'XBA'),      # Exchange bytes
                (0x22, 'JSL')       # Call function
            ],
            'data_load': [
                (0x22, 'JSL'),      # Call decompress
                (0x90, 'BCC'),      # Check result
                (0x0A, 'ASL')       # Address calculation
            ],
            'graphics_update': [
                (0x8D, 'STA'),      # Write to PPU register
                (0x2C, 'BIT'),      # Test status
                (0xF0, 'BEQ')       # Wait for ready
            ]
        }

    def hrom_address_to_offset(self, address):
        """Convert HiROM address to ROM file offset"""
        if address >= 0xFF0000:
            # High ROM area (bank 7F+)
            return address - 0xFF0000 + 0x3F0000
        elif address >= 0xC00000:
            # ROM banks C0-FF
            bank = (address >> 16) & 0xFF
            offset = address & 0xFFFF
            if offset >= 0x8000:
                return (bank - 0xC0) * 0x8000 + (offset - 0x8000)
        return None

    def disassemble_instruction(self, offset):
        """Disassemble a single instruction with full operand analysis"""
        if offset >= len(self.rom_data):
            return None

        opcode = self.rom_data[offset]
        if opcode not in self.instructions:
            return None

        mnemonic, addressing_mode, size, description = self.instructions[opcode]

        # Extract operands
        operand_bytes = []
        for i in range(1, size):
            if offset + i < len(self.rom_data):
                operand_bytes.append(self.rom_data[offset + i])
            else:
                break

        # Format operand based on addressing mode
        operand_str = ""
        target_address = None

        if addressing_mode == "immediate":
            if len(operand_bytes) == 1:
                operand_str = f"#${operand_bytes[0]:02X}"
            elif len(operand_bytes) == 2:
                value = operand_bytes[0] | (operand_bytes[1] << 8)
                operand_str = f"#${value:04X}"

        elif addressing_mode == "zero_page":
            if operand_bytes:
                operand_str = f"${operand_bytes[0]:02X}"
                target_address = operand_bytes[0]

        elif addressing_mode == "absolute":
            if len(operand_bytes) >= 2:
                addr = operand_bytes[0] | (operand_bytes[1] << 8)
                operand_str = f"${addr:04X}"
                target_address = addr

        elif addressing_mode == "absolute_long":
            if len(operand_bytes) >= 3:
                addr = operand_bytes[0] | (operand_bytes[1] << 8) | (operand_bytes[2] << 16)
                operand_str = f"${addr:06X}"
                target_address = addr

        elif addressing_mode == "relative":
            if operand_bytes:
                offset_val = operand_bytes[0]
                if offset_val > 127:
                    offset_val = offset_val - 256  # Signed byte
                target_addr = (offset + size + offset_val) & 0xFFFF
                operand_str = f"${target_addr:04X}"
                target_address = target_addr

        elif addressing_mode == "relative_long":
            if len(operand_bytes) >= 2:
                offset_val = operand_bytes[0] | (operand_bytes[1] << 8)
                if offset_val > 32767:
                    offset_val = offset_val - 65536  # Signed word
                target_addr = (offset + size + offset_val) & 0xFFFFFF
                operand_str = f"${target_addr:06X}"
                target_address = target_addr

        elif addressing_mode in ["absolute_x", "zero_page_x"]:
            if addressing_mode == "absolute_x" and len(operand_bytes) >= 2:
                addr = operand_bytes[0] | (operand_bytes[1] << 8)
                operand_str = f"${addr:04X},X"
                target_address = addr
            elif addressing_mode == "zero_page_x" and operand_bytes:
                operand_str = f"${operand_bytes[0]:02X},X"
                target_address = operand_bytes[0]

        elif addressing_mode in ["absolute_y", "zero_page_y"]:
            if addressing_mode == "absolute_y" and len(operand_bytes) >= 2:
                addr = operand_bytes[0] | (operand_bytes[1] << 8)
                operand_str = f"${addr:04X},Y"
                target_address = addr
            elif addressing_mode == "zero_page_y" and operand_bytes:
                operand_str = f"${operand_bytes[0]:02X},Y"
                target_address = operand_bytes[0]

        elif "indirect" in addressing_mode:
            if addressing_mode == "absolute_indirect" and len(operand_bytes) >= 2:
                addr = operand_bytes[0] | (operand_bytes[1] << 8)
                operand_str = f"(${addr:04X})"
                target_address = addr
            elif addressing_mode == "indirect_x" and operand_bytes:
                operand_str = f"(${operand_bytes[0]:02X},X)"
                target_address = operand_bytes[0]
            elif addressing_mode == "indirect_y" and operand_bytes:
                operand_str = f"(${operand_bytes[0]:02X}),Y"
                target_address = operand_bytes[0]

        # Generate hex byte string
        hex_bytes = " ".join([f"{b:02X}" for b in [opcode] + operand_bytes])

        return {
            'mnemonic': mnemonic,
            'operand': operand_str,
            'addressing_mode': addressing_mode,
            'size': size,
            'hex_bytes': hex_bytes,
            'description': description,
            'target_address': target_address,
            'raw_bytes': [opcode] + operand_bytes
        }

    def analyze_function_type(self, instructions):
        """Analyze a sequence of instructions to determine function type"""
        patterns_found = []

        for pattern_name, pattern in self.function_patterns.items():
            matches = 0
            for i, (expected_opcode, expected_mnemonic) in enumerate(pattern):
                if i < len(instructions):
                    inst = instructions[i]
                    if inst and inst.get('raw_bytes') and len(inst['raw_bytes']) > 0:
                        if (inst['raw_bytes'][0] == expected_opcode and
                            inst['mnemonic'] == expected_mnemonic):
                            matches += 1

            if matches >= len(pattern) * 0.6:  # 60% pattern match
                patterns_found.append((pattern_name, matches / len(pattern)))

        if patterns_found:
            return max(patterns_found, key=lambda x: x[1])[0]
        return "general_purpose"

    def extract_comprehensive_function(self, start_address, max_instructions=50):
        """Extract and analyze a complete function with full documentation"""

        offset = self.hrom_address_to_offset(start_address)
        if offset is None:
            return None

        instructions = []
        current_offset = offset

        # Disassemble instructions
        for i in range(max_instructions):
            if current_offset >= len(self.rom_data):
                break

            inst = self.disassemble_instruction(current_offset)
            if inst is None:
                break

            instructions.append(inst)
            current_offset += inst['size']

            # Stop at return instructions
            if inst['mnemonic'] in ['RTS', 'RTL', 'RTI']:
                break

        # Analyze function type
        func_type = self.analyze_function_type(instructions)

        # Generate comprehensive documentation
        function_info = {
            'start_address': start_address,
            'type': func_type,
            'instructions': instructions,
            'size': sum(inst['size'] for inst in instructions),
            'uses_hardware_registers': self.find_hardware_register_usage(instructions),
            'calls_functions': self.find_function_calls(instructions),
            'branches': self.find_branch_targets(instructions, start_address),
            'memory_operations': self.analyze_memory_operations(instructions)
        }

        return function_info

    def find_hardware_register_usage(self, instructions):
        """Find hardware register usage in instructions"""
        hardware_regs = []

        for inst in instructions:
            if inst['target_address'] is not None:
                addr = inst['target_address']
                if (0x2100 <= addr <= 0x21FF or  # PPU
                    0x4200 <= addr <= 0x43FF or  # CPU/DMA
                    0xE000 <= addr <= 0xE0FF):   # Work RAM
                    hardware_regs.append({
                        'address': addr,
                        'operation': inst['mnemonic'],
                        'instruction': f"{inst['mnemonic']} {inst['operand']}"
                    })

        return hardware_regs

    def find_function_calls(self, instructions):
        """Find function call targets"""
        calls = []

        for inst in instructions:
            if inst['mnemonic'] in ['JSL', 'JSR'] and inst['target_address']:
                calls.append({
                    'target': inst['target_address'],
                    'type': inst['mnemonic'],
                    'instruction': f"{inst['mnemonic']} {inst['operand']}"
                })

        return calls

    def find_branch_targets(self, instructions, base_address):
        """Find branch targets and control flow"""
        branches = []

        for i, inst in enumerate(instructions):
            if inst['mnemonic'].startswith('B') and inst['target_address']:
                branches.append({
                    'target': inst['target_address'],
                    'condition': inst['mnemonic'],
                    'instruction': f"{inst['mnemonic']} {inst['operand']}",
                    'offset': i
                })

        return branches

    def analyze_memory_operations(self, instructions):
        """Analyze memory operations patterns"""
        operations = {
            'loads': [],
            'stores': [],
            'comparisons': [],
            'arithmetic': []
        }

        for inst in instructions:
            if inst['mnemonic'] in ['LDA', 'LDX', 'LDY']:
                operations['loads'].append(inst)
            elif inst['mnemonic'] in ['STA', 'STX', 'STY', 'STZ']:
                operations['stores'].append(inst)
            elif inst['mnemonic'] in ['CMP', 'CPX', 'CPY', 'BIT']:
                operations['comparisons'].append(inst)
            elif inst['mnemonic'] in ['ADC', 'SBC', 'ASL', 'LSR']:
                operations['arithmetic'].append(inst)

        return operations

    def generate_documented_assembly(self, function_info, function_name=None):
        """Generate fully documented assembly code"""

        if not function_name:
            function_name = f"Function_{function_info['type'].title()}_{function_info['start_address']:06X}"

        lines = []
        lines.append(";==============================================================================")
        lines.append(f"; {function_name}")
        lines.append(f"; Type: {function_info['type'].replace('_', ' ').title()}")
        lines.append(f"; Address: ${function_info['start_address']:06X}")
        lines.append(f"; Size: {function_info['size']} bytes")
        lines.append(f"; Instructions: {len(function_info['instructions'])}")
        lines.append(";==============================================================================")

        # Add function analysis
        if function_info['uses_hardware_registers']:
            lines.append("; Hardware Registers Used:")
            for reg in function_info['uses_hardware_registers']:
                lines.append(f";   ${reg['address']:04X} - {reg['operation']} operation")

        if function_info['calls_functions']:
            lines.append("; Function Calls:")
            for call in function_info['calls_functions']:
                lines.append(f";   ${call['target']:06X} - {call['type']} call")

        lines.append(";==============================================================================")
        lines.append(f"{function_name}:")

        # Generate instruction lines with context-aware comments
        for i, inst in enumerate(function_info['instructions']):
            comment = self.generate_contextual_comment(inst, function_info, i)
            operand_part = f" {inst['operand']}" if inst['operand'] else ""
            instruction_text = f"    {inst['mnemonic']}{operand_part}"

            line = f"{instruction_text:<24} ; {inst['hex_bytes']} | {comment}"
            lines.append(line)

        lines.append("")
        return "\n".join(lines)

    def generate_contextual_comment(self, inst, function_info, position):
        """Generate context-aware comments for instructions"""

        # Hardware register operations
        if inst['target_address'] and 0x2100 <= inst['target_address'] <= 0x21FF:
            if inst['mnemonic'] == 'STA':
                return f"Configure PPU register ${inst['target_address']:04X}"
            elif inst['mnemonic'] == 'LDA':
                return f"Read PPU status ${inst['target_address']:04X}"

        elif inst['target_address'] and 0x4200 <= inst['target_address'] <= 0x43FF:
            if inst['mnemonic'] == 'STA':
                return f"Write to hardware register ${inst['target_address']:04X}"
            elif inst['mnemonic'] == 'LDA':
                return f"Read hardware register ${inst['target_address']:04X}"

        elif inst['target_address'] and 0xE000 <= inst['target_address'] <= 0xE0FF:
            if inst['mnemonic'] == 'STA':
                return f"Store to work RAM ${inst['target_address']:04X}"
            elif inst['mnemonic'] == 'LDA':
                return f"Load from work RAM ${inst['target_address']:04X}"

        # Function-type specific comments
        if function_info['type'] == 'system_init':
            if inst['mnemonic'] == 'PHP':
                return "Save processor status for restoration"
            elif inst['mnemonic'] == 'REP' and '#$30' in inst['operand']:
                return "Enable 16-bit accumulator and index registers"
            elif inst['mnemonic'] in ['PHA', 'PHX', 'PHY']:
                return "Preserve register state"
            elif inst['mnemonic'] == 'PHB':
                return "Save data bank for restoration"

        elif function_info['type'] == 'pointer_calc':
            if inst['mnemonic'] == 'LDA' and position == 0:
                return "Load coordinate/address parameter"
            elif inst['mnemonic'] == 'XBA':
                return "Swap accumulator bytes for calculation"
            elif inst['mnemonic'] == 'JSL':
                return "Call pointer calculation routine"

        elif function_info['type'] == 'data_load':
            if inst['mnemonic'] == 'JSL':
                return "Call data decompression routine"
            elif inst['mnemonic'] == 'BCC':
                return "Branch if data load failed"
            elif inst['mnemonic'] == 'ASL':
                return "Double address for word access"

        # Default instruction purpose
        return inst['description']

def main():
    # Load ROM
    rom_path = "static/Dragon Quest III - english (patched).smc"
    if not os.path.exists(rom_path):
        print("Error: ROM file not found")
        return

    extractor = DQ3AdvancedExtractor(rom_path)

    print("🔍 ADVANCED DRAGON QUEST III CODE ANALYSIS")
    print("="*60)

    # Key functions to analyze
    key_functions = [
        (0xFF0000, "SystemBootEntry"),
        (0xC01098, "CalculateROMPointer"),
        (0xC08FD7, "DecompressGameData"),
        (0xC09052, "HandleSystemError"),
        (0xC90572, "ExecuteEngineCommand"),
        (0xC903EE, "ProcessEngineFunction"),
    ]

    os.makedirs("src/analyzed", exist_ok=True)

    for address, name in key_functions:
        print(f"  🔬 Analyzing ${address:06X} - {name}")

        function_info = extractor.extract_comprehensive_function(address)
        if function_info:
            documented_code = extractor.generate_documented_assembly(function_info, name)

            # Save to file
            filename = f"src/analyzed/{name.lower()}.asm"
            with open(filename, 'w') as f:
                f.write(documented_code)

            print(f"    📄 Generated {filename}")
            print(f"    📊 {len(function_info['instructions'])} instructions, {function_info['size']} bytes")
            print(f"    🏷️  Type: {function_info['type']}")
            print(f"    🔧 Hardware regs: {len(function_info['uses_hardware_registers'])}")
            print(f"    📞 Function calls: {len(function_info['calls_functions'])}")
            print("")

    print("✅ ADVANCED ANALYSIS COMPLETE")
    print(f"📂 Analysis saved to src/analyzed/")
    print(f"🎯 Ready for comprehensive reverse engineering!")

if __name__ == "__main__":
    main()
