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
BNE	R2, R0, L__SingleAxisStep163
NOP	
J	L_SingleAxisStep2
NOP	
L__SingleAxisStep163:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep165
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep165:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep167
NOP	
J	L_SingleAxisStep4
NOP	
L__SingleAxisStep167:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep169
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep169:
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
BNE	R2, R0, L__SingleAxisStep170
NOP	
J	L_SingleAxisStep7
NOP	
L__SingleAxisStep170:
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
BNE	R2, R0, L__SingleAxisStep172
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep172:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep174
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep174:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep176
NOP	
J	L_SingleAxisStep13
NOP	
L__SingleAxisStep176:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep178
NOP	
J	L_SingleAxisStep14
NOP	
L__SingleAxisStep178:
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
;Kinematics.c,101 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep180
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep180:
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
;Kinematics.c,102 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep181
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep181:
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
BNE	R2, R0, L__DualAxisStep182
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep182:
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
BNE	R2, R0, L__DualAxisStep183
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep183:
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
BNE	R2, R0, L__DualAxisStep184
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep184:
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
BEQ	R2, R0, L__DualAxisStep185
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep185:
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
BEQ	R2, R0, L__DualAxisStep186
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep186:
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
BNE	R2, R0, L__DualAxisStep187
NOP	
J	L_DualAxisStep34
NOP	
L__DualAxisStep187:
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
BNE	R2, R0, L__DualAxisStep188
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep188:
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
BNE	R2, R0, L__DualAxisStep189
NOP	
J	L_DualAxisStep38
NOP	
L__DualAxisStep189:
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
BEQ	R2, R0, L__DualAxisStep190
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep190:
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
BEQ	R2, R0, L__DualAxisStep191
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep191:
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
BNE	R2, R0, L__DualAxisStep192
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep192:
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
BNE	R2, R0, L__DualAxisStep193
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep193:
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
BNE	R2, R0, L__DualAxisStep194
NOP	
J	L_DualAxisStep49
NOP	
L__DualAxisStep194:
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
BNE	R2, R0, L__DualAxisStep196
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep196:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep198
NOP	
J	L_DualAxisStep29
NOP	
L__DualAxisStep198:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep200
NOP	
J	L_DualAxisStep40
NOP	
L__DualAxisStep200:
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
;Kinematics.c,195 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate202
NOP	
J	L__XY_Interpolate130
NOP	
L__XY_Interpolate202:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate203
NOP	
J	L__XY_Interpolate129
NOP	
L__XY_Interpolate203:
J	L_XY_Interpolate54
NOP	
L__XY_Interpolate130:
L__XY_Interpolate129:
;Kinematics.c,196 :: 		StopX();
JAL	_StopX+0
NOP	
;Kinematics.c,197 :: 		StopY();
JAL	_StopY+0
NOP	
;Kinematics.c,198 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Kinematics.c,199 :: 		}
L_XY_Interpolate54:
;Kinematics.c,201 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XY_Interpolate204
NOP	
J	L_XY_Interpolate55
NOP	
L__XY_Interpolate204:
;Kinematics.c,202 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,203 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate205
NOP	
J	L_XY_Interpolate56
NOP	
L__XY_Interpolate205:
;Kinematics.c,204 :: 		SV.d2 += 2*SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,205 :: 		}else{
J	L_XY_Interpolate57
NOP	
L_XY_Interpolate56:
;Kinematics.c,206 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,207 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,208 :: 		}
L_XY_Interpolate57:
;Kinematics.c,209 :: 		}else{
J	L_XY_Interpolate58
NOP	
L_XY_Interpolate55:
;Kinematics.c,210 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,211 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate206
NOP	
J	L_XY_Interpolate59
NOP	
L__XY_Interpolate206:
;Kinematics.c,212 :: 		SV.d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,213 :: 		}else{
J	L_XY_Interpolate60
NOP	
L_XY_Interpolate59:
;Kinematics.c,214 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,215 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,216 :: 		}
L_XY_Interpolate60:
;Kinematics.c,217 :: 		}
L_XY_Interpolate58:
;Kinematics.c,218 :: 		}
L_end_XY_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XY_Interpolate
_XZ_Interpolate:
;Kinematics.c,220 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,222 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate208
NOP	
J	L__XZ_Interpolate133
NOP	
L__XZ_Interpolate208:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate209
NOP	
J	L__XZ_Interpolate132
NOP	
L__XZ_Interpolate209:
J	L_XZ_Interpolate63
NOP	
L__XZ_Interpolate133:
L__XZ_Interpolate132:
;Kinematics.c,223 :: 		StopX();
JAL	_StopX+0
NOP	
;Kinematics.c,224 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Kinematics.c,226 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Kinematics.c,227 :: 		}
L_XZ_Interpolate63:
;Kinematics.c,229 :: 		if(SV.dx > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XZ_Interpolate210
NOP	
J	L_XZ_Interpolate64
NOP	
L__XZ_Interpolate210:
;Kinematics.c,230 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,231 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate211
NOP	
J	L_XZ_Interpolate65
NOP	
L__XZ_Interpolate211:
;Kinematics.c,232 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_XZ_Interpolate66
NOP	
L_XZ_Interpolate65:
;Kinematics.c,234 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,235 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,236 :: 		}
L_XZ_Interpolate66:
;Kinematics.c,238 :: 		}else{
J	L_XZ_Interpolate67
NOP	
L_XZ_Interpolate64:
;Kinematics.c,239 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,240 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate212
NOP	
J	L_XZ_Interpolate68
NOP	
L__XZ_Interpolate212:
;Kinematics.c,241 :: 		d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_XZ_Interpolate69
NOP	
L_XZ_Interpolate68:
;Kinematics.c,243 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,244 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,245 :: 		}
L_XZ_Interpolate69:
;Kinematics.c,246 :: 		}
L_XZ_Interpolate67:
;Kinematics.c,247 :: 		}
L_end_XZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XZ_Interpolate
_YZ_Interpolate:
;Kinematics.c,249 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,250 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate214
NOP	
J	L__YZ_Interpolate136
NOP	
L__YZ_Interpolate214:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate215
NOP	
J	L__YZ_Interpolate135
NOP	
L__YZ_Interpolate215:
J	L_YZ_Interpolate72
NOP	
L__YZ_Interpolate136:
L__YZ_Interpolate135:
;Kinematics.c,251 :: 		StopY();
JAL	_StopY+0
NOP	
;Kinematics.c,252 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Kinematics.c,253 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Kinematics.c,254 :: 		}
L_YZ_Interpolate72:
;Kinematics.c,256 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__YZ_Interpolate216
NOP	
J	L_YZ_Interpolate73
NOP	
L__YZ_Interpolate216:
;Kinematics.c,257 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,258 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate217
NOP	
J	L_YZ_Interpolate74
NOP	
L__YZ_Interpolate217:
;Kinematics.c,259 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_YZ_Interpolate75
NOP	
L_YZ_Interpolate74:
;Kinematics.c,261 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,262 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,263 :: 		}
L_YZ_Interpolate75:
;Kinematics.c,264 :: 		}else{
J	L_YZ_Interpolate76
NOP	
L_YZ_Interpolate73:
;Kinematics.c,265 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,266 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate218
NOP	
J	L_YZ_Interpolate77
NOP	
L__YZ_Interpolate218:
;Kinematics.c,267 :: 		d2 += 2 * SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_YZ_Interpolate78
NOP	
L_YZ_Interpolate77:
;Kinematics.c,269 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,270 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,271 :: 		}
L_YZ_Interpolate78:
;Kinematics.c,272 :: 		}
L_YZ_Interpolate76:
;Kinematics.c,274 :: 		}
L_end_YZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _YZ_Interpolate
_SetCircleVals:
;Kinematics.c,282 :: 		void SetCircleVals(double curX,double curY,double finX,double finY,double i,double j, double deg,int dir){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
LWC1	S0, 24(SP)
SWC1	S0, 24(SP)
LWC1	S0, 28(SP)
SWC1	S0, 28(SP)
LWC1	S0, 32(SP)
SWC1	S0, 32(SP)
;Kinematics.c,283 :: 		int str_len = 0;
;Kinematics.c,284 :: 		AxisPulse[2] = Circ_Prep_Next;
LUI	R2, hi_addr(_Circ_Prep_Next+0)
ORI	R2, R2, lo_addr(_Circ_Prep_Next+0)
SW	R2, Offset(_AxisPulse+8)(GP)
;Kinematics.c,285 :: 		Multi_Axis_Enable(xy);
SH	R25, 4(SP)
SWC1	S15, 8(SP)
SWC1	S14, 12(SP)
SWC1	S13, 16(SP)
SWC1	S12, 20(SP)
MOVZ	R25, R0, R0
JAL	_Multi_Axis_Enable+0
NOP	
LWC1	S12, 20(SP)
LWC1	S13, 16(SP)
LWC1	S14, 12(SP)
LWC1	S15, 8(SP)
;Kinematics.c,286 :: 		SV.Single_Dual = 2;
ORI	R2, R0, 2
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,287 :: 		Circ.xStart = curX;
SWC1	S12, Offset(_Circ+52)(GP)
;Kinematics.c,288 :: 		Circ.yStart = curY;
SWC1	S13, Offset(_Circ+56)(GP)
;Kinematics.c,289 :: 		Circ.xFin   = finX;
SWC1	S14, Offset(_Circ+68)(GP)
;Kinematics.c,290 :: 		Circ.yFin   = finY;
SWC1	S15, Offset(_Circ+72)(GP)
;Kinematics.c,291 :: 		Circ.I = i;
LWC1	S0, 24(SP)
SWC1	S0, Offset(_Circ+8)(GP)
;Kinematics.c,292 :: 		Circ.J = j;
LWC1	S0, 28(SP)
SWC1	S0, Offset(_Circ+12)(GP)
;Kinematics.c,295 :: 		CalcRadius();
JAL	_CalcRadius+0
NOP	
LH	R25, 4(SP)
;Kinematics.c,296 :: 		CalcCircCenter();
JAL	_CalcCircCenter+0
NOP	
;Kinematics.c,297 :: 		Circ.Deg.degS = Calc_Angle(Circ.I,Circ.J);
LWC1	S13, Offset(_Circ+12)(GP)
LWC1	S12, Offset(_Circ+8)(GP)
JAL	_Calc_Angle+0
NOP	
SWC1	S0, Offset(_Circ+92)(GP)
;Kinematics.c,298 :: 		Circ.quadrantS = Quadrant(Circ.I,Circ.J);
LWC1	S13, Offset(_Circ+12)(GP)
LWC1	S12, Offset(_Circ+8)(GP)
JAL	_Quadrant+0
NOP	
SH	R2, Offset(_Circ+34)(GP)
;Kinematics.c,299 :: 		NextCords();
JAL	_NextCords+0
NOP	
;Kinematics.c,300 :: 		CalcI_J_FromEndPos();
JAL	_CalcI_J_FromEndPos+0
NOP	
;Kinematics.c,301 :: 		Circ.quadrant = Quadrant(Circ.I_end, Circ.J_end);
LWC1	S13, Offset(_Circ+20)(GP)
LWC1	S12, Offset(_Circ+16)(GP)
JAL	_Quadrant+0
NOP	
SH	R2, Offset(_Circ+36)(GP)
;Kinematics.c,302 :: 		Circ.Deg.degF = Calc_Angle(Circ.I_end, Circ.J_end);
LWC1	S13, Offset(_Circ+20)(GP)
LWC1	S12, Offset(_Circ+16)(GP)
JAL	_Calc_Angle+0
NOP	
SWC1	S0, Offset(_Circ+96)(GP)
;Kinematics.c,303 :: 		Circ.Deg.degT = TestQuadrnt();
JAL	_TestQuadrnt+0
NOP	
SWC1	S0, Offset(_Circ+100)(GP)
;Kinematics.c,304 :: 		Circ.dir = CircDir(dir);
JAL	_CircDir+0
NOP	
SH	R2, Offset(_Circ+32)(GP)
;Kinematics.c,305 :: 		Calc_Angle(Circ.xStart,Circ.yStart);
LWC1	S13, Offset(_Circ+56)(GP)
LWC1	S12, Offset(_Circ+52)(GP)
JAL	_Calc_Angle+0
NOP	
;Kinematics.c,306 :: 		Circ.Deg.newdeg = deg;
LWC1	S0, 32(SP)
SWC1	S0, Offset(_Circ+116)(GP)
;Kinematics.c,308 :: 		CalcDivisor();
JAL	_CalcDivisor+0
NOP	
;Kinematics.c,309 :: 		Circ.lastX = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_Circ+84)(GP)
;Kinematics.c,310 :: 		Circ.lastY = 0;
MOVZ	R2, R0, R0
SW	R2, Offset(_Circ+88)(GP)
;Kinematics.c,312 :: 		}
L_end_SetCircleVals:
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _SetCircleVals
_CircDir:
;Kinematics.c,316 :: 		int CircDir(int dir){
;Kinematics.c,318 :: 		Circ.dir = dir;
SH	R25, Offset(_Circ+32)(GP)
;Kinematics.c,320 :: 		if(Circ.dir == CW)
SEH	R2, R25
BEQ	R2, R0, L__CircDir221
NOP	
J	L_CircDir79
NOP	
L__CircDir221:
;Kinematics.c,321 :: 		Circ.Deg.deg = 0.00;
MOVZ	R2, R0, R0
SW	R2, Offset(_Circ+104)(GP)
L_CircDir79:
;Kinematics.c,322 :: 		if(Circ.dir == CCW)
LH	R3, Offset(_Circ+32)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__CircDir222
NOP	
J	L_CircDir80
NOP	
L__CircDir222:
;Kinematics.c,323 :: 		Circ.Deg.deg = 360.00;
LUI	R2, 17332
ORI	R2, R2, 0
SW	R2, Offset(_Circ+104)(GP)
L_CircDir80:
;Kinematics.c,325 :: 		return Circ.dir;
LH	R2, Offset(_Circ+32)(GP)
;Kinematics.c,326 :: 		}
L_end_CircDir:
JR	RA
NOP	
; end of _CircDir
_CalcDivisor:
;Kinematics.c,330 :: 		void CalcDivisor(){
;Kinematics.c,333 :: 		newDeg = 360.00 / Circ.Deg.degreeDeg;
LWC1	S1, Offset(_Circ+108)(GP)
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S2, S0, S1
;Kinematics.c,334 :: 		Circ.N = (2*Pi*Circ.radius)/newDeg;
LWC1	S1, Offset(_Circ+28)(GP)
LUI	R2, 16585
ORI	R2, R2, 4048
MTC1	R2, S0
MUL.S 	S0, S0, S1
DIV.S 	S1, S0, S2
SWC1	S1, Offset(_Circ+24)(GP)
;Kinematics.c,335 :: 		Circ.divisor = Circ.Deg.deg/Circ.N;
LWC1	S0, Offset(_Circ+104)(GP)
DIV.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+4)(GP)
;Kinematics.c,336 :: 		Circ.Idivisor = 14;
ORI	R2, R0, 14
SH	R2, Offset(_Circ+40)(GP)
;Kinematics.c,337 :: 		}
L_end_CalcDivisor:
JR	RA
NOP	
; end of _CalcDivisor
_CalcRadius:
;Kinematics.c,341 :: 		void CalcRadius(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,343 :: 		i = abs(Circ.I);
SW	R25, 4(SP)
LWC1	S0, Offset(_Circ+8)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SEH	R25, R2
JAL	_abs+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
; i start address is: 16 (R4)
MOV.S 	S2, S0
;Kinematics.c,344 :: 		j = abs(Circ.J);
LWC1	S0, Offset(_Circ+12)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SEH	R25, R2
JAL	_abs+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
;Kinematics.c,346 :: 		Circ.radius = sqrt((i*i) + (j*j));
MUL.S 	S1, S2, S2
; i end address is: 16 (R4)
MUL.S 	S0, S0, S0
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_sqrt+0
NOP	
SWC1	S0, Offset(_Circ+28)(GP)
;Kinematics.c,347 :: 		}
L_end_CalcRadius:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _CalcRadius
_CalcCircCenter:
;Kinematics.c,351 :: 		void CalcCircCenter(){
;Kinematics.c,353 :: 		Circ.xCenter = (Circ.xStart + Circ.I);
LWC1	S1, Offset(_Circ+8)(GP)
LWC1	S0, Offset(_Circ+52)(GP)
ADD.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+44)(GP)
;Kinematics.c,354 :: 		Circ.yCenter = (Circ.yStart + Circ.J);
LWC1	S1, Offset(_Circ+12)(GP)
LWC1	S0, Offset(_Circ+56)(GP)
ADD.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+48)(GP)
;Kinematics.c,355 :: 		}
L_end_CalcCircCenter:
JR	RA
NOP	
; end of _CalcCircCenter
_CalcI_J_FromEndPos:
;Kinematics.c,359 :: 		void CalcI_J_FromEndPos(){
;Kinematics.c,360 :: 		Circ.I_end = Circ.xFin - Circ.xCenter;
LWC1	S1, Offset(_Circ+44)(GP)
LWC1	S0, Offset(_Circ+68)(GP)
SUB.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+16)(GP)
;Kinematics.c,361 :: 		Circ.J_end = Circ.yFin - Circ.yCenter;
LWC1	S1, Offset(_Circ+48)(GP)
LWC1	S0, Offset(_Circ+72)(GP)
SUB.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+20)(GP)
;Kinematics.c,362 :: 		}
L_end_CalcI_J_FromEndPos:
JR	RA
NOP	
; end of _CalcI_J_FromEndPos
_Calc_Angle:
;Kinematics.c,366 :: 		double Calc_Angle(double i, double j){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,370 :: 		return atan2(j,i);//(Circ.XY.X,Circ.XY.Y);
MOV.S 	S12, S13
MOV.S 	S13, S12
JAL	_atan2+0
NOP	
;Kinematics.c,372 :: 		}
L_end_Calc_Angle:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Calc_Angle
_Quadrant:
;Kinematics.c,376 :: 		int Quadrant(double i,double j){
;Kinematics.c,377 :: 		if((i <= 0)&&(j >= 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__Quadrant229
NOP	
J	L__Quadrant142
NOP	
L__Quadrant229:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S13, S0
BC1F	0, L__Quadrant230
NOP	
J	L__Quadrant141
NOP	
L__Quadrant230:
L__Quadrant140:
;Kinematics.c,378 :: 		return 1;
ORI	R2, R0, 1
J	L_end_Quadrant
NOP	
;Kinematics.c,377 :: 		if((i <= 0)&&(j >= 0))
L__Quadrant142:
L__Quadrant141:
;Kinematics.c,379 :: 		else if((i > 0)&&(j > 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__Quadrant231
NOP	
J	L__Quadrant144
NOP	
L__Quadrant231:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S13, S0
BC1F	0, L__Quadrant232
NOP	
J	L__Quadrant143
NOP	
L__Quadrant232:
L__Quadrant139:
;Kinematics.c,380 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Quadrant
NOP	
;Kinematics.c,379 :: 		else if((i > 0)&&(j > 0))
L__Quadrant144:
L__Quadrant143:
;Kinematics.c,381 :: 		else if((i > 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__Quadrant233
NOP	
J	L__Quadrant146
NOP	
L__Quadrant233:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__Quadrant234
NOP	
J	L__Quadrant145
NOP	
L__Quadrant234:
L__Quadrant138:
;Kinematics.c,382 :: 		return 3;
ORI	R2, R0, 3
J	L_end_Quadrant
NOP	
;Kinematics.c,381 :: 		else if((i > 0)&&(j < 0))
L__Quadrant146:
L__Quadrant145:
;Kinematics.c,383 :: 		else if((i < 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__Quadrant235
NOP	
J	L__Quadrant148
NOP	
L__Quadrant235:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__Quadrant236
NOP	
J	L__Quadrant147
NOP	
L__Quadrant236:
L__Quadrant137:
;Kinematics.c,384 :: 		return 4;
ORI	R2, R0, 4
J	L_end_Quadrant
NOP	
;Kinematics.c,383 :: 		else if((i < 0)&&(j < 0))
L__Quadrant148:
L__Quadrant147:
;Kinematics.c,386 :: 		return 0;
MOVZ	R2, R0, R0
;Kinematics.c,387 :: 		}
L_end_Quadrant:
JR	RA
NOP	
; end of _Quadrant
_TestQuadrnt:
;Kinematics.c,389 :: 		double TestQuadrnt(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Kinematics.c,390 :: 		double totalDeg = 0.00;
SW	R25, 4(SP)
;Kinematics.c,392 :: 		if (Circ.I_end < 0)
LWC1	S1, Offset(_Circ+16)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S1
BC1F	0, L__TestQuadrnt238
NOP	
J	L_TestQuadrnt97
NOP	
L__TestQuadrnt238:
;Kinematics.c,394 :: 		Circ.Deg.degF = 180.0 - Circ.Deg.degF;
LWC1	S1, Offset(_Circ+96)(GP)
LUI	R2, 17204
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+96)(GP)
;Kinematics.c,395 :: 		totalDeg = abs(Circ.Deg.degS) + abs(Circ.Deg.degS);
LWC1	S0, Offset(_Circ+92)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SEH	R25, R2
JAL	_abs+0
NOP	
SH	R2, 8(SP)
LWC1	S0, Offset(_Circ+92)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SEH	R25, R2
JAL	_abs+0
NOP	
LH	R3, 8(SP)
ADDU	R2, R3, R2
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S0, S0
; totalDeg start address is: 0 (R0)
;Kinematics.c,396 :: 		}
; totalDeg end address is: 0 (R0)
J	L_TestQuadrnt98
NOP	
L_TestQuadrnt97:
;Kinematics.c,397 :: 		else if (Circ.I_end > 0)
LWC1	S1, Offset(_Circ+16)(GP)
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S1, S0
BC1F	0, L__TestQuadrnt239
NOP	
J	L_TestQuadrnt99
NOP	
L__TestQuadrnt239:
;Kinematics.c,399 :: 		Circ.Deg.degF = 180.0 - Circ.Deg.degF;
LWC1	S1, Offset(_Circ+96)(GP)
LUI	R2, 17204
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+96)(GP)
;Kinematics.c,400 :: 		totalDeg = abs(Circ.Deg.degS) + 180.0 + abs(Circ.Deg.degS);
LWC1	S0, Offset(_Circ+92)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SEH	R25, R2
JAL	_abs+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S1, S0
LUI	R2, 17204
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S0, S1, S0
MOV.S 	S2, S0
LWC1	S0, Offset(_Circ+92)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SEH	R25, R2
JAL	_abs+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S1, S0
MOV.S 	S0, S2
ADD.S 	S0, S0, S1
; totalDeg start address is: 0 (R0)
;Kinematics.c,401 :: 		}
; totalDeg end address is: 0 (R0)
J	L_TestQuadrnt100
NOP	
L_TestQuadrnt99:
;Kinematics.c,403 :: 		totalDeg = abs(Circ.Deg.degS) + 180.0 + abs(Circ.Deg.degS);
LWC1	S0, Offset(_Circ+92)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SEH	R25, R2
JAL	_abs+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S1, S0
LUI	R2, 17204
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S0, S1, S0
MOV.S 	S2, S0
LWC1	S0, Offset(_Circ+92)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SEH	R25, R2
JAL	_abs+0
NOP	
SEH	R2, R2
MTC1	R2, S0
CVT32.W 	S1, S0
MOV.S 	S0, S2
ADD.S 	S0, S0, S1
; totalDeg start address is: 8 (R2)
MOV.S 	S1, S0
; totalDeg end address is: 8 (R2)
MOV.S 	S0, S1
L_TestQuadrnt100:
; totalDeg start address is: 0 (R0)
; totalDeg end address is: 0 (R0)
L_TestQuadrnt98:
;Kinematics.c,405 :: 		return totalDeg;
; totalDeg start address is: 0 (R0)
; totalDeg end address is: 0 (R0)
;Kinematics.c,406 :: 		}
;Kinematics.c,405 :: 		return totalDeg;
;Kinematics.c,406 :: 		}
L_end_TestQuadrnt:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TestQuadrnt
_CalcStep:
;Kinematics.c,410 :: 		double CalcStep(){
ADDIU	SP, SP, -4
;Kinematics.c,412 :: 		if (Circ.quadrantS == 1 || Circ.quadrantS == 3)
LH	R3, Offset(_Circ+34)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__CalcStep242
NOP	
J	L__CalcStep158
NOP	
L__CalcStep242:
LH	R3, Offset(_Circ+34)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__CalcStep244
NOP	
J	L__CalcStep157
NOP	
L__CalcStep244:
J	L_CalcStep103
NOP	
L__CalcStep158:
L__CalcStep157:
;Kinematics.c,413 :: 		angleA = Circ.Deg.deg - Circ.Deg.degS;
LWC1	S1, Offset(_Circ+92)(GP)
LWC1	S0, Offset(_Circ+104)(GP)
SUB.S 	S0, S0, S1
SWC1	S0, 0(SP)
L_CalcStep103:
;Kinematics.c,415 :: 		if (Circ.quadrantS == 2 || Circ.quadrantS == 4)
LH	R3, Offset(_Circ+34)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__CalcStep246
NOP	
J	L__CalcStep160
NOP	
L__CalcStep246:
LH	R3, Offset(_Circ+34)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__CalcStep248
NOP	
J	L__CalcStep159
NOP	
L__CalcStep248:
J	L_CalcStep106
NOP	
L__CalcStep160:
L__CalcStep159:
;Kinematics.c,416 :: 		angleA = Circ.Deg.deg + Circ.Deg.degS;
LWC1	S1, Offset(_Circ+92)(GP)
LWC1	S0, Offset(_Circ+104)(GP)
ADD.S 	S0, S0, S1
SWC1	S0, 0(SP)
L_CalcStep106:
;Kinematics.c,418 :: 		return angleA * deg2rad;
LWC1	S1, 0(SP)
LUI	R2, 15502
ORI	R2, R2, 64046
MTC1	R2, S0
MUL.S 	S0, S1, S0
;Kinematics.c,419 :: 		}
L_end_CalcStep:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _CalcStep
_NextCords:
;Kinematics.c,422 :: 		void NextCords(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,424 :: 		if(Circ.quadrant == 1 || Circ.quadrant == 4){
LH	R3, Offset(_Circ+36)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__NextCords251
NOP	
J	L__NextCords152
NOP	
L__NextCords251:
LH	R3, Offset(_Circ+36)(GP)
ORI	R2, R0, 4
BNE	R3, R2, L__NextCords253
NOP	
J	L__NextCords151
NOP	
L__NextCords253:
J	L_NextCords109
NOP	
L__NextCords152:
L__NextCords151:
;Kinematics.c,425 :: 		Circ.xStep = Circ.xCenter + (Circ.radius * cos(Circ.Deg.degreeRadians));
LWC1	S12, Offset(_Circ+112)(GP)
JAL	_cos+0
NOP	
LWC1	S1, Offset(_Circ+28)(GP)
MUL.S 	S1, S1, S0
LWC1	S0, Offset(_Circ+44)(GP)
ADD.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+60)(GP)
;Kinematics.c,426 :: 		Circ.yStep = Circ.yCenter + (Circ.radius * sin(Circ.Deg.degreeRadians));
LWC1	S12, Offset(_Circ+112)(GP)
JAL	_sin+0
NOP	
LWC1	S1, Offset(_Circ+28)(GP)
MUL.S 	S1, S1, S0
LWC1	S0, Offset(_Circ+48)(GP)
ADD.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+64)(GP)
;Kinematics.c,427 :: 		}
L_NextCords109:
;Kinematics.c,428 :: 		if(Circ.quadrant == 2 || Circ.quadrant == 3){
LH	R3, Offset(_Circ+36)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__NextCords255
NOP	
J	L__NextCords154
NOP	
L__NextCords255:
LH	R3, Offset(_Circ+36)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__NextCords257
NOP	
J	L__NextCords153
NOP	
L__NextCords257:
J	L_NextCords112
NOP	
L__NextCords154:
L__NextCords153:
;Kinematics.c,429 :: 		Circ.xStep = Circ.xCenter - (Circ.radius * cos(Circ.Deg.degreeRadians));
LWC1	S12, Offset(_Circ+112)(GP)
JAL	_cos+0
NOP	
LWC1	S1, Offset(_Circ+28)(GP)
MUL.S 	S1, S1, S0
LWC1	S0, Offset(_Circ+44)(GP)
SUB.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+60)(GP)
;Kinematics.c,430 :: 		Circ.yStep = Circ.yCenter - (Circ.radius * sin(Circ.Deg.degreeRadians));
LWC1	S12, Offset(_Circ+112)(GP)
JAL	_sin+0
NOP	
LWC1	S1, Offset(_Circ+28)(GP)
MUL.S 	S1, S1, S0
LWC1	S0, Offset(_Circ+48)(GP)
SUB.S 	S0, S0, S1
SWC1	S0, Offset(_Circ+64)(GP)
;Kinematics.c,431 :: 		}
L_NextCords112:
;Kinematics.c,433 :: 		}
L_end_NextCords:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _NextCords
_Cir_Interpolation:
;Kinematics.c,437 :: 		void Cir_Interpolation(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,438 :: 		Circ.lastX = Circ.xStep;
LWC1	S0, Offset(_Circ+60)(GP)
SWC1	S0, Offset(_Circ+84)(GP)
;Kinematics.c,439 :: 		Circ.lastY = Circ.yStep;
LWC1	S0, Offset(_Circ+64)(GP)
SWC1	S0, Offset(_Circ+88)(GP)
;Kinematics.c,440 :: 		Circ.Deg.degreeRadians = CalcStep();
JAL	_CalcStep+0
NOP	
SWC1	S0, Offset(_Circ+112)(GP)
;Kinematics.c,441 :: 		NextCords();
JAL	_NextCords+0
NOP	
;Kinematics.c,443 :: 		STPS[X].step_delay = 100;
ORI	R2, R0, 100
SW	R2, Offset(_STPS+8)(GP)
;Kinematics.c,444 :: 		STPS[Y].step_delay = 100;
ORI	R2, R0, 100
SW	R2, Offset(_STPS+76)(GP)
;Kinematics.c,445 :: 		SerialPrint();
JAL	_SerialPrint+0
NOP	
;Kinematics.c,450 :: 		if(Circ.lastX >= Circ.xStep){
LWC1	S1, Offset(_Circ+60)(GP)
LWC1	S0, Offset(_Circ+84)(GP)
C.LT.S 	0, S0, S1
BC1F	0, L__Cir_Interpolation259
NOP	
J	L_Cir_Interpolation113
NOP	
L__Cir_Interpolation259:
;Kinematics.c,451 :: 		DIR_StepX = 0;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
;Kinematics.c,452 :: 		}else{
J	L_Cir_Interpolation114
NOP	
L_Cir_Interpolation113:
;Kinematics.c,453 :: 		DIR_StepX = 1;
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
;Kinematics.c,454 :: 		}
L_Cir_Interpolation114:
;Kinematics.c,456 :: 		if(Circ.lastY >= Circ.yStep){
LWC1	S1, Offset(_Circ+64)(GP)
LWC1	S0, Offset(_Circ+88)(GP)
C.LT.S 	0, S0, S1
BC1F	0, L__Cir_Interpolation260
NOP	
J	L_Cir_Interpolation115
NOP	
L__Cir_Interpolation260:
;Kinematics.c,457 :: 		DIR_StepY = 0;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
;Kinematics.c,458 :: 		}else{
J	L_Cir_Interpolation116
NOP	
L_Cir_Interpolation115:
;Kinematics.c,459 :: 		DIR_StepY = 1;
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
;Kinematics.c,460 :: 		}
L_Cir_Interpolation116:
;Kinematics.c,462 :: 		Circ_Tick();
JAL	_Circ_Tick+0
NOP	
;Kinematics.c,463 :: 		}
L_end_Cir_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Cir_Interpolation
_Circ_Tick:
;Kinematics.c,465 :: 		void Circ_Tick(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Kinematics.c,468 :: 		x = (int)Circ.xStep;
LWC1	S0, Offset(_Circ+60)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 4(SP)
;Kinematics.c,469 :: 		y = (int)Circ.yStep;
LWC1	S0, Offset(_Circ+64)(GP)
CVT36.S 	S0, S0
MFC1	R2, S0
SH	R2, 6(SP)
;Kinematics.c,471 :: 		if (Circ.dir == CW){
LH	R2, Offset(_Circ+32)(GP)
BEQ	R2, R0, L__Circ_Tick262
NOP	
J	L_Circ_Tick117
NOP	
L__Circ_Tick262:
;Kinematics.c,472 :: 		Circ.Deg.deg += 0.25;//Circ.divisor;
LWC1	S1, Offset(_Circ+104)(GP)
LUI	R2, 16000
ORI	R2, R2, 0
MTC1	R2, S0
ADD.S 	S1, S1, S0
SWC1	S1, Offset(_Circ+104)(GP)
;Kinematics.c,473 :: 		if (Circ.Deg.deg == Circ.Deg.newdeg){
LWC1	S0, Offset(_Circ+116)(GP)
C.EQ.S 	0, S1, S0
BC1T	0, L__Circ_Tick263
NOP	
J	L_Circ_Tick118
NOP	
L__Circ_Tick263:
;Kinematics.c,474 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Kinematics.c,475 :: 		}
L_Circ_Tick118:
;Kinematics.c,476 :: 		}
L_Circ_Tick117:
;Kinematics.c,478 :: 		if (Circ.dir == CCW){
LH	R3, Offset(_Circ+32)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Circ_Tick264
NOP	
J	L_Circ_Tick119
NOP	
L__Circ_Tick264:
;Kinematics.c,479 :: 		Circ.Deg.deg -= 0.25;//Circ.divisor;
LWC1	S1, Offset(_Circ+104)(GP)
LUI	R2, 16000
ORI	R2, R2, 0
MTC1	R2, S0
SUB.S 	S1, S1, S0
SWC1	S1, Offset(_Circ+104)(GP)
;Kinematics.c,480 :: 		if (Circ.Deg.deg == Circ.Deg.newdeg){
LWC1	S0, Offset(_Circ+116)(GP)
C.EQ.S 	0, S1, S0
BC1T	0, L__Circ_Tick265
NOP	
J	L_Circ_Tick120
NOP	
L__Circ_Tick265:
;Kinematics.c,481 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Kinematics.c,482 :: 		}
L_Circ_Tick120:
;Kinematics.c,484 :: 		}
L_Circ_Tick119:
;Kinematics.c,487 :: 		if(xL != x){
LH	R3, 4(SP)
LH	R2, 8(SP)
BNE	R2, R3, L__Circ_Tick267
NOP	
J	L_Circ_Tick121
NOP	
L__Circ_Tick267:
;Kinematics.c,488 :: 		Circ.x_next = 1;
LBU	R2, Offset(_Circ+0)(GP)
ORI	R2, R2, 8
SB	R2, Offset(_Circ+0)(GP)
;Kinematics.c,489 :: 		}else
J	L_Circ_Tick122
NOP	
L_Circ_Tick121:
;Kinematics.c,490 :: 		Circ.x_next = 0;
LBU	R2, Offset(_Circ+0)(GP)
INS	R2, R0, 3, 1
SB	R2, Offset(_Circ+0)(GP)
L_Circ_Tick122:
;Kinematics.c,492 :: 		if(yL != y){
LH	R3, 6(SP)
LH	R2, 10(SP)
BNE	R2, R3, L__Circ_Tick269
NOP	
J	L_Circ_Tick123
NOP	
L__Circ_Tick269:
;Kinematics.c,493 :: 		Circ.y_next = 1;
LBU	R2, Offset(_Circ+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(_Circ+0)(GP)
;Kinematics.c,494 :: 		}else
J	L_Circ_Tick124
NOP	
L_Circ_Tick123:
;Kinematics.c,495 :: 		Circ.y_next = 0;
LBU	R2, Offset(_Circ+0)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(_Circ+0)(GP)
L_Circ_Tick124:
;Kinematics.c,497 :: 		xL = x;
LH	R2, 4(SP)
SH	R2, 8(SP)
;Kinematics.c,498 :: 		yL = y;
LH	R2, 6(SP)
SH	R2, 10(SP)
;Kinematics.c,499 :: 		SV.Single_Dual = 2;
ORI	R2, R0, 2
SH	R2, Offset(_SV+0)(GP)
;Kinematics.c,500 :: 		}
L_end_Circ_Tick:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Circ_Tick
_Circ_Prep_Next:
;Kinematics.c,507 :: 		void  Circ_Prep_Next(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,508 :: 		Circ.steps++;
SW	R25, 4(SP)
LHU	R2, Offset(_Circ+38)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_Circ+38)(GP)
;Kinematics.c,510 :: 		if(Circ.x_next)
LBU	R2, Offset(_Circ+0)(GP)
EXT	R2, R2, 3, 1
BNE	R2, R0, L__Circ_Prep_Next272
NOP	
J	L_Circ_Prep_Next125
NOP	
L__Circ_Prep_Next272:
;Kinematics.c,511 :: 		toggleOCx(X);
MOVZ	R25, R0, R0
JAL	_toggleOCx+0
NOP	
L_Circ_Prep_Next125:
;Kinematics.c,512 :: 		if(Circ.y_next)
LBU	R2, Offset(_Circ+0)(GP)
EXT	R2, R2, 4, 1
BNE	R2, R0, L__Circ_Prep_Next274
NOP	
J	L_Circ_Prep_Next126
NOP	
L__Circ_Prep_Next274:
;Kinematics.c,513 :: 		toggleOCx(Y);
ORI	R25, R0, 1
JAL	_toggleOCx+0
NOP	
L_Circ_Prep_Next126:
;Kinematics.c,516 :: 		if(Circ.steps >= Circ.Idivisor){
LHU	R3, Offset(_Circ+40)(GP)
LHU	R2, Offset(_Circ+38)(GP)
SLTU	R2, R2, R3
BEQ	R2, R0, L__Circ_Prep_Next275
NOP	
J	L_Circ_Prep_Next127
NOP	
L__Circ_Prep_Next275:
;Kinematics.c,517 :: 		Circ.steps = 0;
SH	R0, Offset(_Circ+38)(GP)
;Kinematics.c,518 :: 		Circ.cir_next = 0;
LBU	R2, Offset(_Circ+0)(GP)
INS	R2, R0, 2, 1
SB	R2, Offset(_Circ+0)(GP)
;Kinematics.c,519 :: 		Circ.cir_start = 1;
LBU	R2, Offset(_Circ+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_Circ+0)(GP)
;Kinematics.c,520 :: 		}
L_Circ_Prep_Next127:
;Kinematics.c,522 :: 		}
L_end_Circ_Prep_Next:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Circ_Prep_Next
_SerialPrint:
;Kinematics.c,524 :: 		void SerialPrint(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,525 :: 		int str_len = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
;Kinematics.c,526 :: 		int str_lenA = 0;
;Kinematics.c,527 :: 		str_lenA = strlen(txtA);
LUI	R25, hi_addr(_txtA+0)
ORI	R25, R25, lo_addr(_txtA+0)
JAL	_strlen+0
NOP	
; str_lenA start address is: 44 (R11)
SEH	R11, R2
;Kinematics.c,528 :: 		memset(txtB,0,30);
ORI	R27, R0, 30
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_memset+0
NOP	
;Kinematics.c,530 :: 		sprintf(txt,"%0.2f",Circ.radius);
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
;Kinematics.c,531 :: 		strncpy(txtB, " ",strlen(txt));
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
;Kinematics.c,532 :: 		strncat(txtB, txt,strlen(txt));
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
;Kinematics.c,533 :: 		str_len += strlen(txt);
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,534 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,537 :: 		sprintf(txt,"%0.2f",Circ.xStep);
LW	R2, Offset(_Circ+60)(GP)
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
;Kinematics.c,538 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,539 :: 		str_len += strlen(txt);
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,540 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,543 :: 		sprintf(txt,"%0.2f",Circ.yStep);
LW	R2, Offset(_Circ+64)(GP)
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
;Kinematics.c,544 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,545 :: 		str_len += strlen(txt);
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,546 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,549 :: 		sprintf(txt,"%0.2f",Circ.xFin);
LW	R2, Offset(_Circ+68)(GP)
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
;Kinematics.c,550 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,551 :: 		str_len += strlen(txt)+1;
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,552 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,555 :: 		sprintf(txt,"%0.2f",Circ.yFin);
LW	R2, Offset(_Circ+72)(GP)
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
;Kinematics.c,556 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,557 :: 		str_len += strlen(txt)+1;
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,558 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,561 :: 		sprintf(txt,"%0.2f",Circ.Deg.newdeg);
LW	R2, Offset(_Circ+116)(GP)
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
;Kinematics.c,562 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,563 :: 		str_len += strlen(txt)+1;
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,564 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,567 :: 		sprintf(txt,"%0.2f",Circ.Deg.deg);
LW	R2, Offset(_Circ+104)(GP)
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
;Kinematics.c,568 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,569 :: 		str_len += strlen(txt)+1;
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,570 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,573 :: 		sprintf(txt,"%d",Circ.quadrant);
LH	R2, Offset(_Circ+36)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_9_Kinematics+0)
ORI	R2, R2, lo_addr(?lstr_9_Kinematics+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Kinematics.c,574 :: 		strncat(txtB,txt,strlen(txt));
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
;Kinematics.c,575 :: 		str_len += strlen(txt)+1;
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_strlen+0
NOP	
;Kinematics.c,576 :: 		strncat(txtB,"\n",1);
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
;Kinematics.c,578 :: 		strncat(txtB,txtA,str_lenA);
SEH	R27, R11
; str_lenA end address is: 44 (R11)
LUI	R26, hi_addr(_txtA+0)
ORI	R26, R26, lo_addr(_txtA+0)
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strncat+0
NOP	
;Kinematics.c,581 :: 		UART2_Write_Text(txtB);
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_UART2_Write_Text+0
NOP	
;Kinematics.c,590 :: 		}
L_end_SerialPrint:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SerialPrint
