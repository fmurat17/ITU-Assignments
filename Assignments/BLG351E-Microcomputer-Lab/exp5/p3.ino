// arr_d and arr_b for the displaying the number on displayers
int arr_d[] = {B00010000, B11110000, B00100000, B01100000, 
               B11000000, B01000000, B00000000, B11110000, 
               B00000000, B11000000};

int arr_b[] = {B000, B100, B001, B000, B100, B010, B010,
               B000, B000, B000};

int counter1 = 1; // counts the left two displayers
int counter2 = 1; // counts the right two displayers

int current; // holds the current time of simulator
int previous; // hold general passed time
int previous2; // holds left two segment's passed time
int previous3; // holds right two segment's passed time

int ones, tens; // ones and tens digit of first player
int ones1, tens1; // ones and tens digit of second player

bool flag = true; // determines which player's turn
volatile bool checker = false; // checks if numbers are equal
  
int F = 2; // first player's interrupt button
int S = 3; // second player's interrupt button

void setup()
{
  DDRC = B111111; // A2-A5 as output
  DDRD = B11110011; // 4-7 as output, 2-3 as input
  DDRB = B111; // 8-10 as output
  
  // initialising
  PORTC = B000000; 
  PORTD = arr_d[0];
  PORTB = arr_b[0];
  
  previous = 0;
  previous2 = 0;
  previous3 = 0;
  
  // setting interrrupt functions
  attachInterrupt(digitalPinToInterrupt(F), first, RISING);
  attachInterrupt(digitalPinToInterrupt(S), second, RISING);  
}

void loop() // main loop to run game between players
{
  if(flag){    
    sol_sayac();
  }else if(!flag){    
    sag_sayac();
  }
}

void sol_sayac(){  // Let first player catch the second player
  if(checker){ // If button is pressed, checks if the numbers are equal and if not change the turn
    if(counter1 == counter2){
      PORTC = B000011;
      PORTD = arr_d[1]; // Displays 1
      PORTB = arr_b[1]; // Displays 1
      return;
    }
    flag = false; // changing turn
    checker = false;
    return;
  }
  current = millis();
  
  // First number's digits
  ones = counter1 % 10;
  tens = counter1 / 10;
  
  // Second number's digits
  ones1 = counter2 % 10;
  tens1 = counter2 / 10;
    
  if(current >= previous2 + 3){ // 3 milliseconds passed        
    PORTC = B101111;  // Opens first player's ones digit
    
    PORTD = arr_d[ones];
    PORTB = arr_b[ones];
   }else if(current >= previous3 + 6){ //  6 milliseconds passed      
      PORTC = B111011;  // Opens second player's ones digit
    
      PORTD = arr_d[ones1];
      PORTB = arr_b[ones1];      
   }
  if(current >= previous2 + 9){ //  9 milliseconds passed      
      PORTC = B011111;  // Opens first player's tens digit
    
      PORTD = arr_d[tens];
      PORTB = arr_b[tens];
      previous2 = current;      
   }

  else if(current >= previous3 + 12){ //  12 milliseconds passed      
      PORTC = B110111;  // Opens second player's tens digit
    
      PORTD = arr_d[tens1];
      PORTB = arr_b[tens1];
      previous3 = current;
   } 
    
  if(current >= previous + 200){ // General timer to count up number
      previous = current;
      counter1++;  
    
      if(counter1 == 21){ // Checks the border (0-20)
        counter1 = 1; // Increments the number of first player
      }
  }
}

void sag_sayac(){ // Let second player catch the second player
  if(checker){ // If button is pressed, checks if the numbers are equal and if not change the turn
    if(counter1 == counter2){
      PORTC = B000011;
      PORTD = arr_d[2]; // Displays 2
      PORTB = arr_b[2]; // Displays 2
      return;
    }
    flag = true; // changing turn
    checker = false;
    return;
  }
  
  current = millis();
  
  // First number's digits
  ones = counter1 % 10;
  tens = counter1 / 10;
  
  // Second number's digits
  ones1 = counter2 % 10;
  tens1 = counter2 / 10;
    
  if(current >= previous2 + 2){ //  2 milliseconds passed        
      PORTC = B111011;// Opens second player's ones digit
    
      PORTD = arr_d[ones1];
      PORTB = arr_b[ones1];
   }
  else if(current >= previous3 + 4){ //  4 milliseconds passed      
      PORTC = B101111;// Opens first player's ones digit
    
      PORTD = arr_d[ones];
      PORTB = arr_b[ones];
      
   }
  if(current >= previous2 + 6){ // 6 milliseconds passed      
      PORTC = B110111;// Opens second player's tens digit
    
      PORTD = arr_d[tens1];
      PORTB = arr_b[tens1];
      previous2 = current;      
   }

  else if(current >= previous3 + 8){ //  8 milliseconds passed      
      PORTC = B011111;// Opens first player's tens digit
    
      PORTD = arr_d[tens];
      PORTB = arr_b[tens];
      previous3 = current;
   } 
    
  if(current >= previous + 200){// General timer to count up number
      previous = current;
      counter2++;  // Increments the number of second player
    
      if(counter2 == 21){ // Checks the border (0-20)
        counter2 = 1;
      }
  }
}

void first(){  // Interrupt function to let first player use the button
  if(flag) checker = true;
  else return;
}

void second(){ // Interrupt function to let second player use the button
  if(!flag) checker = true;
  else return;
}