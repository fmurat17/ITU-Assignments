byte timer = B00000001;
boolean flag = true;

void setup()
{
    DDRD = B11111111;
}

void loop()
{
    PORTD = timer;
    delay(300);
    
    if(flag){
        timer *= 2;
        if(timer == B10000000){
            flag = false;
        }
    }else{
        timer /= 2;
        if(timer == B00000001){
     	    flag = true; 
        }
    }  
}