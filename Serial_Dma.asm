_initDMA0:
;serial_dma.h,13 :: 		void  initDMA0(){
;serial_dma.h,14 :: 		DMACONbits.ON = 1;
ORI	R2, R0, 32768
SWR	R2, Offset(DMACONbits+8)(GP)
SWL	R2, Offset(DMACONbits+11)(GP)
;serial_dma.h,15 :: 		DCH0CONbits.CHAEN = 1;
ORI	R2, R0, 16
SW	R2, Offset(DCH0CONbits+8)(GP)
;serial_dma.h,16 :: 		DCH0CONbits.CHPATLEN = 0;
ORI	R2, R0, 2048
SW	R2, Offset(DCH0CONbits+4)(GP)
;serial_dma.h,17 :: 		DMA0IE_bit = 0;
LUI	R2, BitMask(DMA0IE_bit+0)
ORI	R2, R2, BitMask(DMA0IE_bit+0)
_SX	
;serial_dma.h,18 :: 		DMA0IF_bit = 0;
LUI	R2, BitMask(DMA0IF_bit+0)
ORI	R2, R2, BitMask(DMA0IF_bit+0)
_SX	
;serial_dma.h,20 :: 		DCH0ECON      =(146 << 8 ) | 0x30;         // DCH0ECON Specific INTERRUPT IRQ NUMBER (146) for UART 2 RX
ORI	R2, R0, 37424
SW	R2, Offset(DCH0ECON+0)(GP)
;serial_dma.h,21 :: 		DCH0DAT       =  0x0D;
ORI	R2, R0, 13
SW	R2, Offset(DCH0DAT+0)(GP)
;serial_dma.h,23 :: 		DCH0SSA       = KVA_TO_PA(0xBF822230);    // RxBuf virtual address     [0xBF822230 = U2RXREG]
LUI	R2, 8066
ORI	R2, R2, 8752
SW	R2, Offset(DCH0SSA+0)(GP)
;serial_dma.h,24 :: 		DCH0DSA       = KVA_TO_PA(0xA0002000);    //   virtual address:= IN RAM FOR RECIEVED DATA
ORI	R2, R0, 8192
SW	R2, Offset(DCH0DSA+0)(GP)
;serial_dma.h,26 :: 		DCH0SSIZ      = 200  ;  // source size = size of buffer set up rcBuf, x bytes at a time
ORI	R2, R0, 200
SW	R2, Offset(DCH0SSIZ+0)(GP)
;serial_dma.h,27 :: 		DCH0DSIZ      = 200  ;  // destination size = Size for the 'rxBuf' to fill up with received characters. It is = 5 in this example...
ORI	R2, R0, 200
SW	R2, Offset(DCH0DSIZ+0)(GP)
;serial_dma.h,28 :: 		DCH0CSIZ      = 200  ;  // bytes transferred per event = Size of how many bytes to transfer per each interrupt on #27 IRQ event
ORI	R2, R0, 200
SW	R2, Offset(DCH0CSIZ+0)(GP)
;serial_dma.h,30 :: 		DCH0INTCLR    = 0x00FF00FF ; // Clear existing events, disable all interrupts ''Clear flags in DMA controller channel 0
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;serial_dma.h,31 :: 		CHBCIE_bit    = 1  ;         // Enable Interrupt on block transfer complete
LUI	R2, BitMask(CHBCIE_bit+0)
ORI	R2, R2, BitMask(CHBCIE_bit+0)
_SX	
;serial_dma.h,32 :: 		CHERIE_bit    = 1  ;         // Enable Interrupt on errors
LUI	R2, BitMask(CHERIE_bit+0)
ORI	R2, R2, BitMask(CHERIE_bit+0)
_SX	
;serial_dma.h,36 :: 		IPC33CLR       = 0x0000001F ;//' clear DMA channel priority and sub-priority
ORI	R2, R0, 31
SW	R2, Offset(IPC33CLR+0)(GP)
;serial_dma.h,37 :: 		DMA0IP2_bit   = 1 ;          //' IPC9 DMA0IP  priority = 5
LUI	R2, BitMask(DMA0IP2_bit+0)
ORI	R2, R2, BitMask(DMA0IP2_bit+0)
_SX	
;serial_dma.h,38 :: 		DMA0IP1_bit   = 0 ;
LUI	R2, BitMask(DMA0IP1_bit+0)
ORI	R2, R2, BitMask(DMA0IP1_bit+0)
_SX	
;serial_dma.h,39 :: 		DMA0IP0_bit   = 1 ;
LUI	R2, BitMask(DMA0IP0_bit+0)
ORI	R2, R2, BitMask(DMA0IP0_bit+0)
_SX	
;serial_dma.h,40 :: 		DMA0IS1_bit   = 1 ;         //' sub-priority 3
LUI	R2, BitMask(DMA0IS1_bit+0)
ORI	R2, R2, BitMask(DMA0IS1_bit+0)
_SX	
;serial_dma.h,41 :: 		DMA0IS0_bit   = 1 ;
LUI	R2, BitMask(DMA0IS0_bit+0)
ORI	R2, R2, BitMask(DMA0IS0_bit+0)
_SX	
;serial_dma.h,43 :: 		DMA0IE_bit    = 1 ;         //' enable DMA0 interrupt
LUI	R2, BitMask(DMA0IE_bit+0)
ORI	R2, R2, BitMask(DMA0IE_bit+0)
_SX	
;serial_dma.h,44 :: 		CHEN_bit      = 1 ;         //' Enable channel - may want to do this when you are ready to receive...
LUI	R2, BitMask(CHEN_bit+0)
ORI	R2, R2, BitMask(CHEN_bit+0)
_SX	
;serial_dma.h,46 :: 		}
L_end_initDMA0:
JR	RA
NOP	
; end of _initDMA0
_initDMA1:
;serial_dma.h,49 :: 		void initDMA1(){
;serial_dma.h,51 :: 		DMA1IE_bit = 0 ;                   //' disable DMA1 interrupt
LUI	R2, BitMask(DMA1IE_bit+0)
ORI	R2, R2, BitMask(DMA1IE_bit+0)
_SX	
;serial_dma.h,52 :: 		DMA1IF_bit = 0 ;                   //' clear DMA1 interrupt flag
LUI	R2, BitMask(DMA1IF_bit+0)
ORI	R2, R2, BitMask(DMA1IF_bit+0)
_SX	
;serial_dma.h,53 :: 		DCH1CONbits.CHPATLEN = 0;
ORI	R2, R0, 2048
SW	R2, Offset(DCH1CONbits+4)(GP)
;serial_dma.h,54 :: 		DCH1ECON=(147 << 8)| 0x30;         //' Specific INTERRUPT IRQ NUMBER for UART 2 TX (147)
ORI	R2, R0, 37680
SW	R2, Offset(DCH1ECON+0)(GP)
;serial_dma.h,55 :: 		DCH1SSA = KVA_TO_PA(0xA0002200) ;  //0xA0002200 virtual address of txBuf
ORI	R2, R0, 8704
SW	R2, Offset(DCH1SSA+0)(GP)
;serial_dma.h,56 :: 		DCH1DSA = KVA_TO_PA(0xBF822220) ;  //U1TX2REG for reply  [0xBF822220 = U1TXREG]
LUI	R2, 8066
ORI	R2, R2, 8736
SW	R2, Offset(DCH1DSA+0)(GP)
;serial_dma.h,57 :: 		DCH1DAT       = 0x0D;
ORI	R2, R0, 13
SW	R2, Offset(DCH1DAT+0)(GP)
;serial_dma.h,59 :: 		DCH1SSIZ = 200  ;  //' This is how many bytes you want to send out in a block transfer for UART transmitter
ORI	R2, R0, 200
SW	R2, Offset(DCH1SSIZ+0)(GP)
;serial_dma.h,61 :: 		DCH1DSIZ = 1  ;    //' This is how many bytes come from the destination - i.e. rxBuf recieved can change dynamicall as its send buffer
ORI	R2, R0, 1
SW	R2, Offset(DCH1DSIZ+0)(GP)
;serial_dma.h,63 :: 		DCH1CSIZ = 200  ;  //' x bytes from txBuf in a cell waiting to send out 1 byte at a time to U1TXREG / DCH1DSIZ
ORI	R2, R0, 200
SW	R2, Offset(DCH1CSIZ+0)(GP)
;serial_dma.h,65 :: 		DCH1INTCLR  =  0x00FF00FF ; //'clear all interrupts and clear all interrupt flags
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;serial_dma.h,66 :: 		CHBCIE_DCH1INT_bit = 1    ; //'Enable Channel Block transfer interrupt
LUI	R2, BitMask(CHBCIE_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHBCIE_DCH1INT_bit+0)
_SX	
;serial_dma.h,67 :: 		CHERIE_DCH1INT_bit = 1    ; //'Enable Channel Address Error interrupt
LUI	R2, BitMask(CHERIE_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHERIE_DCH1INT_bit+0)
_SX	
;serial_dma.h,69 :: 		DMA1IP2_bit = 1 ;           //' DMA1 interrupt priority 5
LUI	R2, BitMask(DMA1IP2_bit+0)
ORI	R2, R2, BitMask(DMA1IP2_bit+0)
_SX	
;serial_dma.h,70 :: 		DMA1IP1_bit = 0 ;
LUI	R2, BitMask(DMA1IP1_bit+0)
ORI	R2, R2, BitMask(DMA1IP1_bit+0)
_SX	
;serial_dma.h,71 :: 		DMA1IP0_bit = 1 ;
LUI	R2, BitMask(DMA1IP0_bit+0)
ORI	R2, R2, BitMask(DMA1IP0_bit+0)
_SX	
;serial_dma.h,72 :: 		DMA1IS1_bit = 0 ;           //' sub-priority 1
LUI	R2, BitMask(DMA1IS1_bit+0)
ORI	R2, R2, BitMask(DMA1IS1_bit+0)
_SX	
;serial_dma.h,73 :: 		DMA1IS0_bit = 1 ;
LUI	R2, BitMask(DMA1IS0_bit+0)
ORI	R2, R2, BitMask(DMA1IS0_bit+0)
_SX	
;serial_dma.h,74 :: 		DMA1IE_bit  = 1 ;           //' enable DMA1 interrupt
LUI	R2, BitMask(DMA1IE_bit+0)
ORI	R2, R2, BitMask(DMA1IE_bit+0)
_SX	
;serial_dma.h,75 :: 		}
L_end_initDMA1:
JR	RA
NOP	
; end of _initDMA1
_DMA_global:
;Serial_Dma.c,11 :: 		void DMA_global(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Serial_Dma.c,12 :: 		DMACON = 1<<16;       //enable the DMA controller
LUI	R2, 1
SW	R2, Offset(DMACON+0)(GP)
;Serial_Dma.c,13 :: 		DCH0CON = 0x03;   //channel off on block trf complete ,no event detect, priority 3, no chaining
ORI	R2, R0, 3
SW	R2, Offset(DCH0CON+0)(GP)
;Serial_Dma.c,15 :: 		DMA0();
JAL	_DMA0+0
NOP	
;Serial_Dma.c,16 :: 		DMA1();
JAL	_DMA1+0
NOP	
;Serial_Dma.c,17 :: 		}
L_end_DMA_global:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _DMA_global
_DMA0:
;Serial_Dma.c,20 :: 		void  DMA0(){
;Serial_Dma.c,21 :: 		DMACONbits.ON = 1;
ORI	R2, R0, 32768
SWR	R2, Offset(DMACONbits+8)(GP)
SWL	R2, Offset(DMACONbits+11)(GP)
;Serial_Dma.c,22 :: 		DCH0CONbits.CHAEN = 1;
ORI	R2, R0, 16
SW	R2, Offset(DCH0CONbits+8)(GP)
;Serial_Dma.c,23 :: 		DCH0CONbits.CHPATLEN = 0;
ORI	R2, R0, 2048
SW	R2, Offset(DCH0CONbits+4)(GP)
;Serial_Dma.c,24 :: 		DMA0IE_bit = 0;
LUI	R2, BitMask(DMA0IE_bit+0)
ORI	R2, R2, BitMask(DMA0IE_bit+0)
_SX	
;Serial_Dma.c,25 :: 		DMA0IF_bit = 0;
LUI	R2, BitMask(DMA0IF_bit+0)
ORI	R2, R2, BitMask(DMA0IF_bit+0)
_SX	
;Serial_Dma.c,27 :: 		DCH0ECON      =(146 << 8 ) | 0x30;         // DCH0ECON Specific INTERRUPT IRQ NUMBER (146) for UART 2 RX
ORI	R2, R0, 37424
SW	R2, Offset(DCH0ECON+0)(GP)
;Serial_Dma.c,28 :: 		DCH0DAT       =  0x0D;
ORI	R2, R0, 13
SW	R2, Offset(DCH0DAT+0)(GP)
;Serial_Dma.c,30 :: 		DCH0SSA       = KVA_TO_PA(0xBF822230);    // RxBuf virtual address     [0xBF822230 = U2RXREG]
LUI	R2, 8066
ORI	R2, R2, 8752
SW	R2, Offset(DCH0SSA+0)(GP)
;Serial_Dma.c,31 :: 		DCH0DSA       = KVA_TO_PA(0xA0002000);    //   virtual address:= IN RAM FOR RECIEVED DATA
ORI	R2, R0, 8192
SW	R2, Offset(DCH0DSA+0)(GP)
;Serial_Dma.c,33 :: 		DCH0SSIZ      = 200  ;  // source size = size of buffer set up rcBuf, x bytes at a time
ORI	R2, R0, 200
SW	R2, Offset(DCH0SSIZ+0)(GP)
;Serial_Dma.c,34 :: 		DCH0DSIZ      = 200  ;  // destination size = Size for the 'rxBuf' to fill up with received characters. It is = 5 in this example...
ORI	R2, R0, 200
SW	R2, Offset(DCH0DSIZ+0)(GP)
;Serial_Dma.c,35 :: 		DCH0CSIZ      = 200  ;  // bytes transferred per event = Size of how many bytes to transfer per each interrupt on #27 IRQ event
ORI	R2, R0, 200
SW	R2, Offset(DCH0CSIZ+0)(GP)
;Serial_Dma.c,37 :: 		DCH0INTCLR    = 0x00FF00FF ; // Clear existing events, disable all interrupts ''Clear flags in DMA controller channel 0
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Serial_Dma.c,38 :: 		CHBCIE_bit    = 1  ;         // Enable Interrupt on block transfer complete
LUI	R2, BitMask(CHBCIE_bit+0)
ORI	R2, R2, BitMask(CHBCIE_bit+0)
_SX	
;Serial_Dma.c,39 :: 		CHERIE_bit    = 1  ;         // Enable Interrupt on errors
LUI	R2, BitMask(CHERIE_bit+0)
ORI	R2, R2, BitMask(CHERIE_bit+0)
_SX	
;Serial_Dma.c,43 :: 		IPC33CLR       = 0x0000001F ;//' clear DMA channel priority and sub-priority
ORI	R2, R0, 31
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,44 :: 		DMA0IP2_bit   = 1 ;          //' IPC9 DMA0IP  priority = 5
LUI	R2, BitMask(DMA0IP2_bit+0)
ORI	R2, R2, BitMask(DMA0IP2_bit+0)
_SX	
;Serial_Dma.c,45 :: 		DMA0IP1_bit   = 0 ;
LUI	R2, BitMask(DMA0IP1_bit+0)
ORI	R2, R2, BitMask(DMA0IP1_bit+0)
_SX	
;Serial_Dma.c,46 :: 		DMA0IP0_bit   = 1 ;
LUI	R2, BitMask(DMA0IP0_bit+0)
ORI	R2, R2, BitMask(DMA0IP0_bit+0)
_SX	
;Serial_Dma.c,47 :: 		DMA0IS1_bit   = 1 ;         //' sub-priority 3
LUI	R2, BitMask(DMA0IS1_bit+0)
ORI	R2, R2, BitMask(DMA0IS1_bit+0)
_SX	
;Serial_Dma.c,48 :: 		DMA0IS0_bit   = 1 ;
LUI	R2, BitMask(DMA0IS0_bit+0)
ORI	R2, R2, BitMask(DMA0IS0_bit+0)
_SX	
;Serial_Dma.c,50 :: 		DMA0IE_bit    = 1 ;         //' enable DMA0 interrupt
LUI	R2, BitMask(DMA0IE_bit+0)
ORI	R2, R2, BitMask(DMA0IE_bit+0)
_SX	
;Serial_Dma.c,51 :: 		CHEN_bit      = 1 ;         //' Enable channel - may want to do this when you are ready to receive...
LUI	R2, BitMask(CHEN_bit+0)
ORI	R2, R2, BitMask(CHEN_bit+0)
_SX	
;Serial_Dma.c,53 :: 		}
L_end_DMA0:
JR	RA
NOP	
; end of _DMA0
_DMA1:
;Serial_Dma.c,56 :: 		void DMA1(){
;Serial_Dma.c,58 :: 		DMA1IE_bit = 0 ;                   //' disable DMA1 interrupt
LUI	R2, BitMask(DMA1IE_bit+0)
ORI	R2, R2, BitMask(DMA1IE_bit+0)
_SX	
;Serial_Dma.c,59 :: 		DMA1IF_bit = 0 ;                   //' clear DMA1 interrupt flag
LUI	R2, BitMask(DMA1IF_bit+0)
ORI	R2, R2, BitMask(DMA1IF_bit+0)
_SX	
;Serial_Dma.c,60 :: 		DCH1CONbits.CHPATLEN = 0;
ORI	R2, R0, 2048
SW	R2, Offset(DCH1CONbits+4)(GP)
;Serial_Dma.c,61 :: 		DCH1ECON=(147 << 8)| 0x30;         //' Specific INTERRUPT IRQ NUMBER for UART 2 TX (147)
ORI	R2, R0, 37680
SW	R2, Offset(DCH1ECON+0)(GP)
;Serial_Dma.c,62 :: 		DCH1SSA = KVA_TO_PA(0xA0002200) ;  //0xA0002200 virtual address of txBuf
ORI	R2, R0, 8704
SW	R2, Offset(DCH1SSA+0)(GP)
;Serial_Dma.c,63 :: 		DCH1DSA = KVA_TO_PA(0xBF822220) ;  //U1TX2REG for reply  [0xBF822220 = U1TXREG]
LUI	R2, 8066
ORI	R2, R2, 8736
SW	R2, Offset(DCH1DSA+0)(GP)
;Serial_Dma.c,64 :: 		DCH1DAT       = 0x0D;
ORI	R2, R0, 13
SW	R2, Offset(DCH1DAT+0)(GP)
;Serial_Dma.c,66 :: 		DCH1SSIZ = 200  ;  //' This is how many bytes you want to send out in a block transfer for UART transmitter
ORI	R2, R0, 200
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Serial_Dma.c,68 :: 		DCH1DSIZ = 1  ;    //' This is how many bytes come from the destination - i.e. rxBuf recieved can change dynamicall as its send buffer
ORI	R2, R0, 1
SW	R2, Offset(DCH1DSIZ+0)(GP)
;Serial_Dma.c,70 :: 		DCH1CSIZ = 200  ;  //' x bytes from txBuf in a cell waiting to send out 1 byte at a time to U1TXREG / DCH1DSIZ
ORI	R2, R0, 200
SW	R2, Offset(DCH1CSIZ+0)(GP)
;Serial_Dma.c,72 :: 		DCH1INTCLR  =  0x00FF00FF ; //'clear all interrupts and clear all interrupt flags
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,73 :: 		CHBCIE_DCH1INT_bit = 1    ; //'Enable Channel Block transfer interrupt
LUI	R2, BitMask(CHBCIE_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHBCIE_DCH1INT_bit+0)
_SX	
;Serial_Dma.c,74 :: 		CHERIE_DCH1INT_bit = 1    ; //'Enable Channel Address Error interrupt
LUI	R2, BitMask(CHERIE_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHERIE_DCH1INT_bit+0)
_SX	
;Serial_Dma.c,76 :: 		DMA1IP2_bit = 1 ;           //' DMA1 interrupt priority 5
LUI	R2, BitMask(DMA1IP2_bit+0)
ORI	R2, R2, BitMask(DMA1IP2_bit+0)
_SX	
;Serial_Dma.c,77 :: 		DMA1IP1_bit = 0 ;
LUI	R2, BitMask(DMA1IP1_bit+0)
ORI	R2, R2, BitMask(DMA1IP1_bit+0)
_SX	
;Serial_Dma.c,78 :: 		DMA1IP0_bit = 1 ;
LUI	R2, BitMask(DMA1IP0_bit+0)
ORI	R2, R2, BitMask(DMA1IP0_bit+0)
_SX	
;Serial_Dma.c,79 :: 		DMA1IS1_bit = 0 ;           //' sub-priority 1
LUI	R2, BitMask(DMA1IS1_bit+0)
ORI	R2, R2, BitMask(DMA1IS1_bit+0)
_SX	
;Serial_Dma.c,80 :: 		DMA1IS0_bit = 1 ;
LUI	R2, BitMask(DMA1IS0_bit+0)
ORI	R2, R2, BitMask(DMA1IS0_bit+0)
_SX	
;Serial_Dma.c,81 :: 		DMA1IE_bit  = 1 ;           //' enable DMA1 interrupt
LUI	R2, BitMask(DMA1IE_bit+0)
ORI	R2, R2, BitMask(DMA1IE_bit+0)
_SX	
;Serial_Dma.c,82 :: 		}
L_end_DMA1:
JR	RA
NOP	
; end of _DMA1
