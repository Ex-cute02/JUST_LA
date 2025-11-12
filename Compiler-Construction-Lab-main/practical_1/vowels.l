%{
#include<stdio.h>
int vowel = 0;
%}

%%
[A+E+I+O+Ua+e+i+o+u]+ {vowel++;}
.|\n { }
%%

int main()
{
printf("Enter your word: \n");
yylex();

printf("Number of vowels: %d", vowel);
return 0;
}
int yywrap()
{
return 1;
}
