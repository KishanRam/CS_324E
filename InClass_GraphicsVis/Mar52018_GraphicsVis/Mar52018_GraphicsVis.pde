void setup(){
  size(500,500,P3D);
  noStroke();
}

void draw(){
  background(0);
  directionalLight(0, 255, 255, 1, 0, 0);
  pointLight(255,255,0,width,0,0);
  spotLight(255,0,255,0,height,0,1,-1,0,PI/2,2);
  //ambientLight(30,40,10);

  translate(width/2, height/2, -100);
  sphere(50);
  
  translate(100,100,0);
  box(70);
  
  //camera(mouseX,mouseY,100,width/2,height/2,-100,0,1,0);
}