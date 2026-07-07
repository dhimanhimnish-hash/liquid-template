namespace Liquid

-- ============================================================
-- AST: Abstract Syntax Tree
-- Defines the structure of a Liquid template
-- ============================================================

inductive Template where
  | text    : String → Template              -- "Hello "
  | var     : String → Template              -- {{ name }}
  | seq     : Template → Template → Template -- two parts joined
  | ifBlock : String → Template → Template → Template  -- {% if %}
  | forLoop : String → String → Template → Template    -- {% for %}
  | unless  : String → Template → Template             -- {% unless %}
  | case    : String → List (String × Template) → Template → Template  -- {% case %}
  deriving Repr

end Liquid
