#!/usr/bin/env python3

import unittest
from tp1_partie1_correction import nbSommets

def profRec(G, i, Visite, ordreVisite):
	pass

def profond(G, i):
	ordreVisite = []
	return ordreVisite

def profondG(G):
	ordreVisite = []
	return ordreVisite

# _______        _         _    _       _ _        _               
#|__   __|      | |       | |  | |     (_) |      (_)              
#   | | ___  ___| |_ ___  | |  | |_ __  _| |_ __ _ _ _ __ ___  ___ 
#   | |/ _ \/ __| __/ __| | |  | | '_ \| | __/ _` | | '__/ _ \/ __|
#   | |  __/\__ \ |_\__ \ | |__| | | | | | || (_| | | | |  __/\__ \
#   |_|\___||___/\__|___/  \____/|_| |_|_|\__\__,_|_|_|  \___||___/
#                                                             
class GrapheTest(unittest.TestCase):

	def setUp(self):
		self.G1 = { 1: [5], 2:[1, 4], 3:[2], 4:[3], 5:[2,4] }
		self.G2 = { 1: [5], 2:[1,4,5], 3:[2,4], 4:[], 5:[4] }
		self.G3 = { 1: [3,5,6], 2:[1], 3:[2,4], 4:[], 5:[], 6:[4] }
		self.G4 = { 1: [4,6], 2:[3], 3:[], 4:[5,6], 5:[1], 6:[] }
		self.Petersen = {
			1: [2,5,6],
			2: [1,3,7],
			3: [2,4,8],
			4: [3,5,9],
			5: [1,4,10],
			6: [1,8,9],
			7: [2,9,10],
			8: [3,6,10],
			9: [4,6,7],
			10: [5,7,8]
		}
	
	def testProfondeurOrienteG1(self):
		for k, v in {
			1: [1,5,2,4,3],
			2: [2,1,5,4,3],
			3: [3,2,1,5,4],
			4: [4,3,2,1,5],
			5: [5,2,1,4,3]
		}.items():
			self.assertEqual(profond(self.G1, k), v)

	def testProfondeurOrienteG234(self):
		self.assertEqual(profond(self.G2, 3), [3,2,1,5,4])
		self.assertEqual(profond(self.G2, 5), [5,4])
		self.assertEqual(profond(self.G3, 4), [4])
		self.assertEqual(profond(self.G3, 6), [6,4])
		self.assertEqual(profond(self.G4, 1), [1,4,5,6])
		self.assertEqual(profond(self.G4, 2), [2,3])
		
	def testProfondeurNonOriente(self):
		self.assertEqual(profond(self.Petersen, 1), [1,2,3,4,5,10,7,9,6,8])
		self.assertEqual(profond(self.Petersen, 2), [2,1,5,4,3,8,6,9,7,10])

	def testProfondeurGeneraliseOriente(self):
		self.assertEqual(profondG(self.G1), [1, 5, 2, 4, 3])
		self.assertEqual(profondG(self.G2), [1, 5, 4, 2, 3])
		self.assertEqual(profondG(self.G3), [1, 3, 2, 4, 5, 6])
		self.assertEqual(profondG(self.G4), [1, 4, 5, 6, 2, 3])
		
	def testProfondeurGeneraliseNonOriente(self):
		self.assertEqual(profondG(self.Petersen), [1, 2, 3, 4, 5, 10, 7, 9, 6, 8])

if __name__ == '__main__':
    unittest.main()
