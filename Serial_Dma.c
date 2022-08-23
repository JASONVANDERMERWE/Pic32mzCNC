#include "Serial_Dma.h"


char txt[] = "Start......";
char rxBuf[] ={0,0,0,0,0,0,0,0,0,0,0,0}  absolute 0xA0002000 ; //resides in flash ??
char txBuf[] ={0,0,0,0,0,0,0,0,0,0,0,0}  absolute 0xA0002200 ;

char DMA_Buff[200];
short dma0int_flag;
short dma1int_flag;



////////////////////////////////////////////////////////////////
//DMA Config
void DMA_global(){
    DMACON = 1<<16;   //enable the DMA controller
    DCH0CON = 0x03;   //channel off on block trf complete ,no event detect, priority 3, no chaining
    
    DMA0();
    DMA1();
}

/* This is the DMA channel 0 setup for the receiver */
void  DMA0(){
    DMACONbits.ON = 1;
    DCH0CONbits.CHAEN = 1;
    DCH0CONbits.CHPATLEN = 0;
    DMA0IE_bit = 0;
    DMA0IF_bit = 0;

    DCH0ECON      =(146 << 8 ) | 0x30;         // DCH0ECON Specific INTERRUPT IRQ NUMBER (146) for UART 2 RX
    DCH0DAT       =  0x0D;

    DCH0SSA       = KVA_TO_PA(0xBF822230);    // RxBuf virtual address     [0xBF822230 = U2RXREG]
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
void DMA1(){

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


