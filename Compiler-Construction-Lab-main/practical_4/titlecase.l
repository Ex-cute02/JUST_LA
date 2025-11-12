%{
#include <stdio.h>

int flag = 1;

char convert_upper(char c) {
    if (c >= 'a' && c <= 'z') {
        return c - 32;  
    }
    return c;
}

char convert_lower(char c) {
    if (c >= 'A' && c <= 'Z') {
        return c + 32; 
    }
    return c;
}
%}

%%
[a-zA-Z] {
    if (flag) {
        putchar(convert_upper(yytext[0]));
        flag = 0;
    } else {
        putchar(convert_lower(yytext[0]));
    }
}

[\t\n ] {
    flag = 1;
    putchar(yytext[0]);
}

. {
    putchar(yytext[0]);
}
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a sentence: ");
    yylex();
    return 0;
}
