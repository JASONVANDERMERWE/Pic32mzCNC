_main:
;Main.c,31 :: 		void main() {
;Main.c,36 :: 		int xyz_ = 0, i;
;Main.c,38 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,40 :: 		StepperConstants(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_StepperConstants+0
NOP	
;Main.c,41 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,43 :: 		a=0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,44 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,45 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,46 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,48 :: 		EnableInterrupts();
EI	R30
;Main.c,49 :: 		while(1){
L_main0:
;Main.c,51 :: 		if(!Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main48
NOP	
J	L_main2
NOP	
L__main48:
;Main.c,52 :: 		LED1 = TMR.clock >> 4;
LBU	R2, Offset(_TMR+0)(GP)
SRL	R3, R2, 4
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,53 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(main_disable_steps_L0+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main49
NOP	
J	L_main3
NOP	
L__main49:
;Main.c,54 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(main_disable_steps_L0+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(main_disable_steps_L0+0)(GP)
L_main3:
;Main.c,55 :: 		if(LED1 && (oneshot == 0)){
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BNE	R2, R0, L__main51
NOP	
J	L__main38
NOP	
L__main51:
LBU	R2, Offset(main_oneshot_L0+0)(GP)
BEQ	R2, R0, L__main52
NOP	
J	L__main37
NOP	
L__main52:
L__main36:
;Main.c,56 :: 		oneshot = 1;
ORI	R2, R0, 1
SB	R2, Offset(main_oneshot_L0+0)(GP)
;Main.c,57 :: 		}else if(!LED1 && (oneshot == 1))
J	L_main7
NOP	
;Main.c,55 :: 		if(LED1 && (oneshot == 0)){
L__main38:
L__main37:
;Main.c,57 :: 		}else if(!LED1 && (oneshot == 1))
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BEQ	R2, R0, L__main53
NOP	
J	L__main40
NOP	
L__main53:
LBU	R3, Offset(main_oneshot_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main54
NOP	
J	L__main39
NOP	
L__main54:
L__main35:
;Main.c,58 :: 		oneshot = 0;
SB	R0, Offset(main_oneshot_L0+0)(GP)
;Main.c,57 :: 		}else if(!LED1 && (oneshot == 1))
L__main40:
L__main39:
;Main.c,58 :: 		oneshot = 0;
L_main7:
;Main.c,60 :: 		}
L_main2:
;Main.c,64 :: 		if(!SW2){
_LX	
EXT	R2, R2, BitPos(SW2+0), 1
BEQ	R2, R0, L__main55
NOP	
J	L_main11
NOP	
L__main55:
;Main.c,65 :: 		Toggle  = 0;
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,66 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,67 :: 		}
L_main11:
;Main.c,69 :: 		if((!SW1)&&(!Toggle)){
_LX	
EXT	R2, R2, BitPos(SW1+0), 1
BEQ	R2, R0, L__main56
NOP	
J	L__main42
NOP	
L__main56:
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main57
NOP	
J	L__main41
NOP	
L__main57:
L__main34:
;Main.c,70 :: 		a = 0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,71 :: 		LED1 = 0;
_LX	
INS	R2, R0, BitPos(LED1+0), 1
_SX	
;Main.c,72 :: 		Toggle = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Toggle+0)(GP)
;Main.c,73 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,74 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,75 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,76 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,77 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,78 :: 		sys.steps_position[X] = 0;
SW	R0, Offset(_sys+16)(GP)
;Main.c,69 :: 		if((!SW1)&&(!Toggle)){
L__main42:
L__main41:
;Main.c,81 :: 		if(Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main59
NOP	
J	L_main15
NOP	
L__main59:
;Main.c,86 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__main60
NOP	
J	L__main46
NOP	
L__main60:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__main61
NOP	
J	L__main45
NOP	
L__main61:
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
BEQ	R2, R0, L__main62
NOP	
J	L__main44
NOP	
L__main62:
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
BEQ	R2, R0, L__main63
NOP	
J	L__main43
NOP	
L__main63:
L__main33:
;Main.c,111 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,112 :: 		a++;
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,113 :: 		if(a > 8)a=0;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 9
BEQ	R2, R0, L__main64
NOP	
J	L_main19
NOP	
L__main64:
SH	R0, Offset(Main_a+0)(GP)
L_main19:
;Main.c,86 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__main46:
L__main45:
L__main44:
L__main43:
<<<<<<< HEAD
;Main.c,110 :: 		}
L_main15:
;Main.c,112 :: 		}
J	L_main0
NOP	
;Main.c,113 :: 		}
=======
;Main.c,116 :: 		}
L_main15:
;Main.c,118 :: 		}
J	L_main0
NOP	
;Main.c,119 :: 		}
>>>>>>> patch2
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
<<<<<<< HEAD
;Main.c,116 :: 		void Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,118 :: 		switch(a){
=======
;Main.c,122 :: 		void Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,124 :: 		switch(a){
>>>>>>> patch2
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Temp_Move20
NOP	
<<<<<<< HEAD
;Main.c,119 :: 		case 0:
L_Temp_Move22:
;Main.c,120 :: 		STPS[X].mmToTravel = belt_steps(-50.00);//calcSteps(-125.25,8.06);
=======
;Main.c,125 :: 		case 0:
L_Temp_Move22:
;Main.c,126 :: 		STPS[X].mmToTravel = belt_steps(-50.00);//calcSteps(-125.25,8.06);
>>>>>>> patch2
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
<<<<<<< HEAD
;Main.c,121 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,122 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,123 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,124 :: 		case 2:
L_Temp_Move23:
;Main.c,125 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,126 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
=======
;Main.c,127 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
>>>>>>> patch2
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,127 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,128 :: 		break;
J	L_Temp_Move21
NOP	
<<<<<<< HEAD
;Main.c,129 :: 		case 1:
L_Temp_Move24:
;Main.c,130 :: 		STPS[Y].mmToTravel = belt_steps(50.00);
=======
;Main.c,130 :: 		case 2:
L_Temp_Move23:
;Main.c,131 :: 		STPS[X].mmToTravel = belt_steps(50.00);
>>>>>>> patch2
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
<<<<<<< HEAD
SW	R2, Offset(_STPS+132)(GP)
;Main.c,131 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
=======
SW	R2, Offset(_STPS+64)(GP)
;Main.c,132 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
>>>>>>> patch2
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,132 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
=======
;Main.c,133 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
>>>>>>> patch2
JAL	_SingleAxisStep+0
NOP	
;Main.c,133 :: 		break;
J	L_Temp_Move21
NOP	
<<<<<<< HEAD
;Main.c,134 :: 		case 3:
L_Temp_Move25:
;Main.c,135 :: 		STPS[Y].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
=======
;Main.c,135 :: 		case 1:
L_Temp_Move24:
;Main.c,136 :: 		STPS[Y].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
>>>>>>> patch2
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,136 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,137 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,138 :: 		break;
J	L_Temp_Move21
NOP	
<<<<<<< HEAD
;Main.c,139 :: 		case 4:
L_Temp_Move26:
;Main.c,140 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
=======
;Main.c,140 :: 		case 3:
L_Temp_Move25:
;Main.c,141 :: 		STPS[Y].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,142 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,143 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,144 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,145 :: 		case 4:
L_Temp_Move26:
;Main.c,146 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
>>>>>>> patch2
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
<<<<<<< HEAD
;Main.c,142 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
=======
;Main.c,148 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
>>>>>>> patch2
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
<<<<<<< HEAD
;Main.c,143 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
=======
;Main.c,149 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
>>>>>>> patch2
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,144 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
=======
;Main.c,150 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
>>>>>>> patch2
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,145 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,146 :: 		case 5:
L_Temp_Move27:
;Main.c,147 :: 		STPS[X].mmToTravel = belt_steps(50.00);
=======
;Main.c,151 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,152 :: 		case 5:
L_Temp_Move27:
;Main.c,153 :: 		STPS[X].mmToTravel = belt_steps(50.00);
>>>>>>> patch2
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
<<<<<<< HEAD
;Main.c,149 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
=======
;Main.c,155 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
>>>>>>> patch2
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
<<<<<<< HEAD
;Main.c,150 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
=======
;Main.c,156 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
>>>>>>> patch2
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,151 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
=======
;Main.c,157 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
>>>>>>> patch2
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,152 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,153 :: 		case 6:
L_Temp_Move28:
;Main.c,154 :: 		STPS[X].mmToTravel = belt_steps(-150.00);
=======
;Main.c,158 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,159 :: 		case 6:
L_Temp_Move28:
;Main.c,160 :: 		STPS[X].mmToTravel = belt_steps(-150.00);
>>>>>>> patch2
LUI	R2, 49942
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
<<<<<<< HEAD
;Main.c,155 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
=======
;Main.c,161 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
>>>>>>> patch2
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,156 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
=======
;Main.c,162 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
>>>>>>> patch2
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
<<<<<<< HEAD
;Main.c,158 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
=======
;Main.c,164 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
>>>>>>> patch2
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,159 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,160 :: 		case 7:
L_Temp_Move29:
;Main.c,161 :: 		STPS[X].mmToTravel = belt_steps(150.00);
=======
;Main.c,165 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,166 :: 		case 7:
L_Temp_Move29:
;Main.c,167 :: 		STPS[X].mmToTravel = belt_steps(150.00);
>>>>>>> patch2
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
<<<<<<< HEAD
;Main.c,162 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
=======
;Main.c,168 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
>>>>>>> patch2
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,163 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
=======
;Main.c,169 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
>>>>>>> patch2
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
<<<<<<< HEAD
;Main.c,165 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
=======
;Main.c,171 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
>>>>>>> patch2
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,166 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,167 :: 		case 8:
L_Temp_Move30:
;Main.c,168 :: 		STPS[A].mmToTravel = belt_steps(150.00);
=======
;Main.c,172 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,173 :: 		case 8:
L_Temp_Move30:
;Main.c,174 :: 		STPS[A].mmToTravel = belt_steps(150.00);
>>>>>>> patch2
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+268)(GP)
<<<<<<< HEAD
;Main.c,169 :: 		speed_cntr_Move(STPS[A].mmToTravel, 15000,A);
=======
;Main.c,175 :: 		speed_cntr_Move(STPS[A].mmToTravel, 15000,A);
>>>>>>> patch2
ORI	R27, R0, 3
ORI	R26, R0, 15000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,170 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
=======
;Main.c,176 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
>>>>>>> patch2
ORI	R26, R0, 3
LW	R25, Offset(_STPS+268)(GP)
JAL	_SingleAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,171 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,172 :: 		case 9:
L_Temp_Move31:
;Main.c,174 :: 		r_or_ijk(-50.00, 50.00, -150.00, 150.00, 0.00, -50.00, 50.00,1.0, 0.00);
=======
;Main.c,177 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,178 :: 		case 9:
L_Temp_Move31:
;Main.c,180 :: 		r_or_ijk(-50.00, 50.00, -150.00, 150.00, 0.00, -50.00, 50.00,1.0, 0.00);
>>>>>>> patch2
LUI	R5, 17174
ORI	R5, R5, 0
LUI	R4, 49942
ORI	R4, R4, 0
LUI	R3, 16968
ORI	R3, R3, 0
LUI	R2, 49736
ORI	R2, R2, 0
MOVZ	R25, R0, R0
MTC1	R5, S15
MTC1	R4, S14
MTC1	R3, S13
MTC1	R2, S12
LUI	R2, 16256
ORI	R2, R2, 0
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, 16968
ORI	R2, R2, 0
SW	R2, 8(SP)
LUI	R2, 49736
ORI	R2, R2, 0
SW	R2, 4(SP)
SWC1	S0, 0(SP)
JAL	_r_or_ijk+0
NOP	
ADDIU	SP, SP, 16
<<<<<<< HEAD
;Main.c,175 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,176 :: 		default: a = 0;
L_Temp_Move32:
MOVZ	R25, R0, R0
;Main.c,177 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,178 :: 		}
=======
;Main.c,181 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,182 :: 		default: a = 0;
L_Temp_Move32:
MOVZ	R25, R0, R0
;Main.c,183 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,184 :: 		}
>>>>>>> patch2
L_Temp_Move20:
SEH	R2, R25
BNE	R2, R0, L__Temp_Move68
NOP	
J	L_Temp_Move22
NOP	
L__Temp_Move68:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move70
NOP	
J	L_Temp_Move23
NOP	
L__Temp_Move70:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move72
NOP	
J	L_Temp_Move24
NOP	
L__Temp_Move72:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move74
NOP	
J	L_Temp_Move25
NOP	
L__Temp_Move74:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move76
NOP	
J	L_Temp_Move26
NOP	
L__Temp_Move76:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move78
NOP	
J	L_Temp_Move27
NOP	
L__Temp_Move78:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move80
NOP	
J	L_Temp_Move28
NOP	
L__Temp_Move80:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Temp_Move82
NOP	
J	L_Temp_Move29
NOP	
L__Temp_Move82:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Temp_Move84
NOP	
J	L_Temp_Move30
NOP	
L__Temp_Move84:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Temp_Move86
NOP	
J	L_Temp_Move31
NOP	
L__Temp_Move86:
J	L_Temp_Move32
NOP	
L_Temp_Move21:
<<<<<<< HEAD
;Main.c,179 :: 		}
=======
;Main.c,185 :: 		}
>>>>>>> patch2
L_end_Temp_Move:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Temp_Move
_LCD_Display:
<<<<<<< HEAD
;Main.c,181 :: 		void LCD_Display(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Main.c,186 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
=======
;Main.c,187 :: 		void LCD_Display(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Main.c,192 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
>>>>>>> patch2
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
LW	R2, Offset(_STPS+48)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_1_Main+0)
ORI	R2, R2, lo_addr(?lstr_1_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;Main.c,187 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
=======
;Main.c,193 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
>>>>>>> patch2
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,189 :: 		sprintf(txt,"%d",STPS[0].decel_start);
=======
;Main.c,195 :: 		sprintf(txt,"%d",STPS[0].decel_start);
>>>>>>> patch2
LW	R2, Offset(_STPS+12)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_2_Main+0)
ORI	R2, R2, lo_addr(?lstr_2_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;Main.c,190 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
=======
;Main.c,196 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
>>>>>>> patch2
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,194 :: 		sprintf(txt,"%d",STPS[0].step_delay);
=======
;Main.c,200 :: 		sprintf(txt,"%d",STPS[0].step_delay);
>>>>>>> patch2
LW	R2, Offset(_STPS+8)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_Main+0)
ORI	R2, R2, lo_addr(?lstr_3_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;Main.c,195 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
=======
;Main.c,201 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
>>>>>>> patch2
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,197 :: 		sprintf(txt,"%d",STPS[0].min_delay);
=======
;Main.c,203 :: 		sprintf(txt,"%d",STPS[0].min_delay);
>>>>>>> patch2
LW	R2, Offset(_STPS+20)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_Main+0)
ORI	R2, R2, lo_addr(?lstr_4_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;Main.c,198 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
=======
;Main.c,204 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
>>>>>>> patch2
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,202 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
=======
;Main.c,208 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
>>>>>>> patch2
LW	R2, Offset(_STPS+52)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_Main+0)
ORI	R2, R2, lo_addr(?lstr_5_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;Main.c,203 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
=======
;Main.c,209 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
>>>>>>> patch2
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,205 :: 		sprintf(txt,"%d",STPS[0].decel_val);
=======
;Main.c,211 :: 		sprintf(txt,"%d",STPS[0].decel_val);
>>>>>>> patch2
LW	R2, Offset(_STPS+16)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_6_Main+0)
ORI	R2, R2, lo_addr(?lstr_6_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;Main.c,206 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
=======
;Main.c,212 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
>>>>>>> patch2
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,207 :: 		}
=======
;Main.c,213 :: 		}
>>>>>>> patch2
L_end_LCD_Display:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _LCD_Display
