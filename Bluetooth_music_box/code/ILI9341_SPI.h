#include <xc.h>
#include <string.h>
#include "P18_SPI.h"        //SPI library
#include "fontDatabase.h"   //font constants
#include "iconDatabase.h"   //icon constants

/* display control constants */
#ifndef DnCPin
#define DnCPin LATCbits.LATC0   //pin controls data or command
#endif

#define TFT_DATA 1  //level of D/C pin when uC writes data
#define TFT_CMD 0   //level of D/C pin when uC writes a command

/* 
 * size of the TFT
  w
 ----------------
 |              |
 |              | h
 ----------------
*/
#define TFT_WDH 320
#define TFT_HGT 240

/* display commands p83-87b*/
#define ILI_NOP        0x00     //do nothing
#define ILI_SWRESET    0x01     //software reset, reset parameter (wait 120ms for nxt cmd), blank display
#define ILI_DISPOFF    0x28     //blank display
#define ILI_DISPON     0x29     //display RAM data
#define ILI_SLPIN      0x10     //put in sleep mode (stop DC/DC, oscillator and scanning) 120ms
#define ILI_SLPOUT     0x11     //stop sleep mode (start DC/DC, oscillator and scanning) 5ms
#define ILI_PTLON      0x12     //partial display mode
#define ILI_NORON      0x13     //normal display mode
#define ILI_INVOFF     0x20     //turn display inversion off
#define ILI_INVON      0x21     //turn display inversion on 
#define ILI_GAMSET     0x26     //set gama curve param:0x01|0x02|0x04|0x08

#define ILI_CASET      0x2A     //set start(SC) and end(EC) column addess param: SC(msb,lsb), EC(msb,lsb) (p110)
#define ILI_PASET      0x2B     //set start(SP) and end(EP) row/page address param: SP(msb,lsb), EP(msb,lsb) (p112)
#define ILI_RAMWR      0x2C     //write data to GRAM param: D1(16bits msb first) -> Dn
#define ILI_RAMRD      0x2E     //read data from GRAM

#define ILI_PTLAR      0x30     //set the partial display mode area param: SR(16bit),ER(16bit) (p118)
#define ILI_VSCRDEF    0x33     //define the vertical scrolling area
#define ILI_MADCTL     0x36     //define rread/write scanning direction of GRAM (p127)
#define ILI_VSCRSADD   0x37     //define vertical scrolling start address (p129)
#define ILI_COLMOD     0x3A     //COLMOD: Pixel Format Set

#define ILI_FRMCTR1    0xB1     //rame Rate Control (In Normal Mode/Full Colors)
#define ILI_FRMCTR2    0xB2     //Frame Rate Control (In Idle Mode/8 colors)
#define ILI_FRMCTR3    0xB3     //Frame Rate control (In Partial Mode/Full Colors)
#define ILI_INVCTR     0xB4     //Display Inversion Control
#define ILI_DISCTRL    0xB6     //Display Function Control

#define ILI_PWCTR1     0xC0     //Power Control 1
#define ILI_PWCTR2     0xC1     //Power Control 2
#define ILI_PWCTR3     0xC2     //Power Control 3
#define ILI_PWCTR4     0xC3     //Power Control 4
#define ILI_PWCTR5     0xC4     //Power Control 5
#define ILI_VMCTR1     0xC5     //VCOM Control 1
#define ILI_VMCTR2     0xC7     //VCOM Control 2

#define ILI_GMCTRP1    0xE0     //Positive Gamma Correction reg
#define ILI_GMCTRN1    0xE1     //Negative Gamma Correction reg

