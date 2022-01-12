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

MeGyro gyro(1, 0x69);

uint8_t    TimeDisp[] = { 0x00, 0x00, 0x00, 0x00 };

Me7SegmentDisplay disp(PORT_8);

// vitesse des 2 moteurs
int vmax = 100;
int v1 = -vmax;
int v2 = vmax;

int arret = 0;

float Zreference;

void setup()
{
  // afficheur 7 segments
  disp.set();
  disp.init();

  //Set PWM 8KHz
  TCCR1A = _BV(WGM10);
  TCCR1B = _BV(CS11) | _BV(WGM12);

  TCCR2A = _BV(WGM21) | _BV(WGM20);
  TCCR2B = _BV(CS21);

  Serial.begin(9600);
  buzzer.setpin(45);
  gyro.begin();
  Zreference = gyro.getAngleZ();


}

void loop()
{
  //delay(150);
  // lecture du gyroscope
  gyro.update();
  float z = gyro.getAngleZ();
  Serial.println(z);
  if (z > Zreference) {
    if (v2 > 0.8 * vmax) {
      v1 -= 1;
      v2 -= 1;
    }
  } else {
    if (v2 < 1.2 * vmax) {
      v1 += 1;
      v2 += 1;
    }

  }

  Serial.print("v1=");
  Serial.println(v1);
  Serial.print("v2=");
  Serial.println(v2);

  double d = ultraSensor.distanceCm();
  if ( d < 20) {
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
  // affichage de V2
  TimeDisp[0] = 0;
  TimeDisp[1] = v2/100;
  TimeDisp[2] = (v2 / 10)%10;
  TimeDisp[3] = v2 % 10;

  disp.display(TimeDisp);
}
