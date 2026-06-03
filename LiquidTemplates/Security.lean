import LiquidTemplates.Basic
open Liquid

def escapeStr (s : String) : String :=
  s.foldl (fun acc c =>
    match c with
    | '<' => acc ++ "&lt;"
    | '>' => acc ++ "&gt;"
    | '&' => acc ++ "&amp;"
    | _   => acc ++ String.singleton c) ""

theorem escape_empty : escapeStr "" = "" := by native_decide

theorem escape_lt : escapeStr "<" = "&lt;" := by native_decide

theorem escape_gt : escapeStr ">" = "&gt;" := by native_decide

theorem escape_amp : escapeStr "&" = "&amp;" := by native_decide
