type token =
  | BCONST of (bool)
  | INTCONST of (int)
  | COMMA
  | TIMES
  | LPAR
  | RPAR
  | LBRACE
  | RBRACE
  | LSQBRACKET
  | RSQBRACKET
  | EOL

val start :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> string
