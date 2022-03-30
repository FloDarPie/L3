(* Extremely simple grammar that only recognizes the constant 0
   and returns it as result.
 *)

let _ =
  try
    let lexbuf = Lexing.from_channel stdin in
      while true do
	let liste = Parser.start Lexer.token lexbuf in
        
	  print_string ("Sum: " ^ (string_of_int mess) ^ " Pares: " ^ (string_of_int mess) ^" Crochet: " ^(string_of_int mess) ^ " Acolades: "^(string_of_int mess) ); 
	  print_newline(); flush stdout
      done
  with Lexer.Eof ->
    Format.printf "Finished\n"; exit 0

