type token =
  | BCONST of (bool)
  | INTCONST of (int)
  | OPERATOR
  | EOL

val start :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> int
