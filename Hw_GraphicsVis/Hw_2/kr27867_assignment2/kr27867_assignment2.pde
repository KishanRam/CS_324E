PImage img;
PImage dispcont;
PImage dispgrey;
PImage dispgaus;
PImage dispedge;
PImage temp;
PImage displaplace;
PImage imgorig;

void setup(){
  surface.setResizable(true);
  img = loadImage("foo.jpg");
  surface.setSize(img.width, img.height);
  imgorig = loadImage("foo.jpg");
}

void draw(){
  //Call all convolution functions
  grayscale(imgorig);
  contrast(imgorig);
  gaussianBlur(imgorig);
  edgeDetect(imgorig);
  laplaceFilter(imgorig);
  image(img,0,0);
}

//Display relevant image based on which key is pressed
void keyPressed() {
  if (key == '0') { //Default image
    img = imgorig;
  } else if (key == '1') { //Grayscale
    img = dispgrey;
  } else if (key == '2') { //Contrast
    img = dispcont;
  } else if (key == '3') { //Gaussian Blur
    img = dispgaus;
  } else if (key == '4') { //Edge Detection
    img = dispedge;
  } else if (key == '5') {
    img = displaplace;
  }else {
    println("Not a valid key");
  }
}

//Code for grayscale
void grayscale(PImage img){
  
  //Load both img and disp pixels
  dispgrey = loadImage("foo.jpg");
  img.loadPixels();
  dispgrey.loadPixels();
  
  //Loop through pixels in original image
  for (int x = 0; x < img.width; x++){
    for (int y = 0; y < img.height; y++){
      
      //Index for pixel on image
      int index = x + y*img.width;
      
      //Greyscale by setting every value to avg of r g and b
      float rgbtot = red(img.pixels[index]) + green(img.pixels[index]) + blue(img.pixels[index]);
      float rgbavg = rgbtot/3;
      rgbavg = constrain(rgbavg, 0, 255);
      
      //Update temp with convoluted pixel
      dispgrey.pixels[index] = color(rgbavg,rgbavg,rgbavg);
    }
  }
  dispgrey.updatePixels();
}

//Code for contrast function
void contrast(PImage img){
  
  //Switch to HSB mode for contrast
  colorMode(HSB, 360, 100, 100);
  
  //Load both img and temp pixels
  dispcont = loadImage("foo.jpg");
  img.loadPixels();
  dispcont.loadPixels();
  
  //Loop through pixels in original image
  for (int x = 0; x < img.width; x++){
    for (int y = 0; y < img.height; y++){
      
      //Index for pixel on image
      int index = x + y*img.width;
      
      //Contrast by setting a threshold limit for the brightness, and adding or subtracting a set brightness from that
      float h = hue(img.pixels[index]);
      float s = saturation(img.pixels[index]);
      float bt = brightness(img.pixels[index]);
      //Threshold brightness set at 40, increment set at 5
      if (bt <= 40){
        bt = bt - 5;
      }
      else {
        bt = bt + 5; 
      }
      
      //Update temp with convoluted pixel
      dispcont.pixels[index] = color(h,s,bt);
    }
  }
  dispcont.updatePixels();
  
  colorMode(RGB, 255, 255, 255);
}


//Code for Gaussian Blur function
void gaussianBlur(PImage img) {
 
  //Gaussian blur mask
  float[][] mask = {{0.0625,0.125,0.0625},{0.125,0.25,0.125},{0.0625,0.125,0.0625}}; 
  
  //Load both img and temp pixels
  dispgaus = loadImage("foo.jpg");
  img.loadPixels();
  dispgaus.loadPixels();
  
  //Loop through pixel by pixel of original image
  for (int x = 1; x < img.width-1; x++){
    for (int y = 1; y < img.height-1; y++){
  
      //Index for pixel on image
      int index = x + y*img.width;
      float rt = 0;
      float gt = 0;
      float bt = 0;
      
      //Loop through mask
      for (int i = 0; i < 3; i++){
        for (int j = 0; j < 3; j++) {
          
          //Index on mask to pixel conversion
          int index1 = (x + i - 1) + img.width*(y + j - 1);
          //Apply convolution
          rt += red(img.pixels[index1]) * mask[i][j];
          gt += green(img.pixels[index1]) * mask[i][j];
          bt += blue(img.pixels[index1]) * mask[i][j];
        }
      }
      
      //Constrain to ensure it is between 0 and 255
      float r = constrain(abs(rt),0,255);
      float g = constrain(abs(gt),0,255);
      float b = constrain(abs(bt),0,255);
      
      //Update temp with convoluted pixel
      dispgaus.pixels[index] = color(r,g,b);
    }
  }
  dispgaus.updatePixels();
}

//This code gave edge detection with colors, so to get B&W, the next method is used
////Code for edge detection function
//void edgeDetect(PImage img) {
 
//  //Gaussian blur mask
//  float[][] horizontal = {{-1, 0, 1},{-2, 0, 2},{-1, 0, 1}};
//  float[][] vertical = {{-1, -2, -1},{0, 0, 0},{1, 2, 1}};
  
//  //Load both img and temp pixels
//  dispedge = loadImage("foo.jpg");
//  temp = loadImage("foo.jpg");
//  img.loadPixels();
//  temp.loadPixels();
  
