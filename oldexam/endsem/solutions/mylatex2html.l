%{
#include "mylatex2html.tab.h"
#include "mylatex2html.h"
%}

ALPHA	[a-zA-Z]
DIGIT	[0-9]
PUNCT	[-,.]
SPACE	[ \t\n]
WORD	({DIGIT}|{ALPHA}|{PUNCT})+

%%

{WORD}	{
	//printf("word=%s\n", yytext);
	return WORD_TOK;
	}
{SPACE}	{ // Ignore
	}
[\{\}]	{
	//printf("paren=%s\n", yytext);
	return *yytext;
	}
\\begin	{
	//printf("begin found\n");
	return BEGIN_TOK;
	}
\{tabular\}(\{[^\}]*\})?	{
	//printf("tabular found %s\n", yytext);
	return TABULAR_TOK;
	}
\\end	{
	//printf("end found\n");
	return END_TOK;
	}
"&"	{
	//printf("& found\n");
	if(numRows == 0) numCols++;
	return *yytext;
	}
\\\\	{
	//printf("newline found\n");
	numRows++;
	return ROW_END_TOK;
	}
.	{
	//printf("Unknown character %s\n", yytext);
	exit(1);
	}

%%

