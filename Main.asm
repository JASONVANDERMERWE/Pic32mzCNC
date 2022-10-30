_main:
;Main.c,54 :: 		void main() {
ADDIU	SP, SP, -24
;Main.c,59 :: 		int xyz_ = 0, i;
;Main.c,61 :: 		PinMode();
JAL	_PinMode+0
NOP	
;Main.c,63 :: 		StepperConstants(15000,15000);
ORI	R26, R0, 15000
ORI	R25, R0, 15000
JAL	_StepperConstants+0
NOP	
;Main.c,64 :: 		oneShotA = 0;
LBU	R2, Offset(_oneShotA+0)(GP)
INS	R2, R0, BitPos(_oneShotA+0), 1
SB	R2, Offset(_oneShotA+0)(GP)
;Main.c,66 :: 		a=0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,67 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,68 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,69 :: 		DisableStepper();
JAL	_DisableStepper+0
NOP	
;Main.c,71 :: 		EnableInterrupts();
EI	R30
;Main.c,72 :: 		while(1){
L_main0:
;Main.c,74 :: 		if(!Toggle){
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main62
NOP	
J	L_main2
NOP	
L__main62:
;Main.c,75 :: 		LED1 = Limits.X_Limit_Min;//= TMR.clock >> 4;
LBU	R2, Offset(_Limits+0)(GP)
EXT	R3, R2, 0, 1
_LX	
INS	R2, R3, BitPos(LED1+0), 1
_SX	
;Main.c,76 :: 		if(disable_steps <= SEC_TO_DISABLE_STEPPERS)
LHU	R2, Offset(main_disable_steps_L0+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__main63
NOP	
J	L_main3
NOP	
L__main63:
;Main.c,77 :: 		disable_steps = TMR.Reset(SEC_TO_DISABLE_STEPPERS,disable_steps);
LHU	R26, Offset(main_disable_steps_L0+0)(GP)
ORI	R25, R0, 10
LW	R30, Offset(_TMR+4)(GP)
JALR	RA, R30
NOP	
SH	R2, Offset(main_disable_steps_L0+0)(GP)
L_main3:
;Main.c,78 :: 		if(LED1 && (oneshot == 0)){
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BNE	R2, R0, L__main65
NOP	
J	L__main50
NOP	
L__main65:
LBU	R2, Offset(main_oneshot_L0+0)(GP)
BEQ	R2, R0, L__main66
NOP	
J	L__main49
NOP	
L__main66:
L__main48:
;Main.c,79 :: 		oneshot = 1;
ORI	R2, R0, 1
SB	R2, Offset(main_oneshot_L0+0)(GP)
;Main.c,80 :: 		}else if(!LED1 && (oneshot == 1))
J	L_main7
NOP	
;Main.c,78 :: 		if(LED1 && (oneshot == 0)){
L__main50:
L__main49:
;Main.c,80 :: 		}else if(!LED1 && (oneshot == 1))
_LX	
EXT	R2, R2, BitPos(LED1+0), 1
BEQ	R2, R0, L__main67
NOP	
J	L__main52
NOP	
L__main67:
LBU	R3, Offset(main_oneshot_L0+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main68
NOP	
J	L__main51
NOP	
L__main68:
L__main47:
;Main.c,81 :: 		oneshot = 0;
SB	R0, Offset(main_oneshot_L0+0)(GP)
;Main.c,80 :: 		}else if(!LED1 && (oneshot == 1))
L__main52:
L__main51:
;Main.c,81 :: 		oneshot = 0;
L_main7:
;Main.c,83 :: 		}
L_main2:
;Main.c,87 :: 		if(!SW2){
_LX	
EXT	R2, R2, BitPos(SW2+0), 1
BEQ	R2, R0, L__main69
NOP	
J	L_main11
NOP	
L__main69:
;Main.c,88 :: 		Toggle  = 0;
SH	R0, Offset(_Toggle+0)(GP)
;Main.c,89 :: 		disableOCx();
JAL	_disableOCx+0
NOP	
;Main.c,90 :: 		}
L_main11:
;Main.c,92 :: 		if((!SW1)&&(!Toggle)){
_LX	
EXT	R2, R2, BitPos(SW1+0), 1
BEQ	R2, R0, L__main70
NOP	
J	L__main54
NOP	
L__main70:
LHU	R2, Offset(_Toggle+0)(GP)
BEQ	R2, R0, L__main71
NOP	
J	L__main53
NOP	
<<<<<<< HEAD
L__main57:
L__main34:
;Main.c,71 :: 		a = 0;
SH	R0, Offset(Main_a+0)(GP)
;Main.c,72 :: 		LED1 = 0;
_LX	
INS	R2, R0, BitPos(LED1+0), 1
_SX	
;Main.c,73 :: 		Toggle = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Toggle+0)(GP)
;Main.c,74 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,75 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,76 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,77 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,78 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,79 :: 		sys.steps_position[X] = 0;
SW	R0, Offset(_sys+16)(GP)
;Main.c,69 :: 		if((!SW1)&&(!Toggle)){
L__main42:
L__main41:
;Main.c,82 :: 		if(Toggle){
=======
L__main71:
L__main46:
;Main.c,93 :: 		LED1 = 0;
_LX	
INS	R2, R0, BitPos(LED1+0), 1
_SX	
;Main.c,94 :: 		Toggle = 1;
ORI	R2, R0, 1
SH	R2, Offset(_Toggle+0)(GP)
;Main.c,95 :: 		disable_steps = 0;
SH	R0, Offset(main_disable_steps_L0+0)(GP)
;Main.c,96 :: 		EnStepperX();
JAL	_EnStepperX+0
NOP	
;Main.c,97 :: 		EnStepperY();
JAL	_EnStepperY+0
NOP	
;Main.c,98 :: 		EnStepperZ();
JAL	_EnStepperZ+0
NOP	
;Main.c,99 :: 		EnStepperA();
JAL	_EnStepperA+0
NOP	
;Main.c,100 :: 		cntr = 0;
SH	R0, Offset(main_cntr_L0+0)(GP)
;Main.c,101 :: 		sys.homing = 1;
ORI	R2, R0, 1
SB	R2, Offset(_sys+2)(GP)
;Main.c,102 :: 		sys.homing_cnt = 0;
SB	R0, Offset(_sys+3)(GP)
;Main.c,103 :: 		a = 10;
ORI	R2, R0, 10
SH	R2, Offset(Main_a+0)(GP)
;Main.c,92 :: 		if((!SW1)&&(!Toggle)){
L__main54:
L__main53:
;Main.c,106 :: 		if(Toggle){
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LHU	R2, Offset(_Toggle+0)(GP)
BNE	R2, R0, L__main73
NOP	
J	L_main15
NOP	
<<<<<<< HEAD
L__main59:
;Main.c,84 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
=======
L__main73:
;Main.c,108 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
_LX	
EXT	R2, R2, BitPos(OC5IE_bit+0), 1
BEQ	R2, R0, L__main74
NOP	
J	L__main58
NOP	
L__main74:
_LX	
EXT	R2, R2, BitPos(OC2IE_bit+0), 1
BEQ	R2, R0, L__main75
NOP	
J	L__main57
NOP	
L__main75:
_LX	
EXT	R2, R2, BitPos(OC7IE_bit+0), 1
BEQ	R2, R0, L__main76
NOP	
J	L__main56
NOP	
L__main76:
_LX	
EXT	R2, R2, BitPos(OC3IE_bit+0), 1
BEQ	R2, R0, L__main77
NOP	
J	L__main55
NOP	
<<<<<<< HEAD
L__main63:
L__main33:
;Main.c,85 :: 		sprintf(txt_,"%d",a);
ADDIU	R3, SP, 0
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_1_Main+0)
ORI	R2, R2, lo_addr(?lstr_1_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,86 :: 		UART2_Write_Text("a:= ");
ORI	R30, R0, 97
SB	R30, 9(SP)
ORI	R30, R0, 58
SB	R30, 10(SP)
ORI	R30, R0, 61
SB	R30, 11(SP)
ORI	R30, R0, 32
SB	R30, 12(SP)
MOVZ	R30, R0, R0
SB	R30, 13(SP)
ADDIU	R2, SP, 9
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,87 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,88 :: 		sprintf(txt_,"%d",STPS[X].step_count);
ADDIU	R3, SP, 0
LW	R2, Offset(_STPS+32)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_Main+0)
ORI	R2, R2, lo_addr(?lstr_3_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,89 :: 		UART2_Write_Text(" | step_count[X]:= ");
ADDIU	R23, SP, 14
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr4_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr4_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 14
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,90 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,91 :: 		sprintf(txt_,"%d",sys.axis_dir[X]);
ADDIU	R3, SP, 0
LH	R2, Offset(_sys+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_Main+0)
ORI	R2, R2, lo_addr(?lstr_5_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,92 :: 		UART2_Write_Text(" | axis_dir[X]:= ");
ADDIU	R23, SP, 34
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr6_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr6_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,93 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,94 :: 		sprintf(txt_,"%d",sys.steps_position[X]);
ADDIU	R3, SP, 0
LW	R2, Offset(_sys+16)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_Main+0)
ORI	R2, R2, lo_addr(?lstr_7_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,95 :: 		UART2_Write_Text(" | absX:= ");
ADDIU	R23, SP, 52
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr8_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr8_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 52
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,96 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,97 :: 		sprintf(txt_,"%d",STPS[Y].step_count);
ADDIU	R3, SP, 0
LW	R2, Offset(_STPS+100)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_9_Main+0)
ORI	R2, R2, lo_addr(?lstr_9_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,98 :: 		UART2_Write_Text(" | step_count[Y]:= ");
ADDIU	R23, SP, 63
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr10_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr10_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 63
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,99 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,100 :: 		sprintf(txt_,"%d",sys.axis_dir[Y]);
ADDIU	R3, SP, 0
LH	R2, Offset(_sys+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_11_Main+0)
ORI	R2, R2, lo_addr(?lstr_11_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,101 :: 		UART2_Write_Text(" | axis_dir[Y]:= ");
ADDIU	R23, SP, 83
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr12_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr12_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 83
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,102 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,103 :: 		sprintf(txt_,"%d",sys.steps_position[Y]);
ADDIU	R3, SP, 0
LW	R2, Offset(_sys+20)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_13_Main+0)
ORI	R2, R2, lo_addr(?lstr_13_Main+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Main.c,104 :: 		UART2_Write_Text(" | absY:= ");
ADDIU	R23, SP, 101
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr14_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr14_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 101
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,105 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Main.c,106 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Main.c,108 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,109 :: 		a++;
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,110 :: 		if(a > 8)a=0;
=======
L__main77:
L__main45:
;Main.c,109 :: 		Temp_Move(a);
LHU	R25, Offset(Main_a+0)(GP)
JAL	_Temp_Move+0
NOP	
;Main.c,110 :: 		a++;
LHU	R2, Offset(Main_a+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Main_a+0)(GP)
;Main.c,111 :: 		if(a > 12)a=10;
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
ANDI	R2, R2, 65535
SLTIU	R2, R2, 13
BEQ	R2, R0, L__main78
NOP	
J	L_main19
NOP	
L__main78:
ORI	R2, R0, 10
SH	R2, Offset(Main_a+0)(GP)
L_main19:
<<<<<<< HEAD
;Main.c,84 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__main46:
L__main45:
L__main44:
L__main43:
;Main.c,113 :: 		}
L_main15:
;Main.c,115 :: 		}
J	L_main0
NOP	
;Main.c,116 :: 		}
=======
;Main.c,108 :: 		if((!OC5IE_bit && !OC2IE_bit && !OC7IE_bit && !OC3IE_bit)){
L__main58:
L__main57:
L__main56:
L__main55:
;Main.c,116 :: 		if((Limits.X_Limit_Min)&&(sys.homing == 1)){
LBU	R2, Offset(_Limits+0)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__main80
NOP	
J	L__main60
NOP	
L__main80:
LB	R3, Offset(_sys+2)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main81
NOP	
J	L__main59
NOP	
L__main81:
L__main44:
;Main.c,118 :: 		StopX();
JAL	_StopX+0
NOP	
;Main.c,119 :: 		Delay_ms(200);
LUI	R24, 203
ORI	R24, R24, 29524
L_main23:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main23
NOP	
NOP	
NOP	
;Main.c,116 :: 		if((Limits.X_Limit_Min)&&(sys.homing == 1)){
L__main60:
L__main59:
;Main.c,123 :: 		cntr++;
LH	R2, Offset(main_cntr_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(main_cntr_L0+0)(GP)
;Main.c,124 :: 		if(cntr > 10000){
SEH	R2, R2
SLTI	R2, R2, 10001
BEQ	R2, R0, L__main82
NOP	
J	L_main25
NOP	
L__main82:
;Main.c,126 :: 		dma_printf("a:=%d:%l:%d:abs:=%l \r\n",
ADDIU	R23, SP, 0
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr1_Main+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Main+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 0
;Main.c,128 :: 		STPS[X].steps_position);
LW	R2, Offset(_STPS+68)(GP)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
;Main.c,127 :: 		a,STPS[X].step_count,STPS[X].axis_dir,
LH	R2, Offset(_STPS+84)(GP)
SH	R2, 12(SP)
LW	R2, Offset(_STPS+32)(GP)
SW	R2, 8(SP)
LHU	R2, Offset(Main_a+0)(GP)
SH	R2, 4(SP)
;Main.c,126 :: 		dma_printf("a:=%d:%l:%d:abs:=%l \r\n",
SW	R3, 0(SP)
;Main.c,128 :: 		STPS[X].steps_position);
JAL	_dma_printf+0
NOP	
ADDIU	SP, SP, 20
;Main.c,139 :: 		cntr = 0;
SH	R0, Offset(main_cntr_L0+0)(GP)
;Main.c,140 :: 		}
L_main25:
;Main.c,142 :: 		}
L_main15:
;Main.c,144 :: 		Debounce_X_Limits();
JAL	_Debounce_X_Limits+0
NOP	
;Main.c,145 :: 		Debounce_Y_Limits();
JAL	_Debounce_Y_Limits+0
NOP	
;Main.c,146 :: 		}
J	L_main0
NOP	
;Main.c,147 :: 		}
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Temp_Move:
<<<<<<< HEAD
;Main.c,119 :: 		void Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,121 :: 		switch(a){
=======
;Main.c,150 :: 		void Temp_Move(int a){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Main.c,152 :: 		switch(a){
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Temp_Move26
NOP	
<<<<<<< HEAD
;Main.c,122 :: 		case 0:
L_Temp_Move22:
;Main.c,123 :: 		STPS[X].mmToTravel = belt_steps(-50.00);//calcSteps(-125.25,8.06);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,124 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,125 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,126 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,127 :: 		case 2:
L_Temp_Move23:
;Main.c,128 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,129 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,130 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,131 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,132 :: 		case 1:
L_Temp_Move24:
;Main.c,133 :: 		STPS[Y].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,134 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,135 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,136 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,137 :: 		case 3:
L_Temp_Move25:
;Main.c,138 :: 		STPS[Y].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,139 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,140 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+132)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,141 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,142 :: 		case 4:
L_Temp_Move26:
;Main.c,143 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,145 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,146 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,147 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,148 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,149 :: 		case 5:
L_Temp_Move27:
;Main.c,150 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,152 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+132)(GP)
;Main.c,153 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,154 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+132)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,155 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,156 :: 		case 6:
L_Temp_Move28:
;Main.c,157 :: 		STPS[X].mmToTravel = belt_steps(-150.00);
LUI	R2, 49942
=======
;Main.c,153 :: 		case 0:
L_Temp_Move28:
;Main.c,154 :: 		STPS[X].mmToTravel = belt_steps(50.00);//calcSteps(-125.25,8.06);
LUI	R2, 16968
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,158 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,159 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
=======
;Main.c,156 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,157 :: 		break;
J	L_Temp_Move27
NOP	
;Main.c,158 :: 		case 1:
L_Temp_Move29:
;Main.c,159 :: 		STPS[Y].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,160 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,161 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+152)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,162 :: 		break;
J	L_Temp_Move27
NOP	
;Main.c,163 :: 		case 2:
L_Temp_Move30:
;Main.c,164 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,165 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,166 :: 		SingleAxisStep(STPS[X].mmToTravel,X);
MOVZ	R26, R0, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,167 :: 		break;
J	L_Temp_Move27
NOP	
;Main.c,168 :: 		case 3:
L_Temp_Move31:
;Main.c,169 :: 		STPS[Y].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,170 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,171 :: 		SingleAxisStep(STPS[Y].mmToTravel,Y);
ORI	R26, R0, 1
LW	R25, Offset(_STPS+152)(GP)
JAL	_SingleAxisStep+0
NOP	
;Main.c,172 :: 		break;
J	L_Temp_Move27
NOP	
;Main.c,173 :: 		case 4:
L_Temp_Move32:
;Main.c,174 :: 		STPS[X].mmToTravel = belt_steps(50.00);
LUI	R2, 16968
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,176 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LUI	R2, 17096
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
<<<<<<< HEAD
SW	R2, Offset(_STPS+132)(GP)
;Main.c,161 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
=======
SW	R2, Offset(_STPS+152)(GP)
;Main.c,177 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,178 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+152)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,162 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,163 :: 		case 7:
L_Temp_Move29:
;Main.c,164 :: 		STPS[X].mmToTravel = belt_steps(150.00);
=======
;Main.c,179 :: 		break;
J	L_Temp_Move27
NOP	
;Main.c,180 :: 		case 5:
L_Temp_Move33:
;Main.c,181 :: 		STPS[X].mmToTravel = belt_steps(-50.00);
LUI	R2, 49736
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,183 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,184 :: 		speed_cntr_Move(STPS[Y].mmToTravel, 8000,Y);
ORI	R27, R0, 1
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,185 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
LW	R26, Offset(_STPS+152)(GP)
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,186 :: 		break;
J	L_Temp_Move27
NOP	
;Main.c,187 :: 		case 6:
L_Temp_Move34:
;Main.c,188 :: 		STPS[X].mmToTravel = belt_steps(150.00);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
<<<<<<< HEAD
;Main.c,165 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
=======
;Main.c,189 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,166 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
=======
;Main.c,190 :: 		STPS[Y].mmToTravel = belt_steps(100.00);
LUI	R2, 17096
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
<<<<<<< HEAD
SW	R2, Offset(_STPS+132)(GP)
;Main.c,168 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
=======
SW	R2, Offset(_STPS+152)(GP)
;Main.c,192 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,169 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,170 :: 		case 8:
L_Temp_Move30:
;Main.c,171 :: 		STPS[A].mmToTravel = belt_steps(150.00);
=======
;Main.c,193 :: 		break;
J	L_Temp_Move27
NOP	
;Main.c,194 :: 		case 7:
L_Temp_Move35:
;Main.c,195 :: 		STPS[X].mmToTravel = belt_steps(-150.00);
LUI	R2, 49942
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+64)(GP)
;Main.c,196 :: 		speed_cntr_Move(STPS[X].mmToTravel, 8000,X);
MOVZ	R27, R0, R0
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
;Main.c,197 :: 		STPS[Y].mmToTravel = belt_steps(-100.00);
LUI	R2, 49864
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
SW	R2, Offset(_STPS+152)(GP)
;Main.c,199 :: 		DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
MOVZ	R27, R0, R0
MOVZ	R26, R2, R0
LW	R25, Offset(_STPS+64)(GP)
JAL	_DualAxisStep+0
NOP	
;Main.c,200 :: 		break;
J	L_Temp_Move27
NOP	
;Main.c,201 :: 		case 8:
L_Temp_Move36:
;Main.c,202 :: 		STPS[A].mmToTravel = belt_steps(150.00);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LUI	R2, 17174
ORI	R2, R2, 0
MTC1	R2, S12
JAL	_belt_steps+0
NOP	
<<<<<<< HEAD
SW	R2, Offset(_STPS+268)(GP)
;Main.c,172 :: 		speed_cntr_Move(STPS[A].mmToTravel, 15000,A);
=======
SW	R2, Offset(_STPS+328)(GP)
;Main.c,203 :: 		speed_cntr_Move(STPS[A].mmToTravel, 8000,A);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
ORI	R27, R0, 3
ORI	R26, R0, 8000
MOVZ	R25, R2, R0
JAL	_speed_cntr_Move+0
NOP	
<<<<<<< HEAD
;Main.c,173 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
=======
;Main.c,212 :: 		SingleAxisStep(STPS[A].mmToTravel,A);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
ORI	R26, R0, 3
LW	R25, Offset(_STPS+328)(GP)
JAL	_SingleAxisStep+0
NOP	
<<<<<<< HEAD
;Main.c,174 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,175 :: 		case 9:
L_Temp_Move31:
;Main.c,177 :: 		r_or_ijk(-50.00, 50.00, -150.00, 150.00, 0.00, -50.00, 50.00,1.0, 0.00);
=======
;Main.c,213 :: 		break;
J	L_Temp_Move27
NOP	
;Main.c,214 :: 		case 9:
L_Temp_Move37:
;Main.c,218 :: 		r_or_ijk(-50.00, 50.00, -150.00, 150.00, 0.00, -50.00, 50.00,0.00,X,Y,CW);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LUI	R5, 17174
ORI	R5, R5, 0
LUI	R4, 49942
ORI	R4, R4, 0
LUI	R3, 16968
ORI	R3, R3, 0
LUI	R2, 49736
ORI	R2, R2, 0
MOVZ	R27, R0, R0
ORI	R26, R0, 1
MOVZ	R25, R0, R0
MTC1	R5, S15
MTC1	R4, S14
MTC1	R3, S13
MTC1	R2, S12
ADDIU	SP, SP, -16
SWC1	S0, 12(SP)
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
;Main.c,178 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,179 :: 		default: a = 0;
L_Temp_Move32:
MOVZ	R25, R0, R0
;Main.c,180 :: 		break;
J	L_Temp_Move21
NOP	
;Main.c,181 :: 		}
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
=======
;Main.c,219 :: 		break;
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
J	L_Temp_Move27
NOP	
;Main.c,220 :: 		case 10://Homing X axis
L_Temp_Move38:
;Main.c,221 :: 		Home_Axis(-300.00,500,X);
LUI	R2, 50070
ORI	R2, R2, 0
MOVZ	R26, R0, R0
ORI	R25, R0, 500
MTC1	R2, S12
JAL	_Home_Axis+0
NOP	
;Main.c,222 :: 		break;
J	L_Temp_Move27
NOP	
;Main.c,223 :: 		case 11://Homing Y axis
L_Temp_Move39:
;Main.c,224 :: 		Inv_Home_Axis(10.00,100,X);
LUI	R2, 16672
ORI	R2, R2, 0
MOVZ	R26, R0, R0
ORI	R25, R0, 100
MTC1	R2, S12
JAL	_Inv_Home_Axis+0
NOP	
;Main.c,225 :: 		Delay_ms(1000);
LUI	R24, 1017
ORI	R24, R24, 16554
L_Temp_Move40:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Temp_Move40
NOP	
;Main.c,226 :: 		sys.homing = 1;
ORI	R2, R0, 1
SB	R2, Offset(_sys+2)(GP)
;Main.c,227 :: 		break;
J	L_Temp_Move27
NOP	
;Main.c,228 :: 		case 12://Homing Y axis
L_Temp_Move42:
;Main.c,230 :: 		break;
J	L_Temp_Move27
NOP	
;Main.c,231 :: 		default: a = 0;
L_Temp_Move43:
MOVZ	R25, R0, R0
;Main.c,232 :: 		break;
J	L_Temp_Move27
NOP	
;Main.c,233 :: 		}
L_Temp_Move26:
SEH	R2, R25
BNE	R2, R0, L__Temp_Move86
NOP	
J	L_Temp_Move28
NOP	
L__Temp_Move86:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__Temp_Move88
NOP	
J	L_Temp_Move29
NOP	
L__Temp_Move88:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__Temp_Move90
NOP	
J	L_Temp_Move30
NOP	
L__Temp_Move90:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__Temp_Move92
NOP	
J	L_Temp_Move31
NOP	
L__Temp_Move92:
SEH	R3, R25
ORI	R2, R0, 4
BNE	R3, R2, L__Temp_Move94
NOP	
J	L_Temp_Move32
NOP	
<<<<<<< HEAD
L_Temp_Move21:
;Main.c,182 :: 		}
=======
L__Temp_Move94:
SEH	R3, R25
ORI	R2, R0, 5
BNE	R3, R2, L__Temp_Move96
NOP	
J	L_Temp_Move33
NOP	
L__Temp_Move96:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__Temp_Move98
NOP	
J	L_Temp_Move34
NOP	
L__Temp_Move98:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Temp_Move100
NOP	
J	L_Temp_Move35
NOP	
L__Temp_Move100:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Temp_Move102
NOP	
J	L_Temp_Move36
NOP	
L__Temp_Move102:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Temp_Move104
NOP	
J	L_Temp_Move37
NOP	
L__Temp_Move104:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Temp_Move106
NOP	
J	L_Temp_Move38
NOP	
L__Temp_Move106:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Temp_Move108
NOP	
J	L_Temp_Move39
NOP	
L__Temp_Move108:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Temp_Move110
NOP	
J	L_Temp_Move42
NOP	
L__Temp_Move110:
J	L_Temp_Move43
NOP	
L_Temp_Move27:
;Main.c,234 :: 		}
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
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
;Main.c,184 :: 		void LCD_Display(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Main.c,189 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
=======
;Main.c,236 :: 		void LCD_Display(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Main.c,241 :: 		sprintf(txt,"%d",STPS[0].accel_lim);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
LW	R2, Offset(_STPS+48)(GP)
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
;Main.c,190 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
=======
;Main.c,242 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,192 :: 		sprintf(txt,"%d",STPS[0].decel_start);
=======
;Main.c,244 :: 		sprintf(txt,"%d",STPS[0].decel_start);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LW	R2, Offset(_STPS+12)(GP)
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
;Main.c,193 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
=======
;Main.c,245 :: 		I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,197 :: 		sprintf(txt,"%d",STPS[0].step_delay);
=======
;Main.c,249 :: 		sprintf(txt,"%d",STPS[0].step_delay);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LW	R2, Offset(_STPS+8)(GP)
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
;Main.c,198 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
=======
;Main.c,250 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,200 :: 		sprintf(txt,"%d",STPS[0].min_delay);
=======
;Main.c,252 :: 		sprintf(txt,"%d",STPS[0].min_delay);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LW	R2, Offset(_STPS+20)(GP)
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
;Main.c,201 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
=======
;Main.c,253 :: 		I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 2
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,205 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
=======
;Main.c,257 :: 		sprintf(txt,"%d",STPS[0].max_step_lim);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LW	R2, Offset(_STPS+52)(GP)
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
;Main.c,206 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
=======
;Main.c,258 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,208 :: 		sprintf(txt,"%d",STPS[0].decel_val);
=======
;Main.c,260 :: 		sprintf(txt,"%d",STPS[0].decel_val);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LW	R2, Offset(_STPS+16)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_Main+0)
ORI	R2, R2, lo_addr(?lstr_7_Main+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt+0)
ORI	R2, R2, lo_addr(_txt+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;Main.c,209 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
=======
;Main.c,261 :: 		I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 11
ORI	R26, R0, 3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
<<<<<<< HEAD
;Main.c,210 :: 		}
=======
;Main.c,262 :: 		}
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
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
