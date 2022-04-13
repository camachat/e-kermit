#Makefile for embedded Kermit.
#
# Copyright (C) 1995, 2021,
#  Trustees of Columbia University in the City of New York.
#  All Rights Reserved.  See kermit.c for license.

OBJS= main.o kermit.o unixio.o
EK = makewhat
ALL = $(EK)

all: $(ALL)

ek: $(OBJS)
	$(CC) $(CFLAGS) -o ek $(OBJS)

#Dependencies

main.o: main.c cdefs.h debug.h kermit.h platform.h

kermit.o: kermit.c cdefs.h debug.h kermit.h

unixio.o: unixio.c cdefs.h debug.h platform.h kermit.h

#Targets

#Build with cc.
cc:
	make ek

#Ditto but no debugging.
nodebug:
	make "CFLAGS=-DSTATIC=static -DHAVE_UCHAR=1 -DUCHAR=char -DNODEBUG -O2" ek

#Minimum size and features.
min:
	make "CFLAGS=-DSTATIC=static -DHAVE_UCHAR=1 -DUCHAR=char -DMINSIZE -DOBUFLEN=256 -DFN_MAX=16 -O2" ek

#Ditto but Receive-Only:
minro:
	make "CFLAGS=-DSTATIC=static -DHAVE_UCHAR=1 -DUCHAR=char -DMINSIZE -DOBUFLEN=256 -DFN_MAX=16 -DRECVONLY -O2" ek

#Minimum size, receive-only, but with debugging:
minrod:
	make "CFLAGS=-DSTATIC=static -DHAVE_UCHAR=1 -DUCHAR=char -DMINSIZE -DOBUFLEN=256 -DFN_MAX=16 -DRECVONLY -DDEBUG -O2" ek

#To get profile, build this target, run it, then "gprof ./ek > file".
gprof:
	make ek "CFLAGS=-DSTATIC=static -DHAVE_UCHAR=1 -DUCHAR=char -DNODEBUG -pg" "LNKFLAGS=-pg"

clean:
	rm -f $(OBJS) core

makewhat:
	@echo 'Defaulting to cc...'
	make cc

#End of Makefile
