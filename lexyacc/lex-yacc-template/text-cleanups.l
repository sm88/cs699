%{
    #include <stdio.h>
%}
word [a-zA-Z_0-9]
punct [,.;!:?]
op [(]
cp [)]
%s OPEN
%s CLOSE
%s TEXT
%s PUNCT
%%
[ \t]+    ;

<INITIAL>"("    {ECHO; BEGIN OPEN;}
<TEXT>"("   {putchar(' '); ECHO; BEGIN OPEN;}
<PUNCT>"("  {putchar(' '); ECHO; BEGIN OPEN;}

")" {ECHO; BEGIN CLOSE;}

<INITIAL>{word}+    {ECHO; BEGIN TEXT;}
<OPEN>{word}+   {ECHO; BEGIN TEXT;}
<CLOSE>{word}+  {putchar(' '); ECHO; BEGIN TEXT;}
<TEXT>{word}+   {putchar(' '); ECHO; BEGIN TEXT;}
<PUNCT>{word}+  {putchar(' '); ECHO; BEGIN TEXT;}

{punct}+    {ECHO; BEGIN PUNCT;}

\n  {ECHO; BEGIN INITIAL;}
%%

int main(){
    yylex();
    return 0;
}

