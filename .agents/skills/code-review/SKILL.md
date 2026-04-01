---
name: code-review
version: 1
description: Load when reviewing a diff, pull request, patch, or set of code changes for correctness, maintainability, safety, and scope.
agents: [main_agent, general_purpose, coding_agent]
---

# Code Review

Review for correctness first, then risk, maintainability, and clarity. Be specific, prioritized, and evidence-based.

## When to use
Load this skill when the user asks to:
- review a PR
- inspect a patch
- find risks in changes
- assess code quality
- suggest improvements before merge

## Review priorities
1. Correctness
2. Security and data safety
3. Backward compatibility
4. Concurrency, state, and error handling
5. Test adequacy
6. Maintainability and readability
7. Performance, only where relevant

## Workflow
1. Understand the stated intent of the change.
2. Inspect the diff boundaries and identify touched subsystems.
3. Look for broken assumptions, missing validation, edge cases, and contract drift.
4. Check tests: missing cases, false confidence, fragile mocks.
5. Classify findings by severity: blocking, important, optional.
6. Summarize merge readiness and top risks.

## Review heuristics
- Trace inputs to outputs.
- Check null/empty/error branches.
- Check compatibility of API, schema, config, and migration behavior.
- Look for race conditions, duplicate state, and hidden side effects.
- Check naming and structure only after correctness.

## Rules
- Prefer precise findings over generic style advice.
- Every blocking comment should name the risk and affected scenario.
- Distinguish definite bugs from suggestions.
- Do not request refactors without explaining why they reduce risk or complexity.
- Praise can be brief; critical findings must be actionable.

## Anti-patterns
- Nitpicking style while missing functional issues.
- Calling something “wrong” without a scenario.
- Recommending broad rewrites in a review.
- Treating missing tests as the only issue when code logic is unsafe.

## Output format
Use three sections when possible:
- Blocking issues
- Important improvements
- Optional polish

## Done criteria
- Review findings are prioritized.
- Each important finding includes scenario, risk, and suggested direction.
- Merge readiness is stated clearly.
