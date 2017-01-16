module Instructions where

data Instruction
    = InstrJump Int
    | InstrConditionalJump Int --jump if false
    | InstrFunctionDecl String [String] Int --number of instructions in the function block
    | InstrReturn
    | InstrVarLookup String
    | InstrPushConstStr String
    | InstrPushConstInt Int
    | InstrFunctionCall
    | InstrArrayAccess
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






