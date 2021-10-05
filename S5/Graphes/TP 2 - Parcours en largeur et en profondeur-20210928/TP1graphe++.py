
G1 = {1 : [2,5,5],2 : [1,3,4,4],3 : [2,3,4],4 : [2,2,3,5],5 : [1,1,4]}

#!/usr/bin/env python3

import unittest 

# __    __ 
#/_ |  /_ |
# | |   | |
# | |   | |
# | | _ | |
# |_|(_)|_|
#          
def nbSommets(G):
	return len(G)+1

def nbAretes2(G):
    #attention aux boucles
    a=0
    for k in G:
        a+=len(G[k])
    return a//2

def nbAretes(G):
    #plus performante, car prend tous les cas
    a=0
    for k in G:
        for i in G[k]:
            if k<=i:
                a+=1
    return a

def ajoutArete(G, i, j):
    if i!=j:
        #cas sommet vers sommet
        G[i].append(j)
        G[j].append(i)
    else:
        #cas boucle elle-meme
        G[i].append(i)
    pass


def enleveArete(G, i, j):
    if j not in G[i] and i not in G[j]:
        raise ValueError("L'arête n'existe pas")
    else:
        G[i].remove(j)
        if i!=j:
            G[j].remove(i)

def enleveArete2(G,i,j):
    #permet d'eviter les 2 parcours de liste du 'in'
    try:
        G[i].remove(j)
        if i!=j:
            G[j].remove(i)
    except:
        raise ValueError("L'arête n'existe pas")

def deg(G, i):
    return len(G[i])+1

def degre(G):
    D={}
    for i in G:
        D[i]=deg(G,i)
    return D

def kuratowski(n):
    G = {}
    for j in range(1,n+1):
        G[j]=[]

        #utilisation de 2 boucles pour eviter les comparaisons repetitives et reduire  les calculs
        for k in range(1,j):
            G[j].append(k)
        for k in range(j+1,n+1):
            G[j].append(k) 
            

    return G

'''
def grapheVide(n):
    G={}
    for sommet in range(1, n + 1):
        G[sommet] = []
    return G
'''

def grapheVide(n):
    G = {i:[] for i in range(1,n+1)}
    return G


# __     ___  
#/_ |   |__ \ 
# | |      ) |
# | |     / / 
# | | _  / /_ 
# |_|(_)|____|
#


#erreur ici car le nombre de sommet doit etre donne lors de la construction 
def areteToListe(L):
    G = grapheVide(L[-1][1])
    for arete in L:
        ajoutArete(G,arete[0],arete[1])
    return G

def areteToListe2(n,L):
    G = grapheVide(n)
    for arete in L:
        ajoutArete(G,arete[0],arete[1])
    return G


def listeToMatrice(G,n):
    M = [ [ 0 for i in range(n) ] for j in range(n) ]
    for sommet in G:
        for arete in G[sommet]:
            M[sommet-1][arete-1]+=1
    return M

def nonOriente(M):
    n=len(M)
    for i in range(n):
        for j in range(i,n):
            if M[i][j]!=M[j][i]:
                return False
    return True

def matToListe(M):
    n=len(M)
    G = grapheVide(n)
    
    for i in range(n):
        for j in range(i+1):
            for _ in range(M[i][j]):
                ajoutArete(G,i+1,j+1)
            pass
        pass
    
    return G

