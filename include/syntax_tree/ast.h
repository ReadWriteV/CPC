#pragma once

#include "node.h"
#include "location.hh"
#include <string>

namespace CPC
{
    /**
     * @brief The root node of the syntax tree
     * 
     */
    class AST : public Node
    {
    public:
        /**
         * @brief Construct a new AST object
         * 
         */
        AST();

        /**
         * @brief Construct a new AST object
         * 
         * @param s Name of the source file
         */
        AST(std::string fileName) : sourceName(fileName) {}

        /**
         * @brief Destroy the AST object
         * 
         */
        ~AST();

        /**
         * @brief display the Node, output to target stream
         * 
         * @param out target stream to output the Node
         */
        virtual void dump(std::ostream &out) override final
        {
            out << "<<AST>> "
                << "(" << sourceName << ")" << std::endl;
        }

        virtual const location &getLocation() const override final
        {
            return location;
        }

    private:
        /**
         * @brief location of the node
         * 
         */
        location location;

        /**
         * @brief source file name of the syntax tree
         * 
         */
        std::string sourceName;
    };

} // namespace CPC
