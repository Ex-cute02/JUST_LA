%{
#include <stdio.h>

int id = 0;
int comment = 0;
int key = 0;
int space = 0;
int nline = 0;
%}

%%
\n                              { nline++; }
(int|float|char|if|else|for)    { key++; }
[a-zA-Z_][a-zA-Z0-9_]*          { id++; }
"//"[^\n]*                      { comment++; }
"/*"([^*]|\*+[^*/])*"*/"        { comment++; }
[ \t]+                          { space++; }
.                               {}
%%

int main(void) {
    printf("Enter your code (Ctrl+D to finish):\n");
    yylex();

    printf("\n--- Code Statistics ---\n");
    printf("Keywords    : %d\n", key);
    printf("Identifiers : %d\n", id);
    printf("Comments    : %d\n", comment);
    printf("Spaces      : %d\n", space);
    printf("Newlines    : %d\n", nline);
    return 0;
}

int yywrap(void) {
    return 1;
}
