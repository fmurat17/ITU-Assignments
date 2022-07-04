int ones, tens;
int current, previous; // This variables used in timing operations
int counter; // holds the number that is going to be displayed
volatile bool flag; // flag for modes between counting up and counting down

int ZeroPin = 3;
int ModePin = 2;

void setup()
{
  DDRD = B0000; // input for buttons 
  DDRB = B1111; // output for ones digit of 7SD
  DDRC = B1111; // output for tens digit of 7SD
  
  PIND = 0; // initializing
  
  previous = 0;
  counter = 0;
  
  flag = true;
  
  attachInterrupt(digitalPinToInterrupt(ZeroPin), set_zero, RISING);
  attachInterrupt(digitalPinToInterrupt(ModePin), change_mode, RISING);
}

void loop()
{
  current = millis();
  
  ones = counter % 10;
  tens = counter / 10;
  
  PORTB = ones; // displaying ones digit on 7SD
  PORTC = tens; // displaying tens digit on 7SD
  
  if(current >= previous+1000){ // 1 second passed
    
    if(flag) counter++; // counting up
    else counter--;   // counting down
    
    //Checking borders (0-99)
    if(counter == 100) counter = 0;
    else if(counter == -1) counter = 99;
    
    previous = current; // increasing previous value by 1 second
  }  
}

void set_zero(){  // Interrupt function to set counter 0.
  counter = 0;
}

void change_mode(){ // Interrupt function to change mode.
  flag = !flag;
}