PImage tex;

void setup(){
  size(500,500,P3D);
  noStroke();
  tex = loadImage("foo.jpg");
}

void draw(){
  
  background(0);
  //directionalLight(0, 255, 255, 1, 0, 0);
  //pointLight(255,255,0,width,0,0);
  ////spotLight(255,0,255,0,height,0,1,-1,0,PI/2,2);
  ////ambientLight(30,40,10);

  //translate(width/2, height/2, -100);
  //specular(200,50,100);
  //shininess(2);
  ////lightSpecular(100,100,200);
  //sphere(50);
  
  
  ////camera(mouseX,mouseY,100,width/2,height/2,-100,0,1,0);
  
  translate(100,100,0);
  
  beginShape(QUADS);
  //textureMode(REPEAT);
  texture(tex);
   vertex(0, 0, 0, 0, 0);
    vertex(350, 0, 0, 1, 0);
    vertex(350, 200, 0, 1, 1);
    vertex(0, 200, 0, 0, 1);
  endShape();
}