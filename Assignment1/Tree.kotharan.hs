
--Bhavya Parikh (932 811 918)
-- Anand Kothari (933 032 430)
-- Munisha Parikh (932 981 839)

module Tree where


--
-- * Part 1: Binary trees
--

-- | Integer-labeled binary trees.
data Tree = Node Int Tree Tree   -- ^ Internal nodes
          | Leaf Int             -- ^ Leaf nodes
  deriving (Eq,Show)


-- | An example binary tree, which will be used in tests.
t1 :: Tree
t1 = Node 1 (Node 2 (Node 3 (Leaf 4) (Leaf 5))
                    (Leaf 6))
            (Node 7 (Leaf 8) (Leaf 9))

-- | Another example binary tree, used in tests.
t2 :: Tree
t2 = Node 6 (Node 2 (Leaf 1) (Node 4 (Leaf 3) (Leaf 5)))
            (Node 8 (Leaf 7) (Leaf 9))

t3 = Node 3 (Node 4 (Leaf 5) (Node 6 (Leaf 7) (Leaf 3)))   -- created for extra testing
            (Node 9 (Leaf 8) (Leaf 18))


-- | The integer at the left-most node of a binary tree.
--
--   >>> leftmost (Leaf 3)
--   3
--
--   >>> leftmost (Node 5 (Leaf 6) (Leaf 7))
--   6
--
--   >>> leftmost t1
--   4
--
--   >>> leftmost t2
--   1
--
leftmost :: Tree -> Int
leftmost (Leaf i)     = i
leftmost (Node _ l _) = leftmost l


-- | The integer at the right-most node of a binary tree.

--
rightmost :: Tree -> Int
rightmost (Leaf j)     = j
rightmost (Node _ _ l) = rightmost l


-- | Get the maximum integer from a binary tree.
--
--   >>> maxInt (Leaf 3)
--   3
--
--   >>> maxInt (Node 5 (Leaf 4) (Leaf 2))
--   5
--
--   >>> maxInt (Node 5 (Leaf 7) (Leaf 2))
--   7
--
--   >>> maxInt t1
--   9
--
--   >>> maxInt t2
--   9
--
-- Pre-defined max function used to get the max Int from nodes and
-- the leaves and then  print the maximum number of them all
-- by checking through recursion of maxInt

maxInt :: Tree -> Int
maxInt (Leaf i) = i
maxInt (Node h left right) = max h (max (maxInt left) (maxInt right))

-- | Get the minimum integer from a binary tree.
--
--   >>> minInt (Leaf 3)
--   3
--
--   >>> minInt (Node 2 (Leaf 5) (Leaf 4))
--   2
--
--   >>> minInt (Node 5 (Leaf 4) (Leaf 7))
--   4
--
--   >>> minInt t1
--   1
--
--   >>> minInt t2
--   1
--

minInt :: Tree -> Int
minInt (Leaf i) = i
minInt (Node h left right) = min h (min (minInt left) (minInt right))

-- | Get the sum of the integers in a binary tree.
--
--   >>> sumInts (Leaf 3)
--   3
--
--   >>> sumInts (Node 2 (Leaf 5) (Leaf 4))
--   11
--
--   >>> sumInts t1
--   45
--
--   >>> sumInts (Node 10 t1 t2)
--   100
--

sumInts :: Tree -> Int
sumInts (Leaf i) = i
sumInts(Node n left right) = n + (sumInts left) + (sumInts right)

-- | The list of integers encountered by a pre-order traversal of the tree.
--
--   >>> preorder (Leaf 3)
--   [3]
--
--   >>> preorder (Node 5 (Leaf 6) (Leaf 7))
--   [5,6,7]
--
--   >>> preorder t1
--   [1,2,3,4,5,6,7,8,9]
--
--   >>> preorder t2
--   [6,2,1,4,3,5,8,7,9]
--

preorder :: Tree -> [Int]
preorder (Leaf i) = [i]
preorder (Node m left right) =  (m : (preorder left ++ preorder right))

-- | The list of integers encountered by an in-order traversal of the tree.
--
--   >>> inorder (Leaf 3)
--   [3]
--
--   >>> inorder (Node 5 (Leaf 6) (Leaf 7))
--   [6,5,7]
--
--   >>> inorder t1
--   [4,3,5,2,6,1,8,7,9]
--
--   >>> inorder t2
--   [1,2,3,4,5,6,7,8,9]
--

inorder :: Tree -> [Int]
inorder (Leaf i) = [i]
inorder (Node m left right) =  (inorder left) ++ [ m ] ++ (inorder right)


-- | Check whether a binary tree is a binary search tree.
--
--   >>> isBST (Leaf 3)
--   True
--
--   >>> isBST (Node 5 (Leaf 6) (Leaf 7))
--   False
--
--   >>> isBST t1
--   False
--
--   >>> isBST t2
--   True
--
isBST :: Tree -> Bool
isBST (Leaf i) = True
isBST (Node m left right)
     | ( minInt left <=m && m <= maxInt right && isBST left  &&  isBST right) = True  -- used multiple conditions to satisfy the properties of BST
     | otherwise = False

-- | Check whether a number is contained in a binary search tree.
--   (You may assume that the given tree is a binary search tree.)
--
--   >>> inBST 2 (Node 5 (Leaf 2) (Leaf 7))
--   True
--
     --   >>> inBST 3 (Node 5 (Leaf 2) (Leaf 7))
--   False
--
--   >>> inBST 4 t2
--   True
--
--   >>> inBST 10 t2
--   False
--
inBST :: Int -> Tree -> Bool -- Taking two inputs, one as a number and another as a tree and printing a Boolean value

inBST num (Leaf i) = if (num == i) then True else False  -- Checking for the condition by using if -else clause and printing the Boolean output
inBST num (Node n left right) = if (n == num) then True
                          else if (n > num) then inBST num left
                          else if (n < num)then inBST num right
                          else False
