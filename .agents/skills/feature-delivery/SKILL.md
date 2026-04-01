---
name: feature-delivery
version: 1
description: Load when implementing a new feature or extending existing behavior in a codebase.
agents: [main_agent, general_purpose, coding_agent]
---

# Feature Delivery

Deliver new functionality in small, reviewable steps. Preserve consistency with the existing product and codebase.

## When to use
Load this skill when the user asks to:
- add a feature
- extend an API
- add a screen or endpoint
- support a new workflow
- implement requested product behavior

## Goals
- Convert a request into explicit behavior.
- Implement only the required scope.
- Keep changes coherent across backend, frontend, API, tests, and docs where applicable.
- Avoid overengineering.

## Workflow
1. Restate the requested behavior as acceptance criteria.
2. Identify the affected layers: UI, API, domain logic, storage, config, docs.
3. Find the narrowest insertion points in existing architecture.
4. Implement in slices: model/contracts, business logic, interface, validation, tests.
5. Run targeted checks after each meaningful slice.
6. Summarize what changed, what did not, and any follow-up work.

## Acceptance criteria checklist
- Who triggers the feature?
- What inputs are accepted?
- What outputs or state changes are expected?
- What errors or edge cases matter?
- What should remain unchanged?

## Rules
- Match existing patterns before inventing new ones.
- Keep public contracts explicit: API shape, flags, config keys, CLI args.
- Avoid hidden coupling; if a feature spans modules, document the seam.
- Add tests for the happy path and the most important edge cases.
- Update docs or examples when the user-facing behavior changes.

## Anti-patterns
- Implementing speculative future requirements.
- Mixing unrelated cleanup into feature work.
- Expanding scope because “it’s nearby”.
- Shipping UI without backend validation or vice versa.

## Done criteria
- Acceptance criteria are satisfied.
- Affected layers are updated consistently.
- Relevant tests and checks pass.
- The diff is structured and reviewable.
- User-visible changes are documented where needed.
