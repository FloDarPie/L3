/*Bluetooth_Makeblock est un programme qui, grâce à un module "Me Bluetooth", échange des données (chaine de caractères)
  entre une application Android et une carte "Me Orion" ou "Me Auriga".*/

#include "MeAuriga.h"                                             
#include <Wire.h>                                             
#include <SoftwareSerial.h>

MeBluetooth bluetooth(PORT_7);                         

unsigned char tableau[128] = {0};
int indata = 0;
int i = 0;
int count = 0;
char outDat;

void setup()
{
  // initialisation de la liaison série (moniteur)
  Serial.begin(115200);
  // initialisation de la liaison série (bluetooth)
  bluetooth.begin(115200);
  Serial.println("Veuillez connecter la carte en cliquant sur le logo Bluetooth");


}

void loop()
{
  // si des données sont présentes sur la liaison Bluetooth (de l'application vers le module Bluetooth)
  if (bluetooth.available())
  {
    // tant que des données sont présentes
    while ((indata = bluetooth.read()) != (int) - 1)
    {
      // on les stocke dans le tableau
      tableau[count] = indata;
      count++;
      delay(1);
    }

    // boucle pour écrire les données dans le moniteur série
    for (i = 0; i < count; i++)
    {
      // si le caractère n'est pas "retour chariot"
      if (tableau[i] != char(13))
      {
        // on écrit les caractères
        Serial.write(tableau[i]);
      }
      else
      {
        // sinon on va à la ligne pour écrire la prochaine de caractères
        Serial.println();
      }
    }
  }

  // si des données sont présentes sur la liaison série (du module Bluetooth vers l'application)
  if (Serial.available() )
  {
    outDat = Serial.read();
    Serial.print(outDat);
    // on les lit et on les renvoie sur la liaison Bluetooth
    bluetooth.write(outDat);
  }
}
