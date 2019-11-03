class Slide{
 
  Slide() {}
  
  float x,y,r,velx,vely,accelx,accely;
  float xorig,yorig,rorig,velxorig,velyorig; //Orig vals so it can reset on mouse press
  color c1, c2;
  Slide(float x, float y, float r, float velx, float vely, color c1, color c2){
    this.x = x;
    this.y = y;
    this.r = r;
    this.velx = velx;
    this.vely = vely;
    this.c1 = c1;
    this.c2 = c2;
    
    xorig = x;
    yorig = y;
    rorig = r;
    velxorig = velx;
    velyorig = vely;
  }
  
  void display(){
    
  //Draw Slide
  fill(c1);
  rect(xorig-(r*3),yorig+(r*2),r*2,r*12);
  beginShape();
  vertex(xorig-r,yorig+(r*2));
  vertex(xorig+(r*11),yorig+(r*14));
  vertex(xorig+(r*9),yorig+(r*14));
  vertex(xorig-r,yorig+(r*4));
  endShape(CLOSE);
    
  //Draw person on slide  
  fill(c2);
  ellipse(x,y,r/2,r/2);
  rect(x-(r/2),y+(r/2),r,(r*2));
  beginShape(LINES);
  vertex(x-(r/2),y+(r/2));
  vertex(x-(3*r/2),y-(r/2));
  endShape();
  beginShape(LINES);
  vertex(x+(r/2),y+(r/2));
  vertex(x+(3*r/2),y-(r/2));
  endShape();
  beginShape(LINES);
  vertex(x-(r/2),y+(r*5/2));
  vertex(x,y+(7*r/2));
  endShape();
  beginShape(LINES);
  vertex(x+(r/2),y+(r*5/2));
  vertex(x+r,y+(7*r/2));
  endShape();
  
  }
  
  //Apply forces class which will change vel based on accel
  void applyForces(float fx, float fy){
    this.accelx = fx;
    this.accely = fy;
    
    velx += fx;
    vely += fy;
   
  }
  
  //Class to move object after forces ah ve been applied
  void move(){
    if (x > xorig+(r*11) + (r/2)){
      velx = 0;
      vely = 0;
    }
    x += velx;
    y += vely;
  }
  
  //Return velx value
  float getvX(){
    return this.velx; 
  }
  //Return vely value
  float getvY(){
    return this.vely; 
  }
  
  //Set velx value
  void setvX(float vX){
    this.velx = vX; 
  }
  //Set vely value
  void setvY(float vY){
    this.vely = vY; 
  }
  
  void reset(){
    this.x = xorig;
    this.y = yorig;
    this.r = rorig;
    this.velx = velxorig;
    this.vely = velyorig;
  }
}