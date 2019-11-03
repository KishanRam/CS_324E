class Swing{
  PVector origin, bob; float theta, len, angVel, angAcc, damp; color c;
  boolean dragging = false;
  
  Swing(PVector origin, float theta, float len, float damp, color c){
    this.origin = origin;
    this.bob = new PVector();
    this.theta = theta;
    this.len = len;
    this.c = c;
    this.angVel = 0;
    this.angAcc = 0;
    this.damp = damp;
    //bob.x = sin(theta) * len + origin.x
    //bob.y = cos(theta) * len + origin.y
    //forcePendulum = sin(theta) * forceGravity
    //forcePendulum = sin(theta) * Gravity * mass
    //angAcc = -Gravity * sin(theta)
    //theta += angVel
    //aVel += angAcc
    //aVel *= damp;
  }
  void display(){
    this.bob.set(this.len*sin(this.theta), this.len*cos(this.theta), 0);
    this.bob.add(this.origin);
    stroke(0);
    strokeWeight(2);
    line(this.origin.x, this.origin.y, this.bob.x, this.bob.y);
    fill(this.c);
    quad(this.bob.x-10, this.bob.y-30, this.bob.x, this.bob.y-7, this.bob.x-10, this.bob.y-7, this.bob.x-20, this.bob.y-30);
    rect(this.bob.x-10, this.bob.y-7, 30, 15);
    fill(150);
    if (dragging) {
      fill(0); 
    }
    ellipse(this.bob.x, this.bob.y, 10, 10);
  }
  void applyForces(){
    if (!dragging){
      float gravity = 0.4;
      this.angAcc = (-1 * gravity / this.len) * sin(this.theta);
      this.angVel += this.angAcc;
      this.angVel *= this.damp;
      this.theta += this.angVel;
    }
  }
  void clicked(int mx, int my){
    float d = dist(mx, my, this.bob.x, this.bob.y);
    if (d < 10){
      dragging = true; 
    }
  }
  void stopDragging(){
    if (dragging){
      angVel = 0;
      dragging = false;
    }
  }
  void drag() {
    if (dragging){
      PVector diff = PVector.sub(this.origin, new PVector(mouseX, mouseY));
      theta = atan2(-1*diff.y, diff.x) - radians(90);
    }
  }
}