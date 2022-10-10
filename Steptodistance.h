#ifndef STEPTODISTANCE_H
#define STEPTODISTANCE

#include "Stepper.h"
#include "built_in.h"

///////////////////////////////////////////////
//constants and defines

#define  Pi         3.141593
#define  M_PI       3.1416
#define  rad2deg    (180.00/Pi)
#define  deg2rad    (Pi/180.00)
#define MM_PER_INCH (25.40)
#define INCH_PER_MM (0.0393701)
const float Dia;


//////////////////////////////////////////////
//structs, unions and enums




/////////////////////////////////////////////
//function prototypes

signed long calcSteps( double mmsToMove, double Dia);




#endif