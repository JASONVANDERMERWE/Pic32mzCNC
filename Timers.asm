_InitTimer1:
;Timers.c,9 :: 		void InitTimer1(){
;Timers.c,10 :: 		T1CON         = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(T1CON+0)(GP)
;Timers.c,11 :: 		T1IP0_bit     = 1;
LUI	R2, BitMask(T1IP0_bit+0)
ORI	R2, R2, BitMask(T1IP0_bit+0)
_SX	
;Timers.c,12 :: 		T1IP1_bit     = 1;
LUI	R2, BitMask(T1IP1_bit+0)
ORI	R2, R2, BitMask(T1IP1_bit+0)
_SX	
;Timers.c,13 :: 		T1IP2_bit     = 0;
LUI	R2, BitMask(T1IP2_bit+0)
ORI	R2, R2, BitMask(T1IP2_bit+0)
_SX	
;Timers.c,14 :: 		T1IS0_bit     = 1;
LUI	R2, BitMask(T1IS0_bit+0)
ORI	R2, R2, BitMask(T1IS0_bit+0)
_SX	
;Timers.c,15 :: 		T1IS1_bit     = 0;
LUI	R2, BitMask(T1IS1_bit+0)
ORI	R2, R2, BitMask(T1IS1_bit+0)
_SX	
;Timers.c,16 :: 		T1IF_bit      = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;Timers.c,17 :: 		T1IE_bit      = 1;
LUI	R2, BitMask(T1IE_bit+0)
ORI	R2, R2, BitMask(T1IE_bit+0)
_SX	
;Timers.c,18 :: 		PR1           = 100;
ORI	R2, R0, 100
SW	R2, Offset(PR1+0)(GP)
;Timers.c,19 :: 		TMR1          = 0;
SW	R0, Offset(TMR1+0)(GP)
;Timers.c,20 :: 		}
L_end_InitTimer1:
JR	RA
NOP	
; end of _InitTimer1
_InitTimer8:
;Timers.c,25 :: 		void InitTimer8(){
;Timers.c,26 :: 		T8CON            = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(T8CON+0)(GP)
;Timers.c,27 :: 		T8IP0_bit        = 3;
LUI	R2, BitMask(T8IP0_bit+0)
ORI	R2, R2, BitMask(T8IP0_bit+0)
_SX	
;Timers.c,28 :: 		T8IP1_bit        = 1;
LUI	R2, BitMask(T8IP1_bit+0)
ORI	R2, R2, BitMask(T8IP1_bit+0)
_SX	
;Timers.c,29 :: 		T8IP2_bit        = 0;
LUI	R2, BitMask(T8IP2_bit+0)
ORI	R2, R2, BitMask(T8IP2_bit+0)
_SX	
;Timers.c,30 :: 		T8IS0_bit        = 0;
LUI	R2, BitMask(T8IS0_bit+0)
ORI	R2, R2, BitMask(T8IS0_bit+0)
_SX	
;Timers.c,31 :: 		T8IS1_bit        = 1;
LUI	R2, BitMask(T8IS1_bit+0)
ORI	R2, R2, BitMask(T8IS1_bit+0)
_SX	
;Timers.c,32 :: 		T8IF_bit         = 0;
LUI	R2, BitMask(T8IF_bit+0)
ORI	R2, R2, BitMask(T8IF_bit+0)
_SX	
;Timers.c,33 :: 		T8IE_bit         = 0;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Timers.c,34 :: 		PR8              = 50;
ORI	R2, R0, 50
SW	R2, Offset(PR8+0)(GP)
;Timers.c,35 :: 		TMR8             = 0;
SW	R0, Offset(TMR8+0)(GP)
;Timers.c,36 :: 		}
L_end_InitTimer8:
JR	RA
NOP	
; end of _InitTimer8
_Timer1Interrupt:
;Timers.c,41 :: 		void Timer1Interrupt() iv IVT_TIMER_1 ilevel 3 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 3072
MTC0	R30, 12, 0
;Timers.c,42 :: 		T1IF_bit  = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;Timers.c,44 :: 		}
L_end_Timer1Interrupt:
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
; end of _Timer1Interrupt
_Timer8Interrupt:
;Timers.c,48 :: 		void Timer8Interrupt() iv IVT_TIMER_8 ilevel 3 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 3072
MTC0	R30, 12, 0
;Timers.c,51 :: 		T8IF_bit  = 0;
LUI	R2, BitMask(T8IF_bit+0)
ORI	R2, R2, BitMask(T8IF_bit+0)
_SX	
;Timers.c,52 :: 		}
L_end_Timer8Interrupt:
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
