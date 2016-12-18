

main = putStrLn $ show (take 100 fibl)

fibs 0 = 0
fibs 1 = 1
fibs n = fibl!!(n-1) + fibl!!(n-2)

fibl = [fibs n | n <- [0..] ]

pow 1 m = 1
pow n 0 = 1
pow n m = n `mul` (pow n (m-1))

mul 1 m = m
mul n 1 = n
mul n m = n + (mul n (m-1))

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = smallerSorted ++ [x] ++ biggerSorted
        where smallerSorted = quicksort [ a | a <- xs, a <= x ]
              biggerSorted = quicksort [a | a <- xs, a > x ]


colc :: (Integral a) => a -> [a]
colc 1 = [1]
colc n
        | even n = n:colc ( n `div` 2 )
        | odd n = n:colc( n*3 + 1 )


rev [] = []
rev (x:xs) = rev xs ++ [x]
