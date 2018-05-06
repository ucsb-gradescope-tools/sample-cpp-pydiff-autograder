BINARIES=helloConsole helloFile

all:	${BINARIES}

helloConsole: helloConsole.cpp
	g++ -std=c++11 helloConsole.cpp -o helloConsole

helloFile: helloFile.cpp
	g++ -std=c++11 helloFile.cpp -o helloFile

clean:
	/bin/rm -rf *.o ${BINARIES}