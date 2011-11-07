CC=g++
CFLAGS=-c -Wall
<<<<<<< HEAD
SOURCES=student03_lab2.cpp
=======
SOURCES=student04_lab2.cpp
>>>>>>> 445a04a4a5d5dd91d9f8a87a25f9c0d4fae213c1
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=lab2.exe

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
