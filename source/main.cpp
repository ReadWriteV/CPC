#include <iostream>
#include <fstream>
#include "scanner.h"
#include "parser.hpp"

int main(int argc, char **argv)
{
    CPC::Scanner scanner;
    CPC::Parser parser(scanner);
    parser.parse();
    return 0;
}