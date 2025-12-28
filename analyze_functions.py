#!/usr/bin/env python3
"""
Dragon Quest III Function Analysis Tool
Analyzes extracted assembly code to identify and document major game systems
"""

import re
import os
from collections import defaultdict, Counter

class DQ3FunctionAnalyzer:
    def __init__(self):
        self.function_calls = defaultdict(list)  # JSL/JSR targets
        self.memory_addresses = defaultdict(list)  # RAM/hardware register usage
        self.function_patterns = {}
        self.system_functions = {}

        # Known hardware registers
        self.hardware_regs = {
            0xE0B2: "DMA_SRC_BANK",
            0xE0B4: "DMA_DST_BANK",
            0xE0B6: "DMA_CONTROL",
            0xE0B8: "DMA_STATUS",
            0xE086: "TEMP_X_LO",
            0xE088: "TEMP_Y_LO",
            0xE08A: "TEMP_RESULT",
            0x2100: "PPU_BRIGHTNESS",
            0x2101: "PPU_OAM_SIZE",
            0x2102: "PPU_OAM_ADDR_LO",
            0x2103: "PPU_OAM_ADDR_HI",
            0x2105: "PPU_BG_MODE",
            0x2107: "PPU_BG1_TILEMAP",
            0x2108: "PPU_BG2_TILEMAP",
            0x2109: "PPU_BG3_TILEMAP",
            0x210A: "PPU_BG4_TILEMAP",
            0x210B: "PPU_BG12_CHR",
            0x210C: "PPU_BG34_CHR",
            0x210D: "PPU_BG1_SCROLL_X",
            0x210E: "PPU_BG1_SCROLL_Y",
            0x210F: "PPU_BG2_SCROLL_X",
            0x2110: "PPU_BG2_SCROLL_Y",
            0x2115: "PPU_VRAM_INC",
            0x2116: "PPU_VRAM_ADDR_LO",
            0x2117: "PPU_VRAM_ADDR_HI",
            0x2118: "PPU_VRAM_DATA_LO",
            0x2119: "PPU_VRAM_DATA_HI",
            0x212C: "PPU_MAIN_SCREEN",
            0x212D: "PPU_SUB_SCREEN",
            0x212E: "PPU_WINDOW_MAIN",
            0x212F: "PPU_WINDOW_SUB",
            0x4200: "NMI_ENABLE",
            0x4201: "IO_PORT_WRITE",
            0x4202: "MULTIPLY_A",
            0x4203: "MULTIPLY_B",
            0x4204: "DIVIDE_DIVIDEND_LO",
            0x4205: "DIVIDE_DIVIDEND_HI",
            0x4206: "DIVIDE_DIVISOR",
            0x4207: "H_COUNT_LO",
            0x4208: "H_COUNT_HI",
            0x4209: "V_COUNT_LO",
            0x420A: "V_COUNT_HI",
            0x420B: "DMA_ENABLE",
            0x420C: "HDMA_ENABLE",
            0x4210: "NMI_STATUS",
            0x4211: "IRQ_STATUS",
            0x4212: "PPU_STATUS",
            0x4218: "JOYPAD1_LO",
            0x4219: "JOYPAD1_HI",
            0x421A: "JOYPAD2_LO",
            0x421B: "JOYPAD2_HI",
        }

        # Known function signatures
        self.function_signatures = {
            0xC01098: "CalculatePointer",
            0xC08FD7: "DecompressData",
            0xC09052: "ErrorHandler",
            0xC05F21: "AlternateCalculatePointer",
            0xC0601F: "PointerCalculation",
            0xC067FD: "DataProcessing",
            0xC90572: "EngineCall",
            0xC903EE: "EngineFunction",
        }

    def analyze_file(self, filepath):
        """Analyze a single assembly file"""
        if not os.path.exists(filepath):
            return

        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()
        except:
            return

        lines = content.split('\n')
        current_function = None

        for i, line in enumerate(lines):
            line = line.strip()

            # Track function labels
            if line.endswith(':') and 'Function' in line:
                current_function = line[:-1]

            # Find JSL/JSR calls
            if re.search(r'JSL \$[0-9A-F]+', line, re.IGNORECASE):
                match = re.search(r'JSL \$([0-9A-F]+)', line, re.IGNORECASE)
                if match:
                    target = int(match.group(1), 16)
                    self.function_calls[target].append({
                        'file': filepath,
                        'function': current_function,
                        'line': i + 1,
                        'instruction': line
                    })

            if re.search(r'JSR \$[0-9A-F]+', line, re.IGNORECASE):
                match = re.search(r'JSR \$([0-9A-F]+)', line, re.IGNORECASE)
                if match:
                    target = int(match.group(1), 16)
                    self.function_calls[target].append({
                        'file': filepath,
                        'function': current_function,
                        'line': i + 1,
                        'instruction': line
                    })

            # Find memory address usage
            patterns = [
                r'LDA \$([0-9A-F]+)',
                r'STA \$([0-9A-F]+)',
                r'LDX \$([0-9A-F]+)',
                r'STX \$([0-9A-F]+)',
                r'LDY \$([0-9A-F]+)',
                r'STY \$([0-9A-F]+)',
                r'ORA \$([0-9A-F]+)',
                r'AND \$([0-9A-F]+)',
                r'CMP \$([0-9A-F]+)'
            ]

            for pattern in patterns:
                matches = re.findall(pattern, line, re.IGNORECASE)
                for match in matches:
                    addr = int(match, 16)
                    # Only track interesting addresses (hardware regs, RAM)
                    if (0x2000 <= addr <= 0x21FF or  # PPU registers
                        0x4000 <= addr <= 0x43FF or  # CPU registers
                        0xE000 <= addr <= 0xE0FF or  # RAM work area
                        0x7F0000 <= addr <= 0x7FFFFF): # WRAM
                        self.memory_addresses[addr].append({
                            'file': filepath,
                            'function': current_function,
                            'line': i + 1,
                            'instruction': line,
                            'operation': pattern.split()[0]
                        })

    def analyze_all_files(self):
        """Analyze all assembly files in the project"""
        print("🔍 Analyzing Dragon Quest III Functions...")

        # Core files
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
            print(f"  📁 Analyzing {filepath}")
            self.analyze_file(filepath)

        # Bank files
        banks_dir = 'src/banks'
        if os.path.exists(banks_dir):
            for filename in os.listdir(banks_dir):
                if filename.endswith('.asm'):
                    filepath = os.path.join(banks_dir, filename)
                    print(f"  📁 Analyzing {filepath}")
                    self.analyze_file(filepath)

    def identify_function_purposes(self):
        """Identify the purpose of functions based on their behavior"""
        function_analysis = {}

        for addr, calls in self.function_calls.items():
            # Analyze what this function is called for
            calling_contexts = []
            memory_usage = []

            for call in calls:
                calling_contexts.append(call['function'])

            # Look at memory addresses used around this function
            if addr in self.memory_addresses:
                memory_usage = self.memory_addresses[addr]

            # Determine function purpose
            purpose = "Unknown"
            category = "Utility"

            if addr == 0xC01098:
                purpose = "Pointer/Address Calculation - Computes memory addresses from bank/offset parameters"
                category = "Memory Management"
            elif addr == 0xC08FD7:
                purpose = "Data Decompression/Loading - Loads and potentially decompresses game data"
                category = "Data Processing"
            elif addr == 0xC09052:
                purpose = "Error/Exception Handler - Handles error conditions and cleanup"
                category = "System"
            elif addr == 0xC90572:
                purpose = "Core Engine Function - Main game engine processing"
                category = "Engine"
            elif addr == 0xC903EE:
                purpose = "Engine Subsystem - Specific engine functionality"
                category = "Engine"
            elif 0x2000 <= addr <= 0x21FF:
                purpose = f"PPU Register Access - Graphics/video processing"
                category = "Graphics"
            elif 0x4000 <= addr <= 0x43FF:
                purpose = f"Hardware Register Access - System hardware control"
                category = "Hardware"
            elif 0xE000 <= addr <= 0xE0FF:
                purpose = f"RAM Work Area - Temporary data storage and processing"
                category = "Memory"

            function_analysis[addr] = {
                'address': f"${addr:06X}",
                'purpose': purpose,
                'category': category,
                'call_count': len(calls),
                'calling_functions': list(set(calling_contexts)),
                'files_used': list(set([call['file'] for call in calls]))
            }

        return function_analysis

    def generate_memory_map(self):
        """Generate a detailed memory usage map"""
        memory_map = {}

        for addr, usages in self.memory_addresses.items():
            reg_name = self.hardware_regs.get(addr, f"UNK_${addr:04X}")

            operations = Counter([usage['operation'] for usage in usages])
            files = set([usage['file'] for usage in usages])
            functions = set([usage['function'] for usage in usages if usage['function']])

            # Determine purpose based on address range
            if 0x2100 <= addr <= 0x213F:
                purpose = "PPU Background/Sprite Configuration"
                category = "Graphics"
            elif 0x2140 <= addr <= 0x217F:
                purpose = "Audio Processing Unit (APU) Interface"
                category = "Audio"
            elif 0x4200 <= addr <= 0x421F:
                purpose = "DMA/NMI/IRQ Hardware Control"
                category = "System"
            elif 0x4218 <= addr <= 0x421F:
                purpose = "Joypad Input Reading"
                category = "Input"
            elif 0xE000 <= addr <= 0xE0FF:
                purpose = "Game Logic Work RAM"
                category = "Game Data"
            else:
                purpose = "General Purpose"
                category = "Utility"

            memory_map[addr] = {
                'address': f"${addr:04X}",
                'name': reg_name,
                'purpose': purpose,
                'category': category,
                'usage_count': len(usages),
                'operations': dict(operations),
                'files_used': list(files),
                'functions_used': list(functions)
            }

        return memory_map

    def generate_report(self):
        """Generate comprehensive analysis report"""
        print("\n" + "="*80)
        print("🎮 DRAGON QUEST III FUNCTION ANALYSIS REPORT")
        print("="*80)

        function_analysis = self.identify_function_purposes()
        memory_map = self.generate_memory_map()

        # Function Call Analysis
        print(f"\n📞 MAJOR FUNCTION CALLS ({len(function_analysis)} functions)")
        print("-" * 60)

        # Group by category
        categories = defaultdict(list)
        for addr, info in function_analysis.items():
            categories[info['category']].append((addr, info))

        for category, functions in sorted(categories.items()):
            print(f"\n🏷️  {category} Functions:")
            for addr, info in sorted(functions, key=lambda x: x[1]['call_count'], reverse=True):
                print(f"   ${addr:06X} - {info['purpose']}")
                print(f"              Called {info['call_count']} times from {len(info['calling_functions'])} functions")

        # Memory Usage Analysis
        print(f"\n🧠 MEMORY/HARDWARE USAGE ({len(memory_map)} addresses)")
        print("-" * 60)

        mem_categories = defaultdict(list)
        for addr, info in memory_map.items():
            mem_categories[info['category']].append((addr, info))

        for category, addresses in sorted(mem_categories.items()):
            print(f"\n🏷️  {category} Registers:")
            for addr, info in sorted(addresses, key=lambda x: x[1]['usage_count'], reverse=True)[:10]:
                print(f"   ${addr:04X} ({info['name']}) - {info['purpose']}")
                print(f"              Used {info['usage_count']} times: {info['operations']}")

        # System Architecture Summary
        print(f"\n🏗️  SYSTEM ARCHITECTURE SUMMARY")
        print("-" * 60)

        engine_calls = sum(1 for info in function_analysis.values() if info['category'] == 'Engine')
        graphics_usage = sum(1 for info in memory_map.values() if info['category'] == 'Graphics')
        system_calls = sum(1 for info in function_analysis.values() if info['category'] == 'System')

        print(f"   🎮 Engine Functions: {engine_calls}")
        print(f"   🎨 Graphics Systems: {graphics_usage}")
        print(f"   ⚙️  System Functions: {system_calls}")
        print(f"   📁 Total Files Analyzed: {len(set().union(*[info['files_used'] for info in function_analysis.values()]))}")

        return function_analysis, memory_map

