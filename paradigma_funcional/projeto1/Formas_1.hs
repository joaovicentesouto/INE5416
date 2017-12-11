module Formas_1 ( Forma ( Esfera,
                        Cilindro,
                        Cone,
                        TroncoCone,
                        EsferoideOblato,
                        EsferoideProlato
                      ),
                Raio, Altura,
                area, areaLateral
              ) where

data Forma = Esfera Raio
           | Cilindro Altura Raio
           | Cone Altura Raio
           | TroncoCone Altura Raio Raio
           | EsferoideOblato Raio Raio
           | EsferoideProlato Raio Raio

type Raio = Float
type Altura = Float

areaLateral :: Forma -> Float
areaLateral (Cilindro h r) = 2 * pi * r * h
areaLateral (Cone h r) = pi * r * sqrt(r^2 + h^2)
areaLateral (TroncoCone h r1 r2) = pi * (r1 + r2) * sqrt(h^2 + (r1 - r2))

excentricidade :: Raio -> Raio -> Float
excentricidade a b = sqrt(a^2 + b^2)/a

area :: Forma -> Float
area (Esfera r) = 4 * pi * r^2
area (Cilindro h r) = (areaLateral Cilindro h r) + 2 * pi * r^2
area (Cone h r) = pi * r * (sqrt(r^2 + h^2) + r)
area (TroncoCone h r1 r2) = pi*r1^2 + pi*r2^2 + (areaLateral TroncoCone h r1 r2)
area (EsferoideOblato a b) = let e = excentricidade a b
                             in 2*pi*a^2 + b^2/e*log((1+e)/(1-e))
area (EsferoideProlato a b) = let e = excentricidade a b
                              in 2*pi*b^2 + 2*pi*a*b/e * (asin e)
