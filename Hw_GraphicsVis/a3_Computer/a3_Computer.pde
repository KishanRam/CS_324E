import processing.sound.*;
Monitor test;
SoundFile audio;

void setup(){
  size(600,600); 
  color c = color(200,100,30);
  test = new Monitor(200,200,100,200,100,1,c);
  
  //Implementing sound into program
  audio = new SoundFile(this,"foo.mp3");
  audio.loop();
}

void draw(){
  background(255);
  test.display();
  test.move();
  test.scroll();
}