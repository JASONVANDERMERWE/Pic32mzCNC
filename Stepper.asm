_SetPinMode:
;Stepper.c,62 :: 		void SetPinMode(){
;Stepper.c,65 :: 		EN_Step_PinDirX  = 0; //output
LUI	R2, BitMask(TRISG1_bit+0)
ORI	R2, R2, BitMask(TRISG1_bit+0)
_SX	
_LX	
EXT	R2, R2, BitPos(TRISG1_bit+0), 1
SB	R2, Offset(_AxisNo+0)(GP)
;Stepper.c,68 :: 		PLS_Step_PinDirX = 0;
LUI	R2, BitMask(TRISF1_bit+0)
ORI	R2, R2, BitMask(TRISF1_bit+0)
_SX	
;Stepper.c,69 :: 		DIR_Step_PinDirX = 0;
LUI	R2, BitMask(TRISG0_bit+0)
ORI	R2, R2, BitMask(TRISG0_bit+0)
_SX	
;Stepper.c,71 :: 		EN_Step_PinDirY  = 0; //output
LUI	R2, BitMask(TRISF0_bit+0)
ORI	R2, R2, BitMask(TRISF0_bit+0)
_SX	
;Stepper.c,74 :: 		PLS_Step_PinDirY = 0;
LUI	R2, BitMask(TRISD4_bit+0)
ORI	R2, R2, BitMask(TRISD4_bit+0)
_SX	
;Stepper.c,75 :: 		DIR_Step_PinDirY = 0;
LUI	R2, BitMask(TRISD5_bit+0)
ORI	R2, R2, BitMask(TRISD5_bit+0)
_SX	
;Stepper.c,77 :: 		EN_Step_PinDirZ  = 0; //output
LUI	R2, BitMask(TRISG14_bit+0)
ORI	R2, R2, BitMask(TRISG14_bit+0)
_SX	
;Stepper.c,80 :: 		PLS_Step_PinDirZ = 0;
LUI	R2, BitMask(TRISE3_bit+0)
ORI	R2, R2, BitMask(TRISE3_bit+0)
_SX	
;Stepper.c,81 :: 		DIR_Step_PinDirZ = 0;
LUI	R2, BitMask(TRISG12_bit+0)
ORI	R2, R2, BitMask(TRISG12_bit+0)
_SX	
;Stepper.c,83 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_StepperConstants:
;Stepper.c,87 :: 		void StepperConstants(long accel,long decel){
;Stepper.c,88 :: 		SV.acc = accel;
SW	R25, Offset(_SV+48)(GP)
;Stepper.c,89 :: 		SV.dec = decel;
SW	R26, Offset(_SV+52)(GP)
;Stepper.c,90 :: 		}
L_end_StepperConstants:
JR	RA
NOP	
; end of _StepperConstants
_EnStepperX:
;Stepper.c,94 :: 		void EnStepperX(){
;Stepper.c,97 :: 		EN_StepX       = 0;
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
;Stepper.c,98 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,100 :: 		void EnStepperY(){
;Stepper.c,103 :: 		EN_StepY       = 0;
LUI	R2, BitMask(LATF0_bit+0)
ORI	R2, R2, BitMask(LATF0_bit+0)
_SX	
;Stepper.c,104 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,105 :: 		void EnStepperZ(){
;Stepper.c,108 :: 		EN_StepZ       = 0;
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;Stepper.c,109 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_DisableStepper:
;Stepper.c,111 :: 		void DisableStepper(){
;Stepper.c,112 :: 		EN_StepX      = 1;
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
;Stepper.c,113 :: 		EN_StepY      = 1;
LUI	R2, BitMask(LATF0_bit+0)
ORI	R2, R2, BitMask(LATF0_bit+0)
_SX	
;Stepper.c,114 :: 		EN_StepZ      = 1;
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;Stepper.c,115 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_speed_cntr_Move:
;Stepper.c,133 :: 		void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,136 :: 		if(mmSteps == 1){
SW	R25, 4(SP)
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move224
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move224:
;Stepper.c,138 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
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
;Stepper.c,139 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
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
;Stepper.c,140 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
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
;Stepper.c,141 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,143 :: 		}
J	L_speed_cntr_Move1
NOP	
L_speed_cntr_Move0:
;Stepper.c,145 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
BNE	R25, R0, L__speed_cntr_Move226
NOP	
J	L__speed_cntr_Move189
NOP	
L__speed_cntr_Move226:
JAL	_abs+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__speed_cntr_Move228
NOP	
J	L__speed_cntr_Move188
NOP	
L__speed_cntr_Move228:
L__speed_cntr_Move187:
;Stepper.c,149 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
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
;Stepper.c,154 :: 		STPS[axis_No].step_delay = abs((T1_FREQ_148 * sqrt_(A_SQ / SV.acc))/100);
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
;Stepper.c,155 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
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
;Stepper.c,160 :: 		STPS[axis_No].max_step_lim = (speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
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
;Stepper.c,165 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move229
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move229:
;Stepper.c,166 :: 		STPS[axis_No].max_step_lim = 1;
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
;Stepper.c,167 :: 		}
L_speed_cntr_Move5:
;Stepper.c,171 :: 		STPS[axis_No].accel_lim = (abs(mmSteps) * SV.dec) / (SV.acc + SV.dec);
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
;Stepper.c,174 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move230
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move230:
;Stepper.c,175 :: 		STPS[axis_No].accel_lim = 1;
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
;Stepper.c,176 :: 		}
L_speed_cntr_Move6:
;Stepper.c,179 :: 		if(STPS[axis_No].accel_lim <= STPS[axis_No].max_step_lim){
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
BEQ	R2, R0, L__speed_cntr_Move231
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move231:
;Stepper.c,180 :: 		if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move232
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move232:
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
;Stepper.c,181 :: 		else STPS[axis_No].decel_val = mmSteps + STPS[axis_No].accel_lim;
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
;Stepper.c,182 :: 		}else{
J	L_speed_cntr_Move10
NOP	
L_speed_cntr_Move7:
;Stepper.c,183 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * SV.acc) / SV.dec);
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
;Stepper.c,184 :: 		}
L_speed_cntr_Move10:
;Stepper.c,186 :: 		if(mmSteps >= 0){
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move233
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move233:
;Stepper.c,187 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
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
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move234:
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
;Stepper.c,188 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
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
;Stepper.c,189 :: 		}
J	L_speed_cntr_Move14
NOP	
L_speed_cntr_Move11:
;Stepper.c,191 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = abs(mmSteps) * STPS[axis_No].decel_val;
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
BNE	R2, R0, L__speed_cntr_Move235
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move235:
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
;Stepper.c,192 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
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
;Stepper.c,193 :: 		}
L_speed_cntr_Move14:
;Stepper.c,195 :: 		if(STPS[axis_No].decel_val == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move236
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move236:
;Stepper.c,196 :: 		STPS[axis_No].decel_val = -1;
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
;Stepper.c,197 :: 		}
L_speed_cntr_Move17:
;Stepper.c,200 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__speed_cntr_Move237
NOP	
J	L_speed_cntr_Move18
NOP	
L__speed_cntr_Move237:
;Stepper.c,201 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,202 :: 		STPS[axis_No].run_state = RUN;
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
;Stepper.c,203 :: 		}else{
J	L_speed_cntr_Move19
NOP	
L_speed_cntr_Move18:
;Stepper.c,204 :: 		STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
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
;Stepper.c,205 :: 		STPS[axis_No].run_state = ACCEL;
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
;Stepper.c,206 :: 		}
L_speed_cntr_Move19:
;Stepper.c,145 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
L__speed_cntr_Move189:
L__speed_cntr_Move188:
;Stepper.c,208 :: 		}
L_speed_cntr_Move1:
;Stepper.c,209 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,210 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,211 :: 		STPS[axis_No].microSec    = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,212 :: 		STPS[axis_No].accel_count = 1;
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
;Stepper.c,213 :: 		STPS[axis_No].dist        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R0, 0(R2)
;Stepper.c,214 :: 		SV.Tog   = 0;
SH	R0, Offset(_SV+2)(GP)
;Stepper.c,215 :: 		SV.running = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,216 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_SingleAxisStep:
;Stepper.c,224 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,230 :: 		SV.Single_Dual = 0;
SW	R25, 4(SP)
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,231 :: 		switch(axis_No){
J	L_SingleAxisStep20
NOP	
;Stepper.c,232 :: 		case 0:OC3IE_bit = 1;OC3CONbits.ON = 1;
L_SingleAxisStep22:
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,233 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,234 :: 		case 1:
L_SingleAxisStep23:
;Stepper.c,235 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,236 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,237 :: 		case 2:
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
BNE	R2, R0, L__SingleAxisStep240
NOP	
J	L_SingleAxisStep22
NOP	
L__SingleAxisStep240:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep242
NOP	
J	L_SingleAxisStep23
NOP	
L__SingleAxisStep242:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep244
NOP	
J	L_SingleAxisStep24
NOP	
L__SingleAxisStep244:
J	L_SingleAxisStep25
NOP	
L_SingleAxisStep21:
;Stepper.c,242 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+40)(GP)
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
BNE	R2, R0, L__SingleAxisStep245
NOP	
J	L_SingleAxisStep26
NOP	
L__SingleAxisStep245:
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
BNE	R2, R0, L__SingleAxisStep247
NOP	
J	L_SingleAxisStep30
NOP	
L__SingleAxisStep247:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep249
NOP	
J	L_SingleAxisStep31
NOP	
L__SingleAxisStep249:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep251
NOP	
J	L_SingleAxisStep32
NOP	
L__SingleAxisStep251:
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
;Stepper.c,273 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,275 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+44)(GP)
;Stepper.c,277 :: 		SV.px = 0;
SW	R0, Offset(_SV+28)(GP)
;Stepper.c,278 :: 		SV.py = 0;
SW	R0, Offset(_SV+32)(GP)
;Stepper.c,279 :: 		SV.pz = 0;
SW	R0, Offset(_SV+36)(GP)
;Stepper.c,283 :: 		SV.Single_Dual = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,284 :: 		switch(axis_combo){
J	L_DualAxisStep34
NOP	
;Stepper.c,285 :: 		case xy:
L_DualAxisStep36:
;Stepper.c,286 :: 		AxisPulse = XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Stepper.c,287 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Stepper.c,288 :: 		Axis_Enable(axis_xyz);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_Axis_Enable+0
NOP	
LW	R25, 8(SP)
;Stepper.c,290 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,291 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,294 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep253
NOP	
J	L_DualAxisStep37
NOP	
L__DualAxisStep253:
; ?FLOC___DualAxisStep?T383 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T383 end address is: 12 (R3)
J	L_DualAxisStep38
NOP	
L_DualAxisStep37:
; ?FLOC___DualAxisStep?T383 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T383 end address is: 12 (R3)
L_DualAxisStep38:
; ?FLOC___DualAxisStep?T383 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T383 end address is: 12 (R3)
SH	R2, Offset(_SV+56)(GP)
;Stepper.c,295 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep254
NOP	
J	L_DualAxisStep39
NOP	
L__DualAxisStep254:
; ?FLOC___DualAxisStep?T385 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T385 end address is: 12 (R3)
J	L_DualAxisStep40
NOP	
L_DualAxisStep39:
; ?FLOC___DualAxisStep?T385 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T385 end address is: 12 (R3)
L_DualAxisStep40:
; ?FLOC___DualAxisStep?T385 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T385 end address is: 12 (R3)
SH	R2, Offset(_SV+58)(GP)
;Stepper.c,298 :: 		if(SV.dirx < 0)
LH	R2, Offset(_SV+56)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep255
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep255:
;Stepper.c,299 :: 		DIR_StepX = CCW;
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
J	L_DualAxisStep42
NOP	
L_DualAxisStep41:
;Stepper.c,301 :: 		DIR_StepX = CW;
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
L_DualAxisStep42:
;Stepper.c,303 :: 		if(SV.diry < 0)
LH	R2, Offset(_SV+58)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep256
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep256:
;Stepper.c,304 :: 		DIR_StepY = CCW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_DualAxisStep44
NOP	
L_DualAxisStep43:
;Stepper.c,306 :: 		DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_DualAxisStep44:
;Stepper.c,308 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,309 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,311 :: 		if(SV.dx > SV.dy)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep257
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep257:
;Stepper.c,312 :: 		SV.d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep46
NOP	
L_DualAxisStep45:
;Stepper.c,314 :: 		SV.d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep46:
;Stepper.c,316 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Stepper.c,317 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Stepper.c,318 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Stepper.c,320 :: 		break;
J	L_DualAxisStep35
NOP	
;Stepper.c,321 :: 		case xz:
L_DualAxisStep47:
;Stepper.c,322 :: 		AxisPulse = XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Stepper.c,323 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Stepper.c,324 :: 		Axis_Enable(axis_xyz);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_Axis_Enable+0
NOP	
LW	R25, 8(SP)
;Stepper.c,326 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,327 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,330 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep258
NOP	
J	L_DualAxisStep48
NOP	
L__DualAxisStep258:
; ?FLOC___DualAxisStep?T399 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T399 end address is: 12 (R3)
J	L_DualAxisStep49
NOP	
L_DualAxisStep48:
; ?FLOC___DualAxisStep?T399 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T399 end address is: 12 (R3)
L_DualAxisStep49:
; ?FLOC___DualAxisStep?T399 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T399 end address is: 12 (R3)
SH	R2, Offset(_SV+56)(GP)
;Stepper.c,331 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep259
NOP	
J	L_DualAxisStep50
NOP	
L__DualAxisStep259:
; ?FLOC___DualAxisStep?T401 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T401 end address is: 12 (R3)
J	L_DualAxisStep51
NOP	
L_DualAxisStep50:
; ?FLOC___DualAxisStep?T401 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T401 end address is: 12 (R3)
L_DualAxisStep51:
; ?FLOC___DualAxisStep?T401 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T401 end address is: 12 (R3)
SH	R2, Offset(_SV+60)(GP)
;Stepper.c,334 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+56)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep260
NOP	
J	L_DualAxisStep52
NOP	
L__DualAxisStep260:
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
J	L_DualAxisStep53
NOP	
L_DualAxisStep52:
;Stepper.c,335 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
L_DualAxisStep53:
;Stepper.c,337 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+60)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep261
NOP	
J	L_DualAxisStep54
NOP	
L__DualAxisStep261:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_DualAxisStep55
NOP	
L_DualAxisStep54:
;Stepper.c,338 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_DualAxisStep55:
;Stepper.c,340 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,341 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,343 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep262
NOP	
J	L_DualAxisStep56
NOP	
L__DualAxisStep262:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_DualAxisStep57
NOP	
L_DualAxisStep56:
;Stepper.c,344 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Stepper_d2+0)(GP)
L_DualAxisStep57:
;Stepper.c,346 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Stepper.c,347 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Stepper.c,348 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Stepper.c,349 :: 		break;
J	L_DualAxisStep35
NOP	
;Stepper.c,350 :: 		case yz:
L_DualAxisStep58:
;Stepper.c,351 :: 		AxisPulse = YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Stepper.c,352 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Stepper.c,353 :: 		Axis_Enable(axis_xyz);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_Axis_Enable+0
NOP	
LW	R25, 8(SP)
;Stepper.c,356 :: 		SV.dy   = newx - SV.pz;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,357 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,360 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep263
NOP	
J	L_DualAxisStep59
NOP	
L__DualAxisStep263:
; ?FLOC___DualAxisStep?T415 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T415 end address is: 12 (R3)
J	L_DualAxisStep60
NOP	
L_DualAxisStep59:
; ?FLOC___DualAxisStep?T415 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T415 end address is: 12 (R3)
L_DualAxisStep60:
; ?FLOC___DualAxisStep?T415 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T415 end address is: 12 (R3)
SH	R2, Offset(_SV+58)(GP)
;Stepper.c,361 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep264
NOP	
J	L_DualAxisStep61
NOP	
L__DualAxisStep264:
; ?FLOC___DualAxisStep?T417 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T417 end address is: 12 (R3)
J	L_DualAxisStep62
NOP	
L_DualAxisStep61:
; ?FLOC___DualAxisStep?T417 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T417 end address is: 12 (R3)
L_DualAxisStep62:
; ?FLOC___DualAxisStep?T417 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T417 end address is: 12 (R3)
SH	R2, Offset(_SV+60)(GP)
;Stepper.c,364 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+58)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep265
NOP	
J	L_DualAxisStep63
NOP	
L__DualAxisStep265:
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_DualAxisStep64
NOP	
L_DualAxisStep63:
;Stepper.c,365 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_DualAxisStep64:
;Stepper.c,366 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+60)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep266
NOP	
J	L_DualAxisStep65
NOP	
L__DualAxisStep266:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_DualAxisStep66
NOP	
L_DualAxisStep65:
;Stepper.c,367 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_DualAxisStep66:
;Stepper.c,369 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,370 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,372 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep267
NOP	
J	L_DualAxisStep67
NOP	
L__DualAxisStep267:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_DualAxisStep68
NOP	
L_DualAxisStep67:
;Stepper.c,373 :: 		else d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Stepper_d2+0)(GP)
L_DualAxisStep68:
;Stepper.c,375 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Stepper.c,376 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Stepper.c,377 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Stepper.c,378 :: 		break;
J	L_DualAxisStep35
NOP	
;Stepper.c,379 :: 		default: break;
L_DualAxisStep69:
J	L_DualAxisStep35
NOP	
;Stepper.c,381 :: 		}
L_DualAxisStep34:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep269
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep269:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep271
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep271:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep273
NOP	
J	L_DualAxisStep58
NOP	
L__DualAxisStep273:
J	L_DualAxisStep69
NOP	
L_DualAxisStep35:
;Stepper.c,382 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _DualAxisStep
_XY_Interpolate:
;Stepper.c,386 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,387 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate275
NOP	
J	L__XY_Interpolate192
NOP	
L__XY_Interpolate275:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate276
NOP	
J	L__XY_Interpolate191
NOP	
L__XY_Interpolate276:
J	L_XY_Interpolate72
NOP	
L__XY_Interpolate192:
L__XY_Interpolate191:
;Stepper.c,388 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,389 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,390 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Stepper.c,391 :: 		}
L_XY_Interpolate72:
;Stepper.c,393 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XY_Interpolate277
NOP	
J	L_XY_Interpolate73
NOP	
L__XY_Interpolate277:
;Stepper.c,394 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,395 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate278
NOP	
J	L_XY_Interpolate74
NOP	
L__XY_Interpolate278:
;Stepper.c,396 :: 		SV.d2 += 2*SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,397 :: 		}else{
J	L_XY_Interpolate75
NOP	
L_XY_Interpolate74:
;Stepper.c,398 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,399 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,400 :: 		}
L_XY_Interpolate75:
;Stepper.c,401 :: 		}else{
J	L_XY_Interpolate76
NOP	
L_XY_Interpolate73:
;Stepper.c,402 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,403 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate279
NOP	
J	L_XY_Interpolate77
NOP	
L__XY_Interpolate279:
;Stepper.c,404 :: 		SV.d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,405 :: 		}else{
J	L_XY_Interpolate78
NOP	
L_XY_Interpolate77:
;Stepper.c,406 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,407 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,408 :: 		}
L_XY_Interpolate78:
;Stepper.c,409 :: 		}
L_XY_Interpolate76:
;Stepper.c,410 :: 		}
L_end_XY_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XY_Interpolate
_XZ_Interpolate:
;Stepper.c,412 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,414 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate281
NOP	
J	L__XZ_Interpolate195
NOP	
L__XZ_Interpolate281:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate282
NOP	
J	L__XZ_Interpolate194
NOP	
L__XZ_Interpolate282:
J	L_XZ_Interpolate81
NOP	
L__XZ_Interpolate195:
L__XZ_Interpolate194:
;Stepper.c,415 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,416 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,418 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Stepper.c,419 :: 		}
L_XZ_Interpolate81:
;Stepper.c,421 :: 		if(SV.dx > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XZ_Interpolate283
NOP	
J	L_XZ_Interpolate82
NOP	
L__XZ_Interpolate283:
;Stepper.c,422 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,423 :: 		if(d2 < 0)
LW	R2, Offset(Stepper_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate284
NOP	
J	L_XZ_Interpolate83
NOP	
L__XZ_Interpolate284:
;Stepper.c,424 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_XZ_Interpolate84
NOP	
L_XZ_Interpolate83:
;Stepper.c,426 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
;Stepper.c,427 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,428 :: 		}
L_XZ_Interpolate84:
;Stepper.c,430 :: 		}else{
J	L_XZ_Interpolate85
NOP	
L_XZ_Interpolate82:
;Stepper.c,431 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,432 :: 		if(d2 < 0)
LW	R2, Offset(Stepper_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate285
NOP	
J	L_XZ_Interpolate86
NOP	
L__XZ_Interpolate285:
;Stepper.c,433 :: 		d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_XZ_Interpolate87
NOP	
L_XZ_Interpolate86:
;Stepper.c,435 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
;Stepper.c,436 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,437 :: 		}
L_XZ_Interpolate87:
;Stepper.c,438 :: 		}
L_XZ_Interpolate85:
;Stepper.c,439 :: 		}
L_end_XZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XZ_Interpolate
_YZ_Interpolate:
;Stepper.c,441 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,442 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate287
NOP	
J	L__YZ_Interpolate198
NOP	
L__YZ_Interpolate287:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate288
NOP	
J	L__YZ_Interpolate197
NOP	
L__YZ_Interpolate288:
J	L_YZ_Interpolate90
NOP	
L__YZ_Interpolate198:
L__YZ_Interpolate197:
;Stepper.c,443 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,444 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,445 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Stepper.c,446 :: 		}
L_YZ_Interpolate90:
;Stepper.c,448 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__YZ_Interpolate289
NOP	
J	L_YZ_Interpolate91
NOP	
L__YZ_Interpolate289:
;Stepper.c,449 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,450 :: 		if(d2 < 0)
LW	R2, Offset(Stepper_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate290
NOP	
J	L_YZ_Interpolate92
NOP	
L__YZ_Interpolate290:
;Stepper.c,451 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_YZ_Interpolate93
NOP	
L_YZ_Interpolate92:
;Stepper.c,453 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
;Stepper.c,454 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,455 :: 		}
L_YZ_Interpolate93:
;Stepper.c,456 :: 		}else{
J	L_YZ_Interpolate94
NOP	
L_YZ_Interpolate91:
;Stepper.c,457 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,458 :: 		if(d2 < 0)
LW	R2, Offset(Stepper_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate291
NOP	
J	L_YZ_Interpolate95
NOP	
L__YZ_Interpolate291:
;Stepper.c,459 :: 		d2 += 2 * SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_YZ_Interpolate96
NOP	
L_YZ_Interpolate95:
;Stepper.c,461 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
;Stepper.c,462 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,463 :: 		}
L_YZ_Interpolate96:
;Stepper.c,464 :: 		}
L_YZ_Interpolate94:
;Stepper.c,466 :: 		}
L_end_YZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _YZ_Interpolate
_Step_Cycle:
;Stepper.c,474 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,475 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,476 :: 		Pulse(axis_No);
JAL	_Pulse+0
NOP	
;Stepper.c,477 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_toggleOCx:
;Stepper.c,481 :: 		void toggleOCx(int axis_No){
;Stepper.c,482 :: 		switch(axis_No){
J	L_toggleOCx97
NOP	
;Stepper.c,483 :: 		case X: OC3R   = 0x5;
L_toggleOCx99:
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,484 :: 		OC3RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,485 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,486 :: 		OC3CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,487 :: 		break;
J	L_toggleOCx98
NOP	
;Stepper.c,488 :: 		case Y: OC5R   = 0x5;
L_toggleOCx100:
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,489 :: 		OC5RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+76)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,490 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,491 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,492 :: 		break;
J	L_toggleOCx98
NOP	
;Stepper.c,493 :: 		case Z: OC8R   = 0x5;
L_toggleOCx101:
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,494 :: 		OC8RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+144)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,495 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,496 :: 		OC8CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,497 :: 		break;
J	L_toggleOCx98
NOP	
;Stepper.c,498 :: 		default:
L_toggleOCx102:
;Stepper.c,499 :: 		break;
J	L_toggleOCx98
NOP	
;Stepper.c,500 :: 		}
L_toggleOCx97:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx295
NOP	
J	L_toggleOCx99
NOP	
L__toggleOCx295:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx297
NOP	
J	L_toggleOCx100
NOP	
L__toggleOCx297:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx299
NOP	
J	L_toggleOCx101
NOP	
L__toggleOCx299:
J	L_toggleOCx102
NOP	
L_toggleOCx98:
;Stepper.c,502 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,506 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,512 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse103
NOP	
;Stepper.c,513 :: 		case STOP:
L_Pulse105:
;Stepper.c,514 :: 		LATE7_bit = 0;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,515 :: 		T8IE_bit         = 0;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Stepper.c,516 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,517 :: 		break;
J	L_Pulse104
NOP	
;Stepper.c,519 :: 		case ACCEL:
L_Pulse106:
;Stepper.c,524 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,525 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__Pulse301
NOP	
J	L_Pulse107
NOP	
L__Pulse301:
;Stepper.c,527 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,528 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,529 :: 		}
L_Pulse107:
;Stepper.c,530 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
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
BNE	R2, R0, L__Pulse302
NOP	
J	L_Pulse108
NOP	
L__Pulse302:
;Stepper.c,531 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,532 :: 		}
L_Pulse108:
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
BEQ	R2, R0, L__Pulse303
NOP	
J	L_Pulse109
NOP	
L__Pulse303:
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
;Stepper.c,536 :: 		STPS[axis_No].run_state   = DECEL;
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
;Stepper.c,537 :: 		}
L_Pulse109:
;Stepper.c,538 :: 		break;
J	L_Pulse104
NOP	
;Stepper.c,540 :: 		case RUN:
L_Pulse110:
;Stepper.c,541 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,543 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse304
NOP	
J	L_Pulse111
NOP	
L__Pulse304:
;Stepper.c,544 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,545 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,547 :: 		STPS[axis_No].run_state   =  DECEL;
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
;Stepper.c,548 :: 		}
L_Pulse111:
;Stepper.c,549 :: 		break;
J	L_Pulse104
NOP	
;Stepper.c,551 :: 		case DECEL:
L_Pulse112:
;Stepper.c,556 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,560 :: 		if(STPS[axis_No].accel_count >= 0 ){
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
BEQ	R2, R0, L__Pulse305
NOP	
J	L_Pulse113
NOP	
L__Pulse305:
;Stepper.c,561 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,562 :: 		}
L_Pulse113:
;Stepper.c,563 :: 		break;
J	L_Pulse104
NOP	
;Stepper.c,564 :: 		default:break;
L_Pulse114:
J	L_Pulse104
NOP	
;Stepper.c,565 :: 		}
L_Pulse103:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse307
NOP	
J	L_Pulse105
NOP	
L__Pulse307:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse309
NOP	
J	L_Pulse106
NOP	
L__Pulse309:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse311
NOP	
J	L_Pulse110
NOP	
L__Pulse311:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse313
NOP	
J	L_Pulse112
NOP	
L__Pulse313:
J	L_Pulse114
NOP	
L_Pulse104:
;Stepper.c,566 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,567 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,571 :: 		void AccDec(int axis_No){
;Stepper.c,572 :: 		STPS[axis_No].accel_count++;
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
;Stepper.c,573 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
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
;Stepper.c,574 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
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
;Stepper.c,575 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
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
;Stepper.c,577 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_Axis_Enable:
;Stepper.c,582 :: 		void Axis_Enable(axis_combination axis){
;Stepper.c,583 :: 		switch(axis){
J	L_Axis_Enable115
NOP	
;Stepper.c,584 :: 		case xy:
L_Axis_Enable117:
;Stepper.c,585 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,586 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,587 :: 		break;
J	L_Axis_Enable116
NOP	
;Stepper.c,588 :: 		case xz:
L_Axis_Enable118:
;Stepper.c,589 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,590 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+8)(GP)
;Stepper.c,591 :: 		break;
J	L_Axis_Enable116
NOP	
;Stepper.c,592 :: 		case yz:
L_Axis_Enable119:
;Stepper.c,593 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,594 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+8)(GP)
;Stepper.c,595 :: 		break;
J	L_Axis_Enable116
NOP	
;Stepper.c,596 :: 		default:
L_Axis_Enable120:
;Stepper.c,597 :: 		break;
J	L_Axis_Enable116
NOP	
;Stepper.c,598 :: 		}
L_Axis_Enable115:
ANDI	R2, R25, 255
BNE	R2, R0, L__Axis_Enable317
NOP	
J	L_Axis_Enable117
NOP	
L__Axis_Enable317:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Axis_Enable319
NOP	
J	L_Axis_Enable118
NOP	
L__Axis_Enable319:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Axis_Enable321
NOP	
J	L_Axis_Enable119
NOP	
L__Axis_Enable321:
J	L_Axis_Enable120
NOP	
L_Axis_Enable116:
;Stepper.c,599 :: 		}
L_end_Axis_Enable:
JR	RA
NOP	
; end of _Axis_Enable
_disableOCx:
;Stepper.c,601 :: 		void disableOCx(){
;Stepper.c,602 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //X
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,603 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //Y
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,604 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,605 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_StepX:
;Stepper.c,610 :: 		void StepX() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,611 :: 		STPS[X].step_count++;
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,612 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,613 :: 		if(SV.Single_Dual == 0)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepX324
NOP	
J	L_StepX121
NOP	
L__StepX324:
;Stepper.c,614 :: 		SingleStepX();
JAL	_SingleStepX+0
NOP	
J	L_StepX122
NOP	
L_StepX121:
;Stepper.c,616 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepX122:
;Stepper.c,617 :: 		}
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
;Stepper.c,619 :: 		void SingleStepX(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,620 :: 		if(STPS[X].step_count >= STPS[X].dist){  //i think this is where the problem lies
SW	R25, 4(SP)
LW	R3, Offset(_STPS+36)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepX326
NOP	
J	L_SingleStepX123
NOP	
L__SingleStepX326:
;Stepper.c,621 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,622 :: 		}
J	L_SingleStepX124
NOP	
L_SingleStepX123:
;Stepper.c,624 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,625 :: 		}
L_SingleStepX124:
;Stepper.c,626 :: 		}
L_end_SingleStepX:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepX
_StopX:
;Stepper.c,629 :: 		void StopX(){
;Stepper.c,630 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,631 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,632 :: 		}
L_end_StopX:
JR	RA
NOP	
; end of _StopX
_StepY:
;Stepper.c,638 :: 		void StepY() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,639 :: 		STPS[Y].step_count++;
LW	R2, Offset(_STPS+100)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+100)(GP)
;Stepper.c,640 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,641 :: 		if(SV.Single_Dual == 0)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepY329
NOP	
J	L_StepY125
NOP	
L__StepY329:
;Stepper.c,642 :: 		SingleStepY();
JAL	_SingleStepY+0
NOP	
J	L_StepY126
NOP	
L_StepY125:
;Stepper.c,644 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepY126:
;Stepper.c,645 :: 		}
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
;Stepper.c,647 :: 		void SingleStepY(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,648 :: 		if(STPS[Y].step_count >= STPS[Y].dist){  //i think this is where the problem lies
SW	R25, 4(SP)
LW	R3, Offset(_STPS+104)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepY331
NOP	
J	L_SingleStepY127
NOP	
L__SingleStepY331:
;Stepper.c,649 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,650 :: 		}
J	L_SingleStepY128
NOP	
L_SingleStepY127:
;Stepper.c,652 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,653 :: 		}
L_SingleStepY128:
;Stepper.c,654 :: 		}
L_end_SingleStepY:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepY
_StopY:
;Stepper.c,656 :: 		void StopY(){
;Stepper.c,657 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,658 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,659 :: 		}
L_end_StopY:
JR	RA
NOP	
; end of _StopY
_StepZ:
;Stepper.c,665 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_8 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,666 :: 		STPS[Z].step_count++;
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+168)(GP)
;Stepper.c,667 :: 		OC8IF_bit = 0;
LUI	R2, BitMask(OC8IF_bit+0)
ORI	R2, R2, BitMask(OC8IF_bit+0)
_SX	
;Stepper.c,668 :: 		if(!SV.Single_Dual)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepZ334
NOP	
J	L_StepZ129
NOP	
L__StepZ334:
;Stepper.c,669 :: 		SingleStepZ();
JAL	_SingleStepZ+0
NOP	
J	L_StepZ130
NOP	
L_StepZ129:
;Stepper.c,671 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepZ130:
;Stepper.c,673 :: 		}
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
;Stepper.c,675 :: 		void SingleStepZ(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,676 :: 		if(STPS[Z].step_count >= STPS[Z].dist){
SW	R25, 4(SP)
LW	R3, Offset(_STPS+172)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepZ336
NOP	
J	L_SingleStepZ131
NOP	
L__SingleStepZ336:
;Stepper.c,677 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,678 :: 		}
J	L_SingleStepZ132
NOP	
L_SingleStepZ131:
;Stepper.c,680 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,681 :: 		}
L_SingleStepZ132:
;Stepper.c,682 :: 		}
L_end_SingleStepZ:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepZ
_StopZ:
;Stepper.c,684 :: 		void StopZ(){
;Stepper.c,685 :: 		OC8IE_bit = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
;Stepper.c,686 :: 		OC8CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+4)(GP)
;Stepper.c,687 :: 		}
L_end_StopZ:
JR	RA
NOP	
; end of _StopZ
_min_:
;Stepper.c,698 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,699 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_339
NOP	
J	L_min_133
NOP	
L__min_339:
;Stepper.c,700 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,701 :: 		}
L_min_133:
;Stepper.c,703 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,705 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
Stepper_sqrt_:
;Stepper.c,715 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,721 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,722 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,723 :: 		do
J	L_Stepper_sqrt_135
NOP	
L_Stepper_sqrt_185:
;Stepper.c,737 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,723 :: 		do
L_Stepper_sqrt_135:
;Stepper.c,725 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_341
NOP	
J	L_Stepper_sqrt_138
NOP	
L_Stepper_sqrt_341:
;Stepper.c,727 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,728 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,729 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_139
NOP	
L_Stepper_sqrt_138:
;Stepper.c,731 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,732 :: 		}
L_Stepper_sqrt_139:
;Stepper.c,733 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,734 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_343
NOP	
J	L_Stepper_sqrt_186
NOP	
L_Stepper_sqrt_343:
; f end address is: 16 (R4)
;Stepper.c,735 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,736 :: 		}
J	L_Stepper_sqrt_140
NOP	
L_Stepper_sqrt_186:
;Stepper.c,734 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,736 :: 		}
L_Stepper_sqrt_140:
;Stepper.c,737 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_344
NOP	
J	L_Stepper_sqrt_185
NOP	
L_Stepper_sqrt_344:
; q2 end address is: 12 (R3)
;Stepper.c,738 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_345
NOP	
J	L_Stepper_sqrt_141
NOP	
L_Stepper_sqrt_345:
;Stepper.c,739 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,740 :: 		}
L_Stepper_sqrt_141:
;Stepper.c,742 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,744 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_CalcRadius:
;Stepper.c,747 :: 		void CalcRadius(Circle* cir){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,750 :: 		cir->xRad = fabs(cir->xStart + cir->I);
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
;Stepper.c,751 :: 		cir->yRad = fabs(cir->yStart + cir->J);
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
;Stepper.c,752 :: 		cir->radius = sqrt((cir->xRad*cir->xRad) + (cir->yRad*cir->yRad));
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
;Stepper.c,753 :: 		angA = atan2(cir->yRad,cir->xRad);
ADDIU	R2, R25, 48
LWC1	S1, 0(R2)
ADDIU	R2, R25, 52
LWC1	S0, 0(R2)
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
;Stepper.c,756 :: 		cir->degreeDeg = angA * rad2deg;
ADDIU	R3, R25, 4
LUI	R2, 16997
ORI	R2, R2, 12013
MTC1	R2, S1
MUL.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Stepper.c,758 :: 		cir->quadrant_start = QuadrantStart(cir->I,cir->J);
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
;Stepper.c,760 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius348
NOP	
J	L__CalcRadius214
NOP	
L__CalcRadius348:
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius350
NOP	
J	L__CalcRadius213
NOP	
L__CalcRadius350:
J	L_CalcRadius145
NOP	
L__CalcRadius214:
L__CalcRadius213:
;Stepper.c,761 :: 		angB = cir->deg - cir->degreeDeg;
LWC1	S1, 0(R25)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius145:
;Stepper.c,762 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius352
NOP	
J	L__CalcRadius216
NOP	
L__CalcRadius352:
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius354
NOP	
J	L__CalcRadius215
NOP	
L__CalcRadius354:
J	L_CalcRadius148
NOP	
L__CalcRadius216:
L__CalcRadius215:
;Stepper.c,763 :: 		angB = cir->deg + cir->degreeDeg;
LWC1	S1, 0(R25)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius148:
;Stepper.c,765 :: 		cir->degreeRadians = angB * deg2rad;
ADDIU	R3, R25, 8
LWC1	S1, 8(SP)
LUI	R2, 15502
ORI	R2, R2, 64046
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, 0(R3)
;Stepper.c,766 :: 		}
L_end_CalcRadius:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _CalcRadius
_QuadrantStart:
;Stepper.c,768 :: 		int QuadrantStart(float i,float j){
;Stepper.c,769 :: 		if((i <= 0)&&(j >= 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__QuadrantStart356
NOP	
J	L__QuadrantStart204
NOP	
L__QuadrantStart356:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S13, S0
BC1F	0, L__QuadrantStart357
NOP	
J	L__QuadrantStart203
NOP	
L__QuadrantStart357:
L__QuadrantStart202:
;Stepper.c,770 :: 		return 1;
ORI	R2, R0, 1
J	L_end_QuadrantStart
NOP	
;Stepper.c,769 :: 		if((i <= 0)&&(j >= 0))
L__QuadrantStart204:
L__QuadrantStart203:
;Stepper.c,771 :: 		else if((i > 0)&&(j > 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart358
NOP	
J	L__QuadrantStart206
NOP	
L__QuadrantStart358:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S13, S0
BC1F	0, L__QuadrantStart359
NOP	
J	L__QuadrantStart205
NOP	
L__QuadrantStart359:
L__QuadrantStart201:
;Stepper.c,772 :: 		return 2;
ORI	R2, R0, 2
J	L_end_QuadrantStart
NOP	
;Stepper.c,771 :: 		else if((i > 0)&&(j > 0))
L__QuadrantStart206:
L__QuadrantStart205:
;Stepper.c,773 :: 		else if((i > 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart360
NOP	
J	L__QuadrantStart208
NOP	
L__QuadrantStart360:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart361
NOP	
J	L__QuadrantStart207
NOP	
L__QuadrantStart361:
L__QuadrantStart200:
;Stepper.c,774 :: 		return 3;
ORI	R2, R0, 3
J	L_end_QuadrantStart
NOP	
;Stepper.c,773 :: 		else if((i > 0)&&(j < 0))
L__QuadrantStart208:
L__QuadrantStart207:
;Stepper.c,775 :: 		else if((i < 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__QuadrantStart362
NOP	
J	L__QuadrantStart210
NOP	
L__QuadrantStart362:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart363
NOP	
J	L__QuadrantStart209
NOP	
L__QuadrantStart363:
L__QuadrantStart199:
;Stepper.c,776 :: 		return 4;
ORI	R2, R0, 4
J	L_end_QuadrantStart
NOP	
;Stepper.c,775 :: 		else if((i < 0)&&(j < 0))
L__QuadrantStart210:
L__QuadrantStart209:
;Stepper.c,778 :: 		return 0;
MOVZ	R2, R0, R0
;Stepper.c,779 :: 		}
L_end_QuadrantStart:
JR	RA
NOP	
; end of _QuadrantStart
_CircDir:
;Stepper.c,781 :: 		void CircDir(Circle* cir){
;Stepper.c,783 :: 		if(cir->dir == CW){
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__CircDir365
NOP	
J	L_CircDir165
NOP	
L__CircDir365:
;Stepper.c,784 :: 		newDeg = 360 / cir->deg;
LWC1	S1, 0(R25)
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S2, S0, S1
; newDeg start address is: 24 (R6)
MOV.S 	S3, S2
;Stepper.c,785 :: 		cir->N = (2*Pi*cir->radius)/newDeg;
ADDIU	R3, R25, 36
ADDIU	R2, R25, 40
LWC1	S1, 0(R2)
LUI	R2, 16585
ORI	R2, R2, 4048
MTC1	R2, S0
MUL.S 	S0, S0, S1
DIV.S 	S0, S0, S2
SWC1	S0, 0(R3)
;Stepper.c,786 :: 		cir->divisor = cir->deg / newDeg;
ADDIU	R2, R25, 20
LWC1	S0, 0(R25)
DIV.S 	S0, S0, S3
; newDeg end address is: 24 (R6)
SWC1	S0, 0(R2)
;Stepper.c,787 :: 		}
L_CircDir165:
;Stepper.c,789 :: 		if(cir->dir == CW)
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__CircDir366
NOP	
J	L_CircDir166
NOP	
L__CircDir366:
;Stepper.c,790 :: 		cir->deg = 0.00;
SW	R0, 0(R25)
L_CircDir166:
;Stepper.c,791 :: 		if(cir->dir == CCW)
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__CircDir367
NOP	
J	L_CircDir167
NOP	
L__CircDir367:
;Stepper.c,792 :: 		cir->deg = 360.00;
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
SWC1	S0, 0(R25)
L_CircDir167:
;Stepper.c,793 :: 		}
L_end_CircDir:
JR	RA
NOP	
; end of _CircDir
_Cir_Interpolation:
;Stepper.c,795 :: 		void Cir_Interpolation(float xPresent,float yPresent,Circle* cir){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,797 :: 		cir->xStart = xPresent;
ADDIU	R2, R25, 56
SWC1	S12, 0(R2)
;Stepper.c,798 :: 		cir->yStart = yPresent;
ADDIU	R2, R25, 60
SWC1	S13, 0(R2)
;Stepper.c,799 :: 		CalcRadius(cir);
JAL	_CalcRadius+0
NOP	
;Stepper.c,802 :: 		while(quad){
LH	R2, Offset(Cir_Interpolation_quad_L0+0)(GP)
BNE	R2, R0, L__Cir_Interpolation370
NOP	
J	L_Cir_Interpolation169
NOP	
L__Cir_Interpolation370:
;Stepper.c,813 :: 		}
L_Cir_Interpolation169:
;Stepper.c,814 :: 		}
L_end_Cir_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Cir_Interpolation
_CycleStop:
;Stepper.c,838 :: 		void CycleStop(){
;Stepper.c,840 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,841 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop176:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 3
BNE	R2, R0, L__CycleStop372
NOP	
J	L_CycleStop177
NOP	
L__CycleStop372:
;Stepper.c,842 :: 		STPS[ii].microSec = 0;
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,843 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 4
BEQ	R2, R0, L__CycleStop373
NOP	
J	L_CycleStop179
NOP	
L__CycleStop373:
; ii end address is: 16 (R4)
J	L_CycleStop177
NOP	
L_CycleStop179:
;Stepper.c,841 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,844 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop176
NOP	
L_CycleStop177:
;Stepper.c,845 :: 		}
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
;Stepper.c,847 :: 		void CycleStart(){
;Stepper.c,850 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__CycleStart375
NOP	
J	L_CycleStart180
NOP	
L__CycleStart375:
;Stepper.c,851 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart181:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 3
BNE	R2, R0, L__CycleStart376
NOP	
J	L_CycleStart182
NOP	
L__CycleStart376:
;Stepper.c,852 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 4
BEQ	R2, R0, L__CycleStart377
NOP	
J	L_CycleStart184
NOP	
L__CycleStart377:
; ii end address is: 16 (R4)
J	L_CycleStart182
NOP	
L_CycleStart184:
;Stepper.c,853 :: 		STPS[ii].microSec++;
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
;Stepper.c,851 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,854 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart181
NOP	
L_CycleStart182:
;Stepper.c,855 :: 		}
L_CycleStart180:
;Stepper.c,856 :: 		}
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
