#include <stdlib.h> 
#include <math.h>

void transpose(int m, int n, double A[m][n], double B[n][m])
{
    for (int i = 0; i < n; i++)
        for (int j = 0; j < m; j++)
            B[i][j] = A[j][i];
}

void multiplyMatrixByScalar(int m, int n, double A[m][n], double scalar)
{
    for (int i = 0; i < m; i++)
        for (int j = 0; j < n; j++)
            A[i][j] *= scalar;
}

void addMatrices(int m, int n, double A[m][n], double B[m][n], double C[m][n])
{
    for (int i = 0; i < m; i++)
        for (int j = 0; j < n; j++)
            C[i][j] = A[i][j] + B[i][j];
}

void multiplyMatrices(int m, int n, int p, double A[m][n], double B[n][p], double C[m][p])
{
    for (int i = 0; i < m; i++)
        for (int j = 0; j < p; j++)
        {
            C[i][j] = 0;
            for (int k = 0; k < n; k++)
                C[i][j] += A[i][k] * B[k][j];
        }
}

double determinante(int n, double A[n][n])
{
    double pos = 0, neg = 0;
    for (int k = 0; k < n; k++)
    {
        int i;
        int j = k;
        double aux = 1;

        for (i = 0; i < n; i++)
        {
            aux *= A[i][j];
            j = (j+1) % n;
        }
        pos += aux;

        i = k;
        aux = 1;
        for (j = n-1; j >= 0; j--)
        {            
            aux *= A[i][j];
            i = (i+1) % n;
        }
        neg += aux;
    }
    return (pos - neg);
}

double cofator3x3(int n, int i, int j, double A[n][n])
{
    int i1, i2, j1, j2;
    if (i == 0) {
        i1 = i+1;
        i2 = i+2;
    } else if (i == 1) {
        i1 = i-1;
        i2 = i+1;
    } else {
        i1 = i-2;
        i2 = i-1;
    }

    if (j == 0) {
        j1 = j+1;
        j2 = j+2;
    } else if (j == 1) {
        j1 = j-1;
        j2 = j+1;
    } else {
        j1 = j-2;
        j2 = j-1;
    }

    return A[i1][j1] * A[i2][j2] - A[i1][j2] * A[i2][j1];
}

void matrixInversa(int n, double A[n][n], double Inversa[n][n])
{
    double Cofatores[n][n];
    double Adjunta[n][n];

    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            Cofatores[i][j] = cofator3x3(n, i, j, A);

    transpose(n, n, Cofatores, Adjunta);
    double det = determinante(n, A);

    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            Inversa[i][j] = Adjunta[i][j] * 1/det;
}