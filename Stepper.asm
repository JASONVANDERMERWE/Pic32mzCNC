_SetPinMode:
;Stepper.c,23 :: 		void SetPinMode(){
;Stepper.c,26 :: 		EN_Step_PinDirX  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirX+0), 1
_SX	
;Stepper.c,27 :: 		DIR_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirX+0), 1
_SX	
;Stepper.c,34 :: 		EN_Step_PinDirY  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirY+0), 1
_SX	
;Stepper.c,35 :: 		DIR_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirY+0), 1
_SX	
;Stepper.c,42 :: 		EN_Step_PinDirZ  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirZ+0), 1
_SX	
;Stepper.c,43 :: 		DIR_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirZ+0), 1
_SX	
;Stepper.c,50 :: 		EN_Step_PinDirA  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirA+0), 1
_SX	
;Stepper.c,51 :: 		DIR_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirA+0), 1
_SX	
;Stepper.c,56 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_StepperConstants:
;Stepper.c,60 :: 		void StepperConstants(long accel,long decel){
;Stepper.c,61 :: 		SV.acc = accel;
SW	R25, Offset(_SV+56)(GP)
;Stepper.c,62 :: 		SV.dec = decel;
SW	R26, Offset(_SV+60)(GP)
;Stepper.c,63 :: 		}
L_end_StepperConstants:
JR	RA
NOP	
; end of _StepperConstants
_EnStepperX:
;Stepper.c,67 :: 		void EnStepperX(){
;Stepper.c,70 :: 		EN_StepX       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
;Stepper.c,71 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,73 :: 		void EnStepperY(){
;Stepper.c,76 :: 		EN_StepY       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
;Stepper.c,77 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,78 :: 		void EnStepperZ(){
;Stepper.c,81 :: 		EN_StepZ       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
;Stepper.c,82 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_EnStepperA:
;Stepper.c,83 :: 		void EnStepperA(){
;Stepper.c,86 :: 		EN_StepA       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
;Stepper.c,87 :: 		}
L_end_EnStepperA:
JR	RA
NOP	
; end of _EnStepperA
_DisableStepper:
;Stepper.c,89 :: 		void DisableStepper(){
;Stepper.c,90 :: 		EN_StepX      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepX+0)
_SX	
;Stepper.c,91 :: 		EN_StepY      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepY+0)
_SX	
;Stepper.c,92 :: 		EN_StepZ      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepZ+0)
_SX	
;Stepper.c,93 :: 		EN_StepA      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepA+0)
_SX	
;Stepper.c,94 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_speed_cntr_Move:
;Stepper.c,112 :: 		void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,115 :: 		if(mmSteps == 1){
SW	R25, 4(SP)
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move107
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move107:
;Stepper.c,117 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
;Stepper.c,118 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,119 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 20000
SW	R2, 0(R3)
;Stepper.c,120 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,122 :: 		}
J	L_speed_cntr_Move1
NOP	
L_speed_cntr_Move0:
;Stepper.c,124 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
BNE	R25, R0, L__speed_cntr_Move109
NOP	
J	L__speed_cntr_Move98
NOP	
L__speed_cntr_Move109:
JAL	_abs+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__speed_cntr_Move111
NOP	
J	L__speed_cntr_Move97
NOP	
L__speed_cntr_Move111:
L__speed_cntr_Move96:
;Stepper.c,128 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 20
LUI	R2, 2
ORI	R2, R2, 22325
DIV	R2, R26
MFLO	R2
SW	R2, 0(R3)
;Stepper.c,133 :: 		STPS[axis_No].step_delay = abs((T1_FREQ_148 * sqrt_(A_SQ / SV.acc))/100);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
SW	R2, 12(SP)
LW	R3, Offset(_SV+56)(GP)
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
SEH	R3, R2
LW	R2, 12(SP)
SW	R3, 0(R2)
;Stepper.c,134 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 60
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,139 :: 		STPS[axis_No].max_step_lim = (speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 52
MUL	R3, R26, R26
LWC1	S0, Offset(_SV+56)(GP)
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
SW	R2, 0(R4)
;Stepper.c,144 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move112
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move112:
;Stepper.c,145 :: 		STPS[axis_No].max_step_lim = 1;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 52
ORI	R2, R0, 1
SW	R2, 0(R3)
;Stepper.c,146 :: 		}
L_speed_cntr_Move5:
;Stepper.c,150 :: 		STPS[axis_No].accel_lim = (abs(mmSteps) * SV.dec) / (SV.acc + SV.dec);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
SW	R2, 12(SP)
JAL	_abs+0
NOP	
LW	R3, Offset(_SV+60)(GP)
SEH	R2, R2
MUL	R4, R2, R3
LW	R3, Offset(_SV+60)(GP)
LW	R2, Offset(_SV+56)(GP)
ADDU	R2, R2, R3
DIV	R4, R2
MFLO	R3
LW	R2, 12(SP)
SW	R3, 0(R2)
;Stepper.c,153 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move113
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move113:
;Stepper.c,154 :: 		STPS[axis_No].accel_lim = 1;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 48
ORI	R2, R0, 1
SW	R2, 0(R3)
;Stepper.c,155 :: 		}
L_speed_cntr_Move6:
;Stepper.c,158 :: 		if(STPS[axis_No].accel_lim <= STPS[axis_No].max_step_lim){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 48
LW	R3, 0(R2)
ADDIU	R2, R4, 52
LW	R2, 0(R2)
SLT	R2, R2, R3
BEQ	R2, R0, L__speed_cntr_Move114
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move114:
;Stepper.c,159 :: 		if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move115
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move115:
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
ADDIU	R2, R2, 48
LW	R2, 0(R2)
SUBU	R2, R2, R25
SW	R2, 0(R3)
J	L_speed_cntr_Move9
NOP	
L_speed_cntr_Move8:
;Stepper.c,160 :: 		else STPS[axis_No].decel_val = mmSteps + STPS[axis_No].accel_lim;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
ADDIU	R2, R2, 48
LW	R2, 0(R2)
ADDU	R2, R25, R2
SW	R2, 0(R3)
L_speed_cntr_Move9:
;Stepper.c,161 :: 		}else{
J	L_speed_cntr_Move10
NOP	
L_speed_cntr_Move7:
;Stepper.c,162 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * SV.acc) / SV.dec);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 16
ADDIU	R2, R2, 52
LW	R3, 0(R2)
LW	R2, Offset(_SV+56)(GP)
MUL	R3, R3, R2
LW	R2, Offset(_SV+60)(GP)
DIV	R3, R2
MFLO	R3
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R4)
;Stepper.c,163 :: 		}
L_speed_cntr_Move10:
;Stepper.c,165 :: 		if(mmSteps >= 0){
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move116
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move116:
;Stepper.c,166 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SLT	R2, R2, R25
BNE	R2, R0, L__speed_cntr_Move117
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move117:
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
ADDIU	R2, R2, 16
LW	R2, 0(R2)
ADDU	R2, R25, R2
SW	R2, 0(R3)
J	L_speed_cntr_Move13
NOP	
L_speed_cntr_Move12:
;Stepper.c,167 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
ADDIU	R2, R2, 48
LW	R2, 0(R2)
SW	R2, 0(R3)
L_speed_cntr_Move13:
;Stepper.c,168 :: 		}
J	L_speed_cntr_Move14
NOP	
L_speed_cntr_Move11:
;Stepper.c,170 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = abs(mmSteps) * STPS[axis_No].decel_val;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SLT	R2, R2, R25
BNE	R2, R0, L__speed_cntr_Move118
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move118:
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
SW	R2, 12(SP)
JAL	_abs+0
NOP	
SEH	R4, R27
ORI	R3, R0, 68
MULTU	R3, R4
MFLO	R4
LUI	R3, hi_addr(_STPS+0)
ORI	R3, R3, lo_addr(_STPS+0)
ADDU	R3, R3, R4
ADDIU	R3, R3, 16
LW	R3, 0(R3)
SEH	R2, R2
MUL	R3, R2, R3
LW	R2, 12(SP)
SW	R3, 0(R2)
J	L_speed_cntr_Move16
NOP	
L_speed_cntr_Move15:
;Stepper.c,171 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
ADDIU	R2, R2, 48
LW	R2, 0(R2)
SW	R2, 0(R3)
L_speed_cntr_Move16:
;Stepper.c,172 :: 		}
L_speed_cntr_Move14:
;Stepper.c,174 :: 		if(STPS[axis_No].decel_val == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move119
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move119:
;Stepper.c,175 :: 		STPS[axis_No].decel_val = -1;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
;Stepper.c,176 :: 		}
L_speed_cntr_Move17:
;Stepper.c,179 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 60
LW	R3, 0(R2)
ADDIU	R2, R4, 20
LW	R2, 0(R2)
SLT	R2, R2, R3
BEQ	R2, R0, L__speed_cntr_Move120
NOP	
J	L_speed_cntr_Move18
NOP	
L__speed_cntr_Move120:
;Stepper.c,180 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,181 :: 		STPS[axis_No].run_state = RUN;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,182 :: 		}else{
J	L_speed_cntr_Move19
NOP	
L_speed_cntr_Move18:
;Stepper.c,183 :: 		STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 8
SW	R2, 12(SP)
ADDIU	R2, R3, 60
LW	R25, 0(R2)
JAL	_abs+0
NOP	
SEH	R3, R2
LW	R2, 12(SP)
SW	R3, 0(R2)
;Stepper.c,184 :: 		STPS[axis_No].run_state = ACCEL;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 1
SB	R2, 0(R3)
;Stepper.c,185 :: 		}
L_speed_cntr_Move19:
;Stepper.c,124 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
L__speed_cntr_Move98:
L__speed_cntr_Move97:
;Stepper.c,187 :: 		}
L_speed_cntr_Move1:
;Stepper.c,188 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,189 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,190 :: 		STPS[axis_No].microSec    = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,191 :: 		STPS[axis_No].accel_count = 1;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ORI	R2, R0, 1
SW	R2, 0(R3)
;Stepper.c,192 :: 		STPS[axis_No].dist        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R0, 0(R2)
;Stepper.c,193 :: 		SV.Tog   = 0;
SH	R0, Offset(_SV+2)(GP)
;Stepper.c,194 :: 		SV.running = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,195 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_Step_Cycle:
;Stepper.c,204 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,205 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,206 :: 		Pulse(axis_No);
JAL	_Pulse+0
NOP	
;Stepper.c,207 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_toggleOCx:
;Stepper.c,211 :: 		void toggleOCx(int axis_No){
;Stepper.c,212 :: 		switch(axis_No){
J	L_toggleOCx20
NOP	
;Stepper.c,213 :: 		case X: OC5R   = 0x5;
L_toggleOCx22:
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,214 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,215 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,216 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,217 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,218 :: 		case Y: OC2R   = 0x5;
L_toggleOCx23:
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Stepper.c,219 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+76)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC2RS+0)(GP)
;Stepper.c,220 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,221 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC2CON+0)(GP)
;Stepper.c,222 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,223 :: 		case Z: OC7R   = 0x5;
L_toggleOCx24:
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Stepper.c,224 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+144)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC7RS+0)(GP)
;Stepper.c,225 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,226 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC7CON+0)(GP)
;Stepper.c,227 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,228 :: 		case A: OC3R   = 0x5;
L_toggleOCx25:
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,229 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+212)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,230 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR5+0)(GP)
;Stepper.c,231 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,232 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,233 :: 		case B: OC6R   = 0x5;
L_toggleOCx26:
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,234 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+280)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,235 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR3+0)(GP)
;Stepper.c,236 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,237 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,238 :: 		case C: OC8R   = 0x5;
L_toggleOCx27:
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,239 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+348)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,240 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR7+0)(GP)
;Stepper.c,241 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,242 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,243 :: 		default:
L_toggleOCx28:
;Stepper.c,244 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,245 :: 		}
L_toggleOCx20:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx124
NOP	
J	L_toggleOCx22
NOP	
L__toggleOCx124:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx126
NOP	
J	L_toggleOCx23
NOP	
L__toggleOCx126:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx128
NOP	
J	L_toggleOCx24
NOP	
L__toggleOCx128:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__toggleOCx130
NOP	
J	L_toggleOCx25
NOP	
L__toggleOCx130:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__toggleOCx132
NOP	
J	L_toggleOCx26
NOP	
L__toggleOCx132:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__toggleOCx134
NOP	
J	L_toggleOCx27
NOP	
L__toggleOCx134:
J	L_toggleOCx28
NOP	
L_toggleOCx21:
;Stepper.c,247 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,251 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,257 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse29
NOP	
;Stepper.c,258 :: 		case STOP:
L_Pulse31:
;Stepper.c,259 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,260 :: 		break;
J	L_Pulse30
NOP	
;Stepper.c,262 :: 		case ACCEL:
L_Pulse32:
;Stepper.c,267 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,268 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 8
LW	R3, 0(R2)
ADDIU	R2, R4, 20
LW	R2, 0(R2)
SLT	R2, R2, R3
BEQ	R2, R0, L__Pulse136
NOP	
J	L_Pulse33
NOP	
L__Pulse136:
;Stepper.c,270 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,271 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,272 :: 		}
L_Pulse33:
;Stepper.c,273 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 8
LW	R3, 0(R2)
ADDIU	R2, R4, 48
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L__Pulse137
NOP	
J	L_Pulse34
NOP	
L__Pulse137:
;Stepper.c,274 :: 		STPS[axis_No].run_state  = RUN;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,275 :: 		}
L_Pulse34:
;Stepper.c,276 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 32
LW	R3, 0(R2)
ADDIU	R2, R4, 12
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L__Pulse138
NOP	
J	L_Pulse35
NOP	
L__Pulse138:
;Stepper.c,277 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,278 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,279 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,280 :: 		}
L_Pulse35:
;Stepper.c,281 :: 		break;
J	L_Pulse30
NOP	
;Stepper.c,283 :: 		case RUN:
L_Pulse36:
;Stepper.c,284 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,286 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 32
LW	R3, 0(R2)
ADDIU	R2, R4, 12
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L__Pulse139
NOP	
J	L_Pulse37
NOP	
L__Pulse139:
;Stepper.c,287 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,288 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,290 :: 		STPS[axis_No].run_state   =  DECEL;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,291 :: 		}
L_Pulse37:
;Stepper.c,292 :: 		break;
J	L_Pulse30
NOP	
;Stepper.c,294 :: 		case DECEL:
L_Pulse38:
;Stepper.c,299 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,303 :: 		if(STPS[axis_No].accel_count >= 0 ){
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Pulse140
NOP	
J	L_Pulse39
NOP	
L__Pulse140:
;Stepper.c,304 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,305 :: 		}
L_Pulse39:
;Stepper.c,306 :: 		break;
J	L_Pulse30
NOP	
;Stepper.c,307 :: 		default:break;
L_Pulse40:
J	L_Pulse30
NOP	
;Stepper.c,308 :: 		}
L_Pulse29:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse142
NOP	
J	L_Pulse31
NOP	
L__Pulse142:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse144
NOP	
J	L_Pulse32
NOP	
L__Pulse144:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse146
NOP	
J	L_Pulse36
NOP	
L__Pulse146:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse148
NOP	
J	L_Pulse38
NOP	
L__Pulse148:
J	L_Pulse40
NOP	
L_Pulse30:
;Stepper.c,309 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,310 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,314 :: 		void AccDec(int axis_No){
;Stepper.c,315 :: 		STPS[axis_No].accel_count++;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,316 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 40
ADDIU	R2, R6, 8
LW	R4, 0(R2)
SLL	R3, R4, 1
ADDIU	R2, R6, 56
LW	R2, 0(R2)
ADDU	R3, R3, R2
ADDIU	R2, R6, 24
LW	R2, 0(R2)
SLL	R2, R2, 2
ADDIU	R2, R2, 1
DIV	R3, R2
MFLO	R2
SUBU	R2, R4, R2
SW	R2, 0(R5)
;Stepper.c,317 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 56
ADDIU	R2, R5, 8
LW	R2, 0(R2)
SLL	R3, R2, 1
LW	R2, 0(R4)
ADDU	R3, R3, R2
ADDIU	R2, R5, 24
LW	R2, 0(R2)
SLL	R2, R2, 2
ADDIU	R2, R2, 1
DIV	R3, R2
MFHI	R2
SW	R2, 0(R4)
;Stepper.c,318 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 40
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,320 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_Single_Axis_Enable:
;Stepper.c,325 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,326 :: 		switch(axis_){
J	L_Single_Axis_Enable41
NOP	
;Stepper.c,327 :: 		case X:
L_Single_Axis_Enable43:
;Stepper.c,328 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,329 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,330 :: 		case Y:
L_Single_Axis_Enable44:
;Stepper.c,331 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+8)(GP)
;Stepper.c,332 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,333 :: 		case Z:
L_Single_Axis_Enable45:
;Stepper.c,334 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+8)(GP)
;Stepper.c,335 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,336 :: 		case A:
L_Single_Axis_Enable46:
;Stepper.c,337 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,338 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,339 :: 		case B:
L_Single_Axis_Enable47:
;Stepper.c,340 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC6CONbits+8)(GP)
;Stepper.c,341 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,342 :: 		case C:
L_Single_Axis_Enable48:
;Stepper.c,343 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,344 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,345 :: 		default:
L_Single_Axis_Enable49:
;Stepper.c,346 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,347 :: 		}
L_Single_Axis_Enable41:
ANDI	R2, R25, 255
BNE	R2, R0, L__Single_Axis_Enable152
NOP	
J	L_Single_Axis_Enable43
NOP	
L__Single_Axis_Enable152:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable154
NOP	
J	L_Single_Axis_Enable44
NOP	
L__Single_Axis_Enable154:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable156
NOP	
J	L_Single_Axis_Enable45
NOP	
L__Single_Axis_Enable156:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable158
NOP	
J	L_Single_Axis_Enable46
NOP	
L__Single_Axis_Enable158:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable160
NOP	
J	L_Single_Axis_Enable47
NOP	
L__Single_Axis_Enable160:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable162
NOP	
J	L_Single_Axis_Enable48
NOP	
L__Single_Axis_Enable162:
J	L_Single_Axis_Enable49
NOP	
L_Single_Axis_Enable42:
;Stepper.c,348 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_Multi_Axis_Enable:
;Stepper.c,353 :: 		void Multi_Axis_Enable(axis_combination axis){
;Stepper.c,354 :: 		switch(axis){
J	L_Multi_Axis_Enable50
NOP	
;Stepper.c,355 :: 		case xy:
L_Multi_Axis_Enable52:
;Stepper.c,356 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,357 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,358 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,359 :: 		case xz:
L_Multi_Axis_Enable53:
;Stepper.c,360 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,361 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,362 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,363 :: 		case yz:
L_Multi_Axis_Enable54:
;Stepper.c,364 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,365 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,366 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,367 :: 		case xa:
L_Multi_Axis_Enable55:
;Stepper.c,368 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,369 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,370 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,371 :: 		case ya:
L_Multi_Axis_Enable56:
;Stepper.c,372 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,373 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,374 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,375 :: 		case za:
L_Multi_Axis_Enable57:
;Stepper.c,376 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,377 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,378 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,379 :: 		default:
L_Multi_Axis_Enable58:
;Stepper.c,380 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,381 :: 		}
L_Multi_Axis_Enable50:
ANDI	R2, R25, 255
BNE	R2, R0, L__Multi_Axis_Enable165
NOP	
J	L_Multi_Axis_Enable52
NOP	
L__Multi_Axis_Enable165:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Multi_Axis_Enable167
NOP	
J	L_Multi_Axis_Enable53
NOP	
L__Multi_Axis_Enable167:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Multi_Axis_Enable169
NOP	
J	L_Multi_Axis_Enable54
NOP	
L__Multi_Axis_Enable169:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Multi_Axis_Enable171
NOP	
J	L_Multi_Axis_Enable55
NOP	
L__Multi_Axis_Enable171:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Multi_Axis_Enable173
NOP	
J	L_Multi_Axis_Enable56
NOP	
L__Multi_Axis_Enable173:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Multi_Axis_Enable175
NOP	
J	L_Multi_Axis_Enable57
NOP	
L__Multi_Axis_Enable175:
J	L_Multi_Axis_Enable58
NOP	
L_Multi_Axis_Enable51:
;Stepper.c,382 :: 		}
L_end_Multi_Axis_Enable:
JR	RA
NOP	
; end of _Multi_Axis_Enable
_disableOCx:
;Stepper.c,384 :: 		void disableOCx(){
;Stepper.c,385 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,386 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+4)(GP)
;Stepper.c,387 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+4)(GP)
;Stepper.c,389 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,390 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
SW	R3, Offset(OC6CONbits+4)(GP)
;Stepper.c,391 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,392 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_StepX:
;Stepper.c,397 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {
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
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,398 :: 		STPS[X].step_count++;
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,399 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,400 :: 		if(SV.Single_Dual == 0)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepX178
NOP	
J	L_StepX59
NOP	
L__StepX178:
;Stepper.c,401 :: 		SingleStepX();
JAL	_SingleStepX+0
NOP	
J	L_StepX60
NOP	
L_StepX59:
;Stepper.c,403 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepX60:
;Stepper.c,404 :: 		}
L_end_StepX:
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
; end of _StepX
_SingleStepX:
;Stepper.c,406 :: 		void SingleStepX(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,407 :: 		if(STPS[X].step_count >= STPS[X].dist){  //i think this is where the problem lies
SW	R25, 4(SP)
LW	R3, Offset(_STPS+36)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepX180
NOP	
J	L_SingleStepX61
NOP	
L__SingleStepX180:
;Stepper.c,408 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,409 :: 		}
J	L_SingleStepX62
NOP	
L_SingleStepX61:
;Stepper.c,411 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,412 :: 		}
L_SingleStepX62:
;Stepper.c,413 :: 		}
L_end_SingleStepX:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepX
_StopX:
;Stepper.c,416 :: 		void StopX(){
;Stepper.c,417 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,418 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,419 :: 		}
L_end_StopX:
JR	RA
NOP	
; end of _StopX
_StepY:
;Stepper.c,425 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_AUTO {
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
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,426 :: 		STPS[Y].step_count++;
LW	R2, Offset(_STPS+100)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+100)(GP)
;Stepper.c,427 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,428 :: 		if(SV.Single_Dual == 0)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepY183
NOP	
J	L_StepY63
NOP	
L__StepY183:
;Stepper.c,429 :: 		SingleStepY();
JAL	_SingleStepY+0
NOP	
J	L_StepY64
NOP	
L_StepY63:
;Stepper.c,431 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepY64:
;Stepper.c,432 :: 		}
L_end_StepY:
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
; end of _StepY
_SingleStepY:
;Stepper.c,434 :: 		void SingleStepY(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,435 :: 		if(STPS[Y].step_count >= STPS[Y].dist){  //i think this is where the problem lies
SW	R25, 4(SP)
LW	R3, Offset(_STPS+104)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepY185
NOP	
J	L_SingleStepY65
NOP	
L__SingleStepY185:
;Stepper.c,436 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,437 :: 		}
J	L_SingleStepY66
NOP	
L_SingleStepY65:
;Stepper.c,439 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,440 :: 		}
L_SingleStepY66:
;Stepper.c,441 :: 		}
L_end_SingleStepY:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepY
_StopY:
;Stepper.c,443 :: 		void StopY(){
;Stepper.c,444 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,445 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,446 :: 		}
L_end_StopY:
JR	RA
NOP	
; end of _StopY
_StepZ:
;Stepper.c,452 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_AUTO {
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
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,453 :: 		STPS[Z].step_count++;
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+168)(GP)
;Stepper.c,454 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,455 :: 		if(!SV.Single_Dual)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepZ188
NOP	
J	L_StepZ67
NOP	
L__StepZ188:
;Stepper.c,456 :: 		SingleStepZ();
JAL	_SingleStepZ+0
NOP	
J	L_StepZ68
NOP	
L_StepZ67:
;Stepper.c,458 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepZ68:
;Stepper.c,460 :: 		}
L_end_StepZ:
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
; end of _StepZ
_SingleStepZ:
;Stepper.c,462 :: 		void SingleStepZ(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,463 :: 		if(STPS[Z].step_count >= STPS[Z].dist){
SW	R25, 4(SP)
LW	R3, Offset(_STPS+172)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepZ190
NOP	
J	L_SingleStepZ69
NOP	
L__SingleStepZ190:
;Stepper.c,464 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,465 :: 		}
J	L_SingleStepZ70
NOP	
L_SingleStepZ69:
;Stepper.c,467 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,468 :: 		}
L_SingleStepZ70:
;Stepper.c,469 :: 		}
L_end_SingleStepZ:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepZ
_StopZ:
;Stepper.c,471 :: 		void StopZ(){
;Stepper.c,472 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,473 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,474 :: 		}
L_end_StopZ:
JR	RA
NOP	
; end of _StopZ
_StepA:
;Stepper.c,479 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {
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
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,480 :: 		STPS[A].step_count++;
LW	R2, Offset(_STPS+236)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+236)(GP)
;Stepper.c,481 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,482 :: 		if(!SV.Single_Dual)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepA193
NOP	
J	L_StepA71
NOP	
L__StepA193:
;Stepper.c,483 :: 		SingleStepA();
JAL	_SingleStepA+0
NOP	
J	L_StepA72
NOP	
L_StepA71:
;Stepper.c,485 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepA72:
;Stepper.c,487 :: 		}
L_end_StepA:
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
; end of _StepA
_SingleStepA:
;Stepper.c,489 :: 		void SingleStepA(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,490 :: 		if(STPS[A].step_count >= STPS[A].dist){
SW	R25, 4(SP)
LW	R3, Offset(_STPS+240)(GP)
LW	R2, Offset(_STPS+236)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepA195
NOP	
J	L_SingleStepA73
NOP	
L__SingleStepA195:
;Stepper.c,491 :: 		StopA();
JAL	_StopA+0
NOP	
;Stepper.c,492 :: 		}
J	L_SingleStepA74
NOP	
L_SingleStepA73:
;Stepper.c,494 :: 		Step_Cycle(A);
ORI	R25, R0, 3
JAL	_Step_Cycle+0
NOP	
;Stepper.c,495 :: 		}
L_SingleStepA74:
;Stepper.c,496 :: 		}
L_end_SingleStepA:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepA
_StopA:
;Stepper.c,498 :: 		void StopA(){
;Stepper.c,499 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,500 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,501 :: 		}
L_end_StopA:
JR	RA
NOP	
; end of _StopA
_min_:
;Stepper.c,512 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,513 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_198
NOP	
J	L_min_75
NOP	
L__min_198:
;Stepper.c,514 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,515 :: 		}
L_min_75:
;Stepper.c,517 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,519 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
Stepper_sqrt_:
;Stepper.c,529 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,535 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,536 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,537 :: 		do
J	L_Stepper_sqrt_77
NOP	
L_Stepper_sqrt_94:
;Stepper.c,551 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,537 :: 		do
L_Stepper_sqrt_77:
;Stepper.c,539 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_200
NOP	
J	L_Stepper_sqrt_80
NOP	
L_Stepper_sqrt_200:
;Stepper.c,541 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,542 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,543 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_81
NOP	
L_Stepper_sqrt_80:
;Stepper.c,545 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,546 :: 		}
L_Stepper_sqrt_81:
;Stepper.c,547 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,548 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_202
NOP	
J	L_Stepper_sqrt_95
NOP	
L_Stepper_sqrt_202:
; f end address is: 16 (R4)
;Stepper.c,549 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,550 :: 		}
J	L_Stepper_sqrt_82
NOP	
L_Stepper_sqrt_95:
;Stepper.c,548 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,550 :: 		}
L_Stepper_sqrt_82:
;Stepper.c,551 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_203
NOP	
J	L_Stepper_sqrt_94
NOP	
L_Stepper_sqrt_203:
; q2 end address is: 12 (R3)
;Stepper.c,552 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_204
NOP	
J	L_Stepper_sqrt_83
NOP	
L_Stepper_sqrt_204:
;Stepper.c,553 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,554 :: 		}
L_Stepper_sqrt_83:
;Stepper.c,556 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,558 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_CycleStop:
;Stepper.c,583 :: 		void CycleStop(){
;Stepper.c,585 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,586 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop85:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStop206
NOP	
J	L_CycleStop86
NOP	
L__CycleStop206:
;Stepper.c,587 :: 		STPS[ii].microSec = 0;
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,588 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStop207
NOP	
J	L_CycleStop88
NOP	
L__CycleStop207:
; ii end address is: 16 (R4)
J	L_CycleStop86
NOP	
L_CycleStop88:
;Stepper.c,586 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,589 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop85
NOP	
L_CycleStop86:
;Stepper.c,590 :: 		}
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
;Stepper.c,592 :: 		void CycleStart(){
;Stepper.c,595 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__CycleStart209
NOP	
J	L_CycleStart89
NOP	
L__CycleStart209:
;Stepper.c,596 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart90:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStart210
NOP	
J	L_CycleStart91
NOP	
L__CycleStart210:
;Stepper.c,597 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStart211
NOP	
J	L_CycleStart93
NOP	
L__CycleStart211:
; ii end address is: 16 (R4)
J	L_CycleStart91
NOP	
L_CycleStart93:
;Stepper.c,598 :: 		STPS[ii].microSec++;
; ii start address is: 16 (R4)
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,596 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,599 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart90
NOP	
L_CycleStart91:
;Stepper.c,600 :: 		}
L_CycleStart89:
;Stepper.c,601 :: 		}
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
