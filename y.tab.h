/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    def = 258,
    ret = 259,
    IF = 260,
    WHILE = 261,
    FOR = 262,
    RESTA = 263,
    INTEGER = 264,
    IDENTIFIER = 265,
    COLON = 266,
    COMP = 267,
    IGUAL = 268,
    PARABRE = 269,
    PARCIERRA = 270,
    SUMA = 271,
    OR = 272,
    AND = 273,
    DIFERENTE = 274,
    COMA = 275,
    TRUES = 276,
    FALSES = 277,
    IS = 278,
    NOT = 279,
    DIV = 280,
    MULT = 281,
    EXP = 282,
    FDIV = 283,
    MOD = 284,
    CORABRE = 285,
    CORCIERRA = 286,
    LT = 287,
    GT = 288,
    LET = 289,
    GET = 290,
    SEMICOLON = 291,
    CIRCUN = 292,
    ELSE = 293,
    ELIF = 294,
    BREAK = 295,
    CONTINUE = 296,
    IMPORT = 297,
    PASS = 298,
    PRINT = 299,
    IN = 300,
    RANGE = 301,
    STR = 302,
    COMILLAS = 303,
    COMILLA = 304,
    AUMENTAVAR = 305,
    RESTAVAR = 306,
    MULTIPLICAVAR = 307,
    DIVIDEVAR = 308,
    EXPVAR = 309,
    FDIVVAR = 310,
    MODVAR = 311
  };
#endif
/* Tokens.  */
#define def 258
#define ret 259
#define IF 260
#define WHILE 261
#define FOR 262
#define RESTA 263
#define INTEGER 264
#define IDENTIFIER 265
#define COLON 266
#define COMP 267
#define IGUAL 268
#define PARABRE 269
#define PARCIERRA 270
#define SUMA 271
#define OR 272
#define AND 273
#define DIFERENTE 274
#define COMA 275
#define TRUES 276
#define FALSES 277
#define IS 278
#define NOT 279
#define DIV 280
#define MULT 281
#define EXP 282
#define FDIV 283
#define MOD 284
#define CORABRE 285
#define CORCIERRA 286
#define LT 287
#define GT 288
#define LET 289
#define GET 290
#define SEMICOLON 291
#define CIRCUN 292
#define ELSE 293
#define ELIF 294
#define BREAK 295
#define CONTINUE 296
#define IMPORT 297
#define PASS 298
#define PRINT 299
#define IN 300
#define RANGE 301
#define STR 302
#define COMILLAS 303
#define COMILLA 304
#define AUMENTAVAR 305
#define RESTAVAR 306
#define MULTIPLICAVAR 307
#define DIVIDEVAR 308
#define EXPVAR 309
#define FDIVVAR 310
#define MODVAR 311

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;
int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
