/**
*/
#include "MeAuriga.h"

MeLightSensor capteur_1(12);
MeLightSensor capteur_2(11);

void setup()
{
  // initialisation de la liaison série}
  Serial.begin(9600);
}
void loop()
{
  int lum_1 = capteur_1.read();                                                              // on fait l'acquisition de la quantité de lumière reçue sur le capteur 1
  int lum_2 = capteur_2.read();  

  Serial.print("La valeur du capteur 1 est de ");
  Serial.println(lum_1);
  Serial.print("La valeur du capteur 2 est de ");
  Serial.println(lum_2);
  
  delay(1000);
}
