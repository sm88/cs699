%{
    #include <stdlib.h>
    #include "y.tab.h"
    void yyerror(char *);
%}

%%
[0-9]+/[^0-9]  { yylval.ival = atoi(yytext); return INT; }
[0-9]+[.][0-9]+/[^0-9]  { yylval.dval = atof(yytext); return FLOAT; }
[*/\(\)\-+\n]   return *yytext;
[ \t]   ;
.   yyerror("Invalid character!");
%%

int yywrap(){
    return 1;
}
