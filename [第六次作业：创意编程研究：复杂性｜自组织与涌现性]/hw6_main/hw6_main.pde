int attractorNum = 3;
int moverNum = 1000;
Mover[] movers = new Mover[moverNum];
Attractor[] attractors = new Attractor[attractorNum];

void setup(){
  size(1200,1200);
  for(int i=0; i<moverNum; i++){
    movers[i] = new Mover(random(0.1,5),random(width),random(height));
  }
  
  for(int i= 0; i<attractorNum; i++){
    attractors[i] = new Attractor(6,random(width),random(height));
  }

}

void draw(){
  background(0);
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
  
  keyPressed();
  
}

void keyPressed(){
  if(key=='r'){
  setup();
  key = 0;
  }

}
