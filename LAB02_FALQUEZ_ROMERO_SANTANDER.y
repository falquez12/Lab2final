%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <ctype.h>
    #include "y.tab.h"
    

    void yyerror(char *s);
    extern int yylex();
    extern int yylineno;
    extern FILE *yyin;
    extern int linenum;
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
%token COMMENT;




%%
linea:          multiasig            
                |funcion             
                |stmt                
                |IMPORT IDENTIFIER   
                |specialstmt          
                |COMMENT                
                |linea multiasig           
                |linea funcion             
                |linea stmt                
                |linea IMPORT IDENTIFIER   
                |linea specialstmt          
                |linea COMMENT                 
                |linea error                 
                ;   

funcion:        def IDENTIFIER PARABRE parametros PARCIERRA COLON stmt 
                | def IDENTIFIER PARABRE parametros PARCIERRA COLON ret 
                | def IDENTIFIER PARABRE parametros PARCIERRA COLON ret expr 
                | def IDENTIFIER PARABRE parametros PARCIERRA COLON 
                ;




parametros:      parametros COMA parametro
                | parametro 
                |
                ;

parametro:      IDENTIFIER;

stmt:               condicional 
                |   WHILE expr_booleana COLON stmt
                |   ciclo_for stmt
                |   multiasig
                |   expr 
                |   expr2
                |   PRINT PARABRE expr PARCIERRA
                |   range_expr
                ;

specialstmt:    CONTINUE
                |PASS
                |BREAK
                |ret expr 
                |ret 
                ;

condicional:     IF expr_booleana COLON stmt cond_elif cond_else 
                | IF expr2 COLON stmt cond_elif cond_else
                | IF expr_booleana COLON
                | IF expr2 COLON
                ;

cond_elif: ELIF expr_booleana COLON stmt cond_elif
        |ELIF expr2 COLON stmt cond_elif 
        |ELIF expr_booleana COLON
        |ELIF expr2 COLON
        |
        ;

cond_else: ELSE COLON stmt 
        | ELSE COLON 
        |
        ;

ciclo_for: FOR IDENTIFIER IN IDENTIFIER COLON 
          |FOR IDENTIFIER IN expr_str COLON 
          |FOR IDENTIFIER IN PARABRE IDENTIFIER PARCIERRA COLON 
          |FOR IDENTIFIER IN PARABRE expr_str PARCIERRA COLON 
          |FOR IDENTIFIER IN range_expr COLON
          |FOR IDENTIFIER IN CORABRE expr CORCIERRA COLON
           ;

range_expr: RANGE PARABRE expr PARCIERRA   
           |RANGE expr             
           |RANGE PARABRE expr COMA expr PARCIERRA  
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
         | RESTA INTEGER   
         | RESTA IDENTIFIER                   
         | expr_str 
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
         | IDENTIFIER pos_lista
         | CORABRE expr CORCIERRA
         | CORABRE CORCIERRA
         ;

expr_str: STR 
         | STR SUMA STR 
         | STR operadoreslogicos STR 
         ;

pos_lista:      CORABRE expr_aritmetica CORCIERRA pos_lista
                | 
                ; 

expr2:   NOT expr
        ;

expr_aritmetica:   INTEGER
                 | IDENTIFIER PARABRE PARCIERRA
                 | IDENTIFIER PARABRE expr PARCIERRA
                 | IDENTIFIER pos_lista
                 | expr_aritmetica operadores expr_aritmetica
            ;
expr_booleana:    INTEGER
                | expr_str
                | RESTA INTEGER   
                | RESTA IDENTIFIER       
                | TRUES
                | FALSES
                | PARABRE expr_booleana PARCIERRA
                | PARABRE NOT expr_booleana PARCIERRA
                | expr_booleana operadores expr_booleana 
                | expr_booleana operadoreslogicos expr_booleana 
                | IDENTIFIER PARABRE expr_booleana PARCIERRA
                | IDENTIFIER PARABRE NOT expr_booleana PARCIERRA
                | IDENTIFIER PARABRE PARCIERRA
                | IDENTIFIER pos_lista
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

int main(int argc, char *argv[])
{
     yyin = fopen(argv[1], "r");

    if(!yyparse())
        printf("\nParseado completado\n");
    else
        printf("\nError en el parseo\n");

    fclose(yyin);
    
    return 0;
}

void yyerror(char *s){
    fprintf(stderr,"Error at line: %d %s\n",yylineno,s);
}