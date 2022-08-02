#line 1 "C:/Users/GIT/Pic32mzCNC/Config.c"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/packages/i2c_lcd/uses/i2c_lcd.h"
<<<<<<< HEAD
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 62 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/packages/i2c_lcd/uses/i2c_lcd.h"
=======
#line 41 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/packages/i2c_lcd/uses/i2c_lcd.h"
extern int I2CUnit;
#line 60 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/packages/i2c_lcd/uses/i2c_lcd.h"
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
typedef enum{
 _LCD_FIRST_ROW = 1,
 _LCD_SECOND_ROW,
 _LCD_THIRD_ROW,
 _LCD_FOURTH_ROW,
 _LCD_CLEAR,
 _LCD_RETURN_HOME,
 _LCD_CURSOR_OFF,
 _LCD_UNDERLINE_ON,
 _LCD_BLINK_CURSOR_ON,
 _LCD_MOVE_CURSOR_LEFT,
 _LCD_MOVE_CURSOR_RIGHT,
 _LCD_TURN_ON,
 _LCD_TURN_OFF,
 _LCD_SHIFT_LEFT,
 _LCD_SHIFT_RIGHT,
 _LCD_INCREMENT_NO_SHIFT
}Cmd_Type;
extern Cmd_Type Cmd;


typedef enum{
 I2C1 = 1,
 I2C2,
 I2C3,
 I2C4,
 I2C5,
 I2C6
}I2C_Type;
extern I2C_Type I2C_No;


  unsigned char  I2C_PCF8574_Write( unsigned char  addr, unsigned char  Data );
 void I2C_LCD_putcmd( unsigned char  addr,  unsigned char  dta, unsigned char  cmdtype);
 void I2C_LCD_goto( unsigned char  addr, unsigned char  row,  unsigned char  col);
 void I2C_Lcd_Cmd( unsigned char  addr,Cmd_Type cmd, unsigned char  col);
 void I2C_LCD_putch( unsigned char  addr,  unsigned char  dta);
 void I2C_LCD_Out( unsigned char  addr,  unsigned char  row,  unsigned char  col,  unsigned char  *s);
 void I2C_Lcd_Chr( unsigned char  addr,  unsigned char  row,  unsigned char  col,  unsigned char  out_char);
 void I2C_LCD_init( unsigned char  addr);
<<<<<<< HEAD
 void I2C_LCD_init4l( unsigned char  addr);
 void I2C_Pins(char i2c_pins);
#line 1 "c:/users/git/pic32mzcnc/stepper.h"








extern sfr EN_StepX;
extern sfr EN_Step_PinDirX;
extern sfr RST_StepX;
extern sfr RST_Step_PinDirX;
extern sfr SLP_FLT_StepX;
extern sfr SLP_FLT_Step_PinDirX;
extern sfr PLS_StepX;
extern sfr PLS_Step_PinDirX;
extern sfr DIR_StepX;
extern sfr DIR_Step_PinDirX;
extern sfr FLT_StepX;
extern sfr FLT_Step_PinDirX;

extern sfr EN_StepY;
extern sfr EN_Step_PinDirY;
extern sfr RST_StepY;
extern sfr RST_Step_PinDirY;
extern sfr SLP_FLT_StepY;
extern sfr SLP_FLT_Step_PinDirY;
extern sfr PLS_StepY;
extern sfr PLS_Step_PinDirY;
extern sfr DIR_StepY;
extern sfr DIR_Step_PinDirY;
extern sfr FLT_StepY;
extern sfr FLT_Step_PinDirY;



typedef unsigned short UInt8_t;
#line 74 "c:/users/git/pic32mzcnc/stepper.h"
extern unsigned int Toggle;



typedef struct genVars{
 UInt8_t running: 1;
 UInt8_t startPulses: 1;
 int Tog;
 int AxisNo;
 long i;
 long dx;
 long dy;
 long px;
 long py;
 long over;
 long acc;
 long dec;
 int dirx;
 int diry;

}sVars;
extern sVars SV;

typedef struct STPT {

 long uSec;

 int axisTosample;

 int howManyOCxRunning;

 int compOCxRunning;
}StepTmr;
extern StepTmr STmr;

