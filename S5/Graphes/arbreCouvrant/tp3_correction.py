#!/usr/bin/env python3

import unittest
from tp2_profondeur_correction import profond
from tp1_partie1_correction import nbSommets


#  _   _                          _            _    __      
# | \ | |                        (_)          | |  /_/      
# |  \| | ___  _ __     ___  _ __ _  ___ _ __ | |_ ___  ___ 
# | . ` |/ _ \| '_ \   / _ \| '__| |/ _ \ '_ \| __/ _ \/ __|
# | |\  | (_) | | | | | (_) | |  | |  __/ | | | ||  __/\__ \
# |_| \_|\___/|_| |_|  \___/|_|  |_|\___|_| |_|\__\___||___/
#                                                         
def isConnexe(G):
	"""
	G est connexe si on peut visiter tous ses sommets
	à partir d'un sommet.
	"""
	return len(profond(G,1)) == nbSommets(G)

def cyclicRec(G, sommet, pere, Visite):
	"""
	Pendant un parcours profondeur d'abord, 
	on détecte les cycles par les revisites différentes du père
	"""
	# Traitement en début de parcours
	Visite.add(sommet)
	cycle = False;
	i=0
	while i < len(G[sommet]) and not cycle:
		succ = G[sommet][i]
		if succ != pere:
			if succ in Visite:
				return True
			else:
				cycle = cyclicRec(G, succ, sommet, Visite)
		i += 1
	# Traitement en fin de parcours							
	return cycle
	
def isCyclic(G):
	Visite = set()	   
	for sommet in G:
		if sommet not in Visite and cyclicRec(G, sommet, sommet, Visite):
			return True
	return False

	
def isArbre(G):
	return isConnexe(G) and not isCyclic(G)
	
def plusCourtChemin(G, sommet):
	"""
	En exécutant un parcours largeur d'abord, je note pour chaque sommet
	rencontré pour la première fois son père et sa profondeur 
	(profondeur du père + 1)
	"""
	Dist = dict()
	Pere = dict()
	Visite = {sommet}
	File = [sommet]
	Dist[sommet] = 0
	Pere[sommet] = sommet # La racine est son propre père
	while len(File) > 0:
		s = File.pop(0)
		for succ in G[s]:
			if not succ in Visite:
				Visite.add(succ)
				File.append(succ)
				Dist[succ] = Dist[s] + 1
				Pere[succ] = s
	return (Dist, Pere)

def biparti(G):
	"""
	En parcourant largeur d'abord, si je retombe sur un sommet
	déjà visité (cycle) possédant un marqueur égal à son père, alors
	le graphe ne peut pas être biparti
	"""
	Visite = dict()
	Ens = { 1: set(), 2: set()}  
	for sommet in G:
		if not sommet in Visite: 
			File = [sommet]
			Visite[sommet] = 1
			Ens[1].add(sommet)
			while len(File)>0:
				s = File.pop(0)
				for succ in G[s]:
					if not succ in Visite:
						Visite[succ] = 3 - Visite[s] # 2->1 et 1->2
						Ens[Visite[succ]].add(succ)
						File.append(succ) 
					elif Visite[succ] == Visite[s]:
						return (False, {}, {})
	return (True, Ens[1], Ens[2])

#              _            _    __      
#             (_)          | |  /_/      
#    ___  _ __ _  ___ _ __ | |_ ___  ___ 
#   / _ \| '__| |/ _ \ '_ \| __/ _ \/ __|
#  ( (_) | |  | |  __/ | | | ||  __/\__ \
#   \___/|_|  |_|\___|_| |_|\__\___||___/
#                                                         
def cyclicRecOriente(G, sommet, Visite):
	Visite[sommet] = 1 #On marque la visite comme commencée
	cycle = False
	for succ in G[sommet]:
		if cycle: return True
		if succ not in Visite: #S'il n'a jamais été visité, on l'explore récursivement
			cycle = cyclicRecOriente(G, succ, Visite) 
		elif Visite[succ] == 1:
			return True #On a trouvé un cycle
	Visite[sommet] = 2 #On marque la visite comme terminée
	return cycle

def isCyclicOriente(G):
	Visite = dict()
	for sommet in G:
		if sommet not in Visite:
			if cyclicRecOriente(G, sommet, Visite):
				return True
	return False


