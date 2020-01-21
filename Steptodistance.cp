#line 1 "C:/Users/cfan/Dropbox/Dave's/Mikroc32/Pic32MZClicker2_Projects/StepperControl/Steptodistance.c"
#line 1 "c:/users/cfan/dropbox/dave's/mikroc32/pic32mzclicker2_projects/steppercontrol/steptodistance.h"







const float Dia;
#line 20 "c:/users/cfan/dropbox/dave's/mikroc32/pic32mzclicker2_projects/steppercontrol/steptodistance.h"
signed long calcSteps( double mmsToMove, double Dia);
#line 1 "c:/users/cfan/dropbox/dave's/mikroc32/pic32mzclicker2_projects/steppercontrol/stepper.h"








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
#line 74 "c:/users/cfan/dropbox/dave's/mikroc32/pic32mzclicker2_projects/steppercontrol/stepper.h"
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

 int step_delay;

 int decel_start;

 int decel_val;

 int min_delay;

 int accel_count;
 int deccl_count;

 int step_count;

 int new_step_delay;

 int last_accel_delay;

 int accel_lim;

 int max_step_lim;

 int rest;

 int StartUp_delay;

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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 8 "C:/Users/cfan/Dropbox/Dave's/Mikroc32/Pic32MZClicker2_Projects/StepperControl/Steptodistance.c"
signed long calcSteps(double mmsToMove, double Dia){
double circ,cirDivision,stepsToMove;




 circ = Dia* 3.142 ;



 cirDivision = mmsToMove / circ;
 stepsToMove = cirDivision *  ( 200 *16) ;

 return (signed long)stepsToMove;
}
