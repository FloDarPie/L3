type token =
  | BCONST of (bool)
  | INTCONST of (int)
  | PLUS
  | PARES_OUV
  | PARES_FERM
  | CRO_OUV
  | CRO_FERM
  | ACO_OUV
  | ACO_FERM
  | EOL

val start :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> int list
