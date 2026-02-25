%{
    #include <stdio.h>
    #include <stdlib.h>
    int id = 0;
%}

%%
"[0-9]|[a-z]" {printf("<id>: %s", yytext);}
"[0-9]|[a-z]"|\([0-9]\) {printf("<factor> %s", yytext);}
%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
