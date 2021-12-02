import unittest
from tp1_partie1_correction import nbSommets, ajoutArete, enleveArete
from tp3_correction import cyclicRec, isCyclic
import math


def areteToListe(L):
	"""	Transforme une liste d'arêtes en 
		un dictionnaire de listes d'adjacences G et une matrice 
		des poids M représentée comme un dictionnaire ou
		où le poids de chaque arête (i,j) est en M[(i,j)].

    Keyword arguments:
    L -- Une liste d'arêtes, chacune de la forme [i,j,p(i,j)]
    """
	return (G,M)

#  _  __               _         _ 
# | |/ /_ __ _   _ ___| | ____ _| |
# | ' /| '__| | | / __| |/ / _` | |
# | . \| |  | |_| \__ \   < (_| | |
# |_|\_\_|   \__,_|___/_|\_\__,_|_|
# 
def Kruskal(n,L):
	"""	Calcule l'arbre couvrant du graphe L par l'algorithme 
		de Kruskal. Retourne l'arbre couvrant sous la forme 
		d'un dico de listes d'adjacence T, ainsi que son poids.

    Keyword arguments:
    n -- Le nombre de sommets du graphe
    L -- Une liste d'arêtes, chacune de la forme [i,j,p(i,j)]
    """
	return (T,poids)

#  ____       _           
# |  _ \ _ __(_)_ __ ___  
# | |_) | '__| | '_ ` _ \ 
# |  __/| |  | | | | | | |
# |_|   |_|  |_|_| |_| |_|
#     
def Prim(L):
	"""	Calcule l'arbre couvrant du graphe L par l'algorithme 
		de Prim. Retourne l'arbre couvrant sous la forme 
		d'un dico de listes d'adjacence T, ainsi que son poids.

    Keyword arguments:
    L -- Une liste d'arêtes, chacune de la forme [i,j,p(i,j)]
    """
	return (T, poids)
	
	
#___ __ _____ __           ___      __  __ __ 
# | |_ (_  | (_   |  ||\ || |  /\ ||__)|_ (_  
# | |____) | __)  \__/| \|| | /--\|| \ |____) 
#                                             
class GrapheTest(unittest.TestCase):

	def setUp(self):
		self.ListAretes=[[1,2,7],[1,5,6],[1,6,2],[2,3,4],[2,5,5],[3,4,1],[3,5,2],[4,5,3],[5,6,1]]
		##
		self.G6 = {1:[2,5,6],2:[1,3,5],3:[2,4,5],4:[3,5],5:[1,2,3,4,6],6:[1,5]}
		self.G6mat = {
			(1,2):7, (1,5):6, (1,6):2, (2,3):4, (2,5):5, 
			(3,4):1, (3,5):2, (4,5):3, (5,6):1, 
			(2,1):7, (5,1):6, (3,2):4, (5,2):5, (4,3):1, 
			(5,3):2, (5,4):3, (6,1):2, (6,5):1,
		}
	
	def testAreteToListe(self):
		(G,M)=areteToListe(self.ListAretes)
		self.assertEqual(G, self.G6)
		self.assertEqual(M, self.G6mat)
	
	def testKruskal(self):
		(T, poids) = Kruskal(6,self.ListAretes)
		self.assertEqual(T, {1:[6], 2:[3], 3:[4, 5, 2], 4:[3], 5:[6, 3], 6:[5, 1]})
		self.assertEqual(poids, 10)

	def testPrim(self):
		(T, poids) = Prim(self.ListAretes)
		self.assertEqual(T, {1:[6], 2:[3], 3:[5, 4, 2], 4:[3], 5:[6, 3], 6:[1, 5]})
		self.assertEqual(poids, 10)

if __name__ == '__main__':
    unittest.main()


                                 
                    
