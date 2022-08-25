#ifndef KINEMATICS_H
#define KINEMATICS_H

#include "Stepper.h"

//Circle defines and consts
#define  Pi         3.14159
#define  rad2deg   (180.00/Pi)
#define  deg2rad   (Pi/180.00)


extern void (*AxisPulse[3])();


//circular data
typedef struct{
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
int   dir;
int   quadrant_start;
double xRad;
double yRad;
double xStart;
double yStart;
double xFin;
double yFin;
}Circle;
extern Circle Circ;


///////////////////////////////////////////
//FUNCTION PROTOTYPES
//Move inline
void DualAxisStep(long newx,long newy,int axis_combo);
void SingleAxisStep(long newxyz,int axis_No);
//Circle move axis
void SetCircleVals(double curX,double curY,double i,double j, double deg,int dir);
void CalcRadius();
int  QuadrantStart(double i,double j);
int CircDir(int dir);
void CirInterpolation();
void Cir_Interpolation();
void Circ_Tick();
#endif