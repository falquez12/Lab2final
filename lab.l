%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
int yylex();
void yyerror (char *cadena);
%}


%%
"def"                            {  return def; }
"return"                         {  return ret;  }
[_a-zA-Z][_a-zA-Z0-9]*           { return IDENTIFIER;   }
[+-]?[0-9]+                      {  return INTEGER;  }
[-+()*/=;:]                      {  return yytext[0];   }
[ \t\f\v\n]                       ; 
.		                         {ECHO; yyerror("Unexpected character\n");}
%%
int yywrap (void){return 1;}