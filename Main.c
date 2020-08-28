#include "Config.h"
#include "built_in.h"
#include "I2C_LCD.h"
#include "Stepper.h"
#include "Steptodistance.h"

char txt[] = "Start......";
char rxBuf[] ={0,0,0,0,0,0,0,0,0,0,0,0}  absolute 0xA0002000 ; //resides in flash ??
char txBuf[] ={0,0,0,0,0,0,0,0,0,0,0,0}  absolute 0xA0002200 ;

char DMA_Buff[200];
short dma0int_flag;
short dma1int_flag;
bit testISR;
bit oneShotA; sfr;
bit oneShotB; sfr;
char uart_rd;
struct Timer TMR;
unsigned char LCD_01_ADDRESS = 0x4E; //PCF8574T
//////////////////////////////////////////
// temp vars
unsigned int ii;
unsigned long testOcr;
static unsigned int a;
void Timer6Interrupt() iv IVT_TIMER_6 ilevel 7 ics ICS_SRS {
volatile int ii;

   //Enter your code here
  if(SV.Tog == 0){
   for(ii = 0; ii < NoOfAxis;ii++){
     STPS[ii].PLS_Step_     = 0;
     if(ii > NoOfAxis)break;
         if(ii == X)PLS_StepX   = 0;
         if(ii == Y)PLS_StepY   = 0;
     }
  }
   T6IE_bit      = 0;
}
//////////////////////////////////////////
// TMR 7 interrupts at 1ms
void Timer7Interrupt() iv IVT_TIMER_7 ilevel 4 ics ICS_SRS{
  T7IF_bit  = 0;
  //Enter your code here
    TMR.mSec++;
    if(TMR.mSec > 999){
       LATA9_bit = !LATA9_bit;
       TMR.mSec = 0;
       TMR.Sec++;
       if(TMR.Sec > 59){
         TMR.Sec = 0;
       }
    }
}
//////////////////////////////////////////
// TMR 8 interrupts
void Timer8Interrupt() iv IVT_TIMER_8 ilevel 4 ics ICS_SRS {
//Enter your code here
//oneShot to start the steppers runnin
  if(oneShotA){
     CycleStart();
  }else{
     CycleStop();
  }
  T8IF_bit  = 0;
}


////////////////////////////////////////
//UART 2 interrupts
void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 7 ics ICS_AUTO {
     uart_rd = UART2_Read();
     UART2_Write( uart_rd );
   //  IFS4.B18 = 0;
     U2RXIF_bit = 0;            // Ensure interrupt is not pending
}

////////////////////////////////////////
//DMA IRQ
void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO {
 char A[6];
 int i,ptr;
    if (CHBCIF_bit == 1) {         // Channel Block Transfer has Completed Interrupt Flag bit
     i = 0;

/* ECHO EXAMPLE */
      i = strlen(rxBuf);
      dma0int_flag = 1;          // user flag to inform this int was triggered. should be cleared in software
      memcpy(txBuf, rxBuf, i);   // copy RxBuf -> TxBuf  BUFFER_LENGTH
      CHEN_DCH1CON_bit = 1;     // Enable the DMA1 channel to transmit back what was received
    }
    DCH1SSIZ            = i ;
   //  DCH1CSIZ            = i*2 ;
/* Channel Address Error Interrupt Flag bit  */
    if( CHERIF_bit == 1){                     // clear channel error int flag
       CHERIF_bit = 0;
       memcpy(txBuf,"CHERIF Error",13);
    }
    DCH0INTCLR          = 0x00FF;             // clear DMA 0 int flags
/* re-enable DMA 0 int */

    CHEN_bit            = 1 ;                 // Enable channel - may want to do this when you are ready to receive...

    CFORCE_DCH1ECON_bit = 1 ;                 // force DMA1 interrupt trigger
    DMA0IF_bit          = 0 ;                 // clear DMA0 int flag

}


void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_AUTO {
int ptr = 0;
char ptrAdd[6];
/* Channel Block Transfer Complete Interrupt Flag bit */
    if (CHBCIF_DCH1INT_bit == 1){
       CHBCIF_DCH1INT_bit = 0;             // clear flag
    }
/* Channel Address Error Interrupt Flag bit */
    if( CHERIF_DCH1INT_bit == 1){
       CHERIF_DCH1INT_bit = 0;

    }

    dma1int_flag = 1;                          // user flag to inform this int was triggered. should be cleared in software
    DCH1INTCLR   = 0x00FF;                     // clear event flags
    DMA1IF_bit   = 0 ;

}

