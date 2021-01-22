module SinglyLinkedList
( SinglyLinkedList(..)
, (.++)
, new, singleton
) where
  -- Basically stripped from Learn You a Haskell, licensed under CC BY-NC-SA 3.0

  infixr 8 :-: -- Basically the prepend operator
  -- data SinglyLinkedList a = EmptyNode | SinglyLinkedList { head :: a, tail :: SinglyLinkedList a }
  data SinglyLinkedList a = EmptyNode | a :-: (SinglyLinkedList a)
    deriving (Show)

  new :: SinglyLinkedList a
  new = EmptyNode

  singleton :: a -> SinglyLinkedList a
  singleton a = a :-: EmptyNode

  infixr 8 .++
  (.++) :: SinglyLinkedList a -> SinglyLinkedList a -> SinglyLinkedList a
  (.++) EmptyNode ys = ys -- if left hand list is empty just append the right hand list
  (.++) (x :-: xs) ys = x :-: (xs .++ ys) -- destructure with infix :-:, before recreating left hand list
