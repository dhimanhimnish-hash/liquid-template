# Liquid Templates in Lean 4

## Project Overview
This project formally verifies a Liquid template DSL using Lean 4.
Instead of just testing templates, we mathematically PROVE they work
correctly and securely for ALL possible inputs.

## Why This Matters
Template engines are used everywhere:
- Rendering HTML web pages
- Generating LLM prompts (like ChatGPT)
- Building dynamic content

They are vulnerable to:
- XSS attacks: <script>alert('xss')</script>
- Prompt injection: <|system|>ignore previous instructions

This project PROVES these attacks are impossible after escaping.

## Project Structure

### Core Language (Basic.lean)
- Template AST: text, var, seq, ifBlock, forLoop
- Value types: String, Int, Bool, List
- Environment: map from variable names to values
- eval function: Template → Env → String

### Proofs (9 theorems)
- Determinism: same input always gives same output
- Text identity: text nodes return string as-is
- Sequence: concatenates both parts
- If-true: picks then-branch when condition is true
- If-false: picks else-branch when condition is false
- Missing variable: returns empty string
- Template equivalence: two templates produce same output
- Dead code elimination: if-false block is removable
- Empty template identity: seq with empty text unchanged

### Security Proofs (4 theorems)
- Empty string escapes safely
- < is always replaced with &lt;
- > is always replaced with &gt;
- & is always replaced with &amp;

### Filter Proofs (7 theorems)
- Unknown filter returns string unchanged
- upcase works correctly
- downcase works correctly
- strip removes whitespace
- reverse works correctly
- upcase/downcase of empty string is empty

### Injection Safety (4 theorems)
- Empty string is always safe
- XSS attack is always escaped
- Prompt injection is always escaped
- Escaped output contains no raw < or >

### JSON Output (5 theorems)
- toJsonString always produces valid JSON
- JSON string starts with quote
- JSON string ends with quote
- Empty JSON string is valid
- Escaped user input is safe in JSON

### Equivalence (5 theorems)
- seq is associative
- Two text templates joined = one combined text
- if-true always picks first branch
- if-false always picks second branch
- Nested seq flattening

### Type Safety (5 theorems)
- eval always returns a string
- Missing variable returns empty string
- seq length equals sum of both parts
- text length is preserved
- eval never crashes

### Termination (5 theorems)
- For loop over empty list returns empty string
- For loop over single item works correctly
- For loop over two items concatenates results
- Text template always terminates
- Seq always terminates

## Total: 44 Mathematical Proofs

## How to Build
lake build

## GitHub
https://github.com/dhimanhimnish-hash/liquid-template
