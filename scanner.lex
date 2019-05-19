%{
	/* Declarations Section */
#include "parser.tab.hpp"

}%

%option yylineno 
%option noyywrap

digit 			([0-9])
letter			([a-zA-Z])
alphanumeric 	({digit}|{letter})
relop 			([==]|[!=]|[<]|[>]|[<=]|[>=])
binop			([\+]|[\-]|[\*]|[\/])
id 				({letter}{alphanumeric}*)
num				(0|[1-9]{digit}*)
str1			([^\n\r\"\\])
str2			(\\[rnt"\\])
dq				([\"])
string			({dq}(({str1}|{str2})+){dq})
cr 				([\r])
lf 				([\n])
crlf 			([\r\n])
cmt				("//"^{crlf}*{cr}|{lf}|{crlf}?)
whitespace		([\t\n\r ])

%%

"void"			return VOID;
"int"			return INT;
"byte"			return BYTE;
"b"				return B;
"bool"			return BOOL;
"and"			return AND;
"or"			return OR;
"not"			return NOT;
"true"			return TRUE;
"false"			return FALSE;
"return"		return RETURN;
"if"			return IF;
"else"			return ELSE;
"while"			return WHILE;
"break"			return BREAK;
";"				return SC;
","				return COMMA;
"("				return LPAREN;
")"				return RPAREN;
"{"				return LBRACE;
"}"				return RBRACE;
{relop}			return RELOP;
{binop}			return BINOP;
{id}			return ID; //need to initiate 
{num}			return NUN;
{string}		return STRING;
{whitespace}|{crlf}  ;
{cmt}				 ;
<<EOF>>			return EOF;
.				output::errorLex(yylineno); exit(0);
%%