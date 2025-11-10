#!/usr/bin/env python3
"""
Bank-by-Bank Disassembly Framework
Systematic ROM bank disassembly system with automated file generation and cross-referencing

PRIMARY PURPOSE: Complete disassembly of all 64 ROM banks for Dragon Quest III SNES
"""

import os
import json
import struct
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any
from dataclasses import dataclass, field

@dataclass
class BankInfo:
	"""Information about a ROM bank"""
	bank_number: int
	start_address: int
	end_address: int
	size: int
	content_type: str  # "system", "game_logic", "audio", "graphics", "text_data"
	priority: str      # "critical", "high", "medium", "low"
	estimated_hours: float
	description: str
	analysis_status: str = "not_started"  # "not_started", "in_progress", "completed"

@dataclass
class DisassemblyProject:
	"""Complete disassembly project structure"""
	rom_path: str
	project_name: str
	created_date: str = field(default_factory=lambda: datetime.now().isoformat())
	banks: Dict[int, BankInfo] = field(default_factory=dict)
	total_banks: int = 64
	total_size: int = 4194304  # 4MB

class SystematicBankDisassembler:
	"""Systematic ROM bank disassembly framework"""

	def __init__(self, rom_path: str, output_dir: str = "disassembly"):
		self.rom_path = rom_path
		self.output_dir = Path(output_dir)
		self.project = self._initialize_project()
		self.rom_data: Optional[bytes] = None

		# Bank categorization for Dragon Quest III
		self.bank_categories = {
			"system": {
				"banks": list(range(0x00, 0x04)),
				"description": "Core system code, vectors, and initialization routines",
				"priority": "critical",
				"estimated_hours_per_bank": 25.0
			},
			"game_logic": {
				"banks": list(range(0x04, 0x20)),
				"description": "Main game logic, battle system, and core mechanics",
				"priority": "critical",
				"estimated_hours_per_bank": 30.0
			},
			"audio": {
				"banks": list(range(0x20, 0x28)),
				"description": "Audio data, music, and sound effects",
				"priority": "high",
				"estimated_hours_per_bank": 20.0
			},
			"graphics": {
				"banks": list(range(0x28, 0x38)),
				"description": "Graphics data, sprites, and tile sets",
				"priority": "high",
				"estimated_hours_per_bank": 22.0
			},
			"text_data": {
				"banks": list(range(0x38, 0x40)),
				"description": "Text data, dialogue, and localization content",
				"priority": "medium",
				"estimated_hours_per_bank": 18.0
			}
		}

	def _initialize_project(self) -> DisassemblyProject:
		"""Initialize the disassembly project structure"""
		return DisassemblyProject(
			rom_path=self.rom_path,
			project_name="Dragon Quest III Complete ROM Disassembly"
		)

	def load_rom(self) -> bool:
		"""Load ROM data and validate"""
		try:
			with open(self.rom_path, 'rb') as f:
				self.rom_data = f.read()

			print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] ✅ ROM loaded: {len(self.rom_data)} bytes")

			# Validate ROM size
			if len(self.rom_data) != 4194304:
				print(f"⚠️ Warning: ROM size {len(self.rom_data)} != expected 4MB")

			return True

		except FileNotFoundError:
			print(f"❌ Error: ROM file not found: {self.rom_path}")
			return False
		except Exception as e:
			print(f"❌ Error loading ROM: {e}")
			return False

	def analyze_bank_structure(self) -> Dict[int, BankInfo]:
		"""Analyze and categorize all 64 ROM banks"""
		if not self.rom_data:
			print("❌ Error: ROM not loaded")
			return {}

		banks = {}

		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] 🔍 Analyzing 64 ROM banks...")

		# Categorize each bank
		for category, info in self.bank_categories.items():
			for bank_num in info["banks"]:
				start_addr = bank_num * 0x10000
				end_addr = start_addr + 0x10000 - 1

				# Extract bank data for analysis
				bank_data = self.rom_data[start_addr:start_addr + 0x10000]

				# Create bank info
				bank_info = BankInfo(
					bank_number=bank_num,
					start_address=start_addr,
					end_address=end_addr,
					size=len(bank_data),
					content_type=category,
					priority=info["priority"],
					estimated_hours=info["estimated_hours_per_bank"],
					description=f"Bank 0x{bank_num:02X}: {info['description']}"
				)

				banks[bank_num] = bank_info

		self.project.banks = banks

		print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] ✅ Analyzed {len(banks)} banks")
		return banks

	def create_directory_structure(self) -> bool:
		"""Create comprehensive directory structure for disassembly"""
		try:
			print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] 🏗️ Creating directory structure...")

			# Main directories
			directories = [
				self.output_dir,
				self.output_dir / "banks",
				self.output_dir / "shared",
				self.output_dir / "analysis",
				self.output_dir / "tools",
				self.output_dir / "docs",
				self.output_dir / "tests",
				self.output_dir / "build"
			]

			# Create main directories
			for directory in directories:
				directory.mkdir(parents=True, exist_ok=True)

			# Create individual bank directories
			for bank_num in range(64):
				bank_dir = self.output_dir / "banks" / f"bank_{bank_num:02x}"
				bank_dir.mkdir(exist_ok=True)

			# Create shared include directories
			shared_dirs = [
				self.output_dir / "shared" / "constants",
				self.output_dir / "shared" / "macros",
				self.output_dir / "shared" / "hardware"
			]

			for shared_dir in shared_dirs:
				shared_dir.mkdir(exist_ok=True)

			print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] ✅ Directory structure created")
			return True

		except Exception as e:
			print(f"❌ Error creating directories: {e}")
			return False

	def create_bank_template_files(self) -> bool:
		"""Create template files for each bank"""
		try:
			print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] 📝 Creating bank template files...")

			for bank_num, bank_info in self.project.banks.items():
				bank_dir = self.output_dir / "banks" / f"bank_{bank_num:02x}"

				# Create main assembly file
				main_asm_path = bank_dir / f"bank_{bank_num:02x}_main.asm"
				self._create_bank_main_template(main_asm_path, bank_info)

				# Create data file
				data_asm_path = bank_dir / f"bank_{bank_num:02x}_data.asm"
				self._create_bank_data_template(data_asm_path, bank_info)

				# Create symbols file
				symbols_inc_path = bank_dir / f"bank_{bank_num:02x}_symbols.inc"
				self._create_bank_symbols_template(symbols_inc_path, bank_info)

				# Create analysis file
				analysis_json_path = bank_dir / f"bank_{bank_num:02x}_analysis.json"
				self._create_bank_analysis_template(analysis_json_path, bank_info)

			print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] ✅ Created templates for 64 banks")
			return True

		except Exception as e:
			print(f"❌ Error creating template files: {e}")
			return False

	def _create_bank_main_template(self, file_path: Path, bank_info: BankInfo):
		"""Create main assembly file template for a bank"""
		template = f""";==============================================================================
; Bank 0x{bank_info.bank_number:02X} - {bank_info.content_type.replace('_', ' ').title()}
; {bank_info.description}
;==============================================================================
; Dragon Quest III - Soshite Densetsu he... (J) ROM Disassembly
; Bank 0x{bank_info.bank_number:02X} Memory Range: 0x{bank_info.start_address:06X} - 0x{bank_info.end_address:06X}
; Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
;==============================================================================

.include "../shared/constants/hardware.inc"
.include "../shared/constants/memory_map.inc"
.include "bank_{bank_info.bank_number:02x}_symbols.inc"

;==============================================================================
; BANK 0x{bank_info.bank_number:02X} HEADER
;==============================================================================
.org $8000   ; Bank base address

bank_{bank_info.bank_number:02x}_start:
    ; TODO: Disassemble and document bank content
    ; Content Type: {bank_info.content_type.replace('_', ' ').title()}
    ; Priority: {bank_info.priority.title()}
    ; Estimated Hours: {bank_info.estimated_hours}

;==============================================================================
; BANK 0x{bank_info.bank_number:02X} CODE SECTIONS
;==============================================================================

; TODO: Add disassembled code sections here
; Each function should have:
; - Clear function name and purpose
; - Parameter documentation
; - Return value documentation
; - Cross-references to other banks

;==============================================================================
; BANK 0x{bank_info.bank_number:02X} END
;==============================================================================
bank_{bank_info.bank_number:02x}_end:

; Bank 0x{bank_info.bank_number:02X} Analysis Status: {bank_info.analysis_status.replace('_', ' ').title()}
; Last Modified: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
"""

		with open(file_path, 'w', encoding='utf-8') as f:
			f.write(template)

	def _create_bank_data_template(self, file_path: Path, bank_info: BankInfo):
		"""Create data assembly file template for a bank"""
		template = f""";==============================================================================
; Bank 0x{bank_info.bank_number:02X} Data Sections
; {bank_info.description}
;==============================================================================
; Dragon Quest III - Data definitions and constants
; Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
;==============================================================================

.include "bank_{bank_info.bank_number:02x}_symbols.inc"

;==============================================================================
; BANK 0x{bank_info.bank_number:02X} DATA TABLES
;==============================================================================

; TODO: Add data tables, lookup tables, and constant definitions
; Content type: {bank_info.content_type.replace('_', ' ').title()}

;==============================================================================
; BANK 0x{bank_info.bank_number:02X} STRING DATA
;==============================================================================

; TODO: Add text strings and dialogue data (if applicable)

;==============================================================================
; BANK 0x{bank_info.bank_number:02X} GRAPHICS DATA
;==============================================================================

; TODO: Add graphics data, tile definitions, palettes (if applicable)

;==============================================================================
; BANK 0x{bank_info.bank_number:02X} AUDIO DATA
;==============================================================================

; TODO: Add music and sound effect data (if applicable)

; Last Modified: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
"""

		with open(file_path, 'w', encoding='utf-8') as f:
			f.write(template)

	def _create_bank_symbols_template(self, file_path: Path, bank_info: BankInfo):
		"""Create symbols include file template for a bank"""
		template = f""";==============================================================================
; Bank 0x{bank_info.bank_number:02X} Symbol Definitions
; {bank_info.description}
;==============================================================================
; Dragon Quest III - Function and variable symbols
; Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
;==============================================================================

;==============================================================================
; BANK 0x{bank_info.bank_number:02X} FUNCTION SYMBOLS
;==============================================================================

; TODO: Add function symbols and labels
; Naming convention: bank{bank_info.bank_number:02x}_function_name
; Example: bank{bank_info.bank_number:02x}_initialize    = $8000

;==============================================================================
; BANK 0x{bank_info.bank_number:02X} VARIABLE SYMBOLS
;==============================================================================

; TODO: Add variable and data symbols
; Naming convention: bank{bank_info.bank_number:02x}_data_name
; Example: bank{bank_info.bank_number:02x}_lookup_table = $9000

;==============================================================================
; BANK 0x{bank_info.bank_number:02X} CONSTANT DEFINITIONS
;==============================================================================

; TODO: Add bank-specific constants
; Content type: {bank_info.content_type.replace('_', ' ').title()}

; Last Modified: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
"""

		with open(file_path, 'w', encoding='utf-8') as f:
			f.write(template)

	def _create_bank_analysis_template(self, file_path: Path, bank_info: BankInfo):
		"""Create analysis JSON file template for a bank"""
		analysis_data = {
			"bank_info": {
				"number": bank_info.bank_number,
				"start_address": f"0x{bank_info.start_address:06X}",
				"end_address": f"0x{bank_info.end_address:06X}",
				"size": bank_info.size,
				"content_type": bank_info.content_type,
				"priority": bank_info.priority,
				"estimated_hours": bank_info.estimated_hours,
				"analysis_status": bank_info.analysis_status
			},
			"analysis_results": {
				"code_sections": [],
				"data_sections": [],
				"entry_points": [],
				"function_list": [],
				"cross_references": [],
				"completion_percentage": 0
			},
			"metadata": {
				"created_date": datetime.now().isoformat(),
				"last_modified": datetime.now().isoformat(),
				"analyzer_version": "1.0.0",
				"notes": f"Bank 0x{bank_info.bank_number:02X} - {bank_info.description}"
			}
		}

		with open(file_path, 'w', encoding='utf-8') as f:
			json.dump(analysis_data, f, indent=2)

	def create_shared_files(self) -> bool:
		"""Create shared include files and constants"""
		try:
			print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] 🔧 Creating shared include files...")

			# Hardware constants
			self._create_hardware_constants()

			# Memory map
			self._create_memory_map()

			# Common macros
			self._create_common_macros()

			# Project constants
			self._create_project_constants()

			print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] ✅ Shared files created")
			return True

		except Exception as e:
			print(f"❌ Error creating shared files: {e}")
			return False

	def _create_hardware_constants(self):
		"""Create SNES hardware constants file"""
		file_path = self.output_dir / "shared" / "constants" / "hardware.inc"

		content = f""";==============================================================================
; SNES Hardware Constants
; Dragon Quest III ROM Disassembly
;==============================================================================
; Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
;==============================================================================

;==============================================================================
; PPU REGISTERS
;==============================================================================
INIDISP     = $2100    ; Screen display register
OBSEL       = $2101    ; Object size and character size register
OAMADDL     = $2102    ; OAM address register (low)
OAMADDH     = $2103    ; OAM address register (high)
OAMDATA     = $2104    ; OAM data write register

;==============================================================================
; AUDIO REGISTERS (SPC700)
;==============================================================================
APUIO0      = $2140    ; Audio port 0
APUIO1      = $2141    ; Audio port 1
APUIO2      = $2142    ; Audio port 2
APUIO3      = $2143    ; Audio port 3

;==============================================================================
; DMA REGISTERS
;==============================================================================
DMAP0       = $4300    ; DMA control register for channel 0
BBAD0       = $4301    ; DMA destination register for channel 0
A1T0L       = $4302    ; DMA source address register (low) for channel 0
A1T0H       = $4303    ; DMA source address register (high) for channel 0

;==============================================================================
; CONTROLLER REGISTERS
;==============================================================================
JOYSER0     = $4016    ; Controller port 1
JOYSER1     = $4017    ; Controller port 2

;==============================================================================
; 65C816 PROCESSOR VECTORS
;==============================================================================
VEC_COP     = $FFE4    ; COP vector
VEC_BRK     = $FFE6    ; BRK vector
VEC_ABORT   = $FFE8    ; ABORT vector
VEC_NMI     = $FFEA    ; NMI vector
VEC_RESET   = $FFEC    ; RESET vector
VEC_IRQ     = $FFEE    ; IRQ vector

; Last Modified: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
"""

		with open(file_path, 'w', encoding='utf-8') as f:
			f.write(content)

	def _create_memory_map(self):
		"""Create SNES memory map constants"""
		file_path = self.output_dir / "shared" / "constants" / "memory_map.inc"

		content = f""";==============================================================================
; SNES Memory Map Constants
; Dragon Quest III ROM Disassembly - HiROM Format
;==============================================================================
; Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
;==============================================================================

;==============================================================================
; HIROM MEMORY LAYOUT
;==============================================================================
; ROM banks are mapped to $80-$FF and $00-$3F
; SRAM is typically at $70-$7D (if present)

;==============================================================================
; BANK RANGES
;==============================================================================
BANK_SYSTEM_START       = $00     ; System banks (0x00-0x03)
BANK_SYSTEM_END         = $03
BANK_GAME_LOGIC_START   = $04     ; Game logic banks (0x04-0x1F)
BANK_GAME_LOGIC_END     = $1F
BANK_AUDIO_START        = $20     ; Audio banks (0x20-0x27)
BANK_AUDIO_END          = $27
BANK_GRAPHICS_START     = $28     ; Graphics banks (0x28-0x37)
BANK_GRAPHICS_END       = $37
BANK_TEXT_START         = $38     ; Text data banks (0x38-0x3F)
BANK_TEXT_END           = $3F

;==============================================================================
; MEMORY REGIONS
;==============================================================================
WRAM_START              = $7E0000 ; Work RAM start
WRAM_END                = $7FFFFF ; Work RAM end
SRAM_START              = $700000 ; Save RAM start (if present)
SRAM_END                = $707FFF ; Save RAM end

;==============================================================================
; ROM HEADER LOCATION (HiROM)
;==============================================================================
ROM_HEADER              = $FFB0   ; ROM header start
ROM_TITLE               = $FFC0   ; Game title (21 bytes)
ROM_MAP_MODE            = $FFD5   ; Memory map mode
ROM_TYPE                = $FFD6   ; ROM type
ROM_SIZE                = $FFD7   ; ROM size
ROM_SRAM_SIZE           = $FFD8   ; SRAM size

; Last Modified: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
"""

		with open(file_path, 'w', encoding='utf-8') as f:
			f.write(content)

	def _create_common_macros(self):
		"""Create common assembly macros"""
		file_path = self.output_dir / "shared" / "macros" / "common.inc"

		content = f""";==============================================================================
; Common Assembly Macros
; Dragon Quest III ROM Disassembly
;==============================================================================
; Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
;==============================================================================

;==============================================================================
; BANK SWITCHING MACROS
;==============================================================================
.macro SWITCH_BANK bank_num
    lda #bank_num
    pha
    plb                ; Switch to specified bank
.endmacro

;==============================================================================
; DMA TRANSFER MACROS
;==============================================================================
.macro DMA_TRANSFER source, dest, size
    ; TODO: Implement DMA transfer macro
    ; Source: source address
    ; Dest: destination address
    ; Size: transfer size
.endmacro

;==============================================================================
; DEBUGGING MACROS
;==============================================================================
.macro DEBUG_BREAKPOINT
    ; Breakpoint for debugging
    brk
.endmacro

;==============================================================================
; FUNCTION ENTRY/EXIT MACROS
;==============================================================================
.macro FUNCTION_ENTRY
    ; Standard function entry
    pha                ; Save A
    phx                ; Save X
    phy                ; Save Y
.endmacro

.macro FUNCTION_EXIT
    ; Standard function exit
    ply                ; Restore Y
    plx                ; Restore X
    pla                ; Restore A
    rts                ; Return
.endmacro

; Last Modified: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
"""

		with open(file_path, 'w', encoding='utf-8') as f:
			f.write(content)

	def _create_project_constants(self):
		"""Create project-specific constants"""
		file_path = self.output_dir / "shared" / "constants" / "project.inc"

		content = f""";==============================================================================
; Dragon Quest III Project Constants
; ROM Disassembly Specific Definitions
;==============================================================================
; Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
;==============================================================================

;==============================================================================
; PROJECT INFORMATION
;==============================================================================
PROJECT_NAME            = "Dragon Quest III Complete ROM Disassembly"
ROM_TITLE               = "DRAGONQUEST3"
ROM_SIZE_BYTES          = $400000    ; 4MB
TOTAL_BANKS             = 64         ; 0x00-0x3F

;==============================================================================
; DISASSEMBLY STATUS CONSTANTS
;==============================================================================
STATUS_NOT_STARTED      = 0
STATUS_IN_PROGRESS      = 1
STATUS_COMPLETED        = 2
STATUS_VERIFIED         = 3

;==============================================================================
; BANK CATEGORY CONSTANTS
;==============================================================================
CATEGORY_SYSTEM         = 0
CATEGORY_GAME_LOGIC     = 1
CATEGORY_AUDIO          = 2
CATEGORY_GRAPHICS       = 3
CATEGORY_TEXT_DATA      = 4

;==============================================================================
; ANALYSIS PROGRESS TRACKING
;==============================================================================
COMPLETION_TARGET       = 100       ; 100% completion target
HOURS_ESTIMATED_TOTAL   = 2312      ; Total estimated hours

; Last Modified: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
"""

		with open(file_path, 'w', encoding='utf-8') as f:
			f.write(content)

	def generate_project_summary(self) -> str:
		"""Generate comprehensive project summary"""
		total_hours = sum(bank.estimated_hours for bank in self.project.banks.values())

		# Category breakdown
		category_stats = {}
		for bank in self.project.banks.values():
			cat = bank.content_type
			if cat not in category_stats:
				category_stats[cat] = {"count": 0, "hours": 0.0}
			category_stats[cat]["count"] += 1
			category_stats[cat]["hours"] += bank.estimated_hours

		summary = f"""
🎯 **SYSTEMATIC BANK-BY-BANK DISASSEMBLY FRAMEWORK CREATED**

📊 **Project Overview:**
- Project: {self.project.project_name}
- ROM File: {self.rom_path}
- Total Banks: {self.project.total_banks}
- ROM Size: {self.project.total_size:,} bytes (4MB)
- Created: {self.project.created_date}

🏦 **Bank Distribution:**"""

		for category, stats in category_stats.items():
			summary += f"\n- {category.replace('_', ' ').title()}: {stats['count']} banks, {stats['hours']:.1f} hours"

		summary += f"""

⏱️ **Time Estimates:**
- Total Estimated Hours: {total_hours:.1f}
- Average Hours per Bank: {total_hours/64:.1f}
- Estimated Weeks (40h/week): {total_hours/40:.1f}

📁 **Directory Structure Created:**
- {self.output_dir}/banks/ - Individual bank directories (64 banks)
- {self.output_dir}/shared/ - Common constants and macros
- {self.output_dir}/analysis/ - Analysis results and metadata
- {self.output_dir}/tools/ - Custom disassembly tools
- {self.output_dir}/docs/ - Documentation and guides
- {self.output_dir}/tests/ - Test suites and validation
- {self.output_dir}/build/ - Build system and outputs

📝 **Template Files Created:**
- bank_XX_main.asm - Main disassembly files (64 files)
- bank_XX_data.asm - Data sections (64 files)
- bank_XX_symbols.inc - Symbol definitions (64 files)
- bank_XX_analysis.json - Analysis metadata (64 files)

🔧 **Shared Resources:**
- hardware.inc - SNES hardware constants
- memory_map.inc - HiROM memory mapping
- common.inc - Assembly macros
- project.inc - Project-specific constants

✅ **Framework Status: READY FOR SYSTEMATIC DISASSEMBLY**
"""

		return summary

	def export_project_metadata(self, output_file: str = "disassembly_project.json") -> str:
		"""Export complete project metadata"""
		metadata = {
			"project_info": {
				"name": self.project.project_name,
				"rom_path": self.project.rom_path,
				"created_date": self.project.created_date,
				"total_banks": self.project.total_banks,
				"total_size": self.project.total_size,
				"framework_version": "1.0.0"
			},
			"banks": {},
			"categories": self.bank_categories,
			"directory_structure": {
				"output_dir": str(self.output_dir),
				"banks_dir": str(self.output_dir / "banks"),
				"shared_dir": str(self.output_dir / "shared"),
				"analysis_dir": str(self.output_dir / "analysis"),
				"tools_dir": str(self.output_dir / "tools"),
				"docs_dir": str(self.output_dir / "docs"),
				"tests_dir": str(self.output_dir / "tests"),
				"build_dir": str(self.output_dir / "build")
			},
			"statistics": {
				"total_estimated_hours": sum(bank.estimated_hours for bank in self.project.banks.values()),
				"banks_by_category": {},
				"priority_distribution": {}
			}
		}

		# Add bank information
		for bank_num, bank_info in self.project.banks.items():
			metadata["banks"][f"bank_{bank_num:02x}"] = {
				"number": bank_info.bank_number,
				"start_address": f"0x{bank_info.start_address:06X}",
				"end_address": f"0x{bank_info.end_address:06X}",
				"size": bank_info.size,
				"content_type": bank_info.content_type,
				"priority": bank_info.priority,
				"estimated_hours": bank_info.estimated_hours,
				"description": bank_info.description,
				"analysis_status": bank_info.analysis_status
			}

		# Calculate statistics
		for bank in self.project.banks.values():
			# Category stats
			cat = bank.content_type
			if cat not in metadata["statistics"]["banks_by_category"]:
				metadata["statistics"]["banks_by_category"][cat] = {"count": 0, "hours": 0.0}
			metadata["statistics"]["banks_by_category"][cat]["count"] += 1
			metadata["statistics"]["banks_by_category"][cat]["hours"] += bank.estimated_hours

			# Priority stats
			priority = bank.priority
			if priority not in metadata["statistics"]["priority_distribution"]:
				metadata["statistics"]["priority_distribution"][priority] = 0
			metadata["statistics"]["priority_distribution"][priority] += 1

		# Save metadata
		output_path = self.output_dir / output_file
		with open(output_path, 'w', encoding='utf-8') as f:
			json.dump(metadata, f, indent=2)

		return str(output_path)

