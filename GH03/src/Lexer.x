{
{- 
 /Analizador Lexicografico del Lenguaje Vectorinox/
 Grupo H03
 Autores: Hancel Gonzalez   07-40983
          Jennifer Dos Reis 08-10323
-}

-- |Implementacion de los metodos usados para el analisis lexicografico
module Main where
import Token
import System.IO
import System.Environment

}


%wrapper "posn"

$digit = 0-9			-- Representación de los digitos entre 0 y 9
$alpha = [a-zA-Z]		-- Representación de caracteres alfabeticos


-- Mapeo de Expresion Regular a Tokens
tokens :-

\#.*\n	    ;
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
$alpha[$alpha$digit\_]* 
            {\p s -> TkId s (getRowCol p)}
\-?$digit$digit*\.?$digit* | \.?$digit$digit*    
            {\p s -> TkDig (stringToDouble s)(getRowCol p)} 
$white+     ;
\"$printable*\" | \'$printable*\'
            {\p s -> TkString (init (tail s)) (getRowCol p)}
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
\'          {\p s -> TkSQuot (getRowCol p)}
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
{-|
  'main' será el programa principal el cual procesa los argumentos
   recibidos  (desde la  consola o archivo)  para luego  hacer  el
   analisis lexicografico. Si el flag -e esta presente entonces lo
   siguiente que se estaria analizando es una cadena de caracteres.
   Si el flag -e esta ausente entonces se estaria analizando el
   contenido del archivo ingresado.
-}
main = do
    x <- getArgs
    r <- checkArgs x
    printList r

{-|
  @checkArgs@ recibe la  lista de argumentos  tipeados por consola
  Devuelve una tupla de long 2 con una lista de tokens encontrados
  en  el  archivo o String  esrito  en la linea de comandos, y una 
  lista de TkError con caracteres no reconocidos.
-}

checkArgs:: [String]                    -- ^ Lista de argumentos 
            -> IO (([Token],[TkError])) -- ^ tupla de lista de tokens y TkError
checkArgs x
   |length x==2 && (head x)=="-e" = do return(alexScanTokens_2 (last x))
   |length x==1 = do 
           fp <- openFile (head x) ReadMode
           content <- hGetContents fp
           return(alexScanTokens_2 content)
   |otherwise= error "Numero de argumentos invalido"        


{-| 
  @TkError@ corresponde a una tripleta estructurada por: 
  El caracter no reconocido durante el analisis lexicografico.
  El numero de la Linea y Columna donde se encuentra dicho caracter
-}
type TkError = (Char,Posicion,Posicion)

{-|
  @getRowCol@ extrae de AlexPosn la Linea y Columna donde esta ubicado el token reconocido retornando una tupla con la respectiva coordenada.
-}
getRowCol :: AlexPosn            -- ^ Valor AlexPosn correspondiente al token reconocido
          -> (Posicion,Posicion) -- ^ Coordenadas (Fila,Columna) del token reconocido
getRowCol (AlexPn offset row col) = (Linea row, Columna col)

{-|
  @stringToDouble@ convierte un String en un numero double.
-}
stringToDouble :: String -- ^ String a convertir
               -> Double -- ^ Casteo del String a Double
stringToDouble s
   |head s == '.' = read (['0'] ++ s)::Double
   |last s == '.' = read (s ++ ['0'])::Double
   |otherwise = read s::Double

{-|
  @alexScanTokens_2@ es una modificacion de alexScanToken, tomado de %wrapper
  "posn", para el manejo de errores lexicograficos.
-}
alexScanTokens_2 :: String                -- ^ cadena de caracteres a analizar
                 -> ([Token], [TkError])  -- ^ Tupla de listas de Token y TkError hallados
alexScanTokens_2 str = go (alexStartPos,'\n',str)
  where 
    go inp@(pos,_,str) = case alexScan inp 0 of
      AlexEOF                -> ([],[])
      AlexError inp'         -> conc ([],[(head str,fst (getRowCol pos), snd (getRowCol pos))]) (go (alexMove pos (head str), head str, tail str))
      AlexSkip  inp' len     -> conc ([],[])(go inp')
      AlexToken inp' len act -> conc([act pos (take len str)],[]) (go inp')

{-|
  @conc@ concatena las listas de dos tuplas
-}
conc :: ([a],[b]) -- ^ Primera tupla de listas
     -> ([a],[b]) -- ^ Segunda tupla de listas
     -> ([a],[b]) -- ^ Tupla con las listas concatenadas en sus repectivas posiciones
conc x y = (fst x ++ fst y, snd x ++ snd y)

{-|
  @printList@ imprime en la salida estandar de los tokens, validos o invalidos pero no ambos.
-}
printList :: ([Token],[TkError]) -- ^ tupla con las listas de tokens reconocidos y caracteres no reconocidos. 
          -> IO()                -- ^ Resultados obtenidos
printList (x,y) = do
	  case y of
	       [] -> printToken x
	       (y:ys)  -> printError (y:ys)
	  	

{-| 
  @printToken@ imprime en la salida estandar de la lista de tokens reconocidos.
-}
printToken :: [Token]   -- ^ Lista de Token renocidos
           -> IO()      -- ^ Resultados obtenidos
printToken [] = return ()
printToken (x:xs) = do 
	   print x
	   printToken xs

{-| 
  @printError@ imprime en la salida estandar de la lista de caracteres no esperados.
-}
printError :: [TkError] -- ^ Lista de los caracteres no validos
           -> IO()      -- ^ Resultados obtenidos
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


}
