module Main where

import System.Environment
import System.Console.Terminal.Size (size, width)

import qualified Data.Text.IO as T

import Lex
import Lisp
import Parse
import Parse.Matlab

main :: IO ()
main = do
  [file] <- getArgs
  d <- T.readFile file
  let l = lexer $ unix d
  -- termSize <- size
  -- let w = maybe 80 width termSize
  -- putStrLn $ pretty w l
  case parser pfile l of
    [(_,cs,_)] -> mapM_ print cs
    _ -> putStrLn "Syntax error"
