/**
   \par Copyright (C), 2012-2016, MakeBlock
   @file    UltrasonicSensorTest.ino
   @author  MakeBlock
   @version V1.0.0
   @date    2015/09/01
   @brief   Description: this file is sample code for Me ultrasonic sensor module.

   Function List:
   1. double MeUltrasonicSensor::distanceCm(uint16_t MAXcm)

   \par History:
   <pre>
   <Author>     <Time>        <Version>      <Descr>
   Mark Yan     2015/09/01    1.0.0          rebuild the old lib
   </pre>
*/
#include "MeAuriga.h"

MeBuzzer buzzer;
int val = 300;
void setup()
{
  buzzer.setpin(45);
}

void loop()
{
  val = val + 20;
  // le premier argument est la hauteur du son, le second sa durée en millisecondes
  //buzzer.tone(val, 100);
  delay(1000);
}
