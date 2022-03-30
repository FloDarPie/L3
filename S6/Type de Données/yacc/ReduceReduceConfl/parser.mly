%{
  let rec show_list = function
    |  [] -> ""
    |  [x] -> x
    | x :: xs -> x ^ ", " ^ show_list xs
%}

%token <bool> BCONST
%token <int> INTCONST
%token COMMA
%token TIMES
%token LPAR RPAR LBRACE RBRACE LSQBRACKET RSQBRACKET
%token EOL
%type <string> start
%start start

%%
start : expr EOL { $1 }
  ;

expr :
 | arith_expr { "arith (" ^ $1 ^ ")" }
 | list_expr {  "list (" ^ $1 ^ ")" }
;

arith_expr :
 | INTCONST TIMES arith_expr { (string_of_int $1) ^ "*" ^ $3  }
 | INTCONST { (string_of_int $1) }
;

list_expr :
 | LSQBRACKET exprs_comma_sep RSQBRACKET { "[" ^  $2 ^ "]"  }
 | INTCONST TIMES list_expr { (string_of_int $1) ^ "*" ^ $3  }
;

exprs_comma_sep :
   expr                         { $1 }
 | expr COMMA exprs_comma_sep   { $1 ^ "," ^ $3}
