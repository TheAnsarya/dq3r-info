"""
Team Coordination and Workflow Management System
===============================================

Comprehensive team coordination system for Dragon Quest III ROM Analysis project.
Implements real-time collaboration, task assignment, and workflow automation.

Addresses GitHub Issue #18: Team Coordination and Workflow Management

Created: 2025-11-10 10:46:59
"""

import json
import asyncio
import websockets
import threading
import time
from datetime import datetime, timedelta
from typing import Dict, List, Optional, Any, Set
from dataclasses import dataclass, asdict, field
from pathlib import Path
from enum import Enum


class TaskStatus(Enum):
	"""Task status enumeration"""
	BACKLOG = "backlog"
	TODO = "todo"
	IN_PROGRESS = "in_progress"
	IN_REVIEW = "in_review"
	TESTING = "testing"
	DONE = "done"
	BLOCKED = "blocked"


class Priority(Enum):
	"""Priority levels"""
	CRITICAL = 5
	HIGH = 4
	MEDIUM = 3
	LOW = 2
	MINIMAL = 1


class UserRole(Enum):
	"""User roles in the project"""
	ADMIN = "admin"
	LEAD = "lead"
	DEVELOPER = "developer"
	TESTER = "tester"
	REVIEWER = "reviewer"
	CONTRIBUTOR = "contributor"


@dataclass
class TeamMember:
	"""Team member definition"""
	id: str
	name: str
	email: str
	role: UserRole
	skills: List[str] = field(default_factory=list)
	availability: float = 1.0  # 0.0 to 1.0
	timezone: str = "UTC"
	github_username: Optional[str] = None
	last_active: Optional[str] = None
	current_tasks: List[str] = field(default_factory=list)
	completed_tasks: int = 0
	joined_date: Optional[str] = None


@dataclass
class Task:
	"""Task definition"""
	id: str
	title: str
	description: str
	status: TaskStatus
	priority: Priority
	assigned_to: Optional[str] = None
	created_by: str = "system"
	created_date: Optional[str] = None
	due_date: Optional[str] = None
	estimated_hours: float = 0.0
	actual_hours: float = 0.0
	tags: List[str] = field(default_factory=list)
	dependencies: List[str] = field(default_factory=list)
	github_issue: Optional[int] = None
	comments: List[Dict[str, Any]] = field(default_factory=list)
	work_log: List[Dict[str, Any]] = field(default_factory=list)


@dataclass
class WorkSession:
	"""Work session tracking"""
	id: str
	user_id: str
	task_id: str
	start_time: str
	end_time: Optional[str] = None
	duration_minutes: int = 0
	description: str = ""
	commits: List[str] = field(default_factory=list)


@dataclass
class TeamMetrics:
	"""Team performance metrics"""
	total_tasks: int = 0
	completed_tasks: int = 0
	in_progress_tasks: int = 0
	average_completion_time: float = 0.0
	team_velocity: float = 0.0
	workload_distribution: Dict[str, float] = field(default_factory=dict)
	bottlenecks: List[str] = field(default_factory=list)


