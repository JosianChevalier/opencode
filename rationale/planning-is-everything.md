# Rationale: Planning

Why plans are direction, not prescription — and why "planning is everything, the plan is nothing."

## Epistemic complexity

In Cynefin terms, software work behaves like the **complex domain**: cause and effect are only knowable in retrospect, so the sound strategy is probe–sense–respond, not analyze-then-execute. A codebase is arguably not *ontologically* complex — deterministic, inspectable, finite — but it is **epistemically complex**: what a change will reveal (hidden coupling, a flawed data structure, a missing domain concept) cannot be known before acting. Since the constraint is on our knowledge, not the system's nature, we act *as if* in the complex domain: the plan is a probe, execution is the sensing.

This is why detailed upfront plans fail predictably. A step-by-step prescription encodes knowledge we don't yet have. First contact with the code invalidates it — "the plan is the first casualty of reality" — and a prescriptive plan then becomes actively harmful: agents follow the letter of stale instructions instead of responding to what they found.

## Code is the side effect of learning

Nick Tune's framing: the primary output of software development is **learning** — a better model of the domain and the system. Code merely crystallizes it. A plan should therefore not pre-write the code (pretending the learning already happened); it should **orient the learning**: state the goal, sequence the probes, leave room for what each probe reveals.

Hence the plan structure: high-level stages, no file lists, no step-by-step instructions. Each stage is a synchronization point where accumulated learning is written back into the plan before the next probe.

## Forecast and state

The plan file carries two contents with opposite natures:

- **The forecast** (remaining stages) — a best guess, rewritten freely, expected to be wrong in detail. *The map is not the territory* (Korzybski): when the territory contradicts the map, the territory wins and the map is redrawn — never the reverse.
- **The state** (work done, decisions made, blockers, the real next step) — facts, not guesses. Map things *as they really are, not as we wish they were*: wishes belong in the forecast; smuggling them into the state corrupts the only facts the next agent has.

Eisenhower's aphorism captures the asymmetry: the *activity* of planning builds the shared model; the *artifact* is a disposable snapshot. "The plan is nothing" disposes of the forecast, never the state. As execution proceeds, content migrates from forecast to state — each stage consumed converts a guess into a fact. When the last stage is consumed, the forecast is empty, the state is fully realized in commits, and the file is deleted.

## Make the change easy, then make the easy change

Stages are ordered so reshaping precedes implementing (@rationale/workflow-rhythm.md). Same epistemic bet at plan scale: reshaping stages are the cheapest probes — they surface model tension early, while the design is still fluid, instead of mid-feature.

## The state keeps only what affects the future

Per context economics, the plan is loaded by every subsequent agent — each token is a recurring cost. The retention criterion is forward-looking: keep **decisions made, discovered context, blockers, and the real next step** (the first unchecked box may not be it).

The past doesn't qualify. Completed stages collapse to a one-liner in Completed — enough for the next agent to know the ground it stands on — because their details are already crystallized in commits; keeping them in the plan would be a copy where a pointer suffices (@rationale/context-economics.md, one canonical home per fact).

## Consequence for reading plans

An executing agent treats a stage as direction: verify it still makes sense against reality, adapt, and update the plan with what execution revealed. Diverging from the plan is not failure — it is the mechanism working. Silent compliance with a stale stage is the actual failure mode.
