%option noyywrap nodefault nounput noinput c++ yyclass="Scanner"

%{
#include <iostream>
#include "scanner.h"

CPC::location loc;

#define YY_USER_ACTION  loc.columns(yyleng);
#define yyterminate() CPC::Parser::make_YYEOF(loc);
%}

INT (0|[1-9][0-9]*)

%%

"+" {return CPC::Parser::make_ADD(loc);}
"-" {return CPC::Parser::make_SUB(loc);}
"*" {return CPC::Parser::make_MUL(loc);}
"/" {return CPC::Parser::make_DIV(loc);}

{INT} {return CPC::Parser::make_INT(std::atoi(yytext), loc);} 

\n {return CPC::Parser::make_EOL(loc);}

. { std::cout << "unknown partten" << std::endl; return CPC::Parser::make_YYerror(loc);}
%%