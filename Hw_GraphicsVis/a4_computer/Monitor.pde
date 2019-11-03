class Monitor{
  
  //Declare variables
  PShape computer;
  PShape monitor;
  PShape base;
  float x, y, z, rotation, translation;
  float counttran,countrot,i,j;
  
  Monitor() {}
  
  //Class constructor
  Monitor(float x, float y, float z, float rotation, float translation) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.rotation = rotation;
    this.translation = translation;
    
    //Variables for move and rotate function
    this.i = 1;
    this.j = 1;
    this.counttran = 0;
    this.countrot = 0;
    
    //Create monitor and base objects, set starting location of objects
    pushMatrix();
    monitor = loadShape("Monitor.obj");
    base = createShape(BOX,250,250,40);
    computer = createShape(GROUP);
    
    monitor.rotateX(PI/2);
    monitor.rotateY(PI);
    monitor.translate(this.x,this.y,this.z);
    
    base.rotateX(PI/2);
    base.translate(this.x,this.y,this.z);
    base.translate(-100,10,-60);
    
    computer.addChild(monitor);
    computer.addChild(base);
    popMatrix();
    
  }
  
  void display(){
    
    shape(monitor);
    shape(base);

  }
  
  //Function to translate computer
  void move(){
    //Switch direction of translation when computer reaches ends of translation
    if (counttran >= translation){
      i = -1;
    } else if (counttran <= (-1*translation)) {
      i = 1; 
    }
    
    //If translating in positive direction, add to counttran
    if (i > 0){
      monitor.translate(i,i,i);
      base.translate(i,i,i);
      counttran ++;
    }else if (i < 0){ //If translating in negative direction, subtract from counttran
      monitor.translate(i,i,i);
      base.translate(i,i,i);
      counttran = counttran - 1;
    }
  }
  
  //Function to rotate monitor screen
  void rot(){
    if (countrot >= rotation){
      j = -1; 
    } else if (countrot <= 0){
      j = 1; 
    }
    
    //Change rate of rotation to lower speed
    if ((countrot%5) == 0){
      if (j > 0){
        monitor.rotateX(radians(j));
        countrot ++;
      }else if (j < 0){
        monitor.rotateX(radians(j));
        countrot = countrot - 1;
      }
    } else {
      if (j > 0){
        countrot ++; 
      }else if (j < 0){
        countrot = countrot - 1; 
      }
    }
  }
}