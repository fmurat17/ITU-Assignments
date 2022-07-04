int counter; // value on first 7SD
int selected1,selected2,selected3; // value on other 7SDs
int current, previous; // two different values in milliseconds
int controller; // controlling delay to display multiple 7SD
int value; // selected value from array
int array[] = {B0000001, B1001111, B0010010, B0000110, 
               B1001100, B0100100, B0100000, B0001111,
               B0000000, B0001100, B0001000, B1100000,
               B0110001, B1000010, B0110000, B0111000
              }; // array for 7SD value
volatile int ButtonPin = 2; // pin for button
int target = 246; // target number

void setup()
{
  DDRC = B111100; // output for BJT
  DDRD = B11110000; // output for 7SDs & input for button
  DDRB = B111; // output for 7SDs
  
  // initializing the values to be used
  counter = 0;
  selected1 = -1;
  selected2 = -1;
  selected3 = -1;
  previous = 0;
  controller = 0;
  // interrupt for button
  attachInterrupt(digitalPinToInterrupt(ButtonPin), button, RISING);
}

void loop()
{
  current = millis(); // execution time in milliseconds
  
  // displaying first 7SD (counter)
  if(current <= controller+4){ 
    value = array[counter]; //getting value from array
    PORTC = B011100; // multiplexing 7SD
  	PORTB = value/16; //selecting leftmost 3 bit
  	PORTD = (value % (PORTB*8))*16; //selecting rightmost 4 bit
  }
  // displaying hundreds digit
  else if(current <= controller+8 && selected1 != -1){
    value = array[selected1];
	PORTC = B101100;
    PORTB = value/16;
    PORTD = (value % (PORTB*8))*16;
  }
  // displaying tens digit
  else if(current <= controller+12 && selected2 != -1){
	value = array[selected2];
	PORTC = B110100;
    PORTB = value /16;
    PORTD = (value % (PORTB*8))*16;
  }
  // displaying ones digit
  else if(current <= controller+16 && selected3 != -1){
	value = array[selected3];
	PORTC = B111000;
    PORTB = value /16;
    PORTD = (value % (PORTB*8))*16;
  }
  else if(current > controller+16) controller = current;

  if(current >= previous+1000){ // 1 second
    if(target%10 != selected3 || 
       (target/10) % 10 != selected2 ||
       target/100 != selected1) // the game continues
    { 
      counter++;
      if(counter == 16) counter = 0;
    } 
    previous = current;
  }
}

void button(){ // button is pressed
  if(selected1 == -1){
	selected1 = counter;
  }
  else if(selected2 == -1){
  	selected2 = counter;
  }
  else if(selected3 == -1){
  	selected3 = counter;
  }
  else{
    selected3 = selected2;
    selected2 = selected1;
    selected1 = counter;
  }
}