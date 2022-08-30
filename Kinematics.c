#include "Kinematics.h"

Circle Circ;

//////////////////////////////////
//FUNCTION POINTERS
void (*AxisPulse[3])();

char txtA[] = " : ";
char txtC[] =  "\r";
char txtB[200];
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
          Step_Cycle(axis_No);

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
          AxisPulse[1] = XY_Interpolate;
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
             AxisPulse[1]();

         break;
    case xz:
          AxisPulse[1] = XZ_Interpolate;
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
          AxisPulse[1]();
         break;
    case yz:
          AxisPulse[1] = YZ_Interpolate;
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
         AxisPulse[1]();
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
      Step_Cycle(X);
      if(SV.d2 < 0){
          SV.d2 += 2*SV.dy;
      }else{
          SV.d2 += 2 * (SV.dy - SV.dx);
          Step_Cycle(Y);
      }
   }else{
      Step_Cycle(Y);
      if(SV.d2 < 0){
         SV.d2 += 2 * SV.dx;
      }else{
         SV.d2 += 2 * (SV.dx - SV.dy);
         Step_Cycle(X);
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
      Step_Cycle(X);
      if(d2 < 0)
        d2 += 2*SV.dz;
      else{
        d2 += 2 * (SV.dz - SV.dx);
        Step_Cycle(Z);
      }

    }else{
        Step_Cycle(Z);
        if(d2 < 0)
            d2 += 2 * SV.dx;
        else{
            d2 += 2 * (SV.dx - SV.dz);
            Step_Cycle(X);
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
      Step_Cycle(Y);
      if(d2 < 0)
        d2 += 2*SV.dz;
      else{
        d2 += 2 * (SV.dz - SV.dy);
        Step_Cycle(Z);
      }
    }else{
      Step_Cycle(Z);
      if(d2 < 0)
         d2 += 2 * SV.dy;
      else{
         d2 += 2 * (SV.dy - SV.dz);
         Step_Cycle(Y);
      }
    }

}

/////////////////////////////////////////////////
//          Circular Interpolation             //
/////////////////////////////////////////////////

////////////////////////////////////////////////
//Set Circ values
void SetCircleVals(double curX,double curY,double finX,double finY,double i,double j, double deg,int dir){
 int str_len = 0;
 AxisPulse[2] = Circ_Prep_Next;
 Multi_Axis_Enable(xy);
 SV.Single_Dual = 2;
 Circ.xStart = curX;
 Circ.yStart = curY;
 Circ.xFin   = finX;
 Circ.yFin   = finY;
 Circ.I = i;
 Circ.J = j;
 CalcRadius();
 InitAngle();
  //find the quadrant that cir start pos is in
 Circ.quadrant = Quadrant(Circ.xRad,Circ.yRad);
 Circ.dir = CircDir(dir);
 CalcAngle();
 Circ.Deg.newdeg = deg;

 CalcDivisor();
 Circ.lastX = 0;
 Circ.lastY = 0;

}

/////////////////////////////////////////////////
//Check which direction to travel in
int CircDir(int dir){

   Circ.dir = dir;
   
   if(Circ.dir == CW)
       Circ.Deg.deg = 0.00;
   if(Circ.dir == CCW)
       Circ.Deg.deg = 360.00;

   return Circ.dir;
}

////////////////////////////////////////////////
//Calculate divisor / pulse value before incrament
void CalcDivisor(){
double newDeg;

   newDeg = 360.00 / Circ.Deg.degreeDeg;
   Circ.N = (2*Pi*Circ.radius)*newDeg;
   Circ.divisor = 1000.00;//ceil( Circ.N);//Circ.Deg.deg);
   Circ.Idivisor = (unsigned int)Circ.divisor;
}

////////////////////////////////////////////////
//Radius Calculation
void CalcRadius(){
   //no negative nums for sqroot
   Circ.XY.X = abs(Circ.I);
   Circ.XY.Y = abs(Circ.J);
   
   //radius position of Xrad and Yrad
   Circ.xRad = (Circ.xStart + Circ.I);
   Circ.yRad = (Circ.yStart + Circ.J);
   Circ.radius = sqrt((Circ.XY.X*Circ.XY.X) + (Circ.XY.Y*Circ.XY.Y ));
 
}

////////////////////////////////////////////////
//Get initial angle for calc
void InitAngle(){
 double angA;
 
  //get the deg of radiuss from abs zero pos
   //and convert  radans to degrees
   angA = atan2(Circ.XY.X,Circ.XY.Y);
   Circ.Deg.degreeDeg = angA * rad2deg;
}
////////////////////////////////////////////////
//Cac angle of attack to work out new x,y pos
void CalcAngle(){
 double angB;

   //deg is 360 or 0 and subtract the actual from deg
   if(Circ.quadrant == 1 || Circ.quadrant == 3)
       angB = Circ.Deg.deg - Circ.Deg.degreeDeg;
   else if(Circ.quadrant == 2 || Circ.quadrant == 4)
       angB = Circ.Deg.deg + Circ.Deg.degreeDeg;

   Circ.Deg.degreeRadians = angB * deg2rad;
}

/////////////////////////////////////////////////
//Get the Final cordinates of X,Y || 0 = fin pos
void NextCords(){

     if(Circ.quadrant == 1 || Circ.quadrant == 4){
       Circ.xStep = Circ.xRad + (Circ.radius * cos(Circ.Deg.degreeRadians));
       Circ.yStep = Circ.yRad + (Circ.radius * sin(Circ.Deg.degreeRadians));
     }
     if(Circ.quadrant == 2 || Circ.quadrant == 3){
       Circ.xStep = Circ.xRad - (Circ.radius * cos(Circ.Deg.degreeRadians));
       Circ.yStep = Circ.yRad - (Circ.radius * sin(Circ.Deg.degreeRadians));
     }

}

/////////////////////////////////////////////////
//Check which Quadrand the Head is in
int Quadrant(double i,double j){
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

///////////////////////////////////////////////////
//Interpolate Arc
void Cir_Interpolation(){
     Circ.lastX = Circ.xStep;
     Circ.lastY = Circ.yStep;
     CalcAngle();
     NextCords();

     STPS[X].step_delay = 100;
     STPS[Y].step_delay = 100;
     SerialPrint();
     if(Circ.lastX >= Circ.xStep){
         DIR_StepX = 0;
     }else{
         DIR_StepX = 1;
     }

     if(Circ.lastY >= Circ.yStep){
         DIR_StepY = 0;
      }else{
         DIR_StepY = 1;
      }

     LED1 = DIR_StepY;
     Circ_Tick();
}

void Circ_Tick(){

        if (Circ.dir == CW){
           Circ.Deg.deg += 1.0;
           if (Circ.Deg.deg == Circ.Deg.newdeg){
               disableOCx();
           }
        }

        if (Circ.dir == CCW){
           Circ.Deg.deg -= 1.0;
           if (Circ.Deg.deg == Circ.Deg.newdeg){
              disableOCx();
           }

        }
        SV.Single_Dual = 2;
}

/*
 * Pulse for the count of divisor before recalculating
 * the next x & y cords, this way we get a smother
 * transition and many straight lines to make to a circle.
 */
void Circ_Prep_Next(){
  Circ.steps++;

  toggleOCx(X);
  toggleOCx(Y);
   
  if(Circ.steps >= Circ.Idivisor){
    Circ.steps = 0;
    Circ.cir_next = 0;
    Circ.cir_start = 1;
  }

}

void SerialPrint(){
int str_len = 0;
int str_lenA = 0;
     str_lenA = strlen(txtA);
     memset(txtB,0,30);
      //Radius
     sprintf(txt,"%0.2f",Circ.radius);
     strncpy(txtB, " ",strlen(txt));
     strncat(txtB, txt,strlen(txt));
     str_len += strlen(txt);
     strncat(txtB,txtA,str_lenA);
     str_len += str_lenA;
      //xPos
     sprintf(txt,"%0.2f",Circ.xStep);
     strncat(txtB,txt,strlen(txt));
     str_len += strlen(txt);
     strncat(txtB,txtA,str_lenA);
     str_len += str_lenA;
     //xFin
     sprintf(txt,"%0.2f",Circ.yStep);
     strncat(txtB,txt,strlen(txt));
     str_len += strlen(txt);
     strncat(txtB,txtA,str_lenA);
     str_len += str_lenA;
     //Deg
     sprintf(txt,"%0.2f",Circ.xFin);
     strncat(txtB,txt,strlen(txt));
     str_len += strlen(txt)+1;
     strncat(txtB,txtA,str_lenA);
     str_len += str_lenA;
      //yFin
     sprintf(txt,"%0.2f",Circ.yFin);
     strncat(txtB,txt,strlen(txt));
     str_len += strlen(txt)+1;
     strncat(txtB,txtA,str_lenA);
     str_len += str_lenA;
      //newdeg
     sprintf(txt,"%0.2f",Circ.Deg.newdeg);
     strncat(txtB,txt,strlen(txt));
     str_len += strlen(txt)+1;
     strncat(txtB,txtA,str_lenA);
     str_len += str_lenA;
     //deg
     sprintf(txt,"%0.2f",Circ.Deg.deg);
     strncat(txtB,txt,strlen(txt));
     str_len += strlen(txt)+1;
     strncat(txtB,txtA,str_lenA);
     str_len += str_lenA;
     //rad
     sprintf(txt,"%d",Circ.quadrant);
     strncat(txtB,txt,strlen(txt));
     str_len += strlen(txt)+1;
     strncat(txtB,"\n",1);
     str_len += 2;
     strncat(txtB,txtA,str_lenA);
     str_len += str_lenA;

     UART2_Write_Text(txtB);
   /*  memcpy(txBuf, txtB, str_len+1);

     CHEN_DCH1CON_bit    = 1;     // Enable the DMA1 channel to transmit back what was received

     DCH1SSIZ            = str_len +1;
     CHEN_bit            = 1 ;
     CFORCE_DCH1ECON_bit = 1 ;                 // force DMA1 interrupt trigger
   */
}