CC := g++
CFLAGS := -g -Wall
DIR_OBJ := ./obj


addf: $(DIR_OBJ)/qn_train.o $(DIR_OBJ)/hc.o $(DIR_OBJ)/qn.o $(DIR_OBJ)/ur.o $(DIR_OBJ)/core.o main.cpp
	$(CC) -o $@ $^

$(DIR_OBJ)/main.o: main.cpp
	$(CC) -c -o $@ $<

$(DIR_OBJ)/core.o: core.cpp core.h
	$(CC) -c -o $@ $<

$(DIR_OBJ)/hc.o: hc.cpp hc.h
	$(CC) -c -o $@ $<

$(DIR_OBJ)/qn.o: qn.cpp qn.h
	$(CC) -c -o $@ $<

$(DIR_OBJ)/qn_train.o: qn_train.cpp qn_train.h
	$(CC) -c -o $@ $<

$(DIR_OBJ)/ur.o: ur.cpp ur.h
	$(CC) -c -o $@ $<

.PHONY: clean

clean:
	rm $(DIR_OBJ)/*.o addf