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

%lex-param {CPC::Scanner &scanner}
%parse-param {CPC::Scanner &scanner}


%defines
%locations

%code requires
{
    #include <iostream>
    #include <string>
    namespace CPC {
        class Scanner;
        class Parser;
    }
}

%code top
{
  #include "scanner.h"
  CPC::Parser::symbol_type yylex(CPC::Scanner& scanner){
    return scanner.nextToken();
  }
}

%token <int> INTEGER
%token <float> FLOATPOINT
%token <std::string> ID STR

%token ASSIN COMMA SEMICOLON ARRAY

%token LPARENTHESE RPARENTHESE LBRACKET RBRACKET LBRACE RBRACE

%token VOID INT FLOAT STRING
%token IF ELSE WHILE RETURN IMPORT SIZEOF

%left ADD "+"
%left SUB "-"
%left MUL "*"
%left DIV "/"

%start program

%%

program: declaration_list { std::cout << "program" << std::endl; }
    ;

declaration_list: declaration_list declaration { std::cout << "declaration_list" << std::endl; }
  | declaration { std::cout << "declaration_list" << std::endl; }
  ;

declaration: var_declaration { std::cout << "declaration" << std::endl; }
  | fun_declaration { std::cout << "declaration" << std::endl; }
  | import_declaration { std::cout << "declaration" << std::endl; }
  ;

var_declaration: type_specifier ID SEMICOLON { std::cout << "var_declaration" << std::endl; }
  | type_specifier ID LBRACKET INTEGER RBRACKET SEMICOLON { std::cout << "var_declaration" << std::endl; }
  ;

type_specifier: VOID { std::cout << "type_specifier VOID" << std::endl; }
  | INT { std::cout << "type_specifier INT" << std::endl; }
  | FLOAT { std::cout << "type_specifier FLOAT" << std::endl; }
  | STRING { std::cout << "type_specifier STRING" << std::endl; }
  ;

fun_declaration : type_specifier ID LPARENTHESE params RPARENTHESE compound_stmt { std::cout << "fun_declaration" << std::endl; }
  ;

import_declaration: IMPORT ID SEMICOLON { std::cout << "import_declaration" << std::endl; }
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

simple_expression:additive_expression
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

integer:INTEGER { std::cout << $1 << std::endl; }
| SIZEOF LPARENTHESE type_specifier RPARENTHESE
;

float:FLOATPOINT { std::cout << $1 << std::endl; }
;

str: STR { std::cout << $1 << std::endl; }
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