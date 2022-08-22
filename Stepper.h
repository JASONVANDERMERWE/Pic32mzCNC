#ifndef STEPPER_H
#define STEPPER_H

 #include "built_in.h"
 #include "Timers.h"
/*#include "I2C_LCD.h" */
#include "Kinematics.h"


//extern bit PLS_Step_;sfr;
///////////////////////////////////////////
//sfr pin modes
//Xaxis
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
//Yaxis
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
//Zaxis
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
//Aaxis
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

//////////////////////////////////////////////
//defines
typedef unsigned short UInt8_t;


// Decide how many axis you would like to run
#define NoOfAxis 6


// Direction of stepper motor movement
#define CW  0
#define CCW 1

/*! \Brief Frequency of timer1 in [Hz].
 * Newtimer 50000000
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


//Circle defines and consts
#define  Pi         3.14159
#define  rad2deg   (180.00/Pi)
#define  deg2rad   (Pi/180.00)


// Constants for accelleration

  //! Stop and Start toggle bit
extern  unsigned int Toggle;

//////////////////////////////////////////
//structs enums and constants
typedef struct genVars{
  char Single_Dual: 1;
  UInt8_t running: 1;       //running bit
  UInt8_t startPulses: 1;
  int   Tog;
  int   AxisNo;
  long  i;
  long  d2;
  long  dx;
  long  dy;
  long  dz;
  long  da;
  long  px;
  long  py;
  long  pz;
  long  pa;
  long  psingle;
  long  over;
  long  acc;
  long  dec;
  int   dirx;
  int   diry;
  int   dirz;
  int   dira;
  int   dirb;
  int   dirc;
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
  //! Distance calculated to travel
   long dist;
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


//enums
typedef enum xyz{X,Y,Z,A,B,C}_axis_;
typedef enum {xy,xz,yz,xa,ya,za}axis_combination ;
enum swt{FALSE,TRUE};

extern _axis_ _axis;
extern axis_combination axis_xyz;
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
void EnStepperA();
void DisableStepper();
void disableOCx();

//Acceleration, speed and Circ calcs
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



//Step control using Output compare module
int Pulse(int axis_No);
void toggleOCx(int axis_No);
void AccDec(int axis_No);
void Step_Cycle(int axis_No);
void Multi_Axis_Enable(axis_combination axis);
void Single_Axis_Enable(_axis_ axis_);
#endif