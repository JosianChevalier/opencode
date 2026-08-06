---
name: execute-plan
description: Use when told to proceed with, continue, resume, or execute work on a named topic or stage — the topic likely matches a plan in docs/plans/.
---

# Execute Plan Stage

Execute exactly **one stage** from a plan in `docs/plans/`, then stop.

## Finding the Plan

Infer the relevant plan from `docs/plans/` based on the user's prompt context. Only ask if ambiguous.

## Before Starting

1. Read the plan
2. Verify the stage still makes sense — if reality diverged, adjust before executing
3. Pre-load relevant AGENTS.md and production code

## During Execution

- Treat the stage as **direction, not a contract** — adapt to what you actually find
- Follow the project's atomic commit, refactoring, and TDD flow skills
- Multiple commits can compose a stage, you can divide it in multiple steps
- **Update the plan continuously** as you discover new context — do not wait until the stage is done

## After Completing the Stage

Update the plan:

1. **Remove the stage** from the stages list
2. **Add a one-liner summary** of what was done to the Completed section
3. **Add any discovered context** relevant to upcoming stages
4. **Adjust remaining stages** if reality diverged from the plan

Delete the plan file when all stages are done.

## Constraints

- Execute ONE stage, then stop — do not proceed to the next, unless the user explicitly tells you to continue
- Each stage is run by an independent agent with **no memory of previous stages**
- The plan file is the **only way to pass context** to the next agent — anything you learned that the next agent needs must be written into the plan before you stop
