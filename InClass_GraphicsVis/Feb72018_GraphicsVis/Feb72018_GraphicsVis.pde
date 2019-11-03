PFont times;
String out = "";
float count = 0;

void setup() {
  size(500,500);
  background(0);
  times = createFont("Times-Roman", 32);
  textFont(times);
  textAlign(LEFT);
  textLeading(30);
}

void draw() {
  float x = textWidth(out);
     //println("X is " + x);
  if (count >= 500){
   out += "\n"; 
   count = 0;
  }
  text(out,0,32);
}

void keyPressed() {
  out += key;
  count += 14;
}