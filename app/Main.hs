module Main where

import System.Environment
import Lib

main :: IO ()
main = do
  env <- getEnvironment
  let port = maybe 3000 read $ lookup "PORT" env
  startApp port
