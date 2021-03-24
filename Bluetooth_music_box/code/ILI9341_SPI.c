#include "ILI9341_SPI.h"    //all includes in header file

#ifndef _XTAL_FREQ
#define _XTAL_FREQ 64000000
#endif

/*
 * write a single byte to the lcd
 * set the data or command pin high or low depending on 
 * what is send 1=data 0=command
 */
void TFToutByte(unsigned char DnC, unsigned char data)
{
    DnCPin = DnC;   //set data or command pin
    SPIout(data);   //send data over SPI (4MHz)
}

void configTFT(void)
{
    TFToutByte(TFT_CMD,ILI_SWRESET);        //reset the TFT controller (blank screen)
    __delay_ms(150);                        //wait 150 ms -> datasheet 
    unsigned char *dptr = startup;          //declare a pointer, load with starting address of init table
    unsigned char command, numParams, param;//bytes to temp store a command with its params
    while((command = *dptr) != 0x00)        //loop trough init array until end byte is reached
    {
        numParams = *(++dptr);              //number of parameters is next byte
        TFToutByte(TFT_CMD,command);        //send the command
        for (char i = 0; i < (numParams&0x7f); i++) //send all the parameters (MSB ist part of number)
        {
            param = *(++dptr);              //get the parameter/data
            TFToutByte(TFT_DATA,param);     //send the parameter/data
        }
        dptr++;                             //next command
        if(numParams & 0x80)                //wait needed ? -> msb of numParams will be 1
        {
            __delay_ms(120);                //do nothing for 120ms
        }
    }
    TFTclear(); //clear the screen
}

/*
 * put the TFT in sleep mode
 */
void TFTsleep(void)
{
    TFToutByte(TFT_CMD,ILI_SLPIN);  //put display in sleep mode
    __delay_ms(120);    //120ms needed to enter sleep mode
}

/*
 * wake the TFT out of sleep mode
 */
void TFTwake(void)
{
    TFToutByte(TFT_CMD,ILI_SLPOUT); //wake the display
    __delay_ms(10);     //5ms needed to enter normal mode (5 extra to be sure)
}

/* 
 * set the limiting addresses where we want to write/read data 
 * aka boundry box
 */
void TFTsetBox(unsigned int x, unsigned int y, unsigned int wdh, unsigned int hgt)
{
    unsigned int x2 = x + wdh - 1, y2 = y + hgt - 1; //calculate the end points
    TFToutByte(TFT_CMD,ILI_PASET);  //set start and end column (x)
    TFToutByte(TFT_DATA,x>>8);      //send MSByte of start
    TFToutByte(TFT_DATA,x);         //send LSByte of start
    TFToutByte(TFT_DATA,x2>>8);     //send MSByte of end
    TFToutByte(TFT_DATA,x2);        //send LSByte of end
    
    TFToutByte(TFT_CMD,ILI_CASET);  //set start and end row/page (y)
    TFToutByte(TFT_DATA,y>>8);      //send MSByte of start
    TFToutByte(TFT_DATA,y);         //send LSByte of start
    TFToutByte(TFT_DATA,y2>>8);     //send MSByte of end
    TFToutByte(TFT_DATA,y2);        //send LSByte of end
}

/* 
 * print a pixel on the LCD in given color 
 * see ILI9341_SPI.h file for colors defenitions
 */
void TFToutPixel(unsigned int color)
{
    TFToutByte(TFT_DATA, color >> 8);   //MSB of color
    TFToutByte(TFT_DATA, color);        //LSB of color
}

/* 
 * print a filled rectangle 
 * position and size need to be defined first by TFTsetBox
 * params: the width, height and color 
 */
void TFTfillRect(unsigned int w, unsigned int h, unsigned int color)
{
    TFToutByte(TFT_CMD,ILI_RAMWR);          //write cmd
    unsigned int numPixels = w * h;         //calculate the number of pixels where data needs to be written to
    for(unsigned int wi = 0; wi < w; wi++)  //every x position
    {
        for (unsigned int he = 0; he < h; he++) //every y position
           TFToutPixel(color);              //print a single pixel in the given color
    }
}

/* 
 * print a single character on the screen on give x and y position 
 * pass the parameters as a pointer
 */
