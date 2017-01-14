module AstTransform(normaliseAst) where

import Ast

normaliseAst :: Program -> Program
normaliseAst = flattenRepeat

--Turns repeat.. until loops into normal while loops
flattenRepeat :: [Statement] -> [Statement]
flattenRepeat [] = []
flattenRepeat ((StatementRepeat block exp):xs)
    = block++(StatementWhile (ExpressionLogicNot exp) block):[]++(flattenRepeat xs)
flattenRepeat (x:xs) = x:(flattenRepeat xs)
