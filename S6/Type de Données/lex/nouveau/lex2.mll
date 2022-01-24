let expression = ['-' '+' ]?['0'-'9']

rule main = parse
    expression { print_string "SUCCES !\n" }
    | _ { print_string "ECHEC !\n" }

{
main (Lexing.from_channel stdin)
}