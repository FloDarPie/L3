%token <bool> BCONST
%token <int> INTCONST
%token OPERATOR
%token EOL
%left  OPERATOR
%type <int> expr start
%start start

%%
start: expr EOL { $1 }
;
expr: INTCONST { 0 }
;

