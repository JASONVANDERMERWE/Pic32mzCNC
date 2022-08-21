#line 1 "C:/Users/Git/Pic32mzCNC/Stepper.c"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
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
#line 5 "C:/Users/Git/Pic32mzCNC/Stepper.c"
void (*AxisPulse)();



axis_combination axis_xyz;

unsigned char txt1[] = "       ";
unsigned char AxisNo;
unsigned int Toggle;

static long d2;


 STP STPS[ 6 ];
 sVars SV;
 StepTmr STmr;






sbit EN_StepX at LATB15_bit;
sbit EN_Step_PinDirX at TRISB15_bit;
sbit DIR_StepX at LATB1_bit;
sbit DIR_Step_PinDirX at TRISB1_bit;




sbit PLS_StepX at LATD4_bit;
sbit PLS_Step_PinDirX at TRISD4_bit;


sbit EN_StepY at LATE1_bit;
sbit EN_Step_PinDirY at TRISE1_bit;
sbit DIR_StepY at LATE0_bit;
sbit DIR_Step_PinDirY at TRISE0_bit;




sbit PLS_StepY at LATD5_bit;
sbit PLS_Step_PinDirY at TRISD5_bit;


sbit EN_StepZ at LATA7_bit;
sbit EN_Step_PinDirZ at TRISA7_bit;
sbit DIR_StepZ at LATA6_bit;
sbit DIR_Step_PinDirZ at TRISA6_bit;




sbit PLS_StepZ at LATF0_bit;
sbit PLS_Step_PinDirZ at TRISF0_bit;


sbit EN_StepA at LATD13_bit;
sbit EN_Step_PinDirA at TRISD13_bit;
sbit DIR_StepA at LATD0_bit;
sbit DIR_Step_PinDirA at TRISD0_bit;




sbit PLS_StepA at LATF1_bit;
sbit PLS_Step_PinDirA at TRISF1_bit;




void SetPinMode(){
 AxisNo =

 EN_Step_PinDirX = 0;


 PLS_Step_PinDirX = 0;
 DIR_Step_PinDirX = 0;

 EN_Step_PinDirY = 0;


 PLS_Step_PinDirY = 0;
 DIR_Step_PinDirY = 0;

 EN_Step_PinDirZ = 0;


 PLS_Step_PinDirZ = 0;
 DIR_Step_PinDirZ = 0;

 EN_Step_PinDirA = 0;


 PLS_Step_PinDirA = 0;
 DIR_Step_PinDirA = 0;
}



void StepperConstants(long accel,long decel){
 SV.acc = accel;
 SV.dec = decel;
}



void EnStepperX(){


 EN_StepX = 0;
}

void EnStepperY(){


 EN_StepY = 0;
}
void EnStepperZ(){


 EN_StepZ = 0;
}
void EnStepperA(){


 EN_StepA = 0;
}

