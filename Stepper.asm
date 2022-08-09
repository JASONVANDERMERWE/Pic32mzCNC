_SetPinMode:
;Stepper.c,65 :: 		void SetPinMode(){
;Stepper.c,68 :: 		EN_Step_PinDirX  = 0; //output
LUI	R2, BitMask(TRISG1_bit+0)
ORI	R2, R2, BitMask(TRISG1_bit+0)
_SX	
_LX	
EXT	R2, R2, BitPos(TRISG1_bit+0), 1
SB	R2, Offset(_AxisNo+0)(GP)
;Stepper.c,71 :: 		PLS_Step_PinDirX = 0;
LUI	R2, BitMask(TRISF1_bit+0)
ORI	R2, R2, BitMask(TRISF1_bit+0)
_SX	
;Stepper.c,72 :: 		DIR_Step_PinDirX = 0;
LUI	R2, BitMask(TRISG0_bit+0)
ORI	R2, R2, BitMask(TRISG0_bit+0)
_SX	
;Stepper.c,74 :: 		EN_Step_PinDirY  = 0; //output
LUI	R2, BitMask(TRISF0_bit+0)
ORI	R2, R2, BitMask(TRISF0_bit+0)
_SX	
;Stepper.c,77 :: 		PLS_Step_PinDirY = 0;
LUI	R2, BitMask(TRISD4_bit+0)
ORI	R2, R2, BitMask(TRISD4_bit+0)
_SX	
;Stepper.c,78 :: 		DIR_Step_PinDirY = 0;
LUI	R2, BitMask(TRISD5_bit+0)
ORI	R2, R2, BitMask(TRISD5_bit+0)
_SX	
;Stepper.c,80 :: 		EN_Step_PinDirZ  = 0; //output
LUI	R2, BitMask(TRISG14_bit+0)
ORI	R2, R2, BitMask(TRISG14_bit+0)
_SX	
;Stepper.c,83 :: 		PLS_Step_PinDirZ = 0;
LUI	R2, BitMask(TRISE3_bit+0)
ORI	R2, R2, BitMask(TRISE3_bit+0)
_SX	
;Stepper.c,84 :: 		DIR_Step_PinDirZ = 0;
LUI	R2, BitMask(TRISG12_bit+0)
ORI	R2, R2, BitMask(TRISG12_bit+0)
_SX	
;Stepper.c,86 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_StepperConstants:
;Stepper.c,90 :: 		void StepperConstants(long accel,long decel){
;Stepper.c,91 :: 		SV.acc = accel;
SW	R25, Offset(_SV+48)(GP)
;Stepper.c,92 :: 		SV.dec = decel;
SW	R26, Offset(_SV+52)(GP)
;Stepper.c,93 :: 		}
L_end_StepperConstants:
JR	RA
NOP	
; end of _StepperConstants
_EnStepperX:
;Stepper.c,97 :: 		void EnStepperX(){
;Stepper.c,100 :: 		EN_StepX       = 0;
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
;Stepper.c,101 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,103 :: 		void EnStepperY(){
;Stepper.c,106 :: 		EN_StepY       = 0;
LUI	R2, BitMask(LATF0_bit+0)
ORI	R2, R2, BitMask(LATF0_bit+0)
_SX	
;Stepper.c,107 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,108 :: 		void EnStepperZ(){
;Stepper.c,111 :: 		EN_StepZ       = 0;
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;Stepper.c,112 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_DisableStepper:
;Stepper.c,114 :: 		void DisableStepper(){
;Stepper.c,115 :: 		EN_StepX      = 1;
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
;Stepper.c,116 :: 		EN_StepY      = 1;
LUI	R2, BitMask(LATF0_bit+0)
ORI	R2, R2, BitMask(LATF0_bit+0)
_SX	
;Stepper.c,117 :: 		EN_StepZ      = 1;
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;Stepper.c,118 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_speed_cntr_Move:
;Stepper.c,136 :: 		void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,139 :: 		if(mmSteps == 1){
SW	R25, 4(SP)
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move223
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move223:
;Stepper.c,141 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
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
;Stepper.c,142 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
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
;Stepper.c,143 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
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
;Stepper.c,144 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,146 :: 		}
J	L_speed_cntr_Move1
NOP	
L_speed_cntr_Move0:
;Stepper.c,148 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
BNE	R25, R0, L__speed_cntr_Move225
NOP	
J	L__speed_cntr_Move197
NOP	
L__speed_cntr_Move225:
JAL	_abs+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__speed_cntr_Move227
NOP	
J	L__speed_cntr_Move196
NOP	
L__speed_cntr_Move227:
L__speed_cntr_Move195:
;Stepper.c,152 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
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
;Stepper.c,157 :: 		STPS[axis_No].step_delay = abs((T1_FREQ_148 * sqrt_(A_SQ / SV.acc))/100);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 8
SW	R2, 12(SP)
LW	R3, Offset(_SV+48)(GP)
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
;Stepper.c,158 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
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
;Stepper.c,163 :: 		STPS[axis_No].max_step_lim = (speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 52
MUL	R3, R26, R26
LWC1	S0, Offset(_SV+48)(GP)
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
;Stepper.c,168 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move228
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move228:
;Stepper.c,169 :: 		STPS[axis_No].max_step_lim = 1;
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
;Stepper.c,170 :: 		}
L_speed_cntr_Move5:
;Stepper.c,174 :: 		STPS[axis_No].accel_lim = (abs(mmSteps) * SV.dec) / (SV.acc + SV.dec);
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
LW	R3, Offset(_SV+52)(GP)
SEH	R2, R2
MUL	R4, R2, R3
LW	R3, Offset(_SV+52)(GP)
LW	R2, Offset(_SV+48)(GP)
ADDU	R2, R2, R3
DIV	R4, R2
MFLO	R3
LW	R2, 12(SP)
SW	R3, 0(R2)
;Stepper.c,177 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move229
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move229:
;Stepper.c,178 :: 		STPS[axis_No].accel_lim = 1;
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
;Stepper.c,179 :: 		}
L_speed_cntr_Move6:
;Stepper.c,182 :: 		if(STPS[axis_No].accel_lim <= STPS[axis_No].max_step_lim){
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
BEQ	R2, R0, L__speed_cntr_Move230
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move230:
;Stepper.c,183 :: 		if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move231
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move231:
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
;Stepper.c,184 :: 		else STPS[axis_No].decel_val = mmSteps + STPS[axis_No].accel_lim;
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
;Stepper.c,185 :: 		}else{
J	L_speed_cntr_Move10
NOP	
L_speed_cntr_Move7:
;Stepper.c,186 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * SV.acc) / SV.dec);
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
LW	R2, Offset(_SV+48)(GP)
MUL	R3, R3, R2
LW	R2, Offset(_SV+52)(GP)
DIV	R3, R2
MFLO	R3
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R4)
;Stepper.c,187 :: 		}
L_speed_cntr_Move10:
;Stepper.c,189 :: 		if(mmSteps >= 0){
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move232
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move232:
;Stepper.c,190 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
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
BNE	R2, R0, L__speed_cntr_Move233
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move233:
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
;Stepper.c,191 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
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
;Stepper.c,192 :: 		}
J	L_speed_cntr_Move14
NOP	
L_speed_cntr_Move11:
;Stepper.c,194 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = abs(mmSteps) * STPS[axis_No].decel_val;
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
BNE	R2, R0, L__speed_cntr_Move234
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move234:
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
;Stepper.c,195 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
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
;Stepper.c,196 :: 		}
L_speed_cntr_Move14:
;Stepper.c,198 :: 		if(STPS[axis_No].decel_val == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move235
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move235:
;Stepper.c,199 :: 		STPS[axis_No].decel_val = -1;
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
;Stepper.c,200 :: 		}
L_speed_cntr_Move17:
;Stepper.c,203 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__speed_cntr_Move236
NOP	
J	L_speed_cntr_Move18
NOP	
L__speed_cntr_Move236:
;Stepper.c,204 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,205 :: 		STPS[axis_No].run_state = RUN;
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
;Stepper.c,206 :: 		}else{
J	L_speed_cntr_Move19
NOP	
L_speed_cntr_Move18:
;Stepper.c,207 :: 		STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
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
;Stepper.c,208 :: 		STPS[axis_No].run_state = ACCEL;
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
;Stepper.c,209 :: 		}
L_speed_cntr_Move19:
;Stepper.c,148 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
L__speed_cntr_Move197:
L__speed_cntr_Move196:
;Stepper.c,211 :: 		}
L_speed_cntr_Move1:
;Stepper.c,212 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,213 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,214 :: 		STPS[axis_No].microSec    = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,215 :: 		STPS[axis_No].accel_count = 1;
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
;Stepper.c,216 :: 		STPS[axis_No].dist        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R0, 0(R2)
;Stepper.c,217 :: 		SV.Tog   = 0;
SH	R0, Offset(_SV+2)(GP)
;Stepper.c,221 :: 		SV.running = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,222 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_SingleAxisStep:
;Stepper.c,230 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,236 :: 		SV.Single_Dual = 0;
SW	R25, 4(SP)
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,237 :: 		switch(axis_No){
J	L_SingleAxisStep20
NOP	
;Stepper.c,238 :: 		case 0:OC3IE_bit = 1;OC3CONbits.ON = 1;
L_SingleAxisStep22:
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,241 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,242 :: 		case 1://OC3IE_bit = 0;OC3CONbits.ON = 0;
L_SingleAxisStep23:
;Stepper.c,243 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,245 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,246 :: 		case 2://OC3IE_bit = 0;OC3CONbits.ON = 0;
L_SingleAxisStep24:
;Stepper.c,248 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,249 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,250 :: 		default: break;
L_SingleAxisStep25:
J	L_SingleAxisStep21
NOP	
;Stepper.c,251 :: 		}
L_SingleAxisStep20:
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep239
NOP	
J	L_SingleAxisStep22
NOP	
L__SingleAxisStep239:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep241
NOP	
J	L_SingleAxisStep23
NOP	
L__SingleAxisStep241:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep243
NOP	
J	L_SingleAxisStep24
NOP	
L__SingleAxisStep243:
J	L_SingleAxisStep25
NOP	
L_SingleAxisStep21:
;Stepper.c,252 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+40)(GP)
;Stepper.c,253 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R25, 0(R2)
;Stepper.c,254 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
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
;Stepper.c,256 :: 		if(newxyz < 0)
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep244
NOP	
J	L_SingleAxisStep26
NOP	
L__SingleAxisStep244:
;Stepper.c,257 :: 		dir = CCW;
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep27
NOP	
L_SingleAxisStep26:
;Stepper.c,259 :: 		dir = CW;
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep27:
;Stepper.c,261 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep28
NOP	
;Stepper.c,262 :: 		case X:
L_SingleAxisStep30:
;Stepper.c,263 :: 		DIR_StepX = dir;
_LX	
INS	R2, R4, BitPos(LATG0_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,264 :: 		break;
J	L_SingleAxisStep29
NOP	
;Stepper.c,265 :: 		case Y:
L_SingleAxisStep31:
;Stepper.c,266 :: 		DIR_StepY = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(LATD5_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,267 :: 		break;
J	L_SingleAxisStep29
NOP	
;Stepper.c,268 :: 		case Z:
L_SingleAxisStep32:
;Stepper.c,269 :: 		DIR_StepZ = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(LATG12_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,270 :: 		break;
J	L_SingleAxisStep29
NOP	
;Stepper.c,271 :: 		default: break;
L_SingleAxisStep33:
J	L_SingleAxisStep29
NOP	
;Stepper.c,272 :: 		}
L_SingleAxisStep28:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep246
NOP	
J	L_SingleAxisStep30
NOP	
L__SingleAxisStep246:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep248
NOP	
J	L_SingleAxisStep31
NOP	
L__SingleAxisStep248:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep250
NOP	
J	L_SingleAxisStep32
NOP	
L__SingleAxisStep250:
; dir end address is: 16 (R4)
J	L_SingleAxisStep33
NOP	
L_SingleAxisStep29:
;Stepper.c,274 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,276 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Stepper.c,278 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Stepper.c,283 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,286 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+44)(GP)
;Stepper.c,287 :: 		d2 = 0;
SW	R0, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,289 :: 		SV.px = 0;
SW	R0, Offset(_SV+28)(GP)
;Stepper.c,290 :: 		SV.py = 0;
SW	R0, Offset(_SV+32)(GP)
;Stepper.c,291 :: 		SV.pz = 0;
SW	R0, Offset(_SV+36)(GP)
;Stepper.c,295 :: 		SV.Single_Dual = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,296 :: 		switch(axis_combo){
J	L_DualAxisStep34
NOP	
;Stepper.c,297 :: 		case xy:
L_DualAxisStep36:
;Stepper.c,298 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,299 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,300 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,302 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,303 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,306 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep252
NOP	
J	L_DualAxisStep37
NOP	
L__DualAxisStep252:
; ?FLOC___DualAxisStep?T388 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T388 end address is: 12 (R3)
J	L_DualAxisStep38
NOP	
L_DualAxisStep37:
; ?FLOC___DualAxisStep?T388 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T388 end address is: 12 (R3)
L_DualAxisStep38:
; ?FLOC___DualAxisStep?T388 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T388 end address is: 12 (R3)
SH	R2, Offset(_SV+56)(GP)
;Stepper.c,307 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep253
NOP	
J	L_DualAxisStep39
NOP	
L__DualAxisStep253:
; ?FLOC___DualAxisStep?T390 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T390 end address is: 12 (R3)
J	L_DualAxisStep40
NOP	
L_DualAxisStep39:
; ?FLOC___DualAxisStep?T390 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T390 end address is: 12 (R3)
L_DualAxisStep40:
; ?FLOC___DualAxisStep?T390 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T390 end address is: 12 (R3)
SH	R2, Offset(_SV+58)(GP)
;Stepper.c,310 :: 		if(SV.dirx < 0)
LH	R2, Offset(_SV+56)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep254
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep254:
;Stepper.c,311 :: 		DIR_StepX = CCW;
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
J	L_DualAxisStep42
NOP	
L_DualAxisStep41:
;Stepper.c,313 :: 		DIR_StepX = CW;
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
L_DualAxisStep42:
;Stepper.c,315 :: 		if(SV.diry < 0)
LH	R2, Offset(_SV+58)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep255
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep255:
;Stepper.c,316 :: 		DIR_StepY = CCW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_DualAxisStep44
NOP	
L_DualAxisStep43:
;Stepper.c,318 :: 		DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_DualAxisStep44:
;Stepper.c,320 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,321 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,323 :: 		if(SV.dx > SV.dy)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep256
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep256:
;Stepper.c,324 :: 		SV.d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep46
NOP	
L_DualAxisStep45:
;Stepper.c,326 :: 		SV.d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep46:
;Stepper.c,329 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Stepper.c,330 :: 		XY_Interpolate();
JAL	_XY_Interpolate+0
NOP	
;Stepper.c,332 :: 		break;
J	L_DualAxisStep35
NOP	
;Stepper.c,333 :: 		case xz:
L_DualAxisStep47:
;Stepper.c,334 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,335 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,336 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+8)(GP)
;Stepper.c,337 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,338 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,340 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep257
NOP	
J	L_DualAxisStep48
NOP	
L__DualAxisStep257:
; ?FLOC___DualAxisStep?T408 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T408 end address is: 12 (R3)
J	L_DualAxisStep49
NOP	
L_DualAxisStep48:
; ?FLOC___DualAxisStep?T408 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T408 end address is: 12 (R3)
L_DualAxisStep49:
; ?FLOC___DualAxisStep?T408 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T408 end address is: 12 (R3)
SH	R2, Offset(_SV+56)(GP)
;Stepper.c,341 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep258
NOP	
J	L_DualAxisStep50
NOP	
L__DualAxisStep258:
; ?FLOC___DualAxisStep?T410 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T410 end address is: 12 (R3)
J	L_DualAxisStep51
NOP	
L_DualAxisStep50:
; ?FLOC___DualAxisStep?T410 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T410 end address is: 12 (R3)
L_DualAxisStep51:
; ?FLOC___DualAxisStep?T410 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T410 end address is: 12 (R3)
SH	R2, Offset(_SV+60)(GP)
;Stepper.c,343 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+56)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep259
NOP	
J	L_DualAxisStep52
NOP	
L__DualAxisStep259:
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
J	L_DualAxisStep53
NOP	
L_DualAxisStep52:
;Stepper.c,344 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
L_DualAxisStep53:
;Stepper.c,345 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+60)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep260
NOP	
J	L_DualAxisStep54
NOP	
L__DualAxisStep260:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_DualAxisStep55
NOP	
L_DualAxisStep54:
;Stepper.c,346 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_DualAxisStep55:
;Stepper.c,347 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,348 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,350 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep261
NOP	
J	L_DualAxisStep56
NOP	
L__DualAxisStep261:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep57
NOP	
L_DualAxisStep56:
;Stepper.c,351 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
L_DualAxisStep57:
;Stepper.c,352 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep262
NOP	
J	L_DualAxisStep58
NOP	
L__DualAxisStep262:
;Stepper.c,353 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,354 :: 		if(SV.dx > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep263
NOP	
J	L_DualAxisStep59
NOP	
L__DualAxisStep263:
;Stepper.c,355 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
SW	R0, Offset(_STPS+32)(GP)
L_DualAxisStep60:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep264
NOP	
J	L_DualAxisStep61
NOP	
L__DualAxisStep264:
;Stepper.c,356 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,357 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,358 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,359 :: 		if(d2 < 0)d2 += 2*SV.dz;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep265
NOP	
J	L_DualAxisStep63
NOP	
L__DualAxisStep265:
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep64
NOP	
L_DualAxisStep63:
;Stepper.c,361 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,362 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,363 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,364 :: 		}
L_DualAxisStep64:
;Stepper.c,366 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep65:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep266
NOP	
J	L_DualAxisStep66
NOP	
L__DualAxisStep266:
J	L_DualAxisStep65
NOP	
L_DualAxisStep66:
;Stepper.c,355 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,367 :: 		}
J	L_DualAxisStep60
NOP	
L_DualAxisStep61:
;Stepper.c,368 :: 		}else{
J	L_DualAxisStep67
NOP	
L_DualAxisStep59:
;Stepper.c,369 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
SW	R0, Offset(_STPS+168)(GP)
L_DualAxisStep68:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep267
NOP	
J	L_DualAxisStep69
NOP	
L__DualAxisStep267:
;Stepper.c,370 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,371 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,372 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,373 :: 		if(d2 < 0)d2 += 2 * SV.dx;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep268
NOP	
J	L_DualAxisStep71
NOP	
L__DualAxisStep268:
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep72
NOP	
L_DualAxisStep71:
;Stepper.c,375 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,376 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,377 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,378 :: 		}
L_DualAxisStep72:
;Stepper.c,380 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep73:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep269
NOP	
J	L_DualAxisStep74
NOP	
L__DualAxisStep269:
J	L_DualAxisStep73
NOP	
L_DualAxisStep74:
;Stepper.c,369 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+168)(GP)
;Stepper.c,381 :: 		}
J	L_DualAxisStep68
NOP	
L_DualAxisStep69:
;Stepper.c,382 :: 		}
L_DualAxisStep67:
;Stepper.c,383 :: 		}
L_DualAxisStep58:
;Stepper.c,384 :: 		break;
J	L_DualAxisStep35
NOP	
;Stepper.c,385 :: 		case yz:
L_DualAxisStep75:
;Stepper.c,386 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,387 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,388 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+8)(GP)
;Stepper.c,389 :: 		SV.dy   = newx - SV.pz;           // distance to move (delta)
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,390 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,392 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep270
NOP	
J	L_DualAxisStep76
NOP	
L__DualAxisStep270:
; ?FLOC___DualAxisStep?T453 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T453 end address is: 12 (R3)
J	L_DualAxisStep77
NOP	
L_DualAxisStep76:
; ?FLOC___DualAxisStep?T453 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T453 end address is: 12 (R3)
L_DualAxisStep77:
; ?FLOC___DualAxisStep?T453 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T453 end address is: 12 (R3)
SH	R2, Offset(_SV+58)(GP)
;Stepper.c,393 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep271
NOP	
J	L_DualAxisStep78
NOP	
L__DualAxisStep271:
; ?FLOC___DualAxisStep?T455 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T455 end address is: 12 (R3)
J	L_DualAxisStep79
NOP	
L_DualAxisStep78:
; ?FLOC___DualAxisStep?T455 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T455 end address is: 12 (R3)
L_DualAxisStep79:
; ?FLOC___DualAxisStep?T455 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T455 end address is: 12 (R3)
SH	R2, Offset(_SV+60)(GP)
;Stepper.c,395 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+58)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep272
NOP	
J	L_DualAxisStep80
NOP	
L__DualAxisStep272:
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_DualAxisStep81
NOP	
L_DualAxisStep80:
;Stepper.c,396 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_DualAxisStep81:
;Stepper.c,397 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+60)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep273
NOP	
J	L_DualAxisStep82
NOP	
L__DualAxisStep273:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_DualAxisStep83
NOP	
L_DualAxisStep82:
;Stepper.c,398 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_DualAxisStep83:
;Stepper.c,399 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,400 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,402 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep274
NOP	
J	L_DualAxisStep84
NOP	
L__DualAxisStep274:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep85
NOP	
L_DualAxisStep84:
;Stepper.c,403 :: 		else d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
L_DualAxisStep85:
;Stepper.c,404 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep275
NOP	
J	L_DualAxisStep86
NOP	
L__DualAxisStep275:
;Stepper.c,405 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,406 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep276
NOP	
J	L_DualAxisStep87
NOP	
L__DualAxisStep276:
;Stepper.c,407 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
SW	R0, Offset(_STPS+100)(GP)
L_DualAxisStep88:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep277
NOP	
J	L_DualAxisStep89
NOP	
L__DualAxisStep277:
;Stepper.c,408 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,409 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,410 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,411 :: 		if(d2 < 0)d2 += 2*SV.dz;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep278
NOP	
J	L_DualAxisStep91
NOP	
L__DualAxisStep278:
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep92
NOP	
L_DualAxisStep91:
;Stepper.c,413 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,414 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,415 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,416 :: 		}
L_DualAxisStep92:
;Stepper.c,418 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep93:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep279
NOP	
J	L_DualAxisStep94
NOP	
L__DualAxisStep279:
J	L_DualAxisStep93
NOP	
L_DualAxisStep94:
;Stepper.c,407 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
LW	R2, Offset(_STPS+100)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+100)(GP)
;Stepper.c,419 :: 		}
J	L_DualAxisStep88
NOP	
L_DualAxisStep89:
;Stepper.c,420 :: 		}else{
J	L_DualAxisStep95
NOP	
L_DualAxisStep87:
;Stepper.c,421 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
SW	R0, Offset(_STPS+168)(GP)
L_DualAxisStep96:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep280
NOP	
J	L_DualAxisStep97
NOP	
L__DualAxisStep280:
;Stepper.c,422 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,423 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,424 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,425 :: 		if(d2 < 0)d2 += 2 * SV.dy;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep281
NOP	
J	L_DualAxisStep99
NOP	
L__DualAxisStep281:
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep100
NOP	
L_DualAxisStep99:
;Stepper.c,427 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,428 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,429 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,430 :: 		}
L_DualAxisStep100:
;Stepper.c,432 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep101:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep282
NOP	
J	L_DualAxisStep102
NOP	
L__DualAxisStep282:
J	L_DualAxisStep101
NOP	
L_DualAxisStep102:
;Stepper.c,421 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+168)(GP)
;Stepper.c,433 :: 		}
J	L_DualAxisStep96
NOP	
L_DualAxisStep97:
;Stepper.c,434 :: 		}
L_DualAxisStep95:
;Stepper.c,435 :: 		}
L_DualAxisStep86:
;Stepper.c,437 :: 		break;
J	L_DualAxisStep35
NOP	
;Stepper.c,438 :: 		default: break;
L_DualAxisStep103:
J	L_DualAxisStep35
NOP	
;Stepper.c,440 :: 		}
L_DualAxisStep34:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep284
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep284:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep286
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep286:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep288
NOP	
J	L_DualAxisStep75
NOP	
L__DualAxisStep288:
J	L_DualAxisStep103
NOP	
L_DualAxisStep35:
;Stepper.c,448 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _DualAxisStep
_XY_Interpolate:
;Stepper.c,451 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,453 :: 		if(SV.dx > SV.dy){
SW	R25, 4(SP)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XY_Interpolate290
NOP	
J	L_XY_Interpolate104
NOP	
L__XY_Interpolate290:
;Stepper.c,456 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,457 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate291
NOP	
J	L_XY_Interpolate105
NOP	
L__XY_Interpolate291:
;Stepper.c,458 :: 		SV.d2 += 2*SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,459 :: 		}else{
J	L_XY_Interpolate106
NOP	
L_XY_Interpolate105:
;Stepper.c,460 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,461 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,462 :: 		}
L_XY_Interpolate106:
;Stepper.c,464 :: 		}else{
J	L_XY_Interpolate107
NOP	
L_XY_Interpolate104:
;Stepper.c,467 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,468 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate292
NOP	
J	L_XY_Interpolate108
NOP	
L__XY_Interpolate292:
;Stepper.c,469 :: 		SV.d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,470 :: 		}else{
J	L_XY_Interpolate109
NOP	
L_XY_Interpolate108:
;Stepper.c,471 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,472 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,473 :: 		}
L_XY_Interpolate109:
;Stepper.c,474 :: 		}
L_XY_Interpolate107:
;Stepper.c,475 :: 		}
L_end_XY_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XY_Interpolate
_XZ_Interpolate:
;Stepper.c,477 :: 		void XZ_Interpolate(){
;Stepper.c,479 :: 		}
L_end_XZ_Interpolate:
JR	RA
NOP	
; end of _XZ_Interpolate
_YZ_Interpolate:
;Stepper.c,480 :: 		void YZ_Interpolate(){
;Stepper.c,482 :: 		}
L_end_YZ_Interpolate:
JR	RA
NOP	
; end of _YZ_Interpolate
_Step_Cycle:
;Stepper.c,490 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,491 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,492 :: 		Pulse(axis_No);
JAL	_Pulse+0
NOP	
;Stepper.c,493 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_toggleOCx:
;Stepper.c,497 :: 		void toggleOCx(int axis_No){
;Stepper.c,498 :: 		switch(axis_No){
J	L_toggleOCx110
NOP	
;Stepper.c,499 :: 		case 0: OC3R   = 0x5;
L_toggleOCx112:
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,500 :: 		OC3RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,501 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,502 :: 		OC3CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,503 :: 		break;
J	L_toggleOCx111
NOP	
;Stepper.c,504 :: 		case 1: OC5R   = 0x5;
L_toggleOCx113:
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,505 :: 		OC5RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+76)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,506 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,507 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,508 :: 		break;
J	L_toggleOCx111
NOP	
;Stepper.c,509 :: 		case 2: OC8R   = 0x5;
L_toggleOCx114:
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,510 :: 		OC8RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+144)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,511 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,512 :: 		OC8CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,513 :: 		break;
J	L_toggleOCx111
NOP	
;Stepper.c,514 :: 		default:
L_toggleOCx115:
;Stepper.c,515 :: 		break;
J	L_toggleOCx111
NOP	
;Stepper.c,516 :: 		}
L_toggleOCx110:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx298
NOP	
J	L_toggleOCx112
NOP	
L__toggleOCx298:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx300
NOP	
J	L_toggleOCx113
NOP	
L__toggleOCx300:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx302
NOP	
J	L_toggleOCx114
NOP	
L__toggleOCx302:
J	L_toggleOCx115
NOP	
L_toggleOCx111:
;Stepper.c,518 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,522 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,524 :: 		if(!STPS[axis_No].PLS_Step_ ){
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
BEQ	R2, R0, L__Pulse304
NOP	
J	L_Pulse116
NOP	
L__Pulse304:
;Stepper.c,525 :: 		STPS[axis_No].PLS_Step_   = 1;
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
;Stepper.c,526 :: 		}
L_Pulse116:
;Stepper.c,528 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse117
NOP	
;Stepper.c,529 :: 		case STOP:
L_Pulse119:
;Stepper.c,530 :: 		LATE7_bit = 0;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,531 :: 		T8IE_bit         = 0;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Stepper.c,532 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,533 :: 		break;
J	L_Pulse118
NOP	
;Stepper.c,535 :: 		case ACCEL:
L_Pulse120:
;Stepper.c,536 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,541 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__Pulse305
NOP	
J	L_Pulse121
NOP	
L__Pulse305:
;Stepper.c,543 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,544 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,545 :: 		}
L_Pulse121:
;Stepper.c,546 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
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
BNE	R2, R0, L__Pulse306
NOP	
J	L_Pulse122
NOP	
L__Pulse306:
;Stepper.c,547 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,548 :: 		}
L_Pulse122:
;Stepper.c,549 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse307
NOP	
J	L_Pulse123
NOP	
L__Pulse307:
;Stepper.c,550 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,551 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,552 :: 		STPS[axis_No].run_state   = DECEL;
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
;Stepper.c,553 :: 		}
L_Pulse123:
;Stepper.c,554 :: 		break;
J	L_Pulse118
NOP	
;Stepper.c,556 :: 		case RUN:
L_Pulse124:
;Stepper.c,557 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,559 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse308
NOP	
J	L_Pulse125
NOP	
L__Pulse308:
;Stepper.c,560 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,561 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,563 :: 		STPS[axis_No].run_state   =  DECEL;
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
;Stepper.c,564 :: 		}
L_Pulse125:
;Stepper.c,565 :: 		break;
J	L_Pulse118
NOP	
;Stepper.c,567 :: 		case DECEL:
L_Pulse126:
;Stepper.c,570 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,571 :: 		if(STPS[axis_No].accel_count >= -2 ){
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
BEQ	R2, R0, L__Pulse309
NOP	
J	L_Pulse127
NOP	
L__Pulse309:
;Stepper.c,572 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,573 :: 		}
L_Pulse127:
;Stepper.c,574 :: 		break;
J	L_Pulse118
NOP	
;Stepper.c,575 :: 		default:break;
L_Pulse128:
J	L_Pulse118
NOP	
;Stepper.c,576 :: 		}
L_Pulse117:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse311
NOP	
J	L_Pulse119
NOP	
L__Pulse311:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse313
NOP	
J	L_Pulse120
NOP	
L__Pulse313:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse315
NOP	
J	L_Pulse124
NOP	
L__Pulse315:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse317
NOP	
J	L_Pulse126
NOP	
L__Pulse317:
J	L_Pulse128
NOP	
L_Pulse118:
;Stepper.c,577 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,578 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,582 :: 		void AccDec(int axis_No){
;Stepper.c,583 :: 		STPS[axis_No].accel_count++;
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
;Stepper.c,584 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
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
;Stepper.c,585 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
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
;Stepper.c,586 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
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
;Stepper.c,588 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_StepX:
;Stepper.c,592 :: 		void StepX() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,593 :: 		STPS[X].step_count++;
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R3, R2, 1
SW	R3, Offset(_STPS+32)(GP)
;Stepper.c,594 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,595 :: 		if(STPS[X].step_count >= STPS[X].dist){  //i think this is where the problem lies
LW	R2, Offset(_STPS+36)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__StepX320
NOP	
J	L_StepX129
NOP	
L__StepX320:
;Stepper.c,596 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,597 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,598 :: 		}
J	L_StepX130
NOP	
L_StepX129:
;Stepper.c,600 :: 		if(!SV.Single_Dual)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepX321
NOP	
J	L_StepX131
NOP	
L__StepX321:
;Stepper.c,601 :: 		SingleStepX();
JAL	_SingleStepX+0
NOP	
J	L_StepX132
NOP	
L_StepX131:
;Stepper.c,603 :: 		XY_Interpolate();
JAL	_XY_Interpolate+0
NOP	
L_StepX132:
;Stepper.c,604 :: 		}
L_StepX130:
;Stepper.c,605 :: 		}
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
;Stepper.c,607 :: 		void SingleStepX(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,608 :: 		Step_Cycle(X);
SW	R25, 4(SP)
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,609 :: 		}
L_end_SingleStepX:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepX
_StepY:
;Stepper.c,611 :: 		void StepY() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,612 :: 		STPS[Y].step_count++;
LW	R2, Offset(_STPS+100)(GP)
ADDIU	R3, R2, 1
SW	R3, Offset(_STPS+100)(GP)
;Stepper.c,613 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,614 :: 		if(STPS[Y].step_count >= STPS[Y].dist){
LW	R2, Offset(_STPS+104)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__StepY324
NOP	
J	L_StepY133
NOP	
L__StepY324:
;Stepper.c,615 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,616 :: 		}
J	L_StepY134
NOP	
L_StepY133:
;Stepper.c,618 :: 		if(!SV.Single_Dual)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepY325
NOP	
J	L_StepY135
NOP	
L__StepY325:
;Stepper.c,619 :: 		SingleStepY();
JAL	_SingleStepY+0
NOP	
J	L_StepY136
NOP	
L_StepY135:
;Stepper.c,621 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepY136:
;Stepper.c,622 :: 		}
L_StepY134:
;Stepper.c,623 :: 		}
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
;Stepper.c,625 :: 		void SingleStepY(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,626 :: 		Step_Cycle(Y);
SW	R25, 4(SP)
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,627 :: 		}
L_end_SingleStepY:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepY
_StepZ:
;Stepper.c,629 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_8 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,630 :: 		STPS[Z].step_count++;
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R3, R2, 1
SW	R3, Offset(_STPS+168)(GP)
;Stepper.c,631 :: 		OC8IF_bit = 0;
LUI	R2, BitMask(OC8IF_bit+0)
ORI	R2, R2, BitMask(OC8IF_bit+0)
_SX	
;Stepper.c,632 :: 		if(STPS[Z].step_count >= STPS[Z].dist){
LW	R2, Offset(_STPS+172)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__StepZ328
NOP	
J	L_StepZ137
NOP	
L__StepZ328:
;Stepper.c,633 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+4)(GP)
;Stepper.c,634 :: 		}
J	L_StepZ138
NOP	
L_StepZ137:
;Stepper.c,636 :: 		if(!SV.Single_Dual)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepZ329
NOP	
J	L_StepZ139
NOP	
L__StepZ329:
;Stepper.c,637 :: 		SingleStepZ();
JAL	_SingleStepZ+0
NOP	
J	L_StepZ140
NOP	
L_StepZ139:
;Stepper.c,639 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepZ140:
;Stepper.c,640 :: 		}
L_StepZ138:
;Stepper.c,641 :: 		}
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
;Stepper.c,643 :: 		void SingleStepZ(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,644 :: 		Step_Cycle(Z);
SW	R25, 4(SP)
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,645 :: 		}
L_end_SingleStepZ:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepZ
_disableOCx:
;Stepper.c,649 :: 		void disableOCx(){
;Stepper.c,650 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,651 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,652 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,653 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_min_:
;Stepper.c,665 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,666 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_333
NOP	
J	L_min_141
NOP	
L__min_333:
;Stepper.c,667 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,668 :: 		}
L_min_141:
;Stepper.c,670 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,672 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
Stepper_sqrt_:
;Stepper.c,682 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,688 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,689 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,690 :: 		do
J	L_Stepper_sqrt_143
NOP	
L_Stepper_sqrt_193:
;Stepper.c,704 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,690 :: 		do
L_Stepper_sqrt_143:
;Stepper.c,692 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_335
NOP	
J	L_Stepper_sqrt_146
NOP	
L_Stepper_sqrt_335:
;Stepper.c,694 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,695 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,696 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_147
NOP	
L_Stepper_sqrt_146:
;Stepper.c,698 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,699 :: 		}
L_Stepper_sqrt_147:
;Stepper.c,700 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,701 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_337
NOP	
J	L_Stepper_sqrt_194
NOP	
L_Stepper_sqrt_337:
; f end address is: 16 (R4)
;Stepper.c,702 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,703 :: 		}
J	L_Stepper_sqrt_148
NOP	
L_Stepper_sqrt_194:
;Stepper.c,701 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,703 :: 		}
L_Stepper_sqrt_148:
;Stepper.c,704 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_338
NOP	
J	L_Stepper_sqrt_193
NOP	
L_Stepper_sqrt_338:
; q2 end address is: 12 (R3)
;Stepper.c,705 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_339
NOP	
J	L_Stepper_sqrt_149
NOP	
L_Stepper_sqrt_339:
;Stepper.c,706 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,707 :: 		}
L_Stepper_sqrt_149:
;Stepper.c,709 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,711 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_CalcRadius:
;Stepper.c,714 :: 		void CalcRadius(Circle* cir){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,717 :: 		cir->xRad = fabs(cir->xStart + cir->I);
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
;Stepper.c,718 :: 		cir->yRad = fabs(cir->yStart + cir->J);
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
;Stepper.c,719 :: 		cir->radius = sqrt((cir->xRad*cir->xRad) + (cir->yRad*cir->yRad));
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
;Stepper.c,720 :: 		angA = atan2(cir->yRad,cir->xRad);
ADDIU	R2, R25, 48
LWC1	S1, 0(R2)
ADDIU	R2, R25, 52
LWC1	S0, 0(R2)
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
;Stepper.c,723 :: 		cir->degreeDeg = angA * rad2deg;
ADDIU	R3, R25, 4
LUI	R2, 16997
ORI	R2, R2, 12013
MTC1	R2, S1
MUL.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Stepper.c,725 :: 		cir->quadrant_start = QuadrantStart(cir->I,cir->J);
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
;Stepper.c,727 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius342
NOP	
J	L__CalcRadius213
NOP	
L__CalcRadius342:
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius344
NOP	
J	L__CalcRadius212
NOP	
L__CalcRadius344:
J	L_CalcRadius153
NOP	
L__CalcRadius213:
L__CalcRadius212:
;Stepper.c,728 :: 		angB = cir->deg - cir->degreeDeg;
LWC1	S1, 0(R25)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius153:
;Stepper.c,729 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius346
NOP	
J	L__CalcRadius215
NOP	
L__CalcRadius346:
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius348
NOP	
J	L__CalcRadius214
NOP	
L__CalcRadius348:
J	L_CalcRadius156
NOP	
L__CalcRadius215:
L__CalcRadius214:
;Stepper.c,730 :: 		angB = cir->deg + cir->degreeDeg;
LWC1	S1, 0(R25)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius156:
;Stepper.c,732 :: 		cir->degreeRadians = angB * deg2rad;
ADDIU	R3, R25, 8
LWC1	S1, 8(SP)
LUI	R2, 15502
ORI	R2, R2, 64046
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, 0(R3)
;Stepper.c,733 :: 		}
L_end_CalcRadius:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _CalcRadius
_QuadrantStart:
;Stepper.c,735 :: 		int QuadrantStart(float i,float j){
;Stepper.c,736 :: 		if((i <= 0)&&(j >= 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__QuadrantStart350
NOP	
J	L__QuadrantStart203
NOP	
L__QuadrantStart350:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S13, S0
BC1F	0, L__QuadrantStart351
NOP	
J	L__QuadrantStart202
NOP	
L__QuadrantStart351:
L__QuadrantStart201:
;Stepper.c,737 :: 		return 1;
ORI	R2, R0, 1
J	L_end_QuadrantStart
NOP	
;Stepper.c,736 :: 		if((i <= 0)&&(j >= 0))
L__QuadrantStart203:
L__QuadrantStart202:
;Stepper.c,738 :: 		else if((i > 0)&&(j > 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart352
NOP	
J	L__QuadrantStart205
NOP	
L__QuadrantStart352:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S13, S0
BC1F	0, L__QuadrantStart353
NOP	
J	L__QuadrantStart204
NOP	
L__QuadrantStart353:
L__QuadrantStart200:
;Stepper.c,739 :: 		return 2;
ORI	R2, R0, 2
J	L_end_QuadrantStart
NOP	
;Stepper.c,738 :: 		else if((i > 0)&&(j > 0))
L__QuadrantStart205:
L__QuadrantStart204:
;Stepper.c,740 :: 		else if((i > 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart354
NOP	
J	L__QuadrantStart207
NOP	
L__QuadrantStart354:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart355
NOP	
J	L__QuadrantStart206
NOP	
L__QuadrantStart355:
L__QuadrantStart199:
;Stepper.c,741 :: 		return 3;
ORI	R2, R0, 3
J	L_end_QuadrantStart
NOP	
;Stepper.c,740 :: 		else if((i > 0)&&(j < 0))
L__QuadrantStart207:
L__QuadrantStart206:
;Stepper.c,742 :: 		else if((i < 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__QuadrantStart356
NOP	
J	L__QuadrantStart209
NOP	
L__QuadrantStart356:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart357
NOP	
J	L__QuadrantStart208
NOP	
L__QuadrantStart357:
L__QuadrantStart198:
;Stepper.c,743 :: 		return 4;
ORI	R2, R0, 4
J	L_end_QuadrantStart
NOP	
;Stepper.c,742 :: 		else if((i < 0)&&(j < 0))
L__QuadrantStart209:
L__QuadrantStart208:
;Stepper.c,745 :: 		return 0;
MOVZ	R2, R0, R0
;Stepper.c,746 :: 		}
L_end_QuadrantStart:
JR	RA
NOP	
; end of _QuadrantStart
_CircDir:
;Stepper.c,748 :: 		void CircDir(Circle* cir){
;Stepper.c,750 :: 		if(cir->dir == CW){
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__CircDir359
NOP	
J	L_CircDir173
NOP	
L__CircDir359:
;Stepper.c,751 :: 		newDeg = 360 / cir->deg;
LWC1	S1, 0(R25)
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S2, S0, S1
; newDeg start address is: 24 (R6)
MOV.S 	S3, S2
;Stepper.c,752 :: 		cir->N = (2*Pi*cir->radius)/newDeg;
ADDIU	R3, R25, 36
ADDIU	R2, R25, 40
LWC1	S1, 0(R2)
LUI	R2, 16585
ORI	R2, R2, 4048
MTC1	R2, S0
MUL.S 	S0, S0, S1
DIV.S 	S0, S0, S2
SWC1	S0, 0(R3)
;Stepper.c,753 :: 		cir->divisor = cir->deg / newDeg;
ADDIU	R2, R25, 20
LWC1	S0, 0(R25)
DIV.S 	S0, S0, S3
; newDeg end address is: 24 (R6)
SWC1	S0, 0(R2)
;Stepper.c,754 :: 		}
L_CircDir173:
;Stepper.c,756 :: 		if(cir->dir == CW)
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__CircDir360
NOP	
J	L_CircDir174
NOP	
L__CircDir360:
;Stepper.c,757 :: 		cir->deg = 0.00;
SW	R0, 0(R25)
L_CircDir174:
;Stepper.c,758 :: 		if(cir->dir == CCW)
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__CircDir361
NOP	
J	L_CircDir175
NOP	
L__CircDir361:
;Stepper.c,759 :: 		cir->deg = 360.00;
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
SWC1	S0, 0(R25)
L_CircDir175:
;Stepper.c,760 :: 		}
L_end_CircDir:
JR	RA
NOP	
; end of _CircDir
_Cir_Interpolation:
;Stepper.c,762 :: 		void Cir_Interpolation(float xPresent,float yPresent,Circle* cir){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,764 :: 		cir->xStart = xPresent;
ADDIU	R2, R25, 56
SWC1	S12, 0(R2)
;Stepper.c,765 :: 		cir->yStart = yPresent;
ADDIU	R2, R25, 60
SWC1	S13, 0(R2)
;Stepper.c,766 :: 		CalcRadius(cir);
JAL	_CalcRadius+0
NOP	
;Stepper.c,769 :: 		while(quad){
LH	R2, Offset(Cir_Interpolation_quad_L0+0)(GP)
BNE	R2, R0, L__Cir_Interpolation364
NOP	
J	L_Cir_Interpolation177
NOP	
L__Cir_Interpolation364:
;Stepper.c,780 :: 		}
L_Cir_Interpolation177:
;Stepper.c,781 :: 		}
L_end_Cir_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Cir_Interpolation
_CycleStop:
;Stepper.c,805 :: 		void CycleStop(){
;Stepper.c,807 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,808 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop184:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 3
BNE	R2, R0, L__CycleStop366
NOP	
J	L_CycleStop185
NOP	
L__CycleStop366:
;Stepper.c,809 :: 		STPS[ii].microSec = 0;
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,810 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 4
BEQ	R2, R0, L__CycleStop367
NOP	
J	L_CycleStop187
NOP	
L__CycleStop367:
; ii end address is: 16 (R4)
J	L_CycleStop185
NOP	
L_CycleStop187:
;Stepper.c,808 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,811 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop184
NOP	
L_CycleStop185:
;Stepper.c,812 :: 		}
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
;Stepper.c,814 :: 		void CycleStart(){
;Stepper.c,817 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__CycleStart369
NOP	
J	L_CycleStart188
NOP	
L__CycleStart369:
;Stepper.c,818 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart189:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 3
BNE	R2, R0, L__CycleStart370
NOP	
J	L_CycleStart190
NOP	
L__CycleStart370:
;Stepper.c,819 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 4
BEQ	R2, R0, L__CycleStart371
NOP	
J	L_CycleStart192
NOP	
L__CycleStart371:
; ii end address is: 16 (R4)
J	L_CycleStart190
NOP	
L_CycleStart192:
;Stepper.c,820 :: 		STPS[ii].microSec++;
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
;Stepper.c,818 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,821 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart189
NOP	
L_CycleStart190:
;Stepper.c,822 :: 		}
L_CycleStart188:
;Stepper.c,823 :: 		}
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
