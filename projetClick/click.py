#touche "4" et "6" du clavier portable

import pyautogui as py
import time as t
import tkinter as tk
import tkinter.font as font

'''
while True:
    print("\npressage de touche")
    t.sleep(1)
    py.press([touche1])
    t.sleep(0.5)
    py.press([touche2])
''' 

class Affichage:
    def __init__(self,root=None):

        self.root = root
        
        self.couleur = ["green","pink","red","orange","yellow","blue","purple"]

        self.touche1 = '4'
        self.touche2 = '6'


        #police pour le boutons
        self.font = "Arial 25 roman"

        #prendre les infos de la fenêtre
        self.ecranLargeur = 500
        self.ecranHauteur = 900
        
        ######################################################################################
        ##################### LISTE DES POSITIONS DES ELEMENTS ###############################

        self.positionX_info = self.ecranHauteur//2
        self.positionY_info = self.ecranLargeur//2
       
        ######################################################################################
        
        self.root.bind("<Escape>",self.quitterEchap)
        self.root.title("Mon clickeur")
        
        self.canvas=tk.Canvas(root,width=self.ecranLargeur,height=self.ecranHauteur,borderwidth=0,background="white")
        
        self.root.geometry()
        
        #affichage respectif
        self.afficheAutre()
        self.canvas.bind("<Button-1>",self.clic)
        
     
    def clic(self):
        print("salut")

    
    def afficheAutre(self):
        self.info = self.canvas.create_text(self.positionX_info, self.positionY_info, text="Salut", font="Arial 14 roman")        
        #self.boutonW = tk.Button(self.canvas,text="West",width=20,background="white").pack(side="left")
                    
    def quitterEchap(self,event):
        self.quitter()
    def quitter(self):
        self.root.destroy()
