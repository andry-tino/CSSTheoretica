(* ===================================================================== *)
(* FILE          : Resolver.sml                                          *)
(* DESCRIPTION   : Definition for CSS rules.                             *)
(*                                                                       *)
(* AUTHORS       : (c) Andrea Tino                                       *)
(* DATE          : 2016                                                  *)
(* ===================================================================== *)

structure Resolver =
struct

(* Dependencies *)
structure El = Element
structure Prop = Property


(* 
 * Getting property value depending on element and 
 * the set of rules.
 *
 * TODO: Missing the third parameter: list of rules
 *)
fun resolve (
  e  : El.element, 
  p  : Prop.property,
  db : Prop.property list) = 0

end (* structure *)
