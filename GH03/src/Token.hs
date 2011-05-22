module Token (Token(..),Posicion(..)) where

data Posicion = Linea Int | Columna Int deriving (Eq,Show)

data Token =
     TkDig String (Posicion,Posicion) |
     TkId String (Posicion,Posicion) |
     TkString String (Posicion,Posicion) |
     TkPlus (Posicion,Posicion) |
     TkMinus (Posicion,Posicion) |
     TkPow (Posicion,Posicion) |
     TkTimes (Posicion,Posicion) |
     TkDiv (Posicion,Posicion) |
     TkMod (Posicion,Posicion) |
     TkLt (Posicion,Posicion) |
     TkGt (Posicion,Posicion) |
     TkEq (Posicion,Posicion) |
     TkNot (Posicion,Posicion) |
     TkLBrack (Posicion,Posicion) |
     TkRBrack (Posicion,Posicion) |
     TkRow (Posicion,Posicion) |
     TkCol (Posicion,Posicion) |
     TkSQuot (Posicion,Posicion) |
     TkDQuot (Posicion,Posicion) |
     TkColon (Posicion,Posicion) |
     TkSemiColon (Posicion,Posicion) |
     TkComma (Posicion,Posicion) |
     TkDot (Posicion,Posicion) |
     TkAnd (Posicion,Posicion) |
     TkOr (Posicion,Posicion) |
     TkLBrace (Posicion,Posicion) |
     TkRBrace (Posicion,Posicion) |
     TkLParen (Posicion,Posicion) |
     TkRParen (Posicion,Posicion) |
     TkNotEq (Posicion,Posicion) |
     TkAsig (Posicion,Posicion) |
     TkLte (Posicion,Posicion) |
     TkGte (Posicion,Posicion) |
     TkNum (Posicion,Posicion) |
     TkVec (Posicion,Posicion) |
     TkMat (Posicion,Posicion) |
     TkZeroes (Posicion,Posicion) | 
     TkRange (Posicion,Posicion) |
     TkEye (Posicion,Posicion) |
     TkDefine (Posicion,Posicion) |
     TkOfType (Posicion,Posicion) | 
     TkAs (Posicion,Posicion) |
     TkBegin (Posicion,Posicion) |
     TkEnd (Posicion,Posicion) |
     TkVars (Posicion,Posicion) |
     TkIf (Posicion,Posicion) |
     TkThen (Posicion,Posicion) |
     TkElse (Posicion,Posicion) |
     TkWhile (Posicion,Posicion) |
     TkDo (Posicion,Posicion) |
     TkForEach (Posicion,Posicion) |
     TkIn (Posicion,Posicion) |
     TkRead (Posicion,Posicion) |
     TkWrite (Posicion,Posicion) |
     TkReturn (Posicion,Posicion) |
     TkTrue (Posicion,Posicion) |
     TkFalse (Posicion,Posicion)
     deriving (Eq,Show)
