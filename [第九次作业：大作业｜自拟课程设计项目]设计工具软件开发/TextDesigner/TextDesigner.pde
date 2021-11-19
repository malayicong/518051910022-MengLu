    //three body占位
    int attractorNum = 3;
    int moverNum = 1000;
    Mover[] movers = new Mover[moverNum];
    Attractor[] attractors = new Attractor[attractorNum];
    //mondrian占位 
     int numOfRect = 10;
    int numOfLineH = int(random(1, 5));
    int numOfLineV = int(random(1, 8));
    float strokeColor = random(255);
    float[] lineH, lineV;
 
    
    
    Rectangle Recta[];
  String urtext ; 
  Text t;  //文字类
  int counter = 0;
  float d =20;
void setup(){
  size(800,800);
  background(0);
  urtext = getString("Enter your text(use spacebar to divide words,'.'to sentences )");
  t=new Text(urtext);
/* 
Input库的使用方法
  name = getString("Enter your name:");
  age = getInt("Enter your age");
  money = getFloat("How much money do you have?");
  gender = getChar("Enter gender (m = male, f= female)");
*/  
  for (int i=0; i<moverNum; i++) {
      movers[i] = new Mover(random(0.1, 5), random(width), random(height));
    }
     for (int i= 0; i<attractorNum; i++) {
      attractors[i] = new Attractor(6, random(width), random(height));
    }
   
  
   lineV = new float[numOfLineV];
    lineH = new float[numOfLineH];
   
    for (int i = 0; i< numOfLineV; i++) {
      lineV[i] =random(800);
    }
    for (int i = 0; i< numOfLineH; i++) {
      lineH[i]=int(random(800));
    }
    //方块
    Recta = new Rectangle[numOfRect];
    for (int i = 0; i<numOfRect; i++) {
      float a = random(800);
      float b = random(800);
      float c = random(100);
      float d = random(100);
      Recta[i] = new Rectangle(a, b, c, d, strokeColor);
    }
    
  t.sentenceSpliter();
  for(int i =0;i<t.sentence.size();i++){
  t.wordSpliter(t.sentence.get(i));
  }
}

void draw(){
  /*Input库的使用方法
  fill(0);
  textSize(24);
   text("Hello " + name + ".  You are " + age,10,30);
   text(" years old and you have $" + money + "!  Your",10,60);
   text(" gender is " + gender + ".",10,90);
  */
  //text(urtext,10,20);
  //t.test();//计算输入词数
  
  t.display();
  
}
void keyPressed(){
  if(key=='n'){
    setup();
    draw();
     }
}
