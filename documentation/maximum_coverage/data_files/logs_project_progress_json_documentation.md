# Data File Documentation: logs\project_progress.json

**File Type:** .json
**File Size:** 4,053 bytes
**Data Type:** json
**File Hash:** `e1fd4f9535d63eaeb79d120317bf50ecc01eef5dd9adddc94d0c4db1558d63f2`
**Modified:** 2025-11-09T01:03:22.931973
**Generated:** 2025-11-09 10:29:43.485174

## JSON Structure Analysis

- **Root Keys:** 7
- **Array Length:** 0
- **Maximum Depth:** 4

### Data Types Distribution

- **dict:** 16
- **str:** 70
- **int:** 15
- **list:** 12
- **bool:** 8

### Structure Preview

```json
{
  "last_update": "<str>",
  "project_phase": "<str>",
  "session_info": {
    "session_id": "<str>",
    "start_time": "<str>",
    "project_name": "<str>",
    "current_phase": "<str>",
    "prompt_count": "<int>",
    "files_modified": [
      "<max_depth_reached:str>"
    ],
    "achievements": [],
    "todos_completed": [],
    "todos_in_progress": [],
    "git_commits": []
  },
  "project_state": {
    "timestamp": "<str>",
    "directory_structure": {
      "src": "<max_depth_reached:dict>",
      "tools": "<max_depth_reached:dict>",
      "docs": "<max_depth_reached:dict>",
      "static": "<max_depth_reached:dict>",
      ".github": "<max_depth_reached:dict>",
      "assets": "<max_depth_reached:dict>",
      "tests": "<max_depth_reached:dict>"
    },
    "file_counts": {
      ".py": "<max_depth_reached:int>",
      ".ps1": "<max_depth_reached:int>",
      ".md": "<max_depth_reached:int>",
      ".yml": "<max_depth_reached:int>",
      ".json": "<max_depth_reached:int>",
      ".asm": "<max_depth_reached:int>",
      ".cs": "<max_depth_reached:int>"
    },
    "git_status": {
      "current_branch": "<max_depth_reached:str>",
      "latest_commit": "<max_depth_reached:str>",
      "modified_files": "<max_depth_reached:list>",
      "working_directory_clean": "<max_depth_reached:bool>"
    },
    "build_tools": {
      "python": "<max_depth_reached:str>",
      "asar": "<max_depth_reached:str>",
      "git": "<max_depth_reached:str>"
    },
    "rom_analysis": {}
  },
  "completed_milestones": [
    "<str>"
  ],
  "current_milestones": [
    "<str>"
  ],
  "upcoming_milestones": [
    "<str>"
  ]
}
```
