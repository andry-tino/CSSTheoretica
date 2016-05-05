(* ===================================================================== *)
(* FILE          : Selector.sml                                          *)
(* DESCRIPTION   : Definition for selectors in CSS.                      *)
(*                                                                       *)
(* AUTHORS       : (c) Andrea Tino                                       *)
(* DATE          : 2016                                                  *)
(* ===================================================================== *)

structure Selector =
struct

(* Dependencies *)
structure El = Element

(* 
 * In a clause, we recognize an identifier. Identifiers can be of types:
 * - Element: name of an element (`div`, `span`, etc.)
 * - Class name: `.<class-name>`.
 * - Id: `#<id>`.
 * - Pseudo-element: `:<name>`.
 *)
datatype identifier = Element of El.element  (* An HTML element *)
                    | Class of string     (* A class name *)
                    | Id of string        (* An id *)

(* 
 * A clause determines how a particular identifier is connected to the previous.
 * Possible connections are:
 * - AND: both clause must hold together.
 * - Space: Descendant.
 * - Operator `>`: Direct descendant.
 * - Operator `~`: Successor.
 *)
datatype clause = None    of identifier	(* No connective => AND/no space in CSS *)
                | Desc    of identifier	(* Descendant: `div span` *)
                | DirDesc of identifier	(* Direct descendant: `div > span` *)
                | Succ    of identifier	(* Successor: `div ~ span` *)

(* 
 * A selector is intended as a list of clauses.
 *)
datatype selector = Empty                       (* An empty selector *)
                  | Node of clause              (* A selector with one clause only *)
                  | List of selector * selector (* Enabling list *)

end (* structure *)
