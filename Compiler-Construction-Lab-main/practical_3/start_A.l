%{
#include <stdio.h>
int counter = 0;
%}

%%
[A,a][a-zA-Z]*   { counter++; }
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
