namespace Liquid

inductive Value where
  | str  : String → Value
  | int  : Int → Value
  | bool : Bool → Value
  | list : List Value → Value

abbrev Env := List (String × Value)

def Env.lookup (env : Env) (key : String) : Option Value :=
  match env.find? (fun p => p.1 == key) with
  | some p => some p.2
  | none   => none

def Value.toStr : Value → String
  | .str s  => s
  | .int n  => s!"{n}"
  | .bool b => if b then "true" else "false"
  | .list _ => ""

inductive Template where
  | text    : String → Template
  | var     : String → Template
  | seq     : Template → Template → Template
  | ifBlock : String → Template → Template → Template
  | forLoop : String → String → Template → Template

def eval : Template → Env → String
  | .text s, _         => s
  | .var x, env        => (env.lookup x).elim "" Value.toStr
  | .seq t1 t2, env    => eval t1 env ++ eval t2 env
  | .ifBlock x t f, env =>
      match env.lookup x with
      | some (.bool true) => eval t env
      | some (.str s)     => if s != "" then eval t env else eval f env
      | _                 => eval f env
  | .forLoop var xs body, env =>
      match env.lookup xs with
      | some (.list items) =>
          items.foldl (fun acc item => acc ++ eval body ((var, item) :: env)) ""
      | _ => ""

end Liquid
