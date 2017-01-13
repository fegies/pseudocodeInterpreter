module Ast where

data Statement
    = EmptyStatement
    | StatementIf Expression Block Block -- condition, then, else
    | StatementWhile Expression Block -- condition , do 
    | StatementFor StatementFor
    | StatementExpr Expression
    deriving (Show)

type Block = [Statement]

data StatementFor
    = ForTo String Integer Integer Block -- name, from, to, block
    | ForDownto String Integer Integer Block
    deriving (Show)

data Value
    = Vs String
    | Vi Integer
    deriving (Show)

data Expression
    = ExprConst Value
    | ExprAssign String Expression

    --variable handling
    | ExprLookup String
    | ExprCollection Expression Expression--For argument collection
    | ExprFunctionCall Expression Expression -- name, arguments
    | ExprMemberAccess Expression String -- object, member name
    | ExprArrayAccess Expression Expression --object, Index

    --Arithmetic
    | ExprPlus Expression Expression
    | ExprMinus Expression Expression
    | ExprMult Expression Expression
    | ExprDiv Expression Expression
    | ExprMod Expression Expression
    | ExprInc Expression
    | ExprDec Expression

    --Comparisons
    | ExprCompEq Expression Expression
    | ExprCompNeq Expression Expression
    | ExprCompLt Expression Expression
    | ExprCompGt Expression Expression
    | ExprCompLeq Expression Expression
    | ExprCompGeq Expression Expression

    --boolean Expressions
    | ExprNot Expression
    | ExprAnd Expression Expression
    | ExprOr Expression Expression
    deriving (Show)

