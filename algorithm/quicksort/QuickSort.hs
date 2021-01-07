module QuickSort
  ( main )
  where
    import Data.Ord ( Ord )

    quicksort :: Ord a => [a] -> [a]
    quicksort [] = []
    quicksort (x:xs) = quicksort (filter (<=x) xs) ++ [x] ++ quicksort (filter (>x) xs)

    main :: IO ()
    main = do
      print $ quicksort $ reverse [1..324]
