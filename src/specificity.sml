(* ===================================================================== *)
(* FILE          : specificity.sml                                       *)
(* DESCRIPTION   : Definition for specificity in CSS.                    *)
(*                                                                       *)
(* AUTHORS       : (c) Andrea Tino                                       *)
(* DATE          : 2016                                                  *)
(* ===================================================================== *)

structure Specificity =
struct

(* Dependencies *)
structure S = Specificity

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
 * Structure implementing specificity breakdown (N,I,C,E).
 *)
val empty : spectuple = (0, 0, 0, 0)

(* 
 * Structure implementing specificity breakdown (N,I,C,E).
 *)
fun add (
  (t11, t12, t13, t14) : spectuple, 
  (t21, t22, t23, t24) : spectuple) =
    (t11 + t21, t12 + t22, t13 + t23, t14 + t24)

(* 
 * Gets the specificity of a selector. 
 * This should return a tuple (N,I,C,E).
 *)
fun specificity (List s c) = 
    (* We pass a list recursively *)
    specificity (s) + specificity (c)
  | specificity (Node c) = 
    (* Here we need to determine the type of clause *)
    1
  | specificity (Empty) = 0

end (* structure *)
