class Spot{
  float x,y,r,speed;
  
  Spot() {}
  
  Spot(float x, float y, float r, float speed){
    this.x = x;
    this.y = y;
    this.r = r;
    this.speed = speed;
  }
  
  void display() {
    noFill();
    ellipse(x,y,r,r); 
  } 
  
  void move(char dir) {
    if( dir == 'x' && x < width){
      x+= speed;
    }
    if( dir == 'y' && y < height){
      y+= speed;
    }
  }
}