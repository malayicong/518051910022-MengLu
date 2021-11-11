PFont font;
String[] s;
int i=0,j=0;
//"\r"表示回车；"\n"表示新行


void setup(){
  size(1800,1600);
  background(255);
  s = loadStrings("aSong.txt");
  font = createFont("Arivo",24);
  fill(0);
  //text(s.length,30,30);
}

void draw(){
  //background(255);
  textFont(font);
  
  if(mousePressed){
    if (i<s.length){
      if(j<s[i].length()){
        float dis = sqrt((pmouseX-mouseX)*(pmouseX-mouseX)+(pmouseY-mouseY)*(pmouseY-mouseY));
        float w = textWidth(s[i].charAt(j));
        if(dis>w){
          textSize(dis);
          text(s[i].charAt(j),mouseX,mouseY);
          j+=1;
        }    
      }else{i+=1;j=0;}
    }else{i=0;}
  }
  keyPressed();
 
}
void keyPressed(){
  if( key == 'n'){
  background(255);
  }
}
