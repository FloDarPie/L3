from requests import *
from scrapy import Selector

# Lien de la page à scraper
url = "https://fr.wikipedia.org/wiki/Star_Wars"

response = get(url)
source = None # Le code source de la page 

if response.status_code == 200 :
    # Si la requete s'est bien passee
    source = response.text
    
if source :
    # Si le code source existe
    selector = Selector(text=source)
    titles = selector.css("div.toc ul > li")
    for title in titles:
        level = title.css("span.tocnumber::text").extract_first()
        name = title.css("span.toctext::text").extract_first()
        print(level + " " + name)    

url2 = "https://adecampus.univ-jfc.fr/direct/index.jsp?data=02427bf08a4e3905df54e3828781966417a0456235d61df4705fb52a51c95d7ffb650adbf17b96d5d97cc32ac608bd13facd4837bfc6fce1bd5d96a07a04824c5823238300f7365f22d90e079254e14d6a818c4c1a069cb98a008d7020f28ba25b66babf80b753289969c1b1e23d701d8a96fc2bd08f9dcf79c796321f919fe8bce01058236ed18878168cf46b2a937d2d2d5b9bb5b4cfc3e41a0fb5035c09561ec7656b708e82cc6634e50913e2a166074e24568258ccc0a0cbc04889b0dae1,1"

response = get(url2)
print("response\n",response)
source = None # Le code source de la page 

if response.status_code == 200 :
    # Si la requete s'est bien passee
    source = response.text
    print(source)
'''
if source :
    # Si le code source existe
    selector = Selector(text=source)
    titles = selector.css("div.toc ul > li")
    for title in titles:
        level = title.css("span.tocnumber::text").extract_first()
        name = title.css("span.toctext::text").extract_first()
        print(level + " " + name)    '''
