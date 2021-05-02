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
%token INTEGER
%token IDENTIFIER


%%
linea :         asignacion                      {printf("esta bien \n");}
                |funcion                        {printf("esta bien \n");}
                ;   

funcion:        def IDENTIFIER '(' parametros ')' ':';

parametros:     parametro
                |
                ;

parametro:      IDENTIFIER;

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