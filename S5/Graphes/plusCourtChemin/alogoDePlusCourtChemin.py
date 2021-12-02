import unittest

def dijkstra(Garete,Gpoids):
    arbreCollecteur = {}
    M = 


class GrapheTest(unittest.TestCase):

	def setUp(self):
		#self.ListAretes=[[1,2,7],[1,5,6],[1,6,2],[2,3,4],[2,5,5],[3,4,1],[3,5,2],[4,5,3],[5,6,1]]
        self.Garete = {1:[2,3,5],2:[1],3:[2,5],4:[3,5],5:[2,6],6:[1,2]}
        self.Gpoids = {(1,2) : 0, (1,3) : 3, (1,5) : 6, (2,1) : 0, (3,2) : 4, (3,5) : 2, (4,3) : 1, (4,5) : 3, (5,2) : 0, (5,6) : 1, (6,1) : 2, (6,2) : 1}

    def testDijkstra(self):
        self.assertEqual(dijkstra,{1:[3],3:[5],5:[2,6]})
if __name__ == '__main__':
    unittest.main()
