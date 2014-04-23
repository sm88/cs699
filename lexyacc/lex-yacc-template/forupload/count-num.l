%{
    unsigned long ints=0,floats=0;
%}

%%
(^|[ \t]+)[-]?[0-9]+/([\n \t]+)   ints++;
(^|[ \t]+)[-]?[0-9]+[.][0-9]+/([\n \t]+) floats++;
.   ;;
[\n]    ;;
%%

yywrap(){
    printf("Integers %lu\nFloats %lu\n",ints,floats);
    return(1);
}
