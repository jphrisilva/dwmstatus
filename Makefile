PREFIX=/usr/local

all: dwmstatus dwmstatus-pulse

clean:
	rm -f dwmstatus dwmstatus-pulse

install:
	cp dwmstatus $(PREFIX)/bin
	cp dwmstatus-pulse $(PREFIX)/bin

dwmstatus-pulse: dwmstatus-pulse.c
	$(CC) $< `pkg-config --libs libpulse-mainloop-glib` -o $@

%: %.c
	$(CC) $< -o $@
