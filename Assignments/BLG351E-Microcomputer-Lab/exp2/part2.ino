// Pattern 1
byte timer1 = B00000001;
boolean flag1 = true;

// Pattern 2
byte timer2 = B10000000;
boolean flag2 = true;

// Pattern 3
int counter1 = 0;
byte timer3 = B10000000;
byte timer4 = B00000010;

// Pattern 4
byte timer5 = B00000001;
boolean flag3 = true;

void setup()
{
	DDRB = B00000000;
  	DDRD = B11111111;
  	//Serial.begin(9600);
}

void loop()
{
  if(PINB == 4){
    //Serial.println("LL");
    timer2 = B10000000;
    flag2 = true;
    counter1 = 0;
    timer3 = B10000000;
	timer4 = B00000010;
	timer5 = B00000001;
	flag3 = true;
    
    PORTD = timer1;
    delay(1000);
    if(flag1){
      timer1 *= 2;
      if(timer1 == B10000000){
      	flag1 = false;
      }
    }else{
    	timer1 /= 2;
      	if(timer1 == B00000001){
      	flag1 = true;
      }
    }
  }else if(PINB == 5){
    //Serial.println("LH");
  	timer1 = B00000001;
    flag1 = true;
    counter1 = 0;
    timer3 = B10000000;
	timer4 = B00000010;
	timer5 = B00000001;
	flag3 = true;
    
    PORTD = timer2;
    delay(1000);
    if(flag2){
    	timer2 /= 2;
      if(timer2 == B00000001){
      	flag2 = false;
      }
    }else{
    	timer2 = B10000000;
      	flag2 = true;
    }
  }else if(PINB == 6){
    //Serial.println("HL");
    timer1 = B00000001;
    flag1 = true;
    timer2 = B10000000;
    flag2 = true;
	timer5 = B00000001;
	flag3 = true;
    
    if(timer3 == 0){
    	timer3 = B10000000;
    }else if(timer4 == 0){
    	timer4 = B00000010;
    }
    
    if(counter1 % 2 == 0){
    	PORTD = timer3;
      	timer3 /= 4;
      	counter1++;
    }else if(counter1 % 2 == 1){
    	PORTD = timer4;
      	timer4 *= 4;
      	counter1++;
    }
 
    delay(2500);
  }else if(PINB == 7){
    //Serial.println("HH");
  	timer1 = B00000001;
    flag1 = true;
    timer2 = B10000000;
    flag2 = true;
    counter1 = 0;
    timer3 = B10000000;
    timer4 = B00000010;
    
    PORTD = timer5;
    if(flag3){
      timer5 *= 2;
      if(timer5 == B00001000){
        flag3 = false;
      }
      else if(timer5 == B00000000){
        timer5 = B00000001;
      }
    }
    else{
      timer5 /= 2;
      if(timer5 == B00000000){
        timer5 = B10000000;
      }
      else if(timer5 == B00010000){
      	flag3 = true;
      }
    }
    
    delay(3000);
  }
}