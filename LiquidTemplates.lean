import LiquidTemplates.Basic
import LiquidTemplates.Proofs
import LiquidTemplates.Security
import LiquidTemplates.Filters
open Liquid

-- Test 1: Simple variable
#eval eval (Template.seq (Template.text "Hello, ") (Template.var "name")) [("name", Value.str "Alice")]

-- Test 2: If block
#eval eval (Template.ifBlock "show" (Template.text "Visible!") (Template.text "Hidden!")) [("show", Value.bool true)]

-- Test 3: For loop
#eval eval (Template.forLoop "item" "items" (Template.seq (Template.var "item") (Template.text ", "))) [("items", Value.list [Value.str "apple", Value.str "banana", Value.str "cherry"])]

-- Test 4: Filter
#eval applyFilter "upcase" "hello world"

-- Test 5: Escape
#eval escapeStr "<script>alert('xss')</script>"
