
def transpose(A):
    B = [[0] * len(A) for i in range(len(A[0]))]
    for i in range(len(A[0])):
        for j in range(len(A)):
            B[i][j] = A[j][i]
    return B

def multiplyMatrixByScalar(A, scalar):
    B = [[] for i in range(len(A))]
    for i in range(len(A)):
        B[i] = map(lambda x: x * scalar, A[i])
    return B

def addMatrices(A, B):
    C = [[0] * len(A[0]) for i in range(len(A))]
    for i in range(len(A)):
        for j in range(len(B)):
            C[i][j] = A[i][j] + B[i][j]
    return C

def multiplyMatrices(A, B):
    C = [[0] * len(B[0]) for i in range(len(A))]
    for i in range(len(A)):
        for j in range(len(B[0])):
            C[i][j] = 0
            for k in range(len(B)):
                C[i][j] += A[i][k] * B[k][j]
    return C

def determinante(A):
    positive = 0
    negative = 0
    for k in range(len(A)):
        j = k
        aux = 1
        for i in range(len(A)):
            aux = aux * A[i][j]
            j = (j+1) % len(A)
        positive += aux

        i = k
        aux = 1
        for j in range(len(A)-1, -1, -1):
            aux = aux * A[i][j]
            i = (i+1) % len(A)
        negative += aux
    
    return (positive - negative)

def cofator3x3(i, j, A):
    i1 = i2 = j1 = j2 = 0

    if (i == 0):
        i1 = i+1
        i2 = i+2
    elif (i == 1):
        i1 = i-1
        i2 = i+1
    else:
        i1 = i-2
        i2 = i-1

    if (j == 0):
        j1 = j+1
        j2 = j+2
    elif (j == 1):
        j1 = j-1
        j2 = j+1
    else:
        j1 = j-2
        j2 = j-1

    return A[i1][j1] * A[i2][j2] - A[i1][j2] * A[i2][j1]

def matrixInversa(A):
    Cofatores = [[0] * len(A[0]) for i in range(len(A))]

    for i in range(len(A)):
        for j in range(len(A)):
            Cofatores[i][j] = cofator3x3(i, j, A)

    Adjunta = transpose(Cofatores)
    mult = 1.0/determinante(A)

    Inversa = [[0.0] * len(Adjunta[0]) for i in range(len(Adjunta))]
    for i in range(len(Adjunta)):
        for j in range(len(Adjunta[0])):
            Inversa[i][j] = Adjunta[i][j] * mult
    
    return Inversa