(* ===================================================================== *)
(* FILE          : Specificity.sml                                       *)
(* DESCRIPTION   : Definition for specificity in CSS.                    *)
(*                                                                       *)
(* AUTHORS       : (c) Andrea Tino                                       *)
(* DATE          : 2016                                                  *)
(* ===================================================================== *)

structure Specificity =
struct

(* Dependencies *)
structure Sel = Selector

(*
 * Specificity is calculated by justaxposition of numbers:
 * 
 * ===================================================
 * | inline  | id  | class         | element         |
 * |         |     | attribute     | pseudo-element  |
 * |         |     | pseudo-class  |                 |
 * ---------------------------------------------------
 * |    N    |  I  |       C       |        E        |
 * ===================================================
 *
 * N,I,C,E = number of occurrances
 * S = N.I.C.E = number(str(N)+str(I)+str(C)+str(E))
 *)

(* 
 * Structure implementing specificity breakdown (N,I,C,E).
 *)
type spectuple = int * int * int * int

(* 
 * The null specificity.
 *)
val empty : spectuple = (0, 0, 0, 0)

(* 
 * Adding spectuples.
 *)
fun add (
  (t11, t12, t13, t14) : spectuple, 
  (t21, t22, t23, t24) : spectuple) =
    (t11 + t21, t12 + t22, t13 + t23, t14 + t24)

(* 
 * Gets the specificity of a selector. 
 * specificity: selector -> spectuple
 * This should return a tuple (N,I,C,E).
 *)
fun specificity (Sel.List (s1, s2)) = 
    (* We pass a list recursively *)
    specificity (s1) + specificity (s2)
  | specificity (Sel.Node c) = 
    (* Here we need to determine the type of clause *)
    1
  | specificity (Sel.Empty) = 0
  
(* 
 * Gets the numeric specificity.
 *)
fun specnumber ((N,I,C,E) : spectuple) = 
  N + I + C + E

end (* structure *)
