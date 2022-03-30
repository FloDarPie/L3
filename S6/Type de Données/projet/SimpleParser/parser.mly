%{
open Lang
%}

%token <bool> BCONSTANT
%token <int> INTCONSTANT
%token SEMICOLON
%token RETURN
%token EOF


%start start
/* TODO: For complete grammar, comment in this line:
%type <int Lang.fundefn> start
  */

%type <int Lang.stmt> start
    
%%

start: statement { $1 }
;

/* *******  EXPRESSIONS  ******* */


expression:
  BCONSTANT
    { Const(0, BoolV $1) }
| INTCONSTANT
    { Const(0, IntV $1) }
;


/* *******  STATEMENTS  ******* */

statement: 
    return_statement { $1 }
;

return_statement: 
  RETURN expression SEMICOLON
    { Return $2 }
;