typedef struct Steps{

 signed long microSec;

 unsigned short CheckStep: 1;

 unsigned short PLS_Step_ : 1;

 unsigned short StepBits: 1;

 unsigned short stopAxis: 1;

 unsigned char run_state ;

 long step_delay;

 long decel_start;

 long decel_val;

 long min_delay;

 long accel_count;
 long deccl_count;

 long step_count;

 long new_step_delay;

 long last_accel_delay;

 long accel_lim;

 long max_step_lim;

 long rest;

 long StartUp_delay;

 signed long mmToTravel;
}STP;
extern STP STPS[ 2 ];

enum xyz{X,Y,Z};
enum swt{FALSE,TRUE};








void SetPinMode();
void CycleStart();
void CycleStop();
void EnStepper();
void DisableStepper();
void speed_cntr_Move(long mmSteps, long speed, int axix_No);
void speed_cntr_Init_Timer1(void);
static unsigned long sqrt_(unsigned long v);
unsigned int min_(unsigned long x, unsigned long y);
void Step(long newx,long newy);
int Pulse(int axis_No);
void CalcDly(int axis_No);
void StepperConstants(long accel,long decel);
void toggleOCx(int axis_No);
void AccDec(int axix_No);
#line 1 "c:/users/git/pic32mzcnc/steptodistance.h"







const float Dia;
#line 20 "c:/users/git/pic32mzcnc/steptodistance.h"
signed long calcSteps( double mmsToMove, double Dia);
#line 12 "c:/users/git/pic32mzcnc/config.h"
extern unsigned char LCD_01_ADDRESS;
extern bit oneShotA; sfr;
extern bit oneShotB; sfr;




struct Timer{
unsigned int uSec;
unsigned int uMs;
unsigned int uSSec;
unsigned int OlduSSec;
unsigned int mSec;
unsigned short Sec;
unsigned short OldSec;
};
extern struct Timer TMR;


void PinMode();
void UartConfig();
void set_performance_mode();
void Uart2InterruptSetup();
void InitTimer6();
void InitTimer7();
void InitTimer8();
void LcdI2CConfig();
void OutPutPulseXYZ();
void initDMA_global();
void initDMA0();
void initDMA1();
#line 3 "C:/Users/Git/Pic32mzCNC/Config.c"
=======
 void I2C_LCD_init4l( unsigned char  addr,I2C_Type I2C_No);
 void I2CNo_Init(I2C_Type I2C_No);
#line 4 "C:/Users/GIT/Pic32mzCNC/Config.c"
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
void PinMode(){

 SYSKEY = 0xAA996655;
 SYSKEY = 0x556699AA;
 CFGCONbits.OCACLK = 1;
 SYSKEY = 0x33333333;

 JTAGEN_bit = 0;
 Delay_ms(100);


 ANSELA = 0X0000;
 ANSELB = 0X0000;
 ANSELC = 0X0000;
 ANSELD = 0X0000;
 ANSELE = 0X0000;
 ANSELG = 0X0000;

 CNPUB = 0x0000;


 TRISA9_bit = 0;
 TRISD4_bit = 0;
 TRISE7_bit = 0;
 TRISF0_bit = 0;
 TRISF1_bit = 0;
 TRISG0_bit = 0;
 TRISG1_bit = 0;
 TRISG14_bit = 0;
 TRISG15_bit = 0;


 TRISB0_bit = 1;
 TRISC3_bit = 1;
 TRISG7_bit = 1;
 TRISG8_bit = 1;



 Unlock_IOLOCK();
 PPS_Mapping_NoLock(_RPE8, _OUTPUT, _U2TX);
 PPS_Mapping_NoLock(_RPE9, _INPUT, _U2RX);
 PPS_Mapping_NoLock(_RPB9, _OUTPUT, _NULL);
 PPS_Mapping_NoLock(_RPB10, _OUTPUT, _NULL);
 PPS_Mapping_NoLock(_RPF1, _OUTPUT, _OC3);
 PPS_Mapping_NoLock(_RPD4, _OUTPUT, _OC5);
 PPS_Mapping_NoLock(_RPE3, _OUTPUT, _OC8);
 PPS_Mapping_NoLock(_RPG9, _OUTPUT, _OC9);
 Lock_IOLOCK();



 UartConfig();



 set_performance_mode();



 Uart2InterruptSetup();




 InitTimer7();
 InitTimer8();


 LcdI2CConfig();



 initDMA_global();
 initDMA0();
 initDMA1();



 OutPutPulseXYZ();

}

