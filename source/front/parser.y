%require "3.1.7"
%language "c++"
%skeleton "lalr1.cc"

%define api.namespace { CPC }
%define api.parser.class { Parser }
/* %define api.token.raw */
%define api.token.constructor
%define api.value.type variant
/* %define api.token.prefix { TOKEN_ } */

/* %define parse.assert */
/* %define parse.trace */
/* %define parse.error detailed */
/* %define parse.lac full */

%lex-param { CPC::Scanner& scanner }
%parse-param { CPC::Scanner& scanner }


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

%token <int> INT

%token EOL

%left ADD "+"
%left SUB "-"
%left MUL "*"
%left DIV "/"

%type <int> exp calclist factor term

%start calclist

%%

calclist: %empty {}
    | calclist exp EOL { std::cout << "= " << $2 << std::endl; }
    ;

exp: factor         { $$ = $1; }
   | exp ADD factor { $$ = $1 + $3; }
   | exp SUB factor { $$ = $1 - $3; }
   ;

factor: term            { $$ = $1; }
      | factor MUL term { $$ = $1 * $3; }
      | factor DIV term {
        if($3 == 0){
          error(@3, "zero divide");
          YYABORT;
        }
        $$ = $1 / $3;
      }
      ;
term: INT { $$ = $1; }
    ;
%%

void CPC::Parser::error(const CPC::location &location, const std::string &message)
{
    std::cout << "message: " << message << ", error happened at: " << location << std::endl;
}