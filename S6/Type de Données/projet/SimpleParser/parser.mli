type token =
  | BCONSTANT of (bool)
  | INTCONSTANT of (int)
  | SEMICOLON
  | RETURN
  | EOF

val start :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> int Lang.stmt
