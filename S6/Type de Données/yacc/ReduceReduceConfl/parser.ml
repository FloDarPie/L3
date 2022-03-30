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

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  let rec show_list = function
    |  [] -> ""
    |  [x] -> x
    | x :: xs -> x ^ ", " ^ show_list xs
# 22 "parser.ml"
let yytransl_const = [|
  259 (* COMMA *);
  260 (* TIMES *);
  261 (* LPAR *);
  262 (* RPAR *);
  263 (* LBRACE *);
  264 (* RBRACE *);
  265 (* LSQBRACKET *);
  266 (* RSQBRACKET *);
  267 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* BCONST *);
  258 (* INTCONST *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\003\000\003\000\004\000\004\000\005\000\
\005\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\003\000\001\000\003\000\003\000\001\000\
\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\010\000\000\000\002\000\003\000\
\000\000\000\000\000\000\001\000\004\000\007\000\000\000\006\000\
\009\000"

let yydgoto = "\002\000\
\005\000\010\000\007\000\008\000\011\000"

let yysindex = "\002\000\
\000\255\000\000\001\255\000\255\000\000\246\254\000\000\000\000\
\000\255\003\255\250\254\000\000\000\000\000\000\000\255\000\000\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\253\254\000\000\000\000\000\000\000\000\000\000\
\000\000\002\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\009\000\004\000\005\000\252\255"

let yytablesize = 14
let yytable = "\005\000\
\012\000\003\000\001\000\016\000\009\000\015\000\005\000\005\000\
\004\000\006\000\017\000\008\000\013\000\014\000"

let yycheck = "\003\001\
\011\001\002\001\001\000\010\001\004\001\003\001\010\001\011\001\
\009\001\001\000\015\000\010\001\009\000\009\000"

let yynames_const = "\
  COMMA\000\
  TIMES\000\
  LPAR\000\
  RPAR\000\
  LBRACE\000\
  RBRACE\000\
  LSQBRACKET\000\
  RSQBRACKET\000\
  EOL\000\
  "

let yynames_block = "\
  BCONST\000\
  INTCONST\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 18 "parser.mly"
                 ( _1 )
# 102 "parser.ml"
               : string))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 22 "parser.mly"
              ( "arith (" ^ _1 ^ ")" )
# 109 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'list_expr) in
    Obj.repr(
# 23 "parser.mly"
             (  "list (" ^ _1 ^ ")" )
# 116 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 27 "parser.mly"
                             ( (string_of_int _1) ^ "*" ^ _3  )
# 124 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 28 "parser.mly"
            ( (string_of_int _1) )
# 131 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exprs_comma_sep) in
    Obj.repr(
# 32 "parser.mly"
                                         ( "[" ^  _2 ^ "]"  )
# 138 "parser.ml"
               : 'list_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'list_expr) in
    Obj.repr(
# 33 "parser.mly"
                            ( (string_of_int _1) ^ "*" ^ _3  )
# 146 "parser.ml"
               : 'list_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 37 "parser.mly"
                                ( _1 )
# 153 "parser.ml"
               : 'exprs_comma_sep))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exprs_comma_sep) in
    Obj.repr(
# 38 "parser.mly"
                                ( _1 ^ "," ^ _3)
# 161 "parser.ml"
               : 'exprs_comma_sep))
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : string)
