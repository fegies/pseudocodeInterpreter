module AstTransform(normaliseAst,transformToInstructions) where

import Ast
import Instructions

normaliseAst :: Program -> Program
normaliseAst = normaliseStatements . checkTree

--throw errors if an error in the grammar is found
--returns the exact same AST if no errors were found
checkTree :: Program -> Program
checkTree (p @(StatementForTo (ExpressionVar _) (ExpressionConstant _) _) : xs) = p : checkTree xs
checkTree (p @(StatementForTo (ExpressionArrayAccess _ _) (ExpressionConstant _) _) : xs) = p : checkTree xs
checkTree (p @(StatementForTo _ _ _) : xs) = error "Deine For-Schleife ist behindert. Streng dich mehr an."
checkTree (p @(StatementForDownto (ExpressionVar _) (ExpressionConstant _) _) : xs) = p : checkTree xs
checkTree (p @(StatementForDownto (ExpressionArrayAccess _ _) (ExpressionConstant _) _) : xs) = p : checkTree xs
checkTree (p @(StatementForDownto _ _ _) : xs) = error "Deine For-Schleife ist behindert. Streng dich mehr an."
checkTree (p @(StatementExpression e):xs) = (StatementExpression $ checkExpression e) : checkTree xs
checkTree a = a

--thows errors if a bad expression is found
--returns the same expression otherwise
checkExpression :: Expression -> Expression
checkExpression a = a

--turn all loops into while loops
normaliseStatements :: [Statement] -> [Statement]
normaliseStatements [] = []
normaliseStatements((StatementForTo (ExpressionAssign to from) expc block):xs)
    = [StatementExpression (ExpressionAssign to from),
    StatementWhile (ExpressionCompareEq to expc) (block++(StatementExpression $ ExpressionArithInc to):[])]
    ++(normaliseStatements xs)
normaliseStatements((StatementForDownto (ExpressionAssign to from) expc block):xs)
    = [StatementExpression (ExpressionAssign to from),
    StatementWhile (ExpressionCompareEq to expc) (block++(StatementExpression $ ExpressionArithDec to):[])]
    ++(normaliseStatements xs)
normaliseStatements((StatementRepeat block until):xs)
    = block ++ [StatementWhile (ExpressionLogicNot until) block] ++ (normaliseStatements xs)
normaliseStatements((StatementExpression exp):xs)
    = (StatementExpression $ normaliseExpression exp) : (normaliseStatements xs)
normaliseStatements (x:xs) = x:(normaliseStatements xs)

normaliseExpression :: Expression -> Expression
normaliseExpression (ExpressionCompareNeq e1 e2) = ExpressionLogicNot( ExpressionCompareEq e1 e2 )
normaliseExpression a = a

transformToInstructions :: Block -> [Instruction]
transformToInstructions [] = []
transformToInstructions (x:xs) = (serializeStatement x)++transformToInstructions xs

serializeStatement :: Statement -> [Instruction]
serializeStatement (StatementIf expc bthen belse )
    = let ci = serializeExpression expc
          ti = transformToInstructions bthen
          ei = transformToInstructions belse
      in ci ++ [InstrConditionalJump (length ti)] ++ ti ++ ei
serializeStatement (StatementWhile exp block )
    = let ci = serializeExpression exp
          bi = transformToInstructions block
          jf = length bi + 1
          jb = - (jf + length ci)
      in ci ++ [InstrConditionalJump jf] ++ bi ++ [InstrJump jb] 
serializeStatement (StatementFunctionDeclaration name args block)
    = let ins = transformToInstructions block
          len = length ins
      in (InstrFunctionDecl name args len) : ins
serializeStatement (StatementReturn exp)
    = serializeExpression exp ++ [InstrReturn]
serializeStatement (StatementExpression exp)
    = serializeExpression exp


argstolist :: Expression -> Expression -> [Instruction]
argstolist a b = serializeExpression b ++ serializeExpression a

serializeExpression :: Expression -> [Instruction]
serializeExpression (ExpressionVar name) = InstrVarLookup name : []
serializeExpression (ExpressionConstant const)
    = case const of
        ConstantString s -> InstrPushConstStr s
        ConstantInt i -> InstrPushConstInt $ fromIntegral i
      : []
serializeExpression (ExpressionFunctionCall exp args)
    = let l = serializeExpression exp
          r = concat $ map serializeExpression args
      in r ++ l ++ [InstrFunctionCall]
serializeExpression (ExpressionArrayAccess exp pos)
    = argstolist exp pos ++ [InstrArrayAccess]
serializeExpression (ExpressionAssign to what)
    = argstolist what to ++ [InstrAssign]
serializeExpression (ExpressionCompareEq l r )
    = argstolist l r ++ [InstrCompareEq]
serializeExpression (ExpressionCompareLt l r )
    = argstolist l r ++ [InstrCompareLt]
serializeExpression (ExpressionCompareLeq l r )
    = argstolist l r ++ [InstrCompareLeq ]
serializeExpression (ExpressionCompareGt l r )
    = argstolist l r ++ [InstrCompareGt]
serializeExpression (ExpressionCompareGeq l r )
    = argstolist l r ++ [InstrCompareGeq]
serializeExpression (ExpressionArithPlus l r )
    = argstolist l r ++ [InstrArithPlus]
serializeExpression (ExpressionArithMinus l r)
    = argstolist l r ++ [InstrArithMinus]
serializeExpression (ExpressionLogicAnd l r)
    = argstolist l r ++ [InstrLogicAnd]
serializeExpression (ExpressionLogicOr l r)
    = argstolist l r ++ [InstrLogicOr]
serializeExpression (ExpressionLogicNot e)
    = serializeExpression e ++ [InstrLogicNot]