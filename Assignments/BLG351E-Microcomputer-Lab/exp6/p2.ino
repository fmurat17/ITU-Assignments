volatile int total_time = 0;  //Kept the total time of stopwatch
volatile int lap = 0;	//Kept the lap value
volatile int lap_time = 0;	//Kept the lap time
volatile int p_time = 0; // Kept the previous time

//Using to show the time on each display
volatile int number;
//Using to delay each displayers transition
unsigned long time_1 = 0;
unsigned long time_2 = 0;
unsigned long time_3 = 0;
unsigned long time_4 = 0;

//Set 10ms delay each display
int short_delay = 10;

//Control the count time on stopwatch
bool start_time = false;
//Control calculating each lap time operation
bool calculate_laptime = false;

// arr_d and arr_b for the displaying the number on displayers
int arr_d[] = {B00010000, B11110000, B00100000, B01100000, 
               B11000000, B01000000, B00000000, B11110000, 
               B00000000, B11000000};

int arr_b[] = {B000, B100, B001, B000, B100, B010, B010,
               B000, B000, B000};

//Interrupt button that counts the time on the stopwatch 
int start = 2;
//Interrupt button that calculates the lap time 
int laptime = 3;


void setup()
{
  
  DDRC = B111111;	//A2-A5 as output
  DDRD = B11110011;	//2-3 as input, 4-7 as output
  DDRB = B000111;	//8-10 as output
  
  
  // Timer1 cuttof operations
  cli();
  
  TCNT1  = 0;
  TCCR1A = 0;
  TCCR1B = 0;
  OCR1A = 156.24;  // Time cutoff frequency required to operate every centisecond
  TCCR1B |= (1 << WGM12);
  TCCR1B |= (1 << CS12) | (1 << CS10);
  TIMSK1 |= (1 << OCIE1A);
  sei();
  
  // setting interrrupt functions
  attachInterrupt(digitalPinToInterrupt(start), START_TIME, RISING);
  attachInterrupt(digitalPinToInterrupt(laptime), CALCULATE_LAPTIME, RISING);
  
  Serial.begin(9600);
  
}

//Function run every centiseconds
ISR(TIMER1_COMPA_vect){
  
  //If press the third button, reset the time, lap and lap_time values
  if(PINB == 32){
    total_time = 0;
    lap = 0;
    lap_time = 0;
    p_time = 0;
  }
  
  //If the circuit in count time operation, increase total time by one 
  else if(start_time) total_time++;
  
  //If the circuit in calculate lap time operation, if block will run
  if(calculate_laptime){
    //Increase lap value by one
    lap++;
    //Calculating current lap time by subtracting the previous lap time the total time 
    lap_time = total_time - p_time;
    p_time = total_time;
    
    //Print Lap value
    Serial.print("Lap: ");
    Serial.println(lap);
    
    //Print Lap time value
    Serial.print("Lap Time: ");
    Serial.print(lap_time / 100);
    Serial.print(".");
    if(lap_time % 100 < 10){
    	Serial.print(0);
      	Serial.println(lap_time % 100);
    }else{
    	Serial.println(lap_time % 100);
    }
    
    //Print total time
    Serial.print("Total Time: ");
    Serial.print(total_time / 100);
    Serial.print(".");
    if(total_time % 100 < 10){
    	Serial.print(0);
      	Serial.println(total_time % 100);
    }else{
    	Serial.println(total_time % 100);
    }
         
    calculate_laptime = false;
  }
}

void loop()
{
  if(millis() >= time_1 + short_delay){ // 10 milliseconds passed        
      time_1 += short_delay;
      
      PORTC = B011111;  // Opens centisecond's ones digit
   
      number = (total_time / 1000) % 10;    
    
      PORTD = arr_d[number];
      PORTB = arr_b[number];
  }
  if(millis() >= time_2 + 2 * short_delay){ //  20 milliseconds passed      
      time_2 += 2 * short_delay;
      
      PORTC = B101111;  // Opens centisecond's tens digit
    
      number = (total_time / 100) % 10;    
    
      PORTD = arr_d[number];
      PORTB = arr_b[number];      
  }
  if(millis() >= time_3 + 3 * short_delay){ //  30 milliseconds passed      
      
    time_3 += 3 * short_delay;
      
    PORTC = B110111;  // Opens Opens second's ones digit
	    
    number = (total_time / 10) % 10;    
    
    PORTD = arr_d[number];
    PORTB = arr_b[number];
  
  }

  if(millis() >= time_4 + 4 * short_delay){ //  40 milliseconds passed      
      
    time_4 += 4 * short_delay;
      
    PORTC = B111011;  // Opens Opens second's tens digit
    
    number = total_time % 10;
   
    PORTD = arr_d[number];
    PORTB = arr_b[number]; 
   
  }  
}

//If press the first button, set the circuit in time counting operation
void START_TIME(){
  start_time = true;
  calculate_laptime = false;
}

//If press the second button, set the circuit in calculate lap time operation
void CALCULATE_LAPTIME(){
  calculate_laptime = true;
}