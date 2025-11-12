%{
#include <stdio.h>

int count = 0;
int total = 0;
%}

%%
^.*com$   { count++; total++; }
.*\n      { total++; }
.|\n      { ; }
%%

int main() {
    printf("Enter text (Ctrl+D to end):\n");
    yylex();
    printf("\n'com' included in %d out of %d lines\n", count, total);
    return 0;
}

int yywrap() {
    return 1;
}
