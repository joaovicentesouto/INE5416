% Fatos principais
cor(amarelo) .
cor(azul) .
cor(branco) .
cor(verde) .
cor(vermelho) .

nacionalidade(alemao) .
nacionalidade(dinamarques) .
nacionalidade(ingles) .
nacionalidade(noruegues) .
nacionalidade(sueco) .

bebida(agua) .
bebida(cafe) .
bebida(cerveja) .
bebida(cha) .
bebida(leite) .

cigarro(blends) .
cigarro(bluemaster) .
cigarro(dunhill) .
cigarro(pallmall) .
cigarro(prince) .

animal(cachorros) .
animal(cavalos) .
animal(gatos) .
animal(passaros) .
animal(peixes) .

% Fatos secundarios
posicao(primeira) .
posicao(segunda) .
posicao(terceira) .
posicao(quarta) .
posicao(quinta) .

direcao(esquerda) .
direcao(direita) .

possibilidades(Cor,Nacio,Bebida,Cigarro,Animal,Posicao) :-
  cor(Cor) , nacionalidade(Nacio) , bebida(Bebida) , animal(Animal) ,
  posicao(Posicao) , direcao(Dir) ,
