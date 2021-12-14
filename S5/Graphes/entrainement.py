G1 = {
    1 : [2,4],
    2 : [4],
    3 : [1,2,4,5,6],
    4 : [],
    5 : [1],
    6 : []
}

G2 = {
    1 : [2,4],
    2 : [4],
    3 : [1,2,4,5,6],
    4 : [],
    5 : [1,2,4],
    6 : []
}


def toMat(G):
    matrice = []
    taille = len(G)
    for sommet in G : 
        liste = [ 0 for _ in range(taille) ]
        for voisin in G[sommet]:
            liste[voisin-1] = 1
            pass
        matrice.append(liste)

        pass
    return matrice

assert toMat(G1) == [[0, 1, 0, 1, 0, 0],[0, 0, 0, 1, 0, 0],[1, 1, 0, 1, 1, 1],[0, 0, 0, 0, 0, 0],[1, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0]]
assert toMat(G2) == [[0, 1, 0, 1, 0, 0],[0, 0, 0, 1, 0, 0],[1, 1, 0, 1, 1, 1],[0, 0, 0, 0, 0, 0],[1, 1, 0, 1, 0, 0],[0, 0, 0, 0, 0, 0],]
'''
m = toMat(G1)
mm = toMat(G2)
for k in m:
    print(k)
print()
print()
for k in mm:
    print(k)
print()
'''
#si pour tous les arcs i,j et j,k il existe i,k

def isTransitif(G):
    matrice = toMat(G)
    taille = len(G)
    for i in range(taille):
        for j in range(taille):
            for k in range(taille):
                if 1==matrice[i][j]==matrice[j][k]!=matrice[i][k]:
                    #print(i+1,j+1,k+1)
                    return False
                pass
            pass
        pass
    return True

assert isTransitif(G1)==False
assert isTransitif(G2)==True

G3 = {
    1 : [2,4,6],
    2 : [1,3,5],
    3 : [2,4],
    4 : [1,3,5],
    5 : [2,4,6],
    6 : [1,5]
}

'''
def nbArete(G):
    visite = {}
    for sommet in G:
        for voisin in G[sommet]:
            visite[
                min(sommet,voisin),
                max(sommet,voisin)
                ] = 1
            pass
        pass
    return len(visite)
assert nbArete(G3) == 8
'''

def nbArete(G):
    n=0
    for k in G:
        for i in G[k]:
            if i>=k:
                n+=1
                pass
            pass
        pass
    return n

assert nbArete(G3) == 8

'''
mm = toMat(G3)
for k in mm:
    print(k)
print()
'''

def numArete(G):
    matrice = toMat(G)
    num = 1
    for k in G:
        for i in G[k]:
            if matrice[k-1][i-1]==1 and i>=k:
                matrice[k-1][i-1] = num
                matrice[i-1][k-1] = num
                num +=1
                pass
            pass
        pass
    return matrice

assert numArete(G3) == [[0, 1, 0, 2, 0, 3],[1, 0, 4, 0, 5, 0],[0, 4, 0, 6, 0, 0],[2, 0, 6, 0, 7, 0],[0, 5, 0, 7, 0, 8],[3, 0, 0, 0, 8, 0]]




def adjoint(G):
    adjoint = {(i+1) : [] for i in range(nbArete(G))}
    matrice = numArete(G)
    taille = len(matrice)

    #parcours du triangle sup de la matrice de numeration des sommets
    for x in range(taille) :
        for y in range(x):
            #j'attrape un sommet 
            if matrice[x][y] != 0:
                print(x+1)
                #relier toutes les arretes jointes aux sommets n°liste et n°arrete
                for sommet in matrice[x]:
                    print(sommet, end=' ')
                    if sommet != 0 and sommet != x+1:
                        #ajoute
                        adjoint[x+1].append(sommet)
                        #adjoint[sommet].append(arrete+1)
                        pass
                    pass
                print()
                print(y+1)
                for sommet in matrice[y]:
                    print(sommet, end=' ')
                    if sommet != 0 and sommet != y+1:
                        #ajoute
                        adjoint[y+1].append(sommet)
                        #adjoint[sommet].append(arrete+1)
                        pass
                    pass
                print()
                print('########')
                pass
            pass
        pass
    return adjoint
    
mm = numArete(G3)
for k in mm:
    print(k)
print()

mm = adjoint(G3)
for k in mm:
    print(k,mm[k])
print()