void UartConfig(){


 UART2_Init_Advanced(256000, 50000 , _UART_LOW_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);
 UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);
 Delay_ms(100);
}



void Uart2InterruptSetup(){
 URXISEL0_bit = 0;
 URXISEL1_bit = 1;
 IEC4.B18 = 1;

 U2RXIP0_bit = 1;
 U2RXIP1_bit = 1;
 U2RXIP2_bit = 1;

 URXISEL1_U2STA_bit = 0;
 U2RXIF_bit = 0;
}

void set_performance_mode(){
unsigned long cp0;


 DI();


 SYSKEY = 0xAA996655;
 SYSKEY = 0x556699AA;


 PB1DIVbits.PBDIV = 1;


 UEN0_bit = 1;
 UEN1_bit = 1;
 PB2DIVbits.ON = 1;
 while(!PB2DIVbits.PBDIVRDY);
 PB2DIVbits.PBDIV = 0x07;


 PB3DIVbits.ON = 1;
 while(!PB3DIVbits.PBDIVRDY);
 PB3DIVbits.PBDIV = 3;


 PB4DIVbits.ON = 1;
 while (!PB4DIVbits.PBDIVRDY);
 PB4DIVbits.PBDIV = 0;


 PB5DIVbits.ON = 1;
 while(!PB5DIVbits.PBDIVRDY);
 PB5DIVbits.PBDIV = 1;


 PB7DIVbits.ON = 1;
 while(!PB7DIVbits.PBDIVRDY);
 PB7DIVbits.PBDIV = 0;


 PB8DIVbits.ON = 1;
 while(!PB8DIVbits.PBDIVRDY);
 PB8DIVbits.PBDIV = 1;


 PRECONbits.PFMSECEN = 0;
 PRECONbits.PREFEN = 0b11;
 PRECONbits.PFMWS = 0b100;
<<<<<<< HEAD



 cp0 = CP0_GET(CP0_CONFIG);
 cp0 &= ~0x07;
 cp0 |= 0b011;
 CP0_SET(CP0_CONFIG,cp0);


=======
#line 166 "C:/Users/GIT/Pic32mzCNC/Config.c"
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
 SYSKEY = 0x33333333;


 PREFEN0_bit = 1;
 PREFEN1_bit = 1;
 PFMWS0_bit = 0;
 PFMWS1_bit = 1;
 PFMWS2_bit = 0;
}


void OutPutPulseXYZ(){
<<<<<<< HEAD
#line 181 "C:/Users/Git/Pic32mzCNC/Config.c"
=======
#line 176 "C:/Users/GIT/Pic32mzCNC/Config.c"
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
 OC3CON = 0x0000;
 OC5CON = 0x0000;
 OC8CON = 0X0000;

 T2CON = 0x0000;
 T4CON = 0x0000;
 T6CON = 0x0000;

 T2CON = 0x0060;
 T4CON = 0x0060;
 T6CON = 0x0060;


 PR2 = 0xFFFF;
 PR4 = 0xFFFF;
 PR6 = 0xFFFF;


 OC3CON = 0x0004;
 OC5CON = 0x0004;
<<<<<<< HEAD
#line 207 "C:/Users/Git/Pic32mzCNC/Config.c"
=======
 OC8CON = 0x0004;
#line 205 "C:/Users/GIT/Pic32mzCNC/Config.c"
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
 OC3R = 0x5;
 OC3RS = 0x234;
 OC5R = 0x5;
 OC5RS = 0x234;
 OC8R = 0x5;
 OC8RS = 0x234;


 OC3IP0_bit = 1;
 OC3IP1_bit = 1;
 OC3IP2_bit = 0;
 OC3IS0_bit = 0;
 OC3IS1_bit = 0;
 OC3IF_bit = 0;
 OC3IE_bit = 1;

 OC5IP0_bit = 1;
 OC5IP1_bit = 1;
 OC5IP2_bit = 0;
 OC5IS0_bit = 1;
 OC5IS1_bit = 0;
 OC5IF_bit = 0;
 OC5IE_bit = 1;

 OC8IP0_bit = 1;
 OC8IP1_bit = 1;
 OC8IP2_bit = 0;
 OC8IS0_bit = 1;
 OC8IS1_bit = 0;
 OC8IF_bit = 0;
 OC8IE_bit = 1;


 T2CONSET = 0x8000;
 T4CONSET = 0x8000;
 T6CONSET = 0x8000;





}




