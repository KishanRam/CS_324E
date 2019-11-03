class TwoSpots extends Spot{
  
  TwoSpots(float x, float y, float r, float speed){
    super(x,y,r,speed); 
  }
  
  void display(){
    noFill();
    ellipse(x-(r/2),y,r,r);
    ellipse(x+(r/2),y,r,r);
  }
  
}