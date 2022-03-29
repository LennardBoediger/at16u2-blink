#define F_CPU 16000000UL
#define LED_PIN 0

#include <avr/io.h>
#include <util/delay.h>
#include "LUFA/Drivers/Peripheral/Serial.h"

int main(void)
{
	// Initialize the serial USART driver before first use, with 9600 baud (and no double-speed mode)
    Serial_Init(9600, false);

    // Send a string through the USART
    Serial_SendString("Hello World\r\n");



//	DDRB |= (1 << LED_PIN); // set pin as output
//    while (1) 
//    {
//		PORTB ^= (1 << LED_PIN); // toggles  pin		
//		_delay_ms(500); // busy wait, 500ms
//    }
}
