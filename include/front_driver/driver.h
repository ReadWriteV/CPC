#pragma once

#include "scanner.h"
#include "parser.hpp"
#include <string>

namespace CPC
{
    class Driver
    {
    private:
        Scanner scanner;
        Parser parser;
        std::string fileName;

    public:
        Driver() = delete;
        Driver(std::string fileName) : scanner(), parser(*this), fileName(fileName) {}
        ~Driver() {}

        std::string getFileName() const
        {
            return fileName;
        }
        Parser::symbol_type scan()
        {
            return scanner.nextToken();
        }

        void parse();
    };
} // namespace CPC
