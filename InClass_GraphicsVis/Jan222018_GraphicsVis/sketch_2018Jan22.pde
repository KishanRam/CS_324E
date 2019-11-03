void setup(){
  background(0);
  size(940,400);
}

void draw() {
  rectMode(CENTER);
  for (int i = 0; i < 256; i = i+2){
   fill(i,0,256-i);
   stroke(i,256-i,i);
   rect(i*4,200,100,400);
  }
}