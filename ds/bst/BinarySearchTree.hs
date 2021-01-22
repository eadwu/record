module BinarySearchTree
( singleton
, insert, elem
) where
  -- Basically stripped from Learn You a Haskell, licensed under CC BY-NC-SA 3.0
  import Prelude hiding (elem)

  -- data BinarySearchTree a = EmptyTree | Node { node: a, leftSubtree: BinarySearchTree a, rightSubtree: BinarySearchTree a }
  data BinarySearchTree a = EmptyTree | Node a (BinarySearchTree a) (BinarySearchTree a)
    deriving (Show)

  singleton :: a -> BinarySearchTree a
  singleton x = Node x EmptyTree EmptyTree

  insert :: (Ord a) => a -> BinarySearchTree a -> BinarySearchTree a
  insert x EmptyTree = singleton x
  insert x (Node v l r)
    | x == v = Node x l r
    | x > v  = Node v l $ insert x r
    | x < v  = Node v (insert x l) r

  elem :: (Ord a) => a -> BinarySearchTree a -> Bool
  elem x EmptyTree = False
  elem x (Node v l r)
    | x == v = True
    | x > v  = elem x r
    | x < v  = elem x l
