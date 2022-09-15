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
#line 58 "c:/users/git/pic32mzcnc/stepper.h"
extern unsigned int Toggle;



typedef struct genVars{
 int Single_Dual;
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




typedef enum xyz{X,Y,Z,A,B,C}_axis_;
typedef enum {xy,xz,yz,xa,ya,za}axis_combination ;
enum swt{FALSE,TRUE};

extern _axis_ _axis;
extern axis_combination axis_xyz;







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
void toggleOCx(int axis_No);
void AccDec(int axis_No);
void Step_Cycle(int axis_No);
void Multi_Axis_Enable(axis_combination axis);
void Single_Axis_Enable(_axis_ axis_);

 void Test_CycleX();
 void Test_CycleY();
 void Test_CycleZ();
 void Test_CycleA();
#line 1 "c:/users/git/pic32mzcnc/serial_dma.h"
#line 18 "c:/users/git/pic32mzcnc/kinematics.h"
extern volatile void (*AxisPulse[3])();




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





struct degs{
double degS;
double degF;
double degT;
double deg;
double degreeDeg;
double degreeRadians;
double newdeg;
};

struct X_Y{
 double X;
 double Y;
};

struct async_{
char x: 1;
};


typedef struct{
char cir_start: 1;
char cir_end: 1;
char cir_next: 1;
char x_next: 1;
char y_next: 1;
double divisor;
double I;
double J;
double I_end;
double J_end;
double N;
double radius;
int dir;
int quadrantS;
int quadrantF;
unsigned int steps;
unsigned int Idivisor;
double xCenter;
double yCenter;
double xStart;
double yStart;
double xStep;
double yStep;
double xFin;
double yFin;
double xLastStep;
double yLastStep;
double lastX;
double lastY;
struct degs Deg;
struct X_Y XY;
struct async_ async;
}Circle;
extern Circle Circ;





void DualAxisStep(long newx,long newy,int axis_combo);
void SingleAxisStep(long newxyz,int axis_No);

void SetCircleVals(double curX,double curY,double finX,double finY,double i,double j,int dir);
void CalcRadius(double i,double j);
void CalcCircCenter(double xS,double yS,double i,double j);
void CalcI_J_FromEndPos(double xF,double yF,double xC,double yC);
double Calc_Angle(double j, double i);
int Quadrant(double i,double j);
double TestQuadrnt(double i,double j,double aS,double aE);
int CircDir(int dir);
void CalcDivisor();
void CalcStep();
void NextCords();
void CirInterpolation();
void Cir_Interpolation();
void Circ_Tick();
void Circ_Prep_Next();

void SerialPrint();
#line 3 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
STP STPS[ 6 ];
Circle Circ;



volatile void (*AxisPulse[3])();

char txtA[] = " : ";
char txtC[] = "\r";
char txtB[200];


static long d2;
#line 23 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
void SingleAxisStep(long newxyz,int axis_No){
int dir;
#line 29 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
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

 Step_Cycle(axis_No);

}




void DualAxisStep(long newx,long newy,int axis_combo){

 SV.over=0;

 SV.px = 0;
 SV.py = 0;
 SV.pz = 0;
#line 90 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
 SV.Single_Dual = 1;

 switch(axis_combo){
 case xy:
 AxisPulse[1] = XY_Interpolate;
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
 AxisPulse[1]();

 break;
 case xz:
 AxisPulse[1] = XZ_Interpolate;
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
 AxisPulse[1]();
 break;
 case yz:
 AxisPulse[1] = YZ_Interpolate;
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
 AxisPulse[1]();
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







void SetCircleVals(double curX,double curY,double finX,double finY,double i,double j,int dir){
double X,Y,Xe,Ye;
 int str_len = 0;
 X = Y = Xe = Ye = 0;
 AxisPulse[2] = Circ_Prep_Next;
 Multi_Axis_Enable(xy);
 SV.Single_Dual = 2;
 Circ.xStart = curX;
 Circ.yStart = curY;
 Circ.xFin = finX;
 Circ.yFin = finY;
 Circ.I = i;
 Circ.J = j;


 CalcRadius(i,j);

 CalcCircCenter(curX,curY,i,j);

 Circ.Deg.degS = Calc_Angle(i,j);

 Circ.quadrantS = Quadrant(i,j);


 CalcI_J_FromEndPos(Circ.xFin,Circ.yFin,Circ.xCenter,Circ.yCenter);

 Circ.Deg.degF = Calc_Angle(Circ.I_end, Circ.J_end);

 Circ.quadrantF = Quadrant(Circ.I_end, Circ.J_end);

 Circ.Deg.degT = TestQuadrnt(Circ.I_end, Circ.J_end,Circ.Deg.degS,Circ.Deg.degF);

 Circ.dir = CircDir(dir);


 CalcDivisor();
 Circ.lastX = 0;
 Circ.lastY = 0;

}



int CircDir(int dir){

 Circ.dir = dir;

 if(Circ.dir ==  0 )
 Circ.Deg.deg = 0.00;
 if(Circ.dir ==  1 )
 Circ.Deg.deg = 360.00;

 return Circ.dir;
}



void CalcDivisor(){
double newDeg,Circumfrence;

 newDeg = 360.00 / Circ.Deg.degT;
 Circ.N = (2* 3.141593 *Circ.radius)/newDeg;
 Circ.divisor = Circ.Deg.deg/Circ.N;
 Circ.Idivisor = 1;
}



double Calc_Angle(double i, double j){
 double X,Y,res;
 X = Y = 0.00;


 res = atan2(j,i);


 return res* (180.00/ 3.141593 ) ;
}



void CalcRadius(double i,double j){

 Circ.radius = sqrt((i*i) + (j*j));
}



void CalcCircCenter(double xS,double yS,double i,double j){

 Circ.xCenter = (xS + i);
 Circ.yCenter = (yS + j);
}



void CalcI_J_FromEndPos(double xF,double yF,double xC,double yC){
 Circ.I_end = xF - xC;
 Circ.J_end = yF - yC;
}



int Quadrant(double i,double j){
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

double TestQuadrnt(double i,double j,double aS,double aE){
double totalDeg,degF;

 if (i >= 0 && j < 0)
 {
 if (aE > aS)
 totalDeg = aS - aE;
 else if (aE < aS && aE > -aS)
 totalDeg = aE + aS;
 else if (aE < -aS)
 totalDeg = 360 + aE+ aS;
 }
 else if (i >= 0 && j >= 0)
 {
 totalDeg = aS + aE;
 }
 else if (i < 0 && j >= 0)
 {
 totalDeg = aS + aE;
 }
 else if (i < 0 && j < 0)
 {
 totalDeg = 360 + aE + aS;
 }

 return totalDeg;
}



double CalcStep(){
double angleA;
 if (Circ.quadrantS == 1 || Circ.quadrantS == 3)
 angleA = Circ.Deg.deg - Circ.Deg.degS;

 if (Circ.quadrantS == 2 || Circ.quadrantS == 4)
 angleA = Circ.Deg.deg + Circ.Deg.degS;

 return angleA *  ( 3.141593 /180.00) ;
}


void NextCords(){

 if(Circ.quadrantS == 1 || Circ.quadrantS == 4){
 Circ.xStep = Circ.xCenter + (Circ.radius * cos(Circ.Deg.degreeRadians));
 Circ.yStep = Circ.yCenter + (Circ.radius * sin(Circ.Deg.degreeRadians));
 }
 if(Circ.quadrantS == 2 || Circ.quadrantS == 3){
 Circ.xStep = Circ.xCenter - (Circ.radius * cos(Circ.Deg.degreeRadians));
 Circ.yStep = Circ.yCenter - (Circ.radius * sin(Circ.Deg.degreeRadians));
 }

}



void Cir_Interpolation(){
 Circ.lastX = Circ.xStep;
 Circ.lastY = Circ.yStep;
 Circ.Deg.degreeRadians = CalcStep();
 NextCords();

 STPS[X].step_delay = 100;
 STPS[Y].step_delay = 100;


 SerialPrint();



 if(Circ.lastX >= Circ.xStep){
 DIR_StepX = 0;
 }else{
 DIR_StepX = 1;
 }

 if(Circ.lastY >= Circ.yStep){
 DIR_StepY = 0;
 }else{
 DIR_StepY = 1;
 }

}

void Circ_Tick(){
int x,y,xL,yL;

 x = (int)Circ.xStep;
 y = (int)Circ.yStep;

 if (Circ.dir ==  0 ){
 Circ.Deg.deg += 0.25;
 if (Circ.Deg.deg == Circ.Deg.degT){
 disableOCx();
 }
 }

 if (Circ.dir ==  1 ){
 Circ.Deg.deg -= 0.25;
 if (Circ.Deg.deg == Circ.Deg.degT){
 disableOCx();
 }

 }


 if(xL != x){
 Circ.x_next = 1;
 }else
 Circ.x_next = 0;

 if(yL != y){
 Circ.y_next = 1;
 }else
 Circ.y_next = 0;

 xL = x;
 yL = y;
 SV.Single_Dual = 2;

}
#line 527 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
void Circ_Prep_Next(){
 Circ.steps++;

 if(Circ.x_next)
 toggleOCx(X);

 if(Circ.y_next)
 toggleOCx(Y);


 if(Circ.steps >= Circ.Idivisor){
 Circ.steps = 0;
 Circ.cir_next = 0;
 Circ.cir_start = 1;
 Circ.async.x = 0;
 }

}

void SerialPrint(){
int str_len = 0;
int str_lenA = 0;
 str_lenA = strlen(txtA);
 memset(txtB,0,30);

 sprintf(txt,"%0.2f",Circ.radius);
 strncpy(txtB, " ",strlen(txt));
 strncat(txtB, txt,strlen(txt));
 str_len += strlen(txt);
 strncat(txtB,txtA,str_lenA);
 str_len += str_lenA;

 sprintf(txt,"%0.2f",Circ.xStep);
 strncat(txtB,txt,strlen(txt));
 str_len += strlen(txt);
 strncat(txtB,txtA,str_lenA);
 str_len += str_lenA;

 sprintf(txt,"%0.2f",Circ.yStep);
 strncat(txtB,txt,strlen(txt));
 str_len += strlen(txt);
 strncat(txtB,txtA,str_lenA);
 str_len += str_lenA;

 sprintf(txt,"%0.2f",Circ.xFin);
 strncat(txtB,txt,strlen(txt));
 str_len += strlen(txt)+1;
 strncat(txtB,txtA,str_lenA);
 str_len += str_lenA;

 sprintf(txt,"%0.2f",Circ.yFin);
 strncat(txtB,txt,strlen(txt));
 str_len += strlen(txt)+1;
 strncat(txtB,txtA,str_lenA);
 str_len += str_lenA;

 sprintf(txt,"%0.2f",Circ.Deg.degS);
 strncat(txtB,txt,strlen(txt));
 str_len += strlen(txt)+1;
 strncat(txtB,txtA,str_lenA);
 str_len += str_lenA;

 sprintf(txt,"%0.2f",Circ.Deg.degF);
 strncat(txtB,txt,strlen(txt));
 str_len += strlen(txt)+1;
 strncat(txtB,txtA,str_lenA);
 str_len += str_lenA;

 sprintf(txt,"%0.2f",Circ.Deg.degT);
 strncat(txtB,txt,strlen(txt));
 str_len += strlen(txt)+1;
 strncat(txtB,txtA,str_lenA);
 str_len += str_lenA;

 sprintf(txt,"%0.2f",Circ.Deg.deg);
 strncat(txtB,txt,strlen(txt));
 str_len += strlen(txt)+1;
 strncat(txtB,txtA,str_lenA);
 str_len += str_lenA;

 sprintf(txt,"%d",Circ.quadrantS);
 strncat(txtB,txt,strlen(txt));
 str_len += strlen(txt)+1;
 strncat(txtB,"\n",1);
 str_len += 2;
 strncat(txtB,txtA,str_lenA);
 str_len += str_lenA;
 UART2_Write_Text(txtB);
#line 623 "C:/Users/Git/Pic32mzCNC/Kinematics.c"
}
