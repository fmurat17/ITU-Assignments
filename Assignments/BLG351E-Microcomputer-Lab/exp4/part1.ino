int R = 6; //pin for red LED
int G = 3; //pin for green LED
int B = 5; //pin for blue LED

int p_red = A0; //pin for red potantiometer
int p_green = A2; //pin for green potentiometer 
int p_blue = A1; //pin for blue potentiometer 


int r,g,b;  //create r,g,b values for calculating RGB color values

void setup()
{
  pinMode(R, OUTPUT); //Set the R(6) port output   
  pinMode(G, OUTPUT); //Set the R(5) port output  
  pinMode(B, OUTPUT); //Set the R(3) port output  
  
  pinMode(p_red, INPUT);  //Set the p_red(A0) port output
  pinMode(p_green, INPUT);  //Set the p_green(A2) port output
  pinMode(p_blue, INPUT); //Set the p_blue(A1) port output 
  
  Serial.begin(9600);
}

void loop(){
  // Converting potentiometer value (0 to 1023) to RGB value(0 to 255)
  // There are double type cast in this block because the division will give us a decimal number and we need an integer value.
  // analogRead function take the input values on potentiometer
  r = int((double)analogRead(p_red)/ 1023 * 255); // Take the R value on the potentiometer and calculate for RGB representation 
  g = int((double)analogRead(p_green)/ 1023 * 255); // Take the G value on the potentiometer and calculate for RGB representation
  b = int((double)analogRead(p_blue)/ 1023 * 255);  // Take the B value on the potentiometer and calculate for RGB representation
  
  // This block show us current rgb values on the serial monitor 
  Serial.print(r);
  Serial.print(" ");
  Serial.print(g);
  Serial.print(" ");
  Serial.println(b);
  
  // This block sets RGB values to output ports
  analogWrite(R,r); // Set R(6) port to r value
  analogWrite(G,g); // Set G(3) port to g value
  analogWrite(B,b); // Set B(5) port to b value
  
  delay(1000);
}