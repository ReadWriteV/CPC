#pragma once

#include "node.h"
#include "location.hh"
#include <string>
#include <vector>

namespace CPC
{
    class ImportNode : public Node
    {
    public:
        ImportNode(const std::string &name, const CPC::location &location) : Node(location)
        {
            this->name.push_back(name);
        };

        ~ImportNode(){};

        void addSubName(std::string subName)
        {
            name.push_back(subName);
        }

    private:
        std::vector<std::string> name;
    };
} // namespace CPC