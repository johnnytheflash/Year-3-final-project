
import processing.serial.*;
 
Serial myPort;
int X = 1;
float inByte = 0;
 
void setup() {
  String whichPort = "/dev/cu.usbmodem1421";
  myPort = new Serial(this, whichPort, 9600); 
  myPort.bufferUntil('\n');
  size(300, 300);
  background(100);
  stroke(34, 255, 34);
}
 
void draw(){
  
  line(X, height, X, height - inByte);
 

  if(X >= width){
  X = 0;
  background(100);
  }else{
  X++;
  }
}
 
void serialEvent (Serial myPort){
  String inString = myPort.readStringUntil('\n');
  if(inString !=null){
  inString = trim(inString);
  inByte = float(inString);
  println(inByte);
  inByte = map(inByte, 0, 10, 0, height);
  }
 
}