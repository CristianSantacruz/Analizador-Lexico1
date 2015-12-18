package analizador.lexico1;
import static analizador.lexico1.Token.*;
/*
 * INTEGRANTES:
 *  QUIMBITA LILIAN
 *  SANTACRUZ CRISTIAN
*/

%%
%class Lexer
%type Token
%line
%column

palabrasReservadas = ("int"|"float"|"bool"|"char"|"string")
caracteresEspeciales = (","|";"|":"|"("|")"|"["|"]"|"{"|"}"|"+"|"-"|"*"|"/"|"<"|">"|"="|"!"|"&"|"$")
char = ("'")
identificador = [a-zA-Z]+[a-zA-Z|0-9]*
digitos = [0-9]
espacios = [ \t\r\n]
operedores = ("<="|">="|"=="|"!="|"&&"|"||")

%{
public String lexeme;
%}
%%
"/*"[^"*/"]*"*/"+ { }
"//".* { }
{espacios} { }
{palabrasReservadas} {lexeme=yytext(); return KEYWORD;}
{char}+.*+{char} {lexeme=yytext(); return CHAR;}
{identificador} {lexeme=yytext(); return IDENTIFICADOR;}
{caracteresEspeciales} {lexeme=yytext(); return CARACTER;}
{operedores} {lexeme=yytext(); return OPERADOR;}
[-+]?{digitos}+ {lexeme=yytext(); return INT;}
[-+]?{digitos}","+ {digitos}+ {lexeme=yytext(); return FLOAT;}
. {System.out.println("Error Léxico   Línea: " + (yyline+1) + "   Columna: " + (yycolumn+1) + "   Caracter: " + yytext());}
