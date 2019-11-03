float y = 50.0;
float r = 15.0;
float vel = 1;
float accel= 0.1;
float friction = 0.995;

class Particle {
  float x, y;
  float vx, vy;
  float r;

  Particle(float _x, float _y,float _vx, float _vy, float _r) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    r = _r; 
  }
    
  void applyForces(float _fx, float _fy) {
    vy += _fy;
    vx += _fx;
    y += vy;
    x += vx;
  }
  
  void display() {
    ellipse(x, y, r, r);
  }  
}

void setup() {
  size(500, 500);
  ellipseMode(RADIUS);
}  
  
void draw() {
  background(0);
  ellipse(250, y, r, r);
  
  vel += accel;
  vel *= friction;
  y += vel;
  
  if (y > (height - r)) {
    vel = -vel; 
  }
}