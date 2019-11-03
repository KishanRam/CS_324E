//Kishan Ramachandran
//CS 324E
//Hw 1
//Jan29_2017
//Bridge

void setup(){
  size(1000,600);
}

void draw(){
  
  rectMode(CENTER);
  
  //Declare colors for image
  color bridgeBase = color(93,74,62);
  color bridgeSide = color(180,119,78);
  color sky = color(#87ceeb);
  color water = color(#40a4df);
  color fish = color(0);
  
  //Set background color to side of bridge as bridge side shape is hard to draw, so set the...
  //background as the bridge side and cover up that color with water and sky colors
  background(bridgeSide);
  
  //Draw rectangle to cover up bridge side color with sky above the bridge
  noStroke();
  fill(sky);
  rect(500,175,1000,350);
  
  //Draw rectangles to cover up bridge side color with water at bottom
  noStroke();
  fill(water);
  rect(50,550,199,100);
  rect(350,550,199,100);
  rect(650,550,199,100);
  rect(950,550,199,100);
  
  //Draw Bezier curves for arches of bridge, fill with sky color to have a horizon appear
  fill(sky);
  stroke(0);
  strokeWeight(3);
  bezier(150,500,100,400,0,400,-50,500);
  bezier(250,500,300,400,400,400,450,500);
  bezier(550,500,600,400,700,400,750,500);
  bezier(850,500,900,400,1000,400,1050,500);
  
  //At this point, all the water under the bridge should be colored in and the horizon should be visible
  
  //Draw base of bridge
  stroke(0);
  strokeWeight(3);
  fill(bridgeBase);
  rect(200,550,100,100); 
  rect(500,550,100,100);
  rect(800,550,100,100);
  
  //Complete bridge structure with thick line to separate sky from background
  //This will make the bridge side look filled in and not like a background
  strokeWeight(4);
  line(0,350,1000,350);
  
  //Added a fish at the request of a friend
  ellipseMode(CENTER);
  fill(fish);
  strokeWeight(1);
  ellipse(320,540,20,20);
  triangle(330,540,340,530,340,550);
}