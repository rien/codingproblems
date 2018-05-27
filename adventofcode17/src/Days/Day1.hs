module Days.Day1 (solveFirstCaptcha, solveSecondCaptcha) where

import Data.Char (digitToInt)

solveFirstCaptcha :: String -> Integer
solveFirstCaptcha = solveCaptcha tail

solveSecondCaptcha :: String -> Integer
solveSecondCaptcha l = solveCaptcha (drop $ length l `div` 2) l

solveCaptcha :: ([Integer] -> [Integer]) -> String -> Integer
solveCaptcha jump inputStr = solver input cycled
    where input = map (toInteger . digitToInt) inputStr
          cycled = jump $ cycle input

solver :: [Integer] -> [Integer] -> Integer
solver []  _ = 0 :: Integer
solver (x:xs) (y:ys) = let recurse = solver xs ys
                        in if x == y
                        then x + recurse
                        else recurse

