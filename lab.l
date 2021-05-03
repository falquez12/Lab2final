%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
int yylex();
void yyerror (char *cadena);
%}

%option yylineno

%%
"+="                             {return AUMENTAVAR; }
"-="                             {return RESTAVAR; }
"*="                             {return MULTIPLICAVAR; }
"/="                             {return DIVIDEVAR; }
"**="                            {return EXPVAR;}
"//="                            {return FDIVVAR;} 
"%="                             {return MODVAR;}
""""                            {return COMILLAS;}
"''"                            {return COMILLA;}
"else"                           {return ELSE;}
"break"                          {return BREAK;}
"continue"                       {return CONTINUE;}
"import"                         {return IMPORT;}
"pass"                          {return PASS;}
"print"                         {return PRINT;}
"in"                            {return IN;}
"range"                          {return RANGE;}
"^"                             {return CIRCUN;}
";"                             {return SEMICOLON;}
"<"                             {return LT;}
">"                             {return GT;}
"<="                             {return LET;}
">="                             {return GET;}
"["                             {return	CORABRE;}
"]"                             {return	CORCIERRA;}
"//"                            {return FDIV;}
"%"                             {return MOD;}
"/"                             {return DIV;}
"*"                             {return MULT;}
"**"                             {return EXP;}
"not"                            {return NOT;}
"is"                            {return IS;}
"False"                           {return FALSES; }
"True"                          {return TRUES;}
","                              {return COMA;}
"!="                             {return DIFERENTE;}
"and"                             {return AND;}
"&"                             {return AND;}
"|"                             {return OR;}
"or"                             {return OR;}
"-"                             {return RESTA;}
"+"                             {return SUMA;}
"("                             {return	PARABRE;}
")"                             {return PARCIERRA;}
"="                              {return IGUAL;}
"=="                             {return COMP;}
":"                              { return COLON; }
"def"                            {  return def; }
"return"                         {  return ret;  }
"if"                         {  return IF;  }
"elif"                          {return ELIF;}
"while"                         {return WHILE;}
"for"                         {return FOR;}
[_a-zA-Z][_a-zA-Z0-9]*           {return IDENTIFIER;}
[0-9]+                        {return INTEGER;}
\".*\"                          {return STR;}
\'.*\'                           {return STR;}
[0-9$&?@#!][a-zA-Z_]+                 {ECHO; yyerror("invalid identifier \n");}
[$&?@#!]                               {ECHO; yyerror("invalid symbol \n");}
[ \t\f\v\n]                       ; 


%%
int yywrap (void){return 1;}