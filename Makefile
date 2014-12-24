

CC = gcc
VERSION = 0.0.1
CFLAGS = -g -O2
YACC = bison -y -d -v -Wnone 

all:	pi-bin

pi-bin:	pi.o y.tab.o
	$(CC) $(CFLAGS)  pi.o -o pi

%.o : %.c 
	${CC} ${CFLAGS} -DVERSION=\"$(VERSION)\" -c $<

y.tab.c: grammar.y
	$(YACC) $<

y.tab.h: grammar.y
	touch $@

clean:
	rm -f pi
	rm -f y.tab.h
	rm -f y.tab.c
	rm -f y.output
	rm -f *.o

distclean:
	rm -f pi config.* Makefile