/* colors */
#define BLACK       0x0000  ///<   0,   0,   0
#define NAVY        0x000F  ///<   0,   0, 123
#define DARKGREEN   0x03E0  ///<   0, 125,   0
#define DARKCYAN    0x03EF  ///<   0, 125, 123
#define MAROON      0x7800  ///< 123,   0,   0
#define PURPLE      0x780F  ///< 123,   0, 123
#define OLIVE       0x7BE0  ///< 123, 125,   0
#define LIGHTGREY   0xC618  ///< 198, 195, 198
#define DARKGREY    0x7BEF  ///< 123, 125, 123
#define BLUE        0x001F  ///<   0,   0, 255
#define GREEN       0x07E0  ///<   0, 255,   0
#define CYAN        0x07FF  ///<   0, 255, 255
#define RED         0xF800  ///< 255,   0,   0
#define MAGENTA     0xF81F  ///< 255,   0, 255
#define YELLOW      0xFFE0  ///< 255, 255,   0
#define WHITE       0xFFFF  ///< 255, 255, 255
#define ORANGE      0xFD20  ///< 255, 165,   0
#define GREENYELLOW 0xAFE5  ///< 173, 255,  41
#define PINK        0xFC18  ///< 255, 130, 19

#define BACKGROUND WHITE

/* 
 * configure commands
 * format: CMD,numParams,params 
 */
const unsigned char startup[] = {
  0xCB,5,0x39,0x2C,0x00,0x34,0x02,  //?
  0xCF,3,0x00,0xC1,0x30,            //?
  0xE8,3,0x85,0x00,0x78,            //?
  0xEA,2,0x00,0x00,                 //?
  0xED,4,0x64,0x03,0x12,0x81,       //?
  0xF7,1,0x20,                      //?
  ILI_PWCTR1,1,0x23,                //set GVDD to 4.60V
  ILI_PWCTR2,1,0x10,                //set DC/DC step-up factor (AVDD = VCI*2, VHG = VCI*7, VGL = VCI*4)
  ILI_VMCTR1,2,0x3E,0x28,           //set VCOM high to 4.25V and VCOM low to -1.50V
  ILI_VMCTR2,1,0x86,                //set VCOM offset to -52
  ILI_MADCTL,1,0x88,                //normal memory map, refresh vertical top->bottom, refresh Horizontal L->R, RGB is flipped on LCD (GRB)
  ILI_COLMOD,1,0x55,                //set RGB mode to 16bit/pixel
  ILI_FRMCTR1,2,0x00,0x18,          //divide fosc/1, frame rate = 79Hz
  ILI_DISCTRL,3,0x08,0x82,0x27,     //interval scan on non display memory, scan interval: 5 frames, LCD normal white
  0xF2,1,0x00,                      //?
  ILI_GAMSET,1,0x01,                //select gamma curve 1
  ILI_GMCTRP1,15,0x07,0x31,0x2B,0x0C,0x0E,0x08,0x4E,0xF1,0x37,0x07,0x10,0x03,0x0E,0x09,0x00,    //positive gamma correction
  ILI_GMCTRN1,15,0x00,0x0E,0x14,0x03,0x11,0x07,0x31,0xC1,0x48,0x08,0x0F,0x0C,0x31,0x36,0x0F,    //negative gamma correction
  ILI_SLPOUT,0x80,                  //go out of sleep mode, wait 120ms
  ILI_DISPON,0x80,                  //activate the display, wait 120ms
  0x00                              //end of the configure data
};

/* base TFT functions */
void TFToutByte(unsigned char, unsigned char);
void configTFT(void);

/* drawing functions */
void TFToutPixel(unsigned int);
void TFTsetBox(unsigned int, unsigned int, unsigned int, unsigned int);
void TFTfillRect(unsigned int, unsigned int, unsigned int);

/* text functions */
unsigned char TFToutChar(unsigned char, unsigned int*, unsigned int*, unsigned int*);
unsigned int TFToutString(unsigned char*, unsigned int, unsigned int, unsigned int);
unsigned char TFToutBCD(unsigned int, unsigned int, unsigned int, unsigned int);

/* icon functions */
unsigned char TFToutIcon(unsigned int[],unsigned int, unsigned int,unsigned int,unsigned int,unsigned int);
void TFTcode128(unsigned char, unsigned char, unsigned int, unsigned int);
void printBar(unsigned int, unsigned int, unsigned char, unsigned char, unsigned int);

/* clear full screen */
void TFTclear(void);
