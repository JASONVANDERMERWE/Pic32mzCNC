#include "Kinematics.h"

const code double max_sizes[]={X_MAX_SIZE,Y_MAX_SIZE,Z_MAX_SIZE,A_MAX_SIZE,B_MAX_SIZE,C_MAX_SIZE};
//////////////////////////////////
//FUNCTION POINTERS
volatile void (*AxisPulse[3])();

char txtA[] = " : ";
char txtC[] =  "\r";
char txtB[200];
//////////////////////////////////
//static file vars
static long d2;

///////////////////////////////////////////////////////
//         INITIALIZE THE AXIS AND PLATFROM          //
///////////////////////////////////////////////////////
void SetInitialSizes(STP axis[6]){
int i = 0;

  for (i = 0;i<NoOfAxis;i++){
    axis[i].max_travel = max_sizes[i];//SIZE_LIST[i];
  }
}

/*****************************************************
*single axix step rate need to be doubled to compensate
*speed increase due to no 2nd axis interpolation
*use a dummy axis or increase the speed
*****************************************************/
void SingleAxisStep(long newxyz,int axis_No){
int dir;
char txt_[9];
//static long dist;
      /* if(SV.psingle != newxyz)
             SV.psingle = newxyz; */

     STPS[axis_No].axis_dir = Direction(newxyz);
     SV.Single_Dual = 0;
     SV.psingle  = 0;
     Single_Axis_Enable(axis_No);
     STPS[axis_No].dist = newxyz - SV.psingle;
     STPS[axis_No].dist = abs(STPS[axis_No].dist);

   /*  switch(axis_No){
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
     }*/

     dir = (newxyz < 0)? CCW : CW;
     switch(axis_No){
       case X:
            DIR_StepX = (X_DIR_DIR ^ dir) & 0x0001;//(X_DIR_DIR)?dir:~dir;
            break;
       case Y:
            DIR_StepY = (Y_DIR_DIR ^ dir) & 0x0001;
            break;
       case Z:
            DIR_StepZ = (Z_DIR_DIR ^ dir) & 0x0001;
            break;
       case A:
            DIR_StepA = (A_DIR_DIR ^ dir) & 0x0001;
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
//this mus become more code efficient by supplying pointer
//arguments ???
void DualAxisStep(long axis_a,long axis_b,int axis_combo){
int dirA,dirB,dirC;
   SV.over=0;
   //will need to change these 3 lines when implimenting position referenc??
   SV.px = 0;
   SV.py = 0;
   SV.pz = 0;
   SV.d2 = 0;


  SV.Single_Dual = 1;

  switch(axis_combo){
    case xy:
          //Assign function from Stepper.c to function ptr
          AxisPulse[1] = &XY_Interpolate;
          // set the enum variable
          axis_xyz = xy;
          //set the direction counter for absolute position
          STPS[X].axis_dir = Direction(axis_a);
          STPS[Y].axis_dir = Direction(axis_b);
          //Enable the relevant axis in Stepper.c
          Multi_Axis_Enable(axis_xyz);
          //Delta distance to move
          SV.dx   = axis_a - SV.px;
          SV.dy   = axis_b - SV.py;
          
          // Set direction from sign on step value.
          //Set the Dir_bits
          dirA = SV.dx > 0? CW:CCW;
          dirB = SV.dy > 0? CW:CCW;
          //inversion mask
          DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
          DIR_StepY = (Y_DIR_DIR ^ dirB) & 0x0001;
          //Remove -ve values
          SV.dx = abs(SV.dx);
          SV.dy = abs(SV.dy);
          //Start values for Bresenhams
          if(SV.dx > SV.dy)
             SV.d2 = BresDiffVal(SV.dy,SV.dx);//2*(SV.dy - SV.dx);
          else
             SV.d2 = BresDiffVal(SV.dx,SV.dy);//2* (SV.dx - SV.dy);

          if(SV.dx >= SV.dy){
             STPS[X].master = 1;
             STPS[Y].master = 0;
          }else{
             STPS[X].master = 0;
             STPS[Y].master = 1;
          }

           STPS[X].step_count = 0;
           STPS[Y].step_count = 0;
           AxisPulse[1]();

         break;
    case xz:
          //Assign function from Stepper.c to function ptr
          AxisPulse[1] = &XZ_Interpolate;
          // set the enum variable
          axis_xyz = xz;
          //set the direction counter for absolute position
          STPS[X].axis_dir = Direction(axis_a);
          STPS[Z].axis_dir = Direction(axis_b);
          //Enable the relevant axis in Stepper.c
          Multi_Axis_Enable(axis_xyz);
          
          // Set direction from sign on step value.
          //Delta distance to move
          SV.dx   = axis_a - SV.px;
          SV.dz   = axis_b - SV.pz;
          //Set the Dir_bits
          dirA = SV.dx > 0? CW:CCW;
          dirB = SV.dz > 0? CW:CCW;
          //Inversion mask
          DIR_StepX = (X_DIR_DIR ^ dirA) & 0x0001;
          DIR_StepZ = (Z_DIR_DIR ^ dirB) & 0x0001;
          //Remove -ve values
          SV.dx = abs(SV.dx);
          SV.dz = abs(SV.dz);

          if(SV.dx > SV.dz) 
             d2 = BresDiffVal(SV.dz,SV.dx);//2*(SV.dz - SV.dx);
          else 
             d2 = BresDiffVal(SV.dx,SV.dx);//2* (SV.dx - SV.dz);

          STPS[X].step_count = 0;
          STPS[Z].step_count = 0;
          AxisPulse[1]();
         break;
    case yz:
          //Assign function from Stepper.c to function ptr
          AxisPulse[1] = &YZ_Interpolate;
          // set the enum variable
          axis_xyz = yz;
          STPS[Y].axis_dir = Direction(axis_a);
          STPS[Z].axis_dir = Direction(axis_b);
          //Enable the relevant axis in Stepper.c
          Multi_Axis_Enable(axis_xyz);

          // Set direction from sign on step value.
          //Delta distance to move
          SV.dy   = axis_a - SV.pz;
          SV.dz   = axis_b - SV.py;
          // direction to move
          dirA = SV.dy > 0? CW:CCW;
          dirB = SV.dz > 0? CW:CCW;
          //Inversion mask
          DIR_StepY = (Y_DIR_DIR ^ dirA) & 0x0001;
          DIR_StepZ = (Z_DIR_DIR ^ dirB) & 0x0001;
          //Remove -ve
          SV.dy = abs(SV.dy);
          SV.dz = abs(SV.dz);

         if(SV.dy > SV.dz)
            SV.d2 = BresDiffVal(SV.dz,SV.dy);//2*(SV.dz - SV.dy);
         else 
            SV.d2 = BresDiffVal(SV.dy,SV.dz);//2* (SV.dy - SV.dz);

         STPS[Y].step_count = 0;
         STPS[Z].step_count = 0;
         AxisPulse[1]();
         break;
    default: break;

  }
}




///////////////////////////////////////////////////////////////////////////////
//     Circular Interpolation taken from Grbl as it uses Rotation matrix     //
///////////////////////////////////////////////////////////////////////////////

/*/////////////////////////////////////////////////////////////////////////////
*GCODE uses either radius or I,J,K for offset / this function can condition
*for either standard / offset is mostly a byEuropean standard and
*radius mostly an American standard
/////////////////////////////////////////////////////////////////////////////*/

//TODO: change function arguments to struct that holds positions, targets etc
//      as arrays for GCODE sampling and conditioning mostly to compensate for
//      for 3 axis helix movement/spiraling; for test purposes we keep
//      axix_linear_per_segment as 0 test 2D plane circle
void r_or_ijk(double Cur_axis_a,double Cur_axis_b,double Fin_axis_a,double Fin_axis_b,
              double r, double i, double j, double k, int axis_A,int axis_B,int dir){
unsigned short isclockwise = 0;
double inverse_feed_rate = -1; // negative inverse_feed_rate means no inverse_feed_rate specified
double position[NoOfAxis];
double target[NoOfAxis];
double offset[NoOfAxis];
double x = 0.00;
double y = 0.00;
double h_x2_div_d = 0.00;
unsigned int axis_plane_a,axis_plane_b;
char txt_[9];
     //use thess arrays to simplify call to arc function
     position[axis_A] = Cur_axis_a;
     position[axis_B] = Cur_axis_b;
     target[axis_A] = Fin_axis_a;
     target[axis_B] = Fin_axis_b;
     offset[axis_A] = i;
     offset[axis_B] = j;

     if (r != 0.00) { // Arc Radius Mode
            /*
              We need to calculate the center of the circle that has the designated radius and passes
              through both the current position and the target position. This method calculates the following
              set of equations where [x,y] is the vector from current to target position, d == magnitude of
              that vector, h == hypotenuse of the triangle formed by the radius of the circle, the distance to
              the center of the travel vector. A vector perpendicular to the travel vector [-y,x] is scaled to the
              length of h [-y/d*h, x/d*h] and added to the center of the travel vector [x/2,y/2] to form the new point
              [i,j] at [x/2-y/d*h, y/2+x/d*h] which will be the center of our arc.
              ******************************
              Equilateral formulae derived as
              area = 0.5 * d * h
              a^2 = h^2 + (r/2)^2
              ? h^2 = r^2 � (r^2/4)
              ? h^2 = (3r^2)/4  Or h = �(sqrt(3r))
              *********************************
              area formula: h? = 2 � area / r = sqrt(r� - (0.5 � b)�) � b / r
              *********************************
              area = �(sqrt(3r^2))
              h = � � (sqrt(3 )� r)
              *********************************
              d^2 == x^2 + y^2
              h^2 == r^2 - (d/2)^2
              i == x/2 - y/d*h
              j == y/2 + x/d*h

                                                                   O <- [i,j]
                                                                -  |
                                                      r      -     |
                                                          -        |
                                                       -           | h
                                                    -              |
                                      [0,0] ->  C -----------------+--------------- T  <- [x,y]
                                                | <------ d/2 ---->|

              C - Current position
              T - Target position
              O - center of circle that pass through both C and T
              d - distance from C to T
              r - designated radius
              h - distance from center of CT to O

              Expanding the equations:

              d -> sqrt(x^2 + y^2)
              h -> sqrt(4 * r^2 - x^2 - y^2)/2
              i -> (x - (y * sqrt(4 * r^2 - x^2 - y^2)) / sqrt(x^2 + y^2)) / 2
              j -> (y + (x * sqrt(4 * r^2 - x^2 - y^2)) / sqrt(x^2 + y^2)) / 2

              Which can be written:

              i -> (x - (y * sqrt(4 * r^2 - x^2 - y^2))/sqrt(x^2 + y^2))/2
              j -> (y + (x * sqrt(4 * r^2 - x^2 - y^2))/sqrt(x^2 + y^2))/2

              Which we for size and speed reasons optimize to:

              h_x2_div_d = sqrt(4 * r^2 - x^2 - y^2)/sqrt(x^2 + y^2)
              i = (x - (y * h_x2_div_d))/2
              j = (y + (x * h_x2_div_d))/2

            */

            // Calculate the change in position along each selected axis
            //x = target[gc.plane_axis_0]-gc.position[gc.plane_axis_0];
            x = target[axis_plane_a] - position[axis_plane_a];
            //y = target[gc.plane_axis_1]-gc.position[gc.plane_axis_1];
            y = target[axis_plane_b] - position[axis_plane_b];
            //clear_vector(offset);
            // First, use h_x2_div_d to compute 4*h^2 to check if it is negative or r is smaller
            // than d. If so, the sqrt of a negative number is complex and error out.
            h_x2_div_d = 4 * r*r - x*x - y*y;
           // if (h_x2_div_d < 0) { FAIL(STATUS_ARC_RADIUS_ERROR); return(gc.status_code); }
            // Finish computing h_x2_div_d.
            h_x2_div_d = -sqrt(h_x2_div_d)/hypot(x,y); // == -(h * 2 / d)
            // Invert the sign of h_x2_div_d if the circle is counter clockwise (see sketch below)
           if (gc.motion_mode == MOTION_MODE_CCW_ARC) { h_x2_div_d = -h_x2_div_d; }

            /* The counter clockwise circle lies to the left of the target direction. When offset is positive,
               the left hand circle will be generated - when it is negative the right hand circle is generated.


                                                             T  <-- Target position

                                                             ^
                  Clockwise circles with this center         |          Clockwise circles with this center will have
                  will have > 180 deg of angular travel      |          < 180 deg of angular travel, which is a good thing!
                                                   \         |          /
      center of arc when h_x2_div_d is positive ->  x <----- | -----> x <- center of arc when h_x2_div_d is negative
                                                             |
                                                             |

                                                             C  <-- Current position                                 */


            // Negative R is g-code-alese for "I want a circle with more than 180 degrees of travel" (go figure!),
            // even though it is advised against ever generating such circles in a single line of g-code. By
            // inverting the sign of h_x2_div_d the center of the circles is placed on the opposite side of the line of
            // travel and thus we get the unadvisably long arcs as prescribed.
            if (r < 0) {
                h_x2_div_d = -h_x2_div_d;
                r = -r; // Finished with r. Set to positive for mc_arc
            }
            // Complete the operation by calculating the actual center of the arc
            //offset[gc.plane_axis_0] = 0.5*(x-(y*h_x2_div_d));
            i =  0.5*(x-(y*h_x2_div_d));
            //offset[gc.plane_axis_1] = 0.5*(y+(x*h_x2_div_d));
            j =  0.5*(y+(x*h_x2_div_d));
          } else {
            //using this section for understanding 1st
            // Arc Center Format Offset Mode
             r = hypot(i, j); // Compute arc radius for mc_arc
          }
          dma_printf("Radius:= %f",r);
          
          // Set clockwise/counter-clockwise sign for mc_arc computations
          isclockwise = false;
          if (dir == CW) { isclockwise = true; }

        //  gc.plane_axis_2 =1;
          // Trace the arc  inverse_feed_rate_mode used withG01 G02 G03 for Fxxx
          mc_arc(position, target, offset, gc.plane_axis_0, gc.plane_axis_1, gc.plane_axis_2,
                 DEFAULT_FEEDRATE, gc.inverse_feed_rate_mode,r, isclockwise);
}



void mc_arc(double *position, double *target, double *offset, uint8_t axis_0, uint8_t axis_1,
  uint8_t axis_linear, double feed_rate, uint8_t invert_feed_rate, double radius, uint8_t isclockwise){
 long tempA,tempB;
  double center_axis0            = position[axis_0] + offset[axis_0];
 double center_axis1             = position[axis_1] + offset[axis_1];
  double linear_travel           = target[axis_linear] - position[axis_linear];
  double r_axis0                 = -offset[axis_0];  // Radius vector from center to current location
  double r_axis1                 = -offset[axis_1];
  double rt_axis0                = target[axis_0] - center_axis0;
 double rt_axis1                 = target[axis_1] - center_axis1;
  double theta_per_segment       = 0.00;
  double linear_per_segment      = 0.00;
  double angular_travel          = 0.00;
  double millimeters_of_travel   = 0.00;
  uint16_t segments              = 0;
  double cos_T                   = 0.00;
  double sin_T                   = 0.00;

  double arc_target[3];
  double sin_Ti;
  double cos_Ti;
  double r_axisi;
  uint16_t i;
  int8_t count = 0;
  double nPx,nPy;
  uint8_t n_arc_correction; //to be sorted int global struct???
  
  // CCW angle between position and target from circle center. Only one atan2() trig computation required.
  // atan2((I*-J' - I'*J ),(I*J + I'-J'))   ~ arctan Vector opp/Vector adj
  angular_travel = atan2(r_axis0*rt_axis1-r_axis1*rt_axis0, r_axis0*rt_axis0+r_axis1*rt_axis1);
  // Correct atan2 output per direction
  if (isclockwise) {
    // 2*Pi = 360deg in radians
    if (angular_travel >= 0) { angular_travel -= 2*M_PI; }
  } else {
    if (angular_travel <= 0) { angular_travel += 2*M_PI; }
  }

  // Check this with calculator
  millimeters_of_travel = hypot(angular_travel*radius, fabs(linear_travel));
  //if (millimeters_of_travel == 0.0) { return; }
  
  segments = floor(millimeters_of_travel/DEFAULT_MM_PER_ARC_SEGMENT);

  // Multiply inverse feed_rate to compensate for the fact that this movement is approximated
  // by a number of discrete segments. The inverse feed_rate should be correct for the sum of
  // all segments.
  if (invert_feed_rate) { feed_rate *= segments; }
   angular_travel = angular_travel * rad2deg;
   theta_per_segment = angular_travel/segments;
   //linear_per_segmentis the down feed of the 3 axis
   //In most cases this will be 0 for 2D plane unless
   //spiral pocket cutting is needed
   linear_per_segment = linear_travel/segments;

  /* Vector rotation by transformation matrix: r is the original vector, r_T is the rotated vector,
     and phi is the angle of rotation. Solution approach by Jens Geisler.
         r_T = [cos(phi) -sin(phi);
                sin(phi)  cos(phi] * r ;

     For arc generation, the center of the circle is the axis of rotation and the radius vector is
     defined from the circle center to the initial position. Each line segment is formed by successive
     vector rotations. This requires only two cos() and sin() computations to form the rotation
     matrix for the duration of the entire arc. Error may accumulate from numerical round-off, since
     all double numbers are single precision on the Arduino. (True double precision will not have
     round off issues for CNC applications.) Single precision error can accumulate to be greater than
     tool precision in some cases. Therefore, arc path correction is implemented.
     Small angle approximation may be used to reduce computation overhead further. This approximation
     holds for everything, but very small circles and large mm_per_arc_segment values. In other words,
     theta_per_segment would need to be greater than 0.1 rad and N_ARC_CORRECTION would need to be large
     to cause an appreciable drift error. N_ARC_CORRECTION~=25 is more than small enough to correct for
     numerical drift error. N_ARC_CORRECTION may be on the order a hundred(s) before error becomes an
     issue for CNC machines with the single precision Arduino calculations.

     This approximation also allows mc_arc to immediately insert a line segment into the planner
     without the initial overhead of computing cos() or sin(). By the time the arc needs to be applied
     a correction, the planner should have caught up to the lag caused by the initial mc_arc overhead.
     This is important when there are successive arc motions.
  */
  // Vector rotation matrix values
   cos_T = 1-0.5*theta_per_segment*theta_per_segment; // Small angle approximation
   sin_T = theta_per_segment;
  // Initialize the linear axis
  nPx = arc_target[X] = position[X];
  nPy = arc_target[Y] = position[Y];
  for (i = 1; i<segments; i++) { // Increment (segments-1)
    if (count < n_arc_correction) {
      // Apply vector rotation matrix
      r_axisi = r_axis0*sin_T + r_axis1*cos_T;
      r_axis0 = r_axis0*cos_T - r_axis1*sin_T;
      r_axis1 = r_axisi;
      count++;
    } else {
      // Arc correction to radius vector. Computed only every n_arc_correction increments.
      // Compute exact location by applying transformation matrix from initial radius vector(=-offset).
      cos_Ti = cos(i*theta_per_segment);
      sin_Ti = sin(i*theta_per_segment);
      r_axis0 = -offset[axis_0]*cos_Ti + offset[axis_1]*sin_Ti;
      r_axis1 = -offset[axis_0]*sin_Ti - offset[axis_1]*cos_Ti;
      count = 0;
    }

    // Update arc_target location
    arc_target[X] = center_axis0 + r_axis0;
    arc_target[Y] = center_axis1 + r_axis1;
    arc_target[axis_linear] += linear_per_segment;
    nPx =  arc_target[X] - position[X];
    position[X] = arc_target[X];
    nPy =  arc_target[Y] - position[Y];
    position[Y] = arc_target[Y];
   while(1){
      if(!OC5IE_bit && !OC2IE_bit)
          break;
   }

    /* DIR_StepX = (nPx < 0)? CCW:CW;
     DIR_StepY = (nPy < 0)? CCW:CW;
     nPx = fabs(nPx);
     nPy = fabs(nPy);   */
  //  mc_line(arc_target[X_AXIS], arc_target[Y_AXIS], arc_target[Z_AXIS], feed_rate, invert_feed_rate);
   STPS[X].mmToTravel = belt_steps(nPx);//calcSteps(nPx,8.06);
   STPS[Y].mmToTravel = belt_steps(nPy);//calcSteps(nPy,8.06);
   tempA = abs(STPS[X].mmToTravel);
   tempB = abs(STPS[Y].mmToTravel);
   if(tempA > tempB)
       speed_cntr_Move(STPS[X].mmToTravel, 1000,X);
   else
       speed_cntr_Move(STPS[Y].mmToTravel, 1000,Y);
  // STPS[X].step_delay = 2000;
  // STPS[Y].step_delay = 2000;
   DualAxisStep(STPS[X].mmToTravel, STPS[Y].mmToTravel,xy);
    // Bail mid-circle on system abort. Runtime command check already performed by mc_line.
   // if (sys.abort) { return; }

  }
  // Ensure last segment arrives at target location.
  //mc_line(target[X_AXIS], target[Y_AXIS], target[Z_AXIS], feed_rate, invert_feed_rate);
}

float hypot(float angular_travel, float linear_travel){
      return(sqrt((angular_travel*angular_travel) + (linear_travel*linear_travel)));
}


///////////////////////////////////////////////////////////////////
//                       DIRECTION INDICATION                    //
///////////////////////////////////////////////////////////////////

//Return the direction counter for absolute counts +1 or -1
int GetAxisDirection(long mm2move){
 return(mm2move < 0)? CCW_:CW_ ;
}

///////////////////////////////////////////////////////////////////
//                       HOMING AXIS                             //
///////////////////////////////////////////////////////////////////

//Home single axis
void Home_Axis(double distance,long speed,int axis){
      distance = (distance < max_sizes[axis])? max_sizes[axis]:distance;
      distance = (distance < 0.0)? distance : -distance;
      STPS[axis].mmToTravel = belt_steps(-max_sizes[axis]);
      speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
      SingleAxisStep(STPS[axis].mmToTravel,axis);
}

void Inv_Home_Axis(double distance,long speed,int axis){
      distance = (distance > 10.0)?  10.0 : distance;
      distance *= (distance < 0.0)?  -1.0 : 1.0;
      STPS[axis].mmToTravel = belt_steps(distance);
      speed_cntr_Move(STPS[axis].mmToTravel, speed ,axis);
      SingleAxisStep(STPS[axis].mmToTravel,axis);
}