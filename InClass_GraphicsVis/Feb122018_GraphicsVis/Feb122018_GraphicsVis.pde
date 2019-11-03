Spot s1;
ColoredSpot s2;
TwoSpots s3;

void setup() {
  size(500,500);
  background(255);
  s1 = new Spot(50, 50, 50, 30);
  s2 = new ColoredSpot(100, 100, 50, 30, color(200, 30, 100));
  s3 = new TwoSpots(200,200,40,-30);
}

void draw() {
  background(255);
  s1.display();
  s2.display();
  s3.display();
}

void keyPressed(){
  s3.move(key); 
}