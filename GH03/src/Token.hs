module Token (Token(..)) where

data Token =

     TkDig AlexPosn String |
     TkId AlexPosn String  |
     TkString AlexPosn String |
     TkPlus AlexPosn |
     TkMinus AlexPosn |
     TkPow AlexPosn |
     TkTimes AlexPosn |
     TkDiv AlexPosn |
     TkMod AlexPosn |
     TkLt AlexPosn |
     TkGt AlexPosn |
     TkEq AlexPosn |
     TkNot AlexPosn |
     TkLBrack AlexPosn |
     TkRBrack AlexPosn |
     TkRow AlexPosn |
     TkCol AlexPosn |
     TkSQuot AlexPosn |
     TkDQuot AlexPosn |
     TkColon AlexPosn |
     TkSemiColon AlexPosn |
     TkComma AlexPosn |
     TkDot AlexPosn |
     TkAnd AlexPosn |
     TkOr AlexPosn |
     TkLBrace AlexPosn |
     TkRBrace AlexPosn |
     TkLParen AlexPosn |
     TkRParen AlexPosn |
     TkNotEq AlexPosn |
     TkAsig AlexPosn |
     TkLte AlexPosn |
     TkGte AlexPosn |
     TkNum AlexPosn |
     TkVec AlexPosn |
     TkMat AlexPosn |
     TkZeroes AlexPosn | 
     TkRange AlexPosn |
     TkEye AlexPosn |
     TkDefine AlexPosn |
     TkOfType AlexPosn | 
     TkAs AlexPosn |
     TkBegin AlexPosn |
     TkEnd AlexPosn |
     TkVars AlexPosn |
     TkIf AlexPosn |
     TkThen AlexPosn |
     TkElse AlexPosn |
     TkWhile AlexPosn |
     TkDo AlexPosn |
     TkForEach AlexPosn |
     TkIn AlexPosn |
     TkRead AlexPosn |
     TkWrite AlexPosn |
     TkReturn AlexPosn |
     TkTrue AlexPosn |
     TkFalse AlexPosn
     deriving (Eq,Show)

