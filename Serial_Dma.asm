_DMA_global:
;Serial_Dma.c,16 :: 		void DMA_global(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Serial_Dma.c,17 :: 		DMACON = 1<<15;   //enable the DMA controller
ORI	R2, R0, 32768
SW	R2, Offset(DMACON+0)(GP)
;Serial_Dma.c,18 :: 		DMA0();
JAL	_DMA0+0
NOP	
;Serial_Dma.c,19 :: 		DMA1();
JAL	_DMA1+0
NOP	
;Serial_Dma.c,20 :: 		}
L_end_DMA_global:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _DMA_global
_DMA0:
;Serial_Dma.c,32 :: 		void  DMA0(){
;Serial_Dma.c,34 :: 		IEC4CLR       = 1 << 6;
ORI	R2, R0, 64
SW	R2, Offset(IEC4CLR+0)(GP)
;Serial_Dma.c,37 :: 		DCH0INTCLR    = 0x00FF00FF ;
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Serial_Dma.c,40 :: 		DCH0ECON      =(146 << 8 ) | 0x30;
ORI	R2, R0, 37424
SW	R2, Offset(DCH0ECON+0)(GP)
;Serial_Dma.c,44 :: 		DCH0DAT       =  '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH0DAT+0)(GP)
;Serial_Dma.c,47 :: 		DCH0SSA       = KVA_TO_PA(0xBF822230);    //[0xBF822230 = U2RXREG]
LUI	R2, 8066
ORI	R2, R2, 8752
SW	R2, Offset(DCH0SSA+0)(GP)
;Serial_Dma.c,48 :: 		DCH0SSIZ      = 1;                 // source size = 1byte at a time
ORI	R2, R0, 1
SW	R2, Offset(DCH0SSIZ+0)(GP)
;Serial_Dma.c,51 :: 		DCH0DSA       = KVA_TO_PA(0xA0002000);    // virtual address:= IN RAM FOR RECIEVED DATA
ORI	R2, R0, 8192
SW	R2, Offset(DCH0DSA+0)(GP)
;Serial_Dma.c,52 :: 		DCH0DSIZ      = 200  ;  // destination size = Size for the 'rxBuf' to fill up with received characters. It is = 5 in this example...
ORI	R2, R0, 200
SW	R2, Offset(DCH0DSIZ+0)(GP)
;Serial_Dma.c,55 :: 		DCH0CSIZ      = 1  ;  // bytes transferred in the background
ORI	R2, R0, 1
SW	R2, Offset(DCH0CSIZ+0)(GP)
;Serial_Dma.c,58 :: 		IPC33CLR      = 0x17 << 16 ;//' clear DMA channel priority and sub-priority
LUI	R2, 23
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,59 :: 		IPC33SET      = (0x17 << 16);
LUI	R2, 23
SW	R2, Offset(IPC33SET+0)(GP)
;Serial_Dma.c,60 :: 		IEC4SET       = 1 << 6;
ORI	R2, R0, 64
SW	R2, Offset(IEC4SET+0)(GP)
;Serial_Dma.c,61 :: 		IFS4CLR       = 1 << 6;
ORI	R2, R0, 64
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,64 :: 		DCH0INTSET      =  0x9 << 16;
LUI	R2, 9
SW	R2, Offset(DCH0INTSET+0)(GP)
;Serial_Dma.c,67 :: 		DCH0CONSET        = 0X093;
ORI	R2, R0, 147
SW	R2, Offset(DCH0CONSET+0)(GP)
;Serial_Dma.c,68 :: 		}
L_end_DMA0:
JR	RA
NOP	
; end of _DMA0
_DMA1:
;Serial_Dma.c,82 :: 		void DMA1(){
;Serial_Dma.c,85 :: 		IPC33CLR      = 0x16 << 24;
LUI	R2, 5632
SW	R2, Offset(IPC33CLR+0)(GP)
;Serial_Dma.c,86 :: 		IEC4CLR       = 1 << 7;
ORI	R2, R0, 128
SW	R2, Offset(IEC4CLR+0)(GP)
;Serial_Dma.c,87 :: 		IFS4CLR       = 1 << 7;
ORI	R2, R0, 128
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,90 :: 		DCH1INTCLR    = 0x00FF00FF ;
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,93 :: 		DCH1ECON=(147 << 8)| 0x30;
ORI	R2, R0, 37680
SW	R2, Offset(DCH1ECON+0)(GP)
;Serial_Dma.c,98 :: 		DCH1DAT       = '\n';
ORI	R2, R0, 10
SW	R2, Offset(DCH1DAT+0)(GP)
;Serial_Dma.c,101 :: 		DCH1SSA = KVA_TO_PA(0xA0002200) ;  //0xA0002200 virtual address of txBuf
ORI	R2, R0, 8704
SW	R2, Offset(DCH1SSA+0)(GP)
;Serial_Dma.c,102 :: 		DCH1SSIZ = 200;  //' This is how many bytes you want to send out in a block transfer for UART transmitter
ORI	R2, R0, 200
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Serial_Dma.c,106 :: 		DCH1DSA = KVA_TO_PA(0xBF822220) ;
LUI	R2, 8066
ORI	R2, R2, 8736
SW	R2, Offset(DCH1DSA+0)(GP)
;Serial_Dma.c,107 :: 		DCH1DSIZ = 1;
ORI	R2, R0, 1
SW	R2, Offset(DCH1DSIZ+0)(GP)
;Serial_Dma.c,110 :: 		DCH1CSIZ = 1;    //' x bytes from txBuf in a cell waiting to send out 1 byte at a time to U1TXREG / DCH1DSIZ
ORI	R2, R0, 1
SW	R2, Offset(DCH1CSIZ+0)(GP)
;Serial_Dma.c,114 :: 		IPC33SET      = (0x16 << 24);
LUI	R2, 5632
SW	R2, Offset(IPC33SET+0)(GP)
;Serial_Dma.c,115 :: 		IEC4SET       = 1 << 7;
ORI	R2, R0, 128
SW	R2, Offset(IEC4SET+0)(GP)
;Serial_Dma.c,116 :: 		IFS4CLR       = 1 << 7;
ORI	R2, R0, 128
SW	R2, Offset(IFS4CLR+0)(GP)
;Serial_Dma.c,119 :: 		DCH1INTSET    =  0x9 << 16;
LUI	R2, 9
SW	R2, Offset(DCH1INTSET+0)(GP)
;Serial_Dma.c,122 :: 		DCH1CONSET    = 0x083;
ORI	R2, R0, 131
SW	R2, Offset(DCH1CONSET+0)(GP)
;Serial_Dma.c,124 :: 		}
L_end_DMA1:
JR	RA
NOP	
; end of _DMA1
_DMA_CH0_ISR:
;Serial_Dma.c,129 :: 		void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO {
RDPGPR	SP, SP
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 5120
MTC0	R30, 12, 0
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Serial_Dma.c,135 :: 		if (DCH0INTbits.CHBCIF == 1) {
LBU	R2, Offset(DCH0INTbits+0)(GP)
EXT	R2, R2, 3, 1
BNE	R2, 1, L__DMA_CH0_ISR9
NOP	
J	L_DMA_CH0_ISR0
NOP	
L__DMA_CH0_ISR9:
;Serial_Dma.c,136 :: 		dma1int_flag = 0;         //flags to sample in code if needed
SB	R0, Offset(_dma1int_flag+0)(GP)
;Serial_Dma.c,137 :: 		dma0int_flag = 1;
ORI	R2, R0, 1
SB	R2, Offset(_dma0int_flag+0)(GP)
;Serial_Dma.c,140 :: 		DCH1CONbits.CHEN  = 1;
ORI	R2, R0, 128
SW	R2, Offset(DCH1CONbits+8)(GP)
;Serial_Dma.c,141 :: 		i = strlen(rxBuf);
LUI	R25, 40960
ORI	R25, R25, 8192
JAL	_strlen+0
NOP	
; i start address is: 24 (R6)
SEH	R6, R2
;Serial_Dma.c,142 :: 		dma0int_flag = 1;          // user flag to inform this int was triggered. should be cleared in software
ORI	R3, R0, 1
SB	R3, Offset(_dma0int_flag+0)(GP)
;Serial_Dma.c,143 :: 		memcpy(txBuf, rxBuf, i);   // copy RxBuf -> TxBuf  BUFFER_LENGTH
SEH	R27, R2
LUI	R26, 40960
ORI	R26, R26, 8192
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_memcpy+0
NOP	
;Serial_Dma.c,144 :: 		DCH1SSIZ            = i ;  // change the size of block register
SEH	R2, R6
; i end address is: 24 (R6)
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Serial_Dma.c,146 :: 		DCH1ECONbits.CFORCE = 1 ;  // force DMA1 interrupt trigger
ORI	R2, R0, 128
SW	R2, Offset(DCH1ECONbits+8)(GP)
;Serial_Dma.c,147 :: 		}
L_DMA_CH0_ISR0:
;Serial_Dma.c,150 :: 		if( CHERIF_bit == 1){       // test error int flag
_LX	
EXT	R2, R2, BitPos(CHERIF_bit+0), 1
BNE	R2, 1, L__DMA_CH0_ISR11
NOP	
J	L_DMA_CH0_ISR1
NOP	
L__DMA_CH0_ISR11:
;Serial_Dma.c,153 :: 		memcpy(txBuf,"CHERIF Error\r",15);
ADDIU	R23, SP, 4
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr1_Serial_Dma+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Serial_Dma+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 4
ORI	R27, R0, 15
MOVZ	R26, R2, R0
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_memcpy+0
NOP	
;Serial_Dma.c,154 :: 		DCH1SSIZ = 13;           //set block size of transfer
ORI	R2, R0, 13
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Serial_Dma.c,155 :: 		DCH1ECONbits.CFORCE = 1 ;// force DMA1 interrupt trigger
ORI	R2, R0, 128
SW	R2, Offset(DCH1ECONbits+8)(GP)
;Serial_Dma.c,156 :: 		}
L_DMA_CH0_ISR1:
;Serial_Dma.c,157 :: 		DCH0INTCLR  = 0x00FF;       // clear DMA 0 int flags
ORI	R2, R0, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Serial_Dma.c,158 :: 		}
L_end_DMA_CH0_ISR:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
DI	
EHB	
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 12(SP)
ADDIU	SP, SP, 16
WRPGPR	SP, SP
ERET	
; end of _DMA_CH0_ISR
_DMA_CH1_ISR:
;Serial_Dma.c,162 :: 		void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_AUTO {
RDPGPR	SP, SP
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 5120
MTC0	R30, 12, 0
;Serial_Dma.c,165 :: 		if (DCH1INTbits.CHBCIF){
LBU	R2, Offset(DCH1INTbits+0)(GP)
EXT	R2, R2, 3, 1
BNE	R2, R0, L__DMA_CH1_ISR14
NOP	
J	L_DMA_CH1_ISR2
NOP	
L__DMA_CH1_ISR14:
;Serial_Dma.c,166 :: 		dma1int_flag = 1;
ORI	R2, R0, 1
SB	R2, Offset(_dma1int_flag+0)(GP)
;Serial_Dma.c,167 :: 		dma0int_flag = 0;
SB	R0, Offset(_dma0int_flag+0)(GP)
;Serial_Dma.c,170 :: 		}
L_DMA_CH1_ISR2:
;Serial_Dma.c,172 :: 		if( CHERIF_DCH1INT_bit == 1){
_LX	
EXT	R2, R2, BitPos(CHERIF_DCH1INT_bit+0), 1
BNE	R2, 1, L__DMA_CH1_ISR16
NOP	
J	L_DMA_CH1_ISR3
NOP	
L__DMA_CH1_ISR16:
;Serial_Dma.c,175 :: 		}
L_DMA_CH1_ISR3:
;Serial_Dma.c,177 :: 		DCH1INTCLR   = 0x00FF;                     // clear event flags
ORI	R2, R0, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Serial_Dma.c,180 :: 		}
L_end_DMA_CH1_ISR:
DI	
EHB	
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 12(SP)
ADDIU	SP, SP, 16
WRPGPR	SP, SP
ERET	
; end of _DMA_CH1_ISR
