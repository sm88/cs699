%{
    #include<stdio.h>
    #include<stdlib.h>
    #define DZ 1
    int yylex(void);
    void yyerror(char *);
    void handleError();
%}
%union{
    int ival;
    float dval;
}
%token <ival> INT 
%token <dval> FLOAT
%left '+' '-'
%left '*' '/'
%type <dval> prog expr
%%
prog:
    prog expr '\n'  { printf("%f\n", $2); }
    |
    ;
expr:
    INT { $$ = $1; }
    | FLOAT { $$ = $1; } 
    | expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { if ($3 == 0) handleError(DZ); $$ = $1 / $3; }  
    | '('expr')'    { $$ = $2; }
    ;
%%

void handleError(int errNo){
    switch(errNo){
        case DZ:
            yyerror("[Error]: Divide by zero!");
            exit(errNo);

        default:
            yyerror("[Error]: Unknown!");                
            exit(errNo);
    }
}

void yyerror(char *s){
    printf("%s\n",s);
}

int main(){
    yyparse();
    return 0;
}
