---
name: clean-code-go
description: Use when writing or reviewing Go code for clean-code feedback about pure functions, local copy updates, and defensive checks. Use ONLY for these Go code-shape concerns.
---

# Clean Code (Go)

Principles for Go code-shape feedback covered by this skill.

## The Prime Directive

Prefer pure functions at the call boundary: a function should not mutate its input or hidden shared state unless that side effect is the point of the function.

## Pure Function Boundary

Local mutation of a copied value is acceptable when the caller cannot observe mutation.

```go
completed := ceInstance
completed.Data = completedData
return completed
```

That is different from mutating referenced input data, such as writing into a map owned by the caller.

## Return The Changed Concept

When a helper only computes one changed field, return that field instead of the whole parent object.

```go
func completeResolvedCeInstanceDataFromTemplate(ceInstance model.CEInstance) *commonModel.JSONData {
	// compute completed data
}
```

Let the boundary function assemble the parent value.

## Defensive Checks

Guard real runtime alternates and external data shapes.

Keep checks for cache misses, missing template form schemas, and malformed JSON-like schema fields.

Treat impossible wiring states as programming bugs, not silent fallbacks.
