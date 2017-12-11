import System.Environment (getArgs)
import System.IO
import Data.Char
import Converte

main :: IO () -- M ́odulo principal do programa
main = do
    args <- getArgs
    case args of
        [fname] -> do
            fstr     <- readFile fname
            arqSaida <- openFile "wavdat8.dat" WriteMode
            let dadosAsc = snd (splitAt 44 (map ord fstr))
            let dados    = map wavDat8 dadosAsc
            hPrint arqSaida (dados)
            hClose arqSaida
        _ -> putStrLn "uso: wc fname"