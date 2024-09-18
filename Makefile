FBC = fbc
CFLAGS = -i include
RAYLIB_PATH = raylib-5.0_linux_amd64/lib
LDFLAGS = -p $(RAYLIB_PATH) -p /usr/lib -p /usr/lib32 \
          -l raylib -l GL -l m -l pthread -l dl -l rt -l X11 \
          -Wl -rpath-link,/usr/lib:/usr/lib32:/lib:/lib32:/lib64

SRC = $(wildcard src/*.bas)
TARGET = clicker

all: $(TARGET)

$(TARGET): $(SRC)
	$(FBC) $(CFLAGS) $(LDFLAGS) -x $(TARGET) $(SRC)
	export LD_LIBRARY_PATH=$(RAYLIB_PATH):$LD_LIBRARY_PATH

clean:
	rm -f $(TARGET) *.o

run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run

