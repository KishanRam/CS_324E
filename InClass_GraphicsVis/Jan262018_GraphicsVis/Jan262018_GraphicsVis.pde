PImage img;

void setup() {
  surface.setResizable(true);
  img = loadImage("example.png");
  surface.setSize(img.width, img.height);
  myTint(img,200,50,100,255);
  img(
}
void draw() {


}

void myTint(PImage img, float r, float g, float b, float a){
  img.loadPixels();
  
  for (int x = 0; x < img.width; x++){
    for (int y = 0; y < img.height; y++){
      int index = x + y*img.width;
      //Take percent of red currently, multiply by the new tint to get a new value, make sure it is within 0 and 255
      float red = constrain(red(img.pixels[index])/255*r,0,255);
      float blue = constrain(blue(img.pixels[index])/255*b,0,255);
      float green = constrain(green(img.pixels[index])/255*g,0,255);
      img.pixels[index] = color(red,green,blue,a);
    }
  }
  
  img.updatePixels();
  
}