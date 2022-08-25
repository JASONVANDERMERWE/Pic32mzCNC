#line 1 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 1 "c:/users/git/pic32mzcnc/timers.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/pic32mzcnc/pins.h"





extern sfr sbit LED1;
extern sfr sbit LED1_Dir;
extern sfr sbit LED2;
extern sfr sbit LED2_Dir;



extern sfr sbit SW1;
extern sfr sbit SW1_Dir;
extern sfr sbit SW2;
extern sfr sbit SW2_Dir;





extern sfr sbit EN_StepX;
extern sfr sbit EN_Step_PinDirX;
extern sfr sbit DIR_StepX;
extern sfr sbit DIR_Step_PinDirX;
extern sfr sbit PLS_StepX;
extern sfr sbit PLS_Step_PinDirX;
extern sfr sbit RST_StepX;
extern sfr sbit RST_Step_PinDirX;
extern sfr sbit SLP_FLT_StepX;
extern sfr sbit SLP_FLT_Step_PinDirX;
extern sfr sbit FLT_StepX;
extern sfr sbit FLT_Step_PinDirX;

extern sfr sbit EN_StepY;
extern sfr sbit EN_Step_PinDirY;
extern sfr sbit RST_StepY;
extern sfr sbit RST_Step_PinDirY;
extern sfr sbit SLP_FLT_StepY;
extern sfr sbit SLP_FLT_Step_PinDirY;
extern sfr sbit PLS_StepY;
extern sfr sbit PLS_Step_PinDirY;
extern sfr sbit DIR_StepY;
extern sfr sbit DIR_Step_PinDirY;
extern sfr sbit FLT_StepY;
extern sfr sbit FLT_Step_PinDirY;

extern sfr sbit EN_StepZ;
extern sfr sbit EN_Step_PinDirZ;
extern sfr sbit RST_StepZ;
extern sfr sbit RST_Step_PinDirZ;
extern sfr sbit SLP_FLT_StepZ;
extern sfr sbit SLP_FLT_Step_PinDirZ;
extern sfr sbit PLS_StepZ;
extern sfr sbit PLS_Step_PinDirZ;
extern sfr sbit DIR_StepZ;
extern sfr sbit DIR_Step_PinDirZ;
extern sfr sbit FLT_StepZ;
extern sfr sbit FLT_Step_PinDirZ;

extern sfr sbit EN_StepA;
extern sfr sbit EN_Step_PinDirA;
extern sfr sbit RST_StepA;
extern sfr sbit RST_Step_PinDirA;
extern sfr sbit SLP_FLT_StepA;
extern sfr sbit SLP_FLT_Step_PinDirA;
extern sfr sbit PLS_StepA;
extern sfr sbit PLS_Step_PinDirA;
extern sfr sbit DIR_StepA;
extern sfr sbit DIR_Step_PinDirA;
extern sfr sbit FLT_StepA;
extern sfr sbit FLT_Step_PinDirA;
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/git/pic32mzcnc/steptodistance.h"
#line 1 "c:/users/git/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 11 "c:/users/git/pic32mzcnc/steptodistance.h"
const float Dia;
#line 23 "c:/users/git/pic32mzcnc/steptodistance.h"
signed long calcSteps( double mmsToMove, double Dia);
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/git/pic32mzcnc/config.h"
#line 7 "c:/users/git/pic32mzcnc/serial_dma.h"
extern char txt[];
extern char rxBuf[];
extern char txBuf[];







void DMA_global();
void DMA0();
void DMA1();
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 28 "c:/users/git/pic32mzcnc/config.h"
extern unsigned char LCD_01_ADDRESS;
extern bit oneShotA; sfr;
extern bit oneShotB; sfr;







void PinMode();
void UartConfig();
void set_performance_mode();
void Uart2InterruptSetup();
void LcdI2CConfig();
void OutPutPulseXYZ();
void Temp_Move(int a);
void LCD_Display();
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
#line 12 "c:/users/git/pic32mzcnc/timers.h"
struct Timer{
char clock;
char P1: 1;
char P2: 1;
unsigned int disable_cnt;
unsigned int (*Reset)(unsigned int time,unsigned int last_sec);
};
extern struct Timer TMR;


void InitTimer1();
void InitTimer8();
void ClockPulse();
unsigned int ResetSteppers(unsigned int sec_to_disable,unsigned int last_sec_to_disable);
#line 1 "c:/users/git/pic32mzcnc/pins.h"
#line 1 "c:/users/git/pic32mzcnc/kinematics.h"
#line 15 "c:/users/git/pic32mzcnc/stepper.h"
typedef unsigned short UInt8_t;
#line 59 "c:/users/git/pic32mzcnc/stepper.h"
extern unsigned int Toggle;



