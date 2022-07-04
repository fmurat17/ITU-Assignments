#include <stdio.h>

int main(){

	int year, month, day;
	printf("Enter date [year month day]: ");
	scanf("%d %d %d", &year, &month, &day);

	if( (day < 1) 				  ||
		(month < 1 || month > 12) ||
		(month == 1 && day > 31)  ||
		(month == 2 && day > 28)  ||
		(month == 3 && day > 31)  ||
		(month == 4 && day > 30)  ||
		(month == 5 && day > 31)  ||
		(month == 6 && day > 30)  ||
		(month == 7 && day > 31)  ||
		(month == 8 && day > 31)  ||
		(month == 9 && day > 30)  ||
		(month == 10 && day > 31) ||
		(month == 11 && day > 30) ||
		(month == 12 && day > 31)){
		printf("Invalid date.\n");
		return 1;
	}

	int end_year;
	printf("Enter end year: ");
	scanf("%d", &end_year);

	int q, m, j, k;
	int temp_year = year;

	q = day;

	m = month;
	if(month == 1 || month == 2){
		m += 12;
		temp_year--;
	}

	j = temp_year / 100;
	k = temp_year % 100;

	int result;
	result = (q + (13*(m+1)/5) + k + (k/4) + (j/4) + 5*j) % 7;

	switch (result){
		case 0:
			printf("It's a Saturday.\n");
			break;
		case 1:
			printf("It's a Sunday.\n");
			break;
		case 2:
			printf("It's a Monday.\n");
			break;
		case 3:
			printf("It's a Tuesday.\n");
			break;
		case 4:
			printf("It's a Wednesday.\n");
			break;
		case 5:
			printf("It's a Thursday.\n");
			break;
		case 6:
			printf("It's a Friday.\n");
			break;
		default:
			printf("Something went wrong!!\n");
			return 1;
	}

	int number_of_matching_days = 0;

	for(int i = (year+1); i <= end_year; i++){
		m = month;
		temp_year = i;
		if(month == 1 || month == 2){
			m += 12;
			temp_year--;
		}
		j = temp_year / 100;
		k = temp_year % 100;

		int matching_result = (q + (13*(m+1)/5) + k + (k/4) + (j/4) + 5*j) % 7;

		if(matching_result == result) number_of_matching_days++;
	}

	printf("Same day-and-month on same weekday between %d and %d: %d\n", (year+1), end_year, number_of_matching_days);
	return 0;
}