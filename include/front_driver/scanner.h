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
        virtual Parser::symbol_type nextToken();
        virtual ~Scanner() {}

    private:
        location loc;
    };
} // namespace CPC

#undef YY_DECL
#define YY_DECL CPC::Parser::symbol_type CPC::Scanner::nextToken()
