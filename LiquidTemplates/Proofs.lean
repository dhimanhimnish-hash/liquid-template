import LiquidTemplates.Basic
open Liquid

-- ============================================================
-- PROOF 1: Determinism
-- Same template + same environment always gives same output
-- ============================================================

theorem eval_deterministic (t : Template) (env : Env) :
    eval t env = eval t env := by
  rfl

-- ============================================================
-- PROOF 2: Text is always returned as-is
-- ============================================================

theorem eval_text (s : String) (env : Env) :
    eval (Template.text s) env = s := by
  rfl

-- ============================================================
-- PROOF 3: Sequence concatenates both parts
-- ============================================================

theorem eval_seq (t1 t2 : Template) (env : Env) :
    eval (Template.seq t1 t2) env = eval t1 env ++ eval t2 env := by
  rfl

-- ============================================================
-- PROOF 4: If condition is false, else branch is taken
-- ============================================================

theorem eval_if_false (t f : Template) (env : Env) :
    eval (Template.ifBlock "flag" t f) (("flag", Value.bool false) :: env) =
    eval f (("flag", Value.bool false) :: env) := by
  rfl

-- ============================================================
-- PROOF 5: If condition is true, then branch is taken
-- ============================================================

theorem eval_if_true (t f : Template) (env : Env) :
    eval (Template.ifBlock "flag" t f) (("flag", Value.bool true) :: env) =
    eval t (("flag", Value.bool true) :: env) := by
  rfl

-- ============================================================
-- PROOF 6: Missing variable returns empty string
-- ============================================================

theorem eval_missing_var (env : Env) :
    eval (Template.var "x") [] = "" := by
  rfl

