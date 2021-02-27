#pragma once

#include "node.h"
#include "location.hh"
#include "declaration_node.h"
#include <string>
#include <vector>
#include <memory>

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
         * @param s Name of the source file
         */
        AST(const std::string &fileName, const CPC::location &location, std::unique_ptr<DeclarationNode> declaration_list) : sourceName(fileName), Node(location), declaration_list(std::move(declaration_list)) {}

        /**
         * @brief Destroy the AST object
         * 
         */
        ~AST() {}

    private:
        std::string sourceName;
        std::unique_ptr<DeclarationNode> declaration_list;
    };

} // namespace CPC
