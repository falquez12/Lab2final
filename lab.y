%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <ctype.h>

        int simbolos[70];

    void yyerror(char *cadena);
    extern int yylex();



%}


%start linea 

%token def
%token ret
%token IF
%token WHILE
%token FOR
%token INTEGER
%token IDENTIFIER


%%
linea :         asignacion                      {printf("esta bien \n");}
                |funcion                        {printf("esta bien \n");}
                ;   

funcion:        def IDENTIFIER '(' parametros ')' ':' stmt ;

parametros:     parametro
                |
                ;

parametro:      IDENTIFIER;

stmt:               IF '(' expr ')' ':' stmt
                |   WHILE '(' expr ')' stmt
                |   FOR '(' expr ')' stmt
                |   ret  expr ';' 
                |   expr ;

asignacion :    IDENTIFIER '=' expr;    

expr:    INTEGER;


%%

int main (void){
        int i;
        for (i=0; i<52;i++){
                simbolos[i]=0;
        }
        return yyparse();
}

void yyerror (char *cadena) {fprintf (stderr, "%s\n", cadena);}