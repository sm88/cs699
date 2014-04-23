all: mylatex2html

mylatex2html: mylatex2html.tab.o lex.yy.o
	gcc -o mylatex2html mylatex2html.tab.o lex.yy.o -ll

mylatex2html.tab.o: mylatex2html.tab.c mylatex2html.tab.h
	gcc -c mylatex2html.tab.c

lex.yy.o: lex.yy.c mylatex2html.tab.h mylatex2html.h
	gcc -c lex.yy.c

lex.yy.c: mylatex2html.l mylatex2html.tab.h
	lex mylatex2html.l

mylatex2html.tab.c mylatex2html.tab.h: mylatex2html.y
	bison -v -d mylatex2html.y

clean:
	rm -f mylatex2html.tab.o lex.yy.o mylatex2html.tab.c mylatex2html.tab.h lex.yy.c mylatex2html

