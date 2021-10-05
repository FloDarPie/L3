#!/usr/bin/env python3

import unittest
#from tp1_partie1_correction import nbSommets

def nbSommets(G):
	return len(G.keys())
#  _                                     
# | |                                    
# | |     __ _ _ __ __ _  ___ _   _ _ __ 
# | |    / _` | '__/ _` |/ _ \ | | | '__|
# | |___| (_| | | | (_| |  __/ |_| | |   
# |______\__,_|_|  \__, |\___|\__,_|_|   
#                   __/ |                
#                  |___/                 
#
'''
def largeur(G, i):
	Visite = {i:True}
	File = [i]
	
	ordreVisite = []
	while File != []:
		
		ordreVisite.append(File[0])

		for sommet in G[File[-1]]:

			if sommet not in Visite:
				Visite[sommet] = True
				File.append(sommet)
				pass
			pass
		
		File=File[1:]
		pass


	return ordreVisite
'''

def largeur(G,i):
	Visite={i:True}
	File=[i]

	ordreVisite=[]

	while File!=[]:
		y = File[0]
		File=File[1:]
		for successeur in G[y]:
			if successeur not in Visite:
				Visite[successeur]=True
				File.append(successeur)
		ordreVisite.append(y)
	return ordreVisite
	
def largeurG(G):
	Visite={1:True}
	File=[1]
	def largeur2(G,i,Visite):
			File=[i]

			ordreVisite=[]

			while File!=[]:
				y = File[0]
				File=File[1:]
				for successeur in G[y]:
					if successeur not in Visite:
						Visite[successeur]=True
						File.append(successeur)
				ordreVisite.append(y)
			return ordreVisite,Visite
		
	ordreVisite=largeur(G,1)
	for k in ordreVisite:
		Visite[k]=True
	X=1
	while len(Visite)!=nbSommets(G):
		print(ordreVisite)
		X+=1
		if X not in Visite:
			a,b=largeur2(G,X,Visite)
			ordreVisite+=a
			Visite=b
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
	
	def testNbSommets(self):
		self.assertEqual(nbSommets(self.G1), 5)
		
	def testLargeurOriente(self):
		for k, v in {
				1: [1,5,2,4,3],
				2: [2,1,4,5,3],
				3: [3,2,1,4,5],
				4: [4,3,2,1,5],
				5: [5,2,4,1,3]
			}.items():
				self.assertEqual(largeur(self.G1, k), v)
		self.assertEqual(largeur(self.G1, 5), [5,2,4,1,3])
		self.assertEqual(largeur(self.G2, 3), [3,2,4,1,5])
		self.assertEqual(largeur(self.G2, 5), [5,4])
		self.assertEqual(largeur(self.G3, 4), [4])
		self.assertEqual(largeur(self.G3, 6), [6,4])
		self.assertEqual(largeur(self.G4, 1), [1,4,6,5])
		self.assertEqual(largeur(self.G4, 2), [2,3])
	'''
	def testLargeurNonOriente(self):
		self.assertEqual(largeur(self.Petersen, 1), [1,2,5,6,3,7,4,10,8,9])
		self.assertEqual(largeur(self.Petersen, 2), [2,1,3,7,5,6,4,8,9,10])
	'''
	def testLargeurGeneraliseOriente(self):
		self.assertEqual(largeurG(self.G1), [1, 5, 2, 4, 3])
		self.assertEqual(largeurG(self.G2), [1, 5, 4, 2, 3])
		self.assertEqual(largeurG(self.G3), [1, 3, 5, 6, 2, 4])
		self.assertEqual(largeurG(self.G4), [1, 4, 6, 5, 2, 3])
		'''
	def testLargeurGeneraliseNonOriente(self):
		self.assertEqual(largeurG(self.Petersen), [1, 2, 5, 6, 3, 7, 4, 10, 8, 9])
'''
		
if __name__ == '__main__':
    unittest.main()

	
