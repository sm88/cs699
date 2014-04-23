#include "mysort.h"

using namespace std;

static int partition(int *aList, int aStart, int aEnd){
	int pivot = aList[aEnd-1];	//pivot will always be the last element
	int i = aStart-1;	//represents part of array less than equal to pivot
	int temp=-1;

	for(int j = aStart;j < aEnd; j++){	//represents the part of array greater than pivot
		if(aList[j] < pivot){
			i++;
			temp = aList[j];
			aList[j] = aList[i];
			aList[i] = temp;
		}	
	}

	temp = aList[i+1];
	aList[i+1] = pivot;
	aList[aEnd-1] = temp;
	return (i+1);
}

void quickSort(int *aList, int aStart, int aEnd){
	if(aEnd - aStart < INSERTION_SORT_THRESHOLD)
		insertionSort(aList, aStart, aEnd);
	else if(aStart < aEnd){
		int pos = partition(aList, aStart, aEnd);
		quickSort(aList, aStart, pos);
		quickSort(aList, pos+1, aEnd);
	}
}
