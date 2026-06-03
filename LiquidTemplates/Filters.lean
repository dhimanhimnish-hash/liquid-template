import LiquidTemplates.Basic
open Liquid

-- ============================================================
-- FILTERS: like {{ name | upcase }} in Liquid
-- ============================================================

def applyFilter (f : String) (s : String) : String :=
  match f with
  | "upcase"    => s.toUpper
  | "downcase"  => s.toLower
  | "strip"     => s.trim
  | "reverse"   => String.mk s.toList.reverse
  | _           => s

-- ============================================================
-- PROOF 1: Unknown filter returns string unchanged
-- ============================================================
theorem unknown_filter (s : String) :
    applyFilter "unknown" s = s := by rfl

-- ============================================================
-- PROOF 2: upcase of empty string is empty
-- ============================================================
theorem upcase_empty :
    applyFilter "upcase" "" = "" := by native_decide

-- ============================================================
-- PROOF 3: downcase of empty string is empty
-- ============================================================
theorem downcase_empty :
    applyFilter "downcase" "" = "" := by native_decide

-- ============================================================
-- PROOF 4: strip removes whitespace
-- ============================================================
theorem strip_hello :
    applyFilter "strip" "  hello  " = "hello" := by native_decide

-- ============================================================
-- PROOF 5: upcase works correctly
-- ============================================================
theorem upcase_hello :
    applyFilter "upcase" "hello" = "HELLO" := by native_decide

-- ============================================================
-- PROOF 6: downcase works correctly
-- ============================================================
theorem downcase_hello :
    applyFilter "downcase" "HELLO" = "hello" := by native_decide

-- ============================================================
-- PROOF 7: reverse works correctly
-- ============================================================
theorem reverse_hello :
    applyFilter "reverse" "hello" = "olleh" := by native_decide

