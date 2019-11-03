void setup(){
  size(400,400);
}

void draw(){
  color a = color(162,69,116,100);
  color b = color(162,69,116,200);
  color c = color(44,56,124,150);
  color d = color(44,56,124,100);
  fill(a);
  noStroke();
  rectMode(CENTER);
  rect(200, 200, 100, 100);
  fill(b);
  rect(300,300,100,100);
  fill(c);
  rect(200,300,100,100);
  fill(d);
  rect(300,200,100,100);
  fill(100,100,100,50);
  rect(250,250,100,100);
  
}