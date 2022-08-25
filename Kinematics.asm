_SingleAxisStep:
;Kinematics.c,20 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Kinematics.c,26 :: 		SV.Single_Dual = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SB	R0, Offset(_SV+0)(GP)
;Kinematics.c,27 :: 		switch(axis_No){
J	L_SingleAxisStep0
NOP	
;Kinematics.c,28 :: 		case X:
L_SingleAxisStep2:
;Kinematics.c,29 :: 		Single_Axis_Enable(X);
SH	R26, 12(SP)
SW	R25, 16(SP)
MOVZ	R25, R0, R0
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
;Kinematics.c,30 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,31 :: 		case Y:
L_SingleAxisStep3:
;Kinematics.c,32 :: 		Single_Axis_Enable(Y);
SH	R26, 12(SP)
SW	R25, 16(SP)
ORI	R25, R0, 1
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
;Kinematics.c,33 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,34 :: 		case Z:
L_SingleAxisStep4:
;Kinematics.c,35 :: 		Single_Axis_Enable(Z);
SH	R26, 12(SP)
SW	R25, 16(SP)
ORI	R25, R0, 2
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
;Kinematics.c,36 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,37 :: 		case A:
L_SingleAxisStep5:
;Kinematics.c,38 :: 		Single_Axis_Enable(A);
SH	R26, 12(SP)
SW	R25, 16(SP)
ORI	R25, R0, 3
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 16(SP)
LH	R26, 12(SP)
;Kinematics.c,39 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,40 :: 		default: break;
L_SingleAxisStep6:
J	L_SingleAxisStep1
NOP	
;Kinematics.c,41 :: 		}
L_SingleAxisStep0:
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep151
NOP	
J	L_SingleAxisStep2
NOP	
L__SingleAxisStep151:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep153
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep153:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep155
NOP	
J	L_SingleAxisStep4
NOP	
L__SingleAxisStep155:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep157
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep157:
J	L_SingleAxisStep6
NOP	
L_SingleAxisStep1:
;Kinematics.c,42 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,43 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R25, 0(R2)
;Kinematics.c,44 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R2, 20(SP)
SW	R25, 12(SP)
LW	R25, 0(R2)
JAL	_abs+0
NOP	
LW	R25, 12(SP)
SEH	R3, R2
LW	R2, 20(SP)
SW	R3, 0(R2)
;Kinematics.c,46 :: 		if(newxyz < 0)
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep158
NOP	
J	L_SingleAxisStep7
NOP	
L__SingleAxisStep158:
;Kinematics.c,47 :: 		dir = CCW;
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep8
NOP	
L_SingleAxisStep7:
;Kinematics.c,49 :: 		dir = CW;
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep8:
;Kinematics.c,51 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep9
NOP	
;Kinematics.c,52 :: 		case X:
L_SingleAxisStep11:
;Kinematics.c,53 :: 		DIR_StepX = dir;
_LX	
INS	R2, R4, BitPos(DIR_StepX+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,54 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,55 :: 		case Y:
L_SingleAxisStep12:
;Kinematics.c,56 :: 		DIR_StepY = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepY+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,57 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,58 :: 		case Z:
L_SingleAxisStep13:
;Kinematics.c,59 :: 		DIR_StepZ = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepZ+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,60 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,61 :: 		case A:
L_SingleAxisStep14:
;Kinematics.c,62 :: 		DIR_StepA = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepA+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,63 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,64 :: 		default: break;
L_SingleAxisStep15:
J	L_SingleAxisStep10
NOP	
;Kinematics.c,65 :: 		}
L_SingleAxisStep9:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep160
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep160:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep162
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep162:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep164
NOP	
J	L_SingleAxisStep13
NOP	
L__SingleAxisStep164:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep166
NOP	
J	L_SingleAxisStep14
NOP	
L__SingleAxisStep166:
; dir end address is: 16 (R4)
J	L_SingleAxisStep15
NOP	
L_SingleAxisStep10:
;Kinematics.c,67 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,69 :: 		Step_Cycle(axis_No,Lin);
SEH	R25, R26
MOVZ	R26, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,71 :: 		}
L_end_SingleAxisStep:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,76 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,78 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+52)(GP)
;Kinematics.c,80 :: 		SV.px = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,81 :: 		SV.py = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,82 :: 		SV.pz = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,86 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,87 :: 		switch(axis_combo){
J	L_DualAxisStep16
NOP	
;Kinematics.c,88 :: 		case xy:
L_DualAxisStep18:
;Kinematics.c,89 :: 		AxisPulse = XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Kinematics.c,90 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,91 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,93 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,94 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,97 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep168
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep168:
; ?FLOC___DualAxisStep?T39 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T39 end address is: 12 (R3)
J	L_DualAxisStep20
NOP	
L_DualAxisStep19:
; ?FLOC___DualAxisStep?T39 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T39 end address is: 12 (R3)
L_DualAxisStep20:
; ?FLOC___DualAxisStep?T39 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T39 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
;Kinematics.c,98 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep169
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep169:
; ?FLOC___DualAxisStep?T41 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T41 end address is: 12 (R3)
J	L_DualAxisStep22
NOP	
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T41 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T41 end address is: 12 (R3)
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T41 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T41 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
;Kinematics.c,101 :: 		if(SV.dirx < 0)
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep170
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep170:
;Kinematics.c,102 :: 		DIR_StepX = CCW;
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep24
NOP	
L_DualAxisStep23:
;Kinematics.c,104 :: 		DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep24:
;Kinematics.c,106 :: 		if(SV.diry < 0)
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep171
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep171:
;Kinematics.c,107 :: 		DIR_StepY = CCW;
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep26
NOP	
L_DualAxisStep25:
;Kinematics.c,109 :: 		DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep26:
;Kinematics.c,111 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,112 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,114 :: 		if(SV.dx > SV.dy)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep172
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep172:
;Kinematics.c,115 :: 		SV.d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep28
NOP	
L_DualAxisStep27:
;Kinematics.c,117 :: 		SV.d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep28:
;Kinematics.c,119 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,120 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,121 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,123 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,124 :: 		case xz:
L_DualAxisStep29:
;Kinematics.c,125 :: 		AxisPulse = XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Kinematics.c,126 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,127 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,129 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,130 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,133 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep173
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep173:
; ?FLOC___DualAxisStep?T55 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T55 end address is: 12 (R3)
J	L_DualAxisStep31
NOP	
L_DualAxisStep30:
; ?FLOC___DualAxisStep?T55 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T55 end address is: 12 (R3)
L_DualAxisStep31:
; ?FLOC___DualAxisStep?T55 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T55 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
;Kinematics.c,134 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep174
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep174:
; ?FLOC___DualAxisStep?T57 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T57 end address is: 12 (R3)
J	L_DualAxisStep33
NOP	
L_DualAxisStep32:
; ?FLOC___DualAxisStep?T57 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T57 end address is: 12 (R3)
L_DualAxisStep33:
; ?FLOC___DualAxisStep?T57 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T57 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
;Kinematics.c,137 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep175
NOP	
J	L_DualAxisStep34
NOP	
L__DualAxisStep175:
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep35
NOP	
L_DualAxisStep34:
;Kinematics.c,138 :: 		else DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep35:
;Kinematics.c,140 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep176
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep176:
_LX	
ORI	R2, R2, BitMask(DIR_StepZ+0)
_SX	
J	L_DualAxisStep37
NOP	
L_DualAxisStep36:
;Kinematics.c,141 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep37:
;Kinematics.c,143 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,144 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,146 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep177
NOP	
J	L_DualAxisStep38
NOP	
L__DualAxisStep177:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep39
NOP	
L_DualAxisStep38:
;Kinematics.c,147 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep39:
;Kinematics.c,149 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,150 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,151 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,152 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,153 :: 		case yz:
L_DualAxisStep40:
;Kinematics.c,154 :: 		AxisPulse = YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Kinematics.c,155 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,156 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,159 :: 		SV.dy   = newx - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,160 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,163 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep178
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep178:
; ?FLOC___DualAxisStep?T71 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T71 end address is: 12 (R3)
J	L_DualAxisStep42
NOP	
L_DualAxisStep41:
; ?FLOC___DualAxisStep?T71 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T71 end address is: 12 (R3)
L_DualAxisStep42:
; ?FLOC___DualAxisStep?T71 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T71 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
;Kinematics.c,164 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep179
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep179:
; ?FLOC___DualAxisStep?T73 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T73 end address is: 12 (R3)
J	L_DualAxisStep44
NOP	
L_DualAxisStep43:
; ?FLOC___DualAxisStep?T73 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T73 end address is: 12 (R3)
L_DualAxisStep44:
; ?FLOC___DualAxisStep?T73 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T73 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
;Kinematics.c,167 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep180
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep180:
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep46
NOP	
L_DualAxisStep45:
;Kinematics.c,168 :: 		else DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep46:
;Kinematics.c,169 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep181
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep181:
_LX	
ORI	R2, R2, BitMask(DIR_StepZ+0)
_SX	
J	L_DualAxisStep48
NOP	
L_DualAxisStep47:
;Kinematics.c,170 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep48:
;Kinematics.c,172 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,173 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,175 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep182
NOP	
J	L_DualAxisStep49
NOP	
L__DualAxisStep182:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep50
NOP	
L_DualAxisStep49:
;Kinematics.c,176 :: 		else d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep50:
;Kinematics.c,178 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,179 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,180 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,181 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,182 :: 		default: break;
L_DualAxisStep51:
J	L_DualAxisStep17
NOP	
;Kinematics.c,184 :: 		}
L_DualAxisStep16:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep184
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep184:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep186
NOP	
J	L_DualAxisStep29
NOP	
L__DualAxisStep186:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep188
NOP	
J	L_DualAxisStep40
NOP	
L__DualAxisStep188:
J	L_DualAxisStep51
NOP	
L_DualAxisStep17:
;Kinematics.c,185 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _DualAxisStep
_XY_Interpolate:
;Kinematics.c,189 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Kinematics.c,190 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)){
SW	R25, 4(SP)
SW	R26, 8(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate190
NOP	
J	L__XY_Interpolate118
NOP	
L__XY_Interpolate190:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate191
NOP	
J	L__XY_Interpolate117
NOP	
L__XY_Interpolate191:
J	L_XY_Interpolate54
NOP	
L__XY_Interpolate118:
L__XY_Interpolate117:
;Kinematics.c,191 :: 		StopX();
JAL	_StopX+0
NOP	
;Kinematics.c,192 :: 		StopY();
JAL	_StopY+0
NOP	
;Kinematics.c,193 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Kinematics.c,194 :: 		}
L_XY_Interpolate54:
;Kinematics.c,196 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XY_Interpolate192
NOP	
J	L_XY_Interpolate55
NOP	
L__XY_Interpolate192:
;Kinematics.c,197 :: 		Step_Cycle(X,Lin);
MOVZ	R26, R0, R0
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,198 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate193
NOP	
J	L_XY_Interpolate56
NOP	
L__XY_Interpolate193:
;Kinematics.c,199 :: 		SV.d2 += 2*SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,200 :: 		}else{
J	L_XY_Interpolate57
NOP	
L_XY_Interpolate56:
;Kinematics.c,201 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,202 :: 		Step_Cycle(Y,Lin);
MOVZ	R26, R0, R0
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,203 :: 		}
L_XY_Interpolate57:
;Kinematics.c,204 :: 		}else{
J	L_XY_Interpolate58
NOP	
L_XY_Interpolate55:
;Kinematics.c,205 :: 		Step_Cycle(Y,Lin);
MOVZ	R26, R0, R0
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,206 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate194
NOP	
J	L_XY_Interpolate59
NOP	
L__XY_Interpolate194:
;Kinematics.c,207 :: 		SV.d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,208 :: 		}else{
J	L_XY_Interpolate60
NOP	
L_XY_Interpolate59:
;Kinematics.c,209 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,210 :: 		Step_Cycle(X,Lin);
MOVZ	R26, R0, R0
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,211 :: 		}
L_XY_Interpolate60:
;Kinematics.c,212 :: 		}
L_XY_Interpolate58:
;Kinematics.c,213 :: 		}
L_end_XY_Interpolate:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _XY_Interpolate
_XZ_Interpolate:
;Kinematics.c,215 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Kinematics.c,217 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
SW	R26, 8(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate196
NOP	
J	L__XZ_Interpolate121
NOP	
L__XZ_Interpolate196:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate197
NOP	
J	L__XZ_Interpolate120
NOP	
L__XZ_Interpolate197:
J	L_XZ_Interpolate63
NOP	
L__XZ_Interpolate121:
L__XZ_Interpolate120:
;Kinematics.c,218 :: 		StopX();
JAL	_StopX+0
NOP	
;Kinematics.c,219 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Kinematics.c,221 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Kinematics.c,222 :: 		}
L_XZ_Interpolate63:
;Kinematics.c,224 :: 		if(SV.dx > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XZ_Interpolate198
NOP	
J	L_XZ_Interpolate64
NOP	
L__XZ_Interpolate198:
;Kinematics.c,225 :: 		Step_Cycle(X,Lin);
MOVZ	R26, R0, R0
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,226 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate199
NOP	
J	L_XZ_Interpolate65
NOP	
L__XZ_Interpolate199:
;Kinematics.c,227 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_XZ_Interpolate66
NOP	
L_XZ_Interpolate65:
;Kinematics.c,229 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,230 :: 		Step_Cycle(Z,Lin);
MOVZ	R26, R0, R0
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,231 :: 		}
L_XZ_Interpolate66:
;Kinematics.c,233 :: 		}else{
J	L_XZ_Interpolate67
NOP	
L_XZ_Interpolate64:
;Kinematics.c,234 :: 		Step_Cycle(Z,Lin);
MOVZ	R26, R0, R0
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,235 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate200
NOP	
J	L_XZ_Interpolate68
NOP	
L__XZ_Interpolate200:
;Kinematics.c,236 :: 		d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_XZ_Interpolate69
NOP	
L_XZ_Interpolate68:
;Kinematics.c,238 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,239 :: 		Step_Cycle(X,Lin);
MOVZ	R26, R0, R0
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,240 :: 		}
L_XZ_Interpolate69:
;Kinematics.c,241 :: 		}
L_XZ_Interpolate67:
;Kinematics.c,242 :: 		}
L_end_XZ_Interpolate:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _XZ_Interpolate
_YZ_Interpolate:
;Kinematics.c,244 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Kinematics.c,245 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
SW	R26, 8(SP)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate202
NOP	
J	L__YZ_Interpolate124
NOP	
L__YZ_Interpolate202:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate203
NOP	
J	L__YZ_Interpolate123
NOP	
L__YZ_Interpolate203:
J	L_YZ_Interpolate72
NOP	
L__YZ_Interpolate124:
L__YZ_Interpolate123:
;Kinematics.c,246 :: 		StopY();
JAL	_StopY+0
NOP	
;Kinematics.c,247 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Kinematics.c,248 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Kinematics.c,249 :: 		}
L_YZ_Interpolate72:
;Kinematics.c,251 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__YZ_Interpolate204
NOP	
J	L_YZ_Interpolate73
NOP	
L__YZ_Interpolate204:
;Kinematics.c,252 :: 		Step_Cycle(Y,Lin);
MOVZ	R26, R0, R0
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,253 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate205
NOP	
J	L_YZ_Interpolate74
NOP	
L__YZ_Interpolate205:
;Kinematics.c,254 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_YZ_Interpolate75
NOP	
L_YZ_Interpolate74:
;Kinematics.c,256 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,257 :: 		Step_Cycle(Z,Lin);
MOVZ	R26, R0, R0
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,258 :: 		}
L_YZ_Interpolate75:
;Kinematics.c,259 :: 		}else{
J	L_YZ_Interpolate76
NOP	
L_YZ_Interpolate73:
;Kinematics.c,260 :: 		Step_Cycle(Z,Lin);
MOVZ	R26, R0, R0
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,261 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate206
NOP	
J	L_YZ_Interpolate77
NOP	
L__YZ_Interpolate206:
;Kinematics.c,262 :: 		d2 += 2 * SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_YZ_Interpolate78
NOP	
L_YZ_Interpolate77:
;Kinematics.c,264 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,265 :: 		Step_Cycle(Y,Lin);
MOVZ	R26, R0, R0
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,266 :: 		}
L_YZ_Interpolate78:
;Kinematics.c,267 :: 		}
L_YZ_Interpolate76:
;Kinematics.c,269 :: 		}
L_end_YZ_Interpolate:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _YZ_Interpolate
_SetCircleVals:
;Kinematics.c,277 :: 		void SetCircleVals(Circle* cir,float curX,float curY,float i,float j, float deg,int dir){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
SW	R25, 4(SP)
; deg start address is: 0 (R0)
LWC1	S0, 8(SP)
;Kinematics.c,278 :: 		cir->oneshot = 0;
LBU	R2, 0(R25)
INS	R2, R0, 0, 1
SB	R2, 0(R25)
;Kinematics.c,279 :: 		cir->I = i;
ADDIU	R2, R25, 32
SWC1	S14, 0(R2)
;Kinematics.c,280 :: 		cir->J = j;
ADDIU	R2, R25, 36
SWC1	S15, 0(R2)
;Kinematics.c,281 :: 		cir->xStart = curX;
ADDIU	R2, R25, 60
SWC1	S12, 0(R2)
;Kinematics.c,282 :: 		cir->yStart = curY;
ADDIU	R2, R25, 64
SWC1	S13, 0(R2)
;Kinematics.c,283 :: 		cir->degreeDeg = deg;
ADDIU	R2, R25, 8
SWC1	S0, 0(R2)
; deg end address is: 0 (R0)
;Kinematics.c,284 :: 		cir = CircDir(dir,curX,curY);
SEH	R25, R26
JAL	_CircDir+0
NOP	
MOVZ	R25, R2, R0
;Kinematics.c,286 :: 		}
L_end_SetCircleVals:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SetCircleVals
_QuadrantStart:
;Kinematics.c,290 :: 		int QuadrantStart(float i,float j){
;Kinematics.c,291 :: 		if((i <= 0)&&(j >= 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__QuadrantStart209
NOP	
J	L__QuadrantStart130
NOP	
L__QuadrantStart209:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S13, S0
BC1F	0, L__QuadrantStart210
NOP	
J	L__QuadrantStart129
NOP	
L__QuadrantStart210:
L__QuadrantStart128:
;Kinematics.c,292 :: 		return 1;
ORI	R2, R0, 1
J	L_end_QuadrantStart
NOP	
;Kinematics.c,291 :: 		if((i <= 0)&&(j >= 0))
L__QuadrantStart130:
L__QuadrantStart129:
;Kinematics.c,293 :: 		else if((i > 0)&&(j > 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart211
NOP	
J	L__QuadrantStart132
NOP	
L__QuadrantStart211:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S13, S0
BC1F	0, L__QuadrantStart212
NOP	
J	L__QuadrantStart131
NOP	
L__QuadrantStart212:
L__QuadrantStart127:
;Kinematics.c,294 :: 		return 2;
ORI	R2, R0, 2
J	L_end_QuadrantStart
NOP	
;Kinematics.c,293 :: 		else if((i > 0)&&(j > 0))
L__QuadrantStart132:
L__QuadrantStart131:
;Kinematics.c,295 :: 		else if((i > 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart213
NOP	
J	L__QuadrantStart134
NOP	
L__QuadrantStart213:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart214
NOP	
J	L__QuadrantStart133
NOP	
L__QuadrantStart214:
L__QuadrantStart126:
;Kinematics.c,296 :: 		return 3;
ORI	R2, R0, 3
J	L_end_QuadrantStart
NOP	
;Kinematics.c,295 :: 		else if((i > 0)&&(j < 0))
L__QuadrantStart134:
L__QuadrantStart133:
;Kinematics.c,297 :: 		else if((i < 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__QuadrantStart215
NOP	
J	L__QuadrantStart136
NOP	
L__QuadrantStart215:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart216
NOP	
J	L__QuadrantStart135
NOP	
L__QuadrantStart216:
L__QuadrantStart125:
;Kinematics.c,298 :: 		return 4;
ORI	R2, R0, 4
J	L_end_QuadrantStart
NOP	
;Kinematics.c,297 :: 		else if((i < 0)&&(j < 0))
L__QuadrantStart136:
L__QuadrantStart135:
;Kinematics.c,300 :: 		return 0;
MOVZ	R2, R0, R0
;Kinematics.c,301 :: 		}
L_end_QuadrantStart:
JR	RA
NOP	
; end of _QuadrantStart
_CircDir:
;Kinematics.c,306 :: 		Circle* CircDir(int dir,float xPresent,float yPresent){
ADDIU	SP, SP, -76
;Kinematics.c,310 :: 		circ.dir = dir;
SH	R25, 48(SP)
;Kinematics.c,311 :: 		if(dir == CW){
SEH	R2, R25
BEQ	R2, R0, L__CircDir218
NOP	
J	L_CircDir95
NOP	
L__CircDir218:
;Kinematics.c,312 :: 		newDeg = 360 / circ.deg;
LWC1	S1, 4(SP)
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S2, S0, S1
;Kinematics.c,313 :: 		circ.N = (2*Pi*circ.radius)/newDeg;
LWC1	S1, 44(SP)
LUI	R2, 16585
ORI	R2, R2, 4048
MTC1	R2, S0
MUL.S 	S0, S0, S1
DIV.S 	S0, S0, S2
SWC1	S0, 40(SP)
;Kinematics.c,314 :: 		circ.divisor = circ.deg / newDeg;
LWC1	S0, 4(SP)
DIV.S 	S0, S0, S2
SWC1	S0, 24(SP)
;Kinematics.c,315 :: 		}
L_CircDir95:
;Kinematics.c,317 :: 		if(circ.dir == CW)
LH	R2, 48(SP)
BEQ	R2, R0, L__CircDir219
NOP	
J	L_CircDir96
NOP	
L__CircDir219:
;Kinematics.c,318 :: 		circ.deg = 0.00;
MOVZ	R2, R0, R0
SW	R2, 4(SP)
L_CircDir96:
;Kinematics.c,319 :: 		if(circ.dir == CCW)
LH	R3, 48(SP)
ORI	R2, R0, 1
BEQ	R3, R2, L__CircDir220
NOP	
J	L_CircDir97
NOP	
L__CircDir220:
;Kinematics.c,320 :: 		circ.deg = 360.00;
LUI	R2, 17332
ORI	R2, R2, 0
SW	R2, 4(SP)
L_CircDir97:
;Kinematics.c,322 :: 		return &circ;
ADDIU	R2, SP, 0
;Kinematics.c,323 :: 		}
L_end_CircDir:
ADDIU	SP, SP, 76
JR	RA
NOP	
; end of _CircDir
_CalcRadius:
;Kinematics.c,327 :: 		void CalcRadius(Circle* cir){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,330 :: 		cir->xRad = fabs(cir->xStart + cir->I);
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
;Kinematics.c,331 :: 		cir->yRad = fabs(cir->yStart + cir->J);
ADDIU	R2, R25, 56
SW	R2, 12(SP)
ADDIU	R2, R25, 64
LWC1	S1, 0(R2)
ADDIU	R2, R25, 36
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_fabs+0
NOP	
LW	R2, 12(SP)
SWC1	S0, 0(R2)
;Kinematics.c,332 :: 		cir->radius = sqrt((cir->xRad*cir->xRad) + (cir->yRad*cir->yRad));
ADDIU	R2, R25, 44
SW	R2, 12(SP)
ADDIU	R2, R25, 52
LWC1	S0, 0(R2)
MUL.S 	S1, S0, S0
ADDIU	R2, R25, 56
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
;Kinematics.c,333 :: 		angA = atan2(cir->yRad,cir->xRad);
ADDIU	R2, R25, 52
LWC1	S1, 0(R2)
ADDIU	R2, R25, 56
LWC1	S0, 0(R2)
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
;Kinematics.c,336 :: 		cir->degreeDeg = angA * rad2deg;
ADDIU	R3, R25, 8
LUI	R2, 16997
ORI	R2, R2, 12013
MTC1	R2, S1
MUL.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Kinematics.c,338 :: 		cir->quadrant_start = QuadrantStart(cir->I,cir->J);
ADDIU	R2, R25, 50
SW	R2, 12(SP)
ADDIU	R2, R25, 36
LWC1	S1, 0(R2)
ADDIU	R2, R25, 32
LWC1	S0, 0(R2)
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_QuadrantStart+0
NOP	
LW	R3, 12(SP)
SH	R2, 0(R3)
;Kinematics.c,340 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 50
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius223
NOP	
J	L__CalcRadius140
NOP	
L__CalcRadius223:
ADDIU	R2, R25, 50
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius225
NOP	
J	L__CalcRadius139
NOP	
L__CalcRadius225:
J	L_CalcRadius100
NOP	
L__CalcRadius140:
L__CalcRadius139:
;Kinematics.c,341 :: 		angB = cir->deg - cir->degreeDeg;
ADDIU	R2, R25, 4
LWC1	S1, 0(R2)
ADDIU	R2, R25, 8
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius100:
;Kinematics.c,342 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 50
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius227
NOP	
J	L__CalcRadius142
NOP	
L__CalcRadius227:
ADDIU	R2, R25, 50
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius229
NOP	
J	L__CalcRadius141
NOP	
L__CalcRadius229:
J	L_CalcRadius103
NOP	
L__CalcRadius142:
L__CalcRadius141:
;Kinematics.c,343 :: 		angB = cir->deg + cir->degreeDeg;
ADDIU	R2, R25, 4
LWC1	S1, 0(R2)
ADDIU	R2, R25, 8
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius103:
;Kinematics.c,345 :: 		cir->degreeRadians = angB * deg2rad;
ADDIU	R3, R25, 12
LWC1	S1, 8(SP)
LUI	R2, 15502
ORI	R2, R2, 64046
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, 0(R3)
;Kinematics.c,346 :: 		}
L_end_CalcRadius:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _CalcRadius
_Cir_Interpolation:
;Kinematics.c,350 :: 		void Cir_Interpolation(Circle* cir){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,354 :: 		CalcRadius(cir);
SW	R25, 4(SP)
JAL	_CalcRadius+0
NOP	
LW	R25, 4(SP)
;Kinematics.c,355 :: 		quad = QuadrantStart(cir->I,cir->J);
ADDIU	R2, R25, 36
LWC1	S1, 0(R2)
ADDIU	R2, R25, 32
LWC1	S0, 0(R2)
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_QuadrantStart+0
NOP	
SH	R2, Offset(Cir_Interpolation_quad_L0+0)(GP)
;Kinematics.c,358 :: 		if(quad == 1 || quad == 4){
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__Cir_Interpolation232
NOP	
J	L__Cir_Interpolation146
NOP	
L__Cir_Interpolation232:
LH	R3, Offset(Cir_Interpolation_quad_L0+0)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__Cir_Interpolation234
NOP	
J	L__Cir_Interpolation145
NOP	
L__Cir_Interpolation234:
J	L_Cir_Interpolation106
NOP	
L__Cir_Interpolation146:
L__Cir_Interpolation145:
;Kinematics.c,359 :: 		cir->xFin = cir->xRad + (cir->radius * cos(cir->degreeRadians));
ADDIU	R2, R25, 68
SW	R2, 16(SP)
ADDIU	R2, R25, 52
LWC1	S0, 0(R2)
SWC1	S0, 12(SP)
ADDIU	R2, R25, 44
LWC1	S0, 0(R2)
SWC1	S0, 8(SP)
ADDIU	R2, R25, 12
LWC1	S12, 0(R2)
JAL	_cos+0
NOP	
LWC1	S1, 8(SP)
MUL.S 	S1, S1, S0
LWC1	S0, 12(SP)
ADD.S 	S0, S0, S1
LW	R2, 16(SP)
SWC1	S0, 0(R2)
;Kinematics.c,360 :: 		cir->yFin = cir->yRad + (cir->radius * sin(cir->degreeRadians));
ADDIU	R2, R25, 72
SW	R2, 16(SP)
ADDIU	R2, R25, 56
LWC1	S0, 0(R2)
SWC1	S0, 12(SP)
ADDIU	R2, R25, 44
LWC1	S0, 0(R2)
SWC1	S0, 8(SP)
ADDIU	R2, R25, 12
LWC1	S12, 0(R2)
JAL	_sin+0
NOP	
LWC1	S1, 8(SP)
MUL.S 	S1, S1, S0
LWC1	S0, 12(SP)
ADD.S 	S0, S0, S1
LW	R2, 16(SP)
SWC1	S0, 0(R2)
;Kinematics.c,361 :: 		}
L_Cir_Interpolation106:
;Kinematics.c,362 :: 		if(quad == 2 || quad == 3){
LH	R3, Offset(Cir_Interpolation_quad_L0+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__Cir_Interpolation236
NOP	
J	L__Cir_Interpolation148
NOP	
L__Cir_Interpolation236:
LH	R3, Offset(Cir_Interpolation_quad_L0+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__Cir_Interpolation238
NOP	
J	L__Cir_Interpolation147
NOP	
L__Cir_Interpolation238:
J	L_Cir_Interpolation109
NOP	
L__Cir_Interpolation148:
L__Cir_Interpolation147:
;Kinematics.c,363 :: 		cir->xFin = cir->xRad - (cir->radius * cos(cir->degreeRadians));
ADDIU	R2, R25, 68
SW	R2, 16(SP)
ADDIU	R2, R25, 52
LWC1	S0, 0(R2)
SWC1	S0, 12(SP)
ADDIU	R2, R25, 44
LWC1	S0, 0(R2)
SWC1	S0, 8(SP)
ADDIU	R2, R25, 12
LWC1	S12, 0(R2)
JAL	_cos+0
NOP	
LWC1	S1, 8(SP)
MUL.S 	S1, S1, S0
LWC1	S0, 12(SP)
SUB.S 	S0, S0, S1
LW	R2, 16(SP)
SWC1	S0, 0(R2)
;Kinematics.c,364 :: 		cir->yFin = cir->yRad - (cir->radius * sin(cir->degreeRadians));
ADDIU	R2, R25, 72
SW	R2, 16(SP)
ADDIU	R2, R25, 56
LWC1	S0, 0(R2)
SWC1	S0, 12(SP)
ADDIU	R2, R25, 44
LWC1	S0, 0(R2)
SWC1	S0, 8(SP)
ADDIU	R2, R25, 12
LWC1	S12, 0(R2)
JAL	_sin+0
NOP	
LWC1	S1, 8(SP)
MUL.S 	S1, S1, S0
LWC1	S0, 12(SP)
SUB.S 	S0, S0, S1
LW	R2, 16(SP)
SWC1	S0, 0(R2)
;Kinematics.c,365 :: 		}
L_Cir_Interpolation109:
;Kinematics.c,366 :: 		Circ_Tick(cir);
JAL	_Circ_Tick+0
NOP	
;Kinematics.c,367 :: 		}
L_end_Cir_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Cir_Interpolation
_Circ_Tick:
;Kinematics.c,369 :: 		void Circ_Tick(Circle* cir){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Kinematics.c,371 :: 		if (cir->dir == CW){
SW	R26, 4(SP)
ADDIU	R2, R25, 48
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__Circ_Tick240
NOP	
J	L_Circ_Tick110
NOP	
L__Circ_Tick240:
;Kinematics.c,372 :: 		cir->deg += cir->divisor;
ADDIU	R3, R25, 4
ADDIU	R2, R25, 24
LWC1	S1, 0(R2)
LWC1	S0, 0(R3)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Kinematics.c,373 :: 		if (cir->deg >= cir->degreeDeg){
ADDIU	R2, R25, 4
LWC1	S1, 0(R2)
ADDIU	R2, R25, 8
LWC1	S0, 0(R2)
C.LT.S 	0, S1, S0
BC1F	0, L__Circ_Tick241
NOP	
J	L_Circ_Tick111
NOP	
L__Circ_Tick241:
;Kinematics.c,374 :: 		disableOCx();
SW	R25, 8(SP)
JAL	_disableOCx+0
NOP	
LW	R25, 8(SP)
;Kinematics.c,375 :: 		}
L_Circ_Tick111:
;Kinematics.c,376 :: 		}
L_Circ_Tick110:
;Kinematics.c,378 :: 		if (cir->dir == CCW){
ADDIU	R2, R25, 48
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__Circ_Tick242
NOP	
J	L_Circ_Tick112
NOP	
L__Circ_Tick242:
;Kinematics.c,379 :: 		cir->deg -= cir->divisor;
ADDIU	R3, R25, 4
ADDIU	R2, R25, 24
LWC1	S1, 0(R2)
LWC1	S0, 0(R3)
SUB.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Kinematics.c,380 :: 		if (cir->deg <= cir->degreeDeg){
ADDIU	R2, R25, 4
LWC1	S1, 0(R2)
ADDIU	R2, R25, 8
LWC1	S0, 0(R2)
C.LT.S 	0, S0, S1
BC1F	0, L__Circ_Tick243
NOP	
J	L_Circ_Tick113
NOP	
L__Circ_Tick243:
;Kinematics.c,381 :: 		disableOCx();
SW	R25, 8(SP)
JAL	_disableOCx+0
NOP	
LW	R25, 8(SP)
;Kinematics.c,382 :: 		}
L_Circ_Tick113:
;Kinematics.c,384 :: 		}
L_Circ_Tick112:
;Kinematics.c,386 :: 		if(cir->xFin > lastX){
ADDIU	R2, R25, 68
LWC1	S1, 0(R2)
LWC1	S0, Offset(Circ_Tick_lastX_L0+0)(GP)
C.LE.S 	0, S1, S0
BC1F	0, L__Circ_Tick244
NOP	
J	L_Circ_Tick114
NOP	
L__Circ_Tick244:
;Kinematics.c,387 :: 		Step_Cycle(X,Cir);
SW	R25, 8(SP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
LW	R25, 8(SP)
;Kinematics.c,388 :: 		lastX = cir->xFin;
ADDIU	R2, R25, 68
LWC1	S0, 0(R2)
SWC1	S0, Offset(Circ_Tick_lastX_L0+0)(GP)
;Kinematics.c,389 :: 		}
L_Circ_Tick114:
;Kinematics.c,390 :: 		if(cir->yFin > lastY){
ADDIU	R2, R25, 72
LWC1	S1, 0(R2)
LWC1	S0, Offset(Circ_Tick_lastY_L0+0)(GP)
C.LE.S 	0, S1, S0
BC1F	0, L__Circ_Tick245
NOP	
J	L_Circ_Tick115
NOP	
L__Circ_Tick245:
;Kinematics.c,391 :: 		Step_Cycle(Y,Cir);
SW	R25, 8(SP)
ORI	R26, R0, 1
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
LW	R25, 8(SP)
;Kinematics.c,392 :: 		lastY = cir->yFin;
ADDIU	R2, R25, 72
LWC1	S0, 0(R2)
SWC1	S0, Offset(Circ_Tick_lastY_L0+0)(GP)
;Kinematics.c,393 :: 		}
L_Circ_Tick115:
;Kinematics.c,395 :: 		}
L_end_Circ_Tick:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Circ_Tick
