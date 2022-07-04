byte timer = B00000001;

void setup() {
    DDRD = B11111111; //output mode
}

void loop() {
    PORTD = timer; //setting HIGH

    delay(1000);

    timer++; 
}