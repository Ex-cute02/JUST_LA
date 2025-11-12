%{
#include <stdio.h>

int id = 0;
int comment = 0;
int key = 0;
int word = 0;
int space = 0;
int nline = 0;
%}

%%
\n                          { nline++; }
(int|float|char|if|else|for) { key++; }
[a-zA-Z_][a-zA-Z0-9_]*      { id++; }
"//"[^\n]*                  { comment++; }
"/*"([^*]|\*+[^*/])*"*/"    { comment++; }
[ \t]                       { space++; }
.                           { }
%%

int main() {
    printf("Enter your code (Ctrl+D to end input):\n");
    yylex();

    printf("\n--- Code Statistics ---\n");
    printf("Identifiers : %d\n", id);
    printf("Keywords    : %d\n", key);
    printf("Comments    : %d\n", comment);
    printf("Spaces      : %d\n", space);
    printf("Newlines    : %d\n", nline);

    return 0;
}

int yywrap(void) {
    return 1;
}
