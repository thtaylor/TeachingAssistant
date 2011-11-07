CC=g++
CFLAGS=-c -Wall
SOURCES=student01_lab2.cpp
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=lab2

all: $(SOURCES) $(EXECUTABLE) clean

main: $(SOURCES2) $(EXECUTABLE2) clean

$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) -g $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

$(EXECUTABLE2): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

clean:
	rm -rf *.o
