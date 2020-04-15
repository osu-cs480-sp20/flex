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

a     {
        std::cout << "Recognized an 'a'" << std::endl;
      }

ca    {
        /* Recognized "ca" */
      }

cat|dog {
          std::cout << "Recognized: " << yytext << std::endl;
          REJECT;
        }

ca*t    {
          std::cout << "Recognized a string with this many chars: " << yyleng
            << std::endl;
          REJECT;
        }

ca+t    {
          /* caaaaaaaat */
        }

do?g    {
          /* dg or dog */
        }

c.t     {
          /* cat or cbt or cct or cdt .... */
        }

\n      {
          /* newline */
        }

[ \t\n] {
          /* 1 space or 1 tab or 1 newline */
        }

[^cat]   {
          /* any character except c, a, or t */
        }

[^dog]  {

        }

[a-zA-Z0-9] {

        }

{DIGIT}*\.{DIGIT}*  {}

^cat  {
        /* cat at the beginning of a line */
      }

cat$  {
        /* cat at the end of a line */
      }

"c$t" {
        /* recognize c$t */
      }

(cat|dog)*  {
        /* catdogcatcatdogdog */
      }

<<EOF>> {
        /* end of file */
        yyterminate();
      }

.     {
        std::cerr << "Invalid chatacter: " << yytext << std::endl;
        return 1;
      }

%%