unsigned char TFToutChar(unsigned char c, unsigned int *x, unsigned int *y, unsigned int *color)
{
    unsigned char cIndex = c - 0x20;        //used to select the row in the 2D font array, database starts @ UTF8_0x20
    unsigned char *size = UTF8char[cIndex]; //get the number of x places used
    /*
     * fist byte is the x size, y size is constant 
     *(24 -> fontheight in fontDatabase .h)
     */
    TFTsetBox(*x,*y,*size,fontHeight);      //set the boundry box
    TFToutByte(TFT_CMD,ILI_RAMWR);          //write cmd
    
    unsigned char mask = 0x80;              //mask to test bits
    for (unsigned int i = 0; i < (*size)*fontHeightB; i++)  //loop trough number of bytes
    {
        mask = 0x80;                //reset the mask
        for (int j = 0; j < 8; j++) //check every bit
        {
            if(*(size + i + 1)&mask)//1 = off
                TFToutPixel(BACKGROUND); //bg
            else                    //0 = on   
                TFToutPixel(*color);//fg
                mask = mask >> 1;       //check next bit
        }
    }
    return *size;    //return used x width
}

/*
 * print a given string
 * start on given x and y
 */
unsigned int TFToutString(unsigned char *s, unsigned int x, unsigned int y, unsigned int color)
{
    unsigned int pos = x;           //starting pos
    unsigned char len = strlen(s);  //get the length of the string
    for(unsigned char i = 0; i < len; i++) //go trough all chars in string
    {
        pos += TFToutChar(s[i],&pos,&y, &color); //print char in color on position
    }
    return pos; //return the used space
}

/*
 * print a 16 bit number on the screen -> 5*4bits
 * lower contains remainder and tens
 * higher contains hunderds and thousands
 * extra contains tenthousands
 * x is used to determine the starting position of the next digit
 */
unsigned char TFToutBCD(unsigned int number, unsigned int x, unsigned int y, unsigned int color)
{
    unsigned char lower = 0x00, higher = 0x00, extra = 0x00;//store 5xBCD numbers
    
    extra = number/10000;           //get tenthousands
    number %= 10000;        //get the remainder
    higher = (number/1000)<<4;      //get thousands
    number %= 1000;         //get the remainder
    higher = (number / 100)&0x0F;   //get the hunderds
    number %= 100;          //get the remainder
    lower = ((number / 10)<<4)|(number % 10); //tens and remainder
    
    TFTsetBox(x,y,50,fontHeight);    //clear space for biggest possible number (65535 -> 10px*5 -> 50 px)
    TFTfillRect(50,fontHeight,BACKGROUND);  //fill with background color
    x += TFToutChar((extra&0x0F)+'0',&x,&y,&color);         //print tenthousands
    x += TFToutChar(((higher>>4)&0x0F)+'0',&x,&y,&color);   //print thousands
    x += TFToutChar((higher&0x0F)+'0',&x,&y,&color);        //print hunderds
    x += TFToutChar(((lower>>4)&0x0F)+'0',&x,&y,&color);    //print tens
    x += TFToutChar((lower&0x0F)+'0',&x,&y,&color);         //print remainder
    
    return 50;  //return the maximum of space used (numbers are alighed left)
}

/*
 * print a 32x32px given icon
 * start on given x and y position 
 */
unsigned char TFToutIcon(unsigned int icon[], unsigned int x, unsigned int y, unsigned int iconWidth, unsigned int iconHeight,unsigned int iconSize )
{
    TFTsetBox(x,y,iconWidth,iconHeight);    //send the boundry box (32x32 pixels)
    TFToutByte(TFT_CMD,ILI_RAMWR);          //write cmd
    for(unsigned int i = 0; i < iconSize; i++) //go trough all the pixels
    {
        TFToutPixel(icon[i]);   //print the pixel int the correct color
    }
    return iconWidth;   //return the amount of x space used (32px defined in iconDatabase.h)
}

/*
 print code 128 barcode
 */
void TFTcode128(unsigned char height, unsigned char barwidth, unsigned int x, unsigned int y)
{
    unsigned char counter = 0;
    unsigned int position = x;
    for(char i = 0; i < 10; i++)    //quiet space of 10xbar width
    {
        printBar(position +=barwidth,y,height,barwidth,WHITE);
    }
    for(unsigned char i = 10; i >= 0; i--)   //start code b
    {
        if((0b011010010000 >> i)&0x01)
        {
            printBar(position +=barwidth,y,height,barwidth,BLACK);
        }
        else
        {
            printBar(position +=barwidth,y,height,barwidth,WHITE);
        }
    }
}

void printBar(unsigned int x, unsigned int y, unsigned char height, unsigned char barwidth, unsigned int color)
{
    TFTsetBox(x,y,barwidth,height);
    TFTfillRect(barwidth, height,color);
}

void TFTclear(void)
{
   /* fill background */
    TFTsetBox(0,0,TFT_WDH,TFT_HGT);         //set boundry box to full screen
    TFTfillRect(TFT_WDH,TFT_HGT,WHITE);     //all pixels white 
}
