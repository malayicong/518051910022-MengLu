//递归函数画笔
//按1画笔为红色， 2为绿色，3为紫色，按其他键为灰色，默认为灰色
//'s'键保存，'r'键清空


float R;
PVector p1,p2;
boolean saveImage;


void setup(){
  size(1200,1200);

  //smooth();

}

void draw(){
  if(saveImage==true){
    save("outPut/scene"+ year()+"_"+month()+"_"+day()+hour()+minute()+second());
    saveImage = false;
  }
 brush(key);
 
}


//画笔1
void brush(char k){
  colorMode(RGB);
  color c;
  if(k=='1'){c=color(255);}
  else if(k=='2'){c=color(0,255,0);}
  else if(k=='3'){c=color(0,0,255);}
  else {c=color(0);}
  if(mousePressed){
  stroke(c);
  noFill();
  p1 = new PVector(mouseX,mouseY);
  p2 = new PVector(pmouseX,pmouseY);
  R = map(PVector.dist(p1,p2),0,20,0,50);
  drawCircle(mouseX,mouseY,R,k);
  }
 
}
void drawCircle(float X,float Y, float rr,char k){
 
  ellipse(X,Y,rr,rr);
  
  if(rr>2){
    colorMode(HSB,360,100,100);
    color c;
    if(k=='1'){c=color(0,60,random(30,100));}
    else if(k=='2'){c=color(160,60,random(30,100));}
    else if(k=='3'){c=color(290,50,random(30,100));}
    else {colorMode(RGB);c=color(random(255));}
    fill(c);
    drawCircle(X-rr/4,Y,rr/2,k);
    }
  }  

void keyPressed(){
  if(key =='s'){
    saveImage = true;
  }
  if(key=='r'){
  background(200);
  }
}
