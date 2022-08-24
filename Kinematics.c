#include "Kinematics.h"

Circle Circ;

//////////////////////////////////
//FUNCTION POINTERS
void (*AxisPulse)();

//////////////////////////////////
//static file vars
static long d2;


/*****************************************************
*single axix step rate need to be doubled to compensate
*speed increase due to no 2nd axis interpolation
*use a dummy axis or increase the speed
*****************************************************/
void SingleAxisStep(long newxyz,int axis_No){
int dir;
//static long dist;
       /*if(SV.psingle != newxyz)
          SV.psingle = newxyz;
       else*/
     SV.Single_Dual = 0;
     switch(axis_No){
       case X:
              Single_Axis_Enable(X);
              break;
       case Y:
              Single_Axis_Enable(Y);
              break;
       case Z:
              Single_Axis_Enable(Z);
              break;
       case A:
              Single_Axis_Enable(A);
              break;
       default: break;
     }
     SV.psingle  = 0;
     STPS[axis_No].dist = newxyz - SV.psingle;
     STPS[axis_No].dist = abs(STPS[axis_No].dist);

     if(newxyz < 0)
           dir = CCW;
     else
           dir = CW;

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
       case A:
            DIR_StepA = dir;
            break;
       default: break;
     }

          STPS[axis_No].step_count = 0;
          //Start output compare module
          Step_Cycle(axis_No,Lin);

}

//////////////////////////////////////////////////////////
//         DUAL AXIS INTERPOLATION SECTION              //
//////////////////////////////////////////////////////////
void DualAxisStep(long newx,long newy,int axis_combo){

   SV.over=0;
   //will need to change these 3 lines when implimenting position referenc??
   SV.px = 0;
   SV.py = 0;
   SV.pz = 0;
/*!
 *use Bressenhams algorithm here
 */
  SV.Single_Dual = 1;
  switch(axis_combo){
    case xy:
          AxisPulse = XY_Interpolate;
          axis_xyz = xy;
          Multi_Axis_Enable(axis_xyz);

          SV.dx   = newx - SV.px;           // distance to move (delta)
          SV.dy   = newy - SV.py;

          // direction to move
          SV.dirx = SV.dx > 0?1:-1;
          SV.diry = SV.dy > 0?1:-1;

          // Set direction from sign on step value.
          if(SV.dirx < 0)
            DIR_StepX = CCW;
          else
            DIR_StepX = CW;

          if(SV.diry < 0)
            DIR_StepY = CCW;
          else
            DIR_StepY = CW;

          SV.dx = abs(SV.dx);
          SV.dy = abs(SV.dy);

          if(SV.dx > SV.dy)
             SV.d2 = 2*(SV.dy - SV.dx);
          else
             SV.d2 = 2* (SV.dx - SV.dy);

             STPS[X].step_count = 0;
             STPS[Y].step_count = 0;
             AxisPulse();

         break;
    case xz:
          AxisPulse = XZ_Interpolate;
          axis_xyz = xz;
          Multi_Axis_Enable(axis_xyz);

          SV.dx   = newx - SV.px;           // distance to move (delta)
          SV.dz   = newy - SV.pz;

          // direction to move
          SV.dirx = SV.dx > 0?1:-1;
          SV.dirz = SV.dz > 0?1:-1;

          // Set direction from sign on step value.
          if(SV.dirx < 0)DIR_StepX = CCW;
          else DIR_StepX = CW;

          if(SV.dirz < 0) DIR_StepZ = CCW;
          else DIR_StepZ = CW;

          SV.dx = abs(SV.dx);
          SV.dz = abs(SV.dz);

          if(SV.dx > SV.dz) d2 = 2*(SV.dz - SV.dx);
          else d2 = 2* (SV.dx - SV.dz);

          STPS[X].step_count = 0;
          STPS[Z].step_count = 0;
          AxisPulse();
         break;
    case yz:
          AxisPulse = YZ_Interpolate;
          axis_xyz = yz;
          Multi_Axis_Enable(axis_xyz);

          // distance to move (delta)
          SV.dy   = newx - SV.pz;
          SV.dz   = newy - SV.py;

          // direction to move
          SV.diry = SV.dy > 0?1:-1;
          SV.dirz = SV.dz > 0?1:-1;

          // Set direction from sign on step value.
          if(SV.diry < 0)DIR_StepY = CCW;
          else DIR_StepY = CW;
          if(SV.dirz < 0) DIR_StepZ = CCW;
          else DIR_StepZ = CW;

          SV.dy = abs(SV.dy);
          SV.dz = abs(SV.dz);

         if(SV.dy > SV.dz) d2 = 2*(SV.dz - SV.dy);
         else d2 = 2* (SV.dy - SV.dz);

         STPS[Y].step_count = 0;
         STPS[Z].step_count = 0;
         AxisPulse();
         break;
    default: break;

  }
}

