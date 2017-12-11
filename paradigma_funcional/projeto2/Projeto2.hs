module Projeto2 (
    somaInt,
    totalSomaInt,
    somaImpares,                -- Parte 1
    totalSomaImpares,           -- Parte 1
    somaPares,                  -- Parte 1
    totalSomaPares,             -- Parte 1
    somaQuadradoInteiros,       -- Parte 1
    totalSomaQuadradoInteiros,  -- Parte 1
    somaQuadradoImpares,        -- Parte 1
    totalSomaQuadradoImpares,   -- Parte 1
    quaseUm,
    quaseDois,                  -- Parte 2
    quaseE                      -- Parte 2
    ) where

-- Aluno: João Vicente Souto
-- Matrícula: 16105151

somaInt :: (Fractional a, Enum a) => a -> [a]
somaInt n = map (\x->(x*(x+1)/2)) [1..n]

totalSomaInt :: (Enum a, Fractional a) => a -> a
totalSomaInt n = last (somaInt n)

-- Parte 1:
-- Somatório de 1 até n de 2n-1 = n^2
somaImpares :: (Num a, Enum a) => a -> [a]
somaImpares n = map (\x -> x^2) [1..n]

totalSomaImpares :: (Enum a, Num a) => a -> a
totalSomaImpares n = last (somaImpares n)

-- Somatório de 1 até n de 2n = n * (n+1)
somaPares :: (Num a, Enum a) => a -> [a]
somaPares n = map (\x -> x * (x+1)) [1..n]

totalSomaPares :: (Enum a, Num a) => a -> a
totalSomaPares n = last (somaPares n)

-- Somatório de 1 até n de n^2 = n^3/3 + n^2/2 + n/6
somaQuadradoInteiros :: (Fractional a, Enum a) => a -> [a]
somaQuadradoInteiros n = map (\x -> x^3/3 + x^2/2 + x/6) [1..n]

totalSomaQuadradoInteiros :: (Enum a, Fractional a) => a -> a
totalSomaQuadradoInteiros n = last (somaQuadradoInteiros n)

-- Quadro impares
somaQuadradoImpares :: (Enum a, Floating a) => a -> [a]
somaQuadradoImpares n = map (\x -> sum [y**2 | y <- [1,3..x]]) [1,3..n]

totalSomaQuadradoImpares :: (Floating a, Enum a) => a -> a
totalSomaQuadradoImpares n = last (somaQuadradoImpares n)

-- Parte 2
quaseUm :: (Fractional a, Enum a) => Int -> a
quaseUm n = sum (map (\x->(1/(x^2+x))) (take n [1..]))

quaseDois :: Fractional a => Int -> a
quaseDois n = sum (map (\x-> 1/2^(x-1)) (take n [1..]))

factorial :: (Eq a, Num a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

quaseE :: (Fractional a, Eq a, Enum a) => Int -> a
quaseE n = sum (map (\x-> 1/factorial x) (take n [0..]))