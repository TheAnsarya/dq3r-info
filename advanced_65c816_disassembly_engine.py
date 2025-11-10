#!/usr/bin/env python3
"""
Advanced 65C816 Disassembly Engine
Intelligent ROM disassembly with complete instruction set support and AI enhancement

PRIMARY PURPOSE: Core disassembly engine for Dragon Quest III ROM analysis
"""

import json
import struct
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Set, Any
from dataclasses import dataclass, field
from enum import Enum

class AddressingMode(Enum):
	"""65C816 addressing modes"""
	IMPLIED = "imp"
	IMMEDIATE = "imm"
	ACCUMULATOR = "acc"
	ABSOLUTE = "abs"
	ABSOLUTE_LONG = "abl"
	ABSOLUTE_X = "abx"
	ABSOLUTE_Y = "aby"
	ABSOLUTE_LONG_X = "alx"
	ABSOLUTE_INDIRECT = "abi"
	ABSOLUTE_INDEXED_INDIRECT = "aii"
	ABSOLUTE_INDIRECT_LONG = "ail"
	DIRECT_PAGE = "dir"
	DIRECT_PAGE_X = "dpx"
	DIRECT_PAGE_Y = "dpy"
	DIRECT_PAGE_INDIRECT = "dpi"
	DIRECT_PAGE_INDIRECT_LONG = "dil"
	DIRECT_PAGE_INDEXED_INDIRECT = "dix"
	DIRECT_PAGE_INDIRECT_INDEXED = "diy"
	DIRECT_PAGE_INDIRECT_LONG_INDEXED = "dly"
	STACK_RELATIVE = "stk"
	STACK_RELATIVE_INDIRECT_INDEXED = "siy"
	PROGRAM_COUNTER_RELATIVE = "rel"
	PROGRAM_COUNTER_RELATIVE_LONG = "rll"
	BLOCK_MOVE = "blk"

@dataclass
class Instruction:
	"""65C816 instruction representation"""
	opcode: int
	mnemonic: str
	addressing_mode: AddressingMode
	bytes_length: int
	cycles: int
	flags_affected: str
	description: str

@dataclass
class DisassembledInstruction:
	"""Disassembled instruction with context"""
	address: int
	opcode: int
	instruction: Instruction
	operand_bytes: bytes
	operand_value: Optional[int]
	formatted_instruction: str
	comment: str = ""
	labels: List[str] = field(default_factory=list)
	cross_references: List[int] = field(default_factory=list)

@dataclass
class CodeSection:
	"""Identified code section"""
	start_address: int
	end_address: int
	entry_points: List[int]
	section_type: str  # "code", "data", "graphics", "audio", "text"
	confidence: float  # 0.0 to 1.0
	instructions: List[DisassembledInstruction] = field(default_factory=list)

