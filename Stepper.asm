_SetPinMode:
;Stepper.c,77 :: 		void SetPinMode(){
;Stepper.c,80 :: 		EN_Step_PinDirX  = 0; //output
LUI	R2, BitMask(TRISB15_bit+0)
ORI	R2, R2, BitMask(TRISB15_bit+0)
_SX	
_LX	
EXT	R2, R2, BitPos(TRISB15_bit+0), 1
SB	R2, Offset(_AxisNo+0)(GP)
;Stepper.c,83 :: 		PLS_Step_PinDirX = 0;
LUI	R2, BitMask(TRISD4_bit+0)
ORI	R2, R2, BitMask(TRISD4_bit+0)
_SX	
;Stepper.c,84 :: 		DIR_Step_PinDirX = 0;
LUI	R2, BitMask(TRISB1_bit+0)
ORI	R2, R2, BitMask(TRISB1_bit+0)
_SX	
;Stepper.c,86 :: 		EN_Step_PinDirY  = 0; //output
LUI	R2, BitMask(TRISE1_bit+0)
ORI	R2, R2, BitMask(TRISE1_bit+0)
_SX	
;Stepper.c,89 :: 		PLS_Step_PinDirY = 0;
LUI	R2, BitMask(TRISD5_bit+0)
ORI	R2, R2, BitMask(TRISD5_bit+0)
_SX	
;Stepper.c,90 :: 		DIR_Step_PinDirY = 0;
LUI	R2, BitMask(TRISE0_bit+0)
ORI	R2, R2, BitMask(TRISE0_bit+0)
_SX	
;Stepper.c,92 :: 		EN_Step_PinDirZ  = 0; //output
LUI	R2, BitMask(TRISA7_bit+0)
ORI	R2, R2, BitMask(TRISA7_bit+0)
_SX	
;Stepper.c,95 :: 		PLS_Step_PinDirZ = 0;
LUI	R2, BitMask(TRISF0_bit+0)
ORI	R2, R2, BitMask(TRISF0_bit+0)
_SX	
;Stepper.c,96 :: 		DIR_Step_PinDirZ = 0;
LUI	R2, BitMask(TRISA6_bit+0)
ORI	R2, R2, BitMask(TRISA6_bit+0)
_SX	
;Stepper.c,98 :: 		EN_Step_PinDirA  = 0; //output
LUI	R2, BitMask(TRISD13_bit+0)
ORI	R2, R2, BitMask(TRISD13_bit+0)
_SX	
;Stepper.c,101 :: 		PLS_Step_PinDirA = 0;
LUI	R2, BitMask(TRISF1_bit+0)
ORI	R2, R2, BitMask(TRISF1_bit+0)
_SX	
;Stepper.c,102 :: 		DIR_Step_PinDirA = 0;
LUI	R2, BitMask(TRISD0_bit+0)
ORI	R2, R2, BitMask(TRISD0_bit+0)
_SX	
;Stepper.c,103 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_StepperConstants:
;Stepper.c,107 :: 		void StepperConstants(long accel,long decel){
;Stepper.c,108 :: 		SV.acc = accel;
SW	R25, Offset(_SV+56)(GP)
;Stepper.c,109 :: 		SV.dec = decel;
SW	R26, Offset(_SV+60)(GP)
;Stepper.c,110 :: 		}
L_end_StepperConstants:
JR	RA
NOP	
; end of _StepperConstants
_EnStepperX:
;Stepper.c,114 :: 		void EnStepperX(){
;Stepper.c,117 :: 		EN_StepX       = 0;
LUI	R2, BitMask(LATB15_bit+0)
ORI	R2, R2, BitMask(LATB15_bit+0)
_SX	
;Stepper.c,118 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,120 :: 		void EnStepperY(){
;Stepper.c,123 :: 		EN_StepY       = 0;
LUI	R2, BitMask(LATE1_bit+0)
ORI	R2, R2, BitMask(LATE1_bit+0)
_SX	
;Stepper.c,124 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,125 :: 		void EnStepperZ(){
;Stepper.c,128 :: 		EN_StepZ       = 0;
LUI	R2, BitMask(LATA7_bit+0)
ORI	R2, R2, BitMask(LATA7_bit+0)
_SX	
;Stepper.c,129 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_EnStepperA:
;Stepper.c,130 :: 		void EnStepperA(){
;Stepper.c,133 :: 		EN_StepA       = 0;
LUI	R2, BitMask(LATD13_bit+0)
ORI	R2, R2, BitMask(LATD13_bit+0)
_SX	
;Stepper.c,134 :: 		}
L_end_EnStepperA:
JR	RA
NOP	
; end of _EnStepperA
_DisableStepper:
;Stepper.c,136 :: 		void DisableStepper(){
;Stepper.c,137 :: 		EN_StepX      = 1;
LUI	R2, BitMask(LATB15_bit+0)
ORI	R2, R2, BitMask(LATB15_bit+0)
_SX	
;Stepper.c,138 :: 		EN_StepY      = 1;
LUI	R2, BitMask(LATE1_bit+0)
ORI	R2, R2, BitMask(LATE1_bit+0)
_SX	
;Stepper.c,139 :: 		EN_StepZ      = 1;
LUI	R2, BitMask(LATA7_bit+0)
ORI	R2, R2, BitMask(LATA7_bit+0)
_SX	
;Stepper.c,140 :: 		EN_StepA      = 1;
LUI	R2, BitMask(LATD13_bit+0)
ORI	R2, R2, BitMask(LATD13_bit+0)
_SX	
;Stepper.c,141 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_speed_cntr_Move:
;Stepper.c,159 :: 		void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,162 :: 		if(mmSteps == 1){
SW	R25, 4(SP)
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move237
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move237:
;Stepper.c,164 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
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
;Stepper.c,165 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
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
;Stepper.c,166 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
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
;Stepper.c,167 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,169 :: 		}
J	L_speed_cntr_Move1
NOP	
L_speed_cntr_Move0:
;Stepper.c,171 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
BNE	R25, R0, L__speed_cntr_Move239
NOP	
J	L__speed_cntr_Move201
NOP	
L__speed_cntr_Move239:
JAL	_abs+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__speed_cntr_Move241
NOP	
J	L__speed_cntr_Move200
NOP	
L__speed_cntr_Move241:
L__speed_cntr_Move199:
;Stepper.c,175 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
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
;Stepper.c,180 :: 		STPS[axis_No].step_delay = abs((T1_FREQ_148 * sqrt_(A_SQ / SV.acc))/100);
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
;Stepper.c,181 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
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
;Stepper.c,186 :: 		STPS[axis_No].max_step_lim = (speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
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
;Stepper.c,191 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move242
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move242:
;Stepper.c,192 :: 		STPS[axis_No].max_step_lim = 1;
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
;Stepper.c,193 :: 		}
L_speed_cntr_Move5:
;Stepper.c,197 :: 		STPS[axis_No].accel_lim = (abs(mmSteps) * SV.dec) / (SV.acc + SV.dec);
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
;Stepper.c,200 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move243
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move243:
;Stepper.c,201 :: 		STPS[axis_No].accel_lim = 1;
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
;Stepper.c,202 :: 		}
L_speed_cntr_Move6:
;Stepper.c,205 :: 		if(STPS[axis_No].accel_lim <= STPS[axis_No].max_step_lim){
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
BEQ	R2, R0, L__speed_cntr_Move244
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move244:
;Stepper.c,206 :: 		if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move245
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move245:
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
;Stepper.c,207 :: 		else STPS[axis_No].decel_val = mmSteps + STPS[axis_No].accel_lim;
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
;Stepper.c,208 :: 		}else{
J	L_speed_cntr_Move10
NOP	
L_speed_cntr_Move7:
;Stepper.c,209 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * SV.acc) / SV.dec);
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
;Stepper.c,210 :: 		}
L_speed_cntr_Move10:
;Stepper.c,212 :: 		if(mmSteps >= 0){
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move246
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move246:
;Stepper.c,213 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
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
BNE	R2, R0, L__speed_cntr_Move247
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move247:
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
;Stepper.c,214 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
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
;Stepper.c,215 :: 		}
J	L_speed_cntr_Move14
NOP	
L_speed_cntr_Move11:
;Stepper.c,217 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = abs(mmSteps) * STPS[axis_No].decel_val;
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
BNE	R2, R0, L__speed_cntr_Move248
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move248:
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
;Stepper.c,218 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
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
;Stepper.c,219 :: 		}
L_speed_cntr_Move14:
;Stepper.c,221 :: 		if(STPS[axis_No].decel_val == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
BEQ	R2, R0, L__speed_cntr_Move249
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move249:
;Stepper.c,222 :: 		STPS[axis_No].decel_val = -1;
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
;Stepper.c,223 :: 		}
L_speed_cntr_Move17:
;Stepper.c,226 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__speed_cntr_Move250
NOP	
J	L_speed_cntr_Move18
NOP	
L__speed_cntr_Move250:
;Stepper.c,227 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,228 :: 		STPS[axis_No].run_state = RUN;
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
;Stepper.c,229 :: 		}else{
J	L_speed_cntr_Move19
NOP	
L_speed_cntr_Move18:
;Stepper.c,230 :: 		STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
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
;Stepper.c,231 :: 		STPS[axis_No].run_state = ACCEL;
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
;Stepper.c,232 :: 		}
L_speed_cntr_Move19:
;Stepper.c,171 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
L__speed_cntr_Move201:
L__speed_cntr_Move200:
;Stepper.c,234 :: 		}
L_speed_cntr_Move1:
;Stepper.c,235 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,236 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,237 :: 		STPS[axis_No].microSec    = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,238 :: 		STPS[axis_No].accel_count = 1;
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
;Stepper.c,239 :: 		STPS[axis_No].dist        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R0, 0(R2)
;Stepper.c,240 :: 		SV.Tog   = 0;
SH	R0, Offset(_SV+2)(GP)
;Stepper.c,241 :: 		SV.running = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,242 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_SingleAxisStep:
;Stepper.c,250 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,256 :: 		SV.Single_Dual = 0;
SW	R25, 4(SP)
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,257 :: 		switch(axis_No){
J	L_SingleAxisStep20
NOP	
;Stepper.c,258 :: 		case X:
L_SingleAxisStep22:
;Stepper.c,259 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,260 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,261 :: 		case Y:
L_SingleAxisStep23:
;Stepper.c,262 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+8)(GP)
;Stepper.c,263 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,264 :: 		case Z:
L_SingleAxisStep24:
;Stepper.c,265 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+8)(GP)
;Stepper.c,266 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,267 :: 		case A:
L_SingleAxisStep25:
;Stepper.c,268 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,269 :: 		break;
J	L_SingleAxisStep21
NOP	
;Stepper.c,270 :: 		default: break;
L_SingleAxisStep26:
J	L_SingleAxisStep21
NOP	
;Stepper.c,271 :: 		}
L_SingleAxisStep20:
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep253
NOP	
J	L_SingleAxisStep22
NOP	
L__SingleAxisStep253:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep255
NOP	
J	L_SingleAxisStep23
NOP	
L__SingleAxisStep255:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep257
NOP	
J	L_SingleAxisStep24
NOP	
L__SingleAxisStep257:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep259
NOP	
J	L_SingleAxisStep25
NOP	
L__SingleAxisStep259:
J	L_SingleAxisStep26
NOP	
L_SingleAxisStep21:
;Stepper.c,272 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+48)(GP)
;Stepper.c,273 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R25, 0(R2)
;Stepper.c,274 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
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
;Stepper.c,276 :: 		if(newxyz < 0)
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep260
NOP	
J	L_SingleAxisStep27
NOP	
L__SingleAxisStep260:
;Stepper.c,277 :: 		dir = CCW;
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep28
NOP	
L_SingleAxisStep27:
;Stepper.c,279 :: 		dir = CW;
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep28:
;Stepper.c,281 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep29
NOP	
;Stepper.c,282 :: 		case X:
L_SingleAxisStep31:
;Stepper.c,283 :: 		DIR_StepX = dir;
_LX	
INS	R2, R4, BitPos(LATB1_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,284 :: 		break;
J	L_SingleAxisStep30
NOP	
;Stepper.c,285 :: 		case Y:
L_SingleAxisStep32:
;Stepper.c,286 :: 		DIR_StepY = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(LATE0_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,287 :: 		break;
J	L_SingleAxisStep30
NOP	
;Stepper.c,288 :: 		case Z:
L_SingleAxisStep33:
;Stepper.c,289 :: 		DIR_StepZ = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(LATA6_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,290 :: 		break;
J	L_SingleAxisStep30
NOP	
;Stepper.c,291 :: 		case A:
L_SingleAxisStep34:
;Stepper.c,292 :: 		DIR_StepA = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(LATD0_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,293 :: 		break;
J	L_SingleAxisStep30
NOP	
;Stepper.c,294 :: 		default: break;
L_SingleAxisStep35:
J	L_SingleAxisStep30
NOP	
;Stepper.c,295 :: 		}
L_SingleAxisStep29:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep262
NOP	
J	L_SingleAxisStep31
NOP	
L__SingleAxisStep262:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep264
NOP	
J	L_SingleAxisStep32
NOP	
L__SingleAxisStep264:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep266
NOP	
J	L_SingleAxisStep33
NOP	
L__SingleAxisStep266:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep268
NOP	
J	L_SingleAxisStep34
NOP	
L__SingleAxisStep268:
; dir end address is: 16 (R4)
J	L_SingleAxisStep35
NOP	
L_SingleAxisStep30:
;Stepper.c,297 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,299 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Stepper.c,301 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Stepper.c,306 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,308 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+52)(GP)
;Stepper.c,310 :: 		SV.px = 0;
SW	R0, Offset(_SV+32)(GP)
;Stepper.c,311 :: 		SV.py = 0;
SW	R0, Offset(_SV+36)(GP)
;Stepper.c,312 :: 		SV.pz = 0;
SW	R0, Offset(_SV+40)(GP)
;Stepper.c,316 :: 		SV.Single_Dual = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,317 :: 		switch(axis_combo){
J	L_DualAxisStep36
NOP	
;Stepper.c,318 :: 		case xy:
L_DualAxisStep38:
;Stepper.c,319 :: 		AxisPulse = XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Stepper.c,320 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Stepper.c,321 :: 		Axis_Enable(axis_xyz);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_Axis_Enable+0
NOP	
LW	R25, 8(SP)
;Stepper.c,323 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,324 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,327 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep270
NOP	
J	L_DualAxisStep39
NOP	
L__DualAxisStep270:
; ?FLOC___DualAxisStep?T387 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T387 end address is: 12 (R3)
J	L_DualAxisStep40
NOP	
L_DualAxisStep39:
; ?FLOC___DualAxisStep?T387 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T387 end address is: 12 (R3)
L_DualAxisStep40:
; ?FLOC___DualAxisStep?T387 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T387 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
;Stepper.c,328 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep271
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep271:
; ?FLOC___DualAxisStep?T389 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T389 end address is: 12 (R3)
J	L_DualAxisStep42
NOP	
L_DualAxisStep41:
; ?FLOC___DualAxisStep?T389 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T389 end address is: 12 (R3)
L_DualAxisStep42:
; ?FLOC___DualAxisStep?T389 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T389 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
;Stepper.c,331 :: 		if(SV.dirx < 0)
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep272
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep272:
;Stepper.c,332 :: 		DIR_StepX = CCW;
LUI	R2, BitMask(LATB1_bit+0)
ORI	R2, R2, BitMask(LATB1_bit+0)
_SX	
J	L_DualAxisStep44
NOP	
L_DualAxisStep43:
;Stepper.c,334 :: 		DIR_StepX = CW;
LUI	R2, BitMask(LATB1_bit+0)
ORI	R2, R2, BitMask(LATB1_bit+0)
_SX	
L_DualAxisStep44:
;Stepper.c,336 :: 		if(SV.diry < 0)
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep273
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep273:
;Stepper.c,337 :: 		DIR_StepY = CCW;
LUI	R2, BitMask(LATE0_bit+0)
ORI	R2, R2, BitMask(LATE0_bit+0)
_SX	
J	L_DualAxisStep46
NOP	
L_DualAxisStep45:
;Stepper.c,339 :: 		DIR_StepY = CW;
LUI	R2, BitMask(LATE0_bit+0)
ORI	R2, R2, BitMask(LATE0_bit+0)
_SX	
L_DualAxisStep46:
;Stepper.c,341 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,342 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,344 :: 		if(SV.dx > SV.dy)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep274
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep274:
;Stepper.c,345 :: 		SV.d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep48
NOP	
L_DualAxisStep47:
;Stepper.c,347 :: 		SV.d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep48:
;Stepper.c,349 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Stepper.c,350 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Stepper.c,351 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Stepper.c,353 :: 		break;
J	L_DualAxisStep37
NOP	
;Stepper.c,354 :: 		case xz:
L_DualAxisStep49:
;Stepper.c,355 :: 		AxisPulse = XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Stepper.c,356 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Stepper.c,357 :: 		Axis_Enable(axis_xyz);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_Axis_Enable+0
NOP	
LW	R25, 8(SP)
;Stepper.c,359 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,360 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,363 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep275
NOP	
J	L_DualAxisStep50
NOP	
L__DualAxisStep275:
; ?FLOC___DualAxisStep?T403 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T403 end address is: 12 (R3)
J	L_DualAxisStep51
NOP	
L_DualAxisStep50:
; ?FLOC___DualAxisStep?T403 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T403 end address is: 12 (R3)
L_DualAxisStep51:
; ?FLOC___DualAxisStep?T403 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T403 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
;Stepper.c,364 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep276
NOP	
J	L_DualAxisStep52
NOP	
L__DualAxisStep276:
; ?FLOC___DualAxisStep?T405 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T405 end address is: 12 (R3)
J	L_DualAxisStep53
NOP	
L_DualAxisStep52:
; ?FLOC___DualAxisStep?T405 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T405 end address is: 12 (R3)
L_DualAxisStep53:
; ?FLOC___DualAxisStep?T405 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T405 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
;Stepper.c,367 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep277
NOP	
J	L_DualAxisStep54
NOP	
L__DualAxisStep277:
LUI	R2, BitMask(LATB1_bit+0)
ORI	R2, R2, BitMask(LATB1_bit+0)
_SX	
J	L_DualAxisStep55
NOP	
L_DualAxisStep54:
;Stepper.c,368 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATB1_bit+0)
ORI	R2, R2, BitMask(LATB1_bit+0)
_SX	
L_DualAxisStep55:
;Stepper.c,370 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep278
NOP	
J	L_DualAxisStep56
NOP	
L__DualAxisStep278:
LUI	R2, BitMask(LATA6_bit+0)
ORI	R2, R2, BitMask(LATA6_bit+0)
_SX	
J	L_DualAxisStep57
NOP	
L_DualAxisStep56:
;Stepper.c,371 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATA6_bit+0)
ORI	R2, R2, BitMask(LATA6_bit+0)
_SX	
L_DualAxisStep57:
;Stepper.c,373 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,374 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,376 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep279
NOP	
J	L_DualAxisStep58
NOP	
L__DualAxisStep279:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_DualAxisStep59
NOP	
L_DualAxisStep58:
;Stepper.c,377 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Stepper_d2+0)(GP)
L_DualAxisStep59:
;Stepper.c,379 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Stepper.c,380 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Stepper.c,381 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Stepper.c,382 :: 		break;
J	L_DualAxisStep37
NOP	
;Stepper.c,383 :: 		case yz:
L_DualAxisStep60:
;Stepper.c,384 :: 		AxisPulse = YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Stepper.c,385 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Stepper.c,386 :: 		Axis_Enable(axis_xyz);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_Axis_Enable+0
NOP	
LW	R25, 8(SP)
;Stepper.c,389 :: 		SV.dy   = newx - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,390 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,393 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep280
NOP	
J	L_DualAxisStep61
NOP	
L__DualAxisStep280:
; ?FLOC___DualAxisStep?T419 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T419 end address is: 12 (R3)
J	L_DualAxisStep62
NOP	
L_DualAxisStep61:
; ?FLOC___DualAxisStep?T419 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T419 end address is: 12 (R3)
L_DualAxisStep62:
; ?FLOC___DualAxisStep?T419 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T419 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
;Stepper.c,394 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep281
NOP	
J	L_DualAxisStep63
NOP	
L__DualAxisStep281:
; ?FLOC___DualAxisStep?T421 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T421 end address is: 12 (R3)
J	L_DualAxisStep64
NOP	
L_DualAxisStep63:
; ?FLOC___DualAxisStep?T421 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T421 end address is: 12 (R3)
L_DualAxisStep64:
; ?FLOC___DualAxisStep?T421 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T421 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
;Stepper.c,397 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep282
NOP	
J	L_DualAxisStep65
NOP	
L__DualAxisStep282:
LUI	R2, BitMask(LATE0_bit+0)
ORI	R2, R2, BitMask(LATE0_bit+0)
_SX	
J	L_DualAxisStep66
NOP	
L_DualAxisStep65:
;Stepper.c,398 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATE0_bit+0)
ORI	R2, R2, BitMask(LATE0_bit+0)
_SX	
L_DualAxisStep66:
;Stepper.c,399 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep283
NOP	
J	L_DualAxisStep67
NOP	
L__DualAxisStep283:
LUI	R2, BitMask(LATA6_bit+0)
ORI	R2, R2, BitMask(LATA6_bit+0)
_SX	
J	L_DualAxisStep68
NOP	
L_DualAxisStep67:
;Stepper.c,400 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATA6_bit+0)
ORI	R2, R2, BitMask(LATA6_bit+0)
_SX	
L_DualAxisStep68:
;Stepper.c,402 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,403 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Stepper.c,405 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep284
NOP	
J	L_DualAxisStep69
NOP	
L__DualAxisStep284:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_DualAxisStep70
NOP	
L_DualAxisStep69:
;Stepper.c,406 :: 		else d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Stepper_d2+0)(GP)
L_DualAxisStep70:
;Stepper.c,408 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Stepper.c,409 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Stepper.c,410 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Stepper.c,411 :: 		break;
J	L_DualAxisStep37
NOP	
;Stepper.c,412 :: 		default: break;
L_DualAxisStep71:
J	L_DualAxisStep37
NOP	
;Stepper.c,414 :: 		}
L_DualAxisStep36:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep286
NOP	
J	L_DualAxisStep38
NOP	
L__DualAxisStep286:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep288
NOP	
J	L_DualAxisStep49
NOP	
L__DualAxisStep288:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep290
NOP	
J	L_DualAxisStep60
NOP	
L__DualAxisStep290:
J	L_DualAxisStep71
NOP	
L_DualAxisStep37:
;Stepper.c,415 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _DualAxisStep
_XY_Interpolate:
;Stepper.c,419 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,420 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate292
NOP	
J	L__XY_Interpolate204
NOP	
L__XY_Interpolate292:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate293
NOP	
J	L__XY_Interpolate203
NOP	
L__XY_Interpolate293:
J	L_XY_Interpolate74
NOP	
L__XY_Interpolate204:
L__XY_Interpolate203:
;Stepper.c,421 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,422 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,423 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Stepper.c,424 :: 		}
L_XY_Interpolate74:
;Stepper.c,426 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XY_Interpolate294
NOP	
J	L_XY_Interpolate75
NOP	
L__XY_Interpolate294:
;Stepper.c,427 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,428 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate295
NOP	
J	L_XY_Interpolate76
NOP	
L__XY_Interpolate295:
;Stepper.c,429 :: 		SV.d2 += 2*SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,430 :: 		}else{
J	L_XY_Interpolate77
NOP	
L_XY_Interpolate76:
;Stepper.c,431 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,432 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,433 :: 		}
L_XY_Interpolate77:
;Stepper.c,434 :: 		}else{
J	L_XY_Interpolate78
NOP	
L_XY_Interpolate75:
;Stepper.c,435 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,436 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate296
NOP	
J	L_XY_Interpolate79
NOP	
L__XY_Interpolate296:
;Stepper.c,437 :: 		SV.d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,438 :: 		}else{
J	L_XY_Interpolate80
NOP	
L_XY_Interpolate79:
;Stepper.c,439 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,440 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,441 :: 		}
L_XY_Interpolate80:
;Stepper.c,442 :: 		}
L_XY_Interpolate78:
;Stepper.c,443 :: 		}
L_end_XY_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XY_Interpolate
_XZ_Interpolate:
;Stepper.c,445 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,447 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate298
NOP	
J	L__XZ_Interpolate207
NOP	
L__XZ_Interpolate298:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate299
NOP	
J	L__XZ_Interpolate206
NOP	
L__XZ_Interpolate299:
J	L_XZ_Interpolate83
NOP	
L__XZ_Interpolate207:
L__XZ_Interpolate206:
;Stepper.c,448 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,449 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,451 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Stepper.c,452 :: 		}
L_XZ_Interpolate83:
;Stepper.c,454 :: 		if(SV.dx > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XZ_Interpolate300
NOP	
J	L_XZ_Interpolate84
NOP	
L__XZ_Interpolate300:
;Stepper.c,455 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,456 :: 		if(d2 < 0)
LW	R2, Offset(Stepper_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate301
NOP	
J	L_XZ_Interpolate85
NOP	
L__XZ_Interpolate301:
;Stepper.c,457 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_XZ_Interpolate86
NOP	
L_XZ_Interpolate85:
;Stepper.c,459 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
;Stepper.c,460 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,461 :: 		}
L_XZ_Interpolate86:
;Stepper.c,463 :: 		}else{
J	L_XZ_Interpolate87
NOP	
L_XZ_Interpolate84:
;Stepper.c,464 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,465 :: 		if(d2 < 0)
LW	R2, Offset(Stepper_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate302
NOP	
J	L_XZ_Interpolate88
NOP	
L__XZ_Interpolate302:
;Stepper.c,466 :: 		d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_XZ_Interpolate89
NOP	
L_XZ_Interpolate88:
;Stepper.c,468 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
;Stepper.c,469 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,470 :: 		}
L_XZ_Interpolate89:
;Stepper.c,471 :: 		}
L_XZ_Interpolate87:
;Stepper.c,472 :: 		}
L_end_XZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XZ_Interpolate
_YZ_Interpolate:
;Stepper.c,474 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,475 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate304
NOP	
J	L__YZ_Interpolate210
NOP	
L__YZ_Interpolate304:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate305
NOP	
J	L__YZ_Interpolate209
NOP	
L__YZ_Interpolate305:
J	L_YZ_Interpolate92
NOP	
L__YZ_Interpolate210:
L__YZ_Interpolate209:
;Stepper.c,476 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,477 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,478 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Stepper.c,479 :: 		}
L_YZ_Interpolate92:
;Stepper.c,481 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__YZ_Interpolate306
NOP	
J	L_YZ_Interpolate93
NOP	
L__YZ_Interpolate306:
;Stepper.c,482 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,483 :: 		if(d2 < 0)
LW	R2, Offset(Stepper_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate307
NOP	
J	L_YZ_Interpolate94
NOP	
L__YZ_Interpolate307:
;Stepper.c,484 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_YZ_Interpolate95
NOP	
L_YZ_Interpolate94:
;Stepper.c,486 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
;Stepper.c,487 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,488 :: 		}
L_YZ_Interpolate95:
;Stepper.c,489 :: 		}else{
J	L_YZ_Interpolate96
NOP	
L_YZ_Interpolate93:
;Stepper.c,490 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,491 :: 		if(d2 < 0)
LW	R2, Offset(Stepper_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate308
NOP	
J	L_YZ_Interpolate97
NOP	
L__YZ_Interpolate308:
;Stepper.c,492 :: 		d2 += 2 * SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
J	L_YZ_Interpolate98
NOP	
L_YZ_Interpolate97:
;Stepper.c,494 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Stepper_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Stepper_d2+0)(GP)
;Stepper.c,495 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,496 :: 		}
L_YZ_Interpolate98:
;Stepper.c,497 :: 		}
L_YZ_Interpolate96:
;Stepper.c,499 :: 		}
L_end_YZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _YZ_Interpolate
_Step_Cycle:
;Stepper.c,507 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,508 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,509 :: 		Pulse(axis_No);
JAL	_Pulse+0
NOP	
;Stepper.c,510 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_toggleOCx:
;Stepper.c,514 :: 		void toggleOCx(int axis_No){
;Stepper.c,515 :: 		switch(axis_No){
J	L_toggleOCx99
NOP	
;Stepper.c,516 :: 		case X: OC5R   = 0x5;
L_toggleOCx101:
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,517 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,518 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,519 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,520 :: 		break;
J	L_toggleOCx100
NOP	
;Stepper.c,521 :: 		case Y: OC2R   = 0x5;
L_toggleOCx102:
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Stepper.c,522 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+76)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC2RS+0)(GP)
;Stepper.c,523 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,524 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC2CON+0)(GP)
;Stepper.c,525 :: 		break;
J	L_toggleOCx100
NOP	
;Stepper.c,526 :: 		case Z: OC7R   = 0x5;
L_toggleOCx103:
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Stepper.c,527 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+144)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC7RS+0)(GP)
;Stepper.c,528 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,529 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC7CON+0)(GP)
;Stepper.c,530 :: 		break;
J	L_toggleOCx100
NOP	
;Stepper.c,531 :: 		case A: OC3R   = 0x5;
L_toggleOCx104:
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,532 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+212)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,533 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR5+0)(GP)
;Stepper.c,534 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,535 :: 		break;
J	L_toggleOCx100
NOP	
;Stepper.c,536 :: 		case B: OC6R   = 0x5;
L_toggleOCx105:
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,537 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+280)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,538 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR3+0)(GP)
;Stepper.c,539 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,540 :: 		break;
J	L_toggleOCx100
NOP	
;Stepper.c,541 :: 		case C: OC8R   = 0x5;
L_toggleOCx106:
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,542 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+348)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,543 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR7+0)(GP)
;Stepper.c,544 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,545 :: 		break;
J	L_toggleOCx100
NOP	
;Stepper.c,546 :: 		default:
L_toggleOCx107:
;Stepper.c,547 :: 		break;
J	L_toggleOCx100
NOP	
;Stepper.c,548 :: 		}
L_toggleOCx99:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx312
NOP	
J	L_toggleOCx101
NOP	
L__toggleOCx312:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx314
NOP	
J	L_toggleOCx102
NOP	
L__toggleOCx314:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx316
NOP	
J	L_toggleOCx103
NOP	
L__toggleOCx316:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__toggleOCx318
NOP	
J	L_toggleOCx104
NOP	
L__toggleOCx318:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__toggleOCx320
NOP	
J	L_toggleOCx105
NOP	
L__toggleOCx320:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__toggleOCx322
NOP	
J	L_toggleOCx106
NOP	
L__toggleOCx322:
J	L_toggleOCx107
NOP	
L_toggleOCx100:
;Stepper.c,550 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,554 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,560 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse108
NOP	
;Stepper.c,561 :: 		case STOP:
L_Pulse110:
;Stepper.c,562 :: 		LED1 = 0;
SH	R0, Offset(LED1+0)(GP)
;Stepper.c,563 :: 		T8IE_bit         = 0;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Stepper.c,564 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,565 :: 		break;
J	L_Pulse109
NOP	
;Stepper.c,567 :: 		case ACCEL:
L_Pulse111:
;Stepper.c,572 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,573 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__Pulse324
NOP	
J	L_Pulse112
NOP	
L__Pulse324:
;Stepper.c,575 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,576 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,577 :: 		}
L_Pulse112:
;Stepper.c,578 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
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
BNE	R2, R0, L__Pulse325
NOP	
J	L_Pulse113
NOP	
L__Pulse325:
;Stepper.c,579 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,580 :: 		}
L_Pulse113:
;Stepper.c,581 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse326
NOP	
J	L_Pulse114
NOP	
L__Pulse326:
;Stepper.c,582 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,583 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,584 :: 		STPS[axis_No].run_state   = DECEL;
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
;Stepper.c,585 :: 		}
L_Pulse114:
;Stepper.c,586 :: 		break;
J	L_Pulse109
NOP	
;Stepper.c,588 :: 		case RUN:
L_Pulse115:
;Stepper.c,589 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,591 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse327
NOP	
J	L_Pulse116
NOP	
L__Pulse327:
;Stepper.c,592 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,593 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,595 :: 		STPS[axis_No].run_state   =  DECEL;
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
;Stepper.c,596 :: 		}
L_Pulse116:
;Stepper.c,597 :: 		break;
J	L_Pulse109
NOP	
;Stepper.c,599 :: 		case DECEL:
L_Pulse117:
;Stepper.c,604 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,608 :: 		if(STPS[axis_No].accel_count >= 0 ){
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
BEQ	R2, R0, L__Pulse328
NOP	
J	L_Pulse118
NOP	
L__Pulse328:
;Stepper.c,609 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,610 :: 		}
L_Pulse118:
;Stepper.c,611 :: 		break;
J	L_Pulse109
NOP	
;Stepper.c,612 :: 		default:break;
L_Pulse119:
J	L_Pulse109
NOP	
;Stepper.c,613 :: 		}
L_Pulse108:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse330
NOP	
J	L_Pulse110
NOP	
L__Pulse330:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse332
NOP	
J	L_Pulse111
NOP	
L__Pulse332:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse334
NOP	
J	L_Pulse115
NOP	
L__Pulse334:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse336
NOP	
J	L_Pulse117
NOP	
L__Pulse336:
J	L_Pulse119
NOP	
L_Pulse109:
;Stepper.c,614 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,615 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,619 :: 		void AccDec(int axis_No){
;Stepper.c,620 :: 		STPS[axis_No].accel_count++;
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
;Stepper.c,621 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
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
;Stepper.c,622 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
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
;Stepper.c,623 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
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
;Stepper.c,625 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_Axis_Enable:
;Stepper.c,630 :: 		void Axis_Enable(axis_combination axis){
;Stepper.c,631 :: 		switch(axis){
J	L_Axis_Enable120
NOP	
;Stepper.c,632 :: 		case xy:
L_Axis_Enable122:
;Stepper.c,633 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,634 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,635 :: 		break;
J	L_Axis_Enable121
NOP	
;Stepper.c,636 :: 		case xz:
L_Axis_Enable123:
;Stepper.c,637 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,638 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,639 :: 		break;
J	L_Axis_Enable121
NOP	
;Stepper.c,640 :: 		case yz:
L_Axis_Enable124:
;Stepper.c,641 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,642 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,643 :: 		break;
J	L_Axis_Enable121
NOP	
;Stepper.c,644 :: 		case xa:
L_Axis_Enable125:
;Stepper.c,645 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,646 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,647 :: 		break;
J	L_Axis_Enable121
NOP	
;Stepper.c,648 :: 		case ya:
L_Axis_Enable126:
;Stepper.c,649 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,650 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,651 :: 		break;
J	L_Axis_Enable121
NOP	
;Stepper.c,652 :: 		case za:
L_Axis_Enable127:
;Stepper.c,653 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,654 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,655 :: 		break;
J	L_Axis_Enable121
NOP	
;Stepper.c,656 :: 		default:
L_Axis_Enable128:
;Stepper.c,657 :: 		break;
J	L_Axis_Enable121
NOP	
;Stepper.c,658 :: 		}
L_Axis_Enable120:
ANDI	R2, R25, 255
BNE	R2, R0, L__Axis_Enable340
NOP	
J	L_Axis_Enable122
NOP	
L__Axis_Enable340:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Axis_Enable342
NOP	
J	L_Axis_Enable123
NOP	
L__Axis_Enable342:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Axis_Enable344
NOP	
J	L_Axis_Enable124
NOP	
L__Axis_Enable344:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Axis_Enable346
NOP	
J	L_Axis_Enable125
NOP	
L__Axis_Enable346:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Axis_Enable348
NOP	
J	L_Axis_Enable126
NOP	
L__Axis_Enable348:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Axis_Enable350
NOP	
J	L_Axis_Enable127
NOP	
L__Axis_Enable350:
J	L_Axis_Enable128
NOP	
L_Axis_Enable121:
;Stepper.c,659 :: 		}
L_end_Axis_Enable:
JR	RA
NOP	
; end of _Axis_Enable
_disableOCx:
;Stepper.c,661 :: 		void disableOCx(){
;Stepper.c,662 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,663 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+4)(GP)
;Stepper.c,664 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+4)(GP)
;Stepper.c,666 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,667 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
SW	R3, Offset(OC6CONbits+4)(GP)
;Stepper.c,668 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,669 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_StepX:
;Stepper.c,674 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,675 :: 		STPS[X].step_count++;
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,676 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,677 :: 		if(SV.Single_Dual == 0)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepX353
NOP	
J	L_StepX129
NOP	
L__StepX353:
;Stepper.c,678 :: 		SingleStepX();
JAL	_SingleStepX+0
NOP	
J	L_StepX130
NOP	
L_StepX129:
;Stepper.c,680 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepX130:
;Stepper.c,681 :: 		}
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
;Stepper.c,683 :: 		void SingleStepX(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,684 :: 		if(STPS[X].step_count >= STPS[X].dist){  //i think this is where the problem lies
SW	R25, 4(SP)
LW	R3, Offset(_STPS+36)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepX355
NOP	
J	L_SingleStepX131
NOP	
L__SingleStepX355:
;Stepper.c,685 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,686 :: 		}
J	L_SingleStepX132
NOP	
L_SingleStepX131:
;Stepper.c,688 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,689 :: 		}
L_SingleStepX132:
;Stepper.c,690 :: 		}
L_end_SingleStepX:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepX
_StopX:
;Stepper.c,693 :: 		void StopX(){
;Stepper.c,694 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,695 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,696 :: 		}
L_end_StopX:
JR	RA
NOP	
; end of _StopX
_StepY:
;Stepper.c,702 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,703 :: 		STPS[Y].step_count++;
LW	R2, Offset(_STPS+100)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+100)(GP)
;Stepper.c,704 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,705 :: 		if(SV.Single_Dual == 0)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepY358
NOP	
J	L_StepY133
NOP	
L__StepY358:
;Stepper.c,706 :: 		SingleStepY();
JAL	_SingleStepY+0
NOP	
J	L_StepY134
NOP	
L_StepY133:
;Stepper.c,708 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepY134:
;Stepper.c,709 :: 		}
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
;Stepper.c,711 :: 		void SingleStepY(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,712 :: 		if(STPS[Y].step_count >= STPS[Y].dist){  //i think this is where the problem lies
SW	R25, 4(SP)
LW	R3, Offset(_STPS+104)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepY360
NOP	
J	L_SingleStepY135
NOP	
L__SingleStepY360:
;Stepper.c,713 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,714 :: 		}
J	L_SingleStepY136
NOP	
L_SingleStepY135:
;Stepper.c,716 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,717 :: 		}
L_SingleStepY136:
;Stepper.c,718 :: 		}
L_end_SingleStepY:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepY
_StopY:
;Stepper.c,720 :: 		void StopY(){
;Stepper.c,721 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,722 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,723 :: 		}
L_end_StopY:
JR	RA
NOP	
; end of _StopY
_StepZ:
;Stepper.c,729 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,730 :: 		STPS[Z].step_count++;
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+168)(GP)
;Stepper.c,731 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,732 :: 		if(!SV.Single_Dual)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepZ363
NOP	
J	L_StepZ137
NOP	
L__StepZ363:
;Stepper.c,733 :: 		SingleStepZ();
JAL	_SingleStepZ+0
NOP	
J	L_StepZ138
NOP	
L_StepZ137:
;Stepper.c,735 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepZ138:
;Stepper.c,737 :: 		}
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
;Stepper.c,739 :: 		void SingleStepZ(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,740 :: 		if(STPS[Z].step_count >= STPS[Z].dist){
SW	R25, 4(SP)
LW	R3, Offset(_STPS+172)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepZ365
NOP	
J	L_SingleStepZ139
NOP	
L__SingleStepZ365:
;Stepper.c,741 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,742 :: 		}
J	L_SingleStepZ140
NOP	
L_SingleStepZ139:
;Stepper.c,744 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,745 :: 		}
L_SingleStepZ140:
;Stepper.c,746 :: 		}
L_end_SingleStepZ:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepZ
_StopZ:
;Stepper.c,748 :: 		void StopZ(){
;Stepper.c,749 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,750 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,751 :: 		}
L_end_StopZ:
JR	RA
NOP	
; end of _StopZ
_StepA:
;Stepper.c,756 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,757 :: 		STPS[A].step_count++;
LW	R2, Offset(_STPS+236)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+236)(GP)
;Stepper.c,758 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,759 :: 		if(!SV.Single_Dual)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepA368
NOP	
J	L_StepA141
NOP	
L__StepA368:
;Stepper.c,760 :: 		SingleStepA();
JAL	_SingleStepA+0
NOP	
J	L_StepA142
NOP	
L_StepA141:
;Stepper.c,762 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepA142:
;Stepper.c,764 :: 		}
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
;Stepper.c,766 :: 		void SingleStepA(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,767 :: 		if(STPS[A].step_count >= STPS[A].dist){
SW	R25, 4(SP)
LW	R3, Offset(_STPS+240)(GP)
LW	R2, Offset(_STPS+236)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepA370
NOP	
J	L_SingleStepA143
NOP	
L__SingleStepA370:
;Stepper.c,768 :: 		StopA();
JAL	_StopA+0
NOP	
;Stepper.c,769 :: 		}
J	L_SingleStepA144
NOP	
L_SingleStepA143:
;Stepper.c,771 :: 		Step_Cycle(A);
ORI	R25, R0, 3
JAL	_Step_Cycle+0
NOP	
;Stepper.c,772 :: 		}
L_SingleStepA144:
;Stepper.c,773 :: 		}
L_end_SingleStepA:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepA
_StopA:
;Stepper.c,775 :: 		void StopA(){
;Stepper.c,776 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,777 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,778 :: 		}
L_end_StopA:
JR	RA
NOP	
; end of _StopA
_min_:
;Stepper.c,789 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,790 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_373
NOP	
J	L_min_145
NOP	
L__min_373:
;Stepper.c,791 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,792 :: 		}
L_min_145:
;Stepper.c,794 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,796 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
Stepper_sqrt_:
;Stepper.c,806 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,812 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,813 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,814 :: 		do
J	L_Stepper_sqrt_147
NOP	
L_Stepper_sqrt_197:
;Stepper.c,828 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,814 :: 		do
L_Stepper_sqrt_147:
;Stepper.c,816 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_375
NOP	
J	L_Stepper_sqrt_150
NOP	
L_Stepper_sqrt_375:
;Stepper.c,818 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,819 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,820 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_151
NOP	
L_Stepper_sqrt_150:
;Stepper.c,822 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,823 :: 		}
L_Stepper_sqrt_151:
;Stepper.c,824 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,825 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_377
NOP	
J	L_Stepper_sqrt_198
NOP	
L_Stepper_sqrt_377:
; f end address is: 16 (R4)
;Stepper.c,826 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,827 :: 		}
J	L_Stepper_sqrt_152
NOP	
L_Stepper_sqrt_198:
;Stepper.c,825 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,827 :: 		}
L_Stepper_sqrt_152:
;Stepper.c,828 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_378
NOP	
J	L_Stepper_sqrt_197
NOP	
L_Stepper_sqrt_378:
; q2 end address is: 12 (R3)
;Stepper.c,829 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_379
NOP	
J	L_Stepper_sqrt_153
NOP	
L_Stepper_sqrt_379:
;Stepper.c,830 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,831 :: 		}
L_Stepper_sqrt_153:
;Stepper.c,833 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,835 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_CalcRadius:
;Stepper.c,838 :: 		void CalcRadius(Circle* cir){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,841 :: 		cir->xRad = fabs(cir->xStart + cir->I);
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
;Stepper.c,842 :: 		cir->yRad = fabs(cir->yStart + cir->J);
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
;Stepper.c,843 :: 		cir->radius = sqrt((cir->xRad*cir->xRad) + (cir->yRad*cir->yRad));
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
;Stepper.c,844 :: 		angA = atan2(cir->yRad,cir->xRad);
ADDIU	R2, R25, 48
LWC1	S1, 0(R2)
ADDIU	R2, R25, 52
LWC1	S0, 0(R2)
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
;Stepper.c,847 :: 		cir->degreeDeg = angA * rad2deg;
ADDIU	R3, R25, 4
LUI	R2, 16997
ORI	R2, R2, 12013
MTC1	R2, S1
MUL.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Stepper.c,849 :: 		cir->quadrant_start = QuadrantStart(cir->I,cir->J);
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
;Stepper.c,851 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius382
NOP	
J	L__CalcRadius226
NOP	
L__CalcRadius382:
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius384
NOP	
J	L__CalcRadius225
NOP	
L__CalcRadius384:
J	L_CalcRadius157
NOP	
L__CalcRadius226:
L__CalcRadius225:
;Stepper.c,852 :: 		angB = cir->deg - cir->degreeDeg;
LWC1	S1, 0(R25)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius157:
;Stepper.c,853 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius386
NOP	
J	L__CalcRadius228
NOP	
L__CalcRadius386:
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius388
NOP	
J	L__CalcRadius227
NOP	
L__CalcRadius388:
J	L_CalcRadius160
NOP	
L__CalcRadius228:
L__CalcRadius227:
;Stepper.c,854 :: 		angB = cir->deg + cir->degreeDeg;
LWC1	S1, 0(R25)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius160:
;Stepper.c,856 :: 		cir->degreeRadians = angB * deg2rad;
ADDIU	R3, R25, 8
LWC1	S1, 8(SP)
LUI	R2, 15502
ORI	R2, R2, 64046
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, 0(R3)
;Stepper.c,857 :: 		}
L_end_CalcRadius:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _CalcRadius
_QuadrantStart:
;Stepper.c,859 :: 		int QuadrantStart(float i,float j){
;Stepper.c,860 :: 		if((i <= 0)&&(j >= 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__QuadrantStart390
NOP	
J	L__QuadrantStart216
NOP	
L__QuadrantStart390:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S13, S0
BC1F	0, L__QuadrantStart391
NOP	
J	L__QuadrantStart215
NOP	
L__QuadrantStart391:
L__QuadrantStart214:
;Stepper.c,861 :: 		return 1;
ORI	R2, R0, 1
J	L_end_QuadrantStart
NOP	
;Stepper.c,860 :: 		if((i <= 0)&&(j >= 0))
L__QuadrantStart216:
L__QuadrantStart215:
;Stepper.c,862 :: 		else if((i > 0)&&(j > 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart392
NOP	
J	L__QuadrantStart218
NOP	
L__QuadrantStart392:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S13, S0
BC1F	0, L__QuadrantStart393
NOP	
J	L__QuadrantStart217
NOP	
L__QuadrantStart393:
L__QuadrantStart213:
;Stepper.c,863 :: 		return 2;
ORI	R2, R0, 2
J	L_end_QuadrantStart
NOP	
;Stepper.c,862 :: 		else if((i > 0)&&(j > 0))
L__QuadrantStart218:
L__QuadrantStart217:
;Stepper.c,864 :: 		else if((i > 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart394
NOP	
J	L__QuadrantStart220
NOP	
L__QuadrantStart394:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart395
NOP	
J	L__QuadrantStart219
NOP	
L__QuadrantStart395:
L__QuadrantStart212:
;Stepper.c,865 :: 		return 3;
ORI	R2, R0, 3
J	L_end_QuadrantStart
NOP	
;Stepper.c,864 :: 		else if((i > 0)&&(j < 0))
L__QuadrantStart220:
L__QuadrantStart219:
;Stepper.c,866 :: 		else if((i < 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__QuadrantStart396
NOP	
J	L__QuadrantStart222
NOP	
L__QuadrantStart396:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart397
NOP	
J	L__QuadrantStart221
NOP	
L__QuadrantStart397:
L__QuadrantStart211:
;Stepper.c,867 :: 		return 4;
ORI	R2, R0, 4
J	L_end_QuadrantStart
NOP	
;Stepper.c,866 :: 		else if((i < 0)&&(j < 0))
L__QuadrantStart222:
L__QuadrantStart221:
;Stepper.c,869 :: 		return 0;
MOVZ	R2, R0, R0
;Stepper.c,870 :: 		}
L_end_QuadrantStart:
JR	RA
NOP	
; end of _QuadrantStart
_CircDir:
;Stepper.c,872 :: 		void CircDir(Circle* cir){
;Stepper.c,874 :: 		if(cir->dir == CW){
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__CircDir399
NOP	
J	L_CircDir177
NOP	
L__CircDir399:
;Stepper.c,875 :: 		newDeg = 360 / cir->deg;
LWC1	S1, 0(R25)
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S2, S0, S1
; newDeg start address is: 24 (R6)
MOV.S 	S3, S2
;Stepper.c,876 :: 		cir->N = (2*Pi*cir->radius)/newDeg;
ADDIU	R3, R25, 36
ADDIU	R2, R25, 40
LWC1	S1, 0(R2)
LUI	R2, 16585
ORI	R2, R2, 4048
MTC1	R2, S0
MUL.S 	S0, S0, S1
DIV.S 	S0, S0, S2
SWC1	S0, 0(R3)
;Stepper.c,877 :: 		cir->divisor = cir->deg / newDeg;
ADDIU	R2, R25, 20
LWC1	S0, 0(R25)
DIV.S 	S0, S0, S3
; newDeg end address is: 24 (R6)
SWC1	S0, 0(R2)
;Stepper.c,878 :: 		}
L_CircDir177:
;Stepper.c,880 :: 		if(cir->dir == CW)
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__CircDir400
NOP	
J	L_CircDir178
NOP	
L__CircDir400:
;Stepper.c,881 :: 		cir->deg = 0.00;
SW	R0, 0(R25)
L_CircDir178:
;Stepper.c,882 :: 		if(cir->dir == CCW)
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__CircDir401
NOP	
J	L_CircDir179
NOP	
L__CircDir401:
;Stepper.c,883 :: 		cir->deg = 360.00;
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
SWC1	S0, 0(R25)
L_CircDir179:
;Stepper.c,884 :: 		}
L_end_CircDir:
JR	RA
NOP	
; end of _CircDir
_Cir_Interpolation:
;Stepper.c,886 :: 		void Cir_Interpolation(float xPresent,float yPresent,Circle* cir){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,888 :: 		cir->xStart = xPresent;
ADDIU	R2, R25, 56
SWC1	S12, 0(R2)
;Stepper.c,889 :: 		cir->yStart = yPresent;
ADDIU	R2, R25, 60
SWC1	S13, 0(R2)
;Stepper.c,890 :: 		CalcRadius(cir);
JAL	_CalcRadius+0
NOP	
;Stepper.c,893 :: 		while(quad){
LH	R2, Offset(Cir_Interpolation_quad_L0+0)(GP)
BNE	R2, R0, L__Cir_Interpolation404
NOP	
J	L_Cir_Interpolation181
NOP	
L__Cir_Interpolation404:
;Stepper.c,904 :: 		}
L_Cir_Interpolation181:
;Stepper.c,905 :: 		}
L_end_Cir_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Cir_Interpolation
_CycleStop:
;Stepper.c,929 :: 		void CycleStop(){
;Stepper.c,931 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,932 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop188:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStop406
NOP	
J	L_CycleStop189
NOP	
L__CycleStop406:
;Stepper.c,933 :: 		STPS[ii].microSec = 0;
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,934 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStop407
NOP	
J	L_CycleStop191
NOP	
L__CycleStop407:
; ii end address is: 16 (R4)
J	L_CycleStop189
NOP	
L_CycleStop191:
;Stepper.c,932 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,935 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop188
NOP	
L_CycleStop189:
;Stepper.c,936 :: 		}
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
;Stepper.c,938 :: 		void CycleStart(){
;Stepper.c,941 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__CycleStart409
NOP	
J	L_CycleStart192
NOP	
L__CycleStart409:
;Stepper.c,942 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart193:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStart410
NOP	
J	L_CycleStart194
NOP	
L__CycleStart410:
;Stepper.c,943 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStart411
NOP	
J	L_CycleStart196
NOP	
L__CycleStart411:
; ii end address is: 16 (R4)
J	L_CycleStart194
NOP	
L_CycleStart196:
;Stepper.c,944 :: 		STPS[ii].microSec++;
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
;Stepper.c,942 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,945 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart193
NOP	
L_CycleStart194:
;Stepper.c,946 :: 		}
L_CycleStart192:
;Stepper.c,947 :: 		}
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