//  //Loop through pixel by pixel of original image
//  for (int x = 1; x < img.width-1; x++){
//    for (int y = 1; y < img.height-1; y++){
  
//      //Index for pixel on image
//      int index = x + y*img.width;
      
//      //Instantiate color variables
//      float rh = 0;
//      float gh = 0;
//      float bh = 0;
//      float rv = 0;
//      float gv = 0;
//      float bv = 0;
//      float rt = 0; float gt = 0; float bt = 0;
      
//      //Loop through masks
//      for (int i = 0; i < 3; i++){
//        for (int j = 0; j < 3; j++) {
          
//          //Index on mask to pixel conversion
//          int index1 = (x + i - 1) + img.width*(y + j - 1);
          
//          //Apply horizontal convolution
//          rh += red(img.pixels[index1]) * horizontal[i][j];
//          gh += green(img.pixels[index1]) * horizontal[i][j];
//          bh += blue(img.pixels[index1]) * horizontal[i][j];
          
//          ////Apply vertical convolution
//          rv += red(img.pixels[index1]) * vertical[i][j];
//          gv += green(img.pixels[index1]) * vertical[i][j];
//          bv += blue(img.pixels[index1]) * vertical[i][j];
          
//          //Take magnitude of horizontal and vertical masks
//          rt = sqrt(rh*rh + rv*rv);
//          gt = sqrt(gh*gh + gv*gv);
//          bt = sqrt(bh*bh + bv*bv);
//        }
//      }
      
//      //Constrain to ensure it is between 0 and 255
//      float r = constrain(abs(rt),0,255);
//      float g = constrain(abs(gt),0,255);
//      float b = constrain(abs(bt),0,255);
      
//      //Update temp with convoluted pixel
//      dispedge.pixels[index] = color(r,g,b);
//    }
//  }
//  dispedge.updatePixels();
//}

//Code for edge detection function
void edgeDetect(PImage img) {
 
  colorMode(HSB, 360, 100, 100);
  
  //Gaussian blur mask
  float[][] horizontal = {{-1, 0, 1},{-2, 0, 2},{-1, 0, 1}};
  float[][] vertical = {{-1, -2, -1},{0, 0, 0},{1, 2, 1}};
  
  //Load both img and temp pixels
  dispedge = loadImage("foo.jpg");
  temp = loadImage("foo.jpg");
  img.loadPixels();
  temp.loadPixels();
  
  //Loop through pixel by pixel of original image
  for (int x = 1; x < img.width-1; x++){
    for (int y = 1; y < img.height-1; y++){
  
      //Index for pixel on image
      int index = x + y*img.width;
      
      //Instantiate color variables
      float bh = 0;
      float bv = 0;
      float bt = 0;
      
      //Loop through masks
      for (int i = 0; i < 3; i++){
        for (int j = 0; j < 3; j++) {
          
          //Index on mask to pixel conversion
          int index1 = (x + i - 1) + img.width*(y + j - 1);
          
          //Apply horizontal convolution
          bh += brightness(img.pixels[index1]) * horizontal[i][j];
          
          //Apply vertical convolution
          bv += brightness(img.pixels[index1]) * vertical[i][j];
          
          //Take magnitude of horizontal and vertical masks
          bt = sqrt(bh*bh + bv*bv);
        }
      }
      
      //Constrain to ensure it is between 0 and 100
      float b = constrain(abs(bt), 0, 100);
      
      //Update temp with convoluted pixel
      dispedge.pixels[index] = color(0, 0, b);
    }
  }
  dispedge.updatePixels();
  colorMode(RGB, 255, 255, 255);
}


//Code for Laplace of a Gaussian filter
//This is another edge detection filter, derivation is found from: http://homepages.inf.ed.ac.uk/rbf/HIPR2/log.htm
void laplaceFilter(PImage img) {
 
  //Laplace of a Gaussian edge detection mask
  float[][] mask = {{0, -1, 0},{-1, 4, -1},{0, -1, 0}}; 
  
  //Load both img and temp pixels
  displaplace = loadImage("foo.jpg");
  img.loadPixels();
  displaplace.loadPixels();
  
  //Loop through pixel by pixel of original image
  for (int x = 1; x < img.width-1; x++){
    for (int y = 1; y < img.height-1; y++){
  
      //Index for pixel on image
      int index = x + y*img.width;
      float rt = 0;
      float gt = 0;
      float bt = 0;
      
      //Loop through mask
      for (int i = 0; i < 3; i++){
        for (int j = 0; j < 3; j++) {
          
          //Index on mask to pixel conversion
          int index1 = (x + i - 1) + img.width*(y + j - 1);
          //Apply convolution
          rt += red(img.pixels[index1]) * mask[i][j];
          gt += green(img.pixels[index1]) * mask[i][j];
          bt += blue(img.pixels[index1]) * mask[i][j];
        }
      }
      
      //Constrain to ensure it is between 0 and 255
      float r = constrain(abs(rt),0,255);
      float g = constrain(abs(gt),0,255);
      float b = constrain(abs(bt),0,255);
      
      //Update temp with convoluted pixel
      displaplace.pixels[index] = color(r,g,b);
    }
  }
  displaplace.updatePixels();
}