#line 1 "C:/Users/User/Pic32mzCNC/Globals.c"
#line 1 "c:/users/user/pic32mzcnc/globals.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "c:/users/user/pic32mzcnc/settings.h"
#line 50 "c:/users/user/pic32mzcnc/globals.h"
typedef struct {
 uint8_t abort;
 uint8_t state;
 int8_t homing;
 uint8_t homing_cnt;
 uint8_t auto_start;
 volatile uint8_t execute;
} system_t;
extern system_t sys;




typedef struct genVars{
 int Single_Dual;
 unsigned short running: 1;
 unsigned short startPulses: 1;
 int Tog;
 int AxisNo;
 long i;
 long d2;
 long dx;
 long dy;
 long dz;
 long da;
 long px;
 long py;
 long pz;
 long pa;
 long psingle;
 long over;
 long acc;
 long dec;
 int dirx;
 int diry;
 int dirz;
 int dira;
 int dirb;
 int dirc;
}sVars;
extern sVars SV;
<<<<<<< HEAD



int GetAxisDirection(long mm2move);
#line 3 "C:/Users/User/Pic32mzCNC/Globals.c"
=======
#line 3 "C:/Users/Git/Pic32mzCNC/Globals.c"
>>>>>>> 7b2598884ebfd161af9e0de85c03d70a8fbd3986
char txtL[9];
system_t sys;
sVars SV;
