{
module Main (main) where
import Token
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-

"num"  	    {\s -> TkNum}
"vec" 	    {\s -> TkVec }
"mat"	    {\s -> TkMat}
"zeroes"    {\s -> TkZeroes}
"range"	    {\s -> TkRange}
"eye"	    {\s -> TkEye}
"define"    {\s -> TkDefine}
"of"$white"type" {\s -> TkOfType}
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
\-?$digit$digit*\.?$digit* | \.?$digit$digit*    {\s -> TkDig s} 
$alpha[$alpha$digit\_]*  {\s -> TkId s}
$white+     ;
\"[$digit$alpha$white]*\" | \'[$digit$alpha$white]*\' {\s -> TkString s}
\+	    {\s -> TkPlus}
\-     	    {\s -> TkMinus}
\*\*	    {\s -> TkPow}
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
"!="	    {\s -> TkNotEq}
":="	    {\s -> TkAsig}
"<="   	    {\s -> TkLte}
">="        {\s -> TkGte}

{
main = do
  s <- getContents
  let r = alexScanTokens s
  print r
  while length r /= 0 (
  	print (head r)
--	let r = tail r
	)
}
