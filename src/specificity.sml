(* Andrea Tino *)
(* specificity.sml *)

use "selector.sml";

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
 * Gets the specificity of a selector. 
 * This should return a tuple (N,I,C,E).
 *)
fun specificity (List s c) = 
    (* We pass a list recursively *)
    specificity (s, specificity (c))
  | specificity (Node c) = 
    (* Here we need to determine the type of clause *)
    1
  | specificity (Empty) = 0
