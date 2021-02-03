_Timer7Interrupt:
;Main.c,42 :: 		void Timer7Interrupt() iv IVT_TIMER_7 ilevel 4 ics ICS_SRS{
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
;Main.c,43 :: 		T7IF_bit  = 0;
LUI	R2, BitMask(T7IF_bit+0)
ORI	R2, R2, BitMask(T7IF_bit+0)
_SX	
;Main.c,45 :: 		TMR.mSec++;
LHU	R2, Offset(_TMR+8)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR+8)(GP)
;Main.c,46 :: 		if(TMR.mSec > 999){
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__Timer7Interrupt35
NOP	
J	L_Timer7Interrupt0
NOP	
L__Timer7Interrupt35:
;Main.c,47 :: 		LATA9_bit = !LATA9_bit;
_LX	
EXT	R2, R2, BitPos(LATA9_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATA9_bit+0), 1
_SX	
;Main.c,48 :: 		TMR.mSec = 0;
SH	R0, Offset(_TMR+8)(GP)
;Main.c,49 :: 		TMR.Sec++;
LBU	R2, Offset(_TMR+10)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(_TMR+10)(GP)
;Main.c,50 :: 		if(TMR.Sec > 59){
ANDI	R2, R2, 255
SLTIU	R2, R2, 60
BEQ	R2, R0, L__Timer7Interrupt36
NOP	
J	L_Timer7Interrupt1
NOP	
L__Timer7Interrupt36:
;Main.c,51 :: 		TMR.Sec = 0;
SB	R0, Offset(_TMR+10)(GP)
;Main.c,52 :: 		}
L_Timer7Interrupt1:
;Main.c,53 :: 		}
L_Timer7Interrupt0:
;Main.c,54 :: 		}
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
;Main.c,57 :: 		void Timer8Interrupt() iv IVT_TIMER_8 ilevel 4 ics ICS_SRS {
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
;Main.c,60 :: 		if(oneShotA){
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BNE	R2, R0, L__Timer8Interrupt39
NOP	
J	L_Timer8Interrupt2
NOP	
L__Timer8Interrupt39:
;Main.c,61 :: 		CycleStart();
JAL	_CycleStart+0
NOP	
;Main.c,62 :: 		}else{
J	L_Timer8Interrupt3
NOP	
L_Timer8Interrupt2:
;Main.c,63 :: 		CycleStop();
JAL	_CycleStop+0
NOP	
;Main.c,64 :: 		}
L_Timer8Interrupt3:
;Main.c,65 :: 		T8IF_bit  = 0;
LUI	R2, BitMask(T8IF_bit+0)
ORI	R2, R2, BitMask(T8IF_bit+0)
_SX	
;Main.c,66 :: 		}
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
;Main.c,71 :: 		void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 7 ics ICS_AUTO {
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
;Main.c,72 :: 		uart_rd = UART2_Read();
JAL	_UART2_Read+0
NOP	
SB	R2, Offset(_uart_rd+0)(GP)
;Main.c,73 :: 		UART2_Write( uart_rd );
ANDI	R25, R2, 255
JAL	_UART2_Write+0
NOP	
;Main.c,75 :: 		U2RXIF_bit = 0;            // Ensure interrupt is not pending
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
;Main.c,76 :: 		}
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
;Main.c,80 :: 		void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO {
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
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Main.c,83 :: 		if (CHBCIF_bit == 1) {         // Channel Block Transfer has Completed Interrupt Flag bit
_LX	
EXT	R2, R2, BitPos(CHBCIF_bit+0), 1
BNE	R2, 1, L__DMA_CH0_ISR43
NOP	
J	L_DMA_CH0_ISR4
NOP	
L__DMA_CH0_ISR43:
;Main.c,87 :: 		i = strlen(rxBuf);
LUI	R25, 40960
ORI	R25, R25, 8192
JAL	_strlen+0
NOP	
SH	R2, 4(SP)
;Main.c,88 :: 		dma0int_flag = 1;          // user flag to inform this int was triggered. should be cleared in software
ORI	R3, R0, 1
SB	R3, Offset(_dma0int_flag+0)(GP)
;Main.c,89 :: 		memcpy(txBuf, rxBuf, i);   // copy RxBuf -> TxBuf  BUFFER_LENGTH
SEH	R27, R2
LUI	R26, 40960
ORI	R26, R26, 8192
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_memcpy+0
NOP	
;Main.c,90 :: 		CHEN_DCH1CON_bit = 1;     // Enable the DMA1 channel to transmit back what was received
LUI	R2, BitMask(CHEN_DCH1CON_bit+0)
ORI	R2, R2, BitMask(CHEN_DCH1CON_bit+0)
_SX	
;Main.c,91 :: 		}
L_DMA_CH0_ISR4:
;Main.c,92 :: 		DCH1SSIZ            = i ;
LH	R2, 4(SP)
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Main.c,95 :: 		if( CHERIF_bit == 1){                     // clear channel error int flag
_LX	
EXT	R2, R2, BitPos(CHERIF_bit+0), 1
BNE	R2, 1, L__DMA_CH0_ISR45
NOP	
J	L_DMA_CH0_ISR5
NOP	
L__DMA_CH0_ISR45:
;Main.c,96 :: 		CHERIF_bit = 0;
LUI	R2, BitMask(CHERIF_bit+0)
ORI	R2, R2, BitMask(CHERIF_bit+0)
_SX	
;Main.c,97 :: 		memcpy(txBuf,"CHERIF Error",13);
ORI	R27, R0, 13
LUI	R26, hi_addr(?lstr1_Main+0)
ORI	R26, R26, lo_addr(?lstr1_Main+0)
LUI	R25, 40960
ORI	R25, R25, 8704
JAL	_memcpy+0
NOP	
;Main.c,98 :: 		}
L_DMA_CH0_ISR5:
;Main.c,99 :: 		DCH0INTCLR          = 0x00FF;             // clear DMA 0 int flags
ORI	R2, R0, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Main.c,102 :: 		CHEN_bit            = 1 ;                 // Enable channel - may want to do this when you are ready to receive...
LUI	R2, BitMask(CHEN_bit+0)
ORI	R2, R2, BitMask(CHEN_bit+0)
_SX	
;Main.c,104 :: 		CFORCE_DCH1ECON_bit = 1 ;                 // force DMA1 interrupt trigger
LUI	R2, BitMask(CFORCE_DCH1ECON_bit+0)
ORI	R2, R2, BitMask(CFORCE_DCH1ECON_bit+0)
_SX	
;Main.c,105 :: 		DMA0IF_bit          = 0 ;                 // clear DMA0 int flag
LUI	R2, BitMask(DMA0IF_bit+0)
ORI	R2, R2, BitMask(DMA0IF_bit+0)
_SX	
;Main.c,107 :: 		}
L_end_DMA_CH0_ISR:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
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
;Main.c,110 :: 		void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_AUTO {
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
;Main.c,111 :: 		int ptr = 0;
;Main.c,114 :: 		if (CHBCIF_DCH1INT_bit == 1){
_LX	
EXT	R2, R2, BitPos(CHBCIF_DCH1INT_bit+0), 1
BNE	R2, 1, L__DMA_CH1_ISR48
NOP	
J	L_DMA_CH1_ISR6
NOP	
L__DMA_CH1_ISR48:
;Main.c,115 :: 		CHBCIF_DCH1INT_bit = 0;             // clear flag
LUI	R2, BitMask(CHBCIF_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHBCIF_DCH1INT_bit+0)
_SX	
;Main.c,116 :: 		}
L_DMA_CH1_ISR6:
;Main.c,118 :: 		if( CHERIF_DCH1INT_bit == 1){
_LX	
EXT	R2, R2, BitPos(CHERIF_DCH1INT_bit+0), 1
BNE	R2, 1, L__DMA_CH1_ISR50
NOP	
J	L_DMA_CH1_ISR7
NOP	
L__DMA_CH1_ISR50:
;Main.c,119 :: 		CHERIF_DCH1INT_bit = 0;
LUI	R2, BitMask(CHERIF_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHERIF_DCH1INT_bit+0)
_SX	
;Main.c,121 :: 		}
L_DMA_CH1_ISR7:
;Main.c,123 :: 		dma1int_flag = 1;                          // user flag to inform this int was triggered. should be cleared in software
ORI	R2, R0, 1
SB	R2, Offset(_dma1int_flag+0)(GP)
;Main.c,124 :: 		DCH1INTCLR   = 0x00FF;                     // clear event flags
ORI	R2, R0, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Main.c,125 :: 		DMA1IF_bit   = 0 ;
LUI	R2, BitMask(DMA1IF_bit+0)
ORI	R2, R2, BitMask(DMA1IF_bit+0)
_SX	
;Main.c,127 :: 		}
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
_StepX:
;Main.c,131 :: 		void StepX() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {
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
;Main.c,133 :: 		STmr.compOCxRunning = 2;
ORI	R2, R0, 2
SH	R2, Offset(_STmr+8)(GP)
;Main.c,134 :: 		TMR4 =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Main.c,135 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Main.c,137 :: 		}
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
;Main.c,138 :: 		void StepY() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {
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
;Main.c,140 :: 		STmr.compOCxRunning = 1;
ORI	R2, R0, 1
SH	R2, Offset(_STmr+8)(GP)
;Main.c,141 :: 		TMR2 =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Main.c,142 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Main.c,144 :: 		}
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
_StepZ:
;Main.c,145 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_8 ilevel 3 ics ICS_AUTO {
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
;Main.c,147 :: 		STmr.compOCxRunning = 1;
ORI	R2, R0, 1
SH	R2, Offset(_STmr+8)(GP)
;Main.c,148 :: 		TMR6 =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Main.c,149 :: 		OC8IF_bit = 0;
LUI	R2, BitMask(OC8IF_bit+0)
ORI	R2, R2, BitMask(OC8IF_bit+0)
_SX	
;Main.c,151 :: 		}
L_end_StepZ:
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
; end of _StepZ
_main:
;Main.c,154 :: 		void main() {
;Main.c,157 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,158 :: 		SetPinMode();
JAL	_SetPinMode+0
NOP	
;Main.c,159 :: 		StepperConstants(4500,4500);
ORI	R26, R0, 4500
ORI	R25, R0, 4500
JAL	_StepperConstants+0
NOP	
;Main.c,160 :: 		EnableInterrupts();
EI	R30
;Main.c,161 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,162 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,4,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 4
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,163 :: 		while(1){
L_main8:
;Main.c,165 :: 		if((!RC3_bit)&&(!oneShotA)){
_LX	
EXT	R2, R2, BitPos(RC3_bit+0), 1
BEQ	R2, R0, L__main55
NOP	
J	L__main31
NOP	
L__main55:
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BEQ	R2, R0, L__main56
NOP	
J	L__main30
NOP	
L__main56:
L__main29:
;Main.c,167 :: 		oneShotA     = 1;
LBU	R2, Offset(_oneShotA+0)(GP)
ORI	R2, R2, BitMask(_oneShotA+0)
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,169 :: 		SV.px = 0;
SW	R0, Offset(_SV+24)(GP)
;Main.c,170 :: 		SV.py = 0;
SW	R0, Offset(_SV+28)(GP)
;Main.c,171 :: 		SV.pz = 0;
SW	R0, Offset(_SV+32)(GP)
;Main.c,172 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,173 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,174 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,175 :: 		a = 2;
ORI	R2, R0, 2
SH	R2, Offset(Main_a+0)(GP)
;Main.c,165 :: 		if((!RC3_bit)&&(!oneShotA)){
L__main31:
L__main30:
;Main.c,178 :: 		if(oneShotA){
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BNE	R2, R0, L__main58
NOP	
J	L_main13
NOP	
L__main58:
;Main.c,179 :: 		switch(a){
J	L_main14
NOP	
;Main.c,180 :: 		case 0:
L_main16:
;Main.c,181 :: 		STPS[X].mmToTravel = calcSteps(-25.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49610
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+60)(GP)
;Main.c,182 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,183 :: 		STPS[Z].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+188)(GP)
;Main.c,184 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,185 :: 		T8IE_bit         = 1;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Main.c,186 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Z].mmToTravel,xz);
ORI	R27, R0, 1
LW	R26, Offset(_STPS+188)(GP)
LW	R25, Offset(_STPS+60)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,187 :: 		a = 1;
ORI	R2, R0, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,188 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,189 :: 		break;
J	L_main15
NOP	
;Main.c,190 :: 		case 1:
L_main17:
;Main.c,191 :: 		SV.px = 0;
SW	R0, Offset(_SV+24)(GP)
;Main.c,192 :: 		SV.py = 0;
SW	R0, Offset(_SV+28)(GP)
;Main.c,193 :: 		SV.pz = 0;
SW	R0, Offset(_SV+32)(GP)
;Main.c,194 :: 		if(SV.Tog == 1)a=2;
LH	R3, Offset(_SV+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main59
NOP	
J	L_main18
NOP	
L__main59:
ORI	R2, R0, 2
SH	R2, Offset(Main_a+0)(GP)
L_main18:
;Main.c,195 :: 		break;
J	L_main15
NOP	
;Main.c,196 :: 		case 2:
L_main19:
;Main.c,197 :: 		STPS[X].mmToTravel = calcSteps(151.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17175
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+60)(GP)
;Main.c,198 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,199 :: 		STPS[Z].mmToTravel = calcSteps(-25.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49610
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+188)(GP)
;Main.c,200 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,201 :: 		T8IE_bit         = 1;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Main.c,202 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Z].mmToTravel,xz);
ORI	R27, R0, 1
LW	R26, Offset(_STPS+188)(GP)
LW	R25, Offset(_STPS+60)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,203 :: 		a = 3;
ORI	R2, R0, 3
SH	R2, Offset(Main_a+0)(GP)
;Main.c,204 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Main.c,205 :: 		break;
J	L_main15
NOP	
;Main.c,206 :: 		case 3:
L_main20:
;Main.c,207 :: 		SV.px = 0;
SW	R0, Offset(_SV+24)(GP)
;Main.c,208 :: 		SV.py = 0;
SW	R0, Offset(_SV+28)(GP)
;Main.c,209 :: 		SV.pz = 0;
SW	R0, Offset(_SV+32)(GP)
;Main.c,210 :: 		if(SV.Tog == 1) a = 0;
LH	R3, Offset(_SV+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main60
NOP	
J	L_main21
NOP	
L__main60:
SH	R0, Offset(Main_a+0)(GP)
L_main21:
;Main.c,211 :: 		break;
J	L_main15
NOP	
;Main.c,212 :: 		default: a = 2;
L_main22:
ORI	R2, R0, 2
SH	R2, Offset(Main_a+0)(GP)
;Main.c,213 :: 		break;
J	L_main15
NOP	
;Main.c,214 :: 		}
L_main14:
LHU	R2, Offset(Main_a+0)(GP)
BNE	R2, R0, L__main62
NOP	
J	L_main16
NOP	
L__main62:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__main64
NOP	
J	L_main17
NOP	
L__main64:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__main66
NOP	
J	L_main19
NOP	
L__main66:
LHU	R3, Offset(Main_a+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__main68
NOP	
J	L_main20
NOP	
L__main68:
J	L_main22
NOP	
L_main15:
;Main.c,215 :: 		}
L_main13:
;Main.c,216 :: 		if((!RB0_bit)&&(Toggle))oneShotA = 0;
_LX	
EXT	R2, R2, BitPos(RB0_bit+0), 1
BEQ	R2, R0, L__main69
NOP	
J	L__main33
NOP	
L__main69:
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main71
NOP	
J	L__main32
NOP	
L__main71:
L__main28:
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
L__main33:
L__main32:
;Main.c,217 :: 		if(!oneShotA){
LBU	R2, Offset(_oneShotA+0)(GP)
EXT	R2, R2, BitPos(_oneShotA+0), 1
BEQ	R2, R0, L__main72
NOP	
J	L_main26
NOP	
L__main72:
;Main.c,218 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,219 :: 		}
L_main26:
;Main.c,221 :: 		if(!RB0_bit){
_LX	
EXT	R2, R2, BitPos(RB0_bit+0), 1
BEQ	R2, R0, L__main73
NOP	
J	L_main27
NOP	
L__main73:
;Main.c,222 :: 		oneShotB       = 0;
LBU	R2, Offset(_oneShotB+0)(GP)
INS	R2, R0, BitPos(_oneShotB+0), 1
SB	R2, Offset(_oneShotB+0)(GP)
;Main.c,223 :: 		oneShotA       = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,224 :: 		STPS[X].mmToTravel = calcSteps(151.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17175
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+60)(GP)
;Main.c,225 :: 		speed_cntr_Move(STPS[X].mmToTravel, 2500,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 2500
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,226 :: 		STPS[Y].mmToTravel = calcSteps(-151.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49943
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+124)(GP)
;Main.c,227 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 2500,Y);
ORI	R27, R0, 1
ORI	R26, R0, 2500
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,231 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
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
;Main.c,232 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,234 :: 		sprintf(txt,"%d",STPS[0].decel_start);
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
;Main.c,235 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,239 :: 		sprintf(txt,"%d",STPS[0].step_delay);
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
;Main.c,240 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,242 :: 		sprintf(txt,"%d",STPS[0].min_delay);
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
;Main.c,243 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,247 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
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
;Main.c,248 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,250 :: 		sprintf(txt,"%d",STPS[0].decel_val);
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
;Main.c,251 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,253 :: 		}
L_main27:
;Main.c,255 :: 		}
J	L_main8
NOP	
;Main.c,256 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
