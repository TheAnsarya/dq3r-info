"""
Base Plugin Interface for Dragon Quest III ROM Analysis
======================================================

This module defines the base plugin interface and metadata structures
for the Dragon Quest III ROM analysis plugin system.

Created: 2025-11-09 14:08:28
"""

import abc
import json
import os
from dataclasses import dataclass, asdict
from typing import Dict, Any, List, Optional, Tuple
from enum import Enum

class PluginType(Enum):
	"""Plugin type enumeration"""
	ANALYZER = "analyzer"
	EXTRACTOR = "extractor"
	EDITOR = "editor"
	CONVERTER = "converter"
	VALIDATOR = "validator"
	VISUALIZER = "visualizer"

class PluginStatus(Enum):
	"""Plugin status enumeration"""
	DISABLED = "disabled"
	ENABLED = "enabled"
	ERROR = "error"
	LOADING = "loading"

@dataclass
class PluginDependency:
	"""Plugin dependency specification"""
	name: str
	version: str
	optional: bool = False
	description: str = ""

@dataclass
class PluginMetadata:
	"""Plugin metadata container"""
	name: str
	version: str
	description: str
	author: str
	plugin_type: PluginType
	entry_point: str
	dependencies: List[PluginDependency]
	config_schema: Dict[str, Any]
	supported_rom_formats: List[str]
	min_python_version: str = "3.8"
	max_python_version: str = ""
	tags: Optional[List[str]] = None
	homepage: str = ""
	license: str = ""

	def __post_init__(self):
		if self.tags is None:
			self.tags = []

	@classmethod
	def from_json_file(cls, filepath: str) -> 'PluginMetadata':
		"""Load plugin metadata from JSON file"""
		with open(filepath, 'r', encoding='utf-8') as f:
			data = json.load(f)

		# Convert dependencies
		deps = []
		for dep_data in data.get('dependencies', []):
			deps.append(PluginDependency(**dep_data))
		data['dependencies'] = deps

		# Convert plugin type
		data['plugin_type'] = PluginType(data['plugin_type'])

		return cls(**data)

	def to_dict(self) -> Dict[str, Any]:
		"""Convert metadata to dictionary"""
		result = asdict(self)
		result['plugin_type'] = self.plugin_type.value
		return result

	def save_to_json(self, filepath: str):
		"""Save metadata to JSON file"""
		with open(filepath, 'w', encoding='utf-8') as f:
			json.dump(self.to_dict(), f, indent=4, ensure_ascii=False)

class BasePlugin(abc.ABC):
	"""Base class for all ROM analysis plugins"""

	def __init__(self, metadata: PluginMetadata):
		"""Initialize plugin with metadata"""
		self.metadata = metadata
		self.config = {}
		self.status = PluginStatus.DISABLED
		self.error_message = ""
		self._rom_data = None
		self._output_dir = None

	@abc.abstractmethod
	def initialize(self, config: Dict[str, Any]) -> bool:
		"""
		Initialize plugin with configuration

		Args:
			config: Plugin configuration dictionary

		Returns:
			bool: True if initialization successful, False otherwise
		"""
		pass

	@abc.abstractmethod
	def process_rom(self, rom_path: str, output_dir: str) -> Dict[str, Any]:
		"""
		Process ROM file and generate output

		Args:
			rom_path: Path to ROM file
			output_dir: Directory for output files

		Returns:
			Dict containing processing results
		"""
		pass

	@abc.abstractmethod
	def get_configuration_schema(self) -> Dict[str, Any]:
		"""
		Get JSON schema for plugin configuration

		Returns:
			Dict containing JSON schema
		"""
		pass

	@abc.abstractmethod
	def validate_configuration(self, config: Dict[str, Any]) -> Tuple[bool, List[str]]:
		"""
		Validate plugin configuration

		Args:
			config: Configuration to validate

		Returns:
			Tuple of (is_valid, error_messages)
		"""
		pass

	def load_rom(self, rom_path: str) -> bytes:
		"""Load ROM data from file"""
		if not os.path.exists(rom_path):
			raise FileNotFoundError(f"ROM file not found: {rom_path}")

		with open(rom_path, 'rb') as f:
			self._rom_data = f.read()

		return self._rom_data

	def get_rom_size(self) -> int:
		"""Get size of loaded ROM"""
		return len(self._rom_data) if self._rom_data else 0

	def read_rom_bytes(self, offset: int, length: int) -> bytes:
		"""Read bytes from ROM at specified offset"""
		if not self._rom_data:
			raise RuntimeError("No ROM data loaded")

		if offset + length > len(self._rom_data):
			raise ValueError("Requested bytes exceed ROM size")

		return self._rom_data[offset:offset + length]

	def read_rom_word(self, offset: int, little_endian: bool = True) -> int:
		"""Read 16-bit word from ROM"""
		bytes_data = self.read_rom_bytes(offset, 2)
		if little_endian:
			return int.from_bytes(bytes_data, 'little')
		else:
			return int.from_bytes(bytes_data, 'big')

	def read_rom_dword(self, offset: int, little_endian: bool = True) -> int:
		"""Read 32-bit double word from ROM"""
		bytes_data = self.read_rom_bytes(offset, 4)
		if little_endian:
			return int.from_bytes(bytes_data, 'little')
		else:
			return int.from_bytes(bytes_data, 'big')

	def write_output_file(self, filename: str, content: Any, format: str = 'text'):
		"""Write output file in specified format"""
		if not self._output_dir:
			raise RuntimeError("No output directory set")

		filepath = os.path.join(self._output_dir, filename)
		os.makedirs(os.path.dirname(filepath), exist_ok=True)

		if format == 'json':
			with open(filepath, 'w', encoding='utf-8') as f:
				json.dump(content, f, indent=4, ensure_ascii=False)
		elif format == 'binary':
			with open(filepath, 'wb') as f:
				f.write(content)
		else:  # text
			with open(filepath, 'w', encoding='utf-8') as f:
				f.write(str(content))

	def log_info(self, message: str):
		"""Log informational message"""
		print(f"[{self.metadata.name}] INFO: {message}")

	def log_warning(self, message: str):
		"""Log warning message"""
		print(f"[{self.metadata.name}] WARNING: {message}")

	def log_error(self, message: str):
		"""Log error message"""
		print(f"[{self.metadata.name}] ERROR: {message}")
		self.error_message = message

	def set_status(self, status: PluginStatus, error_msg: str = ""):
		"""Set plugin status"""
		self.status = status
		if error_msg:
			self.error_message = error_msg

	def get_status_info(self) -> Dict[str, Any]:
		"""Get plugin status information"""
		return {
			'name': self.metadata.name,
			'version': self.metadata.version,
			'status': self.status.value,
			'error_message': self.error_message,
			'type': self.metadata.plugin_type.value
		}

