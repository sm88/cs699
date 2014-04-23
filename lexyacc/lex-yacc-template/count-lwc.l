%{    
unsigned long lines=0, words=0, chars=0;
%}
%%
[a-zA-Z0-9]+    {
                    words++;
                    chars+=yyleng;
                }
.   ;;
\n  lines++;
%%
yywrap(){
    printf("Lines: %lu\nWords: %lu\nChars: %lu\n",lines,words,chars);
    return(1);
}


