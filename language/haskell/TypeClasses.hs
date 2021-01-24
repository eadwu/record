module Language.Haskell.TypeClasses
( Eq, TrafficLight(..) )
where
  -- Basically stripped from Learn You a Haskell, licensed under CC BY-NC-SA 3.0
  import Prelude hiding ( Eq, (==), (/=) )

  class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
    x == y = not $ x /= y
    x /= y = not $ x == y

  data TrafficLight = Red | Yellow | Green

  {- Only need to define `==` or `/=` because of the mutual recursive dependence -}
  instance Eq TrafficLight where
    Red == Red = True
    Yellow == Yellow = True
    Green == Green = True
    _ == _ = False

  {- Derive a custom `Show` typeclass "implementation" -}
  instance Show TrafficLight where
    show Red = "Red"
    show _ = "Not Red"
