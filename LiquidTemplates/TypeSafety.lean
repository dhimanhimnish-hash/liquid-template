import LiquidTemplates.Basic
open Liquid

theorem eval_text_is_string (s : String) (env : Env) :
    (eval (Template.text s) env).length >= 0 := by
  simp [eval]

theorem eval_var_empty_env (x : String) :
    eval (Template.var x) [] = "" := by
  simp [eval, Env.lookup]

theorem eval_seq_length (t1 t2 : Template) (env : Env) :
    (eval (Template.seq t1 t2) env).length =
    (eval t1 env).length + (eval t2 env).length := by
  simp [eval, String.length_append]

theorem eval_text_length (s : String) (env : Env) :
    (eval (Template.text s) env).length = s.length := by
  simp [eval]

theorem eval_text_nonempty :
    (eval (Template.text "hello") []).length = 5 := by
  native_decide
