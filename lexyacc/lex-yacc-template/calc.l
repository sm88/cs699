%{
    #include <stdlib.h>
    #include <string.h>
    #include "y.tab.h"
    void yyerror(char *);
%}

%%
[0-9]+/[^0-9]  { yylval.ival = atoi(yytext); return INT; }
[0-9]+[.][0-9]+/[^0-9]  { yylval.dval = atof(yytext); return FLOAT; }
[a-zA-Z_]+  { yylval.pos = yytext[0] - 'a'; return VAR;}
[*/\(\)\-+\n=]   { return *yytext; }
[ \t]   ;
.   yyerror("Invalid character!");
%%

int yywrap(){
    return 1;
}
