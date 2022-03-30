%token <bool> BCONST
%token <int> INTCONST

%token EOL

%token PLUS
%left  PLUS

%token TIMES
%left TIMES

%type <int> expr start
%start start

%%
start: expr EOL { $1 }
;
expr: INTCONST { $1 }
    |  expr PLUS expr { $1 + $3 }
    |  expr TIMES expr { $1 * $3 }

;

