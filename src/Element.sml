(* ===================================================================== *)
(* FILE          : Element.sml                                           *)
(* DESCRIPTION   : Definition for all elements in HTML.                  *)
(*                                                                       *)
(* AUTHORS       : (c) Andrea Tino                                       *)
(* DATE          : 2016                                                  *)
(* ===================================================================== *)

structure Element =
struct

(*
 * HTML elements.
 * From: https://developer.mozilla.org/en-US/docs/Web/HTML/Element.
 *)
datatype element = 
                 (* Basic elements *)
                   Html
                 (* Document metadata *)
                 | Base
                 | Head
                 | Link
                 | Meta
                 | Style
                 | Title
                 (* Content sectioning *)
                 | Address
                 | Article
                 | Footer
                 | Header
                 | H1 | H2 | H3 | H4 | H5 | H6
                 | HGroup
                 | Nav
                 | Section
                 (* Text content *)
                 | Dd
                 | Div
                 | Dl
                 | Dt
                 | Figcapture
                 | Figure
                 | Hr
                 | Li
                 | Main
                 | Ol
                 | P
                 | Pre
                 | Ul
                 (* Inline text semantics *)
                 | A
                 | Abbr
                 | B
                 | Bdr
                 | Bdo
                 | Br
                 | Site
                 | Code
                 | Data
                 | Dfn
                 | Em
                 | I
                 | Kbd
                 | Mark
                 | Q
                 | Rp
                 | Rt
                 | Rtc
                 | Ruby
                 | S
                 | Samp
                 | Small
                 | Span
                 | Strong
                 | Sub
                 | Sup
                 | Time
                 | U
                 | Var
                 | Wbr
                 (* Image and multimedia *)
                 | Area
                 | Audio
                 | Map
                 | Track
                 | Video
                 (* Embedded content *)
                 | Embed
                 | Object
                 | Param
                 | Source
                 (* Scripting *)
                 | Canvas
                 | Noscript
                 | Script
                 (* Demarcating edits *)
                 | Del
                 | Ins
                 (* Table content *)
                 | Caption
                 | Col
                 | Colgroup
                 | Table
                 | Tbody
                 | Td
                 | Tfoot
                 | Th
                 | Thead
                 | Tr
                 (* Forms *)
                 | Button
                 | Datalist
                 | Fieldset
                 | Form
                 | Input
                 | Label
                 | Legend
                 | Meter
                 | Optgroup
                 | Option
                 | Output
                 | Progress
                 | Select
                 | Textarea
                 (* Interactive elements *)
                 | Details
                 | Dialog
                 | Menu
                 (* Custom tags *)
                 | Custom of string

end (* structure *)
