import LiquidTemplates.Basic
import LiquidTemplates.Proofs
import LiquidTemplates.Security
import LiquidTemplates.Filters
import LiquidTemplates.Injection
import LiquidTemplates.Json
import LiquidTemplates.Equivalence
import LiquidTemplates.TypeSafety
import LiquidTemplates.Termination
open Liquid

#eval eval (Template.seq (Template.text "Hello, ") (Template.var "name")) [("name", Value.str "Alice")]
#eval eval (Template.ifBlock "show" (Template.text "Visible!") (Template.text "Hidden!")) [("show", Value.bool true)]
#eval eval (Template.forLoop "item" "items" (Template.seq (Template.var "item") (Template.text ", "))) [("items", Value.list [Value.str "apple", Value.str "banana", Value.str "cherry"])]
#eval applyFilter "upcase" "hello world"
#eval escapeStr "<script>alert('xss')</script>"
#eval toJsonString "hello world"
