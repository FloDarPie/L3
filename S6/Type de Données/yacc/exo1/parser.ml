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

open Parsing;;
let _ = parse_error;;
let yytransl_const = [|
  259 (* PLUS *);
  260 (* PARES_OUV *);
  261 (* PARES_FERM *);
  262 (* CRO_OUV *);
  263 (* CRO_FERM *);
  264 (* ACO_OUV *);
  265 (* ACO_FERM *);
  266 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* BCONST *);
  258 (* INTCONST *);
    0|]

let yylhs = "\255\255\
\002\000\001\000\001\000\001\000\001\000\001\000\000\000"

let yylen = "\002\000\
\002\000\001\000\003\000\003\000\003\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\000\000\000\000\000\000\000\000\007\000\
\000\000\000\000\000\000\000\000\001\000\004\000\005\000\006\000\
\003\000"

let yydgoto = "\002\000\
\007\000\008\000"

let yysindex = "\013\000\
\003\255\000\000\000\000\003\255\003\255\003\255\000\255\000\000\
\001\255\010\255\009\255\003\255\000\000\000\000\000\000\000\000\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\252\255\000\000"

let yytablesize = 18
let yytable = "\009\000\
\010\000\011\000\012\000\012\000\003\000\014\000\004\000\017\000\
\005\000\013\000\006\000\012\000\012\000\001\000\000\000\000\000\
\015\000\016\000"

let yycheck = "\004\000\
\005\000\006\000\003\001\003\001\002\001\005\001\004\001\012\000\
\006\001\010\001\008\001\003\001\003\001\001\000\255\255\255\255\
\007\001\009\001"

let yynames_const = "\
  PLUS\000\
  PARES_OUV\000\
  PARES_FERM\000\
  CRO_OUV\000\
  CRO_FERM\000\
  ACO_OUV\000\
  ACO_FERM\000\
  EOL\000\
  "

let yynames_block = "\
  BCONST\000\
  INTCONST\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : int list) in
    Obj.repr(
# 22 "parser.mly"
                ( _1 )
# 93 "parser.ml"
               : int list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 25 "parser.mly"
               ( [_1;0;0;0] )
# 100 "parser.ml"
               : int list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int list) in
    Obj.repr(
# 26 "parser.mly"
                      ( [_1 + _3;0;0;0] )
# 108 "parser.ml"
               : int list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : int list) in
    Obj.repr(
# 27 "parser.mly"
                                ( [_2; 1; 0; 0] )
# 115 "parser.ml"
               : int list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : int list) in
    Obj.repr(
# 28 "parser.mly"
                            ( [_2; 0; 1; 0] )
# 122 "parser.ml"
               : int list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : int list) in
    Obj.repr(
# 29 "parser.mly"
                            ( [_2; 0; 0; 1] )
# 129 "parser.ml"
               : int list))
(* Entry start *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let start (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : int list)
