---
name: opencode-starter
version: 1
description: Top-level routing skill for OpenCode. Load when the agent needs to choose the right coding workflow skill or understand the available child skills in this pack.
agents: [build, plan, main_agent, general_purpose, coding_agent]
---

# OpenCode Starter Pack

This is the top-level routing skill for the OpenCode starter pack. It does not replace the child skills; it helps the agent choose the correct child skill and apply a consistent working style across coding tasks.

## Purpose

Use this file as the first layer of guidance when the task is related to working with code in an existing repository. Its job is to:
- classify the task,
- select the best child skill,
- avoid mixing incompatible workflows,
- keep implementation focused and reviewable.

## Child skills

| Skill | File | Use when |
|---|---|---|
| Repo Onboarding | `repo-onboarding/SKILL.md` | The repository is unfamiliar and the agent must first understand structure, entry points, stack, and commands. |
| Bugfix | `bugfix/SKILL.md` | The task is to investigate, reproduce, isolate, and fix a defect, regression, crash, or failing behavior. |
| Feature Delivery | `feature-delivery/SKILL.md` | The task is to add or extend product functionality, API behavior, workflow, screen, endpoint, or business logic. |
| Test Writing | `test-writing/SKILL.md` | The task is to add tests, improve confidence, create a regression test, or repair unstable test coverage. |
| Code Review | `code-review/SKILL.md` | The task is to review a diff, PR, patch, or change set for correctness, safety, maintainability, and missing cases. |

## Routing rules

Choose exactly one primary child skill first. Only combine skills when the task truly spans multiple phases.

### Use `repo-onboarding/SKILL.md` first when:
- the repository is new to the agent,
- the task says “look through the codebase”,
- the architecture is unclear,
- a safe implementation depends on understanding conventions first.

### Use `bugfix/SKILL.md` when:
- something is broken,
- there is a failing test,
- the user describes wrong behavior,
- the task asks for root-cause analysis or a minimal fix.

### Use `feature-delivery/SKILL.md` when:
- the user wants new behavior,
- an endpoint or screen must be added,
- a workflow must be extended,
- the change affects product functionality more than diagnosis.

### Use `test-writing/SKILL.md` when:
- tests are the main deliverable,
- coverage is missing,
- the change needs regression protection,
- flaky or low-signal tests must be repaired.

### Use `code-review/SKILL.md` when:
- the main task is evaluation rather than implementation,
- a diff or PR must be assessed,
- the user asks for risks, issues, or merge readiness.

## Combination patterns

Use combinations sparingly and in sequence.

- `repo-onboarding` -> `bugfix`: for bugs in an unfamiliar repository.
- `repo-onboarding` -> `feature-delivery`: for new work in an unfamiliar repository.
- `bugfix` -> `test-writing`: when a fix should add a regression test.
- `feature-delivery` -> `test-writing`: when a new feature needs explicit automated coverage.
- `feature-delivery` -> `code-review`: when self-reviewing a completed patch before handoff.

Avoid loading all child skills at once. Too many simultaneous instructions increase noise and create conflicting priorities.

## Global working style

Apply these rules regardless of which child skill is selected:
- Prefer the smallest change that fully solves the task.
- Match existing project conventions before introducing new abstractions.
- Keep diffs reviewable and scope-controlled.
- Distinguish observed facts from assumptions.
- Run the narrowest useful validation early, then broaden if needed.
- Preserve backward compatibility unless the task explicitly allows a breaking change.

## Task triage

Before choosing a child skill, answer these questions:
1. Is the main task understanding, fixing, building, testing, or reviewing?
2. Is the repository already understood well enough to edit safely?
3. Is the desired output code, tests, analysis, or review findings?
4. Does the task require a minimal patch or coordinated multi-layer changes?

If the answer is unclear, default to `repo-onboarding/SKILL.md` first.

## Suggested workflow

1. Classify the task.
2. Load one primary child skill.
3. Follow its workflow.
4. Only then load a second skill if the task naturally enters a new phase.
5. Summarize what was changed, verified, and intentionally left untouched.

## Directory structure

Expected pack layout:

```text
.opencode/skills/
├── SKILL.md
├── repo-onboarding/SKILL.md
├── bugfix/SKILL.md
├── feature-delivery/SKILL.md
├── test-writing/SKILL.md
└── code-review/SKILL.md
```

## Done criteria

This top-level skill is working correctly when:
- the correct child skill can be selected quickly,
- overlapping instructions are minimized,
- task routing is explicit,
- the child skills remain focused and non-redundant.
