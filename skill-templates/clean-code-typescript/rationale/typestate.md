# Rationale: Make Illegal States Unrepresentable

One through-line: move correctness out of vigilance — checks, discipline, review — into **structure** ("make illegal states unrepresentable", Minsky). Three levels: always-valid domain model, type-driven development as practice, typestate for transitions.

## Always-valid domain model

The boundary **parses, doesn't validate** (King): validation runs once at the edge and produces a typed witness; past it, the type *is* the proof that the value is legal (the Curry–Howard reading: a value of `OrderReady` is evidence that validation happened).

- **Edge cases are deleted, not handled.** Inside the domain, exceptional states cannot exist, so domain code carries no defensive branches — fewer checks, fewer tests for impossible cases, less cognitive load: the type holds the invariant so the reader doesn't have to.
- **Locality of reasoning.** To know what an object can be, read its type at the use site — never dig through the codebase for every state it might be in. For humans this is readability; for agents it is direct token economy: the type is compressed, trusted context.

## Type-driven development

- **Shortest feedback loop.** "Doesn't compile" arrives in milliseconds, before any test runs — and it quantifies universally: the checker proves *all* paths where a test samples points (∀ vs ∃).
- **No oversight possible.** A runtime guard must be remembered at every call site; an absent operation cannot be called. Correctness by construction, not by discipline.
- **The checker is a design critic.** When no structure can make the invalid unrepresentable, treat it as a signal of **model tension**: likely two bounded contexts folded into one, or a missing concept — split or redesign rather than guard.
- **Self-describing for agents.** A well-typed model needs no accompanying skill or context: what can legally be done with an object is readable from its type, at the point of use.

## Typestate

The technique is **typestate** (Strom & Yemini, 1986; popularized by Rust API design): encode an object's lifecycle state in its *type*, so an operation exists only on the states where it is legal. `cancel()` is not guarded on `OrderExpedited` — it is *absent*; the illegal transition is a compile error, not a runtime branch.

This is the transition-level of the same principle: value objects make invalid *values* unrepresentable, typestate makes invalid *transitions* unrepresentable. It encodes the domain's finite-state machine in types — legal call sequences become the **grammar** of a domain DSL. Autocompletion then enumerates exactly the legal moves from the current state — **affordances** (Norman): the object advertises what can be done with it. Engineers are steered by completion as they type; agents read the class and see directly where they can go.

Consumers demand the only state they can handle (`processOrder(order: OrderReady)`), which deletes a whole class of defensive checks downstream.

## TypeScript specifics

Union types plus literal discriminants make the state space closed: narrowing and `switch` exhaustiveness are compiler-checked. The explicit literal annotation (`readonly state: OrderState.Ready = OrderState.Ready`) is what lets *classes* participate in discriminated-union narrowing.

## Immutability is load-bearing

Transitions return a fresh instance of the next state's type. Mutating in place would let a reference's runtime state diverge from its static type — the type would lie. Typestate formally wants linear/affine handling of the old reference; in practice, immutability plus "use the returned value" is the JavaScript-world equivalent. Each transition appending its domain event is the same discipline applied to history: state is derived, changes are facts.
