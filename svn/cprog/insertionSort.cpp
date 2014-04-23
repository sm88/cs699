void insertionSort(int *aList, int aStart, int aEnd){
	for(int j = aStart + 1; j < aEnd - 1; j++){
		int key = aList[j];	//pick a number in the list
		int i = j-1;	//check slots from first
		while(i>=0 && aList[i]>=key){
			aList[i+1]=aList[i];			
			i--;
		}
		aList[i+1] = key;
	}
}
