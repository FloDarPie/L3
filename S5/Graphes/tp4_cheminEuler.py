#calcul de tous les degrés
#on compte les degré impair
    #si +2 ou 1 -> fin
    #si 2 ou 0 -> on en prend un pour partir
    
#on va construire un chemin maximal L depuis ce point
    #en retirant les arete au passage
    
#pour tout sommet de L 
    #on va construire un chemin simple maximal
    #inserer à L
    
def euler(G):

    #calcul de tous les degres
    BALISE = [0,0]
    for i in G:
        T = len(G[i])
        if T % 2 == 1:
            BALISE[0] += 1 #on compte les impairs
            BALISE[1] = i #on prend sa position
            pass
    
    #etude de la balise
    if BALISE[0] == 1 or BALISE[0] > 2:
        return [False]
        pass

    else:
        #on lance la recherche
        def retirerArete(G,A,B):
            G[A].remove(B)
            G[B].remove(A)
            pass
        
        #on fixe le point de depart de notre circuit eulerien
        if BALISE[0] == 0:
            DEPART = 1
            pass
        else:
            DEPART = BALISE[1]
            pass

        L = []

        #construction de notre premier chemin maximal
        def circuit(G,DEPART):
            PERE = G[DEPART][0]
            L = [DEPART, PERE]
            retirerArete(G,DEPART,PERE)

            while L[-1] != DEPART:
                FILS = G[PERE][0]
                retirerArete(G,PERE,FILS)
                L.append(FILS)
                PERE = FILS
                pass
            return L,G
            pass

        C = 0

        for SOMMET in G:
            try:
                C += 1
                petiteListe,G = circuit(G,SOMMET)
                POSITION = L.index(SOMMET)
                L = L[:POSITION]+ petiteListe + L[POSITION:]
                pass
            except:
                L = [1]
                pass
                
    return L, C


G = {
    1 : [ 2, 8 ],
    2 : [ 1, 3, 7, 8 ],
    3 : [ 2, 4, 6, 8 ],
    4 : [ 3, 5, 6, 7 ],
    5 : [ 4, 6],
    6 : [ 3, 4, 5, 7 ],
    7 : [ 2, 4, 6, 8 ],
    8 : [ 1, 2, 3, 7 ]
}

print(euler(G))