open Graph
open Instrs

type edge_label = Standard | BranchIf of bool

(* To be defined *)
let graph_of_code code = Graph ([], [])

let node_label_display nd = "[label= \"" ^ string_of_instr_IVar nd ^ "\"]"

(* To be defined *)
let edge_label_display edg = ""

let display_of_code code =
  Display (graph_of_code code, string_of_int, node_label_display, edge_label_display)

    
