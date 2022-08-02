_uart2_Rx_interrupt:
;Main.c,25 :: 		void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 7 ics ICS_AUTO {
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
;Main.c,26 :: 		uart_rd = UART2_Read();
JAL	_UART2_Read+0
NOP	
SB	R2, Offset(_uart_rd+0)(GP)
;Main.c,27 :: 		UART2_Write( uart_rd );
ANDI	R25, R2, 255
JAL	_UART2_Write+0
NOP	
;Main.c,29 :: 		U2RXIF_bit = 0;            // Ensure interrupt is not pending
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
;Main.c,30 :: 		}
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
;Main.c,34 :: 		void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO {
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
;Main.c,37 :: 		if (CHBCIF_bit == 1) {         // Channel Block Transfer has Completed Interrupt Flag bit
_LX	
EXT	R2, R2, BitPos(CHBCIF_bit+0), 1
BNE	R2, 1, L__DMA_CH0_ISR50
NOP	
J	L_DMA_CH0_ISR0
NOP	
L__DMA_CH0_ISR50:
;Main.c,41 :: 		i = strlen(rxBuf);
LUI	R25, 40960
ORI	R25, R25, 8192
JAL	_strlen+0
NOP	
SH	R2, 4(SP)
;Main.c,42 :: 		dma0int_flag = 1;          // user flag to inform this int was triggered. should be cleared in software
ORI	R3, R0, 1
SB	R3, Offset(_dma0int_flag+0)(GP)
;Main.c,43 :: 		memcpy(txBuf, rxBuf, i);   // copy RxBuf -> TxBuf  BUFFER_LENGTH
SEH	R27, R2
LUI	R26, 40960
ORI	R26, R26, 8192
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_memcpy+0
NOP	
;Main.c,44 :: 		CHEN_DCH1CON_bit = 1;     // Enable the DMA1 channel to transmit back what was received
LUI	R2, BitMask(CHEN_DCH1CON_bit+0)
ORI	R2, R2, BitMask(CHEN_DCH1CON_bit+0)
_SX	
;Main.c,45 :: 		}
L_DMA_CH0_ISR0:
;Main.c,46 :: 		DCH1SSIZ            = i ;
LH	R2, 4(SP)
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Main.c,49 :: 		if( CHERIF_bit == 1){                     // clear channel error int flag
_LX	
EXT	R2, R2, BitPos(CHERIF_bit+0), 1
BNE	R2, 1, L__DMA_CH0_ISR52
NOP	
J	L_DMA_CH0_ISR1
NOP	
L__DMA_CH0_ISR52:
;Main.c,50 :: 		CHERIF_bit = 0;
LUI	R2, BitMask(CHERIF_bit+0)
ORI	R2, R2, BitMask(CHERIF_bit+0)
_SX	
;Main.c,51 :: 		memcpy(txBuf,"CHERIF Error",13);
ADDIU	R23, SP, 6
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
ORI	R27, R0, 13
MOVZ	R26, R2, R0
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_memcpy+0
NOP	
;Main.c,52 :: 		}
L_DMA_CH0_ISR1:
;Main.c,53 :: 		DCH0INTCLR          = 0x00FF;             // clear DMA 0 int flags
ORI	R2, R0, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Main.c,56 :: 		CHEN_bit            = 1 ;                 // Enable channel - may want to do this when you are ready to receive...
LUI	R2, BitMask(CHEN_bit+0)
ORI	R2, R2, BitMask(CHEN_bit+0)
_SX	
;Main.c,58 :: 		CFORCE_DCH1ECON_bit = 1 ;                 // force DMA1 interrupt trigger
LUI	R2, BitMask(CFORCE_DCH1ECON_bit+0)
ORI	R2, R2, BitMask(CFORCE_DCH1ECON_bit+0)
_SX	
;Main.c,59 :: 		DMA0IF_bit          = 0 ;                 // clear DMA0 int flag
LUI	R2, BitMask(DMA0IF_bit+0)
ORI	R2, R2, BitMask(DMA0IF_bit+0)
_SX	
;Main.c,61 :: 		}
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
;Main.c,64 :: 		void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_AUTO {
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
;Main.c,65 :: 		int ptr = 0;
;Main.c,68 :: 		if (CHBCIF_DCH1INT_bit == 1){
_LX	
EXT	R2, R2, BitPos(CHBCIF_DCH1INT_bit+0), 1
BNE	R2, 1, L__DMA_CH1_ISR55
NOP	
J	L_DMA_CH1_ISR2
NOP	
L__DMA_CH1_ISR55:
;Main.c,69 :: 		CHBCIF_DCH1INT_bit = 0;             // clear flag
LUI	R2, BitMask(CHBCIF_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHBCIF_DCH1INT_bit+0)
_SX	
;Main.c,70 :: 		}
L_DMA_CH1_ISR2:
;Main.c,72 :: 		if( CHERIF_DCH1INT_bit == 1){
_LX	
EXT	R2, R2, BitPos(CHERIF_DCH1INT_bit+0), 1
BNE	R2, 1, L__DMA_CH1_ISR57
NOP	
J	L_DMA_CH1_ISR3
NOP	
L__DMA_CH1_ISR57:
;Main.c,73 :: 		CHERIF_DCH1INT_bit = 0;
LUI	R2, BitMask(CHERIF_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHERIF_DCH1INT_bit+0)
_SX	
;Main.c,75 :: 		}
L_DMA_CH1_ISR3:
;Main.c,77 :: 		dma1int_flag = 1;                          // user flag to inform this int was triggered. should be cleared in software
ORI	R2, R0, 1
SB	R2, Offset(_dma1int_flag+0)(GP)
;Main.c,78 :: 		DCH1INTCLR   = 0x00FF;                     // clear event flags
ORI	R2, R0, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Main.c,79 :: 		DMA1IF_bit   = 0 ;
LUI	R2, BitMask(DMA1IF_bit+0)
ORI	R2, R2, BitMask(DMA1IF_bit+0)
_SX	
;Main.c,81 :: 		}
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
_main:
;Main.c,86 :: 		void main() {
;Main.c,89 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,90 :: 		SetPinMode();
JAL	_SetPinMode+0
NOP	
;Main.c,91 :: 		StepperConstants(8500,8500);
ORI	R26, R0, 8500
ORI	R25, R0, 8500
JAL	_StepperConstants+0
NOP	
;Main.c,92 :: 		EnableInterrupts();
EI	R30
;Main.c,93 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,94 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,4,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 4
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,95 :: 		while(1){
L_main4:
;Main.c,97 :: 		if((RB0_bit)&&(!oneShotA)){
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
L__main61:
L__main40:
;Main.c,99 :: 		oneShotA     = 1;
LBU	R2, Offset(_oneShotA+0)(GP)
ORI	R2, R2, BitMask(_oneShotA+0)
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,101 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,102 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,103 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,104 :: 		a = 0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,97 :: 		if((RB0_bit)&&(!oneShotA)){
L__main42:
L__main41:
;Main.c,107 :: 		if(oneShotA){
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BNE	R2, R0, L__main63
NOP	
J	L_main9
NOP	
L__main63:
;Main.c,108 :: 		LATA9_bit = 1;
LUI	R2, BitMask(LATA9_bit+0)
ORI	R2, R2, BitMask(LATA9_bit+0)
_SX	
;Main.c,109 :: 		switch(a){
J	L_main10
NOP	
;Main.c,110 :: 		case 0:
L_main12:
;Main.c,111 :: 		STPS[Z].mmToTravel = calcSteps(-125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49914
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+188)(GP)
;Main.c,112 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,113 :: 		SingleAxisStep(STPS[Z].mmToTravel,Z);
ORI	R26, R0, 2
LW	R25, Offset(_STPS+188)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,114 :: 		a = 1;
ORI	R2, R0, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,115 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,116 :: 		break;
J	L_main11
NOP	
;Main.c,117 :: 		case 1:
L_main13:
;Main.c,121 :: 		if(SV.Tog == 1)a=2;
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
;Main.c,122 :: 		break;
J	L_main11
NOP	
;Main.c,123 :: 		case 2:
L_main15:
;Main.c,124 :: 		STPS[X].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+60)(GP)
;Main.c,125 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,126 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+60)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,127 :: 		a = 3;
ORI	R2, R0, 3
SH	R2, Offset(Main_a+0)(GP)
;Main.c,128 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,129 :: 		break;
J	L_main11
NOP	
;Main.c,130 :: 		case 3:
L_main16:
;Main.c,131 :: 		if(SV.Tog == 1) a = 4;
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
;Main.c,132 :: 		break;
J	L_main11
NOP	
;Main.c,133 :: 		case 4:
L_main18:
;Main.c,134 :: 		STPS[Y].mmToTravel = calcSteps(202.00,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17226
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+124)(GP)
;Main.c,135 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,136 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+124)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,137 :: 		a = 5;
ORI	R2, R0, 5
SH	R2, Offset(Main_a+0)(GP)
;Main.c,138 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,139 :: 		break;
J	L_main11
NOP	
;Main.c,140 :: 		case 5:
L_main19:
;Main.c,141 :: 		if(SV.Tog == 1) a = 6;
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
;Main.c,142 :: 		break;
J	L_main11
NOP	
;Main.c,143 :: 		case 6:
L_main21:
;Main.c,144 :: 		STPS[Y].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+124)(GP)
;Main.c,145 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,146 :: 		STPS[Z].mmToTravel = calcSteps(-25.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49610
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+188)(GP)
;Main.c,147 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,148 :: 		DualAxisStep(STPS[Y].mmToTravel, STPS[Z].mmToTravel,yz);
ORI	R27, R0, 2
LW	R26, Offset(_STPS+188)(GP)
LW	R25, Offset(_STPS+124)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,149 :: 		a = 7;
ORI	R2, R0, 7
SH	R2, Offset(Main_a+0)(GP)
;Main.c,150 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,151 :: 		break;
J	L_main11
NOP	
;Main.c,152 :: 		case 7:
L_main22:
;Main.c,153 :: 		if(SV.Tog == 1) a = 8;
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
;Main.c,154 :: 		break;
J	L_main11
NOP	
;Main.c,155 :: 		case 8:
L_main24:
;Main.c,156 :: 		STPS[X].mmToTravel = calcSteps(225.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17249
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+60)(GP)
;Main.c,157 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,158 :: 		STPS[Y].mmToTravel = calcSteps(-25.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49610
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+124)(GP)
;Main.c,159 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,160 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+124)(GP)
LW	R25, Offset(_STPS+60)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,161 :: 		a = 9;
ORI	R2, R0, 9
SH	R2, Offset(Main_a+0)(GP)
;Main.c,162 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,163 :: 		break;
J	L_main11
NOP	
;Main.c,164 :: 		case 9:
L_main25:
;Main.c,165 :: 		if(SV.Tog == 1) a = 10;
LH	R3, Offset(_SV+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main68
NOP	
J	L_main26
NOP	
L__main68:
ORI	R2, R0, 10
SH	R2, Offset(Main_a+0)(GP)
L_main26:
;Main.c,166 :: 		break;
J	L_main11
NOP	
;Main.c,167 :: 		case 10:
L_main27:
;Main.c,168 :: 		STPS[X].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+60)(GP)
;Main.c,169 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,170 :: 		STPS[Z].mmToTravel = calcSteps(-25.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49610
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+188)(GP)
;Main.c,171 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,172 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Z].mmToTravel,xz);
ORI	R27, R0, 1
LW	R26, Offset(_STPS+188)(GP)
LW	R25, Offset(_STPS+60)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,173 :: 		a = 11;
ORI	R2, R0, 11
SH	R2, Offset(Main_a+0)(GP)
;Main.c,174 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,175 :: 		break;
J	L_main11
NOP	
;Main.c,176 :: 		case 11:
L_main28:
;Main.c,177 :: 		if(SV.Tog == 1) a = 0;
LH	R3, Offset(_SV+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main69
NOP	
J	L_main29
NOP	
L__main69:
SH	R0, Offset(Main_a+0)(GP)
L_main29:
;Main.c,178 :: 		break;
J	L_main11
NOP	
;Main.c,179 :: 		default: a = 0;
L_main30:
SH	R0, Offset(Main_a+0)(GP)
;Main.c,180 :: 		break;
J	L_main11
NOP	
;Main.c,181 :: 		}
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
J	L_main28
NOP	
L__main93:
J	L_main30
NOP	
L_main11:
;Main.c,182 :: 		}
L_main9:
;Main.c,184 :: 		if((!RC3_bit)&&(Toggle))
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
;Main.c,185 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,184 :: 		if((!RC3_bit)&&(Toggle))
L__main44:
L__main43:
;Main.c,187 :: 		if(!oneShotA){
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BEQ	R2, R0, L__main97
NOP	
J	L_main34
NOP	
L__main97:
;Main.c,188 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,189 :: 		}
L_main34:
;Main.c,191 :: 		if((!RC3_bit)&&(!Toggle)){
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
;Main.c,192 :: 		oneShotB       = 0;
LBU	R2, Offset(_oneShotB+0)(GP)
INS	R2, R0, BitPos(_oneShotB+0), 1
SB	R2, Offset(_oneShotB+0)(GP)
;Main.c,193 :: 		oneShotA       = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,194 :: 		STPS[X].mmToTravel = calcSteps(151.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17175
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+60)(GP)
;Main.c,195 :: 		speed_cntr_Move(STPS[X].mmToTravel, 2500,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 2500
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,196 :: 		STPS[Y].mmToTravel = calcSteps(-151.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49943
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+124)(GP)
;Main.c,197 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 2500,Y);
ORI	R27, R0, 1
ORI	R26, R0, 2500
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,201 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
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
;Main.c,202 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,204 :: 		sprintf(txt,"%d",STPS[0].decel_start);
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
;Main.c,205 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,209 :: 		sprintf(txt,"%d",STPS[0].step_delay);
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
;Main.c,210 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,212 :: 		sprintf(txt,"%d",STPS[0].min_delay);
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
;Main.c,213 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,217 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
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
;Main.c,218 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,220 :: 		sprintf(txt,"%d",STPS[0].decel_val);
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
;Main.c,221 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,191 :: 		if((!RC3_bit)&&(!Toggle)){
L__main46:
L__main45:
;Main.c,225 :: 		}
J	L_main4
NOP	
;Main.c,226 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
