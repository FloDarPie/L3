type token =
  | BCONST of (bool)
  | INTCONST of (int)
  | EOL
  | PLUS
  | TIMES

open Parsing;;
let _ = parse_error;;
let yytransl_const = [|
  259 (* EOL *);
  260 (* PLUS *);
  261 (* TIMES *);
    0|]

let yytransl_block = [|
  257 (* BCONST *);
  258 (* INTCONST *);
    0|]

let yylhs = "\255\255\
\002\000\001\000\001\000\001\000\000\000"

let yylen = "\002\000\
\002\000\001\000\003\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\000\000\005\000\001\000\000\000\000\000\
\000\000\004\000"

let yydgoto = "\002\000\
\004\000\005\000"

let yysindex = "\006\000\
\006\255\000\000\000\000\253\254\000\000\000\000\006\255\006\255\
\004\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\255\000\000"

let yygindex = "\000\000\
\254\255\000\000"

let yytablesize = 9
let yytable = "\006\000\
\007\000\008\000\003\000\003\000\009\000\010\000\001\000\003\000\
\008\000"

let yycheck = "\003\001\
\004\001\005\001\003\001\004\001\007\000\008\000\001\000\002\001\
\005\001"

let yynames_const = "\
  EOL\000\
  PLUS\000\
  TIMES\000\
  "

let yynames_block = "\
  BCONST\000\
  INTCONST\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 16 "parser.mly"
                ( _1 )
# 73 "parser.ml"
               : int))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 18 "parser.mly"
               ( _1 )
# 80 "parser.ml"
               : int))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 19 "parser.mly"
                      ( _1 + _3 )
# 88 "parser.ml"
               : int))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 20 "parser.mly"
                       ( _1 * _3 )
# 96 "parser.ml"
               : int))
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : int)
