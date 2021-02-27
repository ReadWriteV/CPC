#include <iostream>
#include <memory>
#include "driver.h"

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        std::cout << "wrong argument" << std::endl;
        return 0;
    }
    CPC::Driver driver(argv[1]);
    auto ast = driver.parse();
    return 0;
}