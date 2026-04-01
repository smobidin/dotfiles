---
name: bugfix
version: 1
description: Load when the user asks to investigate, reproduce, isolate, and fix a bug in an existing codebase.
agents: [main_agent, general_purpose, coding_agent]
---

# Bugfix

Fix bugs with the smallest verifiable change. Prefer root-cause fixes over cosmetic patches.

## When to use
Load this skill when the task mentions:
- bug
- error
- regression
- failing test
- crash
- unexpected behavior
- broken flow

## Goals
- Reproduce the problem or establish a credible failing scenario.
- Isolate the narrowest root cause.
- Implement the minimum safe fix.
- Prove the fix with tests, logs, or reproduction steps.

## Workflow
1. Clarify expected vs actual behavior.
2. Reproduce the issue locally, in tests, or via static trace if runtime is unavailable.
3. Narrow the fault domain: input, state transition, integration boundary, or output formatting.
4. State the root cause in one sentence.
5. Apply the smallest fix that addresses the root cause.
6. Run focused validation: tests, lint, type checks, or manual repro.
7. Check adjacent regressions in the same code path.

## Fix strategy
- Prefer fixing the cause, not hiding the symptom.
- Keep the diff small and explainable.
- Reuse existing utilities and conventions.
- Add or update a regression test whenever practical.
- If the bug comes from invalid assumptions, encode the assumption as validation or a test.

## Rules
- Never bundle refactoring into a bugfix unless strictly required.
- Do not silence errors without preserving observability.
- If reproduction is impossible, state the evidence chain clearly.
- If multiple possible causes exist, test the most likely one first.
- Preserve backward compatibility unless the bug is caused by unsupported behavior.

## Anti-patterns
- Multiple speculative fixes in one patch.
- Catch-all exception handling as a “solution”.
- Changing unrelated formatting or style in bugfix files.
- Marking flaky behavior as fixed without deterministic evidence.

## Done criteria
- The bug is reproducible before the fix and absent after it, or the evidence chain is explicit.
- Root cause is identified.
- The patch is minimal.
- Relevant checks pass.
- Regression risk is considered for neighboring flows.
