%{
#include <iostream>
#include <vector>
#include <set>

struct word {
  std::string category;
  std::string lexeme;
};

std::vector<struct word> words;
std::set<std::string> ids;

void save_word(std::string lexeme, std::string category) {
  struct word word = {.lexeme = lexeme, .category = category};
  words.push_back(word);
}

%}

%option noyywrap

%%

[ \t\n]*    { /* Ignore whitespace. */ }

[a-z][0-9]? {
              save_word(yytext, "IDENTIFIER");
              ids.insert(yytext);
            }

"="         { save_word(yytext, "EQUALS"); }
"+"         { save_word(yytext, "PLUS"); }
"-"         { save_word(yytext, "MINUS"); }
"*"         { save_word(yytext, "TIMES"); }
"/"         { save_word(yytext, "DIVIDEDBY"); }

";"         { save_word(yytext, "SEMICOLON"); }
"("         { save_word(yytext, "LPAREN"); }
")"         { save_word(yytext, "RPAREN"); }

%%
