#include <Servo.h>
#include <string.h>
#include <Wire.h>

Servo s1, s2, s3, s4; // servo objects are created for 4 servos

char ch; // holds incoming character
bool flag = true; // control if block
char* temp; // used for parsing operations
char del1[] = "!;#"; // delimiters

char* parsed_degrees[10]; // string array for parsed degrees
int length; // number of angles

int i = 0;

char message[18] = "";  // holds message to not lose message
char message2[18] = ""; // holds message to be processed in strtok


void setup()
{
  // We attach the servos according to their pins
  s1.attach(3);
  s2.attach(5);
  s3.attach(6);
  s4.attach(9);
  
  // Initializing the start values of servos
  s1.write(0);
  s2.write(0);
  s3.write(0);
  s4.write(0);
    
  // Setting address of ServoControllerMC to 2, and join to the I2C line
  Wire.begin(2);
  
  // receiveEvent() is called when message arrives
  Wire.onReceive(receiveEvent);
  
  // Opening serial communication with baudrate of 9600
  Serial.begin(9600);  
}


void loop()
{
 
 // This if block parse the message into int angles values.   
if(flag && strlen(message) != 0 ){  
    temp = strtok(message2, del1);
      
    // parsed_degrees holds the angles as int.
    parsed_degrees[0] = temp;
    i = 1;
    
    while(temp != NULL) {
        temp = strtok(NULL, del1);   
        parsed_degrees[i] = temp;
        i++;
     }
      
     length = i-1;

     //Serial.println(message);

     // We check if we get proper input.
     int state = is_valid();
    
    // According to validness, we continue.
    if(state == 1){ // If valid, we write angles to servos.
      s1.write(stoi(parsed_degrees[0]));
        s2.write(stoi(parsed_degrees[1]));
        s3.write(stoi(parsed_degrees[2]));
        s4.write(stoi(parsed_degrees[3]));
        /*
        strcpy(message, "");
        i = 0;
        */
    }else{ // if not, we wait for new input
        strcpy(message, "");
        i = 0;
    }
     flag = false;
    }  
}
     
// Converts string to int and returns it.
long stoi(const char *s)
{
    long i;
    i = 0;
    while(*s >= '0' && *s <= '9')
    {
        i = i * 10 + (*s - '0');
        s++;
    }
    return i;
}

//Checks if we have 4 angle values.
int number_of_messages(){
    if(length < 4) return 0;
    else if(length > 4) return 1;
    return 2;
}

// Checks if start("!") and end("#") is proper
int end_and_start(){
    int size = strlen(message);
    size--;
    if(message[0] != '!') return 0;  
    else if(message[size] != '#') return 1;
    return 2;
}

// Checks if angles are in [0,180]
int is_angles_correct(){
    for(int i = 0; i < length; i++){
        if(stoi(parsed_degrees[i]) > 180 || stoi(parsed_degrees[i]) < 0) return 0;
    }
    return 1;
}

// Checks if parameters are filled
int not_filled_parameter(){
    char i = 0;
    while(message[i] != '\0'){
        if(message[i] == ';' && message[i+1] == ';') return 0;
        i++;
    }
    return 1;
}

// Checks if is there any input other than number such as letters.
int is_valid_input(){
    int i = 0;
    while(message[i] != '\0'){
        if(message[i] == '!' || message[i] == ';' || message[i] == '#'){
            i++;
            continue;
        }
        else{
            if(message[i] < 48 || message[i] > 57) return 0;
        }
        i++;
    }
    return 1;
}

// Main error checking function to response accordingly
int is_valid(){
    if(not_filled_parameter() == 0){
        Serial.println("Error! All parameter must be filled.");
        return 0;
    }
  
    if(number_of_messages() == 0){
        Serial.println("Error! There is not enough input.");
        return 0;
    }else if(number_of_messages() == 1){
        Serial.println("Error! There is extra input input.");
        return 0;
    }
    
    if(end_and_start() == 0){
        Serial.println("Error! There is no start char.");
        return 0;
    }else if(end_and_start() == 1){
        Serial.println("Error! There is no end char.");
        return 0;
    }
    
    if(is_angles_correct() == 0){
        Serial.println("Error! Angle value must be less than 180.");
        return 0;
    }
        
    if(is_valid_input() == 0){
        Serial.println("Error! Invalid Input.");
        return 0;
    }
    
    Serial.print("S0:");
    Serial.print(stoi(parsed_degrees[0]));
    Serial.print("; ");
  
    Serial.print("S1:");
    Serial.print(stoi(parsed_degrees[1]));
    Serial.print("; ");
  
    Serial.print("S2:");
    Serial.print(stoi(parsed_degrees[2]));
    Serial.print("; ");
  
    Serial.print("S3:");
    Serial.println(stoi(parsed_degrees[3]));
  
    return 1;
}

// This function is called when new message is arrived in I2C line
void receiveEvent(int data)
{
  char ch;
  int msgCounter = 0;

  // Reading and storing the message char by char
  while(Wire.available()){
    ch = Wire.read();
    message[msgCounter] = ch;
    message2[msgCounter] = ch;
    msgCounter++;
  }  
  flag = true;
}