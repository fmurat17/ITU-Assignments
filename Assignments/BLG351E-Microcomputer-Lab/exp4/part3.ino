void setup()
{
  	pinMode(A0, INPUT); // set A0 ping as input
    DDRB = B00001111;   // initialize DDRB (8-11)
    DDRD = B11111111;	// initialize DDRB (0-6)
}

int arr[] = {B00000001, B01001111, B00010010, B00000110, 
             B01001100, B00100100, B00100000, B10001111,
             B00000000, B00001100};	 //array for 7-SD number from 0 to 9			

void loop()
{
  	int input = analogRead(A0);
      
    int ones = input % 10;  				//parsing and assigning ones
    int tens = (input % 100) / 10;			//parsing and assigning tens
    int hundreds = (input % 1000) / 100;	//parsing and assigning hundreds
    int thousands = (input % 10000) / 1000; //parsing and assigning thousands
      
    PORTB = B00001110;  // open the ones digit, close others
    display(ones);    	// display the ones digit
    delay(2);			// 2 milliseconds delay
  
    PORTB = B00001101;  // open the tens digit, close others
    display(tens);  	// display the tens digit
    delay(2);			// 2 milliseconds delay
  
    PORTB = B00001011;  // open the hundreds digit, close others
    display(hundreds);  // display the hundreds digit
    delay(2);			// 2 milliseconds delay
  
    PORTB = B00000111;  // open the thousands digit, close others  
    display(thousands); // display the thousands digit 
    delay(2);			// 2 milliseconds delay
}

void display(int input)
{
  	PORTD = arr[input];
}

// BJT 1 does not work.