//背景类，包含背景设计，brush的作用施加
class Background {
    

  Background() {
  }

  void display(int b) {
    if (b==1) {
      mondrian();
    }
    if (b==2) {
      threeBody();
    }
    if (b==3) {
      geometric();
    }
  }

  void mondrian() {
    //Rectangle Recta[];
   
    for (int i =0; i<numOfLineH; i++) {
      stroke(strokeColor);
      strokeWeight(8);
      line(0, lineH[i], 800, lineH[i]);
    }
    //竖线
    for (int i =0; i<numOfLineV; i++) {
      stroke(strokeColor);
      strokeWeight(8);
      line(lineV[i], 0, lineV[i], 800);
    }
    //方块
    for (int i =0; i < numOfRect; i++) {
      Recta[i].display();
    
    //Recta[i].OverLap();
    //鼠标按下，方块开始移动
  //  if (mousePressed == true) {
    //  Recta[i].move();
    //}
    }
  }

  void threeBody() {
 /*
    int attractorNum = 3;
    int moverNum = 1000;
    Mover[] movers = new Mover[moverNum];
    Attractor[] attractors = new Attractor[attractorNum];
    */
    background(8,46,84);
   
     for(int i= 0; i<attractorNum; i++){
    attractors[i].display();
    attractors[i].repel();
    attractors[i].attraction();
    attractors[i].update();
  }
   for(int i=0; i<moverNum; i++){
    movers[i].display();
    movers[i].repel();
    movers[i].attraction();
    movers[i].update();
    //movers[i].applyForce();
  }
  
  
  }

  void geometric() {
    noStroke();
    fill(8,46,84);
    rect(0,0,width,height);
    fill(237,145,map(mouseX,0,width,10,40));
    ellipse(mouseX,height*2/5,width/2,width/2);
    fill(255,250,240);
    ellipse(mouseX/2,mouseY/5,height/5,height/5);
    fill(192,192,192);
    ellipse(mouseX/3,mouseY*5/4,width/2,width/2);
     fill(135,206,235);
    ellipse(mouseX,mouseY*0.6,width/2,width/2);
  }
}
