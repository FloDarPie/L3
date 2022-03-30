{
  open Parser  
  exception Eof
  exception Lexerror
}

let blancs  = [' ''\t']+
let num     = ['0' - '9']+
let parenthese = ['(' ')' '{' '}' '[' ']']

rule token = parse
  blancs         { token lexbuf } (* appel recursif *)
| num as i       { INTCONST (int_of_string i) } (* change to int_of_string for composite num *)
| '+'            { PLUS } (* declare le symbole plus*)
(**)
| '('            { PARES_OUV }
| ')'            { PARES_FERM }
| '['            { CRO_OUV }
| ']'            { CRO_FERM }
| '{'            { ACO_OUV }
| '}'            { ACO_FERM }
(**)

| '\n'           { EOL }
| eof            { raise Eof }
| _              { Printf.printf "ERROR: unrecogized symbol '%s'\n" (Lexing.lexeme lexbuf);
		   raise Lexerror }
