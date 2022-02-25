/**
 * \par Copyright (C), 2012-2016, MakeBlock
 * @file    GyroRotation.ino
 * @author  MakeBlock
 * @version V1.0.0
 * @date    2015/09/09
 * @brief   Description: this file is sample code for MeGyro device.
 *
 * Function List:
 * 1. void MeGyro::begin(void)
 * 2. void MeGyro::update(void) 
 * 3. double MeGyro::angleX(void)
 * 4. double MeGyro::angleY(void)
 * 5. double MeGyro::angleZ(void)
 *
 * \par History:
 * <pre>
 * <Author>     <Time>        <Version>      <Descr>
 * Mark Yan     2015/09/09    1.0.0          rebuild the old lib
 * </pre>
 *
 */
#include "MeAuriga.h"
uint8_t    TimeDisp[] = { 0x00, 0x00, 0x00, 0x00 };

Me7SegmentDisplay disp(PORT_8);

#include <Wire.h>
MeGyro gyro(1,0x69); 
//MeGyro gyro;


#define AURIGARINGLEDNUM  12
#define RINGALLLEDS        0


#ifdef MeAuriga_H
// on-board LED ring, at PORT0 (onboard), with 12 LEDs
MeRGBLed led_ring( 0, 12 );
#endif

int num = 1;


void setup()
{
  Serial.begin(9600);
  gyro.begin();

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
  gyro.update();
  Serial.read();
  Serial.print("X:");
  Serial.print(gyro.getAngleX() );
  Serial.print(" Y:");
  Serial.print(gyro.getAngleY() );
  Serial.print(" Z:");
  Serial.println(gyro.getAngleZ() );
  
  int var = (int)gyro.getAngleZ();

  if(var > 0){
    TimeDisp[0] = 0;
  } else {
    TimeDisp[0] = 1;
    var *= -1;
  }
  TimeDisp[1] = var / 100 ;
  TimeDisp[2] = var % 99 /10 ;
  TimeDisp[3] = var % 9 ;

  disp.display(TimeDisp);
  delay(100);
}
