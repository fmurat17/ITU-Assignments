/*
 *  Istanbul Technical University
 *  assignment2.c
 *  Purpose: Playing console dart game by tracking points.
 *  
 *  @author Fatih MURAT 
 *  @student_id 150170039
 */
#include <stdio.h>
#include <stdbool.h> // bool data type

/*
* @function -> int point(int, char)
* @param segment The value of the segment that the dart is thrown.
* @param ring Specifies the radial position of the dart.
* @return The point value of the throw(integer).
*/

int point(int segment, char ring){
	int result;

	if(ring == 'S')		 result = 1 * segment;
	else if(ring == 'D') result = 2 * segment;
	else if(ring == 'T') result = 3 * segment;
	else if(ring == 'O') result = 25;
	else if(ring == 'I') result = 50;

	return result;
}

/*
* @function -> int remaining_point(int,int,int,char,bool)
* @param target Target point to end game.
* @param current Current point.
* @param segment Segment that dart landed.
* @param ring The value of the segment that the dart is thrown.
* @param flag Checks if the player landed proper segment to start game and decrease the point.
* @return Remaining point(integer).
*/

int remaining_point(int target, int current, int segment, char ring, bool flag){
	if(!flag) return target;

	int result = current - point(segment, ring);

	if(result < 0 || result == 1) return current;
	if(result == 0 && ring != 'D') return current;

	return result;
}

int main(){

	int target, current, segment;
	char ring;
	bool flag = false;

	printf("Target: ");
	scanf("%d", &target);

	current = target;

	while(current != 0){
		printf("Throw: ");
		scanf("%d %c", &segment, &ring);

		if(ring == 'D') flag = true; // Until player hits 'D' ring, points are decreased.
                                     // After 'D' ring is hit, game starts and points are decreased.		
		current = remaining_point(target, current, segment, ring, flag);
		printf("Points: %d\n", current);
	}

	return 0;
}