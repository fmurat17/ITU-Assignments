int ModePin = 3; // External interrupt pin
bool flag = true; // holds the value to decide which pattern is displayed

// first pattern variables
bool mode1 = true; // time 0-3
byte left; // holds left 4 bits of sequence
byte right; // hold right 4 bits of sequence
byte whole; // union of right and left

// common
byte temp; // variable for intermediate steps

//second pattern variables
int counter = 0; // holds time for second pattern
byte shifted; // sequence to be displayed

void setup(){
  
  DDRD = B11110111; // pin 3 input, others output
  DDRB = B111111; // 8-13 output
  
  // initializing
  PORTD = B00000000; 
  PORTB = B00000110;
  
  left = B00100000; //first 4
  right = B00000100; // last 4
  whole = B00000000; // left + right
  temp = B00000000; // for shifts
  
  shifted = B10000001;
  
  cli();
  
  // adjusting timer interrupt
  TCNT1  = 0;
  TCCR1A = 0;
  TCCR1B = 0;
  OCR1A = 15624;  // required frequency value for 1 second interrupt
  TCCR1B |= (1 << WGM12);
  TCCR1B |= (1 << CS12) | (1 << CS10);
  TIMSK1 |= (1 << OCIE1A);
  sei();
  // External interrup
  attachInterrupt(digitalPinToInterrupt(ModePin), change_mode, RISING);
}

// Timer interrupt
ISR(TIMER1_COMPA_vect){
  if(flag){ // executes first pattern
    if(mode1){ // executes time 0-3 part of the first pattern
      whole = left | right;
              
      temp = whole; 
      temp >>= 2;
      
      PORTB = temp; // assigning PORTB
            
      temp = whole;
      temp <<= 6;
      
      PORTD = temp; // assigning PORTD
        
      if(whole == B10000001){ // checking if we reach to the end of the first part
        mode1 = false; // changing mode
        left >>= 1;
        right <<= 1;
      }
      
      // resetting intermediate variables
      whole = B00000000;
      temp = B00000000;
      
      left <<= 1;
      right >>= 1;
    }else if(!mode1){ // executes time 4-7 part of the second pattern
      whole = left | right;
      
      temp = whole;
      temp >>= 2;
      
      PORTB = temp; // assigning PORTB
          
      temp = whole;
      temp <<= 6;
      
      PORTD = temp; // assigning PORTD
        
      if(whole == B00011000){ // checking if we reach to the end of the first part
        mode1 = true;
        left <<= 1;
        right >>= 1;
      }
      
      // resetting intermediate variables
      whole = B00000000;
      temp = B00000000;
      
      left >>= 1;
      right <<= 1;
    }
  }else if(!flag){ // executes second pattern
    if(mode1){ // executes 0-6 time interval of second pattern
      temp = shifted;
      temp >>= 2;
      
      PORTB = temp; // assigning PORTB
      
      temp = shifted;    
      temp <<= 6;
      
      PORTD = temp; // assigning PORTD
      
      if(counter % 2 == 0){ // checks if the first LED to turn on
        PORTB |= B00100000; 
      }
      
      counter++; // incrementing counter
      
      if(shifted == B10000000){ // checking border
        mode1 = false; // changing mode
        shifted >>= 2;
      }
      temp = B00000000;
      shifted <<= 1;
    }else if(!mode1){ // executes 8-14 time interval of second pattern 
      temp = shifted; 
      temp >>= 2;
      
      PORTB = temp;// assigning PORTB
      
      temp = shifted;    
      temp <<= 6;
      
      PORTD = temp;// assigning PORTD
      
      if(counter % 2 == 0){
        PORTB |= B00100000; 
      }
        counter++; // incrementing counter
      
        if(shifted == B00000001){// checking border
          mode1 = true;// changing mode
          shifted <<= 2;
        }
        temp = B00000000;
        shifted >>= 1;
    }    
  }  
}

//empty loop as desired
void loop(){
  
}

void change_mode(){
  flag = !flag; // changing mode between first and second pattern
  // re-initializing patterns
  if(flag){       
    left = B00100000; 
    right = B00000100; 
    whole = B00000000;
    temp = B00000000;
    mode1 = true;    
    PORTD = B00000000;
    PORTB = B00000110;
  }else{  
    shifted = B10000001;
    mode1 = true;
    counter = 0;        
    shifted = B10000001;
  }  
}