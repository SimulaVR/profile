module Main where

import qualified Data.HashSet as HashSet

main :: IO ()
main = do
  let dataStructures = HashSet.fromList ["Set", "Map", "Graph", "Sequence"]
  putStrLn "Hello, world!"
