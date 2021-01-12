#include <iostream>
#include <fstream>
#include "scanner.h"

int main(int argc, char **argv)
{
    Scanner *myLexer;
    if (argc == 1)
    {
        myLexer = new Scanner(std::cin, std::cout);
        Token r;
        while ((r = myLexer->nextToken()) != Token::END)
            ;
        delete myLexer;
    }
    else if (argc == 2)
    {
        std::ifstream file;
        file.open(argv[1], std::ios::in);
        if (!file.is_open())
        {
            std::cout << "failed to open file: " << argv[1] << std::endl;
            return -1;
        }
        myLexer = new Scanner(file, std::cout);
        Token r;
        while ((r = myLexer->nextToken()) != Token::END)
            ;
        delete myLexer;
        file.close();
    }
    else
    {
        std::cout << "wrong argument" << std::endl;
    }
    return 0;
}