#!/usr/bin/env python3
"""
Dragon Quest III Bank 40 Function Analyzer
Analyze functions in bank 40 to determine their real purpose and rename them
"""

import re
import os

class DQ3Bank40Analyzer:
    def __init__(self, bank_file):
        self.bank_file = bank_file
        with open(bank_file, 'r') as f:
            self.content = f.read()

        self.functions = self.extract_functions()

    def extract_functions(self):
        """Extract all functions from the bank file"""
        functions = []
        lines = self.content.split('\n')

        current_function = None
        for i, line in enumerate(lines):
            # Look for function headers
            if line.startswith(';------------------------------------------------------------------------------'):
                # Next few lines should contain function info
                if i + 3 < len(lines):
                    func_line = lines[i + 1]
                    addr_line = lines[i + 2]
                    size_line = lines[i + 3]

                    # Extract function name
                    if func_line.startswith(';'):
                        func_name = func_line[1:].strip()

                        # Extract address
                        addr_match = re.search(r'Address: \$([A-F0-9]+)', addr_line)
                        address = addr_match.group(1) if addr_match else None

                        # Extract size
                        size_match = re.search(r'Size: (\d+) bytes', size_line)
                        size = int(size_match.group(1)) if size_match else None

                        current_function = {
                            'name': func_name,
                            'address': address,
                            'size': size,
                            'start_line': i,
                            'instructions': []
                        }

            elif line.endswith(':') and current_function:
                # Start collecting instructions
                pass

            elif current_function and line.strip() and not line.startswith(';') and not line.startswith('.'):
                # This is an instruction line
                if '|' in line:
                    instruction = line.strip()
                    current_function['instructions'].append(instruction)

            elif line.startswith(';------------------------------------------------------------------------------') and current_function:
                # End of current function
                functions.append(current_function)
                current_function = None

        # Add last function if exists
        if current_function:
            functions.append(current_function)

        return functions

    def analyze_function_purpose(self, func):
        """Analyze a function to determine its purpose"""
        instructions = func['instructions']

        if not instructions:
            return "EmptyFunction", "Empty or data-only section"

        # Count instruction types
        inst_types = []
        has_dma_access = False
        has_ppu_access = False
        has_game_ram = False
        has_subroutine_calls = False
        has_stack_ops = False
        has_branches = False
        has_data_movement = False

        for inst in instructions:
            # Extract mnemonic (first word before space)
            mnemonic = inst.split()[0]
            inst_types.append(mnemonic)

            # Check for hardware access patterns
            if '$21' in inst:
                has_ppu_access = True
            if '$43' in inst:
                has_dma_access = True
            if '$E0' in inst:
                has_game_ram = True
            if mnemonic in ['JSR', 'JSL']:
                has_subroutine_calls = True
            if mnemonic in ['PHA', 'PLA', 'PHX', 'PLX', 'PHY', 'PLY', 'PHP', 'PLP']:
                has_stack_ops = True
            if mnemonic.startswith('B') and mnemonic != 'BIT':
                has_branches = True
            if mnemonic in ['LDA', 'LDX', 'LDY', 'STA', 'STX', 'STY']:
                has_data_movement = True

        # Analyze patterns
        if len(instructions) < 5:
            return "DataTable", "Small data table or constant"

        # Look for obvious data patterns
        data_indicators = 0
        for inst in instructions:
            if 'ORA (' in inst or 'AND (' in inst:
                data_indicators += 1

        if data_indicators > len(instructions) * 0.7:
            return "GraphicsData", "Graphics tile or sprite data"

        # Function type analysis
        if has_dma_access:
            return "DMATransfer", "DMA channel configuration and transfer"
        elif has_ppu_access:
            return "PPUControl", "PPU register configuration"
        elif has_subroutine_calls and has_stack_ops:
            return "GameFunction", "Game logic function with subroutine calls"
        elif has_branches and has_game_ram:
            return "GameLogic", "Game state processing logic"
        elif has_data_movement and not has_branches:
            return "DataCopy", "Memory copy or initialization routine"
        elif 'RTS' in inst_types or 'RTL' in inst_types:
            return "Subroutine", "Callable subroutine function"
        else:
            return "CodeSection", "General code section"

    def generate_meaningful_names(self):
        """Generate meaningful names for all functions"""
        renamed_functions = []

        type_counts = {}

        for func in self.functions:
            func_type, description = self.analyze_function_purpose(func)

            # Generate unique name
            if func_type not in type_counts:
                type_counts[func_type] = 0
            type_counts[func_type] += 1

            new_name = f"{func_type}_{type_counts[func_type]:03d}"

            renamed_functions.append({
                'original_name': func['name'],
                'new_name': new_name,
                'address': func['address'],
                'size': func['size'],
                'description': description,
                'instruction_count': len(func['instructions']),
                'start_line': func['start_line']
            })

        return renamed_functions

    def apply_renames(self, output_file):
        """Apply renames to create new file"""
        renamed_funcs = self.generate_meaningful_names()

        new_content = self.content

        # Sort by start_line in reverse order to avoid offset issues
        renamed_funcs.sort(key=lambda x: x['start_line'], reverse=True)

        for func in renamed_funcs:
            # Replace function name in header comment
            old_pattern = f"; {func['original_name']}"
            new_pattern = f"; {func['new_name']}"
            new_content = new_content.replace(old_pattern, new_pattern, 1)

            # Replace function label
            old_label = f"{func['original_name']}:"
            new_label = f"{func['new_name']}:"
            new_content = new_content.replace(old_label, new_label, 1)

        # Update bank type and purpose based on analysis
        purpose_summary = self.generate_bank_summary(renamed_funcs)

        # Replace bank description
        old_desc = "; Purpose: DMA operations and data transfer"
        new_desc = f"; Purpose: {purpose_summary}"
        new_content = new_content.replace(old_desc, new_desc)

        # Write output
        with open(output_file, 'w') as f:
            f.write(new_content)

        return renamed_funcs

    def generate_bank_summary(self, functions):
        """Generate a summary of what this bank actually contains"""
        type_counts = {}

        for func in functions:
            func_type = func['new_name'].split('_')[0]
            type_counts[func_type] = type_counts.get(func_type, 0) + 1

        # Generate summary
        total_funcs = len(functions)
        summaries = []

        for func_type, count in sorted(type_counts.items(), key=lambda x: x[1], reverse=True):
            percentage = (count / total_funcs) * 100
            summaries.append(f"{func_type}({count}, {percentage:.1f}%)")

        return "Mixed functionality: " + ", ".join(summaries)

    def print_analysis_report(self):
        """Print detailed analysis report"""
        renamed_funcs = self.generate_meaningful_names()

        print("="*80)
        print("DRAGON QUEST III BANK 40 FUNCTION ANALYSIS REPORT")
        print("="*80)
        print(f"Total Functions: {len(renamed_funcs)}")
        print()

        # Summary by type
        type_counts = {}
        for func in renamed_funcs:
            func_type = func['new_name'].split('_')[0]
            type_counts[func_type] = type_counts.get(func_type, 0) + 1

        print("FUNCTION TYPES:")
        print("-" * 40)
        for func_type, count in sorted(type_counts.items(), key=lambda x: x[1], reverse=True):
            print(f"{func_type}: {count} functions")
        print()

        print("DETAILED FUNCTION LIST:")
        print("-" * 40)
        for func in renamed_funcs[:20]:  # Show first 20
            print(f"{func['address']}: {func['original_name']} -> {func['new_name']}")
            print(f"    Size: {func['size']} bytes, Instructions: {func['instruction_count']}")
            print(f"    Purpose: {func['description']}")
            print()

        if len(renamed_funcs) > 20:
            print(f"... and {len(renamed_funcs) - 20} more functions")

def main():
    bank_file = "src/complete/bank_40.asm"
    output_file = "src/complete/bank_40_analyzed.asm"

    if not os.path.exists(bank_file):
        print(f"Error: {bank_file} not found")
        return

    analyzer = DQ3Bank40Analyzer(bank_file)

    # Print analysis report
    analyzer.print_analysis_report()

    # Apply renames
    renamed_functions = analyzer.apply_renames(output_file)

    print(f"\n✅ Analysis complete!")
    print(f"📄 Original file: {bank_file}")
    print(f"📄 Analyzed file: {output_file}")
    print(f"🏷️ Functions renamed: {len(renamed_functions)}")

if __name__ == "__main__":
    main()
