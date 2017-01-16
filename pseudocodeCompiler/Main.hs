import Lexer
import PseudocodeParser
import AstTransform

import System.Environment
--main = getContents >>= print . parsePSC . lexer


main = do
   [f] <- getArgs
   interpretFile f

interpretFile f = do
    s <- readFile $ f
    let tokens = lexer s
    let ast = parsePSC tokens
    let normast = normaliseAst ast
    let instr = transformToInstructions normast

    putStrLn $ "--source--\n\n" ++ s
    putStrLn $ "\n--tokens--\n\n" ++ show tokens
    putStrLn $ "\n--ast--\n\n" ++ show ast
    putStrLn $ "\n--normalized ast--\n\n" ++ show normast
    putStrLn $ "\n--Instructions--\n\n" ++ show instr

pfs =parsePSC . lexer $ t

s = "\
  \a <- \"hi\";\n\
  \while 1==1; do\n\
  \{\n\
  \    print(a);\n\
  \    sleep(1);\n\
  \}\n\
  \od\n"

b = "print(a); sleep(1);"

c = "\"hi\" ;"

t = "if 1==1 ; then {a <- (b == (c(d,e)) );}  fi"

e = "i <- 0; while i <= 5; do {print(i); a[i]<- b++; i <- i + 1; } od"

f = "repeat { i++; a[i] <- 4; } until i == 40;"

g = "function f (a,b,c) { print(a); print(b); } print( f (a) );"

h = "for i <- 0 to a; do print(i); od"

j = "for i <- 0 downto b; do { sleep(1); } od"
i = normaliseAst . parsePSC . lexer
