(*clear && ocamllex lex.mll && ocamlc -o lex lex.ml && ./lex*)


rule main = parse
    | "<html>" {print_string "\documentclass{article}"; main lexbuf}
    | "</html>" {print_string ""; }
    | "<body>" {print_string "'\'begin{document}"; main lexbuf}
    | "</body>" {print_string "\end{document}"; main lexbuf}
    | "<h1>" {print_string "\section{"; main lexbuf}
    | "</h1>" {print_string "}"; main lexbuf}
    | "<h2>" {print_string "\subsection{"; main lexbuf}
    | "</h2>" {print_string "}"; main lexbuf}
    | "<ol>" {print_string "\begin{enumerate}"; main lexbuf}
    | "</ol>" {print_string "\end{enumerate}"; main lexbuf}
    | "<ul>" {print_string "\begin{itemize}"; main lexbuf}
    | "</ul>" {print_string "\end{itemize}"; main lexbuf}
    | "<br>" {print_string "\newline"; main lexbuf}
    | "<b>" {print_string "\textbf{"; main lexbuf}
    | "</b>" {print_string "}"; main lexbuf}
    | "<i>" {print_string "\textbf{"; main lexbuf}
    | "</i>" {print_string "}"; main lexbuf}
    | "<li>" {print_string "\item"; main lexbuf}
    | "</li>" {print_string ""; main lexbuf}
    |    _ as text    { print_char text; main lexbuf }


(*
rule main = parse
  | langageFini {print_string "\nOk !\n"}.
  | _ {print_string "\nPas ok !\n"}
*)

{
main (Lexing.from_channel stdin)
}
