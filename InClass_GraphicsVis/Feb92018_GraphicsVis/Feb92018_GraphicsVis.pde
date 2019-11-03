Spot sp1;

void setup() {
  size(500, 500);
  background(255);
  sp1 = new Spot();
  sp1.x = sp1.y = 50;
  sp1.r = 20;
  sp1.speed = 20;
}

void draw() {
  background(255);
  sp1.display();
}

void keyPressed(){
  sp1.move(key); 
}