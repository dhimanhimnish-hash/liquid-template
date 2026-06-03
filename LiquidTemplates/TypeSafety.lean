import LiquidTemplates.Basic
open Liquid

-- ============================================================
-- TYPE SAFETY PROOFS
-- Prove that eval always returns a String, never crashes
-- ============================================================

-- ============================================================
-- PROOF 1: eval always returns a string for text
-- ============================================================
theorem eval_text_is_string (s : String) (env : Env) :
    (eval (Template.text s) env).length >= 0 := by
  simp [eval]

-- ============================================================
-- PROOF 2: eval of var on empty env returns empty string
-- ============================================================
theorem eval_var_empty_env (x : String) :
    eval (Template.var x) [] = "" := by
  simp [eval, Env.lookup]

-- ============================================================
-- PROOF 3: eval of seq length is sum of both parts
-- ============================================================
theorem eval_seq_length (t1 t2 : Template) (env : Env) :
    (eval (Template.seq t1 t2) env).length =
    (eval t1 env).length + (eval t2 env).length := by
  simp [eval, String.length_append]

-- ============================================================
-- PROOF 4: text length is preserved
-- ============================================================
theorem eval_text_length (s : String) (env : Env) :
    (eval (Template.text s) env).length = s.length := by
  simp [eval]

-- ============================================================
-- PROOF 5: eval never returns longer than both branches combined
-- ============================================================
theorem eval_if_length (x : String) (t f : Template) (env : Env) (v : Value) :
    (eval (Template.ifBlock x t f) ((x, v) :: env)).length ≤
    (eval t ((x, v) :: env)).length +
    (eval f ((x, v) :: env)).length + 1 := by
  simp [eval, Env.lookup]
  split <;> omega

