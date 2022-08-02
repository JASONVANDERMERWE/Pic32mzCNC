<<<<<<< HEAD
_Timer6Interrupt:
;Main.c,22 :: 		void Timer6Interrupt() iv IVT_TIMER_6 ilevel 7 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 7168
MTC0	R30, 12, 0
;Main.c,26 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__Timer6Interrupt42
NOP	
J	L_Timer6Interrupt0
NOP	
L__Timer6Interrupt42:
;Main.c,27 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_Timer6Interrupt1:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 2
BNE	R2, R0, L__Timer6Interrupt43
NOP	
J	L_Timer6Interrupt2
NOP	
L__Timer6Interrupt43:
;Main.c,28 :: 		STPS[ii].PLS_Step_     = 0;
SEH	R2, R4
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
INS	R2, R0, 1, 1
SB	R2, 0(R3)
;Main.c,29 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 3
BEQ	R2, R0, L__Timer6Interrupt44
NOP	
J	L_Timer6Interrupt4
NOP	
L__Timer6Interrupt44:
; ii end address is: 16 (R4)
J	L_Timer6Interrupt2
NOP	
L_Timer6Interrupt4:
;Main.c,30 :: 		if(ii == X)PLS_StepX   = 0;
; ii start address is: 16 (R4)
SEH	R2, R4
BEQ	R2, R0, L__Timer6Interrupt45
NOP	
J	L_Timer6Interrupt5
NOP	
L__Timer6Interrupt45:
SH	R0, Offset(PLS_StepX+0)(GP)
L_Timer6Interrupt5:
;Main.c,31 :: 		if(ii == Y)PLS_StepY   = 0;
SEH	R3, R4
ORI	R2, R0, 1
BEQ	R3, R2, L__Timer6Interrupt46
NOP	
J	L_Timer6Interrupt6
NOP	
L__Timer6Interrupt46:
SH	R0, Offset(PLS_StepY+0)(GP)
L_Timer6Interrupt6:
;Main.c,27 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Main.c,32 :: 		}
; ii end address is: 16 (R4)
J	L_Timer6Interrupt1
NOP	
L_Timer6Interrupt2:
;Main.c,33 :: 		}
L_Timer6Interrupt0:
;Main.c,34 :: 		T6IE_bit      = 0;
LUI	R2, BitMask(T6IE_bit+0)
ORI	R2, R2, BitMask(T6IE_bit+0)
_SX	
;Main.c,35 :: 		}
L_end_Timer6Interrupt:
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _Timer6Interrupt
_Timer7Interrupt:
;Main.c,38 :: 		void Timer7Interrupt() iv IVT_TIMER_7 ilevel 4 ics ICS_SRS{
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 4096
MTC0	R30, 12, 0
;Main.c,39 :: 		T7IF_bit  = 0;
LUI	R2, BitMask(T7IF_bit+0)
ORI	R2, R2, BitMask(T7IF_bit+0)
_SX	
;Main.c,41 :: 		TMR.mSec++;
LHU	R2, Offset(_TMR+8)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR+8)(GP)
;Main.c,42 :: 		if(TMR.mSec > 999){
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__Timer7Interrupt48
NOP	
J	L_Timer7Interrupt7
NOP	
L__Timer7Interrupt48:
;Main.c,43 :: 		LATA9_bit = !LATA9_bit;
_LX	
EXT	R2, R2, BitPos(LATA9_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATA9_bit+0), 1
_SX	
;Main.c,44 :: 		TMR.mSec = 0;
SH	R0, Offset(_TMR+8)(GP)
;Main.c,45 :: 		TMR.Sec++;
LBU	R2, Offset(_TMR+10)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(_TMR+10)(GP)
;Main.c,46 :: 		if(TMR.Sec > 59){
ANDI	R2, R2, 255
SLTIU	R2, R2, 60
BEQ	R2, R0, L__Timer7Interrupt49
NOP	
J	L_Timer7Interrupt8
NOP	
L__Timer7Interrupt49:
;Main.c,47 :: 		TMR.Sec = 0;
SB	R0, Offset(_TMR+10)(GP)
;Main.c,48 :: 		}
L_Timer7Interrupt8:
;Main.c,49 :: 		}
L_Timer7Interrupt7:
;Main.c,50 :: 		}
L_end_Timer7Interrupt:
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _Timer7Interrupt
_Timer8Interrupt:
;Main.c,53 :: 		void Timer8Interrupt() iv IVT_TIMER_8 ilevel 4 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 4096
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Main.c,56 :: 		if(oneShotA){
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BNE	R2, R0, L__Timer8Interrupt52
NOP	
J	L_Timer8Interrupt9
NOP	
L__Timer8Interrupt52:
;Main.c,57 :: 		CycleStart();
JAL	_CycleStart+0
NOP	
;Main.c,58 :: 		}else{
J	L_Timer8Interrupt10
NOP	
L_Timer8Interrupt9:
;Main.c,59 :: 		CycleStop();
JAL	_CycleStop+0
NOP	
;Main.c,60 :: 		}
L_Timer8Interrupt10:
;Main.c,61 :: 		T8IF_bit  = 0;
LUI	R2, BitMask(T8IF_bit+0)
ORI	R2, R2, BitMask(T8IF_bit+0)
_SX	
;Main.c,62 :: 		}
L_end_Timer8Interrupt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _Timer8Interrupt
_uart2_Rx_interrupt:
;Main.c,67 :: 		void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 7 ics ICS_AUTO {
=======
_uart2_Rx_interrupt:
;Main.c,28 :: 		void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 7 ics ICS_AUTO {
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
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
ORI	R30, R0, 7168
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
<<<<<<< HEAD
;Main.c,68 :: 		uart_rd = UART2_Read();
JAL	_UART2_Read+0
NOP	
SB	R2, Offset(_uart_rd+0)(GP)
;Main.c,69 :: 		UART2_Write( uart_rd );
ANDI	R25, R2, 255
JAL	_UART2_Write+0
NOP	
;Main.c,71 :: 		U2RXIF_bit = 0;            // Ensure interrupt is not pending
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
;Main.c,72 :: 		}
=======
;Main.c,29 :: 		uart_rd = UART2_Read();
JAL	_UART2_Read+0
NOP	
SB	R2, Offset(_uart_rd+0)(GP)
;Main.c,30 :: 		UART2_Write( uart_rd );
ANDI	R25, R2, 255
JAL	_UART2_Write+0
NOP	
;Main.c,32 :: 		U2RXIF_bit = 0;            // Ensure interrupt is not pending
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
;Main.c,33 :: 		}
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
L_end_uart2_Rx_interrupt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
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
; end of _uart2_Rx_interrupt
_DMA_CH0_ISR:
<<<<<<< HEAD
;Main.c,76 :: 		void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO {
=======
;Main.c,37 :: 		void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO {
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
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
<<<<<<< HEAD
;Main.c,79 :: 		if (CHBCIF_bit == 1) {         // Channel Block Transfer has Completed Interrupt Flag bit
=======
;Main.c,40 :: 		if (CHBCIF_bit == 1) {         // Channel Block Transfer has Completed Interrupt Flag bit
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
_LX	
EXT	R2, R2, BitPos(CHBCIF_bit+0), 1
BNE	R2, 1, L__DMA_CH0_ISR50
NOP	
J	L_DMA_CH0_ISR0
NOP	
<<<<<<< HEAD
L__DMA_CH0_ISR56:
;Main.c,83 :: 		i = strlen(rxBuf);
=======
L__DMA_CH0_ISR50:
;Main.c,44 :: 		i = strlen(rxBuf);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R25, 40960
ORI	R25, R25, 8192
JAL	_strlen+0
NOP	
SH	R2, 4(SP)
<<<<<<< HEAD
;Main.c,84 :: 		dma0int_flag = 1;          // user flag to inform this int was triggered. should be cleared in software
ORI	R3, R0, 1
SB	R3, Offset(_dma0int_flag+0)(GP)
;Main.c,85 :: 		memcpy(txBuf, rxBuf, i);   // copy RxBuf -> TxBuf  BUFFER_LENGTH
=======
;Main.c,45 :: 		dma0int_flag = 1;          // user flag to inform this int was triggered. should be cleared in software
ORI	R3, R0, 1
SB	R3, Offset(_dma0int_flag+0)(GP)
;Main.c,46 :: 		memcpy(txBuf, rxBuf, i);   // copy RxBuf -> TxBuf  BUFFER_LENGTH
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
SEH	R27, R2
LUI	R26, 40960
ORI	R26, R26, 8192
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_memcpy+0
NOP	
<<<<<<< HEAD
;Main.c,86 :: 		CHEN_DCH1CON_bit = 1;     // Enable the DMA1 channel to transmit back what was received
LUI	R2, BitMask(CHEN_DCH1CON_bit+0)
ORI	R2, R2, BitMask(CHEN_DCH1CON_bit+0)
_SX	
;Main.c,87 :: 		}
L_DMA_CH0_ISR11:
;Main.c,88 :: 		DCH1SSIZ            = i ;
LH	R2, 4(SP)
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Main.c,91 :: 		if( CHERIF_bit == 1){                     // clear channel error int flag
=======
;Main.c,47 :: 		CHEN_DCH1CON_bit = 1;     // Enable the DMA1 channel to transmit back what was received
LUI	R2, BitMask(CHEN_DCH1CON_bit+0)
ORI	R2, R2, BitMask(CHEN_DCH1CON_bit+0)
_SX	
;Main.c,48 :: 		}
L_DMA_CH0_ISR0:
;Main.c,49 :: 		DCH1SSIZ            = i ;
LH	R2, 4(SP)
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Main.c,52 :: 		if( CHERIF_bit == 1){                     // clear channel error int flag
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
_LX	
EXT	R2, R2, BitPos(CHERIF_bit+0), 1
BNE	R2, 1, L__DMA_CH0_ISR52
NOP	
J	L_DMA_CH0_ISR1
NOP	
<<<<<<< HEAD
L__DMA_CH0_ISR58:
;Main.c,92 :: 		CHERIF_bit = 0;
LUI	R2, BitMask(CHERIF_bit+0)
ORI	R2, R2, BitMask(CHERIF_bit+0)
_SX	
;Main.c,93 :: 		memcpy(txBuf,"CHERIF Error",13);
ADDIU	R23, SP, 6
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
=======
L__DMA_CH0_ISR52:
;Main.c,53 :: 		CHERIF_bit = 0;
LUI	R2, BitMask(CHERIF_bit+0)
ORI	R2, R2, BitMask(CHERIF_bit+0)
_SX	
;Main.c,54 :: 		memcpy(txBuf,"CHERIF Error",13);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
ORI	R27, R0, 13
MOVZ	R26, R2, R0
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_memcpy+0
NOP	
<<<<<<< HEAD
;Main.c,94 :: 		}
L_DMA_CH0_ISR12:
;Main.c,95 :: 		DCH0INTCLR          = 0x00FF;             // clear DMA 0 int flags
ORI	R2, R0, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Main.c,98 :: 		CHEN_bit            = 1 ;                 // Enable channel - may want to do this when you are ready to receive...
LUI	R2, BitMask(CHEN_bit+0)
ORI	R2, R2, BitMask(CHEN_bit+0)
_SX	
;Main.c,100 :: 		CFORCE_DCH1ECON_bit = 1 ;                 // force DMA1 interrupt trigger
LUI	R2, BitMask(CFORCE_DCH1ECON_bit+0)
ORI	R2, R2, BitMask(CFORCE_DCH1ECON_bit+0)
_SX	
;Main.c,101 :: 		DMA0IF_bit          = 0 ;                 // clear DMA0 int flag
LUI	R2, BitMask(DMA0IF_bit+0)
ORI	R2, R2, BitMask(DMA0IF_bit+0)
_SX	
;Main.c,103 :: 		}
=======
;Main.c,55 :: 		}
L_DMA_CH0_ISR1:
;Main.c,56 :: 		DCH0INTCLR          = 0x00FF;             // clear DMA 0 int flags
ORI	R2, R0, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Main.c,59 :: 		CHEN_bit            = 1 ;                 // Enable channel - may want to do this when you are ready to receive...
LUI	R2, BitMask(CHEN_bit+0)
ORI	R2, R2, BitMask(CHEN_bit+0)
_SX	
;Main.c,61 :: 		CFORCE_DCH1ECON_bit = 1 ;                 // force DMA1 interrupt trigger
LUI	R2, BitMask(CFORCE_DCH1ECON_bit+0)
ORI	R2, R2, BitMask(CFORCE_DCH1ECON_bit+0)
_SX	
;Main.c,62 :: 		DMA0IF_bit          = 0 ;                 // clear DMA0 int flag
LUI	R2, BitMask(DMA0IF_bit+0)
ORI	R2, R2, BitMask(DMA0IF_bit+0)
_SX	
;Main.c,64 :: 		}
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
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
<<<<<<< HEAD
;Main.c,106 :: 		void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_AUTO {
=======
;Main.c,67 :: 		void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_AUTO {
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
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
<<<<<<< HEAD
;Main.c,107 :: 		int ptr = 0;
;Main.c,110 :: 		if (CHBCIF_DCH1INT_bit == 1){
=======
;Main.c,68 :: 		int ptr = 0;
;Main.c,71 :: 		if (CHBCIF_DCH1INT_bit == 1){
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
_LX	
EXT	R2, R2, BitPos(CHBCIF_DCH1INT_bit+0), 1
BNE	R2, 1, L__DMA_CH1_ISR55
NOP	
J	L_DMA_CH1_ISR2
NOP	
<<<<<<< HEAD
L__DMA_CH1_ISR61:
;Main.c,111 :: 		CHBCIF_DCH1INT_bit = 0;             // clear flag
LUI	R2, BitMask(CHBCIF_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHBCIF_DCH1INT_bit+0)
_SX	
;Main.c,112 :: 		}
L_DMA_CH1_ISR13:
;Main.c,114 :: 		if( CHERIF_DCH1INT_bit == 1){
=======
L__DMA_CH1_ISR55:
;Main.c,72 :: 		CHBCIF_DCH1INT_bit = 0;             // clear flag
LUI	R2, BitMask(CHBCIF_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHBCIF_DCH1INT_bit+0)
_SX	
;Main.c,73 :: 		}
L_DMA_CH1_ISR2:
;Main.c,75 :: 		if( CHERIF_DCH1INT_bit == 1){
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
_LX	
EXT	R2, R2, BitPos(CHERIF_DCH1INT_bit+0), 1
BNE	R2, 1, L__DMA_CH1_ISR57
NOP	
J	L_DMA_CH1_ISR3
NOP	
<<<<<<< HEAD
L__DMA_CH1_ISR63:
;Main.c,115 :: 		CHERIF_DCH1INT_bit = 0;
LUI	R2, BitMask(CHERIF_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHERIF_DCH1INT_bit+0)
_SX	
;Main.c,117 :: 		}
L_DMA_CH1_ISR14:
;Main.c,119 :: 		dma1int_flag = 1;                          // user flag to inform this int was triggered. should be cleared in software
ORI	R2, R0, 1
SB	R2, Offset(_dma1int_flag+0)(GP)
;Main.c,120 :: 		DCH1INTCLR   = 0x00FF;                     // clear event flags
ORI	R2, R0, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Main.c,121 :: 		DMA1IF_bit   = 0 ;
LUI	R2, BitMask(DMA1IF_bit+0)
ORI	R2, R2, BitMask(DMA1IF_bit+0)
_SX	
;Main.c,123 :: 		}
=======
L__DMA_CH1_ISR57:
;Main.c,76 :: 		CHERIF_DCH1INT_bit = 0;
LUI	R2, BitMask(CHERIF_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHERIF_DCH1INT_bit+0)
_SX	
;Main.c,78 :: 		}
L_DMA_CH1_ISR3:
;Main.c,80 :: 		dma1int_flag = 1;                          // user flag to inform this int was triggered. should be cleared in software
ORI	R2, R0, 1
SB	R2, Offset(_dma1int_flag+0)(GP)
;Main.c,81 :: 		DCH1INTCLR   = 0x00FF;                     // clear event flags
ORI	R2, R0, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Main.c,82 :: 		DMA1IF_bit   = 0 ;
LUI	R2, BitMask(DMA1IF_bit+0)
ORI	R2, R2, BitMask(DMA1IF_bit+0)
_SX	
;Main.c,84 :: 		}
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
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
<<<<<<< HEAD
_StepX:
;Main.c,127 :: 		void StepX() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {
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
ORI	R30, R0, 3072
MTC0	R30, 12, 0
;Main.c,129 :: 		STmr.compOCxRunning = 2;
ORI	R2, R0, 2
SH	R2, Offset(_STmr+8)(GP)
;Main.c,130 :: 		TMR4 =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Main.c,131 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Main.c,133 :: 		}
L_end_StepX:
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
; end of _StepX
_StepY:
;Main.c,134 :: 		void StepY() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {
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
ORI	R30, R0, 3072
MTC0	R30, 12, 0
;Main.c,136 :: 		STmr.compOCxRunning = 1;
ORI	R2, R0, 1
SH	R2, Offset(_STmr+8)(GP)
;Main.c,137 :: 		TMR2 =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Main.c,138 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Main.c,140 :: 		}
L_end_StepY:
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
; end of _StepY
_main:
;Main.c,143 :: 		void main() {
;Main.c,146 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,147 :: 		SetPinMode();
JAL	_SetPinMode+0
NOP	
;Main.c,148 :: 		StepperConstants(4500,4500);
ORI	R26, R0, 4500
ORI	R25, R0, 4500
JAL	_StepperConstants+0
NOP	
;Main.c,149 :: 		EnableInterrupts();
EI	R30
;Main.c,150 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,151 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,4,txt);
=======
_main:
;Main.c,89 :: 		void main() {
;Main.c,92 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,93 :: 		SetPinMode();
JAL	_SetPinMode+0
NOP	
;Main.c,94 :: 		StepperConstants(8500,8500);
ORI	R26, R0, 8500
ORI	R25, R0, 8500
JAL	_StepperConstants+0
NOP	
;Main.c,95 :: 		EnableInterrupts();
EI	R30
;Main.c,96 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,97 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,4,txt);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 4
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,152 :: 		while(1){
L_main15:
;Main.c,154 :: 		if((!RC3_bit)&&(!oneShotA)){
=======
;Main.c,98 :: 		while(1){
L_main4:
;Main.c,100 :: 		if((RB0_bit)&&(!oneShotA)){
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
_LX	
EXT	R2, R2, BitPos(RB0_bit+0), 1
BNE	R2, R0, L__main60
NOP	
J	L__main42
NOP	
L__main60:
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BEQ	R2, R0, L__main61
NOP	
J	L__main41
NOP	
<<<<<<< HEAD
L__main68:
L__main36:
;Main.c,156 :: 		oneShotA     = 1;
LBU	R2, Offset(_oneShotA+0)(GP)
ORI	R2, R2, BitMask(_oneShotA+0)
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,158 :: 		SV.px = 0;
SW	R0, Offset(_SV+20)(GP)
;Main.c,159 :: 		SV.py = 0;
SW	R0, Offset(_SV+24)(GP)
;Main.c,160 :: 		EnStepper();
JAL	_EnStepper+0
NOP	
;Main.c,161 :: 		a = 2;
ORI	R2, R0, 2
SH	R2, Offset(Main_a+0)(GP)
;Main.c,154 :: 		if((!RC3_bit)&&(!oneShotA)){
L__main38:
L__main37:
;Main.c,164 :: 		if(oneShotA){
=======
L__main61:
L__main40:
;Main.c,102 :: 		oneShotA     = 1;
LBU	R2, Offset(_oneShotA+0)(GP)
ORI	R2, R2, BitMask(_oneShotA+0)
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,104 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,105 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,106 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,107 :: 		a = 0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,100 :: 		if((RB0_bit)&&(!oneShotA)){
L__main42:
L__main41:
;Main.c,110 :: 		if(oneShotA){
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BNE	R2, R0, L__main63
NOP	
J	L_main9
NOP	
<<<<<<< HEAD
L__main70:
;Main.c,165 :: 		switch(a){
J	L_main21
NOP	
;Main.c,166 :: 		case 0:
L_main23:
;Main.c,167 :: 		STPS[X].mmToTravel = calcSteps(-25.25,8.06);
=======
L__main63:
;Main.c,111 :: 		LATA9_bit = 1;
LUI	R2, BitMask(LATA9_bit+0)
ORI	R2, R2, BitMask(LATA9_bit+0)
_SX	
;Main.c,112 :: 		switch(a){
J	L_main10
NOP	
;Main.c,113 :: 		case 0:
L_main12:
;Main.c,114 :: 		STPS[Z].mmToTravel = calcSteps(-125.25,8.06);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49914
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+188)(GP)
;Main.c,115 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,116 :: 		SingleAxisStep(STPS[Z].mmToTravel,Z);
ORI	R26, R0, 2
LW	R25, Offset(_STPS+188)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,117 :: 		a = 1;
ORI	R2, R0, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,118 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,119 :: 		break;
J	L_main11
NOP	
;Main.c,120 :: 		case 1:
L_main13:
;Main.c,124 :: 		if(SV.Tog == 1)a=2;
LH	R3, Offset(_SV+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main64
NOP	
J	L_main14
NOP	
L__main64:
ORI	R2, R0, 2
SH	R2, Offset(Main_a+0)(GP)
L_main14:
;Main.c,125 :: 		break;
J	L_main11
NOP	
;Main.c,126 :: 		case 2:
L_main15:
;Main.c,127 :: 		STPS[X].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+60)(GP)
<<<<<<< HEAD
;Main.c,168 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
=======
;Main.c,128 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,169 :: 		STPS[Y].mmToTravel = calcSteps(125.25,8.06);
=======
;Main.c,129 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+60)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,130 :: 		a = 3;
ORI	R2, R0, 3
SH	R2, Offset(Main_a+0)(GP)
;Main.c,131 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,132 :: 		break;
J	L_main11
NOP	
;Main.c,133 :: 		case 3:
L_main16:
;Main.c,134 :: 		if(SV.Tog == 1) a = 4;
LH	R3, Offset(_SV+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main65
NOP	
J	L_main17
NOP	
L__main65:
ORI	R2, R0, 4
SH	R2, Offset(Main_a+0)(GP)
L_main17:
;Main.c,135 :: 		break;
J	L_main11
NOP	
;Main.c,136 :: 		case 4:
L_main18:
;Main.c,137 :: 		STPS[Y].mmToTravel = calcSteps(202.00,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17226
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+124)(GP)
;Main.c,138 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,139 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+124)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,140 :: 		a = 5;
ORI	R2, R0, 5
SH	R2, Offset(Main_a+0)(GP)
;Main.c,141 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,142 :: 		break;
J	L_main11
NOP	
;Main.c,143 :: 		case 5:
L_main19:
;Main.c,144 :: 		if(SV.Tog == 1) a = 6;
LH	R3, Offset(_SV+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main66
NOP	
J	L_main20
NOP	
L__main66:
ORI	R2, R0, 6
SH	R2, Offset(Main_a+0)(GP)
L_main20:
;Main.c,145 :: 		break;
J	L_main11
NOP	
;Main.c,146 :: 		case 6:
L_main21:
;Main.c,147 :: 		STPS[Y].mmToTravel = calcSteps(125.25,8.06);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+124)(GP)
<<<<<<< HEAD
;Main.c,170 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
=======
;Main.c,148 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,171 :: 		T8IE_bit         = 1;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Main.c,172 :: 		Step(STPS[X].mmToTravel, STPS[Y].mmToTravel);
LW	R26, Offset(_STPS+124)(GP)
LW	R25, Offset(_STPS+60)(GP)
JAL	_Step+0
NOP	
;Main.c,173 :: 		a = 1;
ORI	R2, R0, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,174 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,175 :: 		break;
J	L_main22
NOP	
;Main.c,176 :: 		case 1:
L_main24:
;Main.c,177 :: 		SV.px = 0;
SW	R0, Offset(_SV+20)(GP)
;Main.c,178 :: 		SV.py = 0;
SW	R0, Offset(_SV+24)(GP)
;Main.c,179 :: 		if(SV.Tog == 1)a=2;
LH	R3, Offset(_SV+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main71
NOP	
J	L_main25
NOP	
L__main71:
ORI	R2, R0, 2
SH	R2, Offset(Main_a+0)(GP)
L_main25:
;Main.c,180 :: 		break;
J	L_main22
NOP	
;Main.c,181 :: 		case 2:
L_main26:
;Main.c,182 :: 		STPS[X].mmToTravel = calcSteps(151.25,8.06);
=======
;Main.c,149 :: 		STPS[Z].mmToTravel = calcSteps(-25.25,8.06);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49610
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+188)(GP)
;Main.c,150 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,151 :: 		DualAxisStep(STPS[Y].mmToTravel, STPS[Z].mmToTravel,yz);
ORI	R27, R0, 2
LW	R26, Offset(_STPS+188)(GP)
LW	R25, Offset(_STPS+124)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,152 :: 		a = 7;
ORI	R2, R0, 7
SH	R2, Offset(Main_a+0)(GP)
;Main.c,153 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,154 :: 		break;
J	L_main11
NOP	
;Main.c,155 :: 		case 7:
L_main22:
;Main.c,156 :: 		if(SV.Tog == 1) a = 8;
LH	R3, Offset(_SV+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main67
NOP	
J	L_main23
NOP	
L__main67:
ORI	R2, R0, 8
SH	R2, Offset(Main_a+0)(GP)
L_main23:
;Main.c,157 :: 		break;
J	L_main11
NOP	
;Main.c,158 :: 		case 8:
L_main24:
;Main.c,159 :: 		STPS[X].mmToTravel = calcSteps(225.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17249
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+60)(GP)
<<<<<<< HEAD
;Main.c,183 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
=======
;Main.c,160 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,184 :: 		STPS[Y].mmToTravel = calcSteps(-25.25,8.06);
=======
;Main.c,161 :: 		STPS[Y].mmToTravel = calcSteps(-25.25,8.06);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49610
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+124)(GP)
<<<<<<< HEAD
;Main.c,185 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
=======
;Main.c,162 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,186 :: 		T8IE_bit         = 1;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Main.c,187 :: 		Step(STPS[X].mmToTravel, STPS[Y].mmToTravel);
=======
;Main.c,163 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LW	R26, Offset(_STPS+124)(GP)
LW	R25, Offset(_STPS+60)(GP)
JAL	_DualAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,188 :: 		a = 3;
ORI	R2, R0, 3
SH	R2, Offset(Main_a+0)(GP)
;Main.c,189 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,190 :: 		break;
J	L_main22
NOP	
;Main.c,191 :: 		case 3:
L_main27:
;Main.c,192 :: 		SV.px = 0;
SW	R0, Offset(_SV+20)(GP)
;Main.c,193 :: 		SV.py = 0;
SW	R0, Offset(_SV+24)(GP)
;Main.c,194 :: 		if(SV.Tog == 1) a = 0;
LH	R3, Offset(_SV+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main72
NOP	
J	L_main28
NOP	
L__main72:
SH	R0, Offset(Main_a+0)(GP)
L_main28:
;Main.c,195 :: 		break;
J	L_main22
NOP	
;Main.c,196 :: 		default: a = 2;
L_main29:
ORI	R2, R0, 2
SH	R2, Offset(Main_a+0)(GP)
;Main.c,197 :: 		break;
J	L_main22
NOP	
;Main.c,198 :: 		}
L_main21:
LHU	R2, Offset(Main_a+0)(GP)
BNE	R2, R0, L__main74
NOP	
J	L_main23
NOP	
L__main74:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__main76
NOP	
J	L_main24
NOP	
L__main76:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__main78
=======
;Main.c,164 :: 		a = 9;
ORI	R2, R0, 9
SH	R2, Offset(Main_a+0)(GP)
;Main.c,165 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,166 :: 		break;
J	L_main11
NOP	
;Main.c,167 :: 		case 9:
L_main25:
;Main.c,168 :: 		if(SV.Tog == 1) a = 10;
LH	R3, Offset(_SV+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main68
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
NOP	
J	L_main26
NOP	
L__main68:
ORI	R2, R0, 10
SH	R2, Offset(Main_a+0)(GP)
L_main26:
;Main.c,169 :: 		break;
J	L_main11
NOP	
;Main.c,170 :: 		case 10:
L_main27:
;Main.c,171 :: 		STPS[X].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+60)(GP)
;Main.c,172 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,173 :: 		STPS[Z].mmToTravel = calcSteps(-25.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49610
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+188)(GP)
;Main.c,174 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,175 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Z].mmToTravel,xz);
ORI	R27, R0, 1
LW	R26, Offset(_STPS+188)(GP)
LW	R25, Offset(_STPS+60)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,176 :: 		a = 11;
ORI	R2, R0, 11
SH	R2, Offset(Main_a+0)(GP)
;Main.c,177 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,178 :: 		break;
J	L_main11
NOP	
;Main.c,179 :: 		case 11:
L_main28:
;Main.c,180 :: 		if(SV.Tog == 1) a = 0;
LH	R3, Offset(_SV+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main69
NOP	
J	L_main29
NOP	
L__main69:
SH	R0, Offset(Main_a+0)(GP)
L_main29:
;Main.c,181 :: 		break;
J	L_main11
NOP	
;Main.c,182 :: 		default: a = 0;
L_main30:
SH	R0, Offset(Main_a+0)(GP)
;Main.c,183 :: 		break;
J	L_main11
NOP	
;Main.c,184 :: 		}
L_main10:
LHU	R2, Offset(Main_a+0)(GP)
BNE	R2, R0, L__main71
NOP	
J	L_main12
NOP	
L__main71:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__main73
NOP	
J	L_main13
NOP	
L__main73:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__main75
NOP	
J	L_main15
NOP	
L__main75:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__main77
NOP	
J	L_main16
NOP	
L__main77:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__main79
NOP	
J	L_main18
NOP	
L__main79:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__main81
NOP	
J	L_main19
NOP	
L__main81:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L__main83
NOP	
J	L_main21
NOP	
L__main83:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 7
BNE	R3, R2, L__main85
NOP	
J	L_main22
NOP	
L__main85:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 8
BNE	R3, R2, L__main87
NOP	
J	L_main24
NOP	
L__main87:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 9
BNE	R3, R2, L__main89
NOP	
J	L_main25
NOP	
L__main89:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 10
BNE	R3, R2, L__main91
NOP	
J	L_main27
NOP	
L__main91:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 11
BNE	R3, R2, L__main93
NOP	
<<<<<<< HEAD
L_main22:
;Main.c,199 :: 		}
L_main20:
;Main.c,200 :: 		if((!RB0_bit)&&(Toggle))oneShotA = 0;
=======
J	L_main28
NOP	
L__main93:
J	L_main30
NOP	
L_main11:
;Main.c,185 :: 		}
L_main9:
;Main.c,187 :: 		if((!RC3_bit)&&(Toggle))
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
_LX	
EXT	R2, R2, BitPos(RC3_bit+0), 1
BEQ	R2, R0, L__main94
NOP	
J	L__main44
NOP	
L__main94:
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main96
NOP	
J	L__main43
NOP	
L__main96:
L__main39:
;Main.c,188 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
<<<<<<< HEAD
L__main40:
L__main39:
;Main.c,201 :: 		if(!oneShotA){
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BEQ	R2, R0, L__main84
NOP	
J	L_main33
NOP	
L__main84:
;Main.c,202 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,203 :: 		}
L_main33:
;Main.c,205 :: 		if(!RB0_bit){
_LX	
EXT	R2, R2, BitPos(RB0_bit+0), 1
BEQ	R2, R0, L__main85
NOP	
J	L_main34
NOP	
L__main85:
;Main.c,206 :: 		oneShotB       = 0;
LBU	R2, Offset(_oneShotB+0)(GP)
INS	R2, R0, BitPos(_oneShotB+0), 1
SB	R2, Offset(_oneShotB+0)(GP)
;Main.c,207 :: 		oneShotA       = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,208 :: 		STPS[X].mmToTravel = calcSteps(151.25,8.06);
=======
;Main.c,187 :: 		if((!RC3_bit)&&(Toggle))
L__main44:
L__main43:
;Main.c,190 :: 		if(!oneShotA){
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BEQ	R2, R0, L__main97
NOP	
J	L_main34
NOP	
L__main97:
;Main.c,191 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,192 :: 		}
L_main34:
;Main.c,194 :: 		if((!RC3_bit)&&(!Toggle)){
_LX	
EXT	R2, R2, BitPos(RC3_bit+0), 1
BEQ	R2, R0, L__main98
NOP	
J	L__main46
NOP	
L__main98:
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main99
NOP	
J	L__main45
NOP	
L__main99:
L__main38:
;Main.c,195 :: 		oneShotB       = 0;
LBU	R2, Offset(_oneShotB+0)(GP)
INS	R2, R0, BitPos(_oneShotB+0), 1
SB	R2, Offset(_oneShotB+0)(GP)
;Main.c,196 :: 		oneShotA       = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,197 :: 		STPS[X].mmToTravel = calcSteps(151.25,8.06);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17175
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+60)(GP)
<<<<<<< HEAD
;Main.c,209 :: 		speed_cntr_Move(STPS[X].mmToTravel, 2500,X);
=======
;Main.c,198 :: 		speed_cntr_Move(STPS[X].mmToTravel, 2500,X);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
MOVZ	R27, R0, R0
ORI	R26, R0, 2500
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,210 :: 		STPS[Y].mmToTravel = calcSteps(-151.25,8.06);
=======
;Main.c,199 :: 		STPS[Y].mmToTravel = calcSteps(-151.25,8.06);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49943
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+124)(GP)
<<<<<<< HEAD
;Main.c,211 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 2500,Y);
=======
;Main.c,200 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 2500,Y);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
ORI	R27, R0, 1
ORI	R26, R0, 2500
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,215 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
=======
;Main.c,204 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LW	R2, Offset(_STPS+44)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_2_Main+0)
ORI	R2, R2, lo_addr(?lstr_2_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;Main.c,216 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
=======
;Main.c,205 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,218 :: 		sprintf(txt,"%d",STPS[0].decel_start);
=======
;Main.c,207 :: 		sprintf(txt,"%d",STPS[0].decel_start);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LW	R2, Offset(_STPS+12)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_Main+0)
ORI	R2, R2, lo_addr(?lstr_3_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;Main.c,219 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
=======
;Main.c,208 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,223 :: 		sprintf(txt,"%d",STPS[0].step_delay);
=======
;Main.c,212 :: 		sprintf(txt,"%d",STPS[0].step_delay);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LW	R2, Offset(_STPS+8)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_Main+0)
ORI	R2, R2, lo_addr(?lstr_4_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;Main.c,224 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
=======
;Main.c,213 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,226 :: 		sprintf(txt,"%d",STPS[0].min_delay);
=======
;Main.c,215 :: 		sprintf(txt,"%d",STPS[0].min_delay);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LW	R2, Offset(_STPS+20)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_Main+0)
ORI	R2, R2, lo_addr(?lstr_5_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;Main.c,227 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
=======
;Main.c,216 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,231 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
=======
;Main.c,220 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LW	R2, Offset(_STPS+48)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_6_Main+0)
ORI	R2, R2, lo_addr(?lstr_6_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;Main.c,232 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
=======
;Main.c,221 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,234 :: 		sprintf(txt,"%d",STPS[0].decel_val);
=======
;Main.c,223 :: 		sprintf(txt,"%d",STPS[0].decel_val);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LW	R2, Offset(_STPS+16)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_Main+0)
ORI	R2, R2, lo_addr(?lstr_7_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;Main.c,235 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
=======
;Main.c,224 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,237 :: 		}
L_main34:
;Main.c,239 :: 		}
J	L_main15
NOP	
;Main.c,240 :: 		}
=======
;Main.c,194 :: 		if((!RC3_bit)&&(!Toggle)){
L__main46:
L__main45:
;Main.c,228 :: 		}
J	L_main4
NOP	
;Main.c,229 :: 		}
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
