"""
GitHub Integration for Dragon Quest III ROM Analysis
===================================================

This module provides integration with GitHub for issue tracking,
automated workflows, and project management.

Created: 2025-11-09 14:08:45
"""

import os
import json
import requests
import subprocess
from typing import Dict, List, Optional, Any
from datetime import datetime


class GitHubIntegration:
	"""GitHub integration for project management"""

	def __init__(self, repo_owner: str = "TheAnsarya", repo_name: str = "dq3r-info"):
		"""
		Initialize GitHub integration

		Args:
			repo_owner: GitHub repository owner
			repo_name: Repository name
		"""
		self.repo_owner = repo_owner
		self.repo_name = repo_name
		self.repo_url = f"https://github.com/{repo_owner}/{repo_name}"
		self.api_base = f"https://api.github.com/repos/{repo_owner}/{repo_name}"

		# Try to get GitHub token from environment
		self.token = os.getenv('GITHUB_TOKEN')
		if not self.token:
			print("Warning: GITHUB_TOKEN environment variable not set")
			print("Some GitHub API features will be limited")

		self.headers = {
			'Accept': 'application/vnd.github.v3+json',
			'User-Agent': 'DQ3R-Analysis-Tool'
		}

		if self.token:
			self.headers['Authorization'] = f'token {self.token}'

	def create_issue_from_todo(self, todo_item: Dict[str, Any]) -> Optional[str]:
		"""
		Create GitHub issue from todo item

		Args:
			todo_item: Todo item dictionary

		Returns:
			Issue URL if created successfully
		"""
		if not self.token:
			print("GitHub token required to create issues")
			return None

		issue_data = {
			'title': todo_item['title'],
			'body': f"{todo_item['description']}\n\n**Status**: {todo_item['status']}\n**Created by**: DQ3R Analysis Tool",
			'labels': ['enhancement', 'rom-analysis']
		}

		# Add status-based labels
		if todo_item['status'] == 'in-progress':
			issue_data['labels'].append('in-progress')
		elif todo_item['status'] == 'completed':
			issue_data['labels'].append('completed')
			issue_data['state'] = 'closed'

		try:
			response = requests.post(
				f"{self.api_base}/issues",
				headers=self.headers,
				json=issue_data
			)

			if response.status_code == 201:
				issue_url = response.json()['html_url']
				print(f"Created issue: {issue_url}")
				return issue_url
			else:
				print(f"Failed to create issue: {response.status_code} - {response.text}")
				return None

		except Exception as e:
			print(f"Error creating issue: {e}")
			return None

	def sync_todos_with_issues(self, todo_list: List[Dict[str, Any]]) -> Dict[str, Any]:
		"""
		Sync todo list with GitHub issues

		Args:
			todo_list: List of todo items

		Returns:
			Sync results summary
		"""
		results = {
			'created_issues': [],
			'existing_issues': [],
			'errors': []
		}

		# Get existing issues
		try:
			existing_issues = self.get_project_issues()
			existing_titles = {issue['title']: issue for issue in existing_issues}
		except Exception as e:
			print(f"Failed to get existing issues: {e}")
			existing_titles = {}

		for todo in todo_list:
			title = todo['title']

			if title in existing_titles:
				results['existing_issues'].append(title)
				print(f"Issue already exists: {title}")
			else:
				issue_url = self.create_issue_from_todo(todo)
				if issue_url:
					results['created_issues'].append({
						'title': title,
						'url': issue_url
					})
				else:
					results['errors'].append(f"Failed to create issue for: {title}")

		return results

	def get_project_issues(self, state: str = 'all') -> List[Dict[str, Any]]:
		"""
		Get project issues from GitHub

		Args:
			state: Issue state filter ('open', 'closed', 'all')

		Returns:
			List of issue dictionaries
		"""
		try:
			response = requests.get(
				f"{self.api_base}/issues",
				headers=self.headers,
				params={'state': state, 'per_page': 100}
			)

			if response.status_code == 200:
				return response.json()
			else:
				print(f"Failed to get issues: {response.status_code}")
				return []

		except Exception as e:
			print(f"Error getting issues: {e}")
			return []

	def create_project_milestone(self, title: str, description: str, due_date: Optional[str] = None) -> Optional[str]:
		"""
		Create project milestone

		Args:
			title: Milestone title
			description: Milestone description
			due_date: Due date (ISO 8601 format)

		Returns:
			Milestone URL if created
		"""
		if not self.token:
			return None

		milestone_data = {
			'title': title,
			'description': description,
			'state': 'open'
		}

		if due_date:
			milestone_data['due_on'] = due_date

		try:
			response = requests.post(
				f"{self.api_base}/milestones",
				headers=self.headers,
				json=milestone_data
			)

			if response.status_code == 201:
				return response.json()['html_url']
			else:
				print(f"Failed to create milestone: {response.status_code}")
				return None

		except Exception as e:
			print(f"Error creating milestone: {e}")
			return None

	def create_feature_branch(self, feature_name: str, base_branch: str = 'main') -> bool:
		"""
		Create and checkout a new feature branch

		Args:
			feature_name: Name of the feature branch
			base_branch: Base branch to branch from

		Returns:
			True if successful
		"""
		try:
			# Ensure we're on the base branch and up to date
			subprocess.run(['git', 'checkout', base_branch], check=True)
			subprocess.run(['git', 'pull', 'origin', base_branch], check=True)

			# Create and checkout new branch
			branch_name = f"feat/{feature_name.lower().replace(' ', '-')}"
			subprocess.run(['git', 'checkout', '-b', branch_name], check=True)

			print(f"Created and switched to branch: {branch_name}")
			return True

		except subprocess.CalledProcessError as e:
			print(f"Git command failed: {e}")
			return False
		except Exception as e:
			print(f"Error creating branch: {e}")
			return False

	def commit_and_push(self, commit_message: str, files: Optional[List[str]] = None) -> bool:
		"""
		Commit changes and push to GitHub

		Args:
			commit_message: Commit message
			files: Specific files to commit (all if None)

		Returns:
			True if successful
		"""
		try:
			# Add files
			if files:
				for file in files:
					subprocess.run(['git', 'add', file], check=True)
			else:
				subprocess.run(['git', 'add', '.'], check=True)

			# Commit
			subprocess.run(['git', 'commit', '-m', commit_message], check=True)

			# Get current branch name
			result = subprocess.run(['git', 'branch', '--show-current'],
								  capture_output=True, text=True, check=True)
			branch_name = result.stdout.strip()

			# Push to origin
			subprocess.run(['git', 'push', 'origin', branch_name], check=True)

			print(f"Committed and pushed: {commit_message}")
			return True

		except subprocess.CalledProcessError as e:
			print(f"Git command failed: {e}")
			return False
		except Exception as e:
			print(f"Error committing: {e}")
			return False

	def create_pull_request(self, title: str, description: str,
						   head_branch: str, base_branch: str = 'main') -> Optional[str]:
		"""
		Create pull request

		Args:
			title: PR title
			description: PR description
			head_branch: Source branch
			base_branch: Target branch

		Returns:
			PR URL if created
		"""
		if not self.token:
			return None

		pr_data = {
			'title': title,
			'body': description,
			'head': head_branch,
			'base': base_branch
		}

		try:
			response = requests.post(
				f"{self.api_base}/pulls",
				headers=self.headers,
				json=pr_data
			)

			if response.status_code == 201:
				pr_url = response.json()['html_url']
				print(f"Created pull request: {pr_url}")
				return pr_url
			else:
				print(f"Failed to create PR: {response.status_code} - {response.text}")
				return None

		except Exception as e:
			print(f"Error creating PR: {e}")
			return None

	def setup_project_workflow(self) -> Dict[str, Any]:
		"""
		Set up complete project workflow

		Returns:
			Setup results summary
		"""
		workflow_results = {
			'milestones_created': [],
			'workflow_files_created': [],
			'labels_created': [],
			'errors': []
		}

		# Create project milestones
		milestones = [
			{
				'title': 'ROM Analysis Core',
				'description': 'Complete core ROM analysis functionality',
				'due_date': '2025-12-31T23:59:59Z'
			},
			{
				'title': 'Plugin System',
				'description': 'Extensible plugin architecture for community contributions',
				'due_date': '2025-11-30T23:59:59Z'
			},
			{
				'title': 'AI Integration',
				'description': 'Machine learning-based pattern recognition',
				'due_date': '2026-01-31T23:59:59Z'
			}
		]

		for milestone in milestones:
			result = self.create_project_milestone(**milestone)
			if result:
				workflow_results['milestones_created'].append(milestone['title'])

		# Create GitHub Actions workflow files
		self.create_workflow_files()
		workflow_results['workflow_files_created'] = [
			'.github/workflows/ci.yml',
			'.github/workflows/release.yml'
		]

		# Create issue templates
		self.create_issue_templates()

		return workflow_results

	def create_workflow_files(self):
		"""Create GitHub Actions workflow files"""
		# Create .github/workflows directory
		os.makedirs('.github/workflows', exist_ok=True)

		# CI workflow
		ci_workflow = """name: CI

on:
  push:
    branches: [ main, feat/* ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: 3.11

    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install pytest websockets
        if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

    - name: Run tests
      run: |
        python tests/simple_test_runner.py

    - name: Test plugin system
      run: |
        python test_plugin_system.py

  lint:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: 3.11

    - name: Install linting tools
      run: |
        python -m pip install --upgrade pip
        pip install flake8 black

    - name: Lint with flake8
      run: |
        flake8 tools/ plugins/ tests/ --count --select=E9,F63,F7,F82 --show-source --statistics

    - name: Check formatting with black
      run: |
        black --check tools/ plugins/ tests/
"""

		with open('.github/workflows/ci.yml', 'w') as f:
			f.write(ci_workflow)

		# Release workflow
		release_workflow = """name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  release:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - name: Create Release
      uses: actions/create-release@v1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        tag_name: ${{ github.ref }}
        release_name: Release ${{ github.ref }}
        body: |
          Dragon Quest III ROM Analysis Tool Release

          ## Changes
          - Updated ROM analysis tools
          - Enhanced plugin system
          - Bug fixes and improvements
        draft: false
        prerelease: false
"""

		with open('.github/workflows/release.yml', 'w') as f:
			f.write(release_workflow)

	def create_issue_templates(self):
		"""Create GitHub issue templates"""
		os.makedirs('.github/ISSUE_TEMPLATE', exist_ok=True)

		# Bug report template
		bug_template = """---
name: Bug report
about: Create a report to help us improve
title: '[BUG] '
labels: 'bug'
assignees: ''

---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Environment:**
 - OS: [e.g. Windows 10]
 - Python version: [e.g. 3.11]
 - ROM file: [e.g. Japanese/English]

**Additional context**
Add any other context about the problem here.
"""

		with open('.github/ISSUE_TEMPLATE/bug_report.md', 'w') as f:
			f.write(bug_template)

		# Feature request template
		feature_template = """---
name: Feature request
about: Suggest an idea for this project
title: '[FEATURE] '
labels: 'enhancement'
assignees: ''

---

**Is your feature request related to a problem? Please describe.**
A clear and concise description of what the problem is. Ex. I'm always frustrated when [...]

**Describe the solution you'd like**
A clear and concise description of what you want to happen.

**Describe alternatives you've considered**
A clear and concise description of any alternative solutions or features you've considered.

**Additional context**
Add any other context or screenshots about the feature request here.
"""

		with open('.github/ISSUE_TEMPLATE/feature_request.md', 'w') as f:
			f.write(feature_template)

	def get_repository_status(self) -> Dict[str, Any]:
		"""Get repository status information"""
		try:
			# Get repository info
			repo_response = requests.get(self.api_base, headers=self.headers)
			repo_info = repo_response.json() if repo_response.status_code == 200 else {}

			# Get branch info
			branches_response = requests.get(f"{self.api_base}/branches", headers=self.headers)
			branches = branches_response.json() if branches_response.status_code == 200 else []

			# Get issues/PRs count
			issues = self.get_project_issues()
			open_issues = [i for i in issues if i['state'] == 'open']
			closed_issues = [i for i in issues if i['state'] == 'closed']

			return {
				'repository': {
					'name': repo_info.get('name', 'Unknown'),
					'full_name': repo_info.get('full_name', 'Unknown'),
					'url': repo_info.get('html_url', self.repo_url),
					'stars': repo_info.get('stargazers_count', 0),
					'forks': repo_info.get('forks_count', 0),
					'language': repo_info.get('language', 'Unknown')
				},
				'branches': {
					'total': len(branches),
					'names': [b['name'] for b in branches[:10]]  # First 10
				},
				'issues': {
					'total': len(issues),
					'open': len(open_issues),
					'closed': len(closed_issues)
				}
			}

		except Exception as e:
			return {'error': str(e)}


