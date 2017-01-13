import Lexer
import PseudocodeParser

--main = getContents >>= print . parsePSC . lexer


main = do
   putStr s

pfs = parsePSC . lexer 

s = "\
  \a = \"hi\"\n\
  \while 1==1; do\n\
  \{\n\
  \    print(a);\n\
  \    sleep(1);\n\
  \}\n\
  \done\n"

b = "a == a"
