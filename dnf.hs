data Formel a = Variable a
                | AND (Formel a) (Formel a)
                | OR  (Formel a) (Formel a)
                | NOT (Formel a)
                deriving (Show)


printFormel :: Formel String -> String
printFormel (Variable a) = a
printFormel (AND l r) = "("  ++ printFormel l ++ ")^(" ++ printFormel r ++ ")"
printFormel (OR  l r) = "("  ++ printFormel l ++ ")v(" ++ printFormel r ++ ")"
printFormel (NOT f)   = "!(" ++ printFormel f ++ ")"

dnfify :: Formel String -> Formel String
dnfify (Variable v) = Variable v
--deal with negations
dnfify (NOT (NOT v)) =  dnfify v
dnfify (NOT (AND a b)) = OR ( dnfify (NOT a)) (dnfify (NOT b))
dnfify (NOT (OR a b )) = AND ( dnfify (NOT a)) (dnfify (NOT b))
dnfify (NOT v) = NOT (dnfify v)

dnfify (AND (OR a b ) c) = OR (dnfify (AND a c)) (dnfify (AND b c))
dnfify (AND a (OR b c)) = OR (dnfify (AND a b)) (dnfify (AND a c))
dnfify (AND a b) = AND (dnfify a) (dnfify b)

dnfify (OR a b) = OR (dnfify a) (dnfify b)


knfify :: Formel String -> Formel String
knfify (Variable v) = Variable v

knfify (NOT (NOT v)) =  knfify v
knfify (NOT (AND a b)) = OR ( knfify (NOT a)) (knfify (NOT b))
knfify (NOT (OR a b )) = AND ( knfify (NOT a)) (knfify (NOT b))
knfify (NOT v) = NOT (dnfify v)

knfify (OR a (AND b c)) = AND (knfify (OR a b)) (knfify (OR a c))
knfify (OR (AND a b) c) = AND (knfify (OR a c)) (knfify (OR b c))
knfify (OR a b) = OR (knfify a) (knfify b)

knfify (AND a b) = AND (knfify a) (knfify b)


dnfs 0 = dnfify f
dnfs n = dnfify (knfs (n-1))

knfs n = knfify (dnfs n)

main = do
    putStrLn "enter Formula:"
    input <- getLine
    putStrLn . printFormel . dnfify . parseFormel . dropSpaces $ input


f = AND (OR (OR (Variable "A11") (Variable "A12")) (Variable "A13"))
    (OR (OR (Variable "A21") (Variable "A22")) (Variable "A23"))

g = "((g))^(!((a)))"
h = "!((a))"

parseFormel :: String -> Formel String
parseFormel [] = error "can't parse an empty formula"
parseFormel (x:y:xs)
    | x == '!' && y == '(' = NOT (parseFormel . cutEnd $ xs)
    | x == '(' && y == '(' = let
                                kpos = 1 + (getMatchingBrace (y:xs))
                                left = substr (y:xs) 0 (kpos)
                                op   = xs!!(kpos)
                                right= cutEnd . drop (kpos+2) $ xs
                             in case op of '^' -> AND (parseFormel left) (parseFormel right)
                                           'v' -> OR  (parseFormel left) (parseFormel right)
    | x == '(' = Variable (cutEnd (y:xs))

getMatchingBrace :: String -> Int
getMatchingBrace a = getBrace a 0 0


--String -> currentDepth -> current index ->  Matching Brace Index
getBrace :: String -> Int-> Int ->Int
getBrace [] _ _ = error "Brace does not match anything"
getBrace (')' : a) 1 i = i
getBrace (')' : a) n i = getBrace a (n-1) (i+1)
getBrace ('(' : a) n i = getBrace a (n+1) (i+1)
getBrace (_:a) n i = getBrace a n (i+1)

substr :: String -> Int -> Int -> String
substr s i j = take (j-i) . drop i $ s

cutEnd ::[a] -> [a]
cutEnd (a:[]) = []
cutEnd (a:b)  = a:cutEnd b

dropSpaces :: String -> String
dropSpaces [] = []
dropSpaces (x:xs)
    | x == ' '  = dropSpaces xs
    | otherwise = x:dropSpaces xs