void InitTimer1(){
 T1CON = 0x8000;
 T1IP0_bit = 1;
 T1IP1_bit = 1;
 T1IP2_bit = 1;
 T1IF_bit = 0;
 T1IE_bit = 1;
 PR1 = 100;
 TMR1 = 0;
}
#line 279 "C:/Users/GIT/Pic32mzCNC/Config.c"
void InitTimer7(){
 T7CON = 0x8000;
 T7IP0_bit = 0;
 T7IP1_bit = 0;
 T7IP2_bit = 1;
 T7IS0_bit = 1;
 T7IS1_bit = 1;
 T7IF_bit = 0;
 T7IE_bit = 0;
 PR7 = 50000;
 TMR7 = 0;
}


void InitTimer8(){
 T8CON = 0x8000;
 T8IP0_bit = 0;
 T8IP1_bit = 0;
 T8IP2_bit = 1;
 T8IS0_bit = 0;
 T8IS1_bit = 1;
 T8IF_bit = 0;
 T8IE_bit = 0;
 PR8 = 50;
 TMR8 = 0;
}

void LcdI2CConfig(){

<<<<<<< HEAD

=======
 I2CNo_Init(I2C4);
>>>>>>> e5fb2513a44ab744a2e9f52d68d0cb6b15e785c8
 I2C4_Init_Advanced(50000, 100000);
 I2C_Set_Active(&I2C4_Start, &I2C4_Restart, &I2C4_Read, &I2C4_Write,
 &I2C4_Stop,&I2C4_Is_Idle);
 Delay_ms(100);
 I2C_LCD_init(LCD_01_ADDRESS,4);
 Delay_ms(100);
 I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_FIRST_ROW,1);
 I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CURSOR_OFF,1);
 I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CLEAR,1);
}



void initDMA_global(){
 DMACON = 1<<16;
 DCH0CON = 0x03;
}


void initDMA0(){
 DMACONbits.ON = 1;
 DCH0CONbits.CHAEN = 1;
 DCH0CONbits.CHPATLEN = 0;
 DMA0IE_bit = 0;
 DMA0IF_bit = 0;

 DCH0ECON =(146 << 8 ) | 0x30;
 DCH0DAT = 0x0D;

 DCH0SSA = KVA_TO_PA(0xBF822230);
 DCH0DSA = KVA_TO_PA(0xA0002000);

 DCH0SSIZ = 200 ;
 DCH0DSIZ = 200 ;
 DCH0CSIZ = 200 ;

 DCH0INTCLR = 0x00FF00FF ;
 CHBCIE_bit = 1 ;
 CHERIE_bit = 1 ;



 IPC33CLR = 0x0000001F ;
 DMA0IP2_bit = 1 ;
 DMA0IP1_bit = 0 ;
 DMA0IP0_bit = 1 ;
 DMA0IS1_bit = 1 ;
 DMA0IS0_bit = 1 ;

 DMA0IE_bit = 1 ;
 CHEN_bit = 1 ;

}


void initDMA1(){

 DMA1IE_bit = 0 ;
 DMA1IF_bit = 0 ;
 DCH1CONbits.CHPATLEN = 0;
 DCH1ECON=(147 << 8)| 0x30;
 DCH1SSA = KVA_TO_PA(0xA0002200) ;
 DCH1DSA = KVA_TO_PA(0xBF822220) ;
 DCH1DAT = 0x0D;

 DCH1SSIZ = 200 ;

 DCH1DSIZ = 1 ;

 DCH1CSIZ = 200 ;

 DCH1INTCLR = 0x00FF00FF ;
 CHBCIE_DCH1INT_bit = 1 ;
 CHERIE_DCH1INT_bit = 1 ;

 DMA1IP2_bit = 1 ;
 DMA1IP1_bit = 0 ;
 DMA1IP0_bit = 1 ;
 DMA1IS1_bit = 0 ;
 DMA1IS0_bit = 1 ;
 DMA1IE_bit = 1 ;
}
