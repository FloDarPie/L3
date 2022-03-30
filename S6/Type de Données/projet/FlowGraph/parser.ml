type token =
  | IDENTIFIER of (string)
  | TP of (Lang.tp)
  | BCONSTANT of (bool)
  | INTCONSTANT of (int)
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | MOD
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | EQ
  | COMMA
  | SEMICOLON
  | COLON
  | QMARK
  | IF
  | ELSE
  | WHILE
  | FOR
  | RETURN
  | BCEQ
  | BCGE
  | BCGT
  | BCLE
  | BCLT
  | BCNE
  | BLAND
  | BLOR
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Lang
# 40 "parser.ml"
let yytransl_const = [|
  261 (* PLUS *);
  262 (* MINUS *);
  263 (* TIMES *);
  264 (* DIV *);
  265 (* MOD *);
  266 (* LPAREN *);
  267 (* RPAREN *);
  268 (* LBRACE *);
  269 (* RBRACE *);
  270 (* EQ *);
  271 (* COMMA *);
  272 (* SEMICOLON *);
  273 (* COLON *);
  274 (* QMARK *);
  275 (* IF *);
  276 (* ELSE *);
  277 (* WHILE *);
  278 (* FOR *);
  279 (* RETURN *);
  280 (* BCEQ *);
  281 (* BCGE *);
  282 (* BCGT *);
  283 (* BCLE *);
  284 (* BCLT *);
  285 (* BCNE *);
  286 (* BLAND *);
  287 (* BLOR *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* IDENTIFIER *);
  258 (* TP *);
  259 (* BCONSTANT *);
  260 (* INTCONSTANT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\006\000\006\000\007\000\007\000\004\000\
\004\000\009\000\009\000\008\000\010\000\010\000\010\000\010\000\
\010\000\012\000\013\000\014\000\015\000\015\000\015\000\015\000\
\016\000\016\000\016\000\017\000\018\000\018\000\018\000\018\000\
\018\000\019\000\019\000\019\000\020\000\020\000\021\000\021\000\
\011\000\022\000\022\000\022\000\022\000\022\000\023\000\005\000\
\005\000\028\000\028\000\024\000\030\000\029\000\025\000\025\000\
\026\000\026\000\027\000\000\000"

let yylen = "\002\000\
\001\000\005\000\005\000\000\000\001\000\001\000\003\000\000\000\
\002\000\001\000\003\000\002\000\001\000\001\000\001\000\003\000\
\007\000\001\000\001\000\001\000\001\000\003\000\003\000\003\000\
\001\000\003\000\003\000\001\000\001\000\003\000\003\000\003\000\
\003\000\001\000\003\000\003\000\001\000\003\000\001\000\003\000\
\001\000\001\000\001\000\001\000\001\000\001\000\003\000\000\000\
\001\000\001\000\002\000\002\000\003\000\001\000\005\000\007\000\
\005\000\009\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\060\000\001\000\000\000\000\000\000\000\
\000\000\000\000\000\000\010\000\000\000\000\000\000\000\006\000\
\012\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\054\000\042\000\043\000\044\000\045\000\046\000\000\000\050\000\
\000\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\
\000\000\013\000\014\000\015\000\000\000\018\000\000\000\019\000\
\020\000\021\000\000\000\000\000\029\000\000\000\000\000\000\000\
\000\000\002\000\051\000\052\000\011\000\007\000\053\000\047\000\
\000\000\000\000\000\000\000\000\059\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\016\000\000\000\022\000\
\023\000\024\000\000\000\000\000\033\000\031\000\032\000\030\000\
\000\000\000\000\000\000\000\000\000\000\057\000\000\000\000\000\
\000\000\000\000\000\000\056\000\000\000\000\000\000\000\017\000\
\058\000"

let yydgoto = "\002\000\
\004\000\005\000\006\000\011\000\024\000\014\000\015\000\012\000\
\013\000\046\000\047\000\048\000\049\000\050\000\051\000\052\000\
\053\000\054\000\055\000\056\000\057\000\025\000\026\000\027\000\
\028\000\029\000\030\000\031\000\032\000\033\000"

let yysindex = "\006\000\
\045\255\000\000\050\255\000\000\000\000\001\255\079\255\055\255\
\055\255\113\255\126\255\000\000\102\255\111\255\108\255\000\000\
\000\000\110\255\126\255\115\255\121\255\124\255\008\255\122\255\
\000\000\000\000\000\000\000\000\000\000\000\000\126\255\000\000\
\128\255\055\255\000\000\055\255\008\255\123\255\008\255\008\255\
\136\255\000\000\000\000\000\000\008\255\000\000\134\255\000\000\
\000\000\000\000\052\255\019\255\000\000\018\255\242\254\125\255\
\109\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\143\255\145\255\141\255\012\255\000\000\008\255\008\255\008\255\
\008\255\008\255\008\255\008\255\008\255\008\255\008\255\008\255\
\008\255\008\255\126\255\126\255\008\255\000\000\008\255\000\000\
\000\000\000\000\052\255\052\255\000\000\000\000\000\000\000\000\
\018\255\018\255\242\254\125\255\138\255\000\000\152\255\154\255\
\126\255\136\255\008\255\000\000\158\255\167\255\126\255\000\000\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\094\255\
\168\255\000\000\169\255\000\000\000\000\000\000\170\255\000\000\
\000\000\000\000\169\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\171\255\000\000\
\000\000\107\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\011\255\135\255\000\000\038\255\180\255\003\255\
\070\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\047\255\074\255\000\000\000\000\000\000\000\000\
\156\255\159\255\183\255\191\255\120\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\173\000\000\000\000\000\253\255\
\000\000\000\000\219\255\000\000\000\000\012\000\020\000\000\000\
\034\000\017\000\112\000\113\000\000\000\177\255\000\000\000\000\
\000\000\000\000\000\000\000\000\172\000\216\255"

let yytablesize = 222
let yytable = "\063\000\
\067\000\065\000\066\000\101\000\102\000\016\000\001\000\068\000\
\042\000\079\000\043\000\044\000\008\000\039\000\080\000\025\000\
\025\000\045\000\039\000\039\000\039\000\025\000\086\000\073\000\
\074\000\108\000\025\000\025\000\025\000\087\000\061\000\113\000\
\062\000\039\000\025\000\025\000\025\000\025\000\025\000\025\000\
\025\000\025\000\075\000\076\000\077\000\078\000\003\000\103\000\
\034\000\104\000\007\000\026\000\026\000\034\000\034\000\034\000\
\010\000\026\000\070\000\071\000\072\000\034\000\026\000\026\000\
\026\000\109\000\034\000\034\000\034\000\110\000\026\000\026\000\
\026\000\026\000\026\000\026\000\026\000\026\000\027\000\027\000\
\041\000\088\000\089\000\090\000\027\000\041\000\041\000\041\000\
\009\000\027\000\027\000\027\000\091\000\092\000\008\000\097\000\
\098\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
\027\000\008\000\008\000\009\000\093\000\094\000\095\000\096\000\
\008\000\017\000\008\000\008\000\008\000\034\000\009\000\009\000\
\055\000\035\000\036\000\037\000\039\000\009\000\018\000\009\000\
\009\000\009\000\040\000\055\000\055\000\041\000\058\000\064\000\
\018\000\019\000\055\000\082\000\055\000\055\000\055\000\060\000\
\020\000\028\000\021\000\022\000\023\000\069\000\028\000\028\000\
\028\000\083\000\081\000\084\000\085\000\105\000\028\000\028\000\
\028\000\028\000\028\000\028\000\028\000\028\000\035\000\106\000\
\111\000\036\000\107\000\035\000\035\000\035\000\036\000\036\000\
\036\000\112\000\004\000\035\000\005\000\048\000\036\000\049\000\
\035\000\035\000\035\000\036\000\036\000\036\000\037\000\038\000\
\099\000\038\000\100\000\037\000\037\000\037\000\038\000\038\000\
\038\000\040\000\059\000\000\000\000\000\000\000\040\000\040\000\
\040\000\037\000\037\000\000\000\038\000\038\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\040\000"

let yycheck = "\037\000\
\041\000\039\000\040\000\083\000\084\000\009\000\001\000\045\000\
\001\001\024\001\003\001\004\001\012\001\011\001\029\001\005\001\
\006\001\010\001\016\001\017\001\018\001\011\001\011\001\005\001\
\006\001\105\000\016\001\017\001\018\001\018\001\034\000\111\000\
\036\000\031\001\024\001\025\001\026\001\027\001\028\001\029\001\
\030\001\031\001\025\001\026\001\027\001\028\001\002\001\085\000\
\011\001\087\000\001\001\005\001\006\001\016\001\017\001\018\001\
\002\001\011\001\007\001\008\001\009\001\024\001\016\001\017\001\
\018\001\106\000\029\001\030\001\031\001\107\000\024\001\025\001\
\026\001\027\001\028\001\029\001\030\001\031\001\005\001\006\001\
\011\001\070\000\071\000\072\000\011\001\016\001\017\001\018\001\
\010\001\016\001\017\001\018\001\073\000\074\000\001\001\079\000\
\080\000\024\001\025\001\026\001\027\001\028\001\029\001\030\001\
\031\001\012\001\013\001\001\001\075\000\076\000\077\000\078\000\
\019\001\001\001\021\001\022\001\023\001\016\001\012\001\013\001\
\001\001\011\001\015\001\014\001\010\001\019\001\001\001\021\001\
\022\001\023\001\010\001\012\001\013\001\010\001\013\001\013\001\
\001\001\012\001\019\001\031\001\021\001\022\001\023\001\016\001\
\019\001\011\001\021\001\022\001\023\001\016\001\016\001\017\001\
\018\001\011\001\030\001\011\001\016\001\020\001\024\001\025\001\
\026\001\027\001\028\001\029\001\030\001\031\001\011\001\016\001\
\011\001\011\001\017\001\016\001\017\001\018\001\016\001\017\001\
\018\001\011\001\011\001\024\001\011\001\013\001\024\001\013\001\
\029\001\030\001\031\001\029\001\030\001\031\001\011\001\019\000\
\081\000\011\001\082\000\016\001\017\001\018\001\016\001\017\001\
\018\001\011\001\031\000\255\255\255\255\255\255\016\001\017\001\
\018\001\030\001\031\001\255\255\030\001\031\001\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\031\001"

let yynames_const = "\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIV\000\
  MOD\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  EQ\000\
  COMMA\000\
  SEMICOLON\000\
  COLON\000\
  QMARK\000\
  IF\000\
  ELSE\000\
  WHILE\000\
  FOR\000\
  RETURN\000\
  BCEQ\000\
  BCGE\000\
  BCGT\000\
  BCLE\000\
  BCLT\000\
  BCNE\000\
  BLAND\000\
  BLOR\000\
  EOF\000\
  "

let yynames_block = "\
  IDENTIFIER\000\
  TP\000\
  BCONSTANT\000\
  INTCONSTANT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fundefn) in
    Obj.repr(
# 22 "parser.mly"
               ( _1 )
# 268 "parser.ml"
               : int Lang.fundefn))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'fundecl) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'vardecl_semi_list_opt) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'block_item_list_opt) in
    Obj.repr(
# 27 "parser.mly"
  ( Fundefn(_1, _3, _4) )
# 277 "parser.ml"
               : 'fundefn))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : Lang.tp) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'vardecl_comma_list_opt) in
    Obj.repr(
# 31 "parser.mly"
  ( Fundecl(_1, _2, _4) )
# 286 "parser.ml"
               : 'fundecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 36 "parser.mly"
  ( [] )
# 292 "parser.ml"
               : 'vardecl_comma_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'vardecl_comma_list) in
    Obj.repr(
# 38 "parser.mly"
    ( _1 )
# 299 "parser.ml"
               : 'vardecl_comma_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'vardecl) in
    Obj.repr(
# 44 "parser.mly"
    ( [_1] )
# 306 "parser.ml"
               : 'vardecl_comma_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vardecl_comma_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'vardecl) in
    Obj.repr(
# 46 "parser.mly"
    ( _1 @ [_3] )
# 314 "parser.ml"
               : 'vardecl_comma_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 51 "parser.mly"
  ( [] )
# 320 "parser.ml"
               : 'vardecl_semi_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vardecl_semi_list) in
    Obj.repr(
# 53 "parser.mly"
    ( _1 )
# 327 "parser.ml"
               : 'vardecl_semi_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'vardecl) in
    Obj.repr(
# 59 "parser.mly"
    ( [_1] )
# 334 "parser.ml"
               : 'vardecl_semi_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vardecl_semi_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'vardecl) in
    Obj.repr(
# 61 "parser.mly"
    ( _1 @ [_3] )
# 342 "parser.ml"
               : 'vardecl_semi_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Lang.tp) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 65 "parser.mly"
    ( Vardecl(_1, _2) )
# 350 "parser.ml"
               : 'vardecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 74 "parser.mly"
    ( VarE(0, _1) )
# 357 "parser.ml"
               : 'primary_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 76 "parser.mly"
    ( Const(0, BoolV _1) )
# 364 "parser.ml"
               : 'primary_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 78 "parser.mly"
    ( Const(0, IntV _1) )
# 371 "parser.ml"
               : 'primary_expression))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 81 "parser.mly"
    ( _2 )
# 378 "parser.ml"
               : 'primary_expression))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : 'expression) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'expression) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 83 "parser.mly"
    ( IfThenElse (0, _2, _4, _6) )
# 387 "parser.ml"
               : 'primary_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'primary_expression) in
    Obj.repr(
# 89 "parser.mly"
      ( _1 )
# 394 "parser.ml"
               : 'postfix_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'postfix_expression) in
    Obj.repr(
# 94 "parser.mly"
      ( _1 )
# 401 "parser.ml"
               : 'unary_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'unary_expression) in
    Obj.repr(
# 100 "parser.mly"
      ( _1 )
# 408 "parser.ml"
               : 'cast_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cast_expression) in
    Obj.repr(
# 105 "parser.mly"
      ( _1 )
# 415 "parser.ml"
               : 'multiplicative_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'multiplicative_expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cast_expression) in
    Obj.repr(
# 107 "parser.mly"
    ( BinOp(0, BArith BAmul, _1, _3) )
# 423 "parser.ml"
               : 'multiplicative_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'multiplicative_expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cast_expression) in
    Obj.repr(
# 109 "parser.mly"
    ( BinOp(0, BArith BAdiv, _1, _3) )
# 431 "parser.ml"
               : 'multiplicative_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'multiplicative_expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cast_expression) in
    Obj.repr(
# 111 "parser.mly"
    ( BinOp(0, BArith BAmod, _1, _3) )
# 439 "parser.ml"
               : 'multiplicative_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'multiplicative_expression) in
    Obj.repr(
# 116 "parser.mly"
    ( _1 )
# 446 "parser.ml"
               : 'additive_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'additive_expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'multiplicative_expression) in
    Obj.repr(
# 118 "parser.mly"
    ( BinOp(0, BArith BAadd, _1, _3) )
# 454 "parser.ml"
               : 'additive_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'additive_expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'multiplicative_expression) in
    Obj.repr(
# 120 "parser.mly"
    ( BinOp(0, BArith BAsub, _1, _3) )
# 462 "parser.ml"
               : 'additive_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'additive_expression) in
    Obj.repr(
# 125 "parser.mly"
    ( _1 )
# 469 "parser.ml"
               : 'shift_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'shift_expression) in
    Obj.repr(
# 130 "parser.mly"
    ( _1 )
# 476 "parser.ml"
               : 'relational_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'relational_expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'shift_expression) in
    Obj.repr(
# 132 "parser.mly"
    ( BinOp(0, BCompar BClt, _1, _3) )
# 484 "parser.ml"
               : 'relational_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'relational_expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'shift_expression) in
    Obj.repr(
# 134 "parser.mly"
    ( BinOp(0, BCompar BCgt, _1, _3) )
# 492 "parser.ml"
               : 'relational_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'relational_expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'shift_expression) in
    Obj.repr(
# 136 "parser.mly"
    ( BinOp(0, BCompar BCle, _1, _3) )
# 500 "parser.ml"
               : 'relational_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'relational_expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'shift_expression) in
    Obj.repr(
# 138 "parser.mly"
    ( BinOp(0, BCompar BCge, _1, _3) )
# 508 "parser.ml"
               : 'relational_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'relational_expression) in
    Obj.repr(
# 143 "parser.mly"
    ( _1 )
# 515 "parser.ml"
               : 'equality_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'equality_expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'relational_expression) in
    Obj.repr(
# 145 "parser.mly"
    ( BinOp(0, BCompar BCeq, _1, _3) )
# 523 "parser.ml"
               : 'equality_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'equality_expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'relational_expression) in
    Obj.repr(
# 147 "parser.mly"
    ( BinOp(0, BCompar BCne, _1, _3) )
# 531 "parser.ml"
               : 'equality_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'equality_expression) in
    Obj.repr(
# 152 "parser.mly"
    ( _1 )
# 538 "parser.ml"
               : 'logical_AND_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'logical_AND_expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'equality_expression) in
    Obj.repr(
# 154 "parser.mly"
    ( IfThenElse(0, _1, _3, Const(0, BoolV false)) )
# 546 "parser.ml"
               : 'logical_AND_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'logical_AND_expression) in
    Obj.repr(
# 163 "parser.mly"
    ( _1 )
# 553 "parser.ml"
               : 'logical_OR_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'logical_OR_expression) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'logical_AND_expression) in
    Obj.repr(
# 165 "parser.mly"
    ( IfThenElse(0, _1, Const(0, BoolV true), _3) )
# 561 "parser.ml"
               : 'logical_OR_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'logical_OR_expression) in
    Obj.repr(
# 173 "parser.mly"
    ( _1 )
# 568 "parser.ml"
               : 'expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'compound_statement) in
    Obj.repr(
# 181 "parser.mly"
                       ( _1 )
# 575 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expression_statement) in
    Obj.repr(
# 182 "parser.mly"
                         ( _1 )
# 582 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'selection_statement) in
    Obj.repr(
# 183 "parser.mly"
                         ( _1 )
# 589 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'iteration_statement) in
    Obj.repr(
# 184 "parser.mly"
                        ( _1 )
# 596 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'jump_statement) in
    Obj.repr(
# 185 "parser.mly"
                   ( _1 )
# 603 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'block_item_list_opt) in
    Obj.repr(
# 192 "parser.mly"
    ( _2 )
# 610 "parser.ml"
               : 'compound_statement))
; (fun __caml_parser_env ->
    Obj.repr(
# 197 "parser.mly"
  ( Skip)
# 616 "parser.ml"
               : 'block_item_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'block_item_list) in
    Obj.repr(
# 199 "parser.mly"
    ( _1 )
# 623 "parser.ml"
               : 'block_item_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'block_item) in
    Obj.repr(
# 204 "parser.mly"
    ( _1 )
# 630 "parser.ml"
               : 'block_item_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'block_item_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'block_item) in
    Obj.repr(
# 206 "parser.mly"
    ( Seq (_1, _2) )
# 638 "parser.ml"
               : 'block_item_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'assignment) in
    Obj.repr(
# 212 "parser.mly"
                         ( _1 )
# 645 "parser.ml"
               : 'expression_statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expression) in
    Obj.repr(
# 220 "parser.mly"
  ( Assign(0, _1, _3) )
# 653 "parser.ml"
               : 'assignment))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 230 "parser.mly"
                       ( _1 )
# 660 "parser.ml"
               : 'block_item))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 236 "parser.mly"
  ( Cond(_3, _5, Skip) )
# 668 "parser.ml"
               : 'selection_statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expression) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'statement) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 238 "parser.mly"
    ( Cond(_3, _5, _7) )
# 677 "parser.ml"
               : 'selection_statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expression) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 244 "parser.mly"
  ( While(_3, _5) )
# 685 "parser.ml"
               : 'iteration_statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'assignment) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expression) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'assignment) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 249 "parser.mly"
    ( Seq (_3, While (_5, Seq (_9, _7))) )
# 695 "parser.ml"
               : 'iteration_statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expression) in
    Obj.repr(
# 255 "parser.mly"
    ( Return _2 )
# 702 "parser.ml"
               : 'jump_statement))
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : int Lang.fundefn)
