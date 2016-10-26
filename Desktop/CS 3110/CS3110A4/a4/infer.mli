open Ast
open TypedAst

(******************************************************************************)
(** type inference helpers                                                   **)
(******************************************************************************)

(** Eq (t1,t2) is an assertion that t1 must be equal to t2 *)
type equation = Eq of typ * typ

(** Functions for printing lists of equations *)
val format_eqns    : Format.formatter -> equation list -> unit
val print_eqns     : equation list -> unit
val string_of_eqns : equation list -> string

(**
 * collect traverses an expression e and returns a list of equations that must
 * be satisfied for e to typecheck.
 * raises: may raise Failure s if collect discovers the expression cannot
 *   be typed even before the equations are solved, where s is unspecified.
 *)
val collect : variant_spec list -> annotated_expr -> equation list 

(******************************************************************************)
(** type inference                                                           **)
(******************************************************************************)

(**
 * given an expression, return the type for that expression.
 * raises: Failure s if the expression cannot be typed, where s is unspecified.
 *)
val infer : variant_spec list -> expr -> annotated_expr