void DisableStepper(){
 EN_StepX = 1;
 EN_StepY = 1;
 EN_StepZ = 1;
 EN_StepA = 1;
}
#line 159 "C:/Users/Git/Pic32mzCNC/Stepper.c"
void speed_cntr_Move(signed long mmSteps, signed long speed, int axis_No){
int ii;

 if(mmSteps == 1){

 STPS[axis_No].accel_count = -1;
 STPS[axis_No].run_state =  2 ;
 STPS[axis_No].step_delay = 20000;
 SV.running = 1;

 }

 else if((mmSteps != 0)&&(abs(mmSteps) != 1)){



 STPS[axis_No].min_delay =  (long)(( (2*3.14159)/ ( 200 *16) * 781250 )*100)  / speed;




 STPS[axis_No].step_delay = abs(( (long)(( 781250 *0.676)/100)  * sqrt_( (long)( (2*3.14159)/ ( 200 *16) *2*10000000000)  / SV.acc))/100);
 STPS[axis_No].StartUp_delay = STPS[axis_No].step_delay ;




 STPS[axis_No].max_step_lim = (speed*speed)/(long)(2.0* (2*3.14159)/ ( 200 *16) *(double)SV.acc*100.0);




 if(STPS[axis_No].max_step_lim == 0){
 STPS[axis_No].max_step_lim = 1;
 }



 STPS[axis_No].accel_lim = (abs(mmSteps) * SV.dec) / (SV.acc + SV.dec);


 if(STPS[axis_No].accel_lim == 0){
 STPS[axis_No].accel_lim = 1;
 }


 if(STPS[axis_No].accel_lim <= STPS[axis_No].max_step_lim){
 if(mmSteps >= 0)STPS[axis_No].decel_val = STPS[axis_No].accel_lim - mmSteps;
 else STPS[axis_No].decel_val = mmSteps + STPS[axis_No].accel_lim;
 }else{
 STPS[axis_No].decel_val = -((STPS[axis_No].max_step_lim * SV.acc) / SV.dec);
 }

 if(mmSteps >= 0){
 if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = mmSteps + STPS[axis_No].decel_val;
 else STPS[axis_No].decel_start = STPS[axis_No].accel_lim;
 }
 else {
 if(mmSteps > STPS[axis_No].decel_val) STPS[axis_No].decel_start = abs(mmSteps) * STPS[axis_No].decel_val;
 else STPS[axis_No].decel_start = STPS[axis_No].accel_lim;
 }

 if(STPS[axis_No].decel_val == 0){
 STPS[axis_No].decel_val = -1;
 }


 if(STPS[axis_No].StartUp_delay <= STPS[axis_No].min_delay){
 STPS[axis_No].step_delay = STPS[axis_No].min_delay;
 STPS[axis_No].run_state =  3 ;
 }else{
 STPS[axis_No].step_delay = abs(STPS[axis_No].StartUp_delay);
 STPS[axis_No].run_state =  1 ;
 }

 }
 STPS[axis_No].step_count = 0;
 STPS[axis_No].rest = 0;
 STPS[axis_No].microSec = 0;
 STPS[axis_No].accel_count = 1;
 STPS[axis_No].dist = 0;
 SV.Tog = 0;
 SV.running = 1;
}
#line 250 "C:/Users/Git/Pic32mzCNC/Stepper.c"
void SingleAxisStep(long newxyz,int axis_No){
int dir;
#line 256 "C:/Users/Git/Pic32mzCNC/Stepper.c"
 SV.Single_Dual = 0;
 switch(axis_No){
 case X:
 OC5IE_bit = 1;OC5CONbits.ON = 1;
 break;
 case Y:
 OC2IE_bit = 1;OC2CONbits.ON = 1;
 break;
 case Z:
 OC7IE_bit = 1;OC7CONbits.ON = 1;
 break;
 case A:
 OC3IE_bit = 1;OC3CONbits.ON = 1;
 break;
 default: break;
 }
 SV.psingle = 0;
 STPS[axis_No].dist = newxyz - SV.psingle;
 STPS[axis_No].dist = abs(STPS[axis_No].dist);

 if(newxyz < 0)
 dir =  1 ;
 else
 dir =  0 ;

 switch(axis_No){
 case X:
 DIR_StepX = dir;
 break;
 case Y:
 DIR_StepY = dir;
 break;
 case Z:
 DIR_StepZ = dir;
 break;
 case A:
 DIR_StepA = dir;
 break;
 default: break;
 }

 STPS[axis_No].step_count = 0;

 Step_Cycle(axis_No);

}




void DualAxisStep(long newx,long newy,int axis_combo){

 SV.over=0;

 SV.px = 0;
 SV.py = 0;
 SV.pz = 0;
#line 316 "C:/Users/Git/Pic32mzCNC/Stepper.c"
 SV.Single_Dual = 1;
 switch(axis_combo){
 case xy:
 AxisPulse = XY_Interpolate;
 axis_xyz = xy;
 Axis_Enable(axis_xyz);

 SV.dx = newx - SV.px;
 SV.dy = newy - SV.py;


 SV.dirx = SV.dx > 0?1:-1;
 SV.diry = SV.dy > 0?1:-1;


 if(SV.dirx < 0)
 DIR_StepX =  1 ;
 else
 DIR_StepX =  0 ;

 if(SV.diry < 0)
 DIR_StepY =  1 ;
 else
 DIR_StepY =  0 ;

 SV.dx = abs(SV.dx);
 SV.dy = abs(SV.dy);

 if(SV.dx > SV.dy)
 SV.d2 = 2*(SV.dy - SV.dx);
 else
 SV.d2 = 2* (SV.dx - SV.dy);

 STPS[X].step_count = 0;
 STPS[Y].step_count = 0;
 AxisPulse();

 break;
 case xz:
 AxisPulse = XZ_Interpolate;
 axis_xyz = xz;
 Axis_Enable(axis_xyz);

 SV.dx = newx - SV.px;
 SV.dz = newy - SV.pz;


 SV.dirx = SV.dx > 0?1:-1;
 SV.dirz = SV.dz > 0?1:-1;


 if(SV.dirx < 0)DIR_StepX =  1 ;
 else DIR_StepX =  0 ;

 if(SV.dirz < 0) DIR_StepZ =  1 ;
 else DIR_StepZ =  0 ;

 SV.dx = abs(SV.dx);
 SV.dz = abs(SV.dz);

 if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
 else d2 = 2* (SV.dx - SV.dz);

 STPS[X].step_count = 0;
 STPS[Z].step_count = 0;
 AxisPulse();
 break;
 case yz:
 AxisPulse = YZ_Interpolate;
 axis_xyz = yz;
 Axis_Enable(axis_xyz);


 SV.dy = newx - SV.pz;
 SV.dz = newy - SV.py;


 SV.diry = SV.dy > 0?1:-1;
 SV.dirz = SV.dz > 0?1:-1;


 if(SV.diry < 0)DIR_StepY =  1 ;
 else DIR_StepY =  0 ;
 if(SV.dirz < 0) DIR_StepZ =  1 ;
 else DIR_StepZ =  0 ;

 SV.dy = abs(SV.dy);
 SV.dz = abs(SV.dz);

 if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
 else d2 = 2* (SV.dy - SV.dz);

 STPS[Y].step_count = 0;
 STPS[Z].step_count = 0;
 AxisPulse();
 break;
 default: break;

 }
}



