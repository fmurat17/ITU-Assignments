#include <stdio.h>
#include <stdbool.h>
/**
 *  Istanbul Technical University
 *  assignment3.c
 *  Purpose: Finding the best slot for car in grid according to the given rules.
 *  
 *  @author Fatih MURAT 
 *  @student_id 150170039
 **/

/*
* Returns the absolute value of the parameter x.
*/
int abs(int x){ 
	return x < 0 ? -(x) : x;
}

/*
* Calculates manhattan distance between two points and returns it.
*/
int manhattan(int x1, int y1, int x2, int y2){
	return abs(x1-x2) + abs(y1-y2);
}

int main(){

	int size, cars, x, y;
	
	while(true){ // Until the user inputs correct value which is interval of [1,50], it keeps asking to input size.
		printf("Size: ");
		scanf("%d", &size);
		if(size > 50 || size < 1) printf("Size must be between 50 and 1: ");
		else break;	
	}

	printf("Cars: ");
	scanf("%d", &cars);

	if(cars >= (size * size)){ // ERROR CHECKING!!! Number of cars can not be equal or bigger to the area of the grid.
		printf("Best Slot Found In: 0 0\n");
		return 0;
	}

	if(cars == 0){ // ERROR CHECKING!!! Number of cars can not be equal to 0.
		printf("Best Slot Found In: 1 1\n");
		return 0;
	}

	int area[size][size], distance[size][size]; // Area array keeps the locations of cars.  
	for(int i = 0; i < size; i++){	// Distance array keeps the manhattan distance to the nearest car of each points.
		for(int j = 0; j < size; j++){
			area[i][j] = 0; // Since i use this 0's in comparison operations, i fill the arrays with 0's.
			distance[i][j] = 0; // I do not want them to be filled with random memory adresses.
		}
	}

	for(int i = 0; i < cars; i++){ // I filled given locations with 1's.
		printf("Locations: "); // Since x-y coordinat plane and the array's coordinat plane is different, i converted them.
		scanf("%d %d", &x, &y); // for array[i][j] --> i = size - y && j = x - 1
		area[size-y][x-1] = 1;
	}

	int smallest; // With these for loops, smallest manhattan distance of each points are calculated.
	for(int i = 0; i < size; i++){
		for(int j = 0; j < size; j++){
			smallest = 9999;
			if(area[i][j] == 0){
				for(int k = 0; k < size; k++){
					for(int m = 0; m < size; m++){
						if(area[k][m] == 1){
							if(manhattan(j+1, size-i, m+1, size-k) < smallest){
								smallest = manhattan(j+1, size-i, m+1, size-k);
								distance[i][j] = smallest;
							}
						}
					}
				}
			}
		}
	}

	int largest = 0;
	int best_slot[2] = {0,0}; // best_slot[0] = x  &&  best_slot[1] = y
	for(int i = 0; i < size; i++){ // In this block, best slot is being searched.
		for(int j = 0; j < size; j++){
			if(distance[i][j] >= largest){
				if(distance[i][j] > largest){
					largest = distance[i][j];
					best_slot[0] = i;
					best_slot[1] = j;
				}else if(distance[i][j] == largest){ // If the manhattan distances are equal, first x and then y coordinates are compared.
					if(j < best_slot[1]){
						best_slot[0] = i;
						best_slot[1] = j;
					}else if(j == best_slot[1]){
						if(i > best_slot[0]){
							best_slot[0] = i;
							best_slot[1] = j;
						}
					}
				}
			}
		}
	}
	/*
	for(int i = 0; i < size; i++){		// printing grid
		for(int j = 0; j < size; j++){ 
			printf("%d ", area[i][j]);
		}
		printf("\n");
	}

	printf("----------------------\n");

	for(int i = 0; i < size; i++){		// printing manhattan distances
		for(int j = 0; j < size; j++){
			printf("%d ", distance[i][j]);
		}
		printf("\n");
	}
	*/
	
	printf("Best Slot Found In: %d %d\n", best_slot[1]+1, size-best_slot[0]);

	return 0;
}