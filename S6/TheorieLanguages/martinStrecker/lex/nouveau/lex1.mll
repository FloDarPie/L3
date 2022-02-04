rule main = parse
      ['0'-'9'] { print_string "SUCCES !\n" }
    | _ { print_string "ECHEC !\n" }

{
main (Lexing.from_channel stdin)
}
