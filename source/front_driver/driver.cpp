#include "driver.h"
#include <fstream>

void CPC::Driver::parse()
{
    std::ifstream sourceFile;
    sourceFile.open(fileName, std::ios::in);
    if (sourceFile.fail())
    {
        std::cout << "Cannot open file: " << fileName << std::endl;
        std::exit(0);
    }
    scanner.switch_streams(sourceFile, std::cout);
    parser.parse();
}