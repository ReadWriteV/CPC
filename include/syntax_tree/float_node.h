#pragma once

#include "node.h"
#include "location.hh"

namespace CPC
{
    class FloatNode : public Node
    {
    public:
        /**
         * @brief Construct a new Float Node object
         * 
         * @param value the value of the node
         * @param location the location of the node
         */
        FloatNode(const float &value, const CPC::location &location) : value(value), Node(location) {}

        /**
         * @brief Destroy the Float Node object
         * 
         */
        ~FloatNode() {}

    private:
        float value;
    };

} // namespace CPC
