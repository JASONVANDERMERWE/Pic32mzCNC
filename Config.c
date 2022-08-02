#include "Config.h"

void PinMode(){

     SYSKEY = 0xAA996655;
     SYSKEY = 0x556699AA;
     CFGCONbits.OCACLK = 1;
     SYSKEY = 0x33333333;
     
     JTAGEN_bit = 0;
     Delay_ms(100);
////////////////////////////////////////////////////
//Turn off all analogs
     ANSELA = 0X0000;
     ANSELB = 0X0000;
     ANSELC = 0X0000;
     ANSELD = 0X0000;
     ANSELE = 0X0000;
     ANSELG = 0X0000;

     CNPUB = 0x0000;
////////////////////////////////////////////////////
//outputs
     TRISA9_bit  = 0;
     TRISD4_bit  = 0;
     TRISE7_bit  = 0;
     TRISF0_bit  = 0;
     TRISF1_bit  = 0;
     TRISG0_bit  = 0;
     TRISG1_bit  = 0;
     TRISG14_bit = 0;
     TRISG15_bit = 0;
////////////////////////////////////////////////////
//INPUTS
    TRISB0_bit = 1;
    TRISC3_bit = 1;
    TRISG7_bit = 1;
    TRISG8_bit = 1;

////////////////////////////////////////////////////
//Remapping of Uart 2 pins
    Unlock_IOLOCK();
     PPS_Mapping_NoLock(_RPE8, _OUTPUT, _U2TX);    // Sets pin PORTE.B8 to be Output and maps UART1 Transmit to it
     PPS_Mapping_NoLock(_RPE9, _INPUT,  _U2RX);    // Sets pin PORTE.B9 to be Input and maps UART1 Receive to it
     PPS_Mapping_NoLock(_RPB9, _OUTPUT, _NULL);
     PPS_Mapping_NoLock(_RPB10, _OUTPUT, _NULL);
     PPS_Mapping_NoLock(_RPF1, _OUTPUT, _OC3);     // dual pulse mode OutPut
     PPS_Mapping_NoLock(_RPD4, _OUTPUT, _OC5);
     PPS_Mapping_NoLock(_RPE3, _OUTPUT, _OC8);     //tmr6
     PPS_Mapping_NoLock(_RPG9, _OUTPUT, _OC9);     //tmr7
    Lock_IOLOCK();

//////////////////////////////////////////////////
//configure the uart2 module
    UartConfig();

///////////////////////////////////////////////////
//setup the performance of the sys clocks
    set_performance_mode();

//////////////////////////////////////////////////
//configure the interrupts
    Uart2InterruptSetup();

//////////////////////////////////////////////////
//TMR7&8 config
  // InitTimer6();
     InitTimer7();
     InitTimer8();
/////////////////////////////////////////////////
//setup i2c_lcd
    LcdI2CConfig();

////////////////////////////////////////////////
//DMA CONFIG
   initDMA_global();
   initDMA0();
   initDMA1();
   
////////////////////////////////////////////////
//set up output compare module for oc3 RF1 pin
  OutPutPulseXYZ();
  
}

void UartConfig(){
//////////////////////////////////////////////////
//setup the serial comms on uart 2  using PBCLK2 at 50mhz
  UART2_Init_Advanced(256000, 50000/*PBClk x 2*/, _UART_LOW_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);
  UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle); // set UART2 active
  Delay_ms(100);                  // Wait for UART module to stabilize
}

////////////////////////////////////////////////
//Uart 2 interrupt setup
void Uart2InterruptSetup(){
    URXISEL0_bit = 0;
    URXISEL1_bit = 1;
    IEC4.B18 = 1;              // Enable UART2 RX interrupt

    U2RXIP0_bit = 1;           //
    U2RXIP1_bit = 1;           //
    U2RXIP2_bit = 1;           // Set priority

    URXISEL1_U2STA_bit = 0;
    U2RXIF_bit = 0;            // Ensure interrupt is not pending
}

