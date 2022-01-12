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

MeUltrasonicSensor ultraSensor(PORT_10); /* Ultrasonic module can ONLY be connected to port 3, 4, 6, 7, 8 of base shield. */

MeBuzzer buzzer;

// vitesse des 2 moteurs
int v1 = -100;
int v2 = 100;

int arret = 0;

void setup()
{
  //Set PWM 8KHz
  TCCR1A = _BV(WGM10);
  TCCR1B = _BV(CS11) | _BV(WGM12);

  TCCR2A = _BV(WGM21) | _BV(WGM20);
  TCCR2B = _BV(CS21);

  Serial.begin(9600);
  buzzer.setpin(45);

}

void loop()
{
  double d = ultraSensor.distanceCm();
  if ( d < 10) {
    Serial.println("obstacle");
    Encoder_1.setMotorPwm(0);
    Encoder_2.setMotorPwm(0);
    if (arret == 0) {
      buzzer.tone(300, 500);
      arret = 1;
    }
    
  } else {
    arret = 0;
    Serial.println("go");

    Encoder_1.setMotorPwm(v1);
    Encoder_2.setMotorPwm(v2);
  }

}
