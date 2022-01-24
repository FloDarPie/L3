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

