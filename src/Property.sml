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
 * Property `align-content`.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/align-content
 *)
datatype aligncontentvalue = FlexStart
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
datatype alignitemsvalue = FlexStart
                         | FlexEnd
                         | Center
                         | Baseline
                         | Stretch
                         | Inherit
                         | Initial
                         | Unset

(* 
 * TODO: The rest.
 *)

(* 
 * Generic property.
 * https://developer.mozilla.org/en-US/docs/Web/CSS/Reference.
 *)
datatype property = AlignContent of aligncontentvalue
                  | AlignItems of alignitemsvalue
                  | Null

end (* structure *)
