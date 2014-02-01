/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.

  This example code is in the public domain.
 */

// Pin 13 has an LED connected on most Arduino boards.
// give it a name:
int led = 13;

// the setup routine runs once when you press reset:
void setup() {
  // initialize the digital pin as an output.
  pinMode(led, OUTPUT);
  pinMode(MOSI, OUTPUT);
  pinMode(SCK, OUTPUT);

  pinMode(53, OUTPUT);
  pinMode(49, OUTPUT);
  pinMode(48, OUTPUT);
  pinMode(47, OUTPUT);
  pinMode(46, OUTPUT);

  pinMode(41, OUTPUT);
  pinMode(40, OUTPUT);
  pinMode(39, OUTPUT);
  pinMode(38, OUTPUT);

  pinMode(A7, OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {
  digitalWrite(led, HIGH);   // turn the LED on (HIGH is the voltage level)

  digitalWrite(MOSI, LOW);   // turn the LED on (HIGH is the voltage level)
  digitalWrite(SCK, LOW);
    
  digitalWrite(53, HIGH);
  digitalWrite(49, HIGH);
  digitalWrite(48, LOW);
  digitalWrite(47, HIGH);
  digitalWrite(46, LOW);

  digitalWrite(41, LOW);
  digitalWrite(40, HIGH);
  digitalWrite(39, LOW);
  digitalWrite(38, HIGH);

  digitalWrite(A7, HIGH);


  delay(5000);               // wait for a second
  digitalWrite(led, LOW);    // turn the LED off by making the voltage LOW

  digitalWrite(MOSI, HIGH);    // turn the LED off by making the voltage LOW
  digitalWrite(SCK, HIGH);

  digitalWrite(53, LOW);
  digitalWrite(49, LOW);
  digitalWrite(48, HIGH);
  digitalWrite(47, LOW);
  digitalWrite(46, HIGH);
  
  digitalWrite(41, HIGH);
  digitalWrite(40, LOW);
  digitalWrite(39, HIGH);
  digitalWrite(38, LOW);

  digitalWrite(A7, LOW);

  delay(5000);               // wait for a second
}
