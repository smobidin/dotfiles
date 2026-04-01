---
name: test-writing
version: 1
description: Load when the task is to create, expand, or repair automated tests for behavior, regressions, or integration flows.
agents: [main_agent, general_purpose, coding_agent]
---

# Test Writing

Write tests that verify behavior, not implementation trivia. Choose the lowest test level that gives high confidence.

## When to use
Load this skill when the user asks to:
- add tests
- improve coverage
- create a regression test
- fix flaky tests
- validate a feature automatically

## Goals
- Select the right test level: unit, integration, contract, or end-to-end.
- Maximize signal and minimize brittleness.
- Make failures readable and diagnostic.

## Test selection
- Use unit tests for pure logic and branching.
- Use integration tests for module boundaries, data flow, and framework wiring.
- Use API/contract tests for schemas, status codes, and compatibility.
- Use e2e only when user-critical workflows cannot be trusted at lower levels.

## Workflow
1. Identify the behavior to prove.
2. Choose the narrowest meaningful test level.
3. Reuse existing test helpers, fixtures, and factory patterns.
4. Arrange realistic inputs with minimal setup.
5. Assert observable outcomes, not private internals.
6. Name the test after the behavior and expected result.
7. Run and stabilize the test; remove flakiness sources.

## Rules
- One test should prove one behavior.
- Prefer deterministic inputs and clocks.
- Avoid network, filesystem, or time dependencies unless the test is explicitly integration-level.
- Mock only unstable or external boundaries.
- Assertions should explain the contract, not just compare snapshots.

## Anti-patterns
- Snapshot-only testing for complex logic.
- Mocking the unit under test.
- Overfitting assertions to implementation details.
- Creating broad end-to-end tests for logic that belongs in unit tests.

## Done criteria
- The chosen test level is justified.
- The test fails for the intended bad behavior and passes for the fixed/good behavior.
- Test names and assertions are readable.
- Flakiness risk is minimized.
