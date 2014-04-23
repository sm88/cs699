CC=g++

all: combined

combined: main.o quickSort.o insertionSort.o
	$(CC) -o combined main.o quickSort.o insertionSort.o

main.o: main.cpp mysort.h

quickSort.o: quickSort.cpp mysort.h

insertionSort.o: insertionSort.cpp mysort.h

.PHONY: clean

clean:
	rm -fv *.o combined
