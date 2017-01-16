module Instructions where

data Instruction
    = InstrJump Int
    | InstrConditionalJump Int --jump if false
    | InstrFunctionDecl String [String] Int --number of instructions in the function block
    | InstrClassDecl String [String]
    | InstrReturn
    | InstrVarLookup String
    | InstrGlobalLookup String
    | InstrPushConstStr String
    | InstrPushConstInt Int
    | InstrFunctionCall
    | InstrArrayAccess
    | InstrObjNew String
    | InstrObjMemberAccess
    | InstrAssign

    | InstrCompareEq
    | InstrCompareLt
    | InstrCompareGt
    | InstrCompareLeq
    | InstrCompareGeq

    | InstrArithPlus
    | InstrArithMinus
    | InstrArithMul
    | InstrArithDiv
    | InstrArithMod
    | InstrArithInc
    | InstrArithDec

    | InstrLogicNot
    | InstrLogicAnd
    | InstrLogicOr
    deriving (Show)



