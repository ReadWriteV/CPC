%require "3.2"
%language "c++"
%skeleton "lalr1.cc"

%define api.namespace {CPC}
%define api.parser.class {Parser}
%define api.token.raw
%define api.token.constructor
%define api.value.type variant
%define api.token.prefix {TOKEN_}

%define parse.assert
%define parse.trace
%define parse.error detailed
%define parse.lac full

%lex-param {CPC::Driver &driver}
%parse-param {CPC::Driver &driver}


%defines
%locations

%code requires
{
  #include <iostream>
  #include <string>
  namespace CPC {
      class Scanner;
      class Parser;
      class AST;
      class Driver;
  }
}

%code top
{
  #include "node.h"
  #include "ast.h"

  #include "driver.h"
  #include "scanner.h"
  CPC::Parser::symbol_type yylex(CPC::Driver &driver){
    return driver.scan();
  }
}

%left ADD
%left SUB
%left MUL
%left DIV

%token ASSIN

%token LT LTE GT GTE EQ NEQ

%token POINT COMMA SEMICOLON ARRAY

%token LPARENTHESE RPARENTHESE LBRACKET RBRACKET LBRACE RBRACE

%token VOID INT FLOAT STR

%token IF ELSE WHILE RETURN IMPORT SIZEOF

%token <int> INTEGER
%token <float> FLOATPOINT
%token <std::string> ID STRING

%nterm <CPC::AST *> program


%start program

%%

program: declaration_list { $$ = new CPC::AST(driver.getFileName()); }
    ;

declaration_list: declaration_list declaration
  | declaration { }
  ;

declaration: var_declaration
  | fun_declaration
  | import_declaration
  ;

var_declaration: type_specifier ID SEMICOLON
  | type_specifier ID LBRACKET INTEGER RBRACKET SEMICOLON
  ;

type_specifier: VOID
  | INT
  | FLOAT
  | STR
  ;

fun_declaration : type_specifier ID LPARENTHESE params RPARENTHESE compound_stmt
  ;

import_declaration: IMPORT modules SEMICOLON
;

modules: modules POINT ID
| ID
;

params: param_list
  | VOID
  ;

param_list: param_list COMMA param
  | param
  ;

param: type_specifier ID
  | type_specifier ID ARRAY
  ;

compound_stmt: LBRACE local_declarations statement_list RBRACE
;

local_declarations: local_declarations var_declaration
|
;

statement_list: statement_list statement
|
;

statement: expression_stmt
|compound_stmt
|selection_stmt
|iteration_stmt
|return_stmt
;

expression_stmt: expression SEMICOLON
|SEMICOLON
;

selection_stmt:IF LPARENTHESE expression RPARENTHESE statement
|IF LPARENTHESE expression RPARENTHESE statement ELSE statement
;

iteration_stmt: WHILE LPARENTHESE expression RPARENTHESE statement 
;

return_stmt:RETURN SEMICOLON
|RETURN expression SEMICOLON
;

expression:var ASSIN expression
|simple_expression
;

var:ID
|ID LBRACKET expression RBRACKET
;

simple_expression:additive_expression relop additive_expression
|additive_expression
;

relop:LT
|LTE
|GT
|GTE
|EQ
|NEQ
;

additive_expression:additive_expression addop term
|term
;

addop: ADD
|SUB
;

term:term mulop factor
|factor
;

mulop: MUL
|DIV
;

factor: LPARENTHESE expression RPARENTHESE
|var
|call
|integer
|float
|str
;

integer:INTEGER
| SIZEOF LPARENTHESE type_specifier RPARENTHESE
;

float:FLOATPOINT
;

str: STRING
;

call: ID LPARENTHESE args RPARENTHESE
;

args: arg_list
|
;

arg_list: arg_list COMMA expression
| expression
;


%%

void CPC::Parser::error(const CPC::location &location, const std::string &message)
{
    std::cout << "message: " << message << ", error happened at: " << location << std::endl;
}