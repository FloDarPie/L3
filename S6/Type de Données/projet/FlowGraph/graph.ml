(* General graph manipulation and display functions *)

type ('n, 'l) node = Node of 'n * 'l
type ('n, 'l) edge = Edge of 'n * 'n * 'l
type ('n, 'nl, 'el) graph = Graph of ('n, 'nl) node list * ('n, 'el) edge list
type ('n, 'nl, 'el) display =
  Display of ('n, 'nl, 'el) graph * ('n -> string) * ('nl -> string) * ('el -> string)


let print_node n_print nl_print (Node(n, lab)) =
  (n_print n) ^ " " ^ (nl_print lab) ^ "\n"

let print_edge n_print el_print (Edge(n1, n2, lab)) =
  (n_print n1) ^ " -> " ^ (n_print n2) ^ " " ^ (el_print lab) ^ "\n"

let print_graph (Display (Graph(nodes, edges), n_print, nl_print, el_print)) =
    "digraph" ^ " {\n" ^ 
      (List.fold_left (^) "" (List.map (print_node n_print nl_print) nodes)) ^ 
      (List.fold_left (^) "" (List.map (print_edge n_print el_print) edges)) ^ 
      "}\n"

     
let generate_dot_file filename_prefix disp = 
  let dot_filename = filename_prefix  ^ ".dot" in
  let pdf_filename = filename_prefix  ^ ".pdf" in
  let outf = open_out dot_filename in
  output_string outf (print_graph disp);
  output_string outf "";
  close_out outf;
  let _ = Sys.command ("dot " ^ dot_filename ^ " -Tpdf -o " ^ pdf_filename) in
  print_string ("generated " ^ dot_filename ^ " and " ^ pdf_filename ^ "\n")


