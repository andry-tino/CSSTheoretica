(* ===================================================================== *)
(* FILE          : selector.sml                                          *)
(* DESCRIPTION   : Definition for selectors in CSS.                      *)
(*                                                                       *)
(* AUTHORS       : (c) Andrea Tino                                       *)
(* DATE          : 2016                                                  *)
(* ===================================================================== *)

structure Selector =
struct

(*
 * HTML elements.
 *)
datatype element = Div
                 | Span
                 | Body

(* 
 * In a clause, we recognize an identifier. Identifiers can be of types:
 * - Element: name of an element (`div`, `span`, etc.)
 * - Class name: `.<class-name>`.
 * - Id: `#<id>`.
 * - Pseudo-element: `:<name>`.
 *)
datatype identifier = Element of 'element (* An HTML element *)
                    | Class               (* A class name *)
                    | Id                  (* An id *)

(* 
 * A clause determines how a particular identifier is connected to the previous.
 * Possible connections are:
 * - AND: both clause must hold together.
 * - Space: Descendant.
 * - Operator `>`: Direct descendant.
 * - Operator `~`: Successor.
 *)
datatype clause = None    of 'identifier	(* No connective => AND/no space in CSS *)
                | Desc    of 'identifier	(* Descendant *)
                | DirDesc of 'identifier	(* Direct descendant *)
                | Succ    of 'identifier	(* Successor *)

(* 
 * A selector is intended as a list of clauses.
 *)
datatype selector = Empty                     (* An empty selector *)
                  | Node of clause            (* A selector with one clause only *)
                  | List of selector * clause (* Enabling list *)

end (* structure *)
