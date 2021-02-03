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
;Stepper.c,238 :: 		void SingleAxisStep(long newxyz,int axis){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,240 :: 		if(newxyz < 0)
SW	R25, 4(SP)
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep193
NOP	
J	L_SingleAxisStep29
NOP	
L__SingleAxisStep193:
;Stepper.c,241 :: 		dir = CCW;
; dir start address is: 28 (R7)
ORI	R7, R0, 1
; dir end address is: 28 (R7)
J	L_SingleAxisStep30
NOP	
L_SingleAxisStep29:
;Stepper.c,243 :: 		dir = CW;
; dir start address is: 28 (R7)
MOVZ	R7, R0, R0
; dir end address is: 28 (R7)
L_SingleAxisStep30:
;Stepper.c,245 :: 		switch(axis){
; dir start address is: 28 (R7)
J	L_SingleAxisStep31
NOP	
;Stepper.c,246 :: 		case X:
L_SingleAxisStep33:
;Stepper.c,247 :: 		DIR_StepX = dir;
_LX	
INS	R2, R7, BitPos(LATG1_bit+0), 1
; dir end address is: 28 (R7)
_SX	
;Stepper.c,248 :: 		toggleOCx(X);
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,249 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,251 :: 		while(STmr.compOCxRunning != 2);//STPS[Y].microSec < STPS[y].step_delay);
L_SingleAxisStep34:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep195
NOP	
J	L_SingleAxisStep35
NOP	
L__SingleAxisStep195:
J	L_SingleAxisStep34
NOP	
L_SingleAxisStep35:
;Stepper.c,252 :: 		break;
J	L_SingleAxisStep32
NOP	
;Stepper.c,253 :: 		case Y:
L_SingleAxisStep36:
;Stepper.c,254 :: 		DIR_StepY = dir;
; dir start address is: 28 (R7)
_LX	
INS	R2, R7, BitPos(LATD5_bit+0), 1
; dir end address is: 28 (R7)
_SX	
;Stepper.c,255 :: 		toggleOCx(Y);
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,256 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,258 :: 		while(STmr.compOCxRunning != 2);//STPS[Y].microSec < STPS[y].step_delay);
L_SingleAxisStep37:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep197
NOP	
J	L_SingleAxisStep38
NOP	
L__SingleAxisStep197:
J	L_SingleAxisStep37
NOP	
L_SingleAxisStep38:
;Stepper.c,259 :: 		break;
J	L_SingleAxisStep32
NOP	
;Stepper.c,260 :: 		case Z:
L_SingleAxisStep39:
;Stepper.c,261 :: 		DIR_StepZ = dir;
; dir start address is: 28 (R7)
_LX	
INS	R2, R7, BitPos(LATG12_bit+0), 1
; dir end address is: 28 (R7)
_SX	
;Stepper.c,262 :: 		toggleOCx(Z);
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,263 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,265 :: 		while(STmr.compOCxRunning != 2);//STPS[Y].microSec < STPS[y].step_delay);
L_SingleAxisStep40:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep199
NOP	
J	L_SingleAxisStep41
NOP	
L__SingleAxisStep199:
J	L_SingleAxisStep40
NOP	
L_SingleAxisStep41:
;Stepper.c,266 :: 		break;
J	L_SingleAxisStep32
NOP	
;Stepper.c,267 :: 		default: break;
L_SingleAxisStep42:
J	L_SingleAxisStep32
NOP	
;Stepper.c,268 :: 		}
L_SingleAxisStep31:
; dir start address is: 28 (R7)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep201
NOP	
J	L_SingleAxisStep33
NOP	
L__SingleAxisStep201:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep203
NOP	
J	L_SingleAxisStep36
NOP	
L__SingleAxisStep203:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep205
NOP	
J	L_SingleAxisStep39
NOP	
L__SingleAxisStep205:
; dir end address is: 28 (R7)
J	L_SingleAxisStep42
NOP	
L_SingleAxisStep32:
;Stepper.c,270 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Stepper.c,272 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Stepper.c,275 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+36)(GP)
;Stepper.c,276 :: 		d2 = 0;
SW	R0, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,278 :: 		SV.px = 0;
SW	R0, Offset(_SV+24)(GP)
;Stepper.c,279 :: 		SV.py = 0;
SW	R0, Offset(_SV+28)(GP)
;Stepper.c,280 :: 		SV.pz = 0;
SW	R0, Offset(_SV+32)(GP)
;Stepper.c,285 :: 		switch(axis_combo){
J	L_DualAxisStep43
NOP	
;Stepper.c,286 :: 		case xy:
L_DualAxisStep45:
;Stepper.c,287 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,288 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,290 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep207
NOP	
J	L_DualAxisStep46
NOP	
L__DualAxisStep207:
; ?FLOC___DualAxisStep?T359 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T359 end address is: 12 (R3)
J	L_DualAxisStep47
NOP	
L_DualAxisStep46:
; ?FLOC___DualAxisStep?T359 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T359 end address is: 12 (R3)
L_DualAxisStep47:
; ?FLOC___DualAxisStep?T359 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T359 end address is: 12 (R3)
SH	R2, Offset(_SV+48)(GP)
;Stepper.c,291 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep208
NOP	
J	L_DualAxisStep48
NOP	
L__DualAxisStep208:
; ?FLOC___DualAxisStep?T361 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T361 end address is: 12 (R3)
J	L_DualAxisStep49
NOP	
L_DualAxisStep48:
; ?FLOC___DualAxisStep?T361 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T361 end address is: 12 (R3)
L_DualAxisStep49:
; ?FLOC___DualAxisStep?T361 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T361 end address is: 12 (R3)
SH	R2, Offset(_SV+50)(GP)
;Stepper.c,293 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+48)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep209
NOP	
J	L_DualAxisStep50
NOP	
L__DualAxisStep209:
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
J	L_DualAxisStep51
NOP	
L_DualAxisStep50:
;Stepper.c,294 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
L_DualAxisStep51:
;Stepper.c,295 :: 		if(SV.diry < 0) DIR_StepY = CCW;
LH	R2, Offset(_SV+50)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep210
NOP	
J	L_DualAxisStep52
NOP	
L__DualAxisStep210:
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_DualAxisStep53
NOP	
L_DualAxisStep52:
;Stepper.c,296 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_DualAxisStep53:
;Stepper.c,297 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+12)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,298 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,300 :: 		if(SV.dx > SV.dy) d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep211
NOP	
J	L_DualAxisStep54
NOP	
L__DualAxisStep211:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep55
NOP	
L_DualAxisStep54:
;Stepper.c,301 :: 		else d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
L_DualAxisStep55:
;Stepper.c,302 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep212
NOP	
J	L_DualAxisStep56
NOP	
L__DualAxisStep212:
;Stepper.c,303 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,304 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep213
NOP	
J	L_DualAxisStep57
NOP	
L__DualAxisStep213:
;Stepper.c,305 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count)/*(i=0; i < SV.dx; ++i)*/{
SW	R0, Offset(_STPS+32)(GP)
L_DualAxisStep58:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep214
NOP	
J	L_DualAxisStep59
NOP	
L__DualAxisStep214:
;Stepper.c,306 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,307 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,308 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,309 :: 		if(d2 < 0)d2 += 2*SV.dy;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep215
NOP	
J	L_DualAxisStep61
NOP	
L__DualAxisStep215:
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep62
NOP	
L_DualAxisStep61:
;Stepper.c,311 :: 		d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,312 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,313 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,314 :: 		}
L_DualAxisStep62:
;Stepper.c,316 :: 		while(STmr.compOCxRunning != 1);//STPS[X].microSec < STPS[X].step_delay);
L_DualAxisStep63:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep217
NOP	
J	L_DualAxisStep64
NOP	
L__DualAxisStep217:
J	L_DualAxisStep63
NOP	
L_DualAxisStep64:
;Stepper.c,305 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count)/*(i=0; i < SV.dx; ++i)*/{
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,317 :: 		}
J	L_DualAxisStep58
NOP	
L_DualAxisStep59:
;Stepper.c,318 :: 		}else{
J	L_DualAxisStep65
NOP	
L_DualAxisStep57:
;Stepper.c,319 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count)/*(i=0;i < SV.dy;++i)*/{
SW	R0, Offset(_STPS+96)(GP)
L_DualAxisStep66:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+96)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep218
NOP	
J	L_DualAxisStep67
NOP	
L__DualAxisStep218:
;Stepper.c,320 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,321 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,322 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,323 :: 		if(d2 < 0)d2 += 2 * SV.dx;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep219
NOP	
J	L_DualAxisStep69
NOP	
L__DualAxisStep219:
LW	R2, Offset(_SV+12)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep70
NOP	
L_DualAxisStep69:
;Stepper.c,325 :: 		d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,326 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,327 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,328 :: 		}
L_DualAxisStep70:
;Stepper.c,330 :: 		while(STmr.compOCxRunning != 2);//STPS[Y].microSec < STPS[y].step_delay);
L_DualAxisStep71:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep221
NOP	
J	L_DualAxisStep72
NOP	
L__DualAxisStep221:
J	L_DualAxisStep71
NOP	
L_DualAxisStep72:
;Stepper.c,319 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count)/*(i=0;i < SV.dy;++i)*/{
LW	R2, Offset(_STPS+96)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+96)(GP)
;Stepper.c,331 :: 		}
J	L_DualAxisStep66
NOP	
L_DualAxisStep67:
;Stepper.c,332 :: 		}
L_DualAxisStep65:
;Stepper.c,333 :: 		}
L_DualAxisStep56:
;Stepper.c,334 :: 		break;
J	L_DualAxisStep44
NOP	
;Stepper.c,335 :: 		case xz:
L_DualAxisStep73:
;Stepper.c,336 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,337 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,339 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep222
NOP	
J	L_DualAxisStep74
NOP	
L__DualAxisStep222:
; ?FLOC___DualAxisStep?T398 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T398 end address is: 12 (R3)
J	L_DualAxisStep75
NOP	
L_DualAxisStep74:
; ?FLOC___DualAxisStep?T398 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T398 end address is: 12 (R3)
L_DualAxisStep75:
; ?FLOC___DualAxisStep?T398 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T398 end address is: 12 (R3)
SH	R2, Offset(_SV+48)(GP)
;Stepper.c,340 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep223
NOP	
J	L_DualAxisStep76
NOP	
L__DualAxisStep223:
; ?FLOC___DualAxisStep?T400 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T400 end address is: 12 (R3)
J	L_DualAxisStep77
NOP	
L_DualAxisStep76:
; ?FLOC___DualAxisStep?T400 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T400 end address is: 12 (R3)
L_DualAxisStep77:
; ?FLOC___DualAxisStep?T400 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T400 end address is: 12 (R3)
SH	R2, Offset(_SV+52)(GP)
;Stepper.c,342 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+48)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep224
NOP	
J	L_DualAxisStep78
NOP	
L__DualAxisStep224:
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
J	L_DualAxisStep79
NOP	
L_DualAxisStep78:
;Stepper.c,343 :: 		else DIR_StepX = CW;
LUI	R2, BitMask(LATG1_bit+0)
ORI	R2, R2, BitMask(LATG1_bit+0)
_SX	
L_DualAxisStep79:
;Stepper.c,344 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+52)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep225
NOP	
J	L_DualAxisStep80
NOP	
L__DualAxisStep225:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_DualAxisStep81
NOP	
L_DualAxisStep80:
;Stepper.c,345 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_DualAxisStep81:
;Stepper.c,346 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+12)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+12)(GP)
;Stepper.c,347 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,349 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep226
NOP	
J	L_DualAxisStep82
NOP	
L__DualAxisStep226:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep83
NOP	
L_DualAxisStep82:
;Stepper.c,350 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
L_DualAxisStep83:
;Stepper.c,351 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep227
NOP	
J	L_DualAxisStep84
NOP	
L__DualAxisStep227:
;Stepper.c,352 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,353 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+12)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep228
NOP	
J	L_DualAxisStep85
NOP	
L__DualAxisStep228:
;Stepper.c,354 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count)/*(i=0; i < SV.dx; ++i)*/{
SW	R0, Offset(_STPS+32)(GP)
L_DualAxisStep86:
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep229
NOP	
J	L_DualAxisStep87
NOP	
L__DualAxisStep229:
;Stepper.c,355 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,356 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,357 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,358 :: 		if(d2 < 0)d2 += 2*SV.dz;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep230
NOP	
J	L_DualAxisStep89
NOP	
L__DualAxisStep230:
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep90
NOP	
L_DualAxisStep89:
;Stepper.c,360 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+12)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,361 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,362 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,363 :: 		}
L_DualAxisStep90:
;Stepper.c,365 :: 		while(STmr.compOCxRunning != 1);//STPS[X].microSec < STPS[X].step_delay);
L_DualAxisStep91:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep232
NOP	
J	L_DualAxisStep92
NOP	
L__DualAxisStep232:
J	L_DualAxisStep91
NOP	
L_DualAxisStep92:
;Stepper.c,354 :: 		for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count)/*(i=0; i < SV.dx; ++i)*/{
LW	R2, Offset(_STPS+32)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+32)(GP)
;Stepper.c,366 :: 		}
J	L_DualAxisStep86
NOP	
L_DualAxisStep87:
;Stepper.c,367 :: 		}else{
J	L_DualAxisStep93
NOP	
L_DualAxisStep85:
;Stepper.c,368 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dy; ++STPS[Z].step_count)/*(i=0;i < SV.dy;++i)*/{
SW	R0, Offset(_STPS+160)(GP)
L_DualAxisStep94:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+160)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep233
NOP	
J	L_DualAxisStep95
NOP	
L__DualAxisStep233:
;Stepper.c,369 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,370 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,371 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,372 :: 		if(d2 < 0)d2 += 2 * SV.dx;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep234
NOP	
J	L_DualAxisStep97
NOP	
L__DualAxisStep234:
LW	R2, Offset(_SV+12)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep98
NOP	
L_DualAxisStep97:
;Stepper.c,374 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+12)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,375 :: 		toggleOCx(X);
SW	R25, 8(SP)
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Stepper.c,376 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,377 :: 		}
L_DualAxisStep98:
;Stepper.c,379 :: 		while(STmr.compOCxRunning != 2);//STPS[Y].microSec < STPS[Z].step_delay);
L_DualAxisStep99:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep236
NOP	
J	L_DualAxisStep100
NOP	
L__DualAxisStep236:
J	L_DualAxisStep99
NOP	
L_DualAxisStep100:
;Stepper.c,368 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dy; ++STPS[Z].step_count)/*(i=0;i < SV.dy;++i)*/{
LW	R2, Offset(_STPS+160)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+160)(GP)
;Stepper.c,380 :: 		}
J	L_DualAxisStep94
NOP	
L_DualAxisStep95:
;Stepper.c,381 :: 		}
L_DualAxisStep93:
;Stepper.c,382 :: 		}
L_DualAxisStep84:
;Stepper.c,383 :: 		break;
J	L_DualAxisStep44
NOP	
;Stepper.c,384 :: 		case yz:
L_DualAxisStep101:
;Stepper.c,385 :: 		SV.dy   = newx - SV.pz;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,386 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+28)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,388 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep237
NOP	
J	L_DualAxisStep102
NOP	
L__DualAxisStep237:
; ?FLOC___DualAxisStep?T437 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T437 end address is: 12 (R3)
J	L_DualAxisStep103
NOP	
L_DualAxisStep102:
; ?FLOC___DualAxisStep?T437 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T437 end address is: 12 (R3)
L_DualAxisStep103:
; ?FLOC___DualAxisStep?T437 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T437 end address is: 12 (R3)
SH	R2, Offset(_SV+50)(GP)
;Stepper.c,389 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep238
NOP	
J	L_DualAxisStep104
NOP	
L__DualAxisStep238:
; ?FLOC___DualAxisStep?T439 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T439 end address is: 12 (R3)
J	L_DualAxisStep105
NOP	
L_DualAxisStep104:
; ?FLOC___DualAxisStep?T439 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T439 end address is: 12 (R3)
L_DualAxisStep105:
; ?FLOC___DualAxisStep?T439 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T439 end address is: 12 (R3)
SH	R2, Offset(_SV+52)(GP)
;Stepper.c,391 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+50)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep239
NOP	
J	L_DualAxisStep106
NOP	
L__DualAxisStep239:
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
J	L_DualAxisStep107
NOP	
L_DualAxisStep106:
;Stepper.c,392 :: 		else DIR_StepY = CW;
LUI	R2, BitMask(LATD5_bit+0)
ORI	R2, R2, BitMask(LATD5_bit+0)
_SX	
L_DualAxisStep107:
;Stepper.c,393 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+52)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep240
NOP	
J	L_DualAxisStep108
NOP	
L__DualAxisStep240:
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
J	L_DualAxisStep109
NOP	
L_DualAxisStep108:
;Stepper.c,394 :: 		else DIR_StepZ = CW;
LUI	R2, BitMask(LATG12_bit+0)
ORI	R2, R2, BitMask(LATG12_bit+0)
_SX	
L_DualAxisStep109:
;Stepper.c,395 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Stepper.c,396 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Stepper.c,398 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep241
NOP	
J	L_DualAxisStep110
NOP	
L__DualAxisStep241:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep111
NOP	
L_DualAxisStep110:
;Stepper.c,399 :: 		else d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
L_DualAxisStep111:
;Stepper.c,400 :: 		if(SV.Tog == 0){  //? round this start up bit
LH	R2, Offset(_SV+2)(GP)
BEQ	R2, R0, L__DualAxisStep242
NOP	
J	L_DualAxisStep112
NOP	
L__DualAxisStep242:
;Stepper.c,401 :: 		LATE7_bit = 1;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,402 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep243
NOP	
J	L_DualAxisStep113
NOP	
L__DualAxisStep243:
;Stepper.c,403 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count)/*(i=0; i < SV.dx; ++i)*/{
SW	R0, Offset(_STPS+96)(GP)
L_DualAxisStep114:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+96)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep244
NOP	
J	L_DualAxisStep115
NOP	
L__DualAxisStep244:
;Stepper.c,404 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,405 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,406 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,407 :: 		if(d2 < 0)d2 += 2*SV.dz;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep245
NOP	
J	L_DualAxisStep117
NOP	
L__DualAxisStep245:
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep118
NOP	
L_DualAxisStep117:
;Stepper.c,409 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,410 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,411 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,412 :: 		}
L_DualAxisStep118:
;Stepper.c,414 :: 		while(STmr.compOCxRunning != 1);//STPS[X].microSec < STPS[X].step_delay);
L_DualAxisStep119:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep247
NOP	
J	L_DualAxisStep120
NOP	
L__DualAxisStep247:
J	L_DualAxisStep119
NOP	
L_DualAxisStep120:
;Stepper.c,403 :: 		for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count)/*(i=0; i < SV.dx; ++i)*/{
LW	R2, Offset(_STPS+96)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+96)(GP)
;Stepper.c,415 :: 		}
J	L_DualAxisStep114
NOP	
L_DualAxisStep115:
;Stepper.c,416 :: 		}else{
J	L_DualAxisStep121
NOP	
L_DualAxisStep113:
;Stepper.c,417 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dy; ++STPS[Z].step_count)/*(i=0;i < SV.dy;++i)*/{
SW	R0, Offset(_STPS+160)(GP)
L_DualAxisStep122:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+160)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__DualAxisStep248
NOP	
J	L_DualAxisStep123
NOP	
L__DualAxisStep248:
;Stepper.c,418 :: 		STmr.compOCxRunning = 0;
SH	R0, Offset(_STmr+8)(GP)
;Stepper.c,419 :: 		toggleOCx(Z);
SW	R25, 8(SP)
ORI	R25, R0, 2
JAL	_toggleOCx+0
NOP	
;Stepper.c,420 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,421 :: 		if(d2 < 0)d2 += 2 * SV.dy;
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep249
NOP	
J	L_DualAxisStep125
NOP	
L__DualAxisStep249:
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
J	L_DualAxisStep126
NOP	
L_DualAxisStep125:
;Stepper.c,423 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(DualAxisStep_d2_L0+0)(GP)
;Stepper.c,424 :: 		toggleOCx(Y);
SW	R25, 8(SP)
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Stepper.c,425 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
LW	R25, 8(SP)
;Stepper.c,426 :: 		}
L_DualAxisStep126:
;Stepper.c,428 :: 		while(STmr.compOCxRunning != 2);//STPS[Y].microSec < STPS[Z].step_delay);
L_DualAxisStep127:
LH	R3, Offset(_STmr+8)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep251
NOP	
J	L_DualAxisStep128
NOP	
L__DualAxisStep251:
J	L_DualAxisStep127
NOP	
L_DualAxisStep128:
;Stepper.c,417 :: 		for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dy; ++STPS[Z].step_count)/*(i=0;i < SV.dy;++i)*/{
LW	R2, Offset(_STPS+160)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+160)(GP)
;Stepper.c,429 :: 		}
J	L_DualAxisStep122
NOP	
L_DualAxisStep123:
;Stepper.c,430 :: 		}
L_DualAxisStep121:
;Stepper.c,431 :: 		}
L_DualAxisStep112:
;Stepper.c,433 :: 		break;
J	L_DualAxisStep44
NOP	
;Stepper.c,434 :: 		default: break;
L_DualAxisStep129:
J	L_DualAxisStep44
NOP	
;Stepper.c,436 :: 		}
L_DualAxisStep43:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep253
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep253:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep255
NOP	
J	L_DualAxisStep73
NOP	
L__DualAxisStep255:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep257
NOP	
J	L_DualAxisStep101
NOP	
L__DualAxisStep257:
J	L_DualAxisStep129
NOP	
L_DualAxisStep44:
;Stepper.c,448 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _DualAxisStep
_toggleOCx:
;Stepper.c,453 :: 		void toggleOCx(int axis_No){
;Stepper.c,454 :: 		switch(axis_No){
J	L_toggleOCx130
NOP	
;Stepper.c,455 :: 		case 0: OC5R   = 0x5;
L_toggleOCx132:
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,456 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,457 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,458 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,459 :: 		break;
J	L_toggleOCx131
NOP	
;Stepper.c,460 :: 		case 1: OC3R   = 0x5;
L_toggleOCx133:
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,461 :: 		OC3RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+72)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,462 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,463 :: 		OC3CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,464 :: 		break;
J	L_toggleOCx131
NOP	
;Stepper.c,465 :: 		case 2: OC8R   = 0x5;
L_toggleOCx134:
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,466 :: 		OC8RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+136)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,467 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,468 :: 		OC8CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,469 :: 		break;
J	L_toggleOCx131
NOP	
;Stepper.c,470 :: 		default:
L_toggleOCx135:
;Stepper.c,471 :: 		break;
J	L_toggleOCx131
NOP	
;Stepper.c,472 :: 		}
L_toggleOCx130:
SEH	R2, R25
BNE	R2, R0, L__toggleOCx260
NOP	
J	L_toggleOCx132
NOP	
L__toggleOCx260:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx262
NOP	
J	L_toggleOCx133
NOP	
L__toggleOCx262:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx264
NOP	
J	L_toggleOCx134
NOP	
L__toggleOCx264:
J	L_toggleOCx135
NOP	
L_toggleOCx131:
;Stepper.c,474 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,477 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,479 :: 		if(!STPS[axis_No].PLS_Step_ ){
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__Pulse266
NOP	
J	L_Pulse136
NOP	
L__Pulse266:
;Stepper.c,484 :: 		STPS[axis_No].PLS_Step_   = 1;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LBU	R2, 0(R3)
ORI	R2, R2, 2
SB	R2, 0(R3)
;Stepper.c,486 :: 		}
L_Pulse136:
;Stepper.c,490 :: 		switch(STPS[axis_No].run_state) {
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse137
NOP	
;Stepper.c,491 :: 		case STOP:
L_Pulse139:
;Stepper.c,492 :: 		LATE7_bit = 0;
LUI	R2, BitMask(LATE7_bit+0)
ORI	R2, R2, BitMask(LATE7_bit+0)
_SX	
;Stepper.c,493 :: 		T8IE_bit         = 0;
LUI	R2, BitMask(T8IE_bit+0)
ORI	R2, R2, BitMask(T8IE_bit+0)
_SX	
;Stepper.c,494 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+2)(GP)
;Stepper.c,495 :: 		break;
J	L_Pulse138
NOP	
;Stepper.c,497 :: 		case ACCEL:
L_Pulse140:
;Stepper.c,498 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,501 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
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
BEQ	R2, R0, L__Pulse267
NOP	
J	L_Pulse141
NOP	
L__Pulse267:
;Stepper.c,503 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,504 :: 		STPS[axis_No].run_state  = RUN;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,505 :: 		}
L_Pulse141:
;Stepper.c,506 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
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
BNE	R2, R0, L__Pulse268
NOP	
J	L_Pulse142
NOP	
L__Pulse268:
;Stepper.c,507 :: 		STPS[axis_No].run_state  = RUN;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 3
SB	R2, 0(R3)
;Stepper.c,508 :: 		}
L_Pulse142:
;Stepper.c,509 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse269
NOP	
J	L_Pulse143
NOP	
L__Pulse269:
;Stepper.c,510 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,511 :: 		STPS[axis_No].rest        = 0;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Stepper.c,512 :: 		STPS[axis_No].run_state   = DECEL;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,513 :: 		}
L_Pulse143:
;Stepper.c,514 :: 		break;
J	L_Pulse138
NOP	
;Stepper.c,516 :: 		case RUN:
L_Pulse144:
;Stepper.c,517 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 20
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,519 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
BEQ	R2, R0, L__Pulse270
NOP	
J	L_Pulse145
NOP	
L__Pulse270:
;Stepper.c,520 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,521 :: 		STPS[axis_No].rest        = 0;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
SW	R0, 0(R2)
;Stepper.c,523 :: 		STPS[axis_No].run_state   =  DECEL;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 5
ORI	R2, R0, 2
SB	R2, 0(R3)
;Stepper.c,524 :: 		}
L_Pulse145:
;Stepper.c,525 :: 		break;
J	L_Pulse138
NOP	
;Stepper.c,527 :: 		case DECEL:
L_Pulse146:
;Stepper.c,531 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,532 :: 		if(STPS[axis_No].accel_count >= -2 ){
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 24
LW	R2, 0(R2)
SLTI	R2, R2, -2
BEQ	R2, R0, L__Pulse271
NOP	
J	L_Pulse147
NOP	
L__Pulse271:
;Stepper.c,533 :: 		STPS[axis_No].run_state = STOP;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,534 :: 		}
L_Pulse147:
;Stepper.c,535 :: 		break;
J	L_Pulse138
NOP	
;Stepper.c,536 :: 		default:break;
L_Pulse148:
J	L_Pulse138
NOP	
;Stepper.c,537 :: 		}
L_Pulse137:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
BNE	R2, R0, L__Pulse273
NOP	
J	L_Pulse139
NOP	
L__Pulse273:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse275
NOP	
J	L_Pulse140
NOP	
L__Pulse275:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse277
NOP	
J	L_Pulse144
NOP	
L__Pulse277:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse279
NOP	
J	L_Pulse146
NOP	
L__Pulse279:
J	L_Pulse148
NOP	
L_Pulse138:
;Stepper.c,538 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,539 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,541 :: 		void AccDec(int axis_No){
;Stepper.c,542 :: 		STPS[axis_No].accel_count++;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 24
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,543 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
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
;Stepper.c,544 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
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
;Stepper.c,545 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
SEH	R2, R25
SLL	R3, R2, 6
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 36
LW	R2, 0(R2)
SW	R2, 0(R3)
;Stepper.c,547 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
Stepper_sqrt_:
;Stepper.c,558 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,564 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,565 :: 		q2 = 0x40000000L;           // higest possible result bit
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
;Stepper.c,566 :: 		do
J	L_Stepper_sqrt_149
NOP	
L_Stepper_sqrt_159:
;Stepper.c,580 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,566 :: 		do
L_Stepper_sqrt_149:
;Stepper.c,568 :: 		if((xr + q2) <= x)
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
BEQ	R2, R0, L_Stepper_sqrt_282
NOP	
J	L_Stepper_sqrt_152
NOP	
L_Stepper_sqrt_282:
;Stepper.c,570 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,571 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,572 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_153
NOP	
L_Stepper_sqrt_152:
;Stepper.c,574 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,575 :: 		}
L_Stepper_sqrt_153:
;Stepper.c,576 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,577 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_284
NOP	
J	L_Stepper_sqrt_160
NOP	
L_Stepper_sqrt_284:
; f end address is: 16 (R4)
;Stepper.c,578 :: 		xr += q2;               // test flag
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
;Stepper.c,579 :: 		}
J	L_Stepper_sqrt_154
NOP	
L_Stepper_sqrt_160:
;Stepper.c,577 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,579 :: 		}
L_Stepper_sqrt_154:
;Stepper.c,580 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_285
NOP	
J	L_Stepper_sqrt_159
NOP	
L_Stepper_sqrt_285:
; q2 end address is: 12 (R3)
;Stepper.c,581 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_286
NOP	
J	L_Stepper_sqrt_155
NOP	
L_Stepper_sqrt_286:
;Stepper.c,582 :: 		return xr +1;             // add for rounding
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
;Stepper.c,583 :: 		}
L_Stepper_sqrt_155:
;Stepper.c,585 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,587 :: 		}
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_min_:
;Stepper.c,594 :: 		unsigned int min_(unsigned int x, unsigned int y)
;Stepper.c,596 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_288
NOP	
J	L_min_157
NOP	
L__min_288:
;Stepper.c,597 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,598 :: 		}
L_min_157:
;Stepper.c,600 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,602 :: 		}
L_end_min_:
JR	RA
NOP	
; end of _min_
