data Token =
     TkPlus |
     TkMinus |
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
     TkNum |
     TkVec |
     TkZeroes | 
     TkRange |
     TkEye |
     TkDefine |
     TkOf |
     TkType | 
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

main = do
  s <- getContents
  print (alexScanTokens s)