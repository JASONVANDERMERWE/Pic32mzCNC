_InitTimer1:
;Timers.c,11 :: 		void InitTimer1(){
;Timers.c,12 :: 		Clock = ClockPulse;
LUI	R2, hi_addr(_ClockPulse+0)
ORI	R2, R2, lo_addr(_ClockPulse+0)
SW	R2, Offset(_Clock+0)(GP)
;Timers.c,13 :: 		T1CON         = 0x8010;
ORI	R2, R0, 32784
SW	R2, Offset(T1CON+0)(GP)
;Timers.c,14 :: 		T1IP0_bit     = 1;
LUI	R2, BitMask(T1IP0_bit+0)
ORI	R2, R2, BitMask(T1IP0_bit+0)
_SX	
;Timers.c,15 :: 		T1IP1_bit     = 1;
LUI	R2, BitMask(T1IP1_bit+0)
ORI	R2, R2, BitMask(T1IP1_bit+0)
_SX	
;Timers.c,16 :: 		T1IP2_bit     = 0;
LUI	R2, BitMask(T1IP2_bit+0)
ORI	R2, R2, BitMask(T1IP2_bit+0)
_SX	
;Timers.c,17 :: 		T1IS0_bit     = 1;
LUI	R2, BitMask(T1IS0_bit+0)
ORI	R2, R2, BitMask(T1IS0_bit+0)
_SX	
;Timers.c,18 :: 		T1IS1_bit     = 0;
LUI	R2, BitMask(T1IS1_bit+0)
ORI	R2, R2, BitMask(T1IS1_bit+0)
_SX	
;Timers.c,19 :: 		T1IF_bit      = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;Timers.c,20 :: 		T1IE_bit      = 1;
LUI	R2, BitMask(T1IE_bit+0)
ORI	R2, R2, BitMask(T1IE_bit+0)
_SX	
;Timers.c,21 :: 		PR1           = 62500;
ORI	R2, R0, 62500
SW	R2, Offset(PR1+0)(GP)
;Timers.c,22 :: 		TMR1          = 0;
SW	R0, Offset(TMR1+0)(GP)
;Timers.c,23 :: 		}
L_end_InitTimer1:
JR	RA
NOP	
; end of _InitTimer1
_InitTimer8:
;Timers.c,28 :: 		void InitTimer8(){
;Timers.c,29 :: 		T8CON            = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(T8CON+0)(GP)
;Timers.c,30 :: 		T8IP0_bit        = 3;
LUI	R2, BitMask(T8IP0_bit+0)
ORI	R2, R2, BitMask(T8IP0_bit+0)
_SX	
;Timers.c,31 :: 		T8IP1_bit        = 1;
LUI	R2, BitMask(T8IP1_bit+0)
ORI	R2, R2, BitMask(T8IP1_bit+0)
_SX	
;Timers.c,32 :: 		T8IP2_bit        = 0;
LUI	R2, BitMask(T8IP2_bit+0)
ORI	R2, R2, BitMask(T8IP2_bit+0)
_SX	
;Timers.c,33 :: 		T8IS0_bit        = 0;
LUI	R2, BitMask(T8IS0_bit+0)
ORI	R2, R2, BitMask(T8IS0_bit+0)
_SX	
;Timers.c,34 :: 		T8IS1_bit        = 1;
LUI	R2, BitMask(T8IS1_bit+0)
ORI	R2, R2, BitMask(T8IS1_bit+0)
_SX	
;Timers.c,35 :: 		T8IF_bit         = 0;
LUI	R2, BitMask(T8IF_bit+0)
ORI	R2, R2, BitMask(T8IF_bit+0)
_SX	
;Timers.c,36 :: 		T8IE_bit         = 0;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Timers.c,37 :: 		PR8              = 50;
ORI	R2, R0, 50
SW	R2, Offset(PR8+0)(GP)
;Timers.c,38 :: 		TMR8             = 0;
SW	R0, Offset(TMR8+0)(GP)
;Timers.c,39 :: 		}
L_end_InitTimer8:
JR	RA
NOP	
; end of _InitTimer8
_Timer1Interrupt:
;Timers.c,44 :: 		void Timer1Interrupt() iv IVT_TIMER_1 ilevel 3 ics ICS_SRS {
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
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Timers.c,45 :: 		T1IF_bit  = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;Timers.c,47 :: 		Clock();
LW	R30, Offset(_Clock+0)(GP)
JALR	RA, R30
NOP	
;Timers.c,48 :: 		}
L_end_Timer1Interrupt:
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
; end of _Timer1Interrupt
_Timer8Interrupt:
;Timers.c,52 :: 		void Timer8Interrupt() iv IVT_TIMER_8 ilevel 3 ics ICS_SRS {
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
;Timers.c,55 :: 		T8IF_bit  = 0;
LUI	R2, BitMask(T8IF_bit+0)
ORI	R2, R2, BitMask(T8IF_bit+0)
_SX	
;Timers.c,56 :: 		}
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
_ClockPulse:
;Timers.c,60 :: 		void ClockPulse(){
;Timers.c,61 :: 		ms100++;
LHU	R2, Offset(Timers_ms100+0)(GP)
ADDIU	R4, R2, 1
SH	R4, Offset(Timers_ms100+0)(GP)
;Timers.c,62 :: 		ms300++;
LHU	R2, Offset(Timers_ms300+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Timers_ms300+0)(GP)
;Timers.c,63 :: 		ms500++;
LHU	R2, Offset(Timers_ms500+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Timers_ms500+0)(GP)
;Timers.c,64 :: 		sec1++;
LHU	R2, Offset(Timers_sec1+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Timers_sec1+0)(GP)
;Timers.c,66 :: 		TMR.clock.B0 = !TMR.clock.B0;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 0, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 0, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,67 :: 		if(ms100 > 9){
ANDI	R2, R4, 65535
SLTIU	R2, R2, 10
BEQ	R2, R0, L__ClockPulse9
NOP	
J	L_ClockPulse0
NOP	
L__ClockPulse9:
;Timers.c,68 :: 		ms100 = 0;
SH	R0, Offset(Timers_ms100+0)(GP)
;Timers.c,69 :: 		TMR.clock.B1 = !TMR.clock.B1;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 1, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 1, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,70 :: 		}
L_ClockPulse0:
;Timers.c,71 :: 		if(ms300 > 29){
LHU	R2, Offset(Timers_ms300+0)(GP)
SLTIU	R2, R2, 30
BEQ	R2, R0, L__ClockPulse10
NOP	
J	L_ClockPulse1
NOP	
L__ClockPulse10:
;Timers.c,72 :: 		ms300 = 0;
SH	R0, Offset(Timers_ms300+0)(GP)
;Timers.c,73 :: 		TMR.clock.B2 = !TMR.clock.B2;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 2, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 2, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,74 :: 		}
L_ClockPulse1:
;Timers.c,75 :: 		if(ms500 > 49){
LHU	R2, Offset(Timers_ms500+0)(GP)
SLTIU	R2, R2, 50
BEQ	R2, R0, L__ClockPulse11
NOP	
J	L_ClockPulse2
NOP	
L__ClockPulse11:
;Timers.c,76 :: 		ms500 = 0;
SH	R0, Offset(Timers_ms500+0)(GP)
;Timers.c,77 :: 		TMR.clock.B3 = !TMR.clock.B3;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 3, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 3, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,78 :: 		}
L_ClockPulse2:
;Timers.c,79 :: 		if(sec1 > 99){
LHU	R2, Offset(Timers_sec1+0)(GP)
SLTIU	R2, R2, 100
BEQ	R2, R0, L__ClockPulse12
NOP	
J	L_ClockPulse3
NOP	
L__ClockPulse12:
;Timers.c,80 :: 		sec1 = 0;
SH	R0, Offset(Timers_sec1+0)(GP)
;Timers.c,81 :: 		TMR.clock.B4 = !TMR.clock.B4;
LBU	R2, Offset(_TMR+0)(GP)
EXT	R2, R2, 4, 1
XORI	R3, R2, 1
LBU	R2, Offset(_TMR+0)(GP)
INS	R2, R3, 4, 1
SB	R2, Offset(_TMR+0)(GP)
;Timers.c,82 :: 		}
L_ClockPulse3:
;Timers.c,84 :: 		}
L_end_ClockPulse:
JR	RA
NOP	
; end of _ClockPulse
