#pragma once

#if !defined(yyFlexLexerOnce)
#include <FlexLexer.h>
#endif

#include "parser.hpp"

namespace CPC
{
    class Scanner : public yyFlexLexer
    {
    public:
        Scanner() = default;
        Scanner(std::istream &arg_yyin, std::ostream &arg_yyout) : yyFlexLexer(arg_yyin, arg_yyout) {}
        virtual CPC::Parser::symbol_type nextToken();

        virtual ~Scanner() { std::cout << "scanner destroyed" << std::endl; }
    };
} // namespace CPC

#undef YY_DECL
#define YY_DECL CPC::Parser::symbol_type CPC::Scanner::nextToken()
