---
name: repo-onboarding
version: 1
description: Load when the task starts in an unfamiliar repository and the agent must understand project structure, entry points, commands, and conventions before editing code.
agents: [main_agent, general_purpose, coding_agent]
---

# Repo Onboarding

Understand the repository before making changes. Build a compact mental model of structure, runtime, tooling, tests, and conventions.

## When to use
Load this skill when:
- The user asks to work in an existing codebase.
- The repository is unfamiliar.
- The task mentions “look through the repo”, “understand the project”, “where is X implemented”, or “find how this works”.
- A safe change requires discovering architecture first.

## Goals
- Identify project type, languages, package managers, frameworks, and build system.
- Find entry points, main modules, test setup, lint/format config, and environment files.
- Infer local conventions before proposing or editing code.
- Reduce unnecessary exploration and avoid speculative edits.

## Workflow
1. Detect top-level structure: source dirs, config files, lockfiles, CI, docs.
2. Identify stack: language, framework, runtime, package manager, test tools.
3. Find execution paths: app entry point, server startup, CLI main, worker jobs, routing.
4. Find quality gates: test commands, linters, formatters, type checks, CI jobs.
5. Summarize architecture in 5-10 bullets before changing code.
6. Only then locate the narrow files relevant to the requested task.

## What to inspect
- README, CONTRIBUTING, docs/, ADRs.
- package.json, pyproject.toml, Cargo.toml, go.mod, Makefile, docker-compose.yml, justfile.
- CI files: .github/workflows, gitlab-ci, Jenkinsfile.
- Lint/type configs: eslint, prettier, tsconfig, mypy, ruff, pytest, tox.
- App entry points: src/main.*, app.*, server.*, cmd/, bin/, routes/, controllers/.
- Test layout: tests/, __tests__/, fixtures/, mocks/.

## Rules
- Do not edit code until the repository map is clear.
- Prefer existing project patterns over introducing new abstractions.
- If multiple subsystems exist, state which one is in scope.
- Distinguish facts from inference; label assumptions.
- Keep the onboarding summary compact and task-oriented.

## Anti-patterns
- Jumping into the first matching file without understanding call flow.
- Assuming package scripts reflect actual production startup.
- Refactoring during onboarding.
- Searching only by filename and ignoring config or wiring.

## Done criteria
- Stack and package manager identified.
- Entry points and relevant module boundaries identified.
- Test/lint/type-check commands identified or explicitly missing.
- A concise architecture summary is ready to guide implementation.
