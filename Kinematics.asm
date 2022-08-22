_SingleAxisStep:
;Kinematics.c,19 :: 		void SingleAxisStep(long newxyz,int axis_No){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Kinematics.c,25 :: 		SV.Single_Dual = 0;
SW	R25, 4(SP)
LBU	R2, Offset(_SV+0)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,26 :: 		switch(axis_No){
J	L_SingleAxisStep0
NOP	
;Kinematics.c,27 :: 		case X:
L_SingleAxisStep2:
;Kinematics.c,28 :: 		Single_Axis_Enable(X);
SH	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,29 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,30 :: 		case Y:
L_SingleAxisStep3:
;Kinematics.c,31 :: 		Single_Axis_Enable(Y);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,32 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,33 :: 		case Z:
L_SingleAxisStep4:
;Kinematics.c,34 :: 		Single_Axis_Enable(Z);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,35 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,36 :: 		case A:
L_SingleAxisStep5:
;Kinematics.c,37 :: 		Single_Axis_Enable(A);
SH	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 3
JAL	_Single_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LH	R26, 8(SP)
;Kinematics.c,38 :: 		break;
J	L_SingleAxisStep1
NOP	
;Kinematics.c,39 :: 		default: break;
L_SingleAxisStep6:
J	L_SingleAxisStep1
NOP	
;Kinematics.c,40 :: 		}
L_SingleAxisStep0:
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep141
NOP	
J	L_SingleAxisStep2
NOP	
L__SingleAxisStep141:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep143
NOP	
J	L_SingleAxisStep3
NOP	
L__SingleAxisStep143:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep145
NOP	
J	L_SingleAxisStep4
NOP	
L__SingleAxisStep145:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep147
NOP	
J	L_SingleAxisStep5
NOP	
L__SingleAxisStep147:
J	L_SingleAxisStep6
NOP	
L_SingleAxisStep1:
;Kinematics.c,41 :: 		SV.psingle  = 0;
SW	R0, Offset(_SV+48)(GP)
;Kinematics.c,42 :: 		STPS[axis_No].dist = newxyz - SV.psingle;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 36
SW	R25, 0(R2)
;Kinematics.c,43 :: 		STPS[axis_No].dist = abs(STPS[axis_No].dist);
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
;Kinematics.c,45 :: 		if(newxyz < 0)
SLTI	R2, R25, 0
BNE	R2, R0, L__SingleAxisStep148
NOP	
J	L_SingleAxisStep7
NOP	
L__SingleAxisStep148:
;Kinematics.c,46 :: 		dir = CCW;
; dir start address is: 16 (R4)
ORI	R4, R0, 1
; dir end address is: 16 (R4)
J	L_SingleAxisStep8
NOP	
L_SingleAxisStep7:
;Kinematics.c,48 :: 		dir = CW;
; dir start address is: 16 (R4)
MOVZ	R4, R0, R0
; dir end address is: 16 (R4)
L_SingleAxisStep8:
;Kinematics.c,50 :: 		switch(axis_No){
; dir start address is: 16 (R4)
J	L_SingleAxisStep9
NOP	
;Kinematics.c,51 :: 		case X:
L_SingleAxisStep11:
;Kinematics.c,52 :: 		DIR_StepX = dir;
_LX	
INS	R2, R4, BitPos(DIR_StepX+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,53 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,54 :: 		case Y:
L_SingleAxisStep12:
;Kinematics.c,55 :: 		DIR_StepY = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepY+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,56 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,57 :: 		case Z:
L_SingleAxisStep13:
;Kinematics.c,58 :: 		DIR_StepZ = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepZ+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,59 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,60 :: 		case A:
L_SingleAxisStep14:
;Kinematics.c,61 :: 		DIR_StepA = dir;
; dir start address is: 16 (R4)
_LX	
INS	R2, R4, BitPos(DIR_StepA+0), 1
; dir end address is: 16 (R4)
_SX	
;Kinematics.c,62 :: 		break;
J	L_SingleAxisStep10
NOP	
;Kinematics.c,63 :: 		default: break;
L_SingleAxisStep15:
J	L_SingleAxisStep10
NOP	
;Kinematics.c,64 :: 		}
L_SingleAxisStep9:
; dir start address is: 16 (R4)
SEH	R2, R26
BNE	R2, R0, L__SingleAxisStep150
NOP	
J	L_SingleAxisStep11
NOP	
L__SingleAxisStep150:
SEH	R3, R26
ORI	R2, R0, 1
BNE	R3, R2, L__SingleAxisStep152
NOP	
J	L_SingleAxisStep12
NOP	
L__SingleAxisStep152:
SEH	R3, R26
ORI	R2, R0, 2
BNE	R3, R2, L__SingleAxisStep154
NOP	
J	L_SingleAxisStep13
NOP	
L__SingleAxisStep154:
SEH	R3, R26
ORI	R2, R0, 3
BNE	R3, R2, L__SingleAxisStep156
NOP	
J	L_SingleAxisStep14
NOP	
L__SingleAxisStep156:
; dir end address is: 16 (R4)
J	L_SingleAxisStep15
NOP	
L_SingleAxisStep10:
;Kinematics.c,66 :: 		STPS[axis_No].step_count = 0;
SEH	R3, R26
ORI	R2, R0, 68
MULTU	R2, R3
MFLO	R3
LUI	R2, hi_addr(_STPS+0)
ORI	R2, R2, lo_addr(_STPS+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 32
SW	R0, 0(R2)
;Kinematics.c,68 :: 		Step_Cycle(axis_No);
SEH	R25, R26
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,70 :: 		}
L_end_SingleAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SingleAxisStep
_DualAxisStep:
;Kinematics.c,75 :: 		void DualAxisStep(long newx,long newy,int axis_combo){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,77 :: 		SV.over=0;
SW	R25, 4(SP)
SW	R0, Offset(_SV+52)(GP)
;Kinematics.c,79 :: 		SV.px = 0;
SW	R0, Offset(_SV+32)(GP)
;Kinematics.c,80 :: 		SV.py = 0;
SW	R0, Offset(_SV+36)(GP)
;Kinematics.c,81 :: 		SV.pz = 0;
SW	R0, Offset(_SV+40)(GP)
;Kinematics.c,85 :: 		SV.Single_Dual = 1;
LBU	R2, Offset(_SV+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SV+0)(GP)
;Kinematics.c,86 :: 		switch(axis_combo){
J	L_DualAxisStep16
NOP	
;Kinematics.c,87 :: 		case xy:
L_DualAxisStep18:
;Kinematics.c,88 :: 		AxisPulse = XY_Interpolate;
LUI	R2, hi_addr(_XY_Interpolate+0)
ORI	R2, R2, lo_addr(_XY_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Kinematics.c,89 :: 		axis_xyz = xy;
SB	R0, Offset(_axis_xyz+0)(GP)
;Kinematics.c,90 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,92 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,93 :: 		SV.dy   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,96 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep158
NOP	
J	L_DualAxisStep19
NOP	
L__DualAxisStep158:
; ?FLOC___DualAxisStep?T43 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T43 end address is: 12 (R3)
J	L_DualAxisStep20
NOP	
L_DualAxisStep19:
; ?FLOC___DualAxisStep?T43 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T43 end address is: 12 (R3)
L_DualAxisStep20:
; ?FLOC___DualAxisStep?T43 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T43 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
;Kinematics.c,97 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep159
NOP	
J	L_DualAxisStep21
NOP	
L__DualAxisStep159:
; ?FLOC___DualAxisStep?T45 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T45 end address is: 12 (R3)
J	L_DualAxisStep22
NOP	
L_DualAxisStep21:
; ?FLOC___DualAxisStep?T45 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T45 end address is: 12 (R3)
L_DualAxisStep22:
; ?FLOC___DualAxisStep?T45 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T45 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
;Kinematics.c,100 :: 		if(SV.dirx < 0)
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep160
NOP	
J	L_DualAxisStep23
NOP	
L__DualAxisStep160:
;Kinematics.c,101 :: 		DIR_StepX = CCW;
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep24
NOP	
L_DualAxisStep23:
;Kinematics.c,103 :: 		DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep24:
;Kinematics.c,105 :: 		if(SV.diry < 0)
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep161
NOP	
J	L_DualAxisStep25
NOP	
L__DualAxisStep161:
;Kinematics.c,106 :: 		DIR_StepY = CCW;
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep26
NOP	
L_DualAxisStep25:
;Kinematics.c,108 :: 		DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep26:
;Kinematics.c,110 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,111 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,113 :: 		if(SV.dx > SV.dy)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep162
NOP	
J	L_DualAxisStep27
NOP	
L__DualAxisStep162:
;Kinematics.c,114 :: 		SV.d2 = 2*(SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
J	L_DualAxisStep28
NOP	
L_DualAxisStep27:
;Kinematics.c,116 :: 		SV.d2 = 2* (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(_SV+12)(GP)
L_DualAxisStep28:
;Kinematics.c,118 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,119 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,120 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,122 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,123 :: 		case xz:
L_DualAxisStep29:
;Kinematics.c,124 :: 		AxisPulse = XZ_Interpolate;
LUI	R2, hi_addr(_XZ_Interpolate+0)
ORI	R2, R2, lo_addr(_XZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Kinematics.c,125 :: 		axis_xyz = xz;
ORI	R2, R0, 1
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,126 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 1
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,128 :: 		SV.dx   = newx - SV.px;           // distance to move (delta)
LW	R2, Offset(_SV+32)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,129 :: 		SV.dz   = newy - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,132 :: 		SV.dirx = SV.dx > 0?1:-1;
LW	R2, Offset(_SV+16)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep163
NOP	
J	L_DualAxisStep30
NOP	
L__DualAxisStep163:
; ?FLOC___DualAxisStep?T59 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T59 end address is: 12 (R3)
J	L_DualAxisStep31
NOP	
L_DualAxisStep30:
; ?FLOC___DualAxisStep?T59 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T59 end address is: 12 (R3)
L_DualAxisStep31:
; ?FLOC___DualAxisStep?T59 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T59 end address is: 12 (R3)
SH	R2, Offset(_SV+64)(GP)
;Kinematics.c,133 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep164
NOP	
J	L_DualAxisStep32
NOP	
L__DualAxisStep164:
; ?FLOC___DualAxisStep?T61 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T61 end address is: 12 (R3)
J	L_DualAxisStep33
NOP	
L_DualAxisStep32:
; ?FLOC___DualAxisStep?T61 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T61 end address is: 12 (R3)
L_DualAxisStep33:
; ?FLOC___DualAxisStep?T61 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T61 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
;Kinematics.c,136 :: 		if(SV.dirx < 0)DIR_StepX = CCW;
LH	R2, Offset(_SV+64)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep165
NOP	
J	L_DualAxisStep34
NOP	
L__DualAxisStep165:
_LX	
ORI	R2, R2, BitMask(DIR_StepX+0)
_SX	
J	L_DualAxisStep35
NOP	
L_DualAxisStep34:
;Kinematics.c,137 :: 		else DIR_StepX = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepX+0), 1
_SX	
L_DualAxisStep35:
;Kinematics.c,139 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep166
NOP	
J	L_DualAxisStep36
NOP	
L__DualAxisStep166:
_LX	
ORI	R2, R2, BitMask(DIR_StepZ+0)
_SX	
J	L_DualAxisStep37
NOP	
L_DualAxisStep36:
;Kinematics.c,140 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep37:
;Kinematics.c,142 :: 		SV.dx = abs(SV.dx);
LW	R25, Offset(_SV+16)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+16)(GP)
;Kinematics.c,143 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,145 :: 		if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep167
NOP	
J	L_DualAxisStep38
NOP	
L__DualAxisStep167:
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep39
NOP	
L_DualAxisStep38:
;Kinematics.c,146 :: 		else d2 = 2* (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep39:
;Kinematics.c,148 :: 		STPS[X].step_count = 0;
SW	R0, Offset(_STPS+32)(GP)
;Kinematics.c,149 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,150 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,151 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,152 :: 		case yz:
L_DualAxisStep40:
;Kinematics.c,153 :: 		AxisPulse = YZ_Interpolate;
LUI	R2, hi_addr(_YZ_Interpolate+0)
ORI	R2, R2, lo_addr(_YZ_Interpolate+0)
SW	R2, Offset(_AxisPulse+0)(GP)
;Kinematics.c,154 :: 		axis_xyz = yz;
ORI	R2, R0, 2
SB	R2, Offset(_axis_xyz+0)(GP)
;Kinematics.c,155 :: 		Multi_Axis_Enable(axis_xyz);
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 2
JAL	_Multi_Axis_Enable+0
NOP	
LW	R25, 12(SP)
LW	R26, 8(SP)
;Kinematics.c,158 :: 		SV.dy   = newx - SV.pz;
LW	R2, Offset(_SV+40)(GP)
SUBU	R2, R25, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,159 :: 		SV.dz   = newy - SV.py;
LW	R2, Offset(_SV+36)(GP)
SUBU	R2, R26, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,162 :: 		SV.diry = SV.dy > 0?1:-1;
LW	R2, Offset(_SV+20)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep168
NOP	
J	L_DualAxisStep41
NOP	
L__DualAxisStep168:
; ?FLOC___DualAxisStep?T75 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T75 end address is: 12 (R3)
J	L_DualAxisStep42
NOP	
L_DualAxisStep41:
; ?FLOC___DualAxisStep?T75 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T75 end address is: 12 (R3)
L_DualAxisStep42:
; ?FLOC___DualAxisStep?T75 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T75 end address is: 12 (R3)
SH	R2, Offset(_SV+66)(GP)
;Kinematics.c,163 :: 		SV.dirz = SV.dz > 0?1:-1;
LW	R2, Offset(_SV+24)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__DualAxisStep169
NOP	
J	L_DualAxisStep43
NOP	
L__DualAxisStep169:
; ?FLOC___DualAxisStep?T77 start address is: 12 (R3)
ORI	R3, R0, 1
; ?FLOC___DualAxisStep?T77 end address is: 12 (R3)
J	L_DualAxisStep44
NOP	
L_DualAxisStep43:
; ?FLOC___DualAxisStep?T77 start address is: 12 (R3)
ORI	R3, R0, 255
; ?FLOC___DualAxisStep?T77 end address is: 12 (R3)
L_DualAxisStep44:
; ?FLOC___DualAxisStep?T77 start address is: 12 (R3)
SEB	R2, R3
; ?FLOC___DualAxisStep?T77 end address is: 12 (R3)
SH	R2, Offset(_SV+68)(GP)
;Kinematics.c,166 :: 		if(SV.diry < 0)DIR_StepY = CCW;
LH	R2, Offset(_SV+66)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep170
NOP	
J	L_DualAxisStep45
NOP	
L__DualAxisStep170:
_LX	
ORI	R2, R2, BitMask(DIR_StepY+0)
_SX	
J	L_DualAxisStep46
NOP	
L_DualAxisStep45:
;Kinematics.c,167 :: 		else DIR_StepY = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepY+0), 1
_SX	
L_DualAxisStep46:
;Kinematics.c,168 :: 		if(SV.dirz < 0) DIR_StepZ = CCW;
LH	R2, Offset(_SV+68)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__DualAxisStep171
NOP	
J	L_DualAxisStep47
NOP	
L__DualAxisStep171:
_LX	
ORI	R2, R2, BitMask(DIR_StepZ+0)
_SX	
J	L_DualAxisStep48
NOP	
L_DualAxisStep47:
;Kinematics.c,169 :: 		else DIR_StepZ = CW;
_LX	
INS	R2, R0, BitPos(DIR_StepZ+0), 1
_SX	
L_DualAxisStep48:
;Kinematics.c,171 :: 		SV.dy = abs(SV.dy);
LW	R25, Offset(_SV+20)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+20)(GP)
;Kinematics.c,172 :: 		SV.dz = abs(SV.dz);
LW	R25, Offset(_SV+24)(GP)
JAL	_abs+0
NOP	
SEH	R2, R2
SW	R2, Offset(_SV+24)(GP)
;Kinematics.c,174 :: 		if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__DualAxisStep172
NOP	
J	L_DualAxisStep49
NOP	
L__DualAxisStep172:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_DualAxisStep50
NOP	
L_DualAxisStep49:
;Kinematics.c,175 :: 		else d2 = 2* (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R2, R2, 1
SW	R2, Offset(Kinematics_d2+0)(GP)
L_DualAxisStep50:
;Kinematics.c,177 :: 		STPS[Y].step_count = 0;
SW	R0, Offset(_STPS+100)(GP)
;Kinematics.c,178 :: 		STPS[Z].step_count = 0;
SW	R0, Offset(_STPS+168)(GP)
;Kinematics.c,179 :: 		AxisPulse();
LW	R30, Offset(_AxisPulse+0)(GP)
JALR	RA, R30
NOP	
;Kinematics.c,180 :: 		break;
J	L_DualAxisStep17
NOP	
;Kinematics.c,181 :: 		default: break;
L_DualAxisStep51:
J	L_DualAxisStep17
NOP	
;Kinematics.c,183 :: 		}
L_DualAxisStep16:
SEH	R2, R27
BNE	R2, R0, L__DualAxisStep174
NOP	
J	L_DualAxisStep18
NOP	
L__DualAxisStep174:
SEH	R3, R27
ORI	R2, R0, 1
BNE	R3, R2, L__DualAxisStep176
NOP	
J	L_DualAxisStep29
NOP	
L__DualAxisStep176:
SEH	R3, R27
ORI	R2, R0, 2
BNE	R3, R2, L__DualAxisStep178
NOP	
J	L_DualAxisStep40
NOP	
L__DualAxisStep178:
J	L_DualAxisStep51
NOP	
L_DualAxisStep17:
;Kinematics.c,184 :: 		}
L_end_DualAxisStep:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _DualAxisStep
_XY_Interpolate:
;Kinematics.c,188 :: 		void XY_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,189 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate180
NOP	
J	L__XY_Interpolate114
NOP	
L__XY_Interpolate180:
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XY_Interpolate181
NOP	
J	L__XY_Interpolate113
NOP	
L__XY_Interpolate181:
J	L_XY_Interpolate54
NOP	
L__XY_Interpolate114:
L__XY_Interpolate113:
;Kinematics.c,190 :: 		StopX();
JAL	_StopX+0
NOP	
;Kinematics.c,191 :: 		StopY();
JAL	_StopY+0
NOP	
;Kinematics.c,192 :: 		return;
J	L_end_XY_Interpolate
NOP	
;Kinematics.c,193 :: 		}
L_XY_Interpolate54:
;Kinematics.c,195 :: 		if(SV.dx > SV.dy){
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XY_Interpolate182
NOP	
J	L_XY_Interpolate55
NOP	
L__XY_Interpolate182:
;Kinematics.c,196 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,197 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate183
NOP	
J	L_XY_Interpolate56
NOP	
L__XY_Interpolate183:
;Kinematics.c,198 :: 		SV.d2 += 2*SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,199 :: 		}else{
J	L_XY_Interpolate57
NOP	
L_XY_Interpolate56:
;Kinematics.c,200 :: 		SV.d2 += 2 * (SV.dy - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,201 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,202 :: 		}
L_XY_Interpolate57:
;Kinematics.c,203 :: 		}else{
J	L_XY_Interpolate58
NOP	
L_XY_Interpolate55:
;Kinematics.c,204 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,205 :: 		if(SV.d2 < 0){
LW	R2, Offset(_SV+12)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XY_Interpolate184
NOP	
J	L_XY_Interpolate59
NOP	
L__XY_Interpolate184:
;Kinematics.c,206 :: 		SV.d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,207 :: 		}else{
J	L_XY_Interpolate60
NOP	
L_XY_Interpolate59:
;Kinematics.c,208 :: 		SV.d2 += 2 * (SV.dx - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(_SV+12)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(_SV+12)(GP)
;Kinematics.c,209 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,210 :: 		}
L_XY_Interpolate60:
;Kinematics.c,211 :: 		}
L_XY_Interpolate58:
;Kinematics.c,212 :: 		}
L_end_XY_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XY_Interpolate
_XZ_Interpolate:
;Kinematics.c,214 :: 		void XZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,216 :: 		if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_STPS+32)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate186
NOP	
J	L__XZ_Interpolate117
NOP	
L__XZ_Interpolate186:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__XZ_Interpolate187
NOP	
J	L__XZ_Interpolate116
NOP	
L__XZ_Interpolate187:
J	L_XZ_Interpolate63
NOP	
L__XZ_Interpolate117:
L__XZ_Interpolate116:
;Kinematics.c,217 :: 		StopX();
JAL	_StopX+0
NOP	
;Kinematics.c,218 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Kinematics.c,220 :: 		return;
J	L_end_XZ_Interpolate
NOP	
;Kinematics.c,221 :: 		}
L_XZ_Interpolate63:
;Kinematics.c,223 :: 		if(SV.dx > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__XZ_Interpolate188
NOP	
J	L_XZ_Interpolate64
NOP	
L__XZ_Interpolate188:
;Kinematics.c,224 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,225 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate189
NOP	
J	L_XZ_Interpolate65
NOP	
L__XZ_Interpolate189:
;Kinematics.c,226 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_XZ_Interpolate66
NOP	
L_XZ_Interpolate65:
;Kinematics.c,228 :: 		d2 += 2 * (SV.dz - SV.dx);
LW	R3, Offset(_SV+16)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,229 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,230 :: 		}
L_XZ_Interpolate66:
;Kinematics.c,232 :: 		}else{
J	L_XZ_Interpolate67
NOP	
L_XZ_Interpolate64:
;Kinematics.c,233 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,234 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__XZ_Interpolate190
NOP	
J	L_XZ_Interpolate68
NOP	
L__XZ_Interpolate190:
;Kinematics.c,235 :: 		d2 += 2 * SV.dx;
LW	R2, Offset(_SV+16)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_XZ_Interpolate69
NOP	
L_XZ_Interpolate68:
;Kinematics.c,237 :: 		d2 += 2 * (SV.dx - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+16)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,238 :: 		Step_Cycle(X);
MOVZ	R25, R0, R0
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,239 :: 		}
L_XZ_Interpolate69:
;Kinematics.c,240 :: 		}
L_XZ_Interpolate67:
;Kinematics.c,241 :: 		}
L_end_XZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _XZ_Interpolate
_YZ_Interpolate:
;Kinematics.c,243 :: 		void YZ_Interpolate(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Kinematics.c,244 :: 		if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)){
SW	R25, 4(SP)
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_STPS+100)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate192
NOP	
J	L__YZ_Interpolate120
NOP	
L__YZ_Interpolate192:
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_STPS+168)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__YZ_Interpolate193
NOP	
J	L__YZ_Interpolate119
NOP	
L__YZ_Interpolate193:
J	L_YZ_Interpolate72
NOP	
L__YZ_Interpolate120:
L__YZ_Interpolate119:
;Kinematics.c,245 :: 		StopY();
JAL	_StopY+0
NOP	
;Kinematics.c,246 :: 		StopZ();
JAL	_StopZ+0
NOP	
;Kinematics.c,247 :: 		return;
J	L_end_YZ_Interpolate
NOP	
;Kinematics.c,248 :: 		}
L_YZ_Interpolate72:
;Kinematics.c,250 :: 		if(SV.dy > SV.dz){
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__YZ_Interpolate194
NOP	
J	L_YZ_Interpolate73
NOP	
L__YZ_Interpolate194:
;Kinematics.c,251 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,252 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate195
NOP	
J	L_YZ_Interpolate74
NOP	
L__YZ_Interpolate195:
;Kinematics.c,253 :: 		d2 += 2*SV.dz;
LW	R2, Offset(_SV+24)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_YZ_Interpolate75
NOP	
L_YZ_Interpolate74:
;Kinematics.c,255 :: 		d2 += 2 * (SV.dz - SV.dy);
LW	R3, Offset(_SV+20)(GP)
LW	R2, Offset(_SV+24)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,256 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,257 :: 		}
L_YZ_Interpolate75:
;Kinematics.c,258 :: 		}else{
J	L_YZ_Interpolate76
NOP	
L_YZ_Interpolate73:
;Kinematics.c,259 :: 		Step_Cycle(Z);
ORI	R25, R0, 2
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,260 :: 		if(d2 < 0)
LW	R2, Offset(Kinematics_d2+0)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__YZ_Interpolate196
NOP	
J	L_YZ_Interpolate77
NOP	
L__YZ_Interpolate196:
;Kinematics.c,261 :: 		d2 += 2 * SV.dy;
LW	R2, Offset(_SV+20)(GP)
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
J	L_YZ_Interpolate78
NOP	
L_YZ_Interpolate77:
;Kinematics.c,263 :: 		d2 += 2 * (SV.dy - SV.dz);
LW	R3, Offset(_SV+24)(GP)
LW	R2, Offset(_SV+20)(GP)
SUBU	R2, R2, R3
SLL	R3, R2, 1
LW	R2, Offset(Kinematics_d2+0)(GP)
ADDU	R2, R2, R3
SW	R2, Offset(Kinematics_d2+0)(GP)
;Kinematics.c,264 :: 		Step_Cycle(Y);
ORI	R25, R0, 1
JAL	_Step_Cycle+0
NOP	
;Kinematics.c,265 :: 		}
L_YZ_Interpolate78:
;Kinematics.c,266 :: 		}
L_YZ_Interpolate76:
;Kinematics.c,268 :: 		}
L_end_YZ_Interpolate:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _YZ_Interpolate
_CalcRadius:
;Kinematics.c,272 :: 		void CalcRadius(Circle* cir){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Kinematics.c,275 :: 		cir->xRad = fabs(cir->xStart + cir->I);
ADDIU	R2, R25, 48
SW	R2, 12(SP)
ADDIU	R2, R25, 56
LWC1	S1, 0(R2)
ADDIU	R2, R25, 28
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
MOV.S 	S12, S0
JAL	_fabs+0
NOP	
LW	R2, 12(SP)
SWC1	S0, 0(R2)
;Kinematics.c,276 :: 		cir->yRad = fabs(cir->yStart + cir->J);
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
;Kinematics.c,277 :: 		cir->radius = sqrt((cir->xRad*cir->xRad) + (cir->yRad*cir->yRad));
ADDIU	R2, R25, 40
SW	R2, 12(SP)
ADDIU	R2, R25, 48
LWC1	S0, 0(R2)
MUL.S 	S1, S0, S0
ADDIU	R2, R25, 52
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
;Kinematics.c,278 :: 		angA = atan2(cir->yRad,cir->xRad);
ADDIU	R2, R25, 48
LWC1	S1, 0(R2)
ADDIU	R2, R25, 52
LWC1	S0, 0(R2)
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_atan2+0
NOP	
;Kinematics.c,281 :: 		cir->degreeDeg = angA * rad2deg;
ADDIU	R3, R25, 4
LUI	R2, 16997
ORI	R2, R2, 12013
MTC1	R2, S1
MUL.S 	S0, S0, S1
SWC1	S0, 0(R3)
;Kinematics.c,283 :: 		cir->quadrant_start = QuadrantStart(cir->I,cir->J);
ADDIU	R2, R25, 46
SW	R2, 12(SP)
ADDIU	R2, R25, 32
LWC1	S1, 0(R2)
ADDIU	R2, R25, 28
LWC1	S0, 0(R2)
MOV.S 	S13, S1
MOV.S 	S12, S0
JAL	_QuadrantStart+0
NOP	
LW	R3, 12(SP)
SH	R2, 0(R3)
;Kinematics.c,285 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius199
NOP	
J	L__CalcRadius136
NOP	
L__CalcRadius199:
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius201
NOP	
J	L__CalcRadius135
NOP	
L__CalcRadius201:
J	L_CalcRadius81
NOP	
L__CalcRadius136:
L__CalcRadius135:
;Kinematics.c,286 :: 		angB = cir->deg - cir->degreeDeg;
LWC1	S1, 0(R25)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
SUB.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius81:
;Kinematics.c,287 :: 		if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__CalcRadius203
NOP	
J	L__CalcRadius138
NOP	
L__CalcRadius203:
ADDIU	R2, R25, 46
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 3
BNE	R3, R2, L__CalcRadius205
NOP	
J	L__CalcRadius137
NOP	
L__CalcRadius205:
J	L_CalcRadius84
NOP	
L__CalcRadius138:
L__CalcRadius137:
;Kinematics.c,288 :: 		angB = cir->deg + cir->degreeDeg;
LWC1	S1, 0(R25)
ADDIU	R2, R25, 4
LWC1	S0, 0(R2)
ADD.S 	S0, S1, S0
SWC1	S0, 8(SP)
L_CalcRadius84:
;Kinematics.c,290 :: 		cir->degreeRadians = angB * deg2rad;
ADDIU	R3, R25, 8
LWC1	S1, 8(SP)
LUI	R2, 15502
ORI	R2, R2, 64046
MTC1	R2, S0
MUL.S 	S0, S1, S0
SWC1	S0, 0(R3)
;Kinematics.c,291 :: 		}
L_end_CalcRadius:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _CalcRadius
_QuadrantStart:
;Kinematics.c,293 :: 		int QuadrantStart(float i,float j){
;Kinematics.c,294 :: 		if((i <= 0)&&(j >= 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S0, S12
BC1F	0, L__QuadrantStart207
NOP	
J	L__QuadrantStart126
NOP	
L__QuadrantStart207:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LT.S 	0, S13, S0
BC1F	0, L__QuadrantStart208
NOP	
J	L__QuadrantStart125
NOP	
L__QuadrantStart208:
L__QuadrantStart124:
;Kinematics.c,295 :: 		return 1;
ORI	R2, R0, 1
J	L_end_QuadrantStart
NOP	
;Kinematics.c,294 :: 		if((i <= 0)&&(j >= 0))
L__QuadrantStart126:
L__QuadrantStart125:
;Kinematics.c,296 :: 		else if((i > 0)&&(j > 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart209
NOP	
J	L__QuadrantStart128
NOP	
L__QuadrantStart209:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S13, S0
BC1F	0, L__QuadrantStart210
NOP	
J	L__QuadrantStart127
NOP	
L__QuadrantStart210:
L__QuadrantStart123:
;Kinematics.c,297 :: 		return 2;
ORI	R2, R0, 2
J	L_end_QuadrantStart
NOP	
;Kinematics.c,296 :: 		else if((i > 0)&&(j > 0))
L__QuadrantStart128:
L__QuadrantStart127:
;Kinematics.c,298 :: 		else if((i > 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S12, S0
BC1F	0, L__QuadrantStart211
NOP	
J	L__QuadrantStart130
NOP	
L__QuadrantStart211:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart212
NOP	
J	L__QuadrantStart129
NOP	
L__QuadrantStart212:
L__QuadrantStart122:
;Kinematics.c,299 :: 		return 3;
ORI	R2, R0, 3
J	L_end_QuadrantStart
NOP	
;Kinematics.c,298 :: 		else if((i > 0)&&(j < 0))
L__QuadrantStart130:
L__QuadrantStart129:
;Kinematics.c,300 :: 		else if((i < 0)&&(j < 0))
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S12
BC1F	0, L__QuadrantStart213
NOP	
J	L__QuadrantStart132
NOP	
L__QuadrantStart213:
MOVZ	R2, R0, R0
MTC1	R2, S0
C.LE.S 	0, S0, S13
BC1F	0, L__QuadrantStart214
NOP	
J	L__QuadrantStart131
NOP	
L__QuadrantStart214:
L__QuadrantStart121:
;Kinematics.c,301 :: 		return 4;
ORI	R2, R0, 4
J	L_end_QuadrantStart
NOP	
;Kinematics.c,300 :: 		else if((i < 0)&&(j < 0))
L__QuadrantStart132:
L__QuadrantStart131:
;Kinematics.c,303 :: 		return 0;
MOVZ	R2, R0, R0
;Kinematics.c,304 :: 		}
L_end_QuadrantStart:
JR	RA
NOP	
; end of _QuadrantStart
_CircDir:
;Kinematics.c,306 :: 		void CircDir(Circle* cir){
;Kinematics.c,308 :: 		if(cir->dir == CW){
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__CircDir216
NOP	
J	L_CircDir101
NOP	
L__CircDir216:
;Kinematics.c,309 :: 		newDeg = 360 / cir->deg;
LWC1	S1, 0(R25)
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
DIV.S 	S2, S0, S1
; newDeg start address is: 24 (R6)
MOV.S 	S3, S2
;Kinematics.c,310 :: 		cir->N = (2*Pi*cir->radius)/newDeg;
ADDIU	R3, R25, 36
ADDIU	R2, R25, 40
LWC1	S1, 0(R2)
LUI	R2, 16585
ORI	R2, R2, 4048
MTC1	R2, S0
MUL.S 	S0, S0, S1
DIV.S 	S0, S0, S2
SWC1	S0, 0(R3)
;Kinematics.c,311 :: 		cir->divisor = cir->deg / newDeg;
ADDIU	R2, R25, 20
LWC1	S0, 0(R25)
DIV.S 	S0, S0, S3
; newDeg end address is: 24 (R6)
SWC1	S0, 0(R2)
;Kinematics.c,312 :: 		}
L_CircDir101:
;Kinematics.c,314 :: 		if(cir->dir == CW)
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__CircDir217
NOP	
J	L_CircDir102
NOP	
L__CircDir217:
;Kinematics.c,315 :: 		cir->deg = 0.00;
SW	R0, 0(R25)
L_CircDir102:
;Kinematics.c,316 :: 		if(cir->dir == CCW)
ADDIU	R2, R25, 44
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__CircDir218
NOP	
J	L_CircDir103
NOP	
L__CircDir218:
;Kinematics.c,317 :: 		cir->deg = 360.00;
LUI	R2, 17332
ORI	R2, R2, 0
MTC1	R2, S0
SWC1	S0, 0(R25)
L_CircDir103:
;Kinematics.c,318 :: 		}
L_end_CircDir:
JR	RA
NOP	
; end of _CircDir
_Cir_Interpolation:
;Kinematics.c,320 :: 		void Cir_Interpolation(float xPresent,float yPresent,Circle* cir){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Kinematics.c,322 :: 		cir->xStart = xPresent;
ADDIU	R2, R25, 56
SWC1	S12, 0(R2)
;Kinematics.c,323 :: 		cir->yStart = yPresent;
ADDIU	R2, R25, 60
SWC1	S13, 0(R2)
;Kinematics.c,324 :: 		CalcRadius(cir);
JAL	_CalcRadius+0
NOP	
;Kinematics.c,327 :: 		while(quad){
LH	R2, Offset(Cir_Interpolation_quad_L0+0)(GP)
BNE	R2, R0, L__Cir_Interpolation221
NOP	
J	L_Cir_Interpolation105
NOP	
L__Cir_Interpolation221:
;Kinematics.c,338 :: 		}
L_Cir_Interpolation105:
;Kinematics.c,339 :: 		}
L_end_Cir_Interpolation:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Cir_Interpolation
