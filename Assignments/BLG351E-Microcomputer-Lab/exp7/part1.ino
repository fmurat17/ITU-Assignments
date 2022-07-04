const float VCC = 5.0; // value of voltage source
const float R = 100000.0; // external resistance
const float STRAIGHT_RES = 29987.29; // resistance value at 0 degree
const float BEND_RES = 162981.98; // resistance value at 180 degree

void setup()
{
  // setting PINS as inputs
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);

  Serial.begin(9600);
}


void loop()
{
  // read analog flex sensor values on each pin
  int a0 = analogRead(A0);
  int a1 = analogRead(A1);
  int a2 = analogRead(A2);
  int a3 = analogRead(A3);
  
  // get output voltage of flex sensors 
  float flexV0 = a0 * VCC / 1023.0;
  float flexV1 = a1 * VCC / 1023.0;
  float flexV2 = a2 * VCC / 1023.0;
  float flexV3 = a3 * VCC / 1023.0;
  
  // get resistance of flex sensors
  float flexR0 = R * flexV0 / (VCC - flexV0);
  float flexR1 = R * flexV1 / (VCC - flexV1);
  float flexR2 = R * flexV2 / (VCC - flexV2);
  float flexR3 = R * flexV3 / (VCC - flexV3);
  
  // calculate angle of flex sensors
  float angle0 = calculateAngle(flexR0);
  float angle1 = calculateAngle(flexR1);
  float angle2 = calculateAngle(flexR2);
  float angle3 = calculateAngle(flexR3);
  
  // send results via UART protocol 
  printSensor(0, a0, flexR0, angle0);
  printSensor(1, a1, flexR1, angle1);
  printSensor(2, a2, flexR2, angle2);
  printSensor(3, a3, flexR3, angle3);
  Serial.println("---------------------");
  
  waitMillis(200); // 5 Hz
}

float calculateAngle(float flexR){
  float angle = (flexR - STRAIGHT_RES) * (180 - 0) / (BEND_RES - STRAIGHT_RES) - 0;
  return angle;
}

void printSensor(int index, int analogValue, float resistance, int angle){
  Serial.print('!');
  Serial.print(index);
  Serial.print(';');
  Serial.print(analogValue);
  Serial.print(';');
  Serial.print(resistance);
  Serial.print(';');
  Serial.print(angle);
  Serial.println('#');
}

void waitMillis(int time){
  long start_time=millis();
  while(millis()-start_time < time);
}