int button = 3; 	// button pin
int *array; 		// dynamic array
int counter_arr[8]; // counts generated numbers
String m_str;		// String holds Serial input
int m;				// input value in int
void setup()
{
  DDRD = B11110111;  // button as input
  Serial.begin(9600); 
  // Setting interrupt function
  attachInterrupt(digitalPinToInterrupt(button), get_number, RISING);
}

void loop()
{
	// void loop must stay empty
}

void get_number(){
  interrupts();
  
  // if any input is given before pressing the button neglect it
  String temp = Serial.readString(); 
  
  Serial.println("Please enter a m value:");
  while(!Serial.available()); // wait for input
  m_str = Serial.readString();// read input 
  m = m_str.toInt(); // convert input to int
  array = (int*)malloc(m * sizeof(int)); // allocate memory
  // Using  below  function  to  get  different  sequence random number  set
  randomSeed(millis()); 
  
  array[0] = random(0, 8); // randomly select first number
  array[1] = random(0, 8); // randomly select second number 
  
  int i;
  // generate m numbers
  for(i = 2; i<m; i++){
    array[i] = (array[i-1] + array[i-2]) % 8; 
  }
  // print generated numbers
  for(i = 0; i<m; i++){
    Serial.println(array[i]);
  }
  // count how many times were produced from which number 
  for(i = 0; i<m; i++){
    counter_arr[array[i]]++;
  }
  // print how many times were produced from which number 
  for(i = 0; i<8; i++){
    Serial.print(i);
    Serial.print(": ");
    Serial.print(counter_arr[i]);
    Serial.println(" times");
  }
}