void XY_Interpolate(){
 if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)){
 StopX();
 StopY();
 return;
 }

 if(SV.dx > SV.dy){
 Step_Cycle(X);
 if(SV.d2 < 0){
 SV.d2 += 2*SV.dy;
 }else{
 SV.d2 += 2 * (SV.dy - SV.dx);
 Step_Cycle(Y);
 }
 }else{
 Step_Cycle(Y);
 if(SV.d2 < 0){
 SV.d2 += 2 * SV.dx;
 }else{
 SV.d2 += 2 * (SV.dx - SV.dy);
 Step_Cycle(X);
 }
 }
}

void XZ_Interpolate(){

 if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)){
 StopX();
 StopZ();

 return;
 }

 if(SV.dx > SV.dz){
 Step_Cycle(X);
 if(d2 < 0)
 d2 += 2*SV.dz;
 else{
 d2 += 2 * (SV.dz - SV.dx);
 Step_Cycle(Z);
 }

 }else{
 Step_Cycle(Z);
 if(d2 < 0)
 d2 += 2 * SV.dx;
 else{
 d2 += 2 * (SV.dx - SV.dz);
 Step_Cycle(X);
 }
 }
}

void YZ_Interpolate(){
 if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)){
 StopY();
 StopZ();
 return;
 }

 if(SV.dy > SV.dz){
 Step_Cycle(Y);
 if(d2 < 0)
 d2 += 2*SV.dz;
 else{
 d2 += 2 * (SV.dz - SV.dy);
 Step_Cycle(Z);
 }
 }else{
 Step_Cycle(Z);
 if(d2 < 0)
 d2 += 2 * SV.dy;
 else{
 d2 += 2 * (SV.dy - SV.dz);
 Step_Cycle(Y);
 }
 }

}







void Step_Cycle(int axis_No){
 toggleOCx(axis_No);
 Pulse(axis_No);
}



void toggleOCx(int axis_No){
 switch(axis_No){
 case X: OC5R = 0x5;
 OC5RS = STPS[X].step_delay & 0xFFFF;
 TMR2 = 0xFFFF;
 OC5CON = 0x8004;
 break;
 case Y: OC2R = 0x5;
 OC2RS = STPS[Y].step_delay & 0xFFFF;
 TMR4 = 0xFFFF;
 OC2CON = 0x8004;
 break;
 case Z: OC7R = 0x5;
 OC7RS = STPS[Z].step_delay & 0xFFFF;
 TMR6 = 0xFFFF;
 OC7CON = 0x8004;
 break;
 case A: OC3R = 0x5;
 OC3RS = STPS[A].step_delay & 0xFFFF;
 TMR5 = 0xFFFF;
 OC3CON = 0x800C;
 break;
 case B: OC6R = 0x5;
 OC6RS = STPS[B].step_delay & 0xFFFF;
 TMR3 = 0xFFFF;
 OC6CON = 0x800C;
 break;
 case C: OC8R = 0x5;
 OC8RS = STPS[C].step_delay & 0xFFFF;
 TMR7 = 0xFFFF;
 OC8CON = 0x800C;
 break;
 default:
 break;
 }

}



