%{
	/* Declarations Section */
#include "parser.tab.hpp"

}%

%option yylineno 
%option noyywrap

relop 			([==]|[!=]|[<]|[>]|[<=]|[>=])
binop			([\+]|[\-]|[\*]|[\/])
