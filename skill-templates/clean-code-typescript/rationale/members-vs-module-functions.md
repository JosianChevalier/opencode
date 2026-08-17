# Rationale: Members vs Module Functions

The driving idea: maximize the **pure functional core** — logic as functions from values to values, `this`-free, trivially testable and composable ("functional core, imperative shell", Bernhardt). The class is reserved for what actually needs it: state and the public contract.

Extraction is priced by how code is actually read:

1. **API**: a class is read as its contract. A pure helper is not contract, so taking it out has zero impact on what the class presents — it sharpens it, if anything, by removing noise.
2. **Navigation is by reference, not by scroll**: readers reach a helper by clicking through to its definition, so a function living slightly outside the class is exactly as far as a private method — one click. File distance is nearly free; only reference distance counts.

Two TypeScript specifics make the extracted form strictly better, not merely equivalent:

- Non-export is the real privacy boundary — enforced by the module system itself at runtime, where `private` is a compile-time annotation.
- Module functions are `this`-free by construction, so they compose point-free in pipelines (`array.map(myFunction)`) with no receiver-binding to manage — the quirk is avoided, not handled.
