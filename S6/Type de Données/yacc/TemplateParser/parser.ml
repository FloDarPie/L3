type token =
  | BCONST of (bool)
  | INTCONST of (int)
  | OPERATOR
  | EOL

open Parsing;;
let _ = parse_error;;
let yytransl_const = [|
  259 (* OPERATOR *);
  260 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* BCONST *);
  258 (* INTCONST *);
    0|]

let yylhs = "\255\255\
\002\000\001\000\000\000"

let yylen = "\002\000\
\002\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\000\000\003\000\001\000"

let yydgoto = "\002\000\
\004\000\005\000"

let yysindex = "\255\255\
\255\254\000\000\000\000\254\254\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000"

let yytablesize = 2
let yytable = "\001\000\
\003\000\006\000"

let yycheck = "\001\000\
\002\001\004\001"

let yynames_const = "\
  OPERATOR\000\
  EOL\000\
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
# 10 "parser.mly"
                ( _1 )
# 65 "parser.ml"
               : int))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 12 "parser.mly"
               ( 0 )
# 72 "parser.ml"
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
