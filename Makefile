CC := g++
CFLAGS := -g -Wall 
DIR_OBJ := ./obj
DIR_MIDD := ./midds

all: addf filters

addf: $(DIR_OBJ)/qn_train.o $(DIR_OBJ)/hc.o $(DIR_OBJ)/qn.o $(DIR_OBJ)/ur.o $(DIR_OBJ)/core.o $(DIR_OBJ)/main.o plain_lpm.h
	$(CC) $(CFLAGS) -o $@ $(patsubst %.h, , $^)

$(DIR_OBJ)/main.o: main.cpp
	$(CC) $(CFLAGS) -c -o $@ $<

$(DIR_OBJ)/core.o: core.cpp core.h
	$(CC) $(CFLAGS) -c -o $@ $<

$(DIR_OBJ)/hc.o: hc.cpp hc.h
	$(CC) $(CFLAGS) -c -o $@ $<

$(DIR_OBJ)/qn.o: qn.cpp qn.h
	$(CC) $(CFLAGS) -c -o $@ $<

$(DIR_OBJ)/qn_train.o: qn_train.cpp qn_train.h
	$(CC) $(CFLAGS) -c -o $@ $<

$(DIR_OBJ)/ur.o: ur.cpp ur.h
	$(CC) $(CFLAGS) -c -o $@ $<

cap: pack_cap.c
	gcc -g -o pack_cap pack_cap.c -lpcap

.PHONY: filters

filters:
	make -C qname_filter
	make -C ur_filter
	make -C hc_filter
	cp qname_filter/qn.o ../multi-filters
	cp ur_filter/ur.o ../multi-filters
	cp hc_filter/raw_hc.o ../multi-filters

.PHONY: clean

clean:
	rm $(DIR_OBJ)/*.o addf

.PHONY: test1

test1:
	./addf -t $(DIR_MIDD)/all.midd -u $(DIR_MIDD)/ip.midd -h $(DIR_MIDD)/ipttl.midd