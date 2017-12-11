module Resist (rst) where


x // y = do
    a <- x
    b <- y
    if b == 0 then Nothing else Just (a / b)

add x y = do
    x' <- x
    y' <- y
    return (x' + y')

-- Definição monádica:

rst x y = let
    one = return 1
    rx = return x
    ry = return y
    in one // (add (one // rx) (one // ry))