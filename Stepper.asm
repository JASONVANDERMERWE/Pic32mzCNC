_SetPinMode:
;Stepper.c,47 :: 		void SetPinMode(){
;Stepper.c,50 :: 		EN_Step_PinDirX  = 0; //output
LUI	R2, BitMask(TRISD9_bit+0)
ORI	R2, R2, BitMask(TRISD9_bit+0)
_SX	
_LX	
EXT	R2, R2, BitPos(TRISD9_bit+0), 1
SB	R2, Offset(_AxisNo+0)(GP)
;Stepper.c,53 :: 		PLS_Step_PinDirX = 0;
LUI	R2, BitMask(TRISB14_bit+0)
ORI	R2, R2, BitMask(TRISB14_bit+0)
_SX	
;Stepper.c,54 :: 		DIR_Step_PinDirX = 0;
LUI	R2, BitMask(TRISB13_bit+0)
ORI	R2, R2, BitMask(TRISB13_bit+0)
_SX	
;Stepper.c,56 :: 		EN_Step_PinDirY  = 0; //output
LUI	R2, BitMask(TRISF0_bit+0)
ORI	R2, R2, BitMask(TRISF0_bit+0)
_SX	
;Stepper.c,59 :: 		PLS_Step_PinDirY = 0;
LUI	R2, BitMask(TRISD4_bit+0)
ORI	R2, R2, BitMask(TRISD4_bit+0)
_SX	
;Stepper.c,60 :: 		DIR_Step_PinDirY = 0;
LUI	R2, BitMask(TRISD5_bit+0)
ORI	R2, R2, BitMask(TRISD5_bit+0)
_SX	
;Stepper.c,61 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_StepperConstants:
;Stepper.c,65 :: 		void StepperConstants(long accel,long decel){
;Stepper.c,66 :: 		SV.acc = accel;
SW	R25, Offset(_SV+32)(GP)
;Stepper.c,67 :: 		SV.dec = decel;
SW	R26, Offset(_SV+36)(GP)
;Stepper.c,68 :: 		}
L_end_StepperConstants:
JR	RA
NOP	
; end of _StepperConstants
_EnStepper:
;Stepper.c,72 :: 		void EnStepper(){
;Stepper.c,76 :: 		EN_StepX       = 0;
LUI	R2, BitMask(LATD9_bit+0)
ORI	R2, R2, BitMask(LATD9_bit+0)
_SX	
;Stepper.c,80 :: 		EN_StepY       = 0;
LUI	R2, BitMask(LATF0_bit+0)
ORI	R2, R2, BitMask(LATF0_bit+0)
_SX	
;Stepper.c,81 :: 		}
L_end_EnStepper:
JR	RA
NOP	
; end of _EnStepper
_DisableStepper:
;Stepper.c,83 :: 		void DisableStepper(){
;Stepper.c,84 :: 		EN_Stepx      = 1;
LUI	R2, BitMask(LATD9_bit+0)
ORI	R2, R2, BitMask(LATD9_bit+0)
_SX	
;Stepper.c,85 :: 		EN_StepY      = 1;
LUI	R2, BitMask(LATF0_bit+0)
ORI	R2, R2, BitMask(LATF0_bit+0)
_SX	
;Stepper.c,86 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_speed_cntr_Move:
;Stepper.c,104 :: 		void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,107 :: 		if(mmSteps == 1){
SW	R25, 4(SP)
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move94
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move94:
;Stepper.c,109 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 14
ORI	R2, R0, 65535
SH	R2, 0(R3)
;Stepper.c,110 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,111 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
ORI	R2, R0, 20000
SH	R2, 0(R3)
;Stepper.c,112 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,114 :: 		}
J	L_speed_cntr_Move1
NOP	
L_speed_cntr_Move0:
;Stepper.c,116 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
BNE	R25, R0, L__speed_cntr_Move96
NOP	
J	L__speed_cntr_Move88
NOP	
L__speed_cntr_Move96:
JAL	_abs+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__speed_cntr_Move98
NOP	
J	L__speed_cntr_Move87
NOP	
L__speed_cntr_Move98:
L__speed_cntr_Move86:
;Stepper.c,120 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
LUI	R2, 2
ORI	R2, R2, 22325
DIV	R2, R26
MFLO	R2
SH	R2, 0(R3)
;Stepper.c,125 :: 		STPS[axis_No].step_delay = abs((T1_FREQ_148 * sqrt_(A_SQ / SV.acc))/100);
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SW	R2, 12(SP)
LW	R3, Offset(_SV+32)(GP)
LUI	R2, 599
ORI	R2, R2, 13812
DIV	R2, R3
MFLO	R2
SW	R25, 8(SP)
MOVZ	R25, R2, R0
JAL	Stepper_sqrt_+0
NOP	
ORI	R3, R0, 5281
MULTU	R3, R2
MFLO	R3
ORI	R2, R0, 100
DIVU	R3, R2
MFLO	R2
MOVZ	R25, R2, R0
JAL	_abs+0
NOP	
LW	R25, 8(SP)
LW	R3, 12(SP)
SH	R2, 0(R3)
;Stepper.c,126 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 30
ADDIU	R2, R2, 6
LH	R2, 0(R2)
SH	R2, 0(R3)
;Stepper.c,131 :: 		STPS[axis_No].max_step_lim = (speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 26
MUL	R3, R26, R26
LWC1	S0, Offset(_SV+32)(GP)
CVT32.W 	S1, S0
LUI	R2, 15232
ORI	R2, R2, 44534
MTC1	R2, S0
MUL.S 	S1, S0, S1
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S1, S0
CVT36.S 	S0, S0
MFC1	R2, S0
DIV	R3, R2
MFLO	R2
SH	R2, 0(R4)
;Stepper.c,136 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 26
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__speed_cntr_Move99
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move99:
;Stepper.c,137 :: 		STPS[axis_No].max_step_lim = 1;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 26
ORI	R2, R0, 1
SH	R2, 0(R3)
;Stepper.c,138 :: 		}
L_speed_cntr_Move5:
;Stepper.c,142 :: 		STPS[axis_No].accel_lim = (abs(mmSteps) * SV.dec) / (SV.acc + SV.dec);
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
SW	R2, 12(SP)
JAL	_abs+0
NOP	
LW	R3, Offset(_SV+36)(GP)
SEH	R2, R2
MUL	R4, R2, R3
LW	R3, Offset(_SV+36)(GP)
LW	R2, Offset(_SV+32)(GP)
ADDU	R2, R2, R3
DIV	R4, R2
MFLO	R3
LW	R2, 12(SP)
SH	R3, 0(R2)
;Stepper.c,145 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__speed_cntr_Move100
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move100:
;Stepper.c,146 :: 		STPS[axis_No].accel_lim = 1;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ORI	R2, R0, 1
SH	R2, 0(R3)
;Stepper.c,147 :: 		}
L_speed_cntr_Move6:
;Stepper.c,150 :: 		if(STPS[axis_No].accel_lim <= STPS[axis_No].max_step_lim){
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 24
LH	R3, 0(R2)
ADDIU	R2, R4, 26
LH	R2, 0(R2)
SEH	R3, R3
SEH	R2, R2
SLT	R2, R2, R3
BEQ	R2, R0, L__speed_cntr_Move101
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move101:
;Stepper.c,151 :: 		if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move102
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move102:
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 10
ADDIU	R2, R2, 24
LH	R2, 0(R2)
SUBU	R2, R2, R25
SH	R2, 0(R3)
J	L_speed_cntr_Move9
NOP	
L_speed_cntr_Move8:
;Stepper.c,152 :: 		else STPS[axis_No].decel_val = mmSteps + STPS[axis_No].accel_lim;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 10
ADDIU	R2, R2, 24
LH	R2, 0(R2)
ADDU	R2, R25, R2
SH	R2, 0(R3)
L_speed_cntr_Move9:
;Stepper.c,153 :: 		}else{
J	L_speed_cntr_Move10
NOP	
L_speed_cntr_Move7:
;Stepper.c,154 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * SV.acc) / SV.dec);
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 10
ADDIU	R2, R2, 26
LH	R2, 0(R2)
LW	R3, Offset(_SV+32)(GP)
SEH	R2, R2
MUL	R3, R2, R3
LW	R2, Offset(_SV+36)(GP)
DIV	R3, R2
MFLO	R3
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SH	R2, 0(R4)
;Stepper.c,155 :: 		}
L_speed_cntr_Move10:
;Stepper.c,157 :: 		if(mmSteps >= 0){
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move103
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move103:
;Stepper.c,158 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 10
LH	R2, 0(R2)
SEH	R2, R2
SLT	R2, R2, R25
BNE	R2, R0, L__speed_cntr_Move104
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move104:
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 10
LH	R2, 0(R2)
ADDU	R2, R25, R2
SH	R2, 0(R3)
J	L_speed_cntr_Move13
NOP	
L_speed_cntr_Move12:
;Stepper.c,159 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 24
LH	R2, 0(R2)
SH	R2, 0(R3)
L_speed_cntr_Move13:
;Stepper.c,160 :: 		}
J	L_speed_cntr_Move14
NOP	
L_speed_cntr_Move11:
;Stepper.c,162 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = abs(mmSteps) - STPS[axis_No].decel_val;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 10
LH	R2, 0(R2)
SEH	R2, R2
SLT	R2, R2, R25
BNE	R2, R0, L__speed_cntr_Move105
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move105:
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
SW	R2, 12(SP)
JAL	_abs+0
NOP	
SEH	R4, R27
ORI	R3, R0, 36
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 10
LH	R3, 0(R3)
SUBU	R3, R2, R3
LW	R2, 12(SP)
SH	R3, 0(R2)
J	L_speed_cntr_Move16
NOP	
L_speed_cntr_Move15:
;Stepper.c,163 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 24
LH	R2, 0(R2)
SH	R2, 0(R3)
L_speed_cntr_Move16:
;Stepper.c,164 :: 		}
L_speed_cntr_Move14:
;Stepper.c,166 :: 		if(STPS[axis_No].decel_val == 0){
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 10
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__speed_cntr_Move106
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move106:
;Stepper.c,167 :: 		STPS[axis_No].decel_val = -1;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 10
ORI	R2, R0, 65535
SH	R2, 0(R3)
;Stepper.c,168 :: 		}
L_speed_cntr_Move17:
;Stepper.c,171 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 30
LH	R3, 0(R2)
ADDIU	R2, R4, 12
LH	R2, 0(R2)
SEH	R3, R3
SEH	R2, R2
SLT	R2, R2, R3
BEQ	R2, R0, L__speed_cntr_Move107
NOP	
J	L_speed_cntr_Move18
NOP	
L__speed_cntr_Move107:
;Stepper.c,172 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
ADDIU	R2, R2, 12
LH	R2, 0(R2)
SH	R2, 0(R3)
;Stepper.c,173 :: 		STPS[axis_No].run_state = RUN;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,174 :: 		}else{
J	L_speed_cntr_Move19
NOP	
L_speed_cntr_Move18:
;Stepper.c,175 :: 		STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 6
SW	R2, 12(SP)
ADDIU	R2, R3, 30
LH	R25, 0(R2)
JAL	_abs+0
NOP	
LW	R3, 12(SP)
SH	R2, 0(R3)
;Stepper.c,176 :: 		STPS[axis_No].run_state = ACCEL;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 1
SB	R2, 0(R3)
;Stepper.c,177 :: 		}
L_speed_cntr_Move19:
;Stepper.c,116 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
L__speed_cntr_Move88:
L__speed_cntr_Move87:
;Stepper.c,179 :: 		}
L_speed_cntr_Move1:
;Stepper.c,180 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 18
SH	R0, 0(R2)
;Stepper.c,181 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 28
SH	R0, 0(R2)
;Stepper.c,182 :: 		STPS[axis_No].microSec    = 0;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,183 :: 		STPS[axis_No].accel_count = 1;
SEH	R3, R27
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 14
ORI	R2, R0, 1
SH	R2, 0(R3)
;Stepper.c,185 :: 		SV.Tog   = 0;
SH	R0, Offset(_SV+2)(GP)
;Stepper.c,186 :: 		SV.px    = 0;
SW	R0, Offset(_SV+20)(GP)
;Stepper.c,187 :: 		SV.py    = 0;
SW	R0, Offset(_SV+24)(GP)
;Stepper.c,188 :: 		SV.running = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,189 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_CycleStop:
;Stepper.c,193 :: 		void CycleStop(){
;Stepper.c,195 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,196 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop20:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 2
BNE	R2, R0, L__CycleStop109
NOP	
J	L_CycleStop21
NOP	
L__CycleStop109:
;Stepper.c,197 :: 		STPS[ii].microSec = 0;
SEH	R3, R4
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,198 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 3
BEQ	R2, R0, L__CycleStop110
NOP	
J	L_CycleStop23
NOP	
L__CycleStop110:
; ii end address is: 16 (R4)
J	L_CycleStop21
NOP	
L_CycleStop23:
;Stepper.c,196 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,199 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop20
NOP	
L_CycleStop21:
;Stepper.c,200 :: 		}
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
;Stepper.c,202 :: 		void CycleStart(){
;Stepper.c,205 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__CycleStart112
NOP	
J	L_CycleStart24
NOP	
L__CycleStart112:
;Stepper.c,206 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart25:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 2
BNE	R2, R0, L__CycleStart113
NOP	
J	L_CycleStart26
NOP	
L__CycleStart113:
;Stepper.c,207 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 3
BEQ	R2, R0, L__CycleStart114
NOP	
J	L_CycleStart28
NOP	
L__CycleStart114:
; ii end address is: 16 (R4)
J	L_CycleStart26
NOP	
L_CycleStart28:
;Stepper.c,208 :: 		STPS[ii].microSec++;
; ii start address is: 16 (R4)
SEH	R3, R4
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,206 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,209 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart25
NOP	
L_CycleStart26:
;Stepper.c,210 :: 		}
L_CycleStart24:
;Stepper.c,211 :: 		}
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
_Step:
;Stepper.c,213 :: 		void Step(long newx,long newy){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,216 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+28)(GP)
;Stepper.c,217 :: 		d2 = 0;
SW	R0, Offset(Step_d2_L0+0)(GP)
;Stepper.c,221 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,222 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,224 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Step116
NOP	
J	L_Step29
NOP	
L__Step116:
; ?FLOC___Step?T352 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Step?T352 end address is: 12 (R3)
J	L_Step30
NOP	
L_Step29:
; ?FLOC___Step?T352 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___Step?T352 end address is: 12 (R3)
L_Step30:
; ?FLOC___Step?T352 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Step?T352 end address is: 12 (R3)
SH	R2, Offset(_SV+40)(GP)
;Stepper.c,225 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Step117
NOP	
J	L_Step31
NOP	
L__Step117:
; ?FLOC___Step?T354 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Step?T354 end address is: 12 (R3)
J	L_Step32
NOP	
L_Step31:
; ?FLOC___Step?T354 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___Step?T354 end address is: 12 (R3)
L_Step32:
; ?FLOC___Step?T354 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Step?T354 end address is: 12 (R3)
SH	R2, Offset(_SV+42)(GP)
;Stepper.c,227 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+40)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step118
NOP	
J	L_Step33
NOP	
L__Step118:
LUI	R2, BitMask(LATB13_bit+0)
ORI	R2, R2, BitMask(LATB13_bit+0)
_SX	
J	L_Step34
NOP	
L_Step33:
;Stepper.c,228 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATB13_bit+0)
ORI	R2, R2, BitMask(LATB13_bit+0)
_SX	
L_Step34:
;Stepper.c,229 :: 		if(SV.dirY < 0) DIR_StepY = CCW;
LH	R2, Offset(_SV+42)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step119
NOP	
J	L_Step35
NOP	
L__Step119:
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_Step36
NOP	
L_Step35:
;Stepper.c,230 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_Step36:
;Stepper.c,232 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+12)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,233 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,235 :: 		if(SV.dx > SV.dy) d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Step120
NOP	
J	L_Step37
NOP	
L__Step120:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Step_d2_L0+0)(GP)
J	L_Step38
NOP	
L_Step37:
;Stepper.c,236 :: 		else d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Step_d2_L0+0)(GP)
L_Step38:
;Stepper.c,239 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__Step121
NOP	
J	L_Step39
NOP	
L__Step121:
;Stepper.c,240 :: 		LATE7_bit = 0;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,241 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Step122
NOP	
J	L_Step40
NOP	
L__Step122:
;Stepper.c,242 :: 		for(i=0; i < SV.dx; ++i){
; i start address is: 28 (R7)
MOVZ	R7, R0, R0
; i end address is: 28 (R7)
L_Step41:
; i start address is: 28 (R7)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R7, R2
BNE	R2, R0, L__Step123
NOP	
J	L_Step42
NOP	
L__Step123:
;Stepper.c,245 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,246 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,247 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,248 :: 		if(d2 < 0)d2 += 2*SV.dy;
LW	R2, Offset(Step_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step124
NOP	
J	L_Step44
NOP	
L__Step124:
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
J	L_Step45
NOP	
L_Step44:
;Stepper.c,250 :: 		d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
;Stepper.c,252 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,253 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,254 :: 		}
L_Step45:
;Stepper.c,257 :: 		while(STmr.compOCxRunning != 1);//STPS[X].microSec < STPS[X].step_delay);
MOVZ	R4, R7, R0
L_Step46:
; i end address is: 28 (R7)
; i start address is: 16 (R4)
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Step126
NOP	
J	L_Step47
NOP	
L__Step126:
J	L_Step46
NOP	
L_Step47:
;Stepper.c,242 :: 		for(i=0; i < SV.dx; ++i){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 28 (R7)
MOVZ	R7, R2, R0
;Stepper.c,258 :: 		}
; i end address is: 28 (R7)
J	L_Step41
NOP	
L_Step42:
;Stepper.c,259 :: 		}else{
J	L_Step48
NOP	
L_Step40:
;Stepper.c,261 :: 		for(i=0;i < SV.dy;++i){
; i start address is: 28 (R7)
MOVZ	R7, R0, R0
; i end address is: 28 (R7)
L_Step49:
; i start address is: 28 (R7)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R7, R2
BNE	R2, R0, L__Step127
NOP	
J	L_Step50
NOP	
L__Step127:
;Stepper.c,264 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,265 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,266 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,267 :: 		if(d2 < 0)d2 += 2 * SV.dx;
LW	R2, Offset(Step_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step128
NOP	
J	L_Step52
NOP	
L__Step128:
LW	R2, Offset(_SV+12)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
J	L_Step53
NOP	
L_Step52:
;Stepper.c,269 :: 		d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
;Stepper.c,270 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,271 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,272 :: 		}
L_Step53:
;Stepper.c,274 :: 		while(STmr.compOCxRunning != 2);//STPS[Y].microSec < STPS[y].step_delay);
MOVZ	R4, R7, R0
L_Step54:
; i end address is: 28 (R7)
; i start address is: 16 (R4)
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Step130
NOP	
J	L_Step55
NOP	
L__Step130:
J	L_Step54
NOP	
L_Step55:
;Stepper.c,261 :: 		for(i=0;i < SV.dy;++i){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 28 (R7)
MOVZ	R7, R2, R0
;Stepper.c,275 :: 		}
; i end address is: 28 (R7)
J	L_Step49
NOP	
L_Step50:
;Stepper.c,276 :: 		}
L_Step48:
;Stepper.c,277 :: 		}
L_Step39:
;Stepper.c,284 :: 		}
L_end_Step:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Step
_toggleOCx:
;Stepper.c,298 :: 		void toggleOCx(int axis_No){
;Stepper.c,299 :: 		switch(axis_No){
J	L_toggleOCx56
NOP	
;Stepper.c,300 :: 		case 0: OC3R   = 0x5;
L_toggleOCx58:
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,301 :: 		OC3RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LH	R2, Offset(_STPS+6)(GP)
ANDI	R2, R2, 65535
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,302 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,303 :: 		OC3CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,304 :: 		break;
J	L_toggleOCx57
NOP	
;Stepper.c,305 :: 		case 1: OC6R   = 0x5;
L_toggleOCx59:
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,306 :: 		OC6RS  = STPS[Y].step_delay & 0xFFFF;
LH	R2, Offset(_STPS+42)(GP)
ANDI	R2, R2, 65535
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,307 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,308 :: 		OC6CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,309 :: 		break;
J	L_toggleOCx57
NOP	
;Stepper.c,310 :: 		default:
L_toggleOCx60:
;Stepper.c,311 :: 		break;
J	L_toggleOCx57
NOP	
;Stepper.c,312 :: 		}
L_toggleOCx56:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx133
NOP	
J	L_toggleOCx58
NOP	
L__toggleOCx133:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx135
NOP	
J	L_toggleOCx59
NOP	
L__toggleOCx135:
J	L_toggleOCx60
NOP	
L_toggleOCx57:
;Stepper.c,314 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,317 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,319 :: 		if(!STPS[axis_No].PLS_Step_ ){
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Pulse137
NOP	
J	L_Pulse61
NOP	
L__Pulse137:
;Stepper.c,323 :: 		STPS[axis_No].step_count++;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 18
LH	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Stepper.c,325 :: 		T6IE_bit                  = 1;
LUI	R2, BitMask(T6IE_bit+0)
ORI	R2, R2, BitMask(T6IE_bit+0)
_SX	
;Stepper.c,326 :: 		T6IF_bit                  = 0;
LUI	R2, BitMask(T6IF_bit+0)
ORI	R2, R2, BitMask(T6IF_bit+0)
_SX	
;Stepper.c,328 :: 		STPS[axis_No].microSec    = 0;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,329 :: 		STPS[axis_No].PLS_Step_   = 1;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 2
SB	R2, 0(R3)
;Stepper.c,332 :: 		}
L_Pulse61:
;Stepper.c,352 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 12(SP)
J	L_Pulse62
NOP	
;Stepper.c,353 :: 		case STOP:
L_Pulse64:
;Stepper.c,354 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,355 :: 		T8IE_bit         = 0;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Stepper.c,356 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,357 :: 		break;
J	L_Pulse63
NOP	
;Stepper.c,359 :: 		case ACCEL:
L_Pulse65:
;Stepper.c,360 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - ((( (STPS[axis_No].step_delay << 1)) + STPS[axis_No].rest)/((STPS[0].accel_count << 2) + 1));
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 20
ADDIU	R2, R6, 6
LH	R4, 0(R2)
SEH	R2, R4
SLL	R3, R2, 1
ADDIU	R2, R6, 28
LH	R2, 0(R2)
ADDU	R3, R3, R2
LH	R2, Offset(_STPS+14)(GP)
SLL	R2, R2, 2
ADDIU	R2, R2, 1
SEH	R3, R3
SEH	R2, R2
DIV	R3, R2
MFLO	R2
SUBU	R2, R4, R2
SH	R2, 0(R5)
;Stepper.c,361 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2) + 1);
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 28
ADDIU	R2, R5, 6
LH	R2, 0(R2)
SEH	R2, R2
SLL	R3, R2, 1
LH	R2, 0(R4)
ADDU	R3, R3, R2
ADDIU	R2, R5, 14
LH	R2, 0(R2)
SEH	R2, R2
SLL	R2, R2, 2
ADDIU	R2, R2, 1
DIV	R3, R2
MFHI	R2
SH	R2, 0(R4)
;Stepper.c,362 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
ADDIU	R2, R2, 20
LH	R2, 0(R2)
SH	R2, 0(R3)
;Stepper.c,363 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay)STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 12
LH	R2, 0(R2)
SEH	R3, R3
SEH	R2, R2
SLT	R2, R2, R3
BEQ	R2, R0, L__Pulse138
NOP	
J	L_Pulse66
NOP	
L__Pulse138:
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
ADDIU	R2, R2, 12
LH	R2, 0(R2)
SH	R2, 0(R3)
L_Pulse66:
;Stepper.c,365 :: 		if(STPS[axis_No].step_count >= abs(STPS[axis_No].decel_start)) {
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 18
LH	R2, 0(R2)
SH	R2, 8(SP)
ADDIU	R2, R3, 8
SH	R25, 4(SP)
LH	R25, 0(R2)
JAL	_abs+0
NOP	
LH	R25, 4(SP)
LH	R3, 8(SP)
SEH	R3, R3
SEH	R2, R2
SLT	R2, R3, R2
BEQ	R2, R0, L__Pulse139
NOP	
J	L_Pulse67
NOP	
L__Pulse139:
;Stepper.c,366 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 14
ADDIU	R2, R2, 10
LH	R2, 0(R2)
SH	R2, 0(R3)
;Stepper.c,367 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,368 :: 		}
L_Pulse67:
;Stepper.c,370 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay) {
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 12
LH	R2, 0(R2)
SEH	R3, R3
SEH	R2, R2
SLT	R2, R2, R3
BEQ	R2, R0, L__Pulse140
NOP	
J	L_Pulse68
NOP	
L__Pulse140:
;Stepper.c,372 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
ADDIU	R2, R2, 12
LH	R2, 0(R2)
SH	R2, 0(R3)
;Stepper.c,373 :: 		STPS[axis_No].rest       = 0;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 28
SH	R0, 0(R2)
;Stepper.c,374 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,375 :: 		}
L_Pulse68:
;Stepper.c,376 :: 		STPS[axis_No].accel_count++;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 14
LH	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Stepper.c,377 :: 		break;
J	L_Pulse63
NOP	
;Stepper.c,379 :: 		case RUN:
L_Pulse69:
;Stepper.c,380 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
ADDIU	R2, R2, 12
LH	R2, 0(R2)
SH	R2, 0(R3)
;Stepper.c,382 :: 		if(STPS[axis_No].step_count >= abs(STPS[axis_No].decel_start)) {
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 18
LH	R2, 0(R2)
SH	R2, 8(SP)
ADDIU	R2, R3, 8
SH	R25, 4(SP)
LH	R25, 0(R2)
JAL	_abs+0
NOP	
LH	R25, 4(SP)
LH	R3, 8(SP)
SEH	R3, R3
SEH	R2, R2
SLT	R2, R3, R2
BEQ	R2, R0, L__Pulse141
NOP	
J	L_Pulse70
NOP	
L__Pulse141:
;Stepper.c,383 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 14
ADDIU	R2, R2, 10
LH	R2, 0(R2)
SH	R2, 0(R3)
;Stepper.c,384 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 28
SH	R0, 0(R2)
;Stepper.c,386 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,387 :: 		}
L_Pulse70:
;Stepper.c,388 :: 		break;
J	L_Pulse63
NOP	
;Stepper.c,390 :: 		case DECEL:
L_Pulse71:
;Stepper.c,391 :: 		if(STPS[axis_No].new_step_delay <= STPS[axis_No].StartUp_delay){
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 20
LH	R3, 0(R2)
ADDIU	R2, R4, 30
LH	R2, 0(R2)
SEH	R3, R3
SEH	R2, R2
SLT	R2, R2, R3
BEQ	R2, R0, L__Pulse142
NOP	
J	L_Pulse72
NOP	
L__Pulse142:
;Stepper.c,392 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (((STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1));
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 20
ADDIU	R2, R6, 6
LH	R4, 0(R2)
SEH	R2, R4
SLL	R3, R2, 1
ADDIU	R2, R6, 28
LH	R2, 0(R2)
ADDU	R3, R3, R2
ADDIU	R2, R6, 14
LH	R2, 0(R2)
SEH	R2, R2
SLL	R2, R2, 2
ADDIU	R2, R2, 1
SEH	R3, R3
SEH	R2, R2
DIV	R3, R2
MFLO	R2
SUBU	R2, R4, R2
SH	R2, 0(R5)
;Stepper.c,393 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2) + 1);
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 28
ADDIU	R2, R5, 6
LH	R2, 0(R2)
SEH	R2, R2
SLL	R3, R2, 1
LH	R2, 0(R4)
ADDU	R3, R3, R2
ADDIU	R2, R5, 14
LH	R2, 0(R2)
SEH	R2, R2
SLL	R2, R2, 2
ADDIU	R2, R2, 1
DIV	R3, R2
MFHI	R2
SH	R2, 0(R4)
;Stepper.c,394 :: 		}
L_Pulse72:
;Stepper.c,397 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 6
ADDIU	R2, R2, 20
LH	R2, 0(R2)
SH	R2, 0(R3)
;Stepper.c,399 :: 		if(STPS[axis_No].accel_count > 0 ){
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 14
LH	R2, 0(R2)
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__Pulse143
NOP	
J	L_Pulse73
NOP	
L__Pulse143:
;Stepper.c,400 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,401 :: 		}
L_Pulse73:
;Stepper.c,402 :: 		STPS[axis_No].accel_count++;
SEH	R3, R25
ORI	R2, R0, 36
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 14
LH	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;Stepper.c,403 :: 		break;
J	L_Pulse63
NOP	
;Stepper.c,404 :: 		}
L_Pulse62:
LW	R4, 12(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse145
NOP	
J	L_Pulse64
NOP	
L__Pulse145:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse147
NOP	
J	L_Pulse65
NOP	
L__Pulse147:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse149
NOP	
J	L_Pulse69
NOP	
L__Pulse149:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse151
NOP	
J	L_Pulse71
NOP	
L__Pulse151:
L_Pulse63:
;Stepper.c,405 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,406 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Pulse
Stepper_sqrt_:
;Stepper.c,417 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,423 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,424 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,425 :: 		do
J	L_Stepper_sqrt_74
NOP	
L_Stepper_sqrt_84:
;Stepper.c,439 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,425 :: 		do
L_Stepper_sqrt_74:
;Stepper.c,427 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_153
NOP	
J	L_Stepper_sqrt_77
NOP	
L_Stepper_sqrt_153:
;Stepper.c,429 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,430 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,431 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_78
NOP	
L_Stepper_sqrt_77:
;Stepper.c,433 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,434 :: 		}
L_Stepper_sqrt_78:
;Stepper.c,435 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,436 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_155
NOP	
J	L_Stepper_sqrt_85
NOP	
L_Stepper_sqrt_155:
; f end address is: 16 (R4)
;Stepper.c,437 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,438 :: 		}
J	L_Stepper_sqrt_79
NOP	
L_Stepper_sqrt_85:
;Stepper.c,436 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,438 :: 		}
L_Stepper_sqrt_79:
;Stepper.c,439 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_156
NOP	
J	L_Stepper_sqrt_84
NOP	
L_Stepper_sqrt_156:
; q2 end address is: 12 (R3)
;Stepper.c,440 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_157
NOP	
J	L_Stepper_sqrt_80
NOP	
L_Stepper_sqrt_157:
;Stepper.c,441 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,442 :: 		}
L_Stepper_sqrt_80:
;Stepper.c,444 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,446 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_min_:
;Stepper.c,453 :: 		unsigned int min_(unsigned int x, unsigned int y)
;Stepper.c,455 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_159
NOP	
J	L_min_82
NOP	
L__min_159:
;Stepper.c,456 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,457 :: 		}
L_min_82:
;Stepper.c,459 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,461 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
