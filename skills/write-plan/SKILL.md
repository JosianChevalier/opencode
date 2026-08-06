---
name: write-plan
description: Use when given a spec or requirements for multi-step work, before touching code, or after brainstorming validates a design.
---

# Write Plan

Create a plan in `docs/plans/YYYY-MM-DD-<topic>.md`.

## Minimum Skeleton

Every plan needs a **Goal**, a **Completed** section (filled during execution), and **Stages**. Beyond that, add whatever sections the context demands — diagrams, domain context, constraints, open questions, references.

## Principles

**High-level stages only.** No implementation details — no file lists, no step-by-step instructions. Occasional pseudocode to convey the intent of a target flow, but let execution handle the gritty details.

**Make the change easy, then make the easy change.** Structure stages so that design-reshaping stages (move types, introduce abstractions, align APIs) come before behavior stages that implement on the prepared ground. See [workflow-rhythm.md](../../docs/docs/practices/workflow-rhythm.md).

**Mark stages as sequential or parallel.** Parallel only when scopes do not overlap, so the user can dispatch agents accordingly.

**Size stages as synchronization points.** Small enough for a single agent without context drift, large enough to avoid micromanaging execution.

**Be concise but precise.** Plans are shared context between independent agents — optimize for context engineering.

**Expect evolution.** The plan is direction, not a contract. Stages will be rewritten, reordered, or dropped as reality unfolds.

## Iterating on the Plan

Update the plan when:
- We receive user feedback that changes the approach
- We choose a prototype (document the decision and selected option)

**Rule of thumb**: If the user makes a decision that affects how work will be done, update the plan immediately.
