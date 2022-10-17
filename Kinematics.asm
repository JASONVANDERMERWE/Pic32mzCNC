_SingleAxisStep:
;Kinematics.c,21 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
<<<<<<< HEAD
;Kinematics.c,27 :: 		SV.Single_Dual = 0;
SW	R25, 4(SP)
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,29 :: 		switch(axis_No){
J	L_SingleAxisStep0
NOP	
;Kinematics.c,30 :: 		case X:
L_SingleAxisStep2:
;Kinematics.c,31 :: 		Single_Axis_Enable(X);
=======
;Kinematics.c,29 :: 		SV.Single_Dual = 0;
SW	R25, 4(SP)
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,30 :: 		sys.axis_dir[axis_No] = GetAxisDirection(newxyz);
SEH	R2, R26
SLL	R3, R2, 1
LUI	R2, hi_addr(_sys+0)
ORI	R2, R2, lo_addr(_sys+0)
ADDU	R2, R2, R3
SW	R2, 16(SP)
SH	R26, 8(SP)
SW	R25, 12(SP)
JAL	_GetAxisDirection+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
LW	R3, 16(SP)
SH	R2, 0(R3)
;Kinematics.c,32 :: 		switch(axis_No){
J	L_SingleAxisStep0
NOP	
;Kinematics.c,33 :: 		case X:
L_SingleAxisStep2:
;Kinematics.c,34 :: 		Single_Axis_Enable(X);
>>>>>>> patch2
SH	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
<<<<<<< HEAD
;Kinematics.c,32 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,33 :: 		case Y:
L_SingleAxisStep3:
;Kinematics.c,34 :: 		Single_Axis_Enable(Y);
=======
;Kinematics.c,35 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,36 :: 		case Y:
L_SingleAxisStep3:
;Kinematics.c,37 :: 		Single_Axis_Enable(Y);
>>>>>>> patch2
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
<<<<<<< HEAD
;Kinematics.c,35 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,36 :: 		case Z:
L_SingleAxisStep4:
;Kinematics.c,37 :: 		Single_Axis_Enable(Z);
=======
;Kinematics.c,38 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,39 :: 		case Z:
L_SingleAxisStep4:
;Kinematics.c,40 :: 		Single_Axis_Enable(Z);
>>>>>>> patch2
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
<<<<<<< HEAD
;Kinematics.c,38 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,39 :: 		case A:
L_SingleAxisStep5:
;Kinematics.c,40 :: 		Single_Axis_Enable(A);
=======
;Kinematics.c,41 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,42 :: 		case A:
L_SingleAxisStep5:
;Kinematics.c,43 :: 		Single_Axis_Enable(A);
>>>>>>> patch2
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 3
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
<<<<<<< HEAD
;Kinematics.c,41 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,42 :: 		default: break;
L_SingleAxisStep6:
J	L_SingleAxisStep1
NOP	
;Kinematics.c,43 :: 		}
=======
;Kinematics.c,44 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,45 :: 		default: break;
L_SingleAxisStep6:
J	L_SingleAxisStep1
NOP	
;Kinematics.c,46 :: 		}
>>>>>>> patch2
L_SingleAxisStep0:
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep94
NOP	
J	L_SingleAxisStep2
NOP	
L__SingleAxisStep94:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep96
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep96:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep98
NOP	
J	L_SingleAxisStep4
NOP	
L__SingleAxisStep98:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep100
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep100:
J	L_SingleAxisStep6
NOP	
L_SingleAxisStep1:
<<<<<<< HEAD
;Kinematics.c,44 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,45 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
=======
;Kinematics.c,47 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,48 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
>>>>>>> patch2
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R25, 0(R2)
<<<<<<< HEAD
;Kinematics.c,46 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
=======
;Kinematics.c,49 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
>>>>>>> patch2
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 16(SP)
SW	R25, 8(SP)
LW	R25, 0(R2)
JAL	_abs+0
NOP	
LW	R25, 8(SP)
SEH	R3, R2
LW	R2, 16(SP)
SW	R3, 0(R2)
<<<<<<< HEAD
;Kinematics.c,48 :: 		if(newxyz < 0)
=======
;Kinematics.c,51 :: 		if(newxyz < 0)
>>>>>>> patch2
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep101
NOP	
J	L_SingleAxisStep7
NOP	
<<<<<<< HEAD
L__SingleAxisStep96:
;Kinematics.c,49 :: 		dir = CCW;
=======
L__SingleAxisStep101:
;Kinematics.c,52 :: 		dir = CCW;
>>>>>>> patch2
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep8
NOP	
L_SingleAxisStep7:
<<<<<<< HEAD
;Kinematics.c,51 :: 		dir = CW;
=======
;Kinematics.c,54 :: 		dir = CW;
>>>>>>> patch2
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep8:
<<<<<<< HEAD
;Kinematics.c,53 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep9
NOP	
;Kinematics.c,54 :: 		case X:
L_SingleAxisStep11:
;Kinematics.c,55 :: 		DIR_StepX = dir;
=======
;Kinematics.c,56 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep9
NOP	
;Kinematics.c,57 :: 		case X:
L_SingleAxisStep11:
;Kinematics.c,58 :: 		DIR_StepX = dir;
>>>>>>> patch2
_LX	
INS	R2, R4, BitPos(DIR_StepX+0), 1
; dir end address is: 16 (R4)
_SX	
<<<<<<< HEAD
;Kinematics.c,56 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,57 :: 		case Y:
L_SingleAxisStep12:
;Kinematics.c,58 :: 		DIR_StepY = dir;
=======
;Kinematics.c,59 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,60 :: 		case Y:
L_SingleAxisStep12:
;Kinematics.c,61 :: 		DIR_StepY = dir;
>>>>>>> patch2
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepY+0), 1
; dir end address is: 16 (R4)
_SX	
<<<<<<< HEAD
;Kinematics.c,59 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,60 :: 		case Z:
L_SingleAxisStep13:
;Kinematics.c,61 :: 		DIR_StepZ = dir;
=======
;Kinematics.c,62 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,63 :: 		case Z:
L_SingleAxisStep13:
;Kinematics.c,64 :: 		DIR_StepZ = dir;
>>>>>>> patch2
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepZ+0), 1
; dir end address is: 16 (R4)
_SX	
<<<<<<< HEAD
;Kinematics.c,62 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,63 :: 		case A:
L_SingleAxisStep14:
;Kinematics.c,64 :: 		DIR_StepA = dir;
=======
;Kinematics.c,65 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,66 :: 		case A:
L_SingleAxisStep14:
;Kinematics.c,67 :: 		DIR_StepA = dir;
>>>>>>> patch2
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepA+0), 1
; dir end address is: 16 (R4)
_SX	
<<<<<<< HEAD
;Kinematics.c,65 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,66 :: 		default: break;
L_SingleAxisStep15:
J	L_SingleAxisStep10
NOP	
;Kinematics.c,67 :: 		}
=======
;Kinematics.c,68 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,69 :: 		default: break;
L_SingleAxisStep15:
J	L_SingleAxisStep10
NOP	
;Kinematics.c,70 :: 		}
>>>>>>> patch2
L_SingleAxisStep9:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep103
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep103:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep105
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep105:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep107
NOP	
J	L_SingleAxisStep13
NOP	
L__SingleAxisStep107:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep109
NOP	
J	L_SingleAxisStep14
NOP	
L__SingleAxisStep109:
; dir end address is: 16 (R4)
J	L_SingleAxisStep15
NOP	
L_SingleAxisStep10:
<<<<<<< HEAD
;Kinematics.c,69 :: 		STPS[axis_No].step_count = 0;
=======
;Kinematics.c,72 :: 		STPS[axis_No].step_count = 0;
>>>>>>> patch2
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
<<<<<<< HEAD
;Kinematics.c,71 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,73 :: 		}
=======
;Kinematics.c,74 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,76 :: 		}
>>>>>>> patch2
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
<<<<<<< HEAD
;Kinematics.c,78 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,79 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+52)(GP)
;Kinematics.c,81 :: 		SV.px = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,82 :: 		SV.py = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,83 :: 		SV.pz = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,84 :: 		SV.d2 = 0;
SW	R0, Offset(_SV+12)(GP)
;Kinematics.c,88 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,90 :: 		switch(axis_combo){
J	L_DualAxisStep16
NOP	
;Kinematics.c,91 :: 		case xy:
L_DualAxisStep18:
;Kinematics.c,92 :: 		AxisPulse[1] = &XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,93 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,94 :: 		Multi_Axis_Enable(axis_xyz);
=======
;Kinematics.c,81 :: 		void DualAxisStep(long axis_a,long axis_b,int axis_combo){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,82 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+52)(GP)
;Kinematics.c,84 :: 		SV.px = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,85 :: 		SV.py = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,86 :: 		SV.pz = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,87 :: 		SV.d2 = 0;
SW	R0, Offset(_SV+12)(GP)
;Kinematics.c,91 :: 		if(axis_combo == xy){
SEH	R2, R27
BEQ	R2, R0, L__DualAxisStep111
NOP	
J	L_DualAxisStep16
NOP	
L__DualAxisStep111:
;Kinematics.c,92 :: 		sys.axis_dir[X] = GetAxisDirection(axis_a);
SH	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
JAL	_GetAxisDirection+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
SH	R2, Offset(_sys+0)(GP)
;Kinematics.c,93 :: 		sys.axis_dir[Y] = GetAxisDirection(axis_b);
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R25, R26, R0
JAL	_GetAxisDirection+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LH	R27, 8(SP)
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,94 :: 		}else if(axis_combo == xz){
J	L_DualAxisStep17
NOP	
L_DualAxisStep16:
SEH	R3, R27
ORI	R2, R0, 1
BEQ	R3, R2, L__DualAxisStep112
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep112:
;Kinematics.c,95 :: 		sys.axis_dir[X] = GetAxisDirection(axis_a);
SH	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
JAL	_GetAxisDirection+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
SH	R2, Offset(_sys+0)(GP)
;Kinematics.c,96 :: 		sys.axis_dir[Z] = GetAxisDirection(axis_b);
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R25, R26, R0
JAL	_GetAxisDirection+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LH	R27, 8(SP)
SH	R2, Offset(_sys+4)(GP)
;Kinematics.c,97 :: 		}else if(axis_combo == yz){
J	L_DualAxisStep19
NOP	
L_DualAxisStep18:
SEH	R3, R27
ORI	R2, R0, 2
BEQ	R3, R2, L__DualAxisStep113
NOP	
J	L_DualAxisStep20
NOP	
L__DualAxisStep113:
;Kinematics.c,98 :: 		sys.axis_dir[Y] = GetAxisDirection(axis_a);
SH	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
JAL	_GetAxisDirection+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
SH	R2, Offset(_sys+2)(GP)
;Kinematics.c,99 :: 		sys.axis_dir[Z] = GetAxisDirection(axis_b);
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R25, R26, R0
JAL	_GetAxisDirection+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LH	R27, 8(SP)
SH	R2, Offset(_sys+4)(GP)
;Kinematics.c,100 :: 		}
L_DualAxisStep20:
L_DualAxisStep19:
L_DualAxisStep17:
;Kinematics.c,101 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,103 :: 		switch(axis_combo){
J	L_DualAxisStep21
NOP	
;Kinematics.c,104 :: 		case xy:
L_DualAxisStep23:
;Kinematics.c,105 :: 		AxisPulse[1] = &XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,106 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,107 :: 		Multi_Axis_Enable(axis_xyz);
>>>>>>> patch2
SW	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
<<<<<<< HEAD
;Kinematics.c,96 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,97 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,100 :: 		SV.dirx = SV.dx > 0? 1:-1;
=======
;Kinematics.c,109 :: 		SV.dx   = axis_a - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,110 :: 		SV.dy   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,113 :: 		SV.dirx = SV.dx > 0? 1:-1;
>>>>>>> patch2
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep114
NOP	
J	L_DualAxisStep24
NOP	
L__DualAxisStep114:
; ?FLOC___DualAxisStep?T52 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T52 end address is: 12 (R3)
J	L_DualAxisStep25
NOP	
L_DualAxisStep24:
; ?FLOC___DualAxisStep?T52 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T52 end address is: 12 (R3)
L_DualAxisStep25:
; ?FLOC___DualAxisStep?T52 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T52 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
<<<<<<< HEAD
;Kinematics.c,101 :: 		SV.diry = SV.dy > 0? 1:-1;
=======
;Kinematics.c,114 :: 		SV.diry = SV.dy > 0? 1:-1;
>>>>>>> patch2
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep115
NOP	
J	L_DualAxisStep26
NOP	
L__DualAxisStep115:
; ?FLOC___DualAxisStep?T54 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T54 end address is: 12 (R3)
J	L_DualAxisStep27
NOP	
L_DualAxisStep26:
; ?FLOC___DualAxisStep?T54 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T54 end address is: 12 (R3)
L_DualAxisStep27:
; ?FLOC___DualAxisStep?T54 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T54 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
<<<<<<< HEAD
;Kinematics.c,104 :: 		if(SV.dirx < 0)
=======
;Kinematics.c,117 :: 		if(SV.dirx < 0)
>>>>>>> patch2
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep116
NOP	
J	L_DualAxisStep28
NOP	
<<<<<<< HEAD
L__DualAxisStep108:
;Kinematics.c,105 :: 		DIR_StepX = CCW;
=======
L__DualAxisStep116:
;Kinematics.c,118 :: 		DIR_StepX = CCW;
>>>>>>> patch2
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep29
NOP	
<<<<<<< HEAD
L_DualAxisStep23:
;Kinematics.c,107 :: 		DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep24:
;Kinematics.c,109 :: 		if(SV.diry < 0)
=======
L_DualAxisStep28:
;Kinematics.c,120 :: 		DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep29:
;Kinematics.c,123 :: 		if(SV.diry < 0)
>>>>>>> patch2
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep117
NOP	
J	L_DualAxisStep30
NOP	
<<<<<<< HEAD
L__DualAxisStep109:
;Kinematics.c,110 :: 		DIR_StepY = CCW;
=======
L__DualAxisStep117:
;Kinematics.c,124 :: 		DIR_StepY = CCW;
>>>>>>> patch2
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep31
NOP	
<<<<<<< HEAD
L_DualAxisStep25:
;Kinematics.c,112 :: 		DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep26:
;Kinematics.c,114 :: 		SV.dx = abs(SV.dx);
=======
L_DualAxisStep30:
;Kinematics.c,126 :: 		DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep31:
;Kinematics.c,129 :: 		SV.dx = abs(SV.dx);
>>>>>>> patch2
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
<<<<<<< HEAD
;Kinematics.c,115 :: 		SV.dy = abs(SV.dy);
=======
;Kinematics.c,130 :: 		SV.dy = abs(SV.dy);
>>>>>>> patch2
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
<<<<<<< HEAD
;Kinematics.c,117 :: 		if(SV.dx > SV.dy){
=======
;Kinematics.c,132 :: 		if(SV.dx > SV.dy)
>>>>>>> patch2
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep118
NOP	
J	L_DualAxisStep32
NOP	
<<<<<<< HEAD
L__DualAxisStep110:
;Kinematics.c,118 :: 		SV.d2 = 2*(SV.dy - SV.dx);
=======
L__DualAxisStep118:
;Kinematics.c,133 :: 		SV.d2 = 2*(SV.dy - SV.dx);
>>>>>>> patch2
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Kinematics.c,119 :: 		}
J	L_DualAxisStep28
NOP	
L_DualAxisStep27:
;Kinematics.c,121 :: 		SV.d2 = 2* (SV.dx - SV.dy);
=======
J	L_DualAxisStep33
NOP	
L_DualAxisStep32:
;Kinematics.c,135 :: 		SV.d2 = 2* (SV.dx - SV.dy);
>>>>>>> patch2
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
;Kinematics.c,122 :: 		}
L_DualAxisStep28:
;Kinematics.c,123 :: 		if(SV.dx >= SV.dy){
=======
L_DualAxisStep33:
;Kinematics.c,137 :: 		if(SV.dx >= SV.dy){
>>>>>>> patch2
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R2, R3
BEQ	R2, R0, L__DualAxisStep119
NOP	
J	L_DualAxisStep34
NOP	
<<<<<<< HEAD
L__DualAxisStep111:
;Kinematics.c,124 :: 		STPS[X].master = 1;
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,125 :: 		STPS[Y].master = 0;
LBU	R2, Offset(_STPS+72)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+72)(GP)
;Kinematics.c,126 :: 		}else{
J	L_DualAxisStep30
NOP	
L_DualAxisStep29:
;Kinematics.c,127 :: 		STPS[X].master = 0;
LBU	R2, Offset(_STPS+4)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,128 :: 		STPS[Y].master = 1;
LBU	R2, Offset(_STPS+72)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+72)(GP)
;Kinematics.c,129 :: 		}
L_DualAxisStep30:
;Kinematics.c,131 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,132 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,133 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,135 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,136 :: 		case xz:
L_DualAxisStep31:
;Kinematics.c,137 :: 		AxisPulse[1] = &XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,138 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,139 :: 		Multi_Axis_Enable(axis_xyz);
=======
L__DualAxisStep119:
;Kinematics.c,138 :: 		STPS[X].master = 1;
LBU	R2, Offset(_STPS+4)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,139 :: 		STPS[Y].master = 0;
LBU	R2, Offset(_STPS+72)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+72)(GP)
;Kinematics.c,140 :: 		}else{
J	L_DualAxisStep35
NOP	
L_DualAxisStep34:
;Kinematics.c,141 :: 		STPS[X].master = 0;
LBU	R2, Offset(_STPS+4)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_STPS+4)(GP)
;Kinematics.c,142 :: 		STPS[Y].master = 1;
LBU	R2, Offset(_STPS+72)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_STPS+72)(GP)
;Kinematics.c,143 :: 		}
L_DualAxisStep35:
;Kinematics.c,145 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,146 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,147 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,149 :: 		break;
J	L_DualAxisStep22
NOP	
;Kinematics.c,150 :: 		case xz:
L_DualAxisStep36:
;Kinematics.c,151 :: 		AxisPulse[1] = &XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,152 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,153 :: 		Multi_Axis_Enable(axis_xyz);
>>>>>>> patch2
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
<<<<<<< HEAD
;Kinematics.c,141 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,142 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,145 :: 		SV.dirx = SV.dx > 0?1:-1;
=======
;Kinematics.c,155 :: 		SV.dx   = axis_a - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,156 :: 		SV.dz   = axis_b - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,159 :: 		SV.dirx = SV.dx > 0?1:-1;
>>>>>>> patch2
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep120
NOP	
J	L_DualAxisStep37
NOP	
L__DualAxisStep120:
; ?FLOC___DualAxisStep?T83 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T83 end address is: 12 (R3)
J	L_DualAxisStep38
NOP	
L_DualAxisStep37:
; ?FLOC___DualAxisStep?T83 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T83 end address is: 12 (R3)
L_DualAxisStep38:
; ?FLOC___DualAxisStep?T83 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T83 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
<<<<<<< HEAD
;Kinematics.c,146 :: 		SV.dirz = SV.dz > 0?1:-1;
=======
;Kinematics.c,160 :: 		SV.dirz = SV.dz > 0?1:-1;
>>>>>>> patch2
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep121
NOP	
J	L_DualAxisStep39
NOP	
L__DualAxisStep121:
; ?FLOC___DualAxisStep?T85 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T85 end address is: 12 (R3)
J	L_DualAxisStep40
NOP	
L_DualAxisStep39:
; ?FLOC___DualAxisStep?T85 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T85 end address is: 12 (R3)
L_DualAxisStep40:
; ?FLOC___DualAxisStep?T85 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T85 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
<<<<<<< HEAD
;Kinematics.c,149 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
=======
;Kinematics.c,163 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
>>>>>>> patch2
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep122
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep122:
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep42
NOP	
<<<<<<< HEAD
L_DualAxisStep36:
;Kinematics.c,150 :: 		else DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep37:
;Kinematics.c,152 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
=======
L_DualAxisStep41:
;Kinematics.c,164 :: 		else DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep42:
;Kinematics.c,166 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
>>>>>>> patch2
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep123
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep123:
_LX	
ORI	R2, R2, BitMask(DIR_StepZ+0)
_SX	
J	L_DualAxisStep44
NOP	
<<<<<<< HEAD
L_DualAxisStep38:
;Kinematics.c,153 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep39:
;Kinematics.c,155 :: 		SV.dx = abs(SV.dx);
=======
L_DualAxisStep43:
;Kinematics.c,167 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep44:
;Kinematics.c,169 :: 		SV.dx = abs(SV.dx);
>>>>>>> patch2
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
<<<<<<< HEAD
;Kinematics.c,156 :: 		SV.dz = abs(SV.dz);
=======
;Kinematics.c,170 :: 		SV.dz = abs(SV.dz);
>>>>>>> patch2
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
<<<<<<< HEAD
;Kinematics.c,158 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
=======
;Kinematics.c,172 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
>>>>>>> patch2
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep124
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep124:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep46
NOP	
<<<<<<< HEAD
L_DualAxisStep40:
;Kinematics.c,159 :: 		else d2 = 2* (SV.dx - SV.dz);
=======
L_DualAxisStep45:
;Kinematics.c,173 :: 		else d2 = 2* (SV.dx - SV.dz);
>>>>>>> patch2
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
<<<<<<< HEAD
L_DualAxisStep41:
;Kinematics.c,161 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,162 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,163 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,164 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,165 :: 		case yz:
L_DualAxisStep42:
;Kinematics.c,166 :: 		AxisPulse[1] = &YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,167 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,168 :: 		Multi_Axis_Enable(axis_xyz);
=======
L_DualAxisStep46:
;Kinematics.c,175 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,176 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,177 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,178 :: 		break;
J	L_DualAxisStep22
NOP	
;Kinematics.c,179 :: 		case yz:
L_DualAxisStep47:
;Kinematics.c,180 :: 		AxisPulse[1] = &YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,181 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,182 :: 		Multi_Axis_Enable(axis_xyz);
>>>>>>> patch2
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
<<<<<<< HEAD
;Kinematics.c,171 :: 		SV.dy   = newx - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,172 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,175 :: 		SV.diry = SV.dy > 0?1:-1;
=======
;Kinematics.c,185 :: 		SV.dy   = axis_a - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,186 :: 		SV.dz   = axis_b - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,189 :: 		SV.diry = SV.dy > 0?1:-1;
>>>>>>> patch2
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep125
NOP	
J	L_DualAxisStep48
NOP	
L__DualAxisStep125:
; ?FLOC___DualAxisStep?T101 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T101 end address is: 12 (R3)
J	L_DualAxisStep49
NOP	
L_DualAxisStep48:
; ?FLOC___DualAxisStep?T101 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T101 end address is: 12 (R3)
L_DualAxisStep49:
; ?FLOC___DualAxisStep?T101 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T101 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
<<<<<<< HEAD
;Kinematics.c,176 :: 		SV.dirz = SV.dz > 0?1:-1;
=======
;Kinematics.c,190 :: 		SV.dirz = SV.dz > 0?1:-1;
>>>>>>> patch2
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep126
NOP	
J	L_DualAxisStep50
NOP	
L__DualAxisStep126:
; ?FLOC___DualAxisStep?T103 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T103 end address is: 12 (R3)
J	L_DualAxisStep51
NOP	
L_DualAxisStep50:
; ?FLOC___DualAxisStep?T103 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T103 end address is: 12 (R3)
L_DualAxisStep51:
; ?FLOC___DualAxisStep?T103 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T103 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
<<<<<<< HEAD
;Kinematics.c,179 :: 		if(SV.diry < 0)DIR_StepY = CCW;
=======
;Kinematics.c,193 :: 		if(SV.diry < 0)DIR_StepY = CCW;
>>>>>>> patch2
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep127
NOP	
J	L_DualAxisStep52
NOP	
L__DualAxisStep127:
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep53
NOP	
<<<<<<< HEAD
L_DualAxisStep47:
;Kinematics.c,180 :: 		else DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep48:
;Kinematics.c,181 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
=======
L_DualAxisStep52:
;Kinematics.c,194 :: 		else DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep53:
;Kinematics.c,195 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
>>>>>>> patch2
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep128
NOP	
J	L_DualAxisStep54
NOP	
L__DualAxisStep128:
_LX	
ORI	R2, R2, BitMask(DIR_StepZ+0)
_SX	
J	L_DualAxisStep55
NOP	
<<<<<<< HEAD
L_DualAxisStep49:
;Kinematics.c,182 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep50:
;Kinematics.c,184 :: 		SV.dy = abs(SV.dy);
=======
L_DualAxisStep54:
;Kinematics.c,196 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep55:
;Kinematics.c,198 :: 		SV.dy = abs(SV.dy);
>>>>>>> patch2
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
<<<<<<< HEAD
;Kinematics.c,185 :: 		SV.dz = abs(SV.dz);
=======
;Kinematics.c,199 :: 		SV.dz = abs(SV.dz);
>>>>>>> patch2
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
<<<<<<< HEAD
;Kinematics.c,187 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
=======
;Kinematics.c,201 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
>>>>>>> patch2
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep129
NOP	
J	L_DualAxisStep56
NOP	
L__DualAxisStep129:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep57
NOP	
<<<<<<< HEAD
L_DualAxisStep51:
;Kinematics.c,188 :: 		else SV.d2 = 2* (SV.dy - SV.dz);
=======
L_DualAxisStep56:
;Kinematics.c,202 :: 		else SV.d2 = 2* (SV.dy - SV.dz);
>>>>>>> patch2
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
<<<<<<< HEAD
L_DualAxisStep52:
;Kinematics.c,190 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,191 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,192 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,193 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,194 :: 		default: break;
L_DualAxisStep53:
J	L_DualAxisStep17
NOP	
;Kinematics.c,196 :: 		}
L_DualAxisStep16:
=======
L_DualAxisStep57:
;Kinematics.c,204 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,205 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,206 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,207 :: 		break;
J	L_DualAxisStep22
NOP	
;Kinematics.c,208 :: 		default: break;
L_DualAxisStep58:
J	L_DualAxisStep22
NOP	
;Kinematics.c,210 :: 		}
L_DualAxisStep21:
>>>>>>> patch2
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep131
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep131:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep133
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep133:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep135
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep135:
J	L_DualAxisStep58
NOP	
<<<<<<< HEAD
L_DualAxisStep17:
;Kinematics.c,197 :: 		}
=======
L_DualAxisStep22:
;Kinematics.c,211 :: 		}
>>>>>>> patch2
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _DualAxisStep
_r_or_ijk:
<<<<<<< HEAD
;Kinematics.c,216 :: 		void r_or_ijk(double Cur_axis_a,double Cur_axis_b,double Fin_axis_a,double Fin_axis_b,double r, double i, double j, double k, int axis_xyz){
=======
;Kinematics.c,230 :: 		void r_or_ijk(double Cur_axis_a,double Cur_axis_b,double Fin_axis_a,double Fin_axis_b,double r, double i, double j, double k, int axis_xyz){
>>>>>>> patch2
ADDIU	SP, SP, -120
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
; r start address is: 32 (R8)
LWC1	S4, 120(SP)
; i start address is: 8 (R2)
LWC1	S1, 124(SP)
; j start address is: 16 (R4)
LWC1	S2, 128(SP)
; k start address is: 0 (R0)
LWC1	S0, 132(SP)
; k end address is: 0 (R0)
<<<<<<< HEAD
;Kinematics.c,217 :: 		unsigned short isclockwise = 0;
;Kinematics.c,218 :: 		double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Kinematics.c,222 :: 		double x = 0.00;
;Kinematics.c,223 :: 		double y = 0.00;
; y start address is: 24 (R6)
MTC1	R0, S3
;Kinematics.c,224 :: 		double h_x2_div_d = 0.00;
;Kinematics.c,228 :: 		position[X] = Cur_axis_a;
ADDIU	R2, SP, 24
SWC1	S12, 0(R2)
;Kinematics.c,229 :: 		position[Y] = Cur_axis_b;
ADDIU	R2, R2, 4
SWC1	S13, 0(R2)
;Kinematics.c,230 :: 		target[X] = Fin_axis_a;
ADDIU	R2, SP, 48
SWC1	S14, 0(R2)
;Kinematics.c,231 :: 		target[Y] = Fin_axis_b;
ADDIU	R2, R2, 4
SWC1	S15, 0(R2)
;Kinematics.c,232 :: 		offset[X] = i;
ADDIU	R2, SP, 72
SWC1	S1, 0(R2)
;Kinematics.c,233 :: 		offset[Y] = j;
ADDIU	R2, R2, 4
SWC1	S2, 0(R2)
;Kinematics.c,234 :: 		if(axis_xyz == xy){
=======
;Kinematics.c,231 :: 		unsigned short isclockwise = 0;
;Kinematics.c,232 :: 		double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Kinematics.c,236 :: 		double x = 0.00;
;Kinematics.c,237 :: 		double y = 0.00;
; y start address is: 24 (R6)
MTC1	R0, S3
;Kinematics.c,238 :: 		double h_x2_div_d = 0.00;
;Kinematics.c,242 :: 		position[X] = Cur_axis_a;
ADDIU	R2, SP, 24
SWC1	S12, 0(R2)
;Kinematics.c,243 :: 		position[Y] = Cur_axis_b;
ADDIU	R2, R2, 4
SWC1	S13, 0(R2)
;Kinematics.c,244 :: 		target[X] = Fin_axis_a;
ADDIU	R2, SP, 48
SWC1	S14, 0(R2)
;Kinematics.c,245 :: 		target[Y] = Fin_axis_b;
ADDIU	R2, R2, 4
SWC1	S15, 0(R2)
;Kinematics.c,246 :: 		offset[X] = i;
ADDIU	R2, SP, 72
SWC1	S1, 0(R2)
;Kinematics.c,247 :: 		offset[Y] = j;
ADDIU	R2, R2, 4
SWC1	S2, 0(R2)
;Kinematics.c,248 :: 		if(axis_xyz == xy){
>>>>>>> patch2
SEH	R2, R25
BEQ	R2, R0, L__r_or_ijk137
NOP	
J	L_r_or_ijk59
NOP	
L__r_or_ijk137:
; y end address is: 24 (R6)
<<<<<<< HEAD
;Kinematics.c,235 :: 		axis_plane_a = X;
SH	R0, 96(SP)
;Kinematics.c,236 :: 		axis_plane_b = Y;
ORI	R2, R0, 1
SH	R2, 98(SP)
;Kinematics.c,237 :: 		}else if(axis_xyz == xz){
J	L_r_or_ijk55
=======
;Kinematics.c,249 :: 		axis_plane_a = X;
SH	R0, 96(SP)
;Kinematics.c,250 :: 		axis_plane_b = Y;
ORI	R2, R0, 1
SH	R2, 98(SP)
;Kinematics.c,251 :: 		}else if(axis_xyz == xz){
J	L_r_or_ijk60
>>>>>>> patch2
NOP	
L_r_or_ijk59:
; y start address is: 24 (R6)
SEH	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__r_or_ijk138
NOP	
J	L_r_or_ijk61
NOP	
L__r_or_ijk138:
; y end address is: 24 (R6)
<<<<<<< HEAD
;Kinematics.c,238 :: 		axis_plane_a = X;
SH	R0, 96(SP)
;Kinematics.c,239 :: 		axis_plane_b = Z;
ORI	R2, R0, 2
SH	R2, 98(SP)
;Kinematics.c,240 :: 		}else if(axis_xyz == yz){
J	L_r_or_ijk57
=======
;Kinematics.c,252 :: 		axis_plane_a = X;
SH	R0, 96(SP)
;Kinematics.c,253 :: 		axis_plane_b = Z;
ORI	R2, R0, 2
SH	R2, 98(SP)
;Kinematics.c,254 :: 		}else if(axis_xyz == yz){
J	L_r_or_ijk62
>>>>>>> patch2
NOP	
L_r_or_ijk61:
; y start address is: 24 (R6)
SEH	R3, R25
ORI	R2, R0, 2
BEQ	R3, R2, L__r_or_ijk139
NOP	
J	L_r_or_ijk63
NOP	
<<<<<<< HEAD
L__r_or_ijk131:
;Kinematics.c,241 :: 		axis_plane_a = y;
=======
L__r_or_ijk139:
;Kinematics.c,255 :: 		axis_plane_a = y;
>>>>>>> patch2
MOV.S 	S0, S3
; y end address is: 24 (R6)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 96(SP)
<<<<<<< HEAD
;Kinematics.c,242 :: 		axis_plane_b = Z;
ORI	R2, R0, 2
SH	R2, 98(SP)
;Kinematics.c,243 :: 		}
L_r_or_ijk58:
L_r_or_ijk57:
L_r_or_ijk55:
;Kinematics.c,245 :: 		if (r != 0.00) { // Arc Radius Mode
=======
;Kinematics.c,256 :: 		axis_plane_b = Z;
ORI	R2, R0, 2
SH	R2, 98(SP)
;Kinematics.c,257 :: 		}
L_r_or_ijk63:
L_r_or_ijk62:
L_r_or_ijk60:
;Kinematics.c,259 :: 		if (r != 0.00) { // Arc Radius Mode
>>>>>>> patch2
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S4, S0
BC1F	0, L__r_or_ijk140
NOP	
J	L_r_or_ijk64
NOP	
L__r_or_ijk140:
; i end address is: 8 (R2)
; j end address is: 16 (R4)
<<<<<<< HEAD
;Kinematics.c,309 :: 		x = target[axis_plane_a] - position[axis_plane_a];
=======
;Kinematics.c,323 :: 		x = target[axis_plane_a] - position[axis_plane_a];
>>>>>>> patch2
ADDIU	R5, SP, 48
LHU	R2, 96(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDIU	R4, SP, 24
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S3, S1, S0
; x start address is: 40 (R10)
MOV.S 	S5, S3
<<<<<<< HEAD
;Kinematics.c,311 :: 		y = target[axis_plane_b] - position[axis_plane_b];
=======
;Kinematics.c,325 :: 		y = target[axis_plane_b] - position[axis_plane_b];
>>>>>>> patch2
LHU	R2, 98(SP)
SLL	R3, R2, 2
ADDU	R2, R5, R3
LWC1	S1, 0(R2)
ADDU	R2, R4, R3
LWC1	S0, 0(R2)
SUB.S 	S2, S1, S0
; y start address is: 48 (R12)
MOV.S 	S6, S2
<<<<<<< HEAD
;Kinematics.c,315 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
=======
;Kinematics.c,329 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
>>>>>>> patch2
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S4
MUL.S 	S1, S0, S4
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S2, S2
SUB.S 	S0, S1, S0
<<<<<<< HEAD
;Kinematics.c,318 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
=======
;Kinematics.c,332 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
>>>>>>> patch2
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S0, S1, S0
SWC1	S0, 116(SP)
MOV.S 	S13, S6
MOV.S 	S12, S5
JAL	_hypot+0
NOP	
LWC1	S1, 116(SP)
DIV.S 	S0, S1, S0
; h_x2_div_d start address is: 8 (R2)
MOV.S 	S1, S0
<<<<<<< HEAD
;Kinematics.c,320 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
=======
;Kinematics.c,334 :: 		if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }
>>>>>>> patch2
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__r_or_ijk141
NOP	
J	L__r_or_ijk89
NOP	
L__r_or_ijk141:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
MOV.S 	S1, S0
; h_x2_div_d end address is: 8 (R2)
J	L_r_or_ijk65
NOP	
<<<<<<< HEAD
L__r_or_ijk84:
L_r_or_ijk60:
;Kinematics.c,343 :: 		if (r < 0) {
=======
L__r_or_ijk89:
L_r_or_ijk65:
;Kinematics.c,357 :: 		if (r < 0) {
>>>>>>> patch2
; h_x2_div_d start address is: 8 (R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S4
BC1F	0, L__r_or_ijk142
NOP	
J	L__r_or_ijk90
NOP	
<<<<<<< HEAD
L__r_or_ijk134:
;Kinematics.c,344 :: 		h_x2_div_d = -h_x2_div_d;
=======
L__r_or_ijk142:
;Kinematics.c,358 :: 		h_x2_div_d = -h_x2_div_d;
>>>>>>> patch2
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
; h_x2_div_d end address is: 8 (R2)
; h_x2_div_d start address is: 24 (R6)
MOV.S 	S3, S0
<<<<<<< HEAD
;Kinematics.c,345 :: 		r = -r; // Finished with r. Set to positive for mc_arc
=======
;Kinematics.c,359 :: 		r = -r; // Finished with r. Set to positive for mc_arc
>>>>>>> patch2
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S4
; r end address is: 32 (R8)
; r start address is: 16 (R4)
MOV.S 	S2, S0
; r end address is: 16 (R4)
; h_x2_div_d end address is: 24 (R6)
<<<<<<< HEAD
;Kinematics.c,346 :: 		}
J	L_r_or_ijk61
NOP	
L__r_or_ijk85:
;Kinematics.c,343 :: 		if (r < 0) {
MOV.S 	S2, S4
MOV.S 	S3, S1
;Kinematics.c,346 :: 		}
L_r_or_ijk61:
;Kinematics.c,349 :: 		i =  0.5*(x-(y*h_x2_div_d));
=======
;Kinematics.c,360 :: 		}
J	L_r_or_ijk66
NOP	
L__r_or_ijk90:
;Kinematics.c,357 :: 		if (r < 0) {
MOV.S 	S2, S4
MOV.S 	S3, S1
;Kinematics.c,360 :: 		}
L_r_or_ijk66:
;Kinematics.c,363 :: 		i =  0.5*(x-(y*h_x2_div_d));
>>>>>>> patch2
; r start address is: 16 (R4)
; h_x2_div_d start address is: 24 (R6)
MUL.S 	S0, S6, S3
SUB.S 	S1, S5, S0
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
; i start address is: 0 (R0)
; i end address is: 0 (R0)
<<<<<<< HEAD
;Kinematics.c,351 :: 		j =  0.5*(y+(x*h_x2_div_d));
=======
;Kinematics.c,365 :: 		j =  0.5*(y+(x*h_x2_div_d));
>>>>>>> patch2
MUL.S 	S0, S5, S3
; x end address is: 40 (R10)
; h_x2_div_d end address is: 24 (R6)
ADD.S 	S1, S6, S0
; y end address is: 48 (R12)
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
; j start address is: 0 (R0)
; j end address is: 0 (R0)
<<<<<<< HEAD
;Kinematics.c,352 :: 		} else {
=======
;Kinematics.c,366 :: 		} else {
>>>>>>> patch2
MOV.S 	S1, S2
; r end address is: 16 (R4)
J	L_r_or_ijk67
NOP	
<<<<<<< HEAD
L_r_or_ijk59:
;Kinematics.c,355 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
=======
L_r_or_ijk64:
;Kinematics.c,369 :: 		r = hypot(i, j); // Compute arc radius for mc_arc
>>>>>>> patch2
; j start address is: 16 (R4)
; i start address is: 8 (R2)
MOV.S 	S13, S2
; j end address is: 16 (R4)
MOV.S 	S12, S1
; i end address is: 8 (R2)
JAL	_hypot+0
NOP	
; r start address is: 8 (R2)
MOV.S 	S1, S0
; r end address is: 8 (R2)
<<<<<<< HEAD
;Kinematics.c,356 :: 		}
L_r_or_ijk62:
;Kinematics.c,357 :: 		sprintf(txt_,"%0.2f",r);
=======
;Kinematics.c,370 :: 		}
L_r_or_ijk67:
;Kinematics.c,371 :: 		sprintf(txt_,"%0.2f",r);
>>>>>>> patch2
; r start address is: 8 (R2)
ADDIU	R3, SP, 100
SWC1	S1, 20(SP)
ADDIU	SP, SP, -12
SWC1	S1, 8(SP)
LUI	R2, hi_addr(?lstr_1_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_1_Kinematics+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LWC1	S1, 20(SP)
<<<<<<< HEAD
;Kinematics.c,358 :: 		UART2_Write_Text("r:= ");
=======
;Kinematics.c,372 :: 		UART2_Write_Text("r:= ");
>>>>>>> patch2
ORI	R30, R0, 114
SB	R30, 109(SP)
ORI	R30, R0, 58
SB	R30, 110(SP)
ORI	R30, R0, 61
SB	R30, 111(SP)
ORI	R30, R0, 32
SB	R30, 112(SP)
MOVZ	R30, R0, R0
SB	R30, 113(SP)
ADDIU	R2, SP, 109
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
<<<<<<< HEAD
;Kinematics.c,359 :: 		UART2_Write_Text(txt_);
=======
;Kinematics.c,373 :: 		UART2_Write_Text(txt_);
>>>>>>> patch2
ADDIU	R2, SP, 100
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
<<<<<<< HEAD
;Kinematics.c,360 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Kinematics.c,363 :: 		isclockwise = false;
; isclockwise start address is: 24 (R6)
MOVZ	R6, R0, R0
;Kinematics.c,364 :: 		if (gc.motion_mode == MOTION_MODE_CW_ARC) { isclockwise = true; }
=======
;Kinematics.c,374 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Kinematics.c,377 :: 		isclockwise = false;
; isclockwise start address is: 24 (R6)
MOVZ	R6, R0, R0
;Kinematics.c,378 :: 		if (gc.motion_mode == MOTION_MODE_CW_ARC) { isclockwise = true; }
>>>>>>> patch2
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__r_or_ijk143
NOP	
J	L__r_or_ijk91
NOP	
L__r_or_ijk143:
ORI	R6, R0, 1
; isclockwise end address is: 24 (R6)
J	L_r_or_ijk68
NOP	
<<<<<<< HEAD
L__r_or_ijk86:
L_r_or_ijk63:
;Kinematics.c,366 :: 		gc.plane_axis_2 =1;
; isclockwise start address is: 24 (R6)
ORI	R2, R0, 1
SB	R2, Offset(_gc+27)(GP)
;Kinematics.c,368 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
ADDIU	R5, SP, 72
ADDIU	R4, SP, 48
ADDIU	R3, SP, 24
;Kinematics.c,369 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
LUI	R2, 17274
ORI	R2, R2, 0
;Kinematics.c,370 :: 		r, isclockwise);
MOV.S 	S13, S1
; r end address is: 8 (R2)
;Kinematics.c,369 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
MTC1	R2, S12
;Kinematics.c,368 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
=======
L__r_or_ijk91:
L_r_or_ijk68:
;Kinematics.c,380 :: 		gc.plane_axis_2 =1;
; isclockwise start address is: 24 (R6)
ORI	R2, R0, 1
SB	R2, Offset(_gc+27)(GP)
;Kinematics.c,382 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
ADDIU	R5, SP, 72
ADDIU	R4, SP, 48
ADDIU	R3, SP, 24
;Kinematics.c,383 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
LUI	R2, 17274
ORI	R2, R2, 0
;Kinematics.c,384 :: 		r, isclockwise);
MOV.S 	S13, S1
; r end address is: 8 (R2)
;Kinematics.c,383 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
MTC1	R2, S12
;Kinematics.c,382 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
>>>>>>> patch2
LBU	R28, Offset(_gc+25)(GP)
MOVZ	R27, R5, R0
MOVZ	R26, R4, R0
MOVZ	R25, R3, R0
<<<<<<< HEAD
;Kinematics.c,370 :: 		r, isclockwise);
ADDIU	SP, SP, -4
SB	R6, 3(SP)
; isclockwise end address is: 24 (R6)
;Kinematics.c,369 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
LBU	R2, Offset(_gc+2)(GP)
SB	R2, 2(SP)
;Kinematics.c,368 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
=======
;Kinematics.c,384 :: 		r, isclockwise);
ADDIU	SP, SP, -4
SB	R6, 3(SP)
; isclockwise end address is: 24 (R6)
;Kinematics.c,383 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
LBU	R2, Offset(_gc+2)(GP)
SB	R2, 2(SP)
;Kinematics.c,382 :: 		mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
>>>>>>> patch2
ORI	R2, R0, 1
SB	R2, 1(SP)
LBU	R2, Offset(_gc+26)(GP)
SB	R2, 0(SP)
<<<<<<< HEAD
;Kinematics.c,370 :: 		r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 4
;Kinematics.c,371 :: 		}
=======
;Kinematics.c,384 :: 		r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 4
;Kinematics.c,385 :: 		}
>>>>>>> patch2
L_end_r_or_ijk:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 120
JR	RA
NOP	
; end of _r_or_ijk
_mc_arc:
<<<<<<< HEAD
;Kinematics.c,376 :: 		uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
ADDIU	SP, SP, -84
=======
;Kinematics.c,390 :: 		uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
ADDIU	SP, SP, -88
>>>>>>> patch2
SW	RA, 0(SP)
LBU	R2, 88(SP)
SB	R2, 88(SP)
LBU	R2, 89(SP)
SB	R2, 89(SP)
; invert_feed_rate start address is: 16 (R4)
LBU	R4, 90(SP)
; isclockwise start address is: 20 (R5)
<<<<<<< HEAD
LBU	R5, 87(SP)
;Kinematics.c,378 :: 		double center_axis0            = position[X] + offset[X];
=======
LBU	R5, 91(SP)
;Kinematics.c,392 :: 		double center_axis0            = position[X] + offset[X];
>>>>>>> patch2
LWC1	S6, 0(R25)
LWC1	S5, 0(R27)
ADD.S 	S4, S6, S5
SWC1	S4, 20(SP)
<<<<<<< HEAD
;Kinematics.c,379 :: 		double center_axis1             = position[Y] + offset[Y];
=======
;Kinematics.c,393 :: 		double center_axis1             = position[Y] + offset[Y];
>>>>>>> patch2
ADDIU	R2, R25, 4
LWC1	S1, 0(R2)
ADDIU	R2, R27, 4
LWC1	S0, 0(R2)
ADD.S 	S3, S1, S0
SWC1	S3, 24(SP)
<<<<<<< HEAD
;Kinematics.c,380 :: 		double linear_travel           = target[X] - position[X];
=======
;Kinematics.c,394 :: 		double linear_travel           = target[X] - position[X];
>>>>>>> patch2
LWC1	S2, 0(R26)
SUB.S 	S0, S2, S6
; linear_travel start address is: 48 (R12)
MOV.S 	S6, S0
<<<<<<< HEAD
;Kinematics.c,381 :: 		double r_axis0                 = -offset[X];  // Radius vector from center to current location
=======
;Kinematics.c,395 :: 		double r_axis0                 = -offset[X];  // Radius vector from center to current location
>>>>>>> patch2
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 28(SP)
<<<<<<< HEAD
;Kinematics.c,382 :: 		double r_axis1                 = -offset[Y];
=======
;Kinematics.c,396 :: 		double r_axis1                 = -offset[Y];
>>>>>>> patch2
ADDIU	R2, R27, 4
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 32(SP)
<<<<<<< HEAD
;Kinematics.c,383 :: 		double rt_axis0                = target[X] - center_axis0;
SUB.S 	S0, S2, S4
; rt_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,384 :: 		double rt_axis1                 = target[Y] - center_axis1;
=======
;Kinematics.c,397 :: 		double rt_axis0                = target[X] - center_axis0;
SUB.S 	S0, S2, S4
; rt_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,398 :: 		double rt_axis1                 = target[Y] - center_axis1;
>>>>>>> patch2
ADDIU	R2, R26, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S3
; rt_axis1 start address is: 24 (R6)
MOV.S 	S3, S0
<<<<<<< HEAD
;Kinematics.c,385 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,386 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,387 :: 		double angular_travel          = 0.00;
;Kinematics.c,388 :: 		double millimeters_of_travel   = 0.00;
;Kinematics.c,389 :: 		uint16_t segments              = 0;
;Kinematics.c,390 :: 		double cos_T                   = 0.00;
;Kinematics.c,391 :: 		double sin_T                   = 0.00;
;Kinematics.c,398 :: 		int8_t count = 0;
MOVZ	R30, R0, R0
SB	R30, 56(SP)
;Kinematics.c,403 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
=======
;Kinematics.c,399 :: 		double theta_per_segment       = 0.00;
;Kinematics.c,400 :: 		double linear_per_segment      = 0.00;
;Kinematics.c,401 :: 		double angular_travel          = 0.00;
;Kinematics.c,402 :: 		double millimeters_of_travel   = 0.00;
;Kinematics.c,403 :: 		uint16_t segments              = 0;
;Kinematics.c,404 :: 		double cos_T                   = 0.00;
;Kinematics.c,405 :: 		double sin_T                   = 0.00;
;Kinematics.c,412 :: 		int8_t count = 0;
MOVZ	R30, R0, R0
SB	R30, 61(SP)
;Kinematics.c,418 :: 		angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
>>>>>>> patch2
LWC1	S0, 28(SP)
MUL.S 	S1, S0, S4
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S3
ADD.S 	S2, S1, S0
LWC1	S0, 28(SP)
MUL.S 	S1, S0, S3
; rt_axis1 end address is: 24 (R6)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S4
; rt_axis0 end address is: 32 (R8)
SUB.S 	S0, S1, S0
SWC1	S13, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S13, S2
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
LWC1	S12, 8(SP)
LWC1	S13, 4(SP)
<<<<<<< HEAD
SWC1	S0, 68(SP)
;Kinematics.c,405 :: 		if (isclockwise) {
BNE	R5, R0, L__mc_arc138
=======
SWC1	S0, 72(SP)
;Kinematics.c,420 :: 		if (isclockwise) {
BNE	R5, R0, L__mc_arc146
>>>>>>> patch2
NOP	
J	L_mc_arc69
NOP	
L__mc_arc146:
; isclockwise end address is: 20 (R5)
<<<<<<< HEAD
;Kinematics.c,407 :: 		if (angular_travel >= 0) { angular_travel -= 2*M_PI; }
LWC1	S1, 68(SP)
=======
;Kinematics.c,422 :: 		if (angular_travel >= 0) { angular_travel -= 2*M_PI; }
LWC1	S1, 72(SP)
>>>>>>> patch2
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__mc_arc147
NOP	
J	L_mc_arc70
NOP	
L__mc_arc147:
LWC1	S1, 72(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S1, S0
<<<<<<< HEAD
SWC1	S0, 68(SP)
L_mc_arc65:
;Kinematics.c,408 :: 		} else {
J	L_mc_arc66
NOP	
L_mc_arc64:
;Kinematics.c,409 :: 		if (angular_travel <= 0) { angular_travel += 2*M_PI; }
LWC1	S1, 68(SP)
=======
SWC1	S0, 72(SP)
L_mc_arc70:
;Kinematics.c,423 :: 		} else {
J	L_mc_arc71
NOP	
L_mc_arc69:
;Kinematics.c,424 :: 		if (angular_travel <= 0) { angular_travel += 2*M_PI; }
LWC1	S1, 72(SP)
>>>>>>> patch2
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S1
BC1F	0, L__mc_arc148
NOP	
J	L_mc_arc72
NOP	
L__mc_arc148:
LWC1	S1, 72(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S1, S0
<<<<<<< HEAD
SWC1	S0, 68(SP)
L_mc_arc67:
;Kinematics.c,410 :: 		}
L_mc_arc66:
;Kinematics.c,413 :: 		millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
=======
SWC1	S0, 72(SP)
L_mc_arc72:
;Kinematics.c,425 :: 		}
L_mc_arc71:
;Kinematics.c,428 :: 		millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
>>>>>>> patch2
SWC1	S12, 4(SP)
MOV.S 	S12, S6
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
LWC1	S1, 72(SP)
MUL.S 	S1, S1, S13
SW	R25, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S13, S0
MOV.S 	S12, S1
JAL	_hypot+0
NOP	
LWC1	S12, 8(SP)
LW	R25, 4(SP)
<<<<<<< HEAD
;Kinematics.c,416 :: 		segments = floor(millimeters_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
=======
;Kinematics.c,431 :: 		segments = floor(millimeters_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
>>>>>>> patch2
LUI	R2, 15820
ORI	R2, R2, 52429
MTC1	R2, S1
DIV.S 	S0, S0, S1
SWC1	S12, 4(SP)
MOV.S 	S12, S0
JAL	_floor+0
NOP	
LWC1	S12, 4(SP)
CVT36.S 	S0, S0
MFC1	R2, S0
<<<<<<< HEAD
SH	R2, 72(SP)
;Kinematics.c,421 :: 		if (invert_feed_rate) { feed_rate *= segments; }
BNE	R4, R0, L__mc_arc142
=======
SH	R2, 76(SP)
;Kinematics.c,436 :: 		if (invert_feed_rate) { feed_rate *= segments; }
BNE	R4, R0, L__mc_arc150
>>>>>>> patch2
NOP	
J	L_mc_arc73
NOP	
L__mc_arc150:
; invert_feed_rate end address is: 16 (R4)
LHU	R2, 76(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
<<<<<<< HEAD
L_mc_arc68:
;Kinematics.c,422 :: 		angular_travel = angular_travel * rad2deg;
LWC1	S1, 68(SP)
=======
L_mc_arc73:
;Kinematics.c,437 :: 		angular_travel = angular_travel * rad2deg;
LWC1	S1, 72(SP)
>>>>>>> patch2
LUI	R2, 16997
ORI	R2, R2, 11999
MTC1	R2, S0
MUL.S 	S1, S1, S0
<<<<<<< HEAD
;Kinematics.c,423 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 72(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S2, S1, S0
SWC1	S2, 60(SP)
;Kinematics.c,427 :: 		linear_per_segment = linear_travel/segments;
DIV.S 	S0, S6, S0
; linear_travel end address is: 48 (R12)
SWC1	S0, 64(SP)
;Kinematics.c,454 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
=======
;Kinematics.c,438 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 76(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S2, S1, S0
SWC1	S2, 64(SP)
;Kinematics.c,442 :: 		linear_per_segment = linear_travel/segments;
DIV.S 	S0, S6, S0
; linear_travel end address is: 48 (R12)
SWC1	S0, 68(SP)
;Kinematics.c,469 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
>>>>>>> patch2
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
<<<<<<< HEAD
SWC1	S0, 76(SP)
;Kinematics.c,455 :: 		sin_T = theta_per_segment;
SWC1	S2, 80(SP)
;Kinematics.c,457 :: 		nPx = arc_target[X] = position[X];
ADDIU	R2, SP, 36
LWC1	S0, 0(R25)
SWC1	S0, 0(R2)
;Kinematics.c,458 :: 		nPy = arc_target[Y] = position[Y];
=======
SWC1	S0, 80(SP)
;Kinematics.c,470 :: 		sin_T = theta_per_segment;
SWC1	S2, 84(SP)
;Kinematics.c,472 :: 		nPx = arc_target[X] = position[X];
ADDIU	R2, SP, 36
LWC1	S0, 0(R25)
SWC1	S0, 0(R2)
;Kinematics.c,473 :: 		nPy = arc_target[Y] = position[Y];
>>>>>>> patch2
ADDIU	R3, R2, 4
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
<<<<<<< HEAD
;Kinematics.c,459 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
=======
;Kinematics.c,474 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
>>>>>>> patch2
ORI	R2, R0, 1
SH	R2, 52(SP)
L_mc_arc74:
LHU	R3, 76(SP)
LHU	R2, 52(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc151
NOP	
J	L_mc_arc75
NOP	
<<<<<<< HEAD
L__mc_arc143:
;Kinematics.c,460 :: 		if (count < settings.n_arc_correction) {
LBU	R3, Offset(_settings+62)(GP)
LB	R2, 56(SP)
=======
L__mc_arc151:
;Kinematics.c,475 :: 		if (count < n_arc_correction) {
LBU	R3, 60(SP)
LB	R2, 61(SP)
>>>>>>> patch2
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc152
NOP	
J	L_mc_arc77
NOP	
<<<<<<< HEAD
L__mc_arc144:
;Kinematics.c,462 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 80(SP)
=======
L__mc_arc152:
;Kinematics.c,477 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 84(SP)
>>>>>>> patch2
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 80(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
<<<<<<< HEAD
;Kinematics.c,463 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 76(SP)
=======
;Kinematics.c,478 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 80(SP)
>>>>>>> patch2
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 84(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 28(SP)
<<<<<<< HEAD
;Kinematics.c,464 :: 		r_axis1 = r_axisi;
SWC1	S3, 32(SP)
;Kinematics.c,465 :: 		count++;
LB	R2, 56(SP)
ADDIU	R2, R2, 1
SB	R2, 56(SP)
;Kinematics.c,466 :: 		} else {
J	L_mc_arc73
NOP	
L_mc_arc72:
;Kinematics.c,469 :: 		cos_Ti = cos(i*theta_per_segment);
LHU	R2, 48(SP)
=======
;Kinematics.c,479 :: 		r_axis1 = r_axisi;
SWC1	S3, 32(SP)
;Kinematics.c,480 :: 		count++;
LB	R2, 61(SP)
ADDIU	R2, R2, 1
SB	R2, 61(SP)
;Kinematics.c,481 :: 		} else {
J	L_mc_arc78
NOP	
L_mc_arc77:
;Kinematics.c,484 :: 		cos_Ti = cos(i*theta_per_segment);
LHU	R2, 52(SP)
>>>>>>> patch2
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 64(SP)
MUL.S 	S0, S1, S0
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
<<<<<<< HEAD
; cos_Ti start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,470 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 48(SP)
=======
SWC1	S0, 48(SP)
;Kinematics.c,485 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 52(SP)
>>>>>>> patch2
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 64(SP)
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
<<<<<<< HEAD
;Kinematics.c,471 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
=======
;Kinematics.c,486 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
>>>>>>> patch2
ANDI	R2, R28, 255
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S4, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S2, S1, S4
LWC1	S1, 48(SP)
MUL.S 	S3, S2, S1
LBU	R2, 88(SP)
SLL	R2, R2, 2
ADDU	R2, R27, R2
LWC1	S2, 0(R2)
MUL.S 	S1, S2, S0
ADD.S 	S1, S3, S1
SWC1	S1, 28(SP)
<<<<<<< HEAD
;Kinematics.c,472 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
=======
;Kinematics.c,487 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
>>>>>>> patch2
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
LWC1	S0, 48(SP)
MUL.S 	S0, S2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 32(SP)
<<<<<<< HEAD
;Kinematics.c,473 :: 		count = 0;
SB	R0, 56(SP)
;Kinematics.c,474 :: 		}
L_mc_arc73:
;Kinematics.c,477 :: 		arc_target[X] = center_axis0 + r_axis0;
=======
;Kinematics.c,488 :: 		count = 0;
SB	R0, 61(SP)
;Kinematics.c,489 :: 		}
L_mc_arc78:
;Kinematics.c,492 :: 		arc_target[X] = center_axis0 + r_axis0;
>>>>>>> patch2
ADDIU	R4, SP, 36
LWC1	S1, 28(SP)
LWC1	S0, 20(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
<<<<<<< HEAD
;Kinematics.c,478 :: 		arc_target[Y] = center_axis1 + r_axis1;
=======
;Kinematics.c,493 :: 		arc_target[Y] = center_axis1 + r_axis1;
>>>>>>> patch2
ADDIU	R2, R4, 4
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
<<<<<<< HEAD
;Kinematics.c,479 :: 		arc_target[axis_linear] += linear_per_segment;
LBU	R2, 85(SP)
=======
;Kinematics.c,494 :: 		arc_target[axis_linear] += linear_per_segment;
LBU	R2, 89(SP)
>>>>>>> patch2
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 68(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
<<<<<<< HEAD
;Kinematics.c,480 :: 		nPx =  arc_target[X] - position[X];
=======
;Kinematics.c,495 :: 		nPx =  arc_target[X] - position[X];
>>>>>>> patch2
LWC1	S1, 0(R4)
LWC1	S0, 0(R25)
SUB.S 	S0, S1, S0
; nPx start address is: 16 (R4)
MOV.S 	S2, S0
<<<<<<< HEAD
;Kinematics.c,481 :: 		position[X] = arc_target[X];
SWC1	S1, 0(R25)
;Kinematics.c,482 :: 		nPy =  arc_target[Y] - position[Y];
=======
;Kinematics.c,496 :: 		position[X] = arc_target[X];
SWC1	S1, 0(R25)
;Kinematics.c,497 :: 		nPy =  arc_target[Y] - position[Y];
>>>>>>> patch2
ADDIU	R2, R4, 4
LWC1	S1, 0(R2)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
<<<<<<< HEAD
SWC1	S0, 52(SP)
;Kinematics.c,483 :: 		position[Y] = arc_target[Y];
=======
SWC1	S0, 56(SP)
;Kinematics.c,498 :: 		position[Y] = arc_target[Y];
>>>>>>> patch2
ADDIU	R3, R25, 4
ADDIU	R2, R4, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
; nPx end address is: 16 (R4)
MOV.S 	S0, S2
<<<<<<< HEAD
;Kinematics.c,484 :: 		while(1){
L_mc_arc74:
;Kinematics.c,485 :: 		if(!OC5IE_bit && !OC2IE_bit)
=======
;Kinematics.c,499 :: 		while(1){
L_mc_arc79:
;Kinematics.c,500 :: 		if(!OC5IE_bit && !OC2IE_bit)
>>>>>>> patch2
; nPx start address is: 0 (R0)
; nPx start address is: 0 (R0)
; nPx end address is: 0 (R0)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc153
NOP	
J	L__mc_arc88
NOP	
L__mc_arc153:
; nPx end address is: 0 (R0)
; nPx start address is: 0 (R0)
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc154
NOP	
J	L__mc_arc87
NOP	
<<<<<<< HEAD
L__mc_arc146:
L__mc_arc81:
;Kinematics.c,486 :: 		break;
J	L_mc_arc75
NOP	
;Kinematics.c,485 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc83:
L__mc_arc82:
;Kinematics.c,487 :: 		}
J	L_mc_arc74
NOP	
L_mc_arc75:
;Kinematics.c,494 :: 		STPS[X].mmToTravel = belt_steps(nPx);//calcSteps(nPx,8.06);
=======
L__mc_arc154:
L__mc_arc86:
;Kinematics.c,501 :: 		break;
J	L_mc_arc80
NOP	
;Kinematics.c,500 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc88:
L__mc_arc87:
;Kinematics.c,502 :: 		}
J	L_mc_arc79
NOP	
L_mc_arc80:
;Kinematics.c,509 :: 		STPS[X].mmToTravel = belt_steps(nPx);//calcSteps(nPx,8.06);
>>>>>>> patch2
SB	R28, 4(SP)
; nPx end address is: 0 (R0)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOV.S 	S12, S0
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
<<<<<<< HEAD
;Kinematics.c,495 :: 		STPS[Y].mmToTravel = belt_steps(nPy);//calcSteps(nPy,8.06);
LWC1	S12, 52(SP)
=======
;Kinematics.c,510 :: 		STPS[Y].mmToTravel = belt_steps(nPy);//calcSteps(nPy,8.06);
LWC1	S12, 56(SP)
>>>>>>> patch2
JAL	_belt_steps+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
SW	R2, Offset(_STPS+132)(GP)
<<<<<<< HEAD
;Kinematics.c,496 :: 		tempA = abs(STPS[X].mmToTravel);
=======
;Kinematics.c,511 :: 		tempA = abs(STPS[X].mmToTravel);
>>>>>>> patch2
SW	R25, 4(SP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_abs+0
NOP	
; tempA start address is: 12 (R3)
SEH	R3, R2
<<<<<<< HEAD
;Kinematics.c,497 :: 		tempB = abs(STPS[Y].mmToTravel);
=======
;Kinematics.c,512 :: 		tempB = abs(STPS[Y].mmToTravel);
>>>>>>> patch2
LW	R25, Offset(_STPS+132)(GP)
JAL	_abs+0
NOP	
LW	R25, 4(SP)
; tempB start address is: 16 (R4)
SEH	R4, R2
<<<<<<< HEAD
;Kinematics.c,498 :: 		if(tempA > tempB)
=======
;Kinematics.c,513 :: 		if(tempA > tempB)
>>>>>>> patch2
SLT	R2, R4, R3
BNE	R2, R0, L__mc_arc155
NOP	
J	L_mc_arc84
NOP	
L__mc_arc155:
; tempA end address is: 12 (R3)
; tempB end address is: 16 (R4)
<<<<<<< HEAD
;Kinematics.c,499 :: 		speed_cntr_Move(STPS[X].mmToTravel, 1000,X);
=======
;Kinematics.c,514 :: 		speed_cntr_Move(STPS[X].mmToTravel, 1000,X);
>>>>>>> patch2
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 1000
LW	R25, Offset(_STPS+64)(GP)
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
J	L_mc_arc85
NOP	
<<<<<<< HEAD
L_mc_arc79:
;Kinematics.c,501 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 1000,Y);
=======
L_mc_arc84:
;Kinematics.c,516 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 1000,Y);
>>>>>>> patch2
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
ORI	R27, R0, 1
ORI	R26, R0, 1000
LW	R25, Offset(_STPS+132)(GP)
JAL	_speed_cntr_Move+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
<<<<<<< HEAD
L_mc_arc80:
;Kinematics.c,504 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
=======
L_mc_arc85:
;Kinematics.c,519 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
>>>>>>> patch2
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
<<<<<<< HEAD
;Kinematics.c,459 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
LHU	R2, 48(SP)
ADDIU	R2, R2, 1
SH	R2, 48(SP)
;Kinematics.c,508 :: 		}
J	L_mc_arc69
NOP	
L_mc_arc70:
;Kinematics.c,511 :: 		}
=======
;Kinematics.c,474 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
LHU	R2, 52(SP)
ADDIU	R2, R2, 1
SH	R2, 52(SP)
;Kinematics.c,523 :: 		}
J	L_mc_arc74
NOP	
L_mc_arc75:
;Kinematics.c,526 :: 		}
>>>>>>> patch2
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 88
JR	RA
NOP	
; end of _mc_arc
_hypot:
<<<<<<< HEAD
;Kinematics.c,513 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,514 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
=======
;Kinematics.c,528 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,529 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
>>>>>>> patch2
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
<<<<<<< HEAD
;Kinematics.c,515 :: 		}
=======
;Kinematics.c,530 :: 		}
>>>>>>> patch2
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_SerialPrint:
<<<<<<< HEAD
;Kinematics.c,517 :: 		void SerialPrint(float r){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,518 :: 		int str_len = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Kinematics.c,519 :: 		int str_lenA = 0;
;Kinematics.c,520 :: 		str_lenA = strlen(txtA);
=======
;Kinematics.c,532 :: 		void SerialPrint(float r){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,533 :: 		int str_len = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Kinematics.c,534 :: 		int str_lenA = 0;
;Kinematics.c,535 :: 		str_lenA = strlen(txtA);
>>>>>>> patch2
LUI	R25, hi_addr(_txtA+0)
ORI	R25, R25, lo_addr(_txtA+0)
JAL	_strlen+0
NOP	
; str_lenA start address is: 44 (R11)
SEH	R11, R2
<<<<<<< HEAD
;Kinematics.c,521 :: 		memset(txtB,0,30);
=======
;Kinematics.c,536 :: 		memset(txtB,0,30);
>>>>>>> patch2
ORI	R27, R0, 30
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_memset+0
NOP	
<<<<<<< HEAD
;Kinematics.c,523 :: 		sprintf(txt,"%0.2f",r);
=======
;Kinematics.c,538 :: 		sprintf(txt,"%0.2f",r);
>>>>>>> patch2
ADDIU	SP, SP, -12
SWC1	S12, 8(SP)
LUI	R2, hi_addr(?lstr_3_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_3_Kinematics+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;Kinematics.c,524 :: 		strncpy(txtB, " ",strlen(txt));
=======
;Kinematics.c,539 :: 		strncpy(txtB, " ",strlen(txt));
>>>>>>> patch2
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
ORI	R30, R0, 32
SB	R30, 16(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
ADDIU	R3, SP, 16
SEH	R27, R2
MOVZ	R26, R3, R0
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncpy+0
NOP	
<<<<<<< HEAD
;Kinematics.c,525 :: 		strncat(txtB, txt,strlen(txt));
=======
;Kinematics.c,540 :: 		strncat(txtB, txt,strlen(txt));
>>>>>>> patch2
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
SEH	R27, R2
LUI	R26, hi_addr(_txt+0)
ORI	R26, R26, lo_addr(_txt+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
<<<<<<< HEAD
;Kinematics.c,526 :: 		str_len += strlen(txt);
=======
;Kinematics.c,541 :: 		str_len += strlen(txt);
>>>>>>> patch2
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
<<<<<<< HEAD
;Kinematics.c,527 :: 		strncat(txtB,txtA,str_lenA);
=======
;Kinematics.c,542 :: 		strncat(txtB,txtA,str_lenA);
>>>>>>> patch2
SEH	R27, R11
; str_lenA end address is: 44 (R11)
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
<<<<<<< HEAD
;Kinematics.c,585 :: 		UART2_Write_Text(txtB);
=======
;Kinematics.c,600 :: 		UART2_Write_Text(txtB);
>>>>>>> patch2
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_UART2_Write_Text+0
NOP	
<<<<<<< HEAD
;Kinematics.c,594 :: 		}
=======
;Kinematics.c,609 :: 		}
>>>>>>> patch2
L_end_SerialPrint:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SerialPrint
