
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
  led_ring.setColor( RINGALLLEDS, 30, 30, 30 ) ;
  led_ring.show();
  delay( 500 );
  led_ring.setColor( RINGALLLEDS, 0, 0, 0 ) ;

}

void loop()
{
  // on allume une LED
  
  for (int i = 1; i< 13;i++){
    if (num == 1){
      num = 13;
    }
    num--;;
    led_ring.setColor( i, 30, 0, 0 ) ;
    led_ring.setColor( num, 0, 0, 30 ) ;
    led_ring.show();
    delay(200);
    led_ring.setColor( i, 0, 0, 0 );
    led_ring.setColor( num, 0, 0, 0 );
    led_ring.show();
  }


}
