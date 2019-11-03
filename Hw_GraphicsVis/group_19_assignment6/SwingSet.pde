class SwingSet{
  float x, y, h, w, l; color c;
  SwingSet (float x, float y, float h, float w, float l, color c){
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
    this.l = l;
    this.c = c;
  }
  void display(){
     fill(c);
     rect(this.x, this.y, this.l, 10);
     quad(this.x, this.y, this.x-this.w, this.y+this.h, this.x-this.w+10, this.y+this.h, this.x+10, this.y);
     quad(this.x, this.y, this.x+this.w, this.y+this.h, this.x+this.w+10, this.y+this.h, this.x+10, this.y);
     quad(this.x-10+this.l, this.y, this.x+this.l-this.w, this.y+this.h, this.x+this.l-this.w+10, this.y+this.h, this.x+this.l, this.y);
     quad(this.x-10+this.l, this.y, this.x+this.l+this.w, this.y+this.h, this.x+this.l+this.w+10, this.y+this.h, this.x+this.l, this.y);
  }
}