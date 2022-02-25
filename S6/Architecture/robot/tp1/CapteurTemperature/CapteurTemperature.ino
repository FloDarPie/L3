/**
 * \par Copyright (C), 2012-2016, MakeBlock
 * @file    MeOnBoardTempTest.ino
 * @author  MakeBlock
 * @version V1.0.0
 * @date    2016/04/01
 * @brief   Description: this file is sample code for On Board Temperature device.
 *
 * Function List:
 *    1. uint16_t MeOnBoardTemp::readAnalog(void);
 *    2. float MeOnBoardTemp::readValue(void)
 *
 * \par History:
 * <pre>
 * <Author>     <Time>        <Version>      <Descr>
 * Mark Yan     2016/04/01    1.0.0          build the new
 * </pre>
 */
#include "MeAuriga.h"


//setup capteurTemperature
MeOnBoardTemp OnBoardTemp(PORT_13);

float temperature = 0;

//setup afficheur 7 segments
uint8_t    TempDisp[] = { 0x00, 0x00, 0x00, 0x00 };

Me7SegmentDisplay disp(PORT_8);

void setup() 
{
  Serial.begin(115200);
  disp.set();
  disp.init();
}

void loop() 
{
  //affichage dans le terminal
  Serial.print("Analog Value is: ");
  Serial.println(OnBoardTemp.readAnalog());
  Serial.print("Temp Value is: ");
  Serial.println(OnBoardTemp.readValue());

  temperature = OnBoardTemp.readValue();
  int partieentiere = (int) temperature;
  int decimal = (int) ((temperature - partieentiere) *100);
Serial.println(partieentiere);
Serial.println(decimal);
  
  TempDisp[0] = partieentiere / 10;
  TempDisp[1] = partieentiere % 10;
  TempDisp[2] = decimal / 10;
  TempDisp[3] = decimal % 10;
  

  disp.display(TempDisp);
  delay(1000);
}
