//Interrupt button that control number generator 
int button = 3;

//Two numbers that are started the sequence
int first_number = 0;
int second_number = 0;

//The number that displayed on the seven segment display
int displayed_number = 0;

//A counter which help which number will generate
int counter = 0;

// arr_d and arr_b for the displaying the number on displayers
int arr_d[] = {B11000000,B10000000,B11000000,B11000000,
              B10000000,B01000000,B01000000,B11000000,
              B11000000,B11000000,B11000000,B00000000,
              B01000000,B10000000,B01000000,B01000000};

int arr_b[] = {B01111,B00001,B10110,B10011,B11001,B11011,
              B11111,B00001,B11111,B11011,B11101,B11111,
              B01110,B10111,B11110,B11100};


void setup()
{
  DDRD = B11110111;		//port 6-7 are outputs,port 3 is input
  DDRB = B111111;		//port 8 to 12 are outputs
  
  Serial.begin(9600);	//
  
  //Setting interrupt function
  attachInterrupt(digitalPinToInterrupt(button), get_number, RISING);
}

void loop()
{
	// void loop must stay empty
}

//Additive Lagged Fibonacci Generator
//It will add the first and second numbers,
//get the mode 16 and return the result.
int AFLG(int first, int second){
  int n = (first+second) % 16;
  return n;
}

//Interrupt function
void get_number(){
  //Using below function to get different sequence random number set
  randomSeed(millis());
  //If that is first number, write into first_number and displayer_number
  if(counter == 0){
    first_number = random(0, 16);
    displayed_number = first_number;
  }
  //If that is second number,
  //write into first_number and displayer_number
  else if(counter == 1){
    second_number = random(0,16);
    displayed_number = second_number;
  }
  //If that is third and other numbers,
  //using AFLG function and get new number
  else{
   	displayed_number = AFLG(first_number,second_number);
    first_number = second_number;
    second_number = displayed_number;
  }
  //Print the displayer_number in serial monitor also
  //(to control displayer is true) 
  Serial.println(displayed_number);
  //Increase counter by one for control if else statement below
  counter++;
  //Display the number at seven segment display
  PORTD=arr_d[displayed_number];
  PORTB=arr_b[displayed_number];
}