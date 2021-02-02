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
SW	R25, Offset(_SV+40)(GP)
;Stepper.c,84 :: 		SV.dec = decel;
SW	R26, Offset(_SV+44)(GP)
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
; end of _EnStepperX
_EnStepperY:
;Stepper.c,95 :: 		void EnStepperY(){
;Stepper.c,98 :: 		EN_StepY       = 0;
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
BEQ	R25, R2, L__speed_cntr_Move157
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move157:
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
BNE	R25, R0, L__speed_cntr_Move159
NOP	
J	L__speed_cntr_Move149
NOP	
L__speed_cntr_Move159:
JAL	_abs+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__speed_cntr_Move161
NOP	
J	L__speed_cntr_Move148
NOP	
L__speed_cntr_Move161:
L__speed_cntr_Move147:
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
LW	R3, Offset(_SV+40)(GP)
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
LWC1	S0, Offset(_SV+40)(GP)
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
BEQ	R2, R0, L__speed_cntr_Move162
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move162:
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
LW	R3, Offset(_SV+44)(GP)
SEH	R2, R2
MUL	R4, R2, R3
LW	R3, Offset(_SV+44)(GP)
LW	R2, Offset(_SV+40)(GP)
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
BEQ	R2, R0, L__speed_cntr_Move163
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move163:
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
BEQ	R2, R0, L__speed_cntr_Move164
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move164:
;Stepper.c,175 :: 		if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move165
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move165:
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
LW	R2, Offset(_SV+40)(GP)
MUL	R3, R3, R2
LW	R2, Offset(_SV+44)(GP)
DIV	R3, R2
MFLO	R3
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R4)
;Stepper.c,179 :: 		}
L_speed_cntr_Move10:
;Stepper.c,181 :: 		if(mmSteps >= 0){
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move166
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move166:
;Stepper.c,182 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SLT	R2, R2, R25
BNE	R2, R0, L__speed_cntr_Move167
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move167:
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
BNE	R2, R0, L__speed_cntr_Move168
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move168:
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
BEQ	R2, R0, L__speed_cntr_Move169
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move169:
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
BEQ	R2, R0, L__speed_cntr_Move170
NOP	
J	L_speed_cntr_Move18
NOP	
L__speed_cntr_Move170:
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
L__speed_cntr_Move149:
L__speed_cntr_Move148:
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
;Stepper.c,210 :: 		SV.px    = 0;
SW	R0, Offset(_SV+24)(GP)
;Stepper.c,211 :: 		SV.py    = 0;
SW	R0, Offset(_SV+28)(GP)
;Stepper.c,212 :: 		SV.pz    = 0;
SW	R0, Offset(_SV+32)(GP)
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
SLTI	R2, R2, 2
BNE	R2, R0, L__CycleStop172
NOP	
J	L_CycleStop21
NOP	
L__CycleStop172:
;Stepper.c,222 :: 		STPS[ii].microSec = 0;
SEH	R2, R4
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,223 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 3
BEQ	R2, R0, L__CycleStop173
NOP	
J	L_CycleStop23
NOP	
L__CycleStop173:
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
BEQ	R2, R0, L__CycleStart175
NOP	
J	L_CycleStart24
NOP	
L__CycleStart175:
;Stepper.c,231 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart25:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 2
BNE	R2, R0, L__CycleStart176
NOP	
J	L_CycleStart26
NOP	
L__CycleStart176:
;Stepper.c,232 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 3
BEQ	R2, R0, L__CycleStart177
NOP	
J	L_CycleStart28
NOP	
L__CycleStart177:
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
_Step:
;Stepper.c,238 :: 		void Step(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,241 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+36)(GP)
;Stepper.c,242 :: 		d2 = 0;
SW	R0, Offset(Step_d2_L0+0)(GP)
;Stepper.c,244 :: 		SV.px = 0;
SW	R0, Offset(_SV+24)(GP)
;Stepper.c,245 :: 		SV.py = 0;
SW	R0, Offset(_SV+28)(GP)
;Stepper.c,246 :: 		SV.pz = 0;
SW	R0, Offset(_SV+32)(GP)
;Stepper.c,251 :: 		switch(axis_combo){
J	L_Step29
NOP	
;Stepper.c,252 :: 		case xy:
L_Step31:
;Stepper.c,253 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,254 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,256 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Step179
NOP	
J	L_Step32
NOP	
L__Step179:
; ?FLOC___Step?T352 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Step?T352 end address is: 12 (R3)
J	L_Step33
NOP	
L_Step32:
; ?FLOC___Step?T352 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___Step?T352 end address is: 12 (R3)
L_Step33:
; ?FLOC___Step?T352 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Step?T352 end address is: 12 (R3)
SH	R2, Offset(_SV+48)(GP)
;Stepper.c,257 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Step180
NOP	
J	L_Step34
NOP	
L__Step180:
; ?FLOC___Step?T354 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Step?T354 end address is: 12 (R3)
J	L_Step35
NOP	
L_Step34:
; ?FLOC___Step?T354 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___Step?T354 end address is: 12 (R3)
L_Step35:
; ?FLOC___Step?T354 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Step?T354 end address is: 12 (R3)
SH	R2, Offset(_SV+50)(GP)
;Stepper.c,259 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+48)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step181
NOP	
J	L_Step36
NOP	
L__Step181:
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
J	L_Step37
NOP	
L_Step36:
;Stepper.c,260 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
L_Step37:
;Stepper.c,261 :: 		if(SV.diry < 0) DIR_StepY = CCW;
LH	R2, Offset(_SV+50)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step182
NOP	
J	L_Step38
NOP	
L__Step182:
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_Step39
NOP	
L_Step38:
;Stepper.c,262 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_Step39:
;Stepper.c,263 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+12)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,264 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,266 :: 		if(SV.dx > SV.dy) d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Step183
NOP	
J	L_Step40
NOP	
L__Step183:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Step_d2_L0+0)(GP)
J	L_Step41
NOP	
L_Step40:
;Stepper.c,267 :: 		else d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Step_d2_L0+0)(GP)
L_Step41:
;Stepper.c,268 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__Step184
NOP	
J	L_Step42
NOP	
L__Step184:
;Stepper.c,269 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,270 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Step185
NOP	
J	L_Step43
NOP	
L__Step185:
;Stepper.c,271 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count)/*(i=0; i < SV.dx; ++i)*/{
SW	R0, Offset(_STPS+32)(GP)
L_Step44:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__Step186
NOP	
J	L_Step45
NOP	
L__Step186:
;Stepper.c,272 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,273 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,274 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,275 :: 		if(d2 < 0)d2 += 2*SV.dy;
LW	R2, Offset(Step_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step187
NOP	
J	L_Step47
NOP	
L__Step187:
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
J	L_Step48
NOP	
L_Step47:
;Stepper.c,277 :: 		d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
;Stepper.c,278 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,279 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,280 :: 		}
L_Step48:
;Stepper.c,282 :: 		while(STmr.compOCxRunning != 1);//STPS[X].microSec < STPS[X].step_delay);
L_Step49:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Step189
NOP	
J	L_Step50
NOP	
L__Step189:
J	L_Step49
NOP	
L_Step50:
;Stepper.c,271 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count)/*(i=0; i < SV.dx; ++i)*/{
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,283 :: 		}
J	L_Step44
NOP	
L_Step45:
;Stepper.c,284 :: 		}else{
J	L_Step51
NOP	
L_Step43:
;Stepper.c,285 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count)/*(i=0;i < SV.dy;++i)*/{
SW	R0, Offset(_STPS+96)(GP)
L_Step52:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+96)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__Step190
NOP	
J	L_Step53
NOP	
L__Step190:
;Stepper.c,286 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,287 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,288 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,289 :: 		if(d2 < 0)d2 += 2 * SV.dx;
LW	R2, Offset(Step_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step191
NOP	
J	L_Step55
NOP	
L__Step191:
LW	R2, Offset(_SV+12)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
J	L_Step56
NOP	
L_Step55:
;Stepper.c,291 :: 		d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
;Stepper.c,292 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,293 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,294 :: 		}
L_Step56:
;Stepper.c,296 :: 		while(STmr.compOCxRunning != 2);//STPS[Y].microSec < STPS[y].step_delay);
L_Step57:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Step193
NOP	
J	L_Step58
NOP	
L__Step193:
J	L_Step57
NOP	
L_Step58:
;Stepper.c,285 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count)/*(i=0;i < SV.dy;++i)*/{
LW	R2, Offset(_STPS+96)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+96)(GP)
;Stepper.c,297 :: 		}
J	L_Step52
NOP	
L_Step53:
;Stepper.c,298 :: 		}
L_Step51:
;Stepper.c,299 :: 		}
L_Step42:
;Stepper.c,300 :: 		break;
J	L_Step30
NOP	
;Stepper.c,301 :: 		case xz:
L_Step59:
;Stepper.c,302 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,303 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,305 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Step194
NOP	
J	L_Step60
NOP	
L__Step194:
; ?FLOC___Step?T391 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Step?T391 end address is: 12 (R3)
J	L_Step61
NOP	
L_Step60:
; ?FLOC___Step?T391 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___Step?T391 end address is: 12 (R3)
L_Step61:
; ?FLOC___Step?T391 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Step?T391 end address is: 12 (R3)
SH	R2, Offset(_SV+48)(GP)
;Stepper.c,306 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Step195
NOP	
J	L_Step62
NOP	
L__Step195:
; ?FLOC___Step?T393 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Step?T393 end address is: 12 (R3)
J	L_Step63
NOP	
L_Step62:
; ?FLOC___Step?T393 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___Step?T393 end address is: 12 (R3)
L_Step63:
; ?FLOC___Step?T393 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Step?T393 end address is: 12 (R3)
SH	R2, Offset(_SV+52)(GP)
;Stepper.c,308 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+48)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step196
NOP	
J	L_Step64
NOP	
L__Step196:
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
J	L_Step65
NOP	
L_Step64:
;Stepper.c,309 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
L_Step65:
;Stepper.c,310 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+52)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step197
NOP	
J	L_Step66
NOP	
L__Step197:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_Step67
NOP	
L_Step66:
;Stepper.c,311 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_Step67:
;Stepper.c,312 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+12)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,313 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,315 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Step198
NOP	
J	L_Step68
NOP	
L__Step198:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Step_d2_L0+0)(GP)
J	L_Step69
NOP	
L_Step68:
;Stepper.c,316 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Step_d2_L0+0)(GP)
L_Step69:
;Stepper.c,317 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__Step199
NOP	
J	L_Step70
NOP	
L__Step199:
;Stepper.c,318 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,319 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Step200
NOP	
J	L_Step71
NOP	
L__Step200:
;Stepper.c,320 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count)/*(i=0; i < SV.dx; ++i)*/{
SW	R0, Offset(_STPS+32)(GP)
L_Step72:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__Step201
NOP	
J	L_Step73
NOP	
L__Step201:
;Stepper.c,321 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,322 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,323 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,324 :: 		if(d2 < 0)d2 += 2*SV.dz;
LW	R2, Offset(Step_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step202
NOP	
J	L_Step75
NOP	
L__Step202:
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
J	L_Step76
NOP	
L_Step75:
;Stepper.c,326 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
;Stepper.c,327 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,328 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,329 :: 		}
L_Step76:
;Stepper.c,331 :: 		while(STmr.compOCxRunning != 1);//STPS[X].microSec < STPS[X].step_delay);
L_Step77:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Step204
NOP	
J	L_Step78
NOP	
L__Step204:
J	L_Step77
NOP	
L_Step78:
;Stepper.c,320 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count)/*(i=0; i < SV.dx; ++i)*/{
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,332 :: 		}
J	L_Step72
NOP	
L_Step73:
;Stepper.c,333 :: 		}else{
J	L_Step79
NOP	
L_Step71:
;Stepper.c,334 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dy; ++STPS[Z].step_count)/*(i=0;i < SV.dy;++i)*/{
SW	R0, Offset(_STPS+160)(GP)
L_Step80:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+160)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__Step205
NOP	
J	L_Step81
NOP	
L__Step205:
;Stepper.c,335 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,336 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,337 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,338 :: 		if(d2 < 0)d2 += 2 * SV.dx;
LW	R2, Offset(Step_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step206
NOP	
J	L_Step83
NOP	
L__Step206:
LW	R2, Offset(_SV+12)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
J	L_Step84
NOP	
L_Step83:
;Stepper.c,340 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
;Stepper.c,341 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,342 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,343 :: 		}
L_Step84:
;Stepper.c,345 :: 		while(STmr.compOCxRunning != 2);//STPS[Y].microSec < STPS[Z].step_delay);
L_Step85:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Step208
NOP	
J	L_Step86
NOP	
L__Step208:
J	L_Step85
NOP	
L_Step86:
;Stepper.c,334 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dy; ++STPS[Z].step_count)/*(i=0;i < SV.dy;++i)*/{
LW	R2, Offset(_STPS+160)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+160)(GP)
;Stepper.c,346 :: 		}
J	L_Step80
NOP	
L_Step81:
;Stepper.c,347 :: 		}
L_Step79:
;Stepper.c,348 :: 		}
L_Step70:
;Stepper.c,349 :: 		break;
J	L_Step30
NOP	
;Stepper.c,350 :: 		case yz:
L_Step87:
;Stepper.c,351 :: 		SV.dy   = newx - SV.pz;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,352 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,354 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Step209
NOP	
J	L_Step88
NOP	
L__Step209:
; ?FLOC___Step?T430 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Step?T430 end address is: 12 (R3)
J	L_Step89
NOP	
L_Step88:
; ?FLOC___Step?T430 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___Step?T430 end address is: 12 (R3)
L_Step89:
; ?FLOC___Step?T430 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Step?T430 end address is: 12 (R3)
SH	R2, Offset(_SV+50)(GP)
;Stepper.c,355 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__Step210
NOP	
J	L_Step90
NOP	
L__Step210:
; ?FLOC___Step?T432 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___Step?T432 end address is: 12 (R3)
J	L_Step91
NOP	
L_Step90:
; ?FLOC___Step?T432 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___Step?T432 end address is: 12 (R3)
L_Step91:
; ?FLOC___Step?T432 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___Step?T432 end address is: 12 (R3)
SH	R2, Offset(_SV+52)(GP)
;Stepper.c,357 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+50)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step211
NOP	
J	L_Step92
NOP	
L__Step211:
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_Step93
NOP	
L_Step92:
;Stepper.c,358 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_Step93:
;Stepper.c,359 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+52)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step212
NOP	
J	L_Step94
NOP	
L__Step212:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_Step95
NOP	
L_Step94:
;Stepper.c,360 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_Step95:
;Stepper.c,361 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,362 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,364 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Step213
NOP	
J	L_Step96
NOP	
L__Step213:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Step_d2_L0+0)(GP)
J	L_Step97
NOP	
L_Step96:
;Stepper.c,365 :: 		else d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Step_d2_L0+0)(GP)
L_Step97:
;Stepper.c,366 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__Step214
NOP	
J	L_Step98
NOP	
L__Step214:
;Stepper.c,367 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,368 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Step215
NOP	
J	L_Step99
NOP	
L__Step215:
;Stepper.c,369 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count)/*(i=0; i < SV.dx; ++i)*/{
SW	R0, Offset(_STPS+96)(GP)
L_Step100:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+96)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__Step216
NOP	
J	L_Step101
NOP	
L__Step216:
;Stepper.c,370 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,371 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,372 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,373 :: 		if(d2 < 0)d2 += 2*SV.dz;
LW	R2, Offset(Step_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step217
NOP	
J	L_Step103
NOP	
L__Step217:
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
J	L_Step104
NOP	
L_Step103:
;Stepper.c,375 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
;Stepper.c,376 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,377 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,378 :: 		}
L_Step104:
;Stepper.c,380 :: 		while(STmr.compOCxRunning != 1);//STPS[X].microSec < STPS[X].step_delay);
L_Step105:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__Step219
NOP	
J	L_Step106
NOP	
L__Step219:
J	L_Step105
NOP	
L_Step106:
;Stepper.c,369 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count)/*(i=0; i < SV.dx; ++i)*/{
LW	R2, Offset(_STPS+96)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+96)(GP)
;Stepper.c,381 :: 		}
J	L_Step100
NOP	
L_Step101:
;Stepper.c,382 :: 		}else{
J	L_Step107
NOP	
L_Step99:
;Stepper.c,383 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dy; ++STPS[Z].step_count)/*(i=0;i < SV.dy;++i)*/{
SW	R0, Offset(_STPS+160)(GP)
L_Step108:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+160)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__Step220
NOP	
J	L_Step109
NOP	
L__Step220:
;Stepper.c,384 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,385 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,386 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,387 :: 		if(d2 < 0)d2 += 2 * SV.dy;
LW	R2, Offset(Step_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__Step221
NOP	
J	L_Step111
NOP	
L__Step221:
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
J	L_Step112
NOP	
L_Step111:
;Stepper.c,389 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Step_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Step_d2_L0+0)(GP)
;Stepper.c,390 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,391 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,392 :: 		}
L_Step112:
;Stepper.c,394 :: 		while(STmr.compOCxRunning != 2);//STPS[Y].microSec < STPS[Z].step_delay);
L_Step113:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Step223
NOP	
J	L_Step114
NOP	
L__Step223:
J	L_Step113
NOP	
L_Step114:
;Stepper.c,383 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dy; ++STPS[Z].step_count)/*(i=0;i < SV.dy;++i)*/{
LW	R2, Offset(_STPS+160)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+160)(GP)
;Stepper.c,395 :: 		}
J	L_Step108
NOP	
L_Step109:
;Stepper.c,396 :: 		}
L_Step107:
;Stepper.c,397 :: 		}
L_Step98:
;Stepper.c,399 :: 		break;
J	L_Step30
NOP	
;Stepper.c,400 :: 		default: break;
L_Step115:
J	L_Step30
NOP	
;Stepper.c,402 :: 		}
L_Step29:
SEH	R2, R27
BNE	R2, R0, L__Step225
NOP	
J	L_Step31
NOP	
L__Step225:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__Step227
NOP	
J	L_Step59
NOP	
L__Step227:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__Step229
NOP	
J	L_Step87
NOP	
L__Step229:
J	L_Step115
NOP	
L_Step30:
;Stepper.c,414 :: 		}
L_end_Step:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Step
_toggleOCx:
;Stepper.c,419 :: 		void toggleOCx(int axis_No){
;Stepper.c,420 :: 		switch(axis_No){
J	L_toggleOCx116
NOP	
;Stepper.c,421 :: 		case 0: OC5R   = 0x5;
L_toggleOCx118:
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,422 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,423 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,424 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,425 :: 		break;
J	L_toggleOCx117
NOP	
;Stepper.c,426 :: 		case 1: OC3R   = 0x5;
L_toggleOCx119:
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,427 :: 		OC3RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+72)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,428 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,429 :: 		OC3CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,430 :: 		break;
J	L_toggleOCx117
NOP	
;Stepper.c,431 :: 		case 2: OC8R   = 0x5;
L_toggleOCx120:
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,432 :: 		OC8RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+136)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,433 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,434 :: 		OC8CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,435 :: 		break;
J	L_toggleOCx117
NOP	
;Stepper.c,436 :: 		default:
L_toggleOCx121:
;Stepper.c,437 :: 		break;
J	L_toggleOCx117
NOP	
;Stepper.c,438 :: 		}
L_toggleOCx116:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx232
NOP	
J	L_toggleOCx118
NOP	
L__toggleOCx232:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx234
NOP	
J	L_toggleOCx119
NOP	
L__toggleOCx234:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx236
NOP	
J	L_toggleOCx120
NOP	
L__toggleOCx236:
J	L_toggleOCx121
NOP	
L_toggleOCx117:
;Stepper.c,440 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,443 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,445 :: 		if(!STPS[axis_No].PLS_Step_ ){
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Pulse238
NOP	
J	L_Pulse122
NOP	
L__Pulse238:
;Stepper.c,450 :: 		STPS[axis_No].PLS_Step_   = 1;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 2
SB	R2, 0(R3)
;Stepper.c,452 :: 		}
L_Pulse122:
;Stepper.c,456 :: 		switch(STPS[axis_No].run_state) {
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse123
NOP	
;Stepper.c,457 :: 		case STOP:
L_Pulse125:
;Stepper.c,458 :: 		LATE7_bit = 0;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,459 :: 		T8IE_bit         = 0;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Stepper.c,460 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,461 :: 		break;
J	L_Pulse124
NOP	
;Stepper.c,463 :: 		case ACCEL:
L_Pulse126:
;Stepper.c,464 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,467 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__Pulse239
NOP	
J	L_Pulse127
NOP	
L__Pulse239:
;Stepper.c,469 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,470 :: 		STPS[axis_No].run_state  = RUN;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,471 :: 		}
L_Pulse127:
;Stepper.c,472 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
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
BNE	R2, R0, L__Pulse240
NOP	
J	L_Pulse128
NOP	
L__Pulse240:
;Stepper.c,473 :: 		STPS[axis_No].run_state  = RUN;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,474 :: 		}
L_Pulse128:
;Stepper.c,475 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse241
NOP	
J	L_Pulse129
NOP	
L__Pulse241:
;Stepper.c,476 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,477 :: 		STPS[axis_No].rest        = 0;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Stepper.c,478 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,479 :: 		}
L_Pulse129:
;Stepper.c,480 :: 		break;
J	L_Pulse124
NOP	
;Stepper.c,482 :: 		case RUN:
L_Pulse130:
;Stepper.c,483 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,485 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse242
NOP	
J	L_Pulse131
NOP	
L__Pulse242:
;Stepper.c,486 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,487 :: 		STPS[axis_No].rest        = 0;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Stepper.c,489 :: 		STPS[axis_No].run_state   =  DECEL;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,490 :: 		}
L_Pulse131:
;Stepper.c,491 :: 		break;
J	L_Pulse124
NOP	
;Stepper.c,493 :: 		case DECEL:
L_Pulse132:
;Stepper.c,497 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,498 :: 		if(STPS[axis_No].accel_count >= -2 ){
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SLTI	R2, R2, -2
BEQ	R2, R0, L__Pulse243
NOP	
J	L_Pulse133
NOP	
L__Pulse243:
;Stepper.c,499 :: 		STPS[axis_No].run_state = STOP;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,500 :: 		}
L_Pulse133:
;Stepper.c,501 :: 		break;
J	L_Pulse124
NOP	
;Stepper.c,502 :: 		default:break;
L_Pulse134:
J	L_Pulse124
NOP	
;Stepper.c,503 :: 		}
L_Pulse123:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse245
NOP	
J	L_Pulse125
NOP	
L__Pulse245:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse247
NOP	
J	L_Pulse126
NOP	
L__Pulse247:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse249
NOP	
J	L_Pulse130
NOP	
L__Pulse249:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse251
NOP	
J	L_Pulse132
NOP	
L__Pulse251:
J	L_Pulse134
NOP	
L_Pulse124:
;Stepper.c,504 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,505 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,507 :: 		void AccDec(int axis_No){
;Stepper.c,508 :: 		STPS[axis_No].accel_count++;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,509 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
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
;Stepper.c,510 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
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
;Stepper.c,511 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 36
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,513 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
Stepper_sqrt_:
;Stepper.c,524 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,530 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,531 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,532 :: 		do
J	L_Stepper_sqrt_135
NOP	
L_Stepper_sqrt_145:
;Stepper.c,546 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,532 :: 		do
L_Stepper_sqrt_135:
;Stepper.c,534 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_254
NOP	
J	L_Stepper_sqrt_138
NOP	
L_Stepper_sqrt_254:
;Stepper.c,536 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,537 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,538 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_139
NOP	
L_Stepper_sqrt_138:
;Stepper.c,540 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,541 :: 		}
L_Stepper_sqrt_139:
;Stepper.c,542 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,543 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_256
NOP	
J	L_Stepper_sqrt_146
NOP	
L_Stepper_sqrt_256:
; f end address is: 16 (R4)
;Stepper.c,544 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,545 :: 		}
J	L_Stepper_sqrt_140
NOP	
L_Stepper_sqrt_146:
;Stepper.c,543 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,545 :: 		}
L_Stepper_sqrt_140:
;Stepper.c,546 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_257
NOP	
J	L_Stepper_sqrt_145
NOP	
L_Stepper_sqrt_257:
; q2 end address is: 12 (R3)
;Stepper.c,547 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_258
NOP	
J	L_Stepper_sqrt_141
NOP	
L_Stepper_sqrt_258:
;Stepper.c,548 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,549 :: 		}
L_Stepper_sqrt_141:
;Stepper.c,551 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,553 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_min_:
;Stepper.c,560 :: 		unsigned int min_(unsigned int x, unsigned int y)
;Stepper.c,562 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_260
NOP	
J	L_min_143
NOP	
L__min_260:
;Stepper.c,563 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,564 :: 		}
L_min_143:
;Stepper.c,566 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,568 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
