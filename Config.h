#ifndef CONFIG_H
#define CONFIG_H

#include "Timers.h"
#include "built_in.h"
#include "I2C_LCD.h"
#include "Stepper.h"
#include "Steptodistance.h"

#define BUFFER_LENGTH 200

////////////////////////////////////////////////////
//LEDS
extern sfr sbit LED1;
extern sfr sbit LED1_Dir;
extern sfr sbit LED2;
extern sfr sbit LED2_Dir;

///////////////////////////////////////////////////
//ON BOARD SWITRCHES
extern sfr sbit SW1;
extern sfr sbit SW1_Dir;
extern sfr sbit SW2;
extern sfr sbit SW2_Dir;

////////////////////////////////////////////////////
//constants
extern unsigned char LCD_01_ADDRESS; //PCF8574T
extern bit oneShotA; sfr;
extern bit oneShotB; sfr;

////////////////////////////////////////////////////
//STRUCTS and ENUMS


////////////////////////////////////////////////////
//function prototypes
void PinMode(); //pin mode configuration
void UartConfig();//setupUart
void set_performance_mode();//sys clk performance setup
void Uart2InterruptSetup();//uart2 interrupt on recieve
void LcdI2CConfig();//configure the i2c_lcd 4line 16ch display
void OutPutPulseXYZ(); // setup output pulse OC3
void initDMA_global();
void  initDMA0();
void initDMA1();
void Temp_Move(int a);
void LCD_Display();
#endif