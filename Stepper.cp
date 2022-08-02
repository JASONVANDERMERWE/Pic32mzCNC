#line 1 "C:/Users/GIT/Pic32mzCNC/Stepper.c"
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
#line 81 "c:/users/git/pic32mzcnc/stepper.h"
extern unsigned int Toggle;



typedef struct genVars{
 UInt8_t running: 1;
 UInt8_t startPulses: 1;
 int Tog;
 int AxisNo;
 long i;
 long dx;
 long dy;
 long dz;
 long px;
 long py;
 long pz;
 long psingle;
 long over;
 long acc;
 long dec;
 int dirx;
 int diry;
 int dirz;
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
extern STP STPS[ 3 ];



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



enum xyz{X,Y,Z};
enum axis_combination {xy,xz,yz};
enum swt{FALSE,TRUE};








void SetPinMode();
void CycleStart();
void CycleStop();
void EnStepperX();
void EnStepperY();
void EnStepperZ();
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


void CalcRadius(Circle* cir);
int QuadrantStart(float i,float j);
void CircDir(Circle* cir);


int Pulse(int axis_No);
void toggleOCx(int axis_No);
void AccDec(int axix_No);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 7 "C:/Users/GIT/Pic32mzCNC/Stepper.c"
unsigned char txt1[] = "       ";
unsigned char AxisNo;
unsigned int Toggle;



 STP STPS[ 3 ];
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

sbit EN_StepZ at LATG14_bit;
sbit EN_Step_PinDirZ at TRISG14_bit;




sbit PLS_StepZ at LATE3_bit;
sbit PLS_Step_PinDirZ at TRISE3_bit;
sbit DIR_StepZ at LATG12_bit;
sbit DIR_Step_PinDirZ at TRISG12_bit;



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

void DisableStepper(){
 EN_StepX = 1;
 EN_StepY = 1;
 EN_StepZ = 1;
}
#line 128 "C:/Users/GIT/Pic32mzCNC/Stepper.c"
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
#line 213 "C:/Users/GIT/Pic32mzCNC/Stepper.c"
 SV.running = 1;
}



void CycleStop(){
int ii;
 STmr.uSec = 0;
 for(ii = 0;ii< 3 ;ii++){
 STPS[ii].microSec = 0;
 if(ii >  3 )break;
 }
}

void CycleStart(){
int ii;

 if(SV.Tog == 0){
 for(ii = 0; ii <  3 ;ii++){
 if(ii >  3 )break;
 STPS[ii].microSec++;
 }
 }
}
#line 242 "C:/Users/GIT/Pic32mzCNC/Stepper.c"
void SingleAxisStep(long newxyz,int axis_No){
int dir;
static long dist;
#line 249 "C:/Users/GIT/Pic32mzCNC/Stepper.c"
 switch(axis_No){
 case 0:OC5IE_bit = 1;OC5CONbits.ON = 1;
 OC3IE_bit = 0;OC3CONbits.ON = 0;
 OC8IE_bit = 0;OC8CONbits.ON = 0;
 break;
 case 1:OC5IE_bit = 0;OC5CONbits.ON = 0;
 OC3IE_bit = 1;OC3CONbits.ON = 1;
 OC8IE_bit = 0;OC8CONbits.ON = 0;
 break;
 case 2:OC5IE_bit = 0;OC5CONbits.ON = 0;
 OC3IE_bit = 0;OC3CONbits.ON = 0;
 OC8IE_bit = 1;OC8CONbits.ON = 1;
 break;
 default: break;
 }
 SV.psingle = 0;
 dist = newxyz - SV.psingle;
 dist = abs(dist);

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
 default: break;
 }
 if(SV.Tog == 0){
 for(STPS[axis_No].step_count = 0;STPS[axis_No].step_count < dist; ++STPS[axis_No].step_count){
 STmr.compOCxRunning = 0;
 toggleOCx(axis_No);
 Pulse(axis_No);

 while(STmr.compOCxRunning == 0);
 }
 }

 disableOCx();
}

