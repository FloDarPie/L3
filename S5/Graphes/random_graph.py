from random import randrange
from copy import deepcopy


def make_graph(N,M):
    NC = 1
    # NMAX=10

    for i in range(NC):
        recherche = True

        #while recherche:
            #edge_mini = N-1
            #edge_maxi = N*(N-1)//2
            #M = randrange(edge_mini, edge_maxi+1)
            #recherche = M == 0

        recherche = True
        #print(N, M)
        edges = set()
        for _ in range(M):
            distinct = False
            while not distinct:
                a = randrange(1, N+1)
                b = randrange(1, N+1)
                t = tuple(sorted([a, b]))
                if a != b and t not in edges:
                    distinct = True
                    #print(a, b)
                    edges.add(t)

    return N, edges


def edges2adj(edges, n):

    G = {i+1:[] for i in range(n)}
    for a, b in edges:
        G[a].append(b)
        G[b].append(a)
    return G




def rdGraph(nmax,M):
    N, edges = make_graph(nmax,M)
    #edges = [(a-1, b-1) for (a, b) in edges]
    text_file = open("Output.txt", "w")
    text_file.write(str(edges2adj(edges, N)))
    text_file.close()
    return edges2adj(edges, N) 

import networkx as nwx
import matplotlib.pyplot as plt

if __name__ == '__main__':
    print(rdGraph(100,3500))