def main():
    analyzer = DQ3FunctionAnalyzer()
    analyzer.analyze_all_files()
    function_analysis, memory_map = analyzer.generate_report()

    # Save detailed analysis
    with open('FUNCTION_ANALYSIS.md', 'w') as f:
        f.write("# Dragon Quest III Function Analysis\n\n")

        f.write("## Major Functions\n\n")
        for addr, info in sorted(function_analysis.items(), key=lambda x: x[1]['call_count'], reverse=True):
            f.write(f"### ${addr:06X} - {info['category']}\n")
            f.write(f"**Purpose**: {info['purpose']}\n\n")
            f.write(f"**Usage**: Called {info['call_count']} times\n\n")
            f.write(f"**Files**: {', '.join(info['files_used'])}\n\n")
            f.write(f"**Calling Functions**: {', '.join(info['calling_functions'])}\n\n")
            f.write("---\n\n")

        f.write("## Memory Map\n\n")
        for addr, info in sorted(memory_map.items(), key=lambda x: x[1]['usage_count'], reverse=True):
            f.write(f"### ${addr:04X} - {info['name']}\n")
            f.write(f"**Purpose**: {info['purpose']}\n\n")
            f.write(f"**Category**: {info['category']}\n\n")
            f.write(f"**Usage**: {info['usage_count']} times - {info['operations']}\n\n")
            f.write(f"**Files**: {', '.join(info['files_used'][:5])}\n\n")
            f.write("---\n\n")

    print(f"\n📝 Detailed analysis saved to FUNCTION_ANALYSIS.md")
    print(f"🎯 Ready for comprehensive documentation and labeling!")

if __name__ == "__main__":
    main()
