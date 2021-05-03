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
%token RESTA
%token INTEGER
%token IDENTIFIER
%token COLON
%token COMP
%token IGUAL
%token PARABRE
%token PARCIERRA
%token SUMA
%token OR
%token AND
%token DIFERENTE
%token COMA
%token TRUES
%token FALSES
%token IS
%token NOT
%token DIV;
%token MULT;
%token EXP;
%token FDIV;
%token MOD;
%token CORABRE;
%token CORCIERRA;
%token LT;
%token GT;
%token LET;
%token GET;
%token SEMICOLON;
%token CIRCUN;
%token ELSE;
%token BREAK;
%token CONTINUE;
%token IMPORT;
%token PASS;
%token PRINT;
%token IN;
%token RANGE;
%token STR;
%token COMILLAS;
%token COMILLA;




%%
linea:          asignacion             {printf("esta bien \n");}
                |funcion              {printf("esta bien \n");}
                |stmt                {printf("esta bien \n");}
                |lista                {printf("esta bien \n");}
                |poslista                {printf("esta bien \n");}
                ;   

funcion:        def IDENTIFIER PARABRE parametros PARCIERRA COLON stmt;



parametros:      parametros COMA parametro
                | parametro 
                |
                ;

parametro:      IDENTIFIER;

stmt:               IF expr COLON stmt  
                |   IF expr2 COLON stmt  
                |   WHILE  expr  stmt
                |   FOR  expr  stmt
                |   ret  expr SEMICOLON
                |   expr 
                |   expr2
                |
                ;

asignacion:     IDENTIFIER IGUAL expr 
           |    IDENTIFIER COMA identifier2
           |    IDENTIFIER IGUAL RESTA INTEGER
           |    IDENTIFIER IGUAL RESTA IDENTIFIER
           ;    

identifier2:  IDENTIFIER COMA identifier2
            | IDENTIFIER
            ;

expr:      INTEGER
         | STR
         | IDENTIFIER
         | TRUES
         | FALSES
         | PARABRE expr PARCIERRA
         | PARABRE NOT expr PARCIERRA
         | expr operadores expr
         | expr operadoreslogicos expr
         | expr COMA expr
         | IDENTIFIER PARABRE expr PARCIERRA
         | IDENTIFIER PARABRE NOT expr PARCIERRA
         | IDENTIFIER PARABRE PARCIERRA
         ;
expr2:   NOT expr
        
        ;

lista:  CORABRE expr CORCIERRA
        ;

poslista:  IDENTIFIER CORABRE expr_aritmetica CORCIERRA
        ;
expr_aritmetica:   INTEGER
                 | IDENTIFIER
                 | expr_aritmetica operadores expr_aritmetica
            ;
            


operadores:      SUMA
                |RESTA
                |MULT
                |DIV
                |FDIV
                |MOD
                |EXP
                ;
operadoreslogicos:   AND
                    |OR
                    |COMP
                    |DIFERENTE
                    |IS
                    |LT
                    |GT
                    |LET
                    |GET
                    |CIRCUN
                    ;






%%

int main (void){
        int i;
        for (i=0; i<52;i++){
                simbolos[i]=0;
        }
        return yyparse();
}

void yyerror (char *cadena) {fprintf (stderr, "%s\n", cadena);}