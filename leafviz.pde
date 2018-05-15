

import processing.serial.*;
 
Serial myPort;
float plantNum = 0;

PVector[]  Point;
int        nbPoint = 10;
int        rayon   = 2;

void setup() {
   background(0);
  String whichPort = "/dev/cu.usbmodem1421";
  myPort = new Serial(this, whichPort, 9600); 
  myPort.bufferUntil('\n');
  delay(3000); 

  
 
 size(1920,1080);
  
  Point = new PVector[nbPoint];
  float angle = TWO_PI/(nbPoint);
  for(int division=0;division<nbPoint;random(division++))
  {
    Point[division] = new PVector(rayon*cos(angle*division),
                                     rayon*sin(angle*division));
  }
  smooth(); 
}
 
void draw(){
  
 
  PVector move = new PVector();
 //  background(0);
  noFill();
  //fill(255,255,255);
  stroke(40,255,20,100);
  strokeWeight(0.001);
  translate(width/2,height/2);
  beginShape();
  curveVertex(Point[0].x,Point[0].y);
  for(int division=0;division<nbPoint;division++)
  {
    curveVertex(Point[division].x,Point[division].y);
  } 
  curveVertex(Point[0].x,Point[0].y);
  curveVertex(Point[1].x,Point[1].y);
  endShape(); 
 
  
  //draw
  
  for(int division=0;division<nbPoint;random(division++))
  {
    move.x = random(Point[division].x);
    move.y = random(Point[division].y);
    move.normalize();
    move.mult(random(plantNum*1.5) * 0.6);
    println(plantNum);
    delay(10);
    Point[division].x += random(move.x);
    Point[division].y += random(move.y);
  }  
    

}
 
void serialEvent (Serial myPort){
  String inString = myPort.readStringUntil('\n');
  if(inString !=null){
  inString = trim(inString);
  plantNum = float(inString);
  }
}