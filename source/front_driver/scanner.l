%option noyywrap nodefault nounput noinput c++ yyclass="Scanner"

%{
#include <iostream>
#include "scanner.h"

#define YY_USER_ACTION  loc.columns(yyleng);
#define yyterminate() CPC::Parser::make_YYEOF(loc);
%}

%x COMMENT

%%

%{
  loc.step();
%}

"+" {return CPC::Parser::make_ADD(loc);}
"-" {return CPC::Parser::make_SUB(loc);}
"*" {return CPC::Parser::make_MUL(loc);}
"/" {return CPC::Parser::make_DIV(loc);}
"=" {return CPC::Parser::make_ASSIN(loc);}

"<" {return CPC::Parser::make_LT(loc);}
"<=" {return CPC::Parser::make_LTE(loc);}
">" {return CPC::Parser::make_GT(loc);}
">=" {return CPC::Parser::make_GTE(loc);}
"==" {return CPC::Parser::make_EQ(loc);}
"!=" {return CPC::Parser::make_NEQ(loc);}

"." {return CPC::Parser::make_POINT(loc);}
"," {return CPC::Parser::make_COMMA(loc);}
";" {return CPC::Parser::make_SEMICOLON(loc);}
"[]" {return CPC::Parser::make_ARRAY(loc);}

\( {return CPC::Parser::make_LPARENTHESE(loc);}
\) {return CPC::Parser::make_RPARENTHESE(loc);}
\[ {return CPC::Parser::make_LBRACKET(loc);}
\] {return CPC::Parser::make_RBRACKET(loc);}
\{ {return CPC::Parser::make_LBRACE(loc);}
\} {return CPC::Parser::make_RBRACE(loc);}

void {return CPC::Parser::make_VOID(loc);}
int {return CPC::Parser::make_INT(loc);}
float {return CPC::Parser::make_FLOAT(loc);}
str {return CPC::Parser::make_STR(loc);}

if {return CPC::Parser::make_IF(loc);}
else {return CPC::Parser::make_ELSE(loc);}
while {return CPC::Parser::make_WHILE(loc);}
return {return CPC::Parser::make_RETURN(loc);}
import {return CPC::Parser::make_IMPORT(loc);}
sizeof {return CPC::Parser::make_SIZEOF(loc);}


0|[1-9][0-9]* {return CPC::Parser::make_INTEGER(std::atoi(yytext), loc);} 
[0-9]+\.[0-9]* {return CPC::Parser::make_FLOATPOINT(std::atof(yytext), loc);}
[_a-zA-Z][_a-zA-Z0-9]* {return CPC::Parser::make_ID(yytext, loc);}
\"[^"]*\" {return CPC::Parser::make_STRING(yytext, loc);}

[ \t] {loc.step();}
\n {loc.lines(1); loc.step();}

"/*" {BEGIN(COMMENT);}
<COMMENT>\n {loc.lines(1); loc.step();}
<COMMENT>. {loc.step();}
<COMMENT><<EOF>> {std::cout << "unterminated comment" << std::endl; return CPC::Parser::make_YYerror(loc);}
<COMMENT>"*/" {BEGIN(INITIAL); loc.step();}

. {std::cout << "unknown partten" << std::endl; return CPC::Parser::make_YYerror(loc);}

<<EOF>>  {return CPC::Parser::make_YYEOF(loc);}
%%