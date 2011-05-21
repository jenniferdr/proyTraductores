{
module Main (main) where

import Lexer
}


%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters
$graphic    = $printable # $white

tokens :-
\+	    {\s -> TkPlus}
\-     	    {\s -> TkMinus}
\*     	    {\s -> TkTimes}
\/     	    {\s -> TkDiv}
"%"    	    {\s -> TkMod}
"<"    	    {\s -> TkLt}
">"    	    {\s -> TkGt}
"="    	    {\s -> TkEq}
"!"    	    {\s -> TkNot}
"["    	    {\s -> TkLBrack}
"]"    	    {\s -> TkRBrack}
\$     	    {\s -> TkRow}
\@     	    {\s -> TkCol}
\'     	    {\s -> TkSQuot}
\"     	    {\s -> TkDQuot}
":"    	    {\s -> TkColon}
";"    	    {\s -> TkSemiColon}
","    	    {\s -> TkComma}
\.	    {\s -> TkDot}
"&&"   	    {\s -> TkAnd}
\|\|   	    {\s -> TkOr}
"{"    	    {\s -> TkLBrace}
"}"    	    {\s -> TkRBrace}
"("    	    {\s -> TkLParen}
")"    	    {\s -> TkRParen}
"num"  	    {\s -> TkNum}
"vec"  	    {\s -> TkVec}
"zeroes"    {\s -> TkZeroes}
"range"	    {\s -> TkRange}
"eye"	    {\s -> TkEye}
"define"    {\s -> TkDefine}
"of"	    {\s -> TkOf}	
"type"	    {\s -> TkType}
"as"	    {\s -> TkAs}
"begin"	    {\s -> TkBegin}
"end"	    {\s -> TkEnd}
"vars"	    {\s -> TkVars}
"if"	    {\s -> TkIf}
"then"	    {\s -> TkThen}
"else"	    {\s -> TkElse}
"while"	    {\s -> TkWhile}
"do"	    {\s -> TkDo}
"foreach"   {\s -> TkForEach}
"in"	    {\s -> TkIn}	
"read"	    {\s -> TkRead}
"write"	    {\s -> TkWrite}
"return"    {\s -> TkReturn}
"true"	    {\s -> TkTrue}	
"false"	    {\s -> TkFalse}

{
main = do
  s <- getContents
  print (alexScanTokens s)
}