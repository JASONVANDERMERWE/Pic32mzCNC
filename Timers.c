#include "Config.h"
#include "built_in.h"
#include "I2C_LCD.h"
#include "Stepper.h"


///////////////////////////////////////////
//TMR 1 as a dummy axis ???
void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_SRS {
  T1IF_bit         = 0;
  //Enter your code here
}

//////////////////////////////////////////
// TMR 8 interrupts
void Timer8Interrupt() iv IVT_TIMER_8 ilevel 4 ics ICS_SRS {
//Enter your code here
//oneShot to start the steppers runnin
  T8IF_bit  = 0;
}