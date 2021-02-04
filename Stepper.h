#ifndef STEPPER_H
#define STEPPER_H


//extern bit PLS_Step_;sfr;
///////////////////////////////////////////
//sfr pin modes
//Xaxis
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
//Yaxis
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

//////////////////////////////////////////////
//defines
typedef unsigned short UInt8_t;
// Decide how many axis you would like to run
#define NoOfAxis 2
// Direction of stepper motor movement
#define CW  0
#define CCW 1

/*! \Brief Frequency of timer1 in [Hz].
 *
 * Modify this according to frequency used. Because of the prescaler setting,
 * the timer1 frequency is the clock frequency divided by 8.
 */
// Timer/Counter 1 running on 3,686MHz / 8 = 460,75kHz (2,17uS). (T1-FREQ 460750)
#define T1_FREQ   781250//781250=1.28us || 796150=1us   per tick
#define minSpeed  30210
#define maxSpeed  510

//! Number of (full)steps per round on stepper motor in use.
#define FSPR 200       // 200 Steps per rev
#define SPR (FSPR*16)  // FSPR * micro stepping of stepper drive

// Maths constants. To simplify maths when calculating in speed_cntr_Move().
#define ALPHA    (2*3.14159)/SPR                   // 2*pi/spr in rad
#define A_T_x100 (long)((ALPHA*T1_FREQ)*100)    // (ALPHA / T1_FREQ)*100
#define T1_FREQ_148 (long)((T1_FREQ*0.676)/100)      // divided by 100 and scaled by 0.676
#define A_SQ (long)(ALPHA*2*10000000000)                    // ALPHA*2*10000000000
#define A_x20000 (long)(ALPHA*20000)              // ALPHA*20000

// Speed ramp states
#define STOP  0
#define ACCEL 1
#define DECEL 2
#define RUN   3

// Constants for accelleration

  //! Stop and Start toggle bit
extern  unsigned int Toggle;

//////////////////////////////////////////
//structs enums and constants
typedef struct genVars{
  UInt8_t running: 1;       //running bit
  UInt8_t startPulses: 1;
  int   Tog;
  int   AxisNo;
  long  i;
  long  dx;
  long  dy;
  long  dz;
  long  px;
  long  py;
  long  pz;
  long  over;
  long  acc;
  long  dec;
  int   dirx;
  int   diry;
  int   dirz;
}sVars;
extern sVars SV;

typedef struct STPT {
//! micro sec counter
 long uSec;
//! axis that is used for accelertation see x = Pulse(n)??
 int axisTosample;
//! check for dly bits
 int howManyOCxRunning;
//! compare the vale of howmanyOCxrunning bits
 int compOCxRunning;
}StepTmr;
extern StepTmr STmr;

typedef struct Steps{
   //! micro sec  count value for clock pluse compare
  signed long microSec;
  //! Step bit check
  unsigned short CheckStep: 1;
  //! Direction stepper motor should move.
  unsigned short PLS_Step_ : 1;
  //!
  unsigned short StepBits:  1;
  //! axis to stop 1st
  unsigned short stopAxis: 1;
  //! What part of the speed ramp we are in.
  unsigned char run_state ;
  //! Peroid of next timer delay. At start this value set the accelration rate.
   long step_delay;
  //! What step_pos to start decelaration
   long decel_start;
  //! Sets deceleration rate.
   long decel_val;
  //! Minimum time delay (max speed)
   long min_delay;
  //! Counter used when accelerateing/decelerateing to calculate step_delay.
   long accel_count;
   long deccl_count;
  //! Counter used when accelerateing/decelerateing to calculate step_delay.
   long step_count;
  //! Counter used when accelerateing/decelerateing to calculate step_delay.
   long new_step_delay;
  //! Counter used when accelerateing/decelerateing to calculate step_delay.
   long last_accel_delay;
 //! Limit accelleration
   long accel_lim;
 // Limit the number of steps
   long max_step_lim;
 // calculation modulo value
   long rest;
 // Generate a startup delay to accellerate from
  long StartUp_delay;
 //!  the mm to travel
 signed long mmToTravel;
}STP;
extern STP STPS[NoOfAxis];

enum xyz{X,Y,Z};
enum axis_combination {xy,xz,yz};
enum swt{FALSE,TRUE};

//enum StepState{STOP,ACCEL,RUN,DECEL};

/////////////////////////////////////////
//global variables

/////////////////////////////////////////
//function prototypes
void SetPinMode();
void CycleStart();
void CycleStop();
void EnStepperX();
void EnStepperY();
void EnStepperZ();
void DisableStepper();
void speed_cntr_Move(long mmSteps, long speed, int axis_combo);
void speed_cntr_Init_Timer1(void);
static unsigned long sqrt_(unsigned long v);
unsigned int min_(unsigned long x, unsigned long y);
void DualAxisStep(long newx,long newy,int axis_combo);
void SingleAxisStep(long newxyz,int axis_No);
int Pulse(int axis_No);
void CalcDly(int axis_No);
void StepperConstants(long accel,long decel);
void toggleOCx(int axis_No);
void AccDec(int axix_No);
#endif