//////////////////////////////////////////////////////////
// X AXIS COMBOS
void XY_Interpolate(){
   if((STPS[X].step_count > SV.dx)||(STPS[Y].step_count > SV.dy)){
        StopX();
        StopY();
        return;
   }

   if(SV.dx > SV.dy){
      Step_Cycle(X,Lin);
      if(SV.d2 < 0){
          SV.d2 += 2*SV.dy;
      }else{
          SV.d2 += 2 * (SV.dy - SV.dx);
          Step_Cycle(Y,Lin);
      }
   }else{
      Step_Cycle(Y,Lin);
      if(SV.d2 < 0){
         SV.d2 += 2 * SV.dx;
      }else{
         SV.d2 += 2 * (SV.dx - SV.dy);
         Step_Cycle(X,Lin);
       }
    }
}

void XZ_Interpolate(){

    if((STPS[X].step_count > SV.dx)||(STPS[Z].step_count > SV.dz)){
        StopX();
        StopZ();

        return;
    }

   if(SV.dx > SV.dz){
      Step_Cycle(X,Lin);
      if(d2 < 0)
        d2 += 2*SV.dz;
      else{
        d2 += 2 * (SV.dz - SV.dx);
        Step_Cycle(Z,Lin);
      }

    }else{
        Step_Cycle(Z,Lin);
        if(d2 < 0)
            d2 += 2 * SV.dx;
        else{
            d2 += 2 * (SV.dx - SV.dz);
            Step_Cycle(X,Lin);
        }
     }
}

void YZ_Interpolate(){
    if((STPS[Y].step_count > SV.dy)||(STPS[Z].step_count > SV.dz)){
       StopY();
       StopZ();
       return;
    }

    if(SV.dy > SV.dz){
      Step_Cycle(Y,Lin);
      if(d2 < 0)
        d2 += 2*SV.dz;
      else{
        d2 += 2 * (SV.dz - SV.dy);
        Step_Cycle(Z,Lin);
      }
    }else{
      Step_Cycle(Z,Lin);
      if(d2 < 0)
         d2 += 2 * SV.dy;
      else{
         d2 += 2 * (SV.dy - SV.dz);
         Step_Cycle(Y,Lin);
      }
    }

}

/////////////////////////////////////////////////
//          Circular Interpolation             //
/////////////////////////////////////////////////

////////////////////////////////////////////////
//Set Circ values
void SetCircleVals(Circle* cir,float curX,float curY,float i,float j, float deg,int dir){

 cir->I = i;
 cir->J = j;
 cir->xStart = curX;
 cir->yStart = curY;
 cir->degreeDeg = deg;
 cir = CircDir(dir);
 
}

/////////////////////////////////////////////////
//Check which Quadrand the Head is in
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


/////////////////////////////////////////////////
//Check which direction to travel in
Circle* CircDir(int dir){
Circle circ;
float newDeg;
   circ.dir = dir;
   if(dir == CW){
        newDeg = 360 / circ.deg;
        circ.N = (2*Pi*circ.radius)/newDeg;
        circ.divisor = circ.deg / newDeg;
   }

   if(circ.dir == CW)
       circ.deg = 0.00;
   if(circ.dir == CCW)
       circ.deg = 360.00;
       
   return &circ;
}

////////////////////////////////////////////////
//Radius Calculation
void CalcRadius(Circle* cir){
 float xRad,yRad,X,Y,angA,angB;

   cir->xRad = fabs(cir->xStart + cir->I);
   cir->yRad = fabs(cir->yStart + cir->J);
   cir->radius = sqrt((cir->xRad*cir->xRad) + (cir->yRad*cir->yRad));
   angA = atan2(cir->yRad,cir->xRad);


   cir->degreeDeg = angA * rad2deg;

   cir->quadrant_start = QuadrantStart(cir->I,cir->J);
    //deg is 360 or 0 and subtract the actual from deg
   if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
       angB = cir->deg - cir->degreeDeg;
   if(cir->quadrant_start == 1 || cir->quadrant_start == 3)
       angB = cir->deg + cir->degreeDeg;

   cir->degreeRadians = angB * deg2rad;
}

///////////////////////////////////////////////////
//Interpolate Arc
void Cir_Interpolation(float xPresent,float yPresent,Circle* cir){
static int quad = 1;
      cir->xStart = xPresent;
      cir->yStart = yPresent;
      CalcRadius(cir);
      quad = QuadrantStart(cir->I,cir->J);

    while(quad){
       //break;//!!!
       if(quad == 1 || quad == 4){
         cir->xFin = cir->xRad + (cir->radius * cos(cir->degreeRadians));
         cir->yFin = cir->yRad + (cir->radius * sin(cir->degreeRadians));
       }
       if(quad == 2 || quad == 3){
         cir->xFin = cir->xRad - (cir->radius * cos(cir->degreeRadians));
         cir->yFin = cir->yRad - (cir->radius * sin(cir->degreeRadians));
       }
       Circ_Tick(cir);
       CalcRadius(cir);
     }
}




void Circ_Tick(Circle* cir){
static float lastX,lastY;
        if (cir->dir == CW){
           cir->deg += cir->divisor;
           if (cir->deg >= cir->degreeDeg){
               disableOCx();
           }
        }

        if (cir->dir == CCW){
           cir->deg -= cir->divisor;
           if (cir->deg <= cir->degreeDeg){
              disableOCx();
           }

        }

        if(cir->xFin > lastX){
           Step_Cycle(X,Cir);
           lastX = cir->xFin;
        }
        if(cir->yFin > lastY){
           Step_Cycle(Y,Cir);
           lastY = cir->yFin;
        }
        
}



