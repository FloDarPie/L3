# L3 Réseaux  
### Mini-projet de groupe  
# Chat
# --------------------------------------

** 1) **  
En utilisant la commande :  
$ ip -br -c addr  
On peut obtenir l'adresse IP du serveur.

La plage de ports 49152-65535 est réservé à l'usage privé.
Nous avons donc choisis arbitrairement de prendre 55555 (5 cinq) comme port de discussion pour notre application Chat.

En utilisant les ressources du cours et un tutoriel en ligne, on configure sans soucis (sauf problème concernant le réseaux universitaire) un premier chat.

** 2) **  
Après discussion, on a choisi que l'envoi de la chaîne *"bye"* servira à la deconnexion du client côté Serveur et à la fermeture de l'application côté Client.


Les questions 3 et 4 ont été ignorées. On a choisi de d'implémenter directement la possibilité de s'échanger les clés.  
Voici le protocole que l'on utilise :  
> Ouverture du serveur    
> Recuperation de l'adresse IP  
> Mise a jour de l'adresse IP  
> Lancement des Sockets  
> Reception d'un Socket
> envoie d'une clé AES généré par le serveur (clé secrete + InitialVector)  
> Assimilation côté client des informations en fonction des balises initiales pour configurer les AES utilisé par l'AES  
> Lancement du Chat  

** 5) **  
Le cryptage et le decryptage fonctionne. On a commenté les affichages des différents messages pour plus de lisibilité.


--------------------------------------
**Ici s'achève les consignes du projets, voici ce que l'on a apporté**  
Le projet a été amélioré sur ces points :
> Possibilité de recevoir plusieurs Clients  
> Possibilité de communication privés entre deux clients  
> Sécurisation de l'envoie des clés AES par le protocole Diffi-Hellman  
> Construction d'une representation graphique du Chat  


Voici en quoi consiste le protocole Diffi-Hellman:  
/////////////////////////////////////////////////   
1- echange une clePrimaire et une racine clePrimaireRacine  
2- définition d'une cleScreteServeur et cleScreteClient  
toServeur = clePrimaireRacine ^ cleScreteClient  % clePrimaire  
toClient  = clePrimaireRacine ^ cleScreteServeur % clePrimaire  

Serveurkey = toServeur ^ cleScreteServeur % clePrimaire  
Clientkey = toClient ^ cleScreteClient % clePrimaire  
- Ainsi, comme les clés secrètes sont conservés sur les ordinateurs et ne sont pas échangés, il n'est pas possible de déterminer les 'ServeurKey' et 'Clientkey'.   
/////////////////////////////////////////////////   
