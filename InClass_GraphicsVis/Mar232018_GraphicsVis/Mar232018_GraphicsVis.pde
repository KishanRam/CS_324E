Button b;

void setup(){
 size(500,500);
 background(255);
 b = new Button(200,200,100,100);
}

void draw(){
  b.display();
  b.mouseHover();
}

void mouseReleased(){
  background(255);
}

class Button{
  
  float x,y,l,w;
  color c;
  
  Button(){}
  
  Button(float x, float y, float l, float w){
    this.x = x;
    this.y = y;
    this.l = l;
    this.w = w;
  }
  
  void display(){
    rectMode(CORNER);
    fill(200,0,0);
    rect(x,y,l,w);
  }
  
  void mouseHover(){
    if (mouseX > x && mouseX < x+l && mouseY > y && mouseY < y+w){
      fill(0,200,150);
      rect(x,y,l,w);
      
      if (mousePressed == true){
        background(0); 
        fill(0,200,150);
        rect(x,y,l,w);
      }
    }
  }
  
  
}