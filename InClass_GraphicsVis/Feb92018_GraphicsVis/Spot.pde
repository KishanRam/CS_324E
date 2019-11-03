class Spot{
  float x,y,r,speed;
  
  Spot() {}
  
  void display() {
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