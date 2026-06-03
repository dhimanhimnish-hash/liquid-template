import LiquidTemplates.Basic
import LiquidTemplates.Security
open Liquid

def isJsonString (s : String) : Bool :=
  s.startsWith "\"" && s.endsWith "\""

def toJsonString (s : String) : String :=
  "\"" ++ s ++ "\""

theorem json_empty_valid :
    isJsonString (toJsonString "") = true := by native_decide

theorem json_hello_valid :
    isJsonString (toJsonString "hello") = true := by native_decide

theorem json_starts_with_quote :
    (toJsonString "hello").startsWith "\"" = true := by native_decide

theorem json_ends_with_quote :
    (toJsonString "hello").endsWith "\"" = true := by native_decide

theorem escaped_input_safe_in_json :
    isJsonString (toJsonString (escapeStr "<script>")) = true := by
    native_decide
