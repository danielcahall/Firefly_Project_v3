/*
 * I2C.h
 *
 *  Created on: Dec 21, 2015
 *      Author: Danny
 */

#ifndef I2C_H_
#define I2C_H_

extern unsigned char RX_Data[14];
extern unsigned char TX_Data[2];
//extern unsigned char RX_ByteCtr;
//extern unsigned char TX_ByteCtr;
extern unsigned char slaveAddress;

void i2cInit(void);
void i2cWrite(unsigned char);
void i2cRead(unsigned char);


#endif /* I2C_H_ */




