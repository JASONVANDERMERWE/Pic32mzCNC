_SetPinMode:
;Stepper.c,24 :: 		void SetPinMode(){
;Stepper.c,27 :: 		EN_Step_PinDirX  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirX+0), 1
_SX	
;Stepper.c,28 :: 		DIR_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirX+0), 1
_SX	
;Stepper.c,35 :: 		EN_Step_PinDirY  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirY+0), 1
_SX	
;Stepper.c,36 :: 		DIR_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirY+0), 1
_SX	
;Stepper.c,43 :: 		EN_Step_PinDirZ  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirZ+0), 1
_SX	
;Stepper.c,44 :: 		DIR_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirZ+0), 1
_SX	
;Stepper.c,51 :: 		EN_Step_PinDirA  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirA+0), 1
_SX	
;Stepper.c,52 :: 		DIR_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirA+0), 1
_SX	
;Stepper.c,57 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_StepperConstants:
;Stepper.c,61 :: 		void StepperConstants(long accel,long decel){
;Stepper.c,62 :: 		SV.acc = accel;
SW	R25, Offset(_SV+56)(GP)
;Stepper.c,63 :: 		SV.dec = decel;
SW	R26, Offset(_SV+60)(GP)
;Stepper.c,64 :: 		}
L_end_StepperConstants:
JR	RA
NOP	
; end of _StepperConstants
_EnStepperX:
;Stepper.c,68 :: 		void EnStepperX(){
;Stepper.c,71 :: 		EN_StepX       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
;Stepper.c,72 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,74 :: 		void EnStepperY(){
;Stepper.c,77 :: 		EN_StepY       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
;Stepper.c,78 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,79 :: 		void EnStepperZ(){
;Stepper.c,82 :: 		EN_StepZ       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
;Stepper.c,83 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_EnStepperA:
;Stepper.c,84 :: 		void EnStepperA(){
;Stepper.c,87 :: 		EN_StepA       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
;Stepper.c,88 :: 		}
L_end_EnStepperA:
JR	RA
NOP	
; end of _EnStepperA
_DisableStepper:
;Stepper.c,90 :: 		void DisableStepper(){
;Stepper.c,91 :: 		EN_StepX      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepX+0)
_SX	
;Stepper.c,92 :: 		EN_StepY      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepY+0)
_SX	
;Stepper.c,93 :: 		EN_StepZ      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepZ+0)
_SX	
;Stepper.c,94 :: 		EN_StepA      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepA+0)
_SX	
;Stepper.c,95 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_speed_cntr_Move:
;Stepper.c,113 :: 		void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,116 :: 		if(mmSteps == 1){
SW	R25, 4(SP)
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move125
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move125:
;Stepper.c,118 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
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
;Stepper.c,119 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
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
;Stepper.c,120 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
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
;Stepper.c,121 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+1)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+1)(GP)
;Stepper.c,123 :: 		}
J	L_speed_cntr_Move1
NOP	
L_speed_cntr_Move0:
;Stepper.c,125 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
BNE	R25, R0, L__speed_cntr_Move127
NOP	
J	L__speed_cntr_Move116
NOP	
L__speed_cntr_Move127:
JAL	_abs+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__speed_cntr_Move129
NOP	
J	L__speed_cntr_Move115
NOP	
L__speed_cntr_Move129:
L__speed_cntr_Move114:
;Stepper.c,129 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
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
;Stepper.c,134 :: 		STPS[axis_No].step_delay = abs((T1_FREQ_148 * sqrt_(A_SQ / SV.acc))/100);
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
;Stepper.c,135 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
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
;Stepper.c,140 :: 		STPS[axis_No].max_step_lim = (speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
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
;Stepper.c,145 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move130
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move130:
;Stepper.c,146 :: 		STPS[axis_No].max_step_lim = 1;
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
;Stepper.c,147 :: 		}
L_speed_cntr_Move5:
;Stepper.c,151 :: 		STPS[axis_No].accel_lim = (abs(mmSteps) * SV.dec) / (SV.acc + SV.dec);
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
;Stepper.c,154 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move131
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move131:
;Stepper.c,155 :: 		STPS[axis_No].accel_lim = 1;
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
;Stepper.c,156 :: 		}
L_speed_cntr_Move6:
;Stepper.c,159 :: 		if(STPS[axis_No].accel_lim <= STPS[axis_No].max_step_lim){
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
BEQ	R2, R0, L__speed_cntr_Move132
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move132:
;Stepper.c,160 :: 		if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move133
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move133:
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
;Stepper.c,161 :: 		else STPS[axis_No].decel_val = mmSteps + STPS[axis_No].accel_lim;
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
;Stepper.c,162 :: 		}else{
J	L_speed_cntr_Move10
NOP	
L_speed_cntr_Move7:
;Stepper.c,163 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * SV.acc) / SV.dec);
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
;Stepper.c,164 :: 		}
L_speed_cntr_Move10:
;Stepper.c,166 :: 		if(mmSteps >= 0){
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move134
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move134:
;Stepper.c,167 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
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
BNE	R2, R0, L__speed_cntr_Move135
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move135:
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
;Stepper.c,168 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
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
;Stepper.c,169 :: 		}
J	L_speed_cntr_Move14
NOP	
L_speed_cntr_Move11:
;Stepper.c,171 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = abs(mmSteps) * STPS[axis_No].decel_val;
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
BNE	R2, R0, L__speed_cntr_Move136
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move136:
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
;Stepper.c,172 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
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
;Stepper.c,173 :: 		}
L_speed_cntr_Move14:
;Stepper.c,175 :: 		if(STPS[axis_No].decel_val == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move137
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move137:
;Stepper.c,176 :: 		STPS[axis_No].decel_val = -1;
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
;Stepper.c,177 :: 		}
L_speed_cntr_Move17:
;Stepper.c,180 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__speed_cntr_Move138
NOP	
J	L_speed_cntr_Move18
NOP	
L__speed_cntr_Move138:
;Stepper.c,181 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,182 :: 		STPS[axis_No].run_state = RUN;
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
;Stepper.c,183 :: 		}else{
J	L_speed_cntr_Move19
NOP	
L_speed_cntr_Move18:
;Stepper.c,184 :: 		STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
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
;Stepper.c,185 :: 		STPS[axis_No].run_state = ACCEL;
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
;Stepper.c,186 :: 		}
L_speed_cntr_Move19:
;Stepper.c,125 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
L__speed_cntr_Move116:
L__speed_cntr_Move115:
;Stepper.c,188 :: 		}
L_speed_cntr_Move1:
;Stepper.c,189 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,190 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,191 :: 		STPS[axis_No].microSec    = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,192 :: 		STPS[axis_No].accel_count = 1;
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
;Stepper.c,193 :: 		STPS[axis_No].dist        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R0, 0(R2)
;Stepper.c,194 :: 		SV.Tog   = 0;
SH	R0, Offset(_SV+2)(GP)
;Stepper.c,195 :: 		SV.running = 1;
LBU	R2, Offset(_SV+1)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+1)(GP)
;Stepper.c,196 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_Step_Cycle:
;Stepper.c,205 :: 		void Step_Cycle(int axis_No,int InterPol){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,206 :: 		toggleOCx(axis_No,InterPol);
JAL	_toggleOCx+0
NOP	
;Stepper.c,207 :: 		Pulse(axis_No);
JAL	_Pulse+0
NOP	
;Stepper.c,208 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_toggleOCx:
;Stepper.c,212 :: 		void toggleOCx(int axis_No,int InterPol){
;Stepper.c,213 :: 		switch(axis_No){
J	L_toggleOCx20
NOP	
;Stepper.c,214 :: 		case X: OC5R   = 0x5;
L_toggleOCx22:
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,215 :: 		if(InterPol == Lin)
SEH	R2, R26
BEQ	R2, R0, L__toggleOCx141
NOP	
J	L_toggleOCx23
NOP	
L__toggleOCx141:
;Stepper.c,216 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
J	L_toggleOCx24
NOP	
L_toggleOCx23:
;Stepper.c,217 :: 		else if(InterPol == Cir)
SEH	R3, R26
ORI	R2, R0, 1
BEQ	R3, R2, L__toggleOCx142
NOP	
J	L_toggleOCx25
NOP	
L__toggleOCx142:
;Stepper.c,218 :: 		OC5RS  = cirSpeed;
ORI	R2, R0, 100
SW	R2, Offset(OC5RS+0)(GP)
L_toggleOCx25:
L_toggleOCx24:
;Stepper.c,219 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,220 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,221 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,222 :: 		case Y: OC2R   = 0x5;
L_toggleOCx26:
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Stepper.c,223 :: 		if(InterPol == Lin)
SEH	R2, R26
BEQ	R2, R0, L__toggleOCx143
NOP	
J	L_toggleOCx27
NOP	
L__toggleOCx143:
;Stepper.c,224 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+76)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC2RS+0)(GP)
J	L_toggleOCx28
NOP	
L_toggleOCx27:
;Stepper.c,225 :: 		else if(InterPol == Cir)
SEH	R3, R26
ORI	R2, R0, 1
BEQ	R3, R2, L__toggleOCx144
NOP	
J	L_toggleOCx29
NOP	
L__toggleOCx144:
;Stepper.c,226 :: 		OC2RS  = cirSpeed;
ORI	R2, R0, 100
SW	R2, Offset(OC2RS+0)(GP)
L_toggleOCx29:
L_toggleOCx28:
;Stepper.c,227 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,228 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC2CON+0)(GP)
;Stepper.c,229 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,230 :: 		case Z: OC7R   = 0x5;
L_toggleOCx30:
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Stepper.c,231 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+144)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC7RS+0)(GP)
;Stepper.c,232 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,233 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC7CON+0)(GP)
;Stepper.c,234 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,235 :: 		case A: OC3R   = 0x5;
L_toggleOCx31:
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,236 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+212)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,237 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR5+0)(GP)
;Stepper.c,238 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,239 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,240 :: 		case B: OC6R   = 0x5;
L_toggleOCx32:
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,241 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+280)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,242 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR3+0)(GP)
;Stepper.c,243 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,244 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,245 :: 		case C: OC8R   = 0x5;
L_toggleOCx33:
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,246 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+348)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,247 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR7+0)(GP)
;Stepper.c,248 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,249 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,250 :: 		default:
L_toggleOCx34:
;Stepper.c,251 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,252 :: 		}
L_toggleOCx20:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx146
NOP	
J	L_toggleOCx22
NOP	
L__toggleOCx146:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx148
NOP	
J	L_toggleOCx26
NOP	
L__toggleOCx148:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx150
NOP	
J	L_toggleOCx30
NOP	
L__toggleOCx150:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__toggleOCx152
NOP	
J	L_toggleOCx31
NOP	
L__toggleOCx152:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__toggleOCx154
NOP	
J	L_toggleOCx32
NOP	
L__toggleOCx154:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__toggleOCx156
NOP	
J	L_toggleOCx33
NOP	
L__toggleOCx156:
J	L_toggleOCx34
NOP	
L_toggleOCx21:
;Stepper.c,254 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,258 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,264 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse35
NOP	
;Stepper.c,265 :: 		case STOP:
L_Pulse37:
;Stepper.c,266 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,267 :: 		break;
J	L_Pulse36
NOP	
;Stepper.c,269 :: 		case ACCEL:
L_Pulse38:
;Stepper.c,274 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,275 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__Pulse158
NOP	
J	L_Pulse39
NOP	
L__Pulse158:
;Stepper.c,277 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,278 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,279 :: 		}
L_Pulse39:
;Stepper.c,280 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
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
BNE	R2, R0, L__Pulse159
NOP	
J	L_Pulse40
NOP	
L__Pulse159:
;Stepper.c,281 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,282 :: 		}
L_Pulse40:
;Stepper.c,283 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse160
NOP	
J	L_Pulse41
NOP	
L__Pulse160:
;Stepper.c,284 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,285 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,286 :: 		STPS[axis_No].run_state   = DECEL;
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
;Stepper.c,287 :: 		}
L_Pulse41:
;Stepper.c,288 :: 		break;
J	L_Pulse36
NOP	
;Stepper.c,290 :: 		case RUN:
L_Pulse42:
;Stepper.c,291 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,293 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse161
NOP	
J	L_Pulse43
NOP	
L__Pulse161:
;Stepper.c,294 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,295 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,297 :: 		STPS[axis_No].run_state   =  DECEL;
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
;Stepper.c,298 :: 		}
L_Pulse43:
;Stepper.c,299 :: 		break;
J	L_Pulse36
NOP	
;Stepper.c,301 :: 		case DECEL:
L_Pulse44:
;Stepper.c,306 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,310 :: 		if(STPS[axis_No].accel_count >= 0 ){
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
BEQ	R2, R0, L__Pulse162
NOP	
J	L_Pulse45
NOP	
L__Pulse162:
;Stepper.c,311 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,312 :: 		}
L_Pulse45:
;Stepper.c,313 :: 		break;
J	L_Pulse36
NOP	
;Stepper.c,314 :: 		default:break;
L_Pulse46:
J	L_Pulse36
NOP	
;Stepper.c,315 :: 		}
L_Pulse35:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse164
NOP	
J	L_Pulse37
NOP	
L__Pulse164:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse166
NOP	
J	L_Pulse38
NOP	
L__Pulse166:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse168
NOP	
J	L_Pulse42
NOP	
L__Pulse168:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse170
NOP	
J	L_Pulse44
NOP	
L__Pulse170:
J	L_Pulse46
NOP	
L_Pulse36:
;Stepper.c,316 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,317 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,321 :: 		void AccDec(int axis_No){
;Stepper.c,322 :: 		STPS[axis_No].accel_count++;
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
;Stepper.c,323 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
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
;Stepper.c,324 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
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
;Stepper.c,325 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
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
;Stepper.c,327 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_Single_Axis_Enable:
;Stepper.c,332 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,333 :: 		switch(axis_){
J	L_Single_Axis_Enable47
NOP	
;Stepper.c,334 :: 		case X:
L_Single_Axis_Enable49:
;Stepper.c,335 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,336 :: 		break;
J	L_Single_Axis_Enable48
NOP	
;Stepper.c,337 :: 		case Y:
L_Single_Axis_Enable50:
;Stepper.c,338 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+8)(GP)
;Stepper.c,339 :: 		break;
J	L_Single_Axis_Enable48
NOP	
;Stepper.c,340 :: 		case Z:
L_Single_Axis_Enable51:
;Stepper.c,341 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+8)(GP)
;Stepper.c,342 :: 		break;
J	L_Single_Axis_Enable48
NOP	
;Stepper.c,343 :: 		case A:
L_Single_Axis_Enable52:
;Stepper.c,344 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,345 :: 		break;
J	L_Single_Axis_Enable48
NOP	
;Stepper.c,346 :: 		case B:
L_Single_Axis_Enable53:
;Stepper.c,347 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC6CONbits+8)(GP)
;Stepper.c,348 :: 		break;
J	L_Single_Axis_Enable48
NOP	
;Stepper.c,349 :: 		case C:
L_Single_Axis_Enable54:
;Stepper.c,350 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,351 :: 		break;
J	L_Single_Axis_Enable48
NOP	
;Stepper.c,352 :: 		default:
L_Single_Axis_Enable55:
;Stepper.c,353 :: 		break;
J	L_Single_Axis_Enable48
NOP	
;Stepper.c,354 :: 		}
L_Single_Axis_Enable47:
ANDI	R2, R25, 255
BNE	R2, R0, L__Single_Axis_Enable174
NOP	
J	L_Single_Axis_Enable49
NOP	
L__Single_Axis_Enable174:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable176
NOP	
J	L_Single_Axis_Enable50
NOP	
L__Single_Axis_Enable176:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable178
NOP	
J	L_Single_Axis_Enable51
NOP	
L__Single_Axis_Enable178:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable180
NOP	
J	L_Single_Axis_Enable52
NOP	
L__Single_Axis_Enable180:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable182
NOP	
J	L_Single_Axis_Enable53
NOP	
L__Single_Axis_Enable182:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable184
NOP	
J	L_Single_Axis_Enable54
NOP	
L__Single_Axis_Enable184:
J	L_Single_Axis_Enable55
NOP	
L_Single_Axis_Enable48:
;Stepper.c,355 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_Multi_Axis_Enable:
;Stepper.c,360 :: 		void Multi_Axis_Enable(axis_combination axis){
;Stepper.c,361 :: 		switch(axis){
J	L_Multi_Axis_Enable56
NOP	
;Stepper.c,362 :: 		case xy:
L_Multi_Axis_Enable58:
;Stepper.c,363 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,364 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,365 :: 		break;
J	L_Multi_Axis_Enable57
NOP	
;Stepper.c,366 :: 		case xz:
L_Multi_Axis_Enable59:
;Stepper.c,367 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,368 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,369 :: 		break;
J	L_Multi_Axis_Enable57
NOP	
;Stepper.c,370 :: 		case yz:
L_Multi_Axis_Enable60:
;Stepper.c,371 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,372 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,373 :: 		break;
J	L_Multi_Axis_Enable57
NOP	
;Stepper.c,374 :: 		case xa:
L_Multi_Axis_Enable61:
;Stepper.c,375 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,376 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,377 :: 		break;
J	L_Multi_Axis_Enable57
NOP	
;Stepper.c,378 :: 		case ya:
L_Multi_Axis_Enable62:
;Stepper.c,379 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,380 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,381 :: 		break;
J	L_Multi_Axis_Enable57
NOP	
;Stepper.c,382 :: 		case za:
L_Multi_Axis_Enable63:
;Stepper.c,383 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,384 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,385 :: 		break;
J	L_Multi_Axis_Enable57
NOP	
;Stepper.c,386 :: 		default:
L_Multi_Axis_Enable64:
;Stepper.c,387 :: 		break;
J	L_Multi_Axis_Enable57
NOP	
;Stepper.c,388 :: 		}
L_Multi_Axis_Enable56:
ANDI	R2, R25, 255
BNE	R2, R0, L__Multi_Axis_Enable187
NOP	
J	L_Multi_Axis_Enable58
NOP	
L__Multi_Axis_Enable187:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Multi_Axis_Enable189
NOP	
J	L_Multi_Axis_Enable59
NOP	
L__Multi_Axis_Enable189:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Multi_Axis_Enable191
NOP	
J	L_Multi_Axis_Enable60
NOP	
L__Multi_Axis_Enable191:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Multi_Axis_Enable193
NOP	
J	L_Multi_Axis_Enable61
NOP	
L__Multi_Axis_Enable193:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Multi_Axis_Enable195
NOP	
J	L_Multi_Axis_Enable62
NOP	
L__Multi_Axis_Enable195:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Multi_Axis_Enable197
NOP	
J	L_Multi_Axis_Enable63
NOP	
L__Multi_Axis_Enable197:
J	L_Multi_Axis_Enable64
NOP	
L_Multi_Axis_Enable57:
;Stepper.c,389 :: 		}
L_end_Multi_Axis_Enable:
JR	RA
NOP	
; end of _Multi_Axis_Enable
_disableOCx:
;Stepper.c,391 :: 		void disableOCx(){
;Stepper.c,392 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,393 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+4)(GP)
;Stepper.c,394 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+4)(GP)
;Stepper.c,396 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,397 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
SW	R3, Offset(OC6CONbits+4)(GP)
;Stepper.c,398 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,399 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_StepX:
;Stepper.c,404 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,405 :: 		STPS[X].step_count++;
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,406 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,407 :: 		if(SV.Single_Dual == 0)
LBU	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepX200
NOP	
J	L_StepX65
NOP	
L__StepX200:
;Stepper.c,408 :: 		SingleStepX();
JAL	_SingleStepX+0
NOP	
J	L_StepX66
NOP	
L_StepX65:
;Stepper.c,409 :: 		else if(SV.Single_Dual == 1)
LBU	R3, Offset(_SV+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepX201
NOP	
J	L_StepX67
NOP	
L__StepX201:
;Stepper.c,410 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
J	L_StepX68
NOP	
L_StepX67:
;Stepper.c,411 :: 		else if(SV.Single_Dual == 2)
LBU	R3, Offset(_SV+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepX202
NOP	
J	L_StepX69
NOP	
L__StepX202:
;Stepper.c,412 :: 		Cir_Interpolation(&Circ);
LUI	R25, hi_addr(_Circ+0)
ORI	R25, R25, lo_addr(_Circ+0)
JAL	_Cir_Interpolation+0
NOP	
J	L_StepX70
NOP	
L_StepX69:
;Stepper.c,414 :: 		return;
J	L_end_StepX
NOP	
L_StepX70:
L_StepX68:
L_StepX66:
;Stepper.c,415 :: 		}
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
;Stepper.c,417 :: 		void SingleStepX(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,418 :: 		if(STPS[X].step_count >= STPS[X].dist){  //i think this is where the problem lies
SW	R25, 4(SP)
SW	R26, 8(SP)
LW	R3, Offset(_STPS+36)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepX204
NOP	
J	L_SingleStepX71
NOP	
L__SingleStepX204:
;Stepper.c,419 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,420 :: 		}
J	L_SingleStepX72
NOP	
L_SingleStepX71:
;Stepper.c,422 :: 		Step_Cycle(X,Lin);
MOVZ	R26, R0, R0
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,423 :: 		}
L_SingleStepX72:
;Stepper.c,424 :: 		}
L_end_SingleStepX:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _SingleStepX
_StopX:
;Stepper.c,427 :: 		void StopX(){
;Stepper.c,428 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,429 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,430 :: 		}
L_end_StopX:
JR	RA
NOP	
; end of _StopX
_StepY:
;Stepper.c,436 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,437 :: 		STPS[Y].step_count++;
LW	R2, Offset(_STPS+100)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+100)(GP)
;Stepper.c,438 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,439 :: 		if(SV.Single_Dual == 0)
LBU	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepY207
NOP	
J	L_StepY73
NOP	
L__StepY207:
;Stepper.c,440 :: 		SingleStepY();
JAL	_SingleStepY+0
NOP	
J	L_StepY74
NOP	
L_StepY73:
;Stepper.c,441 :: 		else if(SV.Single_Dual == 1)
LBU	R3, Offset(_SV+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepY208
NOP	
J	L_StepY75
NOP	
L__StepY208:
;Stepper.c,442 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
J	L_StepY76
NOP	
L_StepY75:
;Stepper.c,443 :: 		else if(SV.Single_Dual == 2)
LBU	R3, Offset(_SV+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepY209
NOP	
J	L_StepY77
NOP	
L__StepY209:
;Stepper.c,444 :: 		Cir_Interpolation(&Circ);
LUI	R25, hi_addr(_Circ+0)
ORI	R25, R25, lo_addr(_Circ+0)
JAL	_Cir_Interpolation+0
NOP	
J	L_StepY78
NOP	
L_StepY77:
;Stepper.c,445 :: 		else return;
J	L_end_StepY
NOP	
L_StepY78:
L_StepY76:
L_StepY74:
;Stepper.c,446 :: 		}
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
;Stepper.c,448 :: 		void SingleStepY(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,449 :: 		if(STPS[Y].step_count >= STPS[Y].dist){  //i think this is where the problem lies
SW	R25, 4(SP)
SW	R26, 8(SP)
LW	R3, Offset(_STPS+104)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepY211
NOP	
J	L_SingleStepY79
NOP	
L__SingleStepY211:
;Stepper.c,450 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,451 :: 		}
J	L_SingleStepY80
NOP	
L_SingleStepY79:
;Stepper.c,453 :: 		Step_Cycle(Y,Lin);
MOVZ	R26, R0, R0
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,454 :: 		}
L_SingleStepY80:
;Stepper.c,455 :: 		}
L_end_SingleStepY:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _SingleStepY
_StopY:
;Stepper.c,457 :: 		void StopY(){
;Stepper.c,458 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,459 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,460 :: 		}
L_end_StopY:
JR	RA
NOP	
; end of _StopY
_StepZ:
;Stepper.c,466 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,467 :: 		STPS[Z].step_count++;
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+168)(GP)
;Stepper.c,468 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,469 :: 		if(!SV.Single_Dual)
LBU	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepZ214
NOP	
J	L_StepZ81
NOP	
L__StepZ214:
;Stepper.c,470 :: 		SingleStepZ();
JAL	_SingleStepZ+0
NOP	
J	L_StepZ82
NOP	
L_StepZ81:
;Stepper.c,471 :: 		else if(SV.Single_Dual == 1)
LBU	R3, Offset(_SV+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__StepZ215
NOP	
J	L_StepZ83
NOP	
L__StepZ215:
;Stepper.c,472 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
J	L_StepZ84
NOP	
L_StepZ83:
;Stepper.c,473 :: 		else if(SV.Single_Dual == 2)
LBU	R3, Offset(_SV+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__StepZ216
NOP	
J	L_StepZ85
NOP	
L__StepZ216:
;Stepper.c,474 :: 		return;
J	L_end_StepZ
NOP	
L_StepZ85:
;Stepper.c,475 :: 		else return;
J	L_end_StepZ
NOP	
L_StepZ84:
L_StepZ82:
;Stepper.c,476 :: 		}
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
;Stepper.c,478 :: 		void SingleStepZ(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,479 :: 		if(STPS[Z].step_count >= STPS[Z].dist){
SW	R25, 4(SP)
SW	R26, 8(SP)
LW	R3, Offset(_STPS+172)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepZ218
NOP	
J	L_SingleStepZ87
NOP	
L__SingleStepZ218:
;Stepper.c,480 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,481 :: 		}
J	L_SingleStepZ88
NOP	
L_SingleStepZ87:
;Stepper.c,483 :: 		Step_Cycle(Z,Lin);
MOVZ	R26, R0, R0
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,484 :: 		}
L_SingleStepZ88:
;Stepper.c,485 :: 		}
L_end_SingleStepZ:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _SingleStepZ
_StopZ:
;Stepper.c,487 :: 		void StopZ(){
;Stepper.c,488 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,489 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,490 :: 		}
L_end_StopZ:
JR	RA
NOP	
; end of _StopZ
_StepA:
;Stepper.c,495 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,496 :: 		STPS[A].step_count++;
LW	R2, Offset(_STPS+236)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+236)(GP)
;Stepper.c,497 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,498 :: 		if(!SV.Single_Dual)
LBU	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepA221
NOP	
J	L_StepA89
NOP	
L__StepA221:
;Stepper.c,499 :: 		SingleStepA();
JAL	_SingleStepA+0
NOP	
J	L_StepA90
NOP	
L_StepA89:
;Stepper.c,501 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepA90:
;Stepper.c,503 :: 		}
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
;Stepper.c,505 :: 		void SingleStepA(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,506 :: 		if(STPS[A].step_count >= STPS[A].dist){
SW	R25, 4(SP)
SW	R26, 8(SP)
LW	R3, Offset(_STPS+240)(GP)
LW	R2, Offset(_STPS+236)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepA223
NOP	
J	L_SingleStepA91
NOP	
L__SingleStepA223:
;Stepper.c,507 :: 		StopA();
JAL	_StopA+0
NOP	
;Stepper.c,508 :: 		}
J	L_SingleStepA92
NOP	
L_SingleStepA91:
;Stepper.c,510 :: 		Step_Cycle(A,Lin);
MOVZ	R26, R0, R0
ORI	R25, R0, 3
JAL	_Step_Cycle+0
NOP	
;Stepper.c,511 :: 		}
L_SingleStepA92:
;Stepper.c,512 :: 		}
L_end_SingleStepA:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _SingleStepA
_StopA:
;Stepper.c,514 :: 		void StopA(){
;Stepper.c,515 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,516 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,517 :: 		}
L_end_StopA:
JR	RA
NOP	
; end of _StopA
_min_:
;Stepper.c,528 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,529 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_226
NOP	
J	L_min_93
NOP	
L__min_226:
;Stepper.c,530 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,531 :: 		}
L_min_93:
;Stepper.c,533 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,535 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
Stepper_sqrt_:
;Stepper.c,545 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,551 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,552 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,553 :: 		do
J	L_Stepper_sqrt_95
NOP	
L_Stepper_sqrt_112:
;Stepper.c,567 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,553 :: 		do
L_Stepper_sqrt_95:
;Stepper.c,555 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_228
NOP	
J	L_Stepper_sqrt_98
NOP	
L_Stepper_sqrt_228:
;Stepper.c,557 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,558 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,559 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_99
NOP	
L_Stepper_sqrt_98:
;Stepper.c,561 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,562 :: 		}
L_Stepper_sqrt_99:
;Stepper.c,563 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,564 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_230
NOP	
J	L_Stepper_sqrt_113
NOP	
L_Stepper_sqrt_230:
; f end address is: 16 (R4)
;Stepper.c,565 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,566 :: 		}
J	L_Stepper_sqrt_100
NOP	
L_Stepper_sqrt_113:
;Stepper.c,564 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,566 :: 		}
L_Stepper_sqrt_100:
;Stepper.c,567 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_231
NOP	
J	L_Stepper_sqrt_112
NOP	
L_Stepper_sqrt_231:
; q2 end address is: 12 (R3)
;Stepper.c,568 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_232
NOP	
J	L_Stepper_sqrt_101
NOP	
L_Stepper_sqrt_232:
;Stepper.c,569 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,570 :: 		}
L_Stepper_sqrt_101:
;Stepper.c,572 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,574 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_CycleStop:
;Stepper.c,599 :: 		void CycleStop(){
;Stepper.c,601 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,602 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop103:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStop234
NOP	
J	L_CycleStop104
NOP	
L__CycleStop234:
;Stepper.c,603 :: 		STPS[ii].microSec = 0;
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,604 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStop235
NOP	
J	L_CycleStop106
NOP	
L__CycleStop235:
; ii end address is: 16 (R4)
J	L_CycleStop104
NOP	
L_CycleStop106:
;Stepper.c,602 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,605 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop103
NOP	
L_CycleStop104:
;Stepper.c,606 :: 		}
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
;Stepper.c,608 :: 		void CycleStart(){
;Stepper.c,611 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__CycleStart237
NOP	
J	L_CycleStart107
NOP	
L__CycleStart237:
;Stepper.c,612 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart108:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStart238
NOP	
J	L_CycleStart109
NOP	
L__CycleStart238:
;Stepper.c,613 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStart239
NOP	
J	L_CycleStart111
NOP	
L__CycleStart239:
; ii end address is: 16 (R4)
J	L_CycleStart109
NOP	
L_CycleStart111:
;Stepper.c,614 :: 		STPS[ii].microSec++;
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
;Stepper.c,612 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,615 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart108
NOP	
L_CycleStart109:
;Stepper.c,616 :: 		}
L_CycleStart107:
;Stepper.c,617 :: 		}
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
