#line 1 "C:/Users/Git/Pic32mzCNC/Timers.c"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/packages/i2c_lcd/uses/i2c_lcd.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 62 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/packages/i2c_lcd/uses/i2c_lcd.h"
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



  unsigned char  I2C_PCF8574_Write( unsigned char  addr, unsigned char  Data);
 void I2C_LCD_putcmd( unsigned char  addr,  unsigned char  dta, unsigned char  cmdtype);
 void I2C_LCD_goto( unsigned char  addr, unsigned char  row,  unsigned char  col);
 void I2C_Lcd_Cmd( unsigned char  addr,Cmd_Type cmd, unsigned char  col);
 void I2C_LCD_putch( unsigned char  addr,  unsigned char  dta);
 void I2C_LCD_Out( unsigned char  addr,  unsigned char  row,  unsigned char  col,  unsigned char  *s);
 void I2C_Lcd_Chr( unsigned char  addr,  unsigned char  row,  unsigned char  col,  unsigned char  out_char);
 void I2C_LCD_init( unsigned char  addr);
 void I2C_LCD_init4l( unsigned char  addr);
 void I2C_Pins(char i2c_pins);
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 14 "c:/users/git/pic32mzcnc/stepper.h"
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

extern sfr EN_StepZ;
extern sfr EN_Step_PinDirZ;
extern sfr RST_StepZ;
extern sfr RST_Step_PinDirZ;
extern sfr SLP_FLT_StepZ;
extern sfr SLP_FLT_Step_PinDirZ;
extern sfr PLS_StepZ;
extern sfr PLS_Step_PinDirZ;
extern sfr DIR_StepZ;
extern sfr DIR_Step_PinDirZ;
extern sfr FLT_StepZ;
extern sfr FLT_Step_PinDirZ;

extern sfr EN_StepA;
extern sfr EN_Step_PinDirA;
extern sfr RST_StepA;
extern sfr RST_Step_PinDirA;
extern sfr SLP_FLT_StepA;
extern sfr SLP_FLT_Step_PinDirA;
extern sfr PLS_StepA;
extern sfr PLS_Step_PinDirA;
extern sfr DIR_StepA;
extern sfr DIR_Step_PinDirA;
extern sfr FLT_StepA;
extern sfr FLT_Step_PinDirA;



typedef unsigned short UInt8_t;
#line 116 "c:/users/git/pic32mzcnc/stepper.h"
extern unsigned int Toggle;



typedef struct genVars{
 char Single_Dual: 1;
 UInt8_t running: 1;
 UInt8_t startPulses: 1;
 int Tog;
 int AxisNo;
 long i;
 long d2;
 long dx;
 long dy;
 long dz;
 long da;
 long px;
 long py;
 long pz;
 long pa;
 long psingle;
 long over;
 long acc;
 long dec;
 int dirx;
 int diry;
 int dirz;
 int dira;
 int dirb;
 int dirc;
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

 long dist;

 long new_step_delay;

 long last_accel_delay;

 long accel_lim;

 long max_step_lim;

 long rest;

 long StartUp_delay;

 signed long mmToTravel;
}STP;
extern STP STPS[ 6 ];



typedef struct{
float deg;
float degreeDeg;
float degreeRadians;
float deg_A;
float deg_B;
float divisor;
float newdeg_;
float I;
float J;
float N;
float radius;
int dir;
int quadrant_start;
float xRad;
float yRad;
float xStart;
float yStart;
float xFin;
float yFin;
}Circle;
extern Circle Circ;



enum xyz{X,Y,Z,A,B,C};
typedef enum {xy,xz,yz,xa,ya,za}axis_combination ;
enum swt{FALSE,TRUE};








void SetPinMode();
void CycleStart();
void CycleStop();
void EnStepperX();
void EnStepperY();
void EnStepperZ();
void EnStepperA();
void DisableStepper();
void disableOCx();


void speed_cntr_Move(long mmSteps, long speed, int axis_combo);
void speed_cntr_Init_Timer1(void);
static unsigned long sqrt_(unsigned long v);
unsigned int min_(unsigned long x, unsigned long y);
void CalcDly(int axis_No);
void StepperConstants(long accel,long decel);


void DualAxisStep(long newx,long newy,int axis_combo);
void SingleAxisStep(long newxyz,int axis_No);

void SingleStepX();
void SingleStepY();
void SingleStepZ();
void SingleStepA();

void XY_Interpolate();
void XZ_Interpolate();
void YZ_Interpolate();
void XA_Interpolate();
void YA_Interpolate();
void ZA_Interpolate();

void StopX();
void StopY();
void StopZ();
void StopA();


void CalcRadius(Circle* cir);
int QuadrantStart(float i,float j);
void CircDir(Circle* cir);


int Pulse(int axis_No);
void toggleOCx(int axis_No);
void AccDec(int axis_No);
void Step_Cycle(int axis_No);
void Axis_Enable(axis_combination axis);
#line 1 "c:/users/git/pic32mzcnc/steptodistance.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 11 "c:/users/git/pic32mzcnc/steptodistance.h"
const float Dia;
#line 23 "c:/users/git/pic32mzcnc/steptodistance.h"
signed long calcSteps( double mmsToMove, double Dia);
#line 14 "c:/users/git/pic32mzcnc/config.h"
extern sfr LED1;
extern sfr LED1_Dir;
extern sfr LED2;
extern sfr LED2_Dir;



extern sfr SW1;
extern sfr SW1_Dir;
extern sfr SW2;
extern sfr SW2_Dir;



extern unsigned char LCD_01_ADDRESS;
extern bit oneShotA; sfr;
extern bit oneShotB; sfr;







void PinMode();
void UartConfig();
void set_performance_mode();
void Uart2InterruptSetup();
void LcdI2CConfig();
void OutPutPulseXYZ();
void initDMA_global();
void initDMA0();
void initDMA1();
void Temp_Move(int a);
void LCD_Display();
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/packages/i2c_lcd/uses/i2c_lcd.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 12 "c:/users/git/pic32mzcnc/timers.h"
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


void InitTimer1();
void InitTimer8();
#line 4 "C:/Users/Git/Pic32mzCNC/Timers.c"
struct Timer TMR;




void InitTimer1(){
 T1CON = 0x8000;
 T1IP0_bit = 1;
 T1IP1_bit = 1;
 T1IP2_bit = 0;
 T1IS0_bit = 1;
 T1IS1_bit = 0;
 T1IF_bit = 0;
 T1IE_bit = 1;
 PR1 = 100;
 TMR1 = 0;
}




void InitTimer8(){
 T8CON = 0x8000;
 T8IP0_bit = 3;
 T8IP1_bit = 1;
 T8IP2_bit = 0;
 T8IS0_bit = 0;
 T8IS1_bit = 1;
 T8IF_bit = 0;
 T8IE_bit = 0;
 PR8 = 50;
 TMR8 = 0;
}




void Timer1Interrupt() iv IVT_TIMER_1 ilevel 3 ics ICS_SRS {
 T1IF_bit = 0;

}



void Timer8Interrupt() iv IVT_TIMER_8 ilevel 3 ics ICS_SRS {


 T8IF_bit = 0;
}