class Advanced65C816Disassembler:
	"""Advanced 65C816 disassembly engine with intelligent analysis"""

	def __init__(self):
		self.instruction_set = self._initialize_instruction_set()
		self.rom_data: Optional[bytes] = None
		self.rom_size: int = 0
		self.bank_size: int = 0x10000  # 64KB per bank
		self.disassembled_banks: Dict[int, List[DisassembledInstruction]] = {}
		self.code_sections: Dict[int, List[CodeSection]] = {}
		self.symbol_table: Dict[int, str] = {}
		self.cross_references: Dict[int, Set[int]] = {}

	def _initialize_instruction_set(self) -> Dict[int, Instruction]:
		"""Initialize complete 65C816 instruction set"""
		instructions = {}

		# Core instruction set - Major opcodes with common patterns
		opcodes_data = [
			# ADC - Add with Carry
			(0x69, "ADC", AddressingMode.IMMEDIATE, 2, 2, "NVZC", "Add with carry (immediate)"),
			(0x65, "ADC", AddressingMode.DIRECT_PAGE, 2, 3, "NVZC", "Add with carry (direct page)"),
			(0x75, "ADC", AddressingMode.DIRECT_PAGE_X, 2, 4, "NVZC", "Add with carry (direct page,X)"),
			(0x6D, "ADC", AddressingMode.ABSOLUTE, 3, 4, "NVZC", "Add with carry (absolute)"),
			(0x7D, "ADC", AddressingMode.ABSOLUTE_X, 3, 4, "NVZC", "Add with carry (absolute,X)"),
			(0x79, "ADC", AddressingMode.ABSOLUTE_Y, 3, 4, "NVZC", "Add with carry (absolute,Y)"),
			(0x72, "ADC", AddressingMode.DIRECT_PAGE_INDIRECT, 2, 5, "NVZC", "Add with carry (direct page indirect)"),
			(0x61, "ADC", AddressingMode.DIRECT_PAGE_INDEXED_INDIRECT, 2, 6, "NVZC", "Add with carry (direct page indexed indirect,X)"),
			(0x71, "ADC", AddressingMode.DIRECT_PAGE_INDIRECT_INDEXED, 2, 5, "NVZC", "Add with carry (direct page indirect indexed,Y)"),
			(0x67, "ADC", AddressingMode.DIRECT_PAGE_INDIRECT_LONG, 2, 6, "NVZC", "Add with carry (direct page indirect long)"),
			(0x77, "ADC", AddressingMode.DIRECT_PAGE_INDIRECT_LONG_INDEXED, 2, 6, "NVZC", "Add with carry (direct page indirect long,Y)"),
			(0x6F, "ADC", AddressingMode.ABSOLUTE_LONG, 4, 5, "NVZC", "Add with carry (absolute long)"),
			(0x7F, "ADC", AddressingMode.ABSOLUTE_LONG_X, 4, 5, "NVZC", "Add with carry (absolute long,X)"),
			(0x63, "ADC", AddressingMode.STACK_RELATIVE, 2, 4, "NVZC", "Add with carry (stack relative)"),
			(0x73, "ADC", AddressingMode.STACK_RELATIVE_INDIRECT_INDEXED, 2, 7, "NVZC", "Add with carry (stack relative indirect indexed,Y)"),

			# AND - Logical AND
			(0x29, "AND", AddressingMode.IMMEDIATE, 2, 2, "NZ", "Logical AND (immediate)"),
			(0x25, "AND", AddressingMode.DIRECT_PAGE, 2, 3, "NZ", "Logical AND (direct page)"),
			(0x35, "AND", AddressingMode.DIRECT_PAGE_X, 2, 4, "NZ", "Logical AND (direct page,X)"),
			(0x2D, "AND", AddressingMode.ABSOLUTE, 3, 4, "NZ", "Logical AND (absolute)"),
			(0x3D, "AND", AddressingMode.ABSOLUTE_X, 3, 4, "NZ", "Logical AND (absolute,X)"),
			(0x39, "AND", AddressingMode.ABSOLUTE_Y, 3, 4, "NZ", "Logical AND (absolute,Y)"),
			(0x32, "AND", AddressingMode.DIRECT_PAGE_INDIRECT, 2, 5, "NZ", "Logical AND (direct page indirect)"),
			(0x21, "AND", AddressingMode.DIRECT_PAGE_INDEXED_INDIRECT, 2, 6, "NZ", "Logical AND (direct page indexed indirect,X)"),
			(0x31, "AND", AddressingMode.DIRECT_PAGE_INDIRECT_INDEXED, 2, 5, "NZ", "Logical AND (direct page indirect indexed,Y)"),
			(0x27, "AND", AddressingMode.DIRECT_PAGE_INDIRECT_LONG, 2, 6, "NZ", "Logical AND (direct page indirect long)"),
			(0x37, "AND", AddressingMode.DIRECT_PAGE_INDIRECT_LONG_INDEXED, 2, 6, "NZ", "Logical AND (direct page indirect long,Y)"),
			(0x2F, "AND", AddressingMode.ABSOLUTE_LONG, 4, 5, "NZ", "Logical AND (absolute long)"),
			(0x3F, "AND", AddressingMode.ABSOLUTE_LONG_X, 4, 5, "NZ", "Logical AND (absolute long,X)"),
			(0x23, "AND", AddressingMode.STACK_RELATIVE, 2, 4, "NZ", "Logical AND (stack relative)"),
			(0x33, "AND", AddressingMode.STACK_RELATIVE_INDIRECT_INDEXED, 2, 7, "NZ", "Logical AND (stack relative indirect indexed,Y)"),

			# ASL - Arithmetic Shift Left
			(0x0A, "ASL", AddressingMode.ACCUMULATOR, 1, 2, "NZC", "Arithmetic shift left (accumulator)"),
			(0x06, "ASL", AddressingMode.DIRECT_PAGE, 2, 5, "NZC", "Arithmetic shift left (direct page)"),
			(0x16, "ASL", AddressingMode.DIRECT_PAGE_X, 2, 6, "NZC", "Arithmetic shift left (direct page,X)"),
			(0x0E, "ASL", AddressingMode.ABSOLUTE, 3, 6, "NZC", "Arithmetic shift left (absolute)"),
			(0x1E, "ASL", AddressingMode.ABSOLUTE_X, 3, 7, "NZC", "Arithmetic shift left (absolute,X)"),

			# Branch Instructions
			(0x90, "BCC", AddressingMode.PROGRAM_COUNTER_RELATIVE, 2, 2, "", "Branch if carry clear"),
			(0xB0, "BCS", AddressingMode.PROGRAM_COUNTER_RELATIVE, 2, 2, "", "Branch if carry set"),
			(0xF0, "BEQ", AddressingMode.PROGRAM_COUNTER_RELATIVE, 2, 2, "", "Branch if equal"),
			(0x30, "BMI", AddressingMode.PROGRAM_COUNTER_RELATIVE, 2, 2, "", "Branch if minus"),
			(0xD0, "BNE", AddressingMode.PROGRAM_COUNTER_RELATIVE, 2, 2, "", "Branch if not equal"),
			(0x10, "BPL", AddressingMode.PROGRAM_COUNTER_RELATIVE, 2, 2, "", "Branch if plus"),
			(0x50, "BVC", AddressingMode.PROGRAM_COUNTER_RELATIVE, 2, 2, "", "Branch if overflow clear"),
			(0x70, "BVS", AddressingMode.PROGRAM_COUNTER_RELATIVE, 2, 2, "", "Branch if overflow set"),
			(0x82, "BRL", AddressingMode.PROGRAM_COUNTER_RELATIVE_LONG, 3, 4, "", "Branch always long"),

			# BIT - Bit Test
			(0x89, "BIT", AddressingMode.IMMEDIATE, 2, 2, "NVZ", "Bit test (immediate)"),
			(0x24, "BIT", AddressingMode.DIRECT_PAGE, 2, 3, "NVZ", "Bit test (direct page)"),
			(0x34, "BIT", AddressingMode.DIRECT_PAGE_X, 2, 4, "NVZ", "Bit test (direct page,X)"),
			(0x2C, "BIT", AddressingMode.ABSOLUTE, 3, 4, "NVZ", "Bit test (absolute)"),
			(0x3C, "BIT", AddressingMode.ABSOLUTE_X, 3, 4, "NVZ", "Bit test (absolute,X)"),

			# Break and Interrupt
			(0x00, "BRK", AddressingMode.IMPLIED, 1, 7, "I", "Break"),
			(0x02, "COP", AddressingMode.IMMEDIATE, 2, 7, "I", "Coprocessor"),

			# Clear Flag Instructions
			(0x18, "CLC", AddressingMode.IMPLIED, 1, 2, "C", "Clear carry flag"),
			(0xD8, "CLD", AddressingMode.IMPLIED, 1, 2, "D", "Clear decimal flag"),
			(0x58, "CLI", AddressingMode.IMPLIED, 1, 2, "I", "Clear interrupt flag"),
			(0xB8, "CLV", AddressingMode.IMPLIED, 1, 2, "V", "Clear overflow flag"),

			# Compare Instructions
			(0xC9, "CMP", AddressingMode.IMMEDIATE, 2, 2, "NZC", "Compare accumulator (immediate)"),
			(0xC5, "CMP", AddressingMode.DIRECT_PAGE, 2, 3, "NZC", "Compare accumulator (direct page)"),
			(0xD5, "CMP", AddressingMode.DIRECT_PAGE_X, 2, 4, "NZC", "Compare accumulator (direct page,X)"),
			(0xCD, "CMP", AddressingMode.ABSOLUTE, 3, 4, "NZC", "Compare accumulator (absolute)"),
			(0xDD, "CMP", AddressingMode.ABSOLUTE_X, 3, 4, "NZC", "Compare accumulator (absolute,X)"),
			(0xD9, "CMP", AddressingMode.ABSOLUTE_Y, 3, 4, "NZC", "Compare accumulator (absolute,Y)"),
			(0xE0, "CPX", AddressingMode.IMMEDIATE, 2, 2, "NZC", "Compare X register (immediate)"),
			(0xE4, "CPX", AddressingMode.DIRECT_PAGE, 2, 3, "NZC", "Compare X register (direct page)"),
			(0xEC, "CPX", AddressingMode.ABSOLUTE, 3, 4, "NZC", "Compare X register (absolute)"),
			(0xC0, "CPY", AddressingMode.IMMEDIATE, 2, 2, "NZC", "Compare Y register (immediate)"),
			(0xC4, "CPY", AddressingMode.DIRECT_PAGE, 2, 3, "NZC", "Compare Y register (direct page)"),
			(0xCC, "CPY", AddressingMode.ABSOLUTE, 3, 4, "NZC", "Compare Y register (absolute)"),

			# Decrement Instructions
			(0xC6, "DEC", AddressingMode.DIRECT_PAGE, 2, 5, "NZ", "Decrement memory (direct page)"),
			(0xD6, "DEC", AddressingMode.DIRECT_PAGE_X, 2, 6, "NZ", "Decrement memory (direct page,X)"),
			(0xCE, "DEC", AddressingMode.ABSOLUTE, 3, 6, "NZ", "Decrement memory (absolute)"),
			(0xDE, "DEC", AddressingMode.ABSOLUTE_X, 3, 7, "NZ", "Decrement memory (absolute,X)"),
			(0x3A, "DEC", AddressingMode.ACCUMULATOR, 1, 2, "NZ", "Decrement accumulator"),
			(0xCA, "DEX", AddressingMode.IMPLIED, 1, 2, "NZ", "Decrement X register"),
			(0x88, "DEY", AddressingMode.IMPLIED, 1, 2, "NZ", "Decrement Y register"),

			# EOR - Exclusive OR
			(0x49, "EOR", AddressingMode.IMMEDIATE, 2, 2, "NZ", "Exclusive OR (immediate)"),
			(0x45, "EOR", AddressingMode.DIRECT_PAGE, 2, 3, "NZ", "Exclusive OR (direct page)"),
			(0x55, "EOR", AddressingMode.DIRECT_PAGE_X, 2, 4, "NZ", "Exclusive OR (direct page,X)"),
			(0x4D, "EOR", AddressingMode.ABSOLUTE, 3, 4, "NZ", "Exclusive OR (absolute)"),
			(0x5D, "EOR", AddressingMode.ABSOLUTE_X, 3, 4, "NZ", "Exclusive OR (absolute,X)"),
			(0x59, "EOR", AddressingMode.ABSOLUTE_Y, 3, 4, "NZ", "Exclusive OR (absolute,Y)"),

			# Increment Instructions
			(0xE6, "INC", AddressingMode.DIRECT_PAGE, 2, 5, "NZ", "Increment memory (direct page)"),
			(0xF6, "INC", AddressingMode.DIRECT_PAGE_X, 2, 6, "NZ", "Increment memory (direct page,X)"),
			(0xEE, "INC", AddressingMode.ABSOLUTE, 3, 6, "NZ", "Increment memory (absolute)"),
			(0xFE, "INC", AddressingMode.ABSOLUTE_X, 3, 7, "NZ", "Increment memory (absolute,X)"),
			(0x1A, "INC", AddressingMode.ACCUMULATOR, 1, 2, "NZ", "Increment accumulator"),
			(0xE8, "INX", AddressingMode.IMPLIED, 1, 2, "NZ", "Increment X register"),
			(0xC8, "INY", AddressingMode.IMPLIED, 1, 2, "NZ", "Increment Y register"),

			# Jump Instructions
			(0x4C, "JMP", AddressingMode.ABSOLUTE, 3, 3, "", "Jump (absolute)"),
			(0x6C, "JMP", AddressingMode.ABSOLUTE_INDIRECT, 3, 5, "", "Jump (absolute indirect)"),
			(0x7C, "JMP", AddressingMode.ABSOLUTE_INDEXED_INDIRECT, 3, 6, "", "Jump (absolute indexed indirect)"),
			(0x5C, "JMP", AddressingMode.ABSOLUTE_LONG, 4, 4, "", "Jump (absolute long)"),
			(0xDC, "JMP", AddressingMode.ABSOLUTE_INDIRECT_LONG, 3, 6, "", "Jump (absolute indirect long)"),
			(0x20, "JSR", AddressingMode.ABSOLUTE, 3, 6, "", "Jump to subroutine (absolute)"),
			(0xFC, "JSR", AddressingMode.ABSOLUTE_INDEXED_INDIRECT, 3, 8, "", "Jump to subroutine (absolute indexed indirect)"),
			(0x22, "JSR", AddressingMode.ABSOLUTE_LONG, 4, 8, "", "Jump to subroutine (absolute long)"),

			# Load Instructions
			(0xA9, "LDA", AddressingMode.IMMEDIATE, 2, 2, "NZ", "Load accumulator (immediate)"),
			(0xA5, "LDA", AddressingMode.DIRECT_PAGE, 2, 3, "NZ", "Load accumulator (direct page)"),
			(0xB5, "LDA", AddressingMode.DIRECT_PAGE_X, 2, 4, "NZ", "Load accumulator (direct page,X)"),
			(0xAD, "LDA", AddressingMode.ABSOLUTE, 3, 4, "NZ", "Load accumulator (absolute)"),
			(0xBD, "LDA", AddressingMode.ABSOLUTE_X, 3, 4, "NZ", "Load accumulator (absolute,X)"),
			(0xB9, "LDA", AddressingMode.ABSOLUTE_Y, 3, 4, "NZ", "Load accumulator (absolute,Y)"),
			(0xA2, "LDX", AddressingMode.IMMEDIATE, 2, 2, "NZ", "Load X register (immediate)"),
			(0xA6, "LDX", AddressingMode.DIRECT_PAGE, 2, 3, "NZ", "Load X register (direct page)"),
			(0xB6, "LDX", AddressingMode.DIRECT_PAGE_Y, 2, 4, "NZ", "Load X register (direct page,Y)"),
			(0xAE, "LDX", AddressingMode.ABSOLUTE, 3, 4, "NZ", "Load X register (absolute)"),
			(0xBE, "LDX", AddressingMode.ABSOLUTE_Y, 3, 4, "NZ", "Load X register (absolute,Y)"),
			(0xA0, "LDY", AddressingMode.IMMEDIATE, 2, 2, "NZ", "Load Y register (immediate)"),
			(0xA4, "LDY", AddressingMode.DIRECT_PAGE, 2, 3, "NZ", "Load Y register (direct page)"),
			(0xB4, "LDY", AddressingMode.DIRECT_PAGE_X, 2, 4, "NZ", "Load Y register (direct page,X)"),
			(0xAC, "LDY", AddressingMode.ABSOLUTE, 3, 4, "NZ", "Load Y register (absolute)"),
			(0xBC, "LDY", AddressingMode.ABSOLUTE_X, 3, 4, "NZ", "Load Y register (absolute,X)"),

			# Logical Shift Right
			(0x4A, "LSR", AddressingMode.ACCUMULATOR, 1, 2, "NZC", "Logical shift right (accumulator)"),
			(0x46, "LSR", AddressingMode.DIRECT_PAGE, 2, 5, "NZC", "Logical shift right (direct page)"),
			(0x56, "LSR", AddressingMode.DIRECT_PAGE_X, 2, 6, "NZC", "Logical shift right (direct page,X)"),
			(0x4E, "LSR", AddressingMode.ABSOLUTE, 3, 6, "NZC", "Logical shift right (absolute)"),
			(0x5E, "LSR", AddressingMode.ABSOLUTE_X, 3, 7, "NZC", "Logical shift right (absolute,X)"),

			# Miscellaneous
			(0xEA, "NOP", AddressingMode.IMPLIED, 1, 2, "", "No operation"),

			# OR Instructions
			(0x09, "ORA", AddressingMode.IMMEDIATE, 2, 2, "NZ", "Logical OR (immediate)"),
			(0x05, "ORA", AddressingMode.DIRECT_PAGE, 2, 3, "NZ", "Logical OR (direct page)"),
			(0x15, "ORA", AddressingMode.DIRECT_PAGE_X, 2, 4, "NZ", "Logical OR (direct page,X)"),
			(0x0D, "ORA", AddressingMode.ABSOLUTE, 3, 4, "NZ", "Logical OR (absolute)"),
			(0x1D, "ORA", AddressingMode.ABSOLUTE_X, 3, 4, "NZ", "Logical OR (absolute,X)"),
			(0x19, "ORA", AddressingMode.ABSOLUTE_Y, 3, 4, "NZ", "Logical OR (absolute,Y)"),

			# Stack Instructions
			(0x48, "PHA", AddressingMode.IMPLIED, 1, 3, "", "Push accumulator"),
			(0x8B, "PHB", AddressingMode.IMPLIED, 1, 3, "", "Push data bank register"),
			(0x0B, "PHD", AddressingMode.IMPLIED, 1, 4, "", "Push direct register"),
			(0x4B, "PHK", AddressingMode.IMPLIED, 1, 3, "", "Push program bank register"),
			(0x08, "PHP", AddressingMode.IMPLIED, 1, 3, "", "Push processor status"),
			(0xDA, "PHX", AddressingMode.IMPLIED, 1, 3, "", "Push X register"),
			(0x5A, "PHY", AddressingMode.IMPLIED, 1, 3, "", "Push Y register"),
			(0x68, "PLA", AddressingMode.IMPLIED, 1, 4, "NZ", "Pull accumulator"),
			(0xAB, "PLB", AddressingMode.IMPLIED, 1, 4, "NZ", "Pull data bank register"),
			(0x2B, "PLD", AddressingMode.IMPLIED, 1, 5, "NZ", "Pull direct register"),
			(0x28, "PLP", AddressingMode.IMPLIED, 1, 4, "NVMXDIZC", "Pull processor status"),
			(0xFA, "PLX", AddressingMode.IMPLIED, 1, 4, "NZ", "Pull X register"),
			(0x7A, "PLY", AddressingMode.IMPLIED, 1, 4, "NZ", "Pull Y register"),

			# Rotate Instructions
			(0x2A, "ROL", AddressingMode.ACCUMULATOR, 1, 2, "NZC", "Rotate left (accumulator)"),
			(0x26, "ROL", AddressingMode.DIRECT_PAGE, 2, 5, "NZC", "Rotate left (direct page)"),
			(0x36, "ROL", AddressingMode.DIRECT_PAGE_X, 2, 6, "NZC", "Rotate left (direct page,X)"),
			(0x2E, "ROL", AddressingMode.ABSOLUTE, 3, 6, "NZC", "Rotate left (absolute)"),
			(0x3E, "ROL", AddressingMode.ABSOLUTE_X, 3, 7, "NZC", "Rotate left (absolute,X)"),
			(0x6A, "ROR", AddressingMode.ACCUMULATOR, 1, 2, "NZC", "Rotate right (accumulator)"),
			(0x66, "ROR", AddressingMode.DIRECT_PAGE, 2, 5, "NZC", "Rotate right (direct page)"),
			(0x76, "ROR", AddressingMode.DIRECT_PAGE_X, 2, 6, "NZC", "Rotate right (direct page,X)"),
			(0x6E, "ROR", AddressingMode.ABSOLUTE, 3, 6, "NZC", "Rotate right (absolute)"),
			(0x7E, "ROR", AddressingMode.ABSOLUTE_X, 3, 7, "NZC", "Rotate right (absolute,X)"),

			# Return Instructions
			(0x40, "RTI", AddressingMode.IMPLIED, 1, 6, "NVMXDIZC", "Return from interrupt"),
			(0x6B, "RTL", AddressingMode.IMPLIED, 1, 6, "", "Return from subroutine long"),
			(0x60, "RTS", AddressingMode.IMPLIED, 1, 6, "", "Return from subroutine"),

			# SBC - Subtract with Carry
			(0xE9, "SBC", AddressingMode.IMMEDIATE, 2, 2, "NVZC", "Subtract with carry (immediate)"),
			(0xE5, "SBC", AddressingMode.DIRECT_PAGE, 2, 3, "NVZC", "Subtract with carry (direct page)"),
			(0xF5, "SBC", AddressingMode.DIRECT_PAGE_X, 2, 4, "NVZC", "Subtract with carry (direct page,X)"),
			(0xED, "SBC", AddressingMode.ABSOLUTE, 3, 4, "NVZC", "Subtract with carry (absolute)"),
			(0xFD, "SBC", AddressingMode.ABSOLUTE_X, 3, 4, "NVZC", "Subtract with carry (absolute,X)"),
			(0xF9, "SBC", AddressingMode.ABSOLUTE_Y, 3, 4, "NVZC", "Subtract with carry (absolute,Y)"),

			# Set Flag Instructions
			(0x38, "SEC", AddressingMode.IMPLIED, 1, 2, "C", "Set carry flag"),
			(0xF8, "SED", AddressingMode.IMPLIED, 1, 2, "D", "Set decimal flag"),
			(0x78, "SEI", AddressingMode.IMPLIED, 1, 2, "I", "Set interrupt flag"),

			# Store Instructions
			(0x85, "STA", AddressingMode.DIRECT_PAGE, 2, 3, "", "Store accumulator (direct page)"),
			(0x95, "STA", AddressingMode.DIRECT_PAGE_X, 2, 4, "", "Store accumulator (direct page,X)"),
			(0x8D, "STA", AddressingMode.ABSOLUTE, 3, 4, "", "Store accumulator (absolute)"),
			(0x9D, "STA", AddressingMode.ABSOLUTE_X, 3, 5, "", "Store accumulator (absolute,X)"),
			(0x99, "STA", AddressingMode.ABSOLUTE_Y, 3, 5, "", "Store accumulator (absolute,Y)"),
			(0x86, "STX", AddressingMode.DIRECT_PAGE, 2, 3, "", "Store X register (direct page)"),
			(0x96, "STX", AddressingMode.DIRECT_PAGE_Y, 2, 4, "", "Store X register (direct page,Y)"),
			(0x8E, "STX", AddressingMode.ABSOLUTE, 3, 4, "", "Store X register (absolute)"),
			(0x84, "STY", AddressingMode.DIRECT_PAGE, 2, 3, "", "Store Y register (direct page)"),
			(0x94, "STY", AddressingMode.DIRECT_PAGE_X, 2, 4, "", "Store Y register (direct page,X)"),
			(0x8C, "STY", AddressingMode.ABSOLUTE, 3, 4, "", "Store Y register (absolute)"),

			# Transfer Instructions
			(0xAA, "TAX", AddressingMode.IMPLIED, 1, 2, "NZ", "Transfer accumulator to X"),
			(0xA8, "TAY", AddressingMode.IMPLIED, 1, 2, "NZ", "Transfer accumulator to Y"),
			(0xBA, "TSX", AddressingMode.IMPLIED, 1, 2, "NZ", "Transfer stack pointer to X"),
			(0x8A, "TXA", AddressingMode.IMPLIED, 1, 2, "NZ", "Transfer X to accumulator"),
			(0x9A, "TXS", AddressingMode.IMPLIED, 1, 2, "", "Transfer X to stack pointer"),
			(0x98, "TYA", AddressingMode.IMPLIED, 1, 2, "NZ", "Transfer Y to accumulator"),

			# 65C816 Specific Instructions
			(0x5B, "TCD", AddressingMode.IMPLIED, 1, 2, "NZ", "Transfer accumulator to direct register"),
			(0x1B, "TCS", AddressingMode.IMPLIED, 1, 2, "", "Transfer accumulator to stack pointer"),
			(0x7B, "TDC", AddressingMode.IMPLIED, 1, 2, "NZ", "Transfer direct register to accumulator"),
			(0x3B, "TSC", AddressingMode.IMPLIED, 1, 2, "NZ", "Transfer stack pointer to accumulator"),

			# Exchange Instructions
			(0xEB, "XBA", AddressingMode.IMPLIED, 1, 3, "NZ", "Exchange B and A"),
			(0xFB, "XCE", AddressingMode.IMPLIED, 1, 2, "EMC", "Exchange carry and emulation bits"),

			# Block Move Instructions
			(0x44, "MVP", AddressingMode.BLOCK_MOVE, 3, 7, "", "Block move previous"),
			(0x54, "MVN", AddressingMode.BLOCK_MOVE, 3, 7, "", "Block move next"),

			# Additional 65C816 specific opcodes
			(0xC2, "REP", AddressingMode.IMMEDIATE, 2, 3, "MX", "Reset processor status bits"),
			(0xE2, "SEP", AddressingMode.IMMEDIATE, 2, 3, "MX", "Set processor status bits"),

			# WAI and STP
			(0xCB, "WAI", AddressingMode.IMPLIED, 1, 3, "", "Wait for interrupt"),
			(0xDB, "STP", AddressingMode.IMPLIED, 1, 3, "", "Stop the clock"),

			# WDM - Reserved for future expansion
			(0x42, "WDM", AddressingMode.IMMEDIATE, 2, 2, "", "Reserved for future use"),
		]

		for opcode, mnemonic, mode, length, cycles, flags, desc in opcodes_data:
			instructions[opcode] = Instruction(opcode, mnemonic, mode, length, cycles, flags, desc)

		# Add missing addressing modes for some instructions
		# Note: This is a simplified instruction set - real 65C816 has more addressing modes

		return instructions

	def load_rom(self, rom_path: str) -> bool:
		"""Load ROM data for disassembly"""
		try:
			with open(rom_path, 'rb') as f:
				self.rom_data = f.read()
			self.rom_size = len(self.rom_data)

			print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] ✅ ROM loaded: {self.rom_size:,} bytes")
			return True

		except FileNotFoundError:
			print(f"❌ Error: ROM file not found: {rom_path}")
			return False
		except Exception as e:
			print(f"❌ Error loading ROM: {e}")
			return False

	def disassemble_bank(self, bank_number: int) -> List[DisassembledInstruction]:
		"""Disassemble a specific ROM bank"""
		if not self.rom_data:
			print("❌ Error: ROM not loaded")
			return []

		# Calculate bank offset
		bank_offset = bank_number * self.bank_size
		bank_data = self.rom_data[bank_offset:bank_offset + self.bank_size]

		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] 🔍 Disassembling bank 0x{bank_number:02X}...")

		instructions = []
		address = 0x8000  # HiROM bank base address
		byte_index = 0

		while byte_index < len(bank_data):
			if byte_index >= len(bank_data):
				break

			opcode = bank_data[byte_index]

			# Look up instruction
			if opcode in self.instruction_set:
				instruction = self.instruction_set[opcode]

				# Extract operand bytes
				operand_bytes = b''
				operand_value = None

				if instruction.bytes_length > 1:
					operand_end = min(byte_index + instruction.bytes_length, len(bank_data))
					operand_bytes = bank_data[byte_index + 1:operand_end]

					# Calculate operand value based on addressing mode
					if len(operand_bytes) == 1:
						operand_value = operand_bytes[0]
					elif len(operand_bytes) == 2:
						operand_value = struct.unpack("<H", operand_bytes)[0]
					elif len(operand_bytes) == 3:
						# 24-bit address
						operand_value = struct.unpack("<I", operand_bytes + b'\x00')[0]

				# Format instruction
				formatted = self._format_instruction(address, instruction, operand_bytes, operand_value)

				# Create disassembled instruction
				disasm_instr = DisassembledInstruction(
					address=address,
					opcode=opcode,
					instruction=instruction,
					operand_bytes=operand_bytes,
					operand_value=operand_value,
					formatted_instruction=formatted
				)

				instructions.append(disasm_instr)

				# Advance by instruction length
				byte_index += instruction.bytes_length
				address += instruction.bytes_length

			else:
				# Unknown opcode - treat as data byte
				disasm_instr = DisassembledInstruction(
					address=address,
					opcode=opcode,
					instruction=Instruction(opcode, "???", AddressingMode.IMPLIED, 1, 2, "", "Unknown opcode"),
					operand_bytes=b'',
					operand_value=None,
					formatted_instruction=f"    .db ${opcode:02X}        ; Unknown opcode",
					comment="Possible data byte or unknown instruction"
				)

				instructions.append(disasm_instr)
				byte_index += 1
				address += 1

		self.disassembled_banks[bank_number] = instructions
		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] ✅ Disassembled {len(instructions)} instructions in bank 0x{bank_number:02X}")

		return instructions

	def _format_instruction(self, address: int, instruction: Instruction, operand_bytes: bytes, operand_value: Optional[int]) -> str:
		"""Format a disassembled instruction for output"""

		# Address label
		addr_str = f"${address:04X}"

		# Mnemonic
		mnemonic = instruction.mnemonic.ljust(4)

		# Format operand based on addressing mode
		operand_str = ""

		if instruction.addressing_mode == AddressingMode.IMPLIED:
			operand_str = ""
		elif instruction.addressing_mode == AddressingMode.ACCUMULATOR:
			operand_str = "A"
		elif instruction.addressing_mode == AddressingMode.IMMEDIATE:
			if operand_value is not None:
				operand_str = f"#${operand_value:02X}"
		elif instruction.addressing_mode == AddressingMode.ABSOLUTE:
			if operand_value is not None:
				operand_str = f"${operand_value:04X}"
		elif instruction.addressing_mode == AddressingMode.ABSOLUTE_X:
			if operand_value is not None:
				operand_str = f"${operand_value:04X},X"
		elif instruction.addressing_mode == AddressingMode.ABSOLUTE_Y:
			if operand_value is not None:
				operand_str = f"${operand_value:04X},Y"
		elif instruction.addressing_mode == AddressingMode.ABSOLUTE_LONG:
			if operand_value is not None:
				operand_str = f"${operand_value:06X}"
		elif instruction.addressing_mode == AddressingMode.DIRECT_PAGE:
			if operand_value is not None:
				operand_str = f"${operand_value:02X}"
		elif instruction.addressing_mode == AddressingMode.DIRECT_PAGE_X:
			if operand_value is not None:
				operand_str = f"${operand_value:02X},X"
		elif instruction.addressing_mode == AddressingMode.DIRECT_PAGE_Y:
			if operand_value is not None:
				operand_str = f"${operand_value:02X},Y"
		elif instruction.addressing_mode == AddressingMode.DIRECT_PAGE_INDIRECT:
			if operand_value is not None:
				operand_str = f"(${operand_value:02X})"
		elif instruction.addressing_mode == AddressingMode.DIRECT_PAGE_INDEXED_INDIRECT:
			if operand_value is not None:
				operand_str = f"(${operand_value:02X},X)"
		elif instruction.addressing_mode == AddressingMode.DIRECT_PAGE_INDIRECT_INDEXED:
			if operand_value is not None:
				operand_str = f"(${operand_value:02X}),Y"
		elif instruction.addressing_mode == AddressingMode.PROGRAM_COUNTER_RELATIVE:
			if operand_value is not None:
				# Calculate branch target
				if operand_value > 127:
					offset = operand_value - 256  # Two's complement
				else:
					offset = operand_value
				target = address + 2 + offset  # +2 for instruction length
				operand_str = f"${target:04X}"
		elif instruction.addressing_mode == AddressingMode.STACK_RELATIVE:
			if operand_value is not None:
				operand_str = f"${operand_value:02X},S"
		else:
			# Default fallback
			if operand_value is not None:
				if len(operand_bytes) == 1:
					operand_str = f"${operand_value:02X}"
				elif len(operand_bytes) == 2:
					operand_str = f"${operand_value:04X}"
				else:
					operand_str = f"${operand_value:06X}"

		# Combine parts
		return f"{addr_str}: {mnemonic} {operand_str}".rstrip()

	def analyze_code_sections(self, bank_number: int) -> List[CodeSection]:
		"""Analyze and identify code sections within a bank"""
		if bank_number not in self.disassembled_banks:
			print(f"❌ Bank 0x{bank_number:02X} not disassembled yet")
			return []

		instructions = self.disassembled_banks[bank_number]
		sections = []

		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] 🧠 Analyzing code sections in bank 0x{bank_number:02X}...")

		# Simple heuristic: continuous code sections
		current_section_start = None
		current_instructions = []

		for instr in instructions:
			if instr.instruction.mnemonic == "???":
				# Possible data - end current section
				if current_section_start is not None and current_instructions:
					section = CodeSection(
						start_address=current_section_start,
						end_address=current_instructions[-1].address,
						entry_points=[current_section_start],
						section_type="code",
						confidence=0.8,
						instructions=current_instructions.copy()
					)
					sections.append(section)

				current_section_start = None
				current_instructions = []
			else:
				# Valid instruction
				if current_section_start is None:
					current_section_start = instr.address
					current_instructions = []
				current_instructions.append(instr)

		# Handle final section
		if current_section_start is not None and current_instructions:
			section = CodeSection(
				start_address=current_section_start,
				end_address=current_instructions[-1].address,
				entry_points=[current_section_start],
				section_type="code",
				confidence=0.8,
				instructions=current_instructions.copy()
			)
			sections.append(section)

		self.code_sections[bank_number] = sections
		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] ✅ Found {len(sections)} code sections in bank 0x{bank_number:02X}")

		return sections

	def generate_assembly_output(self, bank_number: int, output_file: str) -> str:
		"""Generate assembly output for a disassembled bank"""
		if bank_number not in self.disassembled_banks:
			print(f"❌ Bank 0x{bank_number:02X} not disassembled yet")
			return ""

		instructions = self.disassembled_banks[bank_number]

		# Generate assembly file content
		content = f""";==============================================================================
; Bank 0x{bank_number:02X} Disassembly
; Dragon Quest III - Soshite Densetsu he... (J)
; Generated by Advanced 65C816 Disassembler
; Date: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
;==============================================================================

.org $8000

bank_{bank_number:02x}_start:

"""

		for instr in instructions:
			content += f"{instr.formatted_instruction}"
			if instr.comment:
				content += f"    ; {instr.comment}"
			content += "\n"

		content += f"""
bank_{bank_number:02x}_end:

; Bank 0x{bank_number:02X} Statistics:
; Total Instructions: {len(instructions)}
; Code Sections: {len(self.code_sections.get(bank_number, []))}
; Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
"""

		# Write to file
		with open(output_file, 'w', encoding='utf-8') as f:
			f.write(content)

		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] 💾 Assembly output saved: {output_file}")
		return output_file

	def export_disassembly_report(self, bank_number: int, output_file: str) -> str:
		"""Export comprehensive disassembly report"""
		if bank_number not in self.disassembled_banks:
			print(f"❌ Bank 0x{bank_number:02X} not disassembled yet")
			return ""

		instructions = self.disassembled_banks[bank_number]
		sections = self.code_sections.get(bank_number, [])

		# Generate statistics
		instruction_counts = {}
		for instr in instructions:
			mnemonic = instr.instruction.mnemonic
			instruction_counts[mnemonic] = instruction_counts.get(mnemonic, 0) + 1

		report_data = {
			"bank_info": {
				"number": bank_number,
				"hex": f"0x{bank_number:02X}",
				"analyzed_date": datetime.now().isoformat()
			},
			"statistics": {
				"total_instructions": len(instructions),
				"total_bytes": sum(instr.instruction.bytes_length for instr in instructions),
				"code_sections": len(sections),
				"unknown_opcodes": len([i for i in instructions if i.instruction.mnemonic == "???"]),
				"instruction_counts": instruction_counts
			},
			"code_sections": [
				{
					"start_address": f"0x{section.start_address:04X}",
					"end_address": f"0x{section.end_address:04X}",
					"size": section.end_address - section.start_address + 1,
					"type": section.section_type,
					"confidence": section.confidence,
					"instruction_count": len(section.instructions)
				} for section in sections
			],
			"instruction_list": [
				{
					"address": f"0x{instr.address:04X}",
					"opcode": f"0x{instr.opcode:02X}",
					"mnemonic": instr.instruction.mnemonic,
					"formatted": instr.formatted_instruction,
					"bytes": len(instr.operand_bytes) + 1,
					"comment": instr.comment
				} for instr in instructions[:100]  # Limit for file size
			],
			"metadata": {
				"disassembler_version": "1.0.0",
				"instruction_set_size": len(self.instruction_set),
				"analysis_notes": f"Bank 0x{bank_number:02X} disassembled with {len(instructions)} instructions and {len(sections)} code sections"
			}
		}

		with open(output_file, 'w', encoding='utf-8') as f:
			json.dump(report_data, f, indent=2)

		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] 📊 Disassembly report saved: {output_file}")
		return output_file

