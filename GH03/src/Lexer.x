{
module Main (main) where
import Token
}


%wrapper "posn"


$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-


"num"  	    {\p s -> TkNum p}
"vec" 	    {\p s -> TkVec p}
"mat"	    {\p s -> TkMat p}
"zeroes"    {\p s -> TkZeroes p}
"range"	    {\p s -> TkRang pe}
"eye"	    {\p s -> TkEye p}
"define"    {\p s -> TkDefine p}
"of"$white"type" {\p s -> TkOfType p}
"as"	    {\p s -> TkAs p }
"begin"	    {\p s -> TkBegin p}
"end"	    {\p s -> TkEnd p}
"vars"	    {\p s -> TkVars p}
"if"	    {\p s -> TkIf p}
"then"	    {\p s -> TkThen p}
"else"	    {\p s -> TkElse p}
"while"	    {\p s -> TkWhile p}
"do"	    {\p s -> TkDo p }
"foreach"   {\p s -> TkForEach p}
"in"	    {\p s -> TkIn p}	
"read"	    {\p s -> TkRead p}
"write"	    {\p s -> TkWrite p}
"return"    {\p s -> TkReturn p}
"true"	    {\p s -> TkTrue p}	
"false"	    {\p s -> TkFalse p}
\-?$digit$digit*\.?$digit* | \.?$digit$digit*    {\p s -> TkDig p s} 
$alpha[$alpha$digit\_]*  {\p s -> TkId p s}
$white+     ;
\"[$digit$alpha$white]*\" | \'[$digit$alpha$white]*\' {\p s -> TkString p s}
\+	    {\p s -> TkPlus p}
\-     	    {\p s -> TkMinus p}
\*\*	    {\p s -> TkPow p}
\*     	    {\p s -> TkTimes p}
\/     	    {\p s -> TkDiv p}
"%"    	    {\p s -> TkMod p}
"<"    	    {\p s -> TkLt p}
">"    	    {\p s -> TkGt p}
"="    	    {\p s -> TkEq p}
"!"    	    {\p s -> TkNot p}
"["    	    {\p s -> TkLBrack p}
"]"    	    {\p s -> TkRBrack p}
\$     	    {\p s -> TkRow p}
\@     	    {\p s -> TkCol p}
\'     	    {\p s -> TkSQuot p}
\"     	    {\p s -> TkDQuot p}
":"    	    {\p s -> TkColon p}
";"    	    {\p s -> TkSemiColon p}
","    	    {\p s -> TkComma p}
\.	    {\p s -> TkDot p}
"&&"   	    {\p s -> TkAnd p}
\|\|   	    {\p s -> TkOr p}
"{"    	    {\p s -> TkLBrace p}
"}"    	    {\p s -> TkRBrace p}
"("    	    {\p s -> TkLParen p}
")"    	    {\p s -> TkRParen p}
"!="	    {\p s -> TkNotEq p}
":="	    {\p s -> TkAsig p}
"<="   	    {\p s -> TkLte p}
">="        {\p s -> TkGte p}


{
main = do
  s <- getContents
  let r = alexScanTokens s

  printToken r


getRow :: AlexPosn -> Int
getRow AlexPn offset row col = row

getCol :: AlexPosn -> Int
getCol AlexPn offset row col = col

printToken :: [Token] -> IO()
printToken [x] = print x
printToken (x:xs) = do
	  print x
	  printToken xs

}
