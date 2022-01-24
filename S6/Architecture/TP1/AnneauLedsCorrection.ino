
/**
   Test anneau de LEDs

*/

#include <MeAuriga.h>

#define AURIGARINGLEDNUM  12
#define RINGALLLEDS        0


#ifdef MeAuriga_H
// on-board LED ring, at PORT0 (onboard), with 12 LEDs
MeRGBLed led_ring( 0, 12 );
#endif

int num = 1;

void setup()
{
  Serial.begin( 9600 );

#ifdef MeAuriga_H
  // 12 LED Ring controller is on Auriga D44/PWM
  led_ring.setpin( 44 );
#endif
  // on allume toutes les LEDs en blanc
  led_ring.setColor( RINGALLLEDS, 255, 255, 255 ) ;
  led_ring.show();
  delay( 500 );
  led_ring.setColor( RINGALLLEDS, 0, 0, 0 ) ;

}

void loop()
{
  // on étteint la LED courante
  led_ring.setColor( num, 0, 0, 0 ) ;
  led_ring.setColor( 13-num, 0, 0, 0 ) ;
  led_ring.show();
  
  //on passe à la suivante
  num = (num + 1);
  if (num==13)
  num=1;
  
  // on allume la nouvelle LED
  led_ring.setColor( num, 30, 0, 0 ) ;
  led_ring.setColor( 13-num, 0, 30, 0 ) ;
  led_ring.show();
  delay( 500 );


}