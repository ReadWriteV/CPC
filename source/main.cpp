#include <iostream>
#include <fstream>
#include "scanner.h"
#include "parser.hpp"

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        std::cout << "wrong argument" << std::endl;
        return 0;
    }
    std::ifstream file;
    file.open(argv[1], std::ios::in);
    if (file.fail())
    {
        std::cout << "open file error" << std::endl;
    }
    CPC::Scanner scanner(file, std::cout);
    CPC::Parser parser(scanner);
    parser.parse();
    return 0;
}