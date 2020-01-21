#ifndef CONFIG_H
#define CONFIG_H


#define BUFFER_LENGTH 200
////////////////////////////////////////////////////
//constants
extern unsigned char LCD_01_ADDRESS; //PCF8574T
extern bit oneShotA; sfr;
extern bit oneShotB; sfr;

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
////////////////////////////////////////////////////
//function prototypes
void PinMode(); //pin mode configuration
void UartConfig();//setupUart
void set_performance_mode();//sys clk performance setup
void Uart2InterruptSetup();//uart2 interrupt on recieve
void InitTimer6();//tmr6 100us to reset the pulsees
void InitTimer7();//tmr 7 1ms interrupt at level7
void InitTimer8();//tmr8 interrupt at 1us config at level4
void LcdI2CConfig();//configure the i2c_lcd 4line 16ch display
void OutPutPulseXYZ(); // setup output pulse OC3
void initDMA_global();
void  initDMA0();
void initDMA1();
#endif