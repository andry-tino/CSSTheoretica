(* ===================================================================== *)
(* FILE          : Property.sml                                          *)
(* DESCRIPTION   : Definition for CSS rules.                             *)
(*                                                                       *)
(* AUTHORS       : (c) Andrea Tino                                       *)
(* DATE          : 2016                                                  *)
(* ===================================================================== *)

structure Property =
struct

(* 
 * Constructor `Nil` is used just to be able to refer a property 
 * without specifying an actual value for it.
 *)

(* 
 * Property `align-content`.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/align-content
 *)
datatype aligncontentvalue = Nil
                           | FlexStart
                           | FlexEnd
                           | Center
                           | SpaceBetween
                           | SpaceAround
                           | Stretch
                           | Inherit
                           | Initial
                           | Unset

(* 
 * Property `align-items`.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/align-items
 *)
datatype alignitemsvalue = Nil
                         | FlexStart
                         | FlexEnd
                         | Center
                         | Baseline
                         | Stretch
                         | Inherit
                         | Initial
                         | Unset

(* 
 * TODO: The rest...
 *)

(* 
 * Generic property.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/Reference.
 *)
datatype property = AlignContent of aligncontentvalue
                  | AlignItems of alignitemsvalue
                  | Null

(* 
 * References to properties without actual values.
 *)

val aligncontentprop : property = AlignContent Nil
val alignitems       : property = AlignItems   Nil

end (* structure *)
