#line 1 "C:/Users/Git/Pic32mzCNC/Stepper.c"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 7 "C:/Users/Git/Pic32mzCNC/Stepper.c"
unsigned char txt1[] = "       ";
unsigned char AxisNo;
unsigned int Toggle;



 STP STPS[ 2 ];
 sVars SV;
 StepTmr STmr;





sbit EN_StepX at LATG0_bit;
sbit EN_Step_PinDirX at TRISG0_bit;




sbit PLS_StepX at LATF1_bit;
sbit PLS_Step_PinDirX at TRISF1_bit;
sbit DIR_StepX at LATG1_bit;
sbit DIR_Step_PinDirX at TRISG1_bit;

sbit EN_StepY at LATF0_bit;
sbit EN_Step_PinDirY at TRISF0_bit;




sbit PLS_StepY at LATD4_bit;
sbit PLS_Step_PinDirY at TRISD4_bit;
sbit DIR_StepY at LATD5_bit;
sbit DIR_Step_PinDirY at TRISD5_bit;





void SetPinMode(){
 AxisNo =

 EN_Step_PinDirX = 0;


 PLS_Step_PinDirX = 0;
 DIR_Step_PinDirX = 0;

 EN_Step_PinDirY = 0;


 PLS_Step_PinDirY = 0;
 DIR_Step_PinDirY = 0;
}



void StepperConstants(long accel,long decel){
 SV.acc = accel;
 SV.dec = decel;
}



void EnStepper(){



 EN_StepX = 0;



 EN_StepY = 0;
}

void DisableStepper(){
 EN_Stepx = 1;
 EN_StepY = 1;
}
#line 104 "C:/Users/Git/Pic32mzCNC/Stepper.c"
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

 SV.Tog = 0;
 SV.px = 0;
 SV.py = 0;
 SV.running = 1;
}



void CycleStop(){
int ii;
 STmr.uSec = 0;
 for(ii = 0;ii< 2 ;ii++){
 STPS[ii].microSec = 0;
 if(ii >  2 )break;
 }
}

void CycleStart(){
int ii;

 if(SV.Tog == 0){
 for(ii = 0; ii <  2 ;ii++){
 if(ii >  2 )break;
 STPS[ii].microSec++;
 }
 }
}

void Step(long newx,long newy){
 long i;
 static long d2;
 SV.over=0;
 d2 = 0;
 SV.px = 0;
 SV.py = 0;
#line 223 "C:/Users/Git/Pic32mzCNC/Stepper.c"
 SV.dx = newx - SV.px;
 SV.dy = newy - SV.py;

 SV.dirx = SV.dx > 0?1:-1;
 SV.diry = SV.dy > 0?1:-1;

 if(SV.dirx < 0)DIR_StepX =  1 ;
 else DIR_StepX =  0 ;
 if(SV.dirY < 0) DIR_StepY =  1 ;
 else DIR_StepY =  0 ;

 SV.dx = abs(SV.dx);
 SV.dy = abs(SV.dy);

 if(SV.dx > SV.dy) d2 = 2*(SV.dy - SV.dx);
 else d2 = 2* (SV.dx - SV.dy);


 if(SV.Tog == 0){
 LATE7_bit = 1;
 if(SV.dx > SV.dy){
 for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count) {

 STmr.compOCxRunning = 0;
 toggleOCx(X);
 Pulse(X);
 if(d2 < 0)d2 += 2*SV.dy;
 else{
 d2 += 2 * (SV.dy - SV.dx);
 toggleOCx(Y);
 Pulse(Y);
 }


 while(STmr.compOCxRunning != 1);
 }
 }else{

 for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count) {

 STmr.compOCxRunning = 0;
 toggleOCx(Y);
 Pulse(Y);
 if(d2 < 0)d2 += 2 * SV.dx;
 else{
 d2 += 2 * (SV.dx - SV.dy);
 toggleOCx(X);
 Pulse(X);
 }

 while(STmr.compOCxRunning != 2);
 }
 }

 }
#line 284 "C:/Users/Git/Pic32mzCNC/Stepper.c"
}




void toggleOCx(int axis_No){
 switch(axis_No){
 case 0: OC5R = 0x5;
 OC5RS = STPS[X].step_delay & 0xFFFF;
 TMR2 = 0xFFFF;
 OC5CON = 0x8004;
 break;
 case 1: OC3R = 0x5;
 OC3RS = STPS[Y].step_delay & 0xFFFF;
 TMR4 = 0xFFFF;
 OC3CON = 0x8004;
 break;
 default:
 break;
 }

}


int Pulse(int axis_No){

 if(!STPS[axis_No].PLS_Step_ ){
#line 315 "C:/Users/Git/Pic32mzCNC/Stepper.c"
 STPS[axis_No].PLS_Step_ = 1;

 }
#line 321 "C:/Users/Git/Pic32mzCNC/Stepper.c"
 switch(STPS[axis_No].run_state) {
 case  0 :
 LATE7_bit = 0;
 T8IE_bit = 0;
 SV.Tog = 1;
 break;

 case  1 :
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



 AccDec(axis_No);
 if(STPS[axis_No].accel_count >= -2 ){
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
#line 389 "C:/Users/Git/Pic32mzCNC/Stepper.c"
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
#line 425 "C:/Users/Git/Pic32mzCNC/Stepper.c"
unsigned int min_(unsigned int x, unsigned int y)
{
 if(x < y){
 return x;
 }
 else{
 return y;
 }
}
