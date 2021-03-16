#include "xpt2046_SPI.h"
#ifndef _XTAL_FREQ
#define _XTAL_FREQ 64000000
#endif
/*
 * this function gets the adc value of an selected axis
 * param: xy -> use XPT_X or XPT_Y define
 */
unsigned char getADC(unsigned char xy)
{
    unsigned char ctrlByte = 0x00;  //temp control byte
    ctrlByte |= START;  //this will initiate the start condition when send
    ctrlByte |= xy;     //select the axis of the measurement
    ctrlByte |= MODE8;  //we want an 8 bit result
    ctrlByte |= DFR;    //use differential reference mode
    ctrlByte |= PD1;    //enter power down mode after convertion, int is enabled
    
    SPIout(ctrlByte);   //send control byte
    __delay_us(250);    //wait for convertion to complete (busy is not connected on module :| )
    SPIout(0x00);       //send dummy byte to receive data
    return SSP1BUF;     //return the received data
}

unsigned char getPosition(unsigned char xy)
{
    int total;  //sum of multiple samples
    for (unsigned char s = 0; s < SAMPLE_NUM; s++)
    {
        total += getADC(xy); //get x value
    }
    return total/SAMPLE_NUM;  //return the average of the samples
}

void calibrateTouch(void)
{
    while(!TFTpressed);//wait for first press (LO)
    corners[0][0] = getADC(XPT_X);
    corners[0][1] = getADC(XPT_Y);
    __delay_ms(750);
    while(!TFTpressed);//wait for first press (LB)
    corners[1][0] = getADC(XPT_X);
    corners[1][1] = getADC(XPT_Y);
    __delay_ms(750);
    while(!TFTpressed);//wait for first press (RB)
    corners[2][0] = getADC(XPT_X);
    corners[2][1] = getADC(XPT_Y);
    __delay_ms(750);
    while(!TFTpressed);//wait for first press (RO)
    corners[3][0] = getADC(XPT_X);
    corners[3][1] = getADC(XPT_Y);
}
