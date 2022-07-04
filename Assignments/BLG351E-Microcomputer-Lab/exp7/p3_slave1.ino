#include <Wire.h>

const float VCC = 5.0; // value of voltage source
const float R = 100000.0; // external resistance
const float STRAIGHT_RES = 29987.29; // resistance value at 0 degree
const float BEND_RES = 162981.98; // resistance value at 180 degree
float angle0, angle1, angle2, angle3; // angle values
//angle values in string
char angStr0[4]; 
char angStr1[4]; 
char angStr2[4]; 
char angStr3[4];

void setup()
{
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);

  Wire.begin(1);
  Wire.onRequest(onReq);
  
  Serial.begin(9600);
}


void loop()
{
}

// calculate angle of flex sensors
float calculateAngle(float flexR){
  float angle = (flexR - STRAIGHT_RES) * (180 - 0) / (BEND_RES - STRAIGHT_RES) - 0;
  return angle;
}

// delay in milliseconds
void waitMillis(int time){
  long start_time=millis();
  while(millis()-start_time < time);
}

void onReq()
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
  angle0 = calculateAngle(flexR0);
  angle1 = calculateAngle(flexR1);
  angle2 = calculateAngle(flexR2);
  angle3 = calculateAngle(flexR3);
  
  // convert angle values to string
  itoa(angle0, angStr0);
  itoa(angle1, angStr1);
  itoa(angle2, angStr2);
  itoa(angle3, angStr3);

  char str[16] = "";
  // string concatenation 
  strcat(str,angStr0);
  strcat(str,";");
  strcat(str,angStr1);
  strcat(str,";");
  strcat(str,angStr2);
  strcat(str,";");
  strcat(str,angStr3);
  strcat(str,"\0");
  
  Serial.println(str);
  
  Wire.write(str); // send message to master
}

// integer to string conversion in 3 digits
char* itoa(int i, char b[]){
    char const digit[] = "0123456789";
    char* p = b;
    if(i<0){
        *p++ = '-';
        i *= -1;
    }
    int shifter = i;
    do{ //Move to where representation ends
        ++p;
        shifter = shifter/10;
    }while(shifter);
    *p = '\0';
    do{ //Move back, inserting digits as u go
        *--p = digit[i%10];
        i = i/10;
    }while(i);
  // add 0s to leftmost empty digits
  if(strlen(b) == 1){
  	b[1] = b[0];
    b[0] = '0';
    b[2] = '\0';
  }
  if(strlen(b) == 2){
  	b[2] = b[1];
    b[1] = b[0];
    b[0] = '0';
  }
    return b;
}