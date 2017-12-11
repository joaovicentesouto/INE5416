#include <stdio.h>
#include "vector_operations.c"
#include "matrix_operations.c"

void printMatrix(int m, int n, double A[m][n])
{
    for (int i = 0; i < m; i++)
    {
        printf("[");

        for (int j = 0; j < (n-1); j++)
            printf("%f, ", A[i][j]);

        printf("%f]\n", A[i][n-1]);
    }
}

int main ()
{
    // Parte 1
    int size = 3;
    double v[3] = {2, 3, 4};
    double w[3] = {9, 8, 7};

    printf("Initial vectores:\n");
    printf("v: {%f, %f, %f}\n", v[0], v[1], v[2]);
    printf("w: {%f, %f, %f}\n", w[0], w[1], w[2]);

    double normaOfV = norma(size, v);
    printf("Norma of v: ||v||: %f\n", normaOfV);

    multiplyByScalar(size, v, 2);
    printf("2 * v: {%f, %f, %f}\n", v[0], v[1], v[2]);

    double * x = additionVectors(size, v, w);
    printf("v + w: {%f, %f, %f}\n", x[0], x[1], x[2]);
    free(x);

    double product = scalarProduct(size, v, w);
    printf("v . d : %f\n", product);

    x = crossProduct(size, v, w);
    printf("v x w: {%f, %f, %f}\n", x[0], x[1], x[2]);
    free(x);

    double A[3][3] = {{1, 1, 1}, {2, 2, 2}, {3, 3, 3}};
    double B[3][3] = {{2, 0, 0}, {0, 2, 0}, {0, 0, 2}};
    double C[3][3];

    // Parte 2
    printf("\nInitial matrizes:\n");
    printf("A:\n");
    printMatrix(3, 3, A);
    printf("B:\n");
    printMatrix(3, 3, B);

    transpose(3, 3, A, C);
    printf("\nTransposta de A:\n");
    printMatrix(3, 3, C);

    printf("\nA * 10:\n");
    multiplyMatrixByScalar(3, 3, A, 10);
    printMatrix(3, 3, A);

    printf("\n(A * 10) + B:\n");
    addMatrices(3, 3, A, B, C);
    printMatrix(3, 3, C);

    printf("\n(A * 10) * B:\n");
    multiplyMatrices(3, 3, 3, A, B, C);
    printMatrix(3, 3, C);

    printf("\nB:\n");
    printMatrix(3, 3, B);
    printf("\nDeterminante de B: %f\n", determinante(3, B));

    double Inversa[3][3];
    matrixInversa(3, B, Inversa);
    printf("\nInversa de B usando a adjunta:\n");
    printMatrix(3, 3, Inversa);
}