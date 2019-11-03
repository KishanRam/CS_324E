PFont helvetica;
color small = color(43,37,232);
color medium = color(232,138,37);
color large = color(245,17,25);
float s, m, l;
float countx = 0;
float county = 0;
String[] lines;

void setup() {
  
  //Set up canvas and font specifications
  size(700,600); 
  background(255);
  fill(0);
  helvetica = createFont("Helvetica", 28);
  textFont(helvetica);
  textAlign(LEFT);
  lines = loadStrings("uniquewords.txt");
  
  //Find longest word 
  float longest = 0;
  for (int i = 0; i < lines.length; i++){
     if (lines[i].length() > longest){
        longest = lines[i].length();
     }
  }
  
  //For color coding word, I am going to make lower third of words blue, middle third orange, and upper third red
  float div = longest/3;
  s = div; m = div*2; l = div*3;
}

void draw() {
  
  //Initialize variables
  float l = lines.length;
  int rand;
  String out = "";
  String xtest = "";
  String temp;
  Boolean stop = false;
  
  while (stop != true){
    
    //Get random word
    rand = int(random(l));
    temp = lines[rand];
    
    //Check to see if printing word at end of line will make line exceed dimensions of window
    //If yes, then increment county so you can print it on the next line
    xtest = out + temp;
    countx = textWidth(xtest);
    if (countx > 700){
      county += 1;
      countx = 0;
      xtest = "";
      out = "";
    }
    
    //Stop printing words after 20th line as that is what a 700x600 canvas for this font can handle
    if (county > 20){
      stop = true; 
    } else{ //If not after 20th line, then display word
      
      //Set color of word based on length
      if (temp.length() < s){
        fill(small);
      } else if (temp.length() < m){
        fill(medium); 
      } else if (temp.length() < l){
        fill(large); 
      } else {
        println("Error in calculating longest word"); 
      }
      
      //X pos of where to print word is right after at the end of current line
      //Y pos is every 28 pixels, 28 is from font size
      //Do county+1 so that for first line, it prints at (0,28) and not (0,0)
      float xpos = textWidth(out);
      float ypos = ((county+1)*28);
      text(temp, xpos, ypos);
    
      //Out has current line stored in it, used to check where to disp temp
      out += temp + " ";
    }
  }
}

//When mouse is pressed, clear canvas to white and set count x and y to 0
//This lets the program redo the while loop
void mousePressed() {
  background(255);
  county = 0;
  countx = 0;
}