# _______        _         _    _       _ _        _               
#|__   __|      | |       | |  | |     (_) |      (_)              
#   | | ___  ___| |_ ___  | |  | |_ __  _| |_ __ _ _ _ __ ___  ___ 
#   | |/ _ \/ __| __/ __| | |  | | '_ \| | __/ _` | | '__/ _ \/ __|
#   | |  __/\__ \ |_\__ \ | |__| | | | | | || (_| | | | |  __/\__ \
#   |_|\___||___/\__|___/  \____/|_| |_|_|\__\__,_|_|_|  \___||___/
#                                                             
class GrapheTest(unittest.TestCase):

	def setUp(self):
		self.G1={1:[2],2:[1,3,7],3:[2],4:[7],5:[7],6:[7],7:[2,4,5,6]} 		# arbre
		self.G2={1:[2,4],2:[1,3,7],3:[2],4:[1,7],5:[7],6:[7],7:[2,4,5,6]}	# connexe cyclique
		self.G3={1:[2],2:[1,3],3:[2],4:[7],5:[7],6:[7],7:[4,5,6]}			# ni connexe ni cyclique
		self.G4={1:[2],2:[1,3],3:[2],4:[5,7],5:[4,7],6:[7],7:[4,5,6]} 		# pas connexe cyclique
	
	def testConnexe(self):
		self.assertTrue(isConnexe(self.G1))
		self.assertTrue(isConnexe(self.G2))
		self.assertFalse(isConnexe(self.G3))
		self.assertFalse(isConnexe(self.G4))

	def testCyclic(self):
		self.assertFalse(isCyclic(self.G1))
		self.assertTrue(isCyclic(self.G2))
		self.assertFalse(isCyclic(self.G3))
		self.assertTrue(isCyclic(self.G4))
 
	def testArbre(self):
		self.assertTrue(isArbre(self.G1))
		self.assertFalse(isArbre(self.G2))
		self.assertFalse(isArbre(self.G3))
		self.assertFalse(isArbre(self.G4))


	def testPlusCourtChemin(self):
		Dist,Pere = plusCourtChemin(self.G1, 1)
		self.assertEqual(Pere,{1:1,2:1,3:2,4:7,5:7,6:7,7:2})
		self.assertEqual(Dist,{1:0,2:1,3:2,4:3,5:3,6:3,7:2})
		Dist,Pere = plusCourtChemin(self.G1, 3)
		self.assertEqual(Pere,{1:2,2:3,3:3,4:7,5:7,6:7,7:2})
		self.assertEqual(Dist,{1:2,2:1,3:0,4:3,5:3,6:3,7:2})
		Dist,Pere = plusCourtChemin(self.G2, 1)
		self.assertEqual(Pere,{1:1,2:1,3:2,4:1,5:7,6:7,7:2})
		self.assertEqual(Dist,{1:0,2:1,3:2,4:1,5:3,6:3,7:2})
		Dist,Pere = plusCourtChemin(self.G4, 1)
		self.assertEqual(Pere,{1:1,2:1,3:2})
		self.assertEqual(Dist,{1:0,2:1,3:2})
		Dist,Pere = plusCourtChemin(self.G4, 5)
		self.assertEqual(Pere,{4:5,5:5,6:7,7:5})
		self.assertEqual(Dist,{4:1,5:0,6:2,7:1})

	def testBiparti(self):
		self.assertEqual(biparti({1:[2,3],2:[1],3:[1]}), (True,{1},{2,3}))
		self.assertEqual(biparti({1:[4],2:[3],3:[2],4:[1]}), (True,{1,2},{4,3}))
		self.assertEqual(biparti(self.G1), (True, {1,3,7}, {2,4,5,6}))
		self.assertEqual(biparti(self.G2), (True, {1,3,7}, {2,4,5,6}))
		self.assertEqual(biparti(self.G3), (True, {1,3,4,5,6}, {2,7}))
		self.assertEqual(biparti(self.G4), (False, {}, {}))
	
	def testIsCyclicOriente(self):
		self.assertTrue(isCyclicOriente({1:[3,4,5,6],2:[1],3:[2,4],4:[],5:[],6:[4]}))
		self.assertFalse(isCyclicOriente({1:[4,5,6],2:[1],3:[2,4],4:[],5:[],6:[4]}))


if __name__ == '__main__':
    unittest.main()


