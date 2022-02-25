/**   
*/
#include "MeAuriga.h"

MeSoundSensor son(14); // création de l'objet son

#define AURIGARINGLEDNUM  12
#define RINGALLLEDS        0


#ifdef MeAuriga_H
// on-board LED ring, at PORT0 (onboard), with 12 LEDs
MeRGBLed led_ring( 0, 12 );
#endif

int num = 1; //numero LED


void setup()
{
  
  // initialisation de la liaison série}
  Serial.begin(9600);
  #ifdef MeAuriga_H
  // 12 LED Ring controller is on Auriga D44/PWM
  led_ring.setpin( 44 );
  #endif
  // on allume toutes les LEDs en blanc
  led_ring.setColor( RINGALLLEDS, 30, 30, 30 ) ;
  led_ring.show();
  delay( 500 );
  led_ring.setColor( RINGALLLEDS, 0, 0, 0 ) ;
}
void loop()
{
  Serial.print("Le son vaut : ");
  Serial.println(son.strength());
  delay(100);
  int force_son = (int) ((son.strength() / 500.0 ) * 12)  ;
    Serial.println(force_son);

  //affichage LED
   for (int i = 1; i< force_son;i++){
    led_ring.setColor( i, (int)((((float) i) / 12.0) *30.0), (int)((((float) 12- i) / 12.0) *30.0), 0 ) ;
  }
    led_ring.show();

   for (int i = 1; i< force_son;i++){
    led_ring.setColor( i, 0, 0, 0 ) ;
  }
    delay(200);
}