class TeamCoordinationSystem:
	"""Complete team coordination and workflow management system"""

	def __init__(self, project_root: str = "."):
		"""Initialize team coordination system"""
		self.project_root = Path(project_root).resolve()
		self.data_dir = self.project_root / "team_data"
		self.data_dir.mkdir(exist_ok=True)

		# Data files
		self.team_file = self.data_dir / "team_members.json"
		self.tasks_file = self.data_dir / "tasks.json"
		self.sessions_file = self.data_dir / "work_sessions.json"
		self.config_file = self.data_dir / "team_config.json"

		# In-memory data
		self.team_members: Dict[str, TeamMember] = self._load_team_members()
		self.tasks: Dict[str, Task] = self._load_tasks()
		self.work_sessions: List[WorkSession] = self._load_work_sessions()
		self.active_sessions: Dict[str, WorkSession] = {}

		# Configuration
		self.config = self._load_config()

		# Real-time coordination
		self.connected_clients: Set[websockets.WebSocketServerProtocol] = set()
		self.websocket_server = None
		self.server_thread = None

		# Task assignment optimization
		self.task_queue = asyncio.Queue()
		self.assignment_weights = {
			"skill_match": 0.4,
			"workload": 0.3,
			"availability": 0.2,
			"performance": 0.1
		}

		print(f"[{self._timestamp()}] Team Coordination System initialized")
		print(f"Team members: {len(self.team_members)}")
		print(f"Active tasks: {len([t for t in self.tasks.values() if t.status != TaskStatus.DONE])}")

	def _timestamp(self) -> str:
		"""Get current timestamp"""
		return datetime.now().strftime("%Y-%m-%d %H:%M:%S")

	def _load_config(self) -> Dict[str, Any]:
		"""Load team configuration"""
		default_config = {
			"websocket_port": 8765,
			"auto_assignment": True,
			"notification_channels": ["websocket", "email"],
			"daily_standup_time": "09:00",
			"sprint_duration_days": 14,
			"max_concurrent_tasks": 3,
			"overtime_threshold_hours": 8,
			"performance_review_interval": 30,
			"time_tracking_enabled": True,
			"burndown_chart_enabled": True
		}

		if self.config_file.exists():
			try:
				with open(self.config_file, "r", encoding="utf-8") as f:
					config = json.load(f)

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

	def _load_team_members(self) -> Dict[str, TeamMember]:
		"""Load team members from file"""
		if not self.team_file.exists():
			return {}

		try:
			with open(self.team_file, "r", encoding="utf-8") as f:
				members_data = json.load(f)

			members = {}
			for member_data in members_data:
				member = TeamMember(
					id=member_data["id"],
					name=member_data["name"],
					email=member_data["email"],
					role=UserRole(member_data["role"]),
					skills=member_data.get("skills", []),
					availability=member_data.get("availability", 1.0),
					timezone=member_data.get("timezone", "UTC"),
					github_username=member_data.get("github_username"),
					last_active=member_data.get("last_active"),
					current_tasks=member_data.get("current_tasks", []),
					completed_tasks=member_data.get("completed_tasks", 0),
					joined_date=member_data.get("joined_date")
				)
				members[member.id] = member

			return members

		except Exception as e:
			print(f"Error loading team members: {e}")
			return {}

	def _load_tasks(self) -> Dict[str, Task]:
		"""Load tasks from file"""
		if not self.tasks_file.exists():
			return {}

		try:
			with open(self.tasks_file, "r", encoding="utf-8") as f:
				tasks_data = json.load(f)

			tasks = {}
			for task_data in tasks_data:
				task = Task(
					id=task_data["id"],
					title=task_data["title"],
					description=task_data["description"],
					status=TaskStatus(task_data["status"]),
					priority=Priority(task_data["priority"]),
					assigned_to=task_data.get("assigned_to"),
					created_by=task_data.get("created_by", "system"),
					created_date=task_data.get("created_date"),
					due_date=task_data.get("due_date"),
					estimated_hours=task_data.get("estimated_hours", 0.0),
					actual_hours=task_data.get("actual_hours", 0.0),
					tags=task_data.get("tags", []),
					dependencies=task_data.get("dependencies", []),
					github_issue=task_data.get("github_issue"),
					comments=task_data.get("comments", []),
					work_log=task_data.get("work_log", [])
				)
				tasks[task.id] = task

			return tasks

		except Exception as e:
			print(f"Error loading tasks: {e}")
			return {}

	def _load_work_sessions(self) -> List[WorkSession]:
		"""Load work sessions from file"""
		if not self.sessions_file.exists():
			return []

		try:
			with open(self.sessions_file, "r", encoding="utf-8") as f:
				sessions_data = json.load(f)

			sessions = []
			for session_data in sessions_data:
				session = WorkSession(
					id=session_data["id"],
					user_id=session_data["user_id"],
					task_id=session_data["task_id"],
					start_time=session_data["start_time"],
					end_time=session_data.get("end_time"),
					duration_minutes=session_data.get("duration_minutes", 0),
					description=session_data.get("description", ""),
					commits=session_data.get("commits", [])
				)
				sessions.append(session)

			return sessions

		except Exception as e:
			print(f"Error loading work sessions: {e}")
			return []

	def _save_team_members(self):
		"""Save team members to file"""
		members_data = []
		for member in self.team_members.values():
			member_dict = asdict(member)
			member_dict["role"] = member.role.value
			members_data.append(member_dict)

		with open(self.team_file, "w", encoding="utf-8") as f:
			json.dump(members_data, f, indent=4)

	def _save_tasks(self):
		"""Save tasks to file"""
		tasks_data = []
		for task in self.tasks.values():
			task_dict = asdict(task)
			task_dict["status"] = task.status.value
			task_dict["priority"] = task.priority.value
			tasks_data.append(task_dict)

		with open(self.tasks_file, "w", encoding="utf-8") as f:
			json.dump(tasks_data, f, indent=4)

	def _save_work_sessions(self):
		"""Save work sessions to file"""
		sessions_data = [asdict(session) for session in self.work_sessions]

		with open(self.sessions_file, "w", encoding="utf-8") as f:
			json.dump(sessions_data, f, indent=4)

	def add_team_member(self, name: str, email: str, role: str,
					   skills: List[str] = None, github_username: str = None) -> str:
		"""Add new team member"""
		member_id = f"member-{len(self.team_members) + 1:03d}"

		member = TeamMember(
			id=member_id,
			name=name,
			email=email,
			role=UserRole(role),
			skills=skills or [],
			github_username=github_username,
			joined_date=self._timestamp()
		)

		self.team_members[member_id] = member
		self._save_team_members()

		# Broadcast to connected clients (if event loop is running)
		try:
			loop = asyncio.get_event_loop()
			if loop.is_running():
				asyncio.create_task(self._broadcast_update({
					"type": "team_member_added",
					"member": asdict(member),
					"timestamp": self._timestamp()
				}))
		except RuntimeError:
			# No event loop running, skip broadcast
			pass

		print(f"[{self._timestamp()}] Added team member: {name} ({role})")
		return member_id

	def create_task(self, title: str, description: str, priority: str,
				   created_by: str = "system", tags: Optional[List[str]] = None,
				   estimated_hours: float = 0.0, due_date: Optional[str] = None) -> str:
		"""Create new task"""
		task_id = f"task-{len(self.tasks) + 1:04d}"

		task = Task(
			id=task_id,
			title=title,
			description=description,
			status=TaskStatus.BACKLOG,
			priority=Priority(int(priority)) if isinstance(priority, str) and priority.isdigit() else Priority[priority.upper()],
			created_by=created_by,
			created_date=self._timestamp(),
			due_date=due_date,
			estimated_hours=estimated_hours,
			tags=tags or []
		)

		self.tasks[task_id] = task
		self._save_tasks()

		# Auto-assign if enabled
		if self.config.get("auto_assignment", True):
			self.auto_assign_task(task_id)

		# Broadcast update (if event loop is running)
		try:
			loop = asyncio.get_event_loop()
			if loop.is_running():
				asyncio.create_task(self._broadcast_update({
					"type": "task_created",
					"task": asdict(task),
					"timestamp": self._timestamp()
				}))
		except RuntimeError:
			# No event loop running, skip broadcast
			pass

		print(f"[{self._timestamp()}] Created task: {title}")
		return task_id

	def assign_task(self, task_id: str, user_id: str) -> bool:
		"""Assign task to team member"""
		if task_id not in self.tasks or user_id not in self.team_members:
			return False

		task = self.tasks[task_id]
		member = self.team_members[user_id]

		# Check if member already has too many tasks
		max_tasks = self.config.get("max_concurrent_tasks", 3)
		if len(member.current_tasks) >= max_tasks:
			print(f"Warning: {member.name} already has {len(member.current_tasks)} tasks")

		# Update assignment
		old_assignee = task.assigned_to
		task.assigned_to = user_id
		task.status = TaskStatus.TODO

		# Update member's current tasks
		if old_assignee and old_assignee in self.team_members:
			old_member = self.team_members[old_assignee]
			if task_id in old_member.current_tasks:
				old_member.current_tasks.remove(task_id)

		member.current_tasks.append(task_id)

		# Add assignment comment
		task.comments.append({
			"timestamp": self._timestamp(),
			"user": "system",
			"message": f"Task assigned to {member.name}",
			"type": "assignment"
		})

		self._save_tasks()
		self._save_team_members()

		# Broadcast update (if event loop is running)
		try:
			loop = asyncio.get_event_loop()
			if loop.is_running():
				asyncio.create_task(self._broadcast_update({
					"type": "task_assigned",
					"task_id": task_id,
					"assigned_to": user_id,
					"timestamp": self._timestamp()
				}))
		except RuntimeError:
			# No event loop running, skip broadcast
			pass

		print(f"[{self._timestamp()}] Assigned task {task_id} to {member.name}")
		return True

	def auto_assign_task(self, task_id: str) -> Optional[str]:
		"""Automatically assign task to best suited team member"""
		if task_id not in self.tasks:
			return None

		task = self.tasks[task_id]
		best_member = self._find_best_assignee(task)

		if best_member:
			self.assign_task(task_id, best_member.id)
			return best_member.id

		return None

	def _find_best_assignee(self, task: Task) -> Optional[TeamMember]:
		"""Find best team member for task assignment"""
		if not self.team_members:
			return None

		scores = {}

		for member_id, member in self.team_members.items():
			if member.availability <= 0:
				continue

			score = 0.0

			# Skill match
			skill_match = 0.0
			if task.tags and member.skills:
				matching_skills = set(task.tags) & set(member.skills)
				skill_match = len(matching_skills) / len(task.tags)
			score += skill_match * self.assignment_weights["skill_match"]

			# Workload (inverse - fewer tasks = higher score)
			max_tasks = self.config.get("max_concurrent_tasks", 3)
			workload_score = (max_tasks - len(member.current_tasks)) / max_tasks
			score += workload_score * self.assignment_weights["workload"]

			# Availability
			score += member.availability * self.assignment_weights["availability"]

			# Performance (completion rate)
			total_assigned = member.completed_tasks + len(member.current_tasks)
			if total_assigned > 0:
				completion_rate = member.completed_tasks / total_assigned
			else:
				completion_rate = 0.5  # Default for new members
			score += completion_rate * self.assignment_weights["performance"]

			scores[member_id] = score

		if not scores:
			return None

		# Get member with highest score
		best_member_id = max(scores.keys(), key=lambda k: scores[k])
		return self.team_members[best_member_id]

	def update_task_status(self, task_id: str, new_status: str, user_id: str = "system") -> bool:
		"""Update task status"""
		if task_id not in self.tasks:
			return False

		task = self.tasks[task_id]
		old_status = task.status

		try:
			task.status = TaskStatus(new_status)
		except ValueError:
			print(f"Invalid status: {new_status}")
			return False

		# Handle status transitions
		if task.status == TaskStatus.DONE and task.assigned_to:
			member = self.team_members[task.assigned_to]
			member.completed_tasks += 1
			if task_id in member.current_tasks:
				member.current_tasks.remove(task_id)

		# Add status change comment
		task.comments.append({
			"timestamp": self._timestamp(),
			"user": user_id,
			"message": f"Status changed from {old_status.value} to {new_status}",
			"type": "status_change"
		})

		self._save_tasks()
		self._save_team_members()

		# Broadcast update (if event loop is running)
		try:
			loop = asyncio.get_event_loop()
			if loop.is_running():
				asyncio.create_task(self._broadcast_update({
					"type": "task_status_updated",
					"task_id": task_id,
					"old_status": old_status.value,
					"new_status": new_status,
					"updated_by": user_id,
					"timestamp": self._timestamp()
				}))
		except RuntimeError:
			# No event loop running, skip broadcast
			pass

		print(f"[{self._timestamp()}] Task {task_id} status: {old_status.value} -> {new_status}")
		return True

	def start_work_session(self, user_id: str, task_id: str, description: str = "") -> Optional[str]:
		"""Start work session for task"""
		if user_id not in self.team_members or task_id not in self.tasks:
			return None

		# End any existing session for this user
		self.end_work_session(user_id)

		session_id = f"session-{len(self.work_sessions) + 1:06d}"

		session = WorkSession(
			id=session_id,
			user_id=user_id,
			task_id=task_id,
			start_time=self._timestamp(),
			description=description
		)

		self.active_sessions[user_id] = session

		# Update task status if not already in progress
		task = self.tasks[task_id]
		if task.status == TaskStatus.TODO:
			self.update_task_status(task_id, TaskStatus.IN_PROGRESS.value, user_id)

		# Update member activity
		self.team_members[user_id].last_active = self._timestamp()
		self._save_team_members()

		# Broadcast update (if event loop is running)
		try:
			loop = asyncio.get_event_loop()
			if loop.is_running():
				asyncio.create_task(self._broadcast_update({
					"type": "work_session_started",
					"session_id": session_id,
					"user_id": user_id,
					"task_id": task_id,
					"timestamp": self._timestamp()
				}))
		except RuntimeError:
			# No event loop running, skip broadcast
			pass

		print(f"[{self._timestamp()}] {self.team_members[user_id].name} started work on {task_id}")
		return session_id

	def end_work_session(self, user_id: str) -> Optional[WorkSession]:
		"""End active work session for user"""
		if user_id not in self.active_sessions:
			return None

		session = self.active_sessions[user_id]
		session.end_time = self._timestamp()

		# Calculate duration
		start = datetime.fromisoformat(session.start_time.replace("Z", "+00:00"))
		end = datetime.fromisoformat(session.end_time.replace("Z", "+00:00"))
		session.duration_minutes = int((end - start).total_seconds() / 60)

		# Update task actual hours
		task = self.tasks[session.task_id]
		task.actual_hours += session.duration_minutes / 60

		# Add work log entry
		task.work_log.append({
			"session_id": session.id,
			"user_id": user_id,
			"duration_minutes": session.duration_minutes,
			"timestamp": session.start_time,
			"description": session.description
		})

		# Save session
		self.work_sessions.append(session)
		del self.active_sessions[user_id]

		self._save_work_sessions()
		self._save_tasks()

		# Broadcast update (if event loop is running)
		try:
			loop = asyncio.get_event_loop()
			if loop.is_running():
				asyncio.create_task(self._broadcast_update({
					"type": "work_session_ended",
					"session": asdict(session),
					"timestamp": self._timestamp()
				}))
		except RuntimeError:
			# No event loop running, skip broadcast
			pass

		print(f"[{self._timestamp()}] Work session ended: {session.duration_minutes} minutes")
		return session

	async def _broadcast_update(self, message: Dict[str, Any]):
		"""Broadcast update to all connected clients"""
		if not self.connected_clients:
			return

		message_json = json.dumps(message)

		# Send to all connected clients
		disconnected_clients = set()
		for client in self.connected_clients:
			try:
				await client.send(message_json)
			except websockets.exceptions.ConnectionClosed:
				disconnected_clients.add(client)

		# Remove disconnected clients
		self.connected_clients -= disconnected_clients

	async def _websocket_handler(self, websocket, path):
		"""Handle WebSocket connections"""
		self.connected_clients.add(websocket)
		print(f"[{self._timestamp()}] Client connected via WebSocket")

		try:
			# Send current state to new client
			await websocket.send(json.dumps({
				"type": "initial_state",
				"team_members": len(self.team_members),
				"active_tasks": len([t for t in self.tasks.values() if t.status != TaskStatus.DONE]),
				"active_sessions": len(self.active_sessions),
				"timestamp": self._timestamp()
			}))

			# Handle incoming messages
			async for message in websocket:
				try:
					data = json.loads(message)
					await self._handle_client_message(data, websocket)
				except json.JSONDecodeError:
					await websocket.send(json.dumps({
						"type": "error",
						"message": "Invalid JSON format"
					}))

		except websockets.exceptions.ConnectionClosed:
			pass
		finally:
			self.connected_clients.remove(websocket)
			print(f"[{self._timestamp()}] Client disconnected")

	async def _handle_client_message(self, data: Dict[str, Any], websocket):
		"""Handle incoming client messages"""
		message_type = data.get("type")

		if message_type == "get_tasks":
			await websocket.send(json.dumps({
				"type": "tasks_data",
				"tasks": [asdict(task) for task in self.tasks.values()],
				"timestamp": self._timestamp()
			}))

		elif message_type == "get_team":
			await websocket.send(json.dumps({
				"type": "team_data",
				"members": [asdict(member) for member in self.team_members.values()],
				"timestamp": self._timestamp()
			}))

		elif message_type == "ping":
			await websocket.send(json.dumps({
				"type": "pong",
				"timestamp": self._timestamp()
			}))

	def start_websocket_server(self):
		"""Start WebSocket server for real-time updates"""
		def run_server():
			loop = asyncio.new_event_loop()
			asyncio.set_event_loop(loop)

			port = self.config.get("websocket_port", 8765)
			start_server = websockets.serve(self._websocket_handler, "localhost", port)

			loop.run_until_complete(start_server)
			print(f"[{self._timestamp()}] WebSocket server started on port {port}")
			loop.run_forever()

		self.server_thread = threading.Thread(target=run_server, daemon=True)
		self.server_thread.start()

	def get_team_metrics(self) -> TeamMetrics:
		"""Calculate team performance metrics"""
		metrics = TeamMetrics()

		# Basic counts
		metrics.total_tasks = len(self.tasks)
		metrics.completed_tasks = len([t for t in self.tasks.values() if t.status == TaskStatus.DONE])
		metrics.in_progress_tasks = len([t for t in self.tasks.values() if t.status == TaskStatus.IN_PROGRESS])

		# Average completion time
		completed_tasks = [t for t in self.tasks.values() if t.status == TaskStatus.DONE and t.actual_hours > 0]
		if completed_tasks:
			metrics.average_completion_time = sum(t.actual_hours for t in completed_tasks) / len(completed_tasks)

		# Team velocity (tasks per week)
		recent_completions = []
		week_ago = datetime.now() - timedelta(days=7)

		for session in self.work_sessions:
			if session.end_time:
				end_time = datetime.fromisoformat(session.end_time.replace("Z", "+00:00"))
				if end_time > week_ago:
					recent_completions.append(session.task_id)

		unique_completed_tasks = len(set(recent_completions))
		metrics.team_velocity = unique_completed_tasks

		# Workload distribution
		for member_id, member in self.team_members.items():
			current_workload = len(member.current_tasks)
			metrics.workload_distribution[member.name] = current_workload

		# Identify bottlenecks
		blocked_tasks = [t for t in self.tasks.values() if t.status == TaskStatus.BLOCKED]
		overloaded_members = [
			m.name for m in self.team_members.values()
			if len(m.current_tasks) > self.config.get("max_concurrent_tasks", 3)
		]

		metrics.bottlenecks.extend([f"Blocked task: {t.title}" for t in blocked_tasks])
		metrics.bottlenecks.extend([f"Overloaded: {name}" for name in overloaded_members])

		return metrics

	def generate_daily_report(self) -> str:
		"""Generate daily team report"""
		metrics = self.get_team_metrics()

		report = f"""# Daily Team Report - {datetime.now().strftime('%Y-%m-%d')}

## 📊 Team Metrics
- **Total Tasks**: {metrics.total_tasks}
- **Completed**: {metrics.completed_tasks}
- **In Progress**: {metrics.in_progress_tasks}
- **Team Velocity**: {metrics.team_velocity} tasks/week
- **Avg Completion Time**: {metrics.average_completion_time:.1f} hours

## 👥 Team Status
"""

		for member in self.team_members.values():
			active_tasks = len(member.current_tasks)
			last_active = member.last_active or "Never"

			report += f"- **{member.name}** ({member.role.value}): {active_tasks} tasks, last active {last_active}\n"

		if metrics.bottlenecks:
			report += f"\n## ⚠️ Bottlenecks ({len(metrics.bottlenecks)})\n"
			for bottleneck in metrics.bottlenecks:
				report += f"- {bottleneck}\n"

		# Active sessions
		if self.active_sessions:
			report += f"\n## 🔥 Active Work Sessions ({len(self.active_sessions)})\n"
			for user_id, session in self.active_sessions.items():
				member = self.team_members[user_id]
				task = self.tasks[session.task_id]
				start_time = session.start_time
				report += f"- **{member.name}**: {task.title} (started {start_time})\n"

		report += f"\n---\n*Generated by Team Coordination System at {self._timestamp()}*"

		return report


