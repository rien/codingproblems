module Main where

import Days.Day1
import Days.Day2
import System.Environment

main :: IO ()
main = do
        args <- getArgs
        case args of
            (d:file:as) -> do
                input <- readFile file
                putStrLn "Input:"
                putStrLn input
                putStrLn "Result:"
                putStrLn $ day d input

            _        -> putStrLn "Wrong number of args"

day :: String -> String -> String
day "1.1" = show . solveFirstCaptcha
day "1.2" = show . solveSecondCaptcha
day "2.1" = show . firstChecksum
day "2.2" = show . secondChecksum

