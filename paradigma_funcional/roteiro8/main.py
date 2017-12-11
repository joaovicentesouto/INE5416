from vector_operations import *
from matrix_operations import *

def main():
    # Parte 1
    v = [1,2,3]
    w = [10,10,10]
    print "v: ", v
    print "w: ", w
    print "\n||v||: ", norma(v)
    print "2 * v: ", multiplyByScalar(v, 2)
    print "v + w: ", additionVectors(v, w)
    print "v . w: ", scalarProduct(v, w)
    print "v x w: ", crossProduct(v, w)

    # Parte 2
    A = [[2,0,0], [0,2,0], [0,0,2]]
    B = [[3,3,2], [1,3,1], [3,3,1]]
    print "\nMatriz A:\n", A
    print "\nMatriz B:\n", B
    print "\nTransposta de A:\n", transpose(A)
    print "\n10 * A:\n", multiplyMatrixByScalar(A, 10)
    print "\nA + B:\n", addMatrices(A, B)
    print "\nA * B:\n", multiplyMatrices(A, B)
    print "\nMatriz A:\n", A
    print "\nDeterminante de A: ", determinante(A)
    print "\nInversa de A: \n", matrixInversa(A)

if __name__ == "__main__":
    main()