int Pulse(int axis_No){
#line 560 "C:/Users/Git/Pic32mzCNC/Stepper.c"
 switch(STPS[axis_No].run_state) {
 case  0 :
 LED1 = 0;
 T8IE_bit = 0;
 SV.Tog = 1;
 break;

 case  1 :
#line 572 "C:/Users/Git/Pic32mzCNC/Stepper.c"
 AccDec(axis_No);
 if(STPS[axis_No].step_delay <= STPS[axis_No].min_delay){

 STPS[axis_No].step_delay = STPS[axis_No].min_delay;
 STPS[axis_No].run_state =  3 ;
 }
 if(STPS[axis_No].step_delay > STPS[axis_No].accel_lim){
 STPS[axis_No].run_state =  3 ;
 }
 if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
 STPS[axis_No].accel_count = STPS[axis_No].decel_val;
 STPS[axis_No].rest = 0;
 STPS[axis_No].run_state =  2 ;
 }
 break;

 case  3 :
 STPS[axis_No].step_delay = STPS[axis_No].min_delay;

 if(STPS[axis_No].step_count >= STPS[axis_No].decel_start) {
 STPS[axis_No].accel_count = STPS[axis_No].decel_val;
 STPS[axis_No].rest = 0;

 STPS[axis_No].run_state =  2 ;
 }
 break;

 case  2 :
#line 604 "C:/Users/Git/Pic32mzCNC/Stepper.c"
 AccDec(axis_No);



 if(STPS[axis_No].accel_count >= 0 ){
 STPS[axis_No].run_state =  0 ;
 }
 break;
 default:break;
 }
 return axis_No;
}



void AccDec(int axis_No){
 STPS[axis_No].accel_count++;
 STPS[axis_No].new_step_delay = STPS[axis_No].step_delay - (( STPS[axis_No].step_delay << 1) + STPS[axis_No].rest)/((STPS[axis_No].accel_count << 2) + 1);
 STPS[axis_No].rest = ((STPS[axis_No].step_delay << 1)+STPS[axis_No].rest)%((STPS[axis_No].accel_count << 2 ) + 1);
 STPS[axis_No].step_delay = STPS[axis_No].new_step_delay;

}




void Axis_Enable(axis_combination axis){
 switch(axis){
 case xy:
 OC5IE_bit = 1;OC5CONbits.ON = 1;
 OC2IE_bit = 1;OC2CONbits.ON = 1;
 break;
 case xz:
 OC5IE_bit = 1;OC5CONbits.ON = 1;
 OC7IE_bit = 1;OC7CONbits.ON = 1;
 break;
 case yz:
 OC2IE_bit = 1;OC2CONbits.ON = 1;
 OC7IE_bit = 1;OC7CONbits.ON = 1;
 break;
 case xa:
 OC5IE_bit = 1;OC5CONbits.ON = 1;
 OC3IE_bit = 1;OC3CONbits.ON = 1;
 break;
 case ya:
 OC2IE_bit = 1;OC2CONbits.ON = 1;
 OC3IE_bit = 1;OC3CONbits.ON = 1;
 break;
 case za:
 OC7IE_bit = 1;OC7CONbits.ON = 1;
 OC3IE_bit = 1;OC3CONbits.ON = 1;
 break;
 default:
 break;
 }
}

void disableOCx(){
 OC5IE_bit = 0;OC5CONbits.ON = 0;
 OC2IE_bit = 0;OC2CONbits.ON = 0;
 OC7IE_bit = 0;OC7CONbits.ON = 0;

 OC3IE_bit = 0;OC3CONbits.ON = 0;
 OC6IE_bit = 0;OC6CONbits.ON = 0;
 OC8IE_bit = 0;OC8CONbits.ON = 0;
}




void StepX() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {
 STPS[X].step_count++;
 OC5IF_bit = 0;
 if(SV.Single_Dual == 0)
 SingleStepX();
 else
 AxisPulse();
}

void SingleStepX(){
 if(STPS[X].step_count >= STPS[X].dist){
 StopX();
 }
 else{
 Step_Cycle(X);
 }
}


void StopX(){
 OC5IE_bit = 0;
 OC5CONbits.ON = 0;
}





void StepY() iv IVT_OUTPUT_COMPARE_2 ilevel 3 ics ICS_AUTO {
 STPS[Y].step_count++;
 OC2IF_bit = 0;
 if(SV.Single_Dual == 0)
 SingleStepY();
 else
 AxisPulse();
}

void SingleStepY(){
 if(STPS[Y].step_count >= STPS[Y].dist){
 StopY();
 }
 else{
 Step_Cycle(Y);
 }
}

