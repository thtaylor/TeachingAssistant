CC=g++
CFLAGS=-c -Wall
SOURCES=student03_lab1.cpp
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=lab1.exe

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
