_SetPinMode:
;Stepper.c,55 :: 		void SetPinMode(){
;Stepper.c,58 :: 		EN_Step_PinDirX  = 0; //output
LUI	R2, BitMask(TRISG1_bit+0)
ORI	R2, R2, BitMask(TRISG1_bit+0)
_SX	
_LX	
EXT	R2, R2, BitPos(TRISG1_bit+0), 1
SB	R2, Offset(_AxisNo+0)(GP)
;Stepper.c,61 :: 		PLS_Step_PinDirX = 0;
LUI	R2, BitMask(TRISF1_bit+0)
ORI	R2, R2, BitMask(TRISF1_bit+0)
_SX	
;Stepper.c,62 :: 		DIR_Step_PinDirX = 0;
LUI	R2, BitMask(TRISG0_bit+0)
ORI	R2, R2, BitMask(TRISG0_bit+0)
_SX	
;Stepper.c,64 :: 		EN_Step_PinDirY  = 0; //output
LUI	R2, BitMask(TRISF0_bit+0)
ORI	R2, R2, BitMask(TRISF0_bit+0)
_SX	
;Stepper.c,67 :: 		PLS_Step_PinDirY = 0;
LUI	R2, BitMask(TRISD4_bit+0)
ORI	R2, R2, BitMask(TRISD4_bit+0)
_SX	
;Stepper.c,68 :: 		DIR_Step_PinDirY = 0;
LUI	R2, BitMask(TRISD5_bit+0)
ORI	R2, R2, BitMask(TRISD5_bit+0)
_SX	
;Stepper.c,70 :: 		EN_Step_PinDirZ  = 0; //output
LUI	R2, BitMask(TRISG14_bit+0)
ORI	R2, R2, BitMask(TRISG14_bit+0)
_SX	
;Stepper.c,73 :: 		PLS_Step_PinDirZ = 0;
LUI	R2, BitMask(TRISE3_bit+0)
ORI	R2, R2, BitMask(TRISE3_bit+0)
_SX	
;Stepper.c,74 :: 		DIR_Step_PinDirZ = 0;
LUI	R2, BitMask(TRISG12_bit+0)
ORI	R2, R2, BitMask(TRISG12_bit+0)
_SX	
;Stepper.c,76 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_StepperConstants:
;Stepper.c,80 :: 		void StepperConstants(long accel,long decel){
;Stepper.c,81 :: 		SV.acc = accel;
SW	R25, Offset(_SV+44)(GP)
;Stepper.c,82 :: 		SV.dec = decel;
SW	R26, Offset(_SV+48)(GP)
;Stepper.c,83 :: 		}
L_end_StepperConstants:
JR	RA
NOP	
; end of _StepperConstants
_EnStepperX:
;Stepper.c,87 :: 		void EnStepperX(){
;Stepper.c,90 :: 		EN_StepX       = 0;
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
;Stepper.c,91 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,93 :: 		void EnStepperY(){
;Stepper.c,96 :: 		EN_StepY       = 0;
LUI	R2, BitMask(LATF0_bit+0)
ORI	R2, R2, BitMask(LATF0_bit+0)
_SX	
;Stepper.c,97 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,98 :: 		void EnStepperZ(){
;Stepper.c,101 :: 		EN_StepZ       = 0;
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;Stepper.c,102 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_DisableStepper:
;Stepper.c,104 :: 		void DisableStepper(){
;Stepper.c,105 :: 		EN_StepX      = 1;
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
;Stepper.c,106 :: 		EN_StepY      = 1;
LUI	R2, BitMask(LATF0_bit+0)
ORI	R2, R2, BitMask(LATF0_bit+0)
_SX	
;Stepper.c,107 :: 		EN_StepZ      = 1;
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;Stepper.c,108 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_speed_cntr_Move:
;Stepper.c,126 :: 		void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,129 :: 		if(mmSteps == 1){
SW	R25, 4(SP)
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move228
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move228:
;Stepper.c,131 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
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
;Stepper.c,132 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
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
;Stepper.c,133 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
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
;Stepper.c,134 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,136 :: 		}
J	L_speed_cntr_Move1
NOP	
L_speed_cntr_Move0:
;Stepper.c,138 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
BNE	R25, R0, L__speed_cntr_Move230
NOP	
J	L__speed_cntr_Move202
NOP	
L__speed_cntr_Move230:
JAL	_abs+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__speed_cntr_Move232
NOP	
J	L__speed_cntr_Move201
NOP	
L__speed_cntr_Move232:
L__speed_cntr_Move200:
;Stepper.c,142 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
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
;Stepper.c,147 :: 		STPS[axis_No].step_delay = abs((T1_FREQ_148 * sqrt_(A_SQ / SV.acc))/100);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
SW	R2, 12(SP)
LW	R3, Offset(_SV+44)(GP)
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
;Stepper.c,148 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
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
;Stepper.c,153 :: 		STPS[axis_No].max_step_lim = (speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 52
MUL	R3, R26, R26
LWC1	S0, Offset(_SV+44)(GP)
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
;Stepper.c,158 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move233
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move233:
;Stepper.c,159 :: 		STPS[axis_No].max_step_lim = 1;
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
;Stepper.c,160 :: 		}
L_speed_cntr_Move5:
;Stepper.c,164 :: 		STPS[axis_No].accel_lim = (abs(mmSteps) * SV.dec) / (SV.acc + SV.dec);
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
LW	R3, Offset(_SV+48)(GP)
SEH	R2, R2
MUL	R4, R2, R3
LW	R3, Offset(_SV+48)(GP)
LW	R2, Offset(_SV+44)(GP)
ADDU	R2, R2, R3
DIV	R4, R2
MFLO	R3
LW	R2, 12(SP)
SW	R3, 0(R2)
;Stepper.c,167 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move234
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move234:
;Stepper.c,168 :: 		STPS[axis_No].accel_lim = 1;
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
;Stepper.c,169 :: 		}
L_speed_cntr_Move6:
;Stepper.c,172 :: 		if(STPS[axis_No].accel_lim <= STPS[axis_No].max_step_lim){
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
BEQ	R2, R0, L__speed_cntr_Move235
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move235:
;Stepper.c,173 :: 		if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move236
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move236:
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
;Stepper.c,174 :: 		else STPS[axis_No].decel_val = mmSteps + STPS[axis_No].accel_lim;
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
;Stepper.c,175 :: 		}else{
J	L_speed_cntr_Move10
NOP	
L_speed_cntr_Move7:
;Stepper.c,176 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * SV.acc) / SV.dec);
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
LW	R2, Offset(_SV+44)(GP)
MUL	R3, R3, R2
LW	R2, Offset(_SV+48)(GP)
DIV	R3, R2
MFLO	R3
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R4)
;Stepper.c,177 :: 		}
L_speed_cntr_Move10:
;Stepper.c,179 :: 		if(mmSteps >= 0){
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move237
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move237:
;Stepper.c,180 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
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
BNE	R2, R0, L__speed_cntr_Move238
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move238:
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
;Stepper.c,181 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
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
;Stepper.c,182 :: 		}
J	L_speed_cntr_Move14
NOP	
L_speed_cntr_Move11:
;Stepper.c,184 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = abs(mmSteps) * STPS[axis_No].decel_val;
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
BNE	R2, R0, L__speed_cntr_Move239
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move239:
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
;Stepper.c,185 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
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
;Stepper.c,186 :: 		}
L_speed_cntr_Move14:
;Stepper.c,188 :: 		if(STPS[axis_No].decel_val == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move240
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move240:
;Stepper.c,189 :: 		STPS[axis_No].decel_val = -1;
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
;Stepper.c,190 :: 		}
L_speed_cntr_Move17:
;Stepper.c,193 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__speed_cntr_Move241
NOP	
J	L_speed_cntr_Move18
NOP	
L__speed_cntr_Move241:
;Stepper.c,194 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,195 :: 		STPS[axis_No].run_state = RUN;
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
;Stepper.c,196 :: 		}else{
J	L_speed_cntr_Move19
NOP	
L_speed_cntr_Move18:
;Stepper.c,197 :: 		STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
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
;Stepper.c,198 :: 		STPS[axis_No].run_state = ACCEL;
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
;Stepper.c,199 :: 		}
L_speed_cntr_Move19:
;Stepper.c,138 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
L__speed_cntr_Move202:
L__speed_cntr_Move201:
;Stepper.c,201 :: 		}
L_speed_cntr_Move1:
;Stepper.c,202 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,203 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,204 :: 		STPS[axis_No].microSec    = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,205 :: 		STPS[axis_No].accel_count = 1;
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
;Stepper.c,206 :: 		STPS[axis_No].dist        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R0, 0(R2)
;Stepper.c,207 :: 		SV.Tog   = 0;
SH	R0, Offset(_SV+2)(GP)
;Stepper.c,211 :: 		SV.running = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,212 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_SingleAxisStep:
;Stepper.c,220 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,227 :: 		switch(axis_No){
SW	R25, 4(SP)
J	L_SingleAxisStep20
NOP	
;Stepper.c,228 :: 		case 0:OC3IE_bit = 1;OC3CONbits.ON = 1;
L_SingleAxisStep22:
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,231 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,232 :: 		case 1://OC3IE_bit = 0;OC3CONbits.ON = 0;
L_SingleAxisStep23:
;Stepper.c,233 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,235 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,236 :: 		case 2://OC3IE_bit = 0;OC3CONbits.ON = 0;
L_SingleAxisStep24:
;Stepper.c,238 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,239 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,240 :: 		default: break;
L_SingleAxisStep25:
J	L_SingleAxisStep21
NOP	
;Stepper.c,241 :: 		}
L_SingleAxisStep20:
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep244
NOP	
J	L_SingleAxisStep22
NOP	
L__SingleAxisStep244:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep246
NOP	
J	L_SingleAxisStep23
NOP	
L__SingleAxisStep246:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep248
NOP	
J	L_SingleAxisStep24
NOP	
L__SingleAxisStep248:
J	L_SingleAxisStep25
NOP	
L_SingleAxisStep21:
;Stepper.c,242 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+36)(GP)
;Stepper.c,243 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R25, 0(R2)
;Stepper.c,244 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 12(SP)
SW	R25, 8(SP)
LW	R25, 0(R2)
JAL	_abs+0
NOP	
LW	R25, 8(SP)
SEH	R3, R2
LW	R2, 12(SP)
SW	R3, 0(R2)
;Stepper.c,246 :: 		if(newxyz < 0)
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep249
NOP	
J	L_SingleAxisStep26
NOP	
L__SingleAxisStep249:
;Stepper.c,247 :: 		dir = CCW;
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep27
NOP	
L_SingleAxisStep26:
;Stepper.c,249 :: 		dir = CW;
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep27:
;Stepper.c,251 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep28
NOP	
;Stepper.c,252 :: 		case X:
L_SingleAxisStep30:
;Stepper.c,253 :: 		DIR_StepX = dir;
_LX	
INS	R2, R4, BitPos(LATG0_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,254 :: 		break;
J	L_SingleAxisStep29
NOP	
;Stepper.c,255 :: 		case Y:
L_SingleAxisStep31:
;Stepper.c,256 :: 		DIR_StepY = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(LATD5_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,257 :: 		break;
J	L_SingleAxisStep29
NOP	
;Stepper.c,258 :: 		case Z:
L_SingleAxisStep32:
;Stepper.c,259 :: 		DIR_StepZ = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(LATG12_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,260 :: 		break;
J	L_SingleAxisStep29
NOP	
;Stepper.c,261 :: 		default: break;
L_SingleAxisStep33:
J	L_SingleAxisStep29
NOP	
;Stepper.c,262 :: 		}
L_SingleAxisStep28:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep251
NOP	
J	L_SingleAxisStep30
NOP	
L__SingleAxisStep251:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep253
NOP	
J	L_SingleAxisStep31
NOP	
L__SingleAxisStep253:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep255
NOP	
J	L_SingleAxisStep32
NOP	
L__SingleAxisStep255:
; dir end address is: 16 (R4)
J	L_SingleAxisStep33
NOP	
L_SingleAxisStep29:
;Stepper.c,264 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,266 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Stepper.c,268 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Stepper.c,270 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,273 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+40)(GP)
;Stepper.c,274 :: 		d2 = 0;
SW	R0, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,276 :: 		SV.px = 0;
SW	R0, Offset(_SV+24)(GP)
;Stepper.c,277 :: 		SV.py = 0;
SW	R0, Offset(_SV+28)(GP)
;Stepper.c,278 :: 		SV.pz = 0;
SW	R0, Offset(_SV+32)(GP)
;Stepper.c,283 :: 		switch(axis_combo){
J	L_DualAxisStep34
NOP	
;Stepper.c,284 :: 		case xy:
L_DualAxisStep36:
;Stepper.c,285 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,286 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,287 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,288 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,289 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,291 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep257
NOP	
J	L_DualAxisStep37
NOP	
L__DualAxisStep257:
; ?FLOC___DualAxisStep?T384 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T384 end address is: 12 (R3)
J	L_DualAxisStep38
NOP	
L_DualAxisStep37:
; ?FLOC___DualAxisStep?T384 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T384 end address is: 12 (R3)
L_DualAxisStep38:
; ?FLOC___DualAxisStep?T384 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T384 end address is: 12 (R3)
SH	R2, Offset(_SV+52)(GP)
;Stepper.c,292 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep258
NOP	
J	L_DualAxisStep39
NOP	
L__DualAxisStep258:
; ?FLOC___DualAxisStep?T386 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T386 end address is: 12 (R3)
J	L_DualAxisStep40
NOP	
L_DualAxisStep39:
; ?FLOC___DualAxisStep?T386 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T386 end address is: 12 (R3)
L_DualAxisStep40:
; ?FLOC___DualAxisStep?T386 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T386 end address is: 12 (R3)
SH	R2, Offset(_SV+54)(GP)
;Stepper.c,294 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+52)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep259
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep259:
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
J	L_DualAxisStep42
NOP	
L_DualAxisStep41:
;Stepper.c,295 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
L_DualAxisStep42:
;Stepper.c,296 :: 		if(SV.diry < 0) DIR_StepY = CCW;
LH	R2, Offset(_SV+54)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep260
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep260:
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_DualAxisStep44
NOP	
L_DualAxisStep43:
;Stepper.c,297 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_DualAxisStep44:
;Stepper.c,298 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+12)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,299 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,301 :: 		if(SV.dx > SV.dy) d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep261
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep261:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep46
NOP	
L_DualAxisStep45:
;Stepper.c,302 :: 		else d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
L_DualAxisStep46:
;Stepper.c,303 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep262
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep262:
;Stepper.c,304 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,305 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep263
NOP	
J	L_DualAxisStep48
NOP	
L__DualAxisStep263:
;Stepper.c,306 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
SW	R0, Offset(_STPS+32)(GP)
L_DualAxisStep49:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep264
NOP	
J	L_DualAxisStep50
NOP	
L__DualAxisStep264:
;Stepper.c,307 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,308 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,309 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,310 :: 		if(d2 < 0)d2 += 2*SV.dy;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep265
NOP	
J	L_DualAxisStep52
NOP	
L__DualAxisStep265:
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep53
NOP	
L_DualAxisStep52:
;Stepper.c,312 :: 		d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,313 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,314 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,315 :: 		}
L_DualAxisStep53:
;Stepper.c,317 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep54:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep266
NOP	
J	L_DualAxisStep55
NOP	
L__DualAxisStep266:
J	L_DualAxisStep54
NOP	
L_DualAxisStep55:
;Stepper.c,306 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,318 :: 		}
J	L_DualAxisStep49
NOP	
L_DualAxisStep50:
;Stepper.c,319 :: 		}else{
J	L_DualAxisStep56
NOP	
L_DualAxisStep48:
;Stepper.c,320 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
SW	R0, Offset(_STPS+100)(GP)
L_DualAxisStep57:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep267
NOP	
J	L_DualAxisStep58
NOP	
L__DualAxisStep267:
;Stepper.c,321 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,322 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,323 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,324 :: 		if(d2 < 0)d2 += 2 * SV.dx;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep268
NOP	
J	L_DualAxisStep60
NOP	
L__DualAxisStep268:
LW	R2, Offset(_SV+12)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep61
NOP	
L_DualAxisStep60:
;Stepper.c,326 :: 		d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,327 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,328 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,329 :: 		}
L_DualAxisStep61:
;Stepper.c,331 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep62:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep269
NOP	
J	L_DualAxisStep63
NOP	
L__DualAxisStep269:
J	L_DualAxisStep62
NOP	
L_DualAxisStep63:
;Stepper.c,320 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
LW	R2, Offset(_STPS+100)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+100)(GP)
;Stepper.c,332 :: 		}
J	L_DualAxisStep57
NOP	
L_DualAxisStep58:
;Stepper.c,333 :: 		}
L_DualAxisStep56:
;Stepper.c,334 :: 		}
L_DualAxisStep47:
;Stepper.c,335 :: 		break;
J	L_DualAxisStep35
NOP	
;Stepper.c,336 :: 		case xz:
L_DualAxisStep64:
;Stepper.c,337 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,338 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,339 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+8)(GP)
;Stepper.c,340 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,341 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,343 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep270
NOP	
J	L_DualAxisStep65
NOP	
L__DualAxisStep270:
; ?FLOC___DualAxisStep?T429 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T429 end address is: 12 (R3)
J	L_DualAxisStep66
NOP	
L_DualAxisStep65:
; ?FLOC___DualAxisStep?T429 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T429 end address is: 12 (R3)
L_DualAxisStep66:
; ?FLOC___DualAxisStep?T429 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T429 end address is: 12 (R3)
SH	R2, Offset(_SV+52)(GP)
;Stepper.c,344 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep271
NOP	
J	L_DualAxisStep67
NOP	
L__DualAxisStep271:
; ?FLOC___DualAxisStep?T431 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T431 end address is: 12 (R3)
J	L_DualAxisStep68
NOP	
L_DualAxisStep67:
; ?FLOC___DualAxisStep?T431 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T431 end address is: 12 (R3)
L_DualAxisStep68:
; ?FLOC___DualAxisStep?T431 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T431 end address is: 12 (R3)
SH	R2, Offset(_SV+56)(GP)
;Stepper.c,346 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+52)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep272
NOP	
J	L_DualAxisStep69
NOP	
L__DualAxisStep272:
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
J	L_DualAxisStep70
NOP	
L_DualAxisStep69:
;Stepper.c,347 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
L_DualAxisStep70:
;Stepper.c,348 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+56)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep273
NOP	
J	L_DualAxisStep71
NOP	
L__DualAxisStep273:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_DualAxisStep72
NOP	
L_DualAxisStep71:
;Stepper.c,349 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_DualAxisStep72:
;Stepper.c,350 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+12)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,351 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,353 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep274
NOP	
J	L_DualAxisStep73
NOP	
L__DualAxisStep274:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep74
NOP	
L_DualAxisStep73:
;Stepper.c,354 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
L_DualAxisStep74:
;Stepper.c,355 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep275
NOP	
J	L_DualAxisStep75
NOP	
L__DualAxisStep275:
;Stepper.c,356 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,357 :: 		if(SV.dx > SV.dz){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep276
NOP	
J	L_DualAxisStep76
NOP	
L__DualAxisStep276:
;Stepper.c,358 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
SW	R0, Offset(_STPS+32)(GP)
L_DualAxisStep77:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep277
NOP	
J	L_DualAxisStep78
NOP	
L__DualAxisStep277:
;Stepper.c,359 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,360 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,361 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,362 :: 		if(d2 < 0)d2 += 2*SV.dz;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep278
NOP	
J	L_DualAxisStep80
NOP	
L__DualAxisStep278:
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep81
NOP	
L_DualAxisStep80:
;Stepper.c,364 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,365 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,366 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,367 :: 		}
L_DualAxisStep81:
;Stepper.c,369 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep82:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep279
NOP	
J	L_DualAxisStep83
NOP	
L__DualAxisStep279:
J	L_DualAxisStep82
NOP	
L_DualAxisStep83:
;Stepper.c,358 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,370 :: 		}
J	L_DualAxisStep77
NOP	
L_DualAxisStep78:
;Stepper.c,371 :: 		}else{
J	L_DualAxisStep84
NOP	
L_DualAxisStep76:
;Stepper.c,372 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
SW	R0, Offset(_STPS+168)(GP)
L_DualAxisStep85:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep280
NOP	
J	L_DualAxisStep86
NOP	
L__DualAxisStep280:
;Stepper.c,373 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,374 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,375 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,376 :: 		if(d2 < 0)d2 += 2 * SV.dx;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep281
NOP	
J	L_DualAxisStep88
NOP	
L__DualAxisStep281:
LW	R2, Offset(_SV+12)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep89
NOP	
L_DualAxisStep88:
;Stepper.c,378 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,379 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,380 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,381 :: 		}
L_DualAxisStep89:
;Stepper.c,383 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep90:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep282
NOP	
J	L_DualAxisStep91
NOP	
L__DualAxisStep282:
J	L_DualAxisStep90
NOP	
L_DualAxisStep91:
;Stepper.c,372 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+168)(GP)
;Stepper.c,384 :: 		}
J	L_DualAxisStep85
NOP	
L_DualAxisStep86:
;Stepper.c,385 :: 		}
L_DualAxisStep84:
;Stepper.c,386 :: 		}
L_DualAxisStep75:
;Stepper.c,387 :: 		break;
J	L_DualAxisStep35
NOP	
;Stepper.c,388 :: 		case yz:
L_DualAxisStep92:
;Stepper.c,389 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,390 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,391 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+8)(GP)
;Stepper.c,392 :: 		SV.dy   = newx - SV.pz;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,393 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,395 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep283
NOP	
J	L_DualAxisStep93
NOP	
L__DualAxisStep283:
; ?FLOC___DualAxisStep?T474 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T474 end address is: 12 (R3)
J	L_DualAxisStep94
NOP	
L_DualAxisStep93:
; ?FLOC___DualAxisStep?T474 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T474 end address is: 12 (R3)
L_DualAxisStep94:
; ?FLOC___DualAxisStep?T474 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T474 end address is: 12 (R3)
SH	R2, Offset(_SV+54)(GP)
;Stepper.c,396 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep284
NOP	
J	L_DualAxisStep95
NOP	
L__DualAxisStep284:
; ?FLOC___DualAxisStep?T476 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T476 end address is: 12 (R3)
J	L_DualAxisStep96
NOP	
L_DualAxisStep95:
; ?FLOC___DualAxisStep?T476 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T476 end address is: 12 (R3)
L_DualAxisStep96:
; ?FLOC___DualAxisStep?T476 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T476 end address is: 12 (R3)
SH	R2, Offset(_SV+56)(GP)
;Stepper.c,398 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+54)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep285
NOP	
J	L_DualAxisStep97
NOP	
L__DualAxisStep285:
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_DualAxisStep98
NOP	
L_DualAxisStep97:
;Stepper.c,399 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_DualAxisStep98:
;Stepper.c,400 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+56)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep286
NOP	
J	L_DualAxisStep99
NOP	
L__DualAxisStep286:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_DualAxisStep100
NOP	
L_DualAxisStep99:
;Stepper.c,401 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_DualAxisStep100:
;Stepper.c,402 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,403 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,405 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep287
NOP	
J	L_DualAxisStep101
NOP	
L__DualAxisStep287:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep102
NOP	
L_DualAxisStep101:
;Stepper.c,406 :: 		else d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
L_DualAxisStep102:
;Stepper.c,407 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep288
NOP	
J	L_DualAxisStep103
NOP	
L__DualAxisStep288:
;Stepper.c,408 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,409 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep289
NOP	
J	L_DualAxisStep104
NOP	
L__DualAxisStep289:
;Stepper.c,410 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
SW	R0, Offset(_STPS+100)(GP)
L_DualAxisStep105:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep290
NOP	
J	L_DualAxisStep106
NOP	
L__DualAxisStep290:
;Stepper.c,411 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,412 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,413 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,414 :: 		if(d2 < 0)d2 += 2*SV.dz;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep291
NOP	
J	L_DualAxisStep108
NOP	
L__DualAxisStep291:
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep109
NOP	
L_DualAxisStep108:
;Stepper.c,416 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,417 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,418 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,419 :: 		}
L_DualAxisStep109:
;Stepper.c,421 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep110:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep292
NOP	
J	L_DualAxisStep111
NOP	
L__DualAxisStep292:
J	L_DualAxisStep110
NOP	
L_DualAxisStep111:
;Stepper.c,410 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
LW	R2, Offset(_STPS+100)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+100)(GP)
;Stepper.c,422 :: 		}
J	L_DualAxisStep105
NOP	
L_DualAxisStep106:
;Stepper.c,423 :: 		}else{
J	L_DualAxisStep112
NOP	
L_DualAxisStep104:
;Stepper.c,424 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
SW	R0, Offset(_STPS+168)(GP)
L_DualAxisStep113:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep293
NOP	
J	L_DualAxisStep114
NOP	
L__DualAxisStep293:
;Stepper.c,425 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,426 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,427 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,428 :: 		if(d2 < 0)d2 += 2 * SV.dy;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep294
NOP	
J	L_DualAxisStep116
NOP	
L__DualAxisStep294:
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep117
NOP	
L_DualAxisStep116:
;Stepper.c,430 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,431 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,432 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,433 :: 		}
L_DualAxisStep117:
;Stepper.c,435 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep118:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep295
NOP	
J	L_DualAxisStep119
NOP	
L__DualAxisStep295:
J	L_DualAxisStep118
NOP	
L_DualAxisStep119:
;Stepper.c,424 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+168)(GP)
;Stepper.c,436 :: 		}
J	L_DualAxisStep113
NOP	
L_DualAxisStep114:
;Stepper.c,437 :: 		}
L_DualAxisStep112:
;Stepper.c,438 :: 		}
L_DualAxisStep103:
;Stepper.c,440 :: 		break;
J	L_DualAxisStep35
NOP	
;Stepper.c,441 :: 		default: break;
L_DualAxisStep120:
J	L_DualAxisStep35
NOP	
;Stepper.c,443 :: 		}
L_DualAxisStep34:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep297
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep297:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep299
NOP	
J	L_DualAxisStep64
NOP	
L__DualAxisStep299:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep301
NOP	
J	L_DualAxisStep92
NOP	
L__DualAxisStep301:
J	L_DualAxisStep120
NOP	
L_DualAxisStep35:
;Stepper.c,447 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Stepper.c,455 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _DualAxisStep
_Step_Cycle:
;Stepper.c,464 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,465 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,466 :: 		Pulse(axis_No);
JAL	_Pulse+0
NOP	
;Stepper.c,467 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_toggleOCx:
;Stepper.c,471 :: 		void toggleOCx(int axis_No){
;Stepper.c,472 :: 		switch(axis_No){
J	L_toggleOCx121
NOP	
;Stepper.c,473 :: 		case 0: OC3R   = 0x5;
L_toggleOCx123:
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,474 :: 		OC3RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,475 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,476 :: 		OC3CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,477 :: 		break;
J	L_toggleOCx122
NOP	
;Stepper.c,478 :: 		case 1: OC5R   = 0x5;
L_toggleOCx124:
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,479 :: 		OC5RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+76)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,480 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,481 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,482 :: 		break;
J	L_toggleOCx122
NOP	
;Stepper.c,483 :: 		case 2: OC8R   = 0x5;
L_toggleOCx125:
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,484 :: 		OC8RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+144)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,485 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,486 :: 		OC8CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,487 :: 		break;
J	L_toggleOCx122
NOP	
;Stepper.c,488 :: 		default:
L_toggleOCx126:
;Stepper.c,489 :: 		break;
J	L_toggleOCx122
NOP	
;Stepper.c,490 :: 		}
L_toggleOCx121:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx305
NOP	
J	L_toggleOCx123
NOP	
L__toggleOCx305:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx307
NOP	
J	L_toggleOCx124
NOP	
L__toggleOCx307:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx309
NOP	
J	L_toggleOCx125
NOP	
L__toggleOCx309:
J	L_toggleOCx126
NOP	
L_toggleOCx122:
;Stepper.c,492 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,496 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,498 :: 		if(!STPS[axis_No].PLS_Step_ ){
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Pulse311
NOP	
J	L_Pulse127
NOP	
L__Pulse311:
;Stepper.c,499 :: 		STPS[axis_No].PLS_Step_   = 1;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 2
SB	R2, 0(R3)
;Stepper.c,500 :: 		}
L_Pulse127:
;Stepper.c,502 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse128
NOP	
;Stepper.c,503 :: 		case STOP:
L_Pulse130:
;Stepper.c,504 :: 		LATE7_bit = 0;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,505 :: 		T8IE_bit         = 0;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Stepper.c,506 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,507 :: 		break;
J	L_Pulse129
NOP	
;Stepper.c,509 :: 		case ACCEL:
L_Pulse131:
;Stepper.c,510 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,515 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__Pulse312
NOP	
J	L_Pulse132
NOP	
L__Pulse312:
;Stepper.c,517 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,518 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,519 :: 		}
L_Pulse132:
;Stepper.c,520 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
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
BNE	R2, R0, L__Pulse313
NOP	
J	L_Pulse133
NOP	
L__Pulse313:
;Stepper.c,521 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,522 :: 		}
L_Pulse133:
;Stepper.c,523 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse314
NOP	
J	L_Pulse134
NOP	
L__Pulse314:
;Stepper.c,524 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,525 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,526 :: 		STPS[axis_No].run_state   = DECEL;
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
;Stepper.c,527 :: 		}
L_Pulse134:
;Stepper.c,528 :: 		break;
J	L_Pulse129
NOP	
;Stepper.c,530 :: 		case RUN:
L_Pulse135:
;Stepper.c,531 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,533 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse315
NOP	
J	L_Pulse136
NOP	
L__Pulse315:
;Stepper.c,534 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,535 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,537 :: 		STPS[axis_No].run_state   =  DECEL;
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
;Stepper.c,538 :: 		}
L_Pulse136:
;Stepper.c,539 :: 		break;
J	L_Pulse129
NOP	
;Stepper.c,541 :: 		case DECEL:
L_Pulse137:
;Stepper.c,544 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,545 :: 		if(STPS[axis_No].accel_count >= -2 ){
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SLTI	R2, R2, -2
BEQ	R2, R0, L__Pulse316
NOP	
J	L_Pulse138
NOP	
L__Pulse316:
;Stepper.c,546 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,547 :: 		}
L_Pulse138:
;Stepper.c,548 :: 		break;
J	L_Pulse129
NOP	
;Stepper.c,549 :: 		default:break;
L_Pulse139:
J	L_Pulse129
NOP	
;Stepper.c,550 :: 		}
L_Pulse128:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse318
NOP	
J	L_Pulse130
NOP	
L__Pulse318:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse320
NOP	
J	L_Pulse131
NOP	
L__Pulse320:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse322
NOP	
J	L_Pulse135
NOP	
L__Pulse322:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse324
NOP	
J	L_Pulse137
NOP	
L__Pulse324:
J	L_Pulse139
NOP	
L_Pulse129:
;Stepper.c,551 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,552 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,556 :: 		void AccDec(int axis_No){
;Stepper.c,557 :: 		STPS[axis_No].accel_count++;
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
;Stepper.c,558 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
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
;Stepper.c,559 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
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
;Stepper.c,560 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
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
;Stepper.c,562 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_StepX:
;Stepper.c,566 :: 		void StepX() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,569 :: 		STPS[X].step_count++;
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R3, R2, 1
SW	R3, Offset(_STPS+32)(GP)
;Stepper.c,570 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,571 :: 		if(STPS[X].step_count >= STPS[X].dist){
LW	R2, Offset(_STPS+36)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__StepX327
NOP	
J	L_StepX140
NOP	
L__StepX327:
;Stepper.c,572 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,573 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,574 :: 		}
J	L_StepX141
NOP	
L_StepX140:
;Stepper.c,576 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
L_StepX141:
;Stepper.c,578 :: 		}
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
_StepY:
;Stepper.c,579 :: 		void StepY() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,582 :: 		STPS[Y].step_count++;
LW	R2, Offset(_STPS+100)(GP)
ADDIU	R3, R2, 1
SW	R3, Offset(_STPS+100)(GP)
;Stepper.c,583 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,584 :: 		if(STPS[Y].step_count >= STPS[Y].dist){
LW	R2, Offset(_STPS+104)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__StepY329
NOP	
J	L_StepY142
NOP	
L__StepY329:
;Stepper.c,585 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,586 :: 		}
J	L_StepY143
NOP	
L_StepY142:
;Stepper.c,588 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
L_StepY143:
;Stepper.c,590 :: 		}
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
_StepZ:
;Stepper.c,591 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_8 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,594 :: 		STPS[Z].step_count++;
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R3, R2, 1
SW	R3, Offset(_STPS+168)(GP)
;Stepper.c,595 :: 		OC8IF_bit = 0;
LUI	R2, BitMask(OC8IF_bit+0)
ORI	R2, R2, BitMask(OC8IF_bit+0)
_SX	
;Stepper.c,596 :: 		if(STPS[Z].step_count >= STPS[Z].dist){
LW	R2, Offset(_STPS+172)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__StepZ331
NOP	
J	L_StepZ144
NOP	
L__StepZ331:
;Stepper.c,597 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+4)(GP)
;Stepper.c,598 :: 		}
J	L_StepZ145
NOP	
L_StepZ144:
;Stepper.c,600 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
L_StepZ145:
;Stepper.c,602 :: 		}
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
_disableOCx:
;Stepper.c,607 :: 		void disableOCx(){
;Stepper.c,608 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,609 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,610 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,611 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_min_:
;Stepper.c,623 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,624 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_334
NOP	
J	L_min_146
NOP	
L__min_334:
;Stepper.c,625 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,626 :: 		}
L_min_146:
;Stepper.c,628 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,630 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
Stepper_sqrt_:
;Stepper.c,640 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,646 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,647 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,648 :: 		do
J	L_Stepper_sqrt_148
NOP	
L_Stepper_sqrt_198:
;Stepper.c,662 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,648 :: 		do
L_Stepper_sqrt_148:
;Stepper.c,650 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_336
NOP	
J	L_Stepper_sqrt_151
NOP	
L_Stepper_sqrt_336:
;Stepper.c,652 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,653 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,654 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_152
NOP	
L_Stepper_sqrt_151:
;Stepper.c,656 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,657 :: 		}
L_Stepper_sqrt_152:
;Stepper.c,658 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,659 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_338
NOP	
J	L_Stepper_sqrt_199
NOP	
L_Stepper_sqrt_338:
; f end address is: 16 (R4)
;Stepper.c,660 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,661 :: 		}
J	L_Stepper_sqrt_153
NOP	
L_Stepper_sqrt_199:
;Stepper.c,659 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,661 :: 		}
L_Stepper_sqrt_153:
;Stepper.c,662 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_339
NOP	
J	L_Stepper_sqrt_198
NOP	
L_Stepper_sqrt_339:
; q2 end address is: 12 (R3)
;Stepper.c,663 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_340
NOP	
J	L_Stepper_sqrt_154
NOP	
L_Stepper_sqrt_340:
;Stepper.c,664 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,665 :: 		}
L_Stepper_sqrt_154:
;Stepper.c,667 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,669 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_CalcRadius:
;Stepper.c,672 :: 		void CalcRadius(Circle* cir){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,675 :: 		cir->xRad = fabs(cir->xStart + cir->I);
ADDIU	R2, R25, 48
SW	R2, 12(SP)
ADDIU	R2, R25, 56
LWC1	S1, 0(R2)
ADDIU	R2, R25, 28
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_fabs+0
NOP	
LW	R2, 12(SP)
SWC1	S0, 0(R2)
;Stepper.c,676 :: 		cir->yRad = fabs(cir->yStart + cir->J);
ADDIU	R2, R25, 52
SW	R2, 12(SP)
ADDIU	R2, R25, 60
LWC1	S1, 0(R2)
ADDIU	R2, R25, 32
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_fabs+0
NOP	
LW	R2, 12(SP)
SWC1	S0, 0(R2)
;Stepper.c,677 :: 		cir->radius = sqrt((cir->xRad*cir->xRad) + (cir->yRad*cir->yRad));
ADDIU	R2, R25, 40
SW	R2, 12(SP)
ADDIU	R2, R25, 48
LWC1	S0, 0(R2)
MUL.S 	S1, S0, S0
ADDIU	R2, R25, 52
LWC1	S0, 0(R2)
MUL.S 	S0, S0, S0
ADD.S 	S0, S1, S0
SW	R25, 4(SP)
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
LW	R25, 4(SP)
LW	R2, 12(SP)
SWC1	S0, 0(R2)
;Stepper.c,678 :: 		angA = atan2(cir->yRad,cir->xRad);
ADDIU	R2, R25, 48
LWC1	S1, 0(R2)
ADDIU	R2, R25, 52
LWC1	S0, 0(R2)
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
;Stepper.c,681 :: 		cir->degreeDeg = angA * rad2deg;
ADDIU	R3, R25, 4
LUI	R2, 16997
ORI	R2, R2, 12013
MTC1	R2, S1
MUL.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Stepper.c,683 :: 		cir->quadrant_start = QuadrantStart(cir->I,cir->J);
ADDIU	R2, R25, 46
SW	R2, 12(SP)
ADDIU	R2, R25, 32
LWC1	S1, 0(R2)
ADDIU	R2, R25, 28
LWC1	S0, 0(R2)
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_QuadrantStart+0
NOP	
LW	R3, 12(SP)
SH	R2, 0(R3)
;Stepper.c,685 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius343
NOP	
J	L__CalcRadius218
NOP	
L__CalcRadius343:
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius345
NOP	
J	L__CalcRadius217
NOP	
L__CalcRadius345:
J	L_CalcRadius158
NOP	
L__CalcRadius218:
L__CalcRadius217:
;Stepper.c,686 :: 		angB = cir->deg - cir->degreeDeg;
LWC1	S1, 0(R25)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius158:
;Stepper.c,687 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius347
NOP	
J	L__CalcRadius220
NOP	
L__CalcRadius347:
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius349
NOP	
J	L__CalcRadius219
NOP	
L__CalcRadius349:
J	L_CalcRadius161
NOP	
L__CalcRadius220:
L__CalcRadius219:
;Stepper.c,688 :: 		angB = cir->deg + cir->degreeDeg;
LWC1	S1, 0(R25)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius161:
;Stepper.c,690 :: 		cir->degreeRadians = angB * deg2rad;
ADDIU	R3, R25, 8
LWC1	S1, 8(SP)
LUI	R2, 15502
ORI	R2, R2, 64046
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, 0(R3)
;Stepper.c,691 :: 		}
L_end_CalcRadius:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _CalcRadius
_QuadrantStart:
;Stepper.c,693 :: 		int QuadrantStart(float i,float j){
;Stepper.c,694 :: 		if((i <= 0)&&(j >= 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__QuadrantStart351
NOP	
J	L__QuadrantStart208
NOP	
L__QuadrantStart351:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S13, S0
BC1F	0, L__QuadrantStart352
NOP	
J	L__QuadrantStart207
NOP	
L__QuadrantStart352:
L__QuadrantStart206:
;Stepper.c,695 :: 		return 1;
ORI	R2, R0, 1
J	L_end_QuadrantStart
NOP	
;Stepper.c,694 :: 		if((i <= 0)&&(j >= 0))
L__QuadrantStart208:
L__QuadrantStart207:
;Stepper.c,696 :: 		else if((i > 0)&&(j > 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart353
NOP	
J	L__QuadrantStart210
NOP	
L__QuadrantStart353:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S13, S0
BC1F	0, L__QuadrantStart354
NOP	
J	L__QuadrantStart209
NOP	
L__QuadrantStart354:
L__QuadrantStart205:
;Stepper.c,697 :: 		return 2;
ORI	R2, R0, 2
J	L_end_QuadrantStart
NOP	
;Stepper.c,696 :: 		else if((i > 0)&&(j > 0))
L__QuadrantStart210:
L__QuadrantStart209:
;Stepper.c,698 :: 		else if((i > 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart355
NOP	
J	L__QuadrantStart212
NOP	
L__QuadrantStart355:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart356
NOP	
J	L__QuadrantStart211
NOP	
L__QuadrantStart356:
L__QuadrantStart204:
;Stepper.c,699 :: 		return 3;
ORI	R2, R0, 3
J	L_end_QuadrantStart
NOP	
;Stepper.c,698 :: 		else if((i > 0)&&(j < 0))
L__QuadrantStart212:
L__QuadrantStart211:
;Stepper.c,700 :: 		else if((i < 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__QuadrantStart357
NOP	
J	L__QuadrantStart214
NOP	
L__QuadrantStart357:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart358
NOP	
J	L__QuadrantStart213
NOP	
L__QuadrantStart358:
L__QuadrantStart203:
;Stepper.c,701 :: 		return 4;
ORI	R2, R0, 4
J	L_end_QuadrantStart
NOP	
;Stepper.c,700 :: 		else if((i < 0)&&(j < 0))
L__QuadrantStart214:
L__QuadrantStart213:
;Stepper.c,703 :: 		return 0;
MOVZ	R2, R0, R0
;Stepper.c,704 :: 		}
L_end_QuadrantStart:
JR	RA
NOP	
; end of _QuadrantStart
_CircDir:
;Stepper.c,706 :: 		void CircDir(Circle* cir){
;Stepper.c,708 :: 		if(cir->dir == CW){
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__CircDir360
NOP	
J	L_CircDir178
NOP	
L__CircDir360:
;Stepper.c,709 :: 		newDeg = 360 / cir->deg;
LWC1	S1, 0(R25)
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S2, S0, S1
; newDeg start address is: 24 (R6)
MOV.S 	S3, S2
;Stepper.c,710 :: 		cir->N = (2*Pi*cir->radius)/newDeg;
ADDIU	R3, R25, 36
ADDIU	R2, R25, 40
LWC1	S1, 0(R2)
LUI	R2, 16585
ORI	R2, R2, 4048
MTC1	R2, S0
MUL.S 	S0, S0, S1
DIV.S 	S0, S0, S2
SWC1	S0, 0(R3)
;Stepper.c,711 :: 		cir->divisor = cir->deg / newDeg;
ADDIU	R2, R25, 20
LWC1	S0, 0(R25)
DIV.S 	S0, S0, S3
; newDeg end address is: 24 (R6)
SWC1	S0, 0(R2)
;Stepper.c,712 :: 		}
L_CircDir178:
;Stepper.c,714 :: 		if(cir->dir == CW)
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__CircDir361
NOP	
J	L_CircDir179
NOP	
L__CircDir361:
;Stepper.c,715 :: 		cir->deg = 0.00;
SW	R0, 0(R25)
L_CircDir179:
;Stepper.c,716 :: 		if(cir->dir == CCW)
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__CircDir362
NOP	
J	L_CircDir180
NOP	
L__CircDir362:
;Stepper.c,717 :: 		cir->deg = 360.00;
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
SWC1	S0, 0(R25)
L_CircDir180:
;Stepper.c,718 :: 		}
L_end_CircDir:
JR	RA
NOP	
; end of _CircDir
_Cir_Interpolation:
;Stepper.c,720 :: 		void Cir_Interpolation(float xPresent,float yPresent,Circle* cir){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,722 :: 		cir->xStart = xPresent;
ADDIU	R2, R25, 56
SWC1	S12, 0(R2)
;Stepper.c,723 :: 		cir->yStart = yPresent;
ADDIU	R2, R25, 60
SWC1	S13, 0(R2)
;Stepper.c,724 :: 		CalcRadius(cir);
JAL	_CalcRadius+0
NOP	
;Stepper.c,727 :: 		while(quad){
LH	R2, Offset(Cir_Interpolation_quad_L0+0)(GP)
BNE	R2, R0, L__Cir_Interpolation365
NOP	
J	L_Cir_Interpolation182
NOP	
L__Cir_Interpolation365:
;Stepper.c,738 :: 		}
L_Cir_Interpolation182:
;Stepper.c,739 :: 		}
L_end_Cir_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Cir_Interpolation
_CycleStop:
;Stepper.c,763 :: 		void CycleStop(){
;Stepper.c,765 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,766 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop189:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 3
BNE	R2, R0, L__CycleStop367
NOP	
J	L_CycleStop190
NOP	
L__CycleStop367:
;Stepper.c,767 :: 		STPS[ii].microSec = 0;
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,768 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 4
BEQ	R2, R0, L__CycleStop368
NOP	
J	L_CycleStop192
NOP	
L__CycleStop368:
; ii end address is: 16 (R4)
J	L_CycleStop190
NOP	
L_CycleStop192:
;Stepper.c,766 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,769 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop189
NOP	
L_CycleStop190:
;Stepper.c,770 :: 		}
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
;Stepper.c,772 :: 		void CycleStart(){
;Stepper.c,775 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__CycleStart370
NOP	
J	L_CycleStart193
NOP	
L__CycleStart370:
;Stepper.c,776 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart194:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 3
BNE	R2, R0, L__CycleStart371
NOP	
J	L_CycleStart195
NOP	
L__CycleStart371:
;Stepper.c,777 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 4
BEQ	R2, R0, L__CycleStart372
NOP	
J	L_CycleStart197
NOP	
L__CycleStart372:
; ii end address is: 16 (R4)
J	L_CycleStart195
NOP	
L_CycleStart197:
;Stepper.c,778 :: 		STPS[ii].microSec++;
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
;Stepper.c,776 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,779 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart194
NOP	
L_CycleStart195:
;Stepper.c,780 :: 		}
L_CycleStart193:
;Stepper.c,781 :: 		}
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
