class Seesaw { 
  float ldy, rdy, luy, ruy;
  float ldx, rdx, lux, rux;
  float vyd, vyu;
  float m = 1.0;
  float ryd, px, l;
  float ryu;
  float ks = 0.1;
  float kd = 0.1;
  color c1, c2;
  
  Seesaw (float ryd, float px, float l, float ks, color c1, color c2) { 
    this.px = px;
    this.l = l;
    this.m = 1.0;
    this.ryd = ryd;
    this.ks = ks;
    this.kd = 0.1;
    this.c1 = c1;
    this.c2 = c2;
  }

  void display() {
    stroke(0);
    fill (c1);
    beginShape();
    vertex(this.px, this.ryd);
    vertex((this.px + 18.8), (this.ryd + 14));
    vertex((this.px + 11.6), (this.ryd + 36));
    vertex((this.px - 11.6), (this.ryd + 36));
    vertex((this.px - 18.8), (this.ryd + 14));
    endShape(CLOSE);
    rectMode(CORNERS);
    fill (c2);
    rect(this.rdx, this.rdy, this.rdx - 30, this.rdy - 30);
    rect(this.ldx, this.ldy, this.ldx + 30, this.ldy - 30);
    ellipseMode(CENTER);
    ellipse(this.rdx - 15, this.rdy - 45, 30, 30);
    ellipse(this.ldx + 15, this.ldy - 45, 30, 30);
    line(this.rdx, this.rdy - 15, this.rdx + 10, this.rdy - 15);
    line(this.rdx - 30, this.rdy - 15, this.rdx - 40, this.rdy - 15);
    line(this.ldx, this.ldy - 15, this.ldx - 10, this. ldy - 15);
    line(this.ldx + 30, this.ldy - 15, this.ldx + 40, this.ldy - 15);
    fill(c1);
    stroke(c1);
    strokeWeight(10);
    line(this.ldx, this.ldy, this.rdx, this.rdy);
    strokeWeight(2);
    stroke(0);
  }
  
  void applyForces() {
    this.rdx = this.px + sqrt(pow((this.l/2), 2) - pow((this.rdy - this.ryd), 2));
    this.ldx = this.px - sqrt(pow((this.l/2), 2) - pow((this.ryd - this.ldy), 2));
    float fd = -((ks * (this.ldy - this.ryd)) + kd*vyd);
    float ad = fd/m;
    vyd = vyd + ad;
    this.ldy += vyd;
    this.rdy = this.ryd - (this.ldy - this.ryd);
    if (keyPressed == true) {
      fd = 0;
      ad = 0;
      this.ldy = 0;
      vyd = 0;
      vyu = 0;
    }
  }
}