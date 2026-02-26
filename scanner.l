%{
    #include <stdio.h>
    #include <stdlib.h>
    int id = 0;
%}
/* Claude chat: https://claude.ai/share/d94b49ba-84c2-4746-931c-273dcb7d55ab */
%%
"[0-9]|[a-z]" {printf("<id>: %s", yytext);}
([0-9]|[a-z])[ \t]"+"[ \t]([0-9]|[a-z]) {printf("<expression> %s", yytext);}
([0-9]|[a-z])[ \t]"*"[ \t]([0-9]|[a-z]) {printf("<term> %s", yytext);}
(\(([0-9]|[a-z])[ \t]("+"|"*")[ \t]([0-9]|[a-z])\))|\([0-9]\) {printf("<factor> %s", yytext);}
%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
