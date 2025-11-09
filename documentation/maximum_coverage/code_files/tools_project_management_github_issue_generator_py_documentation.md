# Code Documentation: tools\project_management\github_issue_generator.py

**File Type:** .py
**File Size:** 44,023 bytes
**Lines of Code:** 1,312
**Generated:** 2025-11-09 10:29:38.303971

## File Analysis Summary

- **Cyclomatic Complexity:** 323
- **Maintainability Index:** 85.0
- **Comment Ratio:** 11.4%

## Functions

### __init__
- **Line:** 13
- **Arguments:** `self, project_root: str`
- **Complexity:** 1

### create_comprehensive_issues
- **Line:** 27
- **Arguments:** `self`
- **Complexity:** 4
- **Description:** Create comprehensive GitHub issues covering all aspects of ROM analysis

### create_core_disassembly_issues
- **Line:** 59
- **Arguments:** `self`
- **Complexity:** 9
- **Description:** Create issues for core ROM disassembly work

### create_system_analysis_issues
- **Line:** 182
- **Arguments:** `self`
- **Complexity:** 24
- **Description:** Create issues for specific game system analysis

### create_documentation_issues
- **Line:** 389
- **Arguments:** `self`
- **Complexity:** 12
- **Description:** Create issues for documentation and organization

### create_quality_assurance_issues
- **Line:** 514
- **Arguments:** `self`
- **Complexity:** 13
- **Description:** Create issues for testing and quality assurance

### create_advanced_analysis_issues
- **Line:** 608
- **Arguments:** `self`
- **Complexity:** 9
- **Description:** Create issues for advanced analysis techniques

### create_project_management_issues
- **Line:** 752
- **Arguments:** `self`
- **Complexity:** 17
- **Description:** Create issues for project management and coordination

### save_individual_issue
- **Line:** 986
- **Arguments:** `self, issue: Dict[str, Any]`
- **Complexity:** 5
- **Description:** Save individual issue to markdown file

### generate_kanban_board
- **Line:** 1020
- **Arguments:** `self`
- **Complexity:** 4
- **Description:** Generate kanban board representation

### generate_kanban_markdown
- **Line:** 1128
- **Arguments:** `self, kanban: Dict`
- **Complexity:** 9
- **Description:** Generate markdown summary of kanban board

### generate_issues_report
- **Line:** 1170
- **Arguments:** `self`
- **Complexity:** 6
- **Description:** Generate comprehensive issues report

### main
- **Line:** 1292
- **Arguments:** ``
- **Complexity:** 5
- **Description:** Main execution function

## Classes

### GitHubIssueGenerator
- **Line:** 12
#### Methods
- **__init__** (line 13) [private]
- **create_comprehensive_issues** (line 27)
- **create_core_disassembly_issues** (line 59)
- **create_system_analysis_issues** (line 182)
- **create_documentation_issues** (line 389)
- **create_quality_assurance_issues** (line 514)
- **create_advanced_analysis_issues** (line 608)
- **create_project_management_issues** (line 752)
- **save_individual_issue** (line 986)
- **generate_kanban_board** (line 1020)
- **generate_kanban_markdown** (line 1128)
- **generate_issues_report** (line 1170)
- **main** (line 1292)

## Imports

- Line 7: `import os`
- Line 8: `import json`
- Line 9: `import datetime`
- Line 10: `from typing import Dict, List, Any`

