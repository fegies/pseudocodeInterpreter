module Instructions where

data Instruction
	= InstrJump Integer
	| InstrConditionalJump Integer --jump if false

