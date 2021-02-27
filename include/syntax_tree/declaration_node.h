#pragma once

#include "node.h"
#include "location.hh"
#include <vector>
#include <memory>

namespace CPC
{
    class DeclarationNode : public Node
    {
    public:
        DeclarationNode(std::unique_ptr<CPC::Node> node, const CPC::location &location) : Node(location)
        {
            this->list.push_back(std::move(node));
        };

        ~DeclarationNode(){};

        void addDeclaration(std::unique_ptr<CPC::Node> node)
        {
            this->list.push_back(std::move(node));
        }

    private:
        std::vector<std::unique_ptr<CPC::Node>> list;
    };
} // namespace CPC