# _______        _         _    _       _ _        _               
#|__   __|      | |       | |  | |     (_) |      (_)              
#   | | ___  ___| |_ ___  | |  | |_ __  _| |_ __ _ _ _ __ ___  ___ 
#   | |/ _ \/ __| __/ __| | |  | | '_ \| | __/ _` | | '__/ _ \/ __|
#   | |  __/\__ \ |_\__ \ | |__| | | | | | || (_| | | | |  __/\__ \
#   |_|\___||___/\__|___/  \____/|_| |_|_|\__\__,_|_|_|  \___||___/
#                                                             
class GrapheTest(unittest.TestCase):

    def setUp(self):
        self.liste = [(1,2),(1,5),(1,5),(2,3),(2,4),(2,4),(3,3),(3,4),(4,5)]  
        self.LAdj = {1:[2,5,5],2:[1,3,4,4],3:[2,3,4],4:[2,2,3,5],5:[1,1,4]}
        self.matrice = [
                        [0,1,0,0,2],
                        [1,0,1,2,0],
                        [0,1,1,1,0],
                        [0,2,1,0,1],
                        [2,0,0,1,0]]

    def testsBasiques(self):
        #test des fonctions basiques
        self.assertEqual(nbSommets(self.LAdj), 5, 'Décompte erroné des sommets')
        self.assertEqual(nbAretes(self.LAdj), 9, 'Décompte erroné des arêtes')
        self.assertEqual(degre(self.LAdj), {1:3,2:4,3:3,4:4,5:3}, 'Erreur dans le calcul des degrés')


    def testAjoutGeneral(self):
        #Ajoute une arête dans le cas général
        ajoutArete(self.LAdj, 1, 4)
        self.assertEqual(nbAretes(self.LAdj), 10, 'Décompte des arêtes erroné après insertion')
        self.assertIn(1, self.LAdj[4], 'La liste d\'adjacence a été mise à jour de manière erronée')
        self.assertIn(4, self.LAdj[1], 'La liste d\'adjacence a été mise à jour de manière erronée')

    def testAjoutReflexif(self):
        #Ajoute une arête réflexive
        ajoutArete(self.LAdj, 1, 1)
        self.assertEqual(nbAretes(self.LAdj), 10, 'Décompte des arêtes erroné après insertion')
        self.assertEqual(self.LAdj[1].count(1), 1, 'La liste d\'adjacence a été mise à jour de manière erronée')

    def testEnleveNA(self):
        #Tentative de suppression d'une arête inexistante
        try:
            enleveArete(self.LAdj, 1, 4)
        except ValueError:
            return
        except:
            pass
        self.fail('Tentative non détectée de supprimer une arête qui n\'existe pas')

    def testEnleveGeneral(self):
        #Enlève une arête cas général
        enleveArete(self.LAdj, 1, 2)
        self.assertEqual(nbAretes(self.LAdj), 8, 'Décompte des arêtes erroné après suppression')
        self.assertNotIn(1, self.LAdj[2])

    def testEnleveMulti(self):
        #Enlève une arête multigraphe
        enleveArete(self.LAdj, 2, 4)
        self.assertEqual(self.LAdj[2].count(4), 1, 'Connexité erronée après suppression d\'une arête présente en plusieurs exemplaires')

    def testEnleveReflexif(self):
        #Enlève une arête réflexive
        enleveArete(self.LAdj, 3, 3)
        self.assertEqual(nbAretes(self.LAdj), 8,'Décompte des arêtes erroné après suppression')
        self.assertNotIn(3, self.LAdj[3], 'Connexité erronée après suppression d\'une arête réflexive')

    def testKuratowski(self):
        self.assertEqual(kuratowski(1), {1:[]}, 'K_1 erroné')
        self.assertEqual(kuratowski(2), {1:[2],2:[1]}, 'K_2 erroné')
        self.assertEqual(kuratowski(3), {1:[2,3],2:[1,3],3:[1,2]}, 'K_3 erroné')
        for i, l in kuratowski(12).items():
            for j in range(1, 13):
                if i != j:
                    self.assertIn(j, l, 'Il manque une ou plusieurs arêtes')
                    self.assertNotIn(i, l, 'Présence erronée d\'une arête réflexive')

    def testAreteToListe(self):
        self.assertEqual(areteToListe(self.liste), self.LAdj)

    def testListeToMatrice(self):
        self.assertEqual(listeToMatrice(self.LAdj, 5), self.matrice)

    def testNonOriente(self):
        self.assertTrue(nonOriente(self.matrice))
        self.assertTrue(nonOriente([[0,1,2],[1,0,3],[2,3,0]]))
        self.assertFalse(nonOriente([[0,0,0],[0,0,0],[1,0,0]]))

    def testMatToListe(self):
        self.assertEqual(matToListe(self.matrice), self.LAdj)

if __name__ == '__main__':
    '''
    G={1:[2,5,5],2:[1,3,4,4],3:[2,3,4],4:[2,2,3,5],5:[1,1,4]}
    print(nbSommets(G))
    print(nbAretes(G))
    print(nbAretes2(G))
    print("\n",G)
    ajoutArete(G,1,3)
    print(G)
    enleveArete(G,1,3)
    print(G)
    #enleveArete(G,1,4)
    print(deg(G,1))
    print(degre(G))

    for k in range(1,16):
        print("\n",kuratowski(k))
   
    L = [(1,2),(1,5),(1,5),(2,3),(2,4),(2,4),(3,3),(3,4),(4,5)]

    print(areteToListe(L))
    '''
    unittest.main()
