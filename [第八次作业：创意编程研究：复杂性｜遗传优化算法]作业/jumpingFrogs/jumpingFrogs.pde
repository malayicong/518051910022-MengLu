int totalJump;
int jumpCounter;
Population population;
Population1 population1;
PVector target;
//Lotus[] leaves;

void setup(){
  size(600,300);
  totalJump = 400;
  jumpCounter = 0;
  
  target = new PVector(width/2,200);//这里改成一个荷叶对象
  float mutationRate = 0.01;
  population =new Population(mutationRate,30); 
  population1 = new Population1(mutationRate,30);
  //leaves = new Lotus[totalJump+1];
  //for(int i = 0;i<=totalJump;i++){
  //leaves[i] = new Lotus(); 
 // }
}

void draw(){
  background(255);
  //for(int i =0; i<leaves.length;i++){
   // leaves[i].display();
  //}
  fill(0);
  ellipse(target.x,target.y,30,30);
  if(jumpCounter<totalJump){
    population.live();
    population1.live();
    jumpCounter++;
  }else{
    //族群1
     jumpCounter = 0;
     population.fitness();
     population.selection();
    population.reproduction();
    //族群2
     population1.fitness();
     population1.selection();
    population1.reproduction();
  }
  fill(0);
  text("Generation_group1 #: " + population.getGenerations(), 10, 18);
  text("Generation_group2 #: " + population1.getGenerations(), 10, 36);
  text("Cycles left: " + (totalJump-jumpCounter), 10, 54);   
  }
  
void mousePressed(){
  target.x = mouseX;
  target.y = mouseY;
}
