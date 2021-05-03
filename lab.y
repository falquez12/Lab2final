%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <ctype.h>

    

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
%left  COMA
%right COLON IGUAL 
%left  SUMA RESTA
%left  MULT
%right AND 
%left  PARABRE CORABRE

%token AUMENTAVAR; 
%token RESTAVAR; 
%token MULTIPLICAVAR; 
%token DIVIDEVAR; 
%token EXPVAR;
%token FDIVVAR; 
%token MODVAR;




%%
linea:          multiasig            {printf("ESTA BIEN\n");}
                |funcion             {printf("ESTA BIEN2\n");}
                |stmt                {printf("ESTA BIEN3\n");}
                |IMPORT IDENTIFIER   {printf("ESTA BIEN4\n");}
                |specialstmt          {printf("ESTA BIEN5\n");}
                |linea multiasig           {printf("ESTA BIEN6\n");}
                |linea funcion             {printf("ESTA BIEN7\n");}
                |linea stmt                {printf("ESTA BIEN8\n");}
                |linea IMPORT IDENTIFIER   {printf("ESTA BIEN9\n");}
                |linea specialstmt          {printf("ESTA BIEN10\n");}
                ;   

funcion:        def IDENTIFIER PARABRE parametros PARCIERRA COLON stmt;



parametros:      parametros COMA parametro
                | parametro 
                |
                ;

parametro:      IDENTIFIER;

stmt:               condicional 
                |   WHILE expr_booleana COLON stmt
                |   FOR  expr_booleana COLON stmt
                |   stmt ret  expr 
                |   stmt ret 
                |   multiasig
                |   expr 
                |   expr2
                |   PRINT PARABRE expr PARCIERRA
                |
                ;

specialstmt:    CONTINUE
                |PASS
                |BREAK
                ;

condicional:      IF expr_booleana COLON stmt cond_elif cond_else 
                | IF expr2 COLON stmt cond_elif cond_else
                ;
cond_elif: ELIF expr_booleana COLON stmt cond_elif
        |ELIF expr2 COLON stmt cond_elif 
        |
        ;
cond_else: ELSE COLON stmt cond_else
        | 
        ;
        ;

asignacion:     IDENTIFIER IGUAL expr 
           |    IDENTIFIER IGUAL RESTA INTEGER
           |    IDENTIFIER IGUAL RESTA IDENTIFIER
           |    IDENTIFIER operadoresasignacion expr 
           |    IDENTIFIER operadoresasignacion RESTA INTEGER
           |    IDENTIFIER operadoresasignacion RESTA IDENTIFIER
           ;

multiasig:  IDENTIFIER COMA multiasig COMA expr
            | asignacion
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
expr_booleana:    INTEGER
                | STR
                | IDENTIFIER  
                | TRUES
                | FALSES
                | PARABRE expr_booleana PARCIERRA
                | PARABRE NOT expr_booleana PARCIERRA
                | expr_booleana operadores expr_booleana 
                | expr_booleana operadoreslogicos expr_booleana 
                | IDENTIFIER PARABRE expr_booleana PARCIERRA
                | IDENTIFIER PARABRE NOT expr_booleana PARCIERRA
                | IDENTIFIER PARABRE PARCIERRA
                | IDENTIFIER CORABRE expr_aritmetica CORCIERRA
                | CORABRE expr_booleana CORCIERRA
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

operadoresasignacion:   AUMENTAVAR 
                      |  RESTAVAR
                      |  MULTIPLICAVAR 
                      |  DIVIDEVAR 
                      |  EXPVAR
                      |  FDIVVAR 
                      | MODVAR
                      ;




%%

int main (void){
        return yyparse();
}

void yyerror (char *cadena) {
        fprintf(stderr,"Error | Line: %d\n%s\n",yylineno,cadena);
        }