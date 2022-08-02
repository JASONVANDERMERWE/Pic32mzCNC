#include "Steptodistance.h"





signed long calcSteps(double mmsToMove,  double Dia){
double circ,cirDivision,stepsToMove;


///////////////////////////////////////////
// calculate the circumfrence
       circ = Dia*Pi;

//////////////////////////////////////////
//use the circumfrence and spr to get steps
      cirDivision = mmsToMove / circ;
      stepsToMove = cirDivision * SPR;
      
      return (signed long)stepsToMove;
}