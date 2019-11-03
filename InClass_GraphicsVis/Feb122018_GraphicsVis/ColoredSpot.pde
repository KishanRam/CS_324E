class ColoredSpot extends Spot {
  color c;
  
  ColoredSpot(float x, float y, float r, float speed, color c) {
    super(x, y, r, speed);
    this.c = c;
  }
  
  void display() {
    fill(c);
    ellipse(x, y, r, r);
  }
}