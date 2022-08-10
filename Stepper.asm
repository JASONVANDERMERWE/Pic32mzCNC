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
BEQ	R25, R2, L__speed_cntr_Move243
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move243:
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
BNE	R25, R0, L__speed_cntr_Move245
NOP	
J	L__speed_cntr_Move199
NOP	
L__speed_cntr_Move245:
JAL	_abs+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__speed_cntr_Move247
NOP	
J	L__speed_cntr_Move198
NOP	
L__speed_cntr_Move247:
L__speed_cntr_Move197:
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
BEQ	R2, R0, L__speed_cntr_Move248
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move248:
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
BEQ	R2, R0, L__speed_cntr_Move249
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move249:
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
BEQ	R2, R0, L__speed_cntr_Move250
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move250:
;Stepper.c,180 :: 		if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move251
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move251:
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
BEQ	R2, R0, L__speed_cntr_Move252
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move252:
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
BNE	R2, R0, L__speed_cntr_Move253
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move253:
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
BNE	R2, R0, L__speed_cntr_Move254
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move254:
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
BEQ	R2, R0, L__speed_cntr_Move255
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move255:
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
BEQ	R2, R0, L__speed_cntr_Move256
NOP	
J	L_speed_cntr_Move18
NOP	
L__speed_cntr_Move256:
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
L__speed_cntr_Move199:
L__speed_cntr_Move198:
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
;Stepper.c,218 :: 		SV.running = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,219 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_SingleAxisStep:
;Stepper.c,227 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,233 :: 		SV.Single_Dual = 0;
SW	R25, 4(SP)
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,234 :: 		switch(axis_No){
J	L_SingleAxisStep20
NOP	
;Stepper.c,235 :: 		case 0:OC3IE_bit = 1;OC3CONbits.ON = 1;
L_SingleAxisStep22:
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,238 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,239 :: 		case 1://OC3IE_bit = 0;OC3CONbits.ON = 0;
L_SingleAxisStep23:
;Stepper.c,240 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,242 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,243 :: 		case 2://OC3IE_bit = 0;OC3CONbits.ON = 0;
L_SingleAxisStep24:
;Stepper.c,245 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,246 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,247 :: 		default: break;
L_SingleAxisStep25:
J	L_SingleAxisStep21
NOP	
;Stepper.c,248 :: 		}
L_SingleAxisStep20:
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep259
NOP	
J	L_SingleAxisStep22
NOP	
L__SingleAxisStep259:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep261
NOP	
J	L_SingleAxisStep23
NOP	
L__SingleAxisStep261:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep263
NOP	
J	L_SingleAxisStep24
NOP	
L__SingleAxisStep263:
J	L_SingleAxisStep25
NOP	
L_SingleAxisStep21:
;Stepper.c,249 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+40)(GP)
;Stepper.c,250 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R25, 0(R2)
;Stepper.c,251 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
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
;Stepper.c,253 :: 		if(newxyz < 0)
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep264
NOP	
J	L_SingleAxisStep26
NOP	
L__SingleAxisStep264:
;Stepper.c,254 :: 		dir = CCW;
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep27
NOP	
L_SingleAxisStep26:
;Stepper.c,256 :: 		dir = CW;
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep27:
;Stepper.c,258 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep28
NOP	
;Stepper.c,259 :: 		case X:
L_SingleAxisStep30:
;Stepper.c,260 :: 		DIR_StepX = dir;
_LX	
INS	R2, R4, BitPos(LATG0_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,261 :: 		break;
J	L_SingleAxisStep29
NOP	
;Stepper.c,262 :: 		case Y:
L_SingleAxisStep31:
;Stepper.c,263 :: 		DIR_StepY = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(LATD5_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,264 :: 		break;
J	L_SingleAxisStep29
NOP	
;Stepper.c,265 :: 		case Z:
L_SingleAxisStep32:
;Stepper.c,266 :: 		DIR_StepZ = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(LATG12_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,267 :: 		break;
J	L_SingleAxisStep29
NOP	
;Stepper.c,268 :: 		default: break;
L_SingleAxisStep33:
J	L_SingleAxisStep29
NOP	
;Stepper.c,269 :: 		}
L_SingleAxisStep28:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep266
NOP	
J	L_SingleAxisStep30
NOP	
L__SingleAxisStep266:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep268
NOP	
J	L_SingleAxisStep31
NOP	
L__SingleAxisStep268:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep270
NOP	
J	L_SingleAxisStep32
NOP	
L__SingleAxisStep270:
; dir end address is: 16 (R4)
J	L_SingleAxisStep33
NOP	
L_SingleAxisStep29:
;Stepper.c,271 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,273 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Stepper.c,275 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Stepper.c,280 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,283 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+44)(GP)
;Stepper.c,286 :: 		SV.px = 0;
SW	R0, Offset(_SV+28)(GP)
;Stepper.c,287 :: 		SV.py = 0;
SW	R0, Offset(_SV+32)(GP)
;Stepper.c,288 :: 		SV.pz = 0;
SW	R0, Offset(_SV+36)(GP)
;Stepper.c,292 :: 		SV.Single_Dual = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,293 :: 		switch(axis_combo){
J	L_DualAxisStep34
NOP	
;Stepper.c,294 :: 		case xy:
L_DualAxisStep36:
;Stepper.c,295 :: 		AxisPulse = XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Stepper.c,296 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Stepper.c,297 :: 		Axis_Enable(axis_xyz);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_Axis_Enable+0
NOP	
LW	R25, 8(SP)
;Stepper.c,300 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,301 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,304 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep272
NOP	
J	L_DualAxisStep37
NOP	
L__DualAxisStep272:
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
;Stepper.c,305 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep273
NOP	
J	L_DualAxisStep39
NOP	
L__DualAxisStep273:
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
;Stepper.c,308 :: 		if(SV.dirx < 0)
LH	R2, Offset(_SV+56)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep274
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep274:
;Stepper.c,309 :: 		DIR_StepX = CCW;
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
J	L_DualAxisStep42
NOP	
L_DualAxisStep41:
;Stepper.c,311 :: 		DIR_StepX = CW;
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
L_DualAxisStep42:
;Stepper.c,313 :: 		if(SV.diry < 0)
LH	R2, Offset(_SV+58)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep275
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep275:
;Stepper.c,314 :: 		DIR_StepY = CCW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_DualAxisStep44
NOP	
L_DualAxisStep43:
;Stepper.c,316 :: 		DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_DualAxisStep44:
;Stepper.c,318 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,319 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,321 :: 		if(SV.dx > SV.dy)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep276
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep276:
;Stepper.c,322 :: 		SV.d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep46
NOP	
L_DualAxisStep45:
;Stepper.c,324 :: 		SV.d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep46:
;Stepper.c,326 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Stepper.c,327 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Stepper.c,328 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Stepper.c,330 :: 		break;
J	L_DualAxisStep35
NOP	
;Stepper.c,331 :: 		case xz:
L_DualAxisStep47:
;Stepper.c,332 :: 		AxisPulse = XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Stepper.c,333 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Stepper.c,334 :: 		Axis_Enable(axis_xyz);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_Axis_Enable+0
NOP	
LW	R25, 8(SP)
;Stepper.c,336 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,337 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,340 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep277
NOP	
J	L_DualAxisStep48
NOP	
L__DualAxisStep277:
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
;Stepper.c,341 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep278
NOP	
J	L_DualAxisStep50
NOP	
L__DualAxisStep278:
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
;Stepper.c,344 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+56)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep279
NOP	
J	L_DualAxisStep52
NOP	
L__DualAxisStep279:
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
J	L_DualAxisStep53
NOP	
L_DualAxisStep52:
;Stepper.c,345 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
L_DualAxisStep53:
;Stepper.c,347 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+60)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep280
NOP	
J	L_DualAxisStep54
NOP	
L__DualAxisStep280:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_DualAxisStep55
NOP	
L_DualAxisStep54:
;Stepper.c,348 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_DualAxisStep55:
;Stepper.c,350 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,351 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,353 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep281
NOP	
J	L_DualAxisStep56
NOP	
L__DualAxisStep281:
J	L_DualAxisStep57
NOP	
L_DualAxisStep56:
;Stepper.c,354 :: 		else d2 = 2* (SV.dx - SV.dz);
L_DualAxisStep57:
;Stepper.c,356 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Stepper.c,357 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Stepper.c,358 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Stepper.c,359 :: 		break;
J	L_DualAxisStep35
NOP	
;Stepper.c,360 :: 		case yz:
L_DualAxisStep58:
;Stepper.c,361 :: 		AxisPulse = YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Stepper.c,362 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Stepper.c,363 :: 		Axis_Enable(axis_xyz);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_Axis_Enable+0
NOP	
LW	R25, 8(SP)
;Stepper.c,366 :: 		SV.dy   = newx - SV.pz;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,367 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,370 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep282
NOP	
J	L_DualAxisStep59
NOP	
L__DualAxisStep282:
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
;Stepper.c,371 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep283
NOP	
J	L_DualAxisStep61
NOP	
L__DualAxisStep283:
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
;Stepper.c,374 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+58)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep284
NOP	
J	L_DualAxisStep63
NOP	
L__DualAxisStep284:
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_DualAxisStep64
NOP	
L_DualAxisStep63:
;Stepper.c,375 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_DualAxisStep64:
;Stepper.c,376 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+60)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep285
NOP	
J	L_DualAxisStep65
NOP	
L__DualAxisStep285:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_DualAxisStep66
NOP	
L_DualAxisStep65:
;Stepper.c,377 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_DualAxisStep66:
;Stepper.c,379 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,380 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,382 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep286
NOP	
J	L_DualAxisStep67
NOP	
L__DualAxisStep286:
J	L_DualAxisStep68
NOP	
L_DualAxisStep67:
;Stepper.c,383 :: 		else d2 = 2* (SV.dy - SV.dz);
L_DualAxisStep68:
;Stepper.c,385 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Stepper.c,386 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Stepper.c,387 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Stepper.c,388 :: 		break;
J	L_DualAxisStep35
NOP	
;Stepper.c,389 :: 		default: break;
L_DualAxisStep69:
J	L_DualAxisStep35
NOP	
;Stepper.c,391 :: 		}
L_DualAxisStep34:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep288
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep288:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep290
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep290:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep292
NOP	
J	L_DualAxisStep58
NOP	
L__DualAxisStep292:
J	L_DualAxisStep69
NOP	
L_DualAxisStep35:
;Stepper.c,392 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _DualAxisStep
_XY_Interpolate:
;Stepper.c,396 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,398 :: 		if(SV.dx > SV.dy){
SW	R25, 4(SP)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XY_Interpolate294
NOP	
J	L_XY_Interpolate70
NOP	
L__XY_Interpolate294:
;Stepper.c,399 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate295
NOP	
J	L__XY_Interpolate203
NOP	
L__XY_Interpolate295:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate296
NOP	
J	L__XY_Interpolate202
NOP	
L__XY_Interpolate296:
J	L_XY_Interpolate73
NOP	
L__XY_Interpolate203:
L__XY_Interpolate202:
;Stepper.c,400 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,401 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,402 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Stepper.c,403 :: 		}
L_XY_Interpolate73:
;Stepper.c,404 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,405 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate297
NOP	
J	L_XY_Interpolate74
NOP	
L__XY_Interpolate297:
;Stepper.c,406 :: 		SV.d2 += 2*SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,407 :: 		}else{
J	L_XY_Interpolate75
NOP	
L_XY_Interpolate74:
;Stepper.c,408 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,409 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,410 :: 		}
L_XY_Interpolate75:
;Stepper.c,411 :: 		}else{
J	L_XY_Interpolate76
NOP	
L_XY_Interpolate70:
;Stepper.c,412 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[X].step_count > SV.dx)){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate298
NOP	
J	L__XY_Interpolate205
NOP	
L__XY_Interpolate298:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate299
NOP	
J	L__XY_Interpolate204
NOP	
L__XY_Interpolate299:
J	L_XY_Interpolate79
NOP	
L__XY_Interpolate205:
L__XY_Interpolate204:
;Stepper.c,413 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,414 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,415 :: 		return;// ++STPS[Y].step_count;
J	L_end_XY_Interpolate
NOP	
;Stepper.c,416 :: 		}
L_XY_Interpolate79:
;Stepper.c,417 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,418 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate300
NOP	
J	L_XY_Interpolate80
NOP	
L__XY_Interpolate300:
;Stepper.c,419 :: 		SV.d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,420 :: 		}else{
J	L_XY_Interpolate81
NOP	
L_XY_Interpolate80:
;Stepper.c,421 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,422 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,423 :: 		}
L_XY_Interpolate81:
;Stepper.c,424 :: 		}
L_XY_Interpolate76:
;Stepper.c,425 :: 		}
L_end_XY_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XY_Interpolate
_XZ_Interpolate:
;Stepper.c,427 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,429 :: 		if(SV.dx > SV.dz){
SW	R25, 4(SP)
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XZ_Interpolate302
NOP	
J	L_XZ_Interpolate82
NOP	
L__XZ_Interpolate302:
;Stepper.c,430 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate303
NOP	
J	L__XZ_Interpolate209
NOP	
L__XZ_Interpolate303:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate304
NOP	
J	L__XZ_Interpolate208
NOP	
L__XZ_Interpolate304:
J	L_XZ_Interpolate85
NOP	
L__XZ_Interpolate209:
L__XZ_Interpolate208:
;Stepper.c,431 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,432 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,433 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Stepper.c,434 :: 		}
L_XZ_Interpolate85:
;Stepper.c,435 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,436 :: 		if(d2 < 0)
LW	R2, Offset(Stepper_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate305
NOP	
J	L_XZ_Interpolate86
NOP	
L__XZ_Interpolate305:
;Stepper.c,437 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_XZ_Interpolate87
NOP	
L_XZ_Interpolate86:
;Stepper.c,439 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
;Stepper.c,440 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,441 :: 		}
L_XZ_Interpolate87:
;Stepper.c,443 :: 		}else{
J	L_XZ_Interpolate88
NOP	
L_XZ_Interpolate82:
;Stepper.c,444 :: 		if((STPS[Z].step_count > SV.dz)||(STPS[X].step_count > SV.dx)){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate306
NOP	
J	L__XZ_Interpolate211
NOP	
L__XZ_Interpolate306:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate307
NOP	
J	L__XZ_Interpolate210
NOP	
L__XZ_Interpolate307:
J	L_XZ_Interpolate91
NOP	
L__XZ_Interpolate211:
L__XZ_Interpolate210:
;Stepper.c,445 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,446 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,447 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Stepper.c,448 :: 		}
L_XZ_Interpolate91:
;Stepper.c,449 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,450 :: 		if(d2 < 0)
LW	R2, Offset(Stepper_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate308
NOP	
J	L_XZ_Interpolate92
NOP	
L__XZ_Interpolate308:
;Stepper.c,451 :: 		d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_XZ_Interpolate93
NOP	
L_XZ_Interpolate92:
;Stepper.c,453 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
;Stepper.c,454 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,455 :: 		}
L_XZ_Interpolate93:
;Stepper.c,456 :: 		}
L_XZ_Interpolate88:
;Stepper.c,457 :: 		}
L_end_XZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XZ_Interpolate
_YZ_Interpolate:
;Stepper.c,459 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,461 :: 		if(SV.dy > SV.dz){
SW	R25, 4(SP)
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__YZ_Interpolate310
NOP	
J	L_YZ_Interpolate94
NOP	
L__YZ_Interpolate310:
;Stepper.c,462 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate311
NOP	
J	L__YZ_Interpolate215
NOP	
L__YZ_Interpolate311:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate312
NOP	
J	L__YZ_Interpolate214
NOP	
L__YZ_Interpolate312:
J	L_YZ_Interpolate97
NOP	
L__YZ_Interpolate215:
L__YZ_Interpolate214:
;Stepper.c,463 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,464 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,465 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Stepper.c,466 :: 		}
L_YZ_Interpolate97:
;Stepper.c,467 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,468 :: 		if(d2 < 0)
LW	R2, Offset(Stepper_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate313
NOP	
J	L_YZ_Interpolate98
NOP	
L__YZ_Interpolate313:
;Stepper.c,469 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_YZ_Interpolate99
NOP	
L_YZ_Interpolate98:
;Stepper.c,471 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
;Stepper.c,472 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,473 :: 		}
L_YZ_Interpolate99:
;Stepper.c,474 :: 		}else{
J	L_YZ_Interpolate100
NOP	
L_YZ_Interpolate94:
;Stepper.c,475 :: 		if((STPS[Z].step_count > SV.dz)||(STPS[Y].step_count > SV.dy)){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate314
NOP	
J	L__YZ_Interpolate217
NOP	
L__YZ_Interpolate314:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate315
NOP	
J	L__YZ_Interpolate216
NOP	
L__YZ_Interpolate315:
J	L_YZ_Interpolate103
NOP	
L__YZ_Interpolate217:
L__YZ_Interpolate216:
;Stepper.c,476 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,477 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,478 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Stepper.c,479 :: 		}
L_YZ_Interpolate103:
;Stepper.c,480 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,481 :: 		if(d2 < 0)
LW	R2, Offset(Stepper_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate316
NOP	
J	L_YZ_Interpolate104
NOP	
L__YZ_Interpolate316:
;Stepper.c,482 :: 		d2 += 2 * SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_YZ_Interpolate105
NOP	
L_YZ_Interpolate104:
;Stepper.c,484 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
;Stepper.c,485 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,486 :: 		}
L_YZ_Interpolate105:
;Stepper.c,487 :: 		}
L_YZ_Interpolate100:
;Stepper.c,489 :: 		}
L_end_YZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _YZ_Interpolate
_Step_Cycle:
;Stepper.c,497 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,498 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,499 :: 		Pulse(axis_No);
JAL	_Pulse+0
NOP	
;Stepper.c,500 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_toggleOCx:
;Stepper.c,504 :: 		void toggleOCx(int axis_No){
;Stepper.c,505 :: 		switch(axis_No){
J	L_toggleOCx106
NOP	
;Stepper.c,506 :: 		case X: OC3R   = 0x5;
L_toggleOCx108:
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,507 :: 		OC3RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,508 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,509 :: 		OC3CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,510 :: 		break;
J	L_toggleOCx107
NOP	
;Stepper.c,511 :: 		case Y: OC5R   = 0x5;
L_toggleOCx109:
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,512 :: 		OC5RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+76)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,513 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,514 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,515 :: 		break;
J	L_toggleOCx107
NOP	
;Stepper.c,516 :: 		case Z: OC8R   = 0x5;
L_toggleOCx110:
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,517 :: 		OC8RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+144)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,518 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,519 :: 		OC8CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,520 :: 		break;
J	L_toggleOCx107
NOP	
;Stepper.c,521 :: 		default:
L_toggleOCx111:
;Stepper.c,522 :: 		break;
J	L_toggleOCx107
NOP	
;Stepper.c,523 :: 		}
L_toggleOCx106:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx320
NOP	
J	L_toggleOCx108
NOP	
L__toggleOCx320:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx322
NOP	
J	L_toggleOCx109
NOP	
L__toggleOCx322:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx324
NOP	
J	L_toggleOCx110
NOP	
L__toggleOCx324:
J	L_toggleOCx111
NOP	
L_toggleOCx107:
;Stepper.c,525 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,529 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,531 :: 		if(!STPS[axis_No].PLS_Step_ ){
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
BEQ	R2, R0, L__Pulse326
NOP	
J	L_Pulse112
NOP	
L__Pulse326:
;Stepper.c,532 :: 		STPS[axis_No].PLS_Step_   = 1;
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
;Stepper.c,533 :: 		}
L_Pulse112:
;Stepper.c,535 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse113
NOP	
;Stepper.c,536 :: 		case STOP:
L_Pulse115:
;Stepper.c,537 :: 		LATE7_bit = 0;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,538 :: 		T8IE_bit         = 0;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Stepper.c,539 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,540 :: 		break;
J	L_Pulse114
NOP	
;Stepper.c,542 :: 		case ACCEL:
L_Pulse116:
;Stepper.c,543 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,548 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__Pulse327
NOP	
J	L_Pulse117
NOP	
L__Pulse327:
;Stepper.c,550 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,551 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,552 :: 		}
L_Pulse117:
;Stepper.c,553 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
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
BNE	R2, R0, L__Pulse328
NOP	
J	L_Pulse118
NOP	
L__Pulse328:
;Stepper.c,554 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,555 :: 		}
L_Pulse118:
;Stepper.c,556 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse329
NOP	
J	L_Pulse119
NOP	
L__Pulse329:
;Stepper.c,557 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,558 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,559 :: 		STPS[axis_No].run_state   = DECEL;
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
;Stepper.c,560 :: 		}
L_Pulse119:
;Stepper.c,561 :: 		break;
J	L_Pulse114
NOP	
;Stepper.c,563 :: 		case RUN:
L_Pulse120:
;Stepper.c,564 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,566 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse330
NOP	
J	L_Pulse121
NOP	
L__Pulse330:
;Stepper.c,567 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,568 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,570 :: 		STPS[axis_No].run_state   =  DECEL;
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
;Stepper.c,571 :: 		}
L_Pulse121:
;Stepper.c,572 :: 		break;
J	L_Pulse114
NOP	
;Stepper.c,574 :: 		case DECEL:
L_Pulse122:
;Stepper.c,577 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,578 :: 		if(STPS[axis_No].accel_count >= -2 ){
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
BEQ	R2, R0, L__Pulse331
NOP	
J	L_Pulse123
NOP	
L__Pulse331:
;Stepper.c,579 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,580 :: 		}
L_Pulse123:
;Stepper.c,581 :: 		break;
J	L_Pulse114
NOP	
;Stepper.c,582 :: 		default:break;
L_Pulse124:
J	L_Pulse114
NOP	
;Stepper.c,583 :: 		}
L_Pulse113:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse333
NOP	
J	L_Pulse115
NOP	
L__Pulse333:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse335
NOP	
J	L_Pulse116
NOP	
L__Pulse335:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse337
NOP	
J	L_Pulse120
NOP	
L__Pulse337:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse339
NOP	
J	L_Pulse122
NOP	
L__Pulse339:
J	L_Pulse124
NOP	
L_Pulse114:
;Stepper.c,584 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,585 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,589 :: 		void AccDec(int axis_No){
;Stepper.c,590 :: 		STPS[axis_No].accel_count++;
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
;Stepper.c,591 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
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
;Stepper.c,592 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
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
;Stepper.c,593 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
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
;Stepper.c,595 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_Axis_Enable:
;Stepper.c,600 :: 		void Axis_Enable(axis_combination axis){
;Stepper.c,601 :: 		switch(axis){
J	L_Axis_Enable125
NOP	
;Stepper.c,602 :: 		case xy:
L_Axis_Enable127:
;Stepper.c,603 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,604 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,605 :: 		break;
J	L_Axis_Enable126
NOP	
;Stepper.c,606 :: 		case xz:
L_Axis_Enable128:
;Stepper.c,607 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,608 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+8)(GP)
;Stepper.c,609 :: 		break;
J	L_Axis_Enable126
NOP	
;Stepper.c,610 :: 		case yz:
L_Axis_Enable129:
;Stepper.c,611 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,612 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+8)(GP)
;Stepper.c,613 :: 		break;
J	L_Axis_Enable126
NOP	
;Stepper.c,614 :: 		default:
L_Axis_Enable130:
;Stepper.c,615 :: 		break;
J	L_Axis_Enable126
NOP	
;Stepper.c,616 :: 		}
L_Axis_Enable125:
ANDI	R2, R25, 255
BNE	R2, R0, L__Axis_Enable343
NOP	
J	L_Axis_Enable127
NOP	
L__Axis_Enable343:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Axis_Enable345
NOP	
J	L_Axis_Enable128
NOP	
L__Axis_Enable345:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Axis_Enable347
NOP	
J	L_Axis_Enable129
NOP	
L__Axis_Enable347:
J	L_Axis_Enable130
NOP	
L_Axis_Enable126:
;Stepper.c,617 :: 		}
L_end_Axis_Enable:
JR	RA
NOP	
; end of _Axis_Enable
_disableOCx:
;Stepper.c,619 :: 		void disableOCx(){
;Stepper.c,620 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //X
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,621 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //Y
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,622 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,623 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_StepX:
;Stepper.c,628 :: 		void StepX() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,629 :: 		STPS[X].step_count++;
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,630 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,631 :: 		if(SV.Single_Dual == 0)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepX350
NOP	
J	L_StepX131
NOP	
L__StepX350:
;Stepper.c,632 :: 		SingleStepX();
JAL	_SingleStepX+0
NOP	
J	L_StepX132
NOP	
L_StepX131:
;Stepper.c,634 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepX132:
;Stepper.c,635 :: 		}
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
;Stepper.c,637 :: 		void SingleStepX(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,638 :: 		if(STPS[X].step_count >= STPS[X].dist){  //i think this is where the problem lies
SW	R25, 4(SP)
LW	R3, Offset(_STPS+36)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepX352
NOP	
J	L_SingleStepX133
NOP	
L__SingleStepX352:
;Stepper.c,639 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,640 :: 		}
J	L_SingleStepX134
NOP	
L_SingleStepX133:
;Stepper.c,642 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,643 :: 		}
L_SingleStepX134:
;Stepper.c,644 :: 		}
L_end_SingleStepX:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepX
_StopX:
;Stepper.c,647 :: 		void StopX(){
;Stepper.c,648 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,649 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,650 :: 		}
L_end_StopX:
JR	RA
NOP	
; end of _StopX
_StepY:
;Stepper.c,656 :: 		void StepY() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,657 :: 		STPS[Y].step_count++;
LW	R2, Offset(_STPS+100)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+100)(GP)
;Stepper.c,658 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,659 :: 		if(SV.Single_Dual == 0)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepY355
NOP	
J	L_StepY135
NOP	
L__StepY355:
;Stepper.c,660 :: 		SingleStepY();
JAL	_SingleStepY+0
NOP	
J	L_StepY136
NOP	
L_StepY135:
;Stepper.c,662 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepY136:
;Stepper.c,663 :: 		}
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
;Stepper.c,665 :: 		void SingleStepY(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,666 :: 		if(STPS[Y].step_count >= STPS[Y].dist){  //i think this is where the problem lies
SW	R25, 4(SP)
LW	R3, Offset(_STPS+104)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepY357
NOP	
J	L_SingleStepY137
NOP	
L__SingleStepY357:
;Stepper.c,667 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,668 :: 		}
J	L_SingleStepY138
NOP	
L_SingleStepY137:
;Stepper.c,670 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,671 :: 		}
L_SingleStepY138:
;Stepper.c,672 :: 		}
L_end_SingleStepY:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepY
_StopY:
;Stepper.c,674 :: 		void StopY(){
;Stepper.c,675 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,676 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,677 :: 		}
L_end_StopY:
JR	RA
NOP	
; end of _StopY
_StepZ:
;Stepper.c,683 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_8 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,684 :: 		STPS[Z].step_count++;
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+168)(GP)
;Stepper.c,685 :: 		OC8IF_bit = 0;
LUI	R2, BitMask(OC8IF_bit+0)
ORI	R2, R2, BitMask(OC8IF_bit+0)
_SX	
;Stepper.c,686 :: 		if(!SV.Single_Dual)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepZ360
NOP	
J	L_StepZ139
NOP	
L__StepZ360:
;Stepper.c,687 :: 		SingleStepZ();
JAL	_SingleStepZ+0
NOP	
J	L_StepZ140
NOP	
L_StepZ139:
;Stepper.c,689 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepZ140:
;Stepper.c,691 :: 		}
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
;Stepper.c,693 :: 		void SingleStepZ(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,694 :: 		if(STPS[Z].step_count >= STPS[Z].dist){
SW	R25, 4(SP)
LW	R3, Offset(_STPS+172)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepZ362
NOP	
J	L_SingleStepZ141
NOP	
L__SingleStepZ362:
;Stepper.c,695 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,696 :: 		}
J	L_SingleStepZ142
NOP	
L_SingleStepZ141:
;Stepper.c,698 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,699 :: 		}
L_SingleStepZ142:
;Stepper.c,700 :: 		}
L_end_SingleStepZ:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepZ
_StopZ:
;Stepper.c,702 :: 		void StopZ(){
;Stepper.c,703 :: 		OC8IE_bit = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
;Stepper.c,704 :: 		OC8CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+4)(GP)
;Stepper.c,705 :: 		}
L_end_StopZ:
JR	RA
NOP	
; end of _StopZ
_min_:
;Stepper.c,716 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,717 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_365
NOP	
J	L_min_143
NOP	
L__min_365:
;Stepper.c,718 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,719 :: 		}
L_min_143:
;Stepper.c,721 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,723 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
Stepper_sqrt_:
;Stepper.c,733 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,739 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,740 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,741 :: 		do
J	L_Stepper_sqrt_145
NOP	
L_Stepper_sqrt_195:
;Stepper.c,755 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,741 :: 		do
L_Stepper_sqrt_145:
;Stepper.c,743 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_367
NOP	
J	L_Stepper_sqrt_148
NOP	
L_Stepper_sqrt_367:
;Stepper.c,745 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,746 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,747 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_149
NOP	
L_Stepper_sqrt_148:
;Stepper.c,749 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,750 :: 		}
L_Stepper_sqrt_149:
;Stepper.c,751 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,752 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_369
NOP	
J	L_Stepper_sqrt_196
NOP	
L_Stepper_sqrt_369:
; f end address is: 16 (R4)
;Stepper.c,753 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,754 :: 		}
J	L_Stepper_sqrt_150
NOP	
L_Stepper_sqrt_196:
;Stepper.c,752 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,754 :: 		}
L_Stepper_sqrt_150:
;Stepper.c,755 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_370
NOP	
J	L_Stepper_sqrt_195
NOP	
L_Stepper_sqrt_370:
; q2 end address is: 12 (R3)
;Stepper.c,756 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_371
NOP	
J	L_Stepper_sqrt_151
NOP	
L_Stepper_sqrt_371:
;Stepper.c,757 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,758 :: 		}
L_Stepper_sqrt_151:
;Stepper.c,760 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,762 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_CalcRadius:
;Stepper.c,765 :: 		void CalcRadius(Circle* cir){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,768 :: 		cir->xRad = fabs(cir->xStart + cir->I);
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
;Stepper.c,769 :: 		cir->yRad = fabs(cir->yStart + cir->J);
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
;Stepper.c,770 :: 		cir->radius = sqrt((cir->xRad*cir->xRad) + (cir->yRad*cir->yRad));
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
;Stepper.c,771 :: 		angA = atan2(cir->yRad,cir->xRad);
ADDIU	R2, R25, 48
LWC1	S1, 0(R2)
ADDIU	R2, R25, 52
LWC1	S0, 0(R2)
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
;Stepper.c,774 :: 		cir->degreeDeg = angA * rad2deg;
ADDIU	R3, R25, 4
LUI	R2, 16997
ORI	R2, R2, 12013
MTC1	R2, S1
MUL.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Stepper.c,776 :: 		cir->quadrant_start = QuadrantStart(cir->I,cir->J);
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
;Stepper.c,778 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius374
NOP	
J	L__CalcRadius233
NOP	
L__CalcRadius374:
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius376
NOP	
J	L__CalcRadius232
NOP	
L__CalcRadius376:
J	L_CalcRadius155
NOP	
L__CalcRadius233:
L__CalcRadius232:
;Stepper.c,779 :: 		angB = cir->deg - cir->degreeDeg;
LWC1	S1, 0(R25)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius155:
;Stepper.c,780 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius378
NOP	
J	L__CalcRadius235
NOP	
L__CalcRadius378:
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius380
NOP	
J	L__CalcRadius234
NOP	
L__CalcRadius380:
J	L_CalcRadius158
NOP	
L__CalcRadius235:
L__CalcRadius234:
;Stepper.c,781 :: 		angB = cir->deg + cir->degreeDeg;
LWC1	S1, 0(R25)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius158:
;Stepper.c,783 :: 		cir->degreeRadians = angB * deg2rad;
ADDIU	R3, R25, 8
LWC1	S1, 8(SP)
LUI	R2, 15502
ORI	R2, R2, 64046
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, 0(R3)
;Stepper.c,784 :: 		}
L_end_CalcRadius:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _CalcRadius
_QuadrantStart:
;Stepper.c,786 :: 		int QuadrantStart(float i,float j){
;Stepper.c,787 :: 		if((i <= 0)&&(j >= 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__QuadrantStart382
NOP	
J	L__QuadrantStart223
NOP	
L__QuadrantStart382:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S13, S0
BC1F	0, L__QuadrantStart383
NOP	
J	L__QuadrantStart222
NOP	
L__QuadrantStart383:
L__QuadrantStart221:
;Stepper.c,788 :: 		return 1;
ORI	R2, R0, 1
J	L_end_QuadrantStart
NOP	
;Stepper.c,787 :: 		if((i <= 0)&&(j >= 0))
L__QuadrantStart223:
L__QuadrantStart222:
;Stepper.c,789 :: 		else if((i > 0)&&(j > 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart384
NOP	
J	L__QuadrantStart225
NOP	
L__QuadrantStart384:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S13, S0
BC1F	0, L__QuadrantStart385
NOP	
J	L__QuadrantStart224
NOP	
L__QuadrantStart385:
L__QuadrantStart220:
;Stepper.c,790 :: 		return 2;
ORI	R2, R0, 2
J	L_end_QuadrantStart
NOP	
;Stepper.c,789 :: 		else if((i > 0)&&(j > 0))
L__QuadrantStart225:
L__QuadrantStart224:
;Stepper.c,791 :: 		else if((i > 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart386
NOP	
J	L__QuadrantStart227
NOP	
L__QuadrantStart386:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart387
NOP	
J	L__QuadrantStart226
NOP	
L__QuadrantStart387:
L__QuadrantStart219:
;Stepper.c,792 :: 		return 3;
ORI	R2, R0, 3
J	L_end_QuadrantStart
NOP	
;Stepper.c,791 :: 		else if((i > 0)&&(j < 0))
L__QuadrantStart227:
L__QuadrantStart226:
;Stepper.c,793 :: 		else if((i < 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__QuadrantStart388
NOP	
J	L__QuadrantStart229
NOP	
L__QuadrantStart388:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart389
NOP	
J	L__QuadrantStart228
NOP	
L__QuadrantStart389:
L__QuadrantStart218:
;Stepper.c,794 :: 		return 4;
ORI	R2, R0, 4
J	L_end_QuadrantStart
NOP	
;Stepper.c,793 :: 		else if((i < 0)&&(j < 0))
L__QuadrantStart229:
L__QuadrantStart228:
;Stepper.c,796 :: 		return 0;
MOVZ	R2, R0, R0
;Stepper.c,797 :: 		}
L_end_QuadrantStart:
JR	RA
NOP	
; end of _QuadrantStart
_CircDir:
;Stepper.c,799 :: 		void CircDir(Circle* cir){
;Stepper.c,801 :: 		if(cir->dir == CW){
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__CircDir391
NOP	
J	L_CircDir175
NOP	
L__CircDir391:
;Stepper.c,802 :: 		newDeg = 360 / cir->deg;
LWC1	S1, 0(R25)
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S2, S0, S1
; newDeg start address is: 24 (R6)
MOV.S 	S3, S2
;Stepper.c,803 :: 		cir->N = (2*Pi*cir->radius)/newDeg;
ADDIU	R3, R25, 36
ADDIU	R2, R25, 40
LWC1	S1, 0(R2)
LUI	R2, 16585
ORI	R2, R2, 4048
MTC1	R2, S0
MUL.S 	S0, S0, S1
DIV.S 	S0, S0, S2
SWC1	S0, 0(R3)
;Stepper.c,804 :: 		cir->divisor = cir->deg / newDeg;
ADDIU	R2, R25, 20
LWC1	S0, 0(R25)
DIV.S 	S0, S0, S3
; newDeg end address is: 24 (R6)
SWC1	S0, 0(R2)
;Stepper.c,805 :: 		}
L_CircDir175:
;Stepper.c,807 :: 		if(cir->dir == CW)
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__CircDir392
NOP	
J	L_CircDir176
NOP	
L__CircDir392:
;Stepper.c,808 :: 		cir->deg = 0.00;
SW	R0, 0(R25)
L_CircDir176:
;Stepper.c,809 :: 		if(cir->dir == CCW)
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__CircDir393
NOP	
J	L_CircDir177
NOP	
L__CircDir393:
;Stepper.c,810 :: 		cir->deg = 360.00;
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
SWC1	S0, 0(R25)
L_CircDir177:
;Stepper.c,811 :: 		}
L_end_CircDir:
JR	RA
NOP	
; end of _CircDir
_Cir_Interpolation:
;Stepper.c,813 :: 		void Cir_Interpolation(float xPresent,float yPresent,Circle* cir){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,815 :: 		cir->xStart = xPresent;
ADDIU	R2, R25, 56
SWC1	S12, 0(R2)
;Stepper.c,816 :: 		cir->yStart = yPresent;
ADDIU	R2, R25, 60
SWC1	S13, 0(R2)
;Stepper.c,817 :: 		CalcRadius(cir);
JAL	_CalcRadius+0
NOP	
;Stepper.c,820 :: 		while(quad){
LH	R2, Offset(Cir_Interpolation_quad_L0+0)(GP)
BNE	R2, R0, L__Cir_Interpolation396
NOP	
J	L_Cir_Interpolation179
NOP	
L__Cir_Interpolation396:
;Stepper.c,831 :: 		}
L_Cir_Interpolation179:
;Stepper.c,832 :: 		}
L_end_Cir_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Cir_Interpolation
_CycleStop:
;Stepper.c,856 :: 		void CycleStop(){
;Stepper.c,858 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,859 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop186:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 3
BNE	R2, R0, L__CycleStop398
NOP	
J	L_CycleStop187
NOP	
L__CycleStop398:
;Stepper.c,860 :: 		STPS[ii].microSec = 0;
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,861 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 4
BEQ	R2, R0, L__CycleStop399
NOP	
J	L_CycleStop189
NOP	
L__CycleStop399:
; ii end address is: 16 (R4)
J	L_CycleStop187
NOP	
L_CycleStop189:
;Stepper.c,859 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,862 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop186
NOP	
L_CycleStop187:
;Stepper.c,863 :: 		}
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
;Stepper.c,865 :: 		void CycleStart(){
;Stepper.c,868 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__CycleStart401
NOP	
J	L_CycleStart190
NOP	
L__CycleStart401:
;Stepper.c,869 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart191:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 3
BNE	R2, R0, L__CycleStart402
NOP	
J	L_CycleStart192
NOP	
L__CycleStart402:
;Stepper.c,870 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 4
BEQ	R2, R0, L__CycleStart403
NOP	
J	L_CycleStart194
NOP	
L__CycleStart403:
; ii end address is: 16 (R4)
J	L_CycleStart192
NOP	
L_CycleStart194:
;Stepper.c,871 :: 		STPS[ii].microSec++;
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
;Stepper.c,869 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,872 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart191
NOP	
L_CycleStart192:
;Stepper.c,873 :: 		}
L_CycleStart190:
;Stepper.c,874 :: 		}
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
