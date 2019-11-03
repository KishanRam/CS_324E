class Monitor{
  
  //Declare all variables for class Monitor
  float x,y,mh,mw,sh,s;
  color c;
  
  float standy,standx,standmw,standmh;
  float basey,basex,basemh,basemw;
  
  int i = 0;
  float count = 0;
  
  Monitor() {}
  
  //Instantiate class
  Monitor(float x, float y, float mh, float mw, float sh, float s, color c){
    this.x = x;
    this.y = y;
    this.mh = mh;
    this.mw = mw;
    this.sh = sh;
    this.s = s;
    this.c = c;
    
    //Set dimensions for computer stand
    standy = y + (mh/2);
    standmw = 50;
    standmh = sh;
    standx = x + (mw/2) - (standmw/2);

    //Set dimensions for computer base
    basex = x;
    basey = standy + standmh;
    basemw = mw;
    basemh = 30;
  }
  
  //Display method to display the monitor
  void display(){
    
    rectMode(CORNER);
    
    //Draw stand, make color c
    fill(c);
    rect(standx,standy,standmw,standmh);
    
    //Draw rectangle of computer screen, fill it black
    fill(0);
    rect(x,y,mw,mh);
    
    //Draw base of computer
    fill(c);
    rect(basex,basey,basemw,basemh);
  }
  
  //Move method to make monitor move up and down on stand
  void move(){
    //Change direction when monitor reaches base
    if ((y+mh) >= basey){
      s = s * -1;
    }
    //Change direction when monitor goes to top of stand
    if ( (y + mh) <= standy){
      s = s * -1; 
    } 
    //Move monitor
    y += s; 
  }
  
  //Method to make rectangles scroll
  void scroll(){
    
    //Each array is to determine the position of the four rectangles on screen
    float[] pos1 = {y+10, y+30, y+50, y+70};
    float[] pos2 = {y+30, y+50, y+70, y+10};
    float[] pos3 = {y+50, y+70, y+10, y+30};
    float[] pos4 = {y+70, y+10, y+30, y+50};
    
    //Make it so rectangles only scroll once every 10 counts so the scrolling doesn't get too fast
    if (count == 10){
      //Scrolling is done by calling a different y coordinate for reach rectangle based on the incrementing i value
      if (i < 3){
        //Draw rectangles of different sizes, change position for scroll effect
        fill(255);
        rect(x+10,pos1[i],mw-20,10);
        rect(x+10,pos2[i],mw-30,10);
        rect(x+10,pos3[i],mw-40,10);
        rect(x+10,pos4[i],mw-50,10);
        i ++;
      }else{ 
        i=0; 
      }
      count = 0;
    }else{ 
        //If not updating position to new i value, then draw at old i value so rectangles stay on screen
        fill(255);
        rect(x+10,pos1[i],mw-20,10);
        rect(x+10,pos2[i],mw-30,10);
        rect(x+10,pos3[i],mw-40,10);
        rect(x+10,pos4[i],mw-50,10);
      count++; 
    }
  }
}