def setup_github_integration():
	"""Set up complete GitHub integration"""
	print("=" * 60)
	print("SETTING UP GITHUB INTEGRATION")
	print("=" * 60)

	github = GitHubIntegration()

	# Get current repository status
	print("\n1. REPOSITORY STATUS")
	status = github.get_repository_status()
	if 'error' not in status:
		print(f"   Repository: {status['repository']['full_name']}")
		print(f"   URL: {status['repository']['url']}")
		print(f"   Language: {status['repository']['language']}")
		print(f"   Stars: {status['repository']['stars']}")
		print(f"   Branches: {status['branches']['total']}")
		print(f"   Issues: {status['issues']['open']} open, {status['issues']['closed']} closed")
	else:
		print(f"   Error getting repository status: {status['error']}")

	# Set up project workflow
	print("\n2. SETTING UP PROJECT WORKFLOW")
	workflow_results = github.setup_project_workflow()
	print(f"   Created milestones: {len(workflow_results['milestones_created'])}")
	print(f"   Created workflow files: {len(workflow_results['workflow_files_created'])}")

	# Sync todos with issues (if token available)
	if github.token:
		print("\n3. SYNCING TODOS WITH ISSUES")

		# Sample todos for demonstration
		sample_todos = [
			{
				'title': 'AI Pattern Recognition Engine',
				'description': 'Create AI-powered pattern recognition system for automatic data structure discovery. Use machine learning to identify unknown data patterns in ROM files.',
				'status': 'not-started'
			}
		]

		sync_results = github.sync_todos_with_issues(sample_todos)
		print(f"   Created issues: {len(sync_results['created_issues'])}")
		print(f"   Existing issues: {len(sync_results['existing_issues'])}")
		print(f"   Errors: {len(sync_results['errors'])}")
	else:
		print("\n3. TODO SYNC SKIPPED")
		print("   GitHub token not available")

	print("\n" + "=" * 60)
	print("GITHUB INTEGRATION SETUP COMPLETED")
	print("=" * 60)

	return github


if __name__ == "__main__":
	setup_github_integration()
