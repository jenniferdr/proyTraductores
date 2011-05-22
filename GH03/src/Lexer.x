{
module Main (main) where
import Token
}


%wrapper "posn"


$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-

\#.*	    ;
"num"  	    {\p s -> TkNum (getRowCol p)}
"vec" 	    {\p s -> TkVec (getRowCol p)}
"mat"	    {\p s -> TkMat (getRowCol p)}
"zeroes"    {\p s -> TkZeroes (getRowCol p)}
"range"	    {\p s -> TkRange (getRowCol p)}
"eye"	    {\p s -> TkEye (getRowCol p)}
"define"    {\p s -> TkDefine (getRowCol p)}
"of"$white"type" {\p s -> TkOfType (getRowCol p)}
"as"	    {\p s -> TkAs (getRowCol p) }
"begin"	    {\p s -> TkBegin (getRowCol p)}
"end"	    {\p s -> TkEnd (getRowCol p)}
"vars"	    {\p s -> TkVars (getRowCol p)}
"if"	    {\p s -> TkIf (getRowCol p)}
"then"	    {\p s -> TkThen (getRowCol p)}
"else"	    {\p s -> TkElse (getRowCol p)}
"while"	    {\p s -> TkWhile (getRowCol p)}
"do"	    {\p s -> TkDo (getRowCol p) }
"foreach"   {\p s -> TkForEach (getRowCol p)}
"in"	    {\p s -> TkIn (getRowCol p)}	
"read"	    {\p s -> TkRead (getRowCol p)}
"write"	    {\p s -> TkWrite (getRowCol p)}
"return"    {\p s -> TkReturn (getRowCol p)}
"true"	    {\p s -> TkTrue (getRowCol p)}	
"false"	    {\p s -> TkFalse (getRowCol p)}
$alpha[$alpha$digit\_]*  {\p s -> TkId s (getRowCol p)}
\-?$digit$digit*\.?$digit* | \.?$digit$digit*    {\p s -> TkDig s (getRowCol p)} 
$white+     ;
\"$printable*\" | \'$printable*\' {\p s -> TkString (init (tail s))  (getRowCol p)}
\+	    {\p s -> TkPlus (getRowCol p)}
\-     	    {\p s -> TkMinus (getRowCol p)}
\*\*	    {\p s -> TkPow (getRowCol p)}
\*     	    {\p s -> TkTimes (getRowCol p)}
\/     	    {\p s -> TkDiv (getRowCol p)}
"%"    	    {\p s -> TkMod (getRowCol p)}
"<"    	    {\p s -> TkLt (getRowCol p)}
">"    	    {\p s -> TkGt (getRowCol p)}
"="    	    {\p s -> TkEq (getRowCol p)}
"!"    	    {\p s -> TkNot (getRowCol p)}
"["    	    {\p s -> TkLBrack (getRowCol p)}
"]"    	    {\p s -> TkRBrack (getRowCol p)}
\$     	    {\p s -> TkRow (getRowCol p)}
\@     	    {\p s -> TkCol (getRowCol p)}
\'         {\p s -> TkSQuot (getRowCol p)}
\"     	    {\p s -> TkDQuot (getRowCol p)}
":"    	    {\p s -> TkColon (getRowCol p)}
";"    	    {\p s -> TkSemiColon (getRowCol p)}
","    	    {\p s -> TkComma (getRowCol p)}
\.	    {\p s -> TkDot (getRowCol p)}
"&&"   	    {\p s -> TkAnd (getRowCol p)}
\|\|   	    {\p s -> TkOr (getRowCol p)}
"{"    	    {\p s -> TkLBrace (getRowCol p)}
"}"    	    {\p s -> TkRBrace (getRowCol p)}
"("    	    {\p s -> TkLParen (getRowCol p)}
")"    	    {\p s -> TkRParen (getRowCol p)}
"!="	    {\p s -> TkNotEq (getRowCol p)}
":="	    {\p s -> TkAsig (getRowCol p)}
"<="   	    {\p s -> TkLte (getRowCol p)}
">="        {\p s -> TkGte (getRowCol p)}


{
main = do
  s <- getContents
  let r = alexScanTokens s
  printToken r

printToken :: [Token] -> IO()
printToken [] = return ()
printToken (x:xs) = do
	  print x
	  printToken xs

getRowCol :: AlexPosn -> (Posicion,Posicion)
getRowCol (AlexPn offset row col) = (Linea row, Columna col)

getRow :: (Int,Int) -> Int
getRow (l,c) = l

getCol :: (Int,Int) -> Int
getCol (l,c) = c

getRowColFromToken :: Token -> (Int,Int)
getRowColFromToken (TkDig s (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkId s (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkString s (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkPlus (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkMinus (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkPow (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkTimes (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkDiv (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkMod (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkLt (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkGt (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkEq (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkNot (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkLBrack (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkRBrack (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkRow (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkCol (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkSQuot (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkDQuot (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkColon (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkSemiColon (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkComma (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkDot (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkAnd (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkOr (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkLBrace (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkRBrace (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkLParen (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkRParen (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkNotEq (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkAsig (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkLte (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkGte (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkNum (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkVec (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkMat (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkZeroes (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkRange (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkEye (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkDefine (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkOfType (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkAs (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkBegin (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkEnd (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkVars (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkIf (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkThen (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkElse (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkWhile (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkDo (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkForEach (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkIn (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkRead (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkWrite (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkReturn (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkTrue (Linea l, Columna c))  = (l,c)
getRowColFromToken (TkFalse (Linea l, Columna c))  = (l,c)

}
