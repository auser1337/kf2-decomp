LD=mips-linux-gnu-ld
LDFLAGS=-nostdlib -EL -Ttext 0x80011000
RM=rm -f
CC=./tools/gcc-2.6.3/gcc
CFLAGS=-B ./tools/gcc-2.6.3/ -O2

SRCS=src/main.c
OBJS=$(subst .c,.o,$(SRCS))

all: kf2

kf2: $(OBJS)
	$(LD) $(LDFLAGS) -o ./bin/GAME.EXE $(OBJS)

depend: .depend

.depend: $(SRCS)
	$(RM) ./.depend
	$(CC) $(CFLAGS) -M $^>>./.depend;

clean:
	$(RM) $(OBJS)

distclean: clean
	$(RM) *~ .depend

include .depend
