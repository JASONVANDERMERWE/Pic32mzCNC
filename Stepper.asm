_SetPinMode:
;Stepper.c,57 :: 		void SetPinMode(){
;Stepper.c,60 :: 		EN_Step_PinDirX  = 0; //output
LUI	R2, BitMask(TRISG0_bit+0)
ORI	R2, R2, BitMask(TRISG0_bit+0)
_SX	
_LX	
EXT	R2, R2, BitPos(TRISG0_bit+0), 1
SB	R2, Offset(_AxisNo+0)(GP)
;Stepper.c,63 :: 		PLS_Step_PinDirX = 0;
LUI	R2, BitMask(TRISF1_bit+0)
ORI	R2, R2, BitMask(TRISF1_bit+0)
_SX	
;Stepper.c,64 :: 		DIR_Step_PinDirX = 0;
LUI	R2, BitMask(TRISG1_bit+0)
ORI	R2, R2, BitMask(TRISG1_bit+0)
_SX	
;Stepper.c,66 :: 		EN_Step_PinDirY  = 0; //output
LUI	R2, BitMask(TRISF0_bit+0)
ORI	R2, R2, BitMask(TRISF0_bit+0)
_SX	
;Stepper.c,69 :: 		PLS_Step_PinDirY = 0;
LUI	R2, BitMask(TRISD4_bit+0)
ORI	R2, R2, BitMask(TRISD4_bit+0)
_SX	
;Stepper.c,70 :: 		DIR_Step_PinDirY = 0;
LUI	R2, BitMask(TRISD5_bit+0)
ORI	R2, R2, BitMask(TRISD5_bit+0)
_SX	
;Stepper.c,72 :: 		EN_Step_PinDirZ  = 0; //output
LUI	R2, BitMask(TRISG14_bit+0)
ORI	R2, R2, BitMask(TRISG14_bit+0)
_SX	
;Stepper.c,75 :: 		PLS_Step_PinDirZ = 0;
LUI	R2, BitMask(TRISE3_bit+0)
ORI	R2, R2, BitMask(TRISE3_bit+0)
_SX	
;Stepper.c,76 :: 		DIR_Step_PinDirZ = 0;
LUI	R2, BitMask(TRISG12_bit+0)
ORI	R2, R2, BitMask(TRISG12_bit+0)
_SX	
;Stepper.c,78 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_StepperConstants:
;Stepper.c,82 :: 		void StepperConstants(long accel,long decel){
;Stepper.c,83 :: 		SV.acc = accel;
SW	R25, Offset(_SV+44)(GP)
;Stepper.c,84 :: 		SV.dec = decel;
SW	R26, Offset(_SV+48)(GP)
;Stepper.c,85 :: 		}
L_end_StepperConstants:
JR	RA
NOP	
; end of _StepperConstants
_EnStepperX:
;Stepper.c,89 :: 		void EnStepperX(){
;Stepper.c,92 :: 		EN_StepX       = 0;
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
;Stepper.c,93 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
<<<<<<< HEAD
; end of _EnStepper
_DisableStepper:
;Stepper.c,83 :: 		void DisableStepper(){
;Stepper.c,84 :: 		EN_StepX      = 1;
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
;Stepper.c,85 :: 		EN_StepY      = 1;
=======
; end of _EnStepperX
_EnStepperY:
;Stepper.c,95 :: 		void EnStepperY(){
;Stepper.c,98 :: 		EN_StepY       = 0;
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
LUI	R2, BitMask(LATF0_bit+0)
ORI	R2, R2, BitMask(LATF0_bit+0)
_SX	
;Stepper.c,99 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,100 :: 		void EnStepperZ(){
;Stepper.c,103 :: 		EN_StepZ       = 0;
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;Stepper.c,104 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_DisableStepper:
;Stepper.c,106 :: 		void DisableStepper(){
;Stepper.c,107 :: 		EN_Stepx      = 1;
LUI	R2, BitMask(LATG0_bit+0)
ORI	R2, R2, BitMask(LATG0_bit+0)
_SX	
;Stepper.c,108 :: 		EN_StepY      = 1;
LUI	R2, BitMask(LATF0_bit+0)
ORI	R2, R2, BitMask(LATF0_bit+0)
_SX	
;Stepper.c,109 :: 		EN_StepZ      = 1;
LUI	R2, BitMask(LATG14_bit+0)
ORI	R2, R2, BitMask(LATG14_bit+0)
_SX	
;Stepper.c,110 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_speed_cntr_Move:
;Stepper.c,128 :: 		void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,131 :: 		if(mmSteps == 1){
SW	R25, 4(SP)
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move228
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move228:
;Stepper.c,133 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
;Stepper.c,134 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,135 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ORI	R2, R0, 20000
SW	R2, 0(R3)
;Stepper.c,136 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,138 :: 		}
J	L_speed_cntr_Move1
NOP	
L_speed_cntr_Move0:
;Stepper.c,140 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
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
;Stepper.c,144 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 20
LUI	R2, 2
ORI	R2, R2, 22325
DIV	R2, R26
MFLO	R2
SW	R2, 0(R3)
;Stepper.c,149 :: 		STPS[axis_No].step_delay = abs((T1_FREQ_148 * sqrt_(A_SQ / SV.acc))/100);
SEH	R2, R27
SLL	R3, R2, 6
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
;Stepper.c,150 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 56
ADDIU	R2, R2, 8
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,155 :: 		STPS[axis_No].max_step_lim = (speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 48
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
;Stepper.c,160 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move233
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move233:
;Stepper.c,161 :: 		STPS[axis_No].max_step_lim = 1;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 48
ORI	R2, R0, 1
SW	R2, 0(R3)
;Stepper.c,162 :: 		}
L_speed_cntr_Move5:
;Stepper.c,166 :: 		STPS[axis_No].accel_lim = (abs(mmSteps) * SV.dec) / (SV.acc + SV.dec);
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
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
;Stepper.c,169 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 44
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move234
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move234:
;Stepper.c,170 :: 		STPS[axis_No].accel_lim = 1;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 44
ORI	R2, R0, 1
SW	R2, 0(R3)
;Stepper.c,171 :: 		}
L_speed_cntr_Move6:
;Stepper.c,174 :: 		if(STPS[axis_No].accel_lim <= STPS[axis_No].max_step_lim){
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 44
LW	R3, 0(R2)
ADDIU	R2, R4, 48
LW	R2, 0(R2)
SLT	R2, R2, R3
BEQ	R2, R0, L__speed_cntr_Move235
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move235:
;Stepper.c,175 :: 		if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move236
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move236:
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
ADDIU	R2, R2, 44
LW	R2, 0(R2)
SUBU	R2, R2, R25
SW	R2, 0(R3)
J	L_speed_cntr_Move9
NOP	
L_speed_cntr_Move8:
;Stepper.c,176 :: 		else STPS[axis_No].decel_val = mmSteps + STPS[axis_No].accel_lim;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
ADDIU	R2, R2, 44
LW	R2, 0(R2)
ADDU	R2, R25, R2
SW	R2, 0(R3)
L_speed_cntr_Move9:
;Stepper.c,177 :: 		}else{
J	L_speed_cntr_Move10
NOP	
L_speed_cntr_Move7:
;Stepper.c,178 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * SV.acc) / SV.dec);
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 16
ADDIU	R2, R2, 48
LW	R3, 0(R2)
LW	R2, Offset(_SV+44)(GP)
MUL	R3, R3, R2
LW	R2, Offset(_SV+48)(GP)
DIV	R3, R2
MFLO	R3
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R4)
;Stepper.c,179 :: 		}
L_speed_cntr_Move10:
;Stepper.c,181 :: 		if(mmSteps >= 0){
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move237
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move237:
;Stepper.c,182 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
SEH	R2, R27
SLL	R3, R2, 6
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
SEH	R2, R27
SLL	R3, R2, 6
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
;Stepper.c,183 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
ADDIU	R2, R2, 44
LW	R2, 0(R2)
SW	R2, 0(R3)
L_speed_cntr_Move13:
;Stepper.c,184 :: 		}
J	L_speed_cntr_Move14
NOP	
L_speed_cntr_Move11:
;Stepper.c,186 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = abs(mmSteps) * STPS[axis_No].decel_val;
SEH	R2, R27
SLL	R3, R2, 6
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
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 12
SW	R2, 12(SP)
JAL	_abs+0
NOP	
SEH	R3, R27
SLL	R4, R3, 6
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
;Stepper.c,187 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 12
ADDIU	R2, R2, 44
LW	R2, 0(R2)
SW	R2, 0(R3)
L_speed_cntr_Move16:
;Stepper.c,188 :: 		}
L_speed_cntr_Move14:
;Stepper.c,190 :: 		if(STPS[axis_No].decel_val == 0){
SEH	R2, R27
SLL	R3, R2, 6
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
;Stepper.c,191 :: 		STPS[axis_No].decel_val = -1;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, 0(R3)
;Stepper.c,192 :: 		}
L_speed_cntr_Move17:
;Stepper.c,195 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 56
LW	R3, 0(R2)
ADDIU	R2, R4, 20
LW	R2, 0(R2)
SLT	R2, R2, R3
BEQ	R2, R0, L__speed_cntr_Move241
NOP	
J	L_speed_cntr_Move18
NOP	
L__speed_cntr_Move241:
;Stepper.c,196 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,197 :: 		STPS[axis_No].run_state = RUN;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,198 :: 		}else{
J	L_speed_cntr_Move19
NOP	
L_speed_cntr_Move18:
;Stepper.c,199 :: 		STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
ADDIU	R2, R3, 8
SW	R2, 12(SP)
ADDIU	R2, R3, 56
LW	R25, 0(R2)
JAL	_abs+0
NOP	
SEH	R3, R2
LW	R2, 12(SP)
SW	R3, 0(R2)
;Stepper.c,200 :: 		STPS[axis_No].run_state = ACCEL;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 1
SB	R2, 0(R3)
;Stepper.c,201 :: 		}
L_speed_cntr_Move19:
;Stepper.c,140 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
L__speed_cntr_Move202:
L__speed_cntr_Move201:
;Stepper.c,203 :: 		}
L_speed_cntr_Move1:
;Stepper.c,204 :: 		STPS[axis_No].step_count  = 0;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,205 :: 		STPS[axis_No].rest        = 0;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Stepper.c,206 :: 		STPS[axis_No].microSec    = 0;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,207 :: 		STPS[axis_No].accel_count = 1;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ORI	R2, R0, 1
SW	R2, 0(R3)
;Stepper.c,209 :: 		SV.Tog   = 0;
SH	R0, Offset(_SV+2)(GP)
;Stepper.c,213 :: 		SV.running = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,214 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_CycleStop:
;Stepper.c,218 :: 		void CycleStop(){
;Stepper.c,220 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,221 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop20:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 3
BNE	R2, R0, L__CycleStop243
NOP	
J	L_CycleStop21
NOP	
L__CycleStop243:
;Stepper.c,222 :: 		STPS[ii].microSec = 0;
SEH	R2, R4
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,223 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 4
BEQ	R2, R0, L__CycleStop244
NOP	
J	L_CycleStop23
NOP	
L__CycleStop244:
; ii end address is: 16 (R4)
J	L_CycleStop21
NOP	
L_CycleStop23:
;Stepper.c,221 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,224 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop20
NOP	
L_CycleStop21:
;Stepper.c,225 :: 		}
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
;Stepper.c,227 :: 		void CycleStart(){
;Stepper.c,230 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__CycleStart246
NOP	
J	L_CycleStart24
NOP	
L__CycleStart246:
;Stepper.c,231 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart25:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 3
BNE	R2, R0, L__CycleStart247
NOP	
J	L_CycleStart26
NOP	
L__CycleStart247:
;Stepper.c,232 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 4
BEQ	R2, R0, L__CycleStart248
NOP	
J	L_CycleStart28
NOP	
L__CycleStart248:
; ii end address is: 16 (R4)
J	L_CycleStart26
NOP	
L_CycleStart28:
;Stepper.c,233 :: 		STPS[ii].microSec++;
; ii start address is: 16 (R4)
SEH	R2, R4
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R3, R2, R3
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,231 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,234 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart25
NOP	
L_CycleStart26:
;Stepper.c,235 :: 		}
L_CycleStart24:
;Stepper.c,236 :: 		}
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
_SingleAxisStep:
;Stepper.c,242 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,249 :: 		switch(axis_No){
J	L_SingleAxisStep29
NOP	
;Stepper.c,250 :: 		case 0:OC5IE_bit = 1;OC5CONbits.ON = 1;
L_SingleAxisStep31:
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,251 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,252 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,253 :: 		break;
J	L_SingleAxisStep30
NOP	
;Stepper.c,254 :: 		case 1:OC5IE_bit = 0;OC5CONbits.ON = 0;
L_SingleAxisStep32:
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,255 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,256 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,257 :: 		break;
J	L_SingleAxisStep30
NOP	
;Stepper.c,258 :: 		case 2:OC5IE_bit = 0;OC5CONbits.ON = 0;
L_SingleAxisStep33:
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,259 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,260 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+8)(GP)
;Stepper.c,261 :: 		break;
J	L_SingleAxisStep30
NOP	
;Stepper.c,262 :: 		default: break;
L_SingleAxisStep34:
J	L_SingleAxisStep30
NOP	
;Stepper.c,263 :: 		}
L_SingleAxisStep29:
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep251
NOP	
J	L_SingleAxisStep31
NOP	
L__SingleAxisStep251:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep253
NOP	
J	L_SingleAxisStep32
NOP	
L__SingleAxisStep253:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep255
NOP	
J	L_SingleAxisStep33
NOP	
L__SingleAxisStep255:
J	L_SingleAxisStep34
NOP	
L_SingleAxisStep30:
;Stepper.c,264 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+36)(GP)
;Stepper.c,265 :: 		dist = newxyz - SV.psingle;
SW	R25, Offset(SingleAxisStep_dist_L0+0)(GP)
;Stepper.c,266 :: 		dist = abs(dist);
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(SingleAxisStep_dist_L0+0)(GP)
;Stepper.c,268 :: 		if(newxyz < 0)
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep256
NOP	
J	L_SingleAxisStep35
NOP	
L__SingleAxisStep256:
;Stepper.c,269 :: 		dir = CCW;
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep36
NOP	
L_SingleAxisStep35:
;Stepper.c,271 :: 		dir = CW;
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep36:
;Stepper.c,273 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep37
NOP	
;Stepper.c,274 :: 		case X:
L_SingleAxisStep39:
;Stepper.c,275 :: 		DIR_StepX = dir;
_LX	
INS	R2, R4, BitPos(LATG1_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,276 :: 		break;
J	L_SingleAxisStep38
NOP	
;Stepper.c,277 :: 		case Y:
L_SingleAxisStep40:
;Stepper.c,278 :: 		DIR_StepY = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(LATD5_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,279 :: 		break;
J	L_SingleAxisStep38
NOP	
;Stepper.c,280 :: 		case Z:
L_SingleAxisStep41:
;Stepper.c,281 :: 		DIR_StepZ = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(LATG12_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,282 :: 		break;
J	L_SingleAxisStep38
NOP	
;Stepper.c,283 :: 		default: break;
L_SingleAxisStep42:
J	L_SingleAxisStep38
NOP	
;Stepper.c,284 :: 		}
L_SingleAxisStep37:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep258
NOP	
J	L_SingleAxisStep39
NOP	
L__SingleAxisStep258:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep260
NOP	
J	L_SingleAxisStep40
NOP	
L__SingleAxisStep260:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep262
NOP	
J	L_SingleAxisStep41
NOP	
L__SingleAxisStep262:
; dir end address is: 16 (R4)
J	L_SingleAxisStep42
NOP	
L_SingleAxisStep38:
;Stepper.c,285 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__SingleAxisStep263
NOP	
J	L_SingleAxisStep43
NOP	
L__SingleAxisStep263:
;Stepper.c,286 :: 		for(STPS[axis_No].step_count = 0;STPS[axis_No].step_count < dist; ++STPS[axis_No].step_count){
SEH	R2, R26
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
L_SingleAxisStep44:
SEH	R2, R26
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
LW	R3, 0(R2)
LW	R2, Offset(SingleAxisStep_dist_L0+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__SingleAxisStep264
NOP	
J	L_SingleAxisStep45
NOP	
L__SingleAxisStep264:
;Stepper.c,287 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,288 :: 		toggleOCx(axis_No);
SW	R25, 4(SP)
SEH	R25, R26
JAL	_toggleOCx+0
NOP	
;Stepper.c,289 :: 		Pulse(axis_No);
SEH	R25, R26
JAL	_Pulse+0
NOP	
LW	R25, 4(SP)
;Stepper.c,291 :: 		while(STmr.compOCxRunning == 0);
L_SingleAxisStep47:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__SingleAxisStep265
NOP	
J	L_SingleAxisStep48
NOP	
L__SingleAxisStep265:
J	L_SingleAxisStep47
NOP	
L_SingleAxisStep48:
;Stepper.c,286 :: 		for(STPS[axis_No].step_count = 0;STPS[axis_No].step_count < dist; ++STPS[axis_No].step_count){
SEH	R2, R26
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 32
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,292 :: 		}
J	L_SingleAxisStep44
NOP	
L_SingleAxisStep45:
;Stepper.c,293 :: 		}
L_SingleAxisStep43:
;Stepper.c,295 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Stepper.c,296 :: 		}
L_end_SingleAxisStep:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Stepper.c,298 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,301 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+40)(GP)
;Stepper.c,302 :: 		d2 = 0;
SW	R0, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,304 :: 		SV.px = 0;
SW	R0, Offset(_SV+24)(GP)
;Stepper.c,305 :: 		SV.py = 0;
SW	R0, Offset(_SV+28)(GP)
;Stepper.c,306 :: 		SV.pz = 0;
SW	R0, Offset(_SV+32)(GP)
;Stepper.c,311 :: 		switch(axis_combo){
J	L_DualAxisStep49
NOP	
;Stepper.c,312 :: 		case xy:
L_DualAxisStep51:
;Stepper.c,313 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,314 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,315 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,316 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,317 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,319 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep267
NOP	
J	L_DualAxisStep52
NOP	
L__DualAxisStep267:
; ?FLOC___DualAxisStep?T408 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T408 end address is: 12 (R3)
J	L_DualAxisStep53
NOP	
L_DualAxisStep52:
; ?FLOC___DualAxisStep?T408 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T408 end address is: 12 (R3)
L_DualAxisStep53:
; ?FLOC___DualAxisStep?T408 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T408 end address is: 12 (R3)
SH	R2, Offset(_SV+52)(GP)
;Stepper.c,320 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep268
NOP	
J	L_DualAxisStep54
NOP	
L__DualAxisStep268:
; ?FLOC___DualAxisStep?T410 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T410 end address is: 12 (R3)
J	L_DualAxisStep55
NOP	
L_DualAxisStep54:
; ?FLOC___DualAxisStep?T410 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T410 end address is: 12 (R3)
L_DualAxisStep55:
; ?FLOC___DualAxisStep?T410 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T410 end address is: 12 (R3)
SH	R2, Offset(_SV+54)(GP)
;Stepper.c,322 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+52)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep269
NOP	
J	L_DualAxisStep56
NOP	
L__DualAxisStep269:
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
J	L_DualAxisStep57
NOP	
L_DualAxisStep56:
;Stepper.c,323 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
<<<<<<< HEAD
L_Step34:
;Stepper.c,231 :: 		if(SV.diry < 0) DIR_StepY = CCW;
LH	R2, Offset(_SV+42)(GP)
=======
L_DualAxisStep57:
;Stepper.c,324 :: 		if(SV.diry < 0) DIR_StepY = CCW;
LH	R2, Offset(_SV+54)(GP)
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep270
NOP	
J	L_DualAxisStep58
NOP	
L__DualAxisStep270:
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_DualAxisStep59
NOP	
L_DualAxisStep58:
;Stepper.c,325 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_DualAxisStep59:
;Stepper.c,326 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+12)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,327 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,329 :: 		if(SV.dx > SV.dy) d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep271
NOP	
J	L_DualAxisStep60
NOP	
L__DualAxisStep271:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep61
NOP	
L_DualAxisStep60:
;Stepper.c,330 :: 		else d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
L_DualAxisStep61:
;Stepper.c,331 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep272
NOP	
J	L_DualAxisStep62
NOP	
L__DualAxisStep272:
;Stepper.c,332 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,333 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep273
NOP	
J	L_DualAxisStep63
NOP	
L__DualAxisStep273:
;Stepper.c,334 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
SW	R0, Offset(_STPS+32)(GP)
L_DualAxisStep64:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep274
NOP	
J	L_DualAxisStep65
NOP	
L__DualAxisStep274:
;Stepper.c,335 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,336 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,337 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,338 :: 		if(d2 < 0)d2 += 2*SV.dy;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep275
NOP	
J	L_DualAxisStep67
NOP	
L__DualAxisStep275:
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep68
NOP	
L_DualAxisStep67:
;Stepper.c,340 :: 		d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,341 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,342 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,343 :: 		}
L_DualAxisStep68:
;Stepper.c,345 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep69:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep276
NOP	
J	L_DualAxisStep70
NOP	
L__DualAxisStep276:
J	L_DualAxisStep69
NOP	
L_DualAxisStep70:
;Stepper.c,334 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,346 :: 		}
J	L_DualAxisStep64
NOP	
L_DualAxisStep65:
;Stepper.c,347 :: 		}else{
J	L_DualAxisStep71
NOP	
L_DualAxisStep63:
;Stepper.c,348 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
SW	R0, Offset(_STPS+96)(GP)
L_DualAxisStep72:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+96)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep277
NOP	
J	L_DualAxisStep73
NOP	
L__DualAxisStep277:
;Stepper.c,349 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,350 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,351 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,352 :: 		if(d2 < 0)d2 += 2 * SV.dx;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep278
NOP	
J	L_DualAxisStep75
NOP	
L__DualAxisStep278:
LW	R2, Offset(_SV+12)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep76
NOP	
L_DualAxisStep75:
;Stepper.c,354 :: 		d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,355 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,356 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,357 :: 		}
L_DualAxisStep76:
;Stepper.c,359 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep77:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep279
NOP	
J	L_DualAxisStep78
NOP	
L__DualAxisStep279:
J	L_DualAxisStep77
NOP	
L_DualAxisStep78:
;Stepper.c,348 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
LW	R2, Offset(_STPS+96)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+96)(GP)
;Stepper.c,360 :: 		}
J	L_DualAxisStep72
NOP	
L_DualAxisStep73:
;Stepper.c,361 :: 		}
L_DualAxisStep71:
;Stepper.c,362 :: 		}
L_DualAxisStep62:
;Stepper.c,363 :: 		break;
J	L_DualAxisStep50
NOP	
;Stepper.c,364 :: 		case xz:
L_DualAxisStep79:
;Stepper.c,365 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,366 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,367 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+8)(GP)
;Stepper.c,368 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,369 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,371 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep280
NOP	
J	L_DualAxisStep80
NOP	
L__DualAxisStep280:
; ?FLOC___DualAxisStep?T453 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T453 end address is: 12 (R3)
J	L_DualAxisStep81
NOP	
L_DualAxisStep80:
; ?FLOC___DualAxisStep?T453 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T453 end address is: 12 (R3)
L_DualAxisStep81:
; ?FLOC___DualAxisStep?T453 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T453 end address is: 12 (R3)
SH	R2, Offset(_SV+52)(GP)
;Stepper.c,372 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep281
NOP	
J	L_DualAxisStep82
NOP	
L__DualAxisStep281:
; ?FLOC___DualAxisStep?T455 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T455 end address is: 12 (R3)
J	L_DualAxisStep83
NOP	
L_DualAxisStep82:
; ?FLOC___DualAxisStep?T455 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T455 end address is: 12 (R3)
L_DualAxisStep83:
; ?FLOC___DualAxisStep?T455 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T455 end address is: 12 (R3)
SH	R2, Offset(_SV+56)(GP)
;Stepper.c,374 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+52)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep282
NOP	
J	L_DualAxisStep84
NOP	
L__DualAxisStep282:
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
J	L_DualAxisStep85
NOP	
L_DualAxisStep84:
;Stepper.c,375 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
L_DualAxisStep85:
;Stepper.c,376 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+56)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep283
NOP	
J	L_DualAxisStep86
NOP	
L__DualAxisStep283:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_DualAxisStep87
NOP	
L_DualAxisStep86:
;Stepper.c,377 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_DualAxisStep87:
;Stepper.c,378 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+12)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,379 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,381 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep284
NOP	
J	L_DualAxisStep88
NOP	
L__DualAxisStep284:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep89
NOP	
L_DualAxisStep88:
;Stepper.c,382 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
L_DualAxisStep89:
;Stepper.c,383 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep285
NOP	
J	L_DualAxisStep90
NOP	
L__DualAxisStep285:
;Stepper.c,384 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,385 :: 		if(SV.dx > SV.dz){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep286
NOP	
J	L_DualAxisStep91
NOP	
L__DualAxisStep286:
;Stepper.c,386 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
SW	R0, Offset(_STPS+32)(GP)
L_DualAxisStep92:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep287
NOP	
J	L_DualAxisStep93
NOP	
L__DualAxisStep287:
;Stepper.c,387 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,388 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,389 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,390 :: 		if(d2 < 0)d2 += 2*SV.dz;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep288
NOP	
J	L_DualAxisStep95
NOP	
L__DualAxisStep288:
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep96
NOP	
L_DualAxisStep95:
;Stepper.c,392 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,393 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,394 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,395 :: 		}
L_DualAxisStep96:
;Stepper.c,397 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep97:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep289
NOP	
J	L_DualAxisStep98
NOP	
L__DualAxisStep289:
J	L_DualAxisStep97
NOP	
L_DualAxisStep98:
;Stepper.c,386 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,398 :: 		}
J	L_DualAxisStep92
NOP	
L_DualAxisStep93:
;Stepper.c,399 :: 		}else{
J	L_DualAxisStep99
NOP	
L_DualAxisStep91:
;Stepper.c,400 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
SW	R0, Offset(_STPS+160)(GP)
L_DualAxisStep100:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+160)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep290
NOP	
J	L_DualAxisStep101
NOP	
L__DualAxisStep290:
;Stepper.c,401 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,402 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,403 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,404 :: 		if(d2 < 0)d2 += 2 * SV.dx;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep291
NOP	
J	L_DualAxisStep103
NOP	
L__DualAxisStep291:
LW	R2, Offset(_SV+12)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep104
NOP	
L_DualAxisStep103:
;Stepper.c,406 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,407 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,408 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,409 :: 		}
L_DualAxisStep104:
;Stepper.c,411 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep105:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep292
NOP	
J	L_DualAxisStep106
NOP	
L__DualAxisStep292:
J	L_DualAxisStep105
NOP	
L_DualAxisStep106:
;Stepper.c,400 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
LW	R2, Offset(_STPS+160)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+160)(GP)
;Stepper.c,412 :: 		}
J	L_DualAxisStep100
NOP	
L_DualAxisStep101:
;Stepper.c,413 :: 		}
L_DualAxisStep99:
;Stepper.c,414 :: 		}
L_DualAxisStep90:
;Stepper.c,415 :: 		break;
J	L_DualAxisStep50
NOP	
;Stepper.c,416 :: 		case yz:
L_DualAxisStep107:
;Stepper.c,417 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,418 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,419 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+8)(GP)
;Stepper.c,420 :: 		SV.dy   = newx - SV.pz;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,421 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,423 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep293
NOP	
J	L_DualAxisStep108
NOP	
L__DualAxisStep293:
; ?FLOC___DualAxisStep?T498 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T498 end address is: 12 (R3)
J	L_DualAxisStep109
NOP	
L_DualAxisStep108:
; ?FLOC___DualAxisStep?T498 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T498 end address is: 12 (R3)
L_DualAxisStep109:
; ?FLOC___DualAxisStep?T498 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T498 end address is: 12 (R3)
SH	R2, Offset(_SV+54)(GP)
;Stepper.c,424 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep294
NOP	
J	L_DualAxisStep110
NOP	
L__DualAxisStep294:
; ?FLOC___DualAxisStep?T500 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T500 end address is: 12 (R3)
J	L_DualAxisStep111
NOP	
L_DualAxisStep110:
; ?FLOC___DualAxisStep?T500 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T500 end address is: 12 (R3)
L_DualAxisStep111:
; ?FLOC___DualAxisStep?T500 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T500 end address is: 12 (R3)
SH	R2, Offset(_SV+56)(GP)
;Stepper.c,426 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+54)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep295
NOP	
J	L_DualAxisStep112
NOP	
L__DualAxisStep295:
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_DualAxisStep113
NOP	
L_DualAxisStep112:
;Stepper.c,427 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_DualAxisStep113:
;Stepper.c,428 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+56)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep296
NOP	
J	L_DualAxisStep114
NOP	
L__DualAxisStep296:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_DualAxisStep115
NOP	
L_DualAxisStep114:
;Stepper.c,429 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_DualAxisStep115:
;Stepper.c,430 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,431 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,433 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep297
NOP	
J	L_DualAxisStep116
NOP	
L__DualAxisStep297:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep117
NOP	
L_DualAxisStep116:
;Stepper.c,434 :: 		else d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
L_DualAxisStep117:
;Stepper.c,435 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep298
NOP	
J	L_DualAxisStep118
NOP	
L__DualAxisStep298:
;Stepper.c,436 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,437 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep299
NOP	
J	L_DualAxisStep119
NOP	
L__DualAxisStep299:
;Stepper.c,438 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
SW	R0, Offset(_STPS+96)(GP)
L_DualAxisStep120:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+96)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep300
NOP	
J	L_DualAxisStep121
NOP	
L__DualAxisStep300:
;Stepper.c,439 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,440 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,441 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,442 :: 		if(d2 < 0)d2 += 2*SV.dz;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep301
NOP	
J	L_DualAxisStep123
NOP	
L__DualAxisStep301:
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep124
NOP	
L_DualAxisStep123:
;Stepper.c,444 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,445 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,446 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,447 :: 		}
L_DualAxisStep124:
;Stepper.c,449 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep125:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep302
NOP	
J	L_DualAxisStep126
NOP	
L__DualAxisStep302:
J	L_DualAxisStep125
NOP	
L_DualAxisStep126:
;Stepper.c,438 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
LW	R2, Offset(_STPS+96)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+96)(GP)
;Stepper.c,450 :: 		}
J	L_DualAxisStep120
NOP	
L_DualAxisStep121:
;Stepper.c,451 :: 		}else{
J	L_DualAxisStep127
NOP	
L_DualAxisStep119:
;Stepper.c,452 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
SW	R0, Offset(_STPS+160)(GP)
L_DualAxisStep128:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+160)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep303
NOP	
J	L_DualAxisStep129
NOP	
L__DualAxisStep303:
;Stepper.c,453 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,454 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,455 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,456 :: 		if(d2 < 0)d2 += 2 * SV.dy;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep304
NOP	
J	L_DualAxisStep131
NOP	
L__DualAxisStep304:
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep132
NOP	
L_DualAxisStep131:
;Stepper.c,458 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,459 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,460 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,461 :: 		}
L_DualAxisStep132:
;Stepper.c,463 :: 		while(STmr.compOCxRunning == 0);
L_DualAxisStep133:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__DualAxisStep305
NOP	
J	L_DualAxisStep134
NOP	
L__DualAxisStep305:
J	L_DualAxisStep133
NOP	
L_DualAxisStep134:
;Stepper.c,452 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
LW	R2, Offset(_STPS+160)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+160)(GP)
;Stepper.c,464 :: 		}
J	L_DualAxisStep128
NOP	
L_DualAxisStep129:
;Stepper.c,465 :: 		}
L_DualAxisStep127:
;Stepper.c,466 :: 		}
L_DualAxisStep118:
;Stepper.c,468 :: 		break;
J	L_DualAxisStep50
NOP	
;Stepper.c,469 :: 		default: break;
L_DualAxisStep135:
J	L_DualAxisStep50
NOP	
;Stepper.c,471 :: 		}
L_DualAxisStep49:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep307
NOP	
J	L_DualAxisStep51
NOP	
L__DualAxisStep307:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep309
NOP	
J	L_DualAxisStep79
NOP	
L__DualAxisStep309:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep311
NOP	
J	L_DualAxisStep107
NOP	
L__DualAxisStep311:
J	L_DualAxisStep135
NOP	
L_DualAxisStep50:
;Stepper.c,475 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Stepper.c,483 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _DualAxisStep
_CalcRadius:
;Stepper.c,487 :: 		void CalcRadius(Circle* cir){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,490 :: 		cir->xRad = fabs(cir->xStart + cir->I);
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
;Stepper.c,491 :: 		cir->yRad = fabs(cir->yStart + cir->J);
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
;Stepper.c,492 :: 		cir->radius = sqrt((cir->xRad*cir->xRad) + (cir->yRad*cir->yRad));
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
;Stepper.c,493 :: 		angA = atan2(cir->yRad,cir->xRad);
ADDIU	R2, R25, 48
LWC1	S1, 0(R2)
ADDIU	R2, R25, 52
LWC1	S0, 0(R2)
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
;Stepper.c,496 :: 		cir->degreeDeg = angA * rad2deg;
ADDIU	R3, R25, 4
LUI	R2, 16997
ORI	R2, R2, 12013
MTC1	R2, S1
MUL.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Stepper.c,498 :: 		cir->quadrant_start = QuadrantStart(cir->I,cir->J);
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
;Stepper.c,500 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius314
NOP	
J	L__CalcRadius218
NOP	
L__CalcRadius314:
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius316
NOP	
J	L__CalcRadius217
NOP	
L__CalcRadius316:
J	L_CalcRadius138
NOP	
L__CalcRadius218:
L__CalcRadius217:
;Stepper.c,501 :: 		angB = cir->deg - cir->degreeDeg;
LWC1	S1, 0(R25)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius138:
;Stepper.c,502 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius318
NOP	
J	L__CalcRadius220
NOP	
L__CalcRadius318:
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius320
NOP	
J	L__CalcRadius219
NOP	
L__CalcRadius320:
J	L_CalcRadius141
NOP	
L__CalcRadius220:
L__CalcRadius219:
;Stepper.c,503 :: 		angB = cir->deg + cir->degreeDeg;
LWC1	S1, 0(R25)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius141:
;Stepper.c,505 :: 		cir->degreeRadians = angB * deg2rad;
ADDIU	R3, R25, 8
LWC1	S1, 8(SP)
LUI	R2, 15502
ORI	R2, R2, 64046
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, 0(R3)
;Stepper.c,506 :: 		}
L_end_CalcRadius:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _CalcRadius
_QuadrantStart:
;Stepper.c,508 :: 		int QuadrantStart(float i,float j){
;Stepper.c,509 :: 		if((i <= 0)&&(j >= 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__QuadrantStart322
NOP	
J	L__QuadrantStart208
NOP	
L__QuadrantStart322:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S13, S0
BC1F	0, L__QuadrantStart323
NOP	
J	L__QuadrantStart207
NOP	
L__QuadrantStart323:
L__QuadrantStart206:
;Stepper.c,510 :: 		return 1;
ORI	R2, R0, 1
J	L_end_QuadrantStart
NOP	
;Stepper.c,509 :: 		if((i <= 0)&&(j >= 0))
L__QuadrantStart208:
L__QuadrantStart207:
;Stepper.c,511 :: 		else if((i > 0)&&(j > 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart324
NOP	
J	L__QuadrantStart210
NOP	
L__QuadrantStart324:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S13, S0
BC1F	0, L__QuadrantStart325
NOP	
J	L__QuadrantStart209
NOP	
L__QuadrantStart325:
L__QuadrantStart205:
;Stepper.c,512 :: 		return 2;
ORI	R2, R0, 2
J	L_end_QuadrantStart
NOP	
;Stepper.c,511 :: 		else if((i > 0)&&(j > 0))
L__QuadrantStart210:
L__QuadrantStart209:
;Stepper.c,513 :: 		else if((i > 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart326
NOP	
J	L__QuadrantStart212
NOP	
L__QuadrantStart326:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart327
NOP	
J	L__QuadrantStart211
NOP	
L__QuadrantStart327:
L__QuadrantStart204:
;Stepper.c,514 :: 		return 3;
ORI	R2, R0, 3
J	L_end_QuadrantStart
NOP	
;Stepper.c,513 :: 		else if((i > 0)&&(j < 0))
L__QuadrantStart212:
L__QuadrantStart211:
;Stepper.c,515 :: 		else if((i < 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__QuadrantStart328
NOP	
J	L__QuadrantStart214
NOP	
L__QuadrantStart328:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart329
NOP	
J	L__QuadrantStart213
NOP	
L__QuadrantStart329:
L__QuadrantStart203:
;Stepper.c,516 :: 		return 4;
ORI	R2, R0, 4
J	L_end_QuadrantStart
NOP	
;Stepper.c,515 :: 		else if((i < 0)&&(j < 0))
L__QuadrantStart214:
L__QuadrantStart213:
;Stepper.c,518 :: 		return 0;
MOVZ	R2, R0, R0
;Stepper.c,519 :: 		}
L_end_QuadrantStart:
JR	RA
NOP	
; end of _QuadrantStart
_CircDir:
;Stepper.c,521 :: 		void CircDir(Circle* cir){
;Stepper.c,523 :: 		if(cir->dir == CW){
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__CircDir331
NOP	
J	L_CircDir158
NOP	
L__CircDir331:
;Stepper.c,524 :: 		newDeg = 360 / cir->deg;
LWC1	S1, 0(R25)
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S2, S0, S1
; newDeg start address is: 24 (R6)
MOV.S 	S3, S2
;Stepper.c,525 :: 		cir->N = (2*Pi*cir->radius)/newDeg;
ADDIU	R3, R25, 36
ADDIU	R2, R25, 40
LWC1	S1, 0(R2)
LUI	R2, 16585
ORI	R2, R2, 4048
MTC1	R2, S0
MUL.S 	S0, S0, S1
DIV.S 	S0, S0, S2
SWC1	S0, 0(R3)
;Stepper.c,526 :: 		cir->divisor = cir->deg / newDeg;
ADDIU	R2, R25, 20
LWC1	S0, 0(R25)
DIV.S 	S0, S0, S3
; newDeg end address is: 24 (R6)
SWC1	S0, 0(R2)
;Stepper.c,527 :: 		}
L_CircDir158:
;Stepper.c,529 :: 		if(cir->dir == CW)
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__CircDir332
NOP	
J	L_CircDir159
NOP	
L__CircDir332:
;Stepper.c,530 :: 		cir->deg = 0.00;
SW	R0, 0(R25)
L_CircDir159:
;Stepper.c,531 :: 		if(cir->dir == CCW)
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__CircDir333
NOP	
J	L_CircDir160
NOP	
L__CircDir333:
;Stepper.c,532 :: 		cir->deg = 360.00;
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
SWC1	S0, 0(R25)
L_CircDir160:
;Stepper.c,533 :: 		}
L_end_CircDir:
JR	RA
NOP	
; end of _CircDir
_Cir_Interpolation:
;Stepper.c,535 :: 		void Cir_Interpolation(float xPresent,float yPresent,Circle* cir){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,537 :: 		cir->xStart = xPresent;
ADDIU	R2, R25, 56
SWC1	S12, 0(R2)
;Stepper.c,538 :: 		cir->yStart = yPresent;
ADDIU	R2, R25, 60
SWC1	S13, 0(R2)
;Stepper.c,539 :: 		CalcRadius(cir);
JAL	_CalcRadius+0
NOP	
;Stepper.c,542 :: 		while(quad){
LH	R2, Offset(Cir_Interpolation_quad_L0+0)(GP)
BNE	R2, R0, L__Cir_Interpolation336
NOP	
J	L_Cir_Interpolation162
NOP	
L__Cir_Interpolation336:
;Stepper.c,553 :: 		}
L_Cir_Interpolation162:
;Stepper.c,554 :: 		}
L_end_Cir_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Cir_Interpolation
_toggleOCx:
;Stepper.c,558 :: 		void toggleOCx(int axis_No){
;Stepper.c,559 :: 		switch(axis_No){
J	L_toggleOCx169
NOP	
;Stepper.c,560 :: 		case 0: OC5R   = 0x5;
L_toggleOCx171:
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,561 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,562 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,563 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,564 :: 		break;
J	L_toggleOCx170
NOP	
;Stepper.c,565 :: 		case 1: OC3R   = 0x5;
L_toggleOCx172:
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,566 :: 		OC3RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+72)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,567 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,568 :: 		OC3CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,569 :: 		break;
J	L_toggleOCx170
NOP	
;Stepper.c,570 :: 		case 2: OC8R   = 0x5;
L_toggleOCx173:
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,571 :: 		OC8RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+136)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,572 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,573 :: 		OC8CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,574 :: 		break;
J	L_toggleOCx170
NOP	
;Stepper.c,575 :: 		default:
L_toggleOCx174:
;Stepper.c,576 :: 		break;
J	L_toggleOCx170
NOP	
;Stepper.c,577 :: 		}
L_toggleOCx169:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx339
NOP	
J	L_toggleOCx171
NOP	
L__toggleOCx339:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx341
NOP	
J	L_toggleOCx172
NOP	
L__toggleOCx341:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx343
NOP	
J	L_toggleOCx173
NOP	
L__toggleOCx343:
J	L_toggleOCx174
NOP	
L_toggleOCx170:
;Stepper.c,579 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_disableOCx:
;Stepper.c,582 :: 		void disableOCx(){
;Stepper.c,583 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,584 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,585 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,586 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_Pulse:
;Stepper.c,589 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,591 :: 		if(!STPS[axis_No].PLS_Step_ ){
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Pulse346
NOP	
J	L_Pulse175
NOP	
L__Pulse346:
;Stepper.c,592 :: 		STPS[axis_No].PLS_Step_   = 1;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 2
SB	R2, 0(R3)
;Stepper.c,593 :: 		}
L_Pulse175:
;Stepper.c,595 :: 		switch(STPS[axis_No].run_state) {
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse176
NOP	
;Stepper.c,596 :: 		case STOP:
L_Pulse178:
;Stepper.c,597 :: 		LATE7_bit = 0;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,598 :: 		T8IE_bit         = 0;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Stepper.c,599 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,600 :: 		break;
J	L_Pulse177
NOP	
;Stepper.c,602 :: 		case ACCEL:
L_Pulse179:
;Stepper.c,603 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,608 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 8
LW	R3, 0(R2)
ADDIU	R2, R4, 20
LW	R2, 0(R2)
SLT	R2, R2, R3
BEQ	R2, R0, L__Pulse347
NOP	
J	L_Pulse180
NOP	
L__Pulse347:
;Stepper.c,610 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,611 :: 		STPS[axis_No].run_state  = RUN;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,612 :: 		}
L_Pulse180:
;Stepper.c,613 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 8
LW	R3, 0(R2)
ADDIU	R2, R4, 44
LW	R2, 0(R2)
SLT	R2, R2, R3
BNE	R2, R0, L__Pulse348
NOP	
J	L_Pulse181
NOP	
L__Pulse348:
;Stepper.c,614 :: 		STPS[axis_No].run_state  = RUN;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,615 :: 		}
L_Pulse181:
;Stepper.c,616 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 32
LW	R3, 0(R2)
ADDIU	R2, R4, 12
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L__Pulse349
NOP	
J	L_Pulse182
NOP	
L__Pulse349:
;Stepper.c,617 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,618 :: 		STPS[axis_No].rest        = 0;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Stepper.c,619 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,620 :: 		}
L_Pulse182:
;Stepper.c,621 :: 		break;
J	L_Pulse177
NOP	
;Stepper.c,623 :: 		case RUN:
L_Pulse183:
;Stepper.c,624 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,626 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 32
LW	R3, 0(R2)
ADDIU	R2, R4, 12
LW	R2, 0(R2)
SLT	R2, R3, R2
BEQ	R2, R0, L__Pulse350
NOP	
J	L_Pulse184
NOP	
L__Pulse350:
;Stepper.c,627 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,628 :: 		STPS[axis_No].rest        = 0;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Stepper.c,630 :: 		STPS[axis_No].run_state   =  DECEL;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,631 :: 		}
L_Pulse184:
;Stepper.c,632 :: 		break;
J	L_Pulse177
NOP	
;Stepper.c,634 :: 		case DECEL:
L_Pulse185:
;Stepper.c,637 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,638 :: 		if(STPS[axis_No].accel_count >= -2 ){
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SLTI	R2, R2, -2
BEQ	R2, R0, L__Pulse351
NOP	
J	L_Pulse186
NOP	
L__Pulse351:
;Stepper.c,639 :: 		STPS[axis_No].run_state = STOP;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,640 :: 		}
L_Pulse186:
;Stepper.c,641 :: 		break;
J	L_Pulse177
NOP	
;Stepper.c,642 :: 		default:break;
L_Pulse187:
J	L_Pulse177
NOP	
;Stepper.c,643 :: 		}
L_Pulse176:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse353
NOP	
J	L_Pulse178
NOP	
L__Pulse353:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse355
NOP	
J	L_Pulse179
NOP	
L__Pulse355:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse357
NOP	
J	L_Pulse183
NOP	
L__Pulse357:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse359
NOP	
J	L_Pulse185
NOP	
L__Pulse359:
J	L_Pulse187
NOP	
L_Pulse177:
;Stepper.c,644 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,645 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,647 :: 		void AccDec(int axis_No){
;Stepper.c,648 :: 		STPS[axis_No].accel_count++;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,649 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R6, R2, R3
ADDIU	R5, R6, 36
ADDIU	R2, R6, 8
LW	R4, 0(R2)
SLL	R3, R4, 1
ADDIU	R2, R6, 52
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
;Stepper.c,650 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R5, R2, R3
ADDIU	R4, R5, 52
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
;Stepper.c,651 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 36
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,653 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
Stepper_sqrt_:
;Stepper.c,664 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,670 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,671 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,672 :: 		do
J	L_Stepper_sqrt_188
NOP	
L_Stepper_sqrt_198:
;Stepper.c,686 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,672 :: 		do
L_Stepper_sqrt_188:
;Stepper.c,674 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_362
NOP	
J	L_Stepper_sqrt_191
NOP	
L_Stepper_sqrt_362:
;Stepper.c,676 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,677 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,678 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_192
NOP	
L_Stepper_sqrt_191:
;Stepper.c,680 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,681 :: 		}
L_Stepper_sqrt_192:
;Stepper.c,682 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,683 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_364
NOP	
J	L_Stepper_sqrt_199
NOP	
L_Stepper_sqrt_364:
; f end address is: 16 (R4)
;Stepper.c,684 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,685 :: 		}
J	L_Stepper_sqrt_193
NOP	
L_Stepper_sqrt_199:
;Stepper.c,683 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,685 :: 		}
L_Stepper_sqrt_193:
;Stepper.c,686 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_365
NOP	
J	L_Stepper_sqrt_198
NOP	
L_Stepper_sqrt_365:
; q2 end address is: 12 (R3)
;Stepper.c,687 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_366
NOP	
J	L_Stepper_sqrt_194
NOP	
L_Stepper_sqrt_366:
;Stepper.c,688 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,689 :: 		}
L_Stepper_sqrt_194:
;Stepper.c,691 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,693 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_min_:
;Stepper.c,700 :: 		unsigned int min_(unsigned int x, unsigned int y)
;Stepper.c,702 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_368
NOP	
J	L_min_196
NOP	
L__min_368:
;Stepper.c,703 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,704 :: 		}
L_min_196:
;Stepper.c,706 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,708 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
_StepX:
;Stepper.c,712 :: 		void StepX() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,714 :: 		STmr.compOCxRunning = 1;
ORI	R2, R0, 1
SH	R2, Offset(_STmr+8)(GP)
;Stepper.c,715 :: 		TMR4 =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,716 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,718 :: 		}
L_end_StepX:
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
;Stepper.c,719 :: 		void StepY() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,721 :: 		STmr.compOCxRunning = 2;
ORI	R2, R0, 2
SH	R2, Offset(_STmr+8)(GP)
;Stepper.c,722 :: 		TMR2 =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,723 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,725 :: 		}
L_end_StepY:
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
;Stepper.c,726 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_8 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,728 :: 		STmr.compOCxRunning = 3;
ORI	R2, R0, 3
SH	R2, Offset(_STmr+8)(GP)
;Stepper.c,729 :: 		TMR6 =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,730 :: 		OC8IF_bit = 0;
LUI	R2, BitMask(OC8IF_bit+0)
ORI	R2, R2, BitMask(OC8IF_bit+0)
_SX	
;Stepper.c,732 :: 		}
L_end_StepZ:
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
