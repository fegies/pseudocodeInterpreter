module AstTransform(normaliseAst,transformToInstructions) where

import Ast
import Instructions

normaliseAst :: Program -> Program
normaliseAst = flattenRepeat . transformFor

--Turns repeat.. until loops into normal while loops
flattenRepeat :: [Statement] -> [Statement]
flattenRepeat [] = []
flattenRepeat ((StatementRepeat block exp):xs)
    = block++(StatementWhile (ExpressionLogicNot exp) block):[]++(flattenRepeat xs)
flattenRepeat (x:xs) = x:(flattenRepeat xs)

--turns for.. loops into while loops
transformFor :: [Statement] -> [Statement]
transformFor [] = []
transformFor((StatementForTo (ExpressionAssign to from) expc block):xs)
    = [StatementExpression (ExpressionAssign to from),
    StatementWhile (ExpressionCompareEq to expc) (block++(StatementExpression $ ExpressionArithInc to):[])]
    ++(flattenRepeat xs)
transformFor((StatementForDownto (ExpressionAssign to from) expc block):xs)
    = [StatementExpression (ExpressionAssign to from),
    StatementWhile (ExpressionCompareEq to expc) (block++(StatementExpression $ ExpressionArithDec to):[])]
    ++(flattenRepeat xs)
transformFor (x:xs) = x:(transformFor xs)

transformToInstructions :: Program -> [Instruction]
transformToInstructions [] = []
transformToInstructions x:xs = (serializeStatement x)++transformToInstructions xs

serializeStatement :: Statement -> [Instruction]
serializeStatement (StatementIf expc bthen belse )
    = let ci = serializeExpression expc
          ti = transformToInstructions bthen
          ei = transformToInstructions belse
      in ci ++ [InstrConditionalJump (length ti)] ++ ti ++ ei
serializeStatement (StatementWhile exp block )
    = let ci = serializeExpression exp
          bi = serializeExpression block
