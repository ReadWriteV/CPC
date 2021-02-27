#pragma once

#include <iostream>
#include "location.hh"

namespace CPC
{
    /**
     * @brief The base class (node) of syntax tree
     * 
     */
    class Node
    {
    public:
        /**
         * @brief Construct a new Node object
         * 
         * @param location the location (line, clomun) of the node
         */
        Node(const CPC::location &location) : location(location){};

        /**
         * @brief Destroy the Node object
         * 
         */
        virtual ~Node() {}

    private:
        CPC::location location;
    };
} // namespace CPC