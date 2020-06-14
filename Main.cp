#line 1 "C:/Users/Git/Pic32mzCNC/Main.c"
#line 1 "c:/users/git/pic32mzcnc/config.h"







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
#line 7 "C:/Users/Git/Pic32mzCNC/Main.c"
char txt[] = "Start......";
char rxBuf[] ={0,0,0,0,0,0,0,0,0,0,0,0} absolute 0xA0002000 ;
char txBuf[] ={0,0,0,0,0,0,0,0,0,0,0,0} absolute 0xA0002200 ;

char DMA_Buff[200];
short dma0int_flag;
short dma1int_flag;
bit testISR;
bit oneShotA; sfr;
bit oneShotB; sfr;
char uart_rd;
struct Timer TMR;
unsigned char LCD_01_ADDRESS = 0x4E;


unsigned int ii;
unsigned long testOcr;
static unsigned int a;
void Timer6Interrupt() iv IVT_TIMER_6 ilevel 7 ics ICS_SRS {
volatile int ii;


 if(SV.Tog == 0){
 for(ii = 0; ii <  2 ;ii++){
 STPS[ii].PLS_Step_ = 0;
 if(ii >  2 )break;
 if(ii == X)PLS_StepX = 0;
 if(ii == Y)PLS_StepY = 0;
 }
 }
 T6IE_bit = 0;
}


void Timer7Interrupt() iv IVT_TIMER_7 ilevel 4 ics ICS_SRS{
 T7IF_bit = 0;

 TMR.mSec++;
 if(TMR.mSec > 999){
 LATA9_bit = !LATA9_bit;
 TMR.mSec = 0;
 TMR.Sec++;
 if(TMR.Sec > 59){
 TMR.Sec = 0;
 }
 }
}


void Timer8Interrupt() iv IVT_TIMER_8 ilevel 4 ics ICS_SRS {


 if(oneShotA){
 CycleStart();
 }else{
 CycleStop();
 }
 T8IF_bit = 0;
}




void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 7 ics ICS_AUTO {
 uart_rd = UART2_Read();
 UART2_Write( uart_rd );

 U2RXIF_bit = 0;
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



void StepX() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {

 STmr.compOCxRunning = 2;
 TMR4 = 0xFFFF;
 OC3IF_bit = 0;

}
void StepY() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {

 STmr.compOCxRunning = 1;
 TMR2 = 0xFFFF;
 OC5IF_bit = 0;

}


void main() {
unsigned char j;

 PinMode();
 SetPinMode();
 StepperConstants(4500,4500);
 EnableInterrupts();
 oneShotA = 0;

 while(1){

 if((!RC3_bit)&&(!oneShotA)){

 oneShotA = 1;

 SV.px = 0;
 SV.py = 0;
 EnStepper();
 a = 2;

 }
 if(oneShotA){
 switch(a){
 case 0:
 STPS[X].mmToTravel = calcSteps(-25.25,8.06);
 speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
 STPS[Y].mmToTravel = calcSteps(125.25,8.06);
 speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
 T8IE_bit = 1;
 Step(STPS[X].mmToTravel, STPS[Y].mmToTravel);
 a = 1;
 SV.Tog = 1;
 break;
 case 1:
 SV.px = 0;
 SV.py = 0;
 if(SV.Tog == 1)a=2;
 break;
 case 2:
 STPS[X].mmToTravel = calcSteps(151.25,8.06);
 speed_cntr_Move(STPS[X].mmToTravel, 25000,X);
 STPS[Y].mmToTravel = calcSteps(-25.25,8.06);
 speed_cntr_Move(STPS[Y].mmToTravel, 25000,Y);
 T8IE_bit = 1;
 Step(STPS[X].mmToTravel, STPS[Y].mmToTravel);
 a = 3;
 SV.Tog = 1;
 break;
 case 3:
 SV.px = 0;
 SV.py = 0;
 if(SV.Tog == 1) a = 0;
 break;
 default: a = 2;
 break;
 }
 }
 if((!RB0_bit)&&(Toggle))oneShotA = 0;
 if(!oneShotA){
 DisableStepper();
 }

 if(!RB0_bit){
 oneShotB = 0;
 oneShotA = 0;
 STPS[X].mmToTravel = calcSteps(151.25,8.06);
 speed_cntr_Move(STPS[X].mmToTravel, 2500,X);
 STPS[Y].mmToTravel = calcSteps(-151.25,8.06);
 speed_cntr_Move(STPS[Y].mmToTravel, 2500,Y);



 sprintf(txt,"%d",STPS[0].accel_lim);
 I2C_LCD_Out(LCD_01_ADDRESS,1,1,txt);

 sprintf(txt,"%d",STPS[0].decel_start);
 I2C_LCD_Out(LCD_01_ADDRESS,1,11,txt);



 sprintf(txt,"%d",STPS[0].step_delay);
 I2C_LCD_Out(LCD_01_ADDRESS,2,1,txt);

 sprintf(txt,"%d",STPS[0].min_delay);
 I2C_LCD_Out(LCD_01_ADDRESS,2,11,txt);



 sprintf(txt,"%d",STPS[0].max_step_lim);
 I2C_LCD_Out(LCD_01_ADDRESS,3,1,txt);

 sprintf(txt,"%d",STPS[0].decel_val);
 I2C_LCD_Out(LCD_01_ADDRESS,3,11,txt);

 }

 }
}
