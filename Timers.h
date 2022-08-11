#ifndef TIMERS_H
#define TIMERS_H


#include "Config.h"
#include "built_in.h"
#include "I2C_LCD.h"
#include "Stepper.h"
////////////////////////////////////////////////////
//STRUCTS and ENUMS

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


void InitTimer1();
void InitTimer8();

#endif