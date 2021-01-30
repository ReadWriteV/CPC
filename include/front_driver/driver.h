#pragma once

#include "scanner.h"
#include "parser.hpp"
#include <string>

namespace CPC
{
    /**
     * @brief Driver to connect Scanner and Parser
     * 
     */
    class Driver
    {
    private:
        /**
         * @brief Scanner
         * 
         */
        Scanner scanner;

        /**
         * @brief Parser
         * 
         */
        Parser parser;

        /**
         * @brief name of file to scan and parse
         * 
         */
        std::string fileName;

    public:
        /**
         * @brief Construct a new Driver object
         * 
         */
        Driver() = delete;

        /**
         * @brief Construct a new Driver object
         * 
         * @param fileName Name of the file to scan and parse
         */
        Driver(std::string fileName) : scanner(), parser(*this), fileName(fileName) {}

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
        std::string getFileName() const
        {
            return fileName;
        }

        /**
         * @brief use Scanner to get next token for parser
         * 
         * @return Parser::symbol_type Next token
         */
        Parser::symbol_type scan()
        {
            return scanner.nextToken();
        }

        /**
         * @brief parse the given file
         * 
         */
        void parse();
    };
} // namespace CPC
