type token =
  | BCONST of (bool)
  | INTCONST of (int)
  | EOL
  | PLUS
  | TIMES

val start :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> int
