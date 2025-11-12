%{
#include <stdio.h>
#include <string.h>

int lc=0, sc=0, tc=0, ch=0, wc=0;
int kw=0, id=0, cmt=0;

char *kwlist[] = {
    "int","float","char","if","else","for","while","return","void","main"
};

int is_keyword(const char *w){
    for(int i=0;i<10;i++)
        if(!strcmp(w,kwlist[i])) return 1;
    return 0;
}
%}

%%
"//".*                  { cmt++; lc++; ch+=yyleng; }
"/*"([^*]|\*+[^*/])*"*/" { cmt++; ch+=yyleng; }
\n                      { lc++; ch+=yyleng; }
" "                     { sc++; ch+=yyleng; }
"\t"                    { tc++; ch+=yyleng; }
[a-zA-Z_][a-zA-Z0-9_]*  { wc++; ch+=yyleng;
                          is_keyword(yytext)?kw++:id++; }
.                       { ch+=yyleng; }
%%

int main(){
    printf("Enter code (Ctrl+D to end):\n");
    yylex();
    printf("\n--- Result ---\n");
    printf("Lines:%d  Spaces:%d  Tabs:%d  Chars:%d\n",lc,sc,tc,ch);
    printf("Words:%d  Keywords:%d  Ids:%d  Comments:%d\n",wc,kw,id,cmt);
    return 0;
}

int yywrap(){ return 1; }