void set_performance_mode(){
unsigned long cp0;
////////////////////////////////////////////////
//setup the clks performance for all periphials
    DI(); // Disable all interrupts

    // Unlock Sequence
    SYSKEY = 0xAA996655;
    SYSKEY = 0x556699AA;

    // Peripheral Bus 1 cannot be turned off, so there's no need to turn it on
    PB1DIVbits.PBDIV = 1; // Peripheral Bus 1 Clock Divisor Control (PBCLK1 is SYSCLK divided by 2)

    // PB2DIV
    UEN0_bit = 1;
    UEN1_bit = 1;
    PB2DIVbits.ON = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
    while(!PB2DIVbits.PBDIVRDY);
    PB2DIVbits.PBDIV = 0x07; // Peripheral Bus 2 Clock Divisor Control (PBCLK2 is SYSCLK "200MHZ" / 8)

    // PB3DIV
    PB3DIVbits.ON = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
    while(!PB3DIVbits.PBDIVRDY);
    PB3DIVbits.PBDIV = 3; // Peripheral Bus 3 Clock Divisor Control (PBCLK3 is SYSCLK divided by 4)

    // PB4DIV
    PB4DIVbits.ON = 1; // Peripheral Bus 4 Output Clock Enable (Output clock is enabled)
    while (!PB4DIVbits.PBDIVRDY); // Wait until it is ready to write to
    PB4DIVbits.PBDIV = 0; // Peripheral Bus 4 Clock Divisor Control (PBCLK4 is SYSCLK divided by 1)

    // PB5DIV
    PB5DIVbits.ON = 1; // Peripheral Bus 5 Output Clock Enable (Output clock is enabled)
    while(!PB5DIVbits.PBDIVRDY);
    PB5DIVbits.PBDIV = 1; // Peripheral Bus 5 Clock Divisor Control (PBCLK5 is SYSCLK divided by 2)

    // PB7DIV
    PB7DIVbits.ON = 1; // Peripheral Bus 7 Output Clock Enable (Output clock is enabled)
    while(!PB7DIVbits.PBDIVRDY);
    PB7DIVbits.PBDIV = 0; // Peripheral Bus 7 Clock Divisor Control (PBCLK7 is SYSCLK divided by 1)

    // PB8DIV
    PB8DIVbits.ON = 1; // Peripheral Bus 8 Output Clock Enable (Output clock is enabled)
    while(!PB8DIVbits.PBDIVRDY);
    PB8DIVbits.PBDIV = 1; // Peripheral Bus 8 Clock Divisor Control (PBCLK8 is SYSCLK divided by 2)

    // PRECON - Set up prefetch
    PRECONbits.PFMSECEN = 0; // Flash SEC Interrupt Enable (Do not generate an interrupt when the PFMSEC bit is set)
    PRECONbits.PREFEN = 0b11; // Predictive Prefetch Enable (Enable predictive prefetch for any address)
    PRECONbits.PFMWS = 0b100; // PFM Access Time Defined in Terms of SYSCLK Wait States (Two wait states)

    // Set up caching

    cp0 = CP0_GET(CP0_CONFIG);
    cp0 &= ~0x07;
    cp0 |= 0b011; // K0 = Cacheable, non-coherent, write-back, write allocate
    CP0_SET(CP0_CONFIG,cp0);

    // Lock Sequence
    SYSKEY = 0x33333333;

    // SETTING UP PREFETCH MODULE
    PREFEN0_bit = 1;
    PREFEN1_bit = 1;
    PFMWS0_bit = 0;
    PFMWS1_bit = 1;
    PFMWS2_bit = 0;
}
//////////////////////////////////////////////////////////////////
//configure the output pulse mode OCx  use 16bit as 1.28us tick on tmrs
void OutPutPulseXYZ(){
/*
* The following code will set the Output Compare module 3 = X, 6 = Y , 4 = Z
* for interrupts on single pulse event and select Timer2  32 bit mode
* as the clock source for the compare time-base.
*/
  OC3CON = 0x0000; // disable OC3 module |_using TMR2_3 in 32bit mode
  OC5CON = 0x0000; // disable OC5 module |
  OC8CON = 0X0000; // disable OC8 module |_using tmr6
//clear  Tmr2 & 4
  T2CON  = 0x0000;  // disable Timer2
  T4CON  = 0x0000;  // disable Timer4
  T6CON  = 0x0000;  // disable Timer6
//setup  Tmr2,4&6 as 1:64 prescaler 16bit
  T2CON  = 0x0060;  //   a prescaler of 1:64 to get 1.28usec tick resolution
  T4CON  = 0x0060;  //   a prescaler of 1:64 to get 1.28usec tick resolution
  T6CON  = 0x0060;  //   a prescaler of 1:64 to get 1.28usec tick resolution
  
// Set period (PR2 is 32-bits wide) and common to all OCx compares
  PR2    = 0xFFFF;
  PR4    = 0xFFFF;
  PR6    = 0xFFFF;
  
//setup OC3_OC6 32bit but only using in 16bit mode
  OC3CON = 0x0004; // Conf OC3 module for dual single Pulse output 16bit tmr2
  OC5CON = 0x0004; // Conf OC6 module for dual single Pulse output 16bit tmr4
  OC8CON = 0x0004; // Conf OC8 module for dual single Pulse output 16bit tmr6
  
/*
 * Initialize PR2 to a value  >  OCxRS  >  OC3R, to start output compare.
 * TMR2 must be forced to PR2's value then this will force OC3 bit on as
 * soon as a match between TMR2 and PR2 is made a force on OC3 bit is done,
 * TMR continues to count from 0 to OC3RS value, when a match is made a
 * reset on OC3 bit and interrupt OC3IF is set.
 */
  OC3R   = 0x5;        // Initialize Compare Register 1
  OC3RS  = 0x234;      // Initialize Secondary Compare Register 1
  OC5R   = 0x5;        // Initialize Compare Register 1
  OC5RS  = 0x234;      // Initialize Secondary Compare Register 1
  OC8R   = 0x5;        // Initialize Compare Register 1
  OC8RS  = 0x234;      // Initialize Secondary Compare Register 1
  
//interrupt priority and enable set
  OC3IP0_bit = 1;  // Set OC3 interrupt priority to 3
  OC3IP1_bit = 1;
  OC3IP2_bit = 0;
  OC3IS0_bit = 0;  // Set OC3 sub priority 1
  OC3IS1_bit = 0;
  OC3IF_bit  = 0;   // reset interrupt flag
  OC3IE_bit  = 1;   // enable interrupt
  
  OC5IP0_bit = 1;  // Set OC5 interrupt priority to 3
  OC5IP1_bit = 1;
  OC5IP2_bit = 0;
  OC5IS0_bit = 1;  // Set OC5 sub priority 2
  OC5IS1_bit = 0;
  OC5IF_bit  = 0;  // reset interrupt flag
  OC5IE_bit  = 1;  // enable interrupt

  OC8IP0_bit = 1;  // Set OC8 interrupt priority to 3
  OC8IP1_bit = 1;
  OC8IP2_bit = 0;
  OC8IS0_bit = 1;  // Set OC8 sub priority 2
  OC8IS1_bit = 0;
  OC8IF_bit  = 0;  // reset interrupt flag
  OC8IE_bit  = 1;  // enable interrupt
  
//set Timers on
  T2CONSET  = 0x8000; // Enable Timer2 0C5
  T4CONSET  = 0x8000; // Enable Timer4 OC3
  T6CONSET  = 0x8000; // Enable Timer6 OC8
  
//wait for usgage of these modules before enaBling them
 // OC3CONSET = 0x8000; // Enable OC3
 // OC5CONSET = 0x8000; // Enable OC6
 // OC8CONSET = 0x8000; // Enable OC8
}

