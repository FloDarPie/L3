(* Datatypes for assembly instructions *)


open Lang

type 'v simple_expr =
  ConstSE of int
| VarSE of 'v
| BinOpSE of binop * 'v * 'v

(* 'l for labels, 'v for variables *)
type ('l, 'v) instr = 
| Store of 'v * 'v simple_expr  (* store result of simple_expr in variable *)
| Goto of 'l                    (* unconditional goto *)
| Branch of 'v * 'l * 'l        (* if zero then branch to left, else to right *)
| Exit of 'v                    (* return from function leaving result in variable *)


(* ************************************************************ *)
(* Two kinds of jumps (relative / absolute), 
   and translation from relative to absolute
 *)
    

(* RelJump j jumps j instructions forward (j positive) or backward (j negative) *)
type rel_jump = RelJump of int

(* AbsJump j jumps to absolute address / instruction j *)
type abs_jump = AbsJump of int


(* ************************************************************ *)
(* Operational semantics *)

type exec_result =
  End of int
| Continue of (int array) * int

(* To be defined *)
let string_of_instr_IVar nd = ""
