CC=gcc
ARCH= arm

SOURCES= ArtyZ7.c uio-user.c gpio-fpga-driver.c pwm-fpga-driver.c artyz7demo.c
HEADERS= uio-user.h ArtyZ7.h gpio-fpga.h pwm-fpga.h ChrFont0.h
EXECUTABLE= artyz7demo

$(EXECUTABLE): $(SOURCES) $(HEADERS)        
	$(CC) -std=gnu99 -lrt -g -o $(EXECUTABLE) $(SOURCES)

.PHONY: clean

clean:  
	rm -f *.o *~ $(EXECUTABLE) $(EXECUTABLE1) 
