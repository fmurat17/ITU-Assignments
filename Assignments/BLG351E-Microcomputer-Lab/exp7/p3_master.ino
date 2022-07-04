#include <Wire.h>

char msg[18] = ""; // Message is stored in this array
void setup()
{
  // We set this MC as master by not giving any parameter
  Wire.begin(); 

  // Openin Serial communication with the baudrate of 9600
  Serial.begin(9600);
  
  // Initializing some characters
  msg[0] = '!';
  msg[17] = '\0';
  msg[16] = '#';
}


void loop()
{
  // Request input from SensorMC with the length of 15 char
  Wire.requestFrom(1,15);

  char ch;
  int i = 1;

  // Reading the message char by char
  while(Wire.available()){
    ch = Wire.read();
    msg[i] = ch; // Storing the message
    i++;
  }
  Serial.println(msg);

  Wire.beginTransmission(2); // Starting transmission to communicate with ServoControllerMC
  Wire.write(msg); // Sending the message
  Wire.endTransmission(); // Ending the transmission
  
  waitMillis(200); // 5 Hz
}

// Delay function
void waitMillis(int time){
  long start_time=millis();
  while(millis()-start_time < time);
}
