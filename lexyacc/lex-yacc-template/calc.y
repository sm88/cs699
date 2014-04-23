%{
    #include<stdio.h>
    #include<stdlib.h>
    #define DZ 1
    int yylex(void);
    void yyerror(char *);
    void handleError();
    float symTab[26];
%}
%union{
    int ival;
    float dval;
    int pos;
}
%token <ival> INT 
%token <dval> FLOAT
%token <pos> VAR
%left '+' '-'
%left '*' '/'
%type <dval> prog expr stmt
%%
prog:
    prog stmt '\n'
    |
stmt:
    expr    { printf("%f\n",$1); }
    | VAR '=' expr  { symTab[$1] = $3; }
    ;
expr:
    INT { $$ = $1; }
    | FLOAT { $$ = $1; }
    | VAR   { $$ = symTab[$1]; }
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
