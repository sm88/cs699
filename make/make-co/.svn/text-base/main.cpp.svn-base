#include <iostream>
#include <cstdlib>
#include "mysort.h"
#include <vector>

using namespace std;

void printList(vector<int>&);

int main(int aArgCount, char **aArgs){
	vector<int> list;
	int index = 0;
	int userSize = 0;

	if(aArgCount <2){
		cout<<"Usage: sorter [size_of_list] number(s)"<<endl<<"Defaults to 10000 numbers!"<<endl;
		exit(0);
	}
	
	int preferredSize = MAX_LENGTH;
	if(aArgCount == 2){
		userSize = atoi(aArgs[1]);
		preferredSize = userSize > MAX_LENGTH ? MAX_LENGTH : userSize;
	}

//	cout << preferredSize <<"asdsa";

	do{
		int num = -1;
		cin >> num;
		list.push_back(num);
		index++;
	}while(index < preferredSize);
	
	if(index <= INSERTION_SORT_LIMIT){
		cout<<"Calling insertionsort algorithm!"<<endl;
		insertionSort((int *)&list[0] ,0 ,index + 1);		
	}
	else{
		cout<<"Callong quicksort algorithm!"<<endl;
		quickSort((int *)&list[0], 0, index);
	}
	printList(list);

	return 0;
}

void printList(vector<int>& aList){
	for(vector<int>::iterator it = aList.begin(); it != aList.end(); it++){
		cout<<*it<<endl;
	}
}
