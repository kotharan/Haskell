-- | This module is just to introduce the doctest tool.
module Doctest where


-- | This function should add two numbers together.
--   Here are some tests to see if it works:

add :: Int -> Int -> Int

--Do int input ke aur ek result ka

add x y = x + y


isZero 0 = True

-- Being isZero is a funtion name and 0 is a contion which says that
--return true if isZero is 0

isZero _ = False

-- This says print false if isZero is anything else other than 0

play :: Int -> Int -> Int -> Int
play a b c = a * (b + c)

ex01 = 3 + 2
ex02 = 19 - 27
ex03 = 2.35 * 8.6
ex04 :: Float
ex04 = 8.7 / 3.1
ex05 = mod 19 3
ex06 = 19 `mod` 3
ex07 = 7 ^ 222
ex08 = (-3) * (-7)            -- minus have to be in brackets

kain = print ( 12 `div` 6)  -- integers cannot be divided by / so we use 'div'

ex11 = True && False
ex12 = not (False || True)
ex13 = 'a' == 'a'
ex14 = (16 /= 3)            -- /=  means not equal
ex15 = (5 > 3) && ('p' <= 'q')
ex16 = "Haskell" > "C++"


sumtorial :: Integer -> Integer
sumtorial 0 = 0
sumtorial n = n + sumtorial (n - 1)

main = print (sumtorial 10)
------------------------------------

hailstone :: Integer -> Integer
hailstone n
  | n `mod` 2 == 0 = n `div` 2
  | otherwise      = 3 * n + 1

-- pain = print (hailstone 7)


plj :: Integer -> String
plj k
  | k == 0 = "True"
  | k /=0  = "False"

dain = print (plj 4)
-----------------------------------------
foo :: Integer -> Integer
foo 0 = 16
foo 1
  | "Haskell" > "C++" = 3
  | otherwise         = 4
foo n
  | n < 0           = 0
  | n `mod` 17 == 2 = -43
  | otherwise       = n + 3

fain = print [foo (-3), foo 0, foo 1, foo 36, foo 38]
-----------------------------------------

isEven :: Integer -> Bool
isEven m
  | m `mod` 2 == 0 = True
  | otherwise = False

even1 = print [isEven 5,isEven 6]

-----------------------------------------
isE :: Integer -> Bool
isE n = n `mod` 2 == 0

-----------------------------------------
--Working with pair

sumPair :: (Float,Float) -> Float
sumPair(x,y) = x/y

pairing = print (sumPair(4.2,2.2))

-----------------------------------------

emptyList = []

a = 1 : []
b = 3 : (1 : 2 :  [2,3,4,5])
c = [2,3,4] == 2 : 3 : 4 : []

-----------------------------------------

hailstoneSeq:: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)
pain = print (hailstoneSeq 5)

-----------------------------------------
-- Compute the length of a list of Integers
intListLength :: [Integer] -> Integer
intListLength [] = 0
intListLength (x:xs) = 1 + intListLength xs                   -- "we can also replace x with underscore since we don't use it at all"

sain = print (intListLength [1,2,3,46])

-- O/P : 4

-----------------------------------------
sumEveryTwo :: [Integer] -> [Integer]
sumEveryTwo []         = [] -- Do nothing to the empty list
sumEveryTwo (x:[])     = [] -- Do nothing to lists with a single element
sumEveryTwo (x:(y:zs)) = (x + y) : sumEveryTwo zs

mkain = print (sumEveryTwo [1,2,3,4,5,6,7,8])
