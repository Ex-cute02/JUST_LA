%{
#include <stdio.h>
char hex[20];
int num, rem, i;
%}

%%
[0-9]+ {
    num = 0;

    
    for(i = 0; yytext[i] != '\0'; i++) {
        num = num * 10 + (yytext[i] - '0');
    }

    if(num == 0) {
        printf("Hex: 0\n");
    } else {
        i = 0;
        while(num > 0) {
            rem = num % 16;
            if(rem < 10)
                hex[i++] = '0' + rem;
            else
                hex[i++] = 'A' + (rem - 10);
            num = num / 16;
        }

        printf("Hex: ");
        while(i > 0) {
            printf("%c", hex[--i]);
        }
        printf("\n");
    }
}

. ;   
%%

int main() {
    printf("Enter a decimal number (Ctrl+D to stop):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
