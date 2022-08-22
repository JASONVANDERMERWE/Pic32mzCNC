#include "Timers.h"

void (*Clock)();
struct Timer TMR;

static unsigned int ms100, ms300, ms500, ms800, sec1, sec1_5, sec2;

 /////////////////////////////////////////////////////////////////
//TMR 1 setup for 1us pusles as a dummy axis for single puls to
//keep the seep equivilant to Bres algo dual axis.
void InitTimer1(){
  Clock = ClockPulse;
  T1CON         = 0x8010;
  T1IP0_bit     = 1;
  T1IP1_bit     = 1;
  T1IP2_bit     = 0;
  T1IS0_bit     = 1;
  T1IS1_bit     = 0;
  T1IF_bit      = 0;
  T1IE_bit      = 1;
  PR1           = 62500;
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
  Clock();
}

//////////////////////////////////////////
// TMR 8 interrupts
void Timer8Interrupt() iv IVT_TIMER_8 ilevel 3 ics ICS_SRS {
//Enter your code here
//oneShot to start the steppers runnin
  T8IF_bit  = 0;
}

//////////////////////////////////////////
//Do Clock pulses
void ClockPulse(){
 ms100++;
 ms300++;
 ms500++;
 sec1++;

   TMR.clock.B0 = !TMR.clock.B0;
   if(ms100 > 9){
      ms100 = 0;
      TMR.clock.B1 = !TMR.clock.B1;
   }
   if(ms300 > 29){
      ms300 = 0;
      TMR.clock.B2 = !TMR.clock.B2;
   }
   if(ms500 > 49){
      ms500 = 0;
      TMR.clock.B3 = !TMR.clock.B3;
   }
   if(sec1 > 99){
      sec1 = 0;
      TMR.clock.B4 = !TMR.clock.B4;
   }

}