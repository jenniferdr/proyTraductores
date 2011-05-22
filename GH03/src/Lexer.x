{
module Main (main) where
import Token
import System.IO
import System.Environment

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
"of"$white+"type" {\p s -> TkOfType (getRowCol p)}
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

  (x:[xs]) <- getArgs
  if x =="-e"
     then do
        let r = alexScanTokens_2 xs
        printToken r
     else do
       fp <- openFile x ReadMode
       content <- hGetContents fp
       let r = alexScanTokens_2 content
       printList r
       hClose fp

type TkError = (Char,Posicion,Posicion)

alexScanTokens_2 :: String -> ([Token], [TkError])                           
alexScanTokens_2 str = go (alexStartPos,'\n',str)
  where 
    go inp@(pos,_,str) = case alexScan inp 0 of
      AlexEOF                -> ([],[])
      AlexError inp'         -> conc ([],[(head str,fst (getRowCol pos), snd (getRowCol pos))]) (go (alexMove pos (head str), head str, tail str))
      AlexSkip  inp' len     -> conc ([],[])(go inp')
      AlexToken inp' len act -> conc([act pos (take len str)],[]) (go inp')

conc :: ([a],[b]) -> ([a],[b]) -> ([a],[b])
conc x y = (fst x ++ fst y, snd x ++ snd y)

printList :: ([Token],[TkError]) -> IO()
printList (x,y) = do
	  case y of
	       [] -> printToken x
	       (y:ys)  -> printError (y:ys)
	  	
	  	  
printToken :: [Token] -> IO() 
printToken [] = return ()
printToken (x:xs) = do 
	   print x
	   printToken xs

printError :: [TkError] -> IO()
printError [] = return ()
printError ((char,row,col):listError) = do 
	   putStr "ERROR: Caracter no esperado '"
	   putChar char
	   putStr "' en " 
	   putStr (show row)
	   putStr ", "
	   putStr (show col) 
	   putStr ".\n"
	   printError listError

getRowCol :: AlexPosn -> (Posicion,Posicion)
getRowCol (AlexPn offset row col) = (Linea row, Columna col)

}