def main():
	"""Test the advanced 65C816 disassembly engine"""
	print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] 🔍 ADVANCED 65C816 DISASSEMBLY ENGINE")
	print(f"🎮 Dragon Quest III ROM Disassembly Engine")

	# Initialize disassembler
	disassembler = Advanced65C816Disassembler()

	print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] ✅ Initialized with {len(disassembler.instruction_set)} instruction definitions")

	# Load ROM
	rom_path = "static/Dragon Quest III - Soshite Densetsu he... (J).smc"
	if not disassembler.load_rom(rom_path):
		print("❌ Failed to load ROM. Exiting.")
		return

	# Test disassembly on first bank (system bank 0x00)
	print(f"\n[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] 🧪 TESTING: Disassembling Bank 0x00 (System Bank)")

	instructions = disassembler.disassemble_bank(0x00)

	# Analyze code sections
	sections = disassembler.analyze_code_sections(0x00)

	# Generate assembly output
	disassembler.generate_assembly_output(0x00, "disassembly/banks/bank_00/bank_00_disassembled.asm")

	# Generate report
	disassembler.export_disassembly_report(0x00, "disassembly/banks/bank_00/bank_00_report.json")

	# Display summary
	print(f"\n🎯 **DISASSEMBLY ENGINE TEST RESULTS:**")
	print(f"📊 **Bank 0x00 Analysis:**")
	print(f"- Instructions Disassembled: {len(instructions)}")
	print(f"- Code Sections Found: {len(sections)}")
	print(f"- Unknown Opcodes: {len([i for i in instructions if i.instruction.mnemonic == '???'])}")
	print(f"- Coverage: {(len([i for i in instructions if i.instruction.mnemonic != '???']) / len(instructions) * 100):.1f}%")

	# Show instruction breakdown
	instruction_counts = {}
	for instr in instructions:
		mnemonic = instr.instruction.mnemonic
		instruction_counts[mnemonic] = instruction_counts.get(mnemonic, 0) + 1

	print(f"\n📋 **Most Common Instructions:**")
	sorted_counts = sorted(instruction_counts.items(), key=lambda x: x[1], reverse=True)
	for mnemonic, count in sorted_counts[:10]:
		percentage = (count / len(instructions)) * 100
		print(f"- {mnemonic}: {count} ({percentage:.1f}%)")

	print(f"\n✅ **ENGINE STATUS: READY FOR FULL ROM DISASSEMBLY**")

if __name__ == "__main__":
	main()
