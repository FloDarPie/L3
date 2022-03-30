{
  open Parser  
  exception Eof
  exception Lexerror
}

let blancs  = [' ''\t']+
let num     = '0'

rule token = parse
  blancs         { token lexbuf } (* appel recursif *)
| num as i       { INTCONST (int_of_char i) } (* change to int_of_string for composite num *)
| '\n'           { EOL }
| eof            { raise Eof }
| _              { Printf.printf "ERROR: unrecogized symbol '%s'\n" (Lexing.lexeme lexbuf);
		   raise Lexerror }
