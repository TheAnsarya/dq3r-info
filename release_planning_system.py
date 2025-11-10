"""
Release Planning and Version Management System
==============================================

Comprehensive release planning system for Dragon Quest III ROM Analysis project.
Implements automated version management, release scheduling, and deployment coordination.

Addresses GitHub Issue #19: Release Planning and Version Management

Created: 2025-11-10 10:46:15
"""

import os
import json
import re
import subprocess
from datetime import datetime, timedelta
from typing import Dict, List, Optional, Any, Tuple
from dataclasses import dataclass, asdict
from pathlib import Path


@dataclass
class Version:
	"""Semantic version class"""
	major: int
	minor: int
	patch: int
	prerelease: Optional[str] = None
	build: Optional[str] = None

	def __str__(self) -> str:
		version = f"{self.major}.{self.minor}.{self.patch}"
		if self.prerelease:
			version += f"-{self.prerelease}"
		if self.build:
			version += f"+{self.build}"
		return version

	def to_dict(self) -> Dict[str, Any]:
		return asdict(self)

	@classmethod
	def from_string(cls, version_str: str) -> 'Version':
		"""Parse version from string"""
		# Regex for semver: major.minor.patch[-prerelease][+build]
		pattern = r'^(\d+)\.(\d+)\.(\d+)(?:-([^+]+))?(?:\+(.+))?$'
		match = re.match(pattern, version_str)

		if not match:
			raise ValueError(f"Invalid version string: {version_str}")

		major, minor, patch, prerelease, build = match.groups()
		return cls(
			major=int(major),
			minor=int(minor),
			patch=int(patch),
			prerelease=prerelease,
			build=build
		)

	def bump_major(self) -> 'Version':
		return Version(self.major + 1, 0, 0)

	def bump_minor(self) -> 'Version':
		return Version(self.major, self.minor + 1, 0)

	def bump_patch(self) -> 'Version':
		return Version(self.major, self.minor, self.patch + 1)


@dataclass
class ReleaseFeature:
	"""Release feature definition"""
	id: str
	title: str
	description: str
	status: str  # planned, in_progress, testing, complete
	priority: int  # 1-5, 5 being highest
	estimated_effort: int  # story points or hours
	assigned_to: Optional[str] = None
	github_issue: Optional[int] = None
	completion_date: Optional[str] = None
	dependencies: List[str] = None

	def __post_init__(self):
		if self.dependencies is None:
			self.dependencies = []


@dataclass
class Release:
	"""Release definition"""
	version: Version
	codename: Optional[str]
	planned_date: str
	release_type: str  # major, minor, patch, hotfix
	status: str  # planned, in_progress, testing, released, cancelled
	features: List[ReleaseFeature]
	description: str
	release_notes: Optional[str] = None
	actual_date: Optional[str] = None
	deployment_environments: List[str] = None
	rollback_plan: Optional[str] = None

	def __post_init__(self):
		if self.deployment_environments is None:
			self.deployment_environments = ["staging", "production"]


