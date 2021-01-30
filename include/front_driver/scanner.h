#pragma once

#if !defined(yyFlexLexerOnce)
#include <FlexLexer.h>
#endif

#include "parser.hpp"

namespace CPC
{
    /**
     * @brief Scanning file to get tokens
     * 
     */
    class Scanner : public yyFlexLexer
    {
    public:
        /**
         * @brief Construct a new Scanner object
         * 
         */
        Scanner() = default;

        /**
         * @brief get next token
         * 
         * @return Parser::symbol_type Next token
         */
        Parser::symbol_type nextToken();

        /**
         * @brief Destroy the Scanner object
         * 
         */
        ~Scanner() {}

    private:
        /**
         * @brief location information of token
         * 
         */
        location loc;
    };
} // namespace CPC

#undef YY_DECL
#define YY_DECL CPC::Parser::symbol_type CPC::Scanner::nextToken()
