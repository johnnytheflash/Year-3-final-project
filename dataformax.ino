#define steps 128

void setup ()
{
  pinMode (9, OUTPUT); 
  TCCR1A = 0;
  TCCR1B = 0;
  TCCR1A |= (1 << COM1A0);   
  TCCR1B |= (1 << WGM12);   
  Serial.begin(57600);
}

void loop () {
  for (int i = 0; i < steps; i++) {
    TCCR1B &= 0xFE; // turns off timer
    TCNT1 = 0;      // resets timer counter register
    OCR1A = i;      // changes frequency step
    TCCR1B |= 0x01; // turns on timer
    Serial.print(i,DEC);
    Serial.print(" ");
    Serial.println(analogRead(0), DEC);
  }
}
