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
         */
        Node() {}

        /**
         * @brief Destroy the Node object
         * 
         */
        virtual ~Node() {}

        /**
         * @brief display the Node, print to std::cout
         * 
         */
        void print()
        {
            dump(std::cout);
        }

        /**
         * @brief display the Node, output to target stream
         * 
         * @param out target stream to output the Node
         */
        virtual void dump(std::ostream &out) const = 0;

        /**
         * @brief Get the Location object
         * 
         * @return the location of the Node 
         */
        virtual const location &getLocation() const = 0;
    };
} // namespace CPC