typedef struct genVars{
 char Single_Dual;
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



typedef enum xyz{X,Y,Z,A,B,C}_axis_;
typedef enum {xy,xz,yz,xa,ya,za}axis_combination ;
typedef enum {Lin,Cir}InterPolate;
enum swt{FALSE,TRUE};

extern _axis_ _axis;
extern axis_combination axis_xyz;
extern InterPolate InterPol;







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




int Pulse(int axis_No);
void toggleOCx(int axis_No,int InterPol);
void AccDec(int axis_No);
void Step_Cycle(int axis_No,int InterPol);
void Multi_Axis_Enable(axis_combination axis);
void Single_Axis_Enable(_axis_ axis_);
#line 12 "c:/users/git/pic32mzcnc/kinematics.h"
extern void (*AxisPulse)();



typedef struct{
char oneshot: 1;
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





void DualAxisStep(long newx,long newy,int axis_combo);
void SingleAxisStep(long newxyz,int axis_No);

void SetCircleVals(Circle* cir,float curX,float curY,float i,float j, float deg,int dir);
void CalcRadius(Circle* cir);
int QuadrantStart(float i,float j);
Circle* CircDir(int dir,float xPresent,float yPresent);
void Cir_Interpolation(Circle* cir);
void Circ_Tick(Circle* cir);
#line 3 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
Circle Circ;



void (*AxisPulse)();




static long d2;
#line 20 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
void SingleAxisStep(long newxyz,int axis_No){
int dir;
#line 26 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 SV.Single_Dual = 0;
 switch(axis_No){
 case X:
 Single_Axis_Enable(X);
 break;
 case Y:
 Single_Axis_Enable(Y);
 break;
 case Z:
 Single_Axis_Enable(Z);
 break;
 case A:
 Single_Axis_Enable(A);
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

 Step_Cycle(axis_No,Lin);

}




void DualAxisStep(long newx,long newy,int axis_combo){

 SV.over=0;

 SV.px = 0;
 SV.py = 0;
 SV.pz = 0;
#line 86 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 SV.Single_Dual = 1;
 switch(axis_combo){
 case xy:
 AxisPulse = XY_Interpolate;
 axis_xyz = xy;
 Multi_Axis_Enable(axis_xyz);

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
 Multi_Axis_Enable(axis_xyz);

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
 Multi_Axis_Enable(axis_xyz);


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
 Step_Cycle(X,Lin);
 if(SV.d2 < 0){
 SV.d2 += 2*SV.dy;
 }else{
 SV.d2 += 2 * (SV.dy - SV.dx);
 Step_Cycle(Y,Lin);
 }
 }else{
 Step_Cycle(Y,Lin);
 if(SV.d2 < 0){
 SV.d2 += 2 * SV.dx;
 }else{
 SV.d2 += 2 * (SV.dx - SV.dy);
 Step_Cycle(X,Lin);
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
 Step_Cycle(X,Lin);
 if(d2 < 0)
 d2 += 2*SV.dz;
 else{
 d2 += 2 * (SV.dz - SV.dx);
 Step_Cycle(Z,Lin);
 }

 }else{
 Step_Cycle(Z,Lin);
 if(d2 < 0)
 d2 += 2 * SV.dx;
 else{
 d2 += 2 * (SV.dx - SV.dz);
 Step_Cycle(X,Lin);
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
 Step_Cycle(Y,Lin);
 if(d2 < 0)
 d2 += 2*SV.dz;
 else{
 d2 += 2 * (SV.dz - SV.dy);
 Step_Cycle(Z,Lin);
 }
 }else{
 Step_Cycle(Z,Lin);
 if(d2 < 0)
 d2 += 2 * SV.dy;
 else{
 d2 += 2 * (SV.dy - SV.dz);
 Step_Cycle(Y,Lin);
 }
 }

}







void SetCircleVals(Circle* cir,float curX,float curY,float i,float j, float deg,int dir){
 cir->oneshot = 0;
 cir->I = i;
 cir->J = j;
 cir->xStart = curX;
 cir->yStart = curY;
 cir->degreeDeg = deg;
 cir = CircDir(dir,curX,curY);

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




Circle* CircDir(int dir,float xPresent,float yPresent){
Circle circ;
float newDeg;

 circ.dir = dir;
 if(dir ==  0 ){
 newDeg = 360 / circ.deg;
 circ.N = (2* 3.14159 *circ.radius)/newDeg;
 circ.divisor = circ.deg / newDeg;
 }

 if(circ.dir ==  0 )
 circ.deg = 0.00;
 if(circ.dir ==  1 )
 circ.deg = 360.00;

 return &circ;
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



void Cir_Interpolation(Circle* cir){
static int quad = 1;


 CalcRadius(cir);
 quad = QuadrantStart(cir->I,cir->J);


 if(quad == 1 || quad == 4){
 cir->xFin = cir->xRad + (cir->radius * cos(cir->degreeRadians));
 cir->yFin = cir->yRad + (cir->radius * sin(cir->degreeRadians));
 }
 if(quad == 2 || quad == 3){
 cir->xFin = cir->xRad - (cir->radius * cos(cir->degreeRadians));
 cir->yFin = cir->yRad - (cir->radius * sin(cir->degreeRadians));
 }
 Circ_Tick(cir);
}

void Circ_Tick(Circle* cir){
static float lastX,lastY;
 if (cir->dir ==  0 ){
 cir->deg += cir->divisor;
 if (cir->deg >= cir->degreeDeg){
 disableOCx();
 }
 }

 if (cir->dir ==  1 ){
 cir->deg -= cir->divisor;
 if (cir->deg <= cir->degreeDeg){
 disableOCx();
 }

 }

 if(cir->xFin > lastX){
 Step_Cycle(X,Cir);
 lastX = cir->xFin;
 }
 if(cir->yFin > lastY){
 Step_Cycle(Y,Cir);
 lastY = cir->yFin;
 }

}
