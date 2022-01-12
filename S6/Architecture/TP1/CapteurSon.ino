/**   
*/
#include "MeAuriga.h"

MeSoundSensor son(14); // création de l'objet son
void setup()
{
  
  // initialisation de la liaison série}
  Serial.begin(9600);
}
void loop()
{
  Serial.print("Le son vaut : ");
  Serial.println(son.strength());
  delay(100);
}
