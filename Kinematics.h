#ifndef KINEMATICS_H
#define KINEMATICS_H

#include "Stepper.h"


extern void (*AxisPulse)();

//circular data
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
void CalcRadius(Circle* cir);
int QuadrantStart(float i,float j);
void CircDir(Circle* cir);
void Cir_Interpolation(float xPresent,float yPresent,Circle* cir);
#endif