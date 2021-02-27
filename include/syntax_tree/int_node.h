#pragma once

#include "node.h"
#include "location.hh"

namespace CPC
{
    class IntNode : public Node
    {
    public:
        /**
         * @brief Construct a new Int Node object
         * 
         * @param value the value of the node
         * @param location the location of the node
         */
        IntNode(const int &value, const CPC::location &location) : value(value), Node(location) {}

        /**
         * @brief Destroy the Int Node object
         * 
         */
        ~IntNode() {}

    private:
        int value;
    };

} // namespace CPC
