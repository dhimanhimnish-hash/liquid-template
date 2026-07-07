import LiquidTemplates.Basic
open Liquid

theorem eval_deterministic (t : Template) (env : Env) :
    eval t env = eval t env := by rfl

theorem eval_text (s : String) (env : Env) :
    eval (Template.text s) env = s := by rfl

theorem eval_seq (t1 t2 : Template) (env : Env) :
    eval (Template.seq t1 t2) env = eval t1 env ++ eval t2 env := by rfl

theorem eval_if_false (t f : Template) (env : Env) :
    eval (Template.ifBlock "flag" t f) (("flag", Value.bool false) :: env) =
    eval f (("flag", Value.bool false) :: env) := by rfl

theorem eval_if_true (t f : Template) (env : Env) :
    eval (Template.ifBlock "flag" t f) (("flag", Value.bool true) :: env) =
    eval t (("flag", Value.bool true) :: env) := by rfl

theorem eval_missing_var :
    eval (Template.var "x") [] = "" := by rfl

theorem eval_seq_text_var (env : Env) :
    eval (Template.seq (Template.text "Hello, ") (Template.var "name")) env =
    eval (Template.text "Hello, ") env ++ eval (Template.var "name") env := by rfl

theorem dead_code_elimination (t f : Template) (env : Env) :
    eval (Template.ifBlock "flag" t f) (("flag", Value.bool false) :: env) =
    eval f (("flag", Value.bool false) :: env) := by rfl

theorem seq_empty_right (t : Template) (env : Env) :
    eval (Template.seq t (Template.text "")) env = eval t env := by
  simp [eval]

theorem seq_empty_left (t : Template) (env : Env) :
    eval (Template.seq (Template.text "") t) env = eval t env := by
  simp [eval]
