#include <xc.h>
#include "P18_SPI.h"

#ifndef TFTpressed
#define TFTpressed !PORTBbits.RB0
#endif

/* 
 * xpt2046 configuration 
 * or all the configuration bytes to get the final 
 * control byte
 */
#define START 0x80      //MSB is 1 in the control byte (first byte)
#define MODE12 0x00     //bit3 is low to select 12bit adc
#define MODE8 0x08      //bit3 is high to select 8bit mode
#define SER 0x04        //bit 4 is hight for single ended 
#define DFR 0x00        //bit 4 is low for differential reference 
#define PD1 0x00        //power down between conversions, instant power up, int enabled
#define PD2 0x01        //reference is off and ADC stays on, int disabled
#define PD3 0x02        //reference stays on and ADC is off, int enabled
#define PD4 0x03        //reference and ADC stay on, int disabled

/* diffrent in datasheet (we switched x and y) */
#define XPT_X 0x10      //set mux to measure x (when in DFR mode)
#define XPT_Y 0x50      //set mux to measure y (when in DFR mode)

#define SAMPLE_NUM 3

/* default ADC values of the cornerd LOnder(x,y), LBoven.., RB.., RO.. */
unsigned char corners[4][2] = {{13,114},{12,8},{120,8},{120,120}};

unsigned char getADC(unsigned char);    //get adc value of x or y in DFR mode
unsigned char getPosition(unsigned char);   //get the actual position of x or y 
void calibrateTouch(void);  //get corner values
