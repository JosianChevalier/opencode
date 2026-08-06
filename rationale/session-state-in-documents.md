# Rationale: Session State Lives in Documents

Why the state of the work is written to the repo, never held in conversation.

## Agents are ephemeral processes

Treat an agent session like a backend process: it can crash, be killed, hit context rot, or simply end. Backend engineering solved this long ago — **crash-only design** and 12-factor **statelessness**: a process holds no irreplaceable state; everything durable lives in a backing store, so any instance can restart and pick up. The conversation window is the process memory; the repo is the backing store. Anything that exists only in the conversation is state we have already decided to lose.

## The conversation is for thinking; the repo is for remembering

(Pierrain, *A good harness makes /clear free*.) People don't clear sessions because resuming hurts: decisions, discarded alternatives, the real next step — all of it lives in the one place clearing destroys. The fix is structural, not disciplinary: the **plan file is the single source of truth for the state of the work** (@rationale/planning-is-everything.md defines what the state contains), with the conversation as its echo. Then the session is disposable *by construction*, and clearing stops being a cost you avoid and becomes an option you exercise freely.

The quality check: *if this session dies right now, what is lost?* If the answer isn't "nothing", the state isn't fully externalized.

## Save at hand-back, not at stage end

Checkboxes don't capture everything. The state (per planning's retention criterion) must be written explicitly **every time control returns to the user** — each such moment is a potential session boundary.

The cost model is the point: an unpredictable, compounding resume cost is replaced by a tiny, systematic write cost — paid by the agent, not the user.

## The plan is the handoff mechanism

Each stage runs in a fresh agent with **no memory of previous stages**; the plan file is the only channel through which learning crosses the session boundary. Updating the plan is therefore not bookkeeping — it *is* the deliverable of a stage, alongside the commits. An agent that executes perfectly but leaves the plan stale has stranded its learning in a dying process.

## The plan dies with the work

The plan is the canonical home for one thing only — the work in progress (@rationale/context-economics.md, one canonical home per fact) — and it is deleted when the work is done. Everything discovered along the way that deserves to outlive it must graduate to its own home first:

- code and design → **commits**
- conventions, workflows, corrected agent behavior → **the harness** (rules, skills, rationales)
- domain and system knowledge → **documentation**

Learning left in the plan at deletion time is lost; learning kept in the plan *instead of* its home is a copy waiting to diverge.
