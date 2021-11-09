Rectangle Recta[];
int numOfRect = 10;
int numOfLineH = int(random(1,5));
int numOfLineV = int(random(1,8));
float strokeColor = random(255);
float[] lineH,lineV;


void setup(){
  size(800,800);
  background(255);
  initiate();
 
} 

void initiate(){
 /*
  //横线
   for (int i =0; i<random(numOfLineH); i++){
     float Y = random(800);
     stroke(strokeColor);
     strokeWeight(8);
     line(0,Y,800,Y);
   }
   //竖线
   for (int i =0; i<random(numOfLineV); i++){
     float X = random(800);
     stroke(strokeColor);
     strokeWeight(8);
     line(X,0,X,800);
   }
  */
  lineV = new float[numOfLineV];
  lineH = new float[numOfLineH];
   for(int i = 0; i< numOfLineV;i++){
    lineV[i] =random(800);
  }
  for(int i = 0; i< numOfLineH;i++){
    lineH[i]=int(random(800));
  }
   //方块
    Recta = new Rectangle[numOfRect];
  for (int i = 0; i<numOfRect; i++){
     float a = random(800);
     float b = random(800);
     float c = random(100);
     float d = random(100);
     Recta[i] = new Rectangle(a,b,c,d,strokeColor);
   }
}

void keyPressed(){
  if ( key == 'n'){
    background(255);
    strokeColor = random(255);  
   initiate();
  }
 
}
void draw(){
  fill(255);
  rect(0,0,width,height);
   //横线
   for (int i =0; i<numOfLineH; i++){
     stroke(strokeColor);
     strokeWeight(8);
     line(0,lineH[i],800,lineH[i]);
   }
   //竖线
   for (int i =0; i<numOfLineV; i++){
     stroke(strokeColor);
     strokeWeight(8);
     line(lineV[i],0,lineV[i],800);
   }
  //方块
  for(int i =0;i < numOfRect;i++){
    Recta[i].display();
    //检查方块是否重叠，若重叠，则微调一下位置
    Recta[i].OverLap();
    //鼠标按下，方块开始移动
    if (mousePressed == true){
       Recta[i].move();
    }
  } 
 
 
 }
