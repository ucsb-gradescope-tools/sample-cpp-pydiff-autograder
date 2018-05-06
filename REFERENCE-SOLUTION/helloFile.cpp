#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char const *argv[])
{
	ofstream f("hello.txt");
	f << "Hello, file!" << endl;
	f.close();
	return 0;
}