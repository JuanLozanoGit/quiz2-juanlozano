%{
#include <stdio.h>
%}

/* DEFINICIONES */
DIG      [0-9]
INT      {DIG}+
SIGN     [+-]
WS       [ \t\n]+
NUM      {INT}(\.{INT})?([eE]{SIGN}?{INT})?
REAL     {SIGN}?{NUM}
IMAG     [iIjJ]

/* COMPLEX: 
   1. real + imag (ej: 3.5 + 2i)
   2. solo imag   (ej: -2i, i)
   3. solo real   (ej: 3.5e-10)
*/
COMPLEX  ({REAL}([ ]*{SIGN}[ ]*({NUM})?{IMAG}))|({SIGN}?({NUM})?{IMAG})|({REAL})

%%

{COMPLEX}   { printf("%s -> ACEPTA\n", yytext); }
{WS}        { /* ignorar */ }
.           { printf("%s -> NO ACEPTA\n", yytext); }

%%

int main(int argc, char **argv) {
    if (argc > 1) yyin = fopen(argv[1], "r");
    yylex();
    return 0;
}

int yywrap() { return 1; }
