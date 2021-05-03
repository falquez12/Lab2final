%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <ctype.h>

        int simbolos[70];

    void yyerror(char *cadena);
    extern int yylex();
    extern int yylineno;


%}

%locations

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
%token ELIF;
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
                ;   

funcion:        def IDENTIFIER PARABRE parametros PARCIERRA COLON stmt;



parametros:      parametros COMA parametro
                | parametro 
                |
                ;

parametro:      IDENTIFIER;

stmt:               condicional
                |   WHILE  expr  stmt
                |   FOR  expr  stmt
                |   stmt ret  expr 
                |   stmt ret 
                |   asignacion
                |   expr 
                |   expr2
                ;

condicional:      IF expr_booleana COLON stmt cond_elif cond_else
                | IF expr2 COLON stmt cond_elif cond_else
                ;
cond_elif: ELIF expr_booleana COLON stmt cond_elif
        | 
        ;
cond_else: ELSE expr_booleana COLON stmt cond_else
        | 
        ;
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
         | IDENTIFIER CORABRE expr_aritmetica CORCIERRA
         | CORABRE expr CORCIERRA
         ;


expr2:   NOT expr
        
        ;

expr_aritmetica:   INTEGER
                 | IDENTIFIER
                 | expr_aritmetica operadores expr_aritmetica
            ;
expr_booleana:  expr operadoreslogicos expr
                | PARABRE expr operadoreslogicos expr PARCIERRA
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

void yyerror (char *cadena) {
        fprintf(stderr,"Error | Line: %d\n%s\n",yylineno,cadena);
        }