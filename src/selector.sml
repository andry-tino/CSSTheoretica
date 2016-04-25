(* Andrea Tino *)
(* types.sml *)

theory Selector
begin

(* 
 * A selector is defined as a list of terms. 
 *)
datatype 't selector = Empty			("[]")
                     | Ctor 't "'t selector"	(infixr "#" 65)

end

