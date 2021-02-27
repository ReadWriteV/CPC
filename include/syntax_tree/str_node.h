#pragma once

#include "node.h"
#include "location.hh"
#include <string>

namespace CPC
{
    class StrNode : public Node
    {
    public:
        /**
         * @brief Construct a new Str Node object
         * 
         * @param value the value of the node
         * @param location the location of the node
         */
        StrNode(const std::string &value, const CPC::location &location) : value(value), Node(location) {}

        /**
         * @brief Destroy the Str Node object
         * 
         */
        ~StrNode() {}

    private:
        std::string value;
    };

} // namespace CPC
