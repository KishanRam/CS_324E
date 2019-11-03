PShape example;
float rotation = 0;

void setup(){
 size(1000,1000,P3D); 
}

void draw(){
  background(0);
  lights();
  translate(0,300,0);
  sphere(50);
  translate(0,100,0);
  box(70);
  
  //beginCamera();
  ////camera(200,200,500,mouseX,mouseY,0,0,1,0);
  //camera();
  //rotateY(radians(rotation));
  //endCamera();
  
  rotation++;
}