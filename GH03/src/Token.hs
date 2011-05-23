-- |Definicion de los tipos algebraicos libres Posicion y Token
module Token (
  -- * Tipos exportados
  -- ** Tipo algebraico libre Token
  Token(..),
  -- ** Tipo algebraico libre Posicion
  Posicion(..)
  ) where

data Posicion 
    -- | Numero de la Linea 
    = Linea Int
    -- | Numero de la Columna 
    | Columna Int 
     deriving (Eq,Show)

data Token
    -- | Constructor para TkDig
    = TkDig Double (Posicion,Posicion)
    -- | Constructor para TkId
    | TkId String (Posicion,Posicion)
    -- | Constructor para TkString
    | TkString String (Posicion,Posicion)
    -- | Constructor para TkPlus
    | TkPlus (Posicion,Posicion)
    -- | Constructor para TkMinus
    | TkMinus (Posicion,Posicion)
    -- | Constructor para TkPow
    | TkPow (Posicion,Posicion)
    -- | Constructor para TkTimes
    | TkTimes (Posicion,Posicion)
    -- | Constructor para TkDiv
    | TkDiv (Posicion,Posicion)
    -- | Constructor para TkMod
    | TkMod (Posicion,Posicion)
    -- | Constructor para TkLt
    | TkLt (Posicion,Posicion)
    -- | Constructor para TkGt
    | TkGt (Posicion,Posicion)
    -- | Constructor para TkEq
    | TkEq (Posicion,Posicion)
    -- | Constructor para TkNot
    | TkNot (Posicion,Posicion)
    -- | Constructor para TkLBrack
    | TkLBrack (Posicion,Posicion)
    -- | Constructor para TkRBrack
    | TkRBrack (Posicion,Posicion)
    -- | Constructor para TkRow
    | TkRow (Posicion,Posicion)
    -- | Constructor para TkCol
    | TkCol (Posicion,Posicion)
    -- | Constructor para TkSQuot
    | TkSQuot (Posicion,Posicion)
    -- | Constructor para TkDQuot
    | TkDQuot (Posicion,Posicion)
    -- | Constructor para TkColon
    | TkColon (Posicion,Posicion)
    -- | Constructor para TkSemiColon
    | TkSemiColon (Posicion,Posicion)
    -- | Constructor para TkComma
    | TkComma (Posicion,Posicion)
    -- | Constructor para TkDot
    | TkDot (Posicion,Posicion)
    -- | Constructor para TkAnd
    | TkAnd (Posicion,Posicion)
    -- | Constructor para TkOr
    | TkOr (Posicion,Posicion)
    -- | Constructor para TkLBrace
    | TkLBrace (Posicion,Posicion)
    -- | Constructor para TkRBrace
    | TkRBrace (Posicion,Posicion)
    -- | Constructor para TkLParen
    | TkLParen (Posicion,Posicion)
    -- | Constructor para TkRParen
    | TkRParen (Posicion,Posicion)
    -- | Constructor para TkNotEq
    | TkNotEq (Posicion,Posicion)
    -- | Constructor para TkAsig
    | TkAsig (Posicion,Posicion)
    -- | Constructor para TkLte
    | TkLte (Posicion,Posicion)
    -- | Constructor para TkGte
    | TkGte (Posicion,Posicion)
    -- | Constructor para TkNum
    | TkNum (Posicion,Posicion)
    -- | Constructor para Tkvec
    | TkVec (Posicion,Posicion)
    -- | Constructor para TkMat
    | TkMat (Posicion,Posicion)
    -- | Constructor para TkZeroes
    | TkZeroes (Posicion,Posicion)
    -- | Constructor para TkRange
    | TkRange (Posicion,Posicion)
    -- | Constructor para TkEye
    | TkEye (Posicion,Posicion)
    -- | Constructor para TkDefine
    | TkDefine (Posicion,Posicion)
    -- | Constructor para TkOfType
    | TkOfType (Posicion,Posicion)
    -- | Constructor para TkAs 
    | TkAs (Posicion,Posicion)
    -- | Constructor para TkBegin
    | TkBegin (Posicion,Posicion)
    -- | Constructor para TkEnd
    | TkEnd (Posicion,Posicion)
    -- | Constructor para TkVars
    | TkVars (Posicion,Posicion)
    -- | Constructor para TkIf
    | TkIf (Posicion,Posicion)
    -- | Constructor para TkThen
    | TkThen (Posicion,Posicion)
    -- | Constructor para TkElse
    | TkElse (Posicion,Posicion)
    -- | Constructor para TkWhile
    | TkWhile (Posicion,Posicion)
    -- | Constructor para TkDo
    | TkDo (Posicion,Posicion)
    -- | Constructor para TkForEach
    | TkForEach (Posicion,Posicion)
    -- | Constructor para TkIn
    | TkIn (Posicion,Posicion)
    -- | Constructor para TkRead
    | TkRead (Posicion,Posicion)
    -- | Constructor para TkWrite
    | TkWrite (Posicion,Posicion)
    -- | Constructor para TkReturn
    | TkReturn (Posicion,Posicion)
    -- | Constructor para TkTrue
    | TkTrue (Posicion,Posicion)
    -- | Constructor para TkFalse
    | TkFalse (Posicion,Posicion)
     deriving (Eq,Show)
