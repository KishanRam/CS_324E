Swing s1, s2;
PVector or1, or2;
color c1, c2;
SwingSet set;
Slide a;
float friction;
Seesaw ss1, ss2;

void setup(){
  size(1000,400);
  c1 = color (255, 0, 0);
  c2 = color (0, 0, 255);
  //Swing set
  or1 = new PVector(100, 100);
  or2 = new PVector(200, 100);
  s2 = new Swing(or2, PI/2, 150, 0.98, c1);
  s1 = new Swing(or1, PI/4, 150, 0.99, c1);
  set = new SwingSet(50, 100, 200, 25, 200, c2);
  //Seesaws
  ss1 = new Seesaw(270, 400, 150, 0.05, c2, c1);
  ss2 = new Seesaw(270, 575, 150, 0.025, c2, c1);
  //Slide
  ellipseMode(RADIUS);
  a = new Slide(750,65,17,0,0, c2, c1);
  //Friction for slide
  friction = 0.95;
}

void draw(){
  background(100);
  rectMode(CORNER);
  ellipseMode(RADIUS);
  s1.display();
  set.display();
  s2.display();
  s1.applyForces();
  s1.drag();
  s2.drag();
  s2.applyForces();
  
  a.display();
  
  //Force of "gravity" moves at same accel since sin(theta) = root(2)/2
  a.applyForces(0.1,0.1);
  
  //Force of friction will oppose motion and will scale with velocity
  float tempvx = a.getvX();
  float tempvy = a.getvY();
  a.setvX(tempvx*friction);
  a.setvY(tempvy*friction);
  
  a.move();
  ss1.display();
  ss2.display();
  ss1.applyForces();
  ss2.applyForces();

}

void mousePressed(){
  s1.clicked(mouseX, mouseY);
  s2.clicked(mouseX, mouseY);
}

void mouseReleased(){
  s1.stopDragging();
  s2.stopDragging();
}

void keyPressed(){
  a.reset();
  
  //Apply random impulse every mouse press
  float ran = random(5);
  a.applyForces(ran,ran);
}