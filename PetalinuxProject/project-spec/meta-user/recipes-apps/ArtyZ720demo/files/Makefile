APP = ArtyZ720demo

# Add any other object files to this list below
APP_OBJS = ArtyZ7.c artyz7demo.c gpio-fpga-driver.c uio-user.c pwm-fpga-driver.c
HEADERS = ArtyZ7.h ChrFont0.h gpio-fpga.h pwm-fpga.h uio-user.h
FILES = ArtyHW.dtbo spichild.dtbo bitstream.sh overlay.sh

all: build install

build: $(APP)

$(APP): $(APP_OBJS) $(HEADERS)
	$(CC) -std=gnu99 -lrt  $(LDFLAGS) -o $@ $(APP_OBJS) $(LDLIBS) $(HEADERS)

clean:
	rm -f $(APP) *.0 *~

install: $(APP)
	$(TARGETINST) -s 0755 $(FILES) /home/root
