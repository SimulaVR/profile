{-# LANGUAGE TemplateHaskell #-}

module Main where

import qualified Data.HashSet as HashSet
import Control.Lens

data Test = Test {
    _tString :: String
}

makeLenses ''Test

main :: IO ()
main = do
  putStrLn "Hello, world!"
