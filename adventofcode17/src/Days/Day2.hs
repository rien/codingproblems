module Days.Day2 (firstChecksum, secondChecksum) where

import Data.String.Utils (split)
import Debug.Trace
import Control.Monad
import Data.Maybe

firstChecksum :: String -> Integer
firstChecksum = checksum checksumMinmax

secondChecksum :: String -> Integer
secondChecksum = checksum checksumDivisible

checksum :: ([Integer] -> Integer) -> String -> Integer
checksum checkList input = let rows        = split "\n" input
                               rownums     = map (split "\t") rows
                               rowchecksum = map checkList $ map (map read) rownums
                            in sum rowchecksum

checksumMinmax :: [Integer] -> Integer
checksumMinmax r = let (min, max) = minmax r
                    in max - min

minmax :: [Integer] -> (Integer, Integer)
minmax []     = (0, 0)
minmax (x:xs) = foldl check (x, x) xs

check :: (Integer, Integer) -> Integer -> (Integer, Integer)
check (a, b) x = let min = if x < a
                            then x
                            else a
                     max = if x > b
                            then x
                            else b
                    in (min, max)

checksumDivisible :: [Integer] -> Integer
checksumDivisible lst = let combos = [(x, y) | x <- lst, y <- lst ]
                            divisions = map evenDivision combos
                        in maybe 0 id $ msum divisions


evenDivision :: (Integer, Integer) -> Maybe Integer
evenDivision (x, y) = let big = max x y
                          sml = min x y
                        in if big /= sml && (big `rem` sml) == 0
                        then Just (big `quot` sml)
                        else Nothing





