import unittest
import math

#  ____  _  _ _        _
# |  _ \(_)(_) | _____| |_ _ __ __ _
# | | | | || | |/ / __| __| '__/ _` |
# | |_| | || |   <\__ \ |_| | | (_| |
# |____/|_|/ |_|\_\___/\__|_|  \__,_|
#        |__/

""" Représentation d'un graphe orienté valué
    Le graphe est donné sous forme de liste d'arcs qui sont des triplets [i,j,p(i,j)]
    On construit à partir de cette liste le dictionnaire des listes d'adjacence et le dictionnaire des poids M
"""
def arcToListes(L):
    G = dict()
    M = dict()
    for arc in L:
        M[(arc[0],arc[1])] = arc[2]
        try:
            G[arc[0]].append(arc[1])
        except KeyError:
            G[arc[0]] = [arc[1]]
    return (G,M)

""" Retourne les plus courts chemins dans un graphe à partir d'un sommet 
    sous la forme d'un dico des pères et d'un dico des distances 
    
    Keyword arguments
    G -- Le graphe sous la forme d'un dico de listes d'adjacence
    M -- Les poids sous la forme d'un dico (x,y): p(x,y)
    s -- Le sommet à partir duquel sont calculés les plus courts chemins
"""

#G : graphe
#M : arc pondéré
def Dijkstra(G,M,s):
    Dist = {} # Distance des sommets atteignables depuis s
    Pere = {} # Arbre collecteur sous la forme dico des pères
    Pere[s]=s
    Dist[s] = 0

    liste = [s]
    for fils in G[s]:
        Dist[fils] = M[s,fils]
        Pere[fils] = s
        liste.append(fils)


    '''
    for i in range(1,len(G)+1):
        if (s,i) in M:
            Dist[i] = M[s,i]
            Pere[i] = s
            liste.append(i)
            pass
        else:
            Dist[i] = 99#float("inf")
            pass
    '''

    while len(liste):
        x = liste[0]
        liste=liste[1:]
        for y in G[x]:
            d = Dist[x] + M[(x,y)]
            if y not in Dist or d<Dist[y] :# and Pere[x]!=0:
                Dist[y] = d
                Pere[y] = x
                liste.append(y)
                pass
            pass
        pass
    
   
    return (Dist,Pere)


#  ____       _ _                       
# |  _ \     | | |                      
# | |_) | ___| | |_ __ ___   __ _ _ __  
# |  _ < / _ \ | | '_ ` _ \ / _` | '_ \ 
# | |_) |  __/ | | | | | | | (_| | | | |
# |____/ \___|_|_|_| |_| |_|\__,_|_| |_|
#

""" Evolution pour Bellman avec construction des listes de prédécesseurs
"""
def arcToListes2(L):
    P={} # Listes des prédécesseurs
    G={} # Listes des successeurs
    M={} # Matrice des poids sous la forme d'un dictionnaire
    G,M = arcToListes(L)

    for pere in G :
        for fils in G[pere]:
            try:
                P[fils].append(pere)
                pass
            except:
                P[fils] = [pere]
                pass
            pass
        pass
    return (P,G,M)

""" 
    Algorithme de Bellman utilisable pour les graphes sans cycles
    On peut utiliser au préalable un tri topologique (voir TP 5 ordonnancement)
    ou la fonction isCyclic du TP 3 (applications des parcours) 
    pour vérifier que le graphe ne comporte pas de cycle.

    Retourne les plus courts chemins dans un graphe à partir d'un sommet 
    sous la forme d'un dico des pères et d'un dico des distances 
    
    Keyword arguments
    G -- Le dictionnaire des prédécesseurs
    G -- Le dictionnaire des successeurs
    M -- Les poids sous la forme d'un dico (x,y): p(x,y)
    s -- Le sommet à partir duquel sont calculés les plus courts chemins
"""

#P : predecesseur
#G : graphe
#M : arc pondéré
def Bellman(P,G,M,s):
    Pere={} # Arbre sous forme des pères
    Dist={} # Distances

    Dist[s] = 0
    Pere[s] = s
    fini = False

    S = [i for i in G if i != s]

    while not fini:
        for y in S:
            oKy = True
            d = 99
            for x in P[y]:
                if Dist[x] == 99:
                    


    return (Dist,Pere)


#___ __ _____ __           ___      __  __ __ 
# | |_ (_  | (_   |  ||\ || |  /\ ||__)|_ (_  
# | |____) | __)  \__/| \|| | /--\|| \ |____) 
#  
class GrapheTest(unittest.TestCase):

    def setUp(self):
        self.listArcs=[ [1,2,10],[1,3,3],[1,5,6],[2,1,0],[3,2,4],[3,5,2],[4,3,1],[4,5,3],[5,2,0] ,[5,6,1],[6,1,2],[6,2,1]]
    
        self.listArcs2=[[1,2,1],[1,3,-2],[2,4,-2],[3,2,1],[3,4,5],[3,5,4],[5,6,-1],[6,4,-5]]
    
    def testArcToListes(self):
        (G,M)=arcToListes(self.listArcs)
        self.assertEqual(G, {
            1: [2, 3, 5], 2: [1], 3: [2, 5], 
            4: [3, 5], 5: [2, 6], 6: [1, 2]})
        self.assertEqual(M, {
            (1, 2): 10,
            (1, 3): 3,
            (1, 5): 6,
            (2, 1): 0,
            (3, 2): 4,
            (3, 5): 2,
            (4, 3): 1,
            (4, 5): 3,
            (5, 2): 0,
            (5, 6): 1,
            (6, 1): 2,
            (6, 2): 1	})
            
    def testDijkstra(self):
        G,M = arcToListes(self.listArcs)
        dist,pere = Dijkstra(G, M, 1)
        self.assertEqual(pere, {1: 1, 2: 5, 3: 1, 5: 3, 6: 5})
        self.assertEqual(dist, {1: 0, 2: 5, 3: 3, 5: 5, 6: 6})
        
    def testDijkstra2(self):
        G,M = arcToListes(self.listArcs)
        dist,pere = Dijkstra(G, M, 4)
        self.assertEqual(pere, {4: 4, 3: 4, 5: 4, 2: 5, 6: 5, 1: 2})
        self.assertEqual(dist, {4: 0, 3: 1, 5: 3, 2: 3, 6: 4, 1: 3})

    def testArcToListes2(self):
        P,G,M = arcToListes2(self.listArcs2)
        self.assertEqual(P, {2: [1, 3], 1: [], 3: [1], 4: [2, 3, 6], 5: [3], 6: [5]})
        self.assertEqual(G, {1: [2, 3], 2: [4], 3: [2, 4, 5], 4: [], 5: [6], 6: [4]})
        self.assertEqual(M, {
            (1, 2): 1,	(1, 3): -2,	(2, 4): -2,	(3, 2): 1,
            (3, 4): 5, (3, 5): 4, (5, 6): -1, (6, 4): -5 
        })

    def testBellman(self):
        ListArcs2=[[1,2,1],[1,3,-2],[2,4,-2],[3,2,1],[3,4,5],[3,5,4],[5,6,-1],[6,4,-5]]
        P,G,M = arcToListes2(ListArcs2)
        Dist,Pere = Bellman(P,G,M,1)
        self.assertEqual(Dist, {1: 0, 3: -2, 2: -1, 5: 2, 6: 1, 4: -4})
        self.assertEqual(Pere, {1: 1, 3: 1, 2: 3, 5: 3, 6: 5, 4: 6})


if __name__ == '__main__':
    unittest.main()
