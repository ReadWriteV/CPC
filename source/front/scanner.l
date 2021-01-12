%option noyywrap nodefault c++ yyclass="Scanner"

%{
#include "scanner.h"
%}

%x MCOMMENT

DIGIT [0-9]
INT (0|[1-9][0-9]*)
FLOAT {INT}"."{DIGIT}*((E|e)?[+|-]?[1-9][0-9]*)?

%%

"+" {return Token::ADD;}
"-" {return Token::SUB;}
"*" {return Token::MUL;}
"/" {return Token::DIV;}

"<" {return Token::LT;}
"<=" {return Token::LTE;}
">" {return Token::GT;}
">=" {return Token::GTE;}
"==" {return Token::EQ;}
"!=" {return Token::NEQ;}

"=" {return Token::ASSIN;}

";" {return Token::SEMICOLON;}
"," {return Token::COMMA;}
"(" {return Token::LPARENTHESE;}
")" {return Token::RPARENTHESE;}
"[" {return Token::LBRACKET;}
"]" {return Token::RBRACKET;}
"{" {return Token::LBRACE;}
"}" {return Token::RBRACE;}
"[]" {return Token::ARRAY;}

"char" {return Token::CHAR;}
"int" {return Token::INT;}
"float" {return Token::FLOAT;}
"void" {return Token::VOID;}
"while" {return Token::WHILE;}
"if" {return Token::IF;}
"else" {return Token::ELSE;}
"return" {return Token::RETURN;}
"import" {return Token::IMPORT;}
"sizeof" {return Token::SIZEOF;}

[_a-zA-Z][_a-zA-Z0-9]* {return Token::IDENTIFIER;}

{INT} {return Token::INTEGER;}
{FLOAT} {return Token::FLOATPOINT;}

\n {return Token::EOL;}
"/*" {BEGIN(MCOMMENT);}
<MCOMMENT>\n {}
<MCOMMENT>. {}
<MCOMMENT>"*/" {BEGIN(INITIAL); return Token::COMMENT;}
[ \t\n] {return Token::BLANK;}
. {return Token::ERROR;}
<<EOF>> { std::cout << "scan finished" << std::endl; return Token::END;}

%%