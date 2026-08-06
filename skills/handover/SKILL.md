---
name: handover
description: Use when the user asks for a handover prompt to continue the current task in a new session with fresh context. Do NOT use for summaries, reports, or documentation requests.
---

# Handover

Produce a **CONCISE** handover prompt, output directly in the chat — no file.

- The next agent runs on the same harness: no re-specification of project, AGENTS.md, or rules.
- Include only: goal, current state, decisions made (with rationale if non-obvious), immediate next steps, open questions, key file paths.
- Optimise for context size — every token the next agent reads is budget spent.
