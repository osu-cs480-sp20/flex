%{
  /*
   * Header comment.
   */
  #include <iostream>
  int global_variable = 0;
  void foo() {
    return;
  }
%}

DIGIT   [0-9]

%option yylineno
%option noyywrap

%%

%%
