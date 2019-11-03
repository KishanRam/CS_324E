String[] lines;
PrintWriter output;

void setup(){
  lines = loadStrings("mytext.txt");
  System.out.println(lines.length);
  output = createWriter("words.txt");
  for (int i = 0; i < lines.length; i++){
    String[] s = split(lines[i], ' ');
    System.out.println("Line "+(i+1)+" has "+s.length+ " words");
    for (int j = 0; j < s.length; j++){
      output.println(s[j]); 
    }
  }
}

void draw() {

}

void keyPressed() {
 output.flush();
 output.close();
}