void StopY(){
 OC2IE_bit = 0;
 OC2CONbits.ON = 0;
}





void StepZ() iv IVT_OUTPUT_COMPARE_7 ilevel 3 ics ICS_AUTO {
 STPS[Z].step_count++;
 OC7IF_bit = 0;
 if(!SV.Single_Dual)
 SingleStepZ();
 else
 AxisPulse();

}

void SingleStepZ(){
 if(STPS[Z].step_count >= STPS[Z].dist){
 StopZ();
 }
 else{
 Step_Cycle(Z);
 }
}

void StopZ(){
 OC7IE_bit = 0;
 OC7CONbits.ON = 0;
}




void StepA() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {
 STPS[A].step_count++;
 OC3IF_bit = 0;
 if(!SV.Single_Dual)
 SingleStepA();
 else
 AxisPulse();

}

void SingleStepA(){
 if(STPS[A].step_count >= STPS[A].dist){
 StopA();
 }
 else{
 Step_Cycle(A);
 }
}

void StopA(){
 OC3IE_bit = 0;
 OC3CONbits.ON = 0;
}
#line 789 "C:/Users/Git/Pic32mzCNC/Stepper.c"
unsigned int min_(unsigned int x, unsigned int y){
 if(x < y){
 return x;
 }
 else{
 return y;
 }
}
#line 806 "C:/Users/Git/Pic32mzCNC/Stepper.c"
static unsigned long sqrt_(unsigned long x){

 register unsigned long xr;
 register unsigned long q2;
 register unsigned char f;

 xr = 0;
 q2 = 0x40000000L;
 do
 {
 if((xr + q2) <= x)
 {
 x -= xr + q2;
 f = 1;
 }
 else{
 f = 0;
 }
 xr >>= 1;
 if(f){
 xr += q2;
 }
 } while(q2 >>= 2);
 if(xr < x){
 return xr +1;
 }
 else{
 return xr;
 }
}


void CalcRadius(Circle* cir){
 float xRad,yRad,X,Y,angA,angB;

 cir->xRad = fabs(cir->xStart + cir->I);
 cir->yRad = fabs(cir->yStart + cir->J);
 cir->radius = sqrt((cir->xRad*cir->xRad) + (cir->yRad*cir->yRad));
 angA = atan2(cir->yRad,cir->xRad);


 cir->degreeDeg = angA *  (180.00/ 3.14159 ) ;

 cir->quadrant_start = QuadrantStart(cir->I,cir->J);

 if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
 angB = cir->deg - cir->degreeDeg;
 if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
 angB = cir->deg + cir->degreeDeg;

 cir->degreeRadians = angB *  ( 3.14159 /180.00) ;
}

int QuadrantStart(float i,float j){
 if((i <= 0)&&(j >= 0))
 return 1;
 else if((i > 0)&&(j > 0))
 return 2;
 else if((i > 0)&&(j < 0))
 return 3;
 else if((i < 0)&&(j < 0))
 return 4;
 else
 return 0;
}

void CircDir(Circle* cir){
float newDeg;
 if(cir->dir ==  0 ){
 newDeg = 360 / cir->deg;
 cir->N = (2* 3.14159 *cir->radius)/newDeg;
 cir->divisor = cir->deg / newDeg;
 }

 if(cir->dir ==  0 )
 cir->deg = 0.00;
 if(cir->dir ==  1 )
 cir->deg = 360.00;
}

void Cir_Interpolation(float xPresent,float yPresent,Circle* cir){
static int quad = 1;
 cir->xStart = xPresent;
 cir->yStart = yPresent;
 CalcRadius(cir);


 while(quad){
 break;
 if(quad == 1 || quad == 4){
 cir->xFin = cir->xRad + (cir->radius * cos(cir->degreeRadians));
 cir->yFin = cir->yRad + (cir->radius * sin(cir->degreeRadians));
 }
 if(quad == 2 || quad == 3){
 cir->xFin = cir->xRad - (cir->radius * cos(cir->degreeRadians));

 }

 }
}
#line 929 "C:/Users/Git/Pic32mzCNC/Stepper.c"
void CycleStop(){
int ii;
 STmr.uSec = 0;
 for(ii = 0;ii< 6 ;ii++){
 STPS[ii].microSec = 0;
 if(ii >  6 )break;
 }
}

void CycleStart(){
int ii;

 if(SV.Tog == 0){
 for(ii = 0; ii <  6 ;ii++){
 if(ii >  6 )break;
 STPS[ii].microSec++;
 }
 }
}
