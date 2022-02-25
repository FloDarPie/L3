/**
*/
#include "MeAuriga.h"

MeLightSensor capteur_1(12);
MeLightSensor capteur_2(11);

//setup afficheur 7 segments
uint8_t    TempDisp[] = { 0x00, 0x00, 0x00, 0x00 };

Me7SegmentDisplay disp(PORT_8);

void setup()
{
  // initialisation de la liaison série}
  Serial.begin(9600);
  disp.set();
  disp.init();
}
void loop()
{
  // on fait l'acquisition de la quantité de lumière reçue sur le capteur 1
  int lum_1 = capteur_1.read(); 
  int lum_2 = capteur_2.read();  

  Serial.print("La valeur du capteur 1 est de ");

  Serial.println(lum_1);
  Serial.print("La valeur du capteur 2 est de ");
  Serial.println(lum_2);

  int moy = (lum_1 + lum_2) / 2;
  Serial.println(moy);
  Serial.println(moy/10 % 10);
  Serial.println(moy%10);
  Serial.println(moy%100);

  TempDisp[0] = moy / 1000;
  TempDisp[1] = moy / 100;
  TempDisp[2] = moy % 10 ;
  TempDisp[3] = moy % 100;
  

  disp.display(TempDisp);
  
  delay(1000);
}
