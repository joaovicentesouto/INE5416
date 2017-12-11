module Converte (leNum, wavDat8) where
    
import System.IO

wavDat8 :: Int -> Int
wavDat8 x | x == 128  = 0
          | otherwise = x - 128

leNum :: IO Integer
leNum = do { line <- getLine; readIO line }