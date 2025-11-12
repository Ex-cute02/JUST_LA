%{
#include <stdio.h>
int count = 0;
%}

%%
[Aa][a-zA-Z]*      { count++; }
[a-zA-Z]+          ;
[ \t\n]+           ;
%%

int main() {
    printf("Enter text:\n");
    yylex();
    printf("Number of words starting with A or a: %d\n", count);
    return 0;
}

int yywrap() {
    return 1;
}
