type token =
  | BCONSTANT of (bool)
  | INTCONSTANT of (int)
  | SEMICOLON
  | RETURN
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Lang
# 13 "parser.ml"
let yytransl_const = [|
  259 (* SEMICOLON *);
  260 (* RETURN *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* BCONSTANT *);
  258 (* INTCONSTANT *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\003\000\002\000\004\000\000\000"

let yylen = "\002\000\
\001\000\001\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\006\000\001\000\004\000\002\000\003\000\
\000\000\005\000"

let yydgoto = "\002\000\
\004\000\005\000\009\000\006\000"

let yysindex = "\001\000\
\000\255\000\000\255\254\000\000\000\000\000\000\000\000\000\000\
\002\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000"

let yytablesize = 5
let yytable = "\007\000\
\008\000\001\000\000\000\003\000\010\000"

let yycheck = "\001\001\
\002\001\001\000\255\255\004\001\003\001"

let yynames_const = "\
  SEMICOLON\000\
  RETURN\000\
  EOF\000\
  "

let yynames_block = "\
  BCONSTANT\000\
  INTCONSTANT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 23 "parser.mly"
                 ( _1 )
# 74 "parser.ml"
               : int Lang.stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 31 "parser.mly"
    ( Const(0, BoolV _1) )
# 81 "parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 33 "parser.mly"
    ( Const(0, IntV _1) )
# 88 "parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'return_statement) in
    Obj.repr(
# 40 "parser.mly"
                     ( _1 )
# 95 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 45 "parser.mly"
    ( Return _2 )
# 102 "parser.ml"
               : 'return_statement))
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : int Lang.stmt)
