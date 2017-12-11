from math import sqrt

def norma(v):
    return sqrt(reduce(lambda x,y: x + y**2, v))


def multiplyByScalar(v, scalar):
    return map(lambda x: x*scalar, v)

def additionVectors(v, w):
    x = v[:]
    for i in range(len(v)):
        x[i] = v[i] + w[i]
    return x

def scalarProduct(v, w):
    product = 0
    for i in range(len(v)):
        product += v[i] * w[i]
    return product

def crossProduct(v, w):
    x = v[:]
    x[0] = v[1] * w[2] - w[1] * v[2]
    x[1] = -v[0] * w[2] + w[0] * v[2]
    x[2] = v[0] * w[1] - w[0] * v[1]
    return x
