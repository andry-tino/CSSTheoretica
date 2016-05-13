(* ===================================================================== *)
(* FILE          : Rule.sml                                              *)
(* DESCRIPTION   : Definition for CSS rules.                             *)
(*                                                                       *)
(* AUTHORS       : (c) Andrea Tino                                       *)
(* DATE          : 2016                                                  *)
(* ===================================================================== *)

structure Rule =
struct

(* Dependencies *)
structure Sel = Selector
structure Prop = Property


(* 
 * A rule is an association between a selector and, 
 * a CSS property and a value for that property.
 *
 * TODO: Apply correct types.
 *)
datatype rule = Rule of Sel.selector * Prop.property

end (* structure *)
