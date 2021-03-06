(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2017     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

class ['a] typed_notebook :
  ('a -> GObj.widget option * GObj.widget option * GObj.widget) ->
  ('a -> unit) ->
  Gtk.notebook Gtk.obj ->
object
  inherit GPack.notebook
  method append_term : 'a -> int
  method prepend_term : 'a -> int
  method set_term : 'a -> unit
  method get_nth_term : int -> 'a
  method term_num : ('a -> 'a -> bool) -> 'a -> int
  method pages : 'a list
  method remove_page : int -> unit
  method current_term : 'a
end

val create :
  ('a -> GObj.widget option * GObj.widget option * GObj.widget) ->
  ('a -> unit) ->
  ?enable_popup:bool ->
  ?homogeneous_tabs:bool ->
  ?scrollable:bool ->
  ?show_border:bool ->
  ?show_tabs:bool ->
  ?tab_border:int ->
  ?tab_pos:Gtk.Tags.position ->
  ?border_width:int ->
  ?width:int ->
  ?height:int ->
  ?packing:(GObj.widget -> unit) -> ?show:bool -> unit -> 'a typed_notebook
