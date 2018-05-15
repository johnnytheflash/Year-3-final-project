void setup() {
  
  Serial.begin(9600); // serial on
}

void loop() {

  int sensorValue = analogRead(A2); // reads the input
  /
  float voltage = sensorValue * (5.0 / 1023.0); // translate analog reading to voltage

  Serial.println(voltage);
}
