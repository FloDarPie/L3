{
  open Parser  
  exception Eof
  exception Lexerror
}

let blancs  = [' ''\t']+
let num     = ['0'-'9']+

rule token = parse
  blancs         { token lexbuf } (* appel recursif *)
| num as i       { INTCONST (int_of_string i) }
| '\n'           { EOL }
| '*'            { TIMES }
| ','            { COMMA }
| '('            { LPAR }
| ')'            { RPAR }
| '{'            { LBRACE }
| '}'            { RBRACE }
| '['            { LSQBRACKET }
| ']'            { RSQBRACKET }
| eof            { raise Eof }
| _              { Printf.printf "ERROR: unrecogized symbol '%s'\n" (Lexing.lexeme lexbuf);
		   raise Lexerror }
