Monitor monitor;

void setup(){
  size(800,800,P3D);
  monitor = new Monitor(500,500,-100,10,50);
}

void draw(){
  background(255);
 
  monitor.display();
  monitor.move();
  monitor.rot();
  
  //camera(mouseX,mouseY,300,400,400,-100,0,1,0);
}