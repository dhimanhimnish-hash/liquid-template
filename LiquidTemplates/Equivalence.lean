import LiquidTemplates.Basic
open Liquid

-- ============================================================
-- TEMPLATE EQUIVALENCE PROOFS
-- Prove that two different templates produce same output
-- ============================================================

-- ============================================================
-- PROOF 1: seq is associative
-- (A ++ B) ++ C = A ++ (B ++ C)
-- ============================================================
theorem seq_assoc (t1 t2 t3 : Template) (env : Env) :
    eval (Template.seq (Template.seq t1 t2) t3) env =
    eval (Template.seq t1 (Template.seq t2 t3)) env := by
  simp [eval, String.append_assoc]

-- ============================================================
-- PROOF 2: Two text templates joined = one combined text
-- ============================================================
theorem seq_text_equiv (s1 s2 : String) (env : Env) :
    eval (Template.seq (Template.text s1) (Template.text s2)) env =
    eval (Template.text (s1 ++ s2)) env := by
  simp [eval]

-- ============================================================
-- PROOF 3: if true always picks first branch
-- ============================================================
theorem if_true_equiv (t f : Template) (env : Env) :
    eval (Template.ifBlock "x" t f) (("x", Value.bool true) :: env) =
    eval t (("x", Value.bool true) :: env) := by
  simp [eval, Env.lookup]

-- ============================================================
-- PROOF 4: if false always picks second branch
-- ============================================================
theorem if_false_equiv (t f : Template) (env : Env) :
    eval (Template.ifBlock "x" t f) (("x", Value.bool false) :: env) =
    eval f (("x", Value.bool false) :: env) := by
  simp [eval, Env.lookup]

-- ============================================================
-- PROOF 5: Nested seq flattening
-- seq (text "a") (seq (text "b") (text "c")) =
-- seq (seq (text "a") (text "b")) (text "c")
-- ============================================================
theorem nested_seq_flatten (env : Env) :
    eval (Template.seq (Template.text "a")
         (Template.seq (Template.text "b") (Template.text "c"))) env =
    eval (Template.seq (Template.seq (Template.text "a") (Template.text "b"))
         (Template.text "c")) env := by
  simp [eval, String.append_assoc]

