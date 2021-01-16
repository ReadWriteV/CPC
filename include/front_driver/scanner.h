#pragma once

#if !defined(yyFlexLexerOnce)
#include <FlexLexer.h>
#endif

#include "driver.h"
#include "parser.hpp"

namespace CPC
{
    class Scanner : public yyFlexLexer
    {
    public:
        Scanner();
        virtual Parser::symbol_type nextToken();
        virtual ~Scanner() {}

    private:
        location loc;
    };
} // namespace CPC

#undef YY_DECL
#define YY_DECL CPC::Parser::symbol_type CPC::Scanner::nextToken()
