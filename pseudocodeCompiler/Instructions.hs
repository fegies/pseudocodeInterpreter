module Instructions where

data Instruction
    = InstrJump Int
    | InstrConditionalJump Int --jump if false
    | InstrFunctionDecl String [String] Int --number of instructions in the function block
    | InstrReturn
    | InstrVarLookup String
    | InstrPushConstStr String
    | InstrPushConstInt Int
