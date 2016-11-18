PREFIX = /usr/local

INCS = -I/usr/X11R6/include
LIBS = -L/usr/X11R6/lib -lm -lX11 -lXrandr

CFLAGS = -std=c99 -Wpedantic -O2 ${INCS}
LDFLAGS = -pedantic ${LIBS}

CC = cc

SRC = sct.c
BIN = ${SRC:.c=}

all: $(BIN)

$(BIN): $(SRC)
	$(CC) $(CFLAGS) -o $(BIN) $(SRC) $(LDFLAGS)

install: all
	@cp -fv $(BIN) $(DESTDIR)$(PREFIX)/bin

uninstall:
	@rm -fv $(DESTDIR)$(PREFIX)/bin/$(BIN)

clean:
	@rm -fv $(BIN)

.PHONY:
	all install uninstall clean