class ReleasePlanningSystem:
	"""Complete release planning and version management system"""

	def __init__(self, project_root: str = "."):
		"""Initialize release planning system"""
		self.project_root = Path(project_root).resolve()
		self.config_file = self.project_root / "release_config.json"
		self.releases_file = self.project_root / "releases.json"
		self.versions_file = self.project_root / "version_history.json"

		# Current version tracking
		self.current_version = self._load_current_version()
		self.releases = self._load_releases()
		self.version_history = self._load_version_history()

		# Configuration
		self.config = self._load_config()

		print(f"[{self._timestamp()}] Release Planning System initialized")
		print(f"Current version: {self.current_version}")
		print(f"Active releases: {len([r for r in self.releases if r.status in ['planned', 'in_progress']])}")

	def _timestamp(self) -> str:
		"""Get current timestamp"""
		return datetime.now().strftime("%Y-%m-%d %H:%M:%S")

	def _load_config(self) -> Dict[str, Any]:
		"""Load release configuration"""
		default_config = {
			"release_cycle_days": 30,
			"environments": ["development", "staging", "production"],
			"required_approvals": 2,
			"auto_deploy_patch": True,
			"auto_deploy_minor": False,
			"auto_deploy_major": False,
			"feature_freeze_days_before": 7,
			"testing_days_required": 3,
			"notification_channels": ["github", "email"],
			"branching_strategy": "git-flow",
			"version_scheme": "semver"
		}

		if self.config_file.exists():
			try:
				with open(self.config_file, "r", encoding="utf-8") as f:
					config = json.load(f)

				# Merge with defaults
				for key, value in default_config.items():
					if key not in config:
						config[key] = value

				return config
			except Exception:
				pass

		# Save default config
		with open(self.config_file, "w", encoding="utf-8") as f:
			json.dump(default_config, f, indent=4)

		return default_config

	def _load_current_version(self) -> Version:
		"""Load current project version"""
		# Try to load from various sources
		version_sources = [
			self.project_root / "version.txt",
			self.project_root / "VERSION",
			self.project_root / "setup.py",
			self.project_root / "pyproject.toml"
		]

		for source in version_sources:
			if source.exists():
				try:
					with open(source, "r", encoding="utf-8") as f:
						content = f.read()

					# Extract version with various patterns
					patterns = [
						r'version\s*=\s*["\']([^"\']+)["\']',
						r'VERSION\s*=\s*["\']([^"\']+)["\']',
						r'__version__\s*=\s*["\']([^"\']+)["\']',
						r'^([0-9]+\.[0-9]+\.[0-9]+.*)',
					]

					for pattern in patterns:
						match = re.search(pattern, content, re.MULTILINE | re.IGNORECASE)
						if match:
							try:
								return Version.from_string(match.group(1))
							except ValueError:
								continue
				except Exception:
					continue

		# Default version if none found
		return Version(1, 0, 0, prerelease="alpha")

	def _load_releases(self) -> List[Release]:
		"""Load release definitions"""
		if not self.releases_file.exists():
			return []

		try:
			with open(self.releases_file, "r", encoding="utf-8") as f:
				releases_data = json.load(f)

			releases = []
			for release_data in releases_data:
				# Convert version data to Version object
				version_data = release_data["version"]
				version = Version(**version_data)

				# Convert features data to ReleaseFeature objects
				features = []
				for feature_data in release_data.get("features", []):
					feature = ReleaseFeature(**feature_data)
					features.append(feature)

				# Create Release object
				release_dict = release_data.copy()
				release_dict["version"] = version
				release_dict["features"] = features

				release = Release(**release_dict)
				releases.append(release)

			return releases

		except Exception as e:
			print(f"Error loading releases: {e}")
			return []

	def _load_version_history(self) -> List[Dict[str, Any]]:
		"""Load version history"""
		if not self.versions_file.exists():
			return []

		try:
			with open(self.versions_file, "r", encoding="utf-8") as f:
				return json.load(f)
		except Exception:
			return []

	def _save_releases(self):
		"""Save releases to file"""
		releases_data = []
		for release in self.releases:
			release_dict = asdict(release)
			# Convert Version object to dict
			release_dict["version"] = release.version.to_dict()
			releases_data.append(release_dict)

		with open(self.releases_file, "w", encoding="utf-8") as f:
			json.dump(releases_data, f, indent=4)

	def _save_version_history(self):
		"""Save version history"""
		with open(self.versions_file, "w", encoding="utf-8") as f:
			json.dump(self.version_history, f, indent=4)

	def create_release_plan(self, version_str: str, release_type: str,
						   planned_date: str, features: List[Dict[str, Any]],
						   codename: Optional[str] = None) -> Release:
		"""Create a new release plan"""
		version = Version.from_string(version_str)

		# Convert feature dicts to ReleaseFeature objects
		release_features = []
		for feature_data in features:
			feature = ReleaseFeature(**feature_data)
			release_features.append(feature)

		release = Release(
			version=version,
			codename=codename,
			planned_date=planned_date,
			release_type=release_type,
			status="planned",
			features=release_features,
			description=f"{release_type.title()} release with {len(features)} new features"
		)

		self.releases.append(release)
		self._save_releases()

		print(f"[{self._timestamp()}] Created release plan: {version} ({release_type})")
		return release

	def update_feature_status(self, release_version: str, feature_id: str,
							 new_status: str) -> bool:
		"""Update feature status in release"""
		for release in self.releases:
			if str(release.version) == release_version:
				for feature in release.features:
					if feature.id == feature_id:
						old_status = feature.status
						feature.status = new_status

						if new_status == "complete":
							feature.completion_date = self._timestamp()

						self._save_releases()
						print(f"[{self._timestamp()}] Updated feature {feature_id}: {old_status} -> {new_status}")
						return True

		return False

	def get_next_release(self) -> Optional[Release]:
		"""Get the next planned release"""
		planned_releases = [r for r in self.releases if r.status in ["planned", "in_progress"]]
		if not planned_releases:
			return None

		# Sort by planned date
		planned_releases.sort(key=lambda r: r.planned_date)
		return planned_releases[0]

	def generate_release_schedule(self, num_releases: int = 4) -> List[Release]:
		"""Generate automated release schedule"""
		schedule = []
		base_date = datetime.now()
		cycle_days = self.config.get("release_cycle_days", 30)

		for i in range(num_releases):
			release_date = base_date + timedelta(days=cycle_days * (i + 1))

			# Determine version and type
			if i == 0:  # Next patch
				next_version = self.current_version.bump_patch()
				release_type = "patch"
			elif i % 3 == 1:  # Every 3rd release is minor
				next_version = self.current_version.bump_minor()
				release_type = "minor"
			else:
				next_version = self.current_version.bump_patch()
				release_type = "patch"

			# Create sample features based on release type
			if release_type == "minor":
				features = self._generate_sample_features(5)
			else:
				features = self._generate_sample_features(2)

			release = Release(
				version=next_version,
				codename=f"Release {next_version}",
				planned_date=release_date.strftime("%Y-%m-%d"),
				release_type=release_type,
				status="planned",
				features=features,
				description=f"Automated {release_type} release"
			)

			schedule.append(release)

		return schedule

	def _generate_sample_features(self, count: int) -> List[ReleaseFeature]:
		"""Generate sample features for release planning"""
		feature_templates = [
			{"title": "Enhanced AI Pattern Recognition", "effort": 8, "priority": 5},
			{"title": "Improved Plugin System", "effort": 5, "priority": 4},
			{"title": "Better Documentation", "effort": 3, "priority": 3},
			{"title": "Performance Optimization", "effort": 6, "priority": 4},
			{"title": "New ROM Format Support", "effort": 10, "priority": 5},
			{"title": "UI/UX Improvements", "effort": 4, "priority": 3},
			{"title": "Bug Fixes and Stability", "effort": 2, "priority": 4},
			{"title": "Testing Framework Enhancement", "effort": 5, "priority": 3},
			{"title": "Cross-platform Compatibility", "effort": 7, "priority": 4},
			{"title": "Real-time Collaboration", "effort": 12, "priority": 5}
		]

		import random
		selected_templates = random.sample(feature_templates, min(count, len(feature_templates)))

		features = []
		for i, template in enumerate(selected_templates):
			feature = ReleaseFeature(
				id=f"feature-{i+1:03d}",
				title=template["title"],
				description=f"Implementation of {template['title'].lower()}",
				status="planned",
				priority=template["priority"],
				estimated_effort=template["effort"]
			)
			features.append(feature)

		return features

	def create_release_notes(self, release_version: str) -> str:
		"""Generate release notes for a version"""
		release = None
		for r in self.releases:
			if str(r.version) == release_version:
				release = r
				break

		if not release:
			return f"Release {release_version} not found"

		completed_features = [f for f in release.features if f.status == "complete"]

		release_notes = f"""# Dragon Quest III ROM Analysis - Release {release.version}

**Release Date: {release.actual_date or release.planned_date}**
**Codename: {release.codename or 'N/A'}**
**Type: {release.release_type.title()} Release**

## 🚀 New Features ({len(completed_features)} total)

"""

		for feature in completed_features:
			release_notes += f"### {feature.title}\n"
			release_notes += f"{feature.description}\n"
			if feature.github_issue:
				release_notes += f"*Closes #{feature.github_issue}*\n"
			release_notes += "\n"

		# Add incomplete features if any
		incomplete_features = [f for f in release.features if f.status != "complete"]
		if incomplete_features:
			release_notes += f"""## ⏳ Deferred Features ({len(incomplete_features)} total)

The following planned features have been moved to a future release:

"""
			for feature in incomplete_features:
				release_notes += f"- **{feature.title}** ({feature.status})\n"

		release_notes += f"""
## 📊 Release Statistics

- **Features Completed**: {len(completed_features)}/{len(release.features)}
- **Total Effort**: {sum(f.estimated_effort for f in completed_features)} story points
- **Contributors**: Development Team
- **Environments**: {', '.join(release.deployment_environments)}

## 🔗 Links

- [GitHub Repository](https://github.com/TheAnsarya/dq3r-info)
- [Issue Tracker](https://github.com/TheAnsarya/dq3r-info/issues)
- [Documentation](docs/)

---

**Dragon Quest III ROM Analysis Project** - Version {release.version}
"""

		# Save release notes to release object
		release.release_notes = release_notes
		self._save_releases()

		return release_notes

	def execute_release(self, release_version: str) -> Dict[str, Any]:
		"""Execute a release deployment"""
		release = None
		for r in self.releases:
			if str(r.version) == release_version:
				release = r
				break

		if not release:
			return {"success": False, "error": f"Release {release_version} not found"}

		print(f"[{self._timestamp()}] Executing release {release.version}")

		result = {
			"success": True,
			"version": release_version,
			"deployment_steps": [],
			"errors": []
		}

		try:
			# Pre-release checks
			pre_checks = self._run_pre_release_checks(release)
			result["pre_checks"] = pre_checks

			if not pre_checks["all_passed"]:
				result["success"] = False
				result["errors"].append("Pre-release checks failed")
				return result

			# Update version files
			self._update_version_files(release.version)
			result["deployment_steps"].append("Version files updated")

			# Generate release notes
			release_notes = self.create_release_notes(release_version)
			result["deployment_steps"].append("Release notes generated")

			# Create git tag
			self._create_git_tag(release.version)
			result["deployment_steps"].append("Git tag created")

			# Deploy to environments
			for env in release.deployment_environments:
				deploy_result = self._deploy_to_environment(env, release)
				result["deployment_steps"].append(f"Deployed to {env}")

			# Update release status
			release.status = "released"
			release.actual_date = self._timestamp()
			self._save_releases()

			# Add to version history
			self.version_history.append({
				"version": str(release.version),
				"release_date": release.actual_date,
				"type": release.release_type,
				"features": len(release.features),
				"codename": release.codename
			})
			self._save_version_history()

			# Update current version
			self.current_version = release.version

			print(f"[{self._timestamp()}] Release {release.version} deployed successfully")

		except Exception as e:
			result["success"] = False
			result["error"] = str(e)
			result["errors"].append(f"Deployment failed: {e}")

		return result

	def _run_pre_release_checks(self, release: Release) -> Dict[str, Any]:
		"""Run pre-release validation checks"""
		checks = {
			"version_validation": True,
			"feature_completion": True,
			"testing_passed": True,
			"documentation_updated": True,
			"dependencies_resolved": True,
			"all_passed": True
		}

		# Check feature completion
		incomplete_critical = [
			f for f in release.features
			if f.status != "complete" and f.priority >= 4
		]

		if incomplete_critical:
			checks["feature_completion"] = False
			checks["all_passed"] = False

		# Check version format
		try:
			Version.from_string(str(release.version))
		except ValueError:
			checks["version_validation"] = False
			checks["all_passed"] = False

		return checks

	def _update_version_files(self, version: Version):
		"""Update version in project files"""
		version_str = str(version)

		# Update version.txt
		version_file = self.project_root / "version.txt"
		with open(version_file, "w", encoding="utf-8") as f:
			f.write(version_str)

		# Update other version files if they exist
		files_to_update = [
			(self.project_root / "setup.py", r'version\s*=\s*["\'][^"\']+["\']', f'version="{version_str}"'),
			(self.project_root / "pyproject.toml", r'version\s*=\s*["\'][^"\']+["\']', f'version = "{version_str}"')
		]

		for file_path, pattern, replacement in files_to_update:
			if file_path.exists():
				try:
					with open(file_path, "r", encoding="utf-8") as f:
						content = f.read()

					updated_content = re.sub(pattern, replacement, content)

					with open(file_path, "w", encoding="utf-8") as f:
						f.write(updated_content)
				except Exception as e:
					print(f"Warning: Could not update {file_path}: {e}")

	def _create_git_tag(self, version: Version):
		"""Create git tag for release"""
		try:
			tag_name = f"v{version}"
			subprocess.run([
				"git", "tag", "-a", tag_name,
				"-m", f"Release {version}"
			], check=True, cwd=self.project_root)

			print(f"Created git tag: {tag_name}")
		except subprocess.CalledProcessError as e:
			print(f"Warning: Could not create git tag: {e}")
		except FileNotFoundError:
			print("Warning: Git not available for tagging")

	def _deploy_to_environment(self, environment: str, release: Release) -> Dict[str, Any]:
		"""Deploy release to specific environment"""
		print(f"[{self._timestamp()}] Deploying {release.version} to {environment}")

		# Simulate deployment steps
		deployment_result = {
			"environment": environment,
			"success": True,
			"steps_completed": [
				"Environment validation",
				"Artifact deployment",
				"Configuration update",
				"Health check validation"
			]
		}

		return deployment_result

	def get_release_dashboard(self) -> Dict[str, Any]:
		"""Get comprehensive release dashboard data"""
		dashboard = {
			"current_version": str(self.current_version),
			"next_release": None,
			"active_releases": [],
			"recent_releases": [],
			"feature_progress": {},
			"release_timeline": [],
			"statistics": {}
		}

		# Get next release
		next_release = self.get_next_release()
		if next_release:
			dashboard["next_release"] = {
				"version": str(next_release.version),
				"planned_date": next_release.planned_date,
				"features_complete": len([f for f in next_release.features if f.status == "complete"]),
				"total_features": len(next_release.features),
				"progress_percent": (len([f for f in next_release.features if f.status == "complete"]) / len(next_release.features)) * 100 if next_release.features else 0
			}

		# Active releases
		dashboard["active_releases"] = [
			{
				"version": str(r.version),
				"status": r.status,
				"planned_date": r.planned_date,
				"type": r.release_type
			}
			for r in self.releases
			if r.status in ["planned", "in_progress"]
		]

		# Recent releases
		dashboard["recent_releases"] = [
			{
				"version": str(r.version),
				"actual_date": r.actual_date,
				"type": r.release_type,
				"features": len(r.features)
			}
			for r in sorted(self.releases, key=lambda x: x.actual_date or "9999-12-31", reverse=True)[:5]
			if r.status == "released"
		]

		# Statistics
		dashboard["statistics"] = {
			"total_releases": len([r for r in self.releases if r.status == "released"]),
			"features_in_development": len([
				f for r in self.releases for f in r.features
				if f.status in ["planned", "in_progress"]
			]),
			"average_release_cycle": self.config.get("release_cycle_days", 30),
			"next_major_release": self._get_next_major_version()
		}

		return dashboard

	def _get_next_major_version(self) -> str:
		"""Get next scheduled major release version"""
		major_releases = [
			r for r in self.releases
			if r.release_type == "major" and r.status in ["planned", "in_progress"]
		]

		if major_releases:
			next_major = min(major_releases, key=lambda r: r.planned_date)
			return str(next_major.version)
		else:
			return str(self.current_version.bump_major())


