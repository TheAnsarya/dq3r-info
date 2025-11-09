# Data File Documentation: reports\maximum_coverage_analysis.json

**File Type:** .json
**File Size:** 1,071 bytes
**Data Type:** json
**File Hash:** `0aabf481cad88573aadd20957e58924bb7e5ed28b3c33653a7b927f3795df1ed`
**Modified:** 2025-11-09T02:18:55.524302
**Generated:** 2025-11-09 10:29:43.506378

## JSON Structure Analysis

- **Root Keys:** 7
- **Array Length:** 0
- **Maximum Depth:** 3

### Data Types Distribution

- **dict:** 12
- **str:** 1
- **int:** 19
- **float:** 6

### Structure Preview

```json
{
  "rom_info": {
    "filename": "<str>",
    "size_bytes": "<int>",
    "size_mb": "<float>"
  },
  "coverage_stats": {
    "total_bytes": "<int>",
    "covered_bytes": "<int>",
    "uncovered_bytes": "<int>",
    "coverage_percentage": "<float>"
  },
  "region_types": {
    "structured_data": {
      "count": "<max_depth_reached:int>",
      "bytes": "<max_depth_reached:int>"
    },
    "repeated_data": {
      "count": "<max_depth_reached:int>",
      "bytes": "<max_depth_reached:int>"
    },
    "code": {
      "count": "<max_depth_reached:int>",
      "bytes": "<max_depth_reached:int>"
    },
    "compressed_data": {
      "count": "<max_depth_reached:int>",
      "bytes": "<max_depth_reached:int>"
    },
    "data_table": {
      "count": "<max_depth_reached:int>",
      "bytes": "<max_depth_reached:int>"
    }
  },
  "entropy_analysis": {
    "windows_analyzed": "<int>",
    "average_entropy": "<float>",
    "max_entropy": "<float>",
    "min_entropy": "<float>"
  },
  "pointer_analysis": {
    "potential_pointers": "<int>",
    "unique_targets": "<int>"
  },
  "data_structures": {
    "data_tables": "<int>",
    "total_table_bytes": "<int>"
  },
  "analysis_time_seconds": "<float>"
}
```
