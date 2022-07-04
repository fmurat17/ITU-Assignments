byte f = B01100110;
byte y = B01111001;
byte m = B01101101;

byte letter = f;
int flag = 1;
  
void setup()
{
    DDRD = B11111111;
}

void loop()
{
    PORTD = letter;
    delay(1000);
  
    if(flag == 1){
  	    letter = f;
        flag = 2;
    }else if(flag == 2){
  	    letter = y;
        flag = 3;
    }else{
  	    letter = m;
        flag = 1;
    }
}