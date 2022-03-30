%token <bool> BCONST
%token <int> INTCONST

%token PLUS
%left PLUS

%token PARES_OUV 
%token PARES_FERM

%token CRO_OUV 
%token CRO_FERM 

%token ACO_OUV 
%token ACO_FERM 

%token EOL

%type <int list> expr start
%start start

%%
start: expr EOL { $1 }
;

expr: INTCONST { [$1;0;0;0] }
    |  expr PLUS expr { [$1 + $3;0;0;0] }
    | PARES_OUV expr PARES_FERM { [$2; 1; 0; 0] }
    | CRO_OUV expr CRO_FERM { [$2; 0; 1; 0] }
    | ACO_OUV expr ACO_FERM { [$2; 0; 0; 1] }
;


