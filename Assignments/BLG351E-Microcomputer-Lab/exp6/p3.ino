void setup()
{
  DDRD = B11111100; // Output mode for LCD inputs
  DDRB = B1; // Output mode for LCD Enable
  
  initLCD();
  
  sendChar('M');
  sendChar('U');
  sendChar('S');
  sendChar('T');
  sendChar('A');
  sendChar('F');
  sendChar('A');
  sendCMD(B11000000); // New line
  sendChar('T');
  sendChar('O');
  sendChar('S');
  sendChar('U');
  sendChar('N');
}

void loop()
{
  
}

void waitMicros(int time){
  long start_time=micros();
  while(micros()-start_time < time);
}

void waitMillis(int time){
  long start_time=millis();
  while(millis()-start_time < time);
}


void initLCD(){
  PORTD= PORTD&B11110011; //Clear RS and R/W
  waitMillis(100);  //Wait 100 ms
  
  PORTD= (PORTD&B00001111)|B00110000; //Special case of 'Function Set'
  triggerEnable();		//Send Enable Signal
  waitMillis(5);   //Wait 5ms
  
  PORTD= (PORTD&B00001111)|B00110000; //Special case of 'Function Set'
  triggerEnable();		//Send Enable Signal
  waitMicros(150);
  
  PORTD= (PORTD&B00001111)|B00110000; //Function set, Interface is 8 bit longs
  triggerEnable();		//Send Enable Signal
  waitMicros(150);
  
  PORTD= (PORTD&B00001111)|B00100000; //Initial 'Function Set' to change interface
  triggerEnable();		//Send Enable Signal
  waitMicros(150);
  
  PORTD= (PORTD&B00001111)|B00100000; //'Function Set' DL=0 // Dataline 8bits
  triggerEnable();		//Send Enable Signal
  PORTD= (PORTD&B00001111)|B10000000; //'Function Set' N=1 //2 lines
 									  // F =0 5x8 dots
  triggerEnable();		//Send Enable Signal
  waitMicros(55);
  
  PORTD= (PORTD&B00001111); //Dısplay On Of control
  triggerEnable();		//Send Enable Signal
  PORTD= (PORTD&B00001111)|B10000000; 
  triggerEnable();		//Send Enable Signal
  waitMicros(55);
  
  PORTD= (PORTD&B00001111); //Clear display
  triggerEnable();		//Send Enable Signal
  PORTD= (PORTD&B00001111)|B00010000; 
  triggerEnable();		//Send Enable Signal
  waitMillis(5);
  
  PORTD= (PORTD&B00001111); //Entry mode set
  triggerEnable();		//Send Enable Signal
  PORTD= (PORTD&B00001111)|B01100000; //ID=1 Increment, S=0
  triggerEnable();		//Send Enable Signal
  waitMicros(55);
  
  PORTD= (PORTD&B00001111); //Dısplay On Of control
  triggerEnable();		//Send Enable Signal
  PORTD= (PORTD&B00001111)|B11100000; //Display =1
  								      //Cursor =1
  									  //Blink cursor=0
  triggerEnable();		//Send Enable Signal
  waitMicros(55);
}

void triggerEnable(){
  PORTB |= B1; // Enable = 1 
  PORTB &= B0; // Enable = 0
}

void sendCMD(int command){
  PORTD &= B00000011;          // Clear RS, RW and data bus
  PORTD |= (command&B11110000);// Send upper nibble(leftmost 4 bits)
  triggerEnable();             // Send data to LCD	
  command = command << 4;      // Shift left to send lower nibble 
  PORTD &= B00001111;          // Clear data bus
  PORTD |= (command&B11110000);// Send lower nibble(rightmost 4 bits)
  triggerEnable();		       // Send data to LCD
  waitMicros(55);
}

void sendChar(char ch){
  PORTD &= B00000011; 	  // Clear RW and data bus
  PORTD |= B00000100; 	  // Set RS
  PORTD |= (ch&B11110000);// Send upper nibble(leftmost 4 bits)
  triggerEnable();		  // Send data to LCD		
  ch = ch << 4;			  // Shift left to send lower nibble
  PORTD &= B00001111;	  // Clear data bus
  PORTD |= (ch&B11110000);// Send lower nibble(rightmost 4 bits)
  triggerEnable();		  // Send data to LCD	
  waitMicros(55);
}

