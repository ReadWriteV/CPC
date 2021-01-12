#pragma once

#if !defined(yyFlexLexerOnce)
#include <FlexLexer.h>
#endif

/**
 * @brief 定义Token，包括保留字与标识符等。
 * 
 */
enum class Token
{
    // 算术运算符
    ADD = 259, // +
    SUB,       // -
    MUL,       // **
    DIV,       // /
    // 关系运算符
    LT,  // <
    LTE, // <=
    GT,  // >
    GTE, // >=
    EQ,  // ==
    NEQ, // !=
    // 赋值号
    ASSIN, // =
    // 符号
    QUOTATION,   // "
    SEMICOLON,   // ;
    COMMA,       // ,
    LPARENTHESE, // (
    RPARENTHESE, // )
    LBRACKET,    // [
    RBRACKET,    // ]
    LBRACE,      // {
    RBRACE,      // }
    ARRAY,       // []
    // 保留字
    CHAR,   // char
    INT,    // int
    FLOAT,  // float
    VOID,   // void
    WHILE,  // while
    IF,     // if
    ELSE,   // else
    RETURN, // return
    IMPORT, // import
    SIZEOF, // sizeof
    // 标识符
    IDENTIFIER, // 标识符
    // 数字量
    INTEGER,    // 整数量
    FLOATPOINT, //浮点数量
    // 其它
    COMMENT, // 注释
    BLANK,   // 空白
    EOL,     // 行结束
    END,     // 文件结束
    ERROR    // 错误（未定义）
};

#undef YY_DECL
#define YY_DECL Token Scanner::nextToken()

#undef yyterminate
#define yyterminate() return Token::ERROR

#undef YY_USER_ACTION
#define YY_USER_ACTION std::cout << YYText() << std::endl;

class Scanner : public yyFlexLexer
{
public:
    Scanner() = default;
    Scanner(std::istream &arg_yyin, std::ostream &arg_yyout) : yyFlexLexer(arg_yyin, arg_yyout) {}
    virtual Token nextToken();

    virtual ~Scanner() { std::cout << "scanner destroyed" << std::endl; }
};