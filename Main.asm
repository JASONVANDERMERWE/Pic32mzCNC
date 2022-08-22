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
BNE	R2, 1, L__DMA_CH0_ISR39
NOP	
J	L_DMA_CH0_ISR0
NOP	
L__DMA_CH0_ISR39:
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
BNE	R2, 1, L__DMA_CH0_ISR41
NOP	
J	L_DMA_CH0_ISR1
NOP	
L__DMA_CH0_ISR41:
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
BNE	R2, 1, L__DMA_CH1_ISR44
NOP	
J	L_DMA_CH1_ISR2
NOP	
L__DMA_CH1_ISR44:
;Main.c,69 :: 		CHBCIF_DCH1INT_bit = 0;             // clear flag
LUI	R2, BitMask(CHBCIF_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHBCIF_DCH1INT_bit+0)
_SX	
;Main.c,70 :: 		}
L_DMA_CH1_ISR2:
;Main.c,72 :: 		if( CHERIF_DCH1INT_bit == 1){
_LX	
EXT	R2, R2, BitPos(CHERIF_DCH1INT_bit+0), 1
BNE	R2, 1, L__DMA_CH1_ISR46
NOP	
J	L_DMA_CH1_ISR3
NOP	
L__DMA_CH1_ISR46:
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
ADDIU	SP, SP, -4
;Main.c,89 :: 		int xyz_ = 0;
MOVZ	R30, R0, R0
SH	R30, 0(SP)
;Main.c,90 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,92 :: 		StepperConstants(15500,15500);
ORI	R26, R0, 15500
ORI	R25, R0, 15500
JAL	_StepperConstants+0
NOP	
;Main.c,93 :: 		EnableInterrupts();
EI	R30
;Main.c,94 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,96 :: 		a=4;
ORI	R2, R0, 4
SH	R2, Offset(Main_a+0)(GP)
;Main.c,97 :: 		while(1){
L_main4:
;Main.c,98 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,99 :: 		if(!Toggle)
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main48
NOP	
J	L_main6
NOP	
L__main48:
;Main.c,100 :: 		disable_steps++;
LHU	R2, Offset(main_disable_steps_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(main_disable_steps_L0+0)(GP)
L_main6:
;Main.c,102 :: 		if(disable_steps > 10)
LHU	R2, Offset(main_disable_steps_L0+0)(GP)
SLTIU	R2, R2, 11
BEQ	R2, R0, L__main49
NOP	
J	L_main7
NOP	
L__main49:
;Main.c,103 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
L_main7:
;Main.c,105 :: 		if(!SW2){
_LX	
EXT	R2, R2, BitPos(SW2+0), 1
BEQ	R2, R0, L__main50
NOP	
J	L_main8
NOP	
L__main50:
;Main.c,106 :: 		Toggle  = 0;
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,107 :: 		LATB15_bit = 0;
LUI	R2, BitMask(LATB15_bit+0)
ORI	R2, R2, BitMask(LATB15_bit+0)
_SX	
;Main.c,108 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,109 :: 		}
L_main8:
;Main.c,111 :: 		if((!SW1)&&(!Toggle)){
_LX	
EXT	R2, R2, BitPos(SW1+0), 1
BEQ	R2, R0, L__main51
NOP	
J	L__main31
NOP	
L__main51:
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main52
NOP	
J	L__main30
NOP	
L__main52:
L__main29:
;Main.c,112 :: 		Toggle = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Toggle+0)(GP)
;Main.c,113 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,114 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,115 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,116 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,117 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,127 :: 		xyz_++;
LH	R2, 0(SP)
ADDIU	R2, R2, 1
SH	R2, 0(SP)
;Main.c,128 :: 		if(xyz_ > 2)xyz_ = 0;
SEH	R2, R2
SLTI	R2, R2, 3
BEQ	R2, R0, L__main53
NOP	
J	L_main12
NOP	
L__main53:
SH	R0, 0(SP)
L_main12:
;Main.c,136 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,137 :: 		a++;
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,138 :: 		if(a > 6)a=4;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 7
BEQ	R2, R0, L__main54
NOP	
J	L_main13
NOP	
L__main54:
ORI	R2, R0, 4
SH	R2, Offset(Main_a+0)(GP)
L_main13:
;Main.c,111 :: 		if((!SW1)&&(!Toggle)){
L__main31:
L__main30:
;Main.c,141 :: 		if(Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main56
NOP	
J	L_main14
NOP	
L__main56:
;Main.c,142 :: 		if(!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit){
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__main57
NOP	
J	L__main35
NOP	
L__main57:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__main58
NOP	
J	L__main34
NOP	
L__main58:
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
BEQ	R2, R0, L__main59
NOP	
J	L__main33
NOP	
L__main59:
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
BEQ	R2, R0, L__main60
NOP	
J	L__main32
NOP	
L__main60:
L__main28:
;Main.c,143 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,144 :: 		a++;
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,142 :: 		if(!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit){
L__main35:
L__main34:
L__main33:
L__main32:
;Main.c,147 :: 		}
L_main14:
;Main.c,149 :: 		}
J	L_main4
NOP	
;Main.c,150 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
;Main.c,153 :: 		void Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,155 :: 		switch(a){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Temp_Move18
NOP	
;Main.c,156 :: 		case 0:
L_Temp_Move20:
;Main.c,157 :: 		STPS[Z].mmToTravel = calcSteps(-125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49914
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+200)(GP)
;Main.c,158 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,159 :: 		SingleAxisStep(STPS[Z].mmToTravel,Z);
ORI	R26, R0, 2
LW	R25, Offset(_STPS+200)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,160 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,161 :: 		case 1:
L_Temp_Move21:
;Main.c,162 :: 		STPS[X].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,163 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,164 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,165 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,166 :: 		case 2:
L_Temp_Move22:
;Main.c,167 :: 		STPS[Y].mmToTravel = calcSteps(202.00,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17226
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,168 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,169 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,170 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,171 :: 		case 3:
L_Temp_Move23:
;Main.c,172 :: 		STPS[Y].mmToTravel = calcSteps(125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17146
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,173 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,174 :: 		STPS[Z].mmToTravel = calcSteps(25.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 16842
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+200)(GP)
;Main.c,175 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,176 :: 		DualAxisStep(STPS[Y].mmToTravel, STPS[Z].mmToTravel,yz);
ORI	R27, R0, 2
LW	R26, Offset(_STPS+200)(GP)
LW	R25, Offset(_STPS+132)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,177 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,178 :: 		case 4:
L_Temp_Move24:
;Main.c,179 :: 		STPS[X].mmToTravel = calcSteps(228.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17252
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,180 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,181 :: 		STPS[Z].mmToTravel = calcSteps(-25.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49610
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+200)(GP)
;Main.c,182 :: 		speed_cntr_Move(STPS[Z].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,183 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Z].mmToTravel,xz);
ORI	R27, R0, 1
LW	R26, Offset(_STPS+200)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,184 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,185 :: 		case 5:
L_Temp_Move25:
;Main.c,186 :: 		STPS[X].mmToTravel = calcSteps(-228.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 50020
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,187 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,188 :: 		STPS[Y].mmToTravel = calcSteps(25.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 16842
ORI	R2, R2, 0
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,189 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,190 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,191 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,192 :: 		case 6:
L_Temp_Move26:
;Main.c,193 :: 		STPS[A].mmToTravel = calcSteps(-125.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49914
ORI	R2, R2, 32768
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+268)(GP)
;Main.c,194 :: 		speed_cntr_Move(STPS[A].mmToTravel, 25000,A);
ORI	R27, R0, 3
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,195 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
ORI	R26, R0, 3
LW	R25, Offset(_STPS+268)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,196 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,197 :: 		default: a = 0;
L_Temp_Move27:
MOVZ	R25, R0, R0
;Main.c,198 :: 		break;
J	L_Temp_Move19
NOP	
;Main.c,199 :: 		}
L_Temp_Move18:
SEH	R2, R25
BNE	R2, R0, L__Temp_Move64
NOP	
J	L_Temp_Move20
NOP	
L__Temp_Move64:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move66
NOP	
J	L_Temp_Move21
NOP	
L__Temp_Move66:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move68
NOP	
J	L_Temp_Move22
NOP	
L__Temp_Move68:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move70
NOP	
J	L_Temp_Move23
NOP	
L__Temp_Move70:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move72
NOP	
J	L_Temp_Move24
NOP	
L__Temp_Move72:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move74
NOP	
J	L_Temp_Move25
NOP	
L__Temp_Move74:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move76
NOP	
J	L_Temp_Move26
NOP	
L__Temp_Move76:
J	L_Temp_Move27
NOP	
L_Temp_Move19:
;Main.c,200 :: 		}
L_end_Temp_Move:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Temp_Move
_LCD_Display:
;Main.c,202 :: 		void LCD_Display(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Main.c,204 :: 		STPS[X].mmToTravel = calcSteps(151.25,8.06);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 17175
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,205 :: 		speed_cntr_Move(STPS[X].mmToTravel, 2500,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 2500
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,206 :: 		STPS[Y].mmToTravel = calcSteps(-151.25,8.06);
LUI	R3, 16640
ORI	R3, R3, 62915
LUI	R2, 49943
ORI	R2, R2, 16384
MTC1	R3, S13
MTC1	R2, S12
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,207 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 2500,Y);
ORI	R27, R0, 1
ORI	R26, R0, 2500
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,211 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
LW	R2, Offset(_STPS+48)(GP)
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
;Main.c,212 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,214 :: 		sprintf(txt,"%d",STPS[0].decel_start);
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
;Main.c,215 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,219 :: 		sprintf(txt,"%d",STPS[0].step_delay);
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
;Main.c,220 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,222 :: 		sprintf(txt,"%d",STPS[0].min_delay);
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
;Main.c,223 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,227 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
LW	R2, Offset(_STPS+52)(GP)
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
;Main.c,228 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,230 :: 		sprintf(txt,"%d",STPS[0].decel_val);
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
;Main.c,231 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;Main.c,232 :: 		}
L_end_LCD_Display:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _LCD_Display
