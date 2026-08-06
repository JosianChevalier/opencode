# Rationale: Context Economics

Context is the scarce resource. Every token loaded is budget spent and precision lost — degradation is gradual, but by ~100k tokens output is no longer trustworthy. All harness structure derives from this constraint.

## Additivity bias

Under pressure, the cheap local move is to *add*: a new file, a new rule, a new caveat. Each addition costs forever (loaded in every relevant session), compounds (more files → more contradictions → more meta-rules to arbitrate), and is never garbage-collected on its own. Hence **rework > adding**: the default fix is editing or deleting existing material; creating something new requires demonstrating no existing home fits.

## One canonical home per fact

Every piece of knowledge has exactly one home; anything else may only point to it, never copy it (Pierrain: "pointers, not copies"). Duplicates diverge inevitably, and reconciling diverging sources costs more than the copy ever saved. This is why the harness has no memory files, why completed plan stages collapse to pointers at commits, and why rationales reference each other instead of restating.

## Cohesion

One concept per rule file, cohesive files. The payoff is at harness-improvement time: a fix should require reading and editing exactly one file. Monoliths force loading everything to change anything — the exact failure the architecture exists to prevent.

## Loading policy

The axis split is a loading policy, not taxonomy: personal and frontmatter-less project rules are the only always-on cost; spatial rules inject deterministically when a touched file matches their `globs:`; temporal skills load on invocation; rationale loads only during harness work. Each axis exists to keep something *out* of some window.

## Rule → context (the AOP decision)

Spatial loading inverted from context-pulls-rules (per-subdomain AGENTS.md with refs) to rule-declares-context (`globs:` frontmatter, injected by the `opencode-rules` plugin). This is aspect-oriented programming's model — rules as aspects, globs as pointcuts — chosen for **determinism** (plugin hooks, not LLM judgment; survives compaction) and **free sharing** (one file, N globs). The accepted cost is AOP's classic one, **obliviousness**: a folder no longer self-describes its governing rules. Mitigation: the plugin's TUI sidebar shows which rules are active. If the plugin breaks or opencode ships native nested-AGENTS.md discovery, revisit this decision — the prior prose-wiring design is in git history.

## Sub-agents

Sub-agents are context firewalls: delegate exploratory or high-volume work so its tokens die with the sub-agent, returning only conclusions.

They are also the **unit of the temporal axis**: each workflow step runs as a sub-agent composed with only that step's skills and context (TDD → test-writer, green implementor, refactorer). Same economics, applied to time: just as spatial rules keep other contexts out of the window, per-step sub-agents keep other steps out. Skills are composable because this composition is deterministic — the agent definition declares what loads.
