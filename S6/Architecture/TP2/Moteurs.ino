/**
   Function List:
      1. uint8_t MeEncoderOnBoard::getPortB(void);
      2. uint8_t MeEncoderOnBoard::getIntNum(void);
      3. void MeEncoderOnBoard::pulsePosPlus(void);
      4. void MeEncoderOnBoard::pulsePosMinus(void);
      5. void MeEncoderOnBoard::setMotorPwm(int pwm);
      6. double MeEncoderOnBoard::getCurrentSpeed(void);
      7. void MeEncoderOnBoard::updateSpeed(void);
*/

#include <MeAuriga.h>
#include <Wire.h>
#include <SoftwareSerial.h>

MeEncoderOnBoard Encoder_1(SLOT1);
MeEncoderOnBoard Encoder_2(SLOT2);

// vitesse des 2 moteurs
int v1 = -100;
int v2 = 100;

void setup()
{
  //Set PWM 8KHz
  TCCR1A = _BV(WGM10);
  TCCR1B = _BV(CS11) | _BV(WGM12);

  TCCR2A = _BV(WGM21) | _BV(WGM20);
  TCCR2B = _BV(CS21);

  delay(500);  
  Encoder_1.setMotorPwm(v1);
  Encoder_2.setMotorPwm(v2);
  delay(500);
  Encoder_1.setMotorPwm(0);
  Encoder_2.setMotorPwm(0);
  
}

void loop()
{

}
