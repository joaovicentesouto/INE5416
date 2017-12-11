module Roteiro9
( paInfinita
, somaPA
, formulaSomaPA
, produtoPA
, formulaProdutoPARazao1
, factorial
) where

-- Parte 2:
paInfinita :: (Enum a, Num a) => a -> a -> [a]
paInfinita a1 r = let a2 = a1 + r in [a1,a2..]

somaPA :: (Num a, Enum a) => a -> a -> Int -> a
somaPA a1 r n = sum $ take n $ paInfinita a1 r

formulaSomaPA :: (Integral a) => a -> a -> a -> a
formulaSomaPA a1 r n = div (n * (2 * a1 + (n - 1) * r)) 2

produtoPA :: (Num a, Enum a) => a -> a -> Int -> a
produtoPA a1 r n = product $ take n $ paInfinita a1 r

factorial :: (Eq p, Num p) => p -> p
factorial 0 = 1
factorial n = n * factorial (n-1)

formulaProdutoPARazao1 :: (Eq p, Num p) => p -> p
formulaProdutoPARazao1 n = factorial(n)
