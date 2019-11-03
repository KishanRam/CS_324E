float y;
float vy;
float m = 1.0;
float ry = 250;
float ks = 0.1;
float kd = 0.1;

void setup(){
  size(500, 500);
}

void draw(){
  background(210);
  float f = -((ks * (y - ry)) + kd*vy);
  float a = f/m;
  vy = vy + a;
  y += vy;
  rect(200, y, 100, 20);
}



class Particle {
  float x, y;
  float vx, vy;
  float r;
  float ax, ay;
  float m;

  Particle(float _x, float _y,float _vx, float _vy, float _r) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    r = _r; 
  }
    
  
  void display() {
    ellipse(x, y, r, r);
  }  
  
  //Class method to apply forces
  void applyForces(float fx, float fy)
  {
    ax = fx/m;
    ay = fy/m;
    vx += ax;
    vy += ay;
    x += vx;
    y += vy; 
  }
}