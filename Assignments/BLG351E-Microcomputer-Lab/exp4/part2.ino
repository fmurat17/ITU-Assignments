int input = A0; //pin for potentiometer
int last; // last (ones) digit
int array[] = {B00000001, B01001111, B00010010, B00000110, 
               B01001100, B00100100, B00100000, B10001111,
               B00000000, B00001100}; //array for 7SD value

void setup()
{
  pinMode(input, INPUT); //Set the p port input
  DDRB = B00000001; //Output mode for BJT
  DDRD = B01111111; //Output mode for 7SD ports
  PORTB = B00000000; //Activating Display via BJT
}

void loop()
{
  last = analogRead(input) % 10; //last digit of analog
  PORTD = array[last]; //Displaying last digit on 7SD
}