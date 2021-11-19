//text类用于分离字段并为每个字段安排展示方式
//divide（输入的string，分为一个ArrayList<String>）；effect（字体变化效果）；display（展示）
class Text{

  DNA dna;  
  String content;
  ArrayList<String> phrase;
  ArrayList<String> sentence;
  int wordCounter = 1;
  int senCounter = 0;
  int wc=0,sc=1;
  float speed = 1; 
  Background bg;
  float angle = random(0,PI/2);
  PFont font;
  
  Text(String s){
    content = s;
    dna = new DNA();
    bg = new Background(); 
    //font1 =createFont ("Arial",12);
 

//计算词数和句数
    for(int i =0; i<content.length();i++){
      char c = content.charAt(i);
      if(c==' '||c=='\r'){wc++;}
      if(c=='.') {sc++;};
    }
    if(wc!=0) wordCounter +=wc;
    if(sc!=1) senCounter+=sc;
    
  }
//把文本分成句子  
  void sentenceSpliter(){
    int sMark=0;

    sentence = new ArrayList<String>(); 
     for(int i =0; i<content.length();i++){
        char c = content.charAt(i);
      if(c=='.' || c == ',') {sc++;sentence.add(content.substring(sMark,i));sMark=i+1;};//根据句子分离文本
     }
     sentence.add(content.substring(sMark,content.length()));//last sentence
  }
 //把句子分成单词
 void wordSpliter(String s){
   String sentence =s;
   int wMark=0;   
   phrase = new ArrayList<String>();
    for(int i =0; i<sentence.length();i++){
       char c = sentence.charAt(i);
       if(c==' '||c=='\r'){wc++; phrase.add(content.substring(wMark,i));wMark=i+1;} //将文本按词分离
    }
     phrase.add(content.substring(wMark,content.length()));//最后一个词
 }
/*  
  void test(){
    
    text(wordCounter,10,30);
    text(senCounter,10,50);
    for(int i=0;i<phrase.size();i++){
      text(phrase.get(i),60,60+i*10);
    }
    for(int i = 0;i<sentence.size();i++){
    text(sentence.get(i),100,60+i*10);
    }
  }
  */
 void display(){
  
   if(dna.genes[4]<=3) bg.display(1);
   if(dna.genes[4]>3&&dna.genes[4]<7) bg.display(2);
   if(dna.genes[4]>=7) bg.display(3);
 /* 动态文字（未完成）
    if(dna.genes[3]<=3) moveH();
   if(dna.genes[3]>3&&dna.genes[3]<7) fly();
   if(dna.genes[3]>=7) drop();
  */ 
   fill(245,245,245);
    font = createFont("Arial",40);
   if(dna.genes[0]<=3) cornerText();
   if(dna.genes[0]>3&&dna.genes[0]<7) middleText();
   if(dna.genes[0]>=7) tiltText();
 } 

void cornerText(){
 float s; 
  for(int i=0;i<phrase.size();i++){
     s=400/wordCounter-i*15;
    if(s<=24) s=24;
    if(s>250) s=250;
    textSize(s);
    text(phrase.get(i),10,height-i*80);
  }
}

void middleText(){
    
 float s; 
  for(int i=0;i<phrase.size();i++){
     s=400/wordCounter-i*15;
    if(s<=24) s=24;
     if(s>250) s=250;
    textAlign(CENTER);
    //textFont(font1);
     textSize(s);
    text(phrase.get(i),width/2,100+i*80);
  }
}

 void tiltText(){
   float s; 

   for(int i=0;i<phrase.size();i++){
    s=400/wordCounter-i*15;
    if(s<=24) s=24;
     if(s>250) s=250;
     pushMatrix();
    rotate(angle);
     translate(0,i*60);
      textSize(s);
    text(phrase.get(i),width/2,80);
    popMatrix();
   }
   //noLoop();
 }
 
 void moveH(){
   /*
   for(int i=0;i<phrase.size();i++){
     float h = 50+i*50;
     String s =phrase.get(i);
     int l = s.length();
     for(int j=0;j<l;j++){
       char c = s.charAt(j);
       textSize(48);
       text('c',20+speed,h);
     }
   }
 */
 int s;
 
  for(int i=0;i<phrase.size();i++){
    s=600/wordCounter-i*12;
    if(s<=24) s=24;
    textSize(s);
    //textFont(font1);
    text(phrase.get(i),10,height-s*3);
  }
 }
 
 void fly(){
 int s;
 
  for(int i=0;i<phrase.size();i++){
    s=00/wordCounter-i*12;
    if(s<=24) s=24;
    textSize(s);
    //textFont(font1);
    text(phrase.get(i),10,height-s*3);
  }
 }
 
 void drop(){
 int s;
 
  for(int i=0;i<phrase.size();i++){
    s=600/wordCounter-i*12;
    if(s<=24) s=24;
    textSize(s);
    //textFont(font1);
    text(phrase.get(i),10,height-s*3);
  }
 }
}
