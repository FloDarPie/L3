#!/usr/bin/env python3

import unittest

#  _____     _   _                    _             _                  
# |_   _| __(_) | |_ ___  _ __   ___ | | ___   __ _(_) __ _ _   _  ___ 
#   | || '__| | | __/ _ \| '_ \ / _ \| |/ _ \ / _` | |/ _` | | | |/ _ \
#   | || |  | | | || (_) | |_) | (_) | | (_) | (_| | | (_| | |_| |  __/
#   |_||_|  |_|  \__\___/| .__/ \___/|_|\___/ \__, |_|\__, |\__,_|\___|
#                        |_|                  |___/      |_|           
def triTopo(M):
	listeOrdonnancement = []
	#source : sommet dont le degré entrant est nul
	#puit : sommet dont le degré sortant est nul

	G = {
		i : 0 for i in M
	}
	degréEntrant = {}
	for sommet in G:
		for voisin in G[sommet]:
			G[voisin]+=1

	return G

	listeSource = [ a for a in G if G[a]==0 ]

	for source in listeSource:



	#return listeOrdonnancement

#  _____     _                            _                            
# |_   _| __(_)  _ __   __ _ _ __   _ __ (_)_   _____  __ _ _   ___  __
#   | || '__| | | '_ \ / _` | '__| | '_ \| \ \ / / _ \/ _` | | | \ \/ /
#   | || |  | | | |_) | (_| | |    | | | | |\ V /  __/ (_| | |_| |>  < 
#   |_||_|  |_| | .__/ \__,_|_|    |_| |_|_| \_/ \___|\__,_|\__,_/_/\_\
#               |_|                                                    
def triNiveaux(G):
	#TODO code ici
	return []
	
# _______        _         _    _       _ _        _               
#|__   __|      | |       | |  | |     (_) |      (_)              
#   | | ___  ___| |_ ___  | |  | |_ __  _| |_ __ _ _ _ __ ___  ___ 
#   | |/ _ \/ __| __/ __| | |  | | '_ \| | __/ _` | | '__/ _ \/ __|
#   | |  __/\__ \ |_\__ \ | |__| | | | | | || (_| | | | |  __/\__ \
#   |_|\___||___/\__|___/  \____/|_| |_|_|\__\__,_|_|_|  \___||___/
#   
class GrapheTest(unittest.TestCase):

	def setUp(self):
		self.simple = {1:[2],2:[3],3:[]}
		self.simple2 = {1:[2,3],2:[],3:[]}
		self.cyclique = {1:[2],2:[3],3:[4],4:[2]}
		self.G = {1:[2,6],2:[3,5,6],3:[4,5],4:[],5:[4],6:[5],7:[2,6]}
		self.G2 = {1:[2,7],2:[6],3:[2,4,5],4:[5],5:[],6:[5,7],7:[]}
	
	def testTriTopo(self):
		self.assertEqual(triTopo(self.simple), [1,2,3])
		self.assertEqual(triTopo(self.G), [1,7,2,3,6,5,4])

	def testTriTopoCyclique(self):
		try:
			triTopo(self.cyclique)
		except RuntimeError:
			return
		except:
			pass
		self.fail('Tentative de tri topologique d\'un graphe cyclique')

	def testTriNiveaux(self):
		self.assertEqual(triNiveaux(self.simple), [{1},{2},{3}])
		self.assertEqual(triNiveaux(self.simple2), [{1},{2,3}])
		self.assertEqual(triNiveaux(self.G), [{1,7},{2},{3,6},{5},{4}])
		self.assertEqual(triNiveaux(self.G2), [{1,3},{2,4},{6},{5,7}])

if __name__ == '__main__':
    unittest.main()
