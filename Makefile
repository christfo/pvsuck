OBJS=pvsuck.o
PRJ=pvsuck
PLATFORM=16f877
LIB=-I/usr/local/share/gputils/lkr -I/usr/local/share/sdcc/lib/pic
SDCCOPT=--opt-code-speed --stack-auto --main-return 

.c.o:
	sdcc -V -mpic14 -p$(PLATFORM) -V ${SDCCOPT} --debug -c $<

$(PRJ).hex: $(OBJS)
	sdcc -mpic14 -p${PLATFORM} -V --debug -Wl-c -Wl-m -Wl-s/usr/share/gputils/lkr/16f877i.lkr -I/home/chrisf/MPLABXProjects/piklab/PVSuck/ -opvsuck.hex pvsuck.o 
	# gplink -m -s $(PLATFORM).lkr -o $(PRJ).hex $(OBJS) $(LIB) -f 0 libsdcc.lib pic$(PLATFORM).lib libm.lib


clean:
	rm $(OBJS)
	rm $(PRJ).cod
	rm $(PRJ).hex

