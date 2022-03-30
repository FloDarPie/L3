
(* Main function and target of compilation in Makefile *)

let main () =
  let help_message = "Available commands:\n comp run <filename> <args>\n comp graph <input filename> <output prefix> \n" in  
  if (Array.length (Sys.argv)) < 2
  then print_string help_message
  else match Sys.argv.(1) with
  | "run" ->
    if (Array.length (Sys.argv)) >= 3
    then let intargs = (List.map int_of_string (List.tl (List.tl (List.tl (Array.to_list Sys.argv))))) in
         let res = Interf.run_test Sys.argv.(2) intargs in
         print_endline (string_of_int res)
    else print_string help_message
  | "graph" ->
    if (Array.length (Sys.argv)) = 4
    then Interf.graph_test Sys.argv.(2) Sys.argv.(3)
    else print_string help_message
  | _ -> print_string help_message
;;

main();;

