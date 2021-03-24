#ifndef CS
#define CS LATCbits.LATC1       //define the chip select pin
#endif
#ifndef CS2
#define CS2 LATBbits.LATB1
#endif
void configSPI(void);           //configure the MSSP module
void SPIout(unsigned char);     //send a byte trought the serial interface