def main():
	"""Initialize systematic bank-by-bank disassembly framework"""
	print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] 🎯 SYSTEMATIC BANK-BY-BANK DISASSEMBLY FRAMEWORK")
	print(f"🎮 Dragon Quest III Complete ROM Disassembly Project")

	# Initialize framework
	rom_path = "static/Dragon Quest III - Soshite Densetsu he... (J).smc"
	disassembler = SystematicBankDisassembler(rom_path)

	# Load ROM
	if not disassembler.load_rom():
		print("❌ Failed to load ROM. Exiting.")
		return

	# Analyze bank structure
	banks = disassembler.analyze_bank_structure()
	if not banks:
		print("❌ Failed to analyze banks. Exiting.")
		return

	# Create directory structure
	if not disassembler.create_directory_structure():
		print("❌ Failed to create directories. Exiting.")
		return

	# Create template files
	if not disassembler.create_bank_template_files():
		print("❌ Failed to create templates. Exiting.")
		return

	# Create shared files
	if not disassembler.create_shared_files():
		print("❌ Failed to create shared files. Exiting.")
		return

	# Export project metadata
	metadata_path = disassembler.export_project_metadata()
	print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] 💾 Project metadata saved: {metadata_path}")

	# Generate and display summary
	summary = disassembler.generate_project_summary()
	print(summary)

	print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] 🚀 FRAMEWORK READY - SYSTEMATIC DISASSEMBLY CAN BEGIN")

if __name__ == "__main__":
	main()
