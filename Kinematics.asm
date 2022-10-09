_SingleAxisStep:
;Kinematics.c,22 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,28 :: 		SV.Single_Dual = 0;
SW	R25, 4(SP)
SH	R0, Offset(_SV+0)(GP)
;Kinematics.c,30 :: 		switch(axis_No){
J	L_SingleAxisStep0
NOP	
;Kinematics.c,31 :: 		case X:
L_SingleAxisStep2:
;Kinematics.c,32 :: 		Single_Axis_Enable(X);
SH	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,33 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,34 :: 		case Y:
L_SingleAxisStep3:
;Kinematics.c,35 :: 		Single_Axis_Enable(Y);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,36 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,37 :: 		case Z:
L_SingleAxisStep4:
;Kinematics.c,38 :: 		Single_Axis_Enable(Z);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,39 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,40 :: 		case A:
L_SingleAxisStep5:
;Kinematics.c,41 :: 		Single_Axis_Enable(A);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 3
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,42 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,43 :: 		default: break;
L_SingleAxisStep6:
J	L_SingleAxisStep1
NOP	
;Kinematics.c,44 :: 		}
L_SingleAxisStep0:
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep115
NOP	
J	L_SingleAxisStep2
NOP	
L__SingleAxisStep115:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep117
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep117:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep119
NOP	
J	L_SingleAxisStep4
NOP	
L__SingleAxisStep119:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep121
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep121:
J	L_SingleAxisStep6
NOP	
L_SingleAxisStep1:
;Kinematics.c,45 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,46 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R25, 0(R2)
;Kinematics.c,47 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
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
;Kinematics.c,49 :: 		if(newxyz < 0)
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep122
NOP	
J	L_SingleAxisStep7
NOP	
L__SingleAxisStep122:
;Kinematics.c,50 :: 		dir = CCW;
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep8
NOP	
L_SingleAxisStep7:
;Kinematics.c,52 :: 		dir = CW;
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep8:
;Kinematics.c,54 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep9
NOP	
;Kinematics.c,55 :: 		case X:
L_SingleAxisStep11:
;Kinematics.c,56 :: 		DIR_StepX = dir;
_LX	
INS	R2, R4, BitPos(DIR_StepX+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,57 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,58 :: 		case Y:
L_SingleAxisStep12:
;Kinematics.c,59 :: 		DIR_StepY = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepY+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,60 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,61 :: 		case Z:
L_SingleAxisStep13:
;Kinematics.c,62 :: 		DIR_StepZ = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepZ+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,63 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,64 :: 		case A:
L_SingleAxisStep14:
;Kinematics.c,65 :: 		DIR_StepA = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepA+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,66 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,67 :: 		default: break;
L_SingleAxisStep15:
J	L_SingleAxisStep10
NOP	
;Kinematics.c,68 :: 		}
L_SingleAxisStep9:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep124
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep124:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep126
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep126:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep128
NOP	
J	L_SingleAxisStep13
NOP	
L__SingleAxisStep128:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep130
NOP	
J	L_SingleAxisStep14
NOP	
L__SingleAxisStep130:
; dir end address is: 16 (R4)
J	L_SingleAxisStep15
NOP	
L_SingleAxisStep10:
;Kinematics.c,70 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,72 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,74 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,79 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,81 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+52)(GP)
;Kinematics.c,83 :: 		SV.px = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,84 :: 		SV.py = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,85 :: 		SV.pz = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,89 :: 		SV.Single_Dual = 1;
ORI	R2, R0, 1
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,91 :: 		switch(axis_combo){
J	L_DualAxisStep16
NOP	
;Kinematics.c,92 :: 		case xy:
L_DualAxisStep18:
;Kinematics.c,93 :: 		AxisPulse[1] = XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,94 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,95 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,97 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,98 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,101 :: 		SV.dirx = SV.dx > 0? 1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep132
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep132:
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
;Kinematics.c,102 :: 		SV.diry = SV.dy > 0? 1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep133
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep133:
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
;Kinematics.c,105 :: 		if(SV.dirx < 0)
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep134
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep134:
;Kinematics.c,106 :: 		DIR_StepX = CCW;
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep24
NOP	
L_DualAxisStep23:
;Kinematics.c,108 :: 		DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep24:
;Kinematics.c,110 :: 		if(SV.diry < 0)
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep135
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep135:
;Kinematics.c,111 :: 		DIR_StepY = CCW;
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep26
NOP	
L_DualAxisStep25:
;Kinematics.c,113 :: 		DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep26:
;Kinematics.c,115 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,116 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,118 :: 		if(SV.dx > SV.dy)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep136
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep136:
;Kinematics.c,119 :: 		SV.d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep28
NOP	
L_DualAxisStep27:
;Kinematics.c,121 :: 		SV.d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep28:
;Kinematics.c,123 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,124 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,125 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,127 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,128 :: 		case xz:
L_DualAxisStep29:
;Kinematics.c,129 :: 		AxisPulse[1] = XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,130 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,131 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,133 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,134 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,137 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep137
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep137:
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
;Kinematics.c,138 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep138
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep138:
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
;Kinematics.c,141 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep139
NOP	
J	L_DualAxisStep34
NOP	
L__DualAxisStep139:
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep35
NOP	
L_DualAxisStep34:
;Kinematics.c,142 :: 		else DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep35:
;Kinematics.c,144 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep140
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep140:
_LX	
ORI	R2, R2, BitMask(DIR_StepZ+0)
_SX	
J	L_DualAxisStep37
NOP	
L_DualAxisStep36:
;Kinematics.c,145 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep37:
;Kinematics.c,147 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,148 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,150 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep141
NOP	
J	L_DualAxisStep38
NOP	
L__DualAxisStep141:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep39
NOP	
L_DualAxisStep38:
;Kinematics.c,151 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep39:
;Kinematics.c,153 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,154 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,155 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,156 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,157 :: 		case yz:
L_DualAxisStep40:
;Kinematics.c,158 :: 		AxisPulse[1] = YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+4)(GP)
;Kinematics.c,159 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,160 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,163 :: 		SV.dy   = newx - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,164 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,167 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep142
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep142:
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
;Kinematics.c,168 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep143
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep143:
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
;Kinematics.c,171 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep144
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep144:
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep46
NOP	
L_DualAxisStep45:
;Kinematics.c,172 :: 		else DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep46:
;Kinematics.c,173 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep145
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep145:
_LX	
ORI	R2, R2, BitMask(DIR_StepZ+0)
_SX	
J	L_DualAxisStep48
NOP	
L_DualAxisStep47:
;Kinematics.c,174 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep48:
;Kinematics.c,176 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,177 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,179 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep146
NOP	
J	L_DualAxisStep49
NOP	
L__DualAxisStep146:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep50
NOP	
L_DualAxisStep49:
;Kinematics.c,180 :: 		else d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep50:
;Kinematics.c,182 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,183 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,184 :: 		AxisPulse[1]();
LW	R30, Offset(_AxisPulse+4)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,185 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,186 :: 		default: break;
L_DualAxisStep51:
J	L_DualAxisStep17
NOP	
;Kinematics.c,188 :: 		}
L_DualAxisStep16:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep148
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep148:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep150
NOP	
J	L_DualAxisStep29
NOP	
L__DualAxisStep150:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep152
NOP	
J	L_DualAxisStep40
NOP	
L__DualAxisStep152:
J	L_DualAxisStep51
NOP	
L_DualAxisStep17:
;Kinematics.c,189 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _DualAxisStep
_XY_Interpolate:
;Kinematics.c,194 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,196 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate154
NOP	
J	L__XY_Interpolate101
NOP	
L__XY_Interpolate154:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate155
NOP	
J	L__XY_Interpolate100
NOP	
L__XY_Interpolate155:
J	L_XY_Interpolate54
NOP	
L__XY_Interpolate101:
L__XY_Interpolate100:
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
BNE	R2, R0, L__XY_Interpolate156
NOP	
J	L_XY_Interpolate55
NOP	
L__XY_Interpolate156:
;Kinematics.c,203 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,204 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate157
NOP	
J	L_XY_Interpolate56
NOP	
L__XY_Interpolate157:
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
BNE	R2, R0, L__XY_Interpolate158
NOP	
J	L_XY_Interpolate59
NOP	
L__XY_Interpolate158:
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
BEQ	R2, R0, L__XZ_Interpolate160
NOP	
J	L__XZ_Interpolate104
NOP	
L__XZ_Interpolate160:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate161
NOP	
J	L__XZ_Interpolate103
NOP	
L__XZ_Interpolate161:
J	L_XZ_Interpolate63
NOP	
L__XZ_Interpolate104:
L__XZ_Interpolate103:
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
BNE	R2, R0, L__XZ_Interpolate162
NOP	
J	L_XZ_Interpolate64
NOP	
L__XZ_Interpolate162:
;Kinematics.c,231 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,232 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate163
NOP	
J	L_XZ_Interpolate65
NOP	
L__XZ_Interpolate163:
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
BNE	R2, R0, L__XZ_Interpolate164
NOP	
J	L_XZ_Interpolate68
NOP	
L__XZ_Interpolate164:
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
BEQ	R2, R0, L__YZ_Interpolate166
NOP	
J	L__YZ_Interpolate107
NOP	
L__YZ_Interpolate166:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate167
NOP	
J	L__YZ_Interpolate106
NOP	
L__YZ_Interpolate167:
J	L_YZ_Interpolate72
NOP	
L__YZ_Interpolate107:
L__YZ_Interpolate106:
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
BNE	R2, R0, L__YZ_Interpolate168
NOP	
J	L_YZ_Interpolate73
NOP	
L__YZ_Interpolate168:
;Kinematics.c,258 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,259 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate169
NOP	
J	L_YZ_Interpolate74
NOP	
L__YZ_Interpolate169:
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
BNE	R2, R0, L__YZ_Interpolate170
NOP	
J	L_YZ_Interpolate77
NOP	
L__YZ_Interpolate170:
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
_r_or_ijk:
;Kinematics.c,280 :: 		void r_or_ijk(float xCur,float yCur,float xFin,float yFin,float r, float i, float j, float k){
ADDIU	SP, SP, -76
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
; r start address is: 16 (R4)
LWC1	S2, 76(SP)
; i start address is: 0 (R0)
LWC1	S0, 80(SP)
; j start address is: 8 (R2)
LWC1	S1, 84(SP)
; k start address is: 24 (R6)
LWC1	S3, 88(SP)
; k end address is: 24 (R6)
;Kinematics.c,281 :: 		uint8_t char_counter = 0;
;Kinematics.c,286 :: 		uint16_t modal_group_words = 0;  // Bitflag variable to track and check modal group words in block
;Kinematics.c,287 :: 		uint8_t axis_words = 0;          // Bitflag to track which XYZ(ABC) parameters exist in block
;Kinematics.c,289 :: 		float inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
;Kinematics.c,290 :: 		uint8_t absolute_override = false; // true(1) = absolute motion for this block only {G53}
;Kinematics.c,291 :: 		uint8_t non_modal_action = NON_MODAL_NONE; // Tracks the actions of modal group 0 (non-modal)
;Kinematics.c,294 :: 		float x = 0.00;
;Kinematics.c,295 :: 		float y = 0.00;
;Kinematics.c,296 :: 		float h_x2_div_d = 0.00;
;Kinematics.c,297 :: 		uint8_t isclockwise = 0;
;Kinematics.c,299 :: 		gc.position[X] = xCur;
SWC1	S12, Offset(_gc+12)(GP)
;Kinematics.c,300 :: 		gc.position[Y] = yCur;
SWC1	S13, Offset(_gc+16)(GP)
;Kinematics.c,301 :: 		target[X] = xFin;
ADDIU	R2, SP, 24
SWC1	S14, 0(R2)
;Kinematics.c,302 :: 		target[Y] = yFin;
ADDIU	R2, R2, 4
SWC1	S15, 0(R2)
;Kinematics.c,303 :: 		offset[X] = i;
ADDIU	R2, SP, 48
SWC1	S0, 0(R2)
; i end address is: 0 (R0)
;Kinematics.c,304 :: 		offset[Y] = j;
ADDIU	R2, R2, 4
SWC1	S1, 0(R2)
; j end address is: 8 (R2)
;Kinematics.c,305 :: 		gc.plane_axis_0 = X;
SB	R0, Offset(_gc+25)(GP)
;Kinematics.c,306 :: 		gc.plane_axis_1 = Y;
ORI	R2, R0, 1
SB	R2, Offset(_gc+26)(GP)
;Kinematics.c,307 :: 		gc.plane_axis_2 = Z;
ORI	R2, R0, 2
SB	R2, Offset(_gc+27)(GP)
;Kinematics.c,308 :: 		if (r != 0) { // Arc Radius Mode
MOVZ	R2, R0, R0
MTC1	R2, S0
C.EQ.S 	0, S2, S0
BC1F	0, L__r_or_ijk172
NOP	
J	L_r_or_ijk79
NOP	
L__r_or_ijk172:
;Kinematics.c,360 :: 		x = target[gc.plane_axis_0]-gc.position[gc.plane_axis_0];
ADDIU	R4, SP, 24
LBU	R2, Offset(_gc+25)(GP)
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+12)
ORI	R2, R2, lo_addr(_gc+12)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; x start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,361 :: 		y = target[gc.plane_axis_1]-gc.position[gc.plane_axis_1];
LBU	R2, Offset(_gc+26)(GP)
SLL	R3, R2, 2
ADDU	R2, R4, R3
LWC1	S1, 0(R2)
LUI	R2, hi_addr(_gc+12)
ORI	R2, R2, lo_addr(_gc+12)
ADDU	R2, R2, R3
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
; y start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,363 :: 		clear_vector(offset);
ADDIU	R2, SP, 48
ORI	R27, R0, 24
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Kinematics.c,366 :: 		h_x2_div_d = 4 * r*r - x*x - y*y;
LUI	R2, 16512
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S2
MUL.S 	S1, S0, S2
MUL.S 	S0, S3, S3
SUB.S 	S1, S1, S0
MUL.S 	S0, S4, S4
SUB.S 	S0, S1, S0
;Kinematics.c,369 :: 		h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
SWC1	S2, 20(SP)
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S0, S1, S0
SWC1	S0, 72(SP)
MOV.S 	S13, S4
MOV.S 	S12, S3
JAL	_hypot+0
NOP	
LWC1	S2, 20(SP)
LWC1	S1, 72(SP)
DIV.S 	S0, S1, S0
; h_x2_div_d start address is: 40 (R10)
MOV.S 	S5, S0
;Kinematics.c,394 :: 		if (r < 0) {
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S2
BC1F	0, L__r_or_ijk173
NOP	
J	L__r_or_ijk111
NOP	
L__r_or_ijk173:
;Kinematics.c,395 :: 		h_x2_div_d = -h_x2_div_d;
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
; h_x2_div_d end address is: 40 (R10)
; h_x2_div_d start address is: 8 (R2)
MOV.S 	S1, S0
;Kinematics.c,396 :: 		r = -r; // Finished with r. Set to positive for mc_arc
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S2
MOV.S 	S2, S0
; h_x2_div_d end address is: 8 (R2)
; r end address is: 16 (R4)
MOV.S 	S5, S1
;Kinematics.c,397 :: 		}
J	L_r_or_ijk80
NOP	
L__r_or_ijk111:
;Kinematics.c,394 :: 		if (r < 0) {
;Kinematics.c,397 :: 		}
L_r_or_ijk80:
;Kinematics.c,399 :: 		offset[gc.plane_axis_0] = 0.5*(x-(y*h_x2_div_d));
; r start address is: 16 (R4)
; h_x2_div_d start address is: 40 (R10)
ADDIU	R4, SP, 48
LBU	R2, Offset(_gc+25)(GP)
SLL	R2, R2, 2
ADDU	R3, R4, R2
MUL.S 	S0, S4, S5
SUB.S 	S1, S3, S0
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Kinematics.c,400 :: 		offset[gc.plane_axis_1] = 0.5*(y+(x*h_x2_div_d));
LBU	R2, Offset(_gc+26)(GP)
SLL	R2, R2, 2
ADDU	R3, R4, R2
MUL.S 	S0, S3, S5
; x end address is: 24 (R6)
; h_x2_div_d end address is: 40 (R10)
ADD.S 	S1, S4, S0
; y end address is: 32 (R8)
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Kinematics.c,402 :: 		} else {
MOV.S 	S0, S2
; r end address is: 16 (R4)
J	L_r_or_ijk81
NOP	
L_r_or_ijk79:
;Kinematics.c,405 :: 		r = hypot(offset[X], offset[Y]); // Compute arc radius for mc_arc
ADDIU	R3, SP, 48
ADDIU	R2, R3, 4
LWC1	S1, 0(R2)
LWC1	S0, 0(R3)
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_hypot+0
NOP	
; r start address is: 8 (R2)
MOV.S 	S1, S0
;Kinematics.c,406 :: 		SerialPrint(r);
SWC1	S1, 20(SP)
MOV.S 	S12, S0
JAL	_SerialPrint+0
NOP	
; r end address is: 8 (R2)
LWC1	S1, 20(SP)
MOV.S 	S0, S1
;Kinematics.c,407 :: 		}
L_r_or_ijk81:
;Kinematics.c,410 :: 		isclockwise = false;
; r start address is: 0 (R0)
; isclockwise start address is: 20 (R5)
MOVZ	R5, R0, R0
;Kinematics.c,411 :: 		if (gc.motion_mode == MOTION_MODE_CW_ARC) { isclockwise = true; }
LBU	R3, Offset(_gc+1)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__r_or_ijk174
NOP	
J	L__r_or_ijk112
NOP	
L__r_or_ijk174:
ORI	R5, R0, 1
; isclockwise end address is: 20 (R5)
J	L_r_or_ijk82
NOP	
L__r_or_ijk112:
L_r_or_ijk82:
;Kinematics.c,414 :: 		gc.inverse_feed_rate_mode = 1; //??
; isclockwise start address is: 20 (R5)
ORI	R2, R0, 1
SB	R2, Offset(_gc+2)(GP)
;Kinematics.c,415 :: 		mc_arc(gc.position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
ADDIU	R4, SP, 48
ADDIU	R3, SP, 24
;Kinematics.c,416 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
LUI	R2, 17274
ORI	R2, R2, 0
;Kinematics.c,417 :: 		r, isclockwise);
MOV.S 	S13, S0
; r end address is: 0 (R0)
;Kinematics.c,416 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
MTC1	R2, S12
;Kinematics.c,415 :: 		mc_arc(gc.position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R28, Offset(_gc+25)(GP)
MOVZ	R27, R4, R0
MOVZ	R26, R3, R0
LUI	R25, hi_addr(_gc+12)
ORI	R25, R25, lo_addr(_gc+12)
;Kinematics.c,417 :: 		r, isclockwise);
ADDIU	SP, SP, -4
SB	R5, 3(SP)
; isclockwise end address is: 20 (R5)
;Kinematics.c,416 :: 		DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,
ORI	R2, R0, 1
SB	R2, 2(SP)
;Kinematics.c,415 :: 		mc_arc(gc.position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
LBU	R2, Offset(_gc+27)(GP)
SB	R2, 1(SP)
LBU	R2, Offset(_gc+26)(GP)
SB	R2, 0(SP)
;Kinematics.c,417 :: 		r, isclockwise);
JAL	_mc_arc+0
NOP	
ADDIU	SP, SP, 4
;Kinematics.c,418 :: 		}
L_end_r_or_ijk:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 76
JR	RA
NOP	
; end of _r_or_ijk
_mc_arc:
;Kinematics.c,423 :: 		uint8_t axis_linear, float feed_rate, uint8_t invert_feed_rate, float radius, uint8_t isclockwise){
ADDIU	SP, SP, -88
SW	RA, 0(SP)
LBU	R2, 88(SP)
SB	R2, 88(SP)
LBU	R2, 89(SP)
SB	R2, 89(SP)
; invert_feed_rate start address is: 48 (R12)
LBU	R12, 90(SP)
; isclockwise start address is: 16 (R4)
LBU	R4, 91(SP)
;Kinematics.c,425 :: 		float center_axis0             = position[X] + offset[X];
LWC1	S6, 0(R25)
LWC1	S5, 0(R27)
ADD.S 	S4, S6, S5
SWC1	S4, 20(SP)
;Kinematics.c,426 :: 		float center_axis1             = position[Y] + offset[Y];
ADDIU	R2, R25, 4
LWC1	S1, 0(R2)
ADDIU	R2, R27, 4
LWC1	S0, 0(R2)
ADD.S 	S3, S1, S0
SWC1	S3, 24(SP)
;Kinematics.c,427 :: 		float linear_travel            = target[X] - position[X];
LWC1	S2, 0(R26)
SUB.S 	S0, S2, S6
; linear_travel start address is: 48 (R12)
MOV.S 	S6, S0
;Kinematics.c,428 :: 		float r_axis0                  = -offset[X];  // Radius vector from center to current location
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S5
SWC1	S0, 28(SP)
;Kinematics.c,429 :: 		float r_axis1                  = -offset[Y];
ADDIU	R2, R27, 4
LWC1	S1, 0(R2)
MOVZ	R2, R0, R0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 32(SP)
;Kinematics.c,430 :: 		float rt_axis0                 = target[X] - center_axis0;
SUB.S 	S0, S2, S4
; rt_axis0 start address is: 32 (R8)
MOV.S 	S4, S0
;Kinematics.c,431 :: 		float rt_axis1                 = target[Y] - center_axis1;
ADDIU	R2, R26, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S0, S3
; rt_axis1 start address is: 24 (R6)
MOV.S 	S3, S0
;Kinematics.c,432 :: 		float theta_per_segment        = 0.00;
;Kinematics.c,433 :: 		float linear_per_segment       = 0.00;
;Kinematics.c,434 :: 		float millimeters_of_travel    = 0.00;
;Kinematics.c,435 :: 		uint16_t segments              = 0;
;Kinematics.c,436 :: 		float cos_T = 0.00;
;Kinematics.c,437 :: 		float sin_T = 0.00;
;Kinematics.c,444 :: 		int8_t count = 0;
MOVZ	R30, R0, R0
SB	R30, 64(SP)
;Kinematics.c,447 :: 		float angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
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
SWC1	S0, 60(SP)
;Kinematics.c,448 :: 		if (isclockwise) { // Correct atan2 output per direction
BNE	R4, R0, L__mc_arc177
NOP	
J	L_mc_arc83
NOP	
L__mc_arc177:
; isclockwise end address is: 16 (R4)
;Kinematics.c,449 :: 		if (angular_travel >= 0) { angular_travel -= 2*M_PI; }
LWC1	S1, 60(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S1, S0
BC1F	0, L__mc_arc178
NOP	
J	L_mc_arc84
NOP	
L__mc_arc178:
LWC1	S1, 60(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 60(SP)
L_mc_arc84:
;Kinematics.c,450 :: 		} else {
J	L_mc_arc85
NOP	
L_mc_arc83:
;Kinematics.c,451 :: 		if (angular_travel <= 0) { angular_travel += 2*M_PI; }
LWC1	S1, 60(SP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S1
BC1F	0, L__mc_arc179
NOP	
J	L_mc_arc86
NOP	
L__mc_arc179:
LWC1	S1, 60(SP)
LUI	R2, 16585
ORI	R2, R2, 4089
MTC1	R2, S0
ADD.S 	S0, S1, S0
SWC1	S0, 60(SP)
L_mc_arc86:
;Kinematics.c,452 :: 		}
L_mc_arc85:
;Kinematics.c,453 :: 		SerialPrint(angular_travel);
SW	R27, 4(SP)
SW	R25, 8(SP)
SWC1	S12, 12(SP)
LWC1	S12, 60(SP)
JAL	_SerialPrint+0
NOP	
;Kinematics.c,454 :: 		SerialPrint(linear_travel);
MOV.S 	S12, S6
JAL	_SerialPrint+0
NOP	
LWC1	S12, 12(SP)
LW	R25, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,455 :: 		millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
SWC1	S12, 4(SP)
MOV.S 	S12, S6
JAL	_fabs+0
NOP	
LWC1	S12, 4(SP)
LWC1	S1, 60(SP)
MUL.S 	S1, S1, S13
SW	R25, 4(SP)
SWC1	S12, 8(SP)
MOV.S 	S13, S0
MOV.S 	S12, S1
JAL	_hypot+0
NOP	
LWC1	S12, 8(SP)
LW	R25, 4(SP)
; millimeters_of_travel start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,456 :: 		if (millimeters_of_travel == 0.0) { return; }
MOVZ	R2, R0, R0
MTC1	R2, S1
C.EQ.S 	0, S0, S1
BC1T	0, L__mc_arc180
NOP	
J	L_mc_arc87
NOP	
L__mc_arc180:
; invert_feed_rate end address is: 48 (R12)
; linear_travel end address is: 48 (R12)
; millimeters_of_travel end address is: 16 (R4)
J	L_end_mc_arc
NOP	
L_mc_arc87:
;Kinematics.c,457 :: 		SerialPrint(millimeters_of_travel);
; millimeters_of_travel start address is: 16 (R4)
; linear_travel start address is: 48 (R12)
; invert_feed_rate start address is: 48 (R12)
SW	R27, 4(SP)
SW	R25, 8(SP)
SWC1	S12, 12(SP)
MOV.S 	S12, S2
JAL	_SerialPrint+0
NOP	
LWC1	S12, 12(SP)
LW	R25, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,458 :: 		segments = floor(millimeters_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);
LUI	R2, 15820
ORI	R2, R2, 52429
MTC1	R2, S0
DIV.S 	S0, S2, S0
; millimeters_of_travel end address is: 16 (R4)
SWC1	S12, 4(SP)
MOV.S 	S12, S0
JAL	_floor+0
NOP	
LWC1	S12, 4(SP)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 76(SP)
;Kinematics.c,459 :: 		SerialPrint(segments);
ANDI	R2, R2, 65535
MTC1	R2, S0
CVT32.W 	S0, S0
SW	R27, 4(SP)
SW	R25, 8(SP)
SWC1	S12, 12(SP)
MOV.S 	S12, S0
JAL	_SerialPrint+0
NOP	
LWC1	S12, 12(SP)
LW	R25, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,463 :: 		if (invert_feed_rate) { feed_rate *= segments; }
BNE	R12, R0, L__mc_arc182
NOP	
J	L_mc_arc88
NOP	
L__mc_arc182:
; invert_feed_rate end address is: 48 (R12)
LHU	R2, 76(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
MUL.S 	S0, S12, S0
MOV.S 	S12, S0
L_mc_arc88:
;Kinematics.c,464 :: 		angular_travel = angular_travel * rad2deg;
LWC1	S1, 60(SP)
LUI	R2, 16997
ORI	R2, R2, 11999
MTC1	R2, S0
MUL.S 	S1, S1, S0
;Kinematics.c,465 :: 		theta_per_segment = angular_travel/segments;
LHU	R2, 76(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S0, S1, S0
SWC1	S0, 68(SP)
;Kinematics.c,466 :: 		SerialPrint(theta_per_segment);
SW	R27, 4(SP)
SW	R25, 8(SP)
MOV.S 	S12, S0
JAL	_SerialPrint+0
NOP	
;Kinematics.c,467 :: 		linear_per_segment = linear_travel/segments;
LHU	R2, 76(SP)
MTC1	R2, S0
CVT32.W 	S0, S0
DIV.S 	S0, S6, S0
; linear_travel end address is: 48 (R12)
SWC1	S0, 72(SP)
;Kinematics.c,468 :: 		SerialPrint(linear_per_segment);
MOV.S 	S12, S0
JAL	_SerialPrint+0
NOP	
;Kinematics.c,494 :: 		cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
LWC1	S1, 68(SP)
LUI	R2, 16128
ORI	R2, R2, 0
MTC1	R2, S0
MUL.S 	S1, S0, S1
LWC1	S0, 68(SP)
MUL.S 	S1, S1, S0
LUI	R2, 16256
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, 80(SP)
;Kinematics.c,495 :: 		SerialPrint(cos_T);
MOV.S 	S12, S0
JAL	_SerialPrint+0
NOP	
;Kinematics.c,496 :: 		sin_T = theta_per_segment;
LWC1	S0, 68(SP)
SWC1	S0, 84(SP)
;Kinematics.c,497 :: 		SerialPrint(sin_T);
LWC1	S12, 68(SP)
JAL	_SerialPrint+0
NOP	
LW	R25, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,499 :: 		nPx = arc_target[X] = position[X];
ADDIU	R2, SP, 36
LWC1	S0, 0(R25)
SWC1	S0, 0(R2)
;Kinematics.c,500 :: 		nPy = arc_target[Y] = position[Y];
ADDIU	R3, R2, 4
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,501 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
ORI	R2, R0, 1
SH	R2, 52(SP)
L_mc_arc89:
LHU	R3, 76(SP)
LHU	R2, 52(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__mc_arc183
NOP	
J	L_mc_arc90
NOP	
L__mc_arc183:
;Kinematics.c,503 :: 		if (count < settings.n_arc_correction) {
LBU	R3, Offset(_settings+62)(GP)
LB	R2, 64(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__mc_arc184
NOP	
J	L_mc_arc92
NOP	
L__mc_arc184:
;Kinematics.c,505 :: 		r_axisi = r_axis0*sin_T + r_axis1*cos_T;
LWC1	S1, 84(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 80(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
ADD.S 	S3, S2, S0
;Kinematics.c,506 :: 		r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
LWC1	S1, 80(SP)
LWC1	S0, 28(SP)
MUL.S 	S2, S0, S1
LWC1	S1, 84(SP)
LWC1	S0, 32(SP)
MUL.S 	S0, S0, S1
SUB.S 	S0, S2, S0
SWC1	S0, 28(SP)
;Kinematics.c,507 :: 		r_axis1 = r_axisi;
SWC1	S3, 32(SP)
;Kinematics.c,508 :: 		count++;
LB	R2, 64(SP)
ADDIU	R2, R2, 1
SB	R2, 64(SP)
;Kinematics.c,509 :: 		} else {
J	L_mc_arc93
NOP	
L_mc_arc92:
;Kinematics.c,512 :: 		cos_Ti = cos(i*theta_per_segment);
LHU	R2, 52(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 68(SP)
MUL.S 	S0, S1, S0
SW	R26, 4(SP)
MOV.S 	S12, S0
JAL	_cos+0
NOP	
SWC1	S0, 48(SP)
;Kinematics.c,513 :: 		sin_Ti = sin(i*theta_per_segment);
LHU	R2, 52(SP)
MTC1	R2, S0
CVT32.W 	S1, S0
LWC1	S0, 68(SP)
MUL.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sin+0
NOP	
LW	R26, 4(SP)
;Kinematics.c,514 :: 		r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
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
;Kinematics.c,515 :: 		r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
MOVZ	R2, R0, R0
MTC1	R2, S1
SUB.S 	S1, S1, S4
MUL.S 	S1, S1, S0
LWC1	S0, 48(SP)
MUL.S 	S0, S2, S0
SUB.S 	S0, S1, S0
SWC1	S0, 32(SP)
;Kinematics.c,516 :: 		count = 0;
SB	R0, 64(SP)
;Kinematics.c,517 :: 		}
L_mc_arc93:
;Kinematics.c,520 :: 		arc_target[X] = center_axis0 + r_axis0;
ADDIU	R4, SP, 36
LWC1	S1, 28(SP)
LWC1	S0, 20(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R4)
;Kinematics.c,521 :: 		arc_target[Y] = center_axis1 + r_axis1;
ADDIU	R2, R4, 4
LWC1	S1, 32(SP)
LWC1	S0, 24(SP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(R2)
;Kinematics.c,522 :: 		arc_target[axis_linear] += linear_per_segment;
LBU	R2, 89(SP)
SLL	R2, R2, 2
ADDU	R2, R4, R2
LWC1	S1, 0(R2)
LWC1	S0, 72(SP)
ADD.S 	S0, S1, S0
SWC1	S0, 0(R2)
;Kinematics.c,523 :: 		nPx =  arc_target[X] - position[X];
LWC1	S1, 0(R4)
LWC1	S0, 0(R25)
SUB.S 	S0, S1, S0
; nPx start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,524 :: 		position[X] = arc_target[X];
SWC1	S1, 0(R25)
;Kinematics.c,525 :: 		nPy =  arc_target[Y] - position[Y];
ADDIU	R2, R4, 4
LWC1	S1, 0(R2)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 56(SP)
;Kinematics.c,526 :: 		position[Y] = arc_target[Y];
ADDIU	R3, R25, 4
ADDIU	R2, R4, 4
LWC1	S0, 0(R2)
SWC1	S0, 0(R3)
;Kinematics.c,527 :: 		SerialPrint(nPx);
SW	R27, 4(SP)
SW	R26, 8(SP)
SW	R25, 12(SP)
MOV.S 	S12, S2
JAL	_SerialPrint+0
NOP	
;Kinematics.c,528 :: 		SerialPrint(nPy);
LWC1	S12, 56(SP)
JAL	_SerialPrint+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
LW	R27, 4(SP)
;Kinematics.c,530 :: 		STPS[X].mmToTravel = calcSteps(nPx,8.06);
LUI	R2, 16640
ORI	R2, R2, 62915
SB	R28, 4(SP)
SW	R27, 8(SP)
SW	R26, 12(SP)
SW	R25, 16(SP)
MTC1	R2, S13
MOV.S 	S12, S2
; nPx end address is: 16 (R4)
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Kinematics.c,531 :: 		speed_cntr_Move(STPS[X].mmToTravel, 25000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Kinematics.c,532 :: 		STPS[Y].mmToTravel = calcSteps(nPy,8.06);
LUI	R2, 16640
ORI	R2, R2, 62915
MTC1	R2, S13
LWC1	S12, 56(SP)
JAL	_calcSteps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Kinematics.c,533 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 25000,Z);
ORI	R27, R0, 2
ORI	R26, R0, 25000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Kinematics.c,534 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
LW	R25, 16(SP)
LW	R26, 12(SP)
LW	R27, 8(SP)
LBU	R28, 4(SP)
;Kinematics.c,537 :: 		while(1){
L_mc_arc94:
;Kinematics.c,538 :: 		if(!OC5IE_bit && !OC2IE_bit)
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__mc_arc185
NOP	
J	L__mc_arc110
NOP	
L__mc_arc185:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__mc_arc186
NOP	
J	L__mc_arc109
NOP	
L__mc_arc186:
L__mc_arc108:
;Kinematics.c,539 :: 		break;
J	L_mc_arc95
NOP	
;Kinematics.c,538 :: 		if(!OC5IE_bit && !OC2IE_bit)
L__mc_arc110:
L__mc_arc109:
;Kinematics.c,540 :: 		}
J	L_mc_arc94
NOP	
L_mc_arc95:
;Kinematics.c,501 :: 		for (i = 1; i<segments; i++) { // Increment (segments-1)
LHU	R2, 52(SP)
ADDIU	R2, R2, 1
SH	R2, 52(SP)
;Kinematics.c,541 :: 		}
J	L_mc_arc89
NOP	
L_mc_arc90:
;Kinematics.c,544 :: 		}
L_end_mc_arc:
LW	RA, 0(SP)
ADDIU	SP, SP, 88
JR	RA
NOP	
; end of _mc_arc
_hypot:
;Kinematics.c,546 :: 		float hypot(float angular_travel, float linear_travel){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,547 :: 		return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
MUL.S 	S1, S12, S12
MUL.S 	S0, S13, S13
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
;Kinematics.c,548 :: 		}
L_end_hypot:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _hypot
_SerialPrint:
;Kinematics.c,550 :: 		void SerialPrint(float r){
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
;Kinematics.c,556 :: 		sprintf(txt,"%0.2f",r);
ADDIU	SP, SP, -12
SWC1	S12, 8(SP)
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
