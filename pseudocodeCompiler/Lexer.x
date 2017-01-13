{
module Lexer (lexer) where

import Tokens
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-

  $white+				;
  if					{ \s -> TokenIf }
  then					{ \s -> TokenThen }
  else 					{ \s -> TokenElse }
  fi					{ \s -> TokenFi }
  while 				{ \s -> TokenWhile }
  do 					{ \s -> TokenDo }
  od					{ \s -> TokenOd }
  to 					{ \s -> TokenTo }
  downto 				{ \s -> TokenDownto }
  \;					{ \s -> TokenSemicolon }
  \.					{ \s -> TokenDot }
  \(    				{ \s -> TokenRBOpen }
  \)					{ \s -> TokenRBClose }
  \{					{ \s -> TokenCBOpen }
  \}					{ \s -> TokenCBClose }
  \[					{ \s -> TokenSBOpen }
  \]					{ \s -> TokenSBClose }
  "<-"					{ \s -> TokenLeftarrow }
  "=="					{ \s -> TokenEq }
  "!="					{ \s -> TokenNeq }
  "!"					{ \s -> TokenNot }
  "&&"					{ \s -> TokenAnd }
  "||"					{ \s -> TokenOr }
  "<="					{ \s -> TokenLeq }
  "<"					{ \s -> TokenLt }
  ">="					{ \s -> TokenGt }
  ">"					{ \s -> TokenGt }
  "++"					{ \s -> TokenInc }
  "--"					{ \s -> TokenDec }
  "+"					{ \s -> TokenPlus }
  "-"					{ \s -> TokenMinus }
  "*"					{ \s -> TokenMult }
  "="					{ \s -> TokenEqualSign }
  \"					{ \s -> TokenQuote }
  $digit+				{ \s -> TokenInt (read s) }
  $alpha+ 				{ \s -> TokenWord s}

{
-- Each action has type :: String -> Token

lexer = alexScanTokens
}
