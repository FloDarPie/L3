(* Extremely simple grammar that only recognizes the constant 0
   and returns it as result.
 *)

let _ =
  try
    let lexbuf = Lexing.from_channel stdin in
      while true do
	let result = Parser.start Lexer.token lexbuf in
	  print_string ("Result: " ^ (string_of_int result)); 
	  print_newline(); flush stdout
      done
  with Lexer.Eof ->
    Format.printf "Finished\n"; exit 0

