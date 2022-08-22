_SetPinMode:
;Stepper.c,75 :: 		void SetPinMode(){
;Stepper.c,78 :: 		EN_Step_PinDirX  = 0; //output
LUI	R2, BitMask(TRISB15_bit+0)
ORI	R2, R2, BitMask(TRISB15_bit+0)
_SX	
;Stepper.c,82 :: 		DIR_Step_PinDirX = 0;
LUI	R2, BitMask(TRISB1_bit+0)
ORI	R2, R2, BitMask(TRISB1_bit+0)
_SX	
;Stepper.c,85 :: 		EN_Step_PinDirY  = 0; //output
LUI	R2, BitMask(TRISE1_bit+0)
ORI	R2, R2, BitMask(TRISE1_bit+0)
_SX	
;Stepper.c,89 :: 		DIR_Step_PinDirY = 0;
LUI	R2, BitMask(TRISE0_bit+0)
ORI	R2, R2, BitMask(TRISE0_bit+0)
_SX	
;Stepper.c,92 :: 		EN_Step_PinDirZ  = 0; //output
LUI	R2, BitMask(TRISA7_bit+0)
ORI	R2, R2, BitMask(TRISA7_bit+0)
_SX	
;Stepper.c,96 :: 		DIR_Step_PinDirZ = 0;
LUI	R2, BitMask(TRISA6_bit+0)
ORI	R2, R2, BitMask(TRISA6_bit+0)
_SX	
;Stepper.c,99 :: 		EN_Step_PinDirA  = 0; //output
LUI	R2, BitMask(TRISD13_bit+0)
ORI	R2, R2, BitMask(TRISD13_bit+0)
_SX	
;Stepper.c,103 :: 		DIR_Step_PinDirA = 0;
LUI	R2, BitMask(TRISD0_bit+0)
ORI	R2, R2, BitMask(TRISD0_bit+0)
_SX	
;Stepper.c,104 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_StepperConstants:
;Stepper.c,108 :: 		void StepperConstants(long accel,long decel){
;Stepper.c,109 :: 		SV.acc = accel;
SW	R25, Offset(_SV+56)(GP)
;Stepper.c,110 :: 		SV.dec = decel;
SW	R26, Offset(_SV+60)(GP)
;Stepper.c,111 :: 		}
L_end_StepperConstants:
JR	RA
NOP	
; end of _StepperConstants
_EnStepperX:
;Stepper.c,115 :: 		void EnStepperX(){
;Stepper.c,118 :: 		EN_StepX       = 0;
LUI	R2, BitMask(LATB15_bit+0)
ORI	R2, R2, BitMask(LATB15_bit+0)
_SX	
;Stepper.c,119 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,121 :: 		void EnStepperY(){
;Stepper.c,124 :: 		EN_StepY       = 0;
LUI	R2, BitMask(LATE1_bit+0)
ORI	R2, R2, BitMask(LATE1_bit+0)
_SX	
;Stepper.c,125 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,126 :: 		void EnStepperZ(){
;Stepper.c,129 :: 		EN_StepZ       = 0;
LUI	R2, BitMask(LATA7_bit+0)
ORI	R2, R2, BitMask(LATA7_bit+0)
_SX	
;Stepper.c,130 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_EnStepperA:
;Stepper.c,131 :: 		void EnStepperA(){
;Stepper.c,134 :: 		EN_StepA       = 0;
LUI	R2, BitMask(LATD13_bit+0)
ORI	R2, R2, BitMask(LATD13_bit+0)
_SX	
;Stepper.c,135 :: 		}
L_end_EnStepperA:
JR	RA
NOP	
; end of _EnStepperA
_DisableStepper:
;Stepper.c,137 :: 		void DisableStepper(){
;Stepper.c,138 :: 		EN_StepX      = 1;
LUI	R2, BitMask(LATB15_bit+0)
ORI	R2, R2, BitMask(LATB15_bit+0)
_SX	
;Stepper.c,139 :: 		EN_StepY      = 1;
LUI	R2, BitMask(LATE1_bit+0)
ORI	R2, R2, BitMask(LATE1_bit+0)
_SX	
;Stepper.c,140 :: 		EN_StepZ      = 1;
LUI	R2, BitMask(LATA7_bit+0)
ORI	R2, R2, BitMask(LATA7_bit+0)
_SX	
;Stepper.c,141 :: 		EN_StepA      = 1;
LUI	R2, BitMask(LATD13_bit+0)
ORI	R2, R2, BitMask(LATD13_bit+0)
_SX	
;Stepper.c,142 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_speed_cntr_Move:
;Stepper.c,160 :: 		void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,163 :: 		if(mmSteps == 1){
SW	R25, 4(SP)
ORI	R2, R0, 1
BEQ	R25, R2, L__speed_cntr_Move107
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move107:
;Stepper.c,165 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
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
;Stepper.c,166 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
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
;Stepper.c,167 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
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
;Stepper.c,168 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,170 :: 		}
J	L_speed_cntr_Move1
NOP	
L_speed_cntr_Move0:
;Stepper.c,172 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
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
;Stepper.c,176 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
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
;Stepper.c,181 :: 		STPS[axis_No].step_delay = abs((T1_FREQ_148 * sqrt_(A_SQ / SV.acc))/100);
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
;Stepper.c,182 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
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
;Stepper.c,187 :: 		STPS[axis_No].max_step_lim = (speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
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
;Stepper.c,192 :: 		if(STPS[axis_No].max_step_lim == 0){
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
;Stepper.c,193 :: 		STPS[axis_No].max_step_lim = 1;
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
;Stepper.c,194 :: 		}
L_speed_cntr_Move5:
;Stepper.c,198 :: 		STPS[axis_No].accel_lim = (abs(mmSteps) * SV.dec) / (SV.acc + SV.dec);
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
;Stepper.c,201 :: 		if(STPS[axis_No].accel_lim == 0){
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
;Stepper.c,202 :: 		STPS[axis_No].accel_lim = 1;
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
;Stepper.c,203 :: 		}
L_speed_cntr_Move6:
;Stepper.c,206 :: 		if(STPS[axis_No].accel_lim <= STPS[axis_No].max_step_lim){
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
;Stepper.c,207 :: 		if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
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
;Stepper.c,208 :: 		else STPS[axis_No].decel_val = mmSteps + STPS[axis_No].accel_lim;
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
;Stepper.c,209 :: 		}else{
J	L_speed_cntr_Move10
NOP	
L_speed_cntr_Move7:
;Stepper.c,210 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * SV.acc) / SV.dec);
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
;Stepper.c,211 :: 		}
L_speed_cntr_Move10:
;Stepper.c,213 :: 		if(mmSteps >= 0){
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move116
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move116:
;Stepper.c,214 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
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
;Stepper.c,215 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
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
;Stepper.c,216 :: 		}
J	L_speed_cntr_Move14
NOP	
L_speed_cntr_Move11:
;Stepper.c,218 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = abs(mmSteps) * STPS[axis_No].decel_val;
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
;Stepper.c,219 :: 		else  STPS[axis_No].decel_start =  STPS[axis_No].accel_lim;
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
;Stepper.c,220 :: 		}
L_speed_cntr_Move14:
;Stepper.c,222 :: 		if(STPS[axis_No].decel_val == 0){
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
;Stepper.c,223 :: 		STPS[axis_No].decel_val = -1;
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
;Stepper.c,224 :: 		}
L_speed_cntr_Move17:
;Stepper.c,227 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
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
;Stepper.c,228 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,229 :: 		STPS[axis_No].run_state = RUN;
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
;Stepper.c,230 :: 		}else{
J	L_speed_cntr_Move19
NOP	
L_speed_cntr_Move18:
;Stepper.c,231 :: 		STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
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
;Stepper.c,232 :: 		STPS[axis_No].run_state = ACCEL;
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
;Stepper.c,233 :: 		}
L_speed_cntr_Move19:
;Stepper.c,172 :: 		else if((mmSteps != 0)&&(abs(mmSteps) != 1)){
L__speed_cntr_Move98:
L__speed_cntr_Move97:
;Stepper.c,235 :: 		}
L_speed_cntr_Move1:
;Stepper.c,236 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,237 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,238 :: 		STPS[axis_No].microSec    = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,239 :: 		STPS[axis_No].accel_count = 1;
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
;Stepper.c,240 :: 		STPS[axis_No].dist        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R0, 0(R2)
;Stepper.c,241 :: 		SV.Tog   = 0;
SH	R0, Offset(_SV+2)(GP)
;Stepper.c,242 :: 		SV.running = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_SV+0)(GP)
;Stepper.c,243 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_Step_Cycle:
;Stepper.c,252 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,253 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,254 :: 		Pulse(axis_No);
JAL	_Pulse+0
NOP	
;Stepper.c,255 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_toggleOCx:
;Stepper.c,259 :: 		void toggleOCx(int axis_No){
;Stepper.c,260 :: 		switch(axis_No){
J	L_toggleOCx20
NOP	
;Stepper.c,261 :: 		case X: OC5R   = 0x5;
L_toggleOCx22:
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,262 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,263 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,264 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,265 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,266 :: 		case Y: OC2R   = 0x5;
L_toggleOCx23:
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Stepper.c,267 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+76)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC2RS+0)(GP)
;Stepper.c,268 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,269 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC2CON+0)(GP)
;Stepper.c,270 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,271 :: 		case Z: OC7R   = 0x5;
L_toggleOCx24:
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Stepper.c,272 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+144)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC7RS+0)(GP)
;Stepper.c,273 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,274 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC7CON+0)(GP)
;Stepper.c,275 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,276 :: 		case A: OC3R   = 0x5;
L_toggleOCx25:
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,277 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+212)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,278 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR5+0)(GP)
;Stepper.c,279 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,280 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,281 :: 		case B: OC6R   = 0x5;
L_toggleOCx26:
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,282 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+280)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,283 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR3+0)(GP)
;Stepper.c,284 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,285 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,286 :: 		case C: OC8R   = 0x5;
L_toggleOCx27:
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,287 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+348)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,288 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR7+0)(GP)
;Stepper.c,289 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,290 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,291 :: 		default:
L_toggleOCx28:
;Stepper.c,292 :: 		break;
J	L_toggleOCx21
NOP	
;Stepper.c,293 :: 		}
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
;Stepper.c,295 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,299 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,305 :: 		switch(STPS[axis_No].run_state) {
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
;Stepper.c,306 :: 		case STOP:
L_Pulse31:
;Stepper.c,307 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,308 :: 		break;
J	L_Pulse30
NOP	
;Stepper.c,310 :: 		case ACCEL:
L_Pulse32:
;Stepper.c,315 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,316 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
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
;Stepper.c,318 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,319 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,320 :: 		}
L_Pulse33:
;Stepper.c,321 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
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
;Stepper.c,322 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,323 :: 		}
L_Pulse34:
;Stepper.c,324 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
;Stepper.c,325 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,326 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,327 :: 		STPS[axis_No].run_state   = DECEL;
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
;Stepper.c,328 :: 		}
L_Pulse35:
;Stepper.c,329 :: 		break;
J	L_Pulse30
NOP	
;Stepper.c,331 :: 		case RUN:
L_Pulse36:
;Stepper.c,332 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,334 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
;Stepper.c,335 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
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
;Stepper.c,336 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,338 :: 		STPS[axis_No].run_state   =  DECEL;
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
;Stepper.c,339 :: 		}
L_Pulse37:
;Stepper.c,340 :: 		break;
J	L_Pulse30
NOP	
;Stepper.c,342 :: 		case DECEL:
L_Pulse38:
;Stepper.c,347 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,351 :: 		if(STPS[axis_No].accel_count >= 0 ){
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
;Stepper.c,352 :: 		STPS[axis_No].run_state = STOP;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,353 :: 		}
L_Pulse39:
;Stepper.c,354 :: 		break;
J	L_Pulse30
NOP	
;Stepper.c,355 :: 		default:break;
L_Pulse40:
J	L_Pulse30
NOP	
;Stepper.c,356 :: 		}
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
;Stepper.c,357 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,358 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,362 :: 		void AccDec(int axis_No){
;Stepper.c,363 :: 		STPS[axis_No].accel_count++;
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
;Stepper.c,364 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
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
;Stepper.c,365 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
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
;Stepper.c,366 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
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
;Stepper.c,368 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_Single_Axis_Enable:
;Stepper.c,373 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,374 :: 		switch(axis_){
J	L_Single_Axis_Enable41
NOP	
;Stepper.c,375 :: 		case X:
L_Single_Axis_Enable43:
;Stepper.c,376 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,377 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,378 :: 		case Y:
L_Single_Axis_Enable44:
;Stepper.c,379 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+8)(GP)
;Stepper.c,380 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,381 :: 		case Z:
L_Single_Axis_Enable45:
;Stepper.c,382 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+8)(GP)
;Stepper.c,383 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,384 :: 		case A:
L_Single_Axis_Enable46:
;Stepper.c,385 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,386 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,387 :: 		case B:
L_Single_Axis_Enable47:
;Stepper.c,388 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC6CONbits+8)(GP)
;Stepper.c,389 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,390 :: 		case C:
L_Single_Axis_Enable48:
;Stepper.c,391 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,392 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,393 :: 		default:
L_Single_Axis_Enable49:
;Stepper.c,394 :: 		break;
J	L_Single_Axis_Enable42
NOP	
;Stepper.c,395 :: 		}
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
;Stepper.c,396 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_Multi_Axis_Enable:
;Stepper.c,401 :: 		void Multi_Axis_Enable(axis_combination axis){
;Stepper.c,402 :: 		switch(axis){
J	L_Multi_Axis_Enable50
NOP	
;Stepper.c,403 :: 		case xy:
L_Multi_Axis_Enable52:
;Stepper.c,404 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,405 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,406 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,407 :: 		case xz:
L_Multi_Axis_Enable53:
;Stepper.c,408 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,409 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,410 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,411 :: 		case yz:
L_Multi_Axis_Enable54:
;Stepper.c,412 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,413 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,414 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,415 :: 		case xa:
L_Multi_Axis_Enable55:
;Stepper.c,416 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,417 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,418 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,419 :: 		case ya:
L_Multi_Axis_Enable56:
;Stepper.c,420 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,421 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,422 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,423 :: 		case za:
L_Multi_Axis_Enable57:
;Stepper.c,424 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,425 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,426 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,427 :: 		default:
L_Multi_Axis_Enable58:
;Stepper.c,428 :: 		break;
J	L_Multi_Axis_Enable51
NOP	
;Stepper.c,429 :: 		}
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
;Stepper.c,430 :: 		}
L_end_Multi_Axis_Enable:
JR	RA
NOP	
; end of _Multi_Axis_Enable
_disableOCx:
;Stepper.c,432 :: 		void disableOCx(){
;Stepper.c,433 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,434 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+4)(GP)
;Stepper.c,435 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+4)(GP)
;Stepper.c,437 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,438 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
SW	R3, Offset(OC6CONbits+4)(GP)
;Stepper.c,439 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,440 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_StepX:
;Stepper.c,445 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,446 :: 		STPS[X].step_count++;
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,447 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,448 :: 		if(SV.Single_Dual == 0)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepX178
NOP	
J	L_StepX59
NOP	
L__StepX178:
;Stepper.c,449 :: 		SingleStepX();
JAL	_SingleStepX+0
NOP	
J	L_StepX60
NOP	
L_StepX59:
;Stepper.c,451 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepX60:
;Stepper.c,452 :: 		}
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
;Stepper.c,454 :: 		void SingleStepX(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,455 :: 		if(STPS[X].step_count >= STPS[X].dist){  //i think this is where the problem lies
SW	R25, 4(SP)
LW	R3, Offset(_STPS+36)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepX180
NOP	
J	L_SingleStepX61
NOP	
L__SingleStepX180:
;Stepper.c,456 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,457 :: 		}
J	L_SingleStepX62
NOP	
L_SingleStepX61:
;Stepper.c,459 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,460 :: 		}
L_SingleStepX62:
;Stepper.c,461 :: 		}
L_end_SingleStepX:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepX
_StopX:
;Stepper.c,464 :: 		void StopX(){
;Stepper.c,465 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,466 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,467 :: 		}
L_end_StopX:
JR	RA
NOP	
; end of _StopX
_StepY:
;Stepper.c,473 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,474 :: 		STPS[Y].step_count++;
LW	R2, Offset(_STPS+100)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+100)(GP)
;Stepper.c,475 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,476 :: 		if(SV.Single_Dual == 0)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepY183
NOP	
J	L_StepY63
NOP	
L__StepY183:
;Stepper.c,477 :: 		SingleStepY();
JAL	_SingleStepY+0
NOP	
J	L_StepY64
NOP	
L_StepY63:
;Stepper.c,479 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepY64:
;Stepper.c,480 :: 		}
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
;Stepper.c,482 :: 		void SingleStepY(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,483 :: 		if(STPS[Y].step_count >= STPS[Y].dist){  //i think this is where the problem lies
SW	R25, 4(SP)
LW	R3, Offset(_STPS+104)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepY185
NOP	
J	L_SingleStepY65
NOP	
L__SingleStepY185:
;Stepper.c,484 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,485 :: 		}
J	L_SingleStepY66
NOP	
L_SingleStepY65:
;Stepper.c,487 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,488 :: 		}
L_SingleStepY66:
;Stepper.c,489 :: 		}
L_end_SingleStepY:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepY
_StopY:
;Stepper.c,491 :: 		void StopY(){
;Stepper.c,492 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,493 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,494 :: 		}
L_end_StopY:
JR	RA
NOP	
; end of _StopY
_StepZ:
;Stepper.c,500 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,501 :: 		STPS[Z].step_count++;
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+168)(GP)
;Stepper.c,502 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,503 :: 		if(!SV.Single_Dual)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepZ188
NOP	
J	L_StepZ67
NOP	
L__StepZ188:
;Stepper.c,504 :: 		SingleStepZ();
JAL	_SingleStepZ+0
NOP	
J	L_StepZ68
NOP	
L_StepZ67:
;Stepper.c,506 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepZ68:
;Stepper.c,508 :: 		}
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
;Stepper.c,510 :: 		void SingleStepZ(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,511 :: 		if(STPS[Z].step_count >= STPS[Z].dist){
SW	R25, 4(SP)
LW	R3, Offset(_STPS+172)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepZ190
NOP	
J	L_SingleStepZ69
NOP	
L__SingleStepZ190:
;Stepper.c,512 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,513 :: 		}
J	L_SingleStepZ70
NOP	
L_SingleStepZ69:
;Stepper.c,515 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,516 :: 		}
L_SingleStepZ70:
;Stepper.c,517 :: 		}
L_end_SingleStepZ:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepZ
_StopZ:
;Stepper.c,519 :: 		void StopZ(){
;Stepper.c,520 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,521 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,522 :: 		}
L_end_StopZ:
JR	RA
NOP	
; end of _StopZ
_StepA:
;Stepper.c,527 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {
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
;Stepper.c,528 :: 		STPS[A].step_count++;
LW	R2, Offset(_STPS+236)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+236)(GP)
;Stepper.c,529 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,530 :: 		if(!SV.Single_Dual)
LBU	R2, Offset(_SV+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__StepA193
NOP	
J	L_StepA71
NOP	
L__StepA193:
;Stepper.c,531 :: 		SingleStepA();
JAL	_SingleStepA+0
NOP	
J	L_StepA72
NOP	
L_StepA71:
;Stepper.c,533 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
L_StepA72:
;Stepper.c,535 :: 		}
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
;Stepper.c,537 :: 		void SingleStepA(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,538 :: 		if(STPS[A].step_count >= STPS[A].dist){
SW	R25, 4(SP)
LW	R3, Offset(_STPS+240)(GP)
LW	R2, Offset(_STPS+236)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__SingleStepA195
NOP	
J	L_SingleStepA73
NOP	
L__SingleStepA195:
;Stepper.c,539 :: 		StopA();
JAL	_StopA+0
NOP	
;Stepper.c,540 :: 		}
J	L_SingleStepA74
NOP	
L_SingleStepA73:
;Stepper.c,542 :: 		Step_Cycle(A);
ORI	R25, R0, 3
JAL	_Step_Cycle+0
NOP	
;Stepper.c,543 :: 		}
L_SingleStepA74:
;Stepper.c,544 :: 		}
L_end_SingleStepA:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepA
_StopA:
;Stepper.c,546 :: 		void StopA(){
;Stepper.c,547 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,548 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,549 :: 		}
L_end_StopA:
JR	RA
NOP	
; end of _StopA
_min_:
;Stepper.c,560 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,561 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_198
NOP	
J	L_min_75
NOP	
L__min_198:
;Stepper.c,562 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,563 :: 		}
L_min_75:
;Stepper.c,565 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,567 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
Stepper_sqrt_:
;Stepper.c,577 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,583 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,584 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,585 :: 		do
J	L_Stepper_sqrt_77
NOP	
L_Stepper_sqrt_94:
;Stepper.c,599 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,585 :: 		do
L_Stepper_sqrt_77:
;Stepper.c,587 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_200
NOP	
J	L_Stepper_sqrt_80
NOP	
L_Stepper_sqrt_200:
;Stepper.c,589 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,590 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,591 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_81
NOP	
L_Stepper_sqrt_80:
;Stepper.c,593 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,594 :: 		}
L_Stepper_sqrt_81:
;Stepper.c,595 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,596 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_202
NOP	
J	L_Stepper_sqrt_95
NOP	
L_Stepper_sqrt_202:
; f end address is: 16 (R4)
;Stepper.c,597 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,598 :: 		}
J	L_Stepper_sqrt_82
NOP	
L_Stepper_sqrt_95:
;Stepper.c,596 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,598 :: 		}
L_Stepper_sqrt_82:
;Stepper.c,599 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_203
NOP	
J	L_Stepper_sqrt_94
NOP	
L_Stepper_sqrt_203:
; q2 end address is: 12 (R3)
;Stepper.c,600 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_204
NOP	
J	L_Stepper_sqrt_83
NOP	
L_Stepper_sqrt_204:
;Stepper.c,601 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,602 :: 		}
L_Stepper_sqrt_83:
;Stepper.c,604 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,606 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_CycleStop:
;Stepper.c,631 :: 		void CycleStop(){
;Stepper.c,633 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,634 :: 		for(ii = 0;ii<NoOfAxis;ii++){
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
;Stepper.c,635 :: 		STPS[ii].microSec = 0;
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,636 :: 		if(ii > NoOfAxis)break;
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
;Stepper.c,634 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,637 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop85
NOP	
L_CycleStop86:
;Stepper.c,638 :: 		}
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
;Stepper.c,640 :: 		void CycleStart(){
;Stepper.c,643 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__CycleStart209
NOP	
J	L_CycleStart89
NOP	
L__CycleStart209:
;Stepper.c,644 :: 		for(ii = 0; ii < NoOfAxis;ii++){
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
;Stepper.c,645 :: 		if(ii > NoOfAxis)break;
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
;Stepper.c,646 :: 		STPS[ii].microSec++;
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
;Stepper.c,644 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,647 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart90
NOP	
L_CycleStart91:
;Stepper.c,648 :: 		}
L_CycleStart89:
;Stepper.c,649 :: 		}
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
