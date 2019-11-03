PImage img;
PImage temp;

void setup(){
  surface.setResizable(true);
  img = loadImage("foo.jpg");
  //surface.setSize(800,800);
  surface.setSize(img.width, img.height);
  //background(0);
}

void draw(){
  gaussianBlur(img);
  image(temp,0,0);
}

void gaussianBlur(PImage img) {
  
  float[][] mask = {{0.0625,0.125,0.0625},{0.125,0.25,0.125},{0.0625,0.125,0.0625}}; 
  //float[][] mask = {{0,1,0},{0,0,0},{0,1,0}};
  temp = createImage(img.width, img.height, ARGB);
  
  img.loadPixels();
  
  for (int x = 1; x < img.width-1; x++){
    for (int y = 1; y < img.height-1; y++){
  
      int index = x + y*img.width;
      float rt = 0;
      float gt = 0;
      float bt = 0;
      
      for (int i = 0; i < 3; i++){
        for (int j = 0; j < 3; j++) {
          int index1 = (x + i - 1) + img.width*(y + j - 1);
          rt += red(img.pixels[index1]) * mask[i][j];
          gt += green(img.pixels[index1]) * mask[i][j];
          bt += blue(img.pixels[index1]) * mask[i][j];
        }
      }
      
      constrain(abs(rt),0,255);
      constrain(abs(gt),0,255);
      constrain(abs(bt),0,255);
      
      temp.pixels[index] = color(rt,gt,bt);
    }
  }
  
  img = temp;
  //image(temp,0,0);
  temp.updatePixels();
}