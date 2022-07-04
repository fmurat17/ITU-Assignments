void setup()
{
	DDRB = B00000000;
  	DDRD = B11111111;
  	PORTD = B00000000;
}

void loop()
{
    if(PINB == 4){
      	PORTD++;
    }else{
    	PORTD--;
    }
  	delay(1000);
}