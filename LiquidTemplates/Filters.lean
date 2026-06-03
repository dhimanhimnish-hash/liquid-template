import LiquidTemplates.Basic
open Liquid

def applyFilter (f : String) (s : String) : String :=
  match f with
  | "upcase"   => s.toUpper
  | "downcase" => s.toLower
  | "strip"    => s.trimLeft.trimRight
  | "reverse"  => String.ofList s.toList.reverse
  | _          => s

theorem unknown_filter (s : String) :
    applyFilter "unknown" s = s := by rfl

theorem upcase_empty :
    applyFilter "upcase" "" = "" := by native_decide

theorem downcase_empty :
    applyFilter "downcase" "" = "" := by native_decide

theorem strip_hello :
    applyFilter "strip" "  hello  " = "hello" := by native_decide

theorem upcase_hello :
    applyFilter "upcase" "hello" = "HELLO" := by native_decide

theorem downcase_hello :
    applyFilter "downcase" "HELLO" = "hello" := by native_decide

theorem reverse_hello :
    applyFilter "reverse" "hello" = "olleh" := by native_decide
