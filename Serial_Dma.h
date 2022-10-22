#ifndef SERIAL_DMA_H
#define SERIAL_DMA_H


#include "Config.h"

extern char txt[];
extern char rxBuf[];
extern char txBuf[];





////////////////////////////////////////////
//function prototypes
void DMA_global();
void DMA0();
void DMA1();

#endif