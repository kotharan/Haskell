
--Bhavya Parikh (932 811 918)
-- Anand Kothari (933 032 430)
-- Munisha Parikh (932 981 839)

module Nat where

import Prelude hiding (Enum(..), sum)


--
-- * Part 2: Natural numbers
--

-- | The natural numbers.
data Nat = Zero            ------ Here is the data type definition
         | Succ Nat
 deriving (Eq,Show)

-- | The number 1.
one :: Nat
one = Succ Zero

-- | The number 2.
two :: Nat
two = Succ one

-- | The number 3.
three :: Nat
three = Succ two

-- | The number 4.
four :: Nat
four = Succ three


-- | The predecessor of a natural number.
--
--   >>> pred Zero
--   Zero
--
--   >>> pred three
--   Succ (Succ Zero)
--

pred :: Nat -> Nat
pred Zero = Zero
pred (Succ num) = num




-- | True if the given value is zero.
--
--   >>> isZero Zero
--   True
--
--   >>> isZero two
--   False
--
isZero :: Nat -> Bool
isZero Zero = True
isZero _ = False

-- | Convert a natural number to an integer.
--
--   >>> toInt Zero
--   0
--
--   >>> toInt three
--   3
--
toInt :: Nat -> Integer
toInt Zero = 0
toInt (Succ x) = (toInt x + 1)

-- | Add two natural numbers.
--
--   >>> add one two
--   Succ (Succ (Succ Zero))
--
--   >>> add Zero one == one
--   True
--
--   >>> add two two == four
--   True
--
--   >>> add two three == add three two
--   True
--
add :: Nat -> Nat -> Nat
--We are not sure if you want the boolean values or its just the example still we are printing the boolean values if done a comparison
add Zero x = x
--add (Succ x) y = add x (Succ y)-- using this works as well
add num1 num2 = add (pred num1) (Succ num2)



-- | Subtract the second natural number from the first. Return zero
--   if the second number is bigger.
--
--   >>> sub two one
--   Succ Zero
--
--   >>> sub three one
--   Succ (Succ Zero)
--
--   >>> sub one one
--   Zero
--
--   >>> sub one three
--   Zero
--

sub :: Nat -> Nat -> Nat
sub (Zero) y  = Zero
sub x (Zero)  = x
sub x y       = sub (pred x) (pred y)


-- | Is the left value greater than the right?
--
--   >>> gt one two
--   False
--
--   >>> gt two one
--   True
--
--   >>> gt two two
--   False
--


gt :: Nat -> Nat -> Bool
gt (Zero) y  = False
gt x (Zero)  = True
gt x y       = gt (pred x) (pred y)



-- | Multiply two natural numbers.
--
--   >>> mult two Zero
--   Zero
--
--   >>> mult Zero three
--   Zero
--
--   >>> toInt (mult two three)
--   6
--
--   >>> toInt (mult three three)
--   9
--
mult :: Nat -> Nat -> Nat
mult Zero x  = Zero
mult x Zero  = Zero
mult x (Succ y) = add x (mult x y)


-- | Compute the sum of a list of natural numbers.
--
--   >>> sum []
--   Zero
--
--   >>> sum [one,Zero,two]
--   Succ (Succ (Succ Zero))
--
--   >>> toInt (sum [one,two,three])
--   6
--
sum :: [Nat] -> Nat
--sum 1 = foldr (add) Zero 1
sum []     = Zero
sum (x:xs) = add x (sum xs)

-- | An infinite list of all of the *odd* natural numbers, in order.
--
--   >>> map toInt (take 5 odds)
--   [1,3,5,7,9]
--
--   >>> toInt (sum (take 100 odds))
--   10000
--
odds :: [Nat]
odds = one : map (add two) odds
