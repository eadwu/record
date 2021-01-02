{-# LANGUAGE TemplateHaskell #-}

module EmbedIO
( embedFile ) where
  import Language.Haskell.TH
  import Language.Haskell.TH.Syntax

  embedFile :: FilePath -> Q Exp
  embedFile path = do
    str <- runIO (readFile path)
    addDependentFile path
    [| str |]
