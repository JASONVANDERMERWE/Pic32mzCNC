#include "Serial_Dma.h"


char txt[] = "Start......";
char rxBuf[] ={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}  absolute 0xA0002000 ; //resides in flash ??
char txBuf[] ={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}  absolute 0xA0002200 ;

char DMA_Buff[200];
short dma0int_flag;
short dma1int_flag;



////////////////////////////////////////////////////////////////
//DMA Config
void DMA_global(){
    DMACON = 1<<15;   //enable the DMA controller
    DMA0();
    DMA1();
}


/****************************************************
* This is the DMA channel 0 setup for the receiver
* it is setup to auto enable after a block transfer or
* pattern match of '\n' we can enable the 2 char pattern
* match if needed by setting PATLEN bit on.
* Destination size is 200 . a pattern match must be
* Sent or a block transfer will only take place after
* 200 byte. An abort can be forced by setting the CABORT bit
*****************************************************/
void  DMA0(){
    //Disable DMA0 IE
    IEC4CLR       = 1 << 6;

    // Clear existing events, disable all interrupts
    DCH0INTCLR    = 0x00FF00FF ;
    
    //1INTERRUPT IRQ NUMBER for UART 2 TX (146) | [0x10 = SIRQEN] [0x30 = PATEN & SIRQEN]
    DCH0ECON      =(146 << 8 ) | 0x30;
    
    //Pattern length and data
    //DCH0CONbits.CHPATLEN = 0;
    DCH0DAT       =  '\n';
    
    //Source address as UART_RX
    DCH0SSA       = KVA_TO_PA(0xBF822230);    //[0xBF822230 = U2RXREG]
    DCH0SSIZ      = 1;                 // source size = 1byte at a time

    //Destination address  as RxBuffer
    DCH0DSA       = KVA_TO_PA(0xA0002000);    // virtual address:= IN RAM FOR RECIEVED DATA
    DCH0DSIZ      = 200  ;  // destination size = Size for the 'rxBuf' to fill up with received characters. It is = 5 in this example...
   
    //Cell size as 1 byte
    DCH0CSIZ      = 1  ;  // bytes transferred in the background

    //Interrupt setup
    IPC33CLR      = 0x17 << 16 ;//' clear DMA channel priority and sub-priority
    IPC33SET      = (0x17 << 16);
    IEC4SET       = 1 << 6;
    IFS4CLR       = 1 << 6;

    //[CHBCIE && CHERIE]
    DCH0INTSET      =  0x9 << 16;
    //PATLEN[8] && (CHEN  && CHAEN[9]) && PRIOR3[3]
    //PATLEN[8] && CHEN[8] && PRIOR3[3]          .
    DCH0CONSET        = 0X093;
}

/******************************************************
* This is the DMA setup for the UART2 transmitter and
* is not auto enabled, this will be done everytime a
* UART transfer out need to take place. The loopback 
* is temporary and is done from within the DMA0 IRQ
* Vector, The steps within this Vector to loopback
* will be used from within code to perfoem a data send
* A pattern match should abort the transfer and wait
* for the next CFORCE bit to be set, DCH1SSIZ can be
* dynamically assigned to force and abort but block
* transfer having been finnished
*******************************************************/
void DMA1(){
    //Disable DMA1 IE and clear IF
    //clear DMA channel priority and sub-priority
    IPC33CLR      = 0x16 << 24;
    IEC4CLR       = 1 << 7;
    IFS4CLR       = 1 << 7;

    // Clear existing events, disable all interrupts
    DCH1INTCLR    = 0x00FF00FF ;
    
    //INTERRUPT IRQ NUMBER for UART 2 TX (147) | [0x10 = SIRQEN] [0x30 = PATEN & SIRQEN]
    DCH1ECON=(147 << 8)| 0x30;
    
    //Pattern Length and char to match not needed here ????
    //Pattern length = 0 = 1 byte
    //DCH1CONbits.CHPATLEN = 0;
    DCH1DAT       = '\n';
    
    //Source address and size of transfer buffer
    DCH1SSA = KVA_TO_PA(0xA0002200) ;  //0xA0002200 virtual address of txBuf
    DCH1SSIZ = 200;  //' This is how many bytes you want to send out in a block transfer for UART transmitter
    
    //Destination Address and size which is 1byte
    //U1TX2REG for reply  [0xBF822220 = U1TXREG]
    DCH1DSA = KVA_TO_PA(0xBF822220) ;
    DCH1DSIZ = 1;
    
    //Cell size to transfer each transfer
    DCH1CSIZ = 1;    //' x bytes from txBuf in a cell waiting to send out 1 byte at a time to U1TXREG / DCH1DSIZ

    //Interrupt setup
    //priority 5 sub-priority 2
    IPC33SET      = (0x16 << 24);
    IEC4SET       = 1 << 7;
    IFS4CLR       = 1 << 7;

    //[CHBCIE && CHERIE]
    DCH1INTSET    =  0x9 << 16;
    //PATLEN[8] && (CHEN  && CHAEN[9]) && PRIOR3[3] 
    //PATLEN[8] && (CHEN[8]) && PRIOR3[3]       .
    DCH1CONSET    = 0x083;

}


////////////////////////////////////////
//DMA0 IRQ   UART2 RX
void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO {
 int i,ptr;
     i = 0;
 // THIS CHANNEL IS AUTOMATICALLY ENABLED AFTER A BLOCK
 // OR ERROR ABORT EVENT, THIS SHOULD TAKE PLACE IF A
 // '\n' HAS BEEN RECIEVED OR 200 BYTES EXCEEDED
    if (DCH0INTbits.CHBCIF == 1) {
      dma1int_flag = 0;         //flags to sample in code if needed
      dma0int_flag = 1;
      // LOOPBACK EXAMPLE USE THIS TO SEND DATA
      // ENABLE DMA1 FOR LOOPBACK
      DCH1CONbits.CHEN  = 1;
      i = strlen(rxBuf);
      dma0int_flag = 1;          // user flag to inform this int was triggered. should be cleared in software
      memcpy(txBuf, rxBuf, i);   // copy RxBuf -> TxBuf  BUFFER_LENGTH
      DCH1SSIZ            = i ;  // change the size of block register
      //DMA1IE_bit        = 1 ;
      DCH1ECONbits.CFORCE = 1 ;  // force DMA1 interrupt trigger
    }

    // CHANNEN ADDRESS ERROR FLAF
    if( CHERIF_bit == 1){       // test error int flag
       //CHERIF_bit = 0;
       //LOOPBACK RECIEVE ERROR COULD BE SPECIFIC MSG
       memcpy(txBuf,"CHERIF Error\r",15);
       DCH1SSIZ = 13;           //set block size of transfer
       DCH1ECONbits.CFORCE = 1 ;// force DMA1 interrupt trigger
    }
    DCH0INTCLR  = 0x00FF;       // clear DMA 0 int flags
}

/////////////////////////////////////////////////////
//UART2 TX
void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_AUTO {

/* Channel Block Transfer Complete Interrupt Flag bit */
    if (DCH1INTbits.CHBCIF){
       dma1int_flag = 1;
       dma0int_flag = 0;
        //DCH1CONbits.CHEN  = 0;   // Disable the DMA1 channel to transmit back what was received
       //DCH1INTbits.CHBCIF = 0;   // clear flag
    }
/* Channel Address Error Interrupt Flag bit */
    if( CHERIF_DCH1INT_bit == 1){
       //CHERIF_DCH1INT_bit = 0;

    }
    // user flag to inform this int was triggered. should be cleared in software
    DCH1INTCLR   = 0x00FF;                     // clear event flags


}