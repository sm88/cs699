%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex();
void yyerror(const char *);
void printRow();
void initRow();
char *yytext;
int colCount = 0;
#define MAX_ROWS 100
#define MAX_COL_LEN 200
char curRow[MAX_ROWS][MAX_COL_LEN];
int numRows = 0;
int numCols = 1;
%}

%token BEGIN_TOK
%token END_TOK
%token TABULAR_TOK
%token WORD_TOK
%token ROW_END_TOK

%%

TABLE: BEGIN_TABLE ROWS END_TABLE {
	};

BEGIN_TABLE: BEGIN_TOK TABULAR_TOK {
	printf("<html><body><table>\n");
	initRow();
	};

END_TABLE: END_TOK TABULAR_TOK {
	printf("</table></body></html>\n");
	};

ROWS: ROWS ROW ROW_END_TOK {
	colCount++;
	printRow();
	initRow();
	}
	|
	ROW ROW_END_TOK {
	colCount++;
	printRow();
	initRow();
	}
	;

ROW: CELL_AND_AMPS CELL {
	}
	|
	CELL {
	}
	;

CELL_AND_AMPS: CELL_AND_AMPS CELL_AND_AMP {
	}
	|
	CELL_AND_AMP
	;

CELL_AND_AMP: CELL '&' {
	colCount++;
	};

CELL: WORDS {
	};

WORDS: WORDS WORD_TOK {
	strcat(curRow[colCount], yytext);
	strcat(curRow[colCount], " ");
	}
	|
	;


%%

void yyerror(const char *s) {
	fprintf(stderr, "parse error: %s\n", s);
	exit(2);
} // End yyerror()

void printRow() {
	int i;
	printf("<tr>\n");
	for(i = 0; i < colCount; i++) {
		printf("\t<td>\n");
		printf("\t%s", curRow[i]);
		printf("\t</td>\n");
	}
	printf("</tr>\n");
}

void initRow() {
	int i;
	for(i = 0; i < MAX_ROWS; i++) {
		curRow[i][0] = 0; // initialize to empty string
	}
	colCount = 0;
}

int main(int argc, char *argv[]) {
	yyparse();
	fprintf(stderr, "numRows=%d\n", numRows);
	fprintf(stderr, "numCols=%d\n", numCols);
	return 0;
}

