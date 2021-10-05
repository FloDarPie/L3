#!/usr/bin/env python3

import unittest
from tp2_profondeur import profond, nbSommets

#  _   _                          _            _    __      
# | \ | |                        (_)          | |  /_/      
# |  \| | ___  _ __     ___  _ __ _  ___ _ __ | |_ ___  ___ 
# | . ` |/ _ \| '_ \   / _ \| '__| |/ _ \ '_ \| __/ _ \/ __|
# | |\  | (_) | | | | | (_) | |  | |  __/ | | | ||  __/\__ \
# |_| \_|\___/|_| |_|  \___/|_|  |_|\___|_| |_|\__\___||___/
#
def isConnexe(G):
	ordreVisite = profond(G, 1)
	return len(ordreVisite) == nbSommets(G)

def cyclicRec(G, i, pere, Visite):
	Visite.add(i)
	for i in G:
		if i not in Visite:
			cyclicRec(G,i,pere, Visite)
		elif pere != i:
			return True
	return False
	
def isCyclic(G):
	Visite = {}
	cycle = False
	for voisin in G:
		if voisin not in G:
			cycle = cyclicRec(G, voisin, voisin, Visite)
			
	return cycle
	
def isArbre(G):
	return False
	
def plusCourtChemin(G, i):
	Dist = dict()
	Pere = dict()
	return (Dist, Pere)

#              _            _    __      
#             (_)          | |  /_/      
#    ___  _ __ _  ___ _ __ | |_ ___  ___ 
#   / _ \| '__| |/ _ \ '_ \| __/ _ \/ __|
#  ( (_) | |  | |  __/ | | | ||  __/\__ \
#   \___/|_|  |_|\___|_| |_|\__\___||___/
#                                                         
def cyclicRecOriente(G, i, Visite):
	return False

def isCyclicOriente(G):
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


