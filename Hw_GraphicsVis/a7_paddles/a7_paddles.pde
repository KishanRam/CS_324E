Paddle left;
Paddle right;
Queue keystrokes;
float paddlemovel;

void setup(){
  color test = color(0,200,150);
  size(500,500);
  left = new Paddle(1,height/2,height/8,test,'l');
  right = new Paddle(width-2,height/2,height/8,test,'r');
  keystrokes = new Queue();
  paddlemovel = height/20;
}

void draw(){
  background(255);
  left.display();
  right.display();
  
  if (keystrokes.isEmpty() != true){
    char temp = keystrokes.dequeue();
    left.move(temp);
    right.move(temp);
  }
}

void keyPressed(){
  keystrokes.enqueue(key);
}

//Queue implementation for key presses
class Queue{
  
  ArrayList<Character> keystrokes;
  
  Queue() {
    keystrokes = new ArrayList<Character>();
  }
  
  void enqueue(char c){
    keystrokes.add(c);
  }
  
  Character dequeue(){
    Character ret = keystrokes.get(0);
    keystrokes.remove(0);
    return ret;
  }
  
  boolean isEmpty(){
    return keystrokes.size() == 0; 
  }
}


//Paddle implementation
class Paddle{
  
  float x,y,h;
  color c;
  char side;
  
  Paddle () {}
  
  Paddle (float x, float y, float h, color c, char side){
    this.x = x;
    this.y = y;
    this.h = h;
    this.c = c;
    this.side = side;
  }
  
  void display(){
    rectMode(CENTER);
    fill(c);
    rect(x,y,5,h);
  }
  
  void move(char k){
    //w and s for left paddle
    if (side == 'l'){
      if (k == 'w' && y-paddlemovel>0){
        y -= paddlemovel;   
      }
      else if (k == 's' && y+paddlemovel<height){
        y += paddlemovel;  
      }
    }
    else if (side == 'r'){ //o and l for right paddle
      if (k == 'o' && y-paddlemovel>0){
        y -= paddlemovel;
      }
      else if (k == 'l' && y+paddlemovel<height){
        y += paddlemovel; 
      }
    }
  }
  
}