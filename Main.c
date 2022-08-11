#include "Config.h"


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
//struct Timer TMR;
unsigned char LCD_01_ADDRESS = 0x4E;//7E; //PCF8574T
//////////////////////////////////////////
// temp vars
unsigned int ii;
unsigned long testOcr;
static unsigned int a;

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


/////////////////////////////////////////
//main function
void main() {
unsigned char j;
int xyz_ = 0;
  PinMode();
  SetPinMode();
  StepperConstants(15500,15500);
  EnableInterrupts();
  oneShotA = 0;
  //I2C_LCD_Out(LCD_01_ADDRESS,1,4,txt);
  a=4;
  while(1){

         if(!RB0_bit){
               LATE7_bit = 0;
               Toggle            = 0;
              // T8IE_bit        = 1;
               EnStepperX();
               EnStepperY();
               EnStepperZ();
               //a = 0;

         }

         if((!RC3_bit)&&(!Toggle)){
            Toggle = 1;
           // LATE7_bit = 1;
        /*   STPS[X].mmToTravel = calcSteps(-125.25,8.06);
            speed_cntr_Move(STPS[X].mmToTravel, 20000,X);
            SingleAxisStep(STPS[X].mmToTravel,X);
            
            STPS[Y].mmToTravel = calcSteps(-125.25,8.06);
            speed_cntr_Move(STPS[Y].mmToTravel, 20000,Y);
            SingleAxisStep(STPS[Y].mmToTravel,Y);
          */
            xyz_++;
            if(xyz_ > 2)xyz_ = 0;
            
          /*  STPS[X].mmToTravel = calcSteps(225.25,8.06);
            speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
            STPS[Z].mmToTravel = calcSteps(-25.25,8.06);
            speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
            DualAxisStep(STPS[X].mmToTravel, STPS[Z].mmToTravel,xz);
           */
            Temp_Move(a);
            a++;
            if(a > 5)a=4;
         }
         if(!OC3IE_bit && !OC5IE_bit && !OC8IE_bit){
             Temp_Move(a);
             a++;
             LATE7_bit != LATE7_bit;
         }
            

  }
}

//Temp code for trsting
void Temp_Move(int a){

    switch(a){
         case 0:
                 STPS[Z].mmToTravel = calcSteps(-125.25,8.06);
                 speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
                 SingleAxisStep(STPS[Z].mmToTravel,Z);
              break;
        case 1:
                 STPS[X].mmToTravel = calcSteps(125.25,8.06);
                 speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
                 SingleAxisStep(STPS[X].mmToTravel,X);
              break;
        case 2:
                 STPS[Y].mmToTravel = calcSteps(202.00,8.06);
                 speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
                 SingleAxisStep(STPS[Y].mmToTravel,Y);
              break;
       case 3:
                 STPS[Y].mmToTravel = calcSteps(125.25,8.06);
                 speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
                 STPS[Z].mmToTravel = calcSteps(25.25,8.06);
                 speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
                 DualAxisStep(STPS[Y].mmToTravel, STPS[Z].mmToTravel,yz);
              break;
       case 4:
                 STPS[X].mmToTravel = calcSteps(228.25,8.06);
                 speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
                 STPS[Z].mmToTravel = calcSteps(-25.25,8.06);
                 speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
                 DualAxisStep(STPS[X].mmToTravel, STPS[Z].mmToTravel,xz);
              break;
       case 5:
                 STPS[X].mmToTravel = calcSteps(-228.25,8.06);
                 speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
                 STPS[Y].mmToTravel = calcSteps(25.25,8.06);
                 speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
                 DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
              break;
        default: a = 0;
              break;
    }
}

void LCD_Display(){

     STPS[X].mmToTravel = calcSteps(151.25,8.06);
     speed_cntr_Move(STPS[X].mmToTravel, 2500,X);
     STPS[Y].mmToTravel = calcSteps(-151.25,8.06);
     speed_cntr_Move(STPS[Y].mmToTravel, 2500,Y);

     //line 1
     // Find out after how many Steps before we must start deceleration.
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