CC = fbc

SRCS = main.bas 

OUT = snowflakes

all: $(OUT)

$(OUT): $(SRCS)
	$(CC) -x $(OUT) $(SRCS) 

clean:
	rm -f $(OUT)

install:
	install -m 755 $(OUT) /usr/local/bin/

uninstall:
	rm -f /usr/local/bin/$(OUT)
