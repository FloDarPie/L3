let expression = ['0'-'9']
let expression2 = ['-' '+' ]?['0'-'9']
let langage = ['O' 'o'](['N' 'n']|['F' 'f']['F' 'f'])
let langageFini =  ['O' 'o'](['N' 'n']|['F' 'f']['F' 'f']) eof

(*clear && ocamllex lex.mll && ocamlc -o lex lex.ml && ./lex*)

              

rule main = parse
    | ['\n'] {print_string "Succes !\n"} 
    |langage {main lexbuf }
    | _ { print_string "ECHEC !\n" }

(*
rule main = parse
  | langageFini {print_string "\nOk !\n"}
  | _ {print_string "\nPas ok !\n"}
*)

{
main (Lexing.from_channel stdin)
}

