import Lexer
import PseudocodeParser
import AstTransform

--main = getContents >>= print . parsePSC . lexer


main = do
   putStr s

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

h = "f (); return a;"

i = normaliseAst . parsePSC . lexer