/////////////////////////////////////////////////////////////////
//TMR 1 setup for 1us pusles as a dummy axis for single puls to
//keep the seep equivilant to Bres algo dual axis.
void InitTimer1(){
  T1CON         = 0x8000;
  T1IP0_bit         = 1;
  T1IP1_bit         = 1;
  T1IP2_bit         = 1;
  T1IF_bit         = 0;
  T1IE_bit         = 1;
  PR1                 = 100;
  TMR1                 = 0;
}
//////////////////////////////////////////////////////////////////
//TMR 6 initialized to 1us interrupt
// {--NOT USED--} //
/*void InitTimer6(){
  T6CON             = 0x8000;
  T6IP0_bit         = 0;
  T6IP1_bit         = 0;
  T6IP2_bit         = 1;
  T6IS0_bit         = 1;
  T6IS1_bit         = 0;
  T6IF_bit          = 0;
  T6IE_bit          = 0;
  PR6               = 500;
  TMR6              = 0;
}*/

//////////////////////////////////////////////////////////////////
//TMR 7 initialized to 1ms interrupt
void InitTimer7(){
  T7CON             = 0x8000;
  T7IP0_bit         = 0;
  T7IP1_bit         = 0;
  T7IP2_bit         = 1;
  T7IS0_bit         = 1;
  T7IS1_bit         = 1;
  T7IF_bit          = 0;
  T7IE_bit          = 0;
  PR7               = 50000;
  TMR7              = 0;
}
///////////////////////////////////////////////////////////////////
//TMR 8 initialized to interrupt at 1us
void InitTimer8(){
  T8CON            = 0x8000;
  T8IP0_bit        = 0;
  T8IP1_bit        = 0;
  T8IP2_bit        = 1;
  T8IS0_bit        = 0;
  T8IS1_bit        = 1;
  T8IF_bit         = 0;
  T8IE_bit         = 0;
  PR8              = 50;
  TMR8             = 0;
}