def main():
	"""Main function to demonstrate team coordination system"""
	print("🤝 TEAM COORDINATION & WORKFLOW MANAGEMENT SYSTEM")
	print("=" * 65)

	# Initialize team coordination system
	tcs = TeamCoordinationSystem()

	# Add sample team members
	print(f"\n👥 ADDING TEAM MEMBERS")
	print("-" * 40)

	members = [
		("Alice Johnson", "alice@example.com", "lead", ["python", "ai", "machine-learning"]),
		("Bob Smith", "bob@example.com", "developer", ["python", "reverse-engineering", "assembly"]),
		("Carol White", "carol@example.com", "tester", ["testing", "qa", "documentation"]),
		("Dave Chen", "dave@example.com", "developer", ["graphics", "data-analysis", "python"])
	]

	member_ids = []
	for name, email, role, skills in members:
		member_id = tcs.add_team_member(name, email, role, skills)
		member_ids.append(member_id)
		print(f"Added: {name} ({role}) - Skills: {', '.join(skills)}")

	# Create sample tasks
	print(f"\n📋 CREATING TASKS")
	print("-" * 40)

	tasks = [
		("Implement ROM Pattern Recognition", "Advanced AI-based pattern recognition for ROM data", "HIGH", 12.0, ["ai", "python"]),
		("Fix Graphics Rendering Bug", "Resolve SNES graphics display issues", "CRITICAL", 4.0, ["graphics", "debugging"]),
		("Write User Documentation", "Create comprehensive user guide", "MEDIUM", 6.0, ["documentation"]),
		("Optimize Performance", "Improve analysis speed by 50%", "HIGH", 8.0, ["optimization", "python"]),
		("Add Unit Tests", "Increase test coverage to 90%", "MEDIUM", 10.0, ["testing", "qa"])
	]

	task_ids = []
	for title, desc, priority, hours, tags in tasks:
		task_id = tcs.create_task(title, desc, priority, estimated_hours=hours, tags=tags)
		task_ids.append(task_id)
		print(f"Created: {title} ({priority} priority, {hours}h)")

	# Start work sessions
	print(f"\n⏱️ STARTING WORK SESSIONS")
	print("-" * 40)

	# Alice starts working on AI task
	session1 = tcs.start_work_session(member_ids[0], task_ids[0], "Implementing neural network architecture")
	print(f"Alice started work session: {session1}")

	# Bob starts working on graphics bug
	session2 = tcs.start_work_session(member_ids[1], task_ids[1], "Debugging SNES graphics renderer")
	print(f"Bob started work session: {session2}")

	# Update task statuses
	print(f"\n📊 UPDATING TASK STATUS")
	print("-" * 40)

	tcs.update_task_status(task_ids[2], TaskStatus.IN_PROGRESS.value, member_ids[2])
	tcs.update_task_status(task_ids[3], TaskStatus.IN_REVIEW.value, member_ids[3])
	tcs.update_task_status(task_ids[4], TaskStatus.DONE.value, member_ids[2])

	print("Updated task statuses for demonstration")

	# Generate team metrics
	print(f"\n📈 TEAM METRICS")
	print("-" * 40)

	metrics = tcs.get_team_metrics()
	print(f"Total Tasks: {metrics.total_tasks}")
	print(f"Completed: {metrics.completed_tasks}")
	print(f"In Progress: {metrics.in_progress_tasks}")
	print(f"Team Velocity: {metrics.team_velocity} tasks/week")
	print(f"Average Completion Time: {metrics.average_completion_time:.1f} hours")

	if metrics.workload_distribution:
		print(f"\nWorkload Distribution:")
		for name, workload in metrics.workload_distribution.items():
			print(f"  {name}: {workload} tasks")

	if metrics.bottlenecks:
		print(f"\nBottlenecks:")
		for bottleneck in metrics.bottlenecks:
			print(f"  - {bottleneck}")

	# Generate daily report
	print(f"\n📄 DAILY REPORT")
	print("-" * 40)

	report = tcs.generate_daily_report()
	print(report)

	# Start WebSocket server for real-time updates
	print(f"\n🌐 STARTING REAL-TIME COORDINATION")
	print("-" * 40)

	tcs.start_websocket_server()
	print("WebSocket server started for real-time team coordination")
	print("Connect to ws://localhost:8765 for real-time updates")

	print(f"\n✨ TEAM COORDINATION SYSTEM DEMONSTRATION COMPLETE")

	# End work sessions for demo
	time.sleep(2)  # Simulate work time
	ended_session = tcs.end_work_session(member_ids[0])
	if ended_session:
		print(f"Ended Alice's work session: {ended_session.duration_minutes} minutes")

	return tcs, metrics, report


if __name__ == "__main__":
	main()
