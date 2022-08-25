_SingleAxisStep:
;Kinematics.c,20 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,26 :: 		SV.Single_Dual = 0;
SW	R25, 4(SP)
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,28 :: 		switch(axis_No){
J	L_SingleAxisStep0
NOP	
;Kinematics.c,29 :: 		case X:
L_SingleAxisStep2:
;Kinematics.c,30 :: 		Single_Axis_Enable(X);
SH	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,31 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,32 :: 		case Y:
L_SingleAxisStep3:
;Kinematics.c,33 :: 		Single_Axis_Enable(Y);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,34 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,35 :: 		case Z:
L_SingleAxisStep4:
;Kinematics.c,36 :: 		Single_Axis_Enable(Z);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,37 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,38 :: 		case A:
L_SingleAxisStep5:
;Kinematics.c,39 :: 		Single_Axis_Enable(A);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 3
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,40 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,41 :: 		default: break;
L_SingleAxisStep6:
J	L_SingleAxisStep1
NOP	
;Kinematics.c,42 :: 		}
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
;Kinematics.c,43 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,44 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R25, 0(R2)
;Kinematics.c,45 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
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
;Kinematics.c,47 :: 		if(newxyz < 0)
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep158
NOP	
J	L_SingleAxisStep7
NOP	
L__SingleAxisStep158:
;Kinematics.c,48 :: 		dir = CCW;
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep8
NOP	
L_SingleAxisStep7:
;Kinematics.c,50 :: 		dir = CW;
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep8:
;Kinematics.c,52 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep9
NOP	
;Kinematics.c,53 :: 		case X:
L_SingleAxisStep11:
;Kinematics.c,54 :: 		DIR_StepX = dir;
_LX	
INS	R2, R4, BitPos(DIR_StepX+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,55 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,56 :: 		case Y:
L_SingleAxisStep12:
;Kinematics.c,57 :: 		DIR_StepY = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepY+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,58 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,59 :: 		case Z:
L_SingleAxisStep13:
;Kinematics.c,60 :: 		DIR_StepZ = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepZ+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,61 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,62 :: 		case A:
L_SingleAxisStep14:
;Kinematics.c,63 :: 		DIR_StepA = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepA+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,64 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,65 :: 		default: break;
L_SingleAxisStep15:
J	L_SingleAxisStep10
NOP	
;Kinematics.c,66 :: 		}
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
;Kinematics.c,68 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,70 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,72 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,77 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
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
;Kinematics.c,87 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,89 :: 		switch(axis_combo){
J	L_DualAxisStep16
NOP	
;Kinematics.c,90 :: 		case xy:
L_DualAxisStep18:
;Kinematics.c,91 :: 		AxisPulse[1] = XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,92 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,93 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,95 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,96 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,99 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep168
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep168:
; ?FLOC___DualAxisStep?T40 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T40 end address is: 12 (R3)
J	L_DualAxisStep20
NOP	
L_DualAxisStep19:
; ?FLOC___DualAxisStep?T40 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T40 end address is: 12 (R3)
L_DualAxisStep20:
; ?FLOC___DualAxisStep?T40 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T40 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
;Kinematics.c,100 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep169
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep169:
; ?FLOC___DualAxisStep?T42 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T42 end address is: 12 (R3)
J	L_DualAxisStep22
NOP	
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T42 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T42 end address is: 12 (R3)
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T42 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T42 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
;Kinematics.c,103 :: 		if(SV.dirx < 0)
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep170
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep170:
;Kinematics.c,104 :: 		DIR_StepX = CCW;
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep24
NOP	
L_DualAxisStep23:
;Kinematics.c,106 :: 		DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep24:
;Kinematics.c,108 :: 		if(SV.diry < 0)
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep171
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep171:
;Kinematics.c,109 :: 		DIR_StepY = CCW;
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep26
NOP	
L_DualAxisStep25:
;Kinematics.c,111 :: 		DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep26:
;Kinematics.c,113 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,114 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,116 :: 		if(SV.dx > SV.dy)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep172
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep172:
;Kinematics.c,117 :: 		SV.d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep28
NOP	
L_DualAxisStep27:
;Kinematics.c,119 :: 		SV.d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep28:
;Kinematics.c,121 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,122 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,123 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,125 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,126 :: 		case xz:
L_DualAxisStep29:
;Kinematics.c,127 :: 		AxisPulse[1] = XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,128 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,129 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,131 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,132 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,135 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep173
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep173:
; ?FLOC___DualAxisStep?T58 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T58 end address is: 12 (R3)
J	L_DualAxisStep31
NOP	
L_DualAxisStep30:
; ?FLOC___DualAxisStep?T58 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T58 end address is: 12 (R3)
L_DualAxisStep31:
; ?FLOC___DualAxisStep?T58 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T58 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
;Kinematics.c,136 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep174
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep174:
; ?FLOC___DualAxisStep?T60 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T60 end address is: 12 (R3)
J	L_DualAxisStep33
NOP	
L_DualAxisStep32:
; ?FLOC___DualAxisStep?T60 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T60 end address is: 12 (R3)
L_DualAxisStep33:
; ?FLOC___DualAxisStep?T60 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T60 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
;Kinematics.c,139 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
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
;Kinematics.c,140 :: 		else DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep35:
;Kinematics.c,142 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
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
;Kinematics.c,143 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep37:
;Kinematics.c,145 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,146 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,148 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
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
;Kinematics.c,149 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep39:
;Kinematics.c,151 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,152 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,153 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,154 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,155 :: 		case yz:
L_DualAxisStep40:
;Kinematics.c,156 :: 		AxisPulse[1] = YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,157 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,158 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,161 :: 		SV.dy   = newx - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,162 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,165 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep178
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep178:
; ?FLOC___DualAxisStep?T76 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T76 end address is: 12 (R3)
J	L_DualAxisStep42
NOP	
L_DualAxisStep41:
; ?FLOC___DualAxisStep?T76 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T76 end address is: 12 (R3)
L_DualAxisStep42:
; ?FLOC___DualAxisStep?T76 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T76 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
;Kinematics.c,166 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep179
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep179:
; ?FLOC___DualAxisStep?T78 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T78 end address is: 12 (R3)
J	L_DualAxisStep44
NOP	
L_DualAxisStep43:
; ?FLOC___DualAxisStep?T78 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T78 end address is: 12 (R3)
L_DualAxisStep44:
; ?FLOC___DualAxisStep?T78 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T78 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
;Kinematics.c,169 :: 		if(SV.diry < 0)DIR_StepY = CCW;
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
;Kinematics.c,170 :: 		else DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep46:
;Kinematics.c,171 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
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
;Kinematics.c,172 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep48:
;Kinematics.c,174 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,175 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,177 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
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
;Kinematics.c,178 :: 		else d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep50:
;Kinematics.c,180 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,181 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,182 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,183 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,184 :: 		default: break;
L_DualAxisStep51:
J	L_DualAxisStep17
NOP	
;Kinematics.c,186 :: 		}
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
;Kinematics.c,187 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _DualAxisStep
_XY_Interpolate:
;Kinematics.c,192 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,193 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)){
SW	R25, 4(SP)
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
;Kinematics.c,194 :: 		StopX();
JAL	_StopX+0
NOP	
;Kinematics.c,195 :: 		StopY();
JAL	_StopY+0
NOP	
;Kinematics.c,196 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Kinematics.c,197 :: 		}
L_XY_Interpolate54:
;Kinematics.c,199 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XY_Interpolate192
NOP	
J	L_XY_Interpolate55
NOP	
L__XY_Interpolate192:
;Kinematics.c,200 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,201 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate193
NOP	
J	L_XY_Interpolate56
NOP	
L__XY_Interpolate193:
;Kinematics.c,202 :: 		SV.d2 += 2*SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,203 :: 		}else{
J	L_XY_Interpolate57
NOP	
L_XY_Interpolate56:
;Kinematics.c,204 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,205 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,206 :: 		}
L_XY_Interpolate57:
;Kinematics.c,207 :: 		}else{
J	L_XY_Interpolate58
NOP	
L_XY_Interpolate55:
;Kinematics.c,208 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,209 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate194
NOP	
J	L_XY_Interpolate59
NOP	
L__XY_Interpolate194:
;Kinematics.c,210 :: 		SV.d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,211 :: 		}else{
J	L_XY_Interpolate60
NOP	
L_XY_Interpolate59:
;Kinematics.c,212 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,213 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,214 :: 		}
L_XY_Interpolate60:
;Kinematics.c,215 :: 		}
L_XY_Interpolate58:
;Kinematics.c,216 :: 		}
L_end_XY_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XY_Interpolate
_XZ_Interpolate:
;Kinematics.c,218 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,220 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
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
;Kinematics.c,221 :: 		StopX();
JAL	_StopX+0
NOP	
;Kinematics.c,222 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Kinematics.c,224 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Kinematics.c,225 :: 		}
L_XZ_Interpolate63:
;Kinematics.c,227 :: 		if(SV.dx > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XZ_Interpolate198
NOP	
J	L_XZ_Interpolate64
NOP	
L__XZ_Interpolate198:
;Kinematics.c,228 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,229 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate199
NOP	
J	L_XZ_Interpolate65
NOP	
L__XZ_Interpolate199:
;Kinematics.c,230 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_XZ_Interpolate66
NOP	
L_XZ_Interpolate65:
;Kinematics.c,232 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,233 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,234 :: 		}
L_XZ_Interpolate66:
;Kinematics.c,236 :: 		}else{
J	L_XZ_Interpolate67
NOP	
L_XZ_Interpolate64:
;Kinematics.c,237 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,238 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate200
NOP	
J	L_XZ_Interpolate68
NOP	
L__XZ_Interpolate200:
;Kinematics.c,239 :: 		d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_XZ_Interpolate69
NOP	
L_XZ_Interpolate68:
;Kinematics.c,241 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,242 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,243 :: 		}
L_XZ_Interpolate69:
;Kinematics.c,244 :: 		}
L_XZ_Interpolate67:
;Kinematics.c,245 :: 		}
L_end_XZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XZ_Interpolate
_YZ_Interpolate:
;Kinematics.c,247 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,248 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
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
;Kinematics.c,249 :: 		StopY();
JAL	_StopY+0
NOP	
;Kinematics.c,250 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Kinematics.c,251 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Kinematics.c,252 :: 		}
L_YZ_Interpolate72:
;Kinematics.c,254 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__YZ_Interpolate204
NOP	
J	L_YZ_Interpolate73
NOP	
L__YZ_Interpolate204:
;Kinematics.c,255 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,256 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate205
NOP	
J	L_YZ_Interpolate74
NOP	
L__YZ_Interpolate205:
;Kinematics.c,257 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_YZ_Interpolate75
NOP	
L_YZ_Interpolate74:
;Kinematics.c,259 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,260 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,261 :: 		}
L_YZ_Interpolate75:
;Kinematics.c,262 :: 		}else{
J	L_YZ_Interpolate76
NOP	
L_YZ_Interpolate73:
;Kinematics.c,263 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,264 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate206
NOP	
J	L_YZ_Interpolate77
NOP	
L__YZ_Interpolate206:
;Kinematics.c,265 :: 		d2 += 2 * SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_YZ_Interpolate78
NOP	
L_YZ_Interpolate77:
;Kinematics.c,267 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,268 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,269 :: 		}
L_YZ_Interpolate78:
;Kinematics.c,270 :: 		}
L_YZ_Interpolate76:
;Kinematics.c,272 :: 		}
L_end_YZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _YZ_Interpolate
_SetCircleVals:
;Kinematics.c,280 :: 		void SetCircleVals(double curX,double curY,double i,double j, double deg,int dir){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
; deg start address is: 0 (R0)
LWC1	S0, 4(SP)
;Kinematics.c,281 :: 		Circ.I = i;
SWC1	S14, Offset(_Circ+28)(GP)
;Kinematics.c,282 :: 		Circ.J = j;
SWC1	S15, Offset(_Circ+32)(GP)
;Kinematics.c,283 :: 		Circ.xStart = curX;
SWC1	S12, Offset(_Circ+56)(GP)
;Kinematics.c,284 :: 		Circ.yStart = curY;
SWC1	S13, Offset(_Circ+60)(GP)
;Kinematics.c,285 :: 		Circ.degreeDeg = deg;
SWC1	S0, Offset(_Circ+4)(GP)
; deg end address is: 0 (R0)
;Kinematics.c,286 :: 		Circ.dir = CircDir(dir);
JAL	_CircDir+0
NOP	
SH	R2, Offset(_Circ+44)(GP)
;Kinematics.c,287 :: 		}
L_end_SetCircleVals:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _SetCircleVals
_QuadrantStart:
;Kinematics.c,291 :: 		int QuadrantStart(double i,double j){
;Kinematics.c,292 :: 		if((i <= 0)&&(j >= 0))
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
;Kinematics.c,293 :: 		return 1;
ORI	R2, R0, 1
J	L_end_QuadrantStart
NOP	
;Kinematics.c,292 :: 		if((i <= 0)&&(j >= 0))
L__QuadrantStart130:
L__QuadrantStart129:
;Kinematics.c,294 :: 		else if((i > 0)&&(j > 0))
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
;Kinematics.c,295 :: 		return 2;
ORI	R2, R0, 2
J	L_end_QuadrantStart
NOP	
;Kinematics.c,294 :: 		else if((i > 0)&&(j > 0))
L__QuadrantStart132:
L__QuadrantStart131:
;Kinematics.c,296 :: 		else if((i > 0)&&(j < 0))
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
;Kinematics.c,297 :: 		return 3;
ORI	R2, R0, 3
J	L_end_QuadrantStart
NOP	
;Kinematics.c,296 :: 		else if((i > 0)&&(j < 0))
L__QuadrantStart134:
L__QuadrantStart133:
;Kinematics.c,298 :: 		else if((i < 0)&&(j < 0))
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
;Kinematics.c,299 :: 		return 4;
ORI	R2, R0, 4
J	L_end_QuadrantStart
NOP	
;Kinematics.c,298 :: 		else if((i < 0)&&(j < 0))
L__QuadrantStart136:
L__QuadrantStart135:
;Kinematics.c,301 :: 		return 0;
MOVZ	R2, R0, R0
;Kinematics.c,302 :: 		}
L_end_QuadrantStart:
JR	RA
NOP	
; end of _QuadrantStart
_CircDir:
;Kinematics.c,307 :: 		int CircDir(int dir){
;Kinematics.c,309 :: 		Circ.dir = dir;
SH	R25, Offset(_Circ+44)(GP)
;Kinematics.c,310 :: 		if(dir == CW){
SEH	R2, R25
BEQ	R2, R0, L__CircDir218
NOP	
J	L_CircDir95
NOP	
L__CircDir218:
;Kinematics.c,311 :: 		newDeg = 360 / Circ.deg;
LWC1	S1, Offset(_Circ+0)(GP)
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S2, S0, S1
;Kinematics.c,312 :: 		Circ.N = (2*Pi*Circ.radius)/newDeg;
LWC1	S1, Offset(_Circ+40)(GP)
LUI	R2, 16585
ORI	R2, R2, 4048
MTC1	R2, S0
MUL.S 	S0, S0, S1
DIV.S 	S0, S0, S2
SWC1	S0, Offset(_Circ+36)(GP)
;Kinematics.c,313 :: 		Circ.divisor = Circ.deg / newDeg;
LWC1	S0, Offset(_Circ+0)(GP)
DIV.S 	S0, S0, S2
SWC1	S0, Offset(_Circ+20)(GP)
;Kinematics.c,314 :: 		}
L_CircDir95:
;Kinematics.c,316 :: 		if(Circ.dir == CW)
LH	R2, Offset(_Circ+44)(GP)
BEQ	R2, R0, L__CircDir219
NOP	
J	L_CircDir96
NOP	
L__CircDir219:
;Kinematics.c,317 :: 		Circ.deg = 0.00;
MOVZ	R2, R0, R0
SW	R2, Offset(_Circ+0)(GP)
L_CircDir96:
;Kinematics.c,318 :: 		if(Circ.dir == CCW)
LH	R3, Offset(_Circ+44)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__CircDir220
NOP	
J	L_CircDir97
NOP	
L__CircDir220:
;Kinematics.c,319 :: 		Circ.deg = 360.00;
LUI	R2, 17332
ORI	R2, R2, 0
SW	R2, Offset(_Circ+0)(GP)
L_CircDir97:
;Kinematics.c,321 :: 		return Circ.dir;
LH	R2, Offset(_Circ+44)(GP)
;Kinematics.c,322 :: 		}
L_end_CircDir:
JR	RA
NOP	
; end of _CircDir
_CalcRadius:
;Kinematics.c,326 :: 		void CalcRadius(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Kinematics.c,328 :: 		AxisPulse[2] = Cir_Interpolation;
SW	R25, 4(SP)
LUI	R2, hi_addr(_Cir_Interpolation+0)
ORI	R2, R2, lo_addr(_Cir_Interpolation+0)
SW	R2, Offset(_AxisPulse+8)(GP)
;Kinematics.c,329 :: 		Multi_Axis_Enable(xy);
MOVZ	R25, R0, R0
JAL	_Multi_Axis_Enable+0
NOP	
;Kinematics.c,330 :: 		Circ.xRad = fabs(Circ.xStart + Circ.I);
LWC1	S1, Offset(_Circ+28)(GP)
LWC1	S0, Offset(_Circ+56)(GP)
ADD.S 	S0, S0, S1
MOV.S 	S12, S0
JAL	_fabs+0
NOP	
SWC1	S0, Offset(_Circ+48)(GP)
;Kinematics.c,331 :: 		Circ.yRad = fabs(Circ.yStart + Circ.J);
LWC1	S1, Offset(_Circ+32)(GP)
LWC1	S0, Offset(_Circ+60)(GP)
ADD.S 	S0, S0, S1
MOV.S 	S12, S0
JAL	_fabs+0
NOP	
SWC1	S0, Offset(_Circ+52)(GP)
;Kinematics.c,332 :: 		Circ.radius = sqrt((Circ.xRad*Circ.xRad) + (Circ.yRad*Circ.yRad));
LWC1	S2, Offset(_Circ+48)(GP)
LWC1	S1, Offset(_Circ+48)(GP)
MUL.S 	S1, S1, S2
MUL.S 	S0, S0, S0
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
SWC1	S0, Offset(_Circ+40)(GP)
;Kinematics.c,333 :: 		angA = atan2(Circ.yRad,Circ.xRad);
LWC1	S13, Offset(_Circ+48)(GP)
LWC1	S12, Offset(_Circ+52)(GP)
JAL	_atan2+0
NOP	
;Kinematics.c,336 :: 		Circ.degreeDeg = angA * rad2deg;
LUI	R2, 16997
ORI	R2, R2, 12013
MTC1	R2, S1
MUL.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+4)(GP)
;Kinematics.c,338 :: 		Circ.quadrant_start = QuadrantStart(Circ.I,Circ.J);
LWC1	S13, Offset(_Circ+32)(GP)
LWC1	S12, Offset(_Circ+28)(GP)
JAL	_QuadrantStart+0
NOP	
SH	R2, Offset(_Circ+46)(GP)
;Kinematics.c,340 :: 		if(Circ.quadrant_start == 1 || Circ.quadrant_start == 3)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius223
NOP	
J	L__CalcRadius140
NOP	
L__CalcRadius223:
LH	R3, Offset(_Circ+46)(GP)
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
;Kinematics.c,341 :: 		angB = Circ.deg - Circ.degreeDeg;
LWC1	S1, Offset(_Circ+4)(GP)
LWC1	S0, Offset(_Circ+0)(GP)
SUB.S 	S0, S0, S1
SWC1	S0, 8(SP)
L_CalcRadius100:
;Kinematics.c,342 :: 		if(Circ.quadrant_start == 1 || Circ.quadrant_start == 3)
LH	R3, Offset(_Circ+46)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius227
NOP	
J	L__CalcRadius142
NOP	
L__CalcRadius227:
LH	R3, Offset(_Circ+46)(GP)
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
;Kinematics.c,343 :: 		angB = Circ.deg + Circ.degreeDeg;
LWC1	S1, Offset(_Circ+4)(GP)
LWC1	S0, Offset(_Circ+0)(GP)
ADD.S 	S0, S0, S1
SWC1	S0, 8(SP)
L_CalcRadius103:
;Kinematics.c,345 :: 		Circ.degreeRadians = angB * deg2rad;
LWC1	S1, 8(SP)
LUI	R2, 15502
ORI	R2, R2, 64046
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, Offset(_Circ+8)(GP)
;Kinematics.c,346 :: 		}
L_end_CalcRadius:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _CalcRadius
_Cir_Interpolation:
;Kinematics.c,350 :: 		void Cir_Interpolation(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,352 :: 		SV.Single_Dual = 2;
ORI	R2, R0, 2
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,353 :: 		CalcRadius();
JAL	_CalcRadius+0
NOP	
;Kinematics.c,354 :: 		quad = QuadrantStart(Circ.I,Circ.J);
LWC1	S13, Offset(_Circ+32)(GP)
LWC1	S12, Offset(_Circ+28)(GP)
JAL	_QuadrantStart+0
NOP	
SH	R2, Offset(Cir_Interpolation_quad_L0+0)(GP)
;Kinematics.c,357 :: 		if(quad == 1 || quad == 4){
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
;Kinematics.c,358 :: 		Circ.xFin = Circ.xRad + (Circ.radius * cos(Circ.degreeRadians));
LWC1	S12, Offset(_Circ+8)(GP)
JAL	_cos+0
NOP	
LWC1	S1, Offset(_Circ+40)(GP)
MUL.S 	S1, S1, S0
LWC1	S0, Offset(_Circ+48)(GP)
ADD.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+64)(GP)
;Kinematics.c,359 :: 		Circ.yFin = Circ.yRad + (Circ.radius * sin(Circ.degreeRadians));
LWC1	S12, Offset(_Circ+8)(GP)
JAL	_sin+0
NOP	
LWC1	S1, Offset(_Circ+40)(GP)
MUL.S 	S1, S1, S0
LWC1	S0, Offset(_Circ+52)(GP)
ADD.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+68)(GP)
;Kinematics.c,360 :: 		}
L_Cir_Interpolation106:
;Kinematics.c,361 :: 		if(quad == 2 || quad == 3){
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
;Kinematics.c,362 :: 		Circ.xFin = Circ.xRad - (Circ.radius * cos(Circ.degreeRadians));
LWC1	S12, Offset(_Circ+8)(GP)
JAL	_cos+0
NOP	
LWC1	S1, Offset(_Circ+40)(GP)
MUL.S 	S1, S1, S0
LWC1	S0, Offset(_Circ+48)(GP)
SUB.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+64)(GP)
;Kinematics.c,363 :: 		Circ.yFin = Circ.yRad - (Circ.radius * sin(Circ.degreeRadians));
LWC1	S12, Offset(_Circ+8)(GP)
JAL	_sin+0
NOP	
LWC1	S1, Offset(_Circ+40)(GP)
MUL.S 	S1, S1, S0
LWC1	S0, Offset(_Circ+52)(GP)
SUB.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+68)(GP)
;Kinematics.c,364 :: 		}
L_Cir_Interpolation109:
;Kinematics.c,365 :: 		Circ_Tick();
JAL	_Circ_Tick+0
NOP	
;Kinematics.c,366 :: 		}
L_end_Cir_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Cir_Interpolation
_Circ_Tick:
;Kinematics.c,368 :: 		void Circ_Tick(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,370 :: 		if (Circ.dir == CW){
SW	R25, 4(SP)
LH	R2, Offset(_Circ+44)(GP)
BEQ	R2, R0, L__Circ_Tick240
NOP	
J	L_Circ_Tick110
NOP	
L__Circ_Tick240:
;Kinematics.c,371 :: 		Circ.deg += Circ.divisor;
LWC1	S1, Offset(_Circ+20)(GP)
LWC1	S0, Offset(_Circ+0)(GP)
ADD.S 	S1, S0, S1
SWC1	S1, Offset(_Circ+0)(GP)
;Kinematics.c,372 :: 		if (Circ.deg >= Circ.degreeDeg){
LWC1	S0, Offset(_Circ+4)(GP)
C.LT.S 	0, S1, S0
BC1F	0, L__Circ_Tick241
NOP	
J	L_Circ_Tick111
NOP	
L__Circ_Tick241:
;Kinematics.c,373 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Kinematics.c,374 :: 		}
L_Circ_Tick111:
;Kinematics.c,375 :: 		}
L_Circ_Tick110:
;Kinematics.c,377 :: 		if (Circ.dir == CCW){
LH	R3, Offset(_Circ+44)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Circ_Tick242
NOP	
J	L_Circ_Tick112
NOP	
L__Circ_Tick242:
;Kinematics.c,378 :: 		Circ.deg -= Circ.divisor;
LWC1	S1, Offset(_Circ+20)(GP)
LWC1	S0, Offset(_Circ+0)(GP)
SUB.S 	S1, S0, S1
SWC1	S1, Offset(_Circ+0)(GP)
;Kinematics.c,379 :: 		if (Circ.deg <= Circ.degreeDeg){
LWC1	S0, Offset(_Circ+4)(GP)
C.LT.S 	0, S0, S1
BC1F	0, L__Circ_Tick243
NOP	
J	L_Circ_Tick113
NOP	
L__Circ_Tick243:
;Kinematics.c,380 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Kinematics.c,381 :: 		}
L_Circ_Tick113:
;Kinematics.c,383 :: 		}
L_Circ_Tick112:
;Kinematics.c,385 :: 		if(Circ.xFin > lastX){
LWC1	S1, Offset(Circ_Tick_lastX_L0+0)(GP)
LWC1	S0, Offset(_Circ+64)(GP)
C.LE.S 	0, S0, S1
BC1F	0, L__Circ_Tick244
NOP	
J	L_Circ_Tick114
NOP	
L__Circ_Tick244:
;Kinematics.c,386 :: 		toggleOCx(X);
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
;Kinematics.c,387 :: 		lastX = Circ.xFin;
LWC1	S0, Offset(_Circ+64)(GP)
SWC1	S0, Offset(Circ_Tick_lastX_L0+0)(GP)
;Kinematics.c,388 :: 		}
L_Circ_Tick114:
;Kinematics.c,389 :: 		if(Circ.yFin > lastY){
LWC1	S1, Offset(Circ_Tick_lastY_L0+0)(GP)
LWC1	S0, Offset(_Circ+68)(GP)
C.LE.S 	0, S0, S1
BC1F	0, L__Circ_Tick245
NOP	
J	L_Circ_Tick115
NOP	
L__Circ_Tick245:
;Kinematics.c,390 :: 		toggleOCx(Y);
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
;Kinematics.c,391 :: 		lastY = Circ.yFin;
LWC1	S0, Offset(_Circ+68)(GP)
SWC1	S0, Offset(Circ_Tick_lastY_L0+0)(GP)
;Kinematics.c,392 :: 		}
L_Circ_Tick115:
;Kinematics.c,394 :: 		}
L_end_Circ_Tick:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Circ_Tick
