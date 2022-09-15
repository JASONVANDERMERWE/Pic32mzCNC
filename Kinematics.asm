_SingleAxisStep:
;Kinematics.c,23 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,29 :: 		SV.Single_Dual = 0;
SW	R25, 4(SP)
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,31 :: 		switch(axis_No){
J	L_SingleAxisStep0
NOP	
;Kinematics.c,32 :: 		case X:
L_SingleAxisStep2:
;Kinematics.c,33 :: 		Single_Axis_Enable(X);
SH	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,34 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,35 :: 		case Y:
L_SingleAxisStep3:
;Kinematics.c,36 :: 		Single_Axis_Enable(Y);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,37 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,38 :: 		case Z:
L_SingleAxisStep4:
;Kinematics.c,39 :: 		Single_Axis_Enable(Z);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,40 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,41 :: 		case A:
L_SingleAxisStep5:
;Kinematics.c,42 :: 		Single_Axis_Enable(A);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 3
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,43 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,44 :: 		default: break;
L_SingleAxisStep6:
J	L_SingleAxisStep1
NOP	
;Kinematics.c,45 :: 		}
L_SingleAxisStep0:
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep184
NOP	
J	L_SingleAxisStep2
NOP	
L__SingleAxisStep184:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep186
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep186:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep188
NOP	
J	L_SingleAxisStep4
NOP	
L__SingleAxisStep188:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep190
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep190:
J	L_SingleAxisStep6
NOP	
L_SingleAxisStep1:
;Kinematics.c,46 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,47 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R25, 0(R2)
;Kinematics.c,48 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
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
;Kinematics.c,50 :: 		if(newxyz < 0)
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep191
NOP	
J	L_SingleAxisStep7
NOP	
L__SingleAxisStep191:
;Kinematics.c,51 :: 		dir = CCW;
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep8
NOP	
L_SingleAxisStep7:
;Kinematics.c,53 :: 		dir = CW;
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep8:
;Kinematics.c,55 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep9
NOP	
;Kinematics.c,56 :: 		case X:
L_SingleAxisStep11:
;Kinematics.c,57 :: 		DIR_StepX = dir;
_LX	
INS	R2, R4, BitPos(DIR_StepX+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,58 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,59 :: 		case Y:
L_SingleAxisStep12:
;Kinematics.c,60 :: 		DIR_StepY = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepY+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,61 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,62 :: 		case Z:
L_SingleAxisStep13:
;Kinematics.c,63 :: 		DIR_StepZ = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepZ+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,64 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,65 :: 		case A:
L_SingleAxisStep14:
;Kinematics.c,66 :: 		DIR_StepA = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepA+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,67 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,68 :: 		default: break;
L_SingleAxisStep15:
J	L_SingleAxisStep10
NOP	
;Kinematics.c,69 :: 		}
L_SingleAxisStep9:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep193
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep193:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep195
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep195:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep197
NOP	
J	L_SingleAxisStep13
NOP	
L__SingleAxisStep197:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep199
NOP	
J	L_SingleAxisStep14
NOP	
L__SingleAxisStep199:
; dir end address is: 16 (R4)
J	L_SingleAxisStep15
NOP	
L_SingleAxisStep10:
;Kinematics.c,71 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,73 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,75 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,80 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -16
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
;Kinematics.c,90 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,92 :: 		switch(axis_combo){
J	L_DualAxisStep16
NOP	
;Kinematics.c,93 :: 		case xy:
L_DualAxisStep18:
;Kinematics.c,94 :: 		AxisPulse[1] = XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,95 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,96 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,98 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,99 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,102 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep201
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep201:
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
;Kinematics.c,103 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep202
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep202:
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
;Kinematics.c,106 :: 		if(SV.dirx < 0)
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep203
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep203:
;Kinematics.c,107 :: 		DIR_StepX = CCW;
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep24
NOP	
L_DualAxisStep23:
;Kinematics.c,109 :: 		DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep24:
;Kinematics.c,111 :: 		if(SV.diry < 0)
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep204
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep204:
;Kinematics.c,112 :: 		DIR_StepY = CCW;
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep26
NOP	
L_DualAxisStep25:
;Kinematics.c,114 :: 		DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep26:
;Kinematics.c,116 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,117 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,119 :: 		if(SV.dx > SV.dy)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep205
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep205:
;Kinematics.c,120 :: 		SV.d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep28
NOP	
L_DualAxisStep27:
;Kinematics.c,122 :: 		SV.d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep28:
;Kinematics.c,124 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,125 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,126 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,128 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,129 :: 		case xz:
L_DualAxisStep29:
;Kinematics.c,130 :: 		AxisPulse[1] = XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,131 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,132 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,134 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,135 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,138 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep206
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep206:
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
;Kinematics.c,139 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep207
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep207:
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
;Kinematics.c,142 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep208
NOP	
J	L_DualAxisStep34
NOP	
L__DualAxisStep208:
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep35
NOP	
L_DualAxisStep34:
;Kinematics.c,143 :: 		else DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep35:
;Kinematics.c,145 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep209
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep209:
_LX	
ORI	R2, R2, BitMask(DIR_StepZ+0)
_SX	
J	L_DualAxisStep37
NOP	
L_DualAxisStep36:
;Kinematics.c,146 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep37:
;Kinematics.c,148 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,149 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,151 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep210
NOP	
J	L_DualAxisStep38
NOP	
L__DualAxisStep210:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep39
NOP	
L_DualAxisStep38:
;Kinematics.c,152 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep39:
;Kinematics.c,154 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,155 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,156 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,157 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,158 :: 		case yz:
L_DualAxisStep40:
;Kinematics.c,159 :: 		AxisPulse[1] = YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,160 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,161 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,164 :: 		SV.dy   = newx - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,165 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,168 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep211
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep211:
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
;Kinematics.c,169 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep212
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep212:
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
;Kinematics.c,172 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep213
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep213:
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep46
NOP	
L_DualAxisStep45:
;Kinematics.c,173 :: 		else DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep46:
;Kinematics.c,174 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep214
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep214:
_LX	
ORI	R2, R2, BitMask(DIR_StepZ+0)
_SX	
J	L_DualAxisStep48
NOP	
L_DualAxisStep47:
;Kinematics.c,175 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep48:
;Kinematics.c,177 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,178 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,180 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep215
NOP	
J	L_DualAxisStep49
NOP	
L__DualAxisStep215:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep50
NOP	
L_DualAxisStep49:
;Kinematics.c,181 :: 		else d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep50:
;Kinematics.c,183 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,184 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,185 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,186 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,187 :: 		default: break;
L_DualAxisStep51:
J	L_DualAxisStep17
NOP	
;Kinematics.c,189 :: 		}
L_DualAxisStep16:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep217
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep217:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep219
NOP	
J	L_DualAxisStep29
NOP	
L__DualAxisStep219:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep221
NOP	
J	L_DualAxisStep40
NOP	
L__DualAxisStep221:
J	L_DualAxisStep51
NOP	
L_DualAxisStep17:
;Kinematics.c,190 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _DualAxisStep
_XY_Interpolate:
;Kinematics.c,195 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,196 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate223
NOP	
J	L__XY_Interpolate142
NOP	
L__XY_Interpolate223:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate224
NOP	
J	L__XY_Interpolate141
NOP	
L__XY_Interpolate224:
J	L_XY_Interpolate54
NOP	
L__XY_Interpolate142:
L__XY_Interpolate141:
;Kinematics.c,197 :: 		StopX();
JAL	_StopX+0
NOP	
;Kinematics.c,198 :: 		StopY();
JAL	_StopY+0
NOP	
;Kinematics.c,199 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Kinematics.c,200 :: 		}
L_XY_Interpolate54:
;Kinematics.c,202 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XY_Interpolate225
NOP	
J	L_XY_Interpolate55
NOP	
L__XY_Interpolate225:
;Kinematics.c,203 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,204 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate226
NOP	
J	L_XY_Interpolate56
NOP	
L__XY_Interpolate226:
;Kinematics.c,205 :: 		SV.d2 += 2*SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,206 :: 		}else{
J	L_XY_Interpolate57
NOP	
L_XY_Interpolate56:
;Kinematics.c,207 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,208 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,209 :: 		}
L_XY_Interpolate57:
;Kinematics.c,210 :: 		}else{
J	L_XY_Interpolate58
NOP	
L_XY_Interpolate55:
;Kinematics.c,211 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,212 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate227
NOP	
J	L_XY_Interpolate59
NOP	
L__XY_Interpolate227:
;Kinematics.c,213 :: 		SV.d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,214 :: 		}else{
J	L_XY_Interpolate60
NOP	
L_XY_Interpolate59:
;Kinematics.c,215 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,216 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,217 :: 		}
L_XY_Interpolate60:
;Kinematics.c,218 :: 		}
L_XY_Interpolate58:
;Kinematics.c,219 :: 		}
L_end_XY_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XY_Interpolate
_XZ_Interpolate:
;Kinematics.c,221 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,223 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate229
NOP	
J	L__XZ_Interpolate145
NOP	
L__XZ_Interpolate229:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate230
NOP	
J	L__XZ_Interpolate144
NOP	
L__XZ_Interpolate230:
J	L_XZ_Interpolate63
NOP	
L__XZ_Interpolate145:
L__XZ_Interpolate144:
;Kinematics.c,224 :: 		StopX();
JAL	_StopX+0
NOP	
;Kinematics.c,225 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Kinematics.c,227 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Kinematics.c,228 :: 		}
L_XZ_Interpolate63:
;Kinematics.c,230 :: 		if(SV.dx > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XZ_Interpolate231
NOP	
J	L_XZ_Interpolate64
NOP	
L__XZ_Interpolate231:
;Kinematics.c,231 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,232 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate232
NOP	
J	L_XZ_Interpolate65
NOP	
L__XZ_Interpolate232:
;Kinematics.c,233 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_XZ_Interpolate66
NOP	
L_XZ_Interpolate65:
;Kinematics.c,235 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,236 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,237 :: 		}
L_XZ_Interpolate66:
;Kinematics.c,239 :: 		}else{
J	L_XZ_Interpolate67
NOP	
L_XZ_Interpolate64:
;Kinematics.c,240 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,241 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate233
NOP	
J	L_XZ_Interpolate68
NOP	
L__XZ_Interpolate233:
;Kinematics.c,242 :: 		d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_XZ_Interpolate69
NOP	
L_XZ_Interpolate68:
;Kinematics.c,244 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,245 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,246 :: 		}
L_XZ_Interpolate69:
;Kinematics.c,247 :: 		}
L_XZ_Interpolate67:
;Kinematics.c,248 :: 		}
L_end_XZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XZ_Interpolate
_YZ_Interpolate:
;Kinematics.c,250 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,251 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate235
NOP	
J	L__YZ_Interpolate148
NOP	
L__YZ_Interpolate235:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate236
NOP	
J	L__YZ_Interpolate147
NOP	
L__YZ_Interpolate236:
J	L_YZ_Interpolate72
NOP	
L__YZ_Interpolate148:
L__YZ_Interpolate147:
;Kinematics.c,252 :: 		StopY();
JAL	_StopY+0
NOP	
;Kinematics.c,253 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Kinematics.c,254 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Kinematics.c,255 :: 		}
L_YZ_Interpolate72:
;Kinematics.c,257 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__YZ_Interpolate237
NOP	
J	L_YZ_Interpolate73
NOP	
L__YZ_Interpolate237:
;Kinematics.c,258 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,259 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate238
NOP	
J	L_YZ_Interpolate74
NOP	
L__YZ_Interpolate238:
;Kinematics.c,260 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_YZ_Interpolate75
NOP	
L_YZ_Interpolate74:
;Kinematics.c,262 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,263 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,264 :: 		}
L_YZ_Interpolate75:
;Kinematics.c,265 :: 		}else{
J	L_YZ_Interpolate76
NOP	
L_YZ_Interpolate73:
;Kinematics.c,266 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,267 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate239
NOP	
J	L_YZ_Interpolate77
NOP	
L__YZ_Interpolate239:
;Kinematics.c,268 :: 		d2 += 2 * SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_YZ_Interpolate78
NOP	
L_YZ_Interpolate77:
;Kinematics.c,270 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,271 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,272 :: 		}
L_YZ_Interpolate78:
;Kinematics.c,273 :: 		}
L_YZ_Interpolate76:
;Kinematics.c,275 :: 		}
L_end_YZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _YZ_Interpolate
_SetCircleVals:
;Kinematics.c,283 :: 		void SetCircleVals(double curX,double curY,double finX,double finY,double i,double j,int dir){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
; i start address is: 128 (R32)
LWC1	S16, 32(SP)
; j start address is: 136 (R34)
LWC1	S17, 36(SP)
;Kinematics.c,285 :: 		int str_len = 0;
;Kinematics.c,287 :: 		AxisPulse[2] = Circ_Prep_Next;
LUI	R2, hi_addr(_Circ_Prep_Next+0)
ORI	R2, R2, lo_addr(_Circ_Prep_Next+0)
SW	R2, Offset(_AxisPulse+8)(GP)
;Kinematics.c,288 :: 		Multi_Axis_Enable(xy);
SWC1	S17, 4(SP)
SWC1	S16, 8(SP)
SH	R25, 12(SP)
SWC1	S15, 16(SP)
SWC1	S14, 20(SP)
SWC1	S13, 24(SP)
SWC1	S12, 28(SP)
MOVZ	R25, R0, R0
JAL	_Multi_Axis_Enable+0
NOP	
LWC1	S12, 28(SP)
LWC1	S13, 24(SP)
LWC1	S14, 20(SP)
LWC1	S15, 16(SP)
LH	R25, 12(SP)
LWC1	S16, 8(SP)
LWC1	S17, 4(SP)
;Kinematics.c,289 :: 		SV.Single_Dual = 2;
ORI	R2, R0, 2
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,290 :: 		Circ.xStart = curX;
SWC1	S12, Offset(_Circ+52)(GP)
;Kinematics.c,291 :: 		Circ.yStart = curY;
SWC1	S13, Offset(_Circ+56)(GP)
;Kinematics.c,292 :: 		Circ.xFin   = finX;
SWC1	S14, Offset(_Circ+68)(GP)
;Kinematics.c,293 :: 		Circ.yFin   = finY;
SWC1	S15, Offset(_Circ+72)(GP)
;Kinematics.c,294 :: 		X = fabs(i);
SWC1	S12, 4(SP)
MOV.S 	S12, S16
JAL	_fabs+0
NOP	
; X start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,295 :: 		Y = fabs(j);
MOV.S 	S12, S17
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
; Y start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,296 :: 		Circ.I = i;
SWC1	S16, Offset(_Circ+8)(GP)
; i end address is: 128 (R32)
;Kinematics.c,297 :: 		Circ.J = j;
SWC1	S17, Offset(_Circ+12)(GP)
;Kinematics.c,300 :: 		CalcRadius(Circ.I,Circ.J);
SWC1	S2, 4(SP)
; j end address is: 136 (R34)
SH	R25, 8(SP)
SWC1	S13, 12(SP)
SWC1	S12, 16(SP)
MOV.S 	S13, S17
LWC1	S12, Offset(_Circ+8)(GP)
JAL	_CalcRadius+0
NOP	
LWC1	S12, 16(SP)
LWC1	S13, 12(SP)
LH	R25, 8(SP)
LWC1	S2, 4(SP)
;Kinematics.c,302 :: 		CalcCircCenter(curX,curY,Circ.I,Circ.J);
LWC1	S15, Offset(_Circ+12)(GP)
LWC1	S14, Offset(_Circ+8)(GP)
JAL	_CalcCircCenter+0
NOP	
;Kinematics.c,305 :: 		Circ.quadrantS = Quadrant(Circ.I,Circ.J);
LWC1	S13, Offset(_Circ+12)(GP)
LWC1	S12, Offset(_Circ+8)(GP)
JAL	_Quadrant+0
NOP	
SH	R2, Offset(_Circ+34)(GP)
;Kinematics.c,308 :: 		CalcI_J_FromEndPos(Circ.xFin,Circ.yFin,Circ.xCenter,Circ.yCenter);
LWC1	S15, Offset(_Circ+48)(GP)
LWC1	S14, Offset(_Circ+44)(GP)
LWC1	S13, Offset(_Circ+72)(GP)
LWC1	S12, Offset(_Circ+68)(GP)
JAL	_CalcI_J_FromEndPos+0
NOP	
;Kinematics.c,311 :: 		Circ.Deg.degS = Calc_Angle(X,Y);
MOV.S 	S13, S3
; Y end address is: 24 (R6)
MOV.S 	S12, S2
; X end address is: 16 (R4)
JAL	_Calc_Angle+0
NOP	
SWC1	S0, Offset(_Circ+92)(GP)
;Kinematics.c,313 :: 		Circ.Deg.degF = Calc_Angle(Circ.I_end, Circ.J_end);
LWC1	S13, Offset(_Circ+20)(GP)
LWC1	S12, Offset(_Circ+16)(GP)
JAL	_Calc_Angle+0
NOP	
SWC1	S0, Offset(_Circ+96)(GP)
;Kinematics.c,315 :: 		Circ.Deg.degT = TestQuadrnt(Circ.I_end, Circ.J_end,Circ.Deg.degS,Circ.Deg.degF);
MOV.S 	S15, S0
LWC1	S14, Offset(_Circ+92)(GP)
LWC1	S13, Offset(_Circ+20)(GP)
LWC1	S12, Offset(_Circ+16)(GP)
JAL	_TestQuadrnt+0
NOP	
SWC1	S0, Offset(_Circ+100)(GP)
;Kinematics.c,317 :: 		Circ.quadrantF = Quadrant(Circ.I_end, Circ.J_end);
LWC1	S13, Offset(_Circ+20)(GP)
LWC1	S12, Offset(_Circ+16)(GP)
JAL	_Quadrant+0
NOP	
SH	R2, Offset(_Circ+36)(GP)
;Kinematics.c,318 :: 		Circ.dir = CircDir(dir);
JAL	_CircDir+0
NOP	
SH	R2, Offset(_Circ+32)(GP)
;Kinematics.c,321 :: 		CalcDivisor();
JAL	_CalcDivisor+0
NOP	
;Kinematics.c,322 :: 		Circ.lastX = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_Circ+84)(GP)
;Kinematics.c,323 :: 		Circ.lastY = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_Circ+88)(GP)
;Kinematics.c,325 :: 		}
L_end_SetCircleVals:
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _SetCircleVals
_CircDir:
;Kinematics.c,329 :: 		int CircDir(int dir){
;Kinematics.c,331 :: 		Circ.dir = dir;
SH	R25, Offset(_Circ+32)(GP)
;Kinematics.c,333 :: 		if(Circ.dir == CW)
SEH	R2, R25
BEQ	R2, R0, L__CircDir242
NOP	
J	L_CircDir79
NOP	
L__CircDir242:
;Kinematics.c,334 :: 		Circ.Deg.deg = 0.00;
MOVZ	R2, R0, R0
SW	R2, Offset(_Circ+104)(GP)
L_CircDir79:
;Kinematics.c,335 :: 		if(Circ.dir == CCW)
LH	R3, Offset(_Circ+32)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__CircDir243
NOP	
J	L_CircDir80
NOP	
L__CircDir243:
;Kinematics.c,336 :: 		Circ.Deg.deg = 360.00;
LUI	R2, 17332
ORI	R2, R2, 0
SW	R2, Offset(_Circ+104)(GP)
L_CircDir80:
;Kinematics.c,338 :: 		return Circ.dir;
LH	R2, Offset(_Circ+32)(GP)
;Kinematics.c,339 :: 		}
L_end_CircDir:
JR	RA
NOP	
; end of _CircDir
_CalcDivisor:
;Kinematics.c,343 :: 		void CalcDivisor(){
;Kinematics.c,346 :: 		newDeg = 360.00 / Circ.Deg.degT;
LWC1	S1, Offset(_Circ+100)(GP)
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S2, S0, S1
;Kinematics.c,347 :: 		Circ.N = (2*Pi*Circ.radius)/newDeg;
LWC1	S1, Offset(_Circ+28)(GP)
LUI	R2, 16585
ORI	R2, R2, 4060
MTC1	R2, S0
MUL.S 	S0, S0, S1
DIV.S 	S1, S0, S2
SWC1	S1, Offset(_Circ+24)(GP)
;Kinematics.c,348 :: 		Circ.divisor = Circ.Deg.deg/Circ.N;
LWC1	S0, Offset(_Circ+104)(GP)
DIV.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+4)(GP)
;Kinematics.c,349 :: 		Circ.Idivisor = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Circ+40)(GP)
;Kinematics.c,350 :: 		}
L_end_CalcDivisor:
JR	RA
NOP	
; end of _CalcDivisor
_Calc_Angle:
;Kinematics.c,354 :: 		double Calc_Angle(double i, double j){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,359 :: 		res = j/i;
DIV.S 	S0, S13, S12
;Kinematics.c,360 :: 		res = atan(res);
MOV.S 	S12, S0
JAL	_atan+0
NOP	
;Kinematics.c,363 :: 		return res*rad2deg;
LUI	R2, 16997
ORI	R2, R2, 11999
MTC1	R2, S1
MUL.S 	S0, S0, S1
;Kinematics.c,364 :: 		}
L_end_Calc_Angle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Calc_Angle
_CalcRadius:
;Kinematics.c,368 :: 		void CalcRadius(double i,double j){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,370 :: 		Circ.radius = sqrt((i*i) + (j*j));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
SWC1	S0, Offset(_Circ+28)(GP)
;Kinematics.c,371 :: 		}
L_end_CalcRadius:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _CalcRadius
_CalcCircCenter:
;Kinematics.c,375 :: 		void CalcCircCenter(double xS,double yS,double i,double j){
;Kinematics.c,377 :: 		Circ.xCenter = (xS + i);
ADD.S 	S0, S12, S14
SWC1	S0, Offset(_Circ+44)(GP)
;Kinematics.c,378 :: 		Circ.yCenter = (yS + j);
ADD.S 	S0, S13, S15
SWC1	S0, Offset(_Circ+48)(GP)
;Kinematics.c,379 :: 		}
L_end_CalcCircCenter:
JR	RA
NOP	
; end of _CalcCircCenter
_CalcI_J_FromEndPos:
;Kinematics.c,383 :: 		void CalcI_J_FromEndPos(double xF,double yF,double xC,double yC){
;Kinematics.c,384 :: 		Circ.I_end = xF - xC;
SUB.S 	S0, S12, S14
SWC1	S0, Offset(_Circ+16)(GP)
;Kinematics.c,385 :: 		Circ.J_end = yF - yC;
SUB.S 	S0, S13, S15
SWC1	S0, Offset(_Circ+20)(GP)
;Kinematics.c,386 :: 		}
L_end_CalcI_J_FromEndPos:
JR	RA
NOP	
; end of _CalcI_J_FromEndPos
_Quadrant:
;Kinematics.c,390 :: 		int Quadrant(double i,double j){
;Kinematics.c,391 :: 		if((i <= 0)&&(j >= 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__Quadrant250
NOP	
J	L__Quadrant154
NOP	
L__Quadrant250:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S13, S0
BC1F	0, L__Quadrant251
NOP	
J	L__Quadrant153
NOP	
L__Quadrant251:
L__Quadrant152:
;Kinematics.c,392 :: 		return 1;
ORI	R2, R0, 1
J	L_end_Quadrant
NOP	
;Kinematics.c,391 :: 		if((i <= 0)&&(j >= 0))
L__Quadrant154:
L__Quadrant153:
;Kinematics.c,393 :: 		else if((i > 0)&&(j > 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__Quadrant252
NOP	
J	L__Quadrant156
NOP	
L__Quadrant252:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S13, S0
BC1F	0, L__Quadrant253
NOP	
J	L__Quadrant155
NOP	
L__Quadrant253:
L__Quadrant151:
;Kinematics.c,394 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Quadrant
NOP	
;Kinematics.c,393 :: 		else if((i > 0)&&(j > 0))
L__Quadrant156:
L__Quadrant155:
;Kinematics.c,395 :: 		else if((i > 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__Quadrant254
NOP	
J	L__Quadrant158
NOP	
L__Quadrant254:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__Quadrant255
NOP	
J	L__Quadrant157
NOP	
L__Quadrant255:
L__Quadrant150:
;Kinematics.c,396 :: 		return 3;
ORI	R2, R0, 3
J	L_end_Quadrant
NOP	
;Kinematics.c,395 :: 		else if((i > 0)&&(j < 0))
L__Quadrant158:
L__Quadrant157:
;Kinematics.c,397 :: 		else if((i < 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__Quadrant256
NOP	
J	L__Quadrant160
NOP	
L__Quadrant256:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__Quadrant257
NOP	
J	L__Quadrant159
NOP	
L__Quadrant257:
L__Quadrant149:
;Kinematics.c,398 :: 		return 4;
ORI	R2, R0, 4
J	L_end_Quadrant
NOP	
;Kinematics.c,397 :: 		else if((i < 0)&&(j < 0))
L__Quadrant160:
L__Quadrant159:
;Kinematics.c,400 :: 		return 0;
MOVZ	R2, R0, R0
;Kinematics.c,401 :: 		}
L_end_Quadrant:
JR	RA
NOP	
; end of _Quadrant
_TestQuadrnt:
;Kinematics.c,403 :: 		double TestQuadrnt(double i,double j,double aS,double aE){
ADDIU	SP, SP, -4
;Kinematics.c,406 :: 		if (i >= 0 && j < 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S12, S0
BC1F	0, L__TestQuadrnt259
NOP	
J	L__TestQuadrnt169
NOP	
L__TestQuadrnt259:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__TestQuadrnt260
NOP	
J	L__TestQuadrnt168
NOP	
L__TestQuadrnt260:
L__TestQuadrnt165:
;Kinematics.c,408 :: 		if (aE > aS)  //angle end > angle start
C.LE.S 	0, S15, S14
BC1F	0, L__TestQuadrnt261
NOP	
J	L_TestQuadrnt100
NOP	
L__TestQuadrnt261:
;Kinematics.c,409 :: 		totalDeg = aS - aE;
SUB.S 	S0, S14, S15
SWC1	S0, 0(SP)
J	L_TestQuadrnt101
NOP	
L_TestQuadrnt100:
;Kinematics.c,410 :: 		else if (aE < aS && aE > -aS)
C.LE.S 	0, S14, S15
BC1F	0, L__TestQuadrnt262
NOP	
J	L__TestQuadrnt167
NOP	
L__TestQuadrnt262:
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S14
C.LE.S 	0, S15, S0
BC1F	0, L__TestQuadrnt263
NOP	
J	L__TestQuadrnt166
NOP	
L__TestQuadrnt263:
L__TestQuadrnt164:
;Kinematics.c,411 :: 		totalDeg = aE + aS;
ADD.S 	S0, S15, S14
SWC1	S0, 0(SP)
J	L_TestQuadrnt105
NOP	
;Kinematics.c,410 :: 		else if (aE < aS && aE > -aS)
L__TestQuadrnt167:
L__TestQuadrnt166:
;Kinematics.c,412 :: 		else if (aE < -aS)
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S14
C.LE.S 	0, S0, S15
BC1F	0, L__TestQuadrnt264
NOP	
J	L_TestQuadrnt106
NOP	
L__TestQuadrnt264:
;Kinematics.c,413 :: 		totalDeg = 360 + aE+ aS;
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S0, S0, S15
ADD.S 	S0, S0, S14
SWC1	S0, 0(SP)
L_TestQuadrnt106:
L_TestQuadrnt105:
L_TestQuadrnt101:
;Kinematics.c,414 :: 		}
J	L_TestQuadrnt107
NOP	
;Kinematics.c,406 :: 		if (i >= 0 && j < 0)
L__TestQuadrnt169:
L__TestQuadrnt168:
;Kinematics.c,415 :: 		else if (i >= 0 && j >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S12, S0
BC1F	0, L__TestQuadrnt265
NOP	
J	L__TestQuadrnt171
NOP	
L__TestQuadrnt265:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S13, S0
BC1F	0, L__TestQuadrnt266
NOP	
J	L__TestQuadrnt170
NOP	
L__TestQuadrnt266:
L__TestQuadrnt163:
;Kinematics.c,417 :: 		totalDeg = aS + aE;
ADD.S 	S0, S14, S15
SWC1	S0, 0(SP)
;Kinematics.c,418 :: 		}
J	L_TestQuadrnt111
NOP	
;Kinematics.c,415 :: 		else if (i >= 0 && j >= 0)
L__TestQuadrnt171:
L__TestQuadrnt170:
;Kinematics.c,419 :: 		else if (i < 0 && j >= 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__TestQuadrnt267
NOP	
J	L__TestQuadrnt173
NOP	
L__TestQuadrnt267:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S13, S0
BC1F	0, L__TestQuadrnt268
NOP	
J	L__TestQuadrnt172
NOP	
L__TestQuadrnt268:
L__TestQuadrnt162:
;Kinematics.c,421 :: 		totalDeg = 180.00 + aE + aS ;
LUI	R2, 17204
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S0, S0, S15
ADD.S 	S0, S0, S14
SWC1	S0, 0(SP)
;Kinematics.c,422 :: 		}
J	L_TestQuadrnt115
NOP	
;Kinematics.c,419 :: 		else if (i < 0 && j >= 0)
L__TestQuadrnt173:
L__TestQuadrnt172:
;Kinematics.c,423 :: 		else if (i < 0 && j < 0)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__TestQuadrnt269
NOP	
J	L__TestQuadrnt175
NOP	
L__TestQuadrnt269:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__TestQuadrnt270
NOP	
J	L__TestQuadrnt174
NOP	
L__TestQuadrnt270:
L__TestQuadrnt161:
;Kinematics.c,425 :: 		totalDeg = 180 + aE + aS;
LUI	R2, 17204
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S0, S0, S15
ADD.S 	S0, S0, S14
SWC1	S0, 0(SP)
;Kinematics.c,423 :: 		else if (i < 0 && j < 0)
L__TestQuadrnt175:
L__TestQuadrnt174:
;Kinematics.c,426 :: 		}
L_TestQuadrnt115:
L_TestQuadrnt111:
L_TestQuadrnt107:
;Kinematics.c,428 :: 		return totalDeg;
LWC1	S0, 0(SP)
;Kinematics.c,429 :: 		}
L_end_TestQuadrnt:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _TestQuadrnt
_CalcStep:
;Kinematics.c,433 :: 		double CalcStep(){
ADDIU	SP, SP, -4
;Kinematics.c,441 :: 		return angleA * deg2rad;
LWC1	S1, 0(SP)
LUI	R2, 15502
ORI	R2, R2, 64054
MTC1	R2, S0
MUL.S 	S0, S1, S0
;Kinematics.c,442 :: 		}
L_end_CalcStep:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _CalcStep
_NextCords:
;Kinematics.c,445 :: 		void NextCords(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,447 :: 		if(Circ.quadrantS == 1 || Circ.quadrantS == 4){
LH	R3, Offset(_Circ+34)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__NextCords274
NOP	
J	L__NextCords179
NOP	
L__NextCords274:
LH	R3, Offset(_Circ+34)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__NextCords276
NOP	
J	L__NextCords178
NOP	
L__NextCords276:
J	L_NextCords121
NOP	
L__NextCords179:
L__NextCords178:
;Kinematics.c,448 :: 		Circ.xStep = Circ.xCenter + (Circ.radius * cos(Circ.Deg.degreeRadians));
LWC1	S12, Offset(_Circ+112)(GP)
JAL	_cos+0
NOP	
LWC1	S1, Offset(_Circ+28)(GP)
MUL.S 	S1, S1, S0
LWC1	S0, Offset(_Circ+44)(GP)
ADD.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+60)(GP)
;Kinematics.c,449 :: 		Circ.yStep = Circ.yCenter + (Circ.radius * sin(Circ.Deg.degreeRadians));
LWC1	S12, Offset(_Circ+112)(GP)
JAL	_sin+0
NOP	
LWC1	S1, Offset(_Circ+28)(GP)
MUL.S 	S1, S1, S0
LWC1	S0, Offset(_Circ+48)(GP)
ADD.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+64)(GP)
;Kinematics.c,450 :: 		}
L_NextCords121:
;Kinematics.c,451 :: 		if(Circ.quadrantS == 2 || Circ.quadrantS == 3){
LH	R3, Offset(_Circ+34)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__NextCords278
NOP	
J	L__NextCords181
NOP	
L__NextCords278:
LH	R3, Offset(_Circ+34)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__NextCords280
NOP	
J	L__NextCords180
NOP	
L__NextCords280:
J	L_NextCords124
NOP	
L__NextCords181:
L__NextCords180:
;Kinematics.c,452 :: 		Circ.xStep = Circ.xCenter - (Circ.radius * cos(Circ.Deg.degreeRadians));
LWC1	S12, Offset(_Circ+112)(GP)
JAL	_cos+0
NOP	
LWC1	S1, Offset(_Circ+28)(GP)
MUL.S 	S1, S1, S0
LWC1	S0, Offset(_Circ+44)(GP)
SUB.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+60)(GP)
;Kinematics.c,453 :: 		Circ.yStep = Circ.yCenter - (Circ.radius * sin(Circ.Deg.degreeRadians));
LWC1	S12, Offset(_Circ+112)(GP)
JAL	_sin+0
NOP	
LWC1	S1, Offset(_Circ+28)(GP)
MUL.S 	S1, S1, S0
LWC1	S0, Offset(_Circ+48)(GP)
SUB.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+64)(GP)
;Kinematics.c,454 :: 		}
L_NextCords124:
;Kinematics.c,456 :: 		}
L_end_NextCords:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _NextCords
_Cir_Interpolation:
;Kinematics.c,460 :: 		void Cir_Interpolation(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,461 :: 		Circ.lastX = Circ.xStep;
LWC1	S0, Offset(_Circ+60)(GP)
SWC1	S0, Offset(_Circ+84)(GP)
;Kinematics.c,462 :: 		Circ.lastY = Circ.yStep;
LWC1	S0, Offset(_Circ+64)(GP)
SWC1	S0, Offset(_Circ+88)(GP)
;Kinematics.c,463 :: 		Circ.Deg.degreeRadians = CalcStep();
JAL	_CalcStep+0
NOP	
SWC1	S0, Offset(_Circ+112)(GP)
;Kinematics.c,464 :: 		NextCords();
JAL	_NextCords+0
NOP	
;Kinematics.c,466 :: 		STPS[X].step_delay = 100;
ORI	R2, R0, 100
SW	R2, Offset(_STPS+8)(GP)
;Kinematics.c,467 :: 		STPS[Y].step_delay = 100;
ORI	R2, R0, 100
SW	R2, Offset(_STPS+76)(GP)
;Kinematics.c,470 :: 		SerialPrint();
JAL	_SerialPrint+0
NOP	
;Kinematics.c,474 :: 		if(Circ.lastX >= Circ.xStep){
LWC1	S1, Offset(_Circ+60)(GP)
LWC1	S0, Offset(_Circ+84)(GP)
C.LT.S 	0, S0, S1
BC1F	0, L__Cir_Interpolation282
NOP	
J	L_Cir_Interpolation125
NOP	
L__Cir_Interpolation282:
;Kinematics.c,475 :: 		DIR_StepX = 0;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,476 :: 		}else{
J	L_Cir_Interpolation126
NOP	
L_Cir_Interpolation125:
;Kinematics.c,477 :: 		DIR_StepX = 1;
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
;Kinematics.c,478 :: 		}
L_Cir_Interpolation126:
;Kinematics.c,480 :: 		if(Circ.lastY >= Circ.yStep){
LWC1	S1, Offset(_Circ+64)(GP)
LWC1	S0, Offset(_Circ+88)(GP)
C.LT.S 	0, S0, S1
BC1F	0, L__Cir_Interpolation283
NOP	
J	L_Cir_Interpolation127
NOP	
L__Cir_Interpolation283:
;Kinematics.c,481 :: 		DIR_StepY = 0;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,482 :: 		}else{
J	L_Cir_Interpolation128
NOP	
L_Cir_Interpolation127:
;Kinematics.c,483 :: 		DIR_StepY = 1;
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
;Kinematics.c,484 :: 		}
L_Cir_Interpolation128:
;Kinematics.c,486 :: 		}
L_end_Cir_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Cir_Interpolation
_Circ_Tick:
;Kinematics.c,488 :: 		void Circ_Tick(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Kinematics.c,491 :: 		x = (int)Circ.xStep;
LWC1	S0, Offset(_Circ+60)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 4(SP)
;Kinematics.c,492 :: 		y = (int)Circ.yStep;
LWC1	S0, Offset(_Circ+64)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 6(SP)
;Kinematics.c,494 :: 		if (Circ.dir == CW){
LH	R2, Offset(_Circ+32)(GP)
BEQ	R2, R0, L__Circ_Tick285
NOP	
J	L_Circ_Tick129
NOP	
L__Circ_Tick285:
;Kinematics.c,495 :: 		Circ.Deg.deg += 0.25;//Circ.divisor;
LWC1	S1, Offset(_Circ+104)(GP)
LUI	R2, 16000
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S1, S1, S0
SWC1	S1, Offset(_Circ+104)(GP)
;Kinematics.c,496 :: 		if (Circ.Deg.deg >= Circ.Deg.degT){
LWC1	S0, Offset(_Circ+100)(GP)
C.LT.S 	0, S1, S0
BC1F	0, L__Circ_Tick286
NOP	
J	L_Circ_Tick130
NOP	
L__Circ_Tick286:
;Kinematics.c,497 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Kinematics.c,498 :: 		}
L_Circ_Tick130:
;Kinematics.c,499 :: 		}
L_Circ_Tick129:
;Kinematics.c,501 :: 		if (Circ.dir == CCW){
LH	R3, Offset(_Circ+32)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Circ_Tick287
NOP	
J	L_Circ_Tick131
NOP	
L__Circ_Tick287:
;Kinematics.c,502 :: 		Circ.Deg.deg -= 0.25;//Circ.divisor;
LWC1	S1, Offset(_Circ+104)(GP)
LUI	R2, 16000
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S1, S1, S0
SWC1	S1, Offset(_Circ+104)(GP)
;Kinematics.c,503 :: 		if (Circ.Deg.deg <= Circ.Deg.degT){
LWC1	S0, Offset(_Circ+100)(GP)
C.LT.S 	0, S0, S1
BC1F	0, L__Circ_Tick288
NOP	
J	L_Circ_Tick132
NOP	
L__Circ_Tick288:
;Kinematics.c,504 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Kinematics.c,505 :: 		}
L_Circ_Tick132:
;Kinematics.c,507 :: 		}
L_Circ_Tick131:
;Kinematics.c,510 :: 		if(xL != x){
LH	R3, 4(SP)
LH	R2, 8(SP)
BNE	R2, R3, L__Circ_Tick290
NOP	
J	L_Circ_Tick133
NOP	
L__Circ_Tick290:
;Kinematics.c,511 :: 		Circ.x_next = 1;
LBU	R2, Offset(_Circ+0)(GP)
ORI	R2, R2, 8
SB	R2, Offset(_Circ+0)(GP)
;Kinematics.c,512 :: 		}else
J	L_Circ_Tick134
NOP	
L_Circ_Tick133:
;Kinematics.c,513 :: 		Circ.x_next = 0;
LBU	R2, Offset(_Circ+0)(GP)
INS	R2, R0, 3, 1
SB	R2, Offset(_Circ+0)(GP)
L_Circ_Tick134:
;Kinematics.c,515 :: 		if(yL != y){
LH	R3, 6(SP)
LH	R2, 10(SP)
BNE	R2, R3, L__Circ_Tick292
NOP	
J	L_Circ_Tick135
NOP	
L__Circ_Tick292:
;Kinematics.c,516 :: 		Circ.y_next = 1;
LBU	R2, Offset(_Circ+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_Circ+0)(GP)
;Kinematics.c,517 :: 		}else
J	L_Circ_Tick136
NOP	
L_Circ_Tick135:
;Kinematics.c,518 :: 		Circ.y_next = 0;
LBU	R2, Offset(_Circ+0)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_Circ+0)(GP)
L_Circ_Tick136:
;Kinematics.c,520 :: 		xL = x;
LH	R2, 4(SP)
SH	R2, 8(SP)
;Kinematics.c,521 :: 		yL = y;
LH	R2, 6(SP)
SH	R2, 10(SP)
;Kinematics.c,522 :: 		SV.Single_Dual = 2;
ORI	R2, R0, 2
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,524 :: 		}
L_end_Circ_Tick:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Circ_Tick
_Circ_Prep_Next:
;Kinematics.c,531 :: 		void  Circ_Prep_Next(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,532 :: 		Circ.steps++;
SW	R25, 4(SP)
LHU	R2, Offset(_Circ+38)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_Circ+38)(GP)
;Kinematics.c,534 :: 		if(Circ.x_next)
LBU	R2, Offset(_Circ+0)(GP)
EXT	R2, R2, 3, 1
BNE	R2, R0, L__Circ_Prep_Next295
NOP	
J	L_Circ_Prep_Next137
NOP	
L__Circ_Prep_Next295:
;Kinematics.c,535 :: 		toggleOCx(X);
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
L_Circ_Prep_Next137:
;Kinematics.c,537 :: 		if(Circ.y_next)
LBU	R2, Offset(_Circ+0)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__Circ_Prep_Next297
NOP	
J	L_Circ_Prep_Next138
NOP	
L__Circ_Prep_Next297:
;Kinematics.c,538 :: 		toggleOCx(Y);
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
L_Circ_Prep_Next138:
;Kinematics.c,541 :: 		if(Circ.steps >= Circ.Idivisor){
LHU	R3, Offset(_Circ+40)(GP)
LHU	R2, Offset(_Circ+38)(GP)
SLTU	R2, R2, R3
BEQ	R2, R0, L__Circ_Prep_Next298
NOP	
J	L_Circ_Prep_Next139
NOP	
L__Circ_Prep_Next298:
;Kinematics.c,542 :: 		Circ.steps = 0;
SH	R0, Offset(_Circ+38)(GP)
;Kinematics.c,543 :: 		Circ.cir_next = 0;
LBU	R2, Offset(_Circ+0)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_Circ+0)(GP)
;Kinematics.c,544 :: 		Circ.cir_start = 1;
LBU	R2, Offset(_Circ+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_Circ+0)(GP)
;Kinematics.c,545 :: 		Circ.async.x = 0;
LBU	R2, Offset(_Circ+128)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_Circ+128)(GP)
;Kinematics.c,546 :: 		}
L_Circ_Prep_Next139:
;Kinematics.c,548 :: 		}
L_end_Circ_Prep_Next:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Circ_Prep_Next
_SerialPrint:
;Kinematics.c,550 :: 		void SerialPrint(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,551 :: 		int str_len = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Kinematics.c,552 :: 		int str_lenA = 0;
;Kinematics.c,553 :: 		str_lenA = strlen(txtA);
LUI	R25, hi_addr(_txtA+0)
ORI	R25, R25, lo_addr(_txtA+0)
JAL	_strlen+0
NOP	
; str_lenA start address is: 44 (R11)
SEH	R11, R2
;Kinematics.c,554 :: 		memset(txtB,0,30);
ORI	R27, R0, 30
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_memset+0
NOP	
;Kinematics.c,556 :: 		sprintf(txt,"%0.2f",Circ.radius);
LW	R2, Offset(_Circ+28)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_1_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_1_Kinematics+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Kinematics.c,557 :: 		strncpy(txtB, " ",strlen(txt));
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
;Kinematics.c,558 :: 		strncat(txtB, txt,strlen(txt));
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
;Kinematics.c,559 :: 		str_len += strlen(txt);
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,560 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,563 :: 		sprintf(txt,"%0.2f",Circ.I);//xStep);
LW	R2, Offset(_Circ+8)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_3_Kinematics+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Kinematics.c,564 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,565 :: 		str_len += strlen(txt);
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,566 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,569 :: 		sprintf(txt,"%0.2f",Circ.J);//yStep);
LW	R2, Offset(_Circ+12)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_4_Kinematics+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Kinematics.c,570 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,571 :: 		str_len += strlen(txt);
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,572 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,575 :: 		sprintf(txt,"%0.2f",Circ.I_end);//xFin);
LW	R2, Offset(_Circ+16)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_5_Kinematics+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Kinematics.c,576 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,577 :: 		str_len += strlen(txt)+1;
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,578 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,581 :: 		sprintf(txt,"%0.2f",Circ.J_end);//.yFin);
LW	R2, Offset(_Circ+20)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_6_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_6_Kinematics+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Kinematics.c,582 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,583 :: 		str_len += strlen(txt)+1;
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,584 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,587 :: 		sprintf(txt,"%0.2f",Circ.Deg.degS);
LW	R2, Offset(_Circ+92)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_7_Kinematics+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Kinematics.c,588 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,589 :: 		str_len += strlen(txt)+1;
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,590 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,593 :: 		sprintf(txt,"%0.2f",Circ.Deg.degF);
LW	R2, Offset(_Circ+96)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_8_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_8_Kinematics+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Kinematics.c,594 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,595 :: 		str_len += strlen(txt)+1;
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,596 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,599 :: 		sprintf(txt,"%0.2f",Circ.Deg.degT);
LW	R2, Offset(_Circ+100)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_9_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_9_Kinematics+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Kinematics.c,600 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,601 :: 		str_len += strlen(txt)+1;
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,602 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,605 :: 		sprintf(txt,"%0.2f",Circ.Deg.deg);
LW	R2, Offset(_Circ+104)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_10_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_10_Kinematics+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Kinematics.c,606 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,607 :: 		str_len += strlen(txt)+1;
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,608 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,611 :: 		sprintf(txt,"%d",Circ.quadrantS);
LH	R2, Offset(_Circ+34)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_11_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_11_Kinematics+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Kinematics.c,612 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,613 :: 		str_len += strlen(txt)+1;
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,614 :: 		strncat(txtB,"\n",1);
ORI	R30, R0, 10
SB	R30, 18(SP)
MOVZ	R30, R0, R0
SB	R30, 19(SP)
ADDIU	R2, SP, 18
ORI	R27, R0, 1
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,616 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
; str_lenA end address is: 44 (R11)
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,618 :: 		UART2_Write_Text(txtB);
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_UART2_Write_Text+0
NOP	
;Kinematics.c,627 :: 		}
L_end_SerialPrint:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SerialPrint