void LcdI2CConfig(){

     I2C4_Init_Advanced(50000, 100000);
     I2C_Set_Active(&I2C4_Start, &I2C4_Restart, &I2C4_Read, &I2C4_Write,
                    &I2C4_Stop,&I2C4_Is_Idle); // Sets the I2C4 module active
     Delay_ms(100);
     I2C_LCD_init(LCD_01_ADDRESS,4);
     Delay_ms(100);
     I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_FIRST_ROW,1);
     I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CURSOR_OFF,1); // Cursor off
     I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CLEAR,1); // Clear display
}

////////////////////////////////////////////////////////////////
//DMA Config
void initDMA_global(){
    DMACON = 1<<16;       //enable the DMA controller
    DCH0CON = 0x03;   //channel off on block trf complete ,no event detect, priority 3, no chaining
}

/* This is the DMA channel 0 setup for the receiver */
void  initDMA0(){
    DMACONbits.ON = 1;
    DCH0CONbits.CHAEN = 1;
    DCH0CONbits.CHPATLEN = 0;
    DMA0IE_bit = 0;
    DMA0IF_bit = 0;

    DCH0ECON      =(146 << 8 ) | 0x30;         // DCH0ECON Specific INTERRUPT IRQ NUMBER (146) for UART 2 RX
    DCH0DAT       =  0x0D;

    DCH0SSA       = KVA_TO_PA(0xBF822230);    // RxBuf virtual address     [0xBF822230 = U1RXREG]
    DCH0DSA       = KVA_TO_PA(0xA0002000);    //   virtual address:= IN RAM FOR RECIEVED DATA

    DCH0SSIZ      = 200  ;  // source size = size of buffer set up rcBuf, x bytes at a time
    DCH0DSIZ      = 200  ;  // destination size = Size for the 'rxBuf' to fill up with received characters. It is = 5 in this example...
    DCH0CSIZ      = 200  ;  // bytes transferred per event = Size of how many bytes to transfer per each interrupt on #27 IRQ event

    DCH0INTCLR    = 0x00FF00FF ; // Clear existing events, disable all interrupts ''Clear flags in DMA controller channel 0
    CHBCIE_bit    = 1  ;         // Enable Interrupt on block transfer complete
    CHERIE_bit    = 1  ;         // Enable Interrupt on errors

/* Interrupt setup */

    IPC33CLR       = 0x0000001F ;//' clear DMA channel priority and sub-priority
    DMA0IP2_bit   = 1 ;          //' IPC9 DMA0IP  priority = 5
    DMA0IP1_bit   = 0 ;
    DMA0IP0_bit   = 1 ;
    DMA0IS1_bit   = 1 ;         //' sub-priority 3
    DMA0IS0_bit   = 1 ;

    DMA0IE_bit    = 1 ;         //' enable DMA0 interrupt
    CHEN_bit      = 1 ;         //' Enable channel - may want to do this when you are ready to receive...

}

/* This is the DMA setup for the transmitter */
void initDMA1(){

    DMA1IE_bit = 0 ;                   //' disable DMA1 interrupt
    DMA1IF_bit = 0 ;                   //' clear DMA1 interrupt flag
    DCH1CONbits.CHPATLEN = 0;
    DCH1ECON=(147 << 8)| 0x30;         //' Specific INTERRUPT IRQ NUMBER for UART 2 TX (147)
    DCH1SSA = KVA_TO_PA(0xA0002200) ;  //0xA0002200 virtual address of txBuf
    DCH1DSA = KVA_TO_PA(0xBF822220) ;  //U1TX2REG for reply  [0xBF822220 = U1TXREG]
    DCH1DAT       = 0x0D;
/* Source Size */
    DCH1SSIZ = 200  ;  //' This is how many bytes you want to send out in a block transfer for UART transmitter
/* Destination Size */
    DCH1DSIZ = 1  ;    //' This is how many bytes come from the destination - i.e. rxBuf recieved can change dynamicall as its send buffer
/* Cell Size */
    DCH1CSIZ = 200  ;  //' x bytes from txBuf in a cell waiting to send out 1 byte at a time to U1TXREG / DCH1DSIZ

    DCH1INTCLR  =  0x00FF00FF ; //'clear all interrupts and clear all interrupt flags
    CHBCIE_DCH1INT_bit = 1    ; //'Enable Channel Block transfer interrupt
    CHERIE_DCH1INT_bit = 1    ; //'Enable Channel Address Error interrupt
/* Interrupt Setup */
    DMA1IP2_bit = 1 ;           //' DMA1 interrupt priority 5
    DMA1IP1_bit = 0 ;
    DMA1IP0_bit = 1 ;
    DMA1IS1_bit = 0 ;           //' sub-priority 1
    DMA1IS0_bit = 1 ;
    DMA1IE_bit  = 1 ;           //' enable DMA1 interrupt
}