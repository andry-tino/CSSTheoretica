(* Andrea Tino *)
(* selector.sml *)

(* 
 * A selector is defined as a list of terms. 
 *)
datatype 't selector = Empty		(* An empty selector *)
                     | None of 't	(* No connective => AND *)
                     | Desc of 't	(* Descendant *)
                     | DirDesc of 't	(* Direct descendant *)
                     | Succ of 't	(* Successor *)
                     | Conj of 't	(* More selectors *)


