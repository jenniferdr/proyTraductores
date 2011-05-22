module Token (Token(..)) where

data Token =
     TkDig String |
     TkId String |
     TkString String|
     TkPlus |
     TkMinus |
     TkPow |
     TkTimes |
     TkDiv |
     TkMod |
     TkLt |
     TkGt |
     TkEq |
     TkNot |
     TkLBrack |
     TkRBrack |
     TkRow |
     TkCol |
     TkSQuot |
     TkDQuot |
     TkColon |
     TkSemiColon |
     TkComma |
     TkDot |
     TkAnd |
     TkOr |
     TkLBrace |
     TkRBrace |
     TkLParen |
     TkRParen |
     TkNotEq |
     TkAsig |
     TkLte |
     TkGte |
     TkNum |
     TkVec |
     TkMat |
     TkZeroes | 
     TkRange |
     TkEye |
     TkDefine |
     TkOfType | 
     TkAs |
     TkBegin |
     TkEnd |
     TkVars |
     TkIf |
     TkThen |
     TkElse |
     TkWhile |
     TkDo |
     TkForEach |
     TkIn |
     TkRead |
     TkWrite |
     TkReturn |
     TkTrue |
     TkFalse
     deriving (Eq,Show)
