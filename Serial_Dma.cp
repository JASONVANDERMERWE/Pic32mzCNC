#line 1 "C:/Users/User/Pic32mzCNC/Serial_Dma.c"
#line 1 "c:/users/user/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/user/pic32mzcnc/config.h"
#line 1 "c:/users/user/pic32mzcnc/timers.h"
#line 1 "c:/users/user/pic32mzcnc/config.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/packages/i2c_lcd/uses/i2c_lcd.h"
#line 59 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/packages/i2c_lcd/uses/i2c_lcd.h"
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
#line 1 "c:/users/user/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/user/pic32mzcnc/timers.h"
#line 1 "c:/users/user/pic32mzcnc/pins.h"





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
#line 1 "c:/users/user/pic32mzcnc/kinematics.h"
#line 1 "c:/users/user/pic32mzcnc/stepper.h"
#line 1 "c:/users/user/pic32mzcnc/serial_dma.h"
#line 13 "c:/users/user/pic32mzcnc/kinematics.h"
extern void (*AxisPulse[3])();



typedef struct{
char cir_start: 1;
char cir_end: 1;
char cir_next: 1;
double deg;
double degreeDeg;
double degreeRadians;
double deg_A;
double deg_B;
double divisor;
double newdeg_;

double I;
double J;
double N;
double radius;
int dir;
int quadrant;
unsigned int steps;
unsigned int Idivisor;
double xRad;
double yRad;
double xStart;
double yStart;
double xStep;
double yStep;
double xFin;
double yFin;
double lastX;
double lastY;
}Circle;
extern Circle Circ;





void DualAxisStep(long newx,long newy,int axis_combo);
void SingleAxisStep(long newxyz,int axis_No);

void SetCircleVals(double curX,double curY,double finX,double finY,double i,double j, double deg,int dir);
void CalcRadius();
void CalcAngle();
int Quadrant(double i,double j);
int CircDir(int dir);
void CalcDivisor();
void NextCords(int fin_step);
void CirInterpolation();
void Cir_Interpolation();
void Circ_Tick();
void Circ_Prep_Next();

void SerialPrint();
#line 15 "c:/users/user/pic32mzcnc/stepper.h"
typedef unsigned short UInt8_t;
#line 59 "c:/users/user/pic32mzcnc/stepper.h"
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
#line 12 "c:/users/user/pic32mzcnc/timers.h"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/user/pic32mzcnc/pins.h"
#line 1 "c:/users/user/pic32mzcnc/stepper.h"
#line 1 "c:/users/user/pic32mzcnc/steptodistance.h"
#line 1 "c:/users/user/pic32mzcnc/stepper.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 11 "c:/users/user/pic32mzcnc/steptodistance.h"
const float Dia;
#line 23 "c:/users/user/pic32mzcnc/steptodistance.h"
signed long calcSteps( double mmsToMove, double Dia);
#line 1 "c:/users/user/pic32mzcnc/serial_dma.h"
#line 1 "c:/users/user/pic32mzcnc/kinematics.h"
#line 28 "c:/users/user/pic32mzcnc/config.h"
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
#line 7 "c:/users/user/pic32mzcnc/serial_dma.h"
extern char txt[];
extern char rxBuf[];
extern char txBuf[];







void DMA_global();
void DMA0();
void DMA1();
#line 4 "C:/Users/User/Pic32mzCNC/Serial_Dma.c"
char txt[] = "Start......";
char rxBuf[] ={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0} absolute 0xA0002000 ;
char txBuf[] ={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0} absolute 0xA0002200 ;

char DMA_Buff[200];
short dma0int_flag;
short dma1int_flag;





void DMA_global(){
 DMACON = 1<<16;
 DCH0CON = 0x03;

 DMA0();
 DMA1();
}


void DMA0(){
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


void DMA1(){

 DMA1IE_bit = 0 ;
 DMA1IF_bit = 0 ;
 DCH1CONbits.CHPATLEN = 0;
 DCH1ECON=(147 << 8)| 0x30;
 DCH1SSA = KVA_TO_PA(0xA0002200) ;
 DCH1DSA = KVA_TO_PA(0xBF822220) ;
 DCH1DAT = 0x00;

 DCH1SSIZ = 200;

 DCH1DSIZ = 1;

 DCH1CSIZ = 1;

 DCH1INTCLR = 0x00FF00FF ;
 SIRQEN_DCH1ECON_bit = 1;
 CHBCIE_DCH1INT_bit = 1 ;
 CHERIE_DCH1INT_bit = 1 ;

 DMA1IP2_bit = 1 ;
 DMA1IP1_bit = 0 ;
 DMA1IP0_bit = 1 ;
 DMA1IS1_bit = 0 ;
 DMA1IS0_bit = 1 ;
 DMA1IE_bit = 0 ;
}




void DMA_CH0_ISR() iv IVT_DMA0 ilevel 5 ics ICS_AUTO {
 char A[6];
 int i,ptr;
 if (CHBCIF_bit == 1) {
 i = 0;


 i = strlen(rxBuf);
 dma0int_flag = 1;
 memcpy(txBuf, rxBuf, i);
 CHEN_DCH1CON_bit = 1;
 }
 DCH1SSIZ = i ;


 if( CHERIF_bit == 1){
 CHERIF_bit = 0;
 memcpy(txBuf,"CHERIF Error",13);
 }
 DCH0INTCLR = 0x00FF;

 DMA1IE_bit = 1 ;
 CHEN_bit = 1 ;

 CFORCE_DCH1ECON_bit = 1 ;
 DMA0IF_bit = 0 ;

}


void DMA_CH1_ISR() iv IVT_DMA1 ilevel 5 ics ICS_AUTO {
int ptr = 0;
char ptrAdd[6];

 if (CHBCIF_DCH1INT_bit == 1){
 CHBCIF_DCH1INT_bit = 0;
 }

 if( CHERIF_DCH1INT_bit == 1){
 CHERIF_DCH1INT_bit = 0;

 }

 dma1int_flag = 1;
 DCH1INTCLR = 0x00FF;
 DMA1IF_bit = 0 ;

}
