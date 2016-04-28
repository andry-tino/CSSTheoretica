(* Andrea Tino *)
(* selector.sml *)

(* 
 * HTML elements. 
 *)
datatype element = Div
                 | Span
                 | Body

(* 
 * In a clause, we recognize an identifier. 
 *)
datatype identifier = Element of 'element (* An HTML element *)
                    | Class               (* A class name *)

(* 
 * A clause is defined as a list of terms.
 * [.|~|+]? <identifier> = <clause>
 *)
datatype clause = None    of 'identifier	(* No connective => AND/no space in CSS *)
                | Desc    of 'identifier	(* Descendant *)
                | DirDesc of 'identifier	(* Direct descendant *)
                | Succ    of 'identifier	(* Successor *)
                | Conj    of 'identifier	(* More selectors, maps the comma in CSS *)

(* 
 * A selector is intended as a list of clauses.
 *)
datatype selector = Empty                     (* An empty selector *)
                  | Node of clause            (* A selector with one clause only *)
                  | List of selector * clause (* Enabling list *)
