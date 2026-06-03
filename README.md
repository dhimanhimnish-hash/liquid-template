# Liquid Templates in Lean 4

A formal verification of a Liquid template DSL using Lean 4.

## What this project does
Models Liquid templates as an AST, defines an eval function,
and mathematically proves correctness and security guarantees.

## Files
- Basic.lean    — Template AST, Value, Env, eval
- Proofs.lean   — 9 structural and equivalence proofs
- Security.lean — 4 injection safety proofs
- Filters.lean  — 7 filter correctness proofs

## Theorems Proved
1. Determinism
2. Text identity
3. Sequence concatenation
4. If-true branch
5. If-false branch
6. Missing variable returns ""
7. Template equivalence
8. Dead code elimination
9. Empty template identity
10. Escape empty string
11. Escape < to &lt;
12. Escape > to &gt;
13. Escape & to &amp;
14. Unknown filter unchanged
15. upcase empty
16. downcase empty
17. strip whitespace
18. upcase hello
19. downcase hello
20. reverse hello

## How to build
lake build
