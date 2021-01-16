#include <iostream>
#include <fstream>
#include "driver.h"

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        std::cout << "wrong argument" << std::endl;
        return 0;
    }
    CPC::Driver driver(argv[1]);
    driver.parse();
    return 0;
}