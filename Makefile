FILENAME   = blink
DEVICE     = atmega16u2
COMPILE    = avr-gcc -Wall -Os -mmcu=$(DEVICE)


default: docker-build upload

build:
	$(COMPILE) -c $(FILENAME).c -o $(FILENAME).o
	$(COMPILE) -o $(FILENAME).elf $(FILENAME).o
	avr-objcopy -j .text -j .data -O ihex $(FILENAME).elf $(FILENAME).hex 
	avr-size --format=avr --mcu=$(DEVICE) $(FILENAME).elf

upload:
	dfu-programmer $(DEVICE) flash $(FILENAME).hex --force

clean:
	rm $(FILENAME).o
	rm $(FILENAME).elf
	rm $(FILENAME).hex


docker-build:
	docker run -ti -v $(shell pwd):/build avr_gcc make -f test.Makefile