//////////////////////////////////////////////////////////////
//output compare 3 pin RF1 interrupt
void StepX() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {

     STmr.compOCxRunning = 2;
     TMR4 =  0xFFFF;
     OC3IF_bit = 0;
   //  OC3CON    =  0x8004; //restart the output compare module
}
void StepY() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {

     STmr.compOCxRunning = 1;
     TMR2 =  0xFFFF;
     OC5IF_bit = 0;
    // OC5CON    =  0x8004; //restart the output compare module
}
/////////////////////////////////////////
//main function
void main() {
unsigned char j;

  PinMode();
  SetPinMode();
  StepperConstants(4500,4500);
  EnableInterrupts();
  oneShotA = 0;
  I2C_LCD_Out(LCD_01_ADDRESS,1,4,txt);
  while(1){
  
         if((!RC3_bit)&&(!oneShotA)){

               oneShotA     = 1;
              // T8IE_bit     = 1;
               SV.px = 0;
               SV.py = 0;
               EnStepper();
               a = 2;

         }
         if(oneShotA){
                switch(a){
                     case 0:
                             STPS[X].mmToTravel = calcSteps(-25.25,8.06);
                             speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
                             STPS[Y].mmToTravel = calcSteps(125.25,8.06);
                             speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
                             T8IE_bit         = 1;
                             Step(STPS[X].mmToTravel, STPS[Y].mmToTravel);
                             a = 1;
                             SV.Tog = 1;
                          break;
                    case 1:
                             SV.px = 0;
                             SV.py = 0;
                             if(SV.Tog == 1)a=2;
                          break;
                    case 2:
                             STPS[X].mmToTravel = calcSteps(151.25,8.06);
                             speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
                             STPS[Y].mmToTravel = calcSteps(-25.25,8.06);
                             speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
                             T8IE_bit         = 1;
                             Step(STPS[X].mmToTravel, STPS[Y].mmToTravel);
                             a = 3;
                             SV.Tog = 1;
                          break;
                    case 3: 
                             SV.px = 0;
                             SV.py = 0;
                             if(SV.Tog == 1) a = 0;
                          break;
                    default: a = 2;
                          break;
                }
         }
         if((!RB0_bit)&&(Toggle))oneShotA = 0;
         if(!oneShotA){
            DisableStepper();
         }
         
         if(!RB0_bit){
           oneShotB       = 0;
           oneShotA       = 0;
                 STPS[X].mmToTravel = calcSteps(151.25,8.06);
                 speed_cntr_Move(STPS[X].mmToTravel, 2500,X);
                 STPS[Y].mmToTravel = calcSteps(-151.25,8.06);
                 speed_cntr_Move(STPS[Y].mmToTravel, 2500,Y);

               //line 1
               // Find out after how many Steps before we must start dmeceleration.
               sprintf(txt,"%d",STPS[0].accel_lim);
               I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
               // Find step to start decleration.
               sprintf(txt,"%d",STPS[0].decel_start);
               I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);

               //Line 2
               // Set accelration/speed/deccelration  by  step delay .
               sprintf(txt,"%d",STPS[0].step_delay);
               I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
               // Set max speed limit, by calc min_delay to use in timer.
               sprintf(txt,"%d",STPS[0].min_delay);
               I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);

               //Line 3
               // Find out after how many steps does the speed hit the max speed limit.
               sprintf(txt,"%d",STPS[0].max_step_lim);
               I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
               // decelrate  value start
               sprintf(txt,"%d",STPS[0].decel_val);
               I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
               
         }

  }
}


/*if(OC3RS > 2000)OC3RS -= 100;
     else{
         OC3RS -= 1;
         if(OC3RS < 350)OC3RS = 350;
     }*/
     

/*if(OC6RS > 2000)OC6RS -= 100;
     else{
         OC6RS -= 1;
         if(OC6RS < 350)OC6RS = 350;
     }*/