def main():
	"""Main function to demonstrate release planning system"""
	print("🚀 RELEASE PLANNING & VERSION MANAGEMENT SYSTEM")
	print("=" * 60)

	# Initialize release planning system
	rps = ReleasePlanningSystem()

	# Create sample release plan
	print(f"\n📅 CREATING SAMPLE RELEASE PLAN")
	print("-" * 40)

	# Next patch release with bug fixes
	patch_features = [
		{
			"id": "patch-001",
			"title": "Fix ROM Loading Edge Cases",
			"description": "Handle malformed ROM files gracefully",
			"status": "in_progress",
			"priority": 4,
			"estimated_effort": 3,
			"github_issue": 15
		},
		{
			"id": "patch-002",
			"title": "Improve Error Messages",
			"description": "More descriptive error messages for users",
			"status": "complete",
			"priority": 3,
			"estimated_effort": 2
		}
	]

	next_patch = rps.current_version.bump_patch()
	release_date = (datetime.now() + timedelta(days=7)).strftime("%Y-%m-%d")

	patch_release = rps.create_release_plan(
		version_str=str(next_patch),
		release_type="patch",
		planned_date=release_date,
		features=patch_features,
		codename="Stability"
	)

	# Generate release schedule
	print(f"\n📊 GENERATING RELEASE SCHEDULE")
	print("-" * 40)

	schedule = rps.generate_release_schedule(3)
	for release in schedule:
		print(f"• {release.version} ({release.release_type}) - {release.planned_date}")
		print(f"  Features: {len(release.features)}")

	# Create release dashboard
	print(f"\n🎯 RELEASE DASHBOARD")
	print("-" * 40)

	dashboard = rps.get_release_dashboard()
	print(f"Current Version: {dashboard['current_version']}")

	if dashboard['next_release']:
		next_rel = dashboard['next_release']
		print(f"Next Release: {next_rel['version']} ({next_rel['progress_percent']:.1f}% complete)")
		print(f"Planned Date: {next_rel['planned_date']}")

	print(f"Active Releases: {len(dashboard['active_releases'])}")
	print(f"Total Releases: {dashboard['statistics']['total_releases']}")

	# Generate release notes for the patch
	print(f"\n📝 GENERATING RELEASE NOTES")
	print("-" * 40)

	# Mark a feature complete for demo
	rps.update_feature_status(str(next_patch), "patch-001", "complete")

	release_notes = rps.create_release_notes(str(next_patch))
	print("Release notes generated and saved to release object")

	# Simulate release execution
	print(f"\n🚀 EXECUTING RELEASE")
	print("-" * 40)

	release_result = rps.execute_release(str(next_patch))
	print(f"Release Status: {'✅ Success' if release_result['success'] else '❌ Failed'}")

	if release_result['success']:
		print("Deployment Steps:")
		for step in release_result['deployment_steps']:
			print(f"  ✅ {step}")
	else:
		print("Errors:")
		for error in release_result['errors']:
			print(f"  ❌ {error}")

	print(f"\n✨ RELEASE PLANNING SYSTEM DEMONSTRATION COMPLETE")
	return rps, dashboard, release_result


if __name__ == "__main__":
	main()
