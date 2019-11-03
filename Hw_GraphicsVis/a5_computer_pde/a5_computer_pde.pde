Slide a;
float friction;

void setup(){
  size(1000,1000);
  ellipseMode(RADIUS);
  a = new Slide(300,300,20,0,0);
  
  //Friction for slide
  friction = 0.95;
}

void draw(){
  background(255);
  
  a.display();
  
  //Force of "gravity" moves at same accel since sin(theta) = root(2)/2
  a.applyForces(0.1,0.1);
  
  //Force of friction will oppose motion and will scale with velocity
  float tempvx = a.getvX();
  float tempvy = a.getvY();
  a.setvX(tempvx*friction);
  a.setvY(tempvy*friction);
  
  a.move();
  
}

//When mouse is pressed, move ball to original position
void mousePressed(){
  a.reset();
  
  //Apply random impulse every mouse press
  float ran = random(5);
  a.applyForces(ran,ran);
}

class Slide{
 
  Slide() {}
  
  float x,y,r,velx,vely,accelx,accely;
  float xorig,yorig,rorig,velxorig,velyorig; //Orig vals so it can reset on mouse press
  
  Slide(float x, float y, float r, float velx, float vely){
    this.x = x;
    this.y = y;
    this.r = r;
    this.velx = velx;
    this.vely = vely;
    
    xorig = x;
    yorig = y;
    rorig = r;
    velxorig = velx;
    velyorig = vely;
  }
  
  void display(){
    
  //Draw Slide
  rect(xorig-(r*3),yorig+(r*2),r*2,r*12);
  beginShape();
  vertex(xorig-r,yorig+(r*2));
  vertex(xorig+(r*9),yorig+(r*12));
  vertex(xorig+(r*9),yorig+(r*14));
  vertex(xorig-r,yorig+(r*4));
  endShape(CLOSE);
    
  //Draw person on slide  
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