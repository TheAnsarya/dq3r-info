#!/usr/bin/env python3
"""
Dragon Quest III Code Documentation and Labeling System
Creates properly labeled and documented assembly code with meaningful function names
"""

import re
import os
from collections import defaultdict

class DQ3CodeDocumenter:
    def __init__(self):
        # Function naming patterns based on analysis
        self.system_functions = {
            0xC01098: "CalculateROMPointer",     # Converts bank/offset to ROM address
            0xC08FD7: "DecompressGameData",      # Decompresses graphics/text data
            0xC09052: "HandleSystemError",       # Error handling and recovery
            0xC05F21: "CalculateDataPointer",    # Alternative pointer calculation
            0xC0601F: "ProcessDataPointer",      # Data pointer processing
            0xC067FD: "ProcessDataStream",       # Data stream processing
            0xC90572: "ExecuteEngineCommand",    # Main engine command processor
            0xC903EE: "ProcessEngineFunction",   # Engine subsystem processor
            0xC05DA1: "InitializePointers",      # Pointer initialization
            0xC05E61: "ValidatePointers",        # Pointer validation
            0xC014F2: "ProcessBankSwitch",       # Bank switching operations
            0xC08DA0: "LoadGameData",            # Game data loading
            0xC08E1B: "ValidateGameData",        # Game data validation
            0xC08D3C: "ProcessGameLogic",        # Core game logic processing
            0xC08B9C: "HandleGameEvents",        # Game event handling
            0xC02627: "ManageBattleSystem",      # Battle system management
            0xC08D06: "UpdateGameState",         # Game state updates
            0xC0CBA0: "ProcessMenuSystem",       # Menu system processing
            0xC05668: "HandleFieldLogic",        # Field/overworld logic
            0xC0533E: "ProcessTextSystem",       # Text rendering and processing
        }

        # Memory region purposes
        self.memory_regions = {
            # Game state and temporary storage
            0xE086: "TempXCoordinate",
            0xE088: "TempYCoordinate",
            0xE08A: "TempCalculationResult",
            0xE096: "GameStateFlags",
            0xE09A: "CurrentMenuIndex",
            0xE09C: "PlayerInputState",
            0xE09E: "BattleStateFlags",
            0xE0A0: "FieldStateFlags",
            0xE0B0: "SystemStatusFlags",
            0xE0B6: "DMATransferControl",
            0xE0B8: "DMATransferStatus",

            # Hardware registers
            0x2100: "PPUBrightness",
            0x2101: "PPUOAMConfiguration",
            0x2104: "PPUOAMData",
            0x2132: "PPUColorMath",
            0x4200: "NMITimerEnable",
            0x4202: "MultiplyOperandA",
            0x4203: "MultiplyOperandB",
            0x4216: "MultiplyResult",
            0x420E: "FastROMEnable",
            0x4054: "CustomRegister1",
            0x4056: "CustomRegister2",
            0x4100: "CustomControl1",
            0x4101: "CustomControl2",
            0x4190: "CustomStatus1",
        }

        # Instruction purposes based on context
        self.instruction_purposes = {
            'JSL': "Call external function",
            'JSR': "Call local function",
            'RTL': "Return from external function",
            'RTS': "Return from local function",
            'LDA': "Load value into accumulator",
            'STA': "Store accumulator to memory",
            'LDX': "Load X register",
            'STX': "Store X register",
            'LDY': "Load Y register",
            'STY': "Store Y register",
            'PHA': "Push accumulator to stack",
            'PLA': "Pull accumulator from stack",
            'PHX': "Push X register to stack",
            'PLX': "Pull X register from stack",
            'PHY': "Push Y register to stack",
            'PLY': "Pull Y register from stack",
            'PHP': "Push processor status to stack",
            'PLP': "Pull processor status from stack",
            'PHB': "Push data bank register",
            'PLB': "Pull data bank register",
            'REP': "Clear processor status bits",
            'SEP': "Set processor status bits",
            'CLC': "Clear carry flag",
            'SEC': "Set carry flag",
            'BCC': "Branch if carry clear",
            'BCS': "Branch if carry set",
            'BEQ': "Branch if equal (zero flag set)",
            'BNE': "Branch if not equal (zero flag clear)",
            'ASL': "Arithmetic shift left",
            'XBA': "Exchange accumulator bytes",
            'TXA': "Transfer X to accumulator",
            'TAX': "Transfer accumulator to X",
            'ORA': "Logical OR with accumulator",
            'AND': "Logical AND with accumulator",
            'CMP': "Compare with accumulator",
            'PEA': "Push effective address",
            'BRK': "Software interrupt",
        }

    def analyze_function_purpose(self, function_name, instructions):
        """Determine the purpose of a function based on its instructions"""

        # Check for system initialization patterns
        if any('PHP' in inst and 'REP #$30' in instructions[i+1:i+3] for i, inst in enumerate(instructions[:-2])):
            return "SystemInitialization", "Sets up processor state and initializes system registers"

        # Check for pointer calculation patterns
        if any('JSL $C01098' in inst for inst in instructions):
            return "PointerCalculation", "Calculates ROM pointers for data access"

        # Check for data loading patterns
        if any('JSL $C08FD7' in inst for inst in instructions):
            return "DataLoading", "Loads and decompresses game data from ROM"

        # Check for error handling patterns
        if any('JSL $C09052' in inst for inst in instructions):
            return "ErrorHandling", "Handles system errors and recovery procedures"

        # Check for engine processing patterns
        if any('JSL $C90572' in inst or 'JSL $C903EE' in inst for inst in instructions):
            return "EngineProcessing", "Executes core game engine functionality"

        # Check for graphics operations
        if any(('$21' in inst and ('STA' in inst or 'LDA' in inst)) for inst in instructions):
            return "GraphicsProcessing", "Manages PPU graphics and display operations"

        # Check for input handling
        if any('$4218' in inst or '$4219' in inst for inst in instructions):
            return "InputProcessing", "Processes joypad input and user controls"

        # Check for DMA operations
        if any('$420B' in inst for inst in instructions):
            return "DMATransfer", "Manages DMA transfers for efficient data movement"

        # Check for mathematical operations
        if any('$4202' in inst or '$4203' in inst for inst in instructions):
            return "MathCalculation", "Performs hardware-accelerated mathematical calculations"

        return "GeneralPurpose", "Handles general game logic and utility operations"

    def document_function(self, lines, start_idx):
        """Document a single function with proper labels and comments"""
        documented_lines = []
        function_instructions = []

        # Extract function instructions for analysis
        i = start_idx
        while i < len(lines) and not (lines[i].strip().endswith(':') and 'Function' in lines[i]):
            line = lines[i].strip()
            if line and not line.startswith(';') and not line.startswith('.'):
                function_instructions.append(line)
            i += 1
            if i >= len(lines) or (i > start_idx + 50):  # Limit function size
                break

        # Determine function purpose
        function_type, function_description = self.analyze_function_purpose(lines[start_idx], function_instructions)

        # Generate meaningful function name
        function_num = lines[start_idx].split('_')[-1].replace(':', '')
        meaningful_name = f"{function_type}_{function_num}"

        # Add comprehensive function header
        documented_lines.append(";==============================================================================")
        documented_lines.append(f"; {meaningful_name}")
        documented_lines.append(f"; Purpose: {function_description}")
        documented_lines.append(f"; Type: {function_type}")
        documented_lines.append(f"; Instructions: {len(function_instructions)}")
        documented_lines.append(";==============================================================================")
        documented_lines.append(f"{meaningful_name}:")

        # Document each instruction
        instruction_count = 0
        for i in range(start_idx + 1, min(len(lines), start_idx + 50)):
            line = lines[i].strip()

            # Stop at next function
            if line.endswith(':') and 'Function' in line:
                break

            if not line or line.startswith(';') or line.startswith('.'):
                documented_lines.append(f"    {line}")
                continue

            # Parse instruction
            parts = line.split(';')
            if len(parts) >= 2:
                instruction = parts[0].strip()
                hex_bytes = parts[1].strip()

                # Extract mnemonic
                mnemonic = instruction.split()[0] if instruction else ""

                # Generate meaningful comment
                comment = self.generate_instruction_comment(instruction, instruction_count, function_type)

                documented_lines.append(f"    {instruction:<20} ; {hex_bytes} | {comment}")
                instruction_count += 1
            else:
                documented_lines.append(f"    {line}")

        documented_lines.append("")
        return documented_lines, meaningful_name

    def generate_instruction_comment(self, instruction, position, function_type):
        """Generate meaningful comments for individual instructions"""

        if not instruction:
            return ""

        parts = instruction.split()
        mnemonic = parts[0] if parts else ""
        operand = parts[1] if len(parts) > 1 else ""

        # Context-aware comments based on function type
        if function_type == "SystemInitialization":
            if mnemonic == "PHP":
                return "Save current processor state"
            elif mnemonic == "REP" and "#$30" in operand:
                return "Set 16-bit mode for A, X, Y registers"
            elif mnemonic == "PHA":
                return "Preserve accumulator value"
            elif mnemonic == "PHX":
                return "Preserve X register value"
            elif mnemonic == "PHY":
                return "Preserve Y register value"
            elif mnemonic == "PHB":
                return "Save current data bank"

        elif function_type == "PointerCalculation":
            if mnemonic == "LDA" and operand.startswith("$E0"):
                return f"Load coordinate/offset from {self.memory_regions.get(int(operand[1:], 16), 'work RAM')}"
            elif mnemonic == "JSL" and "$C01098" in operand:
                return "Calculate ROM pointer from bank/offset parameters"
            elif mnemonic == "STA" and operand.startswith("$E0"):
                return f"Store result to {self.memory_regions.get(int(operand[1:], 16), 'work RAM')}"

        elif function_type == "DataLoading":
            if mnemonic == "JSL" and "$C08FD7" in operand:
                return "Load and decompress game data"
            elif mnemonic == "BCC":
                return "Branch if data loading failed"
            elif mnemonic == "ASL":
                return "Multiply address by 2 for word access"

        elif function_type == "GraphicsProcessing":
            if operand.startswith("$21"):
                reg_addr = int(operand[1:], 16)
                reg_name = self.memory_regions.get(reg_addr, f"PPU_${reg_addr:04X}")
                if mnemonic == "STA":
                    return f"Configure {reg_name} graphics register"
                elif mnemonic == "LDA":
                    return f"Read {reg_name} graphics status"

        elif function_type == "EngineProcessing":
            if mnemonic == "JSL":
                return "Execute core engine function"
            elif mnemonic == "BRK":
                return "Trigger engine interrupt/command"

        # General instruction purposes
        base_purpose = self.instruction_purposes.get(mnemonic, "Unknown operation")

        # Add context for memory operations
        if operand and operand.startswith("$"):
            try:
                addr = int(operand[1:6], 16) if len(operand) > 6 else int(operand[1:], 16)
                if addr in self.memory_regions:
                    if mnemonic in ["LDA", "LDX", "LDY"]:
                        return f"Load {self.memory_regions[addr]}"
                    elif mnemonic in ["STA", "STX", "STY"]:
                        return f"Store to {self.memory_regions[addr]}"
                    elif mnemonic == "CMP":
                        return f"Compare with {self.memory_regions[addr]}"
                    elif mnemonic == "ORA":
                        return f"Set bits in {self.memory_regions[addr]}"
                    elif mnemonic == "AND":
                        return f"Clear bits in {self.memory_regions[addr]}"
            except ValueError:
                pass

        return base_purpose

    def document_file(self, filepath, output_path):
        """Document an entire assembly file"""

        if not os.path.exists(filepath):
            return False

        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                lines = f.readlines()
        except:
            return False

        # Clean lines
        lines = [line.rstrip() for line in lines]

        # Generate file header
        filename = os.path.basename(filepath)
        module_name = filename.replace('.asm', '').replace('_', ' ').title()

        documented_lines = []
        documented_lines.append(";==============================================================================")
        documented_lines.append(f"; Dragon Quest III - {module_name}")
        documented_lines.append(";==============================================================================")
        documented_lines.append(f"; File: {filename}")
        documented_lines.append(f"; Purpose: Game system module with comprehensive documentation")
        documented_lines.append(f"; Functions: Auto-analyzed and labeled with meaningful names")
        documented_lines.append(f"; Comments: Context-aware instruction documentation")
        documented_lines.append(";==============================================================================")
        documented_lines.append("")
        documented_lines.append(".include \"hardware.inc\"")
        documented_lines.append(".include \"constants.inc\"")
        documented_lines.append("")

        # Process functions
        function_names = []
        i = 0
        while i < len(lines):
            line = lines[i].strip()

            # Found a function
            if line.endswith(':') and ('Function' in line or any(x in line for x in ['Boot_', 'Engine_', 'Battle_'])):
                func_lines, func_name = self.document_function(lines, i)
                documented_lines.extend(func_lines)
                function_names.append(func_name)

                # Skip ahead past this function
                i += len(func_lines) - 8  # Account for header lines
            else:
                # Copy non-function lines as-is
                if not (line.startswith(';==============') or line.startswith('.include')):
                    documented_lines.append(lines[i])
                i += 1

        # Add function index at the end
        documented_lines.append(";==============================================================================")
        documented_lines.append(f"; Function Index ({len(function_names)} functions)")
        documented_lines.append(";==============================================================================")
        for name in function_names:
            documented_lines.append(f"; {name}")
        documented_lines.append(";==============================================================================")

        # Write documented file
        os.makedirs(os.path.dirname(output_path), exist_ok=True)
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write('\n'.join(documented_lines))

        return True

    def document_all_files(self):
        """Document all extracted assembly files"""

        print("📝 DOCUMENTING DRAGON QUEST III CODE")
        print("="*60)

        # Create output directory
        output_dir = "src/documented"
        os.makedirs(output_dir, exist_ok=True)

        documented_count = 0

        # Document core files
        core_files = [
            'src/boot_00.asm',
            'src/engine_01.asm',
            'src/battle_02.asm',
            'src/menu_03.asm',
            'src/field_04.asm',
            'src/audio_05.asm',
            'src/graphics_06.asm',
            'src/text_07.asm'
        ]

        for filepath in core_files:
            if os.path.exists(filepath):
                output_path = os.path.join(output_dir, os.path.basename(filepath))
                print(f"  📄 Documenting {filepath} -> {output_path}")
                if self.document_file(filepath, output_path):
                    documented_count += 1

        # Document selected bank files
        banks_dir = 'src/banks'
        if os.path.exists(banks_dir):
            bank_files = [f for f in os.listdir(banks_dir) if f.endswith('.asm')][:10]  # Limit for now

            for filename in bank_files:
                filepath = os.path.join(banks_dir, filename)
                output_path = os.path.join(output_dir, f"documented_{filename}")
                print(f"  📄 Documenting {filepath} -> {output_path}")
                if self.document_file(filepath, output_path):
                    documented_count += 1

        print(f"\n✅ DOCUMENTATION COMPLETE")
        print(f"   📁 Files documented: {documented_count}")
        print(f"   📂 Output directory: {output_dir}")
        print(f"   🏷️  Functions labeled with meaningful names")
        print(f"   📋 Instructions commented with purposes")

def main():
    documenter = DQ3CodeDocumenter()
    documenter.document_all_files()

    print(f"\n🎯 NEXT PHASE: Create comprehensive hardware definitions")

if __name__ == "__main__":
    main()
