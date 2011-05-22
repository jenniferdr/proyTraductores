module Token (Token(..)) where

data Token =
     TkDig (Int,Int) String |
     TkId (Int,Int) String  |
     TkString (Int,Int) String |
     TkPlus (Int,Int) |
     TkMinus (Int,Int) |
     TkPow (Int,Int) |
     TkTimes (Int,Int) |
     TkDiv (Int,Int) |
     TkMod (Int,Int) |
     TkLt (Int,Int) |
     TkGt (Int,Int) |
     TkEq (Int,Int) |
     TkNot (Int,Int) |
     TkLBrack (Int,Int) |
     TkRBrack (Int,Int) |
     TkRow (Int,Int) |
     TkCol (Int,Int) |
     TkSQuot (Int,Int) |
     TkDQuot (Int,Int) |
     TkColon (Int,Int) |
     TkSemiColon (Int,Int) |
     TkComma (Int,Int) |
     TkDot (Int,Int) |
     TkAnd (Int,Int) |
     TkOr (Int,Int) |
     TkLBrace (Int,Int) |
     TkRBrace (Int,Int) |
     TkLParen (Int,Int) |
     TkRParen (Int,Int) |
     TkNotEq (Int,Int) |
     TkAsig (Int,Int) |
     TkLte (Int,Int) |
     TkGte (Int,Int) |
     TkNum (Int,Int) |
     TkVec (Int,Int) |
     TkMat (Int,Int) |
     TkZeroes (Int,Int) | 
     TkRange (Int,Int) |
     TkEye (Int,Int) |
     TkDefine (Int,Int) |
     TkOfType (Int,Int) | 
     TkAs (Int,Int) |
     TkBegin (Int,Int) |
     TkEnd (Int,Int) |
     TkVars (Int,Int) |
     TkIf (Int,Int) |
     TkThen (Int,Int) |
     TkElse (Int,Int) |
     TkWhile (Int,Int) |
     TkDo (Int,Int) |
     TkForEach (Int,Int) |
     TkIn (Int,Int) |
     TkRead (Int,Int) |
     TkWrite (Int,Int) |
     TkReturn (Int,Int) |
     TkTrue (Int,Int) |
     TkFalse (Int,Int)
     deriving (Eq,Show)
