/**
   \par Copyright (C), 2012-2016, MakeBlock
   @file    TimeDisplay.ino
   @author  MakeBlock
   @version V1.0.1
   @date    2015/09/11
   @brief   Description: this file is sample code for Seven-Segment LED device.
            It acts as a timer.
   Function List:
      1. void Me7SegmentDisplay::init(void)
      2. void Me7SegmentDisplay::set(uint8_t = BRIGHT_2, uint8_t = ADDR_AUTO, \
                                        uint8_t = STARTADDR)
      3. void Me7SegmentDisplay::display(uint8_t DispData[]);

   \par History:
   <pre>
   `<Author>`         `<Time>`        `<Version>`        `<Descr>`
   Mark Yan         2015/07/24     1.0.0            Rebuild the old lib.
   Rafael Lee       2015/09/11     1.0.1            Added some comments and macros.
   </pre>
*/

#include "MeAuriga.h"

uint8_t		TimeDisp[] = { 0x00, 0x00, 0x00, 0x00 };

Me7SegmentDisplay disp(PORT_8);

void setup()
{
  disp.set();
  disp.init();
}

void loop()
{
  long lastTime = millis();
  uint8_t seconds = (lastTime / 1000) % 60;
  uint8_t minutes = (lastTime / 1000) / 60;
  TimeDisp[0] = minutes / 10;
  TimeDisp[1] = minutes % 10;
  TimeDisp[2] = seconds / 10;
  TimeDisp[3] = seconds % 10;
  
  disp.display(TimeDisp);
}
