#include <xc.h>
#include "P18_SPI.h"
/*
 * Configure the MSSP1 of the PIC18 family for SPI @ fosc /16
 */
void configSPI(void)
{
    /* SPI module information p435*/
    /* MSSP1 configs p487 */
    SSP1STATbits.SMP = 0;         //Master mode (sample at the middle)
    SSP1STATbits.CKE = 1;         //data transmit falling edge
    
    SSP1CON1bits.WCOL = 0;    //No write collission (yet)
    SSP1CON1bits.CKP = 0;         //clock idle = low
    SSP1CON1bits.SSPM = 0b0001;   //clock = fosc/16 -> 4MHz
    
    SSP1CON3bits.BOEN = 0;        //don't overwrite buffer if BF is set
    
    /* Config SDI,SDO and CLK */
    SSP1CLKPPS = 0x13;            //RC3 is clock input -> default
    //TRISCbits.TRISC3 = 1;         //configure RC3 input -> not needed, only output
    SSP1DATPPS = 0x14;            //RC4 is data input -> default
    TRISCbits.TRISC4 = 1;         //configure RC4 input 
    
    RC3PPS = 0x0f;                //CLKout is mapped to RC3
    RC2PPS = 0x10;                //SDO is mapped to RC2
    
    SLRCONCbits.SLRC2 = 0;        //RC2 max slew rate
    SLRCONCbits.SLRC3 = 0;        //RC3 max slew rate
    SLRCONCbits.SLRC4 = 0;        //RC4 max slew rate
    
    SSP1CON1bits.SSPEN = 1;        //enable serial    
}

/*
 * Send a single byte trough the serial interface
 * wait until data is transmitted
 */
void SPIout(unsigned char data)
{
    SSP1BUF = data;     //place data in buffer for transmission
    while(!PIR3bits.SSP1IF);     //wait for data transfer to complete
    PIR3bits.SSP1IF = 0;         //clear interrupt flag
}
