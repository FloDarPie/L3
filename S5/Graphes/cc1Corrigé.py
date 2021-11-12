
# coding: utf-8
from vect import *
# # Partie 1 : Sur les arborescences
# 
# On considère une forêt d'arborescence donnée par son tableau des pères
# 
# 1) Ecrire une fonction de conversion tableau des pères -> liste d'adjacences

def tabPereToListe(P) :
    n = len(P)
    G = initVectList(n)
    for i in range(0,n) :
        if i != P[i] :
            G[P[i]].append(i)
    return G



####Test : 
P = [0,1,1,2,2,5,5,5,6,6,9,9]
G = tabPereToListe(P)
print("Le tableau des pères : " , P)
print()
print("Sa représentation par liste d'adjacences : ")
print(G)



# 2) Ecrire une fonction ancêtres qui détermine les ancêtres d'un sommet y dans l'arbre


def ancetres(y,P):
    anc=[]
    j=y;
    while P[j]!=j:
        j=P[j]
        anc.append(j)
    return anc


####Test : 
print("Les ancêtres du sommet 9 sont : " , ancetres(9,P))
print("Ceux du sommet 11 sont : ", ancetres(11,P))
print("Ceux de 4 sont : ", ancetres(4,P))
print("Ceux de 1 sont : ", ancetres(1,P))
print("Ceux de 2 sont :", ancetres(2,P))


# 3) Ecrire une fonction ancetre(x,y,G) valant vrai si x est un ancetre de y
def ancetre(x,y,P):
    anc=[]
    j=y;
    while P[j]!=j:
        j=P[j]
        if j==x:
            return True
    return False


####Test : 
print(" 1 est-il ancêtre de  4 ?" , ancetre(1,4,P))
print("1 est-il ancêtre de  5 ?" , ancetre(1,5,P))
print("6 est-il ancêtre de  11 ?", ancetre(6,11,P))


################
# Partie 2 - Parcours en profondeur
#

# 1) Ecrire le parcours en profondeur généralisé
# La fonction doit renvoyer le tableau des pères de la forêt de parcours. 



def profRec(G,i,Visite,Pere) :
    # Nouveauté : le vecteur Pere remplace l'ordre de parcours
    print("Début du parcours du sommet ",i)
    Visite[i] = 1    
    #print("Etat du vecteur de visite ", Visite)

    for j in G[i] :
        if Visite[j]==0 :
            #print("Appel récursif ", j)
            Pere[j] = i # Mise à jour du vecteur Pere
            profRec(G,j,Visite,Pere)
        else :
            print("Revisite du sommet ",j)
    print("Fin du parcours de ", i)


def profondG(G):
    Visite = initVect(len(G),0)
    Pere =initVect(len(G),0) # Nouveauté 


    for i in range(1,len(G)) :
        if Visite[i]==0 :
            Pere[i] = i     # Nouveauté
            profRec(G,i,Visite,Pere)
    return Pere      # Nouveauté


# Test sur le graphe G
G = [[],[2],[3,4],[1],[2],[6,7,8,9],[4,8,9],[9,10],[],[8,10,11],[5],[]] 
P = profondG(G)
print()
print("La forêt de parcours est donnée par le tableau des pères : " , P)

################
# Partie 3 - Parcours en profondeur et classification des arcs
# 

# On travaille par dadaptations successives des fonctions de parcours
# On fournit dans ce corrigé les trois étapes :

# 1) arcs couvrants vs revisites
def profRec1(G,i,Visite,Pere) :
    Visite[i] = 1    

    for j in G[i] :
        if Visite[j]==0 :
            print("Arc couvrant : ",i," -> ", j)
            Pere[j] = i # Mise à jour du vecteur Pere
            profRec1(G,j,Visite,Pere)
        else :
            print("Revisite du sommet ",j)


def profondG1(G):
    Visite = initVect(len(G),0)
    Pere =initVect(len(G),0) 
    for i in range(1,len(G)) :
        if Visite[i]==0 :
            Pere[i] = i     # Nouveauté
            profRec1(G,i,Visite,Pere)
    return Pere      # Nouveauté

# Test sur le graphe G
print()
print("Recherche des arcs couvrants :  ")
P = profondG1(G)


# 2) détection des arcs arrières
# On détecte un arc arrière si le parcours est commencé mais pas terminé
# On utilise Visite = 0 si le parcours n'est pas commencé
#                   = 1 s'il est commencé mais pas terminé
#                   = 2 s'il est terminé

def profRec2(G,i,Visite,Pere) :
    Visite[i] = 1    

    for j in G[i] :
        if Visite[j]==0 :
            print("Arc couvrant : ",i," -> ", j)
            Pere[j] = i # Mise à jour du vecteur Pere
            profRec2(G,j,Visite,Pere)
        else :
            print("Revisite du sommet ",j)
            if Visite[j]==1 : # le parcours n'est pas terminé
                print("Arc arrière : ",i," -> ", j)
    # Fin du parcours de i
    Visite[i] = 2

def profondG2(G):
    Visite = initVect(len(G),0)
    Pere =initVect(len(G),0) 
    for i in range(1,len(G)) :
        if Visite[i]==0 :
            Pere[i] = i     # Nouveauté
            profRec2(G,i,Visite,Pere)
    return Pere      # Nouveauté

# Test sur le graphe G
print()
print("Recherche des arcs couvrants et arrière:  ")
P = profondG2(G)


# 3) détection des arcs avant
# On détecte un arc avant si on revisite un sommet qui est un de nos descendant
# dans la forêt de visite
def profRec3(G,i,Visite,Pere) :
    Visite[i] = 1    

    for j in G[i] :
        if Visite[j]==0 :
            print("Arc couvrant : ",i," -> ", j)
            Pere[j] = i # Mise à jour du vecteur Pere
            profRec3(G,j,Visite,Pere)
        elif Visite[j]==1 : # le parcours n'est pas terminé
            print("Arc arrière : ",i," -> ", j)
        elif ancetre(i,j,Pere): # j est un descendant dans la forêt de parcours
            print("Arc avant : ",i," -> ", j)
        else :
            print("Arc transverse : ",i," -> ", j)
    # Fin du parcours de i
    Visite[i] = 2

def profondG3(G):
    Visite = initVect(len(G),0)
    Pere =initVect(len(G),0) 
    for i in range(1,len(G)) :
        if Visite[i]==0 :
            Pere[i] = i     # Nouveauté
            profRec3(G,i,Visite,Pere)
    return Pere      # Nouveauté

# Test sur le graphe G
print()
print("Classification complète des arcs :  ")
P = profondG3(G)