class AnalyzerPlugin(BasePlugin):
	"""Base class for ROM analyzer plugins"""

	def __init__(self, metadata: PluginMetadata):
		super().__init__(metadata)
		if metadata.plugin_type != PluginType.ANALYZER:
			raise ValueError("Plugin type must be ANALYZER")

	@abc.abstractmethod
	def analyze_section(self, offset: int, length: int) -> Dict[str, Any]:
		"""
		Analyze specific ROM section

		Args:
			offset: Starting offset
			length: Section length

		Returns:
			Analysis results dictionary
		"""
		pass

class ExtractorPlugin(BasePlugin):
	"""Base class for ROM extractor plugins"""

	def __init__(self, metadata: PluginMetadata):
		super().__init__(metadata)
		if metadata.plugin_type != PluginType.EXTRACTOR:
			raise ValueError("Plugin type must be EXTRACTOR")

	@abc.abstractmethod
	def extract_assets(self, asset_type: str) -> List[str]:
		"""
		Extract assets of specified type

		Args:
			asset_type: Type of assets to extract

		Returns:
			List of extracted asset file paths
		"""
		pass

class EditorPlugin(BasePlugin):
	"""Base class for ROM editor plugins"""

	def __init__(self, metadata: PluginMetadata):
		super().__init__(metadata)
		if metadata.plugin_type != PluginType.EDITOR:
			raise ValueError("Plugin type must be EDITOR")

	@abc.abstractmethod
	def modify_rom(self, modifications: List[Dict[str, Any]]) -> bool:
		"""
		Apply modifications to ROM

		Args:
			modifications: List of modification specifications

		Returns:
			bool: True if modifications successful
		"""
		pass

class ConverterPlugin(BasePlugin):
	"""Base class for ROM converter plugins"""

	def __init__(self, metadata: PluginMetadata):
		super().__init__(metadata)
		if metadata.plugin_type != PluginType.CONVERTER:
			raise ValueError("Plugin type must be CONVERTER")

	@abc.abstractmethod
	def convert_format(self, input_format: str, output_format: str) -> str:
		"""
		Convert between formats

		Args:
			input_format: Source format
			output_format: Target format

		Returns:
			str: Path to converted file
		"""
		pass

class VisualizerPlugin(BasePlugin):
	"""Base class for ROM visualizer plugins"""

	def __init__(self, metadata: PluginMetadata):
		super().__init__(metadata)
		if metadata.plugin_type != PluginType.VISUALIZER:
			raise ValueError("Plugin type must be VISUALIZER")

	@abc.abstractmethod
	def generate_visualization(self, data_type: str, output_format: str = "png") -> str:
		"""
		Generate visualization of ROM data

		Args:
			data_type: Type of data to visualize
			output_format: Output image format

		Returns:
			str: Path to generated visualization file
		"""
		pass

class ValidatorPlugin(BasePlugin):
	"""Base class for ROM validator plugins"""

	def __init__(self, metadata: PluginMetadata):
		super().__init__(metadata)
		if metadata.plugin_type != PluginType.VALIDATOR:
			raise ValueError("Plugin type must be VALIDATOR")

	@abc.abstractmethod
	def validate_rom(self) -> Dict[str, Any]:
		"""
		Validate ROM integrity and structure

		Returns:
			Dict containing validation results
		"""
		pass

def create_plugin_template(plugin_name: str, plugin_type: PluginType, output_dir: str):
	"""Create a plugin template in the specified directory"""
	plugin_dir = os.path.join(output_dir, plugin_name.lower().replace(' ', '_'))
	os.makedirs(plugin_dir, exist_ok=True)

	# Create metadata template
	metadata = PluginMetadata(
		name=plugin_name,
		version="1.0.0",
		description=f"A {plugin_type.value} plugin for Dragon Quest III ROM analysis",
		author="Plugin Developer",
		plugin_type=plugin_type,
		entry_point="plugin.py",
		dependencies=[],
		config_schema={
			"type": "object",
			"properties": {},
			"required": []
		},
		supported_rom_formats=["smc", "sfc"],
		tags=[plugin_type.value]
	)

	metadata_path = os.path.join(plugin_dir, "metadata.json")
	metadata.save_to_json(metadata_path)

	# Create plugin implementation template
	plugin_code = f'''"""
{plugin_name} Plugin
{('=' * (len(plugin_name) + 7))}

Plugin implementation for {plugin_name}.

Created: 2025-11-09
"""

from plugins.base_plugin import {plugin_type.value.capitalize()}Plugin, PluginStatus
from typing import Dict, Any, List

class {plugin_name.replace(' ', '')}Plugin({plugin_type.value.capitalize()}Plugin):
	"""Implementation of {plugin_name} plugin"""

	def initialize(self, config: Dict[str, Any]) -> bool:
		"""Initialize the plugin"""
		try:
			self.config = config
			self.set_status(PluginStatus.ENABLED)
			self.log_info("Plugin initialized successfully")
			return True
		except Exception as e:
			self.log_error(f"Failed to initialize: {{e}}")
			self.set_status(PluginStatus.ERROR, str(e))
			return False

	def process_rom(self, rom_path: str, output_dir: str) -> Dict[str, Any]:
		"""Process the ROM file"""
		try:
			self.load_rom(rom_path)
			self._output_dir = output_dir

			# TODO: Implement your ROM processing logic here
			results = {{
				"plugin": self.metadata.name,
				"version": self.metadata.version,
				"rom_size": self.get_rom_size(),
				"processed": True
			}}

			# Write results to output file
			self.write_output_file(f"{{self.metadata.name.lower().replace(' ', '_')}}_results.json",
								  results, format='json')

			return results

		except Exception as e:
			self.log_error(f"ROM processing failed: {{e}}")
			return {{"error": str(e), "processed": False}}

	def get_configuration_schema(self) -> Dict[str, Any]:
		"""Get plugin configuration schema"""
		return {{
			"type": "object",
			"properties": {{
				# TODO: Define your configuration parameters here
			}},
			"required": []
		}}

	def validate_configuration(self, config: Dict[str, Any]) -> tuple[bool, List[str]]:
		"""Validate plugin configuration"""
		errors = []

		# TODO: Implement your configuration validation here

		return len(errors) == 0, errors

# Plugin factory function
def create_plugin(metadata):
	"""Factory function to create plugin instance"""
	return {plugin_name.replace(' ', '')}Plugin(metadata)
'''

	plugin_path = os.path.join(plugin_dir, "plugin.py")
	with open(plugin_path, 'w', encoding='utf-8') as f:
		f.write(plugin_code)

	# Create README
	readme_content = f'''# {plugin_name} Plugin

## Description
{metadata.description}

## Configuration
This plugin requires the following configuration parameters:

```json
{{
  // TODO: Document configuration parameters
}}
```

## Output
This plugin generates the following output files:
- `{plugin_name.lower().replace(' ', '_')}_results.json`: Main results file

## Usage
This plugin is automatically loaded by the plugin manager when placed in the plugins directory.

## Development
To modify this plugin:
1. Edit `plugin.py` to implement your analysis logic
2. Update `metadata.json` with any new dependencies or configuration
3. Test using the plugin manager test suite
'''

	readme_path = os.path.join(plugin_dir, "README.md")
	with open(readme_path, 'w', encoding='utf-8') as f:
		f.write(readme_content)

	return plugin_dir