void DualAxisStep(long newx,long newy,int axis_combo){
 long i;
 static long d2;
 SV.over=0;
 d2 = 0;

 SV.px = 0;
 SV.py = 0;
 SV.pz = 0;
#line 311 "C:/Users/GIT/Pic32mzCNC/Stepper.c"
 switch(axis_combo){
 case xy:
 OC5IE_bit = 1;OC5CONbits.ON = 1;
 OC3IE_bit = 1;OC3CONbits.ON = 1;
 OC8IE_bit = 0;OC8CONbits.ON = 0;
 SV.dx = newx - SV.px;
 SV.dy = newy - SV.py;

 SV.dirx = SV.dx > 0?1:-1;
 SV.diry = SV.dy > 0?1:-1;

 if(SV.dirx < 0)DIR_StepX =  1 ;
 else DIR_StepX =  0 ;
 if(SV.diry < 0) DIR_StepY =  1 ;
 else DIR_StepY =  0 ;
 SV.dx = abs(SV.dx);
 SV.dy = abs(SV.dy);

 if(SV.dx > SV.dy) d2 = 2*(SV.dy - SV.dx);
 else d2 = 2* (SV.dx - SV.dy);
 if(SV.Tog == 0){
 LATE7_bit = 1;
 if(SV.dx > SV.dy){
 for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
 STmr.compOCxRunning = 0;
 toggleOCx(X);
 Pulse(X);
 if(d2 < 0)d2 += 2*SV.dy;
 else{
 d2 += 2 * (SV.dy - SV.dx);
 toggleOCx(Y);
 Pulse(Y);
 }

 while(STmr.compOCxRunning == 0);
 }
 }else{
 for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
 STmr.compOCxRunning = 0;
 toggleOCx(Y);
 Pulse(Y);
 if(d2 < 0)d2 += 2 * SV.dx;
 else{
 d2 += 2 * (SV.dx - SV.dy);
 toggleOCx(X);
 Pulse(X);
 }

 while(STmr.compOCxRunning == 0);
 }
 }
 }
 break;
 case xz:
 OC5IE_bit = 1;OC5CONbits.ON = 1;
 OC3IE_bit = 0;OC3CONbits.ON = 0;
 OC8IE_bit = 1;OC8CONbits.ON = 1;
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
 if(SV.Tog == 0){
 LATE7_bit = 1;
 if(SV.dx > SV.dz){
 for(STPS[X].step_count = 0;STPS[X].step_count < SV.dx; ++STPS[X].step_count){
 STmr.compOCxRunning = 0;
 toggleOCx(X);
 Pulse(X);
 if(d2 < 0)d2 += 2*SV.dz;
 else{
 d2 += 2 * (SV.dz - SV.dx);
 toggleOCx(Z);
 Pulse(Z);
 }

 while(STmr.compOCxRunning == 0);
 }
 }else{
 for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
 STmr.compOCxRunning = 0;
 toggleOCx(Z);
 Pulse(Z);
 if(d2 < 0)d2 += 2 * SV.dx;
 else{
 d2 += 2 * (SV.dx - SV.dz);
 toggleOCx(X);
 Pulse(X);
 }

 while(STmr.compOCxRunning == 0);
 }
 }
 }
 break;
 case yz:
 OC5IE_bit = 0;OC5CONbits.ON = 0;
 OC3IE_bit = 1;OC3CONbits.ON = 1;
 OC8IE_bit = 1;OC8CONbits.ON = 1;
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
 if(SV.Tog == 0){
 LATE7_bit = 1;
 if(SV.dy > SV.dz){
 for(STPS[Y].step_count = 0;STPS[Y].step_count < SV.dy; ++STPS[Y].step_count){
 STmr.compOCxRunning = 0;
 toggleOCx(Y);
 Pulse(Y);
 if(d2 < 0)d2 += 2*SV.dz;
 else{
 d2 += 2 * (SV.dz - SV.dy);
 toggleOCx(Z);
 Pulse(Z);
 }

 while(STmr.compOCxRunning == 0);
 }
 }else{
 for(STPS[Z].step_count = 0;STPS[Z].step_count < SV.dz; ++STPS[Z].step_count){
 STmr.compOCxRunning = 0;
 toggleOCx(Z);
 Pulse(Z);
 if(d2 < 0)d2 += 2 * SV.dy;
 else{
 d2 += 2 * (SV.dy - SV.dz);
 toggleOCx(Y);
 Pulse(Y);
 }

 while(STmr.compOCxRunning == 0);
 }
 }
 }

 break;
 default: break;

 }



 disableOCx();
#line 483 "C:/Users/GIT/Pic32mzCNC/Stepper.c"
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
 case 2: OC8R = 0x5;
 OC8RS = STPS[Z].step_delay & 0xFFFF;
 TMR6 = 0xFFFF;
 OC8CON = 0x8004;
 break;
 default:
 break;
 }

}


void disableOCx(){
 OC5IE_bit = 0;OC5CONbits.ON = 0;
 OC3IE_bit = 0;OC3CONbits.ON = 0;
 OC8IE_bit = 0;OC8CONbits.ON = 0;
}


int Pulse(int axis_No){

 if(!STPS[axis_No].PLS_Step_ ){
 STPS[axis_No].PLS_Step_ = 1;
 }

 switch(STPS[axis_No].run_state) {
 case  0 :
 LATE7_bit = 0;
 T8IE_bit = 0;
 SV.Tog = 1;
 break;

 case  1 :
 AccDec(axis_No);
#line 608 "C:/Users/GIT/Pic32mzCNC/Stepper.c"
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
#line 664 "C:/Users/GIT/Pic32mzCNC/Stepper.c"
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
#line 700 "C:/Users/GIT/Pic32mzCNC/Stepper.c"
unsigned int min_(unsigned int x, unsigned int y)
{
 if(x < y){
 return x;
 }
 else{
 return y;
 }
}



void StepX() iv IVT_OUTPUT_COMPARE_3 ilevel 3 ics ICS_AUTO {

 STmr.compOCxRunning = 1;
 TMR4 = 0xFFFF;
 OC3IF_bit = 0;

}
void StepY() iv IVT_OUTPUT_COMPARE_5 ilevel 3 ics ICS_AUTO {

 STmr.compOCxRunning = 2;
 TMR2 = 0xFFFF;
 OC5IF_bit = 0;

}
void StepZ() iv IVT_OUTPUT_COMPARE_8 ilevel 3 ics ICS_AUTO {

 STmr.compOCxRunning = 3;
 TMR6 = 0xFFFF;
 OC8IF_bit = 0;

}
