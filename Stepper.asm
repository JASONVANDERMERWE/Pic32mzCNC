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
BEQ	R25, R2, L__speed_cntr_Move171
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move171:
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
BNE	R25, R0, L__speed_cntr_Move173
NOP	
J	L__speed_cntr_Move163
NOP	
L__speed_cntr_Move173:
JAL	_abs+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__speed_cntr_Move175
NOP	
J	L__speed_cntr_Move162
NOP	
L__speed_cntr_Move175:
L__speed_cntr_Move161:
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
BEQ	R2, R0, L__speed_cntr_Move176
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move176:
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
BEQ	R2, R0, L__speed_cntr_Move177
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move177:
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
BEQ	R2, R0, L__speed_cntr_Move178
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move178:
;Stepper.c,175 :: 		if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps; //needs to be -ve
SLTI	R2, R25, 0
BEQ	R2, R0, L__speed_cntr_Move179
NOP	
J	L_speed_cntr_Move8
NOP	
L__speed_cntr_Move179:
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
BEQ	R2, R0, L__speed_cntr_Move180
NOP	
J	L_speed_cntr_Move11
NOP	
L__speed_cntr_Move180:
;Stepper.c,182 :: 		if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
SEH	R2, R27
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SLT	R2, R2, R25
BNE	R2, R0, L__speed_cntr_Move181
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move181:
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
BNE	R2, R0, L__speed_cntr_Move182
NOP	
J	L_speed_cntr_Move15
NOP	
L__speed_cntr_Move182:
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
BEQ	R2, R0, L__speed_cntr_Move183
NOP	
J	L_speed_cntr_Move17
NOP	
L__speed_cntr_Move183:
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
BEQ	R2, R0, L__speed_cntr_Move184
NOP	
J	L_speed_cntr_Move18
NOP	
L__speed_cntr_Move184:
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
L__speed_cntr_Move163:
L__speed_cntr_Move162:
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
BNE	R2, R0, L__CycleStop186
NOP	
J	L_CycleStop21
NOP	
L__CycleStop186:
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
BEQ	R2, R0, L__CycleStop187
NOP	
J	L_CycleStop23
NOP	
L__CycleStop187:
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
BEQ	R2, R0, L__CycleStart189
NOP	
J	L_CycleStart24
NOP	
L__CycleStart189:
;Stepper.c,231 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart25:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 2
BNE	R2, R0, L__CycleStart190
NOP	
J	L_CycleStart26
NOP	
L__CycleStart190:
;Stepper.c,232 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 3
BEQ	R2, R0, L__CycleStart191
NOP	
J	L_CycleStart28
NOP	
L__CycleStart191:
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
;Stepper.c,245 :: 		if(newxyz < 0)
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep193
NOP	
J	L_SingleAxisStep29
NOP	
L__SingleAxisStep193:
;Stepper.c,246 :: 		dir = CCW;
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep30
NOP	
L_SingleAxisStep29:
;Stepper.c,248 :: 		dir = CW;
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep30:
;Stepper.c,249 :: 		SV.dx = abs(newxyz);
; dir start address is: 16 (R4)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,250 :: 		switch(axis_No){
J	L_SingleAxisStep31
NOP	
;Stepper.c,251 :: 		case X:
L_SingleAxisStep33:
;Stepper.c,252 :: 		DIR_StepX = dir;
_LX	
INS	R2, R4, BitPos(LATG1_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,253 :: 		break;
J	L_SingleAxisStep32
NOP	
;Stepper.c,254 :: 		case Y:
L_SingleAxisStep34:
;Stepper.c,255 :: 		DIR_StepY = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(LATD5_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,256 :: 		break;
J	L_SingleAxisStep32
NOP	
;Stepper.c,257 :: 		case Z:
L_SingleAxisStep35:
;Stepper.c,258 :: 		DIR_StepZ = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(LATG12_bit+0), 1
; dir end address is: 16 (R4)
_SX	
;Stepper.c,259 :: 		break;
J	L_SingleAxisStep32
NOP	
;Stepper.c,260 :: 		default: break;
L_SingleAxisStep36:
J	L_SingleAxisStep32
NOP	
;Stepper.c,261 :: 		}
L_SingleAxisStep31:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep195
NOP	
J	L_SingleAxisStep33
NOP	
L__SingleAxisStep195:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep197
NOP	
J	L_SingleAxisStep34
NOP	
L__SingleAxisStep197:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep199
NOP	
J	L_SingleAxisStep35
NOP	
L__SingleAxisStep199:
; dir end address is: 16 (R4)
J	L_SingleAxisStep36
NOP	
L_SingleAxisStep32:
;Stepper.c,262 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__SingleAxisStep200
NOP	
J	L_SingleAxisStep37
NOP	
L__SingleAxisStep200:
;Stepper.c,263 :: 		for(STPS[axis_No].step_count = 0;STPS[axis_No].step_count < SV.dx; ++STPS[axis_No].step_count){
SEH	R2, R26
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
L_SingleAxisStep38:
SEH	R2, R26
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
LW	R3, 0(R2)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__SingleAxisStep201
NOP	
J	L_SingleAxisStep39
NOP	
L__SingleAxisStep201:
;Stepper.c,264 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,265 :: 		toggleOCx(axis_No);
SW	R25, 4(SP)
SEH	R25, R26
JAL	_toggleOCx+0
NOP	
;Stepper.c,266 :: 		Pulse(axis_No);
SEH	R25, R26
JAL	_Pulse+0
NOP	
LW	R25, 4(SP)
;Stepper.c,268 :: 		while(STmr.compOCxRunning == 0);//STPS[X].microSec < STPS[X].step_delay);
L_SingleAxisStep41:
LH	R2, Offset(_STmr+8)(GP)
BEQ	R2, R0, L__SingleAxisStep202
NOP	
J	L_SingleAxisStep42
NOP	
L__SingleAxisStep202:
J	L_SingleAxisStep41
NOP	
L_SingleAxisStep42:
;Stepper.c,263 :: 		for(STPS[axis_No].step_count = 0;STPS[axis_No].step_count < SV.dx; ++STPS[axis_No].step_count){
SEH	R2, R26
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 32
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,269 :: 		}
J	L_SingleAxisStep38
NOP	
L_SingleAxisStep39:
;Stepper.c,270 :: 		}
L_SingleAxisStep37:
;Stepper.c,272 :: 		}
L_end_SingleAxisStep:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Stepper.c,274 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,277 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+36)(GP)
;Stepper.c,278 :: 		d2 = 0;
SW	R0, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,280 :: 		SV.px = 0;
SW	R0, Offset(_SV+24)(GP)
;Stepper.c,281 :: 		SV.py = 0;
SW	R0, Offset(_SV+28)(GP)
;Stepper.c,282 :: 		SV.pz = 0;
SW	R0, Offset(_SV+32)(GP)
;Stepper.c,287 :: 		switch(axis_combo){
J	L_DualAxisStep43
NOP	
;Stepper.c,288 :: 		case xy:
L_DualAxisStep45:
;Stepper.c,289 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,290 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,292 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep204
NOP	
J	L_DualAxisStep46
NOP	
L__DualAxisStep204:
; ?FLOC___DualAxisStep?T380 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T380 end address is: 12 (R3)
J	L_DualAxisStep47
NOP	
L_DualAxisStep46:
; ?FLOC___DualAxisStep?T380 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T380 end address is: 12 (R3)
L_DualAxisStep47:
; ?FLOC___DualAxisStep?T380 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T380 end address is: 12 (R3)
SH	R2, Offset(_SV+48)(GP)
;Stepper.c,293 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep205
NOP	
J	L_DualAxisStep48
NOP	
L__DualAxisStep205:
; ?FLOC___DualAxisStep?T382 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T382 end address is: 12 (R3)
J	L_DualAxisStep49
NOP	
L_DualAxisStep48:
; ?FLOC___DualAxisStep?T382 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T382 end address is: 12 (R3)
L_DualAxisStep49:
; ?FLOC___DualAxisStep?T382 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T382 end address is: 12 (R3)
SH	R2, Offset(_SV+50)(GP)
;Stepper.c,295 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+48)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep206
NOP	
J	L_DualAxisStep50
NOP	
L__DualAxisStep206:
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
J	L_DualAxisStep51
NOP	
L_DualAxisStep50:
;Stepper.c,296 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
L_DualAxisStep51:
;Stepper.c,297 :: 		if(SV.diry < 0) DIR_StepY = CCW;
LH	R2, Offset(_SV+50)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep207
NOP	
J	L_DualAxisStep52
NOP	
L__DualAxisStep207:
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_DualAxisStep53
NOP	
L_DualAxisStep52:
;Stepper.c,298 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_DualAxisStep53:
;Stepper.c,299 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+12)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,300 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,302 :: 		if(SV.dx > SV.dy) d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep208
NOP	
J	L_DualAxisStep54
NOP	
L__DualAxisStep208:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep55
NOP	
L_DualAxisStep54:
;Stepper.c,303 :: 		else d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
L_DualAxisStep55:
;Stepper.c,304 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep209
NOP	
J	L_DualAxisStep56
NOP	
L__DualAxisStep209:
;Stepper.c,305 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,306 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep210
NOP	
J	L_DualAxisStep57
NOP	
L__DualAxisStep210:
;Stepper.c,307 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
SW	R0, Offset(_STPS+32)(GP)
L_DualAxisStep58:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep211
NOP	
J	L_DualAxisStep59
NOP	
L__DualAxisStep211:
;Stepper.c,308 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,309 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,310 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,311 :: 		if(d2 < 0)d2 += 2*SV.dy;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep212
NOP	
J	L_DualAxisStep61
NOP	
L__DualAxisStep212:
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep62
NOP	
L_DualAxisStep61:
;Stepper.c,313 :: 		d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,314 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,315 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,316 :: 		}
L_DualAxisStep62:
;Stepper.c,318 :: 		while(STmr.compOCxRunning != 1);
L_DualAxisStep63:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep214
NOP	
J	L_DualAxisStep64
NOP	
L__DualAxisStep214:
J	L_DualAxisStep63
NOP	
L_DualAxisStep64:
;Stepper.c,307 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,319 :: 		}
J	L_DualAxisStep58
NOP	
L_DualAxisStep59:
;Stepper.c,320 :: 		}else{
J	L_DualAxisStep65
NOP	
L_DualAxisStep57:
;Stepper.c,321 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
SW	R0, Offset(_STPS+96)(GP)
L_DualAxisStep66:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+96)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep215
NOP	
J	L_DualAxisStep67
NOP	
L__DualAxisStep215:
;Stepper.c,322 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,323 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,324 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,325 :: 		if(d2 < 0)d2 += 2 * SV.dx;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep216
NOP	
J	L_DualAxisStep69
NOP	
L__DualAxisStep216:
LW	R2, Offset(_SV+12)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep70
NOP	
L_DualAxisStep69:
;Stepper.c,327 :: 		d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,328 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,329 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,330 :: 		}
L_DualAxisStep70:
;Stepper.c,332 :: 		while(STmr.compOCxRunning != 2);
L_DualAxisStep71:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep218
NOP	
J	L_DualAxisStep72
NOP	
L__DualAxisStep218:
J	L_DualAxisStep71
NOP	
L_DualAxisStep72:
;Stepper.c,321 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
LW	R2, Offset(_STPS+96)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+96)(GP)
;Stepper.c,333 :: 		}
J	L_DualAxisStep66
NOP	
L_DualAxisStep67:
;Stepper.c,334 :: 		}
L_DualAxisStep65:
;Stepper.c,335 :: 		}
L_DualAxisStep56:
;Stepper.c,336 :: 		break;
J	L_DualAxisStep44
NOP	
;Stepper.c,337 :: 		case xz:
L_DualAxisStep73:
;Stepper.c,338 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,339 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,341 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep219
NOP	
J	L_DualAxisStep74
NOP	
L__DualAxisStep219:
; ?FLOC___DualAxisStep?T419 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T419 end address is: 12 (R3)
J	L_DualAxisStep75
NOP	
L_DualAxisStep74:
; ?FLOC___DualAxisStep?T419 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T419 end address is: 12 (R3)
L_DualAxisStep75:
; ?FLOC___DualAxisStep?T419 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T419 end address is: 12 (R3)
SH	R2, Offset(_SV+48)(GP)
;Stepper.c,342 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep220
NOP	
J	L_DualAxisStep76
NOP	
L__DualAxisStep220:
; ?FLOC___DualAxisStep?T421 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T421 end address is: 12 (R3)
J	L_DualAxisStep77
NOP	
L_DualAxisStep76:
; ?FLOC___DualAxisStep?T421 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T421 end address is: 12 (R3)
L_DualAxisStep77:
; ?FLOC___DualAxisStep?T421 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T421 end address is: 12 (R3)
SH	R2, Offset(_SV+52)(GP)
;Stepper.c,344 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+48)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep221
NOP	
J	L_DualAxisStep78
NOP	
L__DualAxisStep221:
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
J	L_DualAxisStep79
NOP	
L_DualAxisStep78:
;Stepper.c,345 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
L_DualAxisStep79:
;Stepper.c,346 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+52)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep222
NOP	
J	L_DualAxisStep80
NOP	
L__DualAxisStep222:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_DualAxisStep81
NOP	
L_DualAxisStep80:
;Stepper.c,347 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_DualAxisStep81:
;Stepper.c,348 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+12)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,349 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,351 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep223
NOP	
J	L_DualAxisStep82
NOP	
L__DualAxisStep223:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep83
NOP	
L_DualAxisStep82:
;Stepper.c,352 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
L_DualAxisStep83:
;Stepper.c,353 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep224
NOP	
J	L_DualAxisStep84
NOP	
L__DualAxisStep224:
;Stepper.c,354 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,355 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep225
NOP	
J	L_DualAxisStep85
NOP	
L__DualAxisStep225:
;Stepper.c,356 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count)/*(i=0; i < SV.dx; ++i)*/{
SW	R0, Offset(_STPS+32)(GP)
L_DualAxisStep86:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep226
NOP	
J	L_DualAxisStep87
NOP	
L__DualAxisStep226:
;Stepper.c,357 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,358 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,359 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,360 :: 		if(d2 < 0)d2 += 2*SV.dz;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep227
NOP	
J	L_DualAxisStep89
NOP	
L__DualAxisStep227:
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep90
NOP	
L_DualAxisStep89:
;Stepper.c,362 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,363 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,364 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,365 :: 		}
L_DualAxisStep90:
;Stepper.c,367 :: 		while(STmr.compOCxRunning != 3);
L_DualAxisStep91:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__DualAxisStep229
NOP	
J	L_DualAxisStep92
NOP	
L__DualAxisStep229:
J	L_DualAxisStep91
NOP	
L_DualAxisStep92:
;Stepper.c,356 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count)/*(i=0; i < SV.dx; ++i)*/{
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,368 :: 		}
J	L_DualAxisStep86
NOP	
L_DualAxisStep87:
;Stepper.c,369 :: 		}else{
J	L_DualAxisStep93
NOP	
L_DualAxisStep85:
;Stepper.c,370 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dy; ++STPS[Z].step_count){
SW	R0, Offset(_STPS+160)(GP)
L_DualAxisStep94:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+160)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep230
NOP	
J	L_DualAxisStep95
NOP	
L__DualAxisStep230:
;Stepper.c,371 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,372 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,373 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,374 :: 		if(d2 < 0)d2 += 2 * SV.dx;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep231
NOP	
J	L_DualAxisStep97
NOP	
L__DualAxisStep231:
LW	R2, Offset(_SV+12)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep98
NOP	
L_DualAxisStep97:
;Stepper.c,376 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,377 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,378 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,379 :: 		}
L_DualAxisStep98:
;Stepper.c,381 :: 		while(STmr.compOCxRunning != 2);
L_DualAxisStep99:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep233
NOP	
J	L_DualAxisStep100
NOP	
L__DualAxisStep233:
J	L_DualAxisStep99
NOP	
L_DualAxisStep100:
;Stepper.c,370 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dy; ++STPS[Z].step_count){
LW	R2, Offset(_STPS+160)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+160)(GP)
;Stepper.c,382 :: 		}
J	L_DualAxisStep94
NOP	
L_DualAxisStep95:
;Stepper.c,383 :: 		}
L_DualAxisStep93:
;Stepper.c,384 :: 		}
L_DualAxisStep84:
;Stepper.c,385 :: 		break;
J	L_DualAxisStep44
NOP	
;Stepper.c,386 :: 		case yz:
L_DualAxisStep101:
;Stepper.c,387 :: 		SV.dy   = newx - SV.pz;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,388 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,390 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep234
NOP	
J	L_DualAxisStep102
NOP	
L__DualAxisStep234:
; ?FLOC___DualAxisStep?T458 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T458 end address is: 12 (R3)
J	L_DualAxisStep103
NOP	
L_DualAxisStep102:
; ?FLOC___DualAxisStep?T458 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T458 end address is: 12 (R3)
L_DualAxisStep103:
; ?FLOC___DualAxisStep?T458 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T458 end address is: 12 (R3)
SH	R2, Offset(_SV+50)(GP)
;Stepper.c,391 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep235
NOP	
J	L_DualAxisStep104
NOP	
L__DualAxisStep235:
; ?FLOC___DualAxisStep?T460 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T460 end address is: 12 (R3)
J	L_DualAxisStep105
NOP	
L_DualAxisStep104:
; ?FLOC___DualAxisStep?T460 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T460 end address is: 12 (R3)
L_DualAxisStep105:
; ?FLOC___DualAxisStep?T460 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T460 end address is: 12 (R3)
SH	R2, Offset(_SV+52)(GP)
;Stepper.c,393 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+50)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep236
NOP	
J	L_DualAxisStep106
NOP	
L__DualAxisStep236:
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_DualAxisStep107
NOP	
L_DualAxisStep106:
;Stepper.c,394 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_DualAxisStep107:
;Stepper.c,395 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+52)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep237
NOP	
J	L_DualAxisStep108
NOP	
L__DualAxisStep237:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_DualAxisStep109
NOP	
L_DualAxisStep108:
;Stepper.c,396 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_DualAxisStep109:
;Stepper.c,397 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,398 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,400 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep238
NOP	
J	L_DualAxisStep110
NOP	
L__DualAxisStep238:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep111
NOP	
L_DualAxisStep110:
;Stepper.c,401 :: 		else d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
L_DualAxisStep111:
;Stepper.c,402 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep239
NOP	
J	L_DualAxisStep112
NOP	
L__DualAxisStep239:
;Stepper.c,403 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,404 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep240
NOP	
J	L_DualAxisStep113
NOP	
L__DualAxisStep240:
;Stepper.c,405 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
SW	R0, Offset(_STPS+96)(GP)
L_DualAxisStep114:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+96)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep241
NOP	
J	L_DualAxisStep115
NOP	
L__DualAxisStep241:
;Stepper.c,406 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,407 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,408 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,409 :: 		if(d2 < 0)d2 += 2*SV.dz;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep242
NOP	
J	L_DualAxisStep117
NOP	
L__DualAxisStep242:
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep118
NOP	
L_DualAxisStep117:
;Stepper.c,411 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,412 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,413 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,414 :: 		}
L_DualAxisStep118:
;Stepper.c,416 :: 		while(STmr.compOCxRunning != 3);
L_DualAxisStep119:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__DualAxisStep244
NOP	
J	L_DualAxisStep120
NOP	
L__DualAxisStep244:
J	L_DualAxisStep119
NOP	
L_DualAxisStep120:
;Stepper.c,405 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
LW	R2, Offset(_STPS+96)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+96)(GP)
;Stepper.c,417 :: 		}
J	L_DualAxisStep114
NOP	
L_DualAxisStep115:
;Stepper.c,418 :: 		}else{
J	L_DualAxisStep121
NOP	
L_DualAxisStep113:
;Stepper.c,419 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dy; ++STPS[Z].step_count){
SW	R0, Offset(_STPS+160)(GP)
L_DualAxisStep122:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+160)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep245
NOP	
J	L_DualAxisStep123
NOP	
L__DualAxisStep245:
;Stepper.c,420 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,421 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,422 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,423 :: 		if(d2 < 0)d2 += 2 * SV.dy;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep246
NOP	
J	L_DualAxisStep125
NOP	
L__DualAxisStep246:
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep126
NOP	
L_DualAxisStep125:
;Stepper.c,425 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,426 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,427 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,428 :: 		}
L_DualAxisStep126:
;Stepper.c,430 :: 		while(STmr.compOCxRunning != 2);
L_DualAxisStep127:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep248
NOP	
J	L_DualAxisStep128
NOP	
L__DualAxisStep248:
J	L_DualAxisStep127
NOP	
L_DualAxisStep128:
;Stepper.c,419 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dy; ++STPS[Z].step_count){
LW	R2, Offset(_STPS+160)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+160)(GP)
;Stepper.c,431 :: 		}
J	L_DualAxisStep122
NOP	
L_DualAxisStep123:
;Stepper.c,432 :: 		}
L_DualAxisStep121:
;Stepper.c,433 :: 		}
L_DualAxisStep112:
;Stepper.c,435 :: 		break;
J	L_DualAxisStep44
NOP	
;Stepper.c,436 :: 		default: break;
L_DualAxisStep129:
J	L_DualAxisStep44
NOP	
;Stepper.c,438 :: 		}
L_DualAxisStep43:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep250
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep250:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep252
NOP	
J	L_DualAxisStep73
NOP	
L__DualAxisStep252:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep254
NOP	
J	L_DualAxisStep101
NOP	
L__DualAxisStep254:
J	L_DualAxisStep129
NOP	
L_DualAxisStep44:
;Stepper.c,450 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _DualAxisStep
_toggleOCx:
;Stepper.c,455 :: 		void toggleOCx(int axis_No){
;Stepper.c,456 :: 		switch(axis_No){
J	L_toggleOCx130
NOP	
;Stepper.c,457 :: 		case 0: OC5R   = 0x5;
L_toggleOCx132:
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,458 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,459 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,460 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,461 :: 		break;
J	L_toggleOCx131
NOP	
;Stepper.c,462 :: 		case 1: OC3R   = 0x5;
L_toggleOCx133:
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,463 :: 		OC3RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+72)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,464 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,465 :: 		OC3CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,466 :: 		break;
J	L_toggleOCx131
NOP	
;Stepper.c,467 :: 		case 2: OC8R   = 0x5;
L_toggleOCx134:
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,468 :: 		OC8RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+136)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,469 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,470 :: 		OC8CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,471 :: 		break;
J	L_toggleOCx131
NOP	
;Stepper.c,472 :: 		default:
L_toggleOCx135:
;Stepper.c,473 :: 		break;
J	L_toggleOCx131
NOP	
;Stepper.c,474 :: 		}
L_toggleOCx130:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx257
NOP	
J	L_toggleOCx132
NOP	
L__toggleOCx257:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx259
NOP	
J	L_toggleOCx133
NOP	
L__toggleOCx259:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx261
NOP	
J	L_toggleOCx134
NOP	
L__toggleOCx261:
J	L_toggleOCx135
NOP	
L_toggleOCx131:
;Stepper.c,476 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,479 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,481 :: 		if(!STPS[axis_No].PLS_Step_ ){
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Pulse263
NOP	
J	L_Pulse136
NOP	
L__Pulse263:
;Stepper.c,486 :: 		STPS[axis_No].PLS_Step_   = 1;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 2
SB	R2, 0(R3)
;Stepper.c,488 :: 		}
L_Pulse136:
;Stepper.c,492 :: 		switch(STPS[axis_No].run_state) {
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse137
NOP	
;Stepper.c,493 :: 		case STOP:
L_Pulse139:
;Stepper.c,494 :: 		LATE7_bit = 0;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,495 :: 		T8IE_bit         = 0;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Stepper.c,496 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,497 :: 		break;
J	L_Pulse138
NOP	
;Stepper.c,499 :: 		case ACCEL:
L_Pulse140:
;Stepper.c,500 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,503 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__Pulse264
NOP	
J	L_Pulse141
NOP	
L__Pulse264:
;Stepper.c,505 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,506 :: 		STPS[axis_No].run_state  = RUN;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,507 :: 		}
L_Pulse141:
;Stepper.c,508 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
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
BNE	R2, R0, L__Pulse265
NOP	
J	L_Pulse142
NOP	
L__Pulse265:
;Stepper.c,509 :: 		STPS[axis_No].run_state  = RUN;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,510 :: 		}
L_Pulse142:
;Stepper.c,511 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse266
NOP	
J	L_Pulse143
NOP	
L__Pulse266:
;Stepper.c,512 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,513 :: 		STPS[axis_No].rest        = 0;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Stepper.c,514 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,515 :: 		}
L_Pulse143:
;Stepper.c,516 :: 		break;
J	L_Pulse138
NOP	
;Stepper.c,518 :: 		case RUN:
L_Pulse144:
;Stepper.c,519 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,521 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse267
NOP	
J	L_Pulse145
NOP	
L__Pulse267:
;Stepper.c,522 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,523 :: 		STPS[axis_No].rest        = 0;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Stepper.c,525 :: 		STPS[axis_No].run_state   =  DECEL;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,526 :: 		}
L_Pulse145:
;Stepper.c,527 :: 		break;
J	L_Pulse138
NOP	
;Stepper.c,529 :: 		case DECEL:
L_Pulse146:
;Stepper.c,533 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,534 :: 		if(STPS[axis_No].accel_count >= -2 ){
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SLTI	R2, R2, -2
BEQ	R2, R0, L__Pulse268
NOP	
J	L_Pulse147
NOP	
L__Pulse268:
;Stepper.c,535 :: 		STPS[axis_No].run_state = STOP;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,536 :: 		}
L_Pulse147:
;Stepper.c,537 :: 		break;
J	L_Pulse138
NOP	
;Stepper.c,538 :: 		default:break;
L_Pulse148:
J	L_Pulse138
NOP	
;Stepper.c,539 :: 		}
L_Pulse137:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse270
NOP	
J	L_Pulse139
NOP	
L__Pulse270:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse272
NOP	
J	L_Pulse140
NOP	
L__Pulse272:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse274
NOP	
J	L_Pulse144
NOP	
L__Pulse274:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse276
NOP	
J	L_Pulse146
NOP	
L__Pulse276:
J	L_Pulse148
NOP	
L_Pulse138:
;Stepper.c,540 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,541 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,543 :: 		void AccDec(int axis_No){
;Stepper.c,544 :: 		STPS[axis_No].accel_count++;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,545 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
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
;Stepper.c,546 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
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
;Stepper.c,547 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 36
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,549 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
Stepper_sqrt_:
;Stepper.c,560 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,566 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,567 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,568 :: 		do
J	L_Stepper_sqrt_149
NOP	
L_Stepper_sqrt_159:
;Stepper.c,582 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,568 :: 		do
L_Stepper_sqrt_149:
;Stepper.c,570 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_279
NOP	
J	L_Stepper_sqrt_152
NOP	
L_Stepper_sqrt_279:
;Stepper.c,572 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,573 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,574 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_153
NOP	
L_Stepper_sqrt_152:
;Stepper.c,576 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,577 :: 		}
L_Stepper_sqrt_153:
;Stepper.c,578 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,579 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_281
NOP	
J	L_Stepper_sqrt_160
NOP	
L_Stepper_sqrt_281:
; f end address is: 16 (R4)
;Stepper.c,580 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,581 :: 		}
J	L_Stepper_sqrt_154
NOP	
L_Stepper_sqrt_160:
;Stepper.c,579 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,581 :: 		}
L_Stepper_sqrt_154:
;Stepper.c,582 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_282
NOP	
J	L_Stepper_sqrt_159
NOP	
L_Stepper_sqrt_282:
; q2 end address is: 12 (R3)
;Stepper.c,583 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_283
NOP	
J	L_Stepper_sqrt_155
NOP	
L_Stepper_sqrt_283:
;Stepper.c,584 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,585 :: 		}
L_Stepper_sqrt_155:
;Stepper.c,587 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,589 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_min_:
;Stepper.c,596 :: 		unsigned int min_(unsigned int x, unsigned int y)
;Stepper.c,598 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_285
NOP	
J	L_min_157
NOP	
L__min_285:
;Stepper.c,599 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,600 :: 		}
L_min_157:
;Stepper.c,602 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,604 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
