#pragma once

#include "scanner.h"
#include "parser.hpp"
#include "ast.h"
#include <string>
#include <memory>

namespace CPC
{
    /**
     * @brief Driver to connect Scanner and Parser
     * 
     */
    class Driver
    {
    public:
        /**
         * @brief Construct a new Driver object
         * 
         * @param fileName Name of the file to scan and parse
         */
        Driver(const std::string &fileName) : scanner(), parser(*this), fileName(fileName) {}

        /**
         * @brief Destroy the Driver object
         * 
         */
        ~Driver() {}

        /**
         * @brief Get the File Name
         * 
         * @return std::string File Name
         */
        const std::string &getFileName() const
        {
            return fileName;
        }

        /**
         * @brief use Scanner to get next token for parser
         * 
         * @return Parser::symbol_type Next token
         */
        CPC::Parser::symbol_type scan()
        {
            return scanner.nextToken();
        }

        /**
         * @brief parse the given file
         * 
         */
        std::unique_ptr<CPC::AST> parse();

        void setAST(std::unique_ptr<CPC::AST> ast)
        {
            this->ast = std::move(ast);
        }

    private:
        CPC::Scanner scanner;
        CPC::Parser parser;
        std::string fileName;
        std::unique_ptr<CPC::AST> ast;
    };
} // namespace CPC
