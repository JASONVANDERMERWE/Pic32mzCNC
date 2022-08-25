#ifndef KINEMATICS_H
#define KINEMATICS_H

#include "Stepper.h"

//Circle defines and consts
#define  Pi         3.14159
#define  rad2deg   (180.00/Pi)
#define  deg2rad   (Pi/180.00)


extern void (*AxisPulse)();


//circular data
typedef struct{
char  oneshot: 1;
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
int   dir;
int   quadrant_start;
float xRad;
float yRad;
float xStart;
float yStart;
float xFin;
float yFin;
}Circle;
extern Circle Circ;


///////////////////////////////////////////
//FUNCTION PROTOTYPES
//Move inline
void DualAxisStep(long newx,long newy,int axis_combo);
void SingleAxisStep(long newxyz,int axis_No);
//Circle move axis
void SetCircleVals(Circle* cir,float curX,float curY,float i,float j, float deg,int dir);
void CalcRadius(Circle* cir);
int  QuadrantStart(float i,float j);
Circle* CircDir(int dir,float xPresent,float yPresent);
void Cir_Interpolation(Circle* cir);
void Circ_Tick(Circle* cir);
#endif