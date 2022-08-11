#include "Timers.h"


struct Timer TMR;

 /////////////////////////////////////////////////////////////////
//TMR 1 setup for 1us pusles as a dummy axis for single puls to
//keep the seep equivilant to Bres algo dual axis.
void InitTimer1(){
  T1CON         = 0x8000;
  T1IP0_bit     = 1;
  T1IP1_bit     = 1;
  T1IP2_bit     = 0;
  T1IS0_bit     = 1;
  T1IS1_bit     = 0;
  T1IF_bit      = 0;
  T1IE_bit      = 1;
  PR1           = 100;
  TMR1          = 0;
}


///////////////////////////////////////////////////////////////////
//TMR 8 initialized to interrupt at 1us
void InitTimer8(){
  T8CON            = 0x8000;
  T8IP0_bit        = 3;
  T8IP1_bit        = 1;
  T8IP2_bit        = 0;
  T8IS0_bit        = 0;
  T8IS1_bit        = 1;
  T8IF_bit         = 0;
  T8IE_bit         = 0;
  PR8              = 50;
  TMR8             = 0;
}


///////////////////////////////////////////
//TMR 1 as a dummy axis ???
void Timer1Interrupt() iv IVT_TIMER_1 ilevel 3 ics ICS_SRS {
  T1IF_bit  = 0;
  //Enter your code here
}

//////////////////////////////////////////
// TMR 8 interrupts
void Timer8Interrupt() iv IVT_TIMER_8 ilevel 3 ics ICS_SRS {
//Enter your code here
//oneShot to start the steppers runnin
  T8IF_bit  = 0;
}