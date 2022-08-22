_PinMode:
;Config.c,13 :: 		void PinMode(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Config.c,15 :: 		SYSKEY = 0xAA996655;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,16 :: 		SYSKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,17 :: 		CFGCONbits.OCACLK = 1;
LBU	R2, Offset(CFGCONbits+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(CFGCONbits+2)(GP)
;Config.c,18 :: 		SYSKEY = 0x33333333;
LUI	R2, 13107
ORI	R2, R2, 13107
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,20 :: 		JTAGEN_bit = 0;
_LX	
INS	R2, R0, BitPos(JTAGEN_bit+0), 1
_SX	
;Config.c,21 :: 		Delay_ms(100);
LUI	R24, 101
ORI	R24, R24, 47530
L_PinMode0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PinMode0
NOP	
;Config.c,24 :: 		ANSELA = 0X0000;
SW	R0, Offset(ANSELA+0)(GP)
;Config.c,25 :: 		ANSELB = 0X0000;
SW	R0, Offset(ANSELB+0)(GP)
;Config.c,26 :: 		ANSELC = 0X0000;
SW	R0, Offset(ANSELC+0)(GP)
;Config.c,27 :: 		ANSELD = 0X0000;
SW	R0, Offset(ANSELD+0)(GP)
;Config.c,28 :: 		ANSELE = 0X0000;
SW	R0, Offset(ANSELE+0)(GP)
;Config.c,29 :: 		ANSELG = 0X0000;
SW	R0, Offset(ANSELG+0)(GP)
;Config.c,31 :: 		CNPUB = 0x0000;
SW	R0, Offset(CNPUB+0)(GP)
;Config.c,34 :: 		LED1_Dir = 0;
LUI	R2, BitMask(TRISE7_bit+0)
ORI	R2, R2, BitMask(TRISE7_bit+0)
_SX	
;Config.c,35 :: 		LED2_Dir = 0;
LUI	R2, BitMask(TRISA9_bit+0)
ORI	R2, R2, BitMask(TRISA9_bit+0)
_SX	
;Config.c,40 :: 		SW1_Dir = 1;
LUI	R2, BitMask(TRISC3_bit+0)
ORI	R2, R2, BitMask(TRISC3_bit+0)
_SX	
;Config.c,41 :: 		SW2_Dir = 1;
LUI	R2, BitMask(TRISB0_bit+0)
ORI	R2, R2, BitMask(TRISB0_bit+0)
_SX	
;Config.c,43 :: 		TRISG7_bit = 1;
LUI	R2, BitMask(TRISG7_bit+0)
ORI	R2, R2, BitMask(TRISG7_bit+0)
_SX	
;Config.c,44 :: 		TRISG8_bit = 1;
LUI	R2, BitMask(TRISG8_bit+0)
ORI	R2, R2, BitMask(TRISG8_bit+0)
_SX	
;Config.c,48 :: 		Unlock_IOLOCK();
JAL	_Unlock_IOLOCK+0
NOP	
;Config.c,49 :: 		PPS_Mapping_NoLock(_RPE8, _OUTPUT, _U2TX);    // Sets pin PORTE.B8 to be Output and maps UART1 Transmit to it
ORI	R27, R0, 2
MOVZ	R26, R0, R0
ORI	R25, R0, 61
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,50 :: 		PPS_Mapping_NoLock(_RPE9, _INPUT,  _U2RX);    // Sets pin PORTE.B9 to be Input and maps UART1 Receive to it
ORI	R27, R0, 32
ORI	R26, R0, 1
ORI	R25, R0, 45
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,51 :: 		PPS_Mapping_NoLock(_RPB9, _OUTPUT, _NULL);
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
ORI	R25, R0, 5
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,52 :: 		PPS_Mapping_NoLock(_RPB10, _OUTPUT, _NULL);
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
ORI	R25, R0, 6
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,53 :: 		PPS_Mapping_NoLock(_RPD4, _OUTPUT, _OC5);     //X_Axis TMR2
ORI	R27, R0, 11
MOVZ	R26, R0, R0
ORI	R25, R0, 36
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,54 :: 		PPS_Mapping_NoLock(_RPD5, _OUTPUT, _OC2);     //Y_Axis TMR4
ORI	R27, R0, 11
MOVZ	R26, R0, R0
ORI	R25, R0, 54
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,55 :: 		PPS_Mapping_NoLock(_RPF0, _OUTPUT, _OC7);     //Z_Axis TMR6
ORI	R27, R0, 12
MOVZ	R26, R0, R0
ORI	R25, R0, 20
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,56 :: 		PPS_Mapping_NoLock(_RPF1, _OUTPUT, _OC3);     //A_Axis TMR5
ORI	R27, R0, 11
MOVZ	R26, R0, R0
ORI	R25, R0, 4
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,57 :: 		PPS_Mapping_NoLock(_RPG1, _OUTPUT, _OC6);     //B_Axis TMR3
ORI	R27, R0, 12
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,58 :: 		PPS_Mapping_NoLock(_RPE3, _OUTPUT, _OC8);     //C_Axis TMR7
ORI	R27, R0, 12
MOVZ	R26, R0, R0
ORI	R25, R0, 38
JAL	_PPS_Mapping_NoLock+0
NOP	
;Config.c,59 :: 		Lock_IOLOCK();
JAL	_Lock_IOLOCK+0
NOP	
;Config.c,63 :: 		UartConfig();
JAL	_UartConfig+0
NOP	
;Config.c,67 :: 		set_performance_mode();
JAL	_set_performance_mode+0
NOP	
;Config.c,75 :: 		InitTimer1();
JAL	_InitTimer1+0
NOP	
;Config.c,76 :: 		InitTimer8();
JAL	_InitTimer8+0
NOP	
;Config.c,83 :: 		initDMA_global();
JAL	_initDMA_global+0
NOP	
;Config.c,84 :: 		initDMA0();
JAL	_initDMA0+0
NOP	
;Config.c,85 :: 		initDMA1();
JAL	_initDMA1+0
NOP	
;Config.c,89 :: 		OutPutPulseXYZ();
JAL	_OutPutPulseXYZ+0
NOP	
;Config.c,90 :: 		SetPinMode();
JAL	_SetPinMode+0
NOP	
;Config.c,91 :: 		}
L_end_PinMode:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _PinMode
_UartConfig:
;Config.c,93 :: 		void UartConfig(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Config.c,96 :: 		UART2_Init_Advanced(256000, 50000/*PBClk x 2*/, _UART_LOW_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 1
ORI	R26, R0, 50000
LUI	R25, 3
ORI	R25, R25, 59392
ADDIU	SP, SP, -4
SB	R0, 0(SP)
JAL	_UART2_Init_Advanced+0
NOP	
ADDIU	SP, SP, 4
;Config.c,97 :: 		UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle); // set UART2 active
LUI	R28, hi_addr(_UART2_Tx_Idle+0)
ORI	R28, R28, lo_addr(_UART2_Tx_Idle+0)
LUI	R27, hi_addr(_UART2_Data_Ready+0)
ORI	R27, R27, lo_addr(_UART2_Data_Ready+0)
LUI	R26, hi_addr(_UART2_Write+0)
ORI	R26, R26, lo_addr(_UART2_Write+0)
LUI	R25, hi_addr(_UART2_Read+0)
ORI	R25, R25, lo_addr(_UART2_Read+0)
JAL	_UART_Set_Active+0
NOP	
;Config.c,98 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
LUI	R24, 101
ORI	R24, R24, 47530
L_UartConfig2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_UartConfig2
NOP	
;Config.c,99 :: 		}
L_end_UartConfig:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _UartConfig
_Uart2InterruptSetup:
;Config.c,103 :: 		void Uart2InterruptSetup(){
;Config.c,104 :: 		URXISEL0_bit = 0;
LUI	R2, BitMask(URXISEL0_bit+0)
ORI	R2, R2, BitMask(URXISEL0_bit+0)
_SX	
;Config.c,105 :: 		URXISEL1_bit = 1;
LUI	R2, BitMask(URXISEL1_bit+0)
ORI	R2, R2, BitMask(URXISEL1_bit+0)
_SX	
;Config.c,106 :: 		IEC4.B18 = 1;              // Enable UART2 RX interrupt
LUI	R2, 4
SW	R2, Offset(IEC4+8)(GP)
;Config.c,108 :: 		U2RXIP0_bit = 1;           //
LUI	R2, BitMask(U2RXIP0_bit+0)
ORI	R2, R2, BitMask(U2RXIP0_bit+0)
_SX	
;Config.c,109 :: 		U2RXIP1_bit = 1;           //
LUI	R2, BitMask(U2RXIP1_bit+0)
ORI	R2, R2, BitMask(U2RXIP1_bit+0)
_SX	
;Config.c,110 :: 		U2RXIP2_bit = 1;           // Set priority
LUI	R2, BitMask(U2RXIP2_bit+0)
ORI	R2, R2, BitMask(U2RXIP2_bit+0)
_SX	
;Config.c,112 :: 		URXISEL1_U2STA_bit = 0;
LUI	R2, BitMask(URXISEL1_U2STA_bit+0)
ORI	R2, R2, BitMask(URXISEL1_U2STA_bit+0)
_SX	
;Config.c,113 :: 		U2RXIF_bit = 0;            // Ensure interrupt is not pending
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
;Config.c,114 :: 		}
L_end_Uart2InterruptSetup:
JR	RA
NOP	
; end of _Uart2InterruptSetup
_set_performance_mode:
;Config.c,116 :: 		void set_performance_mode(){
;Config.c,120 :: 		DI(); // Disable all interrupts
DI	R30
;Config.c,123 :: 		SYSKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,124 :: 		SYSKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,127 :: 		PB1DIVbits.PBDIV = 1; // Peripheral Bus 1 Clock Divisor Control (PBCLK1 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(PB1DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB1DIVbits+0)(GP)
;Config.c,130 :: 		UEN0_bit = 1;
LUI	R2, BitMask(UEN0_bit+0)
ORI	R2, R2, BitMask(UEN0_bit+0)
_SX	
;Config.c,131 :: 		UEN1_bit = 1;
LUI	R2, BitMask(UEN1_bit+0)
ORI	R2, R2, BitMask(UEN1_bit+0)
_SX	
;Config.c,132 :: 		PB2DIVbits.ON = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB2DIVbits+8)(GP)
SWL	R2, Offset(PB2DIVbits+11)(GP)
;Config.c,133 :: 		while(!PB2DIVbits.PBDIVRDY);
L_set_performance_mode4:
LBU	R2, Offset(PB2DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode24
NOP	
J	L_set_performance_mode5
NOP	
L__set_performance_mode24:
J	L_set_performance_mode4
NOP	
L_set_performance_mode5:
;Config.c,134 :: 		PB2DIVbits.PBDIV = 0x07; // Peripheral Bus 2 Clock Divisor Control (PBCLK2 is SYSCLK "200MHZ" / 8)
ORI	R3, R0, 7
LBU	R2, Offset(PB2DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB2DIVbits+0)(GP)
;Config.c,137 :: 		PB3DIVbits.ON = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB3DIVbits+8)(GP)
SWL	R2, Offset(PB3DIVbits+11)(GP)
;Config.c,138 :: 		while(!PB3DIVbits.PBDIVRDY);
L_set_performance_mode6:
LBU	R2, Offset(PB3DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode25
NOP	
J	L_set_performance_mode7
NOP	
L__set_performance_mode25:
J	L_set_performance_mode6
NOP	
L_set_performance_mode7:
;Config.c,139 :: 		PB3DIVbits.PBDIV = 3; // Peripheral Bus 3 Clock Divisor Control (PBCLK3 is SYSCLK divided by 4)
ORI	R3, R0, 3
LBU	R2, Offset(PB3DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB3DIVbits+0)(GP)
;Config.c,142 :: 		PB4DIVbits.ON = 1; // Peripheral Bus 4 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB4DIVbits+8)(GP)
SWL	R2, Offset(PB4DIVbits+11)(GP)
;Config.c,143 :: 		while (!PB4DIVbits.PBDIVRDY); // Wait until it is ready to write to
L_set_performance_mode8:
LBU	R2, Offset(PB4DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode26
NOP	
J	L_set_performance_mode9
NOP	
L__set_performance_mode26:
J	L_set_performance_mode8
NOP	
L_set_performance_mode9:
;Config.c,144 :: 		PB4DIVbits.PBDIV = 0; // Peripheral Bus 4 Clock Divisor Control (PBCLK4 is SYSCLK divided by 1)
ORI	R2, R0, 127
SB	R2, Offset(PB4DIVbits+4)(GP)
;Config.c,147 :: 		PB5DIVbits.ON = 1; // Peripheral Bus 5 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB5DIVbits+8)(GP)
SWL	R2, Offset(PB5DIVbits+11)(GP)
;Config.c,148 :: 		while(!PB5DIVbits.PBDIVRDY);
L_set_performance_mode10:
LBU	R2, Offset(PB5DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode27
NOP	
J	L_set_performance_mode11
NOP	
L__set_performance_mode27:
J	L_set_performance_mode10
NOP	
L_set_performance_mode11:
;Config.c,149 :: 		PB5DIVbits.PBDIV = 1; // Peripheral Bus 5 Clock Divisor Control (PBCLK5 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(PB5DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB5DIVbits+0)(GP)
;Config.c,152 :: 		PB7DIVbits.ON = 1; // Peripheral Bus 7 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB7DIVbits+8)(GP)
SWL	R2, Offset(PB7DIVbits+11)(GP)
;Config.c,153 :: 		while(!PB7DIVbits.PBDIVRDY);
L_set_performance_mode12:
LBU	R2, Offset(PB7DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode28
NOP	
J	L_set_performance_mode13
NOP	
L__set_performance_mode28:
J	L_set_performance_mode12
NOP	
L_set_performance_mode13:
;Config.c,154 :: 		PB7DIVbits.PBDIV = 0; // Peripheral Bus 7 Clock Divisor Control (PBCLK7 is SYSCLK divided by 1)
ORI	R2, R0, 127
SB	R2, Offset(PB7DIVbits+4)(GP)
;Config.c,157 :: 		PB8DIVbits.ON = 1; // Peripheral Bus 8 Output Clock Enable (Output clock is enabled)
ORI	R2, R0, 32768
SWR	R2, Offset(PB8DIVbits+8)(GP)
SWL	R2, Offset(PB8DIVbits+11)(GP)
;Config.c,158 :: 		while(!PB8DIVbits.PBDIVRDY);
L_set_performance_mode14:
LBU	R2, Offset(PB8DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode29
NOP	
J	L_set_performance_mode15
NOP	
L__set_performance_mode29:
J	L_set_performance_mode14
NOP	
L_set_performance_mode15:
;Config.c,159 :: 		PB8DIVbits.PBDIV = 1; // Peripheral Bus 8 Clock Divisor Control (PBCLK8 is SYSCLK divided by 2)
ORI	R3, R0, 1
LBU	R2, Offset(PB8DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB8DIVbits+0)(GP)
;Config.c,162 :: 		PRECONbits.PFMSECEN = 0; // Flash SEC Interrupt Enable (Do not generate an interrupt when the PFMSEC bit is set)
LUI	R2, 1024
SW	R2, Offset(PRECONbits+4)(GP)
;Config.c,163 :: 		PRECONbits.PREFEN = 0b11; // Predictive Prefetch Enable (Enable predictive prefetch for any address)
ORI	R2, R0, 48
SB	R2, Offset(PRECONbits+8)(GP)
;Config.c,164 :: 		PRECONbits.PFMWS = 0b100; // PFM Access Time Defined in Terms of SYSCLK Wait States (Two wait states)
ORI	R3, R0, 4
LBU	R2, Offset(PRECONbits+0)(GP)
INS	R2, R3, 0, 3
SB	R2, Offset(PRECONbits+0)(GP)
;Config.c,168 :: 		cp0 = CP0_GET(CP0_CONFIG);
MFC0	R30, 16, 0
MOVZ	R2, R30, R0
; cp0 start address is: 12 (R3)
MOVZ	R3, R2, R0
;Config.c,169 :: 		cp0 &= ~0x07;
LUI	R2, 65535
ORI	R2, R2, 65528
AND	R2, R3, R2
; cp0 end address is: 12 (R3)
;Config.c,170 :: 		cp0 |= 0b011; // K0 = Cacheable, non-coherent, write-back, write allocate
ORI	R2, R2, 3
;Config.c,171 :: 		CP0_SET(CP0_CONFIG,cp0);
MOVZ	R30, R2, R0
MTC0	R30, 16, 0
;Config.c,174 :: 		SYSKEY = 0x33333333;
LUI	R2, 13107
ORI	R2, R2, 13107
SW	R2, Offset(SYSKEY+0)(GP)
;Config.c,177 :: 		PREFEN0_bit = 1;
LUI	R2, BitMask(PREFEN0_bit+0)
ORI	R2, R2, BitMask(PREFEN0_bit+0)
_SX	
;Config.c,178 :: 		PREFEN1_bit = 1;
LUI	R2, BitMask(PREFEN1_bit+0)
ORI	R2, R2, BitMask(PREFEN1_bit+0)
_SX	
;Config.c,179 :: 		PFMWS0_bit = 0;
LUI	R2, BitMask(PFMWS0_bit+0)
ORI	R2, R2, BitMask(PFMWS0_bit+0)
_SX	
;Config.c,180 :: 		PFMWS1_bit = 1;
LUI	R2, BitMask(PFMWS1_bit+0)
ORI	R2, R2, BitMask(PFMWS1_bit+0)
_SX	
;Config.c,181 :: 		PFMWS2_bit = 0;
LUI	R2, BitMask(PFMWS2_bit+0)
ORI	R2, R2, BitMask(PFMWS2_bit+0)
_SX	
;Config.c,182 :: 		}
L_end_set_performance_mode:
JR	RA
NOP	
; end of _set_performance_mode
_OutPutPulseXYZ:
;Config.c,185 :: 		void OutPutPulseXYZ(){
;Config.c,191 :: 		OC5CON = 0x0000; // disable OC3 module |_using TMR2_3 in 32bit mode
SW	R0, Offset(OC5CON+0)(GP)
;Config.c,192 :: 		OC2CON = 0x0000; // disable OC5 module |
SW	R0, Offset(OC2CON+0)(GP)
;Config.c,193 :: 		OC7CON = 0X0000; // disable OC8 module |_using tmr6
SW	R0, Offset(OC7CON+0)(GP)
;Config.c,194 :: 		OC3CON = 0x0000; // disable OC3 module |_using TMR2_3 in 32bit mode
SW	R0, Offset(OC3CON+0)(GP)
;Config.c,195 :: 		OC6CON = 0x0000; // disable OC5 module |
SW	R0, Offset(OC6CON+0)(GP)
;Config.c,196 :: 		OC8CON = 0X0000; // disable OC8 module |_using tmr6
SW	R0, Offset(OC8CON+0)(GP)
;Config.c,199 :: 		T2CON  = 0x0000;  // disable Timer2  OC5
SW	R0, Offset(T2CON+0)(GP)
;Config.c,200 :: 		T3CON  = 0x0000;  // disable Timer4  OC3
SW	R0, Offset(T3CON+0)(GP)
;Config.c,201 :: 		T4CON  = 0x0000;  // disable Timer6  OC8
SW	R0, Offset(T4CON+0)(GP)
;Config.c,202 :: 		T5CON  = 0x0000;  // disable Timer2  OC5
SW	R0, Offset(T5CON+0)(GP)
;Config.c,203 :: 		T6CON  = 0x0000;  // disable Timer4  OC3
SW	R0, Offset(T6CON+0)(GP)
;Config.c,204 :: 		T7CON  = 0x0000;  // disable Timer6  OC8
SW	R0, Offset(T7CON+0)(GP)
;Config.c,206 :: 		T2CON  = 0x0060;  //   a prescaler of 1:64 to get 1.28usec tick resolution
ORI	R2, R0, 96
SW	R2, Offset(T2CON+0)(GP)
;Config.c,207 :: 		T3CON  = 0x0060;  //   a prescaler of 1:64 to get 1.28usec tick resolution
ORI	R2, R0, 96
SW	R2, Offset(T3CON+0)(GP)
;Config.c,208 :: 		T4CON  = 0x0060;  //   a prescaler of 1:64 to get 1.28usec tick resolution
ORI	R2, R0, 96
SW	R2, Offset(T4CON+0)(GP)
;Config.c,209 :: 		T5CON  = 0x0060;  //   a prescaler of 1:64 to get 1.28usec tick resolution
ORI	R2, R0, 96
SW	R2, Offset(T5CON+0)(GP)
;Config.c,210 :: 		T6CON  = 0x0060;  //   a prescaler of 1:64 to get 1.28usec tick resolution
ORI	R2, R0, 96
SW	R2, Offset(T6CON+0)(GP)
;Config.c,211 :: 		T7CON  = 0x0060;  //   a prescaler of 1:64 to get 1.28usec tick resolution
ORI	R2, R0, 96
SW	R2, Offset(T7CON+0)(GP)
;Config.c,214 :: 		PR2    = 0xFFFF;   //OC5
ORI	R2, R0, 65535
SW	R2, Offset(PR2+0)(GP)
;Config.c,215 :: 		PR3    = 0xFFFF;   //OC6
ORI	R2, R0, 65535
SW	R2, Offset(PR3+0)(GP)
;Config.c,216 :: 		PR4    = 0xFFFF;   //OC2
ORI	R2, R0, 65535
SW	R2, Offset(PR4+0)(GP)
;Config.c,217 :: 		PR5    = 0xFFFF;   //OC3
ORI	R2, R0, 65535
SW	R2, Offset(PR5+0)(GP)
;Config.c,218 :: 		PR6    = 0xFFFF;   //OC7
ORI	R2, R0, 65535
SW	R2, Offset(PR6+0)(GP)
;Config.c,219 :: 		PR7    = 0xFFFF;   //OC8
ORI	R2, R0, 65535
SW	R2, Offset(PR7+0)(GP)
;Config.c,222 :: 		OC5CON = 0x0004; //X Conf OC5 module for dual single Pulse output 16bit tmr2
ORI	R2, R0, 4
SW	R2, Offset(OC5CON+0)(GP)
;Config.c,223 :: 		OC2CON = 0x0004; //Y Conf OC2 module for dual single Pulse output 16bit tmr4
ORI	R2, R0, 4
SW	R2, Offset(OC2CON+0)(GP)
;Config.c,224 :: 		OC7CON = 0x0004; //Z Conf OC7 module for dual single Pulse output 16bit tmr6
ORI	R2, R0, 4
SW	R2, Offset(OC7CON+0)(GP)
;Config.c,225 :: 		OC3CON = 0x000C; //A Conf OC3 module for dual single Pulse output 16bit tmr5
ORI	R2, R0, 12
SW	R2, Offset(OC3CON+0)(GP)
;Config.c,226 :: 		OC6CON = 0x000C; //B Conf OC6 module for dual single Pulse output 16bit tmr3
ORI	R2, R0, 12
SW	R2, Offset(OC6CON+0)(GP)
;Config.c,227 :: 		OC8CON = 0x000C; //C Conf OC8 module for dual single Pulse output 16bit tmr7
ORI	R2, R0, 12
SW	R2, Offset(OC8CON+0)(GP)
;Config.c,235 :: 		OC5R   = 0x5;        // X_Axis Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Config.c,236 :: 		OC5RS  = 0x234;      // X_Axis Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(OC5RS+0)(GP)
;Config.c,237 :: 		OC2R   = 0x5;        // Y_Axis Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Config.c,238 :: 		OC2RS  = 0x234;      // Y_Axis Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(OC2RS+0)(GP)
;Config.c,239 :: 		OC7R   = 0x5;        // Z_Axis Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Config.c,240 :: 		OC7RS  = 0x234;      // Z_Axis Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(OC7RS+0)(GP)
;Config.c,241 :: 		OC3R   = 0x5;        // A_Axis Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Config.c,242 :: 		OC3RS  = 0x234;      // A_Axis Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(OC3RS+0)(GP)
;Config.c,243 :: 		OC6R   = 0x5;        // B_Axis Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Config.c,244 :: 		OC6RS  = 0x234;      // B_Axis Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(OC6RS+0)(GP)
;Config.c,245 :: 		OC8R   = 0x5;        // C_Axis Initialize Compare Register 1
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Config.c,246 :: 		OC8RS  = 0x234;      // C_Axis Initialize Secondary Compare Register 1
ORI	R2, R0, 564
SW	R2, Offset(OC8RS+0)(GP)
;Config.c,250 :: 		OC5IP0_bit = 1;  // Set OC5 interrupt priority to 3
LUI	R2, BitMask(OC5IP0_bit+0)
ORI	R2, R2, BitMask(OC5IP0_bit+0)
_SX	
;Config.c,251 :: 		OC5IP1_bit = 1;
LUI	R2, BitMask(OC5IP1_bit+0)
ORI	R2, R2, BitMask(OC5IP1_bit+0)
_SX	
;Config.c,252 :: 		OC5IP2_bit = 0;
LUI	R2, BitMask(OC5IP2_bit+0)
ORI	R2, R2, BitMask(OC5IP2_bit+0)
_SX	
;Config.c,253 :: 		OC5IS0_bit = 1;  // Set OC5 sub priority 2
LUI	R2, BitMask(OC5IS0_bit+0)
ORI	R2, R2, BitMask(OC5IS0_bit+0)
_SX	
;Config.c,254 :: 		OC5IS1_bit = 0;
LUI	R2, BitMask(OC5IS1_bit+0)
ORI	R2, R2, BitMask(OC5IS1_bit+0)
_SX	
;Config.c,255 :: 		OC5IF_bit  = 0;  // reset interrupt flag
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Config.c,256 :: 		OC5IE_bit  = 0;  // enable interrupt
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Config.c,259 :: 		OC2IP0_bit = 1;  // Set OC3 interrupt priority to 3
LUI	R2, BitMask(OC2IP0_bit+0)
ORI	R2, R2, BitMask(OC2IP0_bit+0)
_SX	
;Config.c,260 :: 		OC2IP1_bit = 1;
LUI	R2, BitMask(OC2IP1_bit+0)
ORI	R2, R2, BitMask(OC2IP1_bit+0)
_SX	
;Config.c,261 :: 		OC2IP2_bit = 0;
LUI	R2, BitMask(OC2IP2_bit+0)
ORI	R2, R2, BitMask(OC2IP2_bit+0)
_SX	
;Config.c,262 :: 		OC2IS0_bit = 0;  // Set OC3 sub priority 1
LUI	R2, BitMask(OC2IS0_bit+0)
ORI	R2, R2, BitMask(OC2IS0_bit+0)
_SX	
;Config.c,263 :: 		OC2IS1_bit = 0;
LUI	R2, BitMask(OC2IS1_bit+0)
ORI	R2, R2, BitMask(OC2IS1_bit+0)
_SX	
;Config.c,264 :: 		OC2IF_bit  = 0;   // reset interrupt flag
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Config.c,265 :: 		OC2IE_bit  = 0;   // enable interrupt
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Config.c,268 :: 		OC7IP0_bit = 1;  // Set OC8 interrupt priority to 3
LUI	R2, BitMask(OC7IP0_bit+0)
ORI	R2, R2, BitMask(OC7IP0_bit+0)
_SX	
;Config.c,269 :: 		OC7IP1_bit = 1;
LUI	R2, BitMask(OC7IP1_bit+0)
ORI	R2, R2, BitMask(OC7IP1_bit+0)
_SX	
;Config.c,270 :: 		OC7IP2_bit = 0;
LUI	R2, BitMask(OC7IP2_bit+0)
ORI	R2, R2, BitMask(OC7IP2_bit+0)
_SX	
;Config.c,271 :: 		OC7IS0_bit = 1;  // Set OC8 sub priority 2
LUI	R2, BitMask(OC7IS0_bit+0)
ORI	R2, R2, BitMask(OC7IS0_bit+0)
_SX	
;Config.c,272 :: 		OC7IS1_bit = 0;
LUI	R2, BitMask(OC7IS1_bit+0)
ORI	R2, R2, BitMask(OC7IS1_bit+0)
_SX	
;Config.c,273 :: 		OC7IF_bit  = 0;  // reset interrupt flag
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Config.c,274 :: 		OC7IE_bit  = 0;  // enable interrupt
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Config.c,277 :: 		OC3IP0_bit = 1;  // Set OC3 interrupt priority to 3
LUI	R2, BitMask(OC3IP0_bit+0)
ORI	R2, R2, BitMask(OC3IP0_bit+0)
_SX	
;Config.c,278 :: 		OC3IP1_bit = 1;
LUI	R2, BitMask(OC3IP1_bit+0)
ORI	R2, R2, BitMask(OC3IP1_bit+0)
_SX	
;Config.c,279 :: 		OC3IP2_bit = 0;
LUI	R2, BitMask(OC3IP2_bit+0)
ORI	R2, R2, BitMask(OC3IP2_bit+0)
_SX	
;Config.c,280 :: 		OC3IS0_bit = 0;  // Set OC3 sub priority 1
LUI	R2, BitMask(OC3IS0_bit+0)
ORI	R2, R2, BitMask(OC3IS0_bit+0)
_SX	
;Config.c,281 :: 		OC3IS1_bit = 0;
LUI	R2, BitMask(OC3IS1_bit+0)
ORI	R2, R2, BitMask(OC3IS1_bit+0)
_SX	
;Config.c,282 :: 		OC3IF_bit  = 0;   // reset interrupt flag
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Config.c,283 :: 		OC3IE_bit  = 0;   // enable interrupt
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Config.c,286 :: 		OC6IP0_bit = 1;  // Set OC5 interrupt priority to 3
LUI	R2, BitMask(OC6IP0_bit+0)
ORI	R2, R2, BitMask(OC6IP0_bit+0)
_SX	
;Config.c,287 :: 		OC6IP1_bit = 1;
LUI	R2, BitMask(OC6IP1_bit+0)
ORI	R2, R2, BitMask(OC6IP1_bit+0)
_SX	
;Config.c,288 :: 		OC6IP2_bit = 0;
LUI	R2, BitMask(OC6IP2_bit+0)
ORI	R2, R2, BitMask(OC6IP2_bit+0)
_SX	
;Config.c,289 :: 		OC6IS0_bit = 1;  // Set OC5 sub priority 2
LUI	R2, BitMask(OC6IS0_bit+0)
ORI	R2, R2, BitMask(OC6IS0_bit+0)
_SX	
;Config.c,290 :: 		OC6IS1_bit = 0;
LUI	R2, BitMask(OC6IS1_bit+0)
ORI	R2, R2, BitMask(OC6IS1_bit+0)
_SX	
;Config.c,291 :: 		OC6IF_bit  = 0;  // reset interrupt flag
LUI	R2, BitMask(OC6IF_bit+0)
ORI	R2, R2, BitMask(OC6IF_bit+0)
_SX	
;Config.c,292 :: 		OC6IE_bit  = 0;  // enable interrupt
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
;Config.c,295 :: 		OC8IP0_bit = 1;  // Set OC8 interrupt priority to 3
LUI	R2, BitMask(OC8IP0_bit+0)
ORI	R2, R2, BitMask(OC8IP0_bit+0)
_SX	
;Config.c,296 :: 		OC8IP1_bit = 1;
LUI	R2, BitMask(OC8IP1_bit+0)
ORI	R2, R2, BitMask(OC8IP1_bit+0)
_SX	
;Config.c,297 :: 		OC8IP2_bit = 0;
LUI	R2, BitMask(OC8IP2_bit+0)
ORI	R2, R2, BitMask(OC8IP2_bit+0)
_SX	
;Config.c,298 :: 		OC8IS0_bit = 1;  // Set OC8 sub priority 2
LUI	R2, BitMask(OC8IS0_bit+0)
ORI	R2, R2, BitMask(OC8IS0_bit+0)
_SX	
;Config.c,299 :: 		OC8IS1_bit = 0;
LUI	R2, BitMask(OC8IS1_bit+0)
ORI	R2, R2, BitMask(OC8IS1_bit+0)
_SX	
;Config.c,300 :: 		OC8IF_bit  = 0;  // reset interrupt flag
LUI	R2, BitMask(OC8IF_bit+0)
ORI	R2, R2, BitMask(OC8IF_bit+0)
_SX	
;Config.c,301 :: 		OC8IE_bit  = 0;  // enable interrupt
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
;Config.c,304 :: 		T2CONSET  = 0x8000; //X Enable Timer2 0C5
ORI	R2, R0, 32768
SW	R2, Offset(T2CONSET+0)(GP)
;Config.c,305 :: 		T4CONSET  = 0x8000; //Y Enable Timer4 OC2
ORI	R2, R0, 32768
SW	R2, Offset(T4CONSET+0)(GP)
;Config.c,306 :: 		T6CONSET  = 0x8000; //Z Enable Timer6 OC7
ORI	R2, R0, 32768
SW	R2, Offset(T6CONSET+0)(GP)
;Config.c,307 :: 		T5CONSET  = 0x8000; //A Enable Timer5 0C3
ORI	R2, R0, 32768
SW	R2, Offset(T5CONSET+0)(GP)
;Config.c,308 :: 		T3CONSET  = 0x8000; //B Enable Timer3 OC6
ORI	R2, R0, 32768
SW	R2, Offset(T3CONSET+0)(GP)
;Config.c,309 :: 		T7CONSET  = 0x8000; //C Enable Timer6 OC8
ORI	R2, R0, 32768
SW	R2, Offset(T7CONSET+0)(GP)
;Config.c,315 :: 		}
L_end_OutPutPulseXYZ:
JR	RA
NOP	
; end of _OutPutPulseXYZ
_LcdI2CConfig:
;Config.c,319 :: 		void LcdI2CConfig(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Config.c,321 :: 		I2C4_Init_Advanced(50000, 100000);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
LUI	R26, 1
ORI	R26, R26, 34464
ORI	R25, R0, 50000
JAL	_I2C4_Init_Advanced+0
NOP	
;Config.c,322 :: 		I2C_Set_Active(&I2C4_Start, &I2C4_Restart, &I2C4_Read, &I2C4_Write,
LUI	R28, hi_addr(_I2C4_Write+0)
ORI	R28, R28, lo_addr(_I2C4_Write+0)
LUI	R27, hi_addr(_I2C4_Read+0)
ORI	R27, R27, lo_addr(_I2C4_Read+0)
LUI	R26, hi_addr(_I2C4_Restart+0)
ORI	R26, R26, lo_addr(_I2C4_Restart+0)
LUI	R25, hi_addr(_I2C4_Start+0)
ORI	R25, R25, lo_addr(_I2C4_Start+0)
;Config.c,323 :: 		&I2C4_Stop,&I2C4_Is_Idle); // Sets the I2C4 module active
LUI	R2, hi_addr(_I2C4_Is_Idle+0)
ORI	R2, R2, lo_addr(_I2C4_Is_Idle+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(_I2C4_Stop+0)
ORI	R2, R2, lo_addr(_I2C4_Stop+0)
SW	R2, 0(SP)
JAL	_I2C_Set_Active+0
NOP	
ADDIU	SP, SP, 8
;Config.c,324 :: 		Delay_ms(100);
LUI	R24, 101
ORI	R24, R24, 47530
L_LcdI2CConfig16:
ADDIU	R24, R24, -1
BNE	R24, R0, L_LcdI2CConfig16
NOP	
;Config.c,325 :: 		I2C_LCD_init(LCD_01_ADDRESS,4);
ORI	R26, R0, 4
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_init+0
NOP	
;Config.c,326 :: 		Delay_ms(100);
LUI	R24, 101
ORI	R24, R24, 47530
L_LcdI2CConfig18:
ADDIU	R24, R24, -1
BNE	R24, R0, L_LcdI2CConfig18
NOP	
;Config.c,327 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_FIRST_ROW,1);
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;Config.c,328 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CURSOR_OFF,1); // Cursor off
ORI	R27, R0, 1
ORI	R26, R0, 7
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;Config.c,329 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CLEAR,1); // Clear display
ORI	R27, R0, 1
ORI	R26, R0, 5
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;Config.c,330 :: 		}
L_end_LcdI2CConfig:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _LcdI2CConfig
_initDMA_global:
;Config.c,334 :: 		void initDMA_global(){
;Config.c,335 :: 		DMACON = 1<<16;       //enable the DMA controller
LUI	R2, 1
SW	R2, Offset(DMACON+0)(GP)
;Config.c,336 :: 		DCH0CON = 0x03;   //channel off on block trf complete ,no event detect, priority 3, no chaining
ORI	R2, R0, 3
SW	R2, Offset(DCH0CON+0)(GP)
;Config.c,337 :: 		}
L_end_initDMA_global:
JR	RA
NOP	
; end of _initDMA_global
_initDMA0:
;Config.c,340 :: 		void  initDMA0(){
;Config.c,341 :: 		DMACONbits.ON = 1;
ORI	R2, R0, 32768
SWR	R2, Offset(DMACONbits+8)(GP)
SWL	R2, Offset(DMACONbits+11)(GP)
;Config.c,342 :: 		DCH0CONbits.CHAEN = 1;
ORI	R2, R0, 16
SW	R2, Offset(DCH0CONbits+8)(GP)
;Config.c,343 :: 		DCH0CONbits.CHPATLEN = 0;
ORI	R2, R0, 2048
SW	R2, Offset(DCH0CONbits+4)(GP)
;Config.c,344 :: 		DMA0IE_bit = 0;
LUI	R2, BitMask(DMA0IE_bit+0)
ORI	R2, R2, BitMask(DMA0IE_bit+0)
_SX	
;Config.c,345 :: 		DMA0IF_bit = 0;
LUI	R2, BitMask(DMA0IF_bit+0)
ORI	R2, R2, BitMask(DMA0IF_bit+0)
_SX	
;Config.c,347 :: 		DCH0ECON      =(146 << 8 ) | 0x30;         // DCH0ECON Specific INTERRUPT IRQ NUMBER (146) for UART 2 RX
ORI	R2, R0, 37424
SW	R2, Offset(DCH0ECON+0)(GP)
;Config.c,348 :: 		DCH0DAT       =  0x0D;
ORI	R2, R0, 13
SW	R2, Offset(DCH0DAT+0)(GP)
;Config.c,350 :: 		DCH0SSA       = KVA_TO_PA(0xBF822230);    // RxBuf virtual address     [0xBF822230 = U2RXREG]
LUI	R2, 8066
ORI	R2, R2, 8752
SW	R2, Offset(DCH0SSA+0)(GP)
;Config.c,351 :: 		DCH0DSA       = KVA_TO_PA(0xA0002000);    //   virtual address:= IN RAM FOR RECIEVED DATA
ORI	R2, R0, 8192
SW	R2, Offset(DCH0DSA+0)(GP)
;Config.c,353 :: 		DCH0SSIZ      = 200  ;  // source size = size of buffer set up rcBuf, x bytes at a time
ORI	R2, R0, 200
SW	R2, Offset(DCH0SSIZ+0)(GP)
;Config.c,354 :: 		DCH0DSIZ      = 200  ;  // destination size = Size for the 'rxBuf' to fill up with received characters. It is = 5 in this example...
ORI	R2, R0, 200
SW	R2, Offset(DCH0DSIZ+0)(GP)
;Config.c,355 :: 		DCH0CSIZ      = 200  ;  // bytes transferred per event = Size of how many bytes to transfer per each interrupt on #27 IRQ event
ORI	R2, R0, 200
SW	R2, Offset(DCH0CSIZ+0)(GP)
;Config.c,357 :: 		DCH0INTCLR    = 0x00FF00FF ; // Clear existing events, disable all interrupts ''Clear flags in DMA controller channel 0
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH0INTCLR+0)(GP)
;Config.c,358 :: 		CHBCIE_bit    = 1  ;         // Enable Interrupt on block transfer complete
LUI	R2, BitMask(CHBCIE_bit+0)
ORI	R2, R2, BitMask(CHBCIE_bit+0)
_SX	
;Config.c,359 :: 		CHERIE_bit    = 1  ;         // Enable Interrupt on errors
LUI	R2, BitMask(CHERIE_bit+0)
ORI	R2, R2, BitMask(CHERIE_bit+0)
_SX	
;Config.c,363 :: 		IPC33CLR       = 0x0000001F ;//' clear DMA channel priority and sub-priority
ORI	R2, R0, 31
SW	R2, Offset(IPC33CLR+0)(GP)
;Config.c,364 :: 		DMA0IP2_bit   = 1 ;          //' IPC9 DMA0IP  priority = 5
LUI	R2, BitMask(DMA0IP2_bit+0)
ORI	R2, R2, BitMask(DMA0IP2_bit+0)
_SX	
;Config.c,365 :: 		DMA0IP1_bit   = 0 ;
LUI	R2, BitMask(DMA0IP1_bit+0)
ORI	R2, R2, BitMask(DMA0IP1_bit+0)
_SX	
;Config.c,366 :: 		DMA0IP0_bit   = 1 ;
LUI	R2, BitMask(DMA0IP0_bit+0)
ORI	R2, R2, BitMask(DMA0IP0_bit+0)
_SX	
;Config.c,367 :: 		DMA0IS1_bit   = 1 ;         //' sub-priority 3
LUI	R2, BitMask(DMA0IS1_bit+0)
ORI	R2, R2, BitMask(DMA0IS1_bit+0)
_SX	
;Config.c,368 :: 		DMA0IS0_bit   = 1 ;
LUI	R2, BitMask(DMA0IS0_bit+0)
ORI	R2, R2, BitMask(DMA0IS0_bit+0)
_SX	
;Config.c,370 :: 		DMA0IE_bit    = 1 ;         //' enable DMA0 interrupt
LUI	R2, BitMask(DMA0IE_bit+0)
ORI	R2, R2, BitMask(DMA0IE_bit+0)
_SX	
;Config.c,371 :: 		CHEN_bit      = 1 ;         //' Enable channel - may want to do this when you are ready to receive...
LUI	R2, BitMask(CHEN_bit+0)
ORI	R2, R2, BitMask(CHEN_bit+0)
_SX	
;Config.c,373 :: 		}
L_end_initDMA0:
JR	RA
NOP	
; end of _initDMA0
_initDMA1:
;Config.c,376 :: 		void initDMA1(){
;Config.c,378 :: 		DMA1IE_bit = 0 ;                   //' disable DMA1 interrupt
LUI	R2, BitMask(DMA1IE_bit+0)
ORI	R2, R2, BitMask(DMA1IE_bit+0)
_SX	
;Config.c,379 :: 		DMA1IF_bit = 0 ;                   //' clear DMA1 interrupt flag
LUI	R2, BitMask(DMA1IF_bit+0)
ORI	R2, R2, BitMask(DMA1IF_bit+0)
_SX	
;Config.c,380 :: 		DCH1CONbits.CHPATLEN = 0;
ORI	R2, R0, 2048
SW	R2, Offset(DCH1CONbits+4)(GP)
;Config.c,381 :: 		DCH1ECON=(147 << 8)| 0x30;         //' Specific INTERRUPT IRQ NUMBER for UART 2 TX (147)
ORI	R2, R0, 37680
SW	R2, Offset(DCH1ECON+0)(GP)
;Config.c,382 :: 		DCH1SSA = KVA_TO_PA(0xA0002200) ;  //0xA0002200 virtual address of txBuf
ORI	R2, R0, 8704
SW	R2, Offset(DCH1SSA+0)(GP)
;Config.c,383 :: 		DCH1DSA = KVA_TO_PA(0xBF822220) ;  //U1TX2REG for reply  [0xBF822220 = U1TXREG]
LUI	R2, 8066
ORI	R2, R2, 8736
SW	R2, Offset(DCH1DSA+0)(GP)
;Config.c,384 :: 		DCH1DAT       = 0x0D;
ORI	R2, R0, 13
SW	R2, Offset(DCH1DAT+0)(GP)
;Config.c,386 :: 		DCH1SSIZ = 200  ;  //' This is how many bytes you want to send out in a block transfer for UART transmitter
ORI	R2, R0, 200
SW	R2, Offset(DCH1SSIZ+0)(GP)
;Config.c,388 :: 		DCH1DSIZ = 1  ;    //' This is how many bytes come from the destination - i.e. rxBuf recieved can change dynamicall as its send buffer
ORI	R2, R0, 1
SW	R2, Offset(DCH1DSIZ+0)(GP)
;Config.c,390 :: 		DCH1CSIZ = 200  ;  //' x bytes from txBuf in a cell waiting to send out 1 byte at a time to U1TXREG / DCH1DSIZ
ORI	R2, R0, 200
SW	R2, Offset(DCH1CSIZ+0)(GP)
;Config.c,392 :: 		DCH1INTCLR  =  0x00FF00FF ; //'clear all interrupts and clear all interrupt flags
LUI	R2, 255
ORI	R2, R2, 255
SW	R2, Offset(DCH1INTCLR+0)(GP)
;Config.c,393 :: 		CHBCIE_DCH1INT_bit = 1    ; //'Enable Channel Block transfer interrupt
LUI	R2, BitMask(CHBCIE_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHBCIE_DCH1INT_bit+0)
_SX	
;Config.c,394 :: 		CHERIE_DCH1INT_bit = 1    ; //'Enable Channel Address Error interrupt
LUI	R2, BitMask(CHERIE_DCH1INT_bit+0)
ORI	R2, R2, BitMask(CHERIE_DCH1INT_bit+0)
_SX	
;Config.c,396 :: 		DMA1IP2_bit = 1 ;           //' DMA1 interrupt priority 5
LUI	R2, BitMask(DMA1IP2_bit+0)
ORI	R2, R2, BitMask(DMA1IP2_bit+0)
_SX	
;Config.c,397 :: 		DMA1IP1_bit = 0 ;
LUI	R2, BitMask(DMA1IP1_bit+0)
ORI	R2, R2, BitMask(DMA1IP1_bit+0)
_SX	
;Config.c,398 :: 		DMA1IP0_bit = 1 ;
LUI	R2, BitMask(DMA1IP0_bit+0)
ORI	R2, R2, BitMask(DMA1IP0_bit+0)
_SX	
;Config.c,399 :: 		DMA1IS1_bit = 0 ;           //' sub-priority 1
LUI	R2, BitMask(DMA1IS1_bit+0)
ORI	R2, R2, BitMask(DMA1IS1_bit+0)
_SX	
;Config.c,400 :: 		DMA1IS0_bit = 1 ;
LUI	R2, BitMask(DMA1IS0_bit+0)
ORI	R2, R2, BitMask(DMA1IS0_bit+0)
_SX	
;Config.c,401 :: 		DMA1IE_bit  = 1 ;           //' enable DMA1 interrupt
LUI	R2, BitMask(DMA1IE_bit+0)
ORI	R2, R2, BitMask(DMA1IE_bit+0)
_SX	
;Config.c,402 :: 		}
L_end_initDMA1:
JR	RA
NOP	
; end of _initDMA1
