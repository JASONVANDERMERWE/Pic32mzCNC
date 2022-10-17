_SetPinMode:
;Stepper.c,21 :: 		void SetPinMode(){
;Stepper.c,24 :: 		EN_Step_PinDirX  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirX+0), 1
_SX	
;Stepper.c,25 :: 		DIR_Step_PinDirX = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirX+0), 1
_SX	
;Stepper.c,32 :: 		EN_Step_PinDirY  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirY+0), 1
_SX	
;Stepper.c,33 :: 		DIR_Step_PinDirY = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirY+0), 1
_SX	
;Stepper.c,40 :: 		EN_Step_PinDirZ  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirZ+0), 1
_SX	
;Stepper.c,41 :: 		DIR_Step_PinDirZ = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirZ+0), 1
_SX	
;Stepper.c,48 :: 		EN_Step_PinDirA  = 0; //output
_LX	
INS	R2, R0, BitPos(EN_Step_PinDirA+0), 1
_SX	
;Stepper.c,49 :: 		DIR_Step_PinDirA = 0;
_LX	
INS	R2, R0, BitPos(DIR_Step_PinDirA+0), 1
_SX	
;Stepper.c,54 :: 		}
L_end_SetPinMode:
JR	RA
NOP	
; end of _SetPinMode
_StepperConstants:
;Stepper.c,58 :: 		void StepperConstants(long accel,long decel){
;Stepper.c,59 :: 		SV.acc = accel;
SW	R25, Offset(_SV+56)(GP)
;Stepper.c,60 :: 		SV.dec = decel;
SW	R26, Offset(_SV+60)(GP)
;Stepper.c,62 :: 		}
L_end_StepperConstants:
JR	RA
NOP	
; end of _StepperConstants
_EnStepperX:
;Stepper.c,66 :: 		void EnStepperX(){
;Stepper.c,69 :: 		EN_StepX       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepX+0), 1
_SX	
;Stepper.c,70 :: 		}
L_end_EnStepperX:
JR	RA
NOP	
; end of _EnStepperX
_EnStepperY:
;Stepper.c,72 :: 		void EnStepperY(){
;Stepper.c,75 :: 		EN_StepY       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepY+0), 1
_SX	
;Stepper.c,76 :: 		}
L_end_EnStepperY:
JR	RA
NOP	
; end of _EnStepperY
_EnStepperZ:
;Stepper.c,77 :: 		void EnStepperZ(){
;Stepper.c,80 :: 		EN_StepZ       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepZ+0), 1
_SX	
;Stepper.c,81 :: 		}
L_end_EnStepperZ:
JR	RA
NOP	
; end of _EnStepperZ
_EnStepperA:
;Stepper.c,82 :: 		void EnStepperA(){
;Stepper.c,85 :: 		EN_StepA       = 0;
_LX	
INS	R2, R0, BitPos(EN_StepA+0), 1
_SX	
;Stepper.c,86 :: 		}
L_end_EnStepperA:
JR	RA
NOP	
; end of _EnStepperA
_DisableStepper:
;Stepper.c,88 :: 		void DisableStepper(){
;Stepper.c,89 :: 		EN_StepX      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepX+0)
_SX	
;Stepper.c,90 :: 		EN_StepY      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepY+0)
_SX	
;Stepper.c,91 :: 		EN_StepZ      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepZ+0)
_SX	
;Stepper.c,92 :: 		EN_StepA      = 1;
_LX	
ORI	R2, R2, BitMask(EN_StepA+0)
_SX	
;Stepper.c,93 :: 		}
L_end_DisableStepper:
JR	RA
NOP	
; end of _DisableStepper
_speed_cntr_Move:
;Stepper.c,111 :: 		void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Stepper.c,114 :: 		long abs_mmSteps = abs(mmSteps);
SW	R25, 4(SP)
JAL	_abs+0
NOP	
; abs_mmSteps start address is: 24 (R6)
SEH	R6, R2
;Stepper.c,118 :: 		if(mmSteps == 1){
ORI	R2, R0, 1
<<<<<<< HEAD
BEQ	R25, R2, L__speed_cntr_Move149
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move149:
=======
BEQ	R25, R2, L__speed_cntr_Move162
NOP	
J	L_speed_cntr_Move0
NOP	
L__speed_cntr_Move162:
>>>>>>> patch2
; abs_mmSteps end address is: 24 (R6)
;Stepper.c,119 :: 		STPS[axis_No].accel_count = -1;        // Move one step...
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
;Stepper.c,120 :: 		STPS[axis_No].run_state = DECEL;       // ...in DECEL state.
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
;Stepper.c,121 :: 		STPS[axis_No].step_delay = 20000;      // Just a short delay so main() can act on 'running'.
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
;Stepper.c,122 :: 		SV.running = 1;                        // start running
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+2)(GP)
;Stepper.c,124 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
J	L_speed_cntr_Move1
NOP	
L_speed_cntr_Move0:
; abs_mmSteps start address is: 24 (R6)
<<<<<<< HEAD
BNE	R25, R0, L__speed_cntr_Move151
=======
BNE	R25, R0, L__speed_cntr_Move164
NOP	
J	L__speed_cntr_Move129
NOP	
L__speed_cntr_Move164:
ORI	R2, R0, 1
BNE	R6, R2, L__speed_cntr_Move166
>>>>>>> patch2
NOP	
J	L__speed_cntr_Move128
NOP	
<<<<<<< HEAD
L__speed_cntr_Move151:
ORI	R2, R0, 1
BNE	R6, R2, L__speed_cntr_Move153
NOP	
J	L__speed_cntr_Move123
NOP	
L__speed_cntr_Move153:
L__speed_cntr_Move122:
;Stepper.c,129 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
=======
L__speed_cntr_Move166:
L__speed_cntr_Move127:
;Stepper.c,128 :: 		STPS[axis_No].min_delay =  A_T_x100 / speed;
>>>>>>> patch2
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 20
LUI	R2, 39
ORI	R2, R2, 55125
DIV	R2, R26
MFLO	R2
SW	R2, 0(R3)
;Stepper.c,133 :: 		STPS[axis_No].step_delay = abs(T1_FREQ_148 * ((sqrt_(A_SQ / SV.acc))/100));
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
LUI	R2, 10199
ORI	R2, R2, 21760
DIV	R2, R3
MFLO	R2
SW	R25, 8(SP)
MOVZ	R25, R2, R0
JAL	Stepper_sqrt_+0
NOP	
ORI	R3, R0, 100
DIVU	R2, R3
MFLO	R3
ORI	R2, R0, 5281
MULTU	R3, R2
MFLO	R2
SEH	R25, R2
JAL	_abs+0
NOP	
LW	R25, 8(SP)
SEH	R3, R2
LW	R2, 12(SP)
SW	R3, 0(R2)
;Stepper.c,134 :: 		STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;
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
;Stepper.c,137 :: 		STPS[axis_No].max_step_lim =(speed*speed)/(long)(2.0*ALPHA*(double)SV.acc*100.0);
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
LUI	R2, 15752
ORI	R2, R2, 58531
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
;Stepper.c,143 :: 		if(STPS[axis_No].max_step_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 52
LW	R2, 0(R2)
<<<<<<< HEAD
BEQ	R2, R0, L__speed_cntr_Move154
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move154:
;Stepper.c,145 :: 		STPS[axis_No].max_step_lim = 1;
=======
BEQ	R2, R0, L__speed_cntr_Move167
NOP	
J	L_speed_cntr_Move5
NOP	
L__speed_cntr_Move167:
;Stepper.c,144 :: 		STPS[axis_No].max_step_lim = 1;
>>>>>>> patch2
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
;Stepper.c,145 :: 		}
L_speed_cntr_Move5:
;Stepper.c,149 :: 		STPS[axis_No].accel_lim = (abs_mmSteps * SV.dec) / (SV.acc + SV.dec);
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R5, R2, 48
LW	R2, Offset(_SV+60)(GP)
MUL	R4, R6, R2
; abs_mmSteps end address is: 24 (R6)
LW	R3, Offset(_SV+60)(GP)
LW	R2, Offset(_SV+56)(GP)
ADDU	R2, R2, R3
DIV	R4, R2
MFLO	R2
SW	R2, 0(R5)
;Stepper.c,151 :: 		if(STPS[axis_No].accel_lim == 0){
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 48
LW	R2, 0(R2)
<<<<<<< HEAD
BEQ	R2, R0, L__speed_cntr_Move155
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move155:
;Stepper.c,153 :: 		STPS[axis_No].accel_lim = 1;
=======
BEQ	R2, R0, L__speed_cntr_Move168
NOP	
J	L_speed_cntr_Move6
NOP	
L__speed_cntr_Move168:
;Stepper.c,152 :: 		STPS[axis_No].accel_lim = 1;
>>>>>>> patch2
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
;Stepper.c,153 :: 		}
L_speed_cntr_Move6:
;Stepper.c,156 :: 		if(STPS[axis_No].accel_lim < STPS[axis_No].max_step_lim){
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
SLT	R2, R3, R2
<<<<<<< HEAD
BNE	R2, R0, L__speed_cntr_Move156
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move156:
;Stepper.c,158 :: 		STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps;//-(abs_mmSteps - STPS[axis_No].max_step_lim);
=======
BNE	R2, R0, L__speed_cntr_Move169
NOP	
J	L_speed_cntr_Move7
NOP	
L__speed_cntr_Move169:
;Stepper.c,157 :: 		STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps;//-(abs_mmSteps - STPS[axis_No].max_step_lim);
>>>>>>> patch2
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
;Stepper.c,158 :: 		}else{
J	L_speed_cntr_Move8
NOP	
L_speed_cntr_Move7:
;Stepper.c,159 :: 		STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim *SV.acc)/SV.dec);
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
;Stepper.c,160 :: 		}
L_speed_cntr_Move8:
;Stepper.c,162 :: 		if(STPS[axis_No].decel_val == 0)
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LW	R2, 0(R2)
<<<<<<< HEAD
BEQ	R2, R0, L__speed_cntr_Move157
NOP	
J	L_speed_cntr_Move9
NOP	
L__speed_cntr_Move157:
;Stepper.c,164 :: 		STPS[axis_No].decel_val = -1;
=======
BEQ	R2, R0, L__speed_cntr_Move170
NOP	
J	L_speed_cntr_Move9
NOP	
L__speed_cntr_Move170:
;Stepper.c,163 :: 		STPS[axis_No].decel_val = -1;
>>>>>>> patch2
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
L_speed_cntr_Move9:
;Stepper.c,166 :: 		if(mmSteps < 0){
SLTI	R2, R25, 0
<<<<<<< HEAD
BNE	R2, R0, L__speed_cntr_Move158
NOP	
J	L_speed_cntr_Move10
NOP	
L__speed_cntr_Move158:
;Stepper.c,168 :: 		STPS[axis_No].decel_start = -(mmSteps - STPS[axis_No].decel_val);
=======
BNE	R2, R0, L__speed_cntr_Move171
NOP	
J	L_speed_cntr_Move10
NOP	
L__speed_cntr_Move171:
;Stepper.c,167 :: 		STPS[axis_No].decel_start = -(mmSteps - STPS[axis_No].decel_val);
>>>>>>> patch2
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 12
ADDIU	R2, R2, 16
LW	R2, 0(R2)
SUBU	R3, R25, R2
MOVZ	R2, R0, R0
SUBU	R2, R2, R3
SW	R2, 0(R4)
;Stepper.c,168 :: 		}
J	L_speed_cntr_Move11
NOP	
L_speed_cntr_Move10:
;Stepper.c,170 :: 		STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
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
;Stepper.c,171 :: 		}
L_speed_cntr_Move11:
;Stepper.c,176 :: 		if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
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
<<<<<<< HEAD
BEQ	R2, R0, L__speed_cntr_Move159
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move159:
;Stepper.c,178 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
=======
BEQ	R2, R0, L__speed_cntr_Move172
NOP	
J	L_speed_cntr_Move12
NOP	
L__speed_cntr_Move172:
;Stepper.c,177 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
>>>>>>> patch2
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
;Stepper.c,178 :: 		STPS[axis_No].run_state = RUN;
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
;Stepper.c,179 :: 		}else{
J	L_speed_cntr_Move13
NOP	
L_speed_cntr_Move12:
;Stepper.c,180 :: 		STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
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
;Stepper.c,181 :: 		STPS[axis_No].run_state = ACCEL;
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
;Stepper.c,182 :: 		}
L_speed_cntr_Move13:
<<<<<<< HEAD
;Stepper.c,125 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
L__speed_cntr_Move124:
L__speed_cntr_Move123:
;Stepper.c,185 :: 		}
=======
;Stepper.c,124 :: 		}else if((mmSteps != 0)&&(abs_mmSteps != 1)){
L__speed_cntr_Move129:
L__speed_cntr_Move128:
;Stepper.c,184 :: 		}
>>>>>>> patch2
L_speed_cntr_Move1:
;Stepper.c,186 :: 		STPS[axis_No].step_count  = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Stepper.c,187 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,188 :: 		STPS[axis_No].microSec    = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Stepper.c,189 :: 		STPS[axis_No].accel_count = 1;
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
;Stepper.c,190 :: 		STPS[axis_No].dist        = 0;
SEH	R3, R27
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R0, 0(R2)
;Stepper.c,191 :: 		SV.Tog   = 0;
SH	R0, Offset(_SV+4)(GP)
;Stepper.c,192 :: 		SV.running = 1;
LBU	R2, Offset(_SV+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+2)(GP)
;Stepper.c,216 :: 		}
L_end_speed_cntr_Move:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _speed_cntr_Move
_Step_Cycle:
;Stepper.c,225 :: 		void Step_Cycle(int axis_No){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Stepper.c,227 :: 		STPS[axis_No].step_count++;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 32
LW	R2, 0(R3)
ADDIU	R2, R2, 1
SW	R2, 0(R3)
;Stepper.c,229 :: 		sys.steps_position[axis_No] += sys.axis_dir[axis_No];
SEH	R2, R25
SLL	R3, R2, 2
LUI	R2, hi_addr(_sys+16)
ORI	R2, R2, lo_addr(_sys+16)
ADDU	R4, R2, R3
SEH	R2, R25
SLL	R3, R2, 1
LUI	R2, hi_addr(_sys+0)
ORI	R2, R2, lo_addr(_sys+0)
ADDU	R2, R2, R3
LH	R2, 0(R2)
LW	R3, 0(R4)
SEH	R2, R2
ADDU	R2, R3, R2
SW	R2, 0(R4)
;Stepper.c,230 :: 		toggleOCx(axis_No);
JAL	_toggleOCx+0
NOP	
;Stepper.c,231 :: 		}
L_end_Step_Cycle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Step_Cycle
_toggleOCx:
;Stepper.c,235 :: 		void toggleOCx(int axis_No){
;Stepper.c,236 :: 		switch(axis_No){
J	L_toggleOCx14
NOP	
;Stepper.c,237 :: 		case X:
L_toggleOCx16:
;Stepper.c,238 :: 		OC5R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC5R+0)(GP)
;Stepper.c,239 :: 		OC5RS  = STPS[X].step_delay & 0xFFFF;//0x234;
LW	R2, Offset(_STPS+8)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC5RS+0)(GP)
;Stepper.c,240 :: 		TMR2   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR2+0)(GP)
;Stepper.c,241 :: 		OC5CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC5CON+0)(GP)
;Stepper.c,242 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,243 :: 		case Y:
L_toggleOCx17:
;Stepper.c,244 :: 		OC2R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC2R+0)(GP)
;Stepper.c,245 :: 		OC2RS  = STPS[Y].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+76)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC2RS+0)(GP)
;Stepper.c,246 :: 		TMR4   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR4+0)(GP)
;Stepper.c,247 :: 		OC2CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC2CON+0)(GP)
;Stepper.c,248 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,249 :: 		case Z:
L_toggleOCx18:
;Stepper.c,250 :: 		OC7R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC7R+0)(GP)
;Stepper.c,251 :: 		OC7RS  = STPS[Z].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+144)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC7RS+0)(GP)
;Stepper.c,252 :: 		TMR6   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR6+0)(GP)
;Stepper.c,253 :: 		OC7CON =  0x8004; //restart the output compare module
ORI	R2, R0, 32772
SW	R2, Offset(OC7CON+0)(GP)
;Stepper.c,254 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,255 :: 		case A:
L_toggleOCx19:
;Stepper.c,256 :: 		OC3R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC3R+0)(GP)
;Stepper.c,257 :: 		OC3RS  = STPS[A].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+212)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC3RS+0)(GP)
;Stepper.c,258 :: 		TMR5   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR5+0)(GP)
;Stepper.c,259 :: 		OC3CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC3CON+0)(GP)
;Stepper.c,260 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,261 :: 		case B:
L_toggleOCx20:
;Stepper.c,262 :: 		OC6R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC6R+0)(GP)
;Stepper.c,263 :: 		OC6RS  = STPS[B].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+280)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC6RS+0)(GP)
;Stepper.c,264 :: 		TMR3   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR3+0)(GP)
;Stepper.c,265 :: 		OC6CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC6CON+0)(GP)
;Stepper.c,266 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,267 :: 		case C:
L_toggleOCx21:
;Stepper.c,268 :: 		OC8R   = 0x5;
ORI	R2, R0, 5
SW	R2, Offset(OC8R+0)(GP)
;Stepper.c,269 :: 		OC8RS  = STPS[C].step_delay & 0xFFFF;
LW	R2, Offset(_STPS+348)(GP)
ANDI	R2, R2, 65535
SW	R2, Offset(OC8RS+0)(GP)
;Stepper.c,270 :: 		TMR7   =  0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(TMR7+0)(GP)
;Stepper.c,271 :: 		OC8CON =  0x800C; //restart the output compare module
ORI	R2, R0, 32780
SW	R2, Offset(OC8CON+0)(GP)
;Stepper.c,272 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,273 :: 		default:
L_toggleOCx22:
;Stepper.c,274 :: 		break;
J	L_toggleOCx15
NOP	
;Stepper.c,275 :: 		}
L_toggleOCx14:
SEH	R2, R25
<<<<<<< HEAD
BNE	R2, R0, L__toggleOCx163
NOP	
J	L_toggleOCx16
NOP	
L__toggleOCx163:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx165
NOP	
J	L_toggleOCx17
NOP	
L__toggleOCx165:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx167
NOP	
J	L_toggleOCx18
NOP	
L__toggleOCx167:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__toggleOCx169
NOP	
J	L_toggleOCx19
NOP	
L__toggleOCx169:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__toggleOCx171
NOP	
J	L_toggleOCx20
NOP	
L__toggleOCx171:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__toggleOCx173
NOP	
J	L_toggleOCx21
NOP	
L__toggleOCx173:
=======
BNE	R2, R0, L__toggleOCx176
NOP	
J	L_toggleOCx16
NOP	
L__toggleOCx176:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__toggleOCx178
NOP	
J	L_toggleOCx17
NOP	
L__toggleOCx178:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__toggleOCx180
NOP	
J	L_toggleOCx18
NOP	
L__toggleOCx180:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__toggleOCx182
NOP	
J	L_toggleOCx19
NOP	
L__toggleOCx182:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__toggleOCx184
NOP	
J	L_toggleOCx20
NOP	
L__toggleOCx184:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__toggleOCx186
NOP	
J	L_toggleOCx21
NOP	
L__toggleOCx186:
>>>>>>> patch2
J	L_toggleOCx22
NOP	
L_toggleOCx15:
;Stepper.c,277 :: 		}
L_end_toggleOCx:
JR	RA
NOP	
; end of _toggleOCx
_Pulse:
;Stepper.c,281 :: 		int Pulse(int axis_No){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,287 :: 		switch(STPS[axis_No].run_state) {
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SW	R2, 4(SP)
J	L_Pulse23
NOP	
;Stepper.c,288 :: 		case STOP:
L_Pulse25:
;Stepper.c,289 :: 		SV.Tog = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+4)(GP)
;Stepper.c,290 :: 		break;
J	L_Pulse24
NOP	
;Stepper.c,292 :: 		case ACCEL:
L_Pulse26:
;Stepper.c,297 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,298 :: 		if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){
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
<<<<<<< HEAD
BEQ	R2, R0, L__Pulse175
NOP	
J	L_Pulse27
NOP	
L__Pulse175:
;Stepper.c,296 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
=======
BEQ	R2, R0, L__Pulse188
NOP	
J	L_Pulse27
NOP	
L__Pulse188:
;Stepper.c,300 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
>>>>>>> patch2
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
;Stepper.c,301 :: 		STPS[axis_No].run_state  = RUN;
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
;Stepper.c,302 :: 		}
L_Pulse27:
;Stepper.c,303 :: 		if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
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
<<<<<<< HEAD
BNE	R2, R0, L__Pulse176
NOP	
J	L_Pulse28
NOP	
L__Pulse176:
;Stepper.c,300 :: 		STPS[axis_No].run_state  = RUN;
=======
BNE	R2, R0, L__Pulse189
NOP	
J	L_Pulse28
NOP	
L__Pulse189:
;Stepper.c,304 :: 		STPS[axis_No].run_state  = RUN;
>>>>>>> patch2
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
;Stepper.c,305 :: 		}
L_Pulse28:
;Stepper.c,306 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
<<<<<<< HEAD
BEQ	R2, R0, L__Pulse177
NOP	
J	L_Pulse29
NOP	
L__Pulse177:
;Stepper.c,303 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
=======
BEQ	R2, R0, L__Pulse190
NOP	
J	L_Pulse29
NOP	
L__Pulse190:
;Stepper.c,307 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
>>>>>>> patch2
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
;Stepper.c,308 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,309 :: 		STPS[axis_No].run_state   = DECEL;
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
;Stepper.c,310 :: 		}
L_Pulse29:
;Stepper.c,311 :: 		break;
J	L_Pulse24
NOP	
;Stepper.c,313 :: 		case RUN:
L_Pulse30:
;Stepper.c,314 :: 		STPS[axis_No].step_delay = STPS[axis_No].min_delay;
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
;Stepper.c,316 :: 		if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
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
<<<<<<< HEAD
BEQ	R2, R0, L__Pulse178
NOP	
J	L_Pulse31
NOP	
L__Pulse178:
;Stepper.c,313 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
=======
BEQ	R2, R0, L__Pulse191
NOP	
J	L_Pulse31
NOP	
L__Pulse191:
;Stepper.c,317 :: 		STPS[axis_No].accel_count = STPS[axis_No].decel_val;
>>>>>>> patch2
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
;Stepper.c,318 :: 		STPS[axis_No].rest        = 0;
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 56
SW	R0, 0(R2)
;Stepper.c,320 :: 		STPS[axis_No].run_state   =  DECEL;
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
;Stepper.c,321 :: 		}
L_Pulse31:
;Stepper.c,322 :: 		break;
J	L_Pulse24
NOP	
;Stepper.c,324 :: 		case DECEL:
L_Pulse32:
;Stepper.c,329 :: 		AccDec(axis_No);
JAL	_AccDec+0
NOP	
;Stepper.c,333 :: 		if(STPS[axis_No].accel_count > -1 ){
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
<<<<<<< HEAD
BEQ	R2, R0, L__Pulse179
NOP	
J	L_Pulse33
NOP	
L__Pulse179:
;Stepper.c,330 :: 		STPS[axis_No].run_state = STOP;
=======
BEQ	R2, R0, L__Pulse192
NOP	
J	L_Pulse33
NOP	
L__Pulse192:
;Stepper.c,334 :: 		STPS[axis_No].run_state = STOP;
>>>>>>> patch2
SEH	R3, R25
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 5
SB	R0, 0(R2)
;Stepper.c,335 :: 		}
L_Pulse33:
;Stepper.c,336 :: 		break;
J	L_Pulse24
NOP	
;Stepper.c,337 :: 		default:break;
L_Pulse34:
J	L_Pulse24
NOP	
;Stepper.c,338 :: 		}
L_Pulse23:
LW	R4, 4(SP)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
<<<<<<< HEAD
BNE	R2, R0, L__Pulse181
NOP	
J	L_Pulse25
NOP	
L__Pulse181:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse183
NOP	
J	L_Pulse26
NOP	
L__Pulse183:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse185
NOP	
J	L_Pulse30
NOP	
L__Pulse185:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse187
NOP	
J	L_Pulse32
NOP	
L__Pulse187:
=======
BNE	R2, R0, L__Pulse194
NOP	
J	L_Pulse25
NOP	
L__Pulse194:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Pulse196
NOP	
J	L_Pulse26
NOP	
L__Pulse196:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Pulse198
NOP	
J	L_Pulse30
NOP	
L__Pulse198:
LBU	R2, 0(R4)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Pulse200
NOP	
J	L_Pulse32
NOP	
L__Pulse200:
>>>>>>> patch2
J	L_Pulse34
NOP	
L_Pulse24:
;Stepper.c,339 :: 		return axis_No;
SEH	R2, R25
;Stepper.c,340 :: 		}
L_end_Pulse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Pulse
_AccDec:
;Stepper.c,344 :: 		void AccDec(int axis_No){
;Stepper.c,345 :: 		STPS[axis_No].accel_count++;
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
;Stepper.c,346 :: 		STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
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
;Stepper.c,347 :: 		STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
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
;Stepper.c,348 :: 		STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;
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
;Stepper.c,350 :: 		}
L_end_AccDec:
JR	RA
NOP	
; end of _AccDec
_Single_Axis_Enable:
;Stepper.c,355 :: 		void Single_Axis_Enable(_axis_ axis_){
;Stepper.c,356 :: 		switch(axis_){
J	L_Single_Axis_Enable35
NOP	
;Stepper.c,357 :: 		case X:
L_Single_Axis_Enable37:
;Stepper.c,358 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+8)(GP)
;Stepper.c,359 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,360 :: 		case Y:
L_Single_Axis_Enable38:
;Stepper.c,361 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+8)(GP)
;Stepper.c,362 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,363 :: 		case Z:
L_Single_Axis_Enable39:
;Stepper.c,364 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+8)(GP)
;Stepper.c,365 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,366 :: 		case A:
L_Single_Axis_Enable40:
;Stepper.c,367 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+8)(GP)
;Stepper.c,368 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,369 :: 		case B:
L_Single_Axis_Enable41:
;Stepper.c,370 :: 		OC6IE_bit = 1;OC6CONbits.ON = 1;
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC6CONbits+8)(GP)
;Stepper.c,371 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,372 :: 		case C:
L_Single_Axis_Enable42:
;Stepper.c,373 :: 		OC8IE_bit = 1;OC8CONbits.ON = 1;
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
ORI	R2, R0, 32768
SW	R2, Offset(OC8CONbits+8)(GP)
;Stepper.c,374 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,375 :: 		default:
L_Single_Axis_Enable43:
;Stepper.c,376 :: 		break;
J	L_Single_Axis_Enable36
NOP	
;Stepper.c,377 :: 		}
L_Single_Axis_Enable35:
ANDI	R2, R25, 255
<<<<<<< HEAD
BNE	R2, R0, L__Single_Axis_Enable191
NOP	
J	L_Single_Axis_Enable37
NOP	
L__Single_Axis_Enable191:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable193
NOP	
J	L_Single_Axis_Enable38
NOP	
L__Single_Axis_Enable193:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable195
NOP	
J	L_Single_Axis_Enable39
NOP	
L__Single_Axis_Enable195:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable197
NOP	
J	L_Single_Axis_Enable40
NOP	
L__Single_Axis_Enable197:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable199
NOP	
J	L_Single_Axis_Enable41
NOP	
L__Single_Axis_Enable199:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable201
NOP	
J	L_Single_Axis_Enable42
NOP	
L__Single_Axis_Enable201:
=======
BNE	R2, R0, L__Single_Axis_Enable204
NOP	
J	L_Single_Axis_Enable37
NOP	
L__Single_Axis_Enable204:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Single_Axis_Enable206
NOP	
J	L_Single_Axis_Enable38
NOP	
L__Single_Axis_Enable206:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Single_Axis_Enable208
NOP	
J	L_Single_Axis_Enable39
NOP	
L__Single_Axis_Enable208:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Single_Axis_Enable210
NOP	
J	L_Single_Axis_Enable40
NOP	
L__Single_Axis_Enable210:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Single_Axis_Enable212
NOP	
J	L_Single_Axis_Enable41
NOP	
L__Single_Axis_Enable212:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Single_Axis_Enable214
NOP	
J	L_Single_Axis_Enable42
NOP	
L__Single_Axis_Enable214:
>>>>>>> patch2
J	L_Single_Axis_Enable43
NOP	
L_Single_Axis_Enable36:
;Stepper.c,378 :: 		}
L_end_Single_Axis_Enable:
JR	RA
NOP	
; end of _Single_Axis_Enable
_Multi_Axis_Enable:
;Stepper.c,383 :: 		void Multi_Axis_Enable(axis_combination axis){
;Stepper.c,384 :: 		switch(axis){
J	L_Multi_Axis_Enable44
NOP	
;Stepper.c,385 :: 		case xy:
L_Multi_Axis_Enable46:
;Stepper.c,386 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,387 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,388 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,389 :: 		case xz:
L_Multi_Axis_Enable47:
;Stepper.c,390 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,391 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,392 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,393 :: 		case yz:
L_Multi_Axis_Enable48:
;Stepper.c,394 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,395 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,396 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,397 :: 		case xa:
L_Multi_Axis_Enable49:
;Stepper.c,398 :: 		OC5IE_bit = 1;OC5CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+8)(GP)
;Stepper.c,399 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,400 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,401 :: 		case ya:
L_Multi_Axis_Enable50:
;Stepper.c,402 :: 		OC2IE_bit = 1;OC2CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC2CONbits+8)(GP)
;Stepper.c,403 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,404 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,405 :: 		case za:
L_Multi_Axis_Enable51:
;Stepper.c,406 :: 		OC7IE_bit = 1;OC7CONbits.ON = 1;  //Y
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC7CONbits+8)(GP)
;Stepper.c,407 :: 		OC3IE_bit = 1;OC3CONbits.ON = 1;  //Z
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+8)(GP)
;Stepper.c,408 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,409 :: 		default:
L_Multi_Axis_Enable52:
;Stepper.c,410 :: 		break;
J	L_Multi_Axis_Enable45
NOP	
;Stepper.c,411 :: 		}
L_Multi_Axis_Enable44:
ANDI	R2, R25, 255
<<<<<<< HEAD
BNE	R2, R0, L__Multi_Axis_Enable204
NOP	
J	L_Multi_Axis_Enable46
NOP	
L__Multi_Axis_Enable204:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Multi_Axis_Enable206
NOP	
J	L_Multi_Axis_Enable47
NOP	
L__Multi_Axis_Enable206:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Multi_Axis_Enable208
NOP	
J	L_Multi_Axis_Enable48
NOP	
L__Multi_Axis_Enable208:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Multi_Axis_Enable210
NOP	
J	L_Multi_Axis_Enable49
NOP	
L__Multi_Axis_Enable210:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Multi_Axis_Enable212
NOP	
J	L_Multi_Axis_Enable50
NOP	
L__Multi_Axis_Enable212:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Multi_Axis_Enable214
NOP	
J	L_Multi_Axis_Enable51
NOP	
L__Multi_Axis_Enable214:
=======
BNE	R2, R0, L__Multi_Axis_Enable217
NOP	
J	L_Multi_Axis_Enable46
NOP	
L__Multi_Axis_Enable217:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__Multi_Axis_Enable219
NOP	
J	L_Multi_Axis_Enable47
NOP	
L__Multi_Axis_Enable219:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__Multi_Axis_Enable221
NOP	
J	L_Multi_Axis_Enable48
NOP	
L__Multi_Axis_Enable221:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__Multi_Axis_Enable223
NOP	
J	L_Multi_Axis_Enable49
NOP	
L__Multi_Axis_Enable223:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__Multi_Axis_Enable225
NOP	
J	L_Multi_Axis_Enable50
NOP	
L__Multi_Axis_Enable225:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__Multi_Axis_Enable227
NOP	
J	L_Multi_Axis_Enable51
NOP	
L__Multi_Axis_Enable227:
>>>>>>> patch2
J	L_Multi_Axis_Enable52
NOP	
L_Multi_Axis_Enable45:
;Stepper.c,412 :: 		}
L_end_Multi_Axis_Enable:
JR	RA
NOP	
; end of _Multi_Axis_Enable
_disableOCx:
;Stepper.c,414 :: 		void disableOCx(){
;Stepper.c,415 :: 		OC5IE_bit = 0;OC5CONbits.ON = 0; //X
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
ORI	R3, R0, 32768
SW	R3, Offset(OC5CONbits+4)(GP)
;Stepper.c,416 :: 		OC2IE_bit = 0;OC2CONbits.ON = 0; //Y
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
SW	R3, Offset(OC2CONbits+4)(GP)
;Stepper.c,417 :: 		OC7IE_bit = 0;OC7CONbits.ON = 0; //Z
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
SW	R3, Offset(OC7CONbits+4)(GP)
;Stepper.c,419 :: 		OC3IE_bit = 0;OC3CONbits.ON = 0; //A
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
SW	R3, Offset(OC3CONbits+4)(GP)
;Stepper.c,420 :: 		OC6IE_bit = 0;OC6CONbits.ON = 0; //B
LUI	R2, BitMask(OC6IE_bit+0)
ORI	R2, R2, BitMask(OC6IE_bit+0)
_SX	
SW	R3, Offset(OC6CONbits+4)(GP)
;Stepper.c,421 :: 		OC8IE_bit = 0;OC8CONbits.ON = 0; //Z
LUI	R2, BitMask(OC8IE_bit+0)
ORI	R2, R2, BitMask(OC8IE_bit+0)
_SX	
SW	R3, Offset(OC8CONbits+4)(GP)
;Stepper.c,422 :: 		}
L_end_disableOCx:
JR	RA
NOP	
; end of _disableOCx
_StepX:
;Stepper.c,427 :: 		void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
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
;Stepper.c,429 :: 		OC5IF_bit = 0;
LUI	R2, BitMask(OC5IF_bit+0)
ORI	R2, R2, BitMask(OC5IF_bit+0)
_SX	
;Stepper.c,434 :: 		if(SV.Single_Dual == 0)
LH	R2, Offset(_SV+0)(GP)
<<<<<<< HEAD
BEQ	R2, R0, L__StepX217
NOP	
J	L_StepX53
NOP	
L__StepX217:
;Stepper.c,428 :: 		SingleStepX();
=======
BEQ	R2, R0, L__StepX230
NOP	
J	L_StepX53
NOP	
L__StepX230:
;Stepper.c,435 :: 		SingleStepX();
>>>>>>> patch2
JAL	_SingleStepX+0
NOP	
J	L_StepX54
NOP	
L_StepX53:
<<<<<<< HEAD
;Stepper.c,430 :: 		AxisPulse[SV.Single_Dual]();
=======
;Stepper.c,437 :: 		if(STPS[X].master = 1)
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
LBU	R2, Offset(_STPS+4)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__StepX232
NOP	
J	L_StepX55
NOP	
L__StepX232:
;Stepper.c,438 :: 		AxisPulse[SV.Single_Dual]();
>>>>>>> patch2
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
<<<<<<< HEAD
L_StepX54:
;Stepper.c,431 :: 		}
=======
L_StepX55:
;Stepper.c,439 :: 		}
L_StepX54:
;Stepper.c,440 :: 		}
>>>>>>> patch2
L_end_StepX:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _StepX
_SingleStepX:
<<<<<<< HEAD
;Stepper.c,434 :: 		void SingleStepX(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,435 :: 		if((STPS[X].step_count >= STPS[X].dist)||(SV.Tog == 1)){
=======
;Stepper.c,442 :: 		void SingleStepX(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,443 :: 		if((STPS[X].step_count >= STPS[X].dist)||(SV.Tog == 1)){
>>>>>>> patch2
SW	R25, 4(SP)
LW	R3, Offset(_STPS+36)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R2, R3
<<<<<<< HEAD
BNE	R2, R0, L__SingleStepX219
=======
BNE	R2, R0, L__SingleStepX234
NOP	
J	L__SingleStepX132
NOP	
L__SingleStepX234:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepX236
>>>>>>> patch2
NOP	
J	L__SingleStepX131
NOP	
<<<<<<< HEAD
L__SingleStepX219:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepX221
NOP	
J	L__SingleStepX126
NOP	
L__SingleStepX221:
J	L_SingleStepX57
NOP	
L__SingleStepX127:
L__SingleStepX126:
;Stepper.c,436 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,437 :: 		}
J	L_SingleStepX58
NOP	
L_SingleStepX57:
;Stepper.c,439 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,440 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,441 :: 		}
L_SingleStepX58:
;Stepper.c,442 :: 		}
=======
L__SingleStepX236:
J	L_SingleStepX58
NOP	
L__SingleStepX132:
L__SingleStepX131:
;Stepper.c,444 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,445 :: 		}
J	L_SingleStepX59
NOP	
L_SingleStepX58:
;Stepper.c,447 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,448 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,449 :: 		}
L_SingleStepX59:
;Stepper.c,450 :: 		}
>>>>>>> patch2
L_end_SingleStepX:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepX
_StopX:
<<<<<<< HEAD
;Stepper.c,445 :: 		void StopX(){
;Stepper.c,446 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,447 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,448 :: 		}
=======
;Stepper.c,453 :: 		void StopX(){
;Stepper.c,454 :: 		OC5IE_bit = 0;
LUI	R2, BitMask(OC5IE_bit+0)
ORI	R2, R2, BitMask(OC5IE_bit+0)
_SX	
;Stepper.c,455 :: 		OC5CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC5CONbits+4)(GP)
;Stepper.c,456 :: 		}
>>>>>>> patch2
L_end_StopX:
JR	RA
NOP	
; end of _StopX
_StepY:
<<<<<<< HEAD
;Stepper.c,454 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
=======
;Stepper.c,462 :: 		void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_SRS {
>>>>>>> patch2
RDPGPR	SP, SP
ADDIU	SP, SP, -12
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
<<<<<<< HEAD
;Stepper.c,455 :: 		STPS[Y].step_count++;
LW	R2, Offset(_STPS+100)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+100)(GP)
;Stepper.c,456 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,458 :: 		if(SV.Single_Dual == 0)
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepY224
NOP	
J	L_StepY59
NOP	
L__StepY224:
;Stepper.c,459 :: 		SingleStepY();
JAL	_SingleStepY+0
NOP	
J	L_StepY60
NOP	
L_StepY59:
;Stepper.c,461 :: 		if(STPS[Y].master = 1)
=======
;Stepper.c,464 :: 		OC2IF_bit = 0;
LUI	R2, BitMask(OC2IF_bit+0)
ORI	R2, R2, BitMask(OC2IF_bit+0)
_SX	
;Stepper.c,469 :: 		if(SV.Single_Dual == 0)
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepY239
NOP	
J	L_StepY60
NOP	
L__StepY239:
;Stepper.c,470 :: 		SingleStepY();
JAL	_SingleStepY+0
NOP	
J	L_StepY61
NOP	
L_StepY60:
;Stepper.c,472 :: 		if(STPS[Y].master = 1)
>>>>>>> patch2
LBU	R2, Offset(_STPS+72)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+72)(GP)
LBU	R2, Offset(_STPS+72)(GP)
EXT	R2, R2, 4, 1
<<<<<<< HEAD
BNE	R2, R0, L__StepY226
=======
BNE	R2, R0, L__StepY241
>>>>>>> patch2
NOP	
J	L_StepY61
NOP	
<<<<<<< HEAD
L__StepY226:
;Stepper.c,462 :: 		AxisPulse[SV.Single_Dual]();
=======
L__StepY241:
;Stepper.c,473 :: 		AxisPulse[SV.Single_Dual]();
>>>>>>> patch2
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
<<<<<<< HEAD
L_StepY61:
;Stepper.c,463 :: 		}
L_StepY60:
;Stepper.c,464 :: 		}
=======
L_StepY62:
;Stepper.c,474 :: 		}
L_StepY61:
;Stepper.c,475 :: 		}
>>>>>>> patch2
L_end_StepY:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _StepY
_SingleStepY:
<<<<<<< HEAD
;Stepper.c,466 :: 		void SingleStepY(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,467 :: 		if((STPS[Y].step_count >= STPS[Y].dist)||(SV.Tog == 1)){  //i think this is where the problem lies
=======
;Stepper.c,477 :: 		void SingleStepY(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,478 :: 		if((STPS[Y].step_count >= STPS[Y].dist)||(SV.Tog == 1)){  //i think this is where the problem lies
>>>>>>> patch2
SW	R25, 4(SP)
LW	R3, Offset(_STPS+104)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R2, R3
<<<<<<< HEAD
BNE	R2, R0, L__SingleStepY228
=======
BNE	R2, R0, L__SingleStepY243
NOP	
J	L__SingleStepY135
NOP	
L__SingleStepY243:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepY245
>>>>>>> patch2
NOP	
J	L__SingleStepY134
NOP	
<<<<<<< HEAD
L__SingleStepY228:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepY230
NOP	
J	L__SingleStepY129
NOP	
L__SingleStepY230:
J	L_SingleStepY64
NOP	
L__SingleStepY130:
L__SingleStepY129:
;Stepper.c,468 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,469 :: 		}
J	L_SingleStepY65
NOP	
L_SingleStepY64:
;Stepper.c,471 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,472 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,473 :: 		}
L_SingleStepY65:
;Stepper.c,474 :: 		}
=======
L__SingleStepY245:
J	L_SingleStepY65
NOP	
L__SingleStepY135:
L__SingleStepY134:
;Stepper.c,479 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,480 :: 		}
J	L_SingleStepY66
NOP	
L_SingleStepY65:
;Stepper.c,482 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,483 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,484 :: 		}
L_SingleStepY66:
;Stepper.c,485 :: 		}
>>>>>>> patch2
L_end_SingleStepY:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepY
_StopY:
<<<<<<< HEAD
;Stepper.c,476 :: 		void StopY(){
;Stepper.c,477 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,478 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,479 :: 		}
=======
;Stepper.c,487 :: 		void StopY(){
;Stepper.c,488 :: 		OC2IE_bit = 0;
LUI	R2, BitMask(OC2IE_bit+0)
ORI	R2, R2, BitMask(OC2IE_bit+0)
_SX	
;Stepper.c,489 :: 		OC2CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC2CONbits+4)(GP)
;Stepper.c,490 :: 		}
>>>>>>> patch2
L_end_StopY:
JR	RA
NOP	
; end of _StopY
_StepZ:
<<<<<<< HEAD
;Stepper.c,485 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
=======
;Stepper.c,496 :: 		void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_SRS {
>>>>>>> patch2
RDPGPR	SP, SP
ADDIU	SP, SP, -12
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
<<<<<<< HEAD
;Stepper.c,486 :: 		STPS[Z].step_count++;
LW	R2, Offset(_STPS+168)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+168)(GP)
;Stepper.c,487 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,489 :: 		if(SV.Single_Dual == 0)
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepZ233
NOP	
J	L_StepZ66
NOP	
L__StepZ233:
;Stepper.c,490 :: 		SingleStepZ();
JAL	_SingleStepZ+0
NOP	
J	L_StepZ67
NOP	
L_StepZ66:
;Stepper.c,492 :: 		AxisPulse[SV.Single_Dual]();
=======
;Stepper.c,498 :: 		OC7IF_bit = 0;
LUI	R2, BitMask(OC7IF_bit+0)
ORI	R2, R2, BitMask(OC7IF_bit+0)
_SX	
;Stepper.c,503 :: 		if(SV.Single_Dual == 0)
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepZ248
NOP	
J	L_StepZ67
NOP	
L__StepZ248:
;Stepper.c,504 :: 		SingleStepZ();
JAL	_SingleStepZ+0
NOP	
J	L_StepZ68
NOP	
L_StepZ67:
;Stepper.c,506 :: 		AxisPulse[SV.Single_Dual]();
>>>>>>> patch2
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
<<<<<<< HEAD
L_StepZ67:
;Stepper.c,494 :: 		}
=======
L_StepZ68:
;Stepper.c,508 :: 		}
>>>>>>> patch2
L_end_StepZ:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _StepZ
_SingleStepZ:
<<<<<<< HEAD
;Stepper.c,496 :: 		void SingleStepZ(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,497 :: 		if((STPS[Z].step_count >= STPS[Z].dist)||(SV.Tog == 1)){
=======
;Stepper.c,510 :: 		void SingleStepZ(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,511 :: 		if((STPS[Z].step_count >= STPS[Z].dist)||(SV.Tog == 1)){
>>>>>>> patch2
SW	R25, 4(SP)
LW	R3, Offset(_STPS+172)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R2, R3
<<<<<<< HEAD
BNE	R2, R0, L__SingleStepZ235
=======
BNE	R2, R0, L__SingleStepZ250
NOP	
J	L__SingleStepZ138
NOP	
L__SingleStepZ250:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepZ252
>>>>>>> patch2
NOP	
J	L__SingleStepZ137
NOP	
<<<<<<< HEAD
L__SingleStepZ235:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepZ237
NOP	
J	L__SingleStepZ132
NOP	
L__SingleStepZ237:
J	L_SingleStepZ70
NOP	
L__SingleStepZ133:
L__SingleStepZ132:
;Stepper.c,498 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,499 :: 		}
J	L_SingleStepZ71
NOP	
L_SingleStepZ70:
;Stepper.c,501 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,502 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,503 :: 		}
L_SingleStepZ71:
;Stepper.c,504 :: 		}
=======
L__SingleStepZ252:
J	L_SingleStepZ71
NOP	
L__SingleStepZ138:
L__SingleStepZ137:
;Stepper.c,512 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,513 :: 		}
J	L_SingleStepZ72
NOP	
L_SingleStepZ71:
;Stepper.c,515 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,516 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,517 :: 		}
L_SingleStepZ72:
;Stepper.c,518 :: 		}
>>>>>>> patch2
L_end_SingleStepZ:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepZ
_StopZ:
<<<<<<< HEAD
;Stepper.c,506 :: 		void StopZ(){
;Stepper.c,507 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,508 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,509 :: 		}
=======
;Stepper.c,520 :: 		void StopZ(){
;Stepper.c,521 :: 		OC7IE_bit = 0;
LUI	R2, BitMask(OC7IE_bit+0)
ORI	R2, R2, BitMask(OC7IE_bit+0)
_SX	
;Stepper.c,522 :: 		OC7CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC7CONbits+4)(GP)
;Stepper.c,523 :: 		}
>>>>>>> patch2
L_end_StopZ:
JR	RA
NOP	
; end of _StopZ
_StepA:
<<<<<<< HEAD
;Stepper.c,515 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
=======
;Stepper.c,529 :: 		void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_SRS {
>>>>>>> patch2
RDPGPR	SP, SP
ADDIU	SP, SP, -12
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
<<<<<<< HEAD
;Stepper.c,516 :: 		STPS[A].step_count++;
LW	R2, Offset(_STPS+236)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_STPS+236)(GP)
;Stepper.c,517 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,519 :: 		if(SV.Single_Dual == 0)
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepA240
NOP	
J	L_StepA72
NOP	
L__StepA240:
;Stepper.c,520 :: 		SingleStepA();
JAL	_SingleStepA+0
NOP	
J	L_StepA73
NOP	
L_StepA72:
;Stepper.c,522 :: 		AxisPulse[SV.Single_Dual]();
=======
;Stepper.c,531 :: 		OC3IF_bit = 0;
LUI	R2, BitMask(OC3IF_bit+0)
ORI	R2, R2, BitMask(OC3IF_bit+0)
_SX	
;Stepper.c,536 :: 		if(SV.Single_Dual == 0)
LH	R2, Offset(_SV+0)(GP)
BEQ	R2, R0, L__StepA255
NOP	
J	L_StepA73
NOP	
L__StepA255:
;Stepper.c,537 :: 		SingleStepA();
JAL	_SingleStepA+0
NOP	
J	L_StepA74
NOP	
L_StepA73:
;Stepper.c,539 :: 		AxisPulse[SV.Single_Dual]();
>>>>>>> patch2
LH	R2, Offset(_SV+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_AxisPulse+0)
ORI	R2, R2, lo_addr(_AxisPulse+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
JALR	RA, R2
NOP	
<<<<<<< HEAD
L_StepA73:
;Stepper.c,524 :: 		}
=======
L_StepA74:
;Stepper.c,541 :: 		}
>>>>>>> patch2
L_end_StepA:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _StepA
_SingleStepA:
<<<<<<< HEAD
;Stepper.c,526 :: 		void SingleStepA(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,527 :: 		if((STPS[A].step_count >= STPS[A].dist)||(SV.Tog == 1)){
=======
;Stepper.c,543 :: 		void SingleStepA(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,544 :: 		if((STPS[A].step_count >= STPS[A].dist)||(SV.Tog == 1)){
>>>>>>> patch2
SW	R25, 4(SP)
LW	R3, Offset(_STPS+240)(GP)
LW	R2, Offset(_STPS+236)(GP)
SLT	R2, R2, R3
<<<<<<< HEAD
BNE	R2, R0, L__SingleStepA242
=======
BNE	R2, R0, L__SingleStepA257
NOP	
J	L__SingleStepA141
NOP	
L__SingleStepA257:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepA259
>>>>>>> patch2
NOP	
J	L__SingleStepA140
NOP	
<<<<<<< HEAD
L__SingleStepA242:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__SingleStepA244
NOP	
J	L__SingleStepA135
NOP	
L__SingleStepA244:
J	L_SingleStepA76
NOP	
L__SingleStepA136:
L__SingleStepA135:
;Stepper.c,528 :: 		StopA();
JAL	_StopA+0
NOP	
;Stepper.c,529 :: 		}
J	L_SingleStepA77
NOP	
L_SingleStepA76:
;Stepper.c,531 :: 		Step_Cycle(A);
ORI	R25, R0, 3
JAL	_Step_Cycle+0
NOP	
;Stepper.c,532 :: 		Pulse(A);
ORI	R25, R0, 3
JAL	_Pulse+0
NOP	
;Stepper.c,533 :: 		}
L_SingleStepA77:
;Stepper.c,534 :: 		}
=======
L__SingleStepA259:
J	L_SingleStepA77
NOP	
L__SingleStepA141:
L__SingleStepA140:
;Stepper.c,545 :: 		StopA();
JAL	_StopA+0
NOP	
;Stepper.c,546 :: 		}
J	L_SingleStepA78
NOP	
L_SingleStepA77:
;Stepper.c,548 :: 		Step_Cycle(A);
ORI	R25, R0, 3
JAL	_Step_Cycle+0
NOP	
;Stepper.c,549 :: 		Pulse(A);
ORI	R25, R0, 3
JAL	_Pulse+0
NOP	
;Stepper.c,550 :: 		}
L_SingleStepA78:
;Stepper.c,551 :: 		}
>>>>>>> patch2
L_end_SingleStepA:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SingleStepA
_StopA:
<<<<<<< HEAD
;Stepper.c,536 :: 		void StopA(){
;Stepper.c,537 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,538 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,539 :: 		}
=======
;Stepper.c,553 :: 		void StopA(){
;Stepper.c,554 :: 		OC3IE_bit = 0;
LUI	R2, BitMask(OC3IE_bit+0)
ORI	R2, R2, BitMask(OC3IE_bit+0)
_SX	
;Stepper.c,555 :: 		OC3CONbits.ON = 0;
ORI	R2, R0, 32768
SW	R2, Offset(OC3CONbits+4)(GP)
;Stepper.c,556 :: 		}
>>>>>>> patch2
L_end_StopA:
JR	RA
NOP	
; end of _StopA
_XY_Interpolate:
<<<<<<< HEAD
;Stepper.c,545 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,547 :: 		if(/*(STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)||*/(SV.Tog == 1)){
=======
;Stepper.c,562 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,564 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)||(SV.Tog == 1)){
>>>>>>> patch2
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate262
NOP	
J	L__XY_Interpolate145
NOP	
L__XY_Interpolate262:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate263
NOP	
J	L__XY_Interpolate144
NOP	
L__XY_Interpolate263:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
<<<<<<< HEAD
BEQ	R3, R2, L__XY_Interpolate247
NOP	
J	L_XY_Interpolate78
NOP	
L__XY_Interpolate247:
;Stepper.c,548 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,549 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,550 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Stepper.c,551 :: 		}
L_XY_Interpolate78:
;Stepper.c,553 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__XY_Interpolate248
NOP	
J	L_XY_Interpolate79
NOP	
L__XY_Interpolate248:
;Stepper.c,554 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,555 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,556 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate249
NOP	
J	L_XY_Interpolate80
NOP	
L__XY_Interpolate249:
;Stepper.c,557 :: 		SV.d2 += 2*SV.dy;
=======
BNE	R3, R2, L__XY_Interpolate265
NOP	
J	L__XY_Interpolate143
NOP	
L__XY_Interpolate265:
J	L_XY_Interpolate81
NOP	
L__XY_Interpolate145:
L__XY_Interpolate144:
L__XY_Interpolate143:
;Stepper.c,565 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,566 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,567 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Stepper.c,568 :: 		}
L_XY_Interpolate81:
;Stepper.c,570 :: 		if(SV.dx >= SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__XY_Interpolate266
NOP	
J	L_XY_Interpolate82
NOP	
L__XY_Interpolate266:
;Stepper.c,571 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,572 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,573 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate267
NOP	
J	L_XY_Interpolate83
NOP	
L__XY_Interpolate267:
;Stepper.c,574 :: 		SV.d2 += 2*SV.dy;
>>>>>>> patch2
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,558 :: 		}else{
J	L_XY_Interpolate81
NOP	
L_XY_Interpolate80:
;Stepper.c,559 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
=======
;Stepper.c,575 :: 		}else{
J	L_XY_Interpolate84
NOP	
L_XY_Interpolate83:
;Stepper.c,576 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
>>>>>>> patch2
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,560 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,561 :: 		}
L_XY_Interpolate81:
;Stepper.c,562 :: 		}else{
J	L_XY_Interpolate82
NOP	
L_XY_Interpolate79:
;Stepper.c,563 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,564 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,565 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate250
NOP	
J	L_XY_Interpolate83
NOP	
L__XY_Interpolate250:
;Stepper.c,566 :: 		SV.d2 += 2 * SV.dx;
=======
;Stepper.c,577 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,578 :: 		}
L_XY_Interpolate84:
;Stepper.c,579 :: 		}else{
J	L_XY_Interpolate85
NOP	
L_XY_Interpolate82:
;Stepper.c,580 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,581 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,582 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate268
NOP	
J	L_XY_Interpolate86
NOP	
L__XY_Interpolate268:
;Stepper.c,583 :: 		SV.d2 += 2 * SV.dx;
>>>>>>> patch2
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,567 :: 		}else{
J	L_XY_Interpolate84
NOP	
L_XY_Interpolate83:
;Stepper.c,568 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
=======
;Stepper.c,584 :: 		}else{
J	L_XY_Interpolate87
NOP	
L_XY_Interpolate86:
;Stepper.c,585 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
>>>>>>> patch2
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,569 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,570 :: 		}
L_XY_Interpolate84:
;Stepper.c,571 :: 		}
L_XY_Interpolate82:
;Stepper.c,572 :: 		}
=======
;Stepper.c,586 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,587 :: 		}
L_XY_Interpolate87:
;Stepper.c,588 :: 		}
L_XY_Interpolate85:
;Stepper.c,589 :: 		}
>>>>>>> patch2
L_end_XY_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XY_Interpolate
_XZ_Interpolate:
<<<<<<< HEAD
;Stepper.c,574 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,576 :: 		if(/*(STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)||*/(SV.Tog == 1)){
=======
;Stepper.c,591 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,593 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)||(SV.Tog == 1)){
>>>>>>> patch2
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate270
NOP	
J	L__XZ_Interpolate149
NOP	
L__XZ_Interpolate270:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate271
NOP	
J	L__XZ_Interpolate148
NOP	
L__XZ_Interpolate271:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
<<<<<<< HEAD
BEQ	R3, R2, L__XZ_Interpolate252
NOP	
J	L_XZ_Interpolate85
NOP	
L__XZ_Interpolate252:
;Stepper.c,577 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,578 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,579 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Stepper.c,580 :: 		}
L_XZ_Interpolate85:
;Stepper.c,582 :: 		if(SV.dx >= SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__XZ_Interpolate253
NOP	
J	L_XZ_Interpolate86
NOP	
L__XZ_Interpolate253:
;Stepper.c,583 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,584 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,585 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate254
NOP	
J	L_XZ_Interpolate87
NOP	
L__XZ_Interpolate254:
;Stepper.c,586 :: 		SV.d2 += 2*SV.dz;
=======
BNE	R3, R2, L__XZ_Interpolate273
NOP	
J	L__XZ_Interpolate147
NOP	
L__XZ_Interpolate273:
J	L_XZ_Interpolate90
NOP	
L__XZ_Interpolate149:
L__XZ_Interpolate148:
L__XZ_Interpolate147:
;Stepper.c,594 :: 		StopX();
JAL	_StopX+0
NOP	
;Stepper.c,595 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,596 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Stepper.c,597 :: 		}
L_XZ_Interpolate90:
;Stepper.c,599 :: 		if(SV.dx >= SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__XZ_Interpolate274
NOP	
J	L_XZ_Interpolate91
NOP	
L__XZ_Interpolate274:
;Stepper.c,600 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,601 :: 		Pulse(X);
MOVZ	R25, R0, R0
JAL	_Pulse+0
NOP	
;Stepper.c,602 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate275
NOP	
J	L_XZ_Interpolate92
NOP	
L__XZ_Interpolate275:
;Stepper.c,603 :: 		SV.d2 += 2*SV.dz;
>>>>>>> patch2
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
J	L_XZ_Interpolate88
NOP	
L_XZ_Interpolate87:
;Stepper.c,588 :: 		SV.d2 += 2 * (SV.dz - SV.dx);
=======
J	L_XZ_Interpolate93
NOP	
L_XZ_Interpolate92:
;Stepper.c,605 :: 		SV.d2 += 2 * (SV.dz - SV.dx);
>>>>>>> patch2
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,589 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,590 :: 		}
L_XZ_Interpolate88:
;Stepper.c,592 :: 		}else{
J	L_XZ_Interpolate89
NOP	
L_XZ_Interpolate86:
;Stepper.c,593 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,594 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,595 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate255
NOP	
J	L_XZ_Interpolate90
NOP	
L__XZ_Interpolate255:
;Stepper.c,596 :: 		SV.d2 += 2 * SV.dx;
=======
;Stepper.c,606 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,607 :: 		}
L_XZ_Interpolate93:
;Stepper.c,609 :: 		}else{
J	L_XZ_Interpolate94
NOP	
L_XZ_Interpolate91:
;Stepper.c,610 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,611 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,612 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate276
NOP	
J	L_XZ_Interpolate95
NOP	
L__XZ_Interpolate276:
;Stepper.c,613 :: 		SV.d2 += 2 * SV.dx;
>>>>>>> patch2
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
J	L_XZ_Interpolate91
NOP	
L_XZ_Interpolate90:
;Stepper.c,598 :: 		SV.d2 += 2 * (SV.dx - SV.dz);
=======
J	L_XZ_Interpolate96
NOP	
L_XZ_Interpolate95:
;Stepper.c,615 :: 		SV.d2 += 2 * (SV.dx - SV.dz);
>>>>>>> patch2
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,599 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,600 :: 		}
L_XZ_Interpolate91:
;Stepper.c,601 :: 		}
L_XZ_Interpolate89:
;Stepper.c,602 :: 		}
=======
;Stepper.c,616 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Stepper.c,617 :: 		}
L_XZ_Interpolate96:
;Stepper.c,618 :: 		}
L_XZ_Interpolate94:
;Stepper.c,619 :: 		}
>>>>>>> patch2
L_end_XZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XZ_Interpolate
_YZ_Interpolate:
<<<<<<< HEAD
;Stepper.c,603 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,604 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)||(SV.Tog == 1)){
=======
;Stepper.c,620 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Stepper.c,621 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)||(SV.Tog == 1)){
>>>>>>> patch2
SW	R25, 4(SP)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
<<<<<<< HEAD
BEQ	R2, R0, L__YZ_Interpolate257
=======
BEQ	R2, R0, L__YZ_Interpolate278
NOP	
J	L__YZ_Interpolate153
NOP	
L__YZ_Interpolate278:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate279
>>>>>>> patch2
NOP	
J	L__YZ_Interpolate152
NOP	
<<<<<<< HEAD
L__YZ_Interpolate257:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate258
=======
L__YZ_Interpolate279:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__YZ_Interpolate281
>>>>>>> patch2
NOP	
J	L__YZ_Interpolate151
NOP	
<<<<<<< HEAD
L__YZ_Interpolate258:
LH	R3, Offset(_SV+4)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__YZ_Interpolate260
NOP	
J	L__YZ_Interpolate138
NOP	
L__YZ_Interpolate260:
J	L_YZ_Interpolate94
NOP	
L__YZ_Interpolate140:
L__YZ_Interpolate139:
L__YZ_Interpolate138:
;Stepper.c,605 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,606 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,607 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Stepper.c,608 :: 		}
L_YZ_Interpolate94:
;Stepper.c,610 :: 		if(SV.dy >= SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__YZ_Interpolate261
NOP	
J	L_YZ_Interpolate95
NOP	
L__YZ_Interpolate261:
;Stepper.c,611 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,612 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,613 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate262
NOP	
J	L_YZ_Interpolate96
NOP	
L__YZ_Interpolate262:
;Stepper.c,614 :: 		SV.d2 += 2*SV.dz;
=======
L__YZ_Interpolate281:
J	L_YZ_Interpolate99
NOP	
L__YZ_Interpolate153:
L__YZ_Interpolate152:
L__YZ_Interpolate151:
;Stepper.c,622 :: 		StopY();
JAL	_StopY+0
NOP	
;Stepper.c,623 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Stepper.c,624 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Stepper.c,625 :: 		}
L_YZ_Interpolate99:
;Stepper.c,627 :: 		if(SV.dy >= SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__YZ_Interpolate282
NOP	
J	L_YZ_Interpolate100
NOP	
L__YZ_Interpolate282:
;Stepper.c,628 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,629 :: 		Pulse(Y);
ORI	R25, R0, 1
JAL	_Pulse+0
NOP	
;Stepper.c,630 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate283
NOP	
J	L_YZ_Interpolate101
NOP	
L__YZ_Interpolate283:
;Stepper.c,631 :: 		SV.d2 += 2*SV.dz;
>>>>>>> patch2
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
J	L_YZ_Interpolate97
NOP	
L_YZ_Interpolate96:
;Stepper.c,616 :: 		SV.d2 += 2 * (SV.dz - SV.dy);
=======
J	L_YZ_Interpolate102
NOP	
L_YZ_Interpolate101:
;Stepper.c,633 :: 		SV.d2 += 2 * (SV.dz - SV.dy);
>>>>>>> patch2
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,617 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,618 :: 		}
L_YZ_Interpolate97:
;Stepper.c,619 :: 		}else{
J	L_YZ_Interpolate98
NOP	
L_YZ_Interpolate95:
;Stepper.c,620 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,621 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,622 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate263
NOP	
J	L_YZ_Interpolate99
NOP	
L__YZ_Interpolate263:
;Stepper.c,623 :: 		SV.d2 += 2 * SV.dy;
=======
;Stepper.c,634 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,635 :: 		}
L_YZ_Interpolate102:
;Stepper.c,636 :: 		}else{
J	L_YZ_Interpolate103
NOP	
L_YZ_Interpolate100:
;Stepper.c,637 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Stepper.c,638 :: 		Pulse(Z);
ORI	R25, R0, 2
JAL	_Pulse+0
NOP	
;Stepper.c,639 :: 		if(SV.d2 < 0)
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate284
NOP	
J	L_YZ_Interpolate104
NOP	
L__YZ_Interpolate284:
;Stepper.c,640 :: 		SV.d2 += 2 * SV.dy;
>>>>>>> patch2
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
J	L_YZ_Interpolate100
NOP	
L_YZ_Interpolate99:
;Stepper.c,625 :: 		SV.d2 += 2 * (SV.dy - SV.dz);
=======
J	L_YZ_Interpolate105
NOP	
L_YZ_Interpolate104:
;Stepper.c,642 :: 		SV.d2 += 2 * (SV.dy - SV.dz);
>>>>>>> patch2
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Stepper.c,626 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,627 :: 		}
L_YZ_Interpolate100:
;Stepper.c,628 :: 		}
L_YZ_Interpolate98:
;Stepper.c,630 :: 		}
=======
;Stepper.c,643 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Stepper.c,644 :: 		}
L_YZ_Interpolate105:
;Stepper.c,645 :: 		}
L_YZ_Interpolate103:
;Stepper.c,647 :: 		}
>>>>>>> patch2
L_end_YZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _YZ_Interpolate
_min_:
<<<<<<< HEAD
;Stepper.c,640 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,641 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_265
NOP	
J	L_min_101
NOP	
L__min_265:
;Stepper.c,642 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,643 :: 		}
L_min_101:
;Stepper.c,645 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,647 :: 		}
=======
;Stepper.c,658 :: 		unsigned int min_(unsigned int x, unsigned int y){
;Stepper.c,659 :: 		if(x < y){
ANDI	R3, R25, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__min_286
NOP	
J	L_min_106
NOP	
L__min_286:
;Stepper.c,660 :: 		return x;
ANDI	R2, R25, 65535
J	L_end_min_
NOP	
;Stepper.c,661 :: 		}
L_min_106:
;Stepper.c,663 :: 		return y;
ANDI	R2, R26, 65535
;Stepper.c,665 :: 		}
>>>>>>> patch2
L_end_min_:
JR	RA
NOP	
; end of _min_
Stepper_sqrt_:
<<<<<<< HEAD
;Stepper.c,657 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,663 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,664 :: 		q2 = 0x40000000L;           // higest possible result bit
=======
;Stepper.c,675 :: 		static unsigned long sqrt_(unsigned long x){
;Stepper.c,681 :: 		xr = 0;                     // clear result
; xr start address is: 20 (R5)
MOVZ	R5, R0, R0
;Stepper.c,682 :: 		q2 = 0x40000000L;           // higest possible result bit
>>>>>>> patch2
; q2 start address is: 12 (R3)
LUI	R3, 16384
; xr end address is: 20 (R5)
; q2 end address is: 12 (R3)
<<<<<<< HEAD
;Stepper.c,665 :: 		do
J	L_Stepper_sqrt_103
NOP	
L_Stepper_sqrt_120:
;Stepper.c,679 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,665 :: 		do
L_Stepper_sqrt_103:
;Stepper.c,667 :: 		if((xr + q2) <= x)
=======
;Stepper.c,683 :: 		do
J	L_Stepper_sqrt_108
NOP	
L_Stepper_sqrt_125:
;Stepper.c,697 :: 		} while(q2 >>= 2);          // shift twice
MOVZ	R5, R4, R0
;Stepper.c,683 :: 		do
L_Stepper_sqrt_108:
;Stepper.c,685 :: 		if((xr + q2) <= x)
>>>>>>> patch2
; q2 start address is: 12 (R3)
; xr start address is: 20 (R5)
ADDU	R2, R5, R3
SLTU	R2, R25, R2
<<<<<<< HEAD
BEQ	R2, R0, L_Stepper_sqrt_267
NOP	
J	L_Stepper_sqrt_106
NOP	
L_Stepper_sqrt_267:
;Stepper.c,669 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,670 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,671 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_107
NOP	
L_Stepper_sqrt_106:
;Stepper.c,673 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,674 :: 		}
L_Stepper_sqrt_107:
;Stepper.c,675 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,676 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_269
NOP	
J	L_Stepper_sqrt_121
NOP	
L_Stepper_sqrt_269:
; f end address is: 16 (R4)
;Stepper.c,677 :: 		xr += q2;               // test flag
=======
BEQ	R2, R0, L_Stepper_sqrt_288
NOP	
J	L_Stepper_sqrt_111
NOP	
L_Stepper_sqrt_288:
;Stepper.c,687 :: 		x -= xr + q2;
ADDU	R2, R5, R3
SUBU	R2, R25, R2
MOVZ	R25, R2, R0
;Stepper.c,688 :: 		f = 1;                  // set flag
; f start address is: 16 (R4)
ORI	R4, R0, 1
;Stepper.c,689 :: 		}
; f end address is: 16 (R4)
J	L_Stepper_sqrt_112
NOP	
L_Stepper_sqrt_111:
;Stepper.c,691 :: 		f = 0;                  // clear flag
; f start address is: 16 (R4)
MOVZ	R4, R0, R0
; f end address is: 16 (R4)
;Stepper.c,692 :: 		}
L_Stepper_sqrt_112:
;Stepper.c,693 :: 		xr >>= 1;
; f start address is: 16 (R4)
SRL	R2, R5, 1
MOVZ	R5, R2, R0
;Stepper.c,694 :: 		if(f){
BNE	R4, R0, L_Stepper_sqrt_290
NOP	
J	L_Stepper_sqrt_126
NOP	
L_Stepper_sqrt_290:
; f end address is: 16 (R4)
;Stepper.c,695 :: 		xr += q2;               // test flag
>>>>>>> patch2
ADDU	R2, R5, R3
; xr end address is: 20 (R5)
; xr start address is: 16 (R4)
MOVZ	R4, R2, R0
; xr end address is: 16 (R4)
<<<<<<< HEAD
;Stepper.c,678 :: 		}
J	L_Stepper_sqrt_108
NOP	
L_Stepper_sqrt_121:
;Stepper.c,676 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,678 :: 		}
L_Stepper_sqrt_108:
;Stepper.c,679 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_270
NOP	
J	L_Stepper_sqrt_120
NOP	
L_Stepper_sqrt_270:
; q2 end address is: 12 (R3)
;Stepper.c,680 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_271
NOP	
J	L_Stepper_sqrt_109
NOP	
L_Stepper_sqrt_271:
;Stepper.c,681 :: 		return xr +1;             // add for rounding
=======
;Stepper.c,696 :: 		}
J	L_Stepper_sqrt_113
NOP	
L_Stepper_sqrt_126:
;Stepper.c,694 :: 		if(f){
MOVZ	R4, R5, R0
;Stepper.c,696 :: 		}
L_Stepper_sqrt_113:
;Stepper.c,697 :: 		} while(q2 >>= 2);          // shift twice
; xr start address is: 16 (R4)
SRL	R2, R3, 2
MOVZ	R3, R2, R0
BEQ	R2, R0, L_Stepper_sqrt_291
NOP	
J	L_Stepper_sqrt_125
NOP	
L_Stepper_sqrt_291:
; q2 end address is: 12 (R3)
;Stepper.c,698 :: 		if(xr < x){
SLTU	R2, R4, R25
BNE	R2, R0, L_Stepper_sqrt_292
NOP	
J	L_Stepper_sqrt_114
NOP	
L_Stepper_sqrt_292:
;Stepper.c,699 :: 		return xr +1;             // add for rounding
>>>>>>> patch2
ADDIU	R2, R4, 1
; xr end address is: 16 (R4)
J	L_end_sqrt_
NOP	
<<<<<<< HEAD
;Stepper.c,682 :: 		}
L_Stepper_sqrt_109:
;Stepper.c,684 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,686 :: 		}
=======
;Stepper.c,700 :: 		}
L_Stepper_sqrt_114:
;Stepper.c,702 :: 		return xr;
; xr start address is: 16 (R4)
MOVZ	R2, R4, R0
; xr end address is: 16 (R4)
;Stepper.c,704 :: 		}
>>>>>>> patch2
L_end_sqrt_:
JR	RA
NOP	
; end of Stepper_sqrt_
_CycleStop:
<<<<<<< HEAD
;Stepper.c,711 :: 		void CycleStop(){
;Stepper.c,713 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,714 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop111:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStop273
NOP	
J	L_CycleStop112
NOP	
L__CycleStop273:
;Stepper.c,715 :: 		STPS[ii].microSec = 0;
=======
;Stepper.c,729 :: 		void CycleStop(){
;Stepper.c,731 :: 		STmr.uSec = 0;
SW	R0, Offset(_STmr+0)(GP)
;Stepper.c,732 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStop116:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStop294
NOP	
J	L_CycleStop117
NOP	
L__CycleStop294:
;Stepper.c,733 :: 		STPS[ii].microSec = 0;
>>>>>>> patch2
SEH	R3, R4
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
<<<<<<< HEAD
;Stepper.c,716 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStop274
NOP	
J	L_CycleStop114
NOP	
L__CycleStop274:
=======
;Stepper.c,734 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStop295
NOP	
J	L_CycleStop119
NOP	
L__CycleStop295:
; ii end address is: 16 (R4)
J	L_CycleStop117
NOP	
L_CycleStop119:
;Stepper.c,732 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,735 :: 		}
>>>>>>> patch2
; ii end address is: 16 (R4)
J	L_CycleStop116
NOP	
<<<<<<< HEAD
L_CycleStop114:
;Stepper.c,714 :: 		for(ii = 0;ii<NoOfAxis;ii++){
; ii start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,717 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStop111
NOP	
L_CycleStop112:
;Stepper.c,718 :: 		}
=======
L_CycleStop117:
;Stepper.c,736 :: 		}
>>>>>>> patch2
L_end_CycleStop:
JR	RA
NOP	
; end of _CycleStop
_CycleStart:
<<<<<<< HEAD
;Stepper.c,720 :: 		void CycleStart(){
;Stepper.c,723 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+4)(GP)
BEQ	R2, R0, L__CycleStart276
NOP	
J	L_CycleStart115
NOP	
L__CycleStart276:
;Stepper.c,724 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart116:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStart277
NOP	
J	L_CycleStart117
NOP	
L__CycleStart277:
;Stepper.c,725 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStart278
=======
;Stepper.c,738 :: 		void CycleStart(){
;Stepper.c,741 :: 		if(SV.Tog == 0){
LH	R2, Offset(_SV+4)(GP)
BEQ	R2, R0, L__CycleStart297
>>>>>>> patch2
NOP	
J	L_CycleStart119
NOP	
<<<<<<< HEAD
L__CycleStart278:
; ii end address is: 16 (R4)
J	L_CycleStart117
NOP	
L_CycleStart119:
;Stepper.c,726 :: 		STPS[ii].microSec++;
=======
L__CycleStart297:
;Stepper.c,742 :: 		for(ii = 0; ii < NoOfAxis;ii++){
; ii start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 16 (R4)
L_CycleStart121:
; ii start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 6
BNE	R2, R0, L__CycleStart298
NOP	
J	L_CycleStart122
NOP	
L__CycleStart298:
;Stepper.c,743 :: 		if(ii > NoOfAxis)break;
SEH	R2, R4
SLTI	R2, R2, 7
BEQ	R2, R0, L__CycleStart299
NOP	
J	L_CycleStart124
NOP	
L__CycleStart299:
; ii end address is: 16 (R4)
J	L_CycleStart122
NOP	
L_CycleStart124:
;Stepper.c,744 :: 		STPS[ii].microSec++;
>>>>>>> patch2
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
<<<<<<< HEAD
;Stepper.c,724 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,727 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart116
NOP	
L_CycleStart117:
;Stepper.c,728 :: 		}
L_CycleStart115:
;Stepper.c,729 :: 		}
=======
;Stepper.c,742 :: 		for(ii = 0; ii < NoOfAxis;ii++){
ADDIU	R2, R4, 1
SEH	R4, R2
;Stepper.c,745 :: 		}
; ii end address is: 16 (R4)
J	L_CycleStart121
NOP	
L_CycleStart122:
;Stepper.c,746 :: 		}
L_CycleStart120:
;Stepper.c,747 :: 		}
>>>>>>> patch2
L_end_CycleStart:
JR	RA
NOP	
; end of _CycleStart
