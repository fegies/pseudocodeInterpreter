module Tokens where

data Token
    = TokenIf -- Keywords
    | TokenThen
    | TokenElse
    | TokenFi
    | TokenWhile
    | TokenDo
    | TokenOd
    | TokenFor
    | TokenTo
    | TokenDownto 
    | TokenClass
    | TokenSemicolon --Symbols
    | TokenDot
    | TokenComma
    | TokenRBOpen --round brace
    | TokenRBClose
    | TokenCBOpen --curly brace
    | TokenCBClose
    | TokenSBOpen --square brackets
    | TokenSBClose
    | TokenLeftarrow -- <-
    | TokenEq -- ==
    | TokenNeq -- !=
    | TokenNot -- !
    | TokenAnd -- &&
    | TokenOr -- ||
    | TokenLeq -- <=
    | TokenLt -- <
    | TokenGeq -- >=
    | TokenGt -- >
    | TokenInc -- ++
    | TokenDec -- --
    | TokenPlus -- +
    | TokenMinus -- -
    | TokenMult -- *
    | TokenDiv -- /
    | TokenMod -- %
    | TokenEqualSign -- =
    | TokenQuote -- "
    | TokenInt Integer
    | TokenWord String
    deriving (Show)
