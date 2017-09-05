APP = scripts

# Add any other object files to this list below
APP_OBJS = ./ArtyHW.dtbo ./bitstream.sh ./overlay.sh ./spichild.dtbo

all: install

.PHONY: install

build: $(APP)

$(APP): $(APP_OBJS)
	$(CC) $(LDFLAGS) -o $@ $(APP_OBJS) $(LDLIBS)

install:
	$(TARGETINST) -p 0755 $(APP_OBJS) /home/root
	$(TARGETINST) -p 0755 ./ArtyHW.dtbo /home/root

clean: 
