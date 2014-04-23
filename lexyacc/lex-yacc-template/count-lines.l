    unsigned int lines=0;
%%
^.*$    ;;
\n  lines++;
%%
yywrap(){
    printf("Total Lines: %u\n",lines);
    return(1);
}
