# MACHTYPE only needs to be specified for `pcc` and `alpha`
HG_DEFS=-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -DMACHTYPE_$(MACHTYPE)
COPTS=-O2 -Iinclude/core -Iinclude/aux -Iinclude/net $(HG_DEFS)

all: bin/blat bin/faToTwoBit bin/gfClient bin/gfServer

bin:
	mkdir bin

bin/blat: bin
	$(CC) $(COPTS) $(CFLAGS) blat.c lib/core/*.c lib/aux/*.c -o bin/blat

bin/faToTwoBit:
	$(CC) $(COPTS) $(CFLAGS) faToTwoBit.c lib/core/*.c lib/aux/*.c -o bin/faToTwoBit

bin/gfClient:
	$(CC) $(COPTS) $(CFLAGS) gfClient.c lib/core/*.c lib/aux/*.c lib/net/*.c -o bin/gfClient

bin/gfServer:
	$(CC) $(COPTS) $(CFLAGS) gfServer.c lib/core/*.c lib/aux/*.c lib/net/*.c -o bin/gfServer

clean:
	rm -f bin/*

