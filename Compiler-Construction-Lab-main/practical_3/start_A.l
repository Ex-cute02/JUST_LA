%{
#include <stdio.h>
int counter = 0;
%}

%%
[Aa][a-zA-Z0-9]*   { counter++; }
[a-zA-Z0-9]+ ;
[\t\n]+ ;
. ;
%%

int main() {
    printf("Your input: ");
    yylex();
    printf("Number of words starting with A: %d\n", counter);
    return 0;
}

int yywrap